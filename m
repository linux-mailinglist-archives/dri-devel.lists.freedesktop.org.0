Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05663CA01C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4C6E85B;
	Thu, 15 Jul 2021 13:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3D66E85B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:51:23 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id c68so489622qkf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=979LnIr6Y/Xjc/CKZ/LyzOjvvjeFb1T9fLVIwYtVhIg=;
 b=bAbhfg6MtVaZ5N9opzr+uYcZ6EF8vXM+KQLsSoIUAcZ32kN0wxvqm+yImR+TO6islm
 sXUHqmnK6VoehT/IE55TKLypNeRBktM0vcSL9j60I4Ao+dcomtELpZzeYST7Zn+p3khs
 ULPrBTrtUb7QvQlAfQtSDFwkzs7fdeki+bjiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=979LnIr6Y/Xjc/CKZ/LyzOjvvjeFb1T9fLVIwYtVhIg=;
 b=Q6X/Q4vLDxcp2rqoHbkZaPZAXH8/8azMzI5QOGtS/F01hGaW8Zlrk87I5X/jovLvbB
 wqmE4jhTILjtev4/sT+NRNcRHMtQ3DfHiWzWm6xCuNOfoI68qqQHA4NmE9GZV9tKw0/J
 9eFzZiiFQyvFHQRhlDEImi7U63dEg1t/kx/0ddI9tF4dBj/2ThY3038oacNULryuhH/a
 /oOPbVlNSP1SYw0x58B5DN7ITVngcheI2gH3wB+DwV0EynupBGUHDKbu7VeAyKQGjaIw
 92XM2jRr4QQ/KVkoqiKQW/NNLaleUuqzgI8TpIBTUC7661cB8yvARTMn4KZ4GJkLGrR/
 Zz6Q==
X-Gm-Message-State: AOAM533SYzdAPnAbEJNAFfjw/NlP9k+JcqXHc+juWKEWWxa03YqqAXgs
 tm7JOGIODD+Oe9f+xgEYFFboNCGz7MHjgQ==
X-Google-Smtp-Source: ABdhPJyYrS8OF++6Chc9eV6/s+dk6gFcqfW+zQ0AlG7+DrsPLHAdvn3goxipf6Z27nTC7BJl0f0DMA==
X-Received: by 2002:a05:620a:6cd:: with SMTP id
 13mr4180997qky.346.1626357082528; 
 Thu, 15 Jul 2021 06:51:22 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id j3sm2089549qth.63.2021.07.15.06.51.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:51:22 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id c16so2456780ybl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:51:21 -0700 (PDT)
X-Received: by 2002:a25:d97:: with SMTP id 145mr5820728ybn.276.1626357081466; 
 Thu, 15 Jul 2021 06:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210715080017.239633-1-linus.walleij@linaro.org>
In-Reply-To: <20210715080017.239633-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jul 2021 06:51:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WDfy3fdzNPXSKWtOohqZrn5kUeDyMhM2mV3iT9CyOBPA@mail.gmail.com>
Message-ID: <CAD=FV=WDfy3fdzNPXSKWtOohqZrn5kUeDyMhM2mV3iT9CyOBPA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Document internal backlight handling
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 15, 2021 at 1:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Panels with internal backlight need to assign their backlight member
> directly.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/drm/drm_panel.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3f0eba..1e63fadf1368 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -144,8 +144,9 @@ struct drm_panel {
>          * Backlight device, used to turn on backlight after the call
>          * to enable(), and to turn off backlight before the call to
>          * disable().
> -        * backlight is set by drm_panel_of_backlight() and drivers
> -        * shall not assign it.
> +        * External backlight is assigned by drm_panel_of_backlight() while
> +        * panel-internal backlight is assigned directly to this member by the
> +        * panel driver.

Can you rebase/post against drm-misc-next? If not then you'll conflict
with commit 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight
support"). :-)

-Doug
