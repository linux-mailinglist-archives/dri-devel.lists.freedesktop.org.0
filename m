Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD3618624
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 18:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB56210E74F;
	Thu,  3 Nov 2022 17:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0E210E74F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 17:27:43 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id x16so1415763ilm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AGC/klEz2b4U2dWfKdByQm5t3Nd2hzDiho7sYsJJDgc=;
 b=SxQO5nBmjuNSdv2VHJ4CSyeRyfkwzBe6T0yK5/F6IMLtKRF3CxyrWA01CaFn/5J81u
 tiNQyyaSE9bTKZ+plnoWjjgA8+Y9YiY/4txcMa38/FsOCsE86vENKo/6T8RSWKCE4VfG
 ceYqI1Zr2krJAcyzTOQOwTbq3rMDJZgjWipAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGC/klEz2b4U2dWfKdByQm5t3Nd2hzDiho7sYsJJDgc=;
 b=TFWz+NsIiC+V7yU40Fn6O6je9cSM7dkEaG2SNEgYBhtKGSjMARWpwo9Cno1dAECPx1
 JTcDknUjRVvfWap/EXjvOOc2JOft1SClu23amQQ8uU7C1hUGPpFNkvG45b2sF4oTymQT
 WBjb4XMUQyiBu2xRLNmHFYO0nbAiTNakY+agCYVCaV6KElZCuWfN8+b6gCaXLz39Pj1W
 potOdO2QWkYYiUGQDB9v7MdbhplNi6Fg2jmtRBdEyAxemo61bW/tfgCLgP3caXIXIlGp
 EHbl7SK7E32c+l0TWS1w8dDBMFUA+0WHbINEgSBYH4IgbiGFKgA/R8TPVcuJN0vqjdrx
 po3g==
X-Gm-Message-State: ACrzQf1uojBro37shkS5tmbulGG20YNoR1c1oqMZFx87Du/SZQjNm8+I
 EVohq2aFmRYcup7LLV1SVE5r1Tv5tgcgwgqyrx+R9A==
X-Google-Smtp-Source: AMsMyM4WOlzrsf2MfLGKkfRUI+mR05yDHtzMkofGZmAqSsGnHOYANJuclflHNDLDq1gr17Au2yAG+W1lDdR1vP6pD0c=
X-Received: by 2002:a05:6e02:12cf:b0:300:61b9:96a5 with SMTP id
 i15-20020a056e0212cf00b0030061b996a5mr17356587ilm.43.1667496463200; Thu, 03
 Nov 2022 10:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
 <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com>
 <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
In-Reply-To: <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Nov 2022 22:57:31 +0530
Message-ID: <CAMty3ZAzDMRYiWWRwKvA+QSaXRHYgadJ7d4JwKnJWHPqPBua7A@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
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

On Thu, Nov 3, 2022 at 9:56 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/3/22 10:39, Jagan Teki wrote:
> > On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/5/22 17:13, Jagan Teki wrote:
> >>
> >> [...]
> >>
> >>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>        pm_runtime_put_sync(dsi->dev);
> >>>    }
> >>>
> >>> +#define MAX_INPUT_SEL_FORMATS        1
> >>> +
> >>> +static u32 *
> >>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>> +                                    struct drm_bridge_state *bridge_state,
> >>> +                                    struct drm_crtc_state *crtc_state,
> >>> +                                    struct drm_connector_state *conn_state,
> >>> +                                    u32 output_fmt,
> >>> +                                    unsigned int *num_input_fmts)
> >>> +{
> >>> +     u32 *input_fmts;
> >>> +
> >>> +     *num_input_fmts = 0;
> >>> +
> >>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> >>> +                          GFP_KERNEL);
> >>> +     if (!input_fmts)
> >>> +             return NULL;
> >>> +
> >>> +     /* This is the DSI-end bus format */
> >>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >>> +     *num_input_fmts = 1;
> >>
> >> Is this the only supported format ? NXP AN13573 lists the following:
> >>
> >> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >> 3.7.4 Pixel formats
> >> Table 14. DSI pixel packing formats
> >>
> >> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> >> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> >
> > Look like these are unsupported in media-bus-format.h list.
>
> Aren't those:
>
> MEDIA_BUS_FMT_UYVY12_1X24

Why is UYVY12 - YCbCr, 4:2:2 is 4+2+2 = 8 then it has UYVY8 ?

> MEDIA_BUS_FMT_UYVY8_1X16

If YCbCr is UYVY (I still don't get this notation, sorry) then Packed
Pixel Stream, 24-bit YCbCr, 4:2:2 with 2 Pixels per packet from Table
14 can be

MEDIA_BUS_FMT_UYVY8_2X24
(YCbCr 4:2:2 is UYVY8)

 " based on a reference example from media bus format doc
4.13.3.4.1.1.3. Packed YUV Formats, For instance, a format where
pixels are encoded as 8-bit YUV values downsampled to 4:2:2 and
transferred as 2 8-bit bus samples per pixel in the U, Y, V, Y order
will be named MEDIA_BUS_FMT_UYVY8_2X8."

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html

_2X24 here 2 Pixels per packet is the exact packets to consider or we
can consider 1 Pixel per packet also. If later is true then _1X24 from
your notation is correct.

Thanks,
Jagan.
