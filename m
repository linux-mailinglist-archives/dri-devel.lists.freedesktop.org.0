Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A944D5A2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E166EB1C;
	Thu, 11 Nov 2021 11:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459506EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636629193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddK+70QDiwNPVqUQi478CHOJroN8im0gkQitsQ5o/Ho=;
 b=ZxjVyJql9IypLfYUgtOAJICk3rQMWYMU99Df3mHR3+RZnfdnztLXuqt0g1Of8wM8vTGfJ3
 BwoEppJCX2DYNaGL1irzr2BzG4Dyg/zW2OnIwFcZvF0XX+LvqBz6i7EpUXsfIzGAFZbW2f
 UGtgzMsf0yY3Y3xXRz06qHPTyU8FfiI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-igemoDWLMsOZfFToXCu9Bw-1; Thu, 11 Nov 2021 06:13:12 -0500
X-MC-Unique: igemoDWLMsOZfFToXCu9Bw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so971090wrj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ddK+70QDiwNPVqUQi478CHOJroN8im0gkQitsQ5o/Ho=;
 b=CTxDEZneahKBdHLarhHf7u7bWUWR+ANqHc9QYGDmk6xbJ8uXEkKz34cHBwjmq0VfC2
 wRm3jdp8W1F5UtlaR7KDDd+np36qCzXnZh3b3AM4wtV/Ljesf93+hxZu0CkHUEJb/++e
 0qixBcB7NcF70F+xyu+ncJvBWFakUcIA1WzU8YRbkT5s/hfLliZT2uJ+gyCmub3BqyFd
 bmD67SoFyfAXwf+Q6MVwnKqkGrcelKXSTBVIuzxzMr2AAknBEsq+rwFFFJMJ/sVBcu4t
 MLHgMoaxdGfjGEVpqcUDxoKn3fTSdat641GbvZTYfGa7JZ3xCzMjGfdhxp0wW3LLO/5q
 jj2g==
X-Gm-Message-State: AOAM532+kigsk1meyL0MdBxRoc3ZDlGoabvV3G93yEUPLpBOULT4/Vlu
 kbq81et5uhri+NV4GceFq62+3Lx1HqRQBXKNQlzyR4uknL8wKx5v+hRMAr6esupst4WavGx+K/h
 PHK2Uxei11zM9fT6oHoTRVZqyaTsG
X-Received: by 2002:a5d:5581:: with SMTP id i1mr7779705wrv.107.1636629191044; 
 Thu, 11 Nov 2021 03:13:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWXqQHtS7h8deuBVKj8mfFEGhzdn9o1xM6poKRsJPw8JHivw0tsu1S4SnD6oLmcppXJO704g==
X-Received: by 2002:a5d:5581:: with SMTP id i1mr7779676wrv.107.1636629190866; 
 Thu, 11 Nov 2021 03:13:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d6sm2585948wrx.60.2021.11.11.03.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:13:10 -0800 (PST)
Message-ID: <1b6c6fbe-0b20-95e7-c1ed-bc2b2c13c044@redhat.com>
Date: Thu, 11 Nov 2021 12:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
To: Ilya Trukhanov <lahvuun@gmail.com>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
 <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
 <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
 <20211111105232.apk2msip4ng7hgsw@lahvuun>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211111105232.apk2msip4ng7hgsw@lahvuun>
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
Cc: len.brown@intel.com, linux-efi@vger.kernel.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, pavel@ucw.cz, rafael@kernel.org,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ilya,

On 11/11/21 11:52, Ilya Trukhanov wrote:
> On Thu, Nov 11, 2021 at 10:24:56AM +0100, Javier Martinez Canillas wrote:
>> On 11/11/21 08:31, Javier Martinez Canillas wrote:
>>
>> [snip]
>>
>>>>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
>>>>>
>>>>> If the explanation above is correct, then I would expect (1) and (2) to work and
>>>>> (3) to also fail.
>>>>>
>>>
>>> Your testing confirms my assumptions. I'll check how this could be solved to
>>> prevent the efifb driver to be probed if there's already a framebuffer device.
>>>
>>
>> I've posted [0] which does this and also for the simplefb driver.
>>
>> [0]: https://lore.kernel.org/dri-devel/20211111092053.1328304-1-javierm@redhat.com/T/#u
> 
> I applied the patch and it fixes the issue for me.
> Thank you!
> 

Great! And thanks for tracking this down.

Feel free to add your Tested-by to v2.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

