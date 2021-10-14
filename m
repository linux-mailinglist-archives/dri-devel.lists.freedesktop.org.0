Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C142DA14
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A228921B;
	Thu, 14 Oct 2021 13:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7198921B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:15:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z20so24283953edc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=n3coqaAceHJmnxKZE3WcweM+H54H9PXa64FROviQwXc=;
 b=El2+XBVQkWyKVVqfjDtms+WPXec59LVoF9Pf8yShT7XK5ZewdTTfkJtKF6n9BMAOnh
 xE+RyWgdVKeVBZHxmpH3EjfA/gk532DsStDuneZqqZmt2h9Z8rMvcA4+oungAReQnI/M
 cOhTYZdw2Hv/P5I1HevX/LXnxxgfOKqpQOjF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=n3coqaAceHJmnxKZE3WcweM+H54H9PXa64FROviQwXc=;
 b=jnzZz+ZD2r70uiVCURM6SrBkBT8HjHSlmQKxnSftKLoFGIW/Kl1GV+8DRZhvCLyY1t
 2u+AEDimmbvcY2XdEmqCKAGp9DKI+M2mOwZelS6T0mDWKU1RT7af4/FHblJKMWS1dzlV
 KmqPEBMkR4dKHVhlLQh2On27s0PU6/wCBKXAL0LEVkunlSVjdGxnBR+MxZ822Ur8BKLA
 ZZYKSabaNXue+8Nr9ZPstCTh7DuxlOqvLyyBLrjZiADO95b/u9TNGstOAgWBMy2W9TGc
 nZovD9/c2Nc35XA/LgsvYGUUHCZhTU05OBbEfvTYbLiTUNMHT0h5TJzkcKbPIcQk2+cg
 kpgA==
X-Gm-Message-State: AOAM532DtD65+ScPeSKgV30ZzdwyLpY5qn+PJ7KP/A42H2/6u8dWmLLn
 pTULfpei9/JPxh5U0fSnWH+t8g==
X-Google-Smtp-Source: ABdhPJwaIZ5XypQBVAQgZvHYvCim3hFp2xl5auLuEofoHJo2bGDB2ux2yDxpl/4ObTBsYJH65/W+BQ==
X-Received: by 2002:a17:906:c248:: with SMTP id
 bl8mr3728279ejb.360.1634217338674; 
 Thu, 14 Oct 2021 06:15:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j22sm1924170ejt.11.2021.10.14.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:15:38 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:15:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <YWgteNaNeaS9uWDe@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
 <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
 <20210928083446.cfji7hmndt6a5nop@gilmour>
 <YVWBP5ZJInH/wt1P@phenom.ffwll.local>
 <20211013150103.p3rea3ny3rjmohtd@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013150103.p3rea3ny3rjmohtd@gilmour>
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

On Wed, Oct 13, 2021 at 05:01:03PM +0200, Maxime Ripard wrote:
> On Thu, Sep 30, 2021 at 11:19:59AM +0200, Daniel Vetter wrote:
> > On Tue, Sep 28, 2021 at 10:34:46AM +0200, Maxime Ripard wrote:
> > > Hi Daniel,
> > > 
> > > On Sat, Sep 25, 2021 at 12:50:17AM +0200, Daniel Vetter wrote:
> > > > On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > > > > > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > > > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > > > >
> > > > > > > I added some debugs to print the addresses, and I am getting:
> > > > > > > [   38.813809] sudip crtc 0000000000000000
> > > > > > >
> > > > > > > This is from struct drm_crtc *crtc = connector->state->crtc;
> > > > > >
> > > > > > Yeah, that was my personal suspicion, because while the line number
> > > > > > implied "crtc->state" being NULL, the drm data structure documentation
> > > > > > and other drivers both imply that "crtc" was the more likely one.
> > > > > >
> > > > > > I suspect a simple
> > > > > >
> > > > > >         if (!crtc)
> > > > > >                 return;
> > > > > >
> > > > > > in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
> > > > > > I didn't check if there is possibly something else that needs to be
> > > > > > done too.
> > > > >
> > > > > Thanks for the decode_stacktrace.sh and the follow-up
> > > > >
> > > > > Yeah, it looks like we have several things wrong here:
> > > > >
> > > > >   * we only check that connector->state is set, and not
> > > > >     connector->state->crtc indeed.
> > > > >
> > > > >   * We also check only in startup(), so at open() and not later on when
> > > > >     the sound streaming actually start. This has been there for a while,
> > > > >     so I guess it's never really been causing a practical issue before.
> > > > 
> > > > You also have no locking
> > > 
> > > Indeed. Do we just need locking to prevent a concurrent audio setup and
> > > modeset, or do you have another corner case in mind?
> > > 
> > > Also, generally, what locks should we make sure we have locked when
> > > accessing the connector and CRTC state? drm_mode_config.connection_mutex
> > > and drm_mode_config.mutex, respectively?
> > > 
> > > > plus looking at ->state objects outside of atomic commit machinery
> > > > makes no sense because you're not actually in sync with the hw state.
> > > > Relevant bits need to be copied over at commit time, protected by some
> > > > spinlock (and that spinlock also needs to be held over whatever other
> > > > stuff you're setting to make sure we don't get a funny out-of-sync
> > > > state anywhere).
> > > 
> > > If we already have a lock protecting against having both an ASoC and KMS
> > > function running, it's not clear to me what the spinlock would prevent
> > > here?
> > 
> > Replicating the irc chat here. With
> > 
> > commit 6c5ed5ae353cdf156f9ac4db17e15db56b4de880
> > Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Date:   Thu Apr 6 20:55:20 2017 +0200
> > 
> >     drm/atomic: Acquire connection_mutex lock in drm_helper_probe_single_connector_modes, v4.
> > 
> > this is already taken care of for drivers and should be all good from a
> > locking pov.
> 
> So, if I understand this properly, this superseeds your comment on the
> spinlock for the hw state, but not the comment that we need some locking
> to synchronize between the audio and KMS path (and CEC?). Right?

Other way round. There's 3 things involved here:
1. kms output probe code
2. kms atomic commit code
3. calls from asoc side

The above referenced commit makes sure 1&2 are synchronized. The problem
is that 2&3 are not synchonronized, and from 3, no matter how much locking
you have, you cannot look at kms state. I.e. not allowed to look at
crtc->state for example, irrespective of whether you're holding
drm_modeset_lock or not. This is because the atomic nonblocking commit is
done without holding any locks, protection is purely down to ownership
rules of state structures and ordering (through drm_crtc_commit) of
in-flight nonblocking atomic commits.

That's why you need a sperate lock _and_ copy state, so taht 2&3 stay in
sync.

In practice you only care about modeset changes from 2 vs anything from 3,
and most userspace does modeset atomic commits as blocking commits, which
means you won't notice that your locking has gaps.

btw same problem exists between atomic and (vblank) irq handler. There you
need a irqsafe spinlock and you also have to copy (because the irq handler
just cannot access ->state in any safe way, because it doesn't own that
structure).

This is maybe a bit the confusing thing with atomic commit: ->state isn't
protected by locks, but through ownership rules. Only for atomic check is
->state protected by locks, but once we're committed we switch over to
ownership rules for protection. swap_states() is that point of no return.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
