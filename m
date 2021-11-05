Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B459644682B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 18:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0446EC56;
	Fri,  5 Nov 2021 17:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243389CF1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636134658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUUyprJIxK9flb6ZNHg9WUoiRAuv+406L4BdTMGJQc=;
 b=DfOvs+0qr2xPy9p1fAgDiwNdaljgIicWdUv1D3+nCVo8SlckBspruIECh6VUS2whtL9LTj
 v6ufnbOXmLET43J2Shyll1O4YQkO+hlTLxR9j6D9Ob5Mjs3zPOFbILtd1vie3/ztYxiuAO
 wdCe5iN9g8p0sRnS3CRVpPgxG+19vxA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-NnTvNtGzP1-BD7962Sqx5w-1; Fri, 05 Nov 2021 13:50:57 -0400
X-MC-Unique: NnTvNtGzP1-BD7962Sqx5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so886992wmg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 10:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=5EUUyprJIxK9flb6ZNHg9WUoiRAuv+406L4BdTMGJQc=;
 b=6jdpbjaR0nhFx+nTnbZw/wdjHRyOt1GJwPFuZAKtRNXnLHIaXhT4FCNfD15wM9KPDw
 RmGwx77M0/QRImV/JVhXL6xYzIlXsgQcvkCFbWviBtASMKZB7e5sWBchv+UNLJQhEvnR
 k08Cu5L0NKfWOcSE75KbFVrNt3AMJUUA36SBuJWOByLV3gZchHhQO9UDuVQJxCnuOBSf
 rHIRuxefVxwSqVOwtqOyk/8JmRJpEEbHiTY4gbq1DPC9dvqD7JaK16nqXJhO+MWbdjT6
 2ef+ubqN8PMqHzg9978CAqMz3dFVKa1Y/qzW9iqFvmVskszLEtMJMhW2H3p+i2/mbC6K
 Ua7g==
X-Gm-Message-State: AOAM530IY4ZleBXCSu6qcci4QG3t1t9SfOs5PI5GVF3pXwr3zf/q3I0e
 B+hPdVGj9N19LGIk0XFAOx+4TFGIKpaS8qO823wYlDZ8Carc7oWcOaCGMz/fRYmmwMHMFKYzqBY
 gm9n3OLxtW8sHeuktmaZ/3sABM6M3hB0Zn+VT8TSeXE0lKfPv8ene654yeWWQCkvQFYp3A0c4Vb
 W9t27w
X-Received: by 2002:a7b:c102:: with SMTP id w2mr30683032wmi.151.1636134655636; 
 Fri, 05 Nov 2021 10:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc83CI+TNXXqI6W87vVY2zwMpAb+GA2pXpZcEiKwYSaFdyfwEKDyBp2EsBTS+fBMzAqNjCCw==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr30682996wmi.151.1636134655284; 
 Fri, 05 Nov 2021 10:50:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:cb60:a1c5:8a09:190d?
 ([2a01:e0a:c:37e0:cb60:a1c5:8a09:190d])
 by smtp.gmail.com with ESMTPSA id u16sm11145269wmc.21.2021.11.05.10.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 10:50:54 -0700 (PDT)
Message-ID: <556c4587-3105-72ae-49bc-64855aba1554@redhat.com>
Date: Fri, 5 Nov 2021 18:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/fb-helper: Fix restore_fbdev when there are pending
 delayed hotplug
To: dri-devel@lists.freedesktop.org
References: <20211104163245.11070-1-jfalempe@redhat.com>
 <bbb313b2-6eab-33d2-b355-bdcba59231c9@daenzer.net>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <bbb313b2-6eab-33d2-b355-bdcba59231c9@daenzer.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: michel@daenze.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2021 16:50, Michel Dänzer wrote:
> On 2021-11-04 17:32, Jocelyn Falempe wrote:
>> When using Xorg/Logind and an external monitor connected with an MST dock.
>> After disconnecting the external monitor, switching to VT may not work,
>> the (internal) monitor sill display Xorg, and you can't see what you are
>> typing in the VT.
>>
>> This is related to commit e2809c7db818df6bbd0edf843e1beb2fbc9d8541 which
>> introduced delayed hotplug for MST, and commit
>> dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320 which introduced a workaround for
>> Xorg and logind, and add a force parameter to
>> __drm_fb_helper_restore_fbdev_mode_unlocked() in this case.
>>
>> When switching to VT, with Xorg and logind, if there
>> are pending hotplug event (like MST unplugged), the hotplug path
>> may not be fulfilled, because logind may drop the master a bit later.
>> It leads to the console not showing up on the monitor.
>>
>> So in this case, forward the "force" parameter to the hotplug event,
>> and ignore if there is a drm master in this case.
> 
> I'm worried that this leaves a race condition which allows the still-master (which causes drm_fb_helper_hotplug_event to bail without this patch) to modify the state set by __drm_fb_helper_hotplug_event, which could still result in similar symptoms.
> 
> I wonder if something like calling drm_fb_helper_hotplug_event when master is dropped and fb_helper->delayed_hotplug == true could work instead.
> 

Ok, I will try to make a new patch and call 
drm_fb_helper_hotplug_event() from drm_drop_master() instead.
> 
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 8e7a124d6c5a..c07080f661b1 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -82,6 +82,8 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
>>   static LIST_HEAD(kernel_fb_helper_list);
>>   static DEFINE_MUTEX(kernel_fb_helper_lock);
>>   
>> +static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force);
>> +
>>   /**
>>    * DOC: fbdev helpers
>>    *
>> @@ -258,7 +260,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>>   	mutex_unlock(&fb_helper->lock);
>>   
>>   	if (do_delayed)
>> -		drm_fb_helper_hotplug_event(fb_helper);
>> +		__drm_fb_helper_hotplug_event(fb_helper, force);
>>   
>>   	return ret;
>>   }
>> @@ -1930,6 +1932,38 @@ int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
>>   }
>>   EXPORT_SYMBOL(drm_fb_helper_initial_config);
>>   
>> +static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force)
>> +{
>> +	int err = 0;
>> +
>> +	if (!drm_fbdev_emulation || !fb_helper)
>> +		return 0;
>> +
>> +	mutex_lock(&fb_helper->lock);
>> +	if (fb_helper->deferred_setup) {
>> +		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
>> +				fb_helper->preferred_bpp);
>> +		return err;
>> +	}
>> +	if (!force) {
>> +		if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
>> +			fb_helper->delayed_hotplug = true;
>> +			mutex_unlock(&fb_helper->lock);
>> +			return err;
>> +		}
>> +		drm_master_internal_release(fb_helper->dev);
>> +	}
>> +	drm_dbg_kms(fb_helper->dev, "\n");
>> +
>> +	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
>> +	drm_setup_crtcs_fb(fb_helper);
>> +	mutex_unlock(&fb_helper->lock);
>> +
>> +	drm_fb_helper_set_par(fb_helper->fbdev);
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * drm_fb_helper_hotplug_event - respond to a hotplug notification by
>>    *                               probing all the outputs attached to the fb
>> @@ -1953,35 +1987,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
>>    */
>>   int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>>   {
>> -	int err = 0;
>> -
>> -	if (!drm_fbdev_emulation || !fb_helper)
>> -		return 0;
>> -
>> -	mutex_lock(&fb_helper->lock);
>> -	if (fb_helper->deferred_setup) {
>> -		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
>> -				fb_helper->preferred_bpp);
>> -		return err;
>> -	}
>> -
>> -	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
>> -		fb_helper->delayed_hotplug = true;
>> -		mutex_unlock(&fb_helper->lock);
>> -		return err;
>> -	}
>> -
>> -	drm_master_internal_release(fb_helper->dev);
>> -
>> -	drm_dbg_kms(fb_helper->dev, "\n");
>> -
>> -	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
>> -	drm_setup_crtcs_fb(fb_helper);
>> -	mutex_unlock(&fb_helper->lock);
>> -
>> -	drm_fb_helper_set_par(fb_helper->fbdev);
>> -
>> -	return 0;
>> +	return __drm_fb_helper_hotplug_event(fb_helper, false);
>>   }
>>   EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>>   
>>
> 
> 

