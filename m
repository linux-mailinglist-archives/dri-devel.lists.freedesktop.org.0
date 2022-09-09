Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC05B3914
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9B410ED5B;
	Fri,  9 Sep 2022 13:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FBD10ED5B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 13:35:57 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oWeAg-0005Z8-VW; Fri, 09 Sep 2022 15:35:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: vop2: Fix eDP/HDMI sync polarities
Date: Fri,  9 Sep 2022 15:35:49 +0200
Message-Id: <166273051993.3419188.13031890841215276431.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815133942.4051532-1-s.hauer@pengutronix.de>
References: <20220815133942.4051532-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Aug 2022 15:39:42 +0200, Sascha Hauer wrote:
> The hsync/vsync polarities were not honoured for the eDP and HDMI ports.
> Add the register settings to configure the polarities as requested by the
> DRM_MODE_FLAG_PHSYNC/DRM_MODE_FLAG_PVSYNC flags.

Applied, thanks!

[1/1] drm/rockchip: vop2: Fix eDP/HDMI sync polarities
      commit: 35b513a74eabf09bd718e04fd9e62b09c022807f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
