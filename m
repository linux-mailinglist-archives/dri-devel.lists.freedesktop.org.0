Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AB79FD1D6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 09:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB19D10E1FB;
	Fri, 27 Dec 2024 08:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JmlntwVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2A10E1FB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 08:11:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E0215C61E0;
 Fri, 27 Dec 2024 08:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE6CC4CED0;
 Fri, 27 Dec 2024 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735287080;
 bh=8G7txf5k/NvaNn+tMyyAs7ThOyBVKh4kAWiUg1BC3uM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JmlntwVNpzXuVe0t0HV1ngHDTaIYGZ1m9coMxg6iE0pZaxIFbM9q/0fUg0LIpTZmj
 QaaP7Of1u/TqwEBS73IOdCypBx+9IRK2PetOkZ3oUEPM2tw2/UuBVMJwR1jA1Ykjru
 tSW8YHol78H6cxtb04x3psR9yh+H1eUmV9aJK+oIv9o5L2t4xbJ4XyiWBTxWbxdxC+
 cGJDOBj4AwLeRo4gOHIm4lFkD7loqGSVqTZkuZATiWtW42PS45MpZgmczhhI8UPNZU
 WR0oBLz3244e7cfY8ivlS4Mxniyak+YvYmpZ41YBBmIA6L7wMCyRLpMJMTA6RFmeON
 qJ8fDf2UeLjIA==
Date: Fri, 27 Dec 2024 09:11:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <gfopo2xjqljehbwkrxlf2t3vqwrqi4namh7dlt2rf4bc4ri25k@xm7pawszl4ix>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>
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

On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
> 1. Add compatible name and iommus property to mediatek,gce-mailbox.yaml
>    for MT8196.
> 
>    - The compatible name "mediatek,mt8196-gce-mailbox" is added to
>      ensure that the device tree can correctly identify and configure


This is 100% redundant statement. Don't state the obvious and don't
explain to us how DT works.

>      the GCE mailbox for the MT8196 SoC.
> 
>    - The iommus property is added to specify the IOMMU configuration
>      for the GCE mailbox, ensuring proper memory management and access
>      control.

You should say whether device supports or does not support IOMMU. So all
devices now work with IOMMU? I guess I asked about it already, no
improvements. So again, don't state the obvious.

> 
> 2. Add the Global Command Engine (GCE) binding header to define the
>    abstrct symbol binding to the GCE hardware settings of GCE Thread

typo

>    Priority, GCE Subsys ID and GCE Event for MT8196.
> 
>    - GCE Thread Priority: Defined to configure the priority level for
>      each GCE hardware thread. This is necessary for proper scheduling
>      and execution of commands in the GCE.
> 
>    - GCE Subsys ID: Defined to specify the subsystem ID for GCE clients.
>      This is used to correctly address and access different subsystems
>      within the GCE.
> 
>    - GCE Event: Defined to specify the events that the GCE can handle.
>      These events are used by the driver to synchronize and manage
>      hardware operations.
> 
>    Examples of the binding usage in the driver code:

Drop all below from commit msg. Don't paste C code into the bindings.

Best regards,
Krzysztof

