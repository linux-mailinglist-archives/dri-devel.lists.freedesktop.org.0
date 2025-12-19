Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B53CCF5C4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778C10EEBB;
	Fri, 19 Dec 2025 10:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="d4/pmGlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3DD10EEBB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:29:10 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 588FB1FA97;
 Fri, 19 Dec 2025 11:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1766140148;
 bh=3M+i0ka5MgmLUh1TscMPlMfUsSIIggzwq8KcUgx5iY8=; h=From:To:Subject;
 b=d4/pmGlfMEWJB+KN+0gRHGEFj4qLfp3/pkUHcIkYcJwbYb0o/vqwvYU7IfjBSrG2h
 OneM4Y96S1KablTtJTj7xQfnuxLQ/73HfH+o2GszEg34kkNHHzxNc3ruNeKlO4Hwxy
 rSFkwoBXfxYEyVYFGMxoqmzLiiKcxVjeo/EPkjLO2FZjruQAYI1iPM++GgBH3V3x0B
 ONnd9+up6q4WBRvcRn5i7hWu+yCZI8Pc/+iH6VUv5kBIQQ1tzXqbZ+EDomxH4z7RTk
 JolV6MtuZBgpKrK/6Ng91yCuEo9eVpX/tEz3zKA9Mhml5UH+qHYpbI1QYvhqmEL+z+
 NQVZ2KaUJF7Ig==
Date: Fri, 19 Dec 2025 11:29:07 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Parth Pancholi <parth.pancholi@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/bridge: tc358768: Separate indirect register
 writes
Message-ID: <20251219102907.GC39796@francesco-nb>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
 <20251021-tc358768-v1-3-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tc358768-v1-3-d590dc6a1a0c@ideasonboard.com>
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

On Tue, Oct 21, 2025 at 04:22:59PM +0300, Tomi Valkeinen wrote:
> Some registers can only be written indirectly, using DSI_CONFW register.
> We don't have many uses for those registers (in fact, only DSI_CONTROL
> is currently written), but the code to do those writes inline is a bit
> confusing.
> 
> Add a new function, tc358768_confw_update_bits() which can be used to
> write the bits indirectly. Only DSI_CONTROL is currently supported.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

