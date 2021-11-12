Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8244E57F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906106E44B;
	Fri, 12 Nov 2021 11:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBF66E44B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636716018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fBALneXnMPo0/2GIAPYkRp4dZ+e683Etbj/vqPlc8Q=;
 b=NFmcvzW4/bT4yXQSW23RBgZLsIcbHe8Xz52KcyPtl+UoQOxRNBGprwliyXOFfD1ftnRPUj
 9B8+EVmbcssTrnN/KY6CUHqJLOG74m7qQ7gUcqNs8ohw1+yWdFgRwi97petGQf89NEjQIh
 Q5Wbwb7wxhXnPNneNzFG91dVUqOTais=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-15YO8fMQOjS-vyi6sN3QdA-1; Fri, 12 Nov 2021 06:20:17 -0500
X-MC-Unique: 15YO8fMQOjS-vyi6sN3QdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so4112358wms.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9fBALneXnMPo0/2GIAPYkRp4dZ+e683Etbj/vqPlc8Q=;
 b=SB/yk4D9NPcHgs5tGSqXrLzQ4Jfc9vi/fQTGePhrQtqMl7R5WosBDX2ZW90hddeT6I
 k31m8VGGDe+0ImD3PSLy2vULpumXhpyQ5D0U8rpWm+GzeliO4+uUECWlZqHJPlgsFYds
 6J+DXDb8TXTAfoL/SjPhTXi8LQPJBxHkJBVoddPReZ4IV9BtJdLrgPrZqD5xRdH6hb+h
 Ublwxb081yYlZY0HbgiOJIVltYIBnDMDyvE32TCOnrq9KcN8U3ZQ/OuQL/yfzHNExwoz
 AWoP5f+xOv8J7+hY85de7nzxT+zWGoiagcpAU2QGgRNYKL+IGDPnblVzR1+QuWPfhWcs
 jEzw==
X-Gm-Message-State: AOAM533I+KDk45LR5B1xTVZ8PE/qb9UsfVQ1Q3wZx3ZxiDm0rBf3DZ35
 gOuPJ0EscRwL2rspvmWFlGYHLW33FWlIHlZV8cdS0/XmtR+25UE/UQ5GyPd9ABGHz4iPEhHMGX2
 MJ6TH1eO3aTVHBkqlfpup4u7AUcKD
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr17464502wrs.277.1636716016584; 
 Fri, 12 Nov 2021 03:20:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRZk04ZGCnKLNWiV67ARgPbEGWSDJMmyv+P8H6xE/45f1PERWe8kHb9UZY6OXEDOoRDs0epQ==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr17464464wrs.277.1636716016338; 
 Fri, 12 Nov 2021 03:20:16 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q123sm10947423wma.30.2021.11.12.03.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 03:20:15 -0800 (PST)
Message-ID: <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
Date: Fri, 12 Nov 2021 12:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
 <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/21 11:57, Thomas Zimmermann wrote:

[snip]

>>>
>>> This is what HW-specific drivers want to query in their init/probing
>>> code. The actual semantics of this decision is hidden from the driver.
>>> It's also easier to read than the other name IMHO
>>
>> Ok, but what is a "native driver"? Or a "non-native driver"?
>> Is that established kernel terminology?
>>
>> I'd think a non-native driver is something that e.g. ndiswrapper is
>> loading. Is simpledrm like ndiswrapper in a sense? IIRC, simpledrm is
>> the driver that would not consult this function, right?
> 
> We use that term for hw-specific drivers. A 'non-native' driver would be 
> called generic or firmware driver.
> 
> My concern with the 'modeset' term is that it exposes an implementation 
> detail, which can mislead a driver to to the wrong thing: a HW-specifc 
> driver that disables it's modesetting functionality would pass the test 
> for (!modeset). But that's not what we want, we want to disable all of 
> the driver and not even load it.
> 
> How about we invert the test function and use something like
> 
>   bool drm_firmware_drivers_only()
>

That name I think is more self explanatory, so it works for me.

There was also another bikeshed about where to put the function declaration,
I added to <drm/drm_mode_config.h> but with that name I believe that should
be in <drm/drm_drv.h> instead.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

