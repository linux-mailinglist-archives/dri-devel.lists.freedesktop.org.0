Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C337AD03
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C944F6EA96;
	Tue, 11 May 2021 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1EB6EA96
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:22:22 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v24so615153oiv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=kBVcvZUWLveCtoaSFYEtvOho8NuPT8wfogjqViKCem4=;
 b=bGeeaHgkMRAiEzAiOMBkbhFfbfdKjjSITm87Bv0AoChwtUG2c8YAWnI05dia559YuN
 mgiOj1UTWCPm9AJQuBCkVKXICibZtAntxbALaYRvMoCmPGjh3ihHmH8VEXsZLDGlhx3L
 anvf/2nyihKzP4hsUgroUw+uuBy0ugJkx3eB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=kBVcvZUWLveCtoaSFYEtvOho8NuPT8wfogjqViKCem4=;
 b=aSG5QAeeyfG13ZHsfJh0Ns6UT/z2ioF6ZI/c2byGahXRl0zMM36TtW0HdPIdwPCmf4
 bXFJfwHSzlSm8YX/qcdo59otIlxEINK6KB7F6kYUeZBYMEVHPxyPTwrwn8HXrbcF6Upk
 w4j3kKiHZGwSTHyd82leLjYdnrMq+IAMBZga4qZSzXG+BvpgBlVP0E+Q4BHcdbzt3Ylz
 n6DvpwNVFYQ171YUp4BF8eKQuUE7QRyd59v0lFgy9jNv5DPbWZ6rEEIHBdTKwZ9zyRuD
 jXRCz9dTXYW312clYC/VJpR6M3mcFCMPkJqL5fteH6J10EkjNbWyWp5fvhqD2KtQGQCZ
 LI+Q==
X-Gm-Message-State: AOAM531hI2xuecLra6NhX6tpIPtxo1Q4AVNaHUdsvswvPBzrVaZ3c+UZ
 Si0zmk+ChDLaGbUm2pfKtjr2vphwu4mECS0zoQ+TmA==
X-Google-Smtp-Source: ABdhPJxhtavmqGziqaonlgvaKYkKq+a6axmGzXqcHFibLbDeZ31Hd8hRDkuZP3dRsQcOuXUlmakwitSITitjnH49xhE=
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr3321270oiv.166.1620753741645; 
 Tue, 11 May 2021 10:22:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 May 2021 10:22:21 -0700
MIME-Version: 1.0
In-Reply-To: <20210511144236.GL1336@shell.armlinux.org.uk>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <20210511144236.GL1336@shell.armlinux.org.uk>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 11 May 2021 10:22:21 -0700
Message-ID: <CAE-0n5039Zf+60qiQFExN49=iCBBEGC5JVgOQ+cJ8PeYnA=BZg@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Russell King - ARM Linux admin (2021-05-11 07:42:37)
> On Sat, May 08, 2021 at 12:41:18AM -0700, Stephen Boyd wrote:
> > Within the component device framework this usually isn't that bad
> > because the real driver work is done at bind time via
> > component{,master}_ops::bind(). It becomes a problem when the driver
> > core, or host driver, wants to operate on the component device outside
> > of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> > driver core doesn't understand the relationship between the host device
> > and the component devices and could possibly try to operate on component
> > devices when they're already removed from the system or shut down.
>
> You really are not supposed to be doing anything with component devices
> once they have been unbound. You can do stuff with them only between the
> bind() and the unbind() callbacks for the host device.

Got it. The device is not unbound in this case so this isn't the
problem.

>
> Access to the host devices outside of that is totally undefined and
> should not be done.
>
> The shutdown callback should be fine as long as the other devices are
> still bound, but there will be implications if the shutdown order
> matters.
>
> However, randomly pulling devices around in the DPM list sounds to me
> like a very bad idea. What happens if such re-orderings result in a
> child device being shutdown after a parent device has been shut down?
>

Fair enough. I'll cook up a 'component' bus and see if that can fix this
properly. It will add a new device for the aggregate driver that does
the bind/unbind so the host/parent device will still be ordered on the
DPM list at the same place. The new aggregate device will be after the
components and we'll attach the PM ops and shutdown hooks to that.
