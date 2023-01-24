Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A749467A4E5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65B10E701;
	Tue, 24 Jan 2023 21:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561BB10E701
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:22:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h24so21328749lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TexIlt5z9afy14bQ4ecRlOK+1si7hb2N9UliprInxEc=;
 b=P1BrQUJwOYpsCvnFXftJxHfl8uOfjxcwEPAp0EQdS9Zr3FBihJvz1nGfag6OU2yU5H
 VGcFADSgIAPad5fDMMSkJHVeg01WQxNhew7x+WpQ1gGqO45vca/llEf3/q+9u22q7uXh
 gRLuRBmCIamdIBd66sZ50IttH8rRhUJaXnlfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TexIlt5z9afy14bQ4ecRlOK+1si7hb2N9UliprInxEc=;
 b=wfPDqAnRFk16BkEZeQSfa8PzBKJMtA2nk4ScSwT1AzNYb1yzLEOCCwUU8NU4PwoUNN
 fAnGV8nEdIXdemrNvEBWKAoFNzmtAtN2JJwD1t2gWJWhL49IerEncu2Rgw1s/l9hUtD0
 AJ0hUaaP2k9K7Knn7hA0SsGU+4jUlcGw1c9icUuRefePx2EaGwiqZAUZK3FfEj5+MSzL
 jzeQh16Pr8sMJ/Pqjq89zBr2jdtlRU6/pCPA9jz1qOhqD79rTTEdL1z3j+8Fd4ZVvv14
 Y1O4gcmafy5pVP0Z1MnDKNZ3Z9YRz8sQ176I5L+k6LSjNWsaB5cr61m/015Whh0jndIp
 o8Pg==
X-Gm-Message-State: AFqh2kqyojYON+zC/oPTiOxBwX0S8CypZmuIyUkraYTrY5MvNasakTDD
 zsdLyXvhGauQt4J1Z7oPn2gBS70wXTQCDAU6L8vwZg==
X-Google-Smtp-Source: AMrXdXuPhNoZL41GWgDPUFOadChoXNIB7gRKjcVJFCn0bAe2NoE0fnhgHeDqf+n89zd/68LC9a7pjLr4EyXnW7vhLis=
X-Received: by 2002:a05:6512:308b:b0:4b5:6c00:429e with SMTP id
 z11-20020a056512308b00b004b56c00429emr3465445lfd.379.1674595375549; Tue, 24
 Jan 2023 13:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com>
 <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
 <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com>
 <fb888dda-fd7e-adb4-c701-6db4edc316e6@denx.de>
In-Reply-To: <fb888dda-fd7e-adb4-c701-6db4edc316e6@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 02:52:42 +0530
Message-ID: <CAMty3ZAXMBuQ8gpFfFLQcyAmFF0=pTT-_fEpPoHZD2Yq9pWCig@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add
 atomic_get_input_bus_fmts
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 2:49 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:16, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>
> >> [...]
> >>
> >>> +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> >>> +{
> >>> +     int i;
> >>
> >> if (fmt == MEDIA_BUS_FMT_FIXED)
> >>    return false;
> >>
> >>> +     for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> >>> +             if (exynos_dsi_pixel_output_fmts[i] == fmt)
> >>> +                     return true;
> >>> +     }
> >>> +
> >>> +     return false;
> >>> +}
> >>> +
> >>> +static u32 *
> >>> +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state,
> >>> +                                  u32 output_fmt,
> >>> +                                  unsigned int *num_input_fmts)
> >>> +{
> >>> +     u32 *input_fmts;
> >>> +
> >>> +     if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> >>> +             /*
> >>> +              * Some bridge/display drivers are still not able to pass the
> >>> +              * correct format, so handle those pipelines by falling back
> >>> +              * to the default format till the supported formats finalized.
> >>> +              */
> >>> +             output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> >>
> >> You can move this ^ past the kmalloc() call, so in unlikely case the
> >> kmalloc() fails, it would fail first.
> >
> > I didn't get this point, what do we need to do if
> > exynos_dsi_pixel_output_fmt_supported returns false?
>
> {
>         u32 *input_fmts;
>
>         input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
>         if (!input_fmts)
>                 return NULL;
>
>         if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
>                 /* ... the comment ... */
>                 output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>
>         input_fmts[0] = output_fmt;
>         *num_input_fmts = 1;
>
>         return input_fmts;
> }

Got it, thanks!
