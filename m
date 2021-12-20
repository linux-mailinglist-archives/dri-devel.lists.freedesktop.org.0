Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97347B1E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 18:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAF112320;
	Mon, 20 Dec 2021 17:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8862112320
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 17:10:29 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id y68so30917087ybe.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z5TtUkHNUfSsL6Hv1/iMYQYUcs6/zThRgbIsxMTzAeY=;
 b=AYMbNNQp1HO4KUCmi6JvoIwDozOquSxaq7AweS43tfflT10+6Qtp0FN6lU1J2WE+nv
 7c+MYY5cgKEZS64RUbPXewu6hb4UOPwKneYoSL8lIUSw1n16FhmfyJ74qkKsg0kan9S0
 Itgqik0YsJ5VwNOvKkTQL04bsTr4wgV0DXhgw3nhN+v2rLOJtJiWgK5HA7KtsMHYosvO
 4uDWbzgA8qUIV1nA/NYeeZpxhxQmOS5vcR/bpv5Sp5y+dOZ3vZuDTBZYb1CpWioedOB6
 pJQXBWsqpcnWIS8XTyreIzRo926OiwoXXHgSGC6GPNffH/w+iR7m04GYaXDfzp29xoNh
 FlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5TtUkHNUfSsL6Hv1/iMYQYUcs6/zThRgbIsxMTzAeY=;
 b=CO62s22F20yZBmqtHPSSN5rf8mRz+AaW0VmOuV6BeQCS/1020/nUpjViMMfOp7DSSS
 J3BEGfyyGkvwGaHVdfLXmO4EQJR10iJ9dNXVtNJfdweKEb+kM+AgAEdwkp5294ohSkP5
 7qFqu5jrXUMRxTlOaIxKd82tbKJF4yfF1BuHpypVy+FR7orWlxMJzCq5OJh2U6LDvdIr
 qveACknCRo0WAtO0B3C+w72rz+JSGicBsLEJnk39xFkOBKIleQc8ZNwTikM/FO3SR18q
 mtlzJs8FHEUHYi+qFumsiBxFLLS0ZYDNQ5syNdhDWErFCEpwc2zcXxpUD8wyVd7ph4j9
 NxTQ==
X-Gm-Message-State: AOAM533NEfCqkBqN4O4YiaTcNih8216Ua5+Ah4eko8/N73R8TAUhLNiJ
 CfkD2+CdXulApBzGDJsqGYuWGYBVCqVs9yecQlP/wp0A
X-Google-Smtp-Source: ABdhPJxpgvquokTu7tmTAwjs/SYr5+0sj4VrALBT7mEpv38OzVrWiv3Yml8/4bHiDqaVqaAyDlTkpsy986gItJJw0d0=
X-Received: by 2002:a25:3fc3:: with SMTP id
 m186mr24287539yba.562.1640020228766; 
 Mon, 20 Dec 2021 09:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-25-javierm@redhat.com>
In-Reply-To: <20211217003752.3946210-25-javierm@redhat.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Mon, 20 Dec 2021 09:10:18 -0800
Message-ID: <CAHFnvW3owW38B31SdYWcjCf2jLqUmGnCZ4m_iS1rPW2M9HUrMg@mail.gmail.com>
Subject: Re: [PATCH v2 24/37] drm/hyperv: Add support for the nomodeset kernel
 parameter
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 4:38 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
>
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the system framebuffer will be available if it was set-up.
>
> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Acked-by: Deepak Rawat <drawat.floss@gmail.com>

>
> (no changes since v1)
>
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 00e53de4812b..4a8941fa0815 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -305,6 +305,9 @@ static int __init hyperv_init(void)
>  {
>         int ret;
>
> +       if (drm_firmware_drivers_only())
> +               return -ENODEV;
> +
>         ret = pci_register_driver(&hyperv_pci_driver);
>         if (ret != 0)
>                 return ret;
> --
> 2.33.1
>
