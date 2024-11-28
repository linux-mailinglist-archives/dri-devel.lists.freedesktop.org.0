Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9439DBD2E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D300510E4A0;
	Thu, 28 Nov 2024 21:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ZICoxLpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCEB10E4A0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dRGDSLsH1Ba5TlpGi2/Qppd+TqYA+uIyrCSKV8c+2WA=; b=ZICoxLpNRbdIDou0AmGn11jvlc
 k03QIEqjQElwbzcq4BLd4vJIAj0vxYBM49xS66tC/8H0HkgCthYtDSsnTQA+p9oNSM5ND77P7Gstm
 PLHz3JTUgHezjhaLnl1LgIgqJs41QR5KT94GVpPKokNyyLGy/UYbJmbLg0LeyArhA2Q0Q2Rgoz5YS
 gVzkXjmrcRllJu45vXd0Q9c+TF8j/1deQYNLQIZHcCHyo1tKBys+jGiDrHmKvnv1LP57MZb1bqaf4
 IcTqWIkje74vkMCvBCNcevb04kafzs5W3X8JAK3FaLWtlc0ckgYdh7MPjtOnqD0oAMYivtAMObQFd
 hRUwMh/g==;
Received: from i5e86190f.versanet.de ([94.134.25.15]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tGlmY-0007ud-1h; Thu, 28 Nov 2024 22:10:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
Date: Thu, 28 Nov 2024 22:10:28 +0100
Message-ID: <173282819998.1000394.12551012503214788208.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241115151131.416830-1-heiko@sntech.de>
References: <20241115151131.416830-1-heiko@sntech.de>
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


On Fri, 15 Nov 2024 16:11:31 +0100, Heiko Stuebner wrote:
> The clock is in Hz while the value checked against is in kHz, so
> actual frequencies will never be able to be below to max value.
> Fix this by specifying the max-value in Hz too.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
      commit: 5807f4ee6d32a4cce9a4df36f0d455c64c861947

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
