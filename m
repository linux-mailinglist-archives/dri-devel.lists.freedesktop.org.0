Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B7ABB633
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0716510E208;
	Mon, 19 May 2025 07:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRh69JZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39CA10E208
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:32:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C46ACA457AC;
 Mon, 19 May 2025 07:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0F2C4CEE4;
 Mon, 19 May 2025 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639971;
 bh=nYb5Kshx6CLJ37Qnb8psaSBwq0tx6XMzzbwhCqEZ5mM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KRh69JZdeBCWfoRS4ykXttpbmnUIQt+C0esV1moJDZrQTwfmRdCzSbHUFFG+fpT3m
 L28PbBoBllg9y4NCwHfRJrJwItpvwX410SPDlDiSXbJ5of2JwSlOw06NxFhFa2ryAY
 xEmPXNrC7pnm1gIbwmCGtBEwt67rHEKczNmdqVa/EPE1y+dilVKsRFC3/pfSuayr+L
 GPLBeqHvHk5RH4YdAvoAXxDitBr36D3MgZo+1P89Nbq0Bwkr1JuErxckFKi2z07KxV
 zDX4f6WZbSxYbUcFk/BFnBpf7zf/Qk9LDurFr2aqld7/YMRzY5SLIy5xSobPh+wJ/4
 dVTDbwonZewjA==
Message-ID: <905648278aadd7e53b8c9d3f33816b88@kernel.org>
Date: Mon, 19 May 2025 07:32:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/10] drm/bridge: adv7511: switch to the HDMI
 connector helpers
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
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

On Sat, 17 May 2025 04:59:46 +0300, Dmitry Baryshkov wrote:
> Rewrite the ADV7511 driver to use implementation provided by the DRM
> HDMI connector framework, including the Audio and CEC bits. Drop the
> in-bridge connector support and use drm_bridge_connector if the host
> requires the connector to be provided by the bridge.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
