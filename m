Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378B93516D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A4B10EA9A;
	Thu, 18 Jul 2024 18:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IR8NrL3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFB010EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:01:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so202219a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721325713; x=1721930513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XwjCmIgC9amJezzYNa7Vvk7vm/b0+JIIKpP0FzU5Lwk=;
 b=IR8NrL3tLnFIFA6M/AeKfjqXwZDkqI0YyNrMrskDB4OJXKWx5EljGMGYKtKn+6ZfoW
 BlmilY3/5XLlZH33CvEVAS9XTql82zS22HTWDJGLpUL+FvKmvblFCDRGMRwt9cqVqz39
 G2nRCu5T9O8rPRDTfrhRRw4bKZ4DfjkNJBSCcUSnlSAoCmW/VQ/GobU1CB6IFPpXR2g+
 t2EVuapMk5StgITTEuZFqoZMEcaYzUOcaQWTOqHSFHu1XkY03rkeeLuYOlfiOBahK/r0
 7/Umr/wPW+HDzGpwhuEh5CZwKg2eTMbzeUGpS4OEwIaozF4dqTlbTx4pvSp/mJgJHOBd
 IRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721325713; x=1721930513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XwjCmIgC9amJezzYNa7Vvk7vm/b0+JIIKpP0FzU5Lwk=;
 b=pKwz/OMdJCvzN85HOCjsiXvjt7EoMOHUGw5QJlv/skGL+HPvxXWsivXqvHyfeDUo0t
 qmkIt+ehajhw9l+Y6KQ+gq8W3Y1z/grytjl/Cdwetn8xj0A12a1VCzeI1H3Nuw0HD4wu
 JFKD5VZk09Piv+miHIkCm5NhJybIyld1dCVyD6jERqFyB2a2g8HxsM1Yd8gcg1t7gfzO
 rvSckKIQ2VjK4XBGpBpE1qknrfbgddcx6YXw1F5QrLKQ1nYGTQfcIgHKIlTKOMtVDodZ
 xPK1jF9m1phNAsSAQbL5RmICpeOkor7NWJ6duO7Moz5lTJKyJ/2u+p6RdgboHkTF5oFQ
 4Wmg==
X-Gm-Message-State: AOJu0YyPE/ZBdxLiNQh2bmSBcJL3L7cDXfyvc1Khwb/13o3IPFzkCfAw
 nJevG+lIQNZY0rW+jTIGv9YaoNUuNJN18ksX48uUztzYOP4o474UEXqSphCczvRFEovLhBeiNex
 uaoLIA5D867W/krkCGdl0zlWaK4E=
X-Google-Smtp-Source: AGHT+IHnyhuY0wD7m5Nhg4/s+kP6IlMtQQiwPdS+LG//Il46Tc6q1VnUyZx7kaXZOUYWOB0F5U4b854qcA8dUvrJxkA=
X-Received: by 2002:a50:c05b:0:b0:57d:455:d395 with SMTP id
 4fb4d7f45d1cf-5a2caf4e97fmr70266a12.7.1721325712440; Thu, 18 Jul 2024
 11:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
 <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
 <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
 <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 11:01:40 -0700
Message-ID: <CAF6AEGuKbzXxzUJS58pBomExNOOoPR7T64rBKuCrLYLW0e7MCA@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:45=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Jul 18, 2024 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Jul 18, 2024 at 9:25=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@c=
hromium.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gm=
ail.com> wrote:
> > > > > > >
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Just a guess on the panel timings, but they appear to work.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > ---
> > > > > > > This adds the panel I have on my lenovo yoga slim 7x laptop. =
 I couldn't
> > > > > > > find any datasheet so timings is just a guess.  But AFAICT ev=
erything
> > > > > > > works fine.
> > > > > > >
> > > > > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > Given that this is a Samsung ATNA<mumble>, is there any chance =
it's an
> > > > > > OLED panel? Should it be supported with the Samsung OLED panel =
driver
> > > > > > like this:
> > > > > >
> > > > > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-=
31b7f2f658a3@linaro.org
> > > > >
> > > > > it is an OLED panel, and I did see that patchset and thought that
> > > > > samsung panel driver would work.  But changing the compat string =
on
> > > > > the yoga dts only gave me a black screen (and I didn't see any of=
 the
> > > > > other mentioned problems with bl control or dpms with panel-edp).=
  So
> > > > > :shrug:?  It could be I overlooked something else, but it _seems_=
 like
> > > > > panel-edp is fine for this panel. Plus, it would avoid awkwardnes=
s if
> > > > > it turned out there were other non-samsung 2nd sources, but so fa=
r
> > > > > with a sample size of two 100% of these laptops have the same pan=
el
> > > >
> > > > Hmm, OK. One question for you: are you using the "enable" GPIO in
> > > > panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> > > > dodgy, but it predates my deeper involvement with panels. I've neve=
r
> > > > seen an eDP panel that could use panel-edp where it was actually
> > > > required--every instance where someone thought it was required was
> > > > better modeled by using that GPIO as the backlight enable. On the
> > > > other hand, the "enable" GPIO in the Samsung OLED panel driver came
> > > > straight from the panel datasheet and it makes sense for it to be i=
n
> > > > the panel driver since the backlight is handled straight by the
> > > > panel...
> > >
> > > hmm, at least current dts doesn't have an enable gpio.  Which could b=
e
> > > why panel-samsung-atna33xc20 wasn't working.
> > >
> > > It is entirely possible we are relying on something left on by the bo=
otloader.
> >
> > That would be my best guess. Is there any way for you to find out if
> > there's an enable GPIO?
>
> presumably it would be in the ACPI dump (which I've not much of a clue
> what I'm looking for there)
>

Ok, turns out it is wired up the same way as on the crd.. if I copy
those then panel-samsung-atna33xc20 is working

BR,
-R

> >
> > > > In any case, I guess if things are working it doesn't really hurt t=
o
> > > > take it in panel-edp for now...
> > > >
> > >
> > > I wonder if using compatible=3D"edp-panel" everywhere isn't a great i=
dea
> > > if we want to switch drivers later.  But I guess that is already wate=
r
> > > under the bridge (so to speak)
> >
> > For panels that aren't OLED it's all very standard and we're kinda
> > forced to use something generic since manufacturers want lots of 2nd
> > (and 3rd and 4th and ...) sourcing. As far as I've been able to tell
> > you can't do 2nd sourcing between OLED panels and other panels since
> > the wires hooked up to the panels are a little different for the OLED
> > panels and the power sequencing is a bit different. It would also be
> > pretty obvious to an end user if some of their devices had an OLED
> > panel and some didn't. I'm not aware of OLED panels other than the
> > Samsung ones, but I haven't done any real research here...
> >
> > -Doug
> >
