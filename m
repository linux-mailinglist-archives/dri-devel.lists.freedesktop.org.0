Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004A934CDF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9310E5C1;
	Thu, 18 Jul 2024 12:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1l5liDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013DB10E5C1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 12:02:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F1FC8CE1A2B;
 Thu, 18 Jul 2024 12:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12162C116B1;
 Thu, 18 Jul 2024 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721304142;
 bh=4X3CaJuNtXM+dLODj6haMa7pA8m3mfucWCuMrl33fzA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=c1l5liDIz6OLKuDSicL7hu2aczwlYF0xi7JxW4hGZ8Qk7MfOleMq65Uq1dJHoCIl8
 Bd8mf9fnKtlaWT+iFHqNg971jKj70kmxaAu4MtzlEJm+sWssxkfRdI73KEFDuyHpLG
 /JwZeXOfsnw19RhZ65OeT3RIwjni92jquBu4iL9iyZAZbqBTb4Nib+1An2uKTSqrCn
 LDyJCoZ6ZavyXN0uFBpahg88fZa2HqhSydbMDTlT2IxMIzFfCRW8Q6rJd98X+n6jWp
 YEqG+zKaBcJi7A3JDbZL7tmxVfqi9xROuAUUUTb5TQRbQDhcC3c7pnsB+9mOjJQ+DP
 /XazVANzV67dQ==
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
Message-Id: <172130413876.532897.864210015976659933.b4-ty@kernel.org>
Date: Thu, 18 Jul 2024 14:02:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca5442ed8f53



Rob


