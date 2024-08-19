Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7125956BC5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FED10E263;
	Mon, 19 Aug 2024 13:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jdN2v5mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F9A10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 13:23:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B725960BCB;
 Mon, 19 Aug 2024 13:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649E2C32782;
 Mon, 19 Aug 2024 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724073795;
 bh=Y78tMoSTvQ5pNGwRl2U9/ONE47YeR8ac4eWLcVpfmyU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jdN2v5mvPoMzJ2Mrq4zyg+244b5eL/21q5l6Bxd9jzYSLw9NlvnJfw4QIG0eGqBJ2
 iSdiHSd3nkjWEQajTcde5woUCqz1p8U9DfUE0AwuzkTGLB0Mw1fMARY9iXhINxSjnX
 qaxo95QG5asi8X4Rbe8TL/fQGX3KhN1E0+sgKLTTecBC2HxFNcvZumIBhp10bYRmsh
 kSohoyNBxtA161PbcUnVktDicdQVi0VDiIkSLIZIl52f7bt1xyOW49unrR4OG+8tgL
 w7d2DYvdLJ3f/Bphcntf3Nb14ucZptDwKs1C/m0JwWuZjBXkSHSEpFII4QxNTu2Y8F
 eiay9p1Aq/P5A==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
Cc: adrien.grassein@gmail.com, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20240813091637.1054586-1-victor.liu@nxp.com>
References: <20240813091637.1054586-1-victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: lontium-lt8912b: Validate mode in
 drm_bridge_funcs::mode_valid()
Message-Id: <172407379209.1397922.13488425635790063899.b4-ty@kernel.org>
Date: Mon, 19 Aug 2024 15:23:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Tue, 13 Aug 2024 17:16:37 +0800, Liu Ying wrote:
> If the bridge is attached with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,
> this driver won't initialize a connector and hence display mode won't be
> validated in drm_connector_helper_funcs::mode_valid().  So, move the mode
> validation from drm_connector_helper_funcs::mode_valid() to
> drm_bridge_funcs::mode_valid(), because the mode validation is always done
> for the bridge.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: lontium-lt8912b: Validate mode in drm_bridge_funcs::mode_valid()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fe828fbd8778



Rob


