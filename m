Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E62612627
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 00:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46BD10E035;
	Sat, 29 Oct 2022 22:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7933A10E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 22:08:52 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oou0W-0008NZ-Gj; Sun, 30 Oct 2022 00:08:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: vop2: Register Esmart0-win0 as primary plane
Date: Sun, 30 Oct 2022 00:08:44 +0200
Message-Id: <166708118164.1656095.9357091352577403281.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220926081643.304759-1-s.hauer@pengutronix.de>
References: <20220926081643.304759-1-s.hauer@pengutronix.de>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022 10:16:43 +0200, Sascha Hauer wrote:
> Esmart0-win0 could serve as primary plane, so mark it as such. On
> RK3568 this window will never be used as primary plane, because the
> three windows at the beginning of the rk3568_vop_win_data[] array
> will be used. On RK3566 however, two of the windows at the beginning
> of the rk3568_vop_win_data[] array cannot not be used due to hardware
> limitations, so without this patch we end up with CRTCs without primary
> planes when multiple VPs are active.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Register Esmart0-win0 as primary plane
      commit: de4a4c8f64021b02aaa8ab21a82fe1f11a17b975

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
