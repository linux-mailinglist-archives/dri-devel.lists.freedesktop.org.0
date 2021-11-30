Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62218463BCF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331B89FD1;
	Tue, 30 Nov 2021 16:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8643F89FD1;
 Tue, 30 Nov 2021 16:33:13 +0000 (UTC)
Date: Tue, 30 Nov 2021 17:33:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638289991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlrkKRjry6Z/mnNwslRoD3PA5GVO9PCdB3soxYzHl44=;
 b=guxNpgdFCv41mfy1V885JnPNSWaauWHhdptLxJ6ihKKXd3lKC/i0vSMEq2u75ZZuJwyTx9
 kBMWt+6GhhzUyeXJdLvQz4OOqQt+1azAvOiH7BgYDL1iw3a3h6RCOAnKBC5GvcroelJWfi
 9oMQkYBT8ljwwPGC7mch8oqdTwKvRWNhpIzea79c3mDgO9rDKVz6IkQ+ZbK0TCjppHUC91
 4PxjLm1W4S013bIEn/6fIc0Z9eZkAoJvMWRZP0Un1/TjrAEQi+OfFprhs3WTrThyUUYW4W
 C87BPGGPLfIS5kb8Ql/nRZ51mMILan9Vu24LykPUbK8C4vfL9/CEbjSrifhlVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638289991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlrkKRjry6Z/mnNwslRoD3PA5GVO9PCdB3soxYzHl44=;
 b=0LDtgM7ReYFgj4MxjlFJuHuHED2P8IBCqrCDnPEv660hLbBQ82mJRNW7QHjWEpD1W5+mnN
 3BQ6Fg293TjdmPAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Message-ID: <20211130163309.kvw6kbuzwurnqlt7@linutronix.de>
References: <20211118165914.pckik75emivsilek@linutronix.de>
 <YZfK8LDcGzQEchel@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZfK8LDcGzQEchel@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-19 17:04:00 [+0100], Daniel Vetter wrote:
> Yeah if we can simplify this with reverts then I'm all for this.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I've asked drm/i915 maintainers to check&merge.

Thanks. Should I repost my queue (excluding this one) or should wait
until this one has been taken care?

> -Daniel

Sebastian
