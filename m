Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F74D2DEC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F76810E4C2;
	Wed,  9 Mar 2022 11:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554410E4C7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646825137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv7i2LTWDtTJ8HHIxm54uV0Jv8Qi32GxQRPuHkearAM=;
 b=f2lR9foSveSpnMTDvocmhDpv0KRjyB6uLirf80wTHMqdsnkofgwxu0rKnRdeOyj4BtAk51
 kDwweRjtC524MFel7MPx0l2R2DfcVl2aB4o1ZnO8uLHgyJ2nrDCNCYprVYJ10it3mNxZ0S
 kIbJRAzOsDk45+/+/PIqeVz8SYQTDuk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-9rU4LrVAOEyfYKNzhfNyKA-1; Wed, 09 Mar 2022 06:25:36 -0500
X-MC-Unique: 9rU4LrVAOEyfYKNzhfNyKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so653990wrg.20
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 03:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wv7i2LTWDtTJ8HHIxm54uV0Jv8Qi32GxQRPuHkearAM=;
 b=hxfJcxETPrmpD8LkyqunF7Y/IRvWhvalphBtDiQSd35gewq2XQLf+iftBbj22XISyv
 sussLChtvbC+BZybUzIPAJQ38dUgDj3o/eFihxVbHoMmuyBelVXkEjk+TeSTbwSswzkT
 Dcsm7lPXm1I0qYfJ4Jm9M0EuetlsK9dQeJSGnQfGBO10WO3b6G1/E0Gh/bZtoKuYWakM
 3VbNYpsq2wngJ5KR2757dEzM1D72fC0S8pqSBBqvJKTGxyfLiNi6RdE4DYZq7sLVPNCv
 b6vJP7VDtk42f3+BVbi+PcipQnOMgRjHS68wy7zahpjPIhDBlrU7bKXe99+CMdG0OxrX
 44Ig==
X-Gm-Message-State: AOAM532lG9ivqznNjpx3drS3knoz5t4zO9hJDUSDZFL8BuydjoZvEe1H
 QX8bNbw9E6OUu2MrRGME+H7vugQ0fsr8vc07pjqweD/mgvjN1m9VFWq4xWotyvyJAp0rKV7/D/b
 OhZxtPQYUPfNVKhYcuxjXXEJfdTbu
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr15810536wrb.270.1646825135092; 
 Wed, 09 Mar 2022 03:25:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoTR3O7+oa02BuvxQ4coJ0ARpskt+/K+SxVoB3j1kHuRf5zct/QHm81A+/YYgNn/NIZBrRHQ==
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr15810518wrb.270.1646825134853; 
 Wed, 09 Mar 2022 03:25:34 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adff14c000000b001f04d1959easm1414831wro.13.2022.03.09.03.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 03:25:34 -0800 (PST)
Message-ID: <c3513c35-57a3-64e1-b3a6-0878cc61af6a@redhat.com>
Date: Wed, 9 Mar 2022 12:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/9] drm/gem-shmem: Implement fbdev dumb buffer and mmap
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-9-tzimmermann@suse.de>
 <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>
 <22b9e772-8823-0af1-037a-621844e7c810@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <22b9e772-8823-0af1-037a-621844e7c810@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/22 09:47, Thomas Zimmermann wrote:

[snip]

>>>   
>>> +static const struct drm_gem_object_funcs drm_gem_shmem_funcs_fbdev = {
>>> +	.free = drm_gem_shmem_object_free,
>>> +	.print_info = drm_gem_shmem_object_print_info,
>>> +	.pin = drm_gem_shmem_object_pin,
>>> +	.unpin = drm_gem_shmem_object_unpin,
>>> +	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>>> +	.vmap = drm_gem_shmem_object_vmap,
>>> +	.vunmap = drm_gem_shmem_object_vunmap,
>>> +	.mmap = drm_gem_shmem_object_mmap_fbdev,
>>> +	.vm_ops = &drm_gem_shmem_vm_ops_fbdev,
>>
>> The drm_gem_shmem_funcs_fbdev is the same than drm_gem_shmem_funcs but
>> .mmap and .vm_ops callbacks. Maybe adding a macro to declare these two
>> struct drm_gem_object_funcs could make easier to maintain it long term ?
> 
> I see you point, but I'm undecided about this. Such macros also add some 
> amount of obfuscation. I'm not sure if it's worth it for an internal 
> constant. And since the fbdev buffer is never exported, we could remove 
> some of the callbacks. AFAICT we never call pin, unpin or get_sg_table.
>

Yeah, that's true too. It was just a suggestion, I'm OK with patch as is.
 
> Best regards
> Thomas
> 
>>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

