Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9074AA8624
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 13:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7939C10E111;
	Sun,  4 May 2025 11:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="cExt7QZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744F310E2C5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=VjW/S1wj+bsZEprtcW0AfkkvqS+OgAoSKYgQyE7SjV4=; b=cExt7QZ9//sJx6sNHJx3b66viV
 JeCAQajhqriJs2/S2c1ru6cIX5GEke8nF5FjkwJ8Rpyx01+75MPOGtKDQRxkm7JmaY7EEd3tfCuAG
 6M/OazxmoCR8pLCspg4HoSBrjDg64J5EaRcornEsIZSGTUqmzvfqina+ranhIWl+dX3V6AnqBZ9t/
 Ia3B9QTk3B4G9hKrIP6xrT4ldPW24pdNmdwPD7O57RLcMO9MJNeZX9C4FwYMU7FToEq0f43brcftj
 RwT3qu/3lMCR2CQ+TqD0RZeU8EsZdxXzyQTJQDzAKBXvbwF1SUZOYVUVnmi5ipjIBAf/uJK83h9jW
 EvaIunVA==;
Received: from i53875bbc.versanet.de ([83.135.91.188]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uBX4X-0001M5-Nx; Sun, 04 May 2025 12:59:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Sun,  4 May 2025 12:59:39 +0200
Message-ID: <174635636712.1068615.12087879387464324976.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
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


On Tue, 22 Apr 2025 15:04:39 +0800, Andy Yan wrote:
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
> 
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036 compatible
      commit: c0673bb356557136954b6725bf5fe327b94c6233
[2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
      commit: e0c93980d293b6e6eb7483fd5d665f84e725b518
[3/7] drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
      commit: 31b4403c6c523a710205eadb9ca75c6cfe1478ab
[4/7] drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036
      commit: ad10b82c2bcac7f87ac6eaecfca33378b43425ee

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
