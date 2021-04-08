Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B198E358015
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2436EA5B;
	Thu,  8 Apr 2021 09:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FB06EA58
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617875862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qRbCj/1Pw0sbqnFA7cAFN0KaHJ1niBYvUatQLNt7yA=;
 b=ALb58AOwBwYK8A7HXNk0ZWUrNaJeeHWvTMAN6gIOEl4lTYeKuY7pp7iLmYkl5oCBAVqeME
 Q9qxFD21gOvcIyZo20Uy0RYHLOna8MsMcj4b6uAjz9RfqpawpqoR8y3OvryR+mu+v8oV3h
 H8OZv7Nl7WUtty44R8z9YGigPjAQibs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-NppAuqKfOUeFeTzIB7gHeQ-1; Thu, 08 Apr 2021 05:57:39 -0400
X-MC-Unique: NppAuqKfOUeFeTzIB7gHeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8F5987A83A;
 Thu,  8 Apr 2021 09:57:36 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5501E5D9CA;
 Thu,  8 Apr 2021 09:57:32 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Mike Rapoport <rppt@kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com> <YG7TZa8VP458QS5y@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9826d7ef-7f7e-987e-c305-7ae3c533d591@redhat.com>
Date: Thu, 8 Apr 2021 11:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7TZa8VP458QS5y@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mm@kvack.org,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.04.21 11:56, Mike Rapoport wrote:
> On Thu, Apr 08, 2021 at 11:20:11AM +0200, David Hildenbrand wrote:
>> Random drivers should not override a user configuration of core knobs
>> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
>> dependencies and manual overrides.
>>
>> "This is similar to "select" as it enforces a lower limit on another
>>   symbol except that the "implied" symbol's value may still be set to n
>>   from a direct dependency or with a visible prompt."
>>
>> Implying DRM_CMA should be sufficient, as that depends on CMA.
> 
>            ^ DMA_CMA
>>
>> Note: If this is a real dependency, we should use "depends on DMA_CMA"
>> instead -  but I assume the driver can work without CMA just fine --
>> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   drivers/gpu/drm/aspeed/Kconfig  | 3 +--
>>   drivers/gpu/drm/etnaviv/Kconfig | 3 +--
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
>> index 5e95bcea43e9..a055f763d230 100644
>> --- a/drivers/gpu/drm/aspeed/Kconfig
>> +++ b/drivers/gpu/drm/aspeed/Kconfig
>> @@ -6,9 +6,8 @@ config DRM_ASPEED_GFX
>>   	depends on MMU
>>   	select DRM_KMS_HELPER
>>   	select DRM_KMS_CMA_HELPER
>> -	select DMA_CMA if HAVE_DMA_CONTIGUOUS
>> -	select CMA if HAVE_DMA_CONTIGUOUS
>>   	select MFD_SYSCON
>> +	imply DRM_CMA
> 
> Ditto

Gah, thanks!


-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
