Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F069915826
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 22:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512810E260;
	Mon, 24 Jun 2024 20:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="aI5OECwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A4B10E260
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 20:41:35 +0000 (UTC)
X-Envelope-To: val@packett.cool
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1719261693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xzQDjhOrGwD3tQUSZRV5dR0f05Nxv9TwNmLi45IeEPA=;
 b=aI5OECwnIhB55yaokMZbw0g8l+RbdY9aKqpV/dm5rtqadRfSmnAZuRJlL/hcj+5BN6ut41
 j2xAK7D94C/IFQNcKQVX9EtcK3vROwaZztlmY70JVtGdpUutud89T4/0D4VTanYMKN1CBu
 W7ruKZKF1YupCoi459CzRS2MnFGhAI1VLTx1tGlR8wlgUTR2ZuUKrTQ1XBHYCN1ExTIUbO
 /84OzWPgajgw7f9rc6Lea6uPhAZi1FPos4j0nLXMeykW/YwrA1JmX9A5gR6fq+zTpcQ/FY
 lsXDriUsd009uYuIA/h1LCN8yPTlJ9fq8pK9bsop1RZSm0Z+OEtwTP/k77IXuQ==
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/rockchip: vop: Support internal display on RK3066
Date: Mon, 24 Jun 2024 17:40:47 -0300
Message-ID: <20240624204054.5524-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This tiny patch series makes the changes required to enable the RGB
display output on the Rockchip RK3066 SoC. Final version as discussed.

Val Packett (2):
  drm/rockchip: vop: clear DMA stop bit on RK3066
  drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 ++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 2 ++
 3 files changed, 7 insertions(+)

-- 
2.45.2

