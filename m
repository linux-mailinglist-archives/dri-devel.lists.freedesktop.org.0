Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279CE8D477D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D75B10E2D4;
	Thu, 30 May 2024 08:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TKozrd/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3311910E1A3;
 Thu, 30 May 2024 08:50:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF3BE6243D;
 Thu, 30 May 2024 08:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4720C2BBFC;
 Thu, 30 May 2024 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717059001;
 bh=2DXQrqvVhn7otPeeh3pzCu9NQCv4f7YT6NDKPqdXedE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TKozrd/sfuLL8YZ3I/qoW8DNZRo0fy62JLiLLByUT572EOQX/IHePNikrojJDnhJZ
 930TYhi9LNdQZdXCkQ0veUcNqonnm45usg+yWOZrz3TCfGsff38o+piGnlbrC3XlCe
 5qa4uhXWDe7q7BXs7YgmxRNr8e1ZB0CxGh2dc4ZrjUyHDaWmDXnA7eNKCzSx6E8ZmT
 L0iSEO2gRlCkGXBETlPtO7Ln+WYTtfsM5LRx5FNu/8eSl+iZLpNbUfzq95omOmz/pE
 B+z22BvS8j2dMZwnyfXT7+zgvi6TC96O+RcIR2coO9xBRaSQVQUiSCxImNA1jTlgyZ
 4UWXu2nHsy/Dg==
Message-ID: <61893982881596ef18a206f2f3ed152e@kernel.org>
Date: Thu, 30 May 2024 08:49:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/7] drm/bridge-connector: switch to using drmm
 allocations
In-Reply-To: <20240530-bridge-hdmi-connector-v3-2-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-2-a1d184d68fe3@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>,
 "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Thu, 30 May 2024 02:12:25 +0300, Dmitry Baryshkov wrote:
> Turn drm_bridge_connector to using drmm_kzalloc() and
> drmm_connector_init() and drop the custom destroy function. The
> drm_connector_unregister() and fwnode_handle_put() are already handled
> by the drm_connector_cleanup() and so are safe to be dropped.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
