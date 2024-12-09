Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B69E94A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B63E10E33C;
	Mon,  9 Dec 2024 12:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BD810E33C;
 Mon,  9 Dec 2024 12:45:20 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Y6M5p179vz9tBf;
 Mon,  9 Dec 2024 13:45:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ad8aC7rBW98b; Mon,  9 Dec 2024 13:45:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Y6M5p0DxHz9tBd;
 Mon,  9 Dec 2024 13:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8A068B766;
 Mon,  9 Dec 2024 13:45:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OUa8UHFVNS_8; Mon,  9 Dec 2024 13:45:17 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A70C18B763;
 Mon,  9 Dec 2024 13:45:17 +0100 (CET)
Message-ID: <95a461ca-3ed6-4380-ad1a-da12e1109675@csgroup.eu>
Date: Mon, 9 Dec 2024 13:45:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
 <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
 <72c8eb66-eb67-4f8b-b0c0-13f1aa001698@intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <72c8eb66-eb67-4f8b-b0c0-13f1aa001698@intel.com>
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



Le 09/12/2024 à 13:01, Przemek Kitszel a écrit :
> On 12/6/24 9:58 PM, Easwar Hariharan wrote:
>> On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
>>>
>>> [removed most non-list recipients, it's just too much]
>>>
>>> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
>> <snip>
> 
>>>
>>> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
>>> there are 10 that are greppable.
>>>
>>
>> Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
>> being passed to msecs_to_jiffies() which will treat it as a
>> millisecond-denominated timeout resulting in an excessively long
>> timeout. I suppose that's better than a too-short timeout, and
>> apparently it's been working fine all along since hardware responds
>> before the too-long timeout expires. Half of them are in
>> drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
>> there since 2010.
> 
> my point was that, the default value of HZ is 1000, and most of the code
> that is just `$value*HZ` was meant as "$value seconds, in ms unit".

I can't follow you here. The default value of HZ is 250 as far as I can see.

Regardless, HZ is the number of jiffies per second, nothing else.

> 
> Same for HZ/const, HZ/2 being 500ms.
> 
> HZ is awful in that it is not 1s but 1/s, but it was easy to abuse the
> value in simple context.

Why is that awful ?

HZ is a nice macro that gives you the number of ticks per second, so 
that you are able to easily calculate the number of ticks for a given 
duration, regardless of the configured number of ticks per second.

Christophe
