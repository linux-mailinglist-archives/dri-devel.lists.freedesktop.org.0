Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B3394750
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8CA6F61F;
	Fri, 28 May 2021 18:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89A6F61F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:56:00 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmheG-0006hU-5i; Fri, 28 May 2021 20:55:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: daniel@ffwll.ch, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 miquel.raynal@bootlin.com, airlied@linux.ie, hjc@rock-chips.com
Subject: Re: [PATCH] drm/rockchip: Fix an error handling path
Date: Fri, 28 May 2021 20:55:52 +0200
Message-Id: <162222814865.2904787.11303263150056915377.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
References: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 1 May 2021 17:13:16 +0200, Christophe JAILLET wrote:
> 'ret' is know to be 0 a this point. Checking the return value of
> 'phy_init()' and 'phy_set_mode()' was intended instead.
> 
> So add the missing assignments.

Applied, thanks!

[1/1] drm/rockchip: Fix an error handling path
      commit: 3dfa159f6b0c054eb63673fbf643a5f2cc862e63

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
