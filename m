Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF790137118
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 16:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E436EA31;
	Fri, 10 Jan 2020 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3548E6EA31;
 Fri, 10 Jan 2020 15:25:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19836001-1500050 for multiple; Fri, 10 Jan 2020 15:25:05 +0000
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200110151807.2863347-1-arnd@arndb.de>
References: <20200110151807.2863347-1-arnd@arndb.de>
Message-ID: <157866990449.10140.9828490570954762660@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] i915: ggtt: include asm/smp.h
Date: Fri, 10 Jan 2020 15:25:04 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-01-10 15:17:54)
> Splitting up the i915_gem_gtt caused a build failure in some configurations:
> 
> drivers/gpu/drm/i915/gt/intel_ggtt.c: In function 'ggtt_restore_mappings':
> drivers/gpu/drm/i915/gt/intel_ggtt.c:1239:3: error: implicit declaration of function 'wbinvd_on_all_cpus'; did you mean 'wrmsr_on_cpus'? [-Werror=implicit-function-declaration]
>    wbinvd_on_all_cpus();
>    ^~~~~~~~~~~~~~~~~~
>    wrmsr_on_cpus
> 
> Add the missing header file.
> 
> Fixes: 2c86e55d2ab5 ("drm/i915/gtt: split up i915_gem_gtt")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I ran into this bug a few days ago on linux-next. Please just ignore
> if it's already fixed in the meantime.

Fixed applied this morning, thanks for the fixup anyway.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
