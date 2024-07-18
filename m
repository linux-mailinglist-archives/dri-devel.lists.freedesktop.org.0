Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11739350AA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4102210E187;
	Thu, 18 Jul 2024 16:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Td/HEUeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B7810E187
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:25:54 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2eeb2d60efbso15028861fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721319953; x=1721924753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJQIRnbTYy2sGZ5gk+HAHZWSmrPa0UShn83IpJ2tEh4=;
 b=Td/HEUeTYq5YMhEX21/Dvczw20oVJWdrfrOKE09GsaQYcK1sjApTY1HrAibILlHsC8
 zNi0ugKjwW5EA3TrU5X4natdfM2MvBBz5Kee0PkCQ26LcDQTc8p7pqvm5fPl50wqFNYQ
 40svb3Ud+m/vPquuYIsR7pajk6NRYeEpqzNIck/MHohyG178HOlyF7RVYQYi5/r0pJNX
 rPK0GJulucJp/hLpyrU35wJ4oHqmVf2xem42ZL4rnqRkIjwcYhXh1XZgp/aq90JJURDa
 luQqaF4U1wbGkONFrne8fmvTozhye+71C8ppRLybs4TRjM9ZGPh5oWybvchV9CLUU/N3
 q8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721319953; x=1721924753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJQIRnbTYy2sGZ5gk+HAHZWSmrPa0UShn83IpJ2tEh4=;
 b=bsdrgDwJeubZiDnW785Cy5co2on7OI9w2RDgiPM+c/nw9jMeE9y+aDDXS1SNrzDeyw
 KkGtxDZcHU0r+G/+RGyOt1sLKnraf5CuHIMlzMFJwyKgPNGatC0ANWFt2uBtCijdlseN
 Y/PFGGRYUbzAGyIUtYHVR+4HGu4DF9Hxi4JKG6RsrnRyCtNVIWq2xgKP2+4OsfKTqJWw
 61AN71vM53L2lnpeqID9qo9poAuN6j3/9X+eTPMWAcC2PxTVRg8x9X+1p15sDUNXBLHq
 ByruUzyhZKlNdFi8jMXrMe5pVQ2/STGVVyst4czRii/aJakfLzKrU0g4N/rDFcmi/7gz
 XB9Q==
X-Gm-Message-State: AOJu0YwVzt1ApbSerCQqV64QWAkFuXkSgXGbpKivIPQzqzcKvj3BgnUu
 mDiM+s4+xeczns0jkeBmQVue6D7PqoQeiM2/CE32yy0XOTACztxFk/0QjLID/hsi6nA3dFIDJXK
 Y/9zjpZro+txC6i1P+BM7ce+60/M=
X-Google-Smtp-Source: AGHT+IG+LN9SE1sQOAD4WTHQhFN5BbXkqVEFuPvsEPI+d/27gk+W67iADV6K6CnQBlGKixrjKAEdN1ZkXxCckNCAcNU=
X-Received: by 2002:a2e:a541:0:b0:2ee:7dfe:d99c with SMTP id
 38308e7fff4ca-2ef05d2ed3fmr24920861fa.31.1721319952621; Thu, 18 Jul 2024
 09:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
In-Reply-To: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 09:25:39 -0700
Message-ID: <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Just a guess on the panel timings, but they appear to work.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I cou=
ldn't
> > > > find any datasheet so timings is just a guess.  But AFAICT everythi=
ng
> > > > works fine.
> > > >
> > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Given that this is a Samsung ATNA<mumble>, is there any chance it's a=
n
> > > OLED panel? Should it be supported with the Samsung OLED panel driver
> > > like this:
> > >
> > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2=
f658a3@linaro.org
> >
> > it is an OLED panel, and I did see that patchset and thought that
> > samsung panel driver would work.  But changing the compat string on
> > the yoga dts only gave me a black screen (and I didn't see any of the
> > other mentioned problems with bl control or dpms with panel-edp).  So
> > :shrug:?  It could be I overlooked something else, but it _seems_ like
> > panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> > it turned out there were other non-samsung 2nd sources, but so far
> > with a sample size of two 100% of these laptops have the same panel
>
> Hmm, OK. One question for you: are you using the "enable" GPIO in
> panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> dodgy, but it predates my deeper involvement with panels. I've never
> seen an eDP panel that could use panel-edp where it was actually
> required--every instance where someone thought it was required was
> better modeled by using that GPIO as the backlight enable. On the
> other hand, the "enable" GPIO in the Samsung OLED panel driver came
> straight from the panel datasheet and it makes sense for it to be in
> the panel driver since the backlight is handled straight by the
> panel...

hmm, at least current dts doesn't have an enable gpio.  Which could be
why panel-samsung-atna33xc20 wasn't working.

It is entirely possible we are relying on something left on by the bootload=
er.

> In any case, I guess if things are working it doesn't really hurt to
> take it in panel-edp for now...
>

I wonder if using compatible=3D"edp-panel" everywhere isn't a great idea
if we want to switch drivers later.  But I guess that is already water
under the bridge (so to speak)

BR,
-R

> > But that was the reason for posting this as an RFC.  I was hoping
> > someone had some hint about where to find datasheets (my google'ing
> > was not successful), etc.
>
> I don't personally have any hints.
>
> -Doug
>
