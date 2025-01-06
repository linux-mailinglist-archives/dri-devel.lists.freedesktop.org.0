Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7CA0289C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424210E693;
	Mon,  6 Jan 2025 14:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DCs5IoWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071410E6A6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:55:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E2035C5AC6;
 Mon,  6 Jan 2025 14:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05E2C4CED2;
 Mon,  6 Jan 2025 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736175355;
 bh=j4JgGfWD0TO7oUIIzix5tvEGtwv3JSyFx8hvWYaZevY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=DCs5IoWLpWG1VER6AfS3/pestURovCHMqiJTf2oDn+qQpp0XqCsF/UCHRuPA6GoaE
 SKfe4BBlMRRCSrKDpXsWEPUle12EQl1QQT20eYZPs45FAJ8Uw2e8k9wCGa6cueFVGs
 WtFGbWwav31YoNODnme//dlVtpb1Qik2k9SBQ8JL69rRb5XdZ5cib5HTeFc4M37WM1
 x2xzuf4XO7xnmM6P20gTJQ10zrPguQQS2do06gzKfB9JBkK85T4eb39R83su89GcKF
 qNzOmOSwRPWH6FmnqWyeGg0Difq8gcFh7InYFoVsS2Q5IrsPPuX4v2F2Ig0a12yNad
 MHLHJTE1Npf4Q==
Message-ID: <f432ddfb896acf0dc91eb0e7f974a97e@kernel.org>
Date: Mon, 06 Jan 2025 14:55:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 24 Dec 2024 20:22:40 +0200, Cristian Ciocaltea wrote:
> Bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops are expected to
> rely on drm_bridge->supported_formats to advertise the supported
> colorspaces, including HDMI_COLORSPACE_YUV420.
> 
> However, when drm_bridge_connector gets initialised, only
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
