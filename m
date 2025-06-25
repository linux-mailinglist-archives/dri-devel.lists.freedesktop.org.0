Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6BAE7784
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288410E677;
	Wed, 25 Jun 2025 06:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tc+iZjxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4910E672
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:52:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B780615F1;
 Wed, 25 Jun 2025 06:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E050C4CEEE;
 Wed, 25 Jun 2025 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834326;
 bh=Ch3e/A5r4GOgd1/KIeyk2VHq983bEKfZTlaigXX2/vQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Tc+iZjxykSadbTHJG+c/zWpyfEsJKQuFNgcW4x3f/ztr/ln7b5VUjR9K6Rz/68cyV
 Clqfx8wRZVOT7BtIt2VFveiFHrbo+HxIsKeFcjQaQOovo14+JRc6qwLMuN5MhMlzlH
 q4DPfnqG4iRMWWoSboxLynePmRPPBlIusJw1w6lIhmLxZwRVYzBcb17Tp/DySx8hHO
 25c5N4FOblWH+jQCnJQoh4R9rEmqzwp1GlzwGOWT0mW9fXu1KugLnd+o0mz3RuU8p5
 rG8Vxwpu6pcV2ozpIp40/HGeBKgya55qQKf3Jbckn9jId1qvS3+/cLtE1J8xGejvQ6
 Sv8Bv7FlB0DAw==
Message-ID: <db2c09490ab61264c98033c9e0dac762@kernel.org>
Date: Wed, 25 Jun 2025 06:52:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: microchip-lvds: Remove unused
 drm_panel and redundant port node lookup
In-Reply-To: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>,
 DharmaBalasubiramani <dharma.b@microchip.com>,
 JernejSkrabec <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 25 Jun 2025 10:26:09 +0530, Dharma Balasubiramani wrote:
> Drop the unused drm_panel field from the mchp_lvds structure, and remove
> the unnecessary port device node lookup, as devm_drm_of_get_bridge()
> already performs the required checks internally.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
