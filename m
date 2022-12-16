Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887364EA5B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881F10E013;
	Fri, 16 Dec 2022 11:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F51310E075
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:17:12 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E574C505;
 Fri, 16 Dec 2022 09:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671178631;
 bh=zh8GNBuLhZA/Lc5zhOuN0iTHj7YG51sR9VyIpvmY9FI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Jwp7Vnza+X3ECKRjlYR80GyWnsPJ9OzGLdrhL1SK94pilnTtAQk70XnF5Q46dg2Ug
 iNOZSFCuV81euamZ+eOddzv0mMVN9DnpgnaliMIH+MdT0ajuXHXGn2GoGaCVpbsbNB
 IsMXenswsxUm+IQGr5URlsCOo7TaIfSN7e2OBU0o=
Message-ID: <a00527f5-8e76-958d-8d12-c2b815a200d7@ideasonboard.com>
Date: Fri, 16 Dec 2022 10:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/tidss: Set max DMA segment size
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220823001634.11461-1-afd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220823001634.11461-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 Dec 2022 11:26:53 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 03:16, Andrew Davis wrote:
> We have no segment size limitations. Set to unlimited.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dd3c6a606ae2..624545e4636c 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2685,6 +2685,7 @@ int dispc_init(struct tidss_device *tidss)
>   		if (r)
>   			dev_warn(dev, "cannot set DMA masks to 48-bit\n");
>   	}
> +	dma_set_max_seg_size(dev, UINT_MAX);
>   
>   	dispc = devm_kzalloc(dev, sizeof(*dispc), GFP_KERNEL);
>   	if (!dispc)

Thanks, I'll apply to drm-misc.

  Tomi

