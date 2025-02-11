Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F34A30712
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 10:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2310E48E;
	Tue, 11 Feb 2025 09:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="khD+fbl6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B3910E48E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKxU1H0bH4jOjCpR1iDA2kn4hJyozUlGpPk9T5FA/N4=; b=khD+fbl6rFjDcBbbVPzRaalweS
 coRFMUULM4kw5PMl6IonM8XSYGxIZX5by/0liY/PQq2/ngdVU43/BHV8aJMZ2gP6Yp+BgLXdB+lt9
 /dDS8qOgHNbsINo5D3WlB6+WkryLtDwItBu9HEJWBDRqRGdRsNBKmPN5d9zz662XOybMSSb4CfwuH
 BhfYvNtIYJllmFhPM7XJjWnh12RQHn25081YBx0ZJfOTZBEDS4VB0coFZiptRtN7mZdUuxmH9/P9B
 dG/dk5YnHdUuov+4K+qn6oLrTBCFR5Vzop17VOJAUF8MUwUz8cHTyVMpJNd2J1nrW1zx7cU8iEo4h
 ysGtCfhQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1thmZj-0005mx-GW; Tue, 11 Feb 2025 10:29:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Alexandre ARNOUD <aarnoud@me.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
Date: Tue, 11 Feb 2025 10:28:51 +0100
Message-ID: <173926612575.1219038.14455377173250297870.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Dec 2024 01:06:13 +0200, Cristian Ciocaltea wrote:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.
> 
> ** IMPORTANT **
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
      commit: ea97212a0f66b7bd71c23c12f781f1770dd6fcff
[3/4] arm64: dts: rockchip: Add HDMI1 node on RK3588
      commit: bed6964e779b5853de042da14320edf9f79506fe
[4/4] arm64: dts: rockchip: Enable HDMI1 on rock-5b
      commit: 77cea7ca13680e14119a3b9635c7ef16cd7ee44e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
