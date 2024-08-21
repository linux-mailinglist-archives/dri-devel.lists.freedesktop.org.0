Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D3095930C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 04:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0798510E548;
	Wed, 21 Aug 2024 02:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LY4mLc/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991410E548
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:49:15 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d3c05dc63eso4616189a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 19:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724208555; x=1724813355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RE92xTzpyc1kzcm5lmkLo7kV0Lo7mv/gXSiJrqevpAQ=;
 b=LY4mLc/YrWX6Itt1Ikjr9wBjnrMTvXRq9G0J9FM2XtpFYjAjmCBq4ZlYPT0L9HPFpX
 DC6FuQzfMlrTm1I7QGHDK6FSO0SgNjxVDaJ0khNW/qwDeqbsSaA8VS9/6FPPlrIG4TLz
 ldAPAOBzQWYk//WcTLpMFS6HWMt6tQCeXWmZeSW3bU9szwubPmP5y7dipDWQtkTqd0I/
 zS5L+blVw5xmA5OPaWSGevXRsr6ETpFp+6HB9/0MYNJo+yErKSw53sEhZNZtarhtX957
 jHIVEd7LHsRm7HOJONJaH0QVCRCxXIMtaXmTRGAsS6eQjFs903cIroCpcejSK2I1uCkL
 AiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724208555; x=1724813355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RE92xTzpyc1kzcm5lmkLo7kV0Lo7mv/gXSiJrqevpAQ=;
 b=HZyghZVyXo9Ri21zyAZHDPz4pDzns3sXfTRSch4y6VBOJd5+ddafXs9TzSIJpw0HxC
 6cMHFAv9FnptUTV599/B/S5hKEOnBlIPm/3S0lYxi+tU/ptMIPVRBiO/cUDmRh7pdpbp
 zAQBfwvwr0KXWrEFmN7gAB/D3S7gCCpnBdMORPTjxz1zbh1FlYdbbdv/7MNHdBUk7lT4
 bSlhpio7VWzjHsexnvsba4VMwl7XqDXittTAF+1hNDGKujAy/kqMMaoCEJc8+Uo/7LE3
 G6i0Y8zagHTUEHnjXGWTglava2ezjvpImODxrG+WbTvn+dKrsjRxoOeNjVUXiXFowhIp
 8cRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3SyPlq5okh7Vll0SgeTn23hikC3q9jiYw0KLuf0HHICeGDCrmMu42tz7rXBTlsRzFYLBEJhJM4ME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrrfqU7tyEYCOp1wd5EbhgcvajrdsHTAko8i1aOBjR1mTDXbIe
 b03ThvSQCfU+zYYfURh/e8blwB15A2yvM9jKMTOvKhzfrriLe6izvikujT21hO1soJJ38aphKgK
 9fHMPeDhimrIBzmwOV94BYSwWNuQ=
X-Google-Smtp-Source: AGHT+IHPIeU+XeIHnRDwOc8ghN5MtcSzCEjHZtvnpI0kCMC3xi6zc1BgiVyooCk3wuq0/oAVIZyRNBgW98ToLF19jq4=
X-Received: by 2002:a17:90b:3889:b0:2cd:2992:e8dc with SMTP id
 98e67ed59e1d1-2d5e99fb6demr1065257a91.5.1724208554836; Tue, 20 Aug 2024
 19:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
In-Reply-To: <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 20 Aug 2024 21:49:03 -0500
Message-ID: <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Dominique MARTINET <dominique.martinet@atmark-techno.com>,
 linux-arm-kernel@lists.infradead.org, 
 marex@denx.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Makoto Sato <makoto.sato@atmark-techno.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 15, 2024 at 3:19=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Dominique, hi Lucas,
>
> On 17.06.24 6:32 PM, Lucas Stach wrote:
> > Hi Dominique,
> >
> > Am Montag, dem 17.06.2024 um 15:16 +0900 schrieb Dominique MARTINET:
> >> Adam Ford wrote on Sat, Feb 03, 2024 at 10:52:50AM -0600:
> >>> From: Lucas Stach <l.stach@pengutronix.de>
> >>>
> >>> Add a simple wrapper driver for the DWC HDMI bridge driver that
> >>> implements the few bits that are necessary to abstract the i.MX8MP
> >>> SoC integration.
> >>
> >> Hi Lucas, Adam,
> >> (trimmed ccs a bit)
> >>
> >> First, thank you for the effort of upstreaming all of this!! It's real=
ly
> >> appreciated, and with display working I'll really be wanting to upstre=
am
> >> our DTS as well as soon as I have time (which is going to be a while,
> >> but better late than never ?)
> >>
> >> Until then, it's been a few months but I've got a question on this bit=
:
> >>
> >>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gp=
u/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> new file mode 100644
> >>> index 000000000000..89fc432ac611
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >>> +static enum drm_mode_status
> >>> +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> >>> +                  const struct drm_display_info *info,
> >>> +                  const struct drm_display_mode *mode)
> >>> +{
> >>> +   struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi *)data;
> >>> +
> >>> +   if (mode->clock < 13500)
> >>> +           return MODE_CLOCK_LOW;
> >>> +
> >>> +   if (mode->clock > 297000)
> >>> +           return MODE_CLOCK_HIGH;
> >>> +
> >>> +   if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=3D
> >>> +       mode->clock * 1000)
> >>> +           return MODE_CLOCK_RANGE;
> >>
> >> Do you know why such a check is here?
> >
> > Sending a HDMI signal with a different rate than what the display
> > expects rarely ends well, so this check avoids that.
> >
> > However, this check is a bit overcautious in that it only allows exact
> > rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
> > check could be relaxed quite a bit to allow for that.
>
> I checked with a 1080p display that reports 23 possible modes via EDID.
> Out of these 15 are accepted by the driver with the strict check.
>
> Two more would be accepted with a relaxed check that allows a 0.5% margin=
.
>
> For the remaining six modes, the pixel clock would deviate up to ~5%
> from what the display expects. Still, if I remove the check altogether,
> all 23 modes seem to work just fine.
>
> >>
> >> When plugging in a screen with no frequency identically supported in i=
ts
> >> EDID this check causes the screen to stay black, and we've been tellin=
g
> >> customers to override the EDID but it's a huge pain.
> >>
> >> Commit 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY") already
> >> "fixed" the samsung hdmi phy driver to return the next frequency if an
> >> exact match hasn't been found (NXP tree's match frequencies exactly, b=
ut
> >> this gets the first clock with pixclk <=3D rate), so if this check is =
also
> >> relaxed our displays would work out of the box.
> >>
> >> I also don't see any other bridge doing this kind of check.
> >> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c has a similar check with a
> >> 0.5% leeway, and all the other drivers don't check anything.
> >> If you want to add some level of safety, I think we could make this wo=
rk
> >> with a 5% margin easily... Printing a warning in dmesg could work if
> >> you're worried about artifacts, but litteraly anything is better than =
a
> >> black screen with no error message in my opinion.
> >>
> >>
> >> In practice the screen I'm looking at has an EDID which only supports
> >> 51.2MHz and the closest frequency supported by the Samsung HDMI phy is
> >> 50.4MHz, so that's a ~1.5% difference and it'd be great if it could wo=
rk
> >> out of the box.
> >
> > For rate mismatches larger than the 0.5% allowed by the HDMI spec it
> > would be better to actually add PHY PLL parameters matching those
> > rates.
>
> I'd really like to be able to add more PHY PLL setpoints for displays
> that use non-CEA-861 modes. Unfortunately I didn't manage to figure out
> the fractional-n PLL parameter calculation so far.
>
> The i.MX8MP Reference Manual provides formulas to calculate the
> parameters based on the register values and I tried to make sense of it
> using the existing register values in the driver. But somehow it doesn't
> add up for me.
>
> Lucas, did you already work with the PLL parameters? By any chance, do
> you now how the math behind them works?

I spent a little time trying to understand it a bit.  I created a PMS
calculator similar to the one used on the DSI controller, except that
the M seems to be fixed at a value of 62 per the data sheet, so it's
more of a PS calculator.

Anyway, When I run my P-S calculator to generate the 'best rate' I get
a value that's usually 0.2% variance from nominal, but I only verified
a handful of values:

Several which were +0.2%
297600000 vs 297000000 (4k@30)
148800000 vs 148500000 (1080p60)
74400 vs 74200

One value was -0.16%
24800000 vs 25200000

If the M value was a bit more flexible, we might be able to reduce
that variance more.

If / when I get some time, I might play with trying to disable the
fractional mode and just use the PMS calculator for simplicity despite
the inaccuracy.  Maybe we could fall back to using the PMS calculator
if the desired frequency isn't in the look-up-table.

adam

>
> >
> > We could potentially add some more leeway for displays like yours that
> > aren't actually HDMI (as it doesn't seem to have a standard HDMI
> > resolution). But that's more of a last resort option, as it may
> > introduce other problems for displays that aren't as tolerant with
> > their input rates. Remember the mode_valid call is used to filter modes
> > that aren't compatible with the source, so for a display with multiple
> > modes allowing too much leeway may lead to incompatible modes not
> > getting tossed, in turn allowing userspace to set a mode that the
> > display may not like due to too much rate deviation, instead of only
> > presenting a list of valid modes. This again would present the user
> > with a black-screen without warning situation.
>
> What about adding some option to relax or remove the check for debugging
> purposes? Maybe combined with printing a warning message?
>
> I agree that we should prevent incompatible modes from passing the
> filter, but it would be really helpful if people had an easy way to
> relax/remove the check to see whether their display could potentially
> work without them needing to modify and recompile the kernel.
>
> Thanks
> Frieder
