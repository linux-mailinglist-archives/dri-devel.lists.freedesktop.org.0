Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488605E9BF3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 10:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612310E64B;
	Mon, 26 Sep 2022 08:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5D110E64B;
 Mon, 26 Sep 2022 08:26:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E643ACE109B;
 Mon, 26 Sep 2022 08:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A8BC43470;
 Mon, 26 Sep 2022 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664180756;
 bh=App1ZjPH8nkKBwK8Hhjqf0mfR2s8++nd8clCs0X/edI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qxxJdB5QU2RfOjTWBoZ63EhYxEYw326xMhU+YxYSrEkbdhAv/Avr6uKiT9iZZs7nE
 F8ELI+H8nVVHB4YoHTa0Qa1dZAr1OPF8G+N/muNxMgn+lM4hVHoBiQag49PIq421xM
 abc5j6+D30N/JqptqcFV2wxTuQNS6k30R2nT1yHNpSNYU9YHfOfbkKP55bdCFwp/Xd
 xf8UiT5zat7955XASia1noCEGiRUs+NM4URexoifb6q+K66tAiUDvY/tzxCH65e7qX
 sngqrF6PnbGHE6dBoQFSuzbFyyOwLr04q4jKufTEL6cEI4ghWOO0CWoujPIV9RP+g6
 ueqFLwtuzlPMQ==
Date: Mon, 26 Sep 2022 10:25:51 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 19/37] drm/i915: stop using kernel-doc
 markups for something else
Message-ID: <20220926102551.55278f31@coco.lan>
In-Reply-To: <Yx9qCCmxnSM06CgH@mdroper-desk1.amr.corp.intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <6405f00c4ba03987abf7635f4c62d86b40a0e521.1662708705.git.mchehab@kernel.org>
 <Yx9LxciaH/y8fnRD@mdroper-desk1.amr.corp.intel.com>
 <20220912184756.61492ad1@coco.lan>
 <Yx9qCCmxnSM06CgH@mdroper-desk1.amr.corp.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Mon, 12 Sep 2022 10:19:04 -0700
Matt Roper <matthew.d.roper@intel.com> escreveu:

> > Those *appear* to be kernel-doc markups, but they aren't, because
> > the structs themselves are not properly marked. See, for instance
> > struct intel_context.
> > 
> > scripts/kerneldoc will *only* consider what's there as a proper
> > comment if you add:
> > 
> > 	/**
> > 	 * struct intel_context - describes an i915 context
> > 	 * <add a proper description for it>
> > 	 */
> > 	struct intel_context {
> > 		union {
> > 			/** @ref: a kernel object reference */
> > 	                struct kref ref; /* no kref_get_unless_zero()! */
> > 			/** @rcu: a rcu header */
> > 	                struct rcu_head rcu;
> > 	        };
> > 		...
> > 	}
> > 
> > Describing all fields inside the struct. Just placing
> > 	/** something */
> > on some random places in the middle doesn't make it a kernel-doc.  
> 
> Right, what we have today is incomplete/incorrect.  But I think we
> should be fixing that by adding the missing documentation on the
> structure, rather than giving up and removing the kerneldoc.  The end
> goal should be to have proper generated documentation, not just silence
> the warnings while leaving the actual output incomplete.

The end goal is to have *real* kernel-doc markups, not fake ones.
We're aiming towards there, where the first step is to get rid of the
ones that just pretend to be kernel-doc without really being validated
in order to check if they produce a valid content.

See, what we have so far are just comments. Some examples from this
patch:

	/** Powers down the TV out block, and DAC0-3 */
	 #define CH7017_TV_POWER_DOWN_EN		(1 << 5)

Currently, kernel-doc doesn't have any markup for not-function defines.

What we do to document this at kernel-doc is to either:

1. convert to an enum;
2. embed it inside some struct (or function) definition.

Other examples: this is not a Kernel-doc markup:

	/** @file
	  * driver for the Chrontel 7xxx DVI chip over DVO.
	  */

Neither this:

	/**
 	 * active: Active tracker for the rq activity (inc. external) on this
 	 * intel_context object.
 	 */
 
In summary, what happens is that those "/**" tags removed on this patch are
just pretending to be Kernel-doc, but they aren't anything. See, when a newbie
starts programming in C code, without having a compiler, lots of syntax
issues will happen. When they try to compile their code, hundreds or errors
and warnings happen. That's basically what it is happening here.

See, the very basic syntax thing is missing: just like a C file requires
that all codes to be inside functions, a kernel-doc field description 
requires a kernel-doc markup for the struct/function/enum/union that
contains it.

-

Now, I fully agree that the end goal is to have proper kernel-doc markups.

Adding those require a lot of archaeological work, looking at the git
commits which introduced the changes. Patch 34/37, for instance, does
that for struct drm_i915_gem_object:

	https://lists.freedesktop.org/archives/intel-gfx/2022-September/305736.html

See, besides adding a real Kernel-doc markup for the struct:

	+/**
	+ * struct drm_i915_gem_object - describes an i915 GEM object
	+ */
	 struct drm_i915_gem_object {

It had to fix several sintax and semantic mistakes:

Typos:

	/**
-	 * @shared_resv_from: The object shares the resv from this vm.
+	 * @shares_resv_from: The object shares the resv from this vm.
 	 */

Invalid kernel-doc markups:

	 	/**
	-	 * @mem_flags - Mutable placement-related flags
	+	 * @mem_flags: Mutable placement-related flags

Kernel markups that miss that they're on an embedded struct inside
the main one (thus those are also invalid kernel-doc markups):

                /**
-                * @shrink_pin: Prevents the pages from being made visible to
+                * @mm.shrink_pin: Prevents the pages from being made visible to


Etc.

Thanks,
Mauro
