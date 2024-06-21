Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF3912021
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2B10E2EF;
	Fri, 21 Jun 2024 09:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IqnToB/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1610E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:08:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43ED862387;
 Fri, 21 Jun 2024 09:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7475EC2BBFC;
 Fri, 21 Jun 2024 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718960902;
 bh=JIeqoaIa7EKTaeKtvAYQWwAw9IeCYkgkrJJWV2KYcqo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IqnToB/9X11ppEn/xXYZbNOhbMPxLenETGWyexBKZU+fzT1WxXbi2gFFDBg05vY53
 oNEhYAOhKD/KcxT8ezrzqbzO54kcdxO2ZPszBFU4BJougE4i7zvdnrPsavceCNUQVA
 ln3PzOO0eusBGoJqczNT2sggxvpFMiZ0iJJgC/djlvuO2UyDalykT702p0BEzJXW54
 zqwnhMXS0whYj21c1eNeToyzDH3B2E5pjcghvWQUSlilxgvxqifRw+r01NNJhwBFOA
 3BLui8oJabIWm8JjXQW9Ld1HwUW7s3TYHWEtmWI/MC5vgpdUMJy2MRV4FZ3X/YLloj
 dk8uo8g4D4Xzw==
Message-ID: <a1086246d73bb548d72799324dc96983@kernel.org>
Date: Fri, 21 Jun 2024 09:08:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 1/5] drm/bridge: lt9611: use HDMI Connector helper
 to set InfoFrames
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-1-d59fc7865ab2@linaro.org>
References: <20240615-drm-bridge-hdmi-connector-v1-1-d59fc7865ab2@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Thomas
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

On Sat, 15 Jun 2024 20:53:30 +0300, Dmitry Baryshkov wrote:
> Use new HDMI Connector helpers in the Lontium LT9611 bridge driver.
> Program InfoFrames using the helper's callbacks. Also use TMDS char rate
> validation callback to filter out modes, instead of hardcoding 4k@30.
> 
> The Audio InfoFrame isn't yet handled by these helpers, it requires
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
