Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11ACCF2D0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 10:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21210E483;
	Fri, 19 Dec 2025 09:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="UeILbzt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B374F10E483
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:42:47 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id D8A681FAAA;
 Fri, 19 Dec 2025 10:42:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1766137366;
 bh=/3dvk2Nj9PI59XS93X1kk5arWe55byvH1Poq1Do4Ik4=; h=From:To:Subject;
 b=UeILbzt3cJml2PEbPssZlKKSE73zubudy5dBj4WlHfo0qWMm0OvoSCTz++/9Z+x0S
 TMfsO2q0W9dFLiItTWd0DZJoyU2apPC8EJeCqI638I1SJYTCLwzfnmOW/a2S4ZfEEv
 OysYgjM/FDNPQx1VRacn9T9hRpi79KjQZTjKZ2QRGA6nfHfayJ+DVWSf6lhSH6lWID
 4OyL1G/JVkcx9XVibbsc711Z+rEnNh8JkmMTgzqdVjaaSgba/LTkq52IdjoVluPEk0
 +fyLFzJH9RqLDaanYhAVxGDGRS9e9xZIkYjFWfSEB5ePNQ9TkWjCwrLxnVzHiIND+G
 1nE25IxrvoKjA==
Date: Fri, 19 Dec 2025 10:42:44 +0100
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
Subject: Re: [PATCH 2/7] drm/bridge: tc358768: Set pre_enable_prev_first for
 reverse order
Message-ID: <20251219094244.GB39796@francesco-nb>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
 <20251021-tc358768-v1-2-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tc358768-v1-2-d590dc6a1a0c@ideasonboard.com>
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

On Tue, Oct 21, 2025 at 04:22:58PM +0300, Tomi Valkeinen wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> Enable the pre_enable_prev_first flag on the tc358768 bridge to reverse
> the pre-enable order, calling bridge pre_enable before panel prepare.
> This ensures the bridge is ready before sending panel init commands in
> the case of panels sending init commands in panel prepare function.
> 
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

