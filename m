Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D341FB515
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 16:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B046E8D9;
	Tue, 16 Jun 2020 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96346E8D9;
 Tue, 16 Jun 2020 14:54:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21514579-1500050 for multiple; Tue, 16 Jun 2020 15:53:28 +0100
MIME-Version: 1.0
In-Reply-To: <20200616145452.GA25291@embeddedor>
References: <20200616145452.GA25291@embeddedor>
Subject: Re: [PATCH][next] drm/i915/selftests: Fix inconsistent IS_ERR and
 PTR_ERR
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Message-ID: <159231920737.18853.4543157798745594821@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 16 Jun 2020 15:53:27 +0100
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Gustavo A. R. Silva (2020-06-16 15:54:52)
> Fix inconsistent IS_ERR and PTR_ERR in live_timeslice_nopreempt().
> 
> The proper pointer to be passed as argument to PTR_ERR() is ce.
> 
> This bug was detected with the help of Coccinelle.
> 
> Fixes: b72f02d78e4f ("drm/i915/gt: Prevent timeslicing into unpreemptable requests")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Fair enough, I had sent out a patch that included this, but never split
it out for early adoption.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
