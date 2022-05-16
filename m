Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13EA52938C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B8310E00A;
	Mon, 16 May 2022 22:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A541210E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 22:26:12 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqjAF-0006dU-SP; Tue, 17 May 2022 00:26:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/3] RK356x VOP2: Change register space names
Date: Tue, 17 May 2022 00:26:06 +0200
Message-Id: <165273995327.2730627.1184879959293003586.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511082109.1110043-1-s.hauer@pengutronix.de>
References: <20220511082109.1110043-1-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 10:21:06 +0200, Sascha Hauer wrote:
> The VOP2 driver sitting in next uses named register spaces, but the
> binding lacks documentation for that. Add the missing documentation
> and while at it take the opportunity to rename the register spaces
> from too generic "regs" to "vop" and from "gamma_lut" to better looking
> "gamma-lut".
> 
> Changes since v1:
> - Fix dt_binding_check errors
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: rockchip: make reg-names mandatory for VOP2
      commit: 54eb8d446e710b5f77969bd34f0a162cf86b8d29
[2/3] drm: rockchip: Change register space names
      commit: 5ee8c8f930ba7d20717c4fc2d9f1ce0e757d1155

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
