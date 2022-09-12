Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49065B5E81
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D720310E604;
	Mon, 12 Sep 2022 16:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818010E5FC;
 Mon, 12 Sep 2022 16:48:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7841BB80DBF;
 Mon, 12 Sep 2022 16:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A17C433C1;
 Mon, 12 Sep 2022 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663001284;
 bh=h9EV557k36C+3muOY8zImqhUu/m9mCgOybmjNo1zImw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qafsqtfi0zCHhQ1KmtYTb6RXDokkQim0CcYRyPNsl8R/AgdAqgZU5UJYZXoQwd8Gd
 N4H3+JgSVeMTCVm1eV8vNYAJ4GOiOxtwzYbfTLA4wZuM5EeQ1peMKp3dcQ6bV7qKOK
 WQGMU2lWPJGZQi6ubjHbttiJgAbJtD4hti7OuO6jdH0cS75BnFIvTm/iwrKjMJa76w
 AX+sZzOQAt408jIYnrQAytacgTiN6Cvenco+ZMmZCLTZpNsYoueFpvSOZFkYAv7Ms6
 12mxS+Q2ifc/xDP/7XgtT2FVHhafsuALzwAKzk76XReznQJWWbjyFbUzaZPvndGCIt
 qdjxuB/utB45Q==
Date: Mon, 12 Sep 2022 18:47:56 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 19/37] drm/i915: stop using kernel-doc markups for
 something else
Message-ID: <20220912184756.61492ad1@coco.lan>
In-Reply-To: <Yx9LxciaH/y8fnRD@mdroper-desk1.amr.corp.intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <6405f00c4ba03987abf7635f4c62d86b40a0e521.1662708705.git.mchehab@kernel.org>
 <Yx9LxciaH/y8fnRD@mdroper-desk1.amr.corp.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew
 Brost <matthew.brost@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

Em Mon, 12 Sep 2022 08:09:57 -0700
Matt Roper <matthew.d.roper@intel.com> escreveu:

> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h  
> 
> Several of the comments in this file do appear to be kerneldoc (in fact
> kerneldoc that was specifically requested during code review at
> https://patchwork.freedesktop.org/patch/448456/#comment_804252) and this
> file is included from Documentation/gpu/i915.rst, so I think some of
> these changes might be moving in the wrong direction.  Should we instead
> focus on fixing up the comments that aren't quite formatted properly?

Those *appear* to be kernel-doc markups, but they aren't, because
the structs themselves are not properly marked. See, for instance
struct intel_context.

scripts/kerneldoc will *only* consider what's there as a proper
comment if you add:

	/**
	 * struct intel_context - describes an i915 context
	 * <add a proper description for it>
	 */
	struct intel_context {
		union {
			/** @ref: a kernel object reference */
	                struct kref ref; /* no kref_get_unless_zero()! */
			/** @rcu: a rcu header */
	                struct rcu_head rcu;
	        };
		...
	}

Describing all fields inside the struct. Just placing
	/** something */
on some random places in the middle doesn't make it a kernel-doc.

If you actually run kernel-doc in Werror mode:

	./scripts/kernel-doc -Werror -sphinx-version 2.4.4 drivers/gpu/drm/i915/gt/intel_context_types.h | echo "ERROR!"
	ERROR!
	drivers/gpu/drm/i915/gt/intel_context_types.h:1: warning: no structured comments found
	1 warnings as Errors

you'll see that this is currently broken.

Thanks,
Mauro
