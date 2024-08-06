Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205F94914C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0810E360;
	Tue,  6 Aug 2024 13:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XLrWJwni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A8F10E360
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0245DCE0E73;
 Tue,  6 Aug 2024 13:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADEEC32786;
 Tue,  6 Aug 2024 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722950785;
 bh=bpW6gr4pw4V8ugoxEp30eVt/fRQwYnE2NOY5lty9K/k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XLrWJwniOqhfwQy22MWoiAryKK3YqSsDhoaLdd1YmEqYDkrSSE9GU8FYn00FE16RK
 xn7/08UGv5/g5hP33Y2YnYdryYEFWFJ+JgBfjmW5j3vxP3TyPgFGwzpomj+jn07bCk
 YaLHghyfawpJ8TgbCkceYGsT7NLYNSI/BWBzBCEkOnsGj0Nf3h4t/57GC72BCgNvHG
 grpHNi+hBv6HmDNfyB5t8Tq91eeR6zAPBBZewfu1TP3YUOXj2m9z1F8jYoE2cdwOAE
 pc5JYkkvBuVydAf7ai8qHwYZHgBQa93L27mwBsJ60HOogwwnG9+RCLq3AtJKp3FiP8
 MeqGj9XeSuz6g==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
References: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
Subject: Re: [PATCH 0/2] drm/bridge: lt9611uxc: require
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-Id: <172295078214.1812660.11522667072788670082.b4-ty@kernel.org>
Date: Tue, 06 Aug 2024 15:26:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Mon, 01 Jul 2024 21:19:51 +0300, Dmitry Baryshkov wrote:
> There are no in-kernel DTs that use Lontium LT9611UXC bridge and still
> require creation of the drm_connector by the bridge on attachment.
> Drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR by the driver.
> 
> 

Applied, thanks!

[1/2] drm/bridge: lt9611uxc: properly attach to a next bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7c5537cee9a8
[2/2] drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7b6cf6c750da



Rob


