Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484EFAEAAA0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98C10E2FC;
	Thu, 26 Jun 2025 23:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PPmlCSmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066410E926
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 258CD5C63E5;
 Thu, 26 Jun 2025 23:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA556C4CEEB;
 Thu, 26 Jun 2025 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750980736;
 bh=p9T5tKbPyQn9WU/Ctj4Au9KigTyc9WURcP91i9yJwPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPmlCSmoLgBO0j/SIml3aZayN9reJ2oZPPNkIycp8F5PROgpVZ2ClK6knBSuobp3C
 /CJ6DR6IbJqEhMD+I6HFWvSeCPTB4apGNMaqdd9VzKncvWmymd6bjm8AxinS4EqWzm
 0VHsUFCyvkaxy3JjRVkXfHGt9TdC+HMJP2ovmI5EVccNvkjBcCItOvFHXD9DYZYpp9
 7nPf60OAqsa6KsDpnj45VAhMEj/KRQoL+iem2n02bsC2MUiPOuZO5kny23ecJyAcOb
 la/I1Txteu/H1XFFbJUyoHixZsLZbtfWEG7o3a0oxr689bbVYUWUX7HVj1L5Qfn2iy
 01ZEtuwJP3v2Q==
Date: Thu, 26 Jun 2025 16:32:16 -0700
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
Message-ID: <aF3YgKoaLniqs1XC@vaman>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>
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

On 18-06-25, 12:59, Tomi Valkeinen wrote:
> The code in cdns-dphy has probably been part of a DSI driver in the
> past. Remove DSI defines and variables which are not used or do not
> actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
> cdns_dphy_get_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
