Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5D44C522
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 17:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AEB6EB67;
	Wed, 10 Nov 2021 16:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD1B6EB67;
 Wed, 10 Nov 2021 16:36:40 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso4767112otj.1; 
 Wed, 10 Nov 2021 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=34q8TP/FdpNNcC4qaqVLk8YGFJoEHKKC5e9KJhJR34M=;
 b=EYeT0zn+F7PuJHoM4eY4rPwqvLJrhnfcezHwOLSWUF7gmmJPNHECFdbLaQKpTW8UEh
 UjH/FM+jMjWNQVjOu+Vx2gWNaOCaybIdbhwEqHJfepbzMQUQjzBHPRgbNr6GViImou53
 LxCm1yAFloZb7f7jH1oQaTh1VQ/1ASYA/thgJNp0U6Ygxp76CQJEHM418KtbtiN+bGIv
 fLIzZ8FFOtrP6usxKGFMzepI4umrRJCqIAHToZZxKm9uSv94ixxsZaD4Rzih/q+loZ9T
 /fb1jlP7E30RghmjKxuOvcOoM4mpdNeXge460RzxjvXtqr77q1kOSXfJEjy+9JG3pkdM
 qX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=34q8TP/FdpNNcC4qaqVLk8YGFJoEHKKC5e9KJhJR34M=;
 b=Yvuc7KdKwbBxHHOOtq2ALxq9UezhmjdkZqgOh7L7K/HhV3GCWcb8+07F3r0GWhwxTF
 k+OLE9a8A55AdgplAv92DVbzYuUD3z3IGGLdUrsH5sezA7rNyCxckAK0p98Catw5ow4i
 s51IhioXH9lCsL+3Xs0dQutUswuRaUduG7c9eLCOMZNt3Iz1F7YOxxcWO0RYxyOcxCvi
 71SzYylPD5AkHVqUFijLPRaHFiOUlH7gAfR17cGRPY0tMK/Xds/OjRoSw0+JYKkcmKVg
 BqjYyApr/wAxAN8XzQgvnpyJAFAo6ezS8pckkSWitExDHjLm9C8avv/xI3vjBTd7UlJb
 aBhw==
X-Gm-Message-State: AOAM532BoYPcTZCQBiUE59PmIBTnE51DYdzjoVzHTz97+NJAXj6vESRa
 WUQcr2Yb9FfSZPaKyeNMSdPV+GV07AiXJdB8wtQ=
X-Google-Smtp-Source: ABdhPJwpD6xChUUgRNOjree36MS1YJc+NNz3RmjGufQp5s4j9TIsPda0h6FvC/5YL5SaGc6+w6OFhq0BGW9R16c49dM=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr432516otn.299.1636562199962;
 Wed, 10 Nov 2021 08:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20211110094242.67668-1-vulab@iscas.ac.cn>
In-Reply-To: <20211110094242.67668-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Nov 2021 11:36:28 -0500
Message-ID: <CADnq5_PL7Y8y0Laf7yt-hpwgLHjFtQOZtX=m4iooBvxLuU0Ptg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: correct indentation
To: vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Nov 10, 2021 at 11:08 AM Xu Wang <vulab@iscas.ac.cn> wrote:
>
> Correct indentation in radeon_driver_load_kms.
>
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..7afe28408085 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -168,7 +168,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>         if (!r) {
>                 acpi_status = radeon_acpi_init(rdev);
>                 if (acpi_status)
> -               dev_dbg(dev->dev, "Error during ACPI methods call\n");
> +                       dev_dbg(dev->dev, "Error during ACPI methods call\n");
>         }
>
>         if (radeon_is_px(dev)) {
> --
> 2.25.1
>
