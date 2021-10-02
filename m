Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDB41FBBD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 14:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF56E840;
	Sat,  2 Oct 2021 12:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE396E840;
 Sat,  2 Oct 2021 12:17:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B56A661B00;
 Sat,  2 Oct 2021 12:17:52 +0000 (UTC)
Date: Sat, 2 Oct 2021 08:17:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Caz Yokoyama
 <caz.yokoyama@intel.com>, LKML <linux-kernel@vger.kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [BUG 5.15-rc3] kernel BUG at
 drivers/gpu/drm/i915/i915_sw_fence.c:245!
Message-ID: <20211002081750.7eec92dd@oasis.local.home>
In-Reply-To: <259ff554-76b8-8523-033-9e996f549c70@google.com>
References: <20211002020257.34a0e882@oasis.local.home>
 <259ff554-76b8-8523-033-9e996f549c70@google.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 2 Oct 2021 03:17:29 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> Yes (though bisection doesn't work right on this one): the fix

Interesting, as it appeared to be very reliable. But I didn't do the
"try before / after" on the patch.

> https://lore.kernel.org/lkml/1f955bff-fd9e-d2ee-132a-f758add9e9cb@google.com/
> seems to have got lost in the system: it has not even appeared in
> linux-next yet. I was going to send a reminder later this weekend.
> 
> Here it is again (but edited to replace "__aligned(4)" in the original
> by the official "__i915_sw_fence_call" I discovered afterwards; and
> ignoring recent discussions of where __attributes ought to appear :-)
> 
> 
> [PATCH] drm/i915: fix blank screen booting crashes

Thanks, I added it to my "fixes" patch set that I apply before testing.
It looks to have done the trick, and the kernel boots now.

Tested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

