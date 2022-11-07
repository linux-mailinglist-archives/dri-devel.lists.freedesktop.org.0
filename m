Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677A61FAB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5601B10E4C0;
	Mon,  7 Nov 2022 17:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057FC10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:00:42 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id p141so9372270iod.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zi1AzIotPjgee1WjMW/2lCnRF/Zux4fjSan/PWGqHXA=;
 b=Xyo5lSyER8B3jdtAksNfx+B+WXHa0Vd92xoDyHv20BXD948TTavHtQ6gVlUn5975MT
 /X0K0Im48+7tuE3VoRDQwITfanwbDtN0x9Ka1qkNZV3BsOQluTZa0z0pnKnMt/m7dWFB
 TtCguRYCO40UKwcLjAgQGeEZjdUHmQRwcewq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zi1AzIotPjgee1WjMW/2lCnRF/Zux4fjSan/PWGqHXA=;
 b=BjTY3/tPq5dulEFcD+Nh72wEj2Ge3TrfhMJ/hI4dCT5px6VR4SJFrSF+7Au0a94EUr
 aGSfgBmqRLZili5r4g20MpIH1vRfpj8aXNagfhofyUsxbBeKA/cMnnbbsizM8ST4vz2A
 Qzj9PA/aMXPBRTsby5fqZrL5q7Fdoiwf58wkdLzhDunkfYFXEwHGBl1PNMOlQ7u+661+
 y4yk1UbPuGgoYxEXPeOky2QDd9HWSCwZOXDTflTqoEZKxWfRz7u5DagQl5YRa76KrmhB
 J3NZPQk59Lk0uQjl3dcQoB3thm50IFeShC8sWjTmVQjkmSgqaBW/e/WyVd/kBjvM4WdJ
 ir9w==
X-Gm-Message-State: ACrzQf0lSGhHcN9NC+LjFfn7Ep1WW1n2M5TspLGAiTLd/gaWA2Q0hEpI
 s3+96F962yj85ymKAN8yCQYXO0pvz0OwaClaqEbEXQ==
X-Google-Smtp-Source: AMsMyM4HLKgn0Ui+fGxorZRefXlugK/s+o0o8HaeQEbFJ88dHtP+XquF7Q74DteCHkWU3Z573Mt+tw1NKgeel5+aJSA=
X-Received: by 2002:a5e:9e0a:0:b0:6c0:dbd0:cfac with SMTP id
 i10-20020a5e9e0a000000b006c0dbd0cfacmr31120387ioq.106.1667840442185; Mon, 07
 Nov 2022 09:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
 <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
 <CAMty3ZDQCsJF+EuG_gvZ-MbkePO55GHfX_yvmKdzqE1fdAR55g@mail.gmail.com>
 <9262c207-2b72-6638-0274-0ce1d0d830c9@denx.de>
 <CAMty3ZAzDMRYiWWRwKvA+QSaXRHYgadJ7d4JwKnJWHPqPBua7A@mail.gmail.com>
 <2f0c2dae-07c9-814b-a252-5fdd3e0d9dda@denx.de>
In-Reply-To: <2f0c2dae-07c9-814b-a252-5fdd3e0d9dda@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 7 Nov 2022 22:30:30 +0530
Message-ID: <CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com>
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

Hi Marek,

On Fri, Nov 4, 2022 at 12:28 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/3/22 18:27, Jagan Teki wrote:
> > On Thu, Nov 3, 2022 at 9:56 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 11/3/22 10:39, Jagan Teki wrote:
> >>> On Sun, Oct 16, 2022 at 3:31 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 10/5/22 17:13, Jagan Teki wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>>>         pm_runtime_put_sync(dsi->dev);
> >>>>>     }
> >>>>>
> >>>>> +#define MAX_INPUT_SEL_FORMATS        1
> >>>>> +
> >>>>> +static u32 *
> >>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>>>> +                                    struct drm_bridge_state *bridge_state,
> >>>>> +                                    struct drm_crtc_state *crtc_state,
> >>>>> +                                    struct drm_connector_state *conn_state,
> >>>>> +                                    u32 output_fmt,
> >>>>> +                                    unsigned int *num_input_fmts)
> >>>>> +{
> >>>>> +     u32 *input_fmts;
> >>>>> +
> >>>>> +     *num_input_fmts = 0;
> >>>>> +
> >>>>> +     input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> >>>>> +                          GFP_KERNEL);
> >>>>> +     if (!input_fmts)
> >>>>> +             return NULL;
> >>>>> +
> >>>>> +     /* This is the DSI-end bus format */
> >>>>> +     input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >>>>> +     *num_input_fmts = 1;
> >>>>
> >>>> Is this the only supported format ? NXP AN13573 lists the following:
> >>>>
> >>>> i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >>>> 3.7.4 Pixel formats
> >>>> Table 14. DSI pixel packing formats
> >>>>
> >>>> Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
> >>>> Packed Pixel Stream, 24-bit YCbCr, 4:2:2
> >>>> Packed Pixel Stream, 16-bit YCbCr, 4:2:2
> >>>
> >>> Look like these are unsupported in media-bus-format.h list.
> >>
> >> Aren't those:
> >>
> >> MEDIA_BUS_FMT_UYVY12_1X24
> >
> > Why is UYVY12 - YCbCr, 4:2:2 is 4+2+2 = 8 then it has UYVY8 ?
>
> (someone please correct me if I'm totally wrong here)
>
> The 12 is channel width (12 bit for each Y1/Y2/U/V channel sample).
> The 4:2:2 is subsampling (where are the color components sampled
> relative to brightness component).
>
> Picture is here:
> https://upload.wikimedia.org/wikipedia/commons/f/f2/Common_chroma_subsampling_ratios.svg
>
> Each Y square of the left is 12bit sample.
> Each U+V square is 12bit sample for U and 12bit sample for V.
>
> In case of 4:4:4 subsampling, each luminance (brightness) component has
> matching chrominance (color) components.
>
> In case of the 4:2:2 subsampling, two neighboring luminance components
> share two chrominance components. To transfer one pixel including color
> information, you have to transfer two pixels, Y0+U as 2x12bit sample in
> one cycle of 24bit bus, and then Y1+V as 2x12bit sample in another cycle
> of 24bit bus (2 clock cycles total, 4 samples total). From that you can
> reconstruct the two top-left squares (purple pixels) in the rightmost
> YUV column of 4:2:2 row.
>
> The entire trick is that because eye is less sensitive to color than it
> is to light, you can transfer less color information and thus save
> bandwidth without anyone noticing (much of it).
>
> >> MEDIA_BUS_FMT_UYVY8_1X16
> >
> > If YCbCr is UYVY (I still don't get this notation, sorry) then Packed
> > Pixel Stream, 24-bit YCbCr, 4:2:2 with 2 Pixels per packet from Table
> > 14 can be
> >
> > MEDIA_BUS_FMT_UYVY8_2X24
> > (YCbCr 4:2:2 is UYVY8)
> >
> >   " based on a reference example from media bus format doc
> > 4.13.3.4.1.1.3. Packed YUV Formats, For instance, a format where
> > pixels are encoded as 8-bit YUV values downsampled to 4:2:2 and
> > transferred as 2 8-bit bus samples per pixel in the U, Y, V, Y order
> > will be named MEDIA_BUS_FMT_UYVY8_2X8."
>
> The way I read the above is that the channel width of each channel is
> 8-bit , so you start with two pixels Y0/U/Y1/V which add up to 32bit
> total. That is transferred over 8-bit bus, in 4 bus cycles total. One
> pixel therefore takes 2 cycles of the 8 bit bus to transfer, even if you
> cannot transfer one pixel separately .
>
> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html
> >
> > _2X24 here 2 Pixels per packet is the exact packets to consider or we
> > can consider 1 Pixel per packet also. If later is true then _1X24 from
> > your notation is correct.
>
> Since the DSIM input bus is 32bit wide, to transfer one such 4:2:2
> pixel, you need 1 bus cycle (2x12 bits per half of two pixels).

Thanks for your explanation. I need some time to understand and it
looks worth waiting for others to comment on this.

Meanwhile, I'm planning to send subsequent version patches with
possible supported formats like,

MEDIA_BUS_FMT_UYVY8_1X16,
MEDIA_BUS_FMT_RGB101010_1X30,
MEDIA_BUS_FMT_RGB121212_1X36,
MEDIA_BUS_FMT_RGB565_1X16,
MEDIA_BUS_FMT_RGB666_1X18,
MEDIA_BUS_FMT_RGB888_1X24,

Let me know.

Jagan.
