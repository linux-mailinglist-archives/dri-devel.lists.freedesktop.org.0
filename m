Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A364695B9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835673FC0;
	Mon,  6 Dec 2021 12:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Mon, 06 Dec 2021 12:31:10 UTC
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [IPv6:2001:888:0:108::1b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3373FC0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:31:10 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id uD20mopqWQyExuD23m27RE; Mon, 06 Dec 2021 13:23:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1638793430; bh=jKxmMClSqaNbMNZ63dRomltkwgWJhIYlQh9tU8v947c=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
 Subject;
 b=dujxjvgtOtn6ry3GmU/UDGM8g2tR98BDeeFEmeFE78QcsIV4u/+vRvqjtHOzc7cIx
 qG8QkE4fzFPZnXwdRX9pi2rnXffwpxTysIaDvvNtcJW6OyV6ySt+dwtUklMmNTzjnX
 et2t2qx+jN3aJaQfCAiMifltOmF8pNTFCOwfwUWJAlcGjz5zSldVAHSLrsFXh/d5it
 w31h/L9pvR3ckBP3PDvIZZgznfjCexpVHaK048LcmjK7C1w6Be4SH+t3u7OYvIB09q
 gu4kCgRJ3b7N89tWjULhzcb5euHYaDvBCAHurxfMkpeu1NktqnXVxC/KaDtUTBSTXj
 qDTn3zPFF6ydg==
Message-ID: <6d4056d6-21ac-c230-ac7f-a45eb3d3dcfa@xs4all.nl>
Date: Mon, 6 Dec 2021 13:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20211112105509.12010-1-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJLbABDvWm0hRa47LpN5IzEPDbXCXfRgnLoUK2Zeb44XoIJqKXj78rtDzwMAKMKiDZ/gUdMoDlBivMA8JOXqVviwiFidQXQrwWyau+Xl5gfSwgFv5CHs
 nZTITeN67n0CzFHPTBs5mvxj3PwBP9q2VeXMhHJtosRZq4OQxmfxCA/zHoPmZIDzMqmsTdvvnxGcFQ6GHKiTgRlC2IOLzW1+OXPC3UaqlNU65AE5fWtIwMmo
 s63eoTcRtkrNbRoK8t6mJzNUMsRh8bEMqyPtLz/Gy7oeKwb0uElQFO4robg7yPDbqSC0B37sER209G4iZJvv+naOD66RX+PDngvV5fbEBLGSldp2MGYqyni8
 K4vljZQbqcisAGi1oZT2299JxyLew7xK2Ej1RSmu8dVQs2YW4+mVRhsymal/H1fikDfYOgvnfQ2HeuifpRQ7oSibp13uXj6PClp5JpE6tWZkpzmSDGlvZfRW
 lqN5LPsnv1NGI2SM15MGsY8te++VDyq9epmGC116wcB8YK2Ubo6ZCXZ0XvQ3/rJiN/7loMpQALBSM8WpmVB200nm7RImBLmbTX9tr8zXAsT2PrnEN8oyMxFv
 MPHxKjbc6WKX5UCQuJFifegnvsZEML3cUmLcYl9H1bHAWZcFj/h17URxmBd/q/L4RdH2DuuByBmN5+E1fR7RdPkvU4W2OI210K+bGZupDLGMIpMc2eYbTjwF
 HHXkDp4kYdReiuU3pHBy+aZHjBkp/Ck8rzzYHaGe8MFse5jkhv2dxk0NK6yTCVXLMTw2wxTUKFYr4/8iMjX2wPMNyxCnFhSoZeUTvBhL84Ue9T+4gEa0OnW8
 AuHqF1NAwc+c6idCfDr0sZXyDEkxkXUl+4LttUuSmmtz8GXpRYysd6pbVGiPnLdDlGYuIjE5RCPx17CjF52bDIp1LB9E6ULXGiyCqPi/lqKY381X+m8xfhxw
 i148commR3M6eXwKsoJi5lMc/2aXxUDk5qMF24teQptHTUjWcsftUTsO+JybgmM8k1b/bnIN9uJkWusxvRCb4oJ9WJffB4cHUCZZXzO9a7Zk2PZGCcSspGU7
 23TJALiBS7lFkGktjhZ3g/R9fbxxEk7PPvvcISOiYItZia2L767wMV5r5LIeUSxnSczC22wOOziQQKAyodFMcxwGzZ9ZNe92iUVkSMgOQP8/U4D4uGEbeWZj
 qu8rETe8z08PxCdoGaQ9+K31T6onZPGGEF8wAKAzV2KpEiHSKZFr/a7nzvKh2Fh0TZhf2f6Q8Q0HDlcgU5hXxz1iQGB9TfhFnvc/M6sruNz7OYYQxIiL+ahG
 +YXYiNawJJBVRBKJop+s3Kxo77vOSegE/1Ft1sAeIOQlgCojukbs72k8WAgPEDlAgd2rN9/CVdZvpSPI7OsXKv4/G/gPz78rwMwgkhPM0nxKISEsch3gH1ea
 0u5GNh2YpmmN1YXrsTfG9Qqaiq/pE/DWUKNnWQ==
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yong Wu,

On 12/11/2021 11:54, Yong Wu wrote:
> MediaTek IOMMU block diagram always like below:
> 
>         M4U
>          |
>     smi-common
>          |
>   -------------
>   |         |  ...
>   |         |
> larb1     larb2
>   |         |
> vdec       venc
> 
> All the consumer connect with smi-larb, then connect with smi-common.
> 
> When the consumer works, it should enable the smi-larb's power which also
> need enable the smi-common's power firstly.
> 
> Thus, Firstly, use the device link connect the consumer and the
> smi-larbs. then add device link between the smi-larb and smi-common.
> 
> After adding the device_link, then "mediatek,larb" property can be removed.
> the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> the power and clock of smi-larb and smi-common.
> 
> Base on a jpeg dt-bing patchset[1] that already got the necessary R-b.
> 
> This patchset cross several tree, From [2], the media tree should be a good choice.
> 
> [1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/

Please resend this patch series converting the jpeg bindings to yaml, and this time
CC the linux-media mailinglist. Because that was omitted, it never appeared in the
media patchwork system, and so this was never merged. Since this patch series depends on
this series, this needs to be merged first.

Bindings for media drivers must be CC-ed to linux-media, since we maintain those.

Regards,

	Hans

> [2] https://lore.kernel.org/linux-mediatek/e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com/
> 
> Change notes:
> v9: 1) Add return -ENODEV when the dev is null.
>     2) Add more strict about the case that a iommu consume device use the ports in
>     different larbs. Don't allow this case.
>     3) Remove two codec interface: mtk_vcodec_release_enc/dec_pm since it only has one
>     line now.
> 
> v8: https://lore.kernel.org/linux-mediatek/20210929013719.25120-1-yong.wu@mediatek.com/
>     1) Rebase on v5.15-rc1.
>     2) Don't rebase the below mdp patchset that may still need more discuss.
>     https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
>     3) Add Frank's Tested-by. Remove Dafna's Tested-by as he requested.
> 
> v7: https://lore.kernel.org/linux-mediatek/20210730025238.22456-1-yong.wu@mediatek.com/
>     1) Fix a arm32 boot fail issue. reported from Frank.
>     2) Add a return fail in the mtk drm. suggested by Dafna.
> 
> v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
>     1) rebase on v5.14-rc1.
>     2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
>     3) Remove the patches about using pm_runtime_resume_and_get since they have
>        already been merged by other patches.
> 
> v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
>     1) Base v5.12-rc2.
>     2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
>     independent patch.
> 
> v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/ 
>     base on v5.7-rc1.
>   1) Move drm PM patch before smi patchs.
>   2) Change builtin_platform_driver to module_platform_driver since we may need
>      build as module.
>   3) Rebase many patchset as above.
> 
> v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
>     1) rebase on v5.3-rc1 and the latest mt8183 patchset.
>     2) Use device_is_bound to check whether the driver is ready from Matthias.    
>     3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
>    reason in the commit message[3/14].
>     4) Add a display patch[12/14] into this series. otherwise it may affect
>    display HW fastlogo even though it don't happen in mt8183.
>    
> v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
>    1) rebase on v5.2-rc1.
>    2) Move adding device_link between the consumer and smi-larb into
> iommu_add_device from Robin.
>    3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
>    4) Remove the shutdown callback in iommu.   
> 
> v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/
> 
> Yong Wu (14):
>   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
>   iommu/mediatek-v1: Free the existed fwspec if the master dev already
>     has
>   iommu/mediatek: Return ENODEV if the device is NULL
>   iommu/mediatek: Add probe_defer for smi-larb
>   iommu/mediatek: Add device_link between the consumer and the larb
>     devices
>   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>   drm/mediatek: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
>   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
> 
> Yongqiang Niu (1):
>   drm/mediatek: Add pm runtime support for ovl and rdma
> 
>  .../display/mediatek/mediatek,disp.txt        |  9 ----
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>  .../bindings/media/mediatek-mdp.txt           |  8 ---
>  .../bindings/media/mediatek-vcodec.txt        |  4 --
>  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ------
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  8 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
>  drivers/iommu/mtk_iommu.c                     | 34 ++++++++++++
>  drivers/iommu/mtk_iommu_v1.c                  | 42 ++++++++++++++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +---------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 --------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  8 +--
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 46 +++-------------
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  3 +-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 +--
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 52 +++----------------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  3 +-
>  drivers/memory/mtk-smi.c                      | 14 -----
>  include/soc/mediatek/smi.h                    | 20 -------
>  32 files changed, 125 insertions(+), 339 deletions(-)
> 

