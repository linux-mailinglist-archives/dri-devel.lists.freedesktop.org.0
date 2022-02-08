Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B734AD528
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEE810E5D3;
	Tue,  8 Feb 2022 09:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2F10E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 09:45:29 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id z17so3394304plb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 01:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZ5YoyypaVIdNJWNBuLZoYFhoOEVTGQBx0XSyV/K64g=;
 b=pNjpHOvtGk7X2k8pye4V2WHMJ7dNNRrzdNfMbZZhyF+E5PPYKOmO91Sc5wQM0IkuTY
 dPBgHyQSiuWGu+PJnIbZOmV9+0/cgSwADvRm4OfjSPEZe1YYiuI+N19DW/ojNqYaR3Tg
 tbfGl1WYYSd3BLSV7l1jI0qC1O+2HF+TxHAymI9DlgGtZYp/4Z/qJ4mk0PdX/SFvplPP
 22pYV/d9yMSggkijFMPtN8eKpTwdNd8T1grrlNxCpfXDBWBfFOjJqFMZVwk6nVdXaTq0
 91ltG5gjjFuvui8SECnYYHEXfpFXoQ+95U7Gm9zmzB357dcQor6ZtyWchOjprzR7JNeN
 k4PQ==
X-Gm-Message-State: AOAM5326Mt1NZtnmIJcxCDBcpPa3/Vwrq5bfyJhW/UbUs2h72G2mbv+y
 tjJOI63lCSRxfI9lIJuOsO0hUcvi8gvqnQ==
X-Google-Smtp-Source: ABdhPJwlrxdPjEsjl2N3fkhiizZMnoYbkbECr5EZApDOZh6j1bMe0DOvyxGiLpeX+mZSvHOkqMta+g==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr414724pjq.162.1644313528824; 
 Tue, 08 Feb 2022 01:45:28 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id cu21sm763449pjb.50.2022.02.08.01.45.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 01:45:28 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2129001pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 01:45:28 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr1094926vsa.77.1644313195369;
 Tue, 08 Feb 2022 01:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20220203093922.20754-1-tzimmermann@suse.de>
In-Reply-To: <20220203093922.20754-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Feb 2022 10:39:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
Message-ID: <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Doug Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Feb 7, 2022 at 12:31 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> the option to fix the build failure. The error message is shown
> below.
>
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
>     `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
>     `drm_panel_dp_aux_backlight'
>   make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
>
> The issue has been reported before, when DisplayPort helpers were
> hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
>
> v2:
>         * fix and expand commit description (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

This fixes the build errors I'm seeing, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
