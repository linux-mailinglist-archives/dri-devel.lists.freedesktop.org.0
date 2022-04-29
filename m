Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF60515445
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E81C10ED9B;
	Fri, 29 Apr 2022 19:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F710ED9B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:17:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bq30so15723376lfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 12:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=XcJewk131Nd463Vs+g3KY8Ye0plJDqJlnu99DciXENY=;
 b=Ao2DTWWgNWhqlZ5g4JZt6z6nIIV3nwRQDJjtKCvXqMM8brGdFiOnzbuG6DE6HD9Q3R
 shmLGN6pJINTqvRGZnSTBbLCvUvUSCu+GogJKA5IzH4AYL/DmJzETpzz6lRrlfbgBWI0
 9JWz3rtqLWQnRDzYg1VXv3ZC67dZqiqL+wMh75I+/Jgg5MiL65p5246FtnBi5RaS5TaJ
 sp+KGmysK11HzTw3dNTD/PCzqtCO6XgltKvqdQq0JKnIT2BvSOo4uYyj0cHNE5CUxlN8
 7qbQKWw+1Us9xaaDm+yiCqT8AGc8rzCkMIgXzttzdmMmHxvPIoeFe4e6iAdNgbqWGST7
 qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=XcJewk131Nd463Vs+g3KY8Ye0plJDqJlnu99DciXENY=;
 b=X/ZGXz6bPuzZkdfjO6bMh5mIzMs5eNBDbugnIt4p2uMxWP9w5/FOWyLAFX2Pbl19tW
 tSX3EKAKwK1K0X3Ru2riXc2vYLdKo3ZNiVspMMO8cAhrU6Z7bIkVPlzDWio69CQc+vmi
 FXNFGiiYD4xWtiV3ZM7yemJG6z2XIbRohipLjZvZYByRxWS8xV4cAMKx4XIrMOYKX/jM
 hpU6I8rn7uemLgVVDvQGvqTuitx1Ut9blxKTuP9W4E9zLYrERzEBv3wfkNkKkLhNmetC
 qdC6JszWS89kJ722ndlGyBU3bDCJMnEuy9qj3lWALJwyEA/Y2pZ5spIKKgAWzg5huf/H
 dGJQ==
X-Gm-Message-State: AOAM530k1PiZdq5OpwUZTI6p0mYUJVs4v0BAcgrsqP1lKXt2qbFGxriG
 H7R6MFlhnn9BGiDIIHe15s0=
X-Google-Smtp-Source: ABdhPJx5mQ7kmdRwb7GYfpJwo6MNK5CFZ8EHsuzhivBmvovVjmxexQacSX4WEvZ23WKGMMkDpd1bxw==
X-Received: by 2002:a05:6512:1109:b0:472:25d9:d262 with SMTP id
 l9-20020a056512110900b0047225d9d262mr538829lfg.128.1651259858641; 
 Fri, 29 Apr 2022 12:17:38 -0700 (PDT)
Received: from [10.0.0.42] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 s3-20020ac25fe3000000b0047255d2111esm3178lfg.77.2022.04.29.12.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 12:17:38 -0700 (PDT)
Message-ID: <a9e1b5ce-861f-021b-b41f-62e5298c11e5@gmail.com>
Date: Fri, 29 Apr 2022 22:24:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-omap@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, jmkrzyszt@gmail.com
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-20-arnd@kernel.org>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 19/41] ARM: omap: dma: make usb support optional
In-Reply-To: <20220419133723.1394715-20-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/22 16:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most of the plat-omap/dma.c code is specific to the USB
> driver.

The reason is simple: the omap_udc is the only driver which has not been
ported to DMAengine.
I had a patch if I recall to convert it, but I don't have a way to test
it and the omap_udc sets some funky bits for DMA which we can not figure
out on how to handle.

> Hide that code when it is not in use, to make it
> clearer which parts are actually still required.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/plat-omap/dma.c       | 45 +++++++++++++++++-----------------
>  drivers/usb/gadget/udc/Kconfig |  2 +-
>  include/linux/omap-dma.h       |  5 +++-
>  3 files changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
> index 700ba9b600e7..b7757864d0aa 100644
> --- a/arch/arm/plat-omap/dma.c
> +++ b/arch/arm/plat-omap/dma.c
> @@ -66,7 +66,6 @@ enum { DMA_CHAIN_STARTED, DMA_CHAIN_NOTSTARTED };
>  
>  static struct omap_system_dma_plat_info *p;
>  static struct omap_dma_dev_attr *d;
> -static void omap_clear_dma(int lch);
>  static int enable_1510_mode;
>  static u32 errata;
>  
> @@ -90,19 +89,16 @@ static int omap_dma_reserve_channels;
>  static DEFINE_SPINLOCK(dma_chan_lock);
>  static struct omap_dma_lch *dma_chan;
>  
> -static inline void disable_lnk(int lch);
> -static void omap_disable_channel_irq(int lch);
> -static inline void omap_enable_channel_irq(int lch);
> -
> -#ifdef CONFIG_ARCH_OMAP15XX
> -/* Returns 1 if the DMA module is in OMAP1510-compatible mode, 0 otherwise */
> -static int omap_dma_in_1510_mode(void)
> +static inline void omap_disable_channel_irq(int lch)
>  {
> -	return enable_1510_mode;
> +	/* disable channel interrupts */
> +	p->dma_write(0, CICR, lch);
> +	/* Clear CSR */
> +	if (dma_omap1())
> +		p->dma_read(CSR, lch);
> +	else
> +		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
>  }
> -#else
> -#define omap_dma_in_1510_mode()		0
> -#endif
>  
>  #ifdef CONFIG_ARCH_OMAP1
>  static inline void set_gdma_dev(int req, int dev)
> @@ -169,6 +165,17 @@ void omap_set_dma_priority(int lch, int dst_port, int priority)
>  #endif
>  EXPORT_SYMBOL(omap_set_dma_priority);
>  
> +#if IS_ENABLED(CONFIG_USB_OMAP)
> +#ifdef CONFIG_ARCH_OMAP15XX
> +/* Returns 1 if the DMA module is in OMAP1510-compatible mode, 0 otherwise */
> +static int omap_dma_in_1510_mode(void)
> +{
> +	return enable_1510_mode;
> +}
> +#else
> +#define omap_dma_in_1510_mode()		0
> +#endif
> +
>  void omap_set_dma_transfer_params(int lch, int data_type, int elem_count,
>  				  int frame_count, int sync_mode,
>  				  int dma_trigger, int src_or_dst_synch)
> @@ -418,17 +425,6 @@ static inline void omap_enable_channel_irq(int lch)
>  	p->dma_write(dma_chan[lch].enabled_irqs, CICR, lch);
>  }
>  
> -static inline void omap_disable_channel_irq(int lch)
> -{
> -	/* disable channel interrupts */
> -	p->dma_write(0, CICR, lch);
> -	/* Clear CSR */
> -	if (dma_omap1())
> -		p->dma_read(CSR, lch);
> -	else
> -		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
> -}
> -
>  void omap_disable_dma_irq(int lch, u16 bits)
>  {
>  	dma_chan[lch].enabled_irqs &= ~bits;
> @@ -473,6 +469,7 @@ static inline void disable_lnk(int lch)
>  	p->dma_write(l, CLNK_CTRL, lch);
>  	dma_chan[lch].flags &= ~OMAP_DMA_ACTIVE;
>  }
> +#endif
>  
>  int omap_request_dma(int dev_id, const char *dev_name,
>  		     void (*callback)(int lch, u16 ch_status, void *data),
> @@ -572,6 +569,7 @@ static void omap_clear_dma(int lch)
>  	local_irq_restore(flags);
>  }
>  
> +#if IS_ENABLED(CONFIG_USB_OMAP)
>  void omap_start_dma(int lch)
>  {
>  	u32 l;
> @@ -792,6 +790,7 @@ int omap_get_dma_active_status(int lch)
>  	return (p->dma_read(CCR, lch) & OMAP_DMA_CCR_EN) != 0;
>  }
>  EXPORT_SYMBOL(omap_get_dma_active_status);
> +#endif
>  
>  int omap_dma_running(void)
>  {
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> index cee934dce4f0..69394dc1cdfb 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -128,7 +128,7 @@ config USB_GR_UDC
>  
>  config USB_OMAP
>  	tristate "OMAP USB Device Controller"
> -	depends on ARCH_OMAP1 || (ARCH_OMAP && COMPILE_TEST)
> +	depends on ARCH_OMAP1
>  	depends on ISP1301_OMAP || !(MACH_OMAP_H2 || MACH_OMAP_H3)
>  	help
>  	   Many Texas Instruments OMAP processors have flexible full
> diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
> index 5e228428fda1..07fa58ae9902 100644
> --- a/include/linux/omap-dma.h
> +++ b/include/linux/omap-dma.h
> @@ -299,8 +299,9 @@ extern void omap_set_dma_priority(int lch, int dst_port, int priority);
>  extern int omap_request_dma(int dev_id, const char *dev_name,
>  			void (*callback)(int lch, u16 ch_status, void *data),
>  			void *data, int *dma_ch);
> -extern void omap_disable_dma_irq(int ch, u16 irq_bits);
>  extern void omap_free_dma(int ch);
> +#if IS_ENABLED(CONFIG_USB_OMAP)
> +extern void omap_disable_dma_irq(int ch, u16 irq_bits);
>  extern void omap_start_dma(int lch);
>  extern void omap_stop_dma(int lch);
>  extern void omap_set_dma_transfer_params(int lch, int data_type,
> @@ -326,6 +327,8 @@ extern void omap_set_dma_dest_burst_mode(int lch,
>  extern dma_addr_t omap_get_dma_src_pos(int lch);
>  extern dma_addr_t omap_get_dma_dst_pos(int lch);
>  extern int omap_get_dma_active_status(int lch);
> +#endif
> +
>  extern int omap_dma_running(void);
>  
>  #if IS_ENABLED(CONFIG_FB_OMAP)

-- 
Péter
