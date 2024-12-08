Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C49E86DA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 18:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68110E26D;
	Sun,  8 Dec 2024 17:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IwqYhAka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5CE10E26D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 17:03:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1618A5C4A82;
 Sun,  8 Dec 2024 17:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF368C4CEDD;
 Sun,  8 Dec 2024 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733677388;
 bh=ynzwxb8ZUrtmhHbZfYc5diIMVTylkfhhZS14e6rb1u8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IwqYhAkaiqnfYZVPgJDNxmkxEZkOlvr3cFsFILRAv2kHs9jBbth0d2Vc1PKGuFq1L
 Q2l/Q345kz/dmuKx972RzB6eyJIZNsSKLAvnhEkbL/YbI4y6HLosWB8wl89KVsbPKP
 s4xITn9ejX4vmfkI44okF8EhfJXNd4BWLd1jSDdCfCmUtwOM6wzCFu8cuFyvybHYVF
 tcOXwRgZBrEzuxblvxpDUrWjgkoWsN2TvvKsW7flY5JFTQzAvLhOi84MDk4z+fyCBl
 QF3OH1F+IicuN0/apsqSxirH/W65Qe28by2Ki9ZGK62jwStlBa4zRFfOo1pFW4fCpK
 L+XEkxg+bt/yg==
From: Vinod Koul <vkoul@kernel.org>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@kernel.org, 
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20241120124143.132637-1-angelogioacchino.delregno@collabora.com>
References: <20241120124143.132637-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] phy: mediatek: phy-mtk-hdmi: Register PHY provided
 regulator
Message-Id: <173367738439.1042266.5465775023620885336.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Wed, 20 Nov 2024 13:41:43 +0100, AngeloGioacchino Del Regno wrote:
> At least version 2 of the HDMI PHY, found in MediaTek MT8195 and
> MT8188 SoCs, does provide hardware support to switch on/off the
> HDMI 5V pins (which are also used for DDC), and this translates
> to this being a fixed regulator.
> 
> Register this PHY-provided regulator so that it can be fed to the
> hdmi-connector driver to manage the HDMI +5V PWR rail.
> 
> [...]

Applied, thanks!

[1/1] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
      commit: 49393b2da1cd5b0a6859693369b4fb27df59d3e2

Best regards,
-- 
~Vinod


