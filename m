Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CC705060
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 16:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A658C10E0F7;
	Tue, 16 May 2023 14:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA0E10E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 14:18:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0886E63018;
 Tue, 16 May 2023 14:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AB6C4339C;
 Tue, 16 May 2023 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684246706;
 bh=YXhBO9eG7UWbqzuiSK1fn6Kv4L06SYxCu/Poh/mJHwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5Z7Rp6T/k00U4NfiIA60xzvdndp67Bi9eF0AXmi1sA/kR32HdVQVykmsjg7jpBY3
 hrl4quu7TpWXEaSdRD0/00cH3TVaDAnwl2GzwGDu/KBVuCWG4cHEfGl4PnPaqHFV23
 LLvsveTXCqPOThx9ey11JL9f2wLczR0XpLfjr4NIsqGSxKDVbXUhbEyRLLeeqQbetu
 jR3zKAFkY1IEEACvliEdA3dTw7DcVNYSPZ4BsYy80UReKX36g/7iAKu+ooov0hPAi8
 HeuJcT7z/GMYo4dw+9UmllPbFYrEXcAXcQmm/Q7XXFNwa16RX/sKMXFVOM8q+BiSVI
 cbMpIcnnQaU5w==
Date: Tue, 16 May 2023 19:48:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
Message-ID: <ZGOQroo9KB0IKeu1@matsya>
References: <20230502145005.2927101-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502145005.2927101-1-trix@redhat.com>
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-05-23, 10:50, Tom Rix wrote:
> gcc on aarch64 reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
>   is incompatible with the use of floating-point types
>   240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> 
> Floating point should not be used, so rework the floating point comparisons
> to fixed point.

Applied, thanks

-- 
~Vinod
