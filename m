Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5C41D624
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B66EB4F;
	Thu, 30 Sep 2021 09:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DDD6EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:20:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d6so8847419wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=cWUu4gfUCIw1qfdMOzh1G0mXcnyINDcvR5YDhGm1cIk=;
 b=DEap/nntYuHPYdehDI3oC9J8mlrnnQUeK0Z+Ax/XhzIk/ffB72lJENarIyab15k7km
 GQGpvvXag209wCFNn8cBjn4SNy+ZjtjRX/ggx3X0GWmnedRAL5mnEJbm/iO98NHJCobA
 Ws1ChpCA8cffA5vbdvab0JmhjSSq1sGSBbUQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=cWUu4gfUCIw1qfdMOzh1G0mXcnyINDcvR5YDhGm1cIk=;
 b=TvlrO4JbvCDzpFiD2SXzZkfDzagj2yqmjirVtkdh43+6uX25JV/gnw7uqQrLF59Rug
 iuy+SQfZfMRt9t+TqplWCC80M70DL7ikYT2yfo/JPIGaFnsfZFhHpR0v5CeRKR/1dcBd
 jkJu8RWQjzGCv6/tGXCdqkQJVhTrCflD8HC9wGVl5Pn8u50UH81s2qTjyTIhCPVDcJhx
 DdzwnoWV3jHTuEPPnQkKK86lu/PwVunXPYv/yduyuJy6hoWiVIfbQr3Pbtpw4GeiUY3H
 xK3VJUbCZuFsevJ1eUCVAq6sCptlbuqZfjEhNoPdU5Sf0IW7MJARXMWDz/DfzdkoPHXZ
 UdFA==
X-Gm-Message-State: AOAM532zrE4ZwKe20xypRLjMfOeEoeEM/zruYY2e/4bw3JA4v3SWU2Xt
 FyYWYuKhgdh+vZH3F+8uwQFGfg==
X-Google-Smtp-Source: ABdhPJzq4mhFF0uQJUbJElFrf061CPJgYoqj5BalI56is+e0O68Ykt6BJmA0z74RxjPaX4FXXV+FTw==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr4951532wrz.337.1632993618649; 
 Thu, 30 Sep 2021 02:20:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o17sm2439103wrj.96.2021.09.30.02.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:20:08 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:19:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <YVWBP5ZJInH/wt1P@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
 <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
 <20210928083446.cfji7hmndt6a5nop@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928083446.cfji7hmndt6a5nop@gilmour>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 10:34:46AM +0200, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Sat, Sep 25, 2021 at 12:50:17AM +0200, Daniel Vetter wrote:
> > On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > > > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > >
> > > > > I added some debugs to print the addresses, and I am getting:
> > > > > [   38.813809] sudip crtc 0000000000000000
> > > > >
> > > > > This is from struct drm_crtc *crtc = connector->state->crtc;
> > > >
> > > > Yeah, that was my personal suspicion, because while the line number
> > > > implied "crtc->state" being NULL, the drm data structure documentation
> > > > and other drivers both imply that "crtc" was the more likely one.
> > > >
> > > > I suspect a simple
> > > >
> > > >         if (!crtc)
> > > >                 return;
> > > >
> > > > in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
> > > > I didn't check if there is possibly something else that needs to be
> > > > done too.
> > >
> > > Thanks for the decode_stacktrace.sh and the follow-up
> > >
> > > Yeah, it looks like we have several things wrong here:
> > >
> > >   * we only check that connector->state is set, and not
> > >     connector->state->crtc indeed.
> > >
> > >   * We also check only in startup(), so at open() and not later on when
> > >     the sound streaming actually start. This has been there for a while,
> > >     so I guess it's never really been causing a practical issue before.
> > 
> > You also have no locking
> 
> Indeed. Do we just need locking to prevent a concurrent audio setup and
> modeset, or do you have another corner case in mind?
> 
> Also, generally, what locks should we make sure we have locked when
> accessing the connector and CRTC state? drm_mode_config.connection_mutex
> and drm_mode_config.mutex, respectively?
> 
> > plus looking at ->state objects outside of atomic commit machinery
> > makes no sense because you're not actually in sync with the hw state.
> > Relevant bits need to be copied over at commit time, protected by some
> > spinlock (and that spinlock also needs to be held over whatever other
> > stuff you're setting to make sure we don't get a funny out-of-sync
> > state anywhere).
> 
> If we already have a lock protecting against having both an ASoC and KMS
> function running, it's not clear to me what the spinlock would prevent
> here?

Replicating the irc chat here. With

commit 6c5ed5ae353cdf156f9ac4db17e15db56b4de880
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Apr 6 20:55:20 2017 +0200

    drm/atomic: Acquire connection_mutex lock in drm_helper_probe_single_connector_modes, v4.

this is already taken care of for drivers and should be all good from a
locking pov.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
