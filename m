Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC6597C2D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 05:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03222B4359;
	Thu, 18 Aug 2022 03:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB2AB434C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 03:19:18 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-32a17d3bba2so8457207b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 20:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=BiYFqunK9O7/TlJUzZAQB9ZJLp/cE2IuaFTnRLRISWs=;
 b=esuEf/fxu4uMu25CRGKsrCc/zg82eolon2uic4JRTW6xeMpPNbejM4O6Zp9WSC5f3K
 ZZgJGtq0/m2e2TCm89SgluhBVi9OxkknhsKwvN3EnF5V7ycQywxJNTl9eNzYZnrvqq0K
 wAPiPJSeCPgLINXG++WtqF1qONG0ft/BGc5Cuqjrvjo+xoxK6grv1FR4wIhBRnbu7Muq
 XoOO3zKGsZjjSzMvcwwpa5kvI5DR5JYgwrUZVolsl7B5GkHiHdnLG0N93DTZfx5kS4aP
 tRyZjJ9Jzr5VNwShR60/X0SJo3f8yjwylHcFHQmKi/1QUcjz9PiJySQrS2xwVvbOuTg4
 CYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=BiYFqunK9O7/TlJUzZAQB9ZJLp/cE2IuaFTnRLRISWs=;
 b=Dq2f/MWy4juB0wz6tHDVsc2Ya2K1kY8xm4nfn7tTrIsioCRUkEV3lqgKS2dFrnwI56
 2ZioaIIJ1HyusFtCjzLgqIWRdtHUyvjlD9osJVyR+2bXT62YJ/E9/+3V8UyR1duoYb8L
 bUGZOL1x4OMFJAX6YkYGnGOZZtD5kGCFwGifo0hTut7bxO0pWh1WBSzmDONsGPwcPsz+
 Mb3qG2yQQME4ShGgn+siNfJ4F4Mq+2GCECQRTji+dvc0TN7MSFhoocLyz+ZpCX2yNtdt
 3ya4feIZc2Klrko+rVrmXqM5HXjEQ2Yk1YBRDjut2rDeel92JOSo/lD6kj5Bh4zzUDFs
 6F8Q==
X-Gm-Message-State: ACgBeo3K457h/VM3YmXfiNK67P3VIh9FwZHZUyQvSWChhytrDNlpS0op
 xHvpP+D8NtXckctm+d1XxV53Pev3cZCZn3dBw+v7oVj3jQo=
X-Google-Smtp-Source: AA6agR5nX3cIDtLsQqH5hgUm2GUyU7P8msHO5iW3xBD6uJtdPO4idng+UcH5yjd1sHGqpbPlzUJwx5PuXnsT4rKtH2w=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr1170829yba.479.1660792757464; Wed, 17
 Aug 2022 20:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
In-Reply-To: <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
From: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
Date: Thu, 18 Aug 2022 11:19:06 +0800
Message-ID: <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

How does T4/T5  impact the real case? We talked previously the T4/T5
shouldn't cause user impact.
Do we have testing data from ODM?

Rock Chiu

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Aug 18, 2022 at 6:54 AM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> > On Mon, Aug 15, 2022 at 2:39 AM Hsin-Yi Wang <hsinyi@chromium.org> wrot=
e:
> > >
> > > The double reset power-on sequence is a workaround for the hardware
> > > flaw in some chip that SPI Clock output glitch and cause internal MPU
> > > unable to read firmware correctly. The sequence is suggested in ps864=
0
> > > application note.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm=
/bridge/parade-ps8640.c
> > > index 49107a6cdac18..d7483c13c569b 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct d=
evice *dev)
> > >         gpiod_set_value(ps_bridge->gpio_reset, 1);
> > >         usleep_range(2000, 2500);
> > >         gpiod_set_value(ps_bridge->gpio_reset, 0);
> > > +       /* Double reset for T4 and T5 */
> > > +       msleep(50);
> > > +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> > > +       msleep(50);
> > > +       gpiod_set_value(ps_bridge->gpio_reset, 0);
> >
> > We really need another 100 ms here? ps8640 is already quite slow at
> > powering itself up and that has a real user impact. Why was it only
> > 2.5 ms for the first reset and 50 ms for the second?
> >
>
> The T4 and T5 are required by Parade. I'm wondering if they can
> shorten the 200ms below:
>
> /*
> * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
> * this is truly necessary since the MCU will already signal that
> * things are "good to go" by signaling HPD on "gpio 9". See
> * _ps8640_wait_hpd_asserted(). For now we'll keep this mystery delay
> * just in case.
> */
> msleep(200);
>
> Does this have to wait 200ms? Can it shorten to 100 due to the
> additional 100ms from T4 and T5?
>
> > -Doug
