Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10376901CF2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE4410E092;
	Mon, 10 Jun 2024 08:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SohFcnHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48DD10E092;
 Mon, 10 Jun 2024 08:30:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A957CE0F87;
 Mon, 10 Jun 2024 08:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2444C2BBFC;
 Mon, 10 Jun 2024 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718008207;
 bh=nTVn4gDwqTmEQqI98pMWF2QDD4wAEEh3xJoL8K68ph0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=SohFcnHYl3baCEu1xluTM0aSCeUeSuqw1V7vAXT5ncyeMuwBO0w0z/cwftRRE4dDl
 U89UvO0YlWVAPbkBNsY7OoIezIpQyVwPkshp3BMxNgNAvbEh8a8+yk/UgztXold0gB
 dICCIc+7ZqHpSTqXBwAgmO78xhtkS9cWShQjOe9dBuAWColwaPhTmO0xfZyQGbcjTa
 +qGzBK/8M5ArrOlvg51lIYu5ISsISzESZoOrzO1gRCfCnHdHLsaHxGuYpNU+pkz06X
 qBSAcBWQgue7Wk2jBr4YzBI9JnzpKkCf3nyHX4j0TJe1xo8ukmSFMr9g/xCw+dJ+e3
 /LFxU5eE+hedQ==
Message-ID: <66021e08602decbe759dbf77a71490d7@kernel.org>
Date: Mon, 10 Jun 2024 08:30:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 1/9] drm/connector: hdmi: allow disabling Audio
 Infoframe
In-Reply-To: <20240607-bridge-hdmi-connector-v5-1-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-1-ab384e6021af@linaro.org>
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

On Fri, 7 Jun 2024 16:22:58 +0300, Dmitry Baryshkov wrote:
> Add drm_atomic_helper_connector_hdmi_disable_audio_infoframe(), an API
> to allow the driver disable sending the Audio Infoframe. This is to be
> used by the drivers if setup of the infoframes is not tightly coupled
> with the audio functionality and just disabling the audio playback
> doesn't stop the HDMI hardware from sending the Infoframe.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
