Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D128957B5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 17:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1010E275;
	Tue,  2 Apr 2024 15:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XLpfq1Wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B6110E275
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712070311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLq2tKtQyU+Xs0r4v3F/+9g6JN1kAENgWuL95Uf8uiI=;
 b=XLpfq1WdIQqN/xonWXI1S6haK/hCTx35tabnQR12OMv+9bUObiTHAX2ZGvYRhvkF63TlVg
 8ldrdn2eKfzA768mVFRe/J2aMah6EozH8e8H3GyfAO7GlTXBTYI7xEC5JurDg31AsC9gxK
 3306l8SpG42uFkn82hZt/8BAU1clk54=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-ztFaPoiSPRe6mM5cmrrAHg-1; Tue, 02 Apr 2024 11:05:08 -0400
X-MC-Unique: ztFaPoiSPRe6mM5cmrrAHg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a474c52817fso147982866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 08:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712070307; x=1712675107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLq2tKtQyU+Xs0r4v3F/+9g6JN1kAENgWuL95Uf8uiI=;
 b=KjuXvFxDwULVfgjhkOOl8OqU5xfIgioIZLKwZraTgbPBbLNz41FJQdDgWXJLsOA+Gl
 ojJjvp1f4zqn13daydtyYaaHjRHx9AJPGEU0ImmFfzll4qL0GFILmpVJgghuvdL99aoz
 ZzTzX5hjFogaaZPyoVUD17vsidUU7bmpxaEKAoj5aKZ+fAmEWZ+UKcl39f34s17JfAXw
 z4mrwh+uu+1pcSbwq/shrz1SpjPpc+/HUStQYF0kbhQa4HuB2jkaw6TiGbltIAzZF574
 bt2mUA9VMxjC1IIKp90YHY5MZZUcpLHUmHzNSukYmBw0gxsrxIO1unzzqY/58+mujjoo
 kjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYvkIQtHPZty7rYlgtX9QbZbltQREGHTZkEkgJGSSYXsJ86QMB1WvR4sB9mhM9xMwUXyIKxpJs+/qkQK4lg/y47LoXDOLF+qEANyjGgxcj
X-Gm-Message-State: AOJu0YyUaB0CNKvuJlGaH7T7aClDVmPZOt74EI774MOaGmqKrOI6sJ2n
 IbIZcsd53U0y90ePyHSXTolkY2gCNt+3HevA1pKjQ8hnjD1iwewMjB3ewPqO7O9vceNU/R7pC1E
 FLrgS1G/B6K/p59DqJOXHrdMZwXG6rCyGtKiSajMNZhBDmX8/9K3i6IygRN+fLczr+g==
X-Received: by 2002:a17:906:6152:b0:a4c:de71:54f7 with SMTP id
 p18-20020a170906615200b00a4cde7154f7mr8156488ejl.27.1712070307219; 
 Tue, 02 Apr 2024 08:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErvFV/CA6M7Wb3IGxb9REEDxn3nHfFMnRbiWOefA61noi+7+L9ilwruGial88ntKLm0HuCtA==
X-Received: by 2002:a17:906:6152:b0:a4c:de71:54f7 with SMTP id
 p18-20020a170906615200b00a4cde7154f7mr8156459ejl.27.1712070306609; 
 Tue, 02 Apr 2024 08:05:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b?
 (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
 by smtp.gmail.com with ESMTPSA id
 ga13-20020a1709070c0d00b00a473f5ac943sm6588626ejc.37.2024.04.02.08.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 08:05:06 -0700 (PDT)
Message-ID: <12fc7d61-54c0-4089-b885-1ae124708ae6@redhat.com>
Date: Tue, 2 Apr 2024 17:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] drm/vboxvideo: fix mapping leaks
To: Philipp Stanner <pstanner@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 stable@kernel.vger.org
References: <20240328175549.GA1574238@bhelgaas>
 <ffe0e534166f14483d0a6a37342136b7aec9c850.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ffe0e534166f14483d0a6a37342136b7aec9c850.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/2/24 3:50 PM, Philipp Stanner wrote:
> On Thu, 2024-03-28 at 12:55 -0500, Bjorn Helgaas wrote:
>> On Fri, Mar 01, 2024 at 12:29:58PM +0100, Philipp Stanner wrote:
>>> When the PCI devres API was introduced to this driver, it was
>>> wrongly
>>> assumed that initializing the device with pcim_enable_device()
>>> instead
>>> of pci_enable_device() will make all PCI functions managed.
>>>
>>> This is wrong and was caused by the quite confusing PCI devres API
>>> in
>>> which some, but not all, functions become managed that way.
>>>
>>> The function pci_iomap_range() is never managed.
>>>
>>> Replace pci_iomap_range() with the actually managed function
>>> pcim_iomap_range().
>>>
>>> CC: <stable@kernel.vger.org> # v5.10+
>>
>> This is marked for stable but depends on the preceding patches in
>> this
>> series, which are not marked for stable.
>>
>> The rest of this series might be picked up automatically for stable,
>> but I personally wouldn't suggest backporting it because it's quite a
>> lot of change and I don't think it fits per
>> Documentation/process/stable-kernel-rules.rst.
> 
> I agree, if I were a stable maintainer I wouldn't apply it.
> I just put them in CC so that they can make this decision themselves.
> 
>> So I think the best way to fix the vboxvideo leaks would be to fix
>> them independently of this series, then include as a separate patch a
>> conversion to the new pcim_iomap_range() in this series (or possibly
>> for the next merge window to avoid merge conflicts).
> 
> It is hard to fix independently of our new devres utility.
> Reason being that it's _impossible_ to have partial BAR mappings *with*
> the current PCI devres API.
> 
> Consequently, a portable vboxvideo would have to revert the entire
> commit 8558de401b5f and become an unmanaged driver again.
> 
> I guess you could do a hacky fix where the regions are handled by
> devres and the mappings are created and destroyed manually with
> pci_iomap_range() – but do we really want that...?
> 
> The leak only occurs when driver and device detach, so how often does
> that happen... and as far as I can tell it's also not an exploitable
> leak, so one could make the decision to just leave it in the stable
> kernels...
> 
> @Hans:
> What do you say?

In practice this has never been a problem, so I suggest we just drop
the Cc: stable .

Regards,

Hans




>>> Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>  drivers/gpu/drm/vboxvideo/vbox_main.c | 20 +++++++++-----------
>>>  1 file changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> b/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> index 42c2d8a99509..d4ade9325401 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
>>> @@ -42,12 +42,11 @@ static int vbox_accel_init(struct vbox_private
>>> *vbox)
>>>         /* Take a command buffer for each screen from the end of
>>> usable VRAM. */
>>>         vbox->available_vram_size -= vbox->num_crtcs *
>>> VBVA_MIN_BUFFER_SIZE;
>>>  
>>> -       vbox->vbva_buffers = pci_iomap_range(pdev, 0,
>>> -                                            vbox-
>>>> available_vram_size,
>>> -                                            vbox->num_crtcs *
>>> -                                            VBVA_MIN_BUFFER_SIZE);
>>> -       if (!vbox->vbva_buffers)
>>> -               return -ENOMEM;
>>> +       vbox->vbva_buffers = pcim_iomap_range(
>>> +                       pdev, 0, vbox->available_vram_size,
>>> +                       vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE);
>>> +       if (IS_ERR(vbox->vbva_buffers))
>>> +               return PTR_ERR(vbox->vbva_buffers);
>>>  
>>>         for (i = 0; i < vbox->num_crtcs; ++i) {
>>>                 vbva_setup_buffer_context(&vbox->vbva_info[i],
>>> @@ -116,11 +115,10 @@ int vbox_hw_init(struct vbox_private *vbox)
>>>         DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
>>>  
>>>         /* Map guest-heap at end of vram */
>>> -       vbox->guest_heap =
>>> -           pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
>>> -                           GUEST_HEAP_SIZE);
>>> -       if (!vbox->guest_heap)
>>> -               return -ENOMEM;
>>> +       vbox->guest_heap = pcim_iomap_range(pdev, 0,
>>> +                       GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
>>> +       if (IS_ERR(vbox->guest_heap))
>>> +               return PTR_ERR(vbox->guest_heap);
>>>  
>>>         /* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>>>         vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4,
>>> -1,
>>> -- 
>>> 2.43.0
>>>
>>
> 

