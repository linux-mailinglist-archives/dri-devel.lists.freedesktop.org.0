Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B278F9350D3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8510EA76;
	Thu, 18 Jul 2024 16:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VXOYRJYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC610EA73
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:45:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso34559a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721321114; x=1721925914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVzXycChnKr63nEwcjziKm5NEqOOi3cFRrHO2p0Rnx0=;
 b=VXOYRJYv1vfO54fUMEv695TEtbuAAN5kd1EiouMo0A+L+UCxn2DZFjhwJOsOuzT4EP
 w3b53N4gU1QCyjreXNbDxS5jkLfgCMtD7Ppu5vm9VPwAKiefofl+uCGBNQtSeEmJLEvq
 Ezs0GMNPva9aUQOIQdqoXX0mbWSNZEbbpIGmcApTjCAdnzmKhkiqpyriGfEx0YuXdtnm
 1qn3nECPlhHl1NITA0kiH3umloe0XgmGWBrL9ZeriDV+tM8PrPZLkKx0yQ6HQXuA+Ih6
 ZoWczRWp9lG4u2TAp3dfr93GsmvqNpgjQ5MGdXTUH0KyaoulFXHugQtcrJLghfNKpDMN
 Paiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721321114; x=1721925914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVzXycChnKr63nEwcjziKm5NEqOOi3cFRrHO2p0Rnx0=;
 b=Zfuj8TI6C4VdkFe0CxIdhejlQcfzYylNt85skMsDJZwDWppvtSrVy8/+fWOnY4b6MH
 oVWyyBrMJsfiU/5dau+EyH805tIs3P1CmXMVJulbOAU7kh9eg0XUGxfD61NBKjEDsV10
 m1ZpQ2Ngz2z7Mjwf/fKDqnVwQgngzUwQDnaB88u5wE7FkKNCfgh/tAT2yG1vKunLT5MF
 L+1PcQGtdcY+Ob6JGkn8s/Ng2Mzj7xwjiWuKyVavPu5lnnkmAGSudrX2JUluTO6uKzkt
 Wtp5iTvg+c8eexgCpjVWa4tuHiIz+sS3stuw11ZxbP+5R7WV5q3FvX+l9Jvc5xSgJ5ny
 VSRw==
X-Gm-Message-State: AOJu0YwD+uygRyl82TiuOP/0/rYWdV4MqtVYtMmaIY6lB9VHS9x9Tb64
 /cnPXXzsloJq+sissSDCnZngqfkmmyzO6MmLAyTb1ojrP53AZ8zacrGWcIHY7sTzFHx0Py+Pq5b
 WDeanvU7qzq8YoMpPRSYyz5NzwFg=
X-Google-Smtp-Source: AGHT+IGuTcqmmeJDdC8he/jrXxZHods4xE5TAOJqnQw6+GlV83nW2Pca/3os5Hoj6/X5RM55Q56rhdNym2wbZFaOuhU=
X-Received: by 2002:a50:99d7:0:b0:584:a6f8:c0c5 with SMTP id
 4fb4d7f45d1cf-5a0589c99c0mr3821440a12.0.1721321113717; Thu, 18 Jul 2024
 09:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
 <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
 <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 09:45:01 -0700
Message-ID: <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 9:25=E2=80=AFAM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chr=
omium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmai=
l.com> wrote:
> > > > > >
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Just a guess on the panel timings, but they appear to work.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I=
 couldn't
> > > > > > find any datasheet so timings is just a guess.  But AFAICT ever=
ything
> > > > > > works fine.
> > > > > >
> > > > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > Given that this is a Samsung ATNA<mumble>, is there any chance it=
's an
> > > > > OLED panel? Should it be supported with the Samsung OLED panel dr=
iver
> > > > > like this:
> > > > >
> > > > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31=
b7f2f658a3@linaro.org
> > > >
> > > > it is an OLED panel, and I did see that patchset and thought that
> > > > samsung panel driver would work.  But changing the compat string on
> > > > the yoga dts only gave me a black screen (and I didn't see any of t=
he
> > > > other mentioned problems with bl control or dpms with panel-edp).  =
So
> > > > :shrug:?  It could be I overlooked something else, but it _seems_ l=
ike
> > > > panel-edp is fine for this panel. Plus, it would avoid awkwardness =
if
> > > > it turned out there were other non-samsung 2nd sources, but so far
> > > > with a sample size of two 100% of these laptops have the same panel
> > >
> > > Hmm, OK. One question for you: are you using the "enable" GPIO in
> > > panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> > > dodgy, but it predates my deeper involvement with panels. I've never
> > > seen an eDP panel that could use panel-edp where it was actually
> > > required--every instance where someone thought it was required was
> > > better modeled by using that GPIO as the backlight enable. On the
> > > other hand, the "enable" GPIO in the Samsung OLED panel driver came
> > > straight from the panel datasheet and it makes sense for it to be in
> > > the panel driver since the backlight is handled straight by the
> > > panel...
> >
> > hmm, at least current dts doesn't have an enable gpio.  Which could be
> > why panel-samsung-atna33xc20 wasn't working.
> >
> > It is entirely possible we are relying on something left on by the boot=
loader.
>
> That would be my best guess. Is there any way for you to find out if
> there's an enable GPIO?

presumably it would be in the ACPI dump (which I've not much of a clue
what I'm looking for there)

BR,
-R

>
> > > In any case, I guess if things are working it doesn't really hurt to
> > > take it in panel-edp for now...
> > >
> >
> > I wonder if using compatible=3D"edp-panel" everywhere isn't a great ide=
a
> > if we want to switch drivers later.  But I guess that is already water
> > under the bridge (so to speak)
>
> For panels that aren't OLED it's all very standard and we're kinda
> forced to use something generic since manufacturers want lots of 2nd
> (and 3rd and 4th and ...) sourcing. As far as I've been able to tell
> you can't do 2nd sourcing between OLED panels and other panels since
> the wires hooked up to the panels are a little different for the OLED
> panels and the power sequencing is a bit different. It would also be
> pretty obvious to an end user if some of their devices had an OLED
> panel and some didn't. I'm not aware of OLED panels other than the
> Samsung ones, but I haven't done any real research here...
>
> -Doug
>
