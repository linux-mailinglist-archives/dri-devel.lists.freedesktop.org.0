Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9D1941B5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 15:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C26E32C;
	Thu, 26 Mar 2020 14:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397BD6E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585233608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7pmCD6xkvohHHddYnsCqDnepGY6BXTnj0qYSuEg3+o=;
 b=bIYK7H81Yu6gXDmx83wT6R8k+939FFgJ+26jVHG1pY6h/6CBPtIhsS4MHeETua1ucXpKer
 fhRGgrW3TZubXTlwGmT58yOz7FyQVGS2OFQtlrVkj8PfBjygvyNU5uxQdoQONxuRb4koSt
 YVr3AQ8lucj8BWxRvpp/2F5b41VtR8k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-hJkXrWjQM9ukQcuAZfdbiA-1; Thu, 26 Mar 2020 10:40:06 -0400
X-MC-Unique: hJkXrWjQM9ukQcuAZfdbiA-1
Received: by mail-wr1-f69.google.com with SMTP id e10so3132829wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 07:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7pmCD6xkvohHHddYnsCqDnepGY6BXTnj0qYSuEg3+o=;
 b=RQ2f9vXbMQM/kWuH6wFvKxkPU33GuCrNIuTrzmRNw75/d2cJvfQi92q1SaGvNDeGw0
 7c9i3huZRUNStU1+tEvAlbBhlmOvJ+M65AxOLcv7pSCfBLAC6fSKCDdCIml76PwwLivZ
 lbG5iddr5xMqZGgGobBnK/uwDWOt3WA8jHHRmPoIAXpntLvS7PkScc9GGpts0I65Cs+m
 ORu8Ywu0W6/iSr4oU3JC7It29IC3iIVWB+lxWL8ylZ+BBg8pITa+T6GghNiumCIdcy5N
 beNjToFvNsnJFPmjEuTla48mmulSTyzTrHWDKuZjyHn1OWuVJVfs5IpDbs1tOPMCwqrw
 OhXw==
X-Gm-Message-State: ANhLgQ2KxoIKcJQjav7KNNeZouZcxEoN/zCqPO8UfxaB+xfpgEmdLFBV
 vpUmfZ5Rxdcl2dywT+oYUM9kddp+v32qVj97dVpfQiorYnrz466roSH5Osh+nNNyheFqvWU3gPm
 Epjeu/CSEZaLBnbpjQ9hWArJUIwBI
X-Received: by 2002:a1c:6189:: with SMTP id v131mr264486wmb.69.1585233603044; 
 Thu, 26 Mar 2020 07:40:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvp7YcX7Ls4EGXd0g/RUn4KiZ4RV7SEah48CmNsQxuH61q4u7mY8ers7fJTz58/DfbDHlIv4Q==
X-Received: by 2002:a1c:6189:: with SMTP id v131mr264387wmb.69.1585233601849; 
 Thu, 26 Mar 2020 07:40:01 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id b67sm3771271wmh.29.2020.03.26.07.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 07:40:01 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Add missing
 remove_conflicting_pci_framebuffers call
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200325144310.36779-1-hdegoede@redhat.com>
 <20200326112959.GZ2363188@phenom.ffwll.local>
 <8b9d940d-b236-062d-4ac3-c7462090066f@redhat.com>
 <CAKMK7uHA+uefrWVR42wTss65mq_D4q5odfePm6uj399emkWx8w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8fbfde07-be1e-c8c8-2ff4-c7b64c3f150d@redhat.com>
Date: Thu, 26 Mar 2020 15:39:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHA+uefrWVR42wTss65mq_D4q5odfePm6uj399emkWx8w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/26/20 2:39 PM, Daniel Vetter wrote:
> On Thu, Mar 26, 2020 at 2:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 3/26/20 12:29 PM, Daniel Vetter wrote:
>>> On Wed, Mar 25, 2020 at 03:43:10PM +0100, Hans de Goede wrote:
>>>> The vboxvideo driver is missing a call to remove conflicting framebuffers.
>>>>
>>>> Surprisingly, when using legacy BIOS booting this does not really cause
>>>> any issues. But when using UEFI to boot the VM then plymouth will draw
>>>> on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
>>>> /dev/fb1 as fbdev emulation).
>>>>
>>>> VirtualBox will actual display the output of both devices (I guess it is
>>>> showing whatever was drawn last), this causes weird artifacts because of
>>>> pitch issues in the efifb when the VM window is not sized at 1024x768
>>>> (the window will resize to its last size once the vboxvideo driver loads,
>>>> changing the pitch).
>>>>
>>>> Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
>>>> call fixes this.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>>> index 8512d970a09f..261255085918 100644
>>>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>>> @@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>       if (ret)
>>>>               goto err_mode_fini;
>>>>
>>>> +    ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
>>>> +    if (ret)
>>>> +            goto err_irq_fini;
>>>
>>> To avoid transient issues this should be done as early as possible,
>>> definitely before the drm driver starts to touch the "hw".>
>>
>> Ok will fix and then push this to drm-misc-next-fixes, thank you.
>>
>>> With that
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> I do wonder though why the automatic removal of conflicting framebuffers
>>> doesn't work, fbdev should already do that from register_framebuffer(),
>>> which is called somewhere in drm_fbdev_generic_setup (after a few layers).
>>>
>>> Did you check why the two framebuffers don't conflict, and why the uefi
>>> one doesn't get thrown out?
>>
>> I did not check, I was not aware that this check was already happening
>> in register_framebuffer(). So I just checked and the reason why this
>> is not working is because the fbdev emulation done by drm_fbdev_generic_setup
>> does not fill in fb_info.apertures->ranges[0] .
>>
>> So fb_info.apertures->ranges[0].base is left as 0 which does not match
>> with the registered efifb's aperture.
>>
>> We could try to fix this, but that is not entirely trivial, we would
>> need to pass the pci_dev pointer down into drm_fb_helper_alloc_fbi()
>> then and then like remove_conflicting_pci_framebuffers() does add
>> apertures for all IORESOURCE_MEM PCI bars, but that would conflict
>> with drivers which do rely on drm_fb_helper_alloc_fbi() currently
>> allocating one empty aperture and then actually fill that itself...
> 
> You don't need the pci device, because resources are attached to the
> struct device directly. So you could just go through all
> IORESOURCE_MEM ranges, and add them. And the struct device we always
> have through drm_device->dev. This idea just crossed my mind since you
> brought up IORESOURCE_MEM, might be good to try that out instead of
> having to litter all drivers with explicit removal calls. The explicit
> removal is really only for races (vga hw tends to blow up if 2 drivers
> touch it, stuff like that), or when there's resources conflicts. Can
> you try to look into that?

Interesting idea, but I'm afraid that my plate is quite full with a lot of
more urgent things atm, so I really do not have time for this, sorry.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
