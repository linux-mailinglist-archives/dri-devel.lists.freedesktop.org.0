Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BFA4683C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB2F10E96A;
	Wed, 26 Feb 2025 17:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vM3Fkvev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2B10E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:39:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62EEF6125B;
 Wed, 26 Feb 2025 17:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E874BC4CED6;
 Wed, 26 Feb 2025 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740591590;
 bh=9hZ2kWScNTHgC+16YX2niQ0hHv6Xdqe9OGxTNoOcim4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vM3FkvevmWxoVsILaG2oNwL6w6Va5+oXVxEkZL1vpRRUZoa9umKUo+HKi78Rvs6rO
 bAxW3DTqm214qm04VMZMtoDK5+PGYE0HUrKUiYFmpD0Hzi/SfUlEsRLscKE6pnCzH4
 1B3D5ruqTVBlzTkJyHN3kbx9LcAbtj7FvbOnuem9YV7NKOvvlhn10YuGvjvNCKjVPs
 AFJUQIPOSvF+iH8oqa7w4Ddrg3HJNR0+8OugEXIFYZoU5/PQLy4oF9XoLaQygyurIg
 iQ6Ng24ZEiwhtdUEwWkecFgE4L5PN9AGqCHe4UIE0vxutchu/HwiBJncej8Ysa6Hzd
 hMH6x0aq3ZkhA==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20250225135114.801884-1-alexander.stein@ew.tq-group.com>
References: <20250225135114.801884-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Support negative DE polarity
Message-Id: <174059158754.973942.5009954425785928833.b4-ty@kernel.org>
Date: Wed, 26 Feb 2025 18:39:47 +0100
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

On Tue, 25 Feb 2025 14:51:13 +0100, Alexander Stein wrote:
> Polarity for DE is stored in bridge state. Use this flag for setting
> the DE polarity in the bridge.
> 
> 

Applied, thanks!

[1/1] drm/bridge: ti-sn65dsi83: Support negative DE polarity
      (no commit info)



Rob


