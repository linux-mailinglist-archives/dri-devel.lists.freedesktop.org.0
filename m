Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922AABB5D64
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 04:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4703310E07B;
	Fri,  3 Oct 2025 02:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAvgggcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D603510E07B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 02:55:40 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3306eb96da1so1499722a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 19:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759460140; x=1760064940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3XzN1IX0x1HKKD8cWvxUYr0p4ZQjvWytXA8ADa16YOw=;
 b=JAvgggcJxXyvoeEyNDymoDS02XWBHjRQ0MzE6uOKOxJGbzmXBzRlnBq7zZeKQ6l/Mu
 oZvxmzJMHkkxWynnldU8PPYC+fgBbtQy5jz3iXBlscn1IatxZgJe/mrqRzoNN6+Io2S4
 LyzdyzElB265VN8pNbOCMX1OxShQpsE5sNrTp04Dt9cMSgCpMmBAkLOYc9AETRk7WOCg
 o2YsZGcckL7kaOQkGxi9ABluQzKqjT7GSfuPJyRWuBms7jiXw+fYV8qQVFj/F/lf2Zpv
 zb1OFBwvQHJgG1boYL2ZVkbRUGOSk8W+ZE+Hy9iC5xpmMy779iEkvdudw9sFa0xohLVD
 h7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759460140; x=1760064940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3XzN1IX0x1HKKD8cWvxUYr0p4ZQjvWytXA8ADa16YOw=;
 b=teonwrdMzvPexclcafIoMAeP1zIVTxLXawYlppfYu/LZnAG+jMp37QWQwCZt01XWS0
 g7gnCPNLxD3kdng1KVvhnY7+IqRz1TIG0j0PloYZ+evz5HWDJAJ3NF1/7Uuj0msuN/qD
 pbcTfAg/DGy9ReNG4iY6PFIEIyaJpUqjO+i1WMsM2aUBTLj4uJpJZ4Gnm+hi30cDxlYC
 uH9yc8NhTmr2Q8I59Uns0UEx5SY7Rgxa4jh/CNc27wrPI2ZXxFIgJP1NL24yKJ9pRogt
 tDOLxArR1/bV59TDBym0WjfE35IX/GZMjqcZInjpMGWVp9QqPtpVCnYgbLXSfjck0oGW
 eq2A==
X-Gm-Message-State: AOJu0YxYraMvkO3Xedm7QQZZxTZ3UHEU4KHaHftYly9ucbsG2NGJpou3
 Rv/yybFqHJu+KY5xE5OY0RMcOIGThjNPgyUctQ5vJvMQqc6/N8SQZWe3
X-Gm-Gg: ASbGncuRhhApwefXxqCDkDirIxnDHEtjfdxumcx/RaXre1+ykDBiJj0C0hi9aDUcq42
 S4w7Pf/1pJ1h5/CVgSPa6Oe1+DZ5FfGwoc5JONN406Yul2Y+WvO0eK0XH6CVCXu0gTPE7KCvTID
 QFAvwsiOeeZ9IAN10ZUM0mlvYUhO+l+nWAQm6jXZNW65Uau7FJp9AtwB0rTe/F/+i2qGQXdS8d1
 B6zijnrlyEfAz0PIYHw2ogt0KH+s3yvWJe4GKdjUdWeDIGEkwC+ESVHQOWZKCnwSiVdPMaPYbPS
 cXCLboBJ4VoMdAurvHnZx/e1Xzndj50QHVgYPPqL9Z4DWXkxQaJkWSrOoOiDGalzh4hLOTGC4TV
 fbrK7P6silmMD2xwhOB299rYM+/gA7IxG+CaEYsohOUMShsHn3rwm2SlxZMsMSaJlIt6Fr5sEaH
 XJRITf+HlwQzMe1dFc+efH/4enUB6Mpjk=
X-Google-Smtp-Source: AGHT+IFP8YizIsbAVUU/5CgNa3JJSdLizH9cuCkzMxNk2L537QkrRDpx7uF1m2EXsw4kfsouEeK6vg==
X-Received: by 2002:a17:90b:390f:b0:336:b60f:3935 with SMTP id
 98e67ed59e1d1-339c27db5a8mr1874281a91.23.1759460140125; 
 Thu, 02 Oct 2025 19:55:40 -0700 (PDT)
Received: from ?IPV6:2601:1c0:5780:9200:326a:8939:a05c:b9d5?
 ([2601:1c0:5780:9200:326a:8939:a05c:b9d5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339a701bf31sm6353140a91.19.2025.10.02.19.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 19:55:39 -0700 (PDT)
Message-ID: <f76cee52-1230-4cd5-b6c2-9cf4f0823228@gmail.com>
Date: Thu, 2 Oct 2025 19:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vblank: downgrade vblank wait timeout from WARN to
 debug
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251002025723.9430-1-chintanlike@gmail.com>
 <840dfd6f-3417-4667-a808-70d3d3f331c0@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <840dfd6f-3417-4667-a808-70d3d3f331c0@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/1/25 23:34, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.10.25 um 04:57 schrieb Chintan Patel:
>> When wait_event_timeout() in drm_wait_one_vblank() times out, the
>> current WARN can cause unnecessary kernel panics in environments
>> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
>> under scheduler pressure or from invalid userspace calls, so they are
>> not always a kernel bug.
>>
>> Replace the WARN with drm_dbg_kms() messages that provide useful
>> context (last and current vblank counters) without crashing the
>> system. Developers can still enable drm.debug to diagnose genuine
>> problems.
>>
>> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
>> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> 
> There should be no empty lines among those tags
> 
>>
>> v2:
>>   - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>>   - Remove else branch, only log timeout case
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d..a94570668cba 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1289,7 +1289,7 @@ void drm_wait_one_vblank(struct drm_device *dev, 
>> unsigned int pipe)
>>   {
>>       struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>       int ret;
>> -    u64 last;
>> +    u64 last, curr;
>>       if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>           return;
>> @@ -1305,7 +1305,12 @@ void drm_wait_one_vblank(struct drm_device 
>> *dev, unsigned int pipe)
>>                    last != drm_vblank_count(dev, pipe),
>>                    msecs_to_jiffies(100));
>> -    drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
>> +    curr = drm_vblank_count(dev, pipe);
> 
> Please don't call drm_vblank_count() here. It's not necessary for 
> regular operation. Simply keep the debug message as-is.
> 
>> +
>> +    if (ret == 0) {
> 
> "if (!ret)" is the preferred style.
> 
>> +        drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, 
>> curr=%llu\n",
>> +            pipe, last, curr);
> 
> Aligning the pipe argument with dev from the previous line is the 
> preferred style.
> 

Hi Thomas,

Thank you for your review and helpful suggestions.
I’ll drop the unnecessary comment and remove the else branch as you 
recommended.

I’ll send a v3 with these changes.

Best regards,
Chintan

