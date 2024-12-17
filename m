Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B59F5494
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0E10EA41;
	Tue, 17 Dec 2024 17:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="VkPXr4Q5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id D061910E423;
 Tue, 17 Dec 2024 17:43:34 +0000 (UTC)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4C1542171F87;
 Tue, 17 Dec 2024 09:43:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4C1542171F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1734457414;
 bh=qz8oz73s4rCDJSC1TgNUQNYJjOVU8exHA2BYkyw+ZD0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VkPXr4Q51kSzYXC6iV4Rnt0hdXMx9YWH59To4VTRyzVF/4SXLeJpUxO01knfWumzM
 CzAbcmQnzc2Qsz94yaL1AgsNLmsei1LV793lD8Qkn1YDLJvzyEf9X476Tc2IwzAabU
 HeEAso29uXPVkfVcznz9hizNBAvL5QWBolCDD9Qs=
Message-ID: <f3f9a686-8be3-49f0-bcfb-10b864fa5a11@linux.microsoft.com>
Date: Tue, 17 Dec 2024 09:43:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 02/19] coccinelle: misc: Add secs_to_jiffies script
To: Julia Lawall <julia.lawall@inria.fr>,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <20241210-converge-secs-to-jiffies-v3-2-ddfefd7e9f2a@linux.microsoft.com>
 <Z2G02RN7VelcrjNT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <alpine.DEB.2.22.394.2412171831300.3566@hadrien>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2412171831300.3566@hadrien>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/2024 9:33 AM, Julia Lawall wrote:
> 
> 
> On Tue, 17 Dec 2024, Alexander Gordeev wrote:
> 
>> On Tue, Dec 10, 2024 at 10:02:33PM +0000, Easwar Hariharan wrote:
>>
>> Hi Easwar,
>>
>>> This script finds and suggests conversions of timeout patterns that
>>> result in seconds-denominated timeouts to use the new secs_to_jiffies()
>>> API in include/linux/jiffies.h for better readability.
>>>
>>> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> ---
>>>  scripts/coccinelle/misc/secs_to_jiffies.cocci | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..8bbb2884ea5db939c63fd4513cf5ca8c977aa8cb
>>> --- /dev/null
>>> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
>>> @@ -0,0 +1,22 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +///
>>> +/// Find usages of:
>>> +/// - msecs_to_jiffies(value*1000)
>>> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
>>> +///
>>> +// Confidence: High
>>> +// Copyright: (C) 2024 Easwar Hariharan, Microsoft
>>> +// Keywords: secs, seconds, jiffies
>>> +//
>>> +
>>> +virtual patch
>>> +
>>> +@depends on patch@ constant C; @@
>>> +
>>> +- msecs_to_jiffies(C * 1000)
>>> ++ secs_to_jiffies(C)
>>> +
>>> +@depends on patch@ constant C; @@
>>> +
>>> +- msecs_to_jiffies(C * MSEC_PER_SEC)
>>> ++ secs_to_jiffies(C)
>>
>> If you used this script only, then it did not seem to recognize line arch/s390/mm/cmm.c:207
>>
>> 	mod_timer(&cmm_timer, jiffies + msecs_to_jiffies(cmm_timeout_seconds * MSEC_PER_SEC));
> 
> There is the requirement that C is a constant, and cmm_timeout_seconds is
> not considered to be a constant, ie it is not all capital letters.
> Indeed, it doesn't seem to be a constant at all.  I don't know if the
> requirement of being a comstant is really necessary.
> 
> julia
> 
>>
>> Thanks!
>>

As the cover letter says, this is part 1. I intend to do further parts
that address the cases where the multiplicand is an expression, as well
as the cases where the timeout provided to msecs_to_jiffies() is
denominated in seconds (i.e. ends in 000)

Thanks,
Easwar
