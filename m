Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AD8302AF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1D10E689;
	Wed, 17 Jan 2024 09:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81710E689
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:47:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A3F96155C;
 Wed, 17 Jan 2024 09:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9783C43390;
 Wed, 17 Jan 2024 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484820;
 bh=T6o5+nTzLQWlEAzpAo1HwywEQgFNbp3/JkgtLKKRTzM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gqns8HzL24wK05v3NJZyOYUdP9XHN8Ll7HXad1hX/ubbc2vAs+nL+qQvNLMDunFOh
 idsUtrw+b167co4DAI0/R5EK4ERtUQ7B+Kf+uoIoiSwuMhxZldTikpq8CBBtGkbz23
 ubyfhdyn8+R1JJFmktDiV4JvbIzKYJnm5+c5DpEV/CBklYqXEFPMe/VDfQ50HTv4Ej
 a9pil2vVWMBurx1shW1QBl3mOB0P5iRqAdQztAzrhys1ZpClblcccrhUYV+ewByGwE
 5zM98WbTic129I/SY0K9YSb4/HQaK0uZTzNHC+yKd1vVer69iqgUd+kyghLxR0j9Di
 GC77OHlcBY4vg==
From: Maxime Ripard <mripard@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20240115092434.41695-2-knaerzche@gmail.com>
References: <20240115092434.41695-2-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH] drm/rockchip: inno_hdmi: Explicitly include
 drm_atomic.h
Message-Id: <170548481754.96553.11502916321137598260.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:46:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 10:24:35 +0100, Alex Bee wrote:
> Commit d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
> started using drm_atomic_get_new_connector_state and
> drm_atomic_get_new_crtc_state which are defined in drm_atomic.h
> Building does currently only work if CONFIG_OF and CONFIG_DRM_PANEL_BRIDGE
> are enabled since this will include drm_atomic.h via drm_bridge.h (see
> drm_of.h).
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

