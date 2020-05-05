Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414C41C5A00
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007C36E5C6;
	Tue,  5 May 2020 14:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3013F6E5C6;
 Tue,  5 May 2020 14:50:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e16so3094231wra.7;
 Tue, 05 May 2020 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dHepXFxm8qKHZID5kZyNoKgDmU94PQ15EAtVlnqLnZc=;
 b=ZOiS5WDZ29akAAdhXXjRyV9fc7RyNOba7PtkNLWbxfDNix6an+NowR7TG1FUmceDGN
 d2mGDFxqAzFXQ3A/Sh+/5I6gksRVJ2iBSy5DwBGqKvAyQFQzTxTr1f5TFT//tKvkacrg
 co5MDwjpKX8AWidgmGyKrY81h96fzAKv2s0iekzaImHBd8HyxyOOiXZ/k8EfGoFQhYv5
 OoAhguuEm9AD/WlRnWX/NX5WQmGd/6lLAFW+fL5sjWZQ1bP5QYPsMSIbkd2NGbkn+pZ2
 FSoKSYDaPZenxrArHC8CuJ/zJNw+Z5LH7KpAE1JdWk2LqiK+a977uYM3R2iS0fdG9Ky7
 ZFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHepXFxm8qKHZID5kZyNoKgDmU94PQ15EAtVlnqLnZc=;
 b=ASLEB3OkMelis9hAkERGCpQTt2d3nUF+TGGrEgPFLts93kbnIxVGv06B1vwpvnq+oK
 YWx1x6fA4S+68FnlkRGa3loaGKDB1mtujDcj0GtvLywdzHaxHdiojxxD/tYi93QCiAJq
 sP0IA5jKbLW4Hq++G3a4+opC5fjz7vGZINZX1hjVR9NVywgPpcqc+mn/esPRQDPT0pwZ
 FHCcohz945ymcXKV0StJBsfpCcjG7YA7dCy+vvCVH4vFM+CZSj62oSNzWnBJ3/5R28gi
 Il3DvV1RXfykEZ45erik31z4ay8Vds/eZ3mUT6MqKZk1ZBWV75Ud3citdTvV/CJ8FdvE
 CBag==
X-Gm-Message-State: AGi0PuYbhMIAnRhMLNboc4IAoU0NO/bJnNpe5uY1udUJ7D1+TqyUdYEf
 NN0apb8jq12KhzJ+8wP5vCPvtrayac7L4c6DQCE=
X-Google-Smtp-Source: APiQypKRd0rRv5AlYry2/DMCroz5gD5QAeb2dAeVT/fSJiTtWXfU71yf5+eaVpo/MT0MYQqxwtrxF5IIwiy/RQH+Gbs=
X-Received: by 2002:adf:9264:: with SMTP id 91mr4033682wrj.362.1588690219762; 
 Tue, 05 May 2020 07:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200505045737.185143-1-chentao107@huawei.com>
In-Reply-To: <20200505045737.185143-1-chentao107@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 May 2020 10:50:08 -0400
Message-ID: <CADnq5_Nmdt-tAsBa4AgQ70eP0b55xLTQKQmDCoSxUXihSjXk9g@mail.gmail.com>
Subject: Re: [PATCH -next] drm/radeon: fix unsigned comparison with 0
To: ChenTao <chentao107@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 5, 2020 at 2:59 AM ChenTao <chentao107@huawei.com> wrote:
>
> Fixes warning because pipe is unsigned long and can never be negtative
>
> vers/gpu/drm/radeon/radeon_kms.c:831:11: warning:
> comparison of unsigned expression < 0 is always false [-Wtype-limits]
>   if (pipe < 0 || pipe >= rdev->num_crtc) {
> drivers/gpu/drm/radeon/radeon_kms.c:857:11: warning:
> comparison of unsigned expression < 0 is always false [-Wtype-limits]
>   if (pipe < 0 || pipe >= rdev->num_crtc) {
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: ChenTao <chentao107@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 372962358a18..c5d1dc9618a4 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -828,7 +828,7 @@ int radeon_enable_vblank_kms(struct drm_crtc *crtc)
>         unsigned long irqflags;
>         int r;
>
> -       if (pipe < 0 || pipe >= rdev->num_crtc) {
> +       if (pipe >= rdev->num_crtc) {
>                 DRM_ERROR("Invalid crtc %d\n", pipe);
>                 return -EINVAL;
>         }
> @@ -854,7 +854,7 @@ void radeon_disable_vblank_kms(struct drm_crtc *crtc)
>         struct radeon_device *rdev = dev->dev_private;
>         unsigned long irqflags;
>
> -       if (pipe < 0 || pipe >= rdev->num_crtc) {
> +       if (pipe >= rdev->num_crtc) {
>                 DRM_ERROR("Invalid crtc %d\n", pipe);
>                 return;
>         }
> --
> 2.22.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
