Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441049DF89
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D64810EE6E;
	Thu, 27 Jan 2022 10:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E0310EE6F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 256781F44F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643279737;
 bh=e5seVwe3O1Ju0e2D55CC6b4M5ij69zZe37lFrDX/nWQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g86eHbAbTwKydP+l4LMA0VIdu/Sgw7MiknoM9nX627hoPHva6fxUid3Nkgog4LWHy
 sy1tGS6D/nWgeKt3d/quJ8P7e5/nJgLp4mpHIxNHZFZ3wpEOf77DNUYXKb9wgL76lS
 yUOAeLG1ZIE0Iw4vtX9qQ+mHIRIZE7ZD4916qBCHZ+2YwI3Khyphy2A/tTpyTOeCfE
 nDvHL6fpcvwcUfc1e2TIr46Sj+mgZCAPTVV2ZNnZyP31zfNlqsUZE/jWH8i2hqE/BA
 iefHtTlhnVEgiAm0hDlkQ/E5yucDQd5cqzloskIRPlgdQAYRcNDmYSExUrtg2gWgKj
 5UoKrjiq7kttA==
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-8-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <07468ddd-22a8-c2a5-21fd-8468e0e77d74@collabora.com>
Date: Thu, 27 Jan 2022 11:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220127025544.10854-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/01/22 03:55, Yunfei Dong ha scritto:
> Init some of VP9 frame decode params to default value.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Hello Yunfei,

This patch is not strictly related to MediaTek SoCs, since it's
modfying v4l2-core.
Can you please send this patch separately?

Thanks,
Angelo

> ---
>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 54abe5245dcc..b25c77b8a445 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -112,6 +112,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>   	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>   	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> +	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>   	struct v4l2_ctrl_fwht_params *p_fwht_params;
>   	void *p = ptr.p + idx * ctrl->elem_size;
>   
> @@ -152,6 +153,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   		p_vp8_frame = p;
>   		p_vp8_frame->num_dct_parts = 1;
>   		break;
> +	case V4L2_CTRL_TYPE_VP9_FRAME:
> +		p_vp9_frame = p;
> +		p_vp9_frame->profile = 0;
> +		p_vp9_frame->bit_depth = 8;
> +		p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +			V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> +		break;
>   	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>   		p_fwht_params = p;
>   		p_fwht_params->version = V4L2_FWHT_VERSION;
> 

