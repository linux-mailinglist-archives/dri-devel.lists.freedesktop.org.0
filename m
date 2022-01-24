Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971984981F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BBB10EB44;
	Mon, 24 Jan 2022 14:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F136310EB44
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643034187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs88OS8ntrHeBIPi6HCjuIRnxV3UU2trcG+6nvyi6gs=;
 b=Wrp3aoOhZm3r7HsaaNAwjXYtNayI91Ke3vPWNWzBxNWMbvzuEbmwotqdbWzWxHiUfSjo+T
 A4OT4H8+pnIo/FIj96omGEHnzavXM/WdrKvfTOvanYFH/ALSTgHrpLqEmCtwf2pefgUBB9
 zeDv8tlvoC/dG1qiM+flFrXTv5Mbqnk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-khYO07ELM-yij_IDhk2M0w-1; Mon, 24 Jan 2022 09:23:04 -0500
X-MC-Unique: khYO07ELM-yij_IDhk2M0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso1135146wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cs88OS8ntrHeBIPi6HCjuIRnxV3UU2trcG+6nvyi6gs=;
 b=SZVfCXuPLvtuwzsn7LJ35z3Std3Zmq/4gq7u/T4oRe3Au/95tG0AwgXJcFSG3k4V8F
 /QT68tfy6lIDryAz2WS8bh+mRbyJQgl1AngTb2oUeCpLUxc20Cpu/QlG+c4N5nMMEe2W
 u/pZSDGMBW8Ec33G8/XDN5hsqPspq+r6VZ4iGSFzJ4S24RwbLoY6y1WHSzg6EF55mmcu
 NLHbSs0XhJibBvNTGr2LmLag2lPo82/u29edKEuW0AzcgSNn0qwHpxUMfSNh2k3d5sZ0
 Oh0g2/JRxbqBk9uKXKHeRATkXfOSkT9hdGpmWC+4BgloJMrql+cFnJy7OPIADhavmSDF
 jSEw==
X-Gm-Message-State: AOAM532sSJVQPd89IPa1DGYnDu+JYbvPDwkQ/bZReNB4WCcyUBDYFoZi
 PCBuJSYi+U0ERDbVTUnOg8L+23QaCq1ki182UqM9/+B/cQo4XyOMHazwKTghUrpIpi5apqKBEPN
 7Px83zHTchon8MuQ7ACO66tBa9MhM
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr3236183wrs.410.1643034183538; 
 Mon, 24 Jan 2022 06:23:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1B9bMdw7KWzqCPgCXI5UiRxAg4SRlxhbTFcyTAgjjrPAcK8XbeRhoAQcwKWpMrNIpiD4sZg==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr3236164wrs.410.1643034183321; 
 Mon, 24 Jan 2022 06:23:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id m11sm13864188wmi.16.2022.01.24.06.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:23:02 -0800 (PST)
Message-ID: <bede759f-23c2-a87e-abde-108196e36fde@redhat.com>
Date: Mon, 24 Jan 2022 15:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/5] drm/simpledrm: Request memory region in driver
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220124123659.4692-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2022 13:36, Thomas Zimmermann wrote:
> Requesting the framebuffer memory in simpledrm marks the memory
> range as busy. This used to be done by the firmware sysfb code,
> but the driver is the correct place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tiny/simpledrm.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 04146da2d1d8..f72b71511a65 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -526,21 +526,31 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
>   {
>   	struct drm_device *dev = &sdev->dev;
>   	struct platform_device *pdev = sdev->pdev;
> -	struct resource *mem;
> +	struct resource *res, *mem;
>   	void __iomem *screen_base;
>   	int ret;
>   
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!mem)
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
>   		return -EINVAL;
>   
> -	ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
> +	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
>   	if (ret) {
>   		drm_err(dev, "could not acquire memory range %pr: error %d\n",
> -			mem, ret);
> +			res, ret);
>   		return ret;
>   	}
>   
> +	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
> +				      sdev->dev.driver->name);
> +	if (!mem) {
> +		/*
> +		 * We cannot make this fatal. Sometimes this comes from magic
> +		 * spaces our resource handlers simply don't know about
> +		 */
> +		drm_warn(dev, "could not acquire memory region %pr\n", res);
> +	}
> +
>   	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
>   				      resource_size(mem));

if mem is NULL, accessing mem->start will segfault after the warning.
I think you renamed "mem" to "res" so probably it should be renamed here 
too ?

>   	if (!screen_base)

