Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B367A4C5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51CD10E258;
	Tue, 24 Jan 2023 21:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD01810E258
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:16:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x40so25544030lfu.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=arS602j7b1PD/geangp4x5yLnesnSPivQKKbta96l7c=;
 b=EiWZ+x0fdUG0Ua/Q1YpwSARBwu8nnGu1ShQuasYMWIQx6pKm2C8T4XJQiDTGFHqCA7
 psumDhTSSBQLVkpr1MQBxMsI9+moKWW/eKat0TmAD7chVjdzHypGLGPPeegaUnAGT4pv
 LB/d2SXqQy0uuezKMzhtDcLELMaE+xFFa+QJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=arS602j7b1PD/geangp4x5yLnesnSPivQKKbta96l7c=;
 b=BXXGGF6smIP9iBRam25Ai0EmUYZ5EOKadNlrR53SOOho8mfqxfcmawJpgW0BZtspsf
 pkZ/m90U8q0/2zmhC6y4KfrlA9D9K1gukgnYOaKw3UqIMJY0wA0mzGOCKzPMYRV7GxgO
 nIzLzyDjKr3/J6Av40JbJXcBFUIaBNQHriTfu6mrI8vf/5xUfMJl81y16SZISLc1zReJ
 V2g0beFX8It9sEGtvRrdJU3Bqe/RbyfolcH1BtA0n2t3vY7w+fJ3vQvVj5NsDrzvb85b
 mqElD43qwZXy0X/CumDDZNjfCGktzhq1rbWrk/aazaXQIiSzck3jee+o4wInX6nHOFta
 76gw==
X-Gm-Message-State: AFqh2koqtrRnHICV8GyBixBpHSLqSxmthaGu2vqSXRkPHZOrfYMmCmM+
 IraREAlMQWEYLzUTBW6IBXIzUlBSG/aNuv+9HCXdrA==
X-Google-Smtp-Source: AMrXdXtR0M84WWFR/eFBxITTRFntc4w0fBApuquxeL369biQsoSFRs/Ai0jAFBo9WYXH9vMIAdEzT7t5y1a94VJdPMU=
X-Received: by 2002:a05:6512:32ae:b0:4be:a4cb:be38 with SMTP id
 q14-20020a05651232ae00b004bea4cbbe38mr1452324lfe.501.1674594977999; Tue, 24
 Jan 2023 13:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com>
 <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
In-Reply-To: <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 02:46:04 +0530
Message-ID: <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/23/23 16:12, Jagan Teki wrote:
>
> [...]
>
> > +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> > +{
> > +     int i;
>
> if (fmt == MEDIA_BUS_FMT_FIXED)
>   return false;
>
> > +     for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> > +             if (exynos_dsi_pixel_output_fmts[i] == fmt)
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static u32 *
> > +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state,
> > +                                  u32 output_fmt,
> > +                                  unsigned int *num_input_fmts)
> > +{
> > +     u32 *input_fmts;
> > +
> > +     if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> > +             /*
> > +              * Some bridge/display drivers are still not able to pass the
> > +              * correct format, so handle those pipelines by falling back
> > +              * to the default format till the supported formats finalized.
> > +              */
> > +             output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>
> You can move this ^ past the kmalloc() call, so in unlikely case the
> kmalloc() fails, it would fail first.

I didn't get this point, what do we need to do if
exynos_dsi_pixel_output_fmt_supported returns false?

Jagan.
