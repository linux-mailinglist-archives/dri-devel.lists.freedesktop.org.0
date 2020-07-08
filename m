Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1A218131
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EB089DDD;
	Wed,  8 Jul 2020 07:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E2E189DDD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:27:47 +0000 (UTC)
X-UUID: 940e5fced38c4a39a6114dc6aecae28e-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eL3lgx8YILsDyHzj4UM7ymN5RgGxS7otNYsWxv/+afc=; 
 b=sG6bN2pE8uNxnFmh9fBWTZAWITKicz+dLC5YND7/csf+FJVZWAxM41GizjkI2WkaYYrYMivN6YSr8o2UcFRzmzCq0rcrxHyKnxBAgMrqzCrV5Ko8hmm7zJvzsRuR9uOhgPWEnr6eBTYvIYNZBIFQngbNVAIfBKTD7UPdWA7gArw=;
X-UUID: 940e5fced38c4a39a6114dc6aecae28e-20200708
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1304503638; Wed, 08 Jul 2020 15:27:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 15:27:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jul 2020 15:27:36 +0800
Message-ID: <1594193257.21095.0.camel@mtksdaap41>
Subject: Re: [PATCH v3 1/9] soc: mediatek: cmdq: add address shift in jump
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 8 Jul 2020 15:27:37 +0800
In-Reply-To: <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB4E59DADC0BE1E85780C93DA1D761BB1D861C4286F724D519190AE4CC4AFEF22000:8
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

Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>


On Tue, 2020-07-07 at 23:45 +0800, Dennis YC Hsieh wrote:
> Add address shift when compose jump instruction
> to compatible with 35bit format.
> 
> Change since v1:
> - Rename cmdq_mbox_shift() to cmdq_get_shift_pa().
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index dc644cfb6419..9faf78fbed3a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -329,7 +329,8 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  
>  	/* JUMP to end */
>  	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS;
> +	inst.value = CMDQ_JUMP_PASS >>
> +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
>  	err = cmdq_pkt_append_command(pkt, inst);
>  
>  	return err;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
