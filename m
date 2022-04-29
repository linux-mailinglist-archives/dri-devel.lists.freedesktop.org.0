Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0EF5145E1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6410E7E2;
	Fri, 29 Apr 2022 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2B710E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:49:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bv19so14397088ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9UxULcHoGgOS/NMLKiV8zEabPqVmVu16nsFoJGyc8o=;
 b=WZyPhfwIfgHgynmC1W9dqtwiOHe9bDhW5TwEjyhxsgPWTrffT64gkYFvunKSTCCdzf
 vUMo1M4n45GJBieTrAYqUej3GKNb7Xuoa9b2U1h1PPiYcytTS8H58g3Vn22nl5MENVJQ
 VZr1mP8KyY7EejekXccTI5FJ1jElgJeTuQD8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9UxULcHoGgOS/NMLKiV8zEabPqVmVu16nsFoJGyc8o=;
 b=CQmyqzdsbhnEusblcILfuDYXX28xReVAxEi7fHhenseu+sCl+XU6bv34j459V/OTrC
 /8BHslhhV0L9o4wf2eg07st9TfUQSrSXUnrdA3w420AwlR3yNJdRESRHoUOh9QTkvd+C
 jtMnsETjh9AlNdBMq/KKhv30hu0xjQbKaPex0NhyHDIYfAEX4KcRMslD/c757cgXHALr
 JG0GwoC9KfoKFtMbSQHfOssPmdR34MTbX+JK4qKbTPoS3vX3VBG2NnO8dL8VnM3GcBtI
 Oq9oIFe181FeZ3Hf424gNUt9Ix6OHTpveiviUoGPStPBoEMS6Q1yCSdmFQT5Id3aYJr8
 Ff4Q==
X-Gm-Message-State: AOAM530w0NOs2fYCD3kHgMzmBoXZT7rE8xciK6iGw4ZJYpoGQjTLvtPf
 AqnpH/G1J9B91Y0dHx418DqtAKnYnGR8cOkl0vF9Kg==
X-Google-Smtp-Source: ABdhPJwVpF/9JHM4eV8idKmf0Hw0s3mtuJNgTCHgOfjmqLbhAhZXL+EkKzmlxnVuBNZ7jhbyvTeegbW8Oz7M1Ic9+u0=
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr36730691ejc.770.1651225779187; Fri, 29
 Apr 2022 02:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
 <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
 <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
 <CAMty3ZDZunQ6J4cwHSDT3uEKEdR3QDEbve6ec=EGG2iYirWGtg@mail.gmail.com>
 <CAG3jFys2WZ8AuNBZBPqDbWU-vPo1ngvzc6wW=MLy13aFBKLRcw@mail.gmail.com>
In-Reply-To: <CAG3jFys2WZ8AuNBZBPqDbWU-vPo1ngvzc6wW=MLy13aFBKLRcw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 29 Apr 2022 15:19:28 +0530
Message-ID: <CAMty3ZA0FXiY5atEhAF0VLEDrsZZxrRwFUT1Do3dEZJqt3T_+A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Robert Foss <robert.foss@linaro.org>
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

Hi Robert,

Can you apply this?

On Thu, Mar 31, 2022 at 8:22 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Thu, 31 Mar 2022 at 16:50, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > + Robert
> >
> > On Tue, Feb 22, 2022 at 12:17 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Mon, Feb 7, 2022 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Hi Sam,
> > > >
> > > > On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > >
> > > > > Hi Jagan,
> > > > >
> > > > > On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > > > > > Hi Sam,
> > > > > >
> > > > > > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > > >
> > > > > > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > > > > > recent testing in i.MX8MM platform.
> > > > > > >
> > > > > > > Fix it.
> > > > > > >
> > > > > > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > index eb475a3a774b..cf3f21f649cb 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > > > > > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > > > > > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > > > > > >         .num_modes = 1,
> > > > > > > -       .bpc = 6,
> > > > > > > +       .bpc = 8,
> > > > > >
> > > > > > Any response on this?
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>



-- 
Jagan Teki,
Amarula Solutions India Pvt. Ltd.
Co-Founder & Embedded Linux Architect
405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
M. (+91) 910 009 0959
[`as] http://www.amarulasolutions.com
