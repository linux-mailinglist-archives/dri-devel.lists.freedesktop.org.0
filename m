Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E546B4F804C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D9510EA95;
	Thu,  7 Apr 2022 13:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8364610EABB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649337412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbRblRxq/SE2km/rkmjkdSJvts57gYuZ3JZvtprFnTs=;
 b=EgH0WdLqZCJ6UQnvEwLUSU7YKr4zUWq2cnKNit5ghhI5tVeTWJvrZIzWjwX1MVJ0EStlz/
 BgAgdsxlepfTCPGBwG1gY63mMXE0Co4cepTBDWo7uOoN7lgzcRqrYRNhmnlFi/C9GifhKE
 SA1Giz8n75iRCVa80UdowboMy8FTIHk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-FYflzqcxPzKSH7EUEUdAxQ-1; Thu, 07 Apr 2022 09:16:51 -0400
X-MC-Unique: FYflzqcxPzKSH7EUEUdAxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i6-20020a05600c354600b0038be262d9d9so4559337wmq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vbRblRxq/SE2km/rkmjkdSJvts57gYuZ3JZvtprFnTs=;
 b=MidKreojVz0j81MydKNYAXx02+4kAJZgieljXElooxUvgOr5Q9Zb4MwF3uCt+2rpVZ
 ZWarDR/Y+8BpxmBEfxleyfWezCc+QaHqfKuBHdfQlcVcQSMghYkdqu74KnNPiA3dcKqc
 vxQTXW1EFkcIJn450TjjyTbuBboP7WY9qqy5xhm4a0PBFHFqiYu4HR8HHB07SFVba0G9
 IDkNeup9RYehXEF03cdFOmFK+Afrb0iAMWvIoloc/UuBFlURA9K8pi+6ki22SV4bUG5t
 uy4gkfqWEpwNwmLFGySC7pHDE9TWuWMBKmAYzW95Ruy4kFRBo+JznWTsORVcsaLlxNra
 OTZg==
X-Gm-Message-State: AOAM532Co8Do8GC6c43IXQqkUHJ8vJvLBitZiDspLD/Yj0hyzl7Nu1M8
 JFy/2FzSW9W1oamoT8DIyIIUkBA8zZALuEsLjgQmokcjUaPmuDyASSfleX5uJKupQCFnkmVfaC+
 5avX16zyZ8woYCBar3SQGkGBy4RUc
X-Received: by 2002:a05:600c:590:b0:38c:804e:4197 with SMTP id
 o16-20020a05600c059000b0038c804e4197mr12313556wmd.22.1649337410346; 
 Thu, 07 Apr 2022 06:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqkG5lfR25b85G/v8443+CqBWY7ukzbb2XsMCNk9TeIagKJa+MIeW8P/wBh5/pVz1uMvC5wQ==
X-Received: by 2002:a05:600c:590:b0:38c:804e:4197 with SMTP id
 o16-20020a05600c059000b0038c804e4197mr12313529wmd.22.1649337410062; 
 Thu, 07 Apr 2022 06:16:50 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm16607003wrm.82.2022.04.07.06.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:16:49 -0700 (PDT)
Message-ID: <aa949d43-5c88-377c-9f93-1886f934bbca@redhat.com>
Date: Thu, 7 Apr 2022 15:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: specify usage while adding fences to
 dma_resv obj v7
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-3-christian.koenig@amd.com>
 <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
 <79648b84-e7d0-4c38-d8f1-cc569238ee7e@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <79648b84-e7d0-4c38-d8f1-cc569238ee7e@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

On 4/7/22 15:13, Christian König wrote:
> Am 07.04.22 um 15:08 schrieb Javier Martinez Canillas:
>> Hello Christian,
>>
>> On 4/7/22 10:59, Christian König wrote:
>>> Instead of distingting between shared and exclusive fences specify
>>> the fence usage while adding fences.
>>>
>>> Rework all drivers to use this interface instead and deprecate the old one.
>>>
>> This patch broke compilation for the vc4 DRM driver.
> 
> My apologies for that. I've tried really hard to catch all cases, but 
> looks like I missed some.
> 

No worries, I know that's not easy to get all callers when doing these
subsystem wide changes.

>> I've this patch locally
>> which seems to work but I don't know enough about the fence API to know if
>> is correct.
>>
>> If you think is the proper fix then I can post it as a patch.
> 
> Yes, that patch looks absolutely correct to me.
>

Thanks for looking at it.
 
> Feel free to add an Reviewed-by: Christian König 
> <christian.koenig@amd.com> and CC me so that I can push it to 
> drm-misc-next ASAP.
> 

I can also do it after posting (just to get a proper Link: tag with dim)

Already have another set that wanted to push but found this issue after
doing a build test before pushing.

> Thanks,
> Christian.
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

