Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DA498208
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085FE10E97A;
	Mon, 24 Jan 2022 14:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5DA10E97A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643034304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91cTvYR6VviS4cvZOL3VWGIO3cvGdjNjxXc1MdKYof4=;
 b=AolzVCmGjoJ1yXTYMpv5WqUtYv3AAtmp+DIFCxJ1hbros9+5EshsRpvm+IfmWFSIdFbqSU
 uwBDJuD5Wx1ToLnAlwp7e5fGlwy74jlkSQKkkeqQmQwxSV0trPtF0OcfZWltp+iLNmNwrI
 xWGeMZLCNbEg+IbTlmhxYnmnWKllp58=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-IONDzRVQNmaJczhQqr02eg-1; Mon, 24 Jan 2022 09:25:03 -0500
X-MC-Unique: IONDzRVQNmaJczhQqr02eg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a3-20020a05600c348300b0034a0dfc86aaso15069535wmq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=91cTvYR6VviS4cvZOL3VWGIO3cvGdjNjxXc1MdKYof4=;
 b=FcBstqO+IeBtnDOLSmrk2yiF4w2Div9D7MRt+kyIM/44+WA8BqLlh3VAXrsVMpoIDx
 wWdaSJQx68szZWIoQPy/Vuc08HYT7QoXqWTRiKlYBpanMlroujSEdqDv5N2HFpe0tzDt
 s+IPyK1gYQpVgjCO/ojuK0ZQXpztWEr3rnnl0SL8LFw67akcpz/ADrVst9mYWtV7Lk6b
 pl1gP0HI7G1CJLVYIekHEl9sOyeLNFGc0a05IfY8HgjhyAa+wOR5FbKBTUE/+yjzhAte
 DC5vYM8rGj8kBd6q3TbGkRuF1l/E9oHbdhoQQ0jLZ9LHJFaEbeH1gk7Qs6VJYqrSJUIi
 XOFA==
X-Gm-Message-State: AOAM531yVAZNbYZ34hZGP8oUHI99gl8yaLpIy9pCe6rY3Y1VFyxxHWGi
 mTJUy9971vx3eaBDqqxH1ZO7o+ym7v+R15R6o5QSRGmbAUiYiavkn5VUpsgCAMQUzL9KKROEVCA
 FKlCyFmFkTTx+49tCFtxhwao2fB/P
X-Received: by 2002:a05:6000:18cb:: with SMTP id
 w11mr14541882wrq.292.1643034300975; 
 Mon, 24 Jan 2022 06:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmWslUSCIQ+qncoCgTI5lmk7SOHrCyzcbudBaXHcrJ5iGS3O9vUleQ3fDfvk+y32ZNBPCVyw==
X-Received: by 2002:a05:6000:18cb:: with SMTP id
 w11mr14541862wrq.292.1643034300730; 
 Mon, 24 Jan 2022 06:25:00 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m15sm35221wms.1.2022.01.24.06.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:25:00 -0800 (PST)
Message-ID: <ef39d2c9-4825-9d40-100d-6461f71ee67e@redhat.com>
Date: Mon, 24 Jan 2022 15:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] fbdev/simplefb: Request memory region in driver
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220124123659.4692-5-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 13:36, Thomas Zimmermann wrote:
> Requesting the framebuffer memory in simpledrm marks the memory
> range as busy. This used to be done by the firmware sysfb code,
> but the driver is the correct place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/simplefb.c | 59 ++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 57541887188b..84452028ecc9 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -66,16 +66,36 @@ static int simplefb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
>  	return 0;
>  }
>  
> -struct simplefb_par;
> +struct simplefb_par {
> +	u32 palette[PSEUDO_PALETTE_SIZE];
> +#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
> +	bool clks_enabled;
> +	unsigned int clk_count;
> +	struct clk **clks;
> +#endif
> +#if defined CONFIG_OF && defined CONFIG_REGULATOR
> +	bool regulators_enabled;
> +	u32 regulator_count;
> +	struct regulator **regulators;
> +#endif
> +	bool release_mem_region;

Maybe instead you could have:

	struct resource *mem; 

that would be more consistent with the fields for the other
resources like clocks, regulators, etc.

> +};
> +
>  static void simplefb_clocks_destroy(struct simplefb_par *par);
>  static void simplefb_regulators_destroy(struct simplefb_par *par);
>  
>  static void simplefb_destroy(struct fb_info *info)
>  {
> +	struct simplefb_par *par = info->par;
> +
>  	simplefb_regulators_destroy(info->par);
>  	simplefb_clocks_destroy(info->par);
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
> +
> +	if (par->release_mem_region)
> +		release_mem_region(info->apertures->ranges[0].base,
> +				   info->apertures->ranges[0].size);

and here you could instead use the pointer to the resource:

	if (par->mem)
		release_mem_region(par->mem->start, resource_size(par->mem));

[snip]

>  static int simplefb_probe(struct platform_device *pdev)
>  {
> +	bool request_mem_succeeded = false;
>  	int ret;
>  	struct simplefb_params params;
>  	struct fb_info *info;
> @@ -436,9 +443,22 @@ static int simplefb_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	if (request_mem_region(mem->start, resource_size(mem), "simplefb")) {
> +		request_mem_succeeded = true;

and if you do the request_mem_region() after the struct fb_info allocation then
this could just be:

		par->mem = mem;

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

