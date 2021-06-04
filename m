Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E459539C2D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198E06F529;
	Fri,  4 Jun 2021 21:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA10D6F529
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:45:48 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bn21so13393734ljb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUuG4qFZB8LBUFaeW8Kg5aOV0bTfac73qMPrMVkcgpU=;
 b=caeXpJBNR6ZlKosaU8pGnnDu87/vKtCbp99dJTlsr4lHu2HlNOE3y54vZyYGK96yxw
 c1KGToZhy5tFa0a3QsAa3s/hNze8We8TN0GZi3jwcXKK/Yfbc6HOaaalej3mgXTMa1Rf
 wT90fznzlFDA5x74vLXYLEXR4N8wsxT/XMx3WFLf5ytOMhIt2u3OtWqxR1VAMdtU0Z63
 lBIxxNfBX6axYCD3LBgEMbAre3o/BrHTvvpfd5yWt2k1lEjaBMEO+n57le+xHzYk1Ovg
 OcNAhjRuExi2mCeS6ISDUTu03Ykb3JGI7r5MBN1qqoZNWdsClrMRqf42CukV4WkFZwEL
 HrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUuG4qFZB8LBUFaeW8Kg5aOV0bTfac73qMPrMVkcgpU=;
 b=esysyZvUqP+Wb7X8S61o5MgoWuy8/ZSbgvDZHYFv8c/vufzC2ne62yxntwxVXCiDu7
 cE4To1xrPWPAWWpW/XxwqT3pBnTmWNYXJVX+BuoJt5T6PhQe1w2GivJZciVHT+ou9SNU
 OiijS9KDpewS637b/rsAd5tIm7jdi4EKXQzcTl2ulTDcBSBGfxBiDelosZXiINcax5Ld
 y/iIhpHScmd99/tPwZPFA/RxTU23HJDXbGeCxt6qkmAydpcFUOGxBlqU6v5I6WAxxf6o
 SDkSD4R26lrhDzwiY30bCaVcukbRA3V1/w8rDEKDx6mKRG528ck5PciV9NMlVYEv6OPb
 IyPw==
X-Gm-Message-State: AOAM531+DYM1fcWwn/xNmkEz0nrpA3UdpIhcGJjVTkr6I9C7/nOO6qx8
 rCAQppA+1mScYZXBh24dy606OdTzL7JME8OlMv34qg==
X-Google-Smtp-Source: ABdhPJwUPz4c/n9oWvqrjymDxZa08iBnsLgzrcdTMrlUa6W57fT8Zivu3nIHfACQzTWee9KTNEkbGOEV9cVLTrwIt6Q=
X-Received: by 2002:a05:651c:1501:: with SMTP id
 e1mr5199986ljf.74.1622843147180; 
 Fri, 04 Jun 2021 14:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
 <CACRpkdbVyMBEAr0n1+d3KSwV5J3spgfW6US9vwz1=2f34Ep3dQ@mail.gmail.com>
 <20210604080139.sccm3fggd3jvkkpa@gilmour>
In-Reply-To: <20210604080139.sccm3fggd3jvkkpa@gilmour>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 23:45:36 +0200
Message-ID: <CACRpkdb0Wg8MoOrJxvjkTkncpyOHE1E7oYWWMOzJoxTxWN2R=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Convert to gpiod
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 10:01 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, May 28, 2021 at 01:57:56AM +0200, Linus Walleij wrote:
> > On Mon, May 24, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > > The new gpiod interface takes care of parsing the GPIO flags and to
> > > return the logical value when accessing an active-low GPIO, so switching
> > > to it simplifies a lot the driver.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Thanks for fixing this!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Is it for both patches or just this one?

I went and added Reviewed-by: to 1/2 as well so you can merge the
patches. Was simple enough even though I'm not a VC4 expert.

Yours,
Linus Walleij
