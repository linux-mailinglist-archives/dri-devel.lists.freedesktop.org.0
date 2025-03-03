Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2CA4BB0F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1D510E3A4;
	Mon,  3 Mar 2025 09:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ek491Sbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6410E3A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BC665C5783;
 Mon,  3 Mar 2025 09:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF0DC4CEE4;
 Mon,  3 Mar 2025 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740995120;
 bh=9MjpxNDWc0Mel493RuZtnmix9eO5EL7yH9UaB35eo6U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ek491SbccVRRWyc8CFtPBbXGQDRHNVeEKQGU+vU/YAllzteV4QCXiCuFX2oLI91eW
 gFmqsNGV7QAvZt0Fl89wFkfbTJv3Y4xZEp/0kH7647YQAAvLbRbkT5JJFjqA0DLtO2
 xGeVIwvdwCPJYQrKcBHnxBT/xHcUjpEjLnbO9UbFee56Vix/Z/T6Ya7y+pkk14bTug
 H9fB/UctibrjtLPyHi3NLrDVduTApQfN8vyFqMzB2bFlJVfsYG0tniXvEBh5/mEj6B
 YxKhhnOtE6sOca3bxkl4lz0pizRkrN6UuQC1NZh30mC04Jb+DExm4jL2j0fms+hyor
 C4F57XtYRhw0g==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250228083248.676473-1-colin.i.king@gmail.com>
References: <20250228083248.676473-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/bridge: Fix spelling mistake "gettin" ->
 "getting"
Message-Id: <174099511726.139840.6705775137322314261.b4-ty@kernel.org>
Date: Mon, 03 Mar 2025 10:45:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 28 Feb 2025 08:32:47 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/bridge: Fix spelling mistake "gettin" -> "getting"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/db505ff68c12



Rob


