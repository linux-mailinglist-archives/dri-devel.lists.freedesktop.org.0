Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670524719D2
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 12:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB53210E18B;
	Sun, 12 Dec 2021 11:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0F310E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639309109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enZ9wtju2weTaLCliJwjtIvdjIiIKEzWJXF4kl1QYYg=;
 b=JABsrZ6dQ8fduSKEOOz5e18VHkB/Lk0ZCJfzyN7x7c0y348zLzR/bIXHGTGejnLMTfT1M5
 tZ++CXRkiSWIbYuby/GXkZKCJ6uKOI4v/xznornCzBQGWrmTfWczJUNh0JRfyaBfU89i+G
 r/dnqowkds+91jgNQ//yPrKLG/VDr4M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-oQI1mHQ_OCyWo_y3aw0xRA-1; Sun, 12 Dec 2021 06:38:23 -0500
X-MC-Unique: oQI1mHQ_OCyWo_y3aw0xRA-1
Received: by mail-ed1-f72.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo11625322edb.20
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 03:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=enZ9wtju2weTaLCliJwjtIvdjIiIKEzWJXF4kl1QYYg=;
 b=niu3ucNiGxL37U5IyoRAkn4L/2vtslH6WykKlCePsIgzJ1Uu6J0hFT+M9EHDc3jdM5
 3RvpgWKH4nXR9BaMXxKKc5uqr4Ti7D/vQuJ6OARqLZBsdIPJtub+eOl9ZH7pGb0uBIjg
 MlN+9+YEJ86o/47pUcX9t3CVYa4LRCUxOTTcOorriFv1ENt2GG5wP+qeY7tizBbZSPkH
 Uda/VuTuFpWBznWukG4fp7epjxn7DciTP4hmnZ2iIz5PBmiixsEXVNoPA4lgorTcyzXH
 vWtfndldBuil58x5AHnZC1glrrD0xC5lviu+0ktHsvtjAzi9fBWU07dNHtt5X6MuQufA
 6lRQ==
X-Gm-Message-State: AOAM533RpP6x4yCV+QHEJChsfLWbeRk5oLmmoo3VgAdz4vpR30rZZy4v
 hMrTkKg9bbum8dV6WG6+cAbEqsUFaXXIWs9W2qjzFqy4VUOtw9EfRdBAOf/eEMuEPg0iSRn6PrL
 PZvlgy5OivjJM5ToInI0oKBJi2ywj
X-Received: by 2002:a17:906:d54c:: with SMTP id
 cr12mr35915077ejc.56.1639309102153; 
 Sun, 12 Dec 2021 03:38:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW9vaJuFcH2IwdHdxLGm0JdPJEr8oNOfr6SlYZ1y82jRAzo0ZkyuchOniriaZlKdGyAKu2Zg==
X-Received: by 2002:a17:906:d54c:: with SMTP id
 cr12mr35915063ejc.56.1639309101900; 
 Sun, 12 Dec 2021 03:38:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id s18sm4738692edd.15.2021.12.12.03.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 03:38:21 -0800 (PST)
Message-ID: <76ac4a54-4913-66f7-5de8-9e70c14bde80@redhat.com>
Date: Sun, 12 Dec 2021 12:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] lib/genalloc: Fix NULL vs IS_ERR() checking
To: Miaoqian Lin <linmq006@gmail.com>
References: <20211211144957.31381-1-linmq006@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211211144957.31381-1-linmq006@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/11/21 15:49, Miaoqian Lin wrote:
> The devm_gen_pool_create() function does not return NULL. It
> returns error pointers.
> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

This is already fixed in linux-next, see:

https://cgit.freedesktop.org/drm-misc/commit/drivers/gpu/drm/vboxvideo/vbox_main.c?id=cebbb5c46d0cb0615fd0c62dea9b44273d0a9780

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

