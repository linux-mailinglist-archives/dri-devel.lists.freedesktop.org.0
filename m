Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFCB7C6D9D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7C410E4BD;
	Thu, 12 Oct 2023 12:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91E210E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 12:09:20 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5859d13f73dso603679a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697112560; x=1697717360;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGVuIDhtnkx9I0P2cABYe4E02j31AzUEOF4KcnzwtNo=;
 b=XPP9wzQ9cay/jsGmydNFvLxfbEY2OT8rVgAqCKz+0FP11OZt3ZGrgvQfaYeJ8iAXMT
 rJne8tclQlpUgGmsZY4qn3qdnmGHvSsymAU6n9XolA7g99Iqxbu6rInwOipnF+Sgvle1
 t8sipIvk5tfudhz36zHfiYLCZzk648jZz6BNXtNr2J4aUJaY3ftqblP3sHGYd7WCIaBH
 2ALxLsBrSFZyydTBCHN+C2OyRSXegww9wSi+VciMVfd+a7fYq4OoAoMcWyhv7U5k4v9d
 ZmosiEtU21H/6J6jC6WdEB/BfH/JL5dVLneJY7/MA2zn18U2iOtwEcg7ENLvTY1to9FA
 xilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697112560; x=1697717360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGVuIDhtnkx9I0P2cABYe4E02j31AzUEOF4KcnzwtNo=;
 b=na9Mv1YC+yQ4kX0U9Eabf0AaXyWYWC7hAT7d7r92Hg/u8cOFYaM0S0loIcCZ1S1/BL
 aH0ioVrFaeDknvvqLPwKmjYL5SUtSTZpwWaKfiVNbNYCdfgOGVst9Zxhz6OCl4uoWlY0
 odXvVGCrXHEm+c9P2U5oLO8VsL00QoeWaZWFs4zMtbmypsDS/oziQ+yQMgTGd9o+yAdt
 tbIpbTHWq3h+8dWj/DBeUSG3tk5/dgvy6iNltiaFStdheaAwFFytb1y6JoJ40H22FVYp
 E95I1IQpoeWQIxTzXo1pc4BrNer90hOXEGWaODLM539MuC/YkPWpWsUolnS28KaEVTsN
 0WVg==
X-Gm-Message-State: AOJu0Yyfe21j6+KsGT/AARwghJ24b2lh1UO64jX4tbg3korOwKaipqyR
 0S0syjujdk6xR/f9ovP+2pbR8tN5aLs6o8j1UNnEBQ==
X-Google-Smtp-Source: AGHT+IG+qwM2ufmCDLktuyF3J53mc39RePPOt1YUFtmHX/i9Y46+A0GhC2zS9COvexYKnJPUEsdEadKXO7rk+zSOK+c=
X-Received: by 2002:a05:6a21:81a9:b0:171:c88a:8927 with SMTP id
 pd41-20020a056a2181a900b00171c88a8927mr6796724pzb.29.1697112560241; Thu, 12
 Oct 2023 05:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
 <CAHwB_N+=h8-5H6SM8REAge19SgLvrZD=drAP83QnSuuqB5gN8A@mail.gmail.com>
 <CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com>
In-Reply-To: <CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 12 Oct 2023 20:09:09 +0800
Message-ID: <CAHwB_NLtnW4N-ZrW8riNBRZNEB0WiSwZWncHr0EACHN5JVx8Jw@mail.gmail.com>
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

It looks like the test will still fail, because the touchpanel reset was
already pulled low before the panel enter sleep, which did not seem
to meet the timing requirements. I will explain this in the V3  cover lette=
r.
Thanks.

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
