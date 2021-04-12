Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4035C1B9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B6189FBC;
	Mon, 12 Apr 2021 09:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089389FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:43:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so5798666wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiAalqXklDV4AQK4+bvItg76/pGr3vAv4Bzs6qws1rw=;
 b=H8ZthHyJG1MTv5jV4T3DNfZa0JihSD+tIYwaheZgYuqakn64kV2PetHHXmftpA2LCe
 fmh/04p0/LKGuBokBDZfjG+lMSFdrXnRq0Zscqt/+uT0xKjx/VFkka3wak/b51EwA7nl
 hqcf94Ni1eLS+0RBdi6tim2srnBC4eHaT80DV5kjZALynmhJPWrhl2M/bBmpDjD3zOb+
 pwC2gtxC4tOzoeJMsNyJKLtolNOIhDxBmepdzSKdhE15U8jUkdHJReCI99rpHVhPbmQ4
 n9ZCnjvJyPOlF2GTSnJflKZuHfT/Ng/jvvU90Ep1k9K1ZmdNxfjtNHd2Gh/oisawoeh4
 P1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiAalqXklDV4AQK4+bvItg76/pGr3vAv4Bzs6qws1rw=;
 b=Ak13KnZCgZBoBa1KE3Fc6eZn5B6+069EXzWWVUXdRGIcEdU0FK3KC8SXA9SgwOE9sx
 FrBcZbHv/hyMQUU5qc4lioYb981o94AIlKEsBCMAneTIhJuNwnLtYJurcHkhYsF7LjZh
 SnFQvg0g9vzmBj6ROhWw6tQbHqiCB0D0FS4vfRzr668fGSvnAtaQ+UBYZSVSxz/x0VWY
 rwktCz5AVkWU38Eak4gj+6i9K003kfNoHsMHNZHtDnTEhmvO7/htqOASQ6pwzTFryQm1
 KNzrheODBMlcOCzT0hZAx7m9TWWx+LgWUOlshTQEnY6vfnrV12Qzb2RnTQQAF+TOhBbW
 wYrg==
X-Gm-Message-State: AOAM530C6dWTcIZGmrx/NOY8+TJ6HaFhbipHvbTz6TMfBuMTron6hnWM
 FZjtwsp+VsMPQXWNg6kHRF9P5JXWqdBHhduhiiCHfw==
X-Google-Smtp-Source: ABdhPJxp9bL/dpRjep6oSzXrSrLQyAvJNHP/4JIVD2Nmw2274KaUW0BUBBCYHvPhkZ1MtH9NNLIRbSp1VkINIxh9nnw=
X-Received: by 2002:a1c:771a:: with SMTP id t26mr7873488wmi.96.1618220637957; 
 Mon, 12 Apr 2021 02:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092917.831995-1-maxime@cerno.tech>
 <20210318092917.831995-5-maxime@cerno.tech>
 <CAPY8ntBNr6kTRJkaMNmZ+Z9St9oZ=M9qEAKovtKrCCB=wzBZLw@mail.gmail.com>
 <20210409123557.jjntmcuyfadjnv7g@gilmour>
In-Reply-To: <20210409123557.jjntmcuyfadjnv7g@gilmour>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 12 Apr 2021 10:43:42 +0100
Message-ID: <CAPY8ntBC2ctar-LH-HVyQHdmzZYpqxKcEZpBLq8J3vUQiA-_uA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/vc4: hdmi: Enable the scrambler
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 9 Apr 2021 at 13:36, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Thu, Apr 01, 2021 at 12:30:45PM +0100, Dave Stevenson wrote:
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c      | 56 +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
> > >  2 files changed, 59 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index 0924a1b9e186..530c83097b1a 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -35,6 +35,7 @@
> > >  #include <drm/drm_edid.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/drm_simple_kms_helper.h>
> > > +#include <drm/drm_scdc_helper.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/component.h>
> > >  #include <linux/i2c.h>
> > > @@ -76,6 +77,8 @@
> > >  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
> > >  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
> > >
> > > +#define VC5_HDMI_SCRAMBLER_CTL_ENABLE          BIT(0)
> > > +
> > >  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
> > >  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MASK(10, 8)
> > >
> > > @@ -457,6 +460,56 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
> > >                 vc4_hdmi_set_audio_infoframe(encoder);
> > >  }
> > >
> > > +static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
> > > +                                        struct drm_display_mode *mode)
> > > +{
> > > +       struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> > > +       struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> > > +       struct drm_display_info *display = &vc4_hdmi->connector.display_info;
> > > +
> > > +       if (!vc4_encoder->hdmi_monitor)
> > > +               return false;
> > > +
> > > +       if (!display->hdmi.scdc.supported ||
> > > +           !display->hdmi.scdc.scrambling.supported)
> > > +               return false;
> > > +
> >
> > I think I made this comment last time, but possibly not very clearly.
>
> I must have missed it then, sorry :/
>
> > Up to this point in the function is whether the display/hdmi interface
> > *supports* scrambling. The bit after is whether it is *required* to be
> > enabled by the mode.
>
> Thomas made a suggestion to move the mode clock check to a helper, so
> we'll end up with essentially a helper about whether we support
> scrambling or not and if the mode requires it.
>
> > At the moment, if the display/interface supports scrambling but the
> > mode doesn't need it, then the scrambling setup is never touched. That
> > makes a few assumptions about the default settings.
> > Boot with the firmware selecting 4k60 (ie scrambling on), but
> > video=HDMI-1:1920x1080 in the kernel command line and you'll have a
> > mess with scrambling enabled but not signalled.
> >
> > I'd be happier if the display/interface says scrambling is supported
> > then we always call drm_scdc_set_high_tmds_clock_ratio,
> > drm_scdc_set_scrambling and set the VC5_HDMI_SCRAMBLER_CTL_ENABLE
> > register bit appropriately for the mode. Feel free to disagree with me
> > though.
>
> I think part of it is due to our custom helpers never being called
> currently during the boot process. Once that is fixed, the disable
> helpers will be called and will disable the scrambling so we should be
> good there.
>
> This creates another issue though. That function takes the mode as the
> argument and at boot time the mode pointer will be null. I think we can
> work around it by assuming that we need to disable it at boot all the
> time (and thus ignore the test if our pointer is null).
>
> Would that work for you?

Yes, that all sounds reasonable to me.

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
