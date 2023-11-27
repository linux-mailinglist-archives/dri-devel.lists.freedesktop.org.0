Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A188F7FA0D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04B610E295;
	Mon, 27 Nov 2023 13:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268B710E295
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:22:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 424E160FC5;
 Mon, 27 Nov 2023 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E204C433C8;
 Mon, 27 Nov 2023 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701091326;
 bh=Vwhxnt4f22Jqm2f+no8vVvfxwUzvv6b9URiNaYVC1Z4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RpTMTTF6H5EZOoQo5s387IJVl+0oeBUdDVeSUuFoNbGG2A0Cc6+NH6nOaBJSfZZYt
 GAZE9fh3lBe8TC1kOSdIcInp7kY6VNXTbxXscaP+EJdlTc0TUMSs5rLQTqYz4cT2hf
 JisWVOaGzuDff8PWoXHjRbFkmanTQAihWGKe22Sre8Uxa4T8luPRRD4lGv1n0mSsAo
 0gkhDeg4QQHDagB+mCkZBjTycS+ya9qCNKa80SS4GeWTEZ2ZzRYKACdS6wdWmwnsVq
 oWOvW/utbVfXf1yBQqIJcB86J4CahpI5/+YXDutlZv92VQRvE1jyL8xuvWnS4UudsS
 gzu/ujqknBwbA==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 Michael Walle <mwalle@kernel.org>
In-Reply-To: <20231123110202.2025585-1-mwalle@kernel.org>
References: <20231123110202.2025585-1-mwalle@kernel.org>
Subject: Re: [PATCH] phy: mediatek: mipi: mt8183: fix minimal supported
 frequency
Message-Id: <170109132204.42536.9999917712237405775.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Nov 2023 12:02:02 +0100, Michael Walle wrote:
> The lowest supported clock frequency of the PHY is 125MHz (see also
> mtk_mipi_tx_pll_enable()), but the clamping in .round_rate() has the
> wrong minimal value, which will make the .enable() op return -EINVAL on
> low frequencies. Fix the minimal clamping value.
> 
> 

Applied, thanks!

[1/1] phy: mediatek: mipi: mt8183: fix minimal supported frequency
      commit: 06f76e464ac81c6915430b7155769ea4ef16efe4

Best regards,
-- 
~Vinod


