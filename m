Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265678302CF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792710E0FF;
	Wed, 17 Jan 2024 09:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542ED10E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:52:18 +0000 (UTC)
Received: from i5e860cd7.versanet.de ([94.134.12.215] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rQ2ab-0006Am-SJ; Wed, 17 Jan 2024 10:52:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Bee <knaerzche@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH] drm/rockchip: inno_hdmi: Explicitly include
 drm_atomic.h
Date: Wed, 17 Jan 2024 10:52:04 +0100
Message-ID: <3186012.MsWZr2WtbB@diego>
In-Reply-To: <170548481754.96553.11502916321137598260.b4-ty@kernel.org>
References: <20240115092434.41695-2-knaerzche@gmail.com>
 <170548481754.96553.11502916321137598260.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Maxime,

Am Mittwoch, 17. Januar 2024, 10:46:57 CET schrieb Maxime Ripard:
> On Mon, 15 Jan 2024 10:24:35 +0100, Alex Bee wrote:
> > Commit d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
> > started using drm_atomic_get_new_connector_state and
> > drm_atomic_get_new_crtc_state which are defined in drm_atomic.h
> > Building does currently only work if CONFIG_OF and CONFIG_DRM_PANEL_BRIDGE
> > are enabled since this will include drm_atomic.h via drm_bridge.h (see
> > drm_of.h).
> > 
> > [...]
> 
> Applied to drm/drm-misc (drm-misc-next).

wouldn't have drm-misc-next-fixes been more appropriate?
Because I _think_ the change causing the issue made it in during the
current merge-window?

Heiko


