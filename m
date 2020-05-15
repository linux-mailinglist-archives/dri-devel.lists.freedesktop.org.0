Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97611D5AB9
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 22:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431A66ED3D;
	Fri, 15 May 2020 20:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782CC6ED38;
 Fri, 15 May 2020 20:34:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21209340-1500050 for multiple; Fri, 15 May 2020 21:33:59 +0100
MIME-Version: 1.0
In-Reply-To: <20200428213106.3139170-1-arnd@arndb.de>
References: <20200428213106.3139170-1-arnd@arndb.de>
To: Ville Syrjälä <ville.syrjala@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: avoid unused scale_user_to_hw() warning
Message-ID: <158957483736.29850.5194177335053419155@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 15 May 2020 21:33:57 +0100
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-04-28 22:30:50)
> After the function is no longer marked 'inline', there
> is now a new warning pointing out that the only caller
> is inside of an #ifdef:
> 
> drivers/gpu/drm/i915/display/intel_panel.c:493:12: warning: 'scale_user_to_hw' defined but not used [-Wunused-function]
>   493 | static u32 scale_user_to_hw(struct intel_connector *connector,
>       |            ^~~~~~~~~~~~~~~~
> 
> Move the function itself into that #ifdef as well.
> 
> Fixes: 81b55ef1f47b ("drm/i915: drop a bunch of superfluous inlines")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-b: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
