Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE58519E12
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C7A10F66A;
	Wed,  4 May 2022 11:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C240D10F7A0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651663960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSmRyvY5USUJK4bqOwkMxhLEWYFefLvLLVRpwsW24V4=;
 b=JKhqgmAztVTPamoAqkHcjBpDzjHX1qT0odi3JFJ5jb1+fkz5vxb/5TzYPc3gsuobuDHccD
 r7X3+LKSh904KvAkKpAlbqjYjaVvQ+ymBflmIq4+LwFuijVJhsI6st0Oh74lJpD8T4GG+J
 838FURjc1xFUZNKxLoSI4YEQLWzeo98=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-rxRDOOQ6OvWFIpSQ4KTZ7g-1; Wed, 04 May 2022 07:32:39 -0400
X-MC-Unique: rxRDOOQ6OvWFIpSQ4KTZ7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 d28-20020adf9b9c000000b0020ad4a50e14so278313wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xSmRyvY5USUJK4bqOwkMxhLEWYFefLvLLVRpwsW24V4=;
 b=aWhQfTEABXa1AxGo4k1fFS8rdzs/HDrmxfzscdBP8QvmZd/py5uA6utZfU0NHDHQmz
 9q2zqyCCu9IWxnpR7VktggyksUYjnxk5Br5uTcXFgIg/NqWVCP6hjLmRDRJHpwMSeHoo
 ae268ONV3yhVFHUg0zstWekkj7yNcxUy0QM/88NZzO4eyJMpH4zCv/MTN6S5rA2iMY0P
 vX03Rez5N5vYeZ/+o5ze+lpzyUOZNpSLTe12SFwKZz1CiPIRI3saHABwDwyJ8u4FbocY
 lOqTRE1DJrB4vMc1b6Nj1FLQMcYq2i37eSZc37lAQZ3AAaujBpi1ytYulnVFJVXmQOt+
 AKuQ==
X-Gm-Message-State: AOAM533p4iT8BW9xVjuVVrIFObC11azhOD1XwoEaz6THC2e5/qvY+wJ2
 QgqRcZYIj7tswZQYYQVxTn5mcLVK6xV0Q3V1vr8ZeC5hvL4mhByrMKIkm4engOSiitaHn8L78iC
 uqvc0iLDzh82v+RA7oyFyZCkCaSf2
X-Received: by 2002:a7b:ce08:0:b0:394:32df:2ae6 with SMTP id
 m8-20020a7bce08000000b0039432df2ae6mr7189957wmc.184.1651663958432; 
 Wed, 04 May 2022 04:32:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA5wXaWnN+rrsK5flhGj5h/2tfXvIEclG8Wrk1xlOuCGc80m9A3smlCSu4+D4IoWK24dOV7Q==
X-Received: by 2002:a7b:ce08:0:b0:394:32df:2ae6 with SMTP id
 m8-20020a7bce08000000b0039432df2ae6mr7189946wmc.184.1651663958176; 
 Wed, 04 May 2022 04:32:38 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b0039429bfebeasm4958174wms.2.2022.05.04.04.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:32:37 -0700 (PDT)
Message-ID: <bfb03d40-a023-12a9-9554-1b6e6c474134@redhat.com>
Date: Wed, 4 May 2022 13:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
To: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-4-javierm@redhat.com>
 <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 12:58, Daniel Vetter wrote:
> On Tue, May 03, 2022 at 09:15:40AM +0200, Javier Martinez Canillas wrote:
>> Indicate to fbdev subsystem that the registered framebuffer is provided by
>> the system firmware, so that it can handle accordingly. For example, would
>> unregister the FB devices if asked to remove the conflicting framebuffers.
>>
>> Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
>> Drivers can use this to indicate the FB helper initialization that the FB
>> registered is provided by the firmware, so it can be configured as such.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>
>> Changes in v3:
>> - Drop the firmware local variable (Laurent Pinchart).
>> - Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).
> 
> Just for the record what I brought up on irc already:
> 
> FBINFO_MISC_FIRMWARE is purely an internal flag with no uapi impact, and
> it's only to control whether we nuke this from
> remove_conflicting_framebuffer or not. Since simpledrm only ever binds
> against sysfb I think it'd be cleaner to only rely on that, and relegate

That's not actually true. The OF subsystem also registers "simple-framebuffer"
devices when there are Device Tree nodes that contain a "simple-framebuffer"
compatible string. In that case these pdev will also bind against simpledrm.

> that entire FBINFO_MISC_FIRMWARE misc hack to the fbdev dungeons and let
> it quietly wither away there.
>
> Also I'm not a huge fan of these midlayer flags in general :-)

And while I agree with you that these midlayer flags are horrible, that is
what any other fbdev that makes use of a firmware-provided framebuffer set,
so simpledrm emulated fbdev shouldn't be the exception IMO.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

