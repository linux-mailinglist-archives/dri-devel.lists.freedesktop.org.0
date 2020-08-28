Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104F255771
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0A86E2B8;
	Fri, 28 Aug 2020 09:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4796E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:22:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w2so294536wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DlptSyQ6kK0LdKojTYG+w08dirY2KbV81Pw6DWot84=;
 b=nqiHsYPIPE8UefWA1HkkZwjSxIkjNZpT8378QBvGCD4eZ5Ij20TwxdlTGp0hhMXr8d
 3YLbqgl7yK88MDZ2PThJt5GWd/zY6AOJieKvMUdKELQc49sVGrP5rUce2hjWEhdqnBz8
 FU3s1VDV6EyR/XNNX8seTRyZkjBDM4GefCVO3cUtXPzElvsmqjeTqZhUZ+yYMDBf8AW+
 gRzjoFABNuBcIgNL/6+bwaIuu3zhttwP4r/RFxAT1Uqayha2Bq6V2O2wK5MIDM1liBLT
 QR5yWMwwt9db7uIo2cIzxvwggC4vW4CyxgBYwzVBlOwpuit1hfyt7ZLeaPyMl//J9JDo
 5GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DlptSyQ6kK0LdKojTYG+w08dirY2KbV81Pw6DWot84=;
 b=gaavXTqmVD+LIerT3qdh307iBuYtvVfKmsbzFGgxvI0UldnAg7CYpsySNAMrVAeM5e
 qqVaNhrLbkEkPX5YGjEy3N5k72qhEflu813aD1wjZTZYJxHuEfUqwxDLRUH0AUNerkP1
 UK0RdpMeF8ANRLTI+8rluZUqrM12hacPe5tdLLJGtx71sQKyysD87JIL3KFJOopGXfkF
 vezdtUAZrhq/R105WFMSIbsn/lIVePK4R//o4l4DmAbPhDnMefAb1hgWknqa3LXDaTCa
 XwRHQRgsBeHN8dUi5Rf7uFqaULeQ2S4PvUpv7KEHoxA1pviqZC7yiu6wefaw1Csae52x
 v1gQ==
X-Gm-Message-State: AOAM530hgIlNn2Sm/dNzhcNY4K28/d+4cTQi9kPbgGQBZ3rF85FwyQIR
 NI/goAfdQxn1jqEvnc4DMqLEW/vwBm9Rn++zih0rHA==
X-Google-Smtp-Source: ABdhPJzs9vPg5xA1LTbcB2/EjJx3fmlzCtMtNI5cEOKYcIq9PYUVrwqMjE1yeoUY9PaenffWSX4vJ6D+nwowaYDwaKU=
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr708379wmj.116.1598606563447;
 Fri, 28 Aug 2020 02:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
 <20200821071045.24501-4-hoegeun.kwon@samsung.com>
 <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
In-Reply-To: <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 28 Aug 2020 10:22:28 +0100
Message-ID: <CAPY8ntABzkR+NPeTvifGbrLGcpom97zWdArxdFjEUq5JnjOU6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
To: Stefan Wahren <stefan.wahren@i2se.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>, kdasu.kdev@gmail.com, sboyd@kernel.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan & Hoegeun

On Wed, 26 Aug 2020 at 11:04, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Hoeguen,
>
> Am 21.08.20 um 09:10 schrieb Hoegeun Kwon:
> > There is a problem that the output does not work at a resolution
> > exceeding FHD. To solve this, we need to adjust the bvb clock at a
> > resolution exceeding FHD.
>
> this patch introduces a mandatory clock, please update
> brcm,bcm2835-hdmi.yaml first.
>
> Is this clock physically available on BCM283x or only on BCM2711?
>
> I'm a little bit afraid, this change could break with older firmware
> versions on BCM283x.

Thanks for your keen eye on these things.

BVB only exists on 2711, not 283x.

It runs at 2 pixels/clock, must be an integer divider of I believe
600MHz, and between 75 and 300MHz.
This aim of this patch is fine as we currently only go up to 4k30, but
for 4k60 the BVB will need to be set to 300MHz.

Thanks
  Dave

> Best regards
> Stefan
>
> >
> > Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 95ec5eedea39..eb3192d1fd86 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -80,6 +80,7 @@
> >  # define VC4_HD_M_ENABLE                     BIT(0)
> >
> >  #define CEC_CLOCK_FREQ 40000
> > +#define VC4_HSM_MID_CLOCK 149985000
> >
> >  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> >  {
> > @@ -380,6 +381,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
> >       HDMI_WRITE(HDMI_VID_CTL,
> >                  HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
> >
> > +     clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
> >       clk_disable_unprepare(vc4_hdmi->hsm_clock);
> >       clk_disable_unprepare(vc4_hdmi->pixel_clock);
> >
> > @@ -638,6 +640,23 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
> >               return;
> >       }
> >
> > +     ret = clk_set_rate(vc4_hdmi->pixel_bvb_clock,
> > +                     (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> > +     if (ret) {
> > +             DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> > +             clk_disable_unprepare(vc4_hdmi->hsm_clock);
> > +             clk_disable_unprepare(vc4_hdmi->pixel_clock);
> > +             return;
> > +     }
> > +
> > +     ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
> > +     if (ret) {
> > +             DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
> > +             clk_disable_unprepare(vc4_hdmi->hsm_clock);
> > +             clk_disable_unprepare(vc4_hdmi->pixel_clock);
> > +             return;
> > +     }
> > +
> >       if (vc4_hdmi->variant->reset)
> >               vc4_hdmi->variant->reset(vc4_hdmi);
> >
> > @@ -1593,6 +1612,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
> >               return PTR_ERR(vc4_hdmi->audio_clock);
> >       }
> >
> > +     vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
> > +     if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
> > +             DRM_ERROR("Failed to get pixel bvb clock\n");
> > +             return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
> > +     }
> > +
> >       vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
> >       if (IS_ERR(vc4_hdmi->reset)) {
> >               DRM_ERROR("Failed to get HDMI reset line\n");
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index 0806c6d9f24e..63c6f8bddf1d 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -147,6 +147,7 @@ struct vc4_hdmi {
> >       struct clk *pixel_clock;
> >       struct clk *hsm_clock;
> >       struct clk *audio_clock;
> > +     struct clk *pixel_bvb_clock;
> >
> >       struct reset_control *reset;
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
