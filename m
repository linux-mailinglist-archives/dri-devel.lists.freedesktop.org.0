Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2221AAB32
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685286E9FD;
	Wed, 15 Apr 2020 15:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6746E9E8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586962927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXjJfqb1U96vvZrVwAODGvJGqbQrS92nxYoPc5fUlcs=;
 b=XvRDri0gnjda3nf6toeHykGUD6IdfWGVH0nE1neCbK5nEiqDSKt+lt4bATN+bO5eEzttJY
 9jCHJj+cewkZvOHEJAAMBK9nbN2zG3kBswXZCGCQeISxM/RIrePeAqMNg7ye6HSAvNyT87
 ckYM+9VIRiEnsJnOJH3IRaCC/0LMYcE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-neMql6a0Pxa73LwqAXcRJA-1; Wed, 15 Apr 2020 11:02:02 -0400
X-MC-Unique: neMql6a0Pxa73LwqAXcRJA-1
Received: by mail-wr1-f70.google.com with SMTP id d17so34203wrr.17
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hXjJfqb1U96vvZrVwAODGvJGqbQrS92nxYoPc5fUlcs=;
 b=dxqtWPzhsZZDjSdhjBBDPWFu6cbIjOHleb/e3vexdMft/0q7sEzs8F+ZkXqiFXKoIs
 hsSaAMdsDFr+wXvQcz0i5E2IiRZcsmFQ64iCzulGKpXy//bEOr5ImQFuWbvALnUK0KGt
 o9uzl57tpDQ2QwzsNMiTfG9xgBwhlhFJEZYImxfvhOBKeiVvMhhEvr5Z0m+AJgSvQ8Bf
 2qQCoP0h1SIAuS4/gxGY0mHAP5YspwgiTvchYoMz+qTGiSRo2T/JjxL+aSP0rbjB9G+a
 Vtf8iAmF5ALXQZxvvv9wtYHKtNQPHA3EVk7GBx/tHZ3uF8pwZzOJ9e+3GOXnMlo/Kgzv
 LbLw==
X-Gm-Message-State: AGi0PuY9F7o+fWJG9KBM1aVnGTgRjmG0eCC+q+OTfoqy6YdG96XlTGZo
 R4WqsLtvCwbDoYiRmzDfbc/Fl3Ppk+oq6fLmYx8LBMx6/y1xza8ln3wfxL/rpHKRDrCQqy5h3XK
 /FCXunJtSoHAqffNvE55HbpS1FEgD
X-Received: by 2002:adf:f844:: with SMTP id d4mr10753602wrq.362.1586962921117; 
 Wed, 15 Apr 2020 08:02:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKja/NIudjlcVfSN4PEsoSFqaDVxDRDm4uqTUCeX4kV20hM54w6Ij4HPsdqnDq+GsoHhFBbIA==
X-Received: by 2002:adf:f844:: with SMTP id d4mr10753537wrq.362.1586962920520; 
 Wed, 15 Apr 2020 08:02:00 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d13sm14440192wmb.39.2020.04.15.08.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:01:59 -0700 (PDT)
Subject: Re: [PATCH 02/59] drm/vboxvideo: drop DRM_MTRR_WC #define
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-3-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8cf4f357-1e30-cc23-f743-e33449820862@redhat.com>
Date: Wed, 15 Apr 2020 17:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-3-daniel.vetter@ffwll.ch>
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
> Doesn't apply to upstream kernels since a rather long time.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

LGTM:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/gpu/drm/vboxvideo/vbox_ttm.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> index 976423d0c3cc..f5a06675da43 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> @@ -24,25 +24,13 @@ int vbox_mm_init(struct vbox_private *vbox)
>   		return ret;
>   	}
>   
> -#ifdef DRM_MTRR_WC
> -	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
> -				     pci_resource_len(dev->pdev, 0),
> -				     DRM_MTRR_WC);
> -#else
>   	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
>   					 pci_resource_len(dev->pdev, 0));
> -#endif
>   	return 0;
>   }
>   
>   void vbox_mm_fini(struct vbox_private *vbox)
>   {
> -#ifdef DRM_MTRR_WC
> -	drm_mtrr_del(vbox->fb_mtrr,
> -		     pci_resource_start(vbox->ddev.pdev, 0),
> -		     pci_resource_len(vbox->ddev.pdev, 0), DRM_MTRR_WC);
> -#else
>   	arch_phys_wc_del(vbox->fb_mtrr);
> -#endif
>   	drm_vram_helper_release_mm(&vbox->ddev);
>   }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
