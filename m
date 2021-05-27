Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC13939D8
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08D36F51E;
	Thu, 27 May 2021 23:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C586F51E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:58:08 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s25so3013045ljo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6TyNLS59PYNs/WTcrtUIUT5kNAncgPO5brYD/qSY1A=;
 b=xjBfEJXiAxx2S5D2/f50gWG8/k2CgFJJIbFk2kqSHI390FVsZ7YEwcMDVZQ1y20RDp
 7GIdF6slVgZ8tAH+GuahxitTO5D+Ed+ftGyNUs0XJmcsMWJRCLEJ12XmlAThQFpZra3S
 8rMGbyYZeHob3V5s6pM04ssAVxD5yjElhavkEM+GzE7d6YqpMl+uK/bMc49bb2MBjrFR
 kQdT3duoWQB9eBUoSQJ4bZvKLuyx9kKZyeJGEb5mrYc/vh8STu//r/CR6DT7tXkpnAxr
 xT+jfNOQKNlLa6ol0Hw+v818c2JYVwdNDStYN1PjnJyu6ON6NN8HNh1cDrJOPdZlqWz7
 14Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6TyNLS59PYNs/WTcrtUIUT5kNAncgPO5brYD/qSY1A=;
 b=nBtetsCR9H47wqUbKD0sw24h6e2up98NF3cHA/9XamRuPFPHaohpRXrYPTcNfzx2Vd
 o76mCwdJKislpiV+IhR+1DtKau+pPthN1f4i7i6AHAPqjR9tZsRNT5KKLz4zSwfxu9Mf
 lszEvlz9VrgR8SBJP9EPEmd6AYicbhbc4R8eAGZn9V4WHqiL+/dUzXtGwLfsojam2mHf
 JOPi8iUwEhlZ0+OqfZ62YidR2r+I1L2bkJxHJckarYJ5hv5xuYHfmcSqjw9msxUn5NtN
 U3O3sPi9xvZuXL1zMehr9Of5yD+qlA1dUZ3YM+3P/iGn85aiEzpZaGZ+BY6Jmbibmrf5
 leww==
X-Gm-Message-State: AOAM5319fLnmj/q3oXbQYcFUW9dWiMpLMbE6/uMbJNRf7w/lfdu9dRy0
 EZ1KbEu28Kk2sBe8LcgHmARn89C93KvHXmM3cZn14BZXQjM=
X-Google-Smtp-Source: ABdhPJwfaZ+od043GlQ/8lXgQWvmv1gC9smitcCReiNIAl3QGi5pTcNhd9+RmkYFFImSO1TZDwOAATrmIU4XKGVkiOM=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr4449914ljt.200.1622159886872; 
 Thu, 27 May 2021 16:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210524131852.263883-1-maxime@cerno.tech>
 <20210524131852.263883-2-maxime@cerno.tech>
In-Reply-To: <20210524131852.263883-2-maxime@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:57:56 +0200
Message-ID: <CACRpkdbVyMBEAr0n1+d3KSwV5J3spgfW6US9vwz1=2f34Ep3dQ@mail.gmail.com>
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

On Mon, May 24, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:

> The new gpiod interface takes care of parsing the GPIO flags and to
> return the logical value when accessing an active-low GPIO, so switching
> to it simplifies a lot the driver.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for fixing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
