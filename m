Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85C8B5EB0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5310E6C7;
	Mon, 29 Apr 2024 16:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JmAKLki9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFA210E26B;
 Mon, 29 Apr 2024 16:14:23 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2a55a3d0b8eso3261243a91.1; 
 Mon, 29 Apr 2024 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714407263; x=1715012063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf+IdRgb927i0JxCWv/ngKuUP45B0rhv7CgotNlHqq4=;
 b=JmAKLki9cbbcu72UwoNP+mEa/RnugagVDjHs72W0qeIVsnXUa9PHVyGjN3e5zeYp7O
 8xIZwRAre4IoB5z68Dq1xWtSehbnML1CLm8mf5wz+p+uS+k5DE9FG2X0Y/V/jchoK9IN
 ysJPkYVuTVqaWyVrWZT8ZgNQuTw+y7XC0ZrV3iVDbXa6fgvAxysIMqcSOBgDnxSI83Rz
 YkICuoTnVqyQbm5gJeW6ZY7tyDR/7LXMUrB9U1COoDZDm2pexbljxIFymQ8nSwsyx5P0
 2lFa1kEHB7uj1LvO4XJmx+7VZBAL7ub4zEqV/PQOWwOT+tz1mgJ3NxrkXCo2t8CiyHMy
 n5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714407263; x=1715012063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uf+IdRgb927i0JxCWv/ngKuUP45B0rhv7CgotNlHqq4=;
 b=f5A01x6YyK6FxOs5J6bX6QmPpiFYtdsEYZmEN1DQwYlppJ6h4m9nuvkytPxwcQf078
 bPASKWH6j4O9FHdSEStxa0xVP76t4rjZ4m4dlJZhTUsGCaQSvxSF9U4gbTDs7MqgrYzQ
 WP38fkXYYJcDITyfFmrlsjL67kskrgYRda8/UK4XXTP0bZeYwN8lcNZkT4C7/xKEuB/1
 uDeLCfFFIernoGQT10PGE64tAz2SXcmUxfYsxc8xlyqAxcQdVLCu48c9YFw8uXgqIEGS
 SQEJH781f35DLxJqftJn5yqLIk1fEHDL5/iGpbXVE6IQoZNFL+pq1KZKln5s21W6mARv
 IVvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMs1TPb04l+jwo/yLL9kIqr02YLF/p9YfdhOtzmEYrWUTcrkQVp4w58Ox3+6M7kn4qiXuyHaVbRUtJ4ZnfIDEEkfkw9QDITSb2g042gIPjF9pNEhxjEJ5U74yyYkN+XKey8LKor0MynrWQWqLxHw==
X-Gm-Message-State: AOJu0Yx+HJ++/6MAshEkEELdiUkyHLi4C5po69RJbjku3HMjoXyrwy7T
 lYu3ijxulJgwEBAmJeiB2VkCVR4Kf8dER0Pz/IQm1j2dmvgUh4F2A5L/4wgp2myq5r+UyV33ssv
 2QBuYat5S9GCkOmw8hTIkCAKzWxY=
X-Google-Smtp-Source: AGHT+IG2B2nx6bmugj+Ci4mKUZM0wGBXzxrm1KAJlrCGW9qVvtEKi0H28eOfwvOwV2BggQL03pq5kA8s/A6ylUd2IIM=
X-Received: by 2002:a17:90a:d685:b0:2af:de3:f0e3 with SMTP id
 x5-20020a17090ad68500b002af0de3f0e3mr126396pju.23.1714407263053; Mon, 29 Apr
 2024 09:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <afb229a9-3f18-44cb-b305-5fbb2e1b4ee3@moroto.mountain>
 <CO6PR12MB53946126A02595B4FDF76525941B2@CO6PR12MB5394.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB53946126A02595B4FDF76525941B2@CO6PR12MB5394.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2024 12:14:11 -0400
Message-ID: <CADnq5_NQPgW-xmebV5OS-8v_-vY07hP4NYJemYLOC4iCydkxLw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix signedness bug in
 sdma_v4_0_process_trap_irq()
To: "Zhou, Bob" <Bob.Zhou@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, 
 Guchun Chen <guchun.chen@amd.com>, "Ma, Le" <Le.Ma@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Sharma, Shashank" <Shashank.Sharma@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Apr 28, 2024 at 9:32=E2=80=AFPM Zhou, Bob <Bob.Zhou@amd.com> wrote:
>
> [Public]
>
> Reviewed-by: Bob Zhou <bob.zhou@amd.com>
>
> Regards,
> Bob
>
> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 2024=E5=B9=B44=E6=9C=8828=E6=97=A5 20:57
> To: Zhou, Bob <Bob.Zhou@amd.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <ai=
rlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Kuehling, Felix <Felix.K=
uehling@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Guchun Chen <guch=
un.chen@amd.com>; Ma, Le <Le.Ma@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>;=
 Sharma, Shashank <Shashank.Sharma@amd.com>; amd-gfx@lists.freedesktop.org;=
 dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-jani=
tors@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap=
_irq()
>
> The "instance" variable needs to be signed for the error handling to work=
.
>
> Fixes: b34ddc71267a ("drm/amdgpu: add error handle to avoid out-of-bounds=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v4_0.c
> index 101038395c3b..772604feb6ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2017,7 +2017,7 @@ static int sdma_v4_0_process_trap_irq(struct amdgpu=
_device *adev,
>                                       struct amdgpu_irq_src *source,
>                                       struct amdgpu_iv_entry *entry)  {
> -       uint32_t instance;
> +       int instance;
>
>         DRM_DEBUG("IH: SDMA trap\n");
>         instance =3D sdma_v4_0_irq_id_to_seq(entry->client_id);
> --
> 2.43.0
>
