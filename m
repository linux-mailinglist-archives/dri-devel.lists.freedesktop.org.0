Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A302B93EB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 14:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2CB6E517;
	Thu, 19 Nov 2020 13:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8737C6E517
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:52:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23042432-1500050 for multiple; Thu, 19 Nov 2020 13:52:13 +0000
MIME-Version: 1.0
In-Reply-To: <b8438d8f-bc6b-921d-adb2-cd6e25d70bdb@linux.intel.com>
References: <20201118163601.958254-1-tvrtko.ursulin@linux.intel.com>
 <160571907017.19853.2138891452982731448@build.alporthouse.com>
 <b8438d8f-bc6b-921d-adb2-cd6e25d70bdb@linux.intel.com>
Subject: Re: [PATCH] intel: Do not assert on unknown chips in
 drm_intel_decode_context_alloc
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Date: Thu, 19 Nov 2020 13:52:11 +0000
Message-ID: <160579393163.30679.15261134775534336025@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-11-19 13:42:07)
> 
> On 18/11/2020 17:04, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-11-18 16:36:01)
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> There is this long standing nit of igt/tools/intel_error_decode asserting
> >> when you feed it an error state from a GPU the local libdrm does not know
> >> of.
> >>
> >> To fix this I need a tweak in drm_intel_decode_context_alloc to make it
> >> not assert but just return NULL (which seems an already possible return
> >> value).
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Good riddance,
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Thanks, now how can push to drm and is there some testing to be 
> triggered before, or after?

cd intel; for i in tests/gen*.sh; do $i; done

But clearly I haven't built libdrm since automake was dropped.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
