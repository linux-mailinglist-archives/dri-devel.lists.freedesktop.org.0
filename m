Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3A455ADC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872966ECC6;
	Thu, 18 Nov 2021 11:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26A26ECC6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637235985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPQvFkqp42yL5KGkN+R/vv46p9qBJQWpQ3XSKmUsvhI=;
 b=b7BYz75j+QX6XAlHQCB7E+rhTHR45YjwJYJ/GuwANNrjtRojQxwdrQVMlIIlHM+ZHeJYuv
 ayDzzUgtuh6C2wrOb1OlWNW5OImkQfHB3B4VfjSX0/YZ/bQy6I77SCWva8lV+3C01i0Cv5
 P2sU1dZoTeJZe1kzBFpNSZyeulP0ImE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-tkPHeXuSPjeiqLPDsqxl3w-1; Thu, 18 Nov 2021 06:46:22 -0500
X-MC-Unique: tkPHeXuSPjeiqLPDsqxl3w-1
Received: by mail-ed1-f70.google.com with SMTP id
 p4-20020aa7d304000000b003e7ef120a37so5013568edq.16
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 03:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IPQvFkqp42yL5KGkN+R/vv46p9qBJQWpQ3XSKmUsvhI=;
 b=piOHJpTrNWBxPtJ6ucRarsnj+UfJwebdiaKZHyf8L+jFS9IkTGwuKgnr9EMelbZtQV
 KD9tRuLH7sAdid6v3XVescO9pV5XPO0tb3bs2JvWQAmuo7C/Cs/qd0vD+qFyXWbeDtol
 cvc6L6YIcoY3LNca0uiD0yptGY8onU5m+yFrUcYyWS60Wg1rI3xP2/rMXoARfMU3oQc1
 Jm+xa9BIKUu6qjdIRN6T1aA6Yj5uCBoJ4e3GRipIbvxtCpr9USEyvpI/qPlECQuQHj1R
 xFOSsvBoP2qRIKn2+gV3W9wGRUqqVDEM2DTPlpMVLabqIughxX8TOwwVo+YnJ6tgEgEI
 mJVA==
X-Gm-Message-State: AOAM530fz8Iyqylx/VmKkVMGliIKoK6wwYvBDVO8zHd24K2RGGyWh+2Z
 Ife0VP/+GapGqhp6BY8EZz48GcBNHh3mfShzvAJuL0bkTcETahhzgWV1e+qSb9j1T3/Xv0BXaGy
 iqDNqtT3TXce5J+3soIiya3LzjNvP
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr10360652edd.113.1637235981006; 
 Thu, 18 Nov 2021 03:46:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5eIOMZFrmWoirVwrgiCTeJUljdkA4uFq3YdnvZZT1mYAyITX8gj/wjqokk4GYijd9dyzvwg==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr10360630edd.113.1637235980878; 
 Thu, 18 Nov 2021 03:46:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id el20sm1173593ejc.40.2021.11.18.03.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:46:20 -0800 (PST)
Message-ID: <2ea64de3-4afd-feb8-ab2f-27dd386a3a41@redhat.com>
Date: Thu, 18 Nov 2021 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/vboxvideo: fix a NULL vs IS_ERR() check
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20211118111233.GA1147@kili>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211118111233.GA1147@kili>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/18/21 12:12, Dan Carpenter wrote:
> The devm_gen_pool_create() function never returns NULL, it returns
> error pointers.
> 
> Fixes: 4cc9b565454b ("drm/vboxvideo: Use devm_gen_pool_create")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will go and push this to drm-misc-next right away.

Regards,

Hans

> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index f28779715ccd..c9e8b3a63c62 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -127,8 +127,8 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>  	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
>  						"vboxvideo-accel");
> -	if (!vbox->guest_pool)
> -		return -ENOMEM;
> +	if (IS_ERR(vbox->guest_pool))
> +		return PTR_ERR(vbox->guest_pool);
>  
>  	ret = gen_pool_add_virt(vbox->guest_pool,
>  				(unsigned long)vbox->guest_heap,
> 

