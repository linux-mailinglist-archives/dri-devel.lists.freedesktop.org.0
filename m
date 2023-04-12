Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494C6DF4FF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B9210E634;
	Wed, 12 Apr 2023 12:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6FC10E634
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:22:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A0DC63322;
 Wed, 12 Apr 2023 12:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07DCC433D2;
 Wed, 12 Apr 2023 12:22:16 +0000 (UTC)
Message-ID: <00a8fb79-580e-5389-f03f-abb7bba9f092@xs4all.nl>
Date: Wed, 12 Apr 2023 14:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v9] media: mediatek: vcodec: support stateless AV1 decoder
Content-Language: en-US
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
References: <20230412033022.7766-1-xiaoyong.lu@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230412033022.7766-1-xiaoyong.lu@mediatek.com>
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

On 12/04/2023 05:30, Xiaoyong Lu wrote:
> Add mediatek av1 decoder linux driver which use the stateless API in
> MT8195.
> 
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hmm, I get this compile error:

drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_setup_uh’:
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: error: ‘V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING’ undeclared (first use in this function); did you mean
‘V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING’?
   48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
      |                                                          ^~~~~~~~~~~~~~~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
 1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
      |                                         ^~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: note: each undeclared identifier is reported only once for each function it appears in
   48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
      |                                                          ^~~~~~~~~~~~~~~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
 1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
      |                                         ^~~~~~~

This flag was renamed from V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING to
V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING in v5 of the AV1 uAPI.

So this suggests to me that you are testing with an old version of the AV1
uAPI. The correct one is v7:

https://patchwork.linuxtv.org/project/linux-media/patch/20230306161850.492072-1-daniel.almeida@collabora.com/

You have to compile and test with that v7 patch since that's the version we
want to merge.

Regards,

	Hans
