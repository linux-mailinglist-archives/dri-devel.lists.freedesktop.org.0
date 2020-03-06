Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11D17BB1F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 12:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49DA6ECD8;
	Fri,  6 Mar 2020 11:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF326ECD5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 11:04:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20465561-1500050 for multiple; Fri, 06 Mar 2020 11:04:38 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
References: <04221997-79ba-f8a2-4f2d-3c3d9f5219bc@infradead.org>
In-Reply-To: <04221997-79ba-f8a2-4f2d-3c3d9f5219bc@infradead.org>
Message-ID: <158349267722.20069.17505391287458085225@skylake-alporthouse-com>
Subject: Re: [PATCH] drm: unbreak the DRM menu, broken by DRM_EXPORT_FOR_TESTS
Date: Fri, 06 Mar 2020 11:04:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Randy Dunlap (2020-03-06 01:26:10)
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Unbreak the DRM menu. This Kconfig symbol does not depend on DRM,
> so the menu is broken at that point.
> 
> Move the symbol to a location in the Kconfig file so that it does
> not break the dependency continuity.

I suspect it was me, thanks for fixing it!
 
> Fixes: 6349120ddcbf ("drm: Move EXPORT_SYMBOL_FOR_TESTS_ONLY under a separate Kconfig")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
