Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC72A523B4A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFB411235B;
	Wed, 11 May 2022 17:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA58A11235B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:17:34 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e656032735so3666325fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=6KyyMkeo+AlJ0nOsy4nLJ1EEoBetcYQI533KSovi9IQ=;
 b=dqHlKdpugl+Lt+eshvhbrTej6F20MWqj4mrStBx72ebHKnocMaiudq80COa4hILLwu
 w/d+K0syWHZgajRyt7DlYED6M1B1nw37ql3s2sRPfJ64eDweK7OGG9uk4TgqWazhKWQK
 IG27Aee4rt/8VZpRSd/EhpQhTwpWJg1wd3Y9vjkVccsf1PBM8o+NWcKoosMT1UrmVhtm
 wx7ZAW212rJ6tl84HSUcrFCbtwqIPe0q4duIKxagafA8pQnfUcqXtiR9gws8g+4hJ5w+
 MctGYYbiI+Y+7DLR32NWAdj0ywJ4RtDuuZ0vh9OBHRl3YPfmAMhnsNuCCv0xoHrPY1G7
 pGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=6KyyMkeo+AlJ0nOsy4nLJ1EEoBetcYQI533KSovi9IQ=;
 b=2QaTF2ctBQTnONWFKEujzMQkYqsSld8YbnCDzyIQcMbgF/5TdFDTJHgIFFhqpjn7eU
 lF49XYQZ2/zO/NTPvlMyqE4H7yo6gQ0EDO71zkzfvJxOA2gdcM6qAdgXZKN9xaDrvTFA
 OAFFA01eY/3ia1ynVfIDs8pEcbpSfDRPTWCGFQQFlz37nVXWN47IF8VE3ArS9cUoQwhJ
 AETR7HRWHQHJ2Sis6GwgzT9+UMtum5byQOG/1VbqYucuTeiseJUlv4BCjYz+GUDGOLZK
 XXJurLeuvEEWEvL5oAm7hYPGTaog5W7dKqmUrBQFAu9G6UqyjwDp2X39eF9Nwz+5PPvD
 YFqw==
X-Gm-Message-State: AOAM532SpXIJ+g5mHeftG9TUJkwIgAyLtyf0+eH99nch41KfvGTUg/Zn
 RMGxNWM5LKsXCWxu42wv/HQ=
X-Google-Smtp-Source: ABdhPJxR6N0xVPBDvw47sZ2LDM5btOtf+0ie7Vjo27VUnR+DXIE9tDW6vaoMtPS6MoeLN7FLvAa+8w==
X-Received: by 2002:a05:6870:1781:b0:e2:f30d:3a6c with SMTP id
 r1-20020a056870178100b000e2f30d3a6cmr3288738oae.142.1652289454084; 
 Wed, 11 May 2022 10:17:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p132-20020aca5b8a000000b00325cda1ff9fsm946219oib.30.2022.05.11.10.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:17:33 -0700 (PDT)
Message-ID: <8c84428c-2740-4046-74c9-298b854944d0@roeck-us.net>
Date: Wed, 11 May 2022 10:17:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113230.1252910-1-javierm@redhat.com> <YnvrxICnisXU6I1y@ravnborg.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
In-Reply-To: <YnvrxICnisXU6I1y@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 10:00, Sam Ravnborg wrote:
> Hi Javier.
> 
> On Wed, May 11, 2022 at 01:32:30PM +0200, Javier Martinez Canillas wrote:
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Well except when the olpc dcon fbdev driver is enabled, that thing
>> digs around in there in rather unfixable ways.
>>
>> Cc oldc_dcon maintainers as fyi.
> 
> Another way to fix this is to mark FB_OLPC_DCON and add a TODO entry to
> fix this. We are really not supposed to carry such special code around
> to keep staging working.
> 
> I know this may not be a popular viewpoint, but just look at the ugly
> workarounds required here.
> 
> 	Sam
> 
> 
>>
>> v2: I typoed the config name (0day)
>>
>> Cc: kernel test robot <lkp@intel.com>
>> Cc: Jens Frederich <jfrederich@gmail.com>
>> Cc: Jon Nettleton <jon.nettleton@gmail.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-staging@lists.linux.dev
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
>> Cc: Zhen Lei <thunder.leizhen@huawei.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: Zheyu Ma <zheyuma97@gmail.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/video/fbdev/core/fbmem.c | 8 ++++++--
>>   include/linux/fb.h               | 7 +++----
>>   2 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>> index 265efa189bcc..6cab5f4c1fb3 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -50,10 +50,14 @@
>>   static DEFINE_MUTEX(registration_lock);
>>   
>>   struct fb_info *registered_fb[FB_MAX] __read_mostly;
>> -EXPORT_SYMBOL(registered_fb);
>> -
>>   int num_registered_fb __read_mostly;
>> +#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
>> +EXPORT_SYMBOL(registered_fb);
>>   EXPORT_SYMBOL(num_registered_fb);
>> +#endif
> 
> It is stuff like this I refer to as "ugly" in the comment above.
> 

My "solution" for that kind of thing is to use a namespace,
such as

EXPORT_SYMBOL_NS(registered_fb, FB_OLPC_DCON);
EXPORT_SYMBOL_NS(num_registered_fb, FB_OLPC_DCON);

and import it from the offending code. That avoids ifdefs
while at the same time limiting the use of the symbols
to the expected scope. Of course that could be abused but
that abuse would be obvious.

Guenter
