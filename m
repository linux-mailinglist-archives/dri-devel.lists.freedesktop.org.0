Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39074FBC52
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A867F10E4D4;
	Mon, 11 Apr 2022 12:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ED810E4D4;
 Mon, 11 Apr 2022 12:42:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c64so6059742edf.11;
 Mon, 11 Apr 2022 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R6BFNRU2q1XNxEfGm88CIyqAqlzFNs0kRryqmEb8+MA=;
 b=mbahqTcKWODAb57udTkBykSONqmHLxj1kOIm6IAKEqMWMnv0EUekwdqNL9geZAqrG7
 30Y2AXxVyXQJ+ThE00kInGYavMpFd4si684CkHdbKXWgUHSw6u+w3AR4xey+YD/e7wpO
 i2e0d43QynDfEh62TKYLCtPb2naWlHGoPzau5W8hXOhU3i8wMxc391GKONlGZGoRU7iz
 LadTQgUZWq+o8oxzA7KJ0RWJKkujKipFrKiG/MBMCtH9aZNL5+e84nmU8pAjW3Vyfv8F
 8UNx7dYKYEXcbJY93q8qmt/xv44eRZxSL/SoHNHbWBD2hKUF7zuPHzYaz4RGNWH9PLdC
 Pl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R6BFNRU2q1XNxEfGm88CIyqAqlzFNs0kRryqmEb8+MA=;
 b=LBBaHArXZa23gvsWt0SqIfETkll0w56DB4XSNFwuhQoF0Q27tNzaNXwIW+JuDUHJ7J
 MMizq0NvGY4Anl645+9CLRX49FVAD9P1D5RK3xaUbxMokF713icksw5ErKp2lqOmfjbI
 cwzoO4sFznzBLIaAVZCkvg6efWWaBBgBrH9QiUq+qbxg1r56Huw6fv6VJhllQZDmQH67
 VPlhyEApBIzuxvlSmS6sWHWThpf1xldsbnxdUJG93+48ql8fruVFYqHWVDFyVD7RbtCr
 6BeBc3reIVtxknXrUXAPqUAPi4diGeKH7Wuhx6r0OcTjbuHxxMhckQlUvztLC9bV//6V
 dRJw==
X-Gm-Message-State: AOAM530+H5uXIzGSwekqHkw7zvh9mt00IR8CSWETu/ZdAAImHa/yQ+bM
 HadlamE9S9nr+6Xs/e8FwAWVU2P95Mk=
X-Google-Smtp-Source: ABdhPJzTBJjuCbQaiLn1At+PIXEVw9RxrGMXa4nMxqgo6zGZW1f7D2ORIm1m2yOHVm1mHkE1Pt/5fw==
X-Received: by 2002:a05:6402:51d2:b0:41c:e157:84f1 with SMTP id
 r18-20020a05640251d200b0041ce15784f1mr33530772edd.135.1649680945724; 
 Mon, 11 Apr 2022 05:42:25 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:b3e9:56a3:6bb9:f974?
 ([2a02:908:1252:fb60:b3e9:56a3:6bb9:f974])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a509dcb000000b0041cbaf0ce2asm13111184edk.6.2022.04.11.05.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:42:24 -0700 (PDT)
Message-ID: <ca280f24-8efe-e972-4a03-700e002cc6f7@gmail.com>
Date: Mon, 11 Apr 2022 14:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm: add a check to verify the size alignment
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220411073834.15210-1-Arunpravin.PaneerSelvam@amd.com>
 <9ecac65c-84d9-9965-4fd3-f86ea572bb9d@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <9ecac65c-84d9-9965-4fd3-f86ea572bb9d@intel.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 11.04.22 um 11:47 schrieb Matthew Auld:
> On 11/04/2022 08:38, Arunpravin Paneer Selvam wrote:
>> Add a simple check to reject any size not aligned to the
>> min_page_size.
>>
>> when size is not aligned to min_page_size, driver module
>> should handle in their own way either to round_up() the
>> size value to min_page_size or just to enable WARN_ON().
>>
>> If we dont handle the alignment properly, we may hit the
>> following bug, Unigine Heaven has allocation requests for
>> example required pages are 257 and alignment request is 256.
>> To allocate the left over 1 page, continues the iteration to
>> find the order value which is 0 and when it compares with
>> min_order = 8, triggers the BUG_ON(order < min_order).
>>
>> v2: add more commit description
>> v3: remove WARN_ON()
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Question here is who will be pushing that to drm-misc-next? Should I 
take care of that?

I think it's time that Arun should request push permission for 
drm-misc-next.

Thanks,
Christian.
