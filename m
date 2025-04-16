Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45DA8857A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B789190;
	Mon, 14 Apr 2025 14:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IPaeC7GH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9669E89190
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:44:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FF134A0E9;
 Mon, 14 Apr 2025 14:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7043C4CEE9;
 Mon, 14 Apr 2025 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744641867;
 bh=P0znGlUDfnyVJsOsiVX4FLU0nqmm2ya6A3L/1YprRoQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IPaeC7GHZv45jV2BH5hVIKWsQ+yV0gFnAZ/ZRKWIjiz0Q/N62YckdRa6rmEf3/0Iy
 ak3QwKVqvhthWCEppeVMYEmMptzu54kMXYaDDvni1wEZrYfBQzwGVXv+/eSav5xn57
 BXliUcnro/oYz0Se4WSxWWWe/tacCOROX1wHulSOJuOdt1vFpbu59Xbxo+jBWGqRag
 pcbdJi1YNcIlfS/TXtN5mGF98IAAui2/6+ZO0EcmBySub5yZXOeBB6owLKsB+tKJ0U
 a9XcmuuPORRB4FOBb6sb8A02Sh1VeipAWKE9WtRMTbPJHK299ro1cCtIDiVw2Vunrr
 DeCuboRVE62pw==
Message-ID: <9823d720e5d0a6562c3ffb288ec6be9b@kernel.org>
Date: Mon, 14 Apr 2025 14:44:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
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

On Mon, 7 Apr 2025 18:11:01 +0300, Dmitry Baryshkov wrote:
> In order to make sure that CEC adapters or notifiers are unregistered
> and CEC-related data is properly destroyed make drm_connector_cleanup()
> call CEC's unregister() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
