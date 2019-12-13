Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34311DEE3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 08:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003DB89BA1;
	Fri, 13 Dec 2019 07:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A704689A4E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 07:49:56 +0000 (UTC)
X-UUID: 24697eb6d00d4ee3bc3cc0d3f9472e60-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sGCRslRMxKd4+sopLgy6QPoZUbVrNbm1Aabm9JQ7Fiw=; 
 b=ccNhwmDeAqop99pkVHs4JJD6zlqiDalwPWox+0bRHC4tv5JSARi8nuo4roFS0RoLn53d6/WyXAgUfbR+5fTdKaROMHDkB8D9dxQjw/gAVZ4W1VjO0BVbHK7E9FaxiXk2gt+rGuqh1vfJG5VGtDqAWbKETMicIx8C2wuD6Ks8NBk=;
X-UUID: 24697eb6d00d4ee3bc3cc0d3f9472e60-20191213
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1559566732; Fri, 13 Dec 2019 15:49:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 15:49:32 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 15:49:40 +0800
Message-ID: <1576223390.9817.4.camel@mtksdaap41>
Subject: Re: [PATCH v2, 0/2] drm/mediatek: Add ctm property support
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 13 Dec 2019 15:49:50 +0800
In-Reply-To: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B532F401A64E730E8B148E727DA995610D1CD9CB4E6643715A43734C63D673E82000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Fri, 2019-12-13 at 15:28 +0800, Yongqiang Niu wrote:
> Changes since v1:
> -separate gamma patch
> -remove cmdq support for ctm setting

If this series depend on other patch or series, please describe it.

Regards,
CK

> 
> 
> Yongqiang Niu (2):
>   drm/mediatek: Fix gamma correction issue
>   drm/mediatek: Add ctm property support
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 +++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 62 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++
>  3 files changed, 85 insertions(+), 4 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
