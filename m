Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAF4EDC15
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0F10E031;
	Thu, 31 Mar 2022 14:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1A10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:50:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u26so28430746eda.12
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pmuAuLQzdn+XVtK6xVU7zKlZLZJZMIBp6b0gMjok/o=;
 b=VSPdvVtKMMWAb1J9nTBAhlgeqoufx9bMtmsO0K+d8klXJDnQhIQwqFHW5UJPtXfCdz
 edkBmF2Wf0wMfXd1l80dHDrIgIAu6TkIXnH3C/VD4Oi8/FJywIHxYVc4185dNAdrsQlq
 2lpvsCvlPzaxZN4wJaqvEtwQFdSOfVmQcTieQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pmuAuLQzdn+XVtK6xVU7zKlZLZJZMIBp6b0gMjok/o=;
 b=zVgCJ86K1OnnOjY0E2bVYN/Iq8ucgedZjqhOjzTJdmBM9gg/fkD51HtbJuNlZ/hPY1
 OX2qE1yX0ptGZO6XOkDSbP0iezb3RRs1PxulEv3Ehs736T3BWHoI0iItoDMI9VWr+Qwg
 Y1oGBzW1l0eg60APG/D7mdPq2WUU4KYR41nu4jGECo8mC2QQjM14C0hl0BazWc4G14g5
 tkUby4q1Abz9a/m63RXKdrNS6LWVoyZQ0U/qwqpa3wiCByLE+S0BLwq3CpcqIOlc3K9p
 LXfkix8UvaySRBduRDmCO/YCOOzquFnn3HcavzugMvh9FxDt2GLdLWmjJ1LBpGpcAB9V
 JsqQ==
X-Gm-Message-State: AOAM532xNZ6xGf+DqSAIw/14wQH+WaDyEnLyaa4k8PL0G2XuDekuyOUA
 teZFiKakZ0qRLVyedvAk7hD2tlbzznTA+iU4Iz7oTQ==
X-Google-Smtp-Source: ABdhPJx75pCf5RMlAD/tCrw4kF/ucZic5jgpAiBvPSDoRw1qYMCOVUEWjcVSQISBJw9ar47w/VKLFT8qTloNWXCFIc0=
X-Received: by 2002:a05:6402:4407:b0:419:3859:697e with SMTP id
 y7-20020a056402440700b004193859697emr16940493eda.400.1648738224663; Thu, 31
 Mar 2022 07:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
 <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
 <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
In-Reply-To: <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 31 Mar 2022 20:20:13 +0530
Message-ID: <CAMty3ZDZunQ6J4cwHSDT3uEKEdR3QDEbve6ec=EGG2iYirWGtg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Robert

On Tue, Feb 22, 2022 at 12:17 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Mon, Feb 7, 2022 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Sam,
> >
> > On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Jagan,
> > >
> > > On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > > > Hi Sam,
> > > >
> > > > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > >
> > > > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > > > recent testing in i.MX8MM platform.
> > > > >
> > > > > Fix it.
> > > > >
> > > > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > ---
> > > > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > > index eb475a3a774b..cf3f21f649cb 100644
> > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > > > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > > > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > > > >         .num_modes = 1,
> > > > > -       .bpc = 6,
> > > > > +       .bpc = 8,
> > > >
> > > > Any response on this?
> > >
> > > I am too busy with other stuff at the moment to spend time on Linux
> > > stuff, but expect to re-surface sometime after xmas.
> >
> > Any further comments?
>
> Gentle Ping.
