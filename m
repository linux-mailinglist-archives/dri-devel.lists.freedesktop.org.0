Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE07BEC64
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646CF10E2E9;
	Mon,  9 Oct 2023 21:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB810E00F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:11:34 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qpx07-00058Z-Nj; Mon, 09 Oct 2023 22:37:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Demote message in mod_supported to
 drm_dbg_kms
Date: Mon,  9 Oct 2023 22:37:11 +0200
Message-Id: <169688381983.192795.11789020562880068365.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009103753.830458-1-m.tretter@pengutronix.de>
References: <20231009103753.830458-1-m.tretter@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Oct 2023 12:37:53 +0200, Michael Tretter wrote:
> Checking if a modifier is supported by a plane is normal behavior. It is
> normal that a plane may not support certain modifiers. Failing the check
> doesn't justify an error message in the kernel log and may mislead
> users.
> 
> Demote the error message to drm_dbg_kms to only print the message if the
> respective debug messages are enabled. This is similar to the behavior
> in rockchip_drm_vop.c.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Demote message in mod_supported to drm_dbg_kms
      commit: eb23cffdd7f085149799e5eda12a9aff792cc34d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
