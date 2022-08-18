Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9A597C39
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 05:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C958B4431;
	Thu, 18 Aug 2022 03:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B966F9F872
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 03:22:50 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-32a17d3bba2so8584047b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=s7mvImdTnwfruiP5+oJRaDpwmZoS0KHLcuR5YtEeEsM=;
 b=oPd61McycJXFEWsy0Q32Of8LSDl1hBJagHFeA/ydpr1gT387O7WCMN+uTShodRE34J
 kuvG/7HvjVjc2HsFHZ3zOGEt2qHg2l5IKeXRzixqS8VlBBSBcO6c/U1VAQo8h8GGJbLj
 tDWyb1Qw5oqy8DqMdB1IkVDlKqqbOAGpWdimg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=s7mvImdTnwfruiP5+oJRaDpwmZoS0KHLcuR5YtEeEsM=;
 b=LsLUloOj9Ci5OmcE7Z812S/q/X3BYpXL49DJpR5yj3Zzw801nmdhyY8F0yJUc00oya
 E8cizJqrBoJbryL76VxSFBFRBMEFdQXFgY4mi2K09Lr35IzEEiVKvm7fh3zjrEffY/+X
 Nt+WW+2gamqBPXXu+oiikfyGa+op5wtkgaWMFa6zjpR1nHMa3umL5sX6P5ZjimbiuDW7
 MVfjbXwEEqZaKnyKFTPbq1y5LflZPCvhMmtPOQPlA8Ghasj555hDGfg9hyM3Hu3ZcL8N
 aaDjL0fLx2CX1lASt3ej4TWuIPaIFvW2Oj+vlCCQ2CNMohLGHu/HBf7VceFtZmUpAu/1
 ZQjA==
X-Gm-Message-State: ACgBeo3oUZEPccpxUbY9kXWmEVworfiGn5xlpOmyeKmQ+vq+uVw2E40m
 YLsVQN4qW20TBR2ZQuPMK4NwFHw8vzzA4arJH3yJsA==
X-Google-Smtp-Source: AA6agR6onGFW/5xXkIYebD3W42xb40G2Vz1jh4mOkiO+Iqqd12Lic/TsE2OKXEjgCOtYH1qyy4ZFZfdqBrzjbIyCJCk=
X-Received: by 2002:a05:6902:90a:b0:683:84f4:245d with SMTP id
 bu10-20020a056902090a00b0068384f4245dmr1074097ybb.584.1660792969806; Wed, 17
 Aug 2022 20:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
 <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
In-Reply-To: <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 18 Aug 2022 11:22:23 +0800
Message-ID: <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
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

On Thu, Aug 18, 2022 at 11:19 AM Rock Chiu
<rock.chiu@paradetech.corp-partner.google.com> wrote:
>
> How does T4/T5  impact the real case? We talked previously the T4/T5
> shouldn't cause user impact.
> Do we have testing data from ODM?
>
Please leave comments below the previous comment's headline.

I'm confused. The reason I upstreamed this patch is because this is in
your application note and you asked us to help upstream it. Now do you
mean that we don't need T4 and T5?

> Rock Chiu
>
> Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Thu, Aug 18, 2022 at 6:54 AM Doug Anderson <dianders@chromium.org> w=
rote:
> > >
> > > Hi,
> > >
> > > On Mon, Aug 15, 2022 at 2:39 AM Hsin-Yi Wang <hsinyi@chromium.org> wr=
ote:
> > > >
> > > > The double reset power-on sequence is a workaround for the hardware
> > > > flaw in some chip that SPI Clock output glitch and cause internal M=
PU
> > > > unable to read firmware correctly. The sequence is suggested in ps8=
640
> > > > application note.
> > > >
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/d=
rm/bridge/parade-ps8640.c
> > > > index 49107a6cdac18..d7483c13c569b 100644
> > > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct=
 device *dev)
> > > >         gpiod_set_value(ps_bridge->gpio_reset, 1);
> > > >         usleep_range(2000, 2500);
> > > >         gpiod_set_value(ps_bridge->gpio_reset, 0);
> > > > +       /* Double reset for T4 and T5 */
> > > > +       msleep(50);
> > > > +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> > > > +       msleep(50);
> > > > +       gpiod_set_value(ps_bridge->gpio_reset, 0);
> > >
> > > We really need another 100 ms here? ps8640 is already quite slow at
> > > powering itself up and that has a real user impact. Why was it only
> > > 2.5 ms for the first reset and 50 ms for the second?
> > >
> >
> > The T4 and T5 are required by Parade. I'm wondering if they can
> > shorten the 200ms below:
> >
> > /*
> > * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
> > * this is truly necessary since the MCU will already signal that
> > * things are "good to go" by signaling HPD on "gpio 9". See
> > * _ps8640_wait_hpd_asserted(). For now we'll keep this mystery delay
> > * just in case.
> > */
> > msleep(200);
> >
> > Does this have to wait 200ms? Can it shorten to 100 due to the
> > additional 100ms from T4 and T5?
> >
> > > -Doug
