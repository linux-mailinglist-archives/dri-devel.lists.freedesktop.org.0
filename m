Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE69023EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B2F10E467;
	Mon, 10 Jun 2024 14:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nenP8B4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18B310E467
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD53960AED;
 Mon, 10 Jun 2024 14:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4418C2BBFC;
 Mon, 10 Jun 2024 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718029221;
 bh=SaHQbQ7s8+x6hkCLeNAaB7NJIrGHZ/3mXKWSU8dJTLs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nenP8B4YN68Mo/uAEY1SluFA3i2wCCn2ukkN3Khvs7I6kxBPHJ4nGReN5pWuI2T37
 wETaQxy4Bv0h5E3bZ4UmfufmC8KehFg9bHHAsHrQGEF/NERWmZEmYrXoigZVrBVXOa
 BxmFxXar8Z8Ier/lxtupHMBMt+XvvDRKw45BDcBXUcQp0nxFrwvDedL7igxXzbfZs2
 F7VnTyP+rotcJMVkRo/k2PHvXqJANxkvtdruzjWjrRlqQgacInDZUQywAz4DmontdA
 SBDBHyOTblLU58UFzVrPJ/5KyppdNfuQc5jv1eabXCzCQ03k1kiGRF+oToyI/hiUi+
 EiEUP/SkcRRbA==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, kernel@dh-electronics.com,
 Lucas Stach <l.stach@pengutronix.de>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240531203213.277421-1-marex@denx.de>
References: <20240531203213.277421-1-marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
Message-Id: <171802921835.455235.4098915891399435052.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 16:20:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Fri, 31 May 2024 22:32:01 +0200, Marek Vasut wrote:
> Fix comment copy-paste error in tc_edp_mode_valid(), this function
> is validating DP/eDP clock, not DPI clock frequency. Update the
> comment to match. No functional change.
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=004370a82ae1



Rob

