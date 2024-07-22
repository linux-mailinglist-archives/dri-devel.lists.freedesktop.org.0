Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D134939298
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9292010E1C4;
	Mon, 22 Jul 2024 16:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D0QagGet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA8610E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721666036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsMiBIkevMqXBW2DcNPEnH7DY2ezXcbrlK8J00Zf6Qo=;
 b=D0QagGetdgFC6NGHb3Cr1nFLpyAAxBsUDcs2dRPyHgJvOt4x9yLL8UH2TNQ12TpmhnaLkk
 B4Jh8cL+WIcXds+rdvPsziyAP0JUgqeUxuq9c2m7jUi2KpIUh0Nqo6pinkF27rrt9Rm27F
 aUCgMO/4X8j5aFA/QalSd3Y21lxc6us=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-rLvhzkdQPc6sXHsYwIfY4A-1; Mon, 22 Jul 2024 12:33:52 -0400
X-MC-Unique: rLvhzkdQPc6sXHsYwIfY4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-427d9e61ba8so21859935e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721666031; x=1722270831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsMiBIkevMqXBW2DcNPEnH7DY2ezXcbrlK8J00Zf6Qo=;
 b=b4ocZuhAJ2SxHk0QcC1LCHj0EXoaTDhmqDnNCIZ8cfaNL5LrnngNgwNnERy4y6onTL
 zPq8Hll/kxyqy4KrJy0VPTYlkPyEKjyNNN2NZMlJUJIF0LynGYFZqfyzDyF7cbq2WxQf
 axh6G1P+q8xa9f5KNmXGWgtx3dCRl1ZPXDFS1GA/1ky84FZBpupTDDNkyUWAoHUT9aaY
 RraNnrSAvxMKaxZ+XPHsty7GvpqbK7h7/pPz8YClhGO2U2MHwTQKEv020dxWsqSzhWhm
 9qMJlqXaRGlEWczqeauXxawWzkJ0+tLwJJqP4SAcVzKMPZkfHgA01ywVaARhH1D8kevf
 xVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJHTciT9Gox9ePT6TVTVt/VtchpVkVtmKWZvVGYpCyWJkXpBB2hbO4GAiWqSEMyKXuaAfuJhYKx4ci+1w58Ta97Smu8oQmop9pQr6k0OCd
X-Gm-Message-State: AOJu0Yz6x7Xu6Klk5oBzecJafuN79iWcA0O79zJ+f6wzlTl+w3AyX212
 tJSwsg94aY7fjL7gzTkeVFu99OsJOeHw9Uw9zd5JOuYB7WH4/E7yEYLswSnL0pC13fXxUSHTNcC
 434tgzB7YKgQVOVFk5n0Dsd9n7k4GBrzYKUcFAmal7L8lhUYC+4b7/r8jr4Foq1sGJQ==
X-Received: by 2002:a05:600c:5249:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-427ecfdfbfdmr3456075e9.9.1721666031478; 
 Mon, 22 Jul 2024 09:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhKPZMMgKyz4fSPYvf9iTPhG7gauOPL0vg5XbFth0P+eIWasAnvRYSb0MhB0GEllFAUXFdAQ==
X-Received: by 2002:a05:600c:5249:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-427ecfdfbfdmr3455885e9.9.1721666031086; 
 Mon, 22 Jul 2024 09:33:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e42bsm164383095e9.30.2024.07.22.09.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:33:50 -0700 (PDT)
Message-ID: <d7b13cc3-d7b7-4cf2-b08a-4228efe04f53@redhat.com>
Date: Mon, 22 Jul 2024 18:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Knop Ryszard <ryszard.knop@intel.com>
References: <20240719152542.1554440-1-jfalempe@redhat.com>
 <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 22/07/2024 17:21, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Betreff: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
> 
>> When the kmsg_dumper callback parameter changed, the reason variable
>> in mtdoops_do_dump() was not updated accordingly.
>> This breaks the build with mtdoops.
>>
>> Fixes: e1a261ba599e ("printk: Add a short description string to kmsg_dump()")
>> Reported-by: Knop Ryszard <ryszard.knop@intel.com>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> The offended commit is in the drm-misc tree, because it was needed
>> by drm_panic. So I will push the fix there too.
>>
>> drivers/mtd/mtdoops.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
>> index 86d49db9196d..7bf3777e1f13 100644
>> --- a/drivers/mtd/mtdoops.c
>> +++ b/drivers/mtd/mtdoops.c
>> @@ -305,7 +305,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
>> 	struct kmsg_dump_iter iter;
>>
>> 	/* Only dump oopses if dump_oops is set */
>> -	if (reason == KMSG_DUMP_OOPS && !dump_oops)
>> +	if (detail->reason == KMSG_DUMP_OOPS && !dump_oops)
>> 		return;
>>
>> 	kmsg_dump_rewind(&iter);
>> @@ -317,7 +317,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
>> 			     record_size - sizeof(struct mtdoops_hdr), NULL);
>> 	clear_bit(0, &cxt->oops_buf_busy);
>>
>> -	if (reason != KMSG_DUMP_OOPS) {
>> +	if (detail->reason != KMSG_DUMP_OOPS) {
> 
> Acked-by: Richard Weinberger <richard@nod.at>

I pushed it to drm-misc-next.

Thanks a lot.

> 
> Thanks,
> //richard
> 

