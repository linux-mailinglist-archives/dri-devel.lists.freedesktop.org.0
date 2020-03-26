Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC0193F97
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 14:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EDF6E8C0;
	Thu, 26 Mar 2020 13:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EAC6E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585228718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/zfRe7WbIKDZu9rHgVTTfByJPyfRtrbOIZkKq03EzA=;
 b=gfzPqbWkMGI/GzPIYuqtFcEhcqKbrFTkcSFvF06PvBK1XlLmDRAw3OHkIrHgzTI9NwuGoB
 QwyN3oPFV7yiPshsP4+DpYL/nkbPp+QMygiJc0M0VG3b4mNr3DaSG7XHnw2JJn6G2HUnGm
 a8885aU7FfVg+cc6MfSaZzftn7TgVV8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-dKeotoLqOuSxTZK0ZJ2o6w-1; Thu, 26 Mar 2020 09:18:33 -0400
X-MC-Unique: dKeotoLqOuSxTZK0ZJ2o6w-1
Received: by mail-wr1-f70.google.com with SMTP id e10so3021117wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 06:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/zfRe7WbIKDZu9rHgVTTfByJPyfRtrbOIZkKq03EzA=;
 b=YOBErtJJn58hKQU6Pb943dpb5aiA54/5RqTyJowrOXKswDePkaewbxEvWGsc3MnLd/
 zzLiTCtUlgtzOvISbgw9Kny0vzCOCcmuX2fwwQxE+4TncTXkf7XQc/drIi2CgG/ZiDgK
 1IppFvZvEIlsdE0TYhy+fk8IDM4p0v6NCi5Lpe1rGuwtr3ubHUqwCX5XP8f93Pz3QCwy
 h5zRES6OC7vNOlszlyKBjz+Up7ctIIMybtbT5vru/Azi00/sqrYWnXTYrBsiu9VLoH0o
 6TunM91L15/4CKtetsDPJPxq6ik39wVkCxA2s1K0BYOctBAm5kDi5XyYGJFQKAxvfNvH
 wCtg==
X-Gm-Message-State: ANhLgQ3ek6HrcZKEHpT30SqG6bvCCAhBY/n3QmcyosDH+L57k/uOC0Iw
 h1mjdqin63zV2QYezc9mYqUeTEyzqYYVD7ai9xrUiSTQ4V3hSn5p8aN9VuwL4mwtIKYMrcPORP4
 71p98XoS1WLePVeR+AEhTHpLzffVq
X-Received: by 2002:a1c:5443:: with SMTP id p3mr2970850wmi.149.1585228710005; 
 Thu, 26 Mar 2020 06:18:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuhyYp2unZxtr+DOf6fOQ0tX3xjuk3Q++2CvHmFNv4DrlQv37bTzqulHfDpF1n0aBB5aBJ8JQ==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr2970830wmi.149.1585228709763; 
 Thu, 26 Mar 2020 06:18:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id g127sm3582543wmf.10.2020.03.26.06.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 06:18:29 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Add missing
 remove_conflicting_pci_framebuffers call
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200325144310.36779-1-hdegoede@redhat.com>
 <20200326112959.GZ2363188@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b9d940d-b236-062d-4ac3-c7462090066f@redhat.com>
Date: Thu, 26 Mar 2020 14:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326112959.GZ2363188@phenom.ffwll.local>
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
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/26/20 12:29 PM, Daniel Vetter wrote:
> On Wed, Mar 25, 2020 at 03:43:10PM +0100, Hans de Goede wrote:
>> The vboxvideo driver is missing a call to remove conflicting framebuffers.
>>
>> Surprisingly, when using legacy BIOS booting this does not really cause
>> any issues. But when using UEFI to boot the VM then plymouth will draw
>> on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
>> /dev/fb1 as fbdev emulation).
>>
>> VirtualBox will actual display the output of both devices (I guess it is
>> showing whatever was drawn last), this causes weird artifacts because of
>> pitch issues in the efifb when the VM window is not sized at 1024x768
>> (the window will resize to its last size once the vboxvideo driver loads,
>> changing the pitch).
>>
>> Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
>> call fixes this.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> index 8512d970a09f..261255085918 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> @@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   	if (ret)
>>   		goto err_mode_fini;
>>   
>> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
>> +	if (ret)
>> +		goto err_irq_fini;
> 
> To avoid transient issues this should be done as early as possible,
> definitely before the drm driver starts to touch the "hw".>

Ok will fix and then push this to drm-misc-next-fixes, thank you.

> With that
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I do wonder though why the automatic removal of conflicting framebuffers
> doesn't work, fbdev should already do that from register_framebuffer(),
> which is called somewhere in drm_fbdev_generic_setup (after a few layers).
> 
> Did you check why the two framebuffers don't conflict, and why the uefi
> one doesn't get thrown out?

I did not check, I was not aware that this check was already happening
in register_framebuffer(). So I just checked and the reason why this
is not working is because the fbdev emulation done by drm_fbdev_generic_setup
does not fill in fb_info.apertures->ranges[0] .

So fb_info.apertures->ranges[0].base is left as 0 which does not match
with the registered efifb's aperture.

We could try to fix this, but that is not entirely trivial, we would
need to pass the pci_dev pointer down into drm_fb_helper_alloc_fbi()
then and then like remove_conflicting_pci_framebuffers() does add
apertures for all IORESOURCE_MEM PCI bars, but that would conflict
with drivers which do rely on drm_fb_helper_alloc_fbi() currently
allocating one empty aperture and then actually fill that itself...

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
