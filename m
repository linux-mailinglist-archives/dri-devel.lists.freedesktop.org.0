Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD599C1F2C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB110E9D1;
	Fri,  8 Nov 2024 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="byVIt3pI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30C410E9D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:26:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 06072A43C22;
 Fri,  8 Nov 2024 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA91C4CECD;
 Fri,  8 Nov 2024 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731075960;
 bh=RzTmieNK3A8R7874rWrc7RYSXN2l8cHqDRlpprZm/uk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=byVIt3pInLT7VLq9NCijhVkw/If6WBIR4RC0r5qiD9xyM4XkbQz538omIfMcgG71B
 7PyWL4a/QIyF3RlBnE1NckQ7lDbGChZyr3p464SrkUrkCB58bzpqS9tHlnR3usMk9Y
 L0brsGNY5JLOqxzm4fHbMTuPcFAet4aL7r3xMFCD0f3iIWD+HqOU401ZNHSTCs7AmX
 VuT09lObE1HSYdC5B2hca7BBE4u/B3c5I+/eUwgc+WFSnJyJDJ5/CtJCLUWJaZwZ/w
 /sTPkS8uK1PDbeNO5GiUfq7JyEZFsDtY62taFyK8I3K1fMaMvhTZVjRgOHgOfem1QP
 7559zvymTNYTQ==
Message-ID: <785b15e68207eed61e5b7252788362a4@kernel.org>
Date: Fri, 08 Nov 2024 14:25:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
In-Reply-To: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
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

On Fri, 1 Nov 2024 02:25:08 +0200, Dmitry Baryshkov wrote:
> Drop manual check of the TMDS char rate in the mode_valid callback. This
> check is now being performed by the core.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
