Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F278D54EF65
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 05:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4798111A95B;
	Fri, 17 Jun 2022 03:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EC111A95B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:03:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BE8415C0172;
 Thu, 16 Jun 2022 23:03:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 23:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1655434993; x=
 1655521393; bh=jEzCc3JeLlFHDgfBc5h9JcPzQeM03k0MCLfDjduKd98=; b=s
 7O+jdOSp5HZdN/Gfr43zbiLuNmzjh53xJZ6o7vavlksDRFj135MmToZ5sIfMoYR8
 RHbzXs6O49GNhjGLjYc9FPlcDG08L51NMs5hCDt7ZegJEBMqaqZmx99mqzs6FqVL
 R8Z6jFr08sMoZZMkSJN27Y8EO2oHu5qG6cV523LIsokgAWLZQOxITIS0NuCrYoUM
 vP2FV3g8c6zvD+VBpm8XVcGmRrmQde0RffVo9jQkMNFLoSUDLq0ijfd5og2bd1bB
 n2kPuAsamHibqWwbBg+Xv7rX83XSRIOYNrYb9aVLPwZr2zE6I8bztJ06dmmNsR3x
 5tm7h8OdcsDYqC+dVXq/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655434993; x=
 1655521393; bh=jEzCc3JeLlFHDgfBc5h9JcPzQeM03k0MCLfDjduKd98=; b=m
 x6coN2S29eeKnGin+7uziw3IkxvCwzwfE9qNCB20bhN1KdrYNXI2kG5FvxM1m/6e
 XV/VehkYqAlndUfKztK1fKF/YJIEg4Xbvl2PmDwYG0Wi/JKxxkmJEY2vrZ3oBui1
 SvBk1hpsw3tTGM+OyezRzyP/K3Juji8SpWjMeHF6G8XBc164mmpoktCCNtgvX6c0
 IuN9z2GFFeLyoSkXfVClkwrguMH1VWtqgEwRYDU+Saz2K3uPVrNllAtqOF/cNJBq
 XYtMLwcakKQp+NYC18LQHw+HDo3fJgEwRbCksfmpkbiiL3fXxQZheztIHZG9fLOk
 /e8I6gCm9TVY6PokcDBtw==
X-ME-Sender: <xms:8e6rYtL64OQpoPBLC-BLYsw9Clcriwst7y7Ps7xPcPh03P6KzVa_dw>
 <xme:8e6rYpKTsTJX0pknfRXaGRRR7shaiLwcaupu3GFLr7JKeXw9zHVhO-LIFBC03Uh6g
 N3QqWDCU7p1QX0fnA>
X-ME-Received: <xmr:8e6rYltZKb45MelRcq5dHpS7TfDwlpqYnxKf3CsraAELRzsCOFxN0yRVEHtyqbjhYovI6--F4JlqVpoGJpvjMNirH0n3Hb0rSN9AKFq7qhVbgYuYe4Sfh8GJYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
 tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8e6rYuY5qqwNlaYswIuBtDYjC0oA6sHQdfHRgGlcX9fSWRdnB7wRGg>
 <xmx:8e6rYkYPy4QT3vpmriOsOHBTJ8-sELwIyJsQF_7TvB6WenJ-RhNlcg>
 <xmx:8e6rYiABnUOfWM50Z_cuxeAOmRxL9w6jfDXIIn82Qf_wQV5XLxDcXA>
 <xmx:8e6rYk4mz9LqVHcYyvLFOKjwvsHOnuce1jpnRE0OhpWTtMVpJn7Cbg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 23:03:12 -0400 (EDT)
Subject: Re: [PATCH] drm/sun4i: Add DMA mask and segment size
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
References: <20220616213240.392041-1-jernej.skrabec@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e4a73a0f-c725-fad2-021b-5b5ee5ead1b3@sholland.org>
Date: Thu, 16 Jun 2022 22:03:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220616213240.392041-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

On 6/16/22 4:32 PM, Jernej Skrabec wrote:
> Kernel occasionally complains that there is mismatch in segment size
> when trying to render HW decoded videos and rendering them directly with
> sun4i DRM driver.
> 
> Fix that by setting DMA mask and segment size.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index 275f7e4a03ae..83f4e87f77f6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/component.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/kfifo.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> @@ -367,6 +368,9 @@ static int sun4i_drv_probe(struct platform_device *pdev)
>  
>  	INIT_KFIFO(list.fifo);
>  
> +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));

Isn't this already the default, from of_dma_configure_id or setup_pdev_dma_masks?

> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));

This looks like a good change. In fact, I think we need a similar change in some
other drivers.

Regards,
Samuel
