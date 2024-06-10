Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54420902439
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5822310E275;
	Mon, 10 Jun 2024 14:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pf9Q43yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508710E275
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:40:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F63660918;
 Mon, 10 Jun 2024 14:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CACC2BBFC;
 Mon, 10 Jun 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718030447;
 bh=yc/dwowaEYBTvrkdMBgKRZV7SmYF1J4czz7n87U4ih8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Pf9Q43yENLzdGJDmzw/qCpmJPBmOO5LmQbIHwiY1YxeHCQb7XMkTnDGJjAh7dxjSb
 lCc3htCCUi9cr0cltuQ7sW0zr39CBtI/rmS6YnQQLbR+CZkooiqfehK/barUsAvAkq
 UCQDqT0T51fYru9lP3qKWAH9j6AZGlAh06z4/xjqzDukXXNs2w7yYsHWj0VEC1ahz7
 CDCIVz4hbhIOnjQSH6viozgyWG0E2S6Jx6zmFQfNGIKKUz9a4hmqQMtLw9YX4fa5hD
 Nx7Y/uMwMeBZB6DXCjFc1DPIuzyYLEnQ1BuojNTD5qF8+pz7E6AfnVO3GYwJSZYrZP
 Q1yvgngXUE4nQ==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kuro <kuro.chung@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Kenneth Haung <kenneth.hung@ite.com.tw>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Hermes Wu <hermes.wu@ite.com.tw>
In-Reply-To: <20240604024405.1122488-1-kuro.chung@ite.com.tw>
References: <20240604024405.1122488-1-kuro.chung@ite.com.tw>
Subject: Re: [PATCH v1] drm/bridge: it6505: update usleep_range for RC circuit
 charge time
Message-Id: <171803044399.471764.13517934474897792377.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 16:40:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Tue, 4 Jun 2024 10:44:05 +0800, kuro wrote:
> From: Kuro Chung <kuro.chung@ite.com.tw>
> 
> The spec of timing between IVDD/OVDD and SYSRTEN is 10ms, but SYSRSTN RC
> circuit need at least 25ms for rising time, update for match spec
> 
> 

Applied, thanks!

[1/1] drm/bridge: it6505: update usleep_range for RC circuit charge time
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8814444e62b8



Rob

