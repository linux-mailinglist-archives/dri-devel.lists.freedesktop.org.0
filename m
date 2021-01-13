Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0242F4CE1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE606E9F8;
	Wed, 13 Jan 2021 14:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0FB6E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:14:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F52423382;
 Wed, 13 Jan 2021 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610547263;
 bh=KinOGg4lYC7JiS+C8xi7VLcYNovCNiAnNVUNQ8Co1JI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z80Gr+ndh4rI8ubn9528SocoZhPoAfJStmr8+b2cuvc8anVEIc8GqbmgQPGcuqmrW
 1nX7EoUMNWhgw0hvsbowht0bL7qUHhBSLcnU0z7azltPvmTUc0AengD64bzQS1SiNq
 erHb3rmDHiaXC3f7CCba0zX8NygU7LcmR29SYH90YAF4NO2gmswABhvlsfziQabkh5
 YvKwLs7pN7Xcsdw+vIOI+2N5CEPbAqXRiJWJLHBU9FOvlr7d8BwluA08kyOX5msKTG
 TtktOXp4o6CMts3QF0Pm2QtGfEW4Fg43rDTWIAaNzbwHFdQu9A6ygl7JtDvZR3Mj4o
 aTXFFrw+MZmPw==
Date: Wed, 13 Jan 2021 19:44:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] phy: mediatek: Mark mtk_mipi_tx_driver with static
 keyword
Message-ID: <20210113141417.GR2771@vkoul-mobl>
References: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, chunfeng.yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12-01-21, 09:38, Zou Wei wrote:
> Fix the following sparse warning:
> 
> drivers/phy/mediatek/phy-mtk-mipi-dsi.c:237:24: warning: symbol 'mtk_mipi_tx_driver' was not declared. Should it be static?

Applied, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
