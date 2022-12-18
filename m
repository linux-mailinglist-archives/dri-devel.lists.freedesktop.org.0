Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B862664FD98
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 05:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF2D10E0C8;
	Sun, 18 Dec 2022 04:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4152D10E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 04:24:10 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v2so3190687ioe.4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 20:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IbA2IGs93cgemZ4bIad9hSbx1KPkrj5fRqrUCh2aOWA=;
 b=cE0IBmzXVtSRfmwXR1kcuXvSnhn6F1u6/YPdHRnUjpzMFeuZukR7DmneDIHGrwnRCO
 ImZDaFpYyzpHMpY74rSRbtMrXx3QYWVHgDEV93hPHVGF2+Bu0+qy2qQix/apNOERkQJx
 OcszplTzg/ImjRsAGdkADEyTNBYP+Jrxri4zoaVH0UJOpmSONgbbM+886mn5sojViBD2
 Ig21fnNwQRSlsuuul9jEjdtvSg+Tv9qfT8eYrbVr3yKccA+bn2N35z7ZcZp5s4Pbjxk+
 C1LROMUJ3FcsCS4xpSKKreTrcgTJO8b6qmXwugpO7dCMwn7j2LIATqhd2OvxvIcSLEOC
 yUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IbA2IGs93cgemZ4bIad9hSbx1KPkrj5fRqrUCh2aOWA=;
 b=EnDfr0ctFMF3I/3UaKlWThhsDwq9J792lWmlOBljTSTgXtkONtBmER/XLtrC/fHOvu
 QkjfgV87UlhPzrEz7ZW7PP7zmyPhsraSYW9UmREDOO2IFm47ZYYrXM8kbYYzk9MXluoL
 lpIGbI3p4PezUM3hR5ul4cgbsC2bgADNbLtnkO/VD9ZIfVYwVSSUFAHOvDCKmoROq/jO
 X1PoWpzwSb+DJHLv52Q4YJu4pFqwoINJfQrATthEY5xwBka77O8Mcn4PvMP0xQMZgxND
 Q1XG9Mbc+e6cux87FlyXRdJ313lCpOw7wdu/09RPxz1wVgnGFayQP6QyvfQ+Buv35isN
 juJA==
X-Gm-Message-State: ANoB5plo+9JaZJ8Gz6UT/dCpAT9wMx+hmoh/+PdAKPI1Cx6Y6QG53pld
 JvHRR6r2QC2C8RD11IKVQRSqSPW+T1pcKzOCqBc=
X-Google-Smtp-Source: AA0mqf740DPk1Lf43kE8fNqkDeRW9xbJFPEolHrgcrv2j81YlUfqSEAn9ogPOj3uhTTA03KlV9hTAxk0WhLyVu3qjlk=
X-Received: by 2002:a05:6602:42c2:b0:6e0:117f:f0a7 with SMTP id
 ce2-20020a05660242c200b006e0117ff0a7mr8862069iob.127.1671337449257; Sat, 17
 Dec 2022 20:24:09 -0800 (PST)
MIME-Version: 1.0
References: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
 <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
In-Reply-To: <a6ad86a0-2831-34aa-2c2a-f6d683dc5713@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 17 Dec 2022 22:23:58 -0600
Message-ID: <CAHCN7xJnepugHxVR2oCd6YyUDA=RED33PTYmsXQkZ-wa4xgHbg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
Cc: Alexander Stein <Alexander.Stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 17, 2022 at 5:56 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/16/22 14:25, Alexander Stein wrote:
> Hi,
>
> [...]
>
> > Oh, nice, thanks for the pointer. When setting
> >> samsung,burst-clock-frequency = <668250000>;
> > in imx8mm.dtsi
> > I get a non-flickering display using 4 lanes. Although admittedly this is just
> > random guessing. I'm not sure which clock exactly has to be in the range
> > CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for
> > 205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
> >> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
> >> samsung-dsim 32e10000.dsi: hs_clk = 668250000, byte_clk = 83531250, esc_clk
> > = 16706250
>
> If I recall it right, minimum PLL frequency is:
>
> fPMS=1.2*width*height*bpp*fps=1.2*800*480*24*60=663.5 MHz
>
> the link frequency is then
>
> fHS=fPMS/lanes/2=82.9 MHz (on the DDR clock lane)
>
> So DSI83 should be in the range of 80..85 MHz input clock if I calculate
> this right. Can you check what is the value of mode->clock, the
> mipi_dsi_panel_format_to_bpp() return value, ctx->dsi->lanes in dsi83
> sm65dsi83_get_dsi_range() ?
>
> > AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT
> > properties, while SN65DSI84 is using display mode and number of lanes.
> >
> > Is it expected that the DSIM PLL frequencies are set in DT for a specific
> > bridge/display setup?
>
> No, there should be negotiation between the host and bridge/panel, I
> tried to propose two variants, but they were all rejected.

For one of Jagan's previous revisions, I added some code to let the
PHY auto adjust the frequencies instead of being fixed.  NXP had this
in their downstream kernel, but with this patch and another, I was
able to set a variety of pixel clocks from my HDMI monitor and my
DSI83. I haven't had time to re-base my work on Jagan's latest work,
but you can link to the patch I did for the older stuff here:

https://github.com/aford173/linux/commit/e845274b0f22ba3b24813ffd6bb3cb88ab4b67e4
and
https://github.com/aford173/linux/commit/3f90057eb608f96d106029ef639813475241936f

I've been traveling a lot lately, so I haven't had time to evaluate
his series, but I hope to get something like those re-based once the
DSI stuff has been accepted.

adam
