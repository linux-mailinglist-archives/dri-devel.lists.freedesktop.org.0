Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5139359738
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54406EB92;
	Fri,  9 Apr 2021 08:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B06EB92
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617955805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CK2pH4tMSS36srqXiWiXDwOybdtTZO1Syr9BWG62Vc=;
 b=InCSkLuX659ZxZqQWQNuFW4W8e9ZF2UnGpHtnkr8EWim+/BxxljkhrLKcbf64BSr/czk+T
 ZLWYL32heKLWC6YI57anVSvha0i0MvNhIWgN6Kq+AxHo2w1qVUULPS0WTIdHWDz0a2mPla
 IKkjQ+X4xCpxO707oD1k9u91JCJ7c10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-RZ0ZAZfyOVWdvZcWXExmQA-1; Fri, 09 Apr 2021 04:10:01 -0400
X-MC-Unique: RZ0ZAZfyOVWdvZcWXExmQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77CF783DD2E;
 Fri,  9 Apr 2021 08:09:58 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E145319811;
 Fri,  9 Apr 2021 08:09:52 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
 <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
 <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <b78f2ec2-3c47-f435-6d5e-fb7330ff3907@redhat.com>
Date: Fri, 9 Apr 2021 10:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3sqZBo8-zye1yiZuD2uMUr0oE_q_QfaK9K54TEgd1Cdw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 08.04.21 22:29, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 6:45 PM David Hildenbrand <david@redhat.com> wrote:
>> On 08.04.21 14:49, Linus Walleij wrote:
>>> On Thu, Apr 8, 2021 at 2:01 PM David Hildenbrand <david@redhat.com> wrote:
>>>
>>>>> This is something you could do using a hidden helper symbol like
>>>>>
>>>>> config DRMA_ASPEED_GFX
>>>>>           bool "Aspeed display driver"
>>>>>           select DRM_WANT_CMA
>>>>>
>>>>> config DRM_WANT_CMA
>>>>>           bool
>>>>>           help
>>>>>              Select this from any driver that benefits from CMA being enabled
>>>>>
>>>>> config DMA_CMA
>>>>>           bool "Use CMA helpers for DRM"
>>>>>           default DRM_WANT_CMA
>>>>>
>>>>>             Arnd
>>>>>
>>>>
>>>> That's precisely what I had first, with an additional "WANT_CMA" --  but
>>>> looking at the number of such existing options (I was able to spot 1 !)
>>>
>>> If you do this it probably makes sense to fix a few other drivers
>>> Kconfig in the process. It's not just a problem with your driver.
>>> "my" drivers:
>>>
>>
>> :) I actually wanted to convert them to "depends on DMA_CMA" but ran
>> into recursive dependencies ...
>>
>>> drivers/gpu/drm/mcde/Kconfig
>>> drivers/gpu/drm/pl111/Kconfig
>>> drivers/gpu/drm/tve200/Kconfig
> 
> Right, this is the main problem caused by using 'select' to
> force-enable symbols that other drivers depend on.
> 
> Usually, the answer is to be consistent about the use of 'select'
> and 'depends on', using the former only to enable symbols that
> are hidden, while using 'depends on' for anything that is an
> actual build time dependency.
> 
>> I was assuming these are "real" dependencies. Will it also work without
>> DMA_CMA?
> 
> I think in this case, it is fairly likely to work without DMA_CMA when the
> probe function gets called during a fresh boot, but fairly likely to fail if
> it gets called after the system has run for long enough to fragment the
> free memory.
> 
> The point of DMA_CMA is to make it work reliably.

Right, and even at runtime there is no guarantee that DMA_CMA will do 
anything -- especially if we don't reserve a CMA region (e.g., "cma=X").

So this really sounds like a

"desires DMA_CMA"

and achieving that via an additional symbol or via "default y if ..." 
for DMA_CMA sounds reasonable.

Thanks!

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
