Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7495AE749
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 14:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3500410E629;
	Tue,  6 Sep 2022 12:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98E110E629
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 12:10:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id y3so22789736ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vCwl8j+RWcYnHs2Ge4KIIN5Weh4JvqT5rY25vxWNLag=;
 b=lOa6WYPsC1uUBdMQKtoUl2jwn4GzkujrcdNHqpHHagPEkQznc0SQeaek3uPXhsII9/
 aWPQmIh2WGQPv77i4xNjBsSWZ8abLLQe+5DF3vYb4xuKgBVSFgzLmamx19gqzj+Qfi5q
 Em92ghJNH10uPXU62B69AYerZ6D/8jZbKnj1kmFla5ZL8FK6XqyPf+4kqZ9++hn2PlII
 Bsp9dHsaKTze2hAOo6NLT/sGZytLyUlAODLhJn49VeVWs3KkglxqcPf4RNCiGsruzntX
 fVgwOzbzHgjK3Tzqz8Jj55H+wD8Fk8kC8PuzcwFx1aHhT/B65klc5BVwIi/sDedtJuY1
 gkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vCwl8j+RWcYnHs2Ge4KIIN5Weh4JvqT5rY25vxWNLag=;
 b=qLct+f8HGTEHh/PIsMyrcXLWjPoEw2K2BHCR93P23nEJyTQk0kAiLzT+pyStNplLCt
 tki6TpvHOe/OHiDLA+YuyKEUgJYGcWn++nR4nbG+NfaJXmXWW0pO+6uYzY1DG+GbHOkK
 LMjnd0HDM7qfjxaHo8aUhA5r/8ryWOOdVRzulzooQQEs0x9xqBxkAtQlweph9Ob8XCxx
 bgim5AFkKOjHaAR/0vHfcXOKkhM7xAp5GJpp4Xt/rYIUjzSR2ZFTlZf58R5r4HSreYfb
 veJWfuBWuYCE1Fjn+nvQWWZHBKPwhE5tlqxz75USqbc4knf5PTrXTylXLqJIx80lfK3Y
 sccw==
X-Gm-Message-State: ACgBeo3854aS8OrtR7SD0GXQxUU7qdK22jVtDMWlPwGJVeHpHgANvAlv
 EkB87/Uc75YDlNYeooEhjB/lZfQ1uFpTbIsnMtDqog==
X-Google-Smtp-Source: AA6agR7GgqK7ijpgcdaNkqRz3n6PJtmaaPGE/4WCyXXWgF5BzYxZFDL2Rnn6TA/iG4hP73Hpgtay6650+CxP+9k+oDY=
X-Received: by 2002:a17:906:eece:b0:76f:5c6:2340 with SMTP id
 wu14-20020a170906eece00b0076f05c62340mr2662494ejb.383.1662466215963; Tue, 06
 Sep 2022 05:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220903130833.541463-1-xji@analogixsemi.com>
 <CAG3jFyum5M8iGdW++c7rayUn4ogJ6izWaX7VaqMfV7ShAe_kRQ@mail.gmail.com>
 <20220906025753.GA642918@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220906025753.GA642918@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 6 Sep 2022 14:10:05 +0200
Message-ID: <CAG3jFysnwnq7pQE4fKA3XiUzZPC0inJOyvszaf2QGNsMhqCVUw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Set HPD irq detect window to 2ms
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, mliu@analogixsemi.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Sept 2022 at 04:58, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Mon, Sep 05, 2022 at 06:48:06PM +0200, Robert Foss wrote:
> > Hi Xin,
> >
> > On Sat, 3 Sept 2022 at 15:09, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > Some panels trigger HPD irq due to noise, the HPD debounce
> > > may be 1.8ms, exceeding the default irq detect window, ~1.4ms.
> > > This patch set HPD irq detection window to 2ms to
> > > tolerate the HPD noise.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++++++
> > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++++++
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index c74b5df4cade..0c323b5a1c99 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1440,6 +1440,20 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > >
> > >  static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
> > >  {
> > > +       int ret;
> > > +
> > > +       /* Set irq detect window to 2ms */
> > > +       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                               HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                                HPD_DET_TIMER_BIT8_15,
> > > +                                (HPD_TIME >> 8) & 0xFF);
> > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > +                                HPD_DET_TIMER_BIT16_23,
> > > +                                (HPD_TIME >> 16) & 0xFF);
> >
> > Does the HPD debounce timer register need to be written for every HPD
> > status read?
> Hi Robert Foss, yes, it is better to set it in every HPD status check, because the
> HPD may be affected by noise, once the chip detect HPD is low, the timer
> register will be automatically set to 1.4ms, so the driver better set it
> in each check loop.
>
> Thanks,
> Xin
> >
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > >         return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > index e257a84db962..14f33d6be289 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > @@ -132,6 +132,12 @@
> > >  #define I2S_SLAVE_MODE 0x08
> > >  #define AUDIO_LAYOUT   0x01
> > >
> > > +#define HPD_DET_TIMER_BIT0_7   0xea
> > > +#define HPD_DET_TIMER_BIT8_15  0xeb
> > > +#define HPD_DET_TIMER_BIT16_23 0xec
> > > +/* HPD debounce time 2ms for 27M clock */
> > > +#define HPD_TIME               54000
> > > +
> > >  #define AUDIO_CONTROL_REGISTER 0xe6
> > >  #define TDM_TIMING_MODE 0x08
> > >
> > > --
> > > 2.25.1
> > >

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
