Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73173AF6BD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 22:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB47A6E416;
	Mon, 21 Jun 2021 20:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3506E416;
 Mon, 21 Jun 2021 20:17:14 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so19078241otl.0; 
 Mon, 21 Jun 2021 13:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lUeLmMYshlqC43ra6D4oMuARM4v5esyzjhcrxCA07rc=;
 b=uen0OLlYCIIJ0ysttCR0tWOzZvZE5wYyjv1j32o1ETOiVlFbURt/DJjrawet5dbsIe
 qIrNSCW+z+bmiq/9pccgtefZpkJF0oli3c6Pjgd0CswfHP/A2OwLRzc96x6AmjEzOUg2
 MKIjDKrWzFL7M/2ulpK8jfxMmxSjqgBJlV3SNGxfxLv7bbNfXeMldlxq5XJtbyomWN6X
 XedyC82puop1+jilpO7Tea1DV5uwXf7KoHF1wAK6UzcRfqLNpKB1Y0mebh9r0zQRWdWY
 IringK+01puuyFlkLMrTjlQLqo/ku8E2X3rWC4q/XAnIfbS0dtQ8qRzp5DLd8h0CE8Bo
 Sq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=lUeLmMYshlqC43ra6D4oMuARM4v5esyzjhcrxCA07rc=;
 b=RaSMiW9O339H5uc6gYTtU1jomFiElkncAoXnFENvTIYLzlgOgM1Rf7wStdejNDpuTl
 +TFxFEYgMUqN+aD5zsSMXzyhfavn0hkyiifibKCuApxCGFP1tG1gN9ak6tuEuS2KaFAT
 1vjMqweCqnga/36FcCHJA7abPd3Nwkl0L8DsMbFTGXT2f0nv2/klQR86LXsg20+7bOQo
 6s5O8rPwZgnmzc+P8g/kb2saK26MAZoVT/wrQcciXTv1rYp22kETyFajSYEloYmhc8WB
 Ha8Abr8DiZ4HLEhanxY8zEIexZHJip6V8fy/ZNDNsIpmxt8eL3wKeruEQaVxsEmpHRL4
 k3Fw==
X-Gm-Message-State: AOAM532W/9m4vbYk/wZw3dPMMvTRteJHKUQoiFFFygEH5t8ERrQNMQ4d
 VvcmxzhA872iYoLVUp0VhZY=
X-Google-Smtp-Source: ABdhPJyXvwYFylZXYOaEJn7CqGhHRyc5sGx5GMsyW2l3WGjfojJwouZF+P6Xohag5ohcqn7xqfaq3g==
X-Received: by 2002:a9d:5d11:: with SMTP id b17mr222037oti.216.1624306633582; 
 Mon, 21 Jun 2021 13:17:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h193sm3808092oib.3.2021.06.21.13.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 13:17:12 -0700 (PDT)
Date: Mon, 21 Jun 2021 13:17:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 3/3] Replace for_each_*_bit_from() with for_each_*_bit()
 where appropriate
Message-ID: <20210621201711.GA631547@roeck-us.net>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195735.55933-4-yury.norov@gmail.com>
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Jean Delvare <jdelvare@suse.com>,
 Alexey Klimov <aklimov@redhat.com>, etnaviv@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 12:57:35PM -0700, Yury Norov wrote:
> A couple of kernel functions call for_each_*_bit_from() with start
> bit equal to 0. Replace them with for_each_*_bit().
> 
> No functional changes, but might improve on readability.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/apic/vector.c         | 4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
>  drivers/hwmon/ltc2992.c               | 3 +--

This should be three different patches, one per subsystem.

Guenter

>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
> index fb67ed5e7e6a..d099ef226f55 100644
> --- a/arch/x86/kernel/apic/vector.c
> +++ b/arch/x86/kernel/apic/vector.c
> @@ -760,9 +760,9 @@ void __init lapic_update_legacy_vectors(void)
>  
>  void __init lapic_assign_system_vectors(void)
>  {
> -	unsigned int i, vector = 0;
> +	unsigned int i, vector;
>  
> -	for_each_set_bit_from(vector, system_vectors, NR_VECTORS)
> +	for_each_set_bit(vector, system_vectors, NR_VECTORS)
>  		irq_matrix_assign_system(vector_matrix, vector, false);
>  
>  	if (nr_legacy_irqs() > 1)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 4102bcea3341..42ce3287d3be 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1032,7 +1032,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
>  
>  void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
>  {
> -	unsigned int i = 0;
> +	unsigned int i;
>  
>  	dev_err(gpu->dev, "recover hung GPU!\n");
>  
> @@ -1045,7 +1045,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
>  
>  	/* complete all events, the GPU won't do it after the reset */
>  	spin_lock(&gpu->event_spinlock);
> -	for_each_set_bit_from(i, gpu->event_bitmap, ETNA_NR_EVENTS)
> +	for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
>  		complete(&gpu->event_free);
>  	bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
>  	spin_unlock(&gpu->event_spinlock);
> diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
> index 2a4bed0ab226..7352d2b3c756 100644
> --- a/drivers/hwmon/ltc2992.c
> +++ b/drivers/hwmon/ltc2992.c
> @@ -248,8 +248,7 @@ static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
>  
>  	gpio_status = reg;
>  
> -	gpio_nr = 0;
> -	for_each_set_bit_from(gpio_nr, mask, LTC2992_GPIO_NR) {
> +	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
>  		if (test_bit(LTC2992_GPIO_BIT(gpio_nr), &gpio_status))
>  			set_bit(gpio_nr, bits);
>  	}
