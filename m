Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F656F7FEE
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 11:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6410E1D2;
	Fri,  5 May 2023 09:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05C10E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 09:26:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C921B63CB3;
 Fri,  5 May 2023 09:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD03C433EF;
 Fri,  5 May 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683278809;
 bh=cbv7KqFW3EZCwbXiqh1UsSQZA6Dm577W9BTUAcRYjjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YR3ygV1n/WztmQPmypSDHPmCE21+CNyWvFvgd7VAxyi6F+rg2w9GATY0uAdZgQVtQ
 4DPVLjOoqN7CfvpJbD/WKRzabu5rhGp9Ppyle//dCD6ZUck8fN4WD5pnVHIojEd4M1
 RPonfvoC1x1T+xazjxm6SoE1dCKqLnakzXLmrRFOmOf26GwBTBQpPVLaElgsJL/ZSi
 pHIMDgKZTCqpYQVw4qNT9bd4UUuXeZTlP0WCglUiZa8inC1NcroG6UffZRwk2ttqP8
 WkF1rPZuz9M7bs8RcKyQ0YcSif40FX9PoP9WEPwGNBcIIt57hNTMxlug7WQ/Jiriuo
 E7sWXyesn59lA==
Date: Fri, 5 May 2023 14:56:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH 0/2] Fix mtk-hdmi-mt8195 unitialized variable usage and
 clock rate calculation
Message-ID: <ZFTL1BRE+qke209f@matsya>
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13-04-23, 14:46, Guillaume Ranquet wrote:
> I've received a report from kernel test report [1] that a variable was used
> unitialized in the mtk8195 hdmi phy code.
> 
> I've upon fixing that issue found out that the clock rate calculation
> was erroneous since the calculus was moved to div_u64.

Applied both, thanks

-- 
~Vinod
