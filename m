Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657AB2E7EA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 00:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA92A10E7FF;
	Wed, 20 Aug 2025 22:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Be+ScVT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B1B10E28C;
 Wed, 20 Aug 2025 22:05:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C661A54B57;
 Wed, 20 Aug 2025 22:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422AEC4CEE7;
 Wed, 20 Aug 2025 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755727551;
 bh=K7NoCp+2AVNWciQ/2UHCi7p4qErGtCwcRd2CVfOOxIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Be+ScVT8xncC2+Qds1un3y001w3mRTRK1MqJZehlB9bstGYooTeDAbBEq6nqEhi/t
 fCZ51BLg/jhqn94dxC8w7lQzjYlbsVkpk3UtM6HcxZ5SYz4zjDW5V9fiBrANJQHBu8
 0skDtkvqjw+Ltxdx7M/q3xaF6DFO5w2dlZWHo51Yqc4BMuR9VXJjdYDoFbC1O8g91Q
 NB/tBrzhog1I8i/87UiSu0eMD0kLVR3G8VPGNmZ6uELF19aK6Z/+lBncFQ2Bm5KQgW
 HluDs7kbVN2AGSWC9DHXETjH8OiHv80oRa0P52k7KpKcBWbp3kTi5J7nmXBjvzSZIR
 Pj1Tphyr2ZRCQ==
Date: Wed, 20 Aug 2025 21:05:46 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Add synchronization on interrupt enable flag
Message-ID: <qgxgnqpprpa4n6b7d4ht5jzh56lv5rn7qfo2d5gbp273gfn4hp@grgm7jx2xnd2>
References: <20250819160010.3386940-1-zhanjun.dong@intel.com>
 <lbmfdys7nox2zaookqtr5abqtd6octniabd63whf6orvhgvgi5@gm6pbo26nzfz>
 <da31eaac-6f84-4e4f-8f18-f2268824f3f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da31eaac-6f84-4e4f-8f18-f2268824f3f8@intel.com>
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

Hi Zhanjun,

...

> > On Tue, Aug 19, 2025 at 12:00:10PM -0400, Zhanjun Dong wrote:
> > > Boolean flag access from interrupt context might have synchronous issue on
> > 
> > /synchronous/synchronization/
> > /issue/issues/
> > 
> > > multiple processor platform, flage modified by one core might be read as an
> > 
> > /flage/flags/
> > 
> > > old value by another core. This issue on interrupt enable flag might causes
> > > interrupt missing or leakage.
> > 
> > /missing/misses/
> > 
> > > Fixed by change the data type as automic to add memory synchronization.
> > 
> > This can be re-written: "Change the interrupts.enable type to
> > atomic to ensure memory synchronization."
> Will follow all above comments

No need to resend for this if the patch is fine.

> > > Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
> > 
> > What issue are you exactly trying to fix? And have you tested
> Will add:
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
> 
> > that this patch is this really fixing it? Where is the flag's
> CI report this issue about every 1 or 2 months and close it because no
> reproduce.
> I can reproduce it in about 1000 rounds(about 9 hours) of IGT test but not
> at 100% rate, so it is hard to say really fixed because of hard to
> reproduce.
> My latest test runs 2200 rounds in total has no reproduce.
> 
> > misalignment happening?
> > 
> > Please remember that when in interrupt context you are already
> > running in atomic, so that probably you don't need to have an
> > additional atomic access to variables.
> Interrupt context only read it. When the flag was changed and interrupt was
> triggered in very short time, the flag read at interrupt context might read
> out old value, if other core(non interrupt context) set the flag and ISR
> read out 0, ISR will do simple return and misses interrupt handling, making
> it appear as lost interrupt; if other core clear the flag and ISR read out
> 1, ISR will continue to run and not stop as expected, making it appear as an
> interrupt leak. >

Heh... it looks to me very unlikely to happen, but if you say
that this fixes it, then I'm OK with the patch.

I see still one case missing: the error comes here:

  ct_try_receive_message+0x336/0xa10

that is the tasklet that starts after the IRQ. Has the flag
changed from the irq to the tasklet? :-)

Would it make sense to add something like:

@@ -1338,6 +1338,9 @@ static void ct_receive_tasklet_func(struct tasklet_struct *t)
 {
        struct intel_guc_ct *ct = from_tasklet(ct, t, receive_tasklet);

+       if (!atomic_read(&guc->interrupts.enabled))
+               return;
+
        ct_try_receive_message(ct);
 }

BTW, have you tried adding a simple memory barrier (even though
in the i915 community people dislike memory barriers, but with a
proper explanation it might save us all this churn).

Thanks,
Andi
