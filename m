Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2991AAB3D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029D6E9FC;
	Wed, 15 Apr 2020 15:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61D6E9FC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586963044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOi3vU3sVtkE3EcVTcnTWRDlW8umAt6ip2UXRKgd2vY=;
 b=R0IQgxWVPUcsJbUqHxtll/10W3t7AOqL8VsjGPpfEvu7HVw9pdRlpxB6PfIaxAQ1HTfK8e
 MfTwETcxjef1acyI7BOQS3wswqyIbeYf8fzIXge5q/jHzxtwgBYQbatcWS68NQEMZ/cghe
 BdOIAiudybzVYVNQSC1cLGLTP0iphIc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-vkmWyJ27P6KhXsUg9oASQQ-1; Wed, 15 Apr 2020 11:04:00 -0400
X-MC-Unique: vkmWyJ27P6KhXsUg9oASQQ-1
Received: by mail-wm1-f72.google.com with SMTP id h6so5438432wmi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JOi3vU3sVtkE3EcVTcnTWRDlW8umAt6ip2UXRKgd2vY=;
 b=B+Ndk6gp8TLHsNrldsn348TlapM1xSyc/wj78bqfY6XdwP3REqDcysZ1fotqepwnnl
 LLgE+FdQ3HDzvEpzzRi82Gc7OcElzfwDy4VV9pOX/qhlbfvWcWpjjKqeiJ+VWYxAJr9d
 BXW0iUyqSAGHnLzeDJ+vycVFOIX9xCyzivZchmC59EySDtRPdeBbUdzJX+Iq5eX0zp7r
 2fIjCIIWvKVZj9vjSFWJ1TEN4egfXpAlhaNAF3zKHKg3BOM8OToyGAyTGz2dgdGXNpUJ
 i4jSetCMi3IRFAdqLW69SycD1F35kyzts4+m+6xH+3ubqP/PZtUy3jGwdPehvk9sA2hx
 enaA==
X-Gm-Message-State: AGi0PuaxZjMxZgKb7Cad7ASYh1NPhjKsVz2cip8WEnyBXxaEEp5YTkf3
 2x4qkzomifYaH3T36fPHmCIENqntAkMyWLyuK/rZH9mHjmMKEQz6K2/67XWEMs22IPHmQBYygIb
 RgYkQQ2RZYzZCl+w+RKkmrvEG/FsU
X-Received: by 2002:a5d:6841:: with SMTP id o1mr29431070wrw.412.1586963038430; 
 Wed, 15 Apr 2020 08:03:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ4rHhuCHWSf2IGbhoBUmD/7YFjX+fy6lr8FZtFeQ9akCO+ToARqkkyjAadq6cjmKbOWa4Rbw==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr29431042wrw.412.1586963038202; 
 Wed, 15 Apr 2020 08:03:58 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id p3sm5737478wrx.82.2020.04.15.08.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:03:57 -0700 (PDT)
Subject: Re: [PATCH 05/59] drm/vboxvidoe: use managed pci functions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-6-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <75d2db08-a47f-a331-84bc-b61072da94e8@redhat.com>
Date: Wed, 15 Apr 2020 17:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-6-daniel.vetter@ffwll.ch>
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
> Allows us to drop the cleanup code on the floor.
> 
> Sam noticed in his review:
>> With this change we avoid calling pci_disable_device()
>> twise in case vbox_mm_init() fails.
>> Once in vbox_hw_fini() and once in the error path.
> 
> v2: Include Sam's review remarks
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
>   drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
>   2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index cfa4639c5142..cf2e3e6a2388 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	pci_set_drvdata(pdev, vbox);
>   	mutex_init(&vbox->hw_mutex);
>   
> -	ret = pci_enable_device(pdev);
> +	ret = pcim_enable_device(pdev);
>   	if (ret)
>   		return ret;
>   
>   	ret = vbox_hw_init(vbox);
>   	if (ret)
> -		goto err_pci_disable;
> +		return ret;
>   
>   	ret = vbox_mm_init(vbox);
>   	if (ret)
> @@ -91,8 +91,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	vbox_mm_fini(vbox);
>   err_hw_fini:
>   	vbox_hw_fini(vbox);
> -err_pci_disable:
> -	pci_disable_device(pdev);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 9dcab115a261..1336ab9795fc 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox)
>   
>   	for (i = 0; i < vbox->num_crtcs; ++i)
>   		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> -
> -	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>   }
>   
>   /* Do we support the 4.3 plus mode hint reporting interface? */

This seems to be missing the conversion of the iomap_range call to
the devm equivalent ?   :

drivers/gpu/drm/vboxvideo/vbox_main.c
44:     vbox->vbva_buffers = pci_iomap_range(vbox->ddev.pdev, 0, ...

Regards,

Hans





> @@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
>   	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>   	vbox->guest_pool = gen_pool_create(4, -1);
>   	if (!vbox->guest_pool)
> -		goto err_unmap_guest_heap;
> +		return -ENOMEM;
>   
>   	ret = gen_pool_add_virt(vbox->guest_pool,
>   				(unsigned long)vbox->guest_heap,
> @@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
>   
>   err_destroy_guest_pool:
>   	gen_pool_destroy(vbox->guest_pool);
> -err_unmap_guest_heap:
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>   	return ret;
>   }
>   
> @@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
>   {
>   	vbox_accel_fini(vbox);
>   	gen_pool_destroy(vbox->guest_pool);
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>   }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
