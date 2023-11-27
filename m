Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6F7FA0F1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B50510E299;
	Mon, 27 Nov 2023 13:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EA910E299
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:23:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D1FE6CE11E7;
 Mon, 27 Nov 2023 13:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3AC433CA;
 Mon, 27 Nov 2023 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701091372;
 bh=GAarMoewnkwJp9XLJQmcej2YbN3Q4NV+hfVw+jdVqdE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=po8G/Jd1b5AVxwfM7ACP6l3yi12wgDzzx5ru7waF6zgVpdZN39rWzCrIOAWLsSdGm
 N9rZ1yj6R1P8kCHvJxyS5qGtRQb6iJ2l0GWZZJX1NrpZ5vIIlaCiRyPOf2N7MPcGbD
 JU9imQ+VOMoYL2lj8HVUDSL3qTSApsBVQo45xWuJuaHk9+GyNhQiXfC2+RzX1ZNe5v
 AwlPtiHDdiwSonfwUeMkwxVLD9Wkvylt21nBNInPfQXgLORhP09ns4ptcDk7zF9wCV
 2DTCdcNfSFdjw0xMEDAkbNPZpDgSo0NLtK7v+0PkxrbhKZ/uZdNyNOu3a2ij+Eq9yA
 LWjaZ/qRhA8OQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 Michael Walle <mwalle@kernel.org>
In-Reply-To: <20231123133749.2030661-1-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH 0/4] drm/mediatek: support DSI output on
 MT8195
Message-Id: <170109136570.42627.4378174652499590897.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:45 +0530
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Nov 2023 14:37:45 +0100, Michael Walle wrote:
> Add support for a DSI output on VDOSYS0. Luckily, there is a new
> feature to support dynamic selections of the output (connector).
> Use it to add support for a DSI output.
> 
> Apart from that, this is pretty straghtforward by just adding new
> compatibles and add the correct DSI nodes to the SoC dtsi.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: phy: add compatible for Mediatek MT8195
      commit: fa50920b4f82993941e0aac349eb8081ce11e38f

Best regards,
-- 
~Vinod


