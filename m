Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E574E829
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063410E327;
	Tue, 11 Jul 2023 07:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1945210E327
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:37:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F9F61356;
 Tue, 11 Jul 2023 07:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4AFC433CB;
 Tue, 11 Jul 2023 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689061021;
 bh=sEqwyC3FyD2dOA4vxfiDWqxyPw9GpNWDE8xdL9GWS8k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lzWAGfwJ3WXJRoJqVVRC2LoK90eGLluOqf9+gyAmFoLR3DayjC5FLLMNlkmHja7uM
 9ZWJOelSTbJ0ZKnwYTdNkmbkTLLjhX0dI5jitBr+OSxLtXmSaP2K/qmbBqpa3y2wOL
 E9mhSfXV5f6KBMr7h2H84hxLwTh1DiQ/WGJnMy4W+tmUGedpwSegYHWT40zNVlEuat
 j80R0N3i6MZHoe4xxgFAy/MOh0PWwg8D1ayd3F78ksjtKXKRgdWromIW+gsro99ms3
 aMcCDOGhjwRaCRcZnQorRHcgMDjYsvBm+tqOYy3phQUoHjTl2H9TmWUNP5d4TNcnzi
 xsA5R313fOuZQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
References: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
Subject: Re: [PATCH] phy: mediatek: hdmi: mt8195: fix prediv bad upper
 limit test
Message-Id: <168906101764.188690.7974991611736783323.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:06:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Tue, 30 May 2023 10:43:07 +0200, Guillaume Ranquet wrote:
> The pll prediv calculus searchs for the smallest prediv that gets
> the ns_hdmipll_ck in the range of 5 GHz to 12 GHz.
> 
> A typo in the upper bound test was testing for 5Ghz to 1Ghz
> 
> 

Applied, thanks!

[1/1] phy: mediatek: hdmi: mt8195: fix prediv bad upper limit test
      commit: 059c78ebf1e94a825e27cc3ef8a9d77cef06827e

Best regards,
-- 
~Vinod


