Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F143580D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68876EA7F;
	Thu,  8 Apr 2021 10:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB4F6EA83
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617878232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLjjLoz+QeRsQ1MOoIX2RgV24dAqIxs+wPP9bncu07U=;
 b=aaNAU9CDlpk4dMcFbfT3TaK6v8gGrYl6XrwUrQYqgp16Ccal71HH9TXHpl6LhelycUwDA+
 OOt5vgWq17kbPKdfOzfXgJEeR6z00HEXqgaQ7KDJE/MYUlrF6S7ixe+qsToyOSdOD/lEg2
 S3c1zu3aNZKs2W64MkTPoerciGMgkho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-2LSDVNSAMvy_w6wcmDZmyA-1; Thu, 08 Apr 2021 06:37:08 -0400
X-MC-Unique: 2LSDVNSAMvy_w6wcmDZmyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761D4CC622;
 Thu,  8 Apr 2021 10:37:05 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A5151001B2C;
 Thu,  8 Apr 2021 10:37:00 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
From: David Hildenbrand <david@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0b1928a8-99c3-f1f1-ad66-40145199d9bc@redhat.com>
Date: Thu, 8 Apr 2021 12:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.04.21 12:27, David Hildenbrand wrote:
> On 08.04.21 12:20, Arnd Bergmann wrote:
>> On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> Random drivers should not override a user configuration of core knobs
>>> (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
>>> dependencies and manual overrides.
>>>
>>> "This is similar to "select" as it enforces a lower limit on another
>>>    symbol except that the "implied" symbol's value may still be set to n
>>>    from a direct dependency or with a visible prompt."
>>>
>>> Implying DRM_CMA should be sufficient, as that depends on CMA.
>>>
>>> Note: If this is a real dependency, we should use "depends on DMA_CMA"
>>> instead -  but I assume the driver can work without CMA just fine --
>>> esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
>>
>> 'imply' is almost never the right solution, and it tends to cause more
>> problems than it solves.
> 
> I thought that was the case with "select" :)
> 
>>
>> In particular, it does not prevent a configuration with 'DRM_CMA=m'
> 
> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.
> 
>> and 'DRMA_ASPEED_GFX=y', or any build failures from such
>> a configuration.
> 
> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?
> 
>>
>> If you want this kind of soft dependency, you need
>> 'depends on DRM_CMA || !DRM_CMA'.
> 
> Seriously? I think the point of imply is "please enable if possible and
> not prevented by someone else". Your example looks more like a NOP - no?
> Or will it have the same effect?

I just tried (remove CONFIG_DMA_CMA from .config followed by make) and 
the default will be set to "N" (when querying the user). So it indeed 
looks like a NOP - unless I am missing something.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
