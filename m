Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919B9D4948
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6B510E8B7;
	Thu, 21 Nov 2024 08:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MAU3vaTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8310E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732179311;
 bh=esX6pNIA4mdgAouLBmxFqcD5UvWUX2OcANV49HJchSs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MAU3vaThPKsD/1L/Zm+bwQdn1YX5Us5vGulfNUH3TnJIcJ8/hqH9BIhEw7XxzfyoU
 Q1XUAf78dZwv9qYtCoNjJ7Xe+bgjm4OOcoqXtdgTs8ZlNlHQ/IMtZcfTKptZbt3+V0
 r6U7/e0oDlT0Ulim2IXuDb3bxcWCF2iRNfowHVzrTfDjq1TZS8F7myWw3Bajp4DxXZ
 5dXKJAf53L+C97Qo3P1MwZbkg+Inw7SQhewVYvMKs6lGtvIFldKjoaqII01ahDIrfM
 rWWScEjKE3oG8DzOsLy35mai5+Ac2hmErQ+KcijVRs+HmxAMVPNJ2lRiBCjgjNnTWv
 k1QG2KiWg3cag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A81F17E132F;
 Thu, 21 Nov 2024 09:55:10 +0100 (CET)
Message-ID: <72c1e62b-0bbf-4213-adbb-972caa1ebfee@collabora.com>
Date: Thu, 21 Nov 2024 09:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Add GCE support for MT8196
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 21/11/24 05:25, Jason-JH.Lin ha scritto:
> This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
> driver and related subsystems. The changes include adding compatible
> names and properties, updating driver data to accommodate hardware
> changes, and modifying the CMDQ API to support non-subsys ID hardware.
> 
> Jason-JH.Lin (8):
>    dt-bindings: mailbox: mediatek: Add GCE header file for MT8196
>    dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
>    mailbox: mtk-cmdq: Add driver data to support for MT8196
>    soc: mediatek: mtk-cmdq: Add unsupported subsys ID programing flow
>    soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
>      address
>    soc: mediatek: Add pa_base due to CMDQ API change
>    drm/mediatek: Add pa_base due to CMDQ API change
>    media: mediatek: mdp3: Add pa_base due to CMDQ API change
> 
>   .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |    6 +-
>   drivers/mailbox/mtk-cmdq-mailbox.c            |  107 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |    4 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |    4 +-
>   drivers/soc/mediatek/mtk-cmdq-helper.c        |  133 +-
>   drivers/soc/mediatek/mtk-mmsys.c              |    1 +
>   drivers/soc/mediatek/mtk-mutex.c              |    2 +-
>   .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1449 +++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h      |    3 +
>   include/linux/soc/mediatek/mtk-cmdq.h         |   22 +-
>   11 files changed, 1698 insertions(+), 37 deletions(-)
>   create mode 100755 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> 


Hello Jason,
I had a fast look at the changes that you're proposing with this series.

The reasons behind this are more or less understood on my side, but the
actual changes look a bit odd in the sense that passing a physical address
like this, on a first glance, not only looks like it may be dangerous, but
also looks like there's a lot of room for improvement.

Can you please point me at some driver/code (or a reference downsream kernel
for this SoC, which would be even better) so that I can take a look at how
is that being used?

Thanks,
Angelo
