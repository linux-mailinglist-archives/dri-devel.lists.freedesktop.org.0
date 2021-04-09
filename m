Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF02359722
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7772E6EB8C;
	Fri,  9 Apr 2021 08:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13196EB8C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617955634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2PTBL+nqzlKBelC7c/vISZYvaV01k6PixS2+D0BjW8=;
 b=V+51ZP6VFT0bi9F+UlEgbg9fq3q0B782puEtIYb1CuSLMxbuHuCNg6xm8yvucAre7p1Clx
 mEu+NflWch2TSyyUdZ17O922jsIECJtGfSIpj6NOdua5N/mduD/cjQEEPg2uDegk3Oixbw
 p/Uas0oef3HO1ORR4owv8+vGDirMrik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-sYcaZKqyO02l33jnkyP5XA-1; Fri, 09 Apr 2021 04:07:10 -0400
X-MC-Unique: sYcaZKqyO02l33jnkyP5XA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748496D246;
 Fri,  9 Apr 2021 08:07:08 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 701F75C1D5;
 Fri,  9 Apr 2021 08:07:02 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
 <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e6fa1b72-24ca-28bc-0115-7ceceb101e96@redhat.com>
Date: Fri, 9 Apr 2021 10:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Wu7tT-YajfdXSSVvg5MYMEnEy3APJ83DcLeJdGkkSrQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.04.21 15:19, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
>>
>>>> This is something you could do using a hidden helper symbol like
>>>>
>>>> config DRMA_ASPEED_GFX
>>>>          bool "Aspeed display driver"
>>>>          select DRM_WANT_CMA
>>>>
>>>> config DRM_WANT_CMA
>>>>          bool
>>>>          help
>>>>             Select this from any driver that benefits from CMA being enabled
>>>>
>>>> config DMA_CMA
>>>>          bool "Use CMA helpers for DRM"
>>>>          default DRM_WANT_CMA
>>>>
>>>>            Arnd
>>>>
>>>
>>> That's precisely what I had first, with an additional "WANT_CMA" --  but
>>> looking at the number of such existing options (I was able to spot 1 !)
>>
>> If you do this it probably makes sense to fix a few other drivers
>> Kconfig in the process. It's not just a problem with your driver.
>> "my" drivers:
>>
>> drivers/gpu/drm/mcde/Kconfig
>> drivers/gpu/drm/pl111/Kconfig
>> drivers/gpu/drm/tve200/Kconfig
>>
>> certainly needs this as well, and pretty much anything that is
>> selecting DRM_KMS_CMA_HELPER or
>> DRM_GEM_CMA_HELPER "wants" DMA_CMA.
> 
> Are there any that don't select either of the helpers and
> still want CMA? If not, it would be easy to just add
> 
>     default  DRM_KMS_CMA_HELPER || DRM_GEM_CMA_HELPER
> 
> and skipt the extra symbol.

That sounds like a reasonable thing to do. I'll look into that.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
