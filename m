Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9296CD7C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 12:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FDD10EA75;
	Wed, 29 Mar 2023 10:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1134010EA6C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680086047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
 b=Mp7hpPX83tgRDF3FNYBrtpQB7k7LvxQqaL2LYSJXa9+tAUBoT0fWNkJwu3JOu9GqYRrk2Q
 fj7A2AOF4o/cNxx2rDGiwh/K4ghNe32bBADaN6FsZ290RkTVcUsFgRJx0LRRthDMr0Rgo4
 T5OK8ldjlqj1NLa2w6w3b0SwSJ8umfA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-qo7TjUWTN0OOk055ObEhJA-1; Wed, 29 Mar 2023 06:34:05 -0400
X-MC-Unique: qo7TjUWTN0OOk055ObEhJA-1
Received: by mail-ed1-f70.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso21542024edi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680086045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
 b=PPyPI9zrFE8FkJuEiGhN66V1VjPCpg/kKIi7BS++9L4K2TAMKwxrO6/1xWRGPAmGuS
 dCL7YwJ5w334fQFABTjLfjW88vA6G6JfM/vOS5weES68ZLZk/MFTWHRUaL6YI8y7kxVx
 xjbYEJcbHhcuWWFcinyC1U0DPj2pQf+ED1f6IBSF2Xr8Xto+tips6mo+14DTXkwCeKBx
 0UK/Tw4jsHXEurIR91zwyNSVbkONHEK+UuTeHYct4UW2cmlEu9uLg2SpQylKVworX20Z
 NjMsasKOvzpi8+GrezFs2S2nfd4W1AbJ2CBzOAMoyjunQQAkpnXtf9Jnf3ekJGVM9z9n
 kkIw==
X-Gm-Message-State: AAQBX9f+tiJat5JmfvWHn3CCYNtrAqabn2Cm9HBmXulQenexYqPPF44U
 e0EVDFKTZKdvGfKUBtjTGEHlXYUgLlCNsS3IGhMgy2oO7pM+fAsMUIbkPPSgmPtc2Np8iKOmtf2
 Z1fRLVyaENFHw3rRinfy0KhfsyvZJ
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id
 y18-20020a170906449200b00931d27778a4mr19509523ejo.30.1680086044859; 
 Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z57CBpiseFMIgnGNryXrCZSYDx0tr+2VtzalweO0jAD5KLEw2kHf2+a73sKHZ56RkovxiFYw==
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id
 y18-20020a170906449200b00931d27778a4mr19509506ejo.30.1680086044568; 
 Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 rk28-20020a170907215c00b00933b38505f9sm13763006ejb.152.2023.03.29.03.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 03:34:03 -0700 (PDT)
Message-ID: <5a6150d9-3410-b453-b4f2-c25b85d9a4d2@redhat.com>
Date: Wed, 29 Mar 2023 12:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6.2 regression fix] drm/nouveau/kms: Fix backlight
 registration
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>
References: <20230326205433.36485-1-hdegoede@redhat.com>
 <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Mark Pearson <mpearson@lenovo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/29/23 00:23, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> (Also note to Mark: this is my way of letting you know someone fixed the
> regression with backlight controls upstream, looking into the weird bright
> screen after resume issue)

Thanks.

I have pushed this to drm-misc-fixes now.

I'll also submit a downstream Fedora kernel pull-req with this
to get this resolved in the Fedora kernels .

Regards,

Hans



> 
> On Sun, 2023-03-26 at 22:54 +0200, Hans de Goede wrote:
>> The nouveau code used to call drm_fb_helper_initial_config() from
>> nouveau_fbcon_init() before calling drm_dev_register(). This would
>> probe all connectors so that drm_connector->status could be used during
>> backlight registration which runs from nouveau_connector_late_register().
>>
>> After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> the fbdev emulation code, which now is a drm-client, can only run after
>> drm_dev_register(). So during backlight registration the connectors are
>> not probed yet and the drm_connector->status == connected check in
>> nv50_backlight_init() would now always fail.
>>
>> Replace the drm_connector->status == connected check with
>> a drm_helper_probe_detect() == connected check to fix nv_backlight
>> no longer getting registered because of this.
>>
>> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index 40409a29f5b6..91b5ecc57538 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -33,6 +33,7 @@
>>  #include <linux/apple-gmux.h>
>>  #include <linux/backlight.h>
>>  #include <linux/idr.h>
>> +#include <drm/drm_probe_helper.h>
>>  
>>  #include "nouveau_drv.h"
>>  #include "nouveau_reg.h"
>> @@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>>  	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>>  	struct nvif_object *device = &drm->client.device.object;
>>  
>> +	/*
>> +	 * Note when this runs the connectors have not been probed yet,
>> +	 * so nv_conn->base.status is not set yet.
>> +	 */
>>  	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
>> -	    nv_conn->base.status != connector_status_connected)
>> +	    drm_helper_probe_detect(&nv_conn->base, NULL, false) != connector_status_connected)
>>  		return -ENODEV;
>>  
>>  	if (nv_conn->type == DCB_CONNECTOR_eDP) {
> 

