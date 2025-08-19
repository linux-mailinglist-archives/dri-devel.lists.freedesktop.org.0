Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C0B2BE3D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F9F10E2A1;
	Tue, 19 Aug 2025 09:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nbgofNDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3CB10E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89D6D5C3798;
 Tue, 19 Aug 2025 09:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8979FC4CEF1;
 Tue, 19 Aug 2025 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755597553;
 bh=B53JZrnbg07EaqUFAyDTA9Cd8NUtD1jEcjDjdWc+x/Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=nbgofNDnIY2ixa6L9P8AMMAB2AJ103lOijag6QBikJnZYhJOrdWMuvaqZWQTkhVIN
 8+04hCOdNyonn01NJ2S5/UBiwS5OBX+Uk273bPwp6zOH3vfLuSlw+z/yxlJC3t/Hqy
 wR9iit25mXmHTHVCqMhwt2H42d/BHvT2OVrWlVmoIOWQMuEmpVGfujeEozZDB54myP
 cdZ80qjPDSACpYz4Obs0UOAO/gUQx6XG96zqL2i7kXbQAmTKpmqhWSTp2In57BzGHg
 9FUOGTZHedcOchdfccH3vSqMgn6AQD4ISsnRZ3eLh1JHrPV3i+NoGVz9jJ+vghv/Se
 b2EZ6lZahCahA==
Message-ID: <a152e2be0a9bc57dff07616dda2e3d34@kernel.org>
Date: Tue, 19 Aug 2025 09:59:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 1/3] drm/debugfs: bridges_show: show refcount
In-Reply-To: <20250819-drm-bridge-debugfs-removed-v7-1-970702579978@bootlin.com>
References: <20250819-drm-bridge-debugfs-removed-v7-1-970702579978@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
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

On Tue, 19 Aug 2025 11:42:10 +0200, Luca Ceresoli wrote:
> Now that bridges are refcounted, exposing the refcount in debugfs can be
> useful.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
