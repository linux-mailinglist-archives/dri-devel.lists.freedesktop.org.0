Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657841E47D7
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041989C53;
	Wed, 27 May 2020 15:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE2F89C53;
 Wed, 27 May 2020 15:44:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21311296-1500050 for multiple; Wed, 27 May 2020 16:43:53 +0100
MIME-Version: 1.0
In-Reply-To: <20200527140526.1458215-2-arnd@arndb.de>
References: <20200527140526.1458215-1-arnd@arndb.de>
 <20200527140526.1458215-2-arnd@arndb.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: work around false-positive
 maybe-uninitialized warning
Message-ID: <159059423232.30979.11698525690770673738@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 27 May 2020 16:43:52 +0100
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 "Robert M. Fosha" <robert.m.fosha@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-05-27 15:05:09)
> gcc-9 gets confused by the code flow in check_dirty_whitelist:
> 
> drivers/gpu/drm/i915/gt/selftest_workarounds.c: In function 'check_dirty_whitelist':
> drivers/gpu/drm/i915/gt/selftest_workarounds.c:492:17: error: 'rsvd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> I could not figure out a good way to do this in a way that gcc
> understands better, so initialize the variable to zero, as last
> resort.

Does it look neater if we initialise it as a local? No.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
