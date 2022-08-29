Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C05A5678
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 23:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B941010F45B;
	Mon, 29 Aug 2022 21:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F196E10F45B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 21:49:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h5so6810799ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=queImgxS1otHnjm8zLjKmjWV8pL+QvReDQNcA7QCzFw=;
 b=ftyRU6YyBgapThUUf0clcKhiLDrITpLrd4bDVeOTRjHENdiABDamruN6BTmI9PDIH0
 uf3flFbhyKkvc/w/Ues2oOe0wmNSzhyWcFmS1oUoFHBWa503z0hysdkETpobfQ4ryMHd
 4rOIMewDP9j125rxk/3kLEXWXe7xqQczKPwYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=queImgxS1otHnjm8zLjKmjWV8pL+QvReDQNcA7QCzFw=;
 b=F+x2Tay/wnhO5kiagwQSum7ykYx/1xt3uPehVOAcfoU8ZCISLxjQo6hN82cHKdpB0j
 ZfFIYL+R45AgtF50tOcSvIJyiuVGCAHU8qbVKG9DjCloPztOKRhQOO8x8D1hmdBzeR0k
 27qEokfvau00djwGT1FloOF+eXGPhwb264gOl5IEOIg55pgRMLbEn13Lf+Lkc4/lJ8op
 06WutuPd8cxSdawFwKCwf2SDLEGJgytjAOc31wrQqBeZ6q50Wa7HohFM7gGt2r3dPopx
 PnRA9bzAg2POQX7i7IlV6JLU16ziWeWYXnmI+lBfupx7TfxMwBSkFLMMqVVC0qugEvND
 YI9A==
X-Gm-Message-State: ACgBeo15LxSs7+2pFoenweGuvS3ffvQYFTE3aJId0gpXYXluUoW4jLCZ
 4LuvWQVbtpuV2PNe1f0gO+QVGK10RLjcsZsG
X-Google-Smtp-Source: AA6agR6L5YqcqYtJk/FVOjUdnh18B2PhlH2QdmTZ7iIwgtwX1KuZOpCKELrms+EuRF6bxjeAvdN4yA==
X-Received: by 2002:a17:907:a422:b0:73f:18a8:4137 with SMTP id
 sg34-20020a170907a42200b0073f18a84137mr11836397ejc.10.1661809743325; 
 Mon, 29 Aug 2022 14:49:03 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 t1-20020a17090616c100b0073100dfa7b5sm5012444ejd.33.2022.08.29.14.49.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 14:49:01 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so5110752wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:49:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr8040714wmq.85.1661809740755; Mon, 29
 Aug 2022 14:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
 <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
 <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
 <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
 <CAD=FV=Vg5o-OxyQnemB+XfkGundDA-R31QhkmHJv4RmTMcF2gA@mail.gmail.com>
In-Reply-To: <CAD=FV=Vg5o-OxyQnemB+XfkGundDA-R31QhkmHJv4RmTMcF2gA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Aug 2022 14:48:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vqs+wPsOUgVK9VyzqDHewBR6HyQgcddQpe9Sd6OG6Nuw@mail.gmail.com>
Message-ID: <CAD=FV=Vqs+wPsOUgVK9VyzqDHewBR6HyQgcddQpe9Sd6OG6Nuw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 22, 2022 at 9:33 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Aug 18, 2022 at 8:03 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Aug 17, 2022 at 8:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > On Thu, Aug 18, 2022 at 11:19 AM Rock Chiu
> > > <rock.chiu@paradetech.corp-partner.google.com> wrote:
> > > >
> > > > How does T4/T5  impact the real case? We talked previously the T4/T5
> > > > shouldn't cause user impact.
> > > > Do we have testing data from ODM?
> > > >
> > > Please leave comments below the previous comment's headline.
> > >
> > > I'm confused. The reason I upstreamed this patch is because this is in
> > > your application note and you asked us to help upstream it. Now do you
> > > mean that we don't need T4 and T5?
> >
> > I think Rock is asking what problems the extra delay is causing. In
> > other words: why do we care about keeping these delays short?
> >
> > The answer is that it affects boot speed and also resume speed of
> > devices. Adding these two delays here means that there's an extra 100
> > ms before the user can see something on the screen. That may not seem
> > like a lot, but those kinds of delays add up quickly. At least on
> > Chromebooks, booting quickly is always a big goal.
>
> While I'm not very happy with this change and I don't really
> understand why these delays need to be so long, if folks are really
> certain that we need them and can't make them shorter then I guess we
> can land it. I'll wait a few more days in case anyone wants to chime
> in with their thoughts.

I'll continue to grumble, but I did push it.

55453c0914d9 drm/bridge: ps8640: Add double reset T4 and T5 to power-on sequence

I pushed to "drm-misc-next" and not "drm-misc-fixes". It doesn't feel
massively urgent since apparently we've been without the
"double-reset" for years and having the extra bake time feels like the
better way to lean.

-Doug
