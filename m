Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59789597B9C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 04:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB19AB611;
	Thu, 18 Aug 2022 02:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819D3AA246
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 02:43:03 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-33365a01f29so7594297b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9MQRa8JH1OeigvUiEiCAifYy5TFCST+erSp8U3+cEYc=;
 b=M0yDUCP+1k+S+jKfZJyr0LjTVdH5x6YFiyzMXHGRBRGBYHk+j2hdl8+3a828DrM5nG
 +WiWj1lm9uyUPASgdPIp3BlCQ6cIB9F1I9ZPdmvCqsATM3O1QROqmXDqmWTsSI452VVn
 /nKKPq62MkySUe5FfRM3V0Qn+b9zhEntkB+qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9MQRa8JH1OeigvUiEiCAifYy5TFCST+erSp8U3+cEYc=;
 b=Wmn2kqYtRdofiND9sJRcUS2+pGLnzAbudnNRXpaeLeh3M8df8glyv61KHLNmv6QO4R
 alzRrn9+/89/wjaTiKt7ZT7is+d7cU4/ZQeVbhRkNGXMwLj8XEigIwCYaDu/x9J79ssy
 DO3BG2DY5YsaUN8if8H2BlddT/wp0nSu7wTBApJ4oL0+aJJunBL5gJPIFhM304RvhljQ
 apkGg1PeBxwTx8HhQAcUVCxQQIM0CNNf3DjyXStDcqiHhWsMlJN3s12FjL+4ljnJf1rm
 GhbvO2/Ur7LHPlVDp2pkSep5HhaPxtBkm4MThRTEYLNFphLWy+/Odd+WHXqa6dn2qQvP
 rq6Q==
X-Gm-Message-State: ACgBeo0BMgZ6H6BCOqL6d4qepbrsLaVDrjn9d7ZmFI9VRSXy2uKiw8iY
 ngJbxjyAE+Q+qQyE3nNe9hTXA5qWLFThDehnc1Qd/A==
X-Google-Smtp-Source: AA6agR5LfH1VzKUv8CZfFimvSijMrSxWCyYqLlVClfE7mbkEThGBEas5M52zhZjRDYuWdk5bm0GMC61D70cC9icAw/U=
X-Received: by 2002:a25:bac1:0:b0:683:433d:67ad with SMTP id
 a1-20020a25bac1000000b00683433d67admr1130535ybk.554.1660790582345; Wed, 17
 Aug 2022 19:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
In-Reply-To: <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 18 Aug 2022 10:54:11 +0800
Message-ID: <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Doug Anderson <dianders@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 rock.chiu@paradetech.corp-partner.google.com,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 6:54 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 15, 2022 at 2:39 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > The double reset power-on sequence is a workaround for the hardware
> > flaw in some chip that SPI Clock output glitch and cause internal MPU
> > unable to read firmware correctly. The sequence is suggested in ps8640
> > application note.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 49107a6cdac18..d7483c13c569b 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct device *dev)
> >         gpiod_set_value(ps_bridge->gpio_reset, 1);
> >         usleep_range(2000, 2500);
> >         gpiod_set_value(ps_bridge->gpio_reset, 0);
> > +       /* Double reset for T4 and T5 */
> > +       msleep(50);
> > +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> > +       msleep(50);
> > +       gpiod_set_value(ps_bridge->gpio_reset, 0);
>
> We really need another 100 ms here? ps8640 is already quite slow at
> powering itself up and that has a real user impact. Why was it only
> 2.5 ms for the first reset and 50 ms for the second?
>

The T4 and T5 are required by Parade. I'm wondering if they can
shorten the 200ms below:

/*
* Mystery 200 ms delay for the "MCU to be ready". It's unclear if
* this is truly necessary since the MCU will already signal that
* things are "good to go" by signaling HPD on "gpio 9". See
* _ps8640_wait_hpd_asserted(). For now we'll keep this mystery delay
* just in case.
*/
msleep(200);

Does this have to wait 200ms? Can it shorten to 100 due to the
additional 100ms from T4 and T5?

> -Doug
