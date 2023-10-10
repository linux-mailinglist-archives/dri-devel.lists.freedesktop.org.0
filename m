Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267757C042F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 21:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662C710E3D5;
	Tue, 10 Oct 2023 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F110E3D5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 19:11:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so2998a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696965103; x=1697569903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmjErNj6cLHcO0s7PJGZsoXQtRcGQqMYUEfJq8NBOjo=;
 b=aLdkEVJrJa9VThF8MelNbNG3BRGM0d1yEzI9spL8Lt/o5EifaS30/AdvkUaic+Kph6
 fsQGZCqqyAcppOiYfMyKIjbIDZp6XKwdnwOzxqnp5fTIhA7lRriuNDffHacEnuBkm68I
 +xRbV0Q0e/RgafDXdhzlPw026QfftAENLupb1Jpk2VsA/OWIDAFBTyMzm7Lv6ewEUDf+
 kuDoj7Ju8UmMbcUS206GI1afLTsTpVAyjnwbCOoD+Zen7dN42A6b+/4xxW6IOAdCj86j
 ED+tY3q3aNSRFhtxAnVZQdeSGe27JzAztfWPle/llfx7/MTTVKLOMh2ajx+fOiFx4i1E
 99VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696965103; x=1697569903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmjErNj6cLHcO0s7PJGZsoXQtRcGQqMYUEfJq8NBOjo=;
 b=emJjiRv7TiL6PWR01XqbBfXN0qIQrb0Z31/uw598sGSpPlgsIuS3ZUvIdhu4o+sdKH
 2eg9QpYmzm9BaUaWbkLsCynsRurZVAOdZo7dLj4NxjOv4tiZnGWQdE6BvXlxCD/9x4Eq
 ht9gNfHEewHRhRaa2sFRel3kkkeGJa8NjaJWzRbLs0xejbZC9oBmmQutWgaiHaptAoHG
 u/zy+lyAs8/e78CxGpCHcwt22XfPHALZb7CtZJK2ONo38S4AA7Z68D2adVV5RNGtihsJ
 DCkbW3WTr4N/NPcJG6t1Hxn2tn9mK/PySrY/oaNhNqqGGfuFusnh0YHKSoBKk75OWACD
 erHQ==
X-Gm-Message-State: AOJu0YyEt3h4NU7TFe186iQexk5EKWB0RQRTkrJi45nWENHuXmGbVlbD
 sm9VMoUSBnDGqviCj3ygo7MIV5wwlqbWi1w6pOuWtw==
X-Google-Smtp-Source: AGHT+IF44V9VAvMHDXj78txqmMrBQ5P2zJqqx5htIgx/2JlftTdgM1YVJ7acLqOWZw5OeYg6E3fJaN0KSIczk6RAUH0=
X-Received: by 2002:a50:cc9a:0:b0:53d:a40e:bed1 with SMTP id
 q26-20020a50cc9a000000b0053da40ebed1mr26458edi.3.1696965102691; Tue, 10 Oct
 2023 12:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
 <CAHwB_N+=h8-5H6SM8REAge19SgLvrZD=drAP83QnSuuqB5gN8A@mail.gmail.com>
In-Reply-To: <CAHwB_N+=h8-5H6SM8REAge19SgLvrZD=drAP83QnSuuqB5gN8A@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 10 Oct 2023 12:11:30 -0700
Message-ID: <CAD=FV=XtqPJ77dx8uRb0=tMvC3CvgH5X+7mUJeXgcG228kZfUg@mail.gmail.com>
Subject: Re: [v1 2/2] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Tue, Oct 10, 2023 at 4:36=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> On Tue, Oct 10, 2023 at 4:44=E2=80=AFAM Doug Anderson <dianders@google.co=
m> wrote:
> >
> > Hi,
> >
> > On Fri, Oct 6, 2023 at 11:07=E2=80=AFPM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > At present, we have found that there may be a problem of blurred
> > > screen during fast sleep/resume. The direct cause of the blurred
> > > screen is that the IC does not receive 0x28/0x10. Because of the
> > > particularity of the IC, before the panel enters sleep hid must
> > > stop scanning, i2c_hid_core_suspend before ili9882t_disable.
> > > This doesn't look very spec-compliant.
> >
> > Presumably you could be more spec compliant if we used
> > "panel_follower" in this case? Would that be a better solution?
>
> In the "panel_follower" solution, the phenomenon is the same.
> The current order is
> ili9882t_disable=3D>i2c_hid_core_suspend=3D>elan_i2c_hid_power_down=3D>il=
i9882t_unprepare,
> ili9882t need touchpanel stop scanning,i2c_hid_core_suspend before
> ili9882t_disable.

Ugh, that's unfortunate. Though is there a reason why you couldn't
just move the `ili9882t_enter_sleep_mode()` to `ili9882t_unprepare()`?
That seems like it should be OK and even perhaps makes it more
symmetric with thue enable?


> > > @@ -507,7 +526,7 @@ static int ili9882t_prepare(struct drm_panel *pan=
el)
> > >         gpiod_set_value(ili->enable_gpio, 1);
> > >         usleep_range(1000, 2000);
> > >         gpiod_set_value(ili->enable_gpio, 0);
> > > -       usleep_range(1000, 2000);
> > > +       usleep_range(40000, 50000);
> >
> > nit: use 40000, 41000 instead of 40000, 50000. Linux almost always
> > uses the longer delay, so that'll save ~9 ms. The only reason for the
> > range is to optimize kernel wakeups which is really not a concern
> > here.
>
> We need 50ms delay to meet the requirement.

I'll respond to your v2, but if you need 50 ms then your current delay is w=
rong.


-Doug
