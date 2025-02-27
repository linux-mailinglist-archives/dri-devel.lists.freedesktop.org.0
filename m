Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DFA47AD9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 11:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961A210EA66;
	Thu, 27 Feb 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BtlIf09N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3D010EA55
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WAw3zkvChaokZP/EIQV/XtYpCHOZ+jZa4e8VVZ5rP1E=; b=BtlIf09N8Z01zGJauVBo20e/ic
 lj9FcGghUcxKjgDzdvU9VqJ+tXybxXHe9L9WmuX9W+9h/mIhiOfrcygo4I/IFc9KtNEA7J+sTIYan
 mVfF5e6muJRdMsllk7UfHDdCE3TE2kXNIKcdifaGQC7b4LHHTXYwXH9oBl24944q4S/75vqTtswZu
 +gR6ZlHFHAEbhiLeL7mIZUMYLwfnS8GrbchupZFxERLhOgSvFTJ3Q4F2IGZQEjBXdy9dm0gp2Wn7T
 XuBabPUGxa443riihq9Oajkg8659gs3TwoGjf4tyCauVAkJAFmlOAxEQzUF3qNdlZCxjpx6p0IMqG
 DUWUHvmQ==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tnbY7-00008f-5I; Thu, 27 Feb 2025 11:55:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Improve Rockchip VOP2 display modes
 handling on RK3588 HDMI1
Date: Thu, 27 Feb 2025 11:55:14 +0100
Message-ID: <174065370896.4124124.16006853478934870173.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
References: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
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


On Sun, 23 Feb 2025 11:31:36 +0200, Cristian Ciocaltea wrote:
> As a followup to getting basic HDMI1 output support [1] merged upstream,
> make use of the HDMI1 PHY PLL to provide better VOP2 display modes
> handling for the second HDMI output port on RK3588 SoC, similarly to
> what has been achieved recently for HDMI0 [2].
> 
> Please note Heiko's fix [3] in of_clk_get_hw_from_clkspec() is also
> required for boards that do not provide HDMI0 output, that is to ensure
> devm_clk_get_optional() returns NULL instead of ERR_PTR(-EPROBE_DEFER),
> which otherwise would put rockchip-drm module in a permanent deferred
> probe mode.
> 
> [...]

Applied, thanks!

[1/5] drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      commit: f8dd7fc9ba88bc4a6ea85269287a51fb756440e2
[2/5] drm/rockchip: vop2: Consistently use dev_err_probe()
      commit: b06d1ef3355571383cdb463cf0195b7a02efdfbf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
