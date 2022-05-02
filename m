Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F3517198
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A510EFB0;
	Mon,  2 May 2022 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F9A10EFB0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:30:45 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so16237632pju.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aPLRPfFWBxXF9GVBgeuXbuCjN/qYcLZhAGdQR54l0Vw=;
 b=p+lyFRMIQ4mD7XldphCqiCZZVYS1UBSsTzWaiVS6ONblzcl11DqJALyMiBUEIgH+yI
 j/IyvAmmFMIUTgAJnqMlS/7sYNCZWJkfDrHDVE2ubVU/tMnfV3MbrZOkm5A9fJLWUKnv
 jsPS5JYL0yhUq7/cnOOSK6DRCApb+g1UOG0Zm2IKJXQME48xCj7dhs7HW78wW4M3/YBU
 O0ogYK6yHRfHbg2aLjWbwnCBRkIU6X+ptRsxJr/XTsKg+jtKEgOCnrkX7lbgc/7cT1OF
 6j5v99PEtARkA/pLU6BjcKH+0PLODUCOV5O0AIJc2JPoZGS1TtGROseTPna6P60ddEtV
 WwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aPLRPfFWBxXF9GVBgeuXbuCjN/qYcLZhAGdQR54l0Vw=;
 b=lIN6Sw8b+uEg5wNPe7NQdAl4ctKSponSyQM+hUnlcDgV6VX92HfYarWdy+A3Xro/cF
 aSS6ZJ3zdvAYcLPFO3N6a9v+MEiCo7U5+OxJmknL3Vrz+d/7Te5FcJrnbpCs0S+BY9R3
 PmwfjxKzxTdPdG56qiee87ow530Pf8ja43QbJN/bhkHmn0kotODKuJ4t6YQoCCndMsG5
 9PxauPW5+93iTAVpQBce51L5PT/cMPTWXg9UPTWs8kFoCbukCnsT2mtDQfO3ury1Jree
 CFacE4IfVSIwUKShlrCCbUM6MqCZHm1CH/cA+/Ct3tPClFiA3i4gIGzEl90bN8dLj4Os
 0TDQ==
X-Gm-Message-State: AOAM530h5jwHS9yCnOoiGci/FwfEpZv4+OVHZl39Jlpl/xRd1lQm8zWw
 Zg5uKfV9j7OkTPR14zLeY7K4mV/acKYI5jZ1/gZlMQ==
X-Google-Smtp-Source: ABdhPJz/yTsRLswDJMA5EJsC/r7ULf//uumyOTCWHAeqFC9Yse1kBqVgK6qStSlEFNFTHJMzWae/EsOzaD74qlwPxgc=
X-Received: by 2002:a17:903:2286:b0:15d:3251:9ab4 with SMTP id
 b6-20020a170903228600b0015d32519ab4mr11953880plh.21.1651501845482; Mon, 02
 May 2022 07:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
 <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
 <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
 <CAMty3ZDZunQ6J4cwHSDT3uEKEdR3QDEbve6ec=EGG2iYirWGtg@mail.gmail.com>
 <CAG3jFys2WZ8AuNBZBPqDbWU-vPo1ngvzc6wW=MLy13aFBKLRcw@mail.gmail.com>
 <CAMty3ZA0FXiY5atEhAF0VLEDrsZZxrRwFUT1Do3dEZJqt3T_+A@mail.gmail.com>
In-Reply-To: <CAMty3ZA0FXiY5atEhAF0VLEDrsZZxrRwFUT1Do3dEZJqt3T_+A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 May 2022 16:30:34 +0200
Message-ID: <CAG3jFytjhgyX+gA+i5Qm+ga_BKjZnYAUX=wgL-=h-r9yfO=Zrg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 at 11:49, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Robert,
>
> Can you apply this?
>

Thanks for the reminder.

Applied to drm-misc-next.

> On Thu, Mar 31, 2022 at 8:22 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Thu, 31 Mar 2022 at 16:50, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > + Robert
> > >
> > > On Tue, Feb 22, 2022 at 12:17 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > On Mon, Feb 7, 2022 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > >
> > > > > Hi Sam,
> > > > >
> > > > > On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > > >
> > > > > > Hi Jagan,
> > > > > >
> > > > > > On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > > > > > > Hi Sam,
> > > > > > >
> > > > > > > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > > > >
> > > > > > > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > > > > > > recent testing in i.MX8MM platform.
> > > > > > > >
> > > > > > > > Fix it.
> > > > > > > >
> > > > > > > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > > index eb475a3a774b..cf3f21f649cb 100644
> > > > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > > > > > > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > > > > > > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > > > > > > >         .num_modes = 1,
> > > > > > > > -       .bpc = 6,
> > > > > > > > +       .bpc = 8,
> > > > > > >
> > > > > > > Any response on this?
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
>
>
> --
> Jagan Teki,
> Amarula Solutions India Pvt. Ltd.
> Co-Founder & Embedded Linux Architect
> 405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
> M. (+91) 910 009 0959
> [`as] http://www.amarulasolutions.com
