Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D95182FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 13:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C6B10FA13;
	Tue,  3 May 2022 11:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346B10FA13
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 11:02:25 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nlqIS-0000jV-BY; Tue, 03 May 2022 13:02:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: (subset) [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
Date: Tue,  3 May 2022 13:02:22 +0200
Message-Id: <165157539006.562013.6067790581243150887.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422072841.2206452-1-s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 09:28:17 +0200, Sascha Hauer wrote:
> It's v11 time. There's only one small change to v10. Discussion seems to
> have settled now. Is there anything left that prevents the series from
> being merged? I'd really like to have it in during the next merge
> window.
> 
> This series still depends on:
> drm/rockchip: Refactor IOMMU initialisation (https://lists.freedesktop.org/archives/dri-devel/2022-April/349548.html)
> arm64: dts: rockchip: add basic dts for the radxa rock3 model a
> 
> [...]

Applied, thanks!

[07/24] drm/rockchip: dw_hdmi: add rk3568 support
        commit: 28bbb5ffbe32741e65d798070986d212cc11e1bb
[08/24] dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568 HDMI
        commit: 77b0693f875d4d916d0518ac0de68d4d0de3934f
[09/24] drm/rockchip: dw_hdmi: add regulator support
        commit: ca80c4eb4b01a7f1c2f333d0a329937ef9c7f03a
[10/24] dt-bindings: display: rockchip: dw-hdmi: Add regulator support
        commit: 80266ccb864b6443fd0bf54bb17444d2632fad21
[15/24] dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
        commit: 6e944f52a225484b87bb343d0ba28165edf04b19

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
