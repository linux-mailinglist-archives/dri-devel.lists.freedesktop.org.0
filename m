Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C530B6C5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 06:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E02C6E1F5;
	Tue,  2 Feb 2021 05:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CB46E1F5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 05:00:13 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a12so18718488qkh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 21:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHw4bny1Wwo2iSShQVV6B7iNSJANKQ/GGFfcMHS85eI=;
 b=Ag5N1hX5J+pqVl90avHSmQoVpceCOhvNtJdqzAr9/yrRozGVv//bYFxl8F3/iMHzHh
 ljyhdu33mqwSBSh8Z6WQmEjyqBx3Bguiot0wK7ohICaG5FVx/diV5BNrQSmz+mFzjiT3
 xApLB697+wTghiaR0sr/t0+BRRuotyOqhBn6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHw4bny1Wwo2iSShQVV6B7iNSJANKQ/GGFfcMHS85eI=;
 b=WD5KC+IOmP2Zf3MS04tOTfCiffyFGiQNbEeFEuMioC9/dPM4fs1Tv1f0eTrHENjppA
 IdlUcs2efxPzYRnKMaI9Z7rWLdWlaFLm597yefQaEd2eFNuHZiv9JV1Ob+L6Gj49Enom
 KmSRV3Nh/tNj87vu9KjvMX36aVgyKgBO+viqJokDEeA5yucu0f54s6b4GRMIcXm/oQ/n
 r5eSrcO204WMizZI7FeABMokIu+hD0/s+GwkMYq9imL96KpbFIx0/Pd2+KDd3QlXNkrG
 JFcUjIw6lcvBDxjUzIqAEbkN5tiRfktibeZRYyZAmlzsbX8jpUYGsixI7qxz4Y1CIZ2Z
 pm3g==
X-Gm-Message-State: AOAM531tmnjBFEc5L9joyXINS3ffBFIUiIDAg27leTEOTxuWM0wkytPq
 pFxJEuSAtC6fKp2qQ9M6Iwly1GvnaiG4B/KopZw=
X-Google-Smtp-Source: ABdhPJx4tRBI8/Cn5iy+JanLzzy1zk2Re3Wf7TOY2NqH0BRxEAnciKUn/VwHrG7h9zcE2pqKykXQcako+fM0dHk5GqU=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr19383783qkn.273.1612242012955; 
 Mon, 01 Feb 2021 21:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-2-joel@jms.id.au>
 <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
In-Reply-To: <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2021 05:00:00 +0000
Message-ID: <CACPK8XeTZ7kNPL4dWUJT44Zd+69VJ3FCMb7K=t6L0apwQOM1kQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Feb 2021 at 04:39, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> Sounds like a good idea! One comment though:
>
> > @@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >         if (IS_ERR(priv->base))
> >                 return PTR_ERR(priv->base);
> >
> > -       priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
> > +       priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
> >         if (IS_ERR(priv->scu)) {
> > -               dev_err(&pdev->dev, "failed to find SCU regmap\n");
> > -               return PTR_ERR(priv->scu);
> > +               priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");
>
> Is this (more generic) compatible value guaranteed to exist alongside
> aspeed,ast2500-scu? The scu binding only specifies the model-specific
> ones:
>
>     Documentation/devicetree/bindings/mfd/aspeed-scu.txt:
>
>     Required properties:
>     - compatible:       One of:
>                     "aspeed,ast2400-scu", "syscon", "simple-mfd"
>                     "aspeed,ast2500-scu", "syscon", "simple-mfd"
>
> - the only mention of the new compatible value that I can find is this
> thread. Maybe we should retain the existing one to keep the fallback
> case working?

Yes, it was a mistake to change ast2500-scu to aspeed-scu. The only
reason to keep the lookup_by_compatible was to decouple this patch
from the device tree changes.

I will send a v2 with syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu").
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
