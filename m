Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF76B7559
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 12:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562CF10E4E0;
	Mon, 13 Mar 2023 11:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C3D10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 11:08:18 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s17so6647284pgv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678705698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMfIcPw24eAIaxANk5dvKrsQWn+L+1o2hPI8u1Bd4r8=;
 b=g/GAPic/XSvU4iEU3zMBU9tlU+p851NwZqiXr0aa35i3EXQ5/btu8wqfRCPqwbY7Wt
 /p5FSgAWZ+ZyETwbSNXR+ZgBZLI+/ay7auCL1GkmD6CkTlCQ4sbS7bzea9N+0OEG35BE
 YLfjSO7RIrRiWFm4wIfFcmdH/b1mrVNxfAJoo79UbSfbV3ZAWMron8M/7JrmnVOEUFCf
 oZ5IHv1CSW6TZ2Zw97nFfLp0p8b6ptVxPBnl/0/XddXKoEXte7B2vXqMxERN7Ih4cuC5
 WnFFha8hepJTnT9HK4X6bZwuxPzO6E8lOGrzcE3Fy5cb8PPDbC5FylQWnSvxpuDVesME
 RE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678705698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMfIcPw24eAIaxANk5dvKrsQWn+L+1o2hPI8u1Bd4r8=;
 b=0UKMY1sIwTU3I6dDAzecjHVbBbeOEDYsgolQ8f4Cc5RBBuFv7d3DperH7jHJNmrtfp
 YxH/AlmCVXd0TaTBAV2Ubq1t3IK0Vk303FLwzRqq4oDYtMBlPtjVE23T0QrLkU3SksyQ
 QVASynEYJX6yU3npDXGY/2I/lKEwvgZZsdG+DwsyAK0kPA/dJJA7rJjc+VamrsSm/iIp
 IXzybwMJenOKIAPUb76JAYqPazBUuhfQUAlqhS47wLFRFDXYKMoj0GZWnwt+TRQwcqKB
 nFN/hd6HcDKg5qV+lojBbWBfhLT7bfgJ8iaREjaZyiuIBJRR5p6rXMtVs9Fd9FtuPAm/
 Cj9Q==
X-Gm-Message-State: AO0yUKWS1RcC4lf+8WcG1JzlWd8EMXOZb7St4cq1tjR4ZXvtiYCt7490
 fpWHppMsiFWBSUNMUpjV1ys7jwrPfkXFF2sYAQc=
X-Google-Smtp-Source: AK7set+C5h1Ucyyg+GQdjN8ADb5vMD5w5MLyG6dEw/6w1G4peIVgYoOZrBrp2x73DcS+x3tIyRUnfx6w9p+4IWr/h70=
X-Received: by 2002:a62:79c4:0:b0:622:65eb:f6bd with SMTP id
 u187-20020a6279c4000000b0062265ebf6bdmr2191781pfc.2.1678705697790; Mon, 13
 Mar 2023 04:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJXMmwYqD=Eb2=_vJw390KAd6NgkWCpq6yCbAyaJ3xK5A@mail.gmail.com>
 <20230313085105.GB7446@pengutronix.de>
In-Reply-To: <20230313085105.GB7446@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 13 Mar 2023 06:08:05 -0500
Message-ID: <CAHCN7xJxBrN5aQgvkV8LrqoTATinr0kFYKht2_YKqTF71UCoKw@mail.gmail.com>
Subject: Re: MXSFB and Video PLL clock on i.MX8M Mini/Nano Question
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 3:51=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:
>
> On Sun, Mar 12, 2023 at 02:28:45PM -0500, Adam Ford wrote:
> > I am trying to work through a series that was submitted for enabling
> > the DSI on the i.MX8M Mini and Nano.  I have extended this series to
> > route the DSI to an HDMI bridge, and I am able to get several
> > resolutions to properly sync on my monitor.  However, there are also a
> >  bunch that appear on the list when I run modetest that do not sync on
> > my monitor.
> >
> > When running some debug code, it appears that it's related to the
> > clocking of the MXSFB driver.
> >
> > From what I can tell, the MSXFB driver attempts to set the clock based
> > on the desired resolution and refresh rate.  When the default
> > VIDEO_PLL clock is set to 594MHz, many of the resolutions that cleanly
> > divide from the 594MHz clock appear to sync with my monitor.  However,
> > in order to get other resolutions to appear, I have to manually change
> > the device tree to set VIDEO_PLL to a different clock rate so MSXFB
> > can use it.  Unfortunately, that breaks the resolutions that used to
> > work.
> >
> > I threw together a hack into the MXSFB driver which adds a new
> > optional clock to the MSXFB driver.  When I pass VIDEO_PLL to this
> > driver, it can automatically set the clock rate to match that of
> > whatever the desired clock is, and I can get many more resolutions to
> > appear.
> > Another advantage of this is that the Video_PLL can be the minimum
> > speed needed for a given rate instead of setting a higher rate, then
> > dividing it down.
>
> Isn't it possible to add the CLK_SET_RATE_PARENT flag to the pixel
> clock? That's what i.MX6sx and i.MX7 do.

I thought about that, but on the Nano, the video_pll is several layers up.

video_pll -> video_pll_bypass -> disp_pixel -> disp_pixel_clk

Do I just set that flag for each of these?

adam
>
> Sascha
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
