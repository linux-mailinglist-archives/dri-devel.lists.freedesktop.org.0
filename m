Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8948DDA9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 19:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622310E536;
	Thu, 13 Jan 2022 18:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31BA10E536;
 Thu, 13 Jan 2022 18:28:48 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 c1-20020a4a9c41000000b002dd0450ba2aso1860764ook.8; 
 Thu, 13 Jan 2022 10:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TwN0a2e4fIau6wBUpvIJm3eDy35/hH3kfFq237STDTg=;
 b=Eo4f+XqQO6PfJPSSqW2tSlTO+bRvdY2DWl5E4hlUWBNYozRCiG46dnKf2MRfymBvJu
 Ir1G0f5s7s7dTXTPQtgXa3O5FN6Fg7On50G+Z95IWyTtg/+gst9e6dmnyW8lhn1l/DzH
 AZW0cyu7C2BhkSCJnXh8HigIZKwMZvsA5rJfd9vgoQsbg3cU01usNRYYDFRyGeub7dAA
 Iwcv5eg313Ri064koctKwGHbKotc7aqlBMp3NQaLE6IVkEewwM3ucSQfrgJt7SisylnB
 nao6PvI75BXgKhTOvyQzUwXdFQgWSuIz/2aaSYgt4Rr1R8tllWCodVYyLEaZJQRo87h3
 /Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TwN0a2e4fIau6wBUpvIJm3eDy35/hH3kfFq237STDTg=;
 b=LcG3TXssnDcWBQaSZKy+lnoctIX3WvFLEZMkO/03WD8ds08MFz03RO2XShE05GcvSH
 3kNXGyEVt4g7MEgY/1mmYpIUc+znZvslUJWD5npjT8IFia691co+Wn8HFs3SacWRQmMj
 vJxIypISMGxNCjG0KfUEg33Gc6IClcentPuafjdQO2gc5B9WnDPNSXG3GmHGA/LUgKdf
 41rmYZIdJUXLglJHmnQKx7x3k6vrxIrHfcB6yNQ0Muf7hCZCW04lCwi5aokGKuGxS+4R
 OW2V2tvB2U4Eh0UAINTTSddInP/T8SxM5/ZZAN+mn4DqDr3hG2RiH8bz9gCiegwjmVU5
 V+ZA==
X-Gm-Message-State: AOAM531j9rJw2WkxE6UfUwJQRiYmnESt/YeLLLXdaIaHXjlIZDwypr1+
 DNZHjtMwigo8tD4uN5IO5BnlPPD63bvCiYK/pSs=
X-Google-Smtp-Source: ABdhPJzWbHC/EWrSaiSqufm7TdYhQCSUNjjs/NfiCg4SoYTWgvaJ/P4DJQy1crUNBRQRIEFqdx5lQk5BQxYKmV2vMsE=
X-Received: by 2002:a4a:3412:: with SMTP id b18mr3729013ooa.23.1642098527456; 
 Thu, 13 Jan 2022 10:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20220113071132.70647-1-yang.lee@linux.alibaba.com>
 <DM5PR12MB246922D4EC5729F76E481CD2F1539@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB246922D4EC5729F76E481CD2F1539@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jan 2022 13:28:36 -0500
Message-ID: <CADnq5_NKKOjJCoi3qCBUGpy+HWgcUnVniSmRnMBfQ6V504Hemg@mail.gmail.com>
Subject: Re: [PATCH -next 1/2 v2] drm/amdgpu: remove unneeded semicolon
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yang Li <yang.lee@linux.alibaba.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 13, 2022 at 8:38 AM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> Series is:
> Reviewed-by: Guchun Chen <guchun.chen@amd.com>
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Yang Li <yang.lee@linux.alibaba.com>
> Sent: Thursday, January 13, 2022 3:12 PM
> To: airlied@linux.ie; Chen, Guchun <Guchun.Chen@amd.com>
> Cc: daniel@ffwll.ch; Deucher, Alexander <Alexander.Deucher@amd.com>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;=
 amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kern=
el@vger.kernel.org; Yang Li <yang.lee@linux.alibaba.com>; Abaci Robot <abac=
i@linux.alibaba.com>
> Subject: [PATCH -next 1/2 v2] drm/amdgpu: remove unneeded semicolon
>
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2725:16-17: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index d4d9b9ea8bbd..ff9bd5a844fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -2722,7 +2722,7 @@ struct amdgpu_ras* amdgpu_ras_get_context(struct am=
dgpu_device *adev)  int amdgpu_ras_set_context(struct amdgpu_device *adev, =
struct amdgpu_ras* ras_con)  {
>         if (!adev)
> -       return -EINVAL;;
> +               return -EINVAL;
>
>         adev->psp.ras_context.ras =3D ras_con;
>         return 0;
> --
> 2.20.1.7.g153144c
>
