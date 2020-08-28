Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEE255DFF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 17:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862BF6E154;
	Fri, 28 Aug 2020 15:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB93A6E154
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:38:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o4so1719307wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zF4wjuq7NlXDCWxwqRlprq8+YIO3EP/prTKpLCQVawE=;
 b=XQR50PRzIDXP7atHlwU9Y4qtYH28bhVuN+nc6jOAmcqiR2nOALvWYBMqVBfos581P7
 XGuz8fAztk6pjkS4VSz1i+BrPic5yobLkfpI+3tqM0DZ+225Umxxb14UGnoxugMMwDYV
 x+L4fm0kLLr7OwOHtl8k3RTEFMTZC5zlrXj/PfItUmfoa0XNfo8m1fX3TvKoIs/sF4Dm
 ERf6IkH4uup+VWncdtaax3E7liZHFGEQq07Yl+ikmZwcm7SH86z5AYK4p+pOIWBgzfKY
 oPh/N/V4D+w+z8aCU/f8HsXnQ03i+Y425UyDnihNH9AJ9fJSueAzXi8Uqx8LfCNf5Jrg
 zGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zF4wjuq7NlXDCWxwqRlprq8+YIO3EP/prTKpLCQVawE=;
 b=MEUQkB5LdmhWU/wGm9V2ai05hkZ9/OZVRcoBmXQ+RE9gukqkVLgW+qI6gthM0J7Kgu
 fRtGirWX0Z61jKtE7zHC1mYIkge7Mo69266UWYP9uTIxWfL//5YZoAZg9Ib07VwV+3AG
 /7hmIA3nKh9sCRAgFYdDxa2ggIRTzf3xAgZfeSGDQ1s7SkCjlyEjjOEqYJ5YCAEAzBJm
 spfwIUzI+DA/A0Zz5RpRhHlnZldyC6V/1cpn/aYQ2MFh8dKaARj7QMsZn9E/Q0lDBOmf
 7FB5iH8HPcol4zg4SBemmLvvp1kYigiJkbVwHaIHwKiKGE6X8FeM8/eWw3p34QC/1hVg
 rC1w==
X-Gm-Message-State: AOAM531Zi1w/8yY5fyaBJogBwWEJ+kY7d9VkG05Dow7qvRnRBO721LdN
 CgZuTzC6vj19m5qg067iaQDSaDW+nt5cAEuBFR/0ag==
X-Google-Smtp-Source: ABdhPJxHuvA/mBiuIknMdmiA5hSVY4oW2N955fzVP5r0eRNvMn3H/kQnCuEvq9cPXPwP9snvFO3LG6RV314TaQhSdqo=
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr2146163wrr.27.1598629086231;
 Fri, 28 Aug 2020 08:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
 <20200821071045.24501-4-hoegeun.kwon@samsung.com>
 <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
 <80749dcd-d4b2-68a1-f3ca-c19a120f6f7b@samsung.com>
 <84c423e8-25a6-8f23-cc80-7a17ce03fd1d@i2se.com>
 <a19de8d5-2b01-cb62-38a2-b0732068025c@samsung.com>
 <a3231281-3bd0-e7c9-1bb0-f05848621e82@i2se.com>
 <20200828152510.jhhqvka6fmouozff@gilmour.lan>
In-Reply-To: <20200828152510.jhhqvka6fmouozff@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 28 Aug 2020 16:37:50 +0100
Message-ID: <CAPY8ntDeLOb+GvpLDX1BFrhtYyGQzJ01pWHiS30r-2ZUJTg8Gw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>, kdasu.kdev@gmail.com, sboyd@kernel.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, Stefan, and Hoegeun

On Fri, 28 Aug 2020 at 16:25, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Aug 28, 2020 at 02:45:49PM +0200, Stefan Wahren wrote:
> > Am 28.08.20 um 08:30 schrieb Hoegeun Kwon:
> > > On 8/27/20 6:49 PM, Stefan Wahren wrote:
> > >> Am 27.08.20 um 06:35 schrieb Hoegeun Kwon:
> > >>> Hi Stefan,
> > >>>
> > >>> Thank you for your review.
> > >>>
> > >>>
> > >>> On 8/26/20 7:04 PM, Stefan Wahren wrote:
> > >>>> Hi Hoeguen,
> > >>>>
> > >>>> Am 21.08.20 um 09:10 schrieb Hoegeun Kwon:
> > >>>>> There is a problem that the output does not work at a resolution
> > >>>>> exceeding FHD. To solve this, we need to adjust the bvb clock at a
> > >>>>> resolution exceeding FHD.
> > >>>> this patch introduces a mandatory clock, please update
> > >>>> brcm,bcm2835-hdmi.yaml first.
> > >>>>
> > >>>> Is this clock physically available on BCM283x or only on BCM2711?
> > >>> As far as I know, BCM2711 raspberry pi 4 supports 4k,
> > >>>
> > >>> don't supported on pi 3 and pi 3+.
> > >>>
> > >>> Since 4k is not supported in versions prior to Raspberry Pi 4,
> > >>>
> > >>> I don't think we need to modify the bvb clock.
> > >>>
> > >>>
> > >>> So I think it is better to update 'brcm,bcm2711-hdmi.yaml'
> > >>>
> > >>> instead of 'brcm,bcm2835-hdmi.yaml'.
> > >> You are correct please update only brcm,bcm2711-hdmi.yaml.
> > >>
> > >> My concern was that the function vc4_hdmi_encoder_pre_crtc_configure()
> > >> is called on a non-bcm2711 platform or on a Raspberry Pi 4 with an older
> > >> DTB. So making the BVB clock optional might be better?
> > > You are right, if use old dtb, we have a problem with the hdmi driver.
> > >
> > > So how about modifying it like this?
> > >
> > > @@ -1614,8 +1614,8 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi
> > > *vc4_hdmi)
> > >
> > >          vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
> > >          if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
> > > -               DRM_ERROR("Failed to get pixel bvb clock\n");
> > > -               return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
> > > +               DRM_WARN("Failed to get pixel bvb clock\n");
> > > +               vc4_hdmi->pixel_bvb_clock = NULL;
> > >          }
> >
> > i think the better solution would be devm_clk_get_optional(), which
> > return NULL in case the clock doesn't exist.
>
> It's not really optional though. BCM2711 will require it in order to run
> properly (as Hoegeun experienced), and the previous SoCs won't.
>
> If we use clk_get_optional and that the DT is missing the clock on the
> BCM2711, we will silently ignore it which doesn't sound great.

Am I missing something here? (I know I missed this earlier)
We're in vc5_hdmi_init_resources, which is inherently bcm2711 only.
bcm283x will go through vc4_hdmi_init_resources.

As long as vc4_hdmi_init_resources has left vc4_hdmi->pixel_bvb_clock
at NULL, then the clock framework will be happy to do a nop.

For BCM2711 an old DT would have issues, but, as Maxime has stated, no
binding or upstream DTB has been merged yet, so it can be made
mandatory.
Making it optional drops you back on whatever the firmware might have
set it to, which may be sufficient for some resolutions but not
others.

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
