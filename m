Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC8E5279B7
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 22:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02A10E6B1;
	Sun, 15 May 2022 20:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40E710E6B1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 May 2022 20:07:42 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqKWh-00069N-AL; Sun, 15 May 2022 22:07:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/rockchip: vop2: unlock on error path in
 vop2_crtc_atomic_enable()
Date: Sun, 15 May 2022 22:07:37 +0200
Message-Id: <165264524621.2584623.18007054358707398354.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YnjZQRV9lpub2ET8@kili>
References: <YnjZQRV9lpub2ET8@kili>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 May 2022 12:05:05 +0300, Dan Carpenter wrote:
> This error path needs an unlock before returning.

Applied, thanks!

[1/1] drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
      commit: 98526c5bbe3267d447ddd076b685439e3e1396c6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
