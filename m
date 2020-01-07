Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5707013262F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2436E04B;
	Tue,  7 Jan 2020 12:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4C86E04B;
 Tue,  7 Jan 2020 12:29:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19795353-1500050 for multiple; Tue, 07 Jan 2020 12:29:21 +0000
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200107121547.GA4871@pendragon.ideasonboard.com>
References: <20200107113031.435604-1-boris.brezillon@collabora.com>
 <20200107121547.GA4871@pendragon.ideasonboard.com>
Message-ID: <157840015879.2273.18446207088808982359@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/bridge: Fix a NULL pointer dereference in
 drm_atomic_bridge_chain_check()
Date: Tue, 07 Jan 2020 12:29:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2020-01-07 12:15:47)
> Hi Boris,
> 
> Thank you for the patch.
> 
> On Tue, Jan 07, 2020 at 12:30:31PM +0100, Boris Brezillon wrote:
> > drm_atomic_bridge_chain_check() callers can pass a NULL bridge. Let's
> > bail out before derefencing the bridge pointer when that happens.
> > 
> > Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Fixes: b86d895524ab ("drm/bridge: Add an ->atomic_check() hook")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

CI is back to its normal grumpy self,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
