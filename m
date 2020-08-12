Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D753D24259D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 08:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907CF6E8A6;
	Wed, 12 Aug 2020 06:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318286E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 06:48:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v4so1044346ljd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 23:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J31UG4xZfaTIfqQug3jDowpRaMecAJvi+cR7RWW/6Kc=;
 b=VpYvDBU0f25AQ9m3GDVHoUNKGkkDhwbrnVrRQGv9qnG12eXf4IY7Tpb4nKzyaA5GnR
 AHtuTeNxArmL+axuWPrSumZ/XebgP77RRcTE+GQkB8i0oVWOsRSw3z0wBHwftrhm/jFP
 CvNNCuSx/bwusMpWV+mV9dc66XOoA5fxPM26P+c7ZZjLqGy7wW5QVw4vw9fqIqUTa5cF
 PSVEIwmtvgOvsay+aDb9WpoGr6AwxjmjiR43zYa7iWp4i2u/PL9XMjOAPLVij/0Pn1yV
 +mULTLZ5F3Go7VxJFDc79NuukaGuX283qR5QhEyWTK2QvmhsNtuRRq7Luw33QF6WG0Zs
 U7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J31UG4xZfaTIfqQug3jDowpRaMecAJvi+cR7RWW/6Kc=;
 b=XaGv6tTUpl/Bzqjzrnvqu58AfSh22XVFPAmYJACO9cnoaNzDkGJG3UqsLMkIVG6aJp
 qbX5QbyjMSankr5G6scN+ui8DiLbjuw2m0adaXgiVGans42PkpGUPpN57v32NQ5prlSw
 32q/3sZUGR/hiH4lbqtZxVhwjM0na1yfgeAZRfohI3FyMRyM9bTqXuYvf1kYCix9hV3d
 i/pjgCchDOMFbcfpzJaDlCfXlIpDtBeH9w2HajFCSTFETS6Ih2adQokbjfRLX3lm2ITW
 Yc0eHHO/tpZMsjTwSkGLwAmJ3SMXTEIJdpfe8I8SP/L7mRkeEWqhzsoXOfsls3fouCMy
 W2mQ==
X-Gm-Message-State: AOAM532OF5mSqFqnaZXmUwWOyJ+KT0DaubSYEN09HjVnSqDEW5LnUfcE
 brqD9sSOP5/faBaqeCBKZq6rbGGBeqPLn53AEZuTXw==
X-Google-Smtp-Source: ABdhPJxHxwmcGrskpI/3oFiCVwxSZLG0pwpgInuuMV19jZuo3wuyU4iLrgAO3cTWdJQBKcHLd6uIZH9VRx2ad2MKIIE=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr4977361ljg.100.1597214934520; 
 Tue, 11 Aug 2020 23:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721083228.GA283099@ravnborg.org>
In-Reply-To: <20200721083228.GA283099@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Aug 2020 08:48:42 +0200
Message-ID: <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 10:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> > +description: |
> > +  The Kinetic Technologies KTD253 is a white LED backlight that is
> > +  controlled by a single GPIO line. If you just turn on the backlight
> > +  it goes to maximum backlight then you can set the level of backlight
> > +  using pulses on the enable wire.
>
> No $ref for common.yaml?

Since this is a backlight, and we do not have common bindings for,
backlight I first looked into using the LED bindings in
../common.yaml, but that has several problems, it cannot really
be used for backlight. Backlight doesn't have "triggers",
patterns, flash properties, the function is also pretty much
evident.

So I will look into creating a new common for backlight.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
