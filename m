Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798551AAB3F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4EF6EA06;
	Wed, 15 Apr 2020 15:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CE06EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586963056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cVMTFnt7DCp/CelD7mmJStwUUEh4AlTLPQyaZCMRw8=;
 b=OztZ2+V9p6A8vNdg6WooJDnHw+jmeAQMP2HYLVh4BYMBFYjNHp7fhFUSi1SairKaheKKMh
 /du0+xrik5ysuqqPvzujPyXDzyRRjt4IWTfHR5NSLb268ZqtZCIU7rhNdE53FwFfiuOnlj
 pBW0Hgx18+47W9mk9h6RULwIy1f74gs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-R_cp2WZuMpaUHs2IV6EYLA-1; Wed, 15 Apr 2020 11:04:08 -0400
X-MC-Unique: R_cp2WZuMpaUHs2IV6EYLA-1
Received: by mail-wr1-f71.google.com with SMTP id 11so60884wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5cVMTFnt7DCp/CelD7mmJStwUUEh4AlTLPQyaZCMRw8=;
 b=ZSZiFM3iSi5y019UiHDqlK7sj9QkY8qhWpOC851yDunovH+3FgkANp83ZlxbFrgybQ
 HCT0fBFPaReUFuzVKMIGdEX024xU+6PNuU5gpicP9dOjIRLLGvnQyYm7XaND2vJ4w4ov
 k+7d1krnKfCk3i0xAB4268yko4UwvPTBuI279jGKemf0i/a2z0wFZ3yi9U/xWNDRIrgO
 QM6LKbCOKq10JW4riccAOY5z+YnxCaATo6TK77Paj1oWaEG1WO61UBU7UROgiPdbiixn
 p3Im/X00zhgbcfg6YgvhOXxdtP/FSPF3WIk1pd7Ny9WhVIP+2Ywptq1jRwbIPnc+tX+Q
 RV3Q==
X-Gm-Message-State: AGi0Pubxb3MNaqLTay6mwvJxC415szruhc3urKtQ1CtiZqbhwwNIvx9B
 3JQX+wPNv6oa4PGF3JlYO7t0kJQUCBVqStKGTIuqIDXfNlaVQ2iChWhqohnL7LvSXC+HiXsMX6S
 pz+zeG2fb8jvvx9azJOZO4DQGvwwM
X-Received: by 2002:adf:8b48:: with SMTP id v8mr31634818wra.342.1586963046636; 
 Wed, 15 Apr 2020 08:04:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKNpVZSGQSMbqFxcUHxaJypr6tyU74/diLIVyCVj9dtr3NoAOni37rKCeL1o3ZzyeUvjUIjYA==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr31634799wra.342.1586963046425; 
 Wed, 15 Apr 2020 08:04:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id v7sm273585wmg.3.2020.04.15.08.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:04:05 -0700 (PDT)
Subject: Re: [PATCH 06/59] drm/vboxvideo: Use devm_gen_pool_create
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-7-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <62e5c3c1-1c14-6450-e525-ce338c951687@redhat.com>
Date: Wed, 15 Apr 2020 17:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-7-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 9:39 AM, Daniel Vetter wrote:
> Aside from deleting all the cleanup code we're now also setting a name
> for the pool
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

LGTM:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/gpu/drm/vboxvideo/vbox_main.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 1336ab9795fc..d68d9bad7674 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -121,7 +121,8 @@ int vbox_hw_init(struct vbox_private *vbox)
>   		return -ENOMEM;
>   
>   	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
> -	vbox->guest_pool = gen_pool_create(4, -1);
> +	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
> +						"vboxvideo-accel");
>   	if (!vbox->guest_pool)
>   		return -ENOMEM;
>   
> @@ -130,12 +131,12 @@ int vbox_hw_init(struct vbox_private *vbox)
>   				GUEST_HEAP_OFFSET(vbox),
>   				GUEST_HEAP_USABLE_SIZE, -1);
>   	if (ret)
> -		goto err_destroy_guest_pool;
> +		return ret;
>   
>   	ret = hgsmi_test_query_conf(vbox->guest_pool);
>   	if (ret) {
>   		DRM_ERROR("vboxvideo: hgsmi_test_query_conf failed\n");
> -		goto err_destroy_guest_pool;
> +		return ret;
>   	}
>   
>   	/* Reduce available VRAM size to reflect the guest heap. */
> @@ -147,30 +148,23 @@ int vbox_hw_init(struct vbox_private *vbox)
>   
>   	if (!have_hgsmi_mode_hints(vbox)) {
>   		ret = -ENOTSUPP;
> -		goto err_destroy_guest_pool;
> +		return ret;
>   	}
>   
>   	vbox->last_mode_hints = devm_kcalloc(vbox->ddev.dev, vbox->num_crtcs,
>   					     sizeof(struct vbva_modehint),
>   					     GFP_KERNEL);
> -	if (!vbox->last_mode_hints) {
> -		ret = -ENOMEM;
> -		goto err_destroy_guest_pool;
> -	}
> +	if (!vbox->last_mode_hints)
> +		return -ENOMEM;
>   
>   	ret = vbox_accel_init(vbox);
>   	if (ret)
> -		goto err_destroy_guest_pool;
> +		return ret;
>   
>   	return 0;
> -
> -err_destroy_guest_pool:
> -	gen_pool_destroy(vbox->guest_pool);
> -	return ret;
>   }
>   
>   void vbox_hw_fini(struct vbox_private *vbox)
>   {
>   	vbox_accel_fini(vbox);
> -	gen_pool_destroy(vbox->guest_pool);
>   }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
