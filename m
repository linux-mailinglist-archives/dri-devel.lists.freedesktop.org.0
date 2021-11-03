Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD744438A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 15:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4486EA4C;
	Wed,  3 Nov 2021 14:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A36EA4C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635949722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjCrBXWwYzBj3m1TWb42Da2qoJJrqcfHeMnXi0fhczc=;
 b=JEO54N/2JeTsd8Je6xkZd/llbhfshock+VC0XOwZlalKyT0Hnll6EJU4ucoccnqsrtabnG
 Wgxl5BA9TC/NvsnJUl3JkXzuKAksBz9xGqJ6XdFj9x3OzZnzJJkIR55XUGoGslDI0Ivo/P
 vAwaGGjw52+E34KHrvePZheXCz765Ck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-yrB_wKdbOYKKa_aRQzZQog-1; Wed, 03 Nov 2021 10:28:39 -0400
X-MC-Unique: yrB_wKdbOYKKa_aRQzZQog-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2837817wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 07:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wjCrBXWwYzBj3m1TWb42Da2qoJJrqcfHeMnXi0fhczc=;
 b=fCJqVNupQWqdiKAz3ntd5q5m2upEsxZYRsj+bWlxn8VlszOarCnczACOz+Kb6ye+ZR
 UBmqE8wa5Ux0rM4e/oi3RXLdjUFNaKv3Fn79KdrXpNC61yGPemzRAAWUwujXWQDmpYRs
 Tctmze5sKitWKbJu9n15p2fn9AnMB498K3jjm5nCmvF4pvRj5ppcQXAscQwUlZMGLstz
 0JJLwN5kMgsQ6QJUS5hjPPkSXFzUbkb0PY4B8fr3lWFqNDohQHgpaazowUb4NrQl8o8Y
 t6rp744G9Ut7TXrN54zKbzrdKoogsgJi4v5YmRomW2KvDj3MYIpziikOj0/yKtQ4qLgs
 KQeQ==
X-Gm-Message-State: AOAM533+rSQfEY7LFjmYCenb3w7bNeI2ZEKhF56JNMM8kDuPEwuvBVvB
 A6fw++9Bg4ZhblvYv2k03A8M9GfmC48M0mmRmg+LQppGvIxyRXy0PYMyAdCmhGOSY3d1SdjgIoI
 1kEGW2bCDYvu4ltxaCE2wMiUCxDCy
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr21502536wrs.270.1635949718082; 
 Wed, 03 Nov 2021 07:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygbrJwATC2G/bV3PqN0MYXRcgYe3aBtB674/ombGZ2HxFPH0E2H3yEXKRBe/gbkyWGcW/pQQ==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr21502482wrs.270.1635949717828; 
 Wed, 03 Nov 2021 07:28:37 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z8sm2163734wrh.54.2021.11.03.07.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 07:28:37 -0700 (PDT)
Message-ID: <5b4e4534-4786-d231-e331-78fdb5d8496a@redhat.com>
Date: Wed, 3 Nov 2021 15:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RESEND PATCH 3/5] drm: Rename vgacon_text_force() function to
 drm_modeset_disabled()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-4-javierm@redhat.com>
 <eddc2967-8355-b64a-79d8-6c1cda1bc732@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <eddc2967-8355-b64a-79d8-6c1cda1bc732@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Neal Gompa <ngompa13@gmail.com>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Peter Robinson <pbrobinson@gmail.com>, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/21 13:57, Thomas Zimmermann wrote:

[snip]

>>   
>> -	if (vgacon_text_force()) {
>> +	if (drm_modeset_disabled()) {
>>   		DRM_ERROR("amdgpu kernel modesetting disabled.\n");
> 
> Please remove all such error messages from drivers. 
> drm_modeset_disabled() should print a unified message instead.
>

Agreed.

>> -static bool vgacon_text_mode_force;
>> +static bool drm_nomodeset;
>>   
>> -bool vgacon_text_force(void)
>> +bool drm_modeset_disabled(void)
> 
> I suggest to rename this function to drm_check_modeset() and have it 
> return a negative errno code on failure. This gives maximum flexibility 
> and reduces errors in drivers. Right now the drivers return something 
> like -EINVAL, which seems wrong. Returning -ENODEV seems more appropriate.
>

Good idea. I'll do it in v2 as well.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

