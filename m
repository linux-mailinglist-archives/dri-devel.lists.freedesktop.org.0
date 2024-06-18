Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC05490DB64
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 20:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA1C10E626;
	Tue, 18 Jun 2024 18:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="W8iqvRZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D0C10E626
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 18:15:47 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e02a6d4bdbeso872450276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718734546; x=1719339346;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jtl0YwxpnQSmyQA35BX0oEDMXcpsQEl4MuZCPATz/eI=;
 b=W8iqvRZe5Gm10wVlZpqooEdB78q8Io9DTio5isbw0gzFW77pjHVHRcnLIEGQ5s/XZF
 OZs4N6TxSxVAEi0mbZ5uAPWaFSQawYES4ebqQheyFt5JCHcoTXpyjli2lOAFYJV6/OXz
 wOmPzm1ZrZOymTfh8FHBN1iehl0rphUQqNSd6a120wE1LwPg8r4f9UbyvOSRZ+1tzM0Q
 WeQEysKKDbOYNQLnQnnFCXjFl1SqQYv9VEuSDD4EbPtWJk3K7siLzFkCLoV7V4UcpUra
 4EHfw9RRnY/mZK8EHlxrPqnzx8vdjt26BZw4mj9GZ3fAfKty2DaUtpfKoptpeBK1rzfq
 Rnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718734546; x=1719339346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jtl0YwxpnQSmyQA35BX0oEDMXcpsQEl4MuZCPATz/eI=;
 b=hJIqL6tDTdDlEnyXBKxNpT2yPDLzx6AuJZhPmfHw2hmw8F0H51t2Myt/OimVTtTx7I
 vK8BYMPu5fgF10XZV72nC6T8gZ1Bra0nE9fN3bIPNGLV2kP5YfxO9eQ3Byddot0/F/du
 TwoaOYLV2u4ZjS011UpzLgovz2jtAKY3GSjdvF3wgZzW61S+/UEyFeFZdJiwkLYcnhzR
 OlaorO5H65nATGHGvxAluQi699277eaxWMzUu44oWC6xVSirNCsftiogES2fsnEEaSvy
 e6HO4cMtMfQc62LPLAvarCE8Cs2TvCm8Mvgk/gceLsdybfIVwO0jQ+IIj2+1Q/mYybNq
 2zYQ==
X-Gm-Message-State: AOJu0YyJYcKYSt4SkRonU9HumjMLhXvrnBnYHHCGsUrIQzZWPvIcVogd
 fcs5D7AKQKnKHsPN5Me3MeK675d0UbAvLdnn91MWqNe8yMOBLxHzNfO/Cz3evPLZIWt6rhAg0T9
 mEsfFV3pHhvoSdRjR8TAP4Qo2tKfkoF4rFhoA0A==
X-Google-Smtp-Source: AGHT+IHmrWpty+uZNG8l6Y6nntq6TuJuzEHcsxZn8HPlwYpA43Ouh1IkkS5iMQoGIhRntn+kiJ1mHv2MxJEotlet/mQ=
X-Received: by 2002:a25:ea49:0:b0:dfd:ff0b:15f7 with SMTP id
 3f1490d57ef6-e02bdf60f3amr704008276.0.1718734546277; Tue, 18 Jun 2024
 11:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-3-dave.stevenson@raspberrypi.com>
 <20240618-sly-wealthy-nyala-b9cd1f@houat>
In-Reply-To: <20240618-sly-wealthy-nyala-b9cd1f@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 18 Jun 2024 19:15:29 +0100
Message-ID: <CAPY8ntDoyAz4yAh=D3SF8rnvaMjjmjg=eD3HuDJAzftNQ4fc9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/vc4: Add monochrome mode to the VEC.
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Tue, 18 Jun 2024 at 10:28, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Fri, Feb 16, 2024 at 06:48:56PM GMT, Dave Stevenson wrote:
> > The VEC supports not producing colour bursts for monochrome output.
> > It also has an option for disabling the chroma input to remove
> > chroma from the signal.
> >
> > Now that there is a DRM_MODE_TV_MODE_MONOCHROME defined, plumb
> > this in.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_vec.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> > index 268f18b10ee0..f9e134dd1e3b 100644
> > --- a/drivers/gpu/drm/vc4/vc4_vec.c
> > +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> > @@ -234,6 +234,7 @@ enum vc4_vec_tv_mode_id {
> >       VC4_VEC_TV_MODE_PAL_60,
> >       VC4_VEC_TV_MODE_PAL_N,
> >       VC4_VEC_TV_MODE_SECAM,
> > +     VC4_VEC_TV_MODE_MONOCHROME,
> >  };
> >
> >  struct vc4_vec_tv_mode {
> > @@ -324,6 +325,22 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> >               .config1 = VEC_CONFIG1_C_CVBS_CVBS,
> >               .custom_freq = 0x29c71c72,
> >       },
> > +     {
> > +             /* 50Hz mono */
> > +             .mode = DRM_MODE_TV_MODE_MONOCHROME,
> > +             .expected_htotal = 864,
> > +             .config0 = VEC_CONFIG0_PAL_BDGHI_STD | VEC_CONFIG0_BURDIS |
> > +                        VEC_CONFIG0_CHRDIS,
> > +             .config1 = VEC_CONFIG1_C_CVBS_CVBS,
> > +     },
> > +     {
> > +             /* 60Hz mono */
> > +             .mode = DRM_MODE_TV_MODE_MONOCHROME,
> > +             .expected_htotal = 858,
> > +             .config0 = VEC_CONFIG0_PAL_M_STD | VEC_CONFIG0_BURDIS |
> > +                        VEC_CONFIG0_CHRDIS,
> > +             .config1 = VEC_CONFIG1_C_CVBS_CVBS,
> > +     },
> >  };
> >
> >  static inline const struct vc4_vec_tv_mode *
> > @@ -351,6 +368,7 @@ static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
> >       { VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> >       { VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> >       { VC4_VEC_TV_MODE_SECAM, "SECAM", },
> > +     { VC4_VEC_TV_MODE_MONOCHROME, "Mono", },
> >  };
> >
> >  static enum drm_connector_status
> > @@ -406,6 +424,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
> >               state->tv.mode = DRM_MODE_TV_MODE_SECAM;
> >               break;
> >
> > +     case VC4_VEC_TV_MODE_MONOCHROME:
> > +             state->tv.mode = DRM_MODE_TV_MODE_MONOCHROME;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -453,6 +475,9 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
> >               *val = VC4_VEC_TV_MODE_SECAM;
> >               break;
> >
> > +     case DRM_MODE_TV_MODE_MONOCHROME:
> > +             return VC4_VEC_TV_MODE_MONOCHROME;

I have got an error here - it should be
 *val = VC4_VEC_TV_MODE_MONOCHROME;
  break;

> > +
> >       default:
> >               return -EINVAL;
> >       }
>
> We don't need to expose the new value here, that property is only for
> the legacy, driver-specific property. So you should only need the
> vc4_vec_tv_modes changes

As both properties share the same underlying value, that means that if
the new property selects Monochrome, the legacy one will return
-EINVAL as it is an unknown value.

modetest and kmsprint -p both bomb out in this situation as by the
looks of it we fail to get a pointer to the connector returned. That
means you can't switch it back again.

Am I missing something?

  Dave
