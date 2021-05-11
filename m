Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6385837AD82
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 20:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552B66EAA5;
	Tue, 11 May 2021 18:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C8F6EAA5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 18:00:05 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id i4so27484835ybe.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BslBRWHM+4cdme20xuuO/o0FHKbwbUaPbtdNmBJo3LU=;
 b=TwuY1ji5xZt7+mKwiBaF5SNDSaL0dbGg1dU7Xyz1vYDyPGqH3ov+II/jeWyH9iJP+u
 R3ZU7S84k3LJ5IPZKhKlyxKtDNdJNNHeCR3EjSZBzKtEQmMZaOKK2VQ85nczzxa5pRZM
 xUXAnI29lnLIiapSRyShbhIlIJaqcLoDBI60sVpMBwWag4kX3oVOu1jzZ+bSQpyMBGD8
 3KYXzxqOGbkvoErikCUrNkvo4zxJDvwAmPzJIt7ejzEYA20yGNswFRPbP2XW6SYuwVVb
 ax4YSjbC1tP25BmoHC1xqvjsCAMe4MJWrEpt4ZWL0M1hxTFdb7X6YaosUgCRUssmZuHr
 B2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BslBRWHM+4cdme20xuuO/o0FHKbwbUaPbtdNmBJo3LU=;
 b=dQVv11RVk7f134mJlv+u0pR8zcozEdN+BRSkkfqeoT04I23ciGMUpyOqpy0jhBChS8
 UzwKi6CTF38IXr5H00XTs5eylpFCtlm5K31VCQJs3KJx1ZOqO6mm0jyur/68J97JD6wJ
 S9FUzFIxOo46CJQZJlYOK+uc0yvipr1+bXOECou5TGpPTPkB2Txhyr00QfyaQaahktCg
 bh5zQa8xtVlbxAInMKbXtcHyYwqc+7dW5Qmshiy648MMJe3tCF6qwqKiuQJ4e2TSaiOu
 JpfRtFICr32/CCA5CiiLPp89QJa7vLY/JsjqiE/O2bY5AAnWwaZ++D91v9mHLIw4wCqh
 EhKA==
X-Gm-Message-State: AOAM530cD8hLMbRN6P1Y9rThcw4MpBwYoD/dLqrGOedzN23zDuWjwQvo
 UlWYJ1DeS0KaXzQ2Xb3oyymtTmmV3aB9vsC7gio/Yg==
X-Google-Smtp-Source: ABdhPJwDqYiG2hVm1vCvoYoeeT+APZLR6RGHMfcEoH/R9v6KlVOVzGUVNUG5VtBw2c/wp0nl5JtkQDx/PEsu3/sJsIY=
X-Received: by 2002:a25:6003:: with SMTP id u3mr45044151ybb.96.1620756003695; 
 Tue, 11 May 2021 11:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <CAJZ5v0jX4ef+oO95dyFmKC0hnfKR7kSmHKQzD=RHgN51O1w_uQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jX4ef+oO95dyFmKC0hnfKR7kSmHKQzD=RHgN51O1w_uQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 11 May 2021 10:59:27 -0700
Message-ID: <CAGETcx88Qd71hr-VbU-UY0G43SyOJxfVdcqbUY48UdzACPmnmA@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 4:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, May 8, 2021 at 9:41 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > The device lists are poorly ordered when the component device code is
> > used. This is because component_master_add_with_match() returns 0
> > regardless of component devices calling component_add() first. It can
> > really only fail if an allocation fails, in which case everything is
> > going bad and we're out of memory. The host device (called master_dev in
> > the code), can succeed at probe and be put on the device lists before
> > any of the component devices are probed and put on the lists.
> >
> > Within the component device framework this usually isn't that bad
> > because the real driver work is done at bind time via
> > component{,master}_ops::bind(). It becomes a problem when the driver
> > core, or host driver, wants to operate on the component device outside
> > of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> > driver core doesn't understand the relationship between the host device
> > and the component devices and could possibly try to operate on component
> > devices when they're already removed from the system or shut down.
> >
> > Normally, device links or probe defer would reorder the lists and put
> > devices that depend on other devices in the lists at the correct
> > location, but with component devices this doesn't happen because this
> > information isn't expressed anywhere. Drivers simply succeed at
> > registering their component or host with the component framework and
> > wait for their bind() callback to be called once the other components
> > are ready. We could make various device links between 'master_dev' and
> > 'component->dev' but it's not necessary. Let's simply move the hosting
> > device to the end of the device lists when the component device fully
> > binds. This way we know that all components are present and have probed
> > properly and now the host device has really probed so it's safe to
> > assume the host driver ops can operate on any component device.
>
> Moving a device to the end of dpm_list is generally risky in cases
> when some dependency information may be missing.
>
> For example, if there is a device depending on the hosting one, but
> that dependency is not represented by a device link or a direct
> ancestor-descendant relationship (or generally a path in the device
> dependency graph leading from one of them to the other), then moving
> it to the end of dpm_list would cause system-wide suspend to fail (the
> hosting device would be suspended before the one depending on it).
>
> That may not be a concern here, but at least it would be good to
> document why it is not a concern.

I've been reading up on the component code and at least one of the msm
drivers that use it. I've also read part of the other thread that's
going on.

If device links work, why not use them? Also, are you trying this with
fw_devlink=on?

Looks like what you are missing (I can't tell without looking at the
DT/your specific driver) is a device link from the DSI bridge to the
I2C bridge/controller? If we add that, will things work properly? If
yes, why not add that?

Also, can you please add me to all the threads on this topic (if you
reply to them) so it's easier for me to reply?

Thanks,
Saravana
