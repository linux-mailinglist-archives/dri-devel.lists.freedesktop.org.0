Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F698CCE6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 08:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C04110E10F;
	Wed,  2 Oct 2024 06:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o1l4vKo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A9210E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 06:04:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4C705A41441;
 Wed,  2 Oct 2024 06:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B438C4CEC5;
 Wed,  2 Oct 2024 06:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727849069;
 bh=eRDH2gRHruASGT5jIjGwtC0n2ZkTL8neYpxlhmRvEhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o1l4vKo+R24aKUhtoK4RPWqg3hTdfs5DZ8QTcKArXPES9xZ/CMZxzDEIDZmGdtBN6
 i4YrOt9UWjUMHOMl+Vc3xNYigCtDHmP6ZIqlrw2/KUTRP7g8iWO7MtU+NVW38eHma+
 Hjo3/2okxFlyS6xpnivTf8T3Hp/fvqkFjo2y4tAMP39+z49ZYFyP9d0uY+PSSHe4LY
 0J6j4mBx5kBwn3uvOpSX+B0VHnjPazoNR1M9X2CaYcLOSXAx4pgJlXxrAVTXUmJNK8
 dk7SnCyAkfFVdwuLjcFeTM+cxgMgqVHULozvZp8tsLuCbMbPkdxiRP1E8qlIbxFtqs
 S8cnpJhj1mNuA==
Date: Wed, 2 Oct 2024 08:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rohit Agarwal <rohiagar@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: display: mediatek: dpi: correct
 power-domains property
Message-ID: <idkorrjd5g2yjcnclks55pozf6rrv2w4fyhbwaaznvq5ngmcdm@vxpjh6q4visi>
References: <20240930083854.7267-1-macpaul.lin@mediatek.com>
 <20240930083854.7267-5-macpaul.lin@mediatek.com>
 <20241002015120.GA236278-robh@kernel.org>
 <7f212146-3dc7-9a0d-baf4-ac7a5b845060@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f212146-3dc7-9a0d-baf4-ac7a5b845060@mediatek.com>
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

On Wed, Oct 02, 2024 at 11:09:07AM +0800, Macpaul Lin wrote:
> 
> 
> On 10/2/24 09:51, Rob Herring wrote:
> > 	
> > 
> > External email : Please do not click links or open attachments until you
> > have verified the sender or the content.
> > 
> > On Mon, Sep 30, 2024 at 04:38:54PM +0800, Macpaul Lin wrote:
> > > The MediaTek DPI module is typically associated with one of the
> > > following multimedia power domains:
> > >  - POWER_DOMAIN_DISPLAY
> > >  - POWER_DOMAIN_VDOSYS
> > >  - POWER_DOMAIN_MM
> > > The specific power domain used varies depending on the SoC design.
> > > 
> > > These power domains are shared by multiple devices within the SoC.
> > > In most cases, these power domains are enabled by other devices.
> > > As a result, the DPI module of legacy SoCs often functions correctly
> > > even without explicit configuration.
> > > 
> > > It is recommended to explicitly add the appropriate power domain
> > > property to the DPI node in the device tree. Hence drop the
> > > compatible checking for specific SoCs.
> > > 
> > > Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
> > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
> > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > 
> > You missed Krzysztof's R-by tag.
> > 
> 
> Oh, I just missed that reply for v3 in the mailbox
> and thought it still need to be reviewed.
> I just found Krzysztof's R-by tag in the mailbox right now.
> 
> I'll send an update for this patch set.
> Thanks for the reminder.

Plaese, instead just start using b4...

Best regards,
Krzysztof

