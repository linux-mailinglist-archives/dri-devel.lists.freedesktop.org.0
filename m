Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE472AD1B77
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 12:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2210E209;
	Mon,  9 Jun 2025 10:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lNlOB6Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC26510E040
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=K0AL5zLG/bnHCisTlv3I7JUPhVxh/ayleUVJo70oA0w=; b=lNlOB6MgeXdxPAe9TjFU3cpJVZ
 GfryxcfdyOMRrD1gNxqJWb5iNEvacx97E7D+mBRhLeF4SORLw7nMxOC15dTvP5ZsmqmUHKKHu314T
 8UebT7IP3vHNlEFm9RI6KWy2++fkk3vKn2NvPi+OVZRjGr2EBTnnyYy54DVLctrwdF8Z1eJyGW1LM
 E51O+QYqEnKiV1j80ZPRfq4Q0OGb1XRuJo3KmFX69ZdHTqmAyPutux8Ix7pAO3cva+Fkl85CakzAY
 9daEDAejh2c0dHn6fdPTHevTCmXYTynjNIH0mhfn89hycndTNiStFVUZMSnMODAC9z8ZgfW7+f7Sn
 3yhpi7zQ==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uOZfF-0006Av-18; Mon, 09 Jun 2025 12:23:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, javierm@redhat.com, megi@xff.cz,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH 0/4] Add DSI Panel for Gameforce Ace
Date: Mon,  9 Jun 2025 12:23:03 +0200
Message-ID: <174946455531.762051.4163841843437974105.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
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


On Tue, 03 Jun 2025 14:39:26 -0500, Chris Morgan wrote:
> Add support for the DSI panel as found on the Gameforce Ace handheld
> gaming console based on the RK3588s.
> 
> Chris Morgan (4):
>   dt-bindings: vendor-prefixes: Add prefix for Huiling
>   dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
>   drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c
>   arm64: dts: rockchip: Add DSI panel support for gameforce-ace
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: Add DSI panel support for gameforce-ace
      commit: 6b28769116971a4427ea09ed2cb1cf1afa79ab82

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
