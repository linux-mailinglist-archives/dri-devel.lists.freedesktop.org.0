Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B43B19486
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 18:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7F210E03A;
	Sun,  3 Aug 2025 16:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OdDhpMmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B4C10E03A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 16:54:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B0A2A4056C;
 Sun,  3 Aug 2025 16:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DE5C4CEEB;
 Sun,  3 Aug 2025 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754240060;
 bh=MBm7ZsvVwbCPe3opDnhyrGNHaw8Vwe/UA3+xsVo/aKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OdDhpMmIBqHp/G+ox1idH2muGXJGz0SMy4auV88TnspXhNfNr8irsr93brC0357u4
 tATQ0Cr7K90a/M/BfCie3lPRdIVKN3ef62MaswJkucUS3/s2eyQ87o6RVJ+DZvSaMd
 6XaPVzYUWuiyyaDFaWCoohod5TbcwpyvfELGrwWsqYTc/tPKn6ajQiFyhO5B5cayWX
 iw30lFWDtNNihKYaQF3WOokaBIVGxc7Hrw83I+k00A7/r2os9c96hu1Hn5pf08M7uB
 gqllGe54KV1dlv7I1k4hubz/JRnvLVGlCaNmhWOikyGtO+pXQNcI6onxQzSXTXPp+6
 Xt5ymue6tTxag==
Date: Sun, 3 Aug 2025 11:54:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Orson Zhai <orsonzhai@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin3.tang@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Kevin Tang <kevin.tang@unisoc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 02/16] dt-bindings: display: sprd: use more
 descriptive clock names
Message-ID: <175424005938.523766.7181495703090197785.robh@kernel.org>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
 <20250731-ums9230-drm-v3-2-06d4f57c4b08@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731-ums9230-drm-v3-2-06d4f57c4b08@abscue.de>
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


On Thu, 31 Jul 2025 17:51:15 +0200, Otto Pflüger wrote:
> Introduce new clock names that actually describe what the clock input is
> used for instead of referring to a specific clock source.
> 
> The new clock input names are based on information from clock drivers
> such as drivers/clk/sprd/ums512-clk.c. The 128M clock appears to be
> CLK_DISPC0_DPI, the clock used for the DPI output from the DPU, while
> the 384M clock is CLK_DISPC0, the actual DPU core clock. The DSI
> controller's 96M clock is most likely CLK_DSI_APB, the APB clock used
> for accessing its control registers.
> 
> Since it seems possible to configure different frequencies for these
> clocks, the old bindings do not even accurately describe the hardware.
> Deprecate the old clock names.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml         | 17 +++++++++++------
>  .../bindings/display/sprd/sprd,sharkl3-dsi-host.yaml    | 11 ++++++++---
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

