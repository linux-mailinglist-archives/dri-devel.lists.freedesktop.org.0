Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9488D391
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0B910F5BF;
	Wed, 27 Mar 2024 00:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AzIx4Cpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059510F27D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:14:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d28051376eso109177661fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711484072; x=1712088872;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iO8swokNExt5uM0KuXsZb2dbMqnfFCSo+oQMl3kSWgI=;
 b=AzIx4CplBcRnreSWsTkzlMGA3ar6ex69G4jABJblIge+Q7l+z/Jy6QSjXIlAec2Ayu
 AKcuaFOhl94tkFB8GjDcGr7fPjKuHLKbzGEJLFj4Nu0SfBTQw2jyTgBwmvkzU8QYHM+z
 HJ4MnC3g0X6uQKlWGCnU2cadapEQpuOM41VJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484072; x=1712088872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iO8swokNExt5uM0KuXsZb2dbMqnfFCSo+oQMl3kSWgI=;
 b=nVl+xABTeEUdK5EjFMqRPDW91R+lBkRg4mpTZUCJMES7bYbM/ECzHGlsr6NjSaTyW+
 96ZSprDcE+ctO5/BFzymTpZiBFXWZoyyW4xGe6hEaQ7+IuJWQrHRHjuX0jdU1Rr3V4yt
 0gXqRoutJqU0bzTN9PcMWBiPX0yQaG7Hyyolv6LTOwgA4wzpF5UhFvSek5IKkpDHoNu2
 XNRRIFoqO1l/mzRqhZtlNoxoWqgcijiE+fUZwBkkjKFzNletQfG4YF1iRpSC6bE7kvZN
 XEvHCG8Wp/in1nJwIU3q3w5TfRRWXOO8aBKrHziLFGvZA9WbnJBIsxFk3zqiTlnheUZp
 ZMpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl7gVQDsjUc/ZJyfgdqjSJRvnN3RPfLt8vMZbBr2qvgYmLGOVS9h8Zf5MUbldlZvABkSwXZEWT8GVh5DOWPlg9TH9M9XsCX1vY+BCIt484
X-Gm-Message-State: AOJu0YwoYssCq/cF/fdysrE1A1EF2Bf7YVDAaZGV1qBu5fFqcGAa93EE
 ZaAig+e9GMKv4R1e3k61Y68QbqAPCR2Ge3nyLwKnItp+3lJgSHWniQkc2Mnn2KXrBrBqtZG/IkE
 QtTGQTmkkaesNsjI5YrWJbqMwjEnQaF/aBPau
X-Google-Smtp-Source: AGHT+IHxTBz/68y3jhfEeUO9ZdOmKq9v2dvXkfU+RGzDe/g5hDzj7GRKxNtQ8adifXRm3O3/4QUTc+PHKlXmwXHX9Sc=
X-Received: by 2002:a05:651c:1032:b0:2d6:f372:aba7 with SMTP id
 w18-20020a05651c103200b002d6f372aba7mr606602ljm.39.1711484072140; Tue, 26 Mar
 2024 13:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-8-imre.deak@intel.com>
 <8d6ff583-aa7f-4279-8200-cd5a79b85534@intel.com>
In-Reply-To: <8d6ff583-aa7f-4279-8200-cd5a79b85534@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Tue, 26 Mar 2024 13:14:21 -0700
Message-ID: <CAE72mN=4KCNsDimBYMQ80Y0NixuVKrWkiup3nPFWY=aNYm-3dg@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/dp: Add drm_dp_uhbr_channel_coding_supported()
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Mar 2024 00:59:10 +0000
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

Reviewed-by: Manasi Navare <navaremanasi@chromium.org>

Manasi

On Tue, Mar 26, 2024 at 5:54=E2=80=AFAM Nautiyal, Ankit K
<ankit.k.nautiyal@intel.com> wrote:
>
>
> On 3/21/2024 1:41 AM, Imre Deak wrote:
> > Factor out a function to check for UHBR channel coding support used by =
a
> > follow-up patch in the patchset.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>
> LGTM.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> > ---
> >   drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
> >   include/drm/display/drm_dp_helper.h     | 6 ++++++
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index dbe65651bf277..1d13a1ba2b97d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -217,7 +217,7 @@ static void intel_dp_set_dpcd_sink_rates(struct int=
el_dp *intel_dp)
> >        * Sink rates for 128b/132b. If set, sink should support all 8b/1=
0b
> >        * rates and 10 Gbps.
> >        */
> > -     if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128=
B132B) {
> > +     if (drm_dp_uhbr_channel_coding_supported(intel_dp->dpcd)) {
> >               u8 uhbr_rates =3D 0;
> >
> >               BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZ=
E(dp_rates) + 3);
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/=
drm_dp_helper.h
> > index a62fcd051d4d4..150c37a99a16f 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -221,6 +221,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_R=
ECEIVER_CAP_SIZE])
> >       return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
> >   }
> >
> > +static inline bool
> > +drm_dp_uhbr_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZ=
E])
> > +{
> > +     return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
> > +}
> > +
> >   static inline bool
> >   drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SI=
ZE])
> >   {
