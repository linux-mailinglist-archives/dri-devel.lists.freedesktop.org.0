Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B38947EC7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 17:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9210E241;
	Mon,  5 Aug 2024 15:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FAw2sutK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9FC10E241
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 15:56:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 585DC6092A;
 Mon,  5 Aug 2024 15:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD094C4AF0C;
 Mon,  5 Aug 2024 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722873376;
 bh=Vpt/ybgnwc0Kk+7tqfImpVn/n05UCcgeQGqDaHdPQpE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FAw2sutKqC3jWi4C9/T9k7ltP9qmXfbsJtfu6a110Gt5cMwqYoT6CXCbTrhcMX7Eo
 eULP5z+gs6fmjTwfpvReusu95uWAg5/zI0/9LMj7h/ZrMEcOI/IGyUjUg9OkLis8Gc
 zArIm0W6QGzVS/IYexlobdmcrZs+TFBWsqkH9J8kgUZuFNdgahDCbHrS1cJzb5m6tW
 gwBVJ2GgzAAj+JXkBKMOHiRjm+nvGyWzttRhP7QEiiiKbH9q+BFyP4TP44F5EftmSa
 tTBgT8kZwKEaVgra0sggxAiwro8ZkiKHS8aMbh4pf9OmsNth/hiqpL36yrqdCJHxr4
 VOEeAXmj2lHWg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
References: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
Subject: Re: [PATCH] drm/bridge-connector: Fix double free in error
 handling paths
Message-Id: <172287337262.1723177.5901681466214656738.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 17:56:12 +0200
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

On Thu, 11 Jul 2024 14:26:55 +0300, Cristian Ciocaltea wrote:
> The recent switch to drmm allocation in drm_bridge_connector_init() may
> cause double free on bridge_connector in some of the error handling
> paths.
> 
> Drop the explicit kfree() calls on bridge_connector.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/bridge-connector: Fix double free in error handling paths
      (no commit info)



Rob


