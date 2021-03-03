Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3632B546
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 07:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727A16E8BF;
	Wed,  3 Mar 2021 06:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6A26E8BF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 06:44:40 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E5AF29A;
 Wed,  3 Mar 2021 07:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614753878;
 bh=QNWIXcuT5ctaLq9GwC4u36+GFF+ZHiWvrrVne0WxIho=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pgfJlbE6f52vUqZJ7VFgBw0Rava+EUlszTND004UUpkNLSRy6KvtER8iSo/o2dxgq
 cENZIKlWjmNieJLiOruXRayYbxBXFdHjHWppfQeU13Z0h4i7ATU2RbJRIMIWY9PGbf
 obkqrjs5lT2vGnINNOlLJmxk9TkpZ9PuEskPKWfY=
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <60b4143d-2b5b-a4c3-0bba-14db15aa9a65@ideasonboard.com>
Date: Wed, 3 Mar 2021 08:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210227214542.99961-1-sebastian.reichel@collabora.com>
Content-Language: en-US
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/02/2021 23:45, Sebastian Reichel wrote:
> From: Sebastian Reichel <sre@kernel.org>
> 
> Disable TE for Droid 4 panel, since implementation is currently
> broken. Also disable it for N950 panel, which is untested.
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> I suggest to start by fix the regression like this and look into
> proper Droid 4 TE support separatly. Assumption is, that Tomi
> tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
> is untested [*], so choosing safe default. Patch is compile-tested
> only.
> 
> [*] N950 display is not yet functional on mainline, since it needs
> the omap3 FIFO workaround:
> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?h=n950-display-tony&id=d4cbc226a30b29bf2583ffff97b052c9ec68c8a3
> ---
>   drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
