Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFAB0F236
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 14:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285210E16C;
	Wed, 23 Jul 2025 12:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n0oRYKzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1463D10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A3045C5D06;
 Wed, 23 Jul 2025 12:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C9FC4CEE7;
 Wed, 23 Jul 2025 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753273688;
 bh=AU+ZIa1G6D9rjfQjIunyEIntuf2L1dafuWtnlP0A0Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0oRYKzXdwPTrCEm2QRJLSnz9cuRDx/l0eBkDKDbxwoZNNrDW4AluzB+hvEtQBUNL
 ak3lp+UelHKS+uCQ9HN6NpPvaIb/nMVT8LHrw4HHejvu9A4ncAYEaBeIUML6zvDxJs
 +o5/FbTVAZMiaL3zoeTufZhN4EjozDAD9sVEcMHEWhk7/p8rw7WOvuwnm7hD829n3x
 xxmgwjVsfExCyBCdAsR7GzjesrLC98Iqt/EXKORQTxSvk9ouIhtHl1jimjYrc3gtlq
 gXYNf30B6pRllQQqJkD5rqDX3LWZj5rWP5Vr0Y6sMaWmUJck3gvXnzhTGXhW692twC
 hMO91kswwrrAQ==
Date: Wed, 23 Jul 2025 17:58:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Devarsh Thakkar <devarsht@ti.com>,
 Parth Pancholi <parth.pancholi@toradex.com>
Subject: Re: [PATCH v4 05/17] phy: cdns-dphy: Remove leftover code
Message-ID: <aIDVVRS0bcdjs5q_@vaman>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>
 <aF3YgKoaLniqs1XC@vaman>
 <cd59d7b0-6b31-4cbd-93e8-df713a9210f6@ideasonboard.com>
 <b3af4b52-03e0-4e41-9666-a9af267f57b0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3af4b52-03e0-4e41-9666-a9af267f57b0@ideasonboard.com>
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

On 23-07-25, 11:49, Tomi Valkeinen wrote:
> Hi Vinod,
> 
> (I accidentally sent my mail only to you. List added here).
> 
> On 23/07/2025 10:36, Tomi Valkeinen wrote:
> > Hi Vinod,
> > 
> > On 27/06/2025 02:32, Vinod Koul wrote:
> >> On 18-06-25, 12:59, Tomi Valkeinen wrote:
> >>> The code in cdns-dphy has probably been part of a DSI driver in the
> >>> past. Remove DSI defines and variables which are not used or do not
> >>> actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
> >>> cdns_dphy_get_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.
> >>
> >> Acked-by: Vinod Koul <vkoul@kernel.org>
> >>
> > 
> > Are you fine merging the two cdns-dphy patches (this and 4/17) via drm
> > tree? I think that's the easiest way to merge this.
> > 
> > I could also drop the 5/17 patch from the series, as it's just a
> > cleanup, and it could be merged at some later point via phy tree.
> 
> Actually, I take that back. Devarsh also has some cdns-dphy patches,
> which depend on my patches. It could get messy.
> 
> There's no compile-time dependency, and my DRM series doesn't depend on
> the dphy changes even at runtime. I think it's best if I drop the dphy
> changes from my series and send them separately.

Okay sounds good to me.. Easier to handle that way

-- 
~Vinod
