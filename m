Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184096651F3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 03:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A6010E2A5;
	Wed, 11 Jan 2023 02:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250810E2A5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 02:42:50 +0000 (UTC)
X-UUID: a06154ca915911eda06fc9ecc4dadd91-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JDatIFGfCYDp40epyQ6cVCFAB9XyGy7+db3Lps22ypY=; 
 b=K+eRFK5b+Hb5DiyH9QVfdfzrxad3Q4ezcrin+70nVY80m2tkYnAgUEQjuCtH6BCav/ECUz2YjQaspnYgXU/HkZ1DgqZwSxZ+RjKq1jEENwJpLcbmS6/Nq4fvw9z4Of8TjHTrCWJKRaN7QEPYS7Wlj7HroA24mQSpz3UFfp6Qvz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:ddbc5802-95eb-489c-b894-52bc26157e72, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:3c8f4a54-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT
X-UUID: a06154ca915911eda06fc9ecc4dadd91-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1847046328; Wed, 11 Jan 2023 10:42:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 11 Jan 2023 10:42:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 10:42:44 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: stop using 0 as NULL pointer
Date: Wed, 11 Jan 2023 10:42:44 +0800
Message-ID: <20230111024244.24295-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
References: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
 dri-devel@lists.freedesktop.org, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

>Il 10/01/23 04:12, Miles Chen ha scritto:
>> Use NULL for NULL pointer to fix the following sparse warning:
>> drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using plain integer as NULL pointer
>> 
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>
>Please add the appropriate tag...
>
>Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")

No problem, I will add the Fixes tag and submit v2.

thanks,
Miles

>
>after which:
>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



