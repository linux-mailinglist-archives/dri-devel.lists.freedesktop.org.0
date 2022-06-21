Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42665531F9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502610F664;
	Tue, 21 Jun 2022 12:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB610F664
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655814343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChvXxqyn9OOMyURFW0VTLkgw2UAz7rtxv6HEJjFmKS0=;
 b=CX+Cm+Pb6LshS6WqL2rVDlR2fexq4aMbUCxUav5hh2uUa/RPhjQFjF0/Um0OdTlrnDtSoz
 k9jGbSs5EisSifsw4WO2AVjadBeWhgh+ZGdXZfA5lZE6S6lEZpMdSQ6zm51zseeZylBDEm
 DROR8VQ45kzKtmuBptrbM+ELZ1QM63o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-X8ilOaINNFmc52unIo5Vmw-1; Tue, 21 Jun 2022 08:25:42 -0400
X-MC-Unique: X8ilOaINNFmc52unIo5Vmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfa389000000b0021b8b489336so1860841wrb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 05:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ChvXxqyn9OOMyURFW0VTLkgw2UAz7rtxv6HEJjFmKS0=;
 b=qPaES9+3ghLLiBtIuaUvuo33NB8r362p0EYNHzzEPvv9k5zqih6kpDNfB8zztLATmm
 zYtlh3bcDOI/oX1sCAZ/CUMPzNhfKcuZZVT6iVoZWdZIU+9ZrHmm9L4tMN7fcv2Oqngx
 OXr01ClwRMrESo9W7Exe7KPnf3lbUUW1W1eHeaPIysVuBHRcLrPlS8WSCfPQoLGeHsCb
 Bd3RzvNA3VOK+GagWgqN7tXa5C8JLhU1JZyQgXUov/ZeMkdXNoHLLxC+DvIc6YSssEy2
 tWkg/5P5rzvIyxtgQG2rF+sMxDlK7bCneTLcIWCKP0ZXSiZ+X54AS//ZYu7xuidAWcvA
 wCxg==
X-Gm-Message-State: AOAM532GiB/Jxbg+I/8j8+QMf/DOzuMWSrTcuXTemqdNBjAc6TA2Ys5A
 DmUaBIUtYEQuyk/X/N7Qh42EIB/XChA6ecD2t9alt8zQ8K20dM8fA69RffT8MZ7Kpydazz4kYaQ
 elFl6HyfghwkxEdkcAm4U6EDDFF8n
X-Received: by 2002:a1c:5411:0:b0:39c:4761:66f8 with SMTP id
 i17-20020a1c5411000000b0039c476166f8mr39561326wmb.47.1655814340788; 
 Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTAiCn5Imotvz18wokmi04OBc4tB0BgS4MkpRYCxooHQh3Q2IacQwQDWlfA//FgEeY08KGiA==
X-Received: by 2002:a1c:5411:0:b0:39c:4761:66f8 with SMTP id
 i17-20020a1c5411000000b0039c476166f8mr39561316wmb.47.1655814340566; 
 Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c129300b0039c8a22554bsm18838723wmd.27.2022.06.21.05.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
Message-ID: <c259699e-c478-d3f6-f892-721727a5f1bf@redhat.com>
Date: Tue, 21 Jun 2022 14:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
 <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
 <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 6/21/22 13:29, Thomas Zimmermann wrote:

[...]

>>> +
>>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>>> +		    resource_size_t base2, resource_size_t end2)
>>> +{
>>> +	return (base1 < end2) && (end1 > base2);
>>> +}
>>
>> There's a resource_overlaps() helper in include/linux/ioport.h, I wonder if it
>> could just be used, maybe declaring and filling a struct resource just to call
>> that helper. Later as an optimization a resource_range_overlap() or something
>> could be proposed for include/linux/ioport.h.
> 
> Bu then we'd have to declare struct resource-es for using an interface. 
> This helper is trivial. If anything, resource_overlaps() should be 
> generalized.
>

Yes, that works too. Probably then we should just keep as is and then as a follow
up we can add another helper to include/linux/ioport.h to avoid having something
that's only for the aperture helpers.

>>
>> Also, I noticed that resource_overlaps() uses <= and >= but this helper uses
>> < and >. It seems there's an off-by-one error here but maybe I'm wrong on this.
> 
> struct resource stores the final byte of the resource. In our case 'end' 
> is the byte after that. So the code is correct.
> 
> Do we ever have resources that end at the top-most byte of the address 
> space?
>

I don't know to be honest.

[...]

>>> +static void detach_platform_device(struct device *dev)
>>> +{
>>> +	struct platform_device *pdev = to_platform_device(dev);
>>> +
>>> +	/*
>>> +	 * Remove the device from the device hierarchy. This is the right thing
>>> +	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
>>> +	 * the new driver takes over the hardware, the firmware device's state
>>> +	 * will be lost.
>>> +	 *
>>> +	 * For non-platform devices, a new callback would be required.
>>> +	 *
>>
>> I wonder if we ever are going to need this. AFAICT the problem only happens for
>> platform devices. Or do you envision a case when some a bus could need this and
>> the aperture unregister the device instead of the Linux kernel device model ?
>>
> 
> In the current code, we clearly distinguish between the device and the 
> platform device. The latter is only used in a few places where it's 
> absolutely necessary, because there's no generic equivalent to 
> platform_device_unregister(). (device_unregister() is something else 
> AFAICT.)  At some point, I'd like to see the aperture code being handled 
> in a more prominent place within resource management. That would need it 
> to use struct device.
>

Ok, I was wondering what was the value of the indirection level other than
making the code more complex and supporting an hypothetical case of a FW
driver that would not bind against a platform device.

But if the goal is to move this at some point to a more generic place (i.e:
the Linux device model itself) then I agree that we can just keep it as is.

When you re-spin this patch, feel free to add my R-b since looks good to me.

And thanks again for working on this!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

