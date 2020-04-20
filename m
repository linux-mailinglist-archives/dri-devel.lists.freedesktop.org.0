Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712901B0C6A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 15:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3AC89225;
	Mon, 20 Apr 2020 13:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B081589225
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587388586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3D3JSsbxO6WF6Muo3MHngcoLOG28YIx1kdVBs8x2os=;
 b=F8IQZJ5mHaQiEOPI2NQE0po//3oUPEjab9VqLNZySAV9yYovjTJIWVx2kz9kk+WfjdsZYN
 Y3jUhLinRw3k3VgoJ4k821dhPyk0sKtK4lH0yasMujZqecR8CSdbo/RGUiFbxDiFcENZex
 PJGzTunxmxEBHYUDvNfarQjOGGLBbac=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-S1_xzJ6tPUuCiKDYJvTq9A-1; Mon, 20 Apr 2020 09:16:22 -0400
X-MC-Unique: S1_xzJ6tPUuCiKDYJvTq9A-1
Received: by mail-wm1-f69.google.com with SMTP id 72so1189wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 06:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N3D3JSsbxO6WF6Muo3MHngcoLOG28YIx1kdVBs8x2os=;
 b=bnINfWwANZdHr0mTirFyu1KJ2rQQQvJhsrNd2CfVL9XpJgCMnuzD6VFiZvYeB0rVTA
 hSzbB9cawtzXlHVbB0Rq04+7noK7avdscMMRUWHk4nwtCF754TkF98znAkPp6Xj4rJUj
 CDcQHLZO9CxSr6OLKVjPP943KhaPNcDG+XNrINTdVDUNvtWinDFEV8bI5x4d0kNkXyDT
 ji0DXQqIR0uXQ0ClrgHT/MFFwviyMh2as/OJXwjhz/TZ2n4UL+KgWaaOEtMxfQgOWT+9
 FhBZLk3X0P//t4Zy5BOt60u3m1ottOPET40rj1SA8Tk3y5SQOKiMhREfEBvuR1Mjhyrl
 UjJQ==
X-Gm-Message-State: AGi0PuZfFOH08/gI2VJNl50Ur+4s3ZtH8bRw7UQai3VtzSDcJVkhuMsM
 RFGIiOvLQyT1su4sIoJoa3rrKBpcnhQ/324hbxuMyc6XVPJXXYemeTCqh33CBKQyFQeEJQtJ0/B
 KWl8i9Pbj1Qgd4PQMakELQ4eVwnMv
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr19403119wrx.386.1587388581616; 
 Mon, 20 Apr 2020 06:16:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypIqyyYX6scPKU3CiblYUoeibM6qCE8uPbdLj2dnLZsrEbCdGxP66u5IklrPwlKOfm8z41KEVw==
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr19403100wrx.386.1587388581392; 
 Mon, 20 Apr 2020 06:16:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id i129sm1481115wmi.20.2020.04.20.06.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 06:16:20 -0700 (PDT)
Subject: Re: [PATCH 05/59] drm/vboxvidoe: use managed pci functions
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-6-daniel.vetter@ffwll.ch>
 <75d2db08-a47f-a331-84bc-b61072da94e8@redhat.com>
 <20200415174418.GH3456981@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e2699bf2-712f-7c60-a00d-300e91c2dfeb@redhat.com>
Date: Mon, 20 Apr 2020 15:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415174418.GH3456981@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 7:44 PM, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 05:03:55PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/20 9:39 AM, Daniel Vetter wrote:
>>> Allows us to drop the cleanup code on the floor.
>>>
>>> Sam noticed in his review:
>>>> With this change we avoid calling pci_disable_device()
>>>> twise in case vbox_mm_init() fails.
>>>> Once in vbox_hw_fini() and once in the error path.
>>>
>>> v2: Include Sam's review remarks
>>>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>    drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
>>>    drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
>>>    2 files changed, 3 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>> index cfa4639c5142..cf2e3e6a2388 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>> @@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>    	pci_set_drvdata(pdev, vbox);
>>>    	mutex_init(&vbox->hw_mutex);
>>> -	ret = pci_enable_device(pdev);
>>> +	ret = pcim_enable_device(pdev);
>>>    	if (ret)
>>>    		return ret;
>>>    	ret = vbox_hw_init(vbox);
>>>    	if (ret)
>>> -		goto err_pci_disable;
>>> +		return ret;
>>>    	ret = vbox_mm_init(vbox);
>>>    	if (ret)
>>> @@ -91,8 +91,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>    	vbox_mm_fini(vbox);
>>>    err_hw_fini:
>>>    	vbox_hw_fini(vbox);
>>> -err_pci_disable:
>>> -	pci_disable_device(pdev);
>>>    	return ret;
>>>    }
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> index 9dcab115a261..1336ab9795fc 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> @@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox)
>>>    	for (i = 0; i < vbox->num_crtcs; ++i)
>>>    		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
>>> -
>>> -	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>>>    }
>>>    /* Do we support the 4.3 plus mode hint reporting interface? */
>>
>> This seems to be missing the conversion of the iomap_range call to
>> the devm equivalent ?   :
>>
>> drivers/gpu/drm/vboxvideo/vbox_main.c
>> 44:     vbox->vbva_buffers = pci_iomap_range(vbox->ddev.pdev, 0, ...
> 
> pcim_enable_device is pure magic, it converts _all_ pci_ calls on that
> device to the managed version. There's no other manged pci_ functions (ok
> 1-2 more, but they're rather special).

Ah I see, magic indeed.

Well with that explained, this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>>> @@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
>>>    	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>>>    	vbox->guest_pool = gen_pool_create(4, -1);
>>>    	if (!vbox->guest_pool)
>>> -		goto err_unmap_guest_heap;
>>> +		return -ENOMEM;
>>>    	ret = gen_pool_add_virt(vbox->guest_pool,
>>>    				(unsigned long)vbox->guest_heap,
>>> @@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
>>>    err_destroy_guest_pool:
>>>    	gen_pool_destroy(vbox->guest_pool);
>>> -err_unmap_guest_heap:
>>> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>>>    	return ret;
>>>    }
>>> @@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
>>>    {
>>>    	vbox_accel_fini(vbox);
>>>    	gen_pool_destroy(vbox->guest_pool);
>>> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>>>    }
>>>
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
