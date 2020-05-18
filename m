Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702301D759A
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96AD6E127;
	Mon, 18 May 2020 10:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506486E127
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 10:51:52 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id w188so2289106vkf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpjSkkn7ApK5Yq+n7OuT8kXvOD7uu7gT865+wNXuHVM=;
 b=TIdzmN5Zyod2KpKoraBArfu7HJ/dEL5tffIucTv8YuRzLkeoU8FiBg7P7XovUQxL/D
 PNj0R8Ys14RDTqKJWOpbotZAsy2DF9HvMohwoUIcrtsRtdZ1KhYQRu5S1a3jtL2keuQ9
 n01+J9BhdUvlIGWd3QV7N8Ct+r8CCv5twPyzFL9jzrRF8UIlaU90fZAB11X4PCvWuvCs
 HuJ3DiC7taPGk51xKRGbeKVrv1LRbWsxwT5zP8w20Oqj/OPmx8/wp4OrKUkO3aBtzmtG
 dByNMjEIU75bxzxx5lR95RTEk8A9XIQ80QnpUDh4BaEbvqGlAoOTnd8U+zSTQZ6gIxx4
 fkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpjSkkn7ApK5Yq+n7OuT8kXvOD7uu7gT865+wNXuHVM=;
 b=ad/jgqOKVKgAMd9ANBv3fCWPja9xhf0ULExpw6j4rwqB7Mj/a+rjbGg0KQ9zMemLby
 I4tQdQ7/4dAKMjnDSIw5lnvRJWH7D8SK7dTOYNsWEI+IZ9n68hoIYYSZmPgjZtZAhCDH
 PDqBSG3JSQWycACMiAAQa0MnK+Dxhv+Wcu0KWLvEp0po9LjZhDWmcIAyfFK7lrBm4vxE
 jiyulOhlvYWijgaENvQnf7kpZ28EYmeH27UHuXtldI+H5PydA0tgdeWu1gJW9rj64WKm
 tMmECPWiEn01xe/3b8bU25BtPJvl4i6P6FTzdRn64Jw3FSQ89Tf+TNdnvaQqBr6u6AJb
 RXYg==
X-Gm-Message-State: AOAM532kyVe4RzjIBnUGHq0px6NFB9UWYVpo9NqQn/RqtwAG63oHodRa
 K5d5hNAdOjXJA85scqq26FvCwMfLzmdcFmBZcw36jQ==
X-Google-Smtp-Source: ABdhPJyJoE3DeUp5mRCR4/NwPKcB+0c9bpy1Jfu2Pe+bafT+c8kQlQDsW0FnkxaYd3hr8PrATmPVX23jWINoG1EwtPc=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr790067vkr.28.1589799110526; 
 Mon, 18 May 2020 03:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-11-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-11-paul@crapouillou.net>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 11:48:59 +0100
Message-ID: <CACvgo50q=qJXk3nFSCm+S6JHBMxpY0C_HwH8KGB2EAcKwgL0oQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] gpu/drm: Ingenic: Add support for the IPU
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: devicetree <devicetree@vger.kernel.org>, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Disclaimer: I don't know much about the hardware :-P

On Sun, 17 May 2020 at 00:31, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add support for the Image Processing Unit (IPU) found in all Ingenic
> SoCs.
>
Since the IPU is present on all devices supported, does it make sense
to have it as separate module?
Didn't check closely although I suspect doing that will remove the
need for the component patch.

> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -50,7 +50,7 @@ struct jz_soc_info {
>
>  struct ingenic_drm {
>         struct drm_device drm;
> -       struct drm_plane f0, f1;
> +       struct drm_plane f0, f1, *ipu_plane;
>         struct drm_crtc crtc;
>         struct drm_encoder encoder;
>
> @@ -186,13 +186,16 @@ static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
>         regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>                            JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16,
>                            JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
> +
> +       regmap_write(priv->map, JZ_REG_LCD_IPUR, JZ_LCD_IPUR_IPUREN |
> +                    (ht * vpe / 3) << JZ_LCD_IPUR_IPUR_LSB);

This hunk also indicates that it may be better to merge the IPU within
the existing driver.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
