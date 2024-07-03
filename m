Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321C92663F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74CC10E2FD;
	Wed,  3 Jul 2024 16:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hr1hiLgu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9872C10E2FD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720024817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
 b=Hr1hiLguSGzp+Ntsm0ONhMyTT/yPsioiNQjnA+1D3qy+IV6yvHXOJzQ4SiXax7Tvx0TTEm
 lwwwHBWezU7N0TUF8ENVncZCvOhFx3eDkRrms7TXbb2yKds5k8GzAB1opWxu9jtYC50fkA
 Sl/uGgiySc0510ha6304DOOEdwMp4zs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-sJA1ngrOPciCFQogk2mj6g-1; Wed, 03 Jul 2024 12:40:16 -0400
X-MC-Unique: sJA1ngrOPciCFQogk2mj6g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3678e523e32so1287942f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720024815; x=1720629615;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
 b=Eelz09lQs5Hsts2hoynSB5l0qQt7+vIdviQIQjJg8H7TaIXUs40WA1A7aN9YDTJFeu
 M3xP2OYDgki0Bp3QyY/OSijfaklBWqgF9kFHoWHB2nJd6dvbGqJF/ddQf4UK146EhVDi
 BwDdpw/HRvA4z9H4QWIIoS7DkAewa3s+m0RPqN0h84AcQu8rVCDFSVEslsCHyF+GsmuP
 nnAEc3skAgmThkUoC1EDuvaouxznjFxvkDOlknbIb3IKl16zP49Z8fzB265uu5r15GdI
 olVO+0z7ca5Af9DM+QW73+36a6iwDqXUCeRFtKSI8f4TsbjxnWpABAJR6+1evQFEjkui
 RqAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2LcPAso4XgMnVPkURxVPm3EB8YwcY0rYTpVKnNTM8qzpQeiGGRNkn7FHMVdftS5YUArDGaBZOJECy5aZg80Y7Q7J3eEfvE3Yl7idwuK9Q
X-Gm-Message-State: AOJu0YxpjdiF/9ov0O8NnTENi5WieRyIuUx/HjzFIrR1eJRucLqJ0Zkx
 zziVcMyto3AK8D1zgHSxmLBSwof1YuwlL3ZdE+4QVBnN/gkk6VlbOBMzbj6SbmPTjyRaEKs4Qtk
 qmha9tIfSPouOLPeUMdrY9685lHMRhGV6yyIkDPPer+/4GBDPdotMgIz4XmzI+a3y7A==
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id
 ffacd0b85a97d-367890e86c6mr3596758f8f.40.1720024815336; 
 Wed, 03 Jul 2024 09:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFECIbpt3OJn614ksUNxWcM5kxqBGXD+RFA85ATl3K5a4iBL/0MjztMRm9i7OEdpByRhuroqQ==
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id
 ffacd0b85a97d-367890e86c6mr3596739f8f.40.1720024814927; 
 Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36791d7a93bsm2401812f8f.81.2024.07.03.09.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Message-ID: <9e7023f4-775c-4371-ade5-1ed860545aaa@redhat.com>
Date: Wed, 3 Jul 2024 18:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz> <202407030926.D5DA9B901D@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202407030926.D5DA9B901D@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 03/07/2024 18:27, Kees Cook wrote:
> On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
>> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
>>>
>>>
>>> On 02/07/2024 22:29, Kees Cook wrote:
>>>> On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
>>>>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>>>>> callback.
>>>>> This patch adds a new struct kmsg_dump_detail, that will hold the
>>>>> reason and description, and pass it to the dump() callback.
>>>>
>>>> Thanks! I like this much better. :)
>>>>
>>>>>
>>>>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>>>>> function and a macro for backward compatibility.
>>>>>
>>>>> I've written this for drm_panic, but it can be useful for other
>>>>> kmsg_dumper.
>>>>> It allows to see the panic reason, like "sysrq triggered crash"
>>>>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>>>>
>>>>> v2:
>>>>>    * Use a struct kmsg_dump_detail to hold the reason and description
>>>>>      pointer, for more flexibility if we want to add other parameters.
>>>>>      (Kees Cook)
>>>>>    * Fix powerpc/nvram_64 build, as I didn't update the forward
>>>>>      declaration of oops_to_nvram()
>>>>
>>>> The versioning history commonly goes after the "---".
>>>
>>> ok, I was not aware of this.
>>>>
>>>>> [...]
>>>>> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
>>>>> index 906521c2329c..65f5a47727bc 100644
>>>>> --- a/include/linux/kmsg_dump.h
>>>>> +++ b/include/linux/kmsg_dump.h
>>>>> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>>>>>    	u64	next_seq;
>>>>>    };
>>>>> +/**
>>>>> + *struct kmsg_dump_detail - kernel crash detail
>>>>
>>>> Is kern-doc happy with this? I think there is supposed to be a space
>>>> between the "*" and the first word:
>>>>
>>>>    /**
>>>>     * struct kmsg...
>>>>
>>>>
>>> Good catch, yes there is a space missing.
>>>
>>> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
>>> is not indexed for kernel documentation.
>>> And you can't find the definition of struct kmsg_dumper in the online doc.
>>> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
>>>
>>>> Otherwise looks good to me!
>>>>
>>>
>>> Thanks.
>>>
>>> As this patch touches different subsystems, do you know on which tree it
>>> should land ?
>>
>> Andrew usually takes patches against kernel/panic.c.
>>
>> Or you could take it via the DRM tree, especially if you already have the code
>> using the string.

If it's not taken in Andrew's tree next week, I will see if I can push 
it to the drm-misc tree. I think there is a very low chance of conflicts.

>>
>> Also I could take it via the printk tree. The only complication is
>> that I am going to be away the following two weeks and would come
>> back in the middle of the merge window. I do not expect much problems
>> with this change but...
> 
> If DRM doesn't want to carry it, I can put it in through the pstore
> tree. Let me know! :)
> 

Thanks for the proposition, I will see how it goes, it would be nice to 
have it in time for the v6.11 merge window.

Best regards,

-- 

Jocelyn

