Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49074E849
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22A10E328;
	Tue, 11 Jul 2023 07:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15510E328
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:44:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAB0A6135E;
 Tue, 11 Jul 2023 07:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF6EC43395;
 Tue, 11 Jul 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689061498;
 bh=ciw16WjgCbpUQ78bDN+pzL0lSeeM/GqmjDYLxzcY6yI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IwPp3mQJ1TpyDP96+oR3Fu3Y/tisMwzJG2v0fVSWQJXN7gzCcGlh4uys5YlZL++SC
 kLrTV4b97MmeAs3dMISU77AFKE4abftNKYLCBgtQsxd7jlJ5+qGDTDgjcJM6xik/nf
 /9X79Cnes411fTfqgKKacopYEzKKjablX4KPmEgO5Zt6gMZUUnipyKQVV7BfP1+9Ih
 xBsXI/HcbssfS+AyGNjsamXF+M+3lcpfdppFLe//nShQV7d69khbihCujMoj0SP+I4
 vei1AFDr1r2/qiPhmJp+O7vrcCb1zXKVJO9fzEi5IPTmzL2ZXJhj/HMBYgf5Bo5JCr
 3LcTzz2ZggEgQ==
From: Vinod Koul <vkoul@kernel.org>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/3] MediaTek MIPI-DSI PHY: Cleanups
Message-Id: <168906149382.189433.16193247421071563678.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:14:53 +0530
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
Cc: kishon@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 25 May 2023 13:52:55 +0200, AngeloGioacchino Del Regno wrote:
> This series performs some cleanups to the MediaTek mipi-dsi PHY, used in
> various MediaTek SoCs; in particular, it's migrating this driver to
> register its clock as clk_hw provider instead and makes use of the devm
> function for the same, allowing to remove a pointer to struct clk and
> the whole .remove_new() callback, as it's not needed anymore.
> This also cleans up the of_device_id table.
> 
> [...]

Applied, thanks!

[1/3] phy: mediatek: mipi-dsi: Convert to register clk_hw
      commit: b1a34e7d196646a8fc0a6f91c2bf98943f3d440a
[2/3] phy: mediatek: mipi-dsi: Use devm variant for of_clk_add_hw_provider()
      commit: e812c5b62a978ae67d23c5eb237959596734a86e
[3/3] phy: mediatek: mipi-dsi: Compress of_device_id match entries
      commit: 5d295c1a20c747425c27dd9212ff091528136e55

Best regards,
-- 
~Vinod


