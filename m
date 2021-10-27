Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E043CA72
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1F289D5E;
	Wed, 27 Oct 2021 13:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC73689D5E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635340752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0knKn4vlSSXJNLziODRiT1VCKABnqaDy5uuDBcVhuU=;
 b=ACYWRV2is3sKQnT+Apxu9Ykirc49Q3pv4FpzTDCjpxOWi922NU9x67kOomVb5N7om7fqiS
 XIS7bdrT15WDNkrEDdBykNMu/DMdNGSKYLFIM0pnI9Z+nongBStW5MUJFiYsABYH1RZ4us
 iJoXhAZhDVgRIJ7nZoYi2HZhb9HvB0Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-VhMEnCY9Nr-y3ut4ADd3JA-1; Wed, 27 Oct 2021 09:18:06 -0400
X-MC-Unique: VhMEnCY9Nr-y3ut4ADd3JA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d56c5000000b00168861c65f9so666744wrw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0knKn4vlSSXJNLziODRiT1VCKABnqaDy5uuDBcVhuU=;
 b=PD9DoiI+UFva28AYrUWI//9usKYsIClUZCiefKiV5XUw3CjfDkc9dfVZsrluI1lmpT
 MOsTlkXCNqbAojsBeZNBisIAgNABIvurqDL4Rd8ZvxWC7OivnjkFnS9nuJqeghNevPTw
 Xe+Z5Y3q4DM5CJ4FFhp/i5kH8l25S//zfcjV7d/wEwfuGM9TciCjKiXmJkPCy66d6w0H
 4pzVDkKOjbut8IIUP+WwdhSOwYGCXRSoU1Q9xnYcYCnYPI/695DYNRIo1wgk01I6buem
 f4funQ+kfID8//3YRo8+eGuIyhFiq5hYD5P66p2m9I07kv16vwAG/j5L/jQoXbTVX1pa
 jMmg==
X-Gm-Message-State: AOAM531nOV5YH2/pvcRCEaebqAz+Xo7TlsK9A2UtH2YWXCwKAZsvlsq8
 NOfgYuCb3+GLdfO+xCTNOFlnistTghqkQia1LLoOhB9QnUm0wO5q0Co+o53vZzLKR9SnLtwuqWL
 to21FttAUkeoPzWeMuxurJM8KGEO5
X-Received: by 2002:adf:f904:: with SMTP id b4mr40692303wrr.403.1635340685706; 
 Wed, 27 Oct 2021 06:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkN+ouoRwZcIXIo4nO3GPnaT6BwP+6Gy2W0VoJk+RIw7SPLg61t2NykMicE+Lxtab8AZLmqQ==
X-Received: by 2002:adf:f904:: with SMTP id b4mr40692273wrr.403.1635340685540; 
 Wed, 27 Oct 2021 06:18:05 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o1sm1872624wrp.95.2021.10.27.06.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:18:04 -0700 (PDT)
Message-ID: <76763f5e-8c37-c36a-8f64-af3efe0da254@redhat.com>
Date: Wed, 27 Oct 2021 15:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com> <87zgquhbjx.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87zgquhbjx.fsf@intel.com>
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

On 10/27/21 14:55, Jani Nikula wrote:

[snip]

>> Why the dependency has to be in a user-visible symbol? What could be the
>> problem with having something like:
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index cea777ae7fb9..f80b404946ca 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -82,6 +82,7 @@ config DRM_DEBUG_SELFTEST
>>  config DRM_KMS_HELPER
>>         tristate
>>         depends on DRM
>> +       depends on (DRM_FBDEV_EMULATION && FB) || !DRM_FBDEV_EMULATION
> 
> To me, this seems like the right solution. Depend on FB if
> DRM_FBDEV_EMULATION is enabled. That's exactly what the relationship is.
>

The problem as Arnd explained is that then this relationship will have to
be expressed in all the Kconfig symbols that select DRM_KMS_HELPER.

Otherwise the symbol will happily select the wrong state and even when a
warning is printed by Kconfig, it will just set an invalid configuration.

For example with CONFIG_FB=m (that led to the linker errors if the symbol
is also not CONFIG_DRM_KMS_HELPER=m) and CONFIG_SIMPLEDRM=y (that selects
CONFIG_DRM_KMS_HELPER), this would cause the following unmet dependencies:

$ make prepare modules_prepare
WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
  Depends on [m]: HAS_IOMEM [=y] && DRM [=y] && (DRM_FBDEV_EMULATION [=y] && FB [=m] || !DRM_FBDEV_EMULATION [=y])
  Selected by [y]:
  - DRM_SIMPLEDRM [=y] && HAS_IOMEM [=y] && DRM [=y]
  Selected by [m]:
  - DRM_I915 [=m] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y]
  - DRM_VIRTIO_GPU [=m] && HAS_IOMEM [=y] && DRM [=y] && VIRTIO_MENU [=y] && MMU [=y]

so CONFIG_DRM_KMS_HELPER will wrongly set to =y which will cause the issue.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

