Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A347D8F2C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FB710E936;
	Fri, 27 Oct 2023 07:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5834810E935;
 Fri, 27 Oct 2023 07:05:23 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so26238591fa.3; 
 Fri, 27 Oct 2023 00:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698390321; x=1698995121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GUmOHIx5UyySQs212xueqN1nMzPiFUqY8qGSwYfcTM=;
 b=iOE54JYJInA/CJ9OPb4Mmg/jyhsU+52xlJ6aXd+K7McDz9NxgRGTbFtrATXPdc4Dpb
 d7x4NrNIz2Pf4h+dQhy6vAuWvnBAfdkItCMf+6UefWNKO5q1g/9pNfz/TBATSn8AZZVI
 BooaX2X0Y77g01lxZV+DDBzb0JX5gXk7keZSOk8ATPdXpTCfnUFuW7Qp1UKDfBdI8VHT
 1B0jHQXfFRSkXTA6qiIJ5Xx/fFM5HzVTIytYoSkG23GYFQuP3LuuqqI+Cq4mVOiHi4bS
 +BLsAlGrZrpP3Nyfr66e9z2yqg0zJYmLglDp0+8s/lusW3xwtkAzvpXK/MR/wtstZL7B
 tGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698390321; x=1698995121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GUmOHIx5UyySQs212xueqN1nMzPiFUqY8qGSwYfcTM=;
 b=aQ++JN6oHwujL0rQNL9ihUxHyu/GbuYZw3GSmamCgKz1+wn7M9fmXesia31LCeBpK5
 ME3OpZBW67nymw7MoVlArFu21i4itiuJZsM575AmlK53SWe20kAsIvk4u6MQxUhfwAwP
 KiuTVzxj9btVUXM4mkFsp24hE5AnpgGLPug00/7kkuoBAqLyX+7CrGLkUHo1Nr1zB809
 o6SIA42AHUt8cYHdTjovSFGVwsAwyK7rTkpMKbYLVLFLO9KtBUb8Rg5+ZaylCTEHJZVC
 VZWgUMODv6v6IdCk6iDtVL7gT0mtR0x2PjwIxa505zzEGgKITibg4duWVa+31KkzGc0W
 aLng==
X-Gm-Message-State: AOJu0YzERFNdeKBP43k3+Wn7yCiIQDakJEI+DhcOt1mm+SQVr12t4zty
 hC2unXKxgaNVtBuWhFnkB/E=
X-Google-Smtp-Source: AGHT+IHb9wSrtMKZt6+weqYQUQ0ETFAAHCS6TqRRArL7VBr6d5TDnWVekNgItRvAdAHerzi8uJo7LQ==
X-Received: by 2002:a05:651c:200c:b0:2c5:2d7:412 with SMTP id
 s12-20020a05651c200c00b002c502d70412mr1202949ljo.19.1698390321103; 
 Fri, 27 Oct 2023 00:05:21 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adfcd10000000b0032da75af3easm1078582wrm.80.2023.10.27.00.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:05:20 -0700 (PDT)
Message-ID: <35d7f479-09f2-441a-b20d-d496cea500c8@gmail.com>
Date: Fri, 27 Oct 2023 09:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update the GPU Scheduler email
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Luben Tuikov <ltuikov89@gmail.com>
References: <20231026174438.18427-2-ltuikov89@gmail.com>
 <CADnq5_MzjJCwKDaxqHR+7pGJQpPGn=Vzj8qRLMPmrJrgHPyVjQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_MzjJCwKDaxqHR+7pGJQpPGn=Vzj8qRLMPmrJrgHPyVjQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.10.23 um 21:32 schrieb Alex Deucher:
> On Thu, Oct 26, 2023 at 1:45 PM Luben Tuikov <ltuikov89@gmail.com> wrote:
>> Update the GPU Scheduler maintainer email.
>>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
>> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

>
>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4452508bc1b040..f13e476ed8038b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7153,7 +7153,7 @@ F:        Documentation/devicetree/bindings/display/xlnx/
>>   F:     drivers/gpu/drm/xlnx/
>>
>>   DRM GPU SCHEDULER
>> -M:     Luben Tuikov <luben.tuikov@amd.com>
>> +M:     Luben Tuikov <ltuikov89@gmail.com>
>>   L:     dri-devel@lists.freedesktop.org
>>   S:     Maintained
>>   T:     git git://anongit.freedesktop.org/drm/drm-misc
>>
>> base-commit: 56e449603f0ac580700621a356d35d5716a62ce5
>> --
>> 2.42.0
>>

