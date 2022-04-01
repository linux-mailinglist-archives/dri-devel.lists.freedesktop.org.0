Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01D4EE948
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D32410EFE0;
	Fri,  1 Apr 2022 07:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A7F10EFE0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 07:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6975B1F40FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648799436;
 bh=GEf0nEJQNZXszGDptrQO3o7b80i82CTwEgPl8PZMhOA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jOwCiMnFbtrL2h5VrTaakpahFkQ9lyJBlI+5o/TInsHv9DsHVBS42/SycdxYzP8Z7
 2rnV/9eeI3dLUgM+WIuGpo/jElJoqHM+bCHH9xZyitktLLhraAak+Hx5UbfxdzZ+2u
 09VpPaI4M69e3oYBIfHgPPIIEbMOQt5+IyJJaGNcDFn3wLfAf3dMH0aFnpYBYFVxOb
 TNVaUw1dyMzcLzJx8mVvm7Kc9S9OuKR7+GFBz+/B+3SrWooUnyCE3mbRjqMjctG/aW
 fpqN9VDrR2AgU41yVkrpGsNR8Gt/DJKI2obowakUufYAB+yHvoP4mbVVmP0kA3PP7A
 CpfJT++gxUrlg==
Message-ID: <38c9685e-380e-87ce-4a3a-5d274c0892fa@collabora.com>
Date: Fri, 1 Apr 2022 09:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: mediatek: vcodec: fix v4l2 compliance decoder cmd
 test fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220401030406.6437-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220401030406.6437-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/04/22 05:04, Yunfei Dong ha scritto:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD.
> 
> Using another return value to adjust v4l2 compliance test for user
> driver(GStreamer/Chrome) won't use decode cmd.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Hello Yunfei,

this patch is a fix.. hence, this needs an appropriate Fixes: tag.
Please add one.

Thanks,
Angelo

> ---
>   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 3859e4c651c6..69b0e797d342 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -51,8 +51,7 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>   
>   	/* Use M2M stateless helper if relevant */
>   	if (ctx->dev->vdec_pdata->uses_stateless_api)
> -		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> -								cmd);
> +		return -ENOTTY;
>   	else
>   		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>   }
