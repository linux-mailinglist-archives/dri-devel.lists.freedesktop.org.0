Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D716D610ADA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 08:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982A10E780;
	Fri, 28 Oct 2022 06:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3520B10E780
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:59:15 +0000 (UTC)
X-UUID: d3bea96e79d54aaf922f9cb260ba74ea-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0VYCNGu5up7oXK9iByzpPm+c/SezPGc55UX86NGHyoQ=; 
 b=mSPEaNogr8FD3RF1QwodsxmV51YaONLGGP3pm4J7D7FlPj+I4hvu612hd4OG/vb8iUZs7jvjQXcKJqMud1DjkMA4PX/KkvSQ7lUuOAzrh8V4pXpYWTGN7P3NSRNzAT5FHGihjpmTJsnQio+PPlaXQSpxJxRM8+96/zZSZl7oJLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:233c8d5a-d8f1-4e7e-baad-6510913e37fa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:e720f2e4-e572-4957-be22-d8f73f3158f9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-5,EDM:-3,IP:nil,
 URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d3bea96e79d54aaf922f9cb260ba74ea-20221028
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <mark-pk.tsai@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 783513712; Fri, 28 Oct 2022 14:59:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 14:59:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 14:59:07 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
Date: Fri, 28 Oct 2022 14:59:06 +0800
Message-ID: <20221028065907.23954-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Y1tSWo+eRvkVofbv@debian.me>
References: <Y1tSWo+eRvkVofbv@debian.me>
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
Cc: benjamin.gaignard@collabora.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, jstultz@google.com,
 lmark@codeaurora.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 labbott@redhat.com, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> [-- Attachment #1: Type: text/plain, Size: 349 bytes --]
> 
> On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
> > Remove duplicated "by" from comment in cma_heap_allocate().
> > 
> 
> This patch isn't typofix but duplicate word stripping, right? If so, the
> patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".

Okay, I've update the title in v3.
Sorry for the horrible commit description.
Thanks.

> 
> Thanks.
> 
> -- 
