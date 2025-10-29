Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7EC19238
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9D410E741;
	Wed, 29 Oct 2025 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dlta9mXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7663310E741
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B831160384;
 Wed, 29 Oct 2025 08:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6829C4CEF7;
 Wed, 29 Oct 2025 08:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761727482;
 bh=f8nmQetPnoSxxV2FJKbUwk3Vl0dg0098TrP6IqOmLHg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Dlta9mXpOnVGsG1fG+WZA7ex+8f2C3KCP6IbGG/lVamWQn9+BXQM4hbamIpZcdZyr
 c2DM0Gx3YZWU1vs2+wGx0HMOQBHem6VYyJKzxdq1LDBaOHxELtwVtwN5xKIJAGmdbZ
 IZZSSqOaeoARp6snvAnEi+zDdg509hhUeYlGmqGLC4rYbleb9XbED4Tv7EjVkg2aY8
 vvYy26jiWaCQ9kcubKJ+Wy8IxTYthNqLJZQXgNu99DJBuLcKIWXeoown65nwvWSnLq
 h8ll3GjqgZTrZQgRaxvlAiBv2DWvJMbvC9m73pZQSjw63MiV11XH3fKxBUo9IGEMH7
 KInmereHO9/3Q==
Message-ID: <034612117f0147b0b8594d2e2e27a940@kernel.org>
Date: Wed, 29 Oct 2025 08:44:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: add warning for bridges using
 neither devm_drm_bridge_alloc() nor drm_bridge_add()
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-5-bb8611acbbfb@bootlin.com>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-5-bb8611acbbfb@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Andy Yan" <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
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

On Tue, 28 Oct 2025 11:15:46 +0100, Luca Ceresoli wrote:
> The correct sequence for bridge initialization is:
> 
>  1. devm_drm_bridge_alloc()
>  2. drm_bridge_add()
>  3. drm_bridge_attach()
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
