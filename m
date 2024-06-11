Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AD904278
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 19:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C510E6ED;
	Tue, 11 Jun 2024 17:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="dyqmxkNk";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="Ml5lK8Jl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod3-cph3.one.com
 (mailrelay4-1.pub.mailoutpod3-cph3.one.com [46.30.211.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7156B10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Qjfn/Os7UgfKHW17xTm6YSwP+QP5TzFsj58ih+oI6+c=;
 b=dyqmxkNkGg9/QlJcKyB6ftUdEgNI3NWlhk+2DocnZ3HlO16lX02hdM0o9Ic3qiMAuEWNykvlo78wG
 dJ3kp6NKQtH6ieukQdnObiZj3/RU2R7q06iu2xjjqPzhEem0hwSxn1WAEHVPd6mTo+6k7XbNagXFZy
 lCVWpQtUMjt91IABy1h7angSzYG2/uk5Yr1ogsBPOKCGkxuksc48dZHnF5K4mIY3XnChNhzMjbSB7W
 7n32TNan7Mn+FZ63kywhoh4bVDXsQzp0zrRZgsV4RFIPiw5hIfzJnmB9Kk0EuBtUm1hDyqhlSZTNUh
 cgvYVy4QB45fGhPIcXB1DC4R4pKmCNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Qjfn/Os7UgfKHW17xTm6YSwP+QP5TzFsj58ih+oI6+c=;
 b=Ml5lK8JlfWIKgZ/vEkSqxIxEckVoH7Ww7zv+SEaAuWiMxLa9yUTJ6PWo8tRE2gxUPPQnvPJryScdS
 /spIuf8Bw==
X-HalOne-ID: bd6439f5-2818-11ef-bfeb-591fce59e039
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id bd6439f5-2818-11ef-bfeb-591fce59e039;
 Tue, 11 Jun 2024 17:33:41 +0000 (UTC)
Date: Tue, 11 Jun 2024 19:33:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Message-ID: <20240611173339.GA545417@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
 <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
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

Hi Robert, 
On Mon, Jun 10, 2024 at 02:53:09PM +0200, Robert Foss wrote:
> On Fri, 31 May 2024 22:37:44 +0200, Sam Ravnborg wrote:
> > I had a few bridge related patches in an old branch.
> > 
> > They were last posted here almost one year ago:
> > https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/
> > 
> > The following two patches gets rid of drm_bridge_chain_mode_fixup.
> > The patches was already rb / ab - but due to the age a repost is
> > due before applying the patches.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac4be1e50165
> [2/2] drm/bridge: Drop drm_bridge_chain_mode_fixup
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1f0204954583
> 
> 
> 
> Rob

Thanks!

Next step will be to address use of other deprecated operations
in drm_bridge_funcs.

	Sam
