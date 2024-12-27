Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168EF9FD53C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 15:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCDD10E20C;
	Fri, 27 Dec 2024 14:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="YG1iVMf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB2510E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 14:36:56 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
 by cmsmtp with ESMTPS
 id R0S6twagbjMK7RBSRtMl3O; Fri, 27 Dec 2024 14:36:55 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id RBSNt0LBEZTzLRBSPtPPDq; Fri, 27 Dec 2024 14:36:54 +0000
X-Authority-Analysis: v=2.4 cv=L+wbQfT8 c=1 sm=1 tr=0 ts=676ebb86
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=vU9dKmh3AAAA:8 a=CPlf_J6x6-pEMq4byrgA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKy2kDXPQg5LSJ+WcxFbAZTOLG7mg+guZsqD/SyCt7Y=; b=YG1iVMf9n8nyhxGhXJ9JXjShIz
 CyyVHB+uRKIVJ9+f3o66/63AWQ+e2tf91kaQlq03ZafdNpCFtSO20QO3/hkxSe3kZz2cMuN+OzSV/
 gCH7NCp2ujKMEdg+x2fu58mSTaHD3ySNgyVpsQoPtbpHHFpHKT0CqpPYN+MJQ2Y2GY4JyMpuRZHsf
 QfzCR7j02pPHzgiDiLeZeI3ubt//2OyB5LFWqTbPTRkhmqJoJi+H28/pzQGqEdZlyWTWH6CgYlj7m
 YYTVSgzuV+COIIuZLeZcXAFZ+Qdrq9iKj3Z4UoIxMCpDDNX1ckqDTEzZVBcEcp5tYbwQ5s/Ibe/N6
 9vkQx57Q==;
Received: from [122.165.245.213] (port=40816 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tRBS8-003aTF-2w;
 Fri, 27 Dec 2024 20:06:36 +0530
Message-ID: <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
Date: Fri, 27 Dec 2024 20:06:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 00/22] Add support for A100/A133 display
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tRBS8-003aTF-2w
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:40816
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 5
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM2mp8qERbQcBK/z93n7OBQPEsilFdnvYqVbasdTGmT5YlEkoGE5E8KGimjHBvIF/q3L8qWqi7/cLnzDFxJrqZhHgD7DfCqCtyqjZ+39GDPMg4msmqhZ
 I6iHdcN9S/IoN5ANgTz04ByFJpqTrttWR3vnzWfj74C2mHR8zIQRD/SoAImaWw41U3ngz4yXrSOMnY+z+TWkVm3k/0iL1ZvsevCRcwT/yQZroZE0GsEKzVOv
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

On 12/27/24 6:30 PM, Parthiban Nallathambi wrote:
> This series depends on [1] for the eMMC/MMC controller to work and
> [2] (lined up for 6.14) which adds support for the sram nodes and
> display engine extends it's usage. Idea of this series to get initial
> feedback and adjust, which will be rebased for 6.14 once [2] is merged.
> 
> This patch series adds support for A133 display pipeline based on
> LVDS. dt-bindigs are organized in the start and later with code
> changes.
> 
> PHY is shared between DSI and LVDS, so to control the PHY specific
> to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
> using set_mode, analog control register MIPI Enable is used, which
> may not be available for A31 (shares the same driver).
> 
> Otherwise, A133 also got hidden independent display engine i.e
> mixer + tcon top to handle parallel display. But this patch series
> adds only support for the 1 mixer which is documented.
> 
> [1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
> [2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
Apologize for polluting with resend again. My internal mail server got blocked due to
volume count, which resulted in incomplete series again.

I will fix the mail server issue before resending the series. Sorry.

Thanks,
Parthiban

