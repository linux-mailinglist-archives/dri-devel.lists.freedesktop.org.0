Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B57C4965
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 07:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB4610E453;
	Wed, 11 Oct 2023 05:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAF10E453
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 05:47:45 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-694f3444f94so5383653b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697003265; x=1697608065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1z5BV/1nAQApTMZ3kIv0n5k/QlyXTmBO9Apt2IJE9I=;
 b=tFlIahqqkOAGKJatm4VvMucS+4V9V8V19NPGJlRH7Mk+RG4nK+tFkOEkAfgK5HSPgF
 WVYVMLdw4lIOKiktZEnGGUR5bAnFJHNDlkGgWJD9Lx496JnJJDI1pvHplI7yViNpop1i
 96gj2TEJTrv6qMyIBcPERni9FUHJwdOzISE04JkXh9TOrLTic56E6jcC8PIlYogqxhdJ
 7A05o6pYoJtJYrIjNAWg0DOF2JkDyFP7sNPdZwfd8jiB6yOfy51tj4dpV8umDDHXTv+s
 ZfZUR6R/Z4UjnwddSr3lHqhRFTQlupVEOdYwwvoCUZWwy5s7oLkNPN6fcmflxbNgU0Zs
 Mrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697003265; x=1697608065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1z5BV/1nAQApTMZ3kIv0n5k/QlyXTmBO9Apt2IJE9I=;
 b=GQXVY0gE/ZqUL0uDW40eLpWpTVQT/kIhx9bffpAv4CH4LeTOwqmyr8kjMI/1/Ajy0M
 lI6Z88HHDH94lrGm7ADxYIxrBvMMxAFFrAW/XNbf75wvl98z5GJLmNQXTgTl6bFM/A0P
 2z/se37cX8d08jJDJx/QPh9eGUTStme1NgLCfxJvq3wGdP0ewcazm0GW8WhRA1tAikrd
 h559Yml2kxQi7C3nTIk2qNB07QirpwzY5/HopCS/BrqI8Ch2X/UZQcq7MVbk9bfTWjPF
 2asfl+C72gXBueWTtjrOMuEVN6mOeuVQunrVb7yzbBjuFr6Kicf1GhFdRiRfvQFCH+WB
 XNUA==
X-Gm-Message-State: AOJu0Yz+lcnTlShM4tFpVKwjC5zZ9kNcpeTEA+5PjZSM7eyEOsriLlhq
 asCzV7teq+0STPakSNWd1ITB1PpyCchgXG2Zxho6BQ==
X-Google-Smtp-Source: AGHT+IHtKbcxKIGkPvwbnn563Fvst0cY7hetX0wRRlTzsC9gEczzpM8H2HoRC37CEc9JQvVElxuWIK/0GajJr8wJZYI=
X-Received: by 2002:a05:6a20:6a0c:b0:13a:59b1:c884 with SMTP id
 p12-20020a056a206a0c00b0013a59b1c884mr22303408pzk.40.1697003264899; Tue, 10
 Oct 2023 22:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
 <CAHwB_N+=h8-5H6SM8REAge19SgLvrZD=drAP83QnSuuqB5gN8A@mail.gmail.com>
 <CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com>
In-Reply-To: <CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 11 Oct 2023 13:47:33 +0800
Message-ID: <CAHwB_NLJKiQPy=Y_kRwBNqhvaR1y-O9QYvaC=Y8PbymTygdJsg@mail.gmail.com>
Subject: Re: [v1 2/2] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 11, 2023 at 3:11=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Tue, Oct 10, 2023 at 4:36=E2=80=AFAM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 10, 2023 at 4:44=E2=80=AFAM Doug Anderson <dianders@google.=
com> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Oct 6, 2023 at 11:07=E2=80=AFPM Cong Yang
> > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > At present, we have found that there may be a problem of blurred
> > > > screen during fast sleep/resume. The direct cause of the blurred
> > > > screen is that the IC does not receive 0x28/0x10. Because of the
> > > > particularity of the IC, before the panel enters sleep hid must
> > > > stop scanning, i2c_hid_core_suspend before ili9882t_disable.
> > > > This doesn't look very spec-compliant.
> > >
> > > Presumably you could be more spec compliant if we used
> > > "panel_follower" in this case? Would that be a better solution?
> >
> > In the "panel_follower" solution, the phenomenon is the same.
> > The current order is
> > ili9882t_disable=3D>i2c_hid_core_suspend=3D>elan_i2c_hid_power_down=3D>=
ili9882t_unprepare,
> > ili9882t need touchpanel stop scanning,i2c_hid_core_suspend before
> > ili9882t_disable.
>
> Ugh, that's unfortunate. Though is there a reason why you couldn't
> just move the `ili9882t_enter_sleep_mode()` to `ili9882t_unprepare()`?
> That seems like it should be OK and even perhaps makes it more
> symmetric with thue enable?

Thank you for your suggestion. If the timing is met and there is no problem=
,
I will implement it in V3.

>
>
> > > > @@ -507,7 +526,7 @@ static int ili9882t_prepare(struct drm_panel *p=
anel)
> > > >         gpiod_set_value(ili->enable_gpio, 1);
> > > >         usleep_range(1000, 2000);
> > > >         gpiod_set_value(ili->enable_gpio, 0);
> > > > -       usleep_range(1000, 2000);
> > > > +       usleep_range(40000, 50000);
> > >
> > > nit: use 40000, 41000 instead of 40000, 50000. Linux almost always
> > > uses the longer delay, so that'll save ~9 ms. The only reason for the
> > > range is to optimize kernel wakeups which is really not a concern
> > > here.
> >
> > We need 50ms delay to meet the requirement.
>
> I'll respond to your v2, but if you need 50 ms then your current delay is=
 wrong.
>
>
> -Doug
