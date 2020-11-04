Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A352A6419
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370F76ECE7;
	Wed,  4 Nov 2020 12:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F3E6E994
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 923391F45919
Subject: Re: [PATCH 0/4] soc: mediatek: Prepare MMSYS for DDP routing using
 tables
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
Message-ID: <e8f42689-4c5f-b5ab-8b4c-ac6b8eafc1d3@collabora.com>
Date: Wed, 4 Nov 2020 11:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006193320.405529-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 04 Nov 2020 12:19:32 +0000
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On 6/10/20 21:33, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The following series are intended to prepare the mtk-mmsys driver to
> allow different DDP (Data Display Path) routing tables per SoC. Note
> that the series has been tested only on MT8173 platform and could break
> the display on MT2701 and MT2712 based devices. I kindly ask for someone
> having these devices to provide a tested routing table (unfortunately I
> didn't have enough documentation to figure out this myself).
> 
> For the other devices (MT8183, MT6779 and MT6797) DRM support is not in
> mainline yet so nothing will break.
> 
> Thanks,
>   Enric
> 
> 
> CK Hu (2):
>   soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>   soc: mediatek: mmsys: Use an array for setting the routing registers
> 
> Enric Balletbo i Serra (1):
>   soc: mediatek: mmsys: Use devm_platform_ioremap_resource()
> 
> Yongqiang Niu (1):
>   soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h
> 
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  34 +-
>  drivers/soc/mediatek/mtk-mmsys.c            | 429 +++++++++++---------
>  include/linux/soc/mediatek/mtk-mmsys.h      |  33 ++
>  3 files changed, 263 insertions(+), 233 deletions(-)
> 

Although the patches 3 and 4 are controversial, and I'll work on it, I am
wondering if 1 and 2 are ready to be picked, as they are independent, so I can
send next version without these two patches.

Thanks,
  Enric


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
