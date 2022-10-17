Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9960062A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 07:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA0210E330;
	Mon, 17 Oct 2022 05:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC9110E330
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 05:14:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91C7160DF2;
 Mon, 17 Oct 2022 05:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F411EC433C1;
 Mon, 17 Oct 2022 05:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665983648;
 bh=CvDPdY6BUqMC/ABP5UUSw2rawQa77XBKRxF8x1A0uEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a13SnGLbSkTnOHsyGECGNvQZ/G+mOGRjTXK6moIXVTQt8MgJZ+SdHKOn8XpVjIsuN
 ytWILzgsYKN08Z2LPfNs/Ar0fLuNxLSCJTD721GFU++Hl6XbaSqnolfr3Ftylf/jE0
 eNSJkavpxhuK2j6XbzAnmzBoOnhickL0LyYHLIy+Y+4/AndmaNnDIA7iN+tNvQMgtY
 stt3Br/L6GLXc0M5I5DcLqoh9msUifJ2tTuFN6pI5QiP7NhazWqm8kVI1oOJStcd2W
 fhc9MIWoIYa3afmE+nt3OvzB3BOdXF6WkkX0IKxMPiLzVAZSjbH4LQZFn5GNcT6a7t
 yoPJwMMpjHF5A==
Date: Mon, 17 Oct 2022 10:44:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Message-ID: <Y0zkmww1B974VhdO@matsya>
References: <20221014205104.2822159-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
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
Cc: linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rashmi A <rashmi.a@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nandhini Srikandan <nandhini.srikandan@intel.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14-10-22, 15:51, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
> 
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
