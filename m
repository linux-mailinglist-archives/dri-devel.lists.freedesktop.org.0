Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E56C10F8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 12:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89B510E1F2;
	Mon, 20 Mar 2023 11:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5010E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:38:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF99FB80E56;
 Mon, 20 Mar 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C1C433EF;
 Mon, 20 Mar 2023 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679312311;
 bh=YfQJfApGvnHfGU8gi0gNukjaGzsg84xu5lWbeqt0lnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eb0R3e1JjZqoZgzBIBGjddsyzF5oRvdKqX4zJzfcsM0/DnTdJPwvylLD+N+LKBRzx
 IUP4xObd68HKq8F/Qvpt1W8+ib5Odyumu8IK77yOV7UrOlBps49shv9e9/SC/xo2kz
 m0aAW+ll4AWGsB8I2maII0LRP6fC/xl2FJLRDWSewz86h49su8evjRUcjYOvGhEqEP
 OqxjJPCWzSjGCbGJ72Q91R07MKL6mi3EU3EI8GH5XvBh3WyMEz82QnPL2OuhZKfQhY
 kOBto01PJnNfY6OWt0wG8oiBvRdeyp56uvftv10KL3GXZXlc50hUNdkT6jkk/wjKoa
 ZZVIoO4TNk3KQ==
Date: Mon, 20 Mar 2023 17:08:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/31] phy: Convert to platform remove callback returning
 void
Message-ID: <ZBhFsyXyN4wHV5BB@matsya>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-msm@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
 Yuan Can <yuancan@huawei.com>, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Justin Chen <justinpopo6@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Dan Carpenter <error27@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Swapnil Jakhade <sjakhade@cadence.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Matt Ranostay <mranostay@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-tegra@vger.kernel.org, Rahul T R <r-ravikumar@ti.com>,
 Liu Ying <victor.liu@nxp.com>, Andre Przywara <andre.przywara@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sinthu Raja <sinthu.raja@ti.com>,
 Roger Quadros <rogerq@kernel.org>, kernel@pengutronix.de,
 Allison Randal <allison@lohutok.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Tanmay Patil <t-patil@ti.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07-03-23, 12:58, Uwe Kleine-König wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/phy to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> All drivers in drivers/spmi returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") which is included in v6.3-rc1.

Applied, thanks

-- 
~Vinod
