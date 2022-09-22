Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622D5E5C51
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0B10EA56;
	Thu, 22 Sep 2022 07:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3010E289;
 Thu, 22 Sep 2022 04:19:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id 13so18332132ejn.3;
 Wed, 21 Sep 2022 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=NuMTBKypSR/meqPu+q5XkXK89jf6rKRsFh/7M7uVFYo=;
 b=Y33y7Mp9Lrs/i7Wmjuy+iLoayUKFL6+DeJUYG67oe6I6rhixd1FN6LLHA0QSAN4/jD
 phPi9OP1QJ1iNDTErLZfRgQqMTlrc03okbHeD47FkF4ZhWvhIvGayAB6rcpJKRnv1/0r
 Mh7Q8WhPM80dVvDwp3gid4tYvljyi4ZWegr4sG5aupXuZKKPU2bOYQY4oCdK0kGPgMcB
 9W+Hdoj/GGi9TxCt+XAYkCa/WC5uzjmlJBUsEcMx0TDNMAo2l7YIh951MlW26rRRHDpV
 MXnQcZCcGVhx1EUMmWAUwfpcuDT9hDzpZG14LMnCEQpL3gN2TFXTA79SXqIgsSce1aKY
 nzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NuMTBKypSR/meqPu+q5XkXK89jf6rKRsFh/7M7uVFYo=;
 b=xRT7J8Oi5qWXL++rvhNAY2tlNoKkGudKOaScxogbRuWrTxzpITA3RMJWIeWccmoY8I
 UkH64ubAjWBmbejTWA48kzYErMTXX/VYgfAha/EDrNNT8CxEZV/Wn4q7n0GePkBC2JYo
 tykoLssgBbfrBKwpZndDpehWEutjfAdCgmltBAmJK9pfsSJdQ10smOkUAheOqxRe6jjM
 aDq7owzwkuciWd+8oivyfsKdeTHW6mnwiGkkmkeP3jvl+SU/iUKAZzLjZlppNzI1V9Cj
 TlGeplpeDfjYGUIhn6h5CtuVgH3oA/qNOEaBd5IdVyb+McEYbOF3DwRA9tptRnbfmmqG
 fXBg==
X-Gm-Message-State: ACrzQf1aGtDJ4cXAxLVk+wHdq00fuf2vtwhRduyFpTaeQ0VjWjaiTOvW
 d6Qc0zwLYpWxU66WuMR2l1fYu+7GUet6tLVUxVrDvb/2iYM=
X-Google-Smtp-Source: AMsMyM6eFgLRxbnYc84wFsvk2/0vOWFFO7ZDAhzbpwkqBgCxZsMqlrCpfJe/e9oFjqNiVYA/xn+kQ2sd0kRyClNyPEQ=
X-Received: by 2002:a17:907:2d0f:b0:780:2170:e079 with SMTP id
 gs15-20020a1709072d0f00b007802170e079mr1213929ejc.185.1663820346550; Wed, 21
 Sep 2022 21:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220922012719.1676315-1-floridsleeves@gmail.com>
 <DM5PR12MB2469A1B22EF0441216E1B40BF14E9@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2469A1B22EF0441216E1B40BF14E9@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Li Zhong <floridsleeves@gmail.com>
Date: Wed, 21 Sep 2022 21:18:55 -0700
Message-ID: <CAMEuxRqdeTsRhuMTcGRnDq1513Lb_UJQttdbxfBQxh7va1CkjA@mail.gmail.com>
Subject: Re: [PATCH v1] drivers:amdgpu: check the return value of
 amdgpu_bo_kmap
To: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 22 Sep 2022 07:24:23 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Powell, Darren" <Darren.Powell@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 7:11 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> Perhaps you need to update the prefix of patch subject to 'drm/amd/pm: ch=
eck return value ...'.
>
> With above addressed, it's: Acked-by: Guchun Chen <guchun.chen@amd.com>
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Li Zhong <floridsleeves@gmail.com>
> Sent: Thursday, September 22, 2022 9:27 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: jiapeng.chong@linux.alibaba.com; Powell, Darren <Darren.Powell@amd.co=
m>; Chen, Guchun <Guchun.Chen@amd.com>; Limonciello, Mario <Mario.Limonciel=
lo@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.co=
m>; daniel@ffwll.ch; airlied@linux.ie; Pan, Xinhui <Xinhui.Pan@amd.com>; Ko=
enig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.D=
eucher@amd.com>; Li Zhong <floridsleeves@gmail.com>
> Subject: [PATCH v1] drivers:amdgpu: check the return value of amdgpu_bo_k=
map
>
> amdgpu_bo_kmap() returns error when fails to map buffer object. Add the e=
rror check and propagate the error.
>
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/g=
pu/drm/amd/pm/powerplay/amd_powerplay.c
> index 1eb4e613b27a..ec055858eb95 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, =
void **addr, size_t *size)  {
>         struct pp_hwmgr *hwmgr =3D handle;
>         struct amdgpu_device *adev =3D hwmgr->adev;
> +       int err;
>
>         if (!addr || !size)
>                 return -EINVAL;
> @@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, =
void **addr, size_t *size)
>         *addr =3D NULL;
>         *size =3D 0;
>         if (adev->pm.smu_prv_buffer) {
> -               amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +               err =3D amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +               if (err)
> +                       return err;
>                 *size =3D adev->pm.smu_prv_buffer_size;
>         }
>
> --
> 2.25.1
>

Thanks for your reply! It's updated in the v2 patch.
