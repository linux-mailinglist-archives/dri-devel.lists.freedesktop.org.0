Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D709E361BA5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5A6E0A8;
	Fri, 16 Apr 2021 08:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6C16E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:41:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id u7so11784918plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=He3oTSlwnFPi0gSb22caSHrtR7K6cmAux7Z+2T9Xo1o=;
 b=hacERswIX9cIS1UJydG+GKquH1hgrwS2+nCAq/Bgnj2hhImJuvM1HgFl4cg3S6pZev
 JCM/D2hsoeC9Cts3k/lDE+Tk9+6VMkX2XSjBRWjIaS+bPe6By0MTX5I0WkSokhwkTZ2s
 IbESokhSKgVQrq92WrdxoWpJ2zDl3xWxv0TymTHlFtLoHnW/4sc2o/IGhHEL6OREV5PB
 6L4ls7hRTeG8WWZxbf/vK4servXkCqbwQ9exsc6rCarR8bBKnafSkErOolvEAnnBOVyk
 YimIDDJRfC/4fGCP6QUmjQnHe0SUetMfhL8E10Ju8nu1Lfygrl+Nh+deXzi9RCwd4o03
 s9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He3oTSlwnFPi0gSb22caSHrtR7K6cmAux7Z+2T9Xo1o=;
 b=rc3J18+KIJ3tdJP38D6zGiGNF5yJ+RIKMHhKXbzReSDHvLRB9nkTsrgRAJh4P3bqaz
 RSeYcKt+5n/XFhb5jHDSdEa3mD/QZ4/6Fcz2+gs69CJM+5UgYoQI7+tSbTFENP1SDSr+
 EvnofYF4WreNVJKHlQped99NBcaY/RcKCzSYKkl1EgSQD+Smtox5rgWOVc7y8NmXixJS
 aTwxjJuZRvzoGZXLmkbiGkJkIdCIVQNJ5Kbg0EJ/lN1JWaiYbgpRQXYIJft7RX52oskC
 RJJmFyQqj1Ke17jFwap0XwZsTpt8tKsQ7TDFUztn0fAlYbACFB2ZC4+Cy9lNDWGHneqH
 3J1w==
X-Gm-Message-State: AOAM5309TCFzSaQEARgQsn0kQynRd2ikbBWoLK1ZRhQ1wBu6hqbKZfos
 LZoKDRxkfRi/ZSs3F9p3ThdljRNMmsLJdK0eK8AIgg==
X-Google-Smtp-Source: ABdhPJwF2oXeuk5v0ZBd9FHld186Dr4jfV9Bgsh1mreQZM+bGYmRq9h7B9YLZnGn9NgnTr0mVBmGQE0fwbP36eT7Of4=
X-Received: by 2002:a17:90b:392:: with SMTP id
 ga18mr8091538pjb.222.1618562488639; 
 Fri, 16 Apr 2021 01:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210415183619.1431-1-rdunlap@infradead.org>
In-Reply-To: <20210415183619.1431-1-rdunlap@infradead.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Apr 2021 10:41:17 +0200
Message-ID: <CAG3jFyvi-NyOdd8DdKu_QYz593YYvJzXm65DoCLubzHE+-5zNg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix ANX7625 use of mipi_dsi_()
 functions
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Randy!

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 15 Apr 2021 at 20:36, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> The Analogix DRM ANX7625 bridge driver uses mips_dsi_() function
> interfaces so it should select DRM_MIPI_DSI to prevent build errors.
>
>
> ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
>
>
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Xin Ji <xji@analogixsemi.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20210414.orig/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ linux-next-20210414/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -30,6 +30,7 @@ config DRM_ANALOGIX_ANX7625
>         tristate "Analogix Anx7625 MIPI to DP interface support"
>         depends on DRM
>         depends on OF
> +       select DRM_MIPI_DSI
>         help
>           ANX7625 is an ultra-low power 4K mobile HD transmitter
>           designed for portable devices. It converts MIPI/DPI to
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
