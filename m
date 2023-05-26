Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A83712639
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 14:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCF110E7EE;
	Fri, 26 May 2023 12:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7610E7EE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:05:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28735614EF;
 Fri, 26 May 2023 12:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F23CC433D2;
 Fri, 26 May 2023 12:04:55 +0000 (UTC)
Message-ID: <bdee7988-3551-4011-f93e-c4dd1e4ee76b@xs4all.nl>
Date: Fri, 26 May 2023 14:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v10] media: mediatek: vcodec: support stateless AV1 decoder
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 10:30, Xiaoyong Lu wrote:
> Add mediatek av1 decoder linux driver which use the stateless API in
> MT8195.
> 
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

After rebasing on top of our media staging tree I get these compile errors:

  CC [M]  drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:46: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
 2075 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
      |                                              ^~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:46: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
 2114 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
      |                                              ^~

That's due to the patch "media: mediatek: vcodec: move core context from device
to each instance" that has now been merged and that drops that queue.

Can you rebase v10? This is now the only remaining blocked for the av1 series
to be merged.

Regards,

	Hans
