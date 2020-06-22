Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E01202E77
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 04:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45206E20F;
	Mon, 22 Jun 2020 02:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCA4B6E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:40:58 +0000 (UTC)
X-UUID: b1e749a258184360b17d3bc83fcace74-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T4N0GSeOss5sx6v+I2srZbNSei5hWxozktRdtKpgDsU=; 
 b=tNcs7CFNtCl0e0JfkEeyo2nrT2dnMJmHavJ1teDsfECouJAzXeAfMHsKiWnZrs7AZeUOgyzUTEDOBSxnlhIIhGwWHqHQoSMdJbOU9LbGoPtLx9vDMUF9y68IgutW8Ed6Y4u98gW9iZIQE7AZZRdoSvRdZLIwf0kSAMBrosDNZsg=;
X-UUID: b1e749a258184360b17d3bc83fcace74-20200622
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1486169950; Mon, 22 Jun 2020 10:40:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 10:40:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 10:40:45 +0800
Message-ID: <1592793655.11692.9.camel@mtksdaap41>
Subject: Re: [PATCH v1 0/11] support cmdq helper function on mt6779 platform
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Mon, 22 Jun 2020 10:40:55 +0800
In-Reply-To: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dennis,

Please add "depends on patch: support gce on mt6779 platform" in cover
letter. Thanks

Bibby

On Sun, 2020-06-21 at 22:18 +0800, Dennis YC Hsieh wrote:
> This patch support cmdq helper function on mt6779 platform,
> based on "support gce on mt6779 platform" patchset.
> 
> 
> Dennis YC Hsieh (11):
>   soc: mediatek: cmdq: add address shift in jump
>   soc: mediatek: cmdq: add assign function
>   soc: mediatek: cmdq: add write_s function
>   soc: mediatek: cmdq: add write_s_mask function
>   soc: mediatek: cmdq: add read_s function
>   soc: mediatek: cmdq: add write_s value function
>   soc: mediatek: cmdq: add write_s_mask value function
>   soc: mediatek: cmdq: export finalize function
>   soc: mediatek: cmdq: add jump function
>   soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
>   soc: mediatek: cmdq: add set event function
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   3 +-
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 159 +++++++++++++++++++++--
>  include/linux/mailbox/mtk-cmdq-mailbox.h |   8 +-
>  include/linux/soc/mediatek/mtk-cmdq.h    | 124 +++++++++++++++++-
>  4 files changed, 280 insertions(+), 14 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
