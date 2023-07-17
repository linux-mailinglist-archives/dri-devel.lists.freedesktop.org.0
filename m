Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EE75679B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 17:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13D210E26F;
	Mon, 17 Jul 2023 15:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6DB10E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:20:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB28761117;
 Mon, 17 Jul 2023 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38888C433C8;
 Mon, 17 Jul 2023 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689607215;
 bh=+rnHwN8BBAAxjKI/C9wyRzOwjJHGXHe1uOyuMUQV4R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FuNNBooE1Dz7YPOXtUJEvFsXxWmkurJCKNh5REK8t/ZSAWUoC78Ls/1tS/irBoNMC
 XJPFWvBhQBky3VNWh8RCq9mIXzQ6Zv4lH7vcjavOi4+A7498mSMxc8t/Z9Z9Gd2D09
 pxaoFhBiSMU+51f4uicikh2ZlUMpNYyeQ/rfivr0FUNAx8aHD0PtQpk+U8/ZG0IOce
 ClVOWaCK5EkXOzQginaFUaFRGpAjv4+3pDofgVCE/oLHEv49W34NZNUIkcsjH4d+o8
 5nCTOAVQHfZDN85Qtqp/wFKS+XHK1DbV8GNiRlELjQdCnO3CWlsyvzMLTPutG71AFd
 ZSzC5K+WMkM4g==
From: Robert Foss <rfoss@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH RESEND] drm/bridge: anx7625: Use common macros for DP
 power sequencing commands
Date: Mon, 17 Jul 2023 17:19:54 +0200
Message-ID: <168960718497.2919250.12489201173225348002.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710090929.1873646-1-wenst@chromium.org>
References: <20230710090929.1873646-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Robert Foss <rfoss@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023 17:09:27 +0800, Chen-Yu Tsai wrote:
> The DRM DP code has macros for the DP power sequencing commands. Use
> them in the anx7625 driver instead of raw numbers.
> 
> 

Applied, thanks!

[1/1] drm/bridge: anx7625: Use common macros for DP power sequencing commands
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2ba776f903cb



Rob

