Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D4A745A15
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 12:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844A610E0DB;
	Mon,  3 Jul 2023 10:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8240210E0DB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688379759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9C2RMLRxqz8xCGPW/3kYCo8ryFv6XlXc805SzxrtvIY=;
 b=HallKzrHpNssMleq29bR5GSASGU92ToMQSlLWs08DDiJPOnjRa90OVbmj66R7ipX929UQH
 2cTffyvhAbMvCABSrO6yBz0Pw/pIMtf/95KWruoluFCijaV29hpUgb83290X7IJyxww48M
 O/Qq3lGLv3oozRY0F9SpQGfkowpI6LY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-h3_tR4XxNPW0X2WHu0SOAw-1; Mon, 03 Jul 2023 06:22:38 -0400
X-MC-Unique: h3_tR4XxNPW0X2WHu0SOAw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31400956ce8so2425540f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 03:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688379756; x=1690971756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9C2RMLRxqz8xCGPW/3kYCo8ryFv6XlXc805SzxrtvIY=;
 b=lLcVtCnUA6Ay0S+bmbUQ5PE5CQj342qLhB7HtVuL7ehPSwamqAJ/913CRtBHticSlk
 Jls7e+RBhijn8GUAqiiuK9XA6xOP+lKl1KqgRG20ayRQSJ/LL+MM5dwRGtPk8M9Qs7SC
 ngYCKC3+T0q07+kI5ylrzRjwQVksmKZ+pxVHZFMTCB32whRQMDAun2wNuiecsYvVeIHn
 6P5+OuEN5CEKRb6KQdSYfoCxbJyT8WtJwiNJUXs3DbuAk1u5/DcMTH6SSR/7nmC0lWDW
 6K6yDXc1md8wrRc6D1m0ah8U9Df7TMSZ2qwuKiuhS8J5zEqj0byRmf2POaFHMxX4tP20
 j2yg==
X-Gm-Message-State: ABy/qLaw35YjcLbtDWYkXpybs/epPj5ErygtWGqjTJLJ8dMuLv6j2wWn
 TaqQ7sZzVsFnALuLEppUvfhx6yFwPNi9V0xYjp9pvsu7c8G82fKzeYOhqgKTCLwPF0/1pb9gdU6
 oqTbl7eftnYCdmLtS2HSfrc0vt3cq
X-Received: by 2002:adf:ead2:0:b0:30d:d85c:4472 with SMTP id
 o18-20020adfead2000000b0030dd85c4472mr7300337wrn.62.1688379756584; 
 Mon, 03 Jul 2023 03:22:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFusIqaDYNwJ7zdp2LOmDO3ru54swJO9LlBSopqgpGzuXOiCWzAzEM7ggHFZnoimVpgX4J5RQ==
X-Received: by 2002:adf:ead2:0:b0:30d:d85c:4472 with SMTP id
 o18-20020adfead2000000b0030dd85c4472mr7300326wrn.62.1688379756249; 
 Mon, 03 Jul 2023 03:22:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 z11-20020adfe54b000000b0031128382ed0sm6149771wrm.83.2023.07.03.03.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 03:22:35 -0700 (PDT)
Message-ID: <d6fba128-f93c-2189-229d-ec4b55d62d19@redhat.com>
Date: Mon, 3 Jul 2023 12:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/4] drm/mgag200: Use DMA to copy the framebuffer to
 the VRAM
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230531092110.140564-1-jfalempe@redhat.com>
 <20230531092110.140564-5-jfalempe@redhat.com>
 <d610d6ee-cf53-6357-b25d-5a396859cc45@suse.de>
 <15b08823-f2c2-5836-2421-f3bc25d51e11@redhat.com>
 <98ebc72a-813a-aaf9-23db-f93b3986f21e@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <98ebc72a-813a-aaf9-23db-f93b3986f21e@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 10:08, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.06.23 um 19:15 schrieb Jocelyn Falempe:
>> On 15/06/2023 16:24, Thomas Zimmermann wrote:
>>> Hi Jocelyn
>>>
>>> Am 31.05.23 um 11:21 schrieb Jocelyn Falempe:
>>>> Even if the transfer is not faster, it brings significant
>>>> improvement in latencies and CPU usage.
>>>>
>>>> CPU usage drops from 100% of one core to 3% when continuously
>>>> refreshing the screen.
>>>
>>> I tried your patchset on a HP Proliant server with a G200EH. I can 
>>> see that the CPU usage goes down, but the time until the screen 
>>> update reaches the hardware's video memory has increased significantly.
>>
>> Thanks for taking time to test it.
>> Can you check if there is something in the dmesg ?
>>
>> The 1s looks suspicious, if the IRQ is not working, there is a 1s 
>> timeout, which can explain why it will display only one frame per 
>> second. (logs should be filled with "DMA transfer timed out")
> 
> No, I don't see that error. I also verified that the IRQ handler is 
> running. It runs on each update AFAICT.
> 
> When I'm doing full-screen scrolling on the kernel console I can see the 
> scanlines being updated from top to bottom. This indicates to me that 
> the actual copying takes time or interferes with the scanout.
> 
> Best regards
> Thomas
> 
>>
>> I will see if I can get access to a G200EH, and if I can reproduce this.
>>
>> Best regards,
>>
> 

I reproduced the issue on G200EH, and there is the same problem on 
G200eR2 [102b:0534], G200eW3 [102b:0536], G200eH3 [102b:0538]
On these severs, DMA is between 2x and 10x slower than memcpy().
I didn't find a setting in Matrox register, that has an effect on this.
At this point, I think the problem may lie in the PCIe <-> PCI bridge.

I also tested on a MGA G200e [102b:0522] where the IRQ is not working at 
all.

So it looks like I've done the development on one of the few models, 
where the DMA is not completely broken.

So let's abandon this, as most hardware can't handle DMA with acceptable 
performance, and some have even broken IRQ.

Here is my complete test results:

Dell T310 G200WB [102b:0532]:
MGA memcpy: x 1280, y 1024, time: 124832 us
MGA iload: x 1280, y 1024, time: 123794 us
With PCI burst enabled (OPTION enhmemacc set to 1 and HEADER cacheline 
set to 0x08)
MGA iload: x 1280, y 1024, time : 51880 us

HP dl160 Gen8 G200EH [102b:0533]:
MGA memcpy: x 1024, y 768, time: 31542 us
MGA iload: x 1024, y 768, time: 312638 us

Dell pem520  G200eR2 [102b:0534]:
MGA memcpy: x 1280, y 1024, time : 30156 us
IRQ not working

Dell per640 G200eW3 [102b:0536]:
MGA memcpy: x 1024, y 768, time : 15586 us
MGA iload: x 1024, y 768, time : 60900 us

HP dl120 gen10 G200eH3 [102b:0538] (rev 02):
MGA memcpy: x 1024, y 768, time : 22539 us
MGA iload: x 1024, y 768, time : 38324 us

HP dl180 G200e [102b:0522] (rev 02)
MGA memcpy: x 1024, y 768, time : 35749 us
MGA iload busywait: x 1024, y 768, time : 137079 us
IRQ not working

Best regards,

-- 

Jocelyn


