Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB654B4671
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7356E10E2B5;
	Mon, 14 Feb 2022 09:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F173110E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:43:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E5BAB1F43573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644831796;
 bh=kuDQtUAXWzNyzTKHh3iQp9tj06g3aQJ3Vh8+/PtLxTk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F/ChMnCt2ZvyLUCCDaKYxsNQ/HNeiyvut9l5Fd3guB+z90ls52jie0pFavRlj6EM5
 NdRuf7sSAFZyA7RJQrIJoeXQBNFIlqkjDo+yNYU4rQg2TcGHgZ5islmi2tdUc8aj4H
 uBvSw2GoxxjFIvo3nXdPbWlr2GPEHUs0f9ZmfetxG6wB6tyI9EOWk/E7htOIoi8Vm1
 39wM4YYpf6Mjq20Avo2GT+n/4g0y8mUlCBA3wNyIEHIXjShL5i1mdNVCa7OYDSwXdq
 y/Ofm8F1jV5RVpZ18Khi77Ph4klSaNwj72GAbJMupguC+eJbeGOg+4jKvAyK41CJaJ
 az59wNOPGjIAg==
Message-ID: <0a331caa-7578-60f5-cbd8-f6c8c29a629f@collabora.com>
Date: Mon, 14 Feb 2022 10:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4] drm/mediatek: allow commands to be sent during video
 mode
Content-Language: en-US
To: Julien STEPHAN <jstephan@baylibre.com>
References: <20220214092742.3461587-1-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214092742.3461587-1-jstephan@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/02/22 10:27, Julien STEPHAN ha scritto:
> Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness()
> to request backlight changes.
> 
> This can be done during panel initialization (dsi is in command mode)
> or afterwards (dsi is in Video Mode).
> 
> When the DSI is in Video Mode, all commands are rejected.
> 
> Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
> temporarily to allow commands to be sent.
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Please, next time, don't drop the tags that reviewers are giving to you, unless
the patch changes radically.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v4:
>      - fix missing space:  "ret : recv_cnt;"
> Changes in v3:
>      - increase readability of code and use correct return variable (see
>        comment
> https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)
> 
> Changes in v2:
>      - update commit message to be more descriptive
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..abdd9cdebd86 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,33 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	u8 read_data[16];
>   	void *src_addr;
>   	u8 irq_flag = CMD_DONE_INT_FLAG;
> +	u32 dsi_mode;
> +	int ret;
> 
> -	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -		DRM_ERROR("dsi engine is not command mode\n");
> -		return -EINVAL;
> +	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_stop(dsi);
> +		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> +		if (ret)
> +			goto restore_dsi_mode;
>   	}
> 
>   	if (MTK_DSI_HOST_IS_READ(msg->type))
>   		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> 
> -	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -		return -ETIME;
> +	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> +	if (ret)
> +		goto restore_dsi_mode;
> 
> -	if (!MTK_DSI_HOST_IS_READ(msg->type))
> -		return 0;
> +	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
> +		recv_cnt = 0;
> +		goto restore_dsi_mode;
> +	}
> 
>   	if (!msg->rx_buf) {
>   		DRM_ERROR("dsi receive buffer size may be NULL\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto restore_dsi_mode;
>   	}
> 
>   	for (i = 0; i < 16; i++)
> @@ -933,7 +942,13 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>   		 recv_cnt, *((u8 *)(msg->tx_buf)));
> 
> -	return recv_cnt;
> +restore_dsi_mode:
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_set_mode(dsi);
> +		mtk_dsi_start(dsi);
> +	}
> +
> +	return ret < 0 ? ret : recv_cnt;
>   }
> 
>   static const struct mipi_dsi_host_ops mtk_dsi_ops = {
> --
> 2.35.1
> 



