Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC307842732
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8A113176;
	Tue, 30 Jan 2024 14:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FD0113176;
 Tue, 30 Jan 2024 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706626360; x=1738162360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=luIPTT9ucV8TGKHJ9MflOF0EHUFroE6No1+xpuWNnbM=;
 b=ZZd91530IOTLtpcv1gWkp1FhamkxWHNz/iUmHlw4IMWI4eapkdHK66Va
 VISv3cTYSMYE0jD0xzsAGGiGV9GvJ+spQ0h0QcTma3SMKS5SFMPQstV94
 PGQzGIvtjOE+0mpVWjifTcGxvbOzO9wClIfpmwxlyQWGOpGvEIsTU9Wjc
 WG9jFNlBQRigdInqgYB+81rSG4C8XukQLKBnB2XOHv2OJUEF/Dnu9I34S
 bOPVyGLSY0KhwmrHQDQUTmfkWpbnYCLjRB73AhtW8fHueN4dpP5OsASq5
 0nGcgRes1f/pwtX9Xs6+Qz/RDDlLFFocg3NP7ujCA9C/Qo1phPYYHhJ17 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3149929"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3149929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="30180161"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:52:34 -0800
Message-ID: <90b41ce3-0eca-4bc9-bc04-ad68ba91d7ee@linux.intel.com>
Date: Tue, 30 Jan 2024 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Enable -Wstringop-overflow globally
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Laight <David.Laight@ACULAB.COM>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <Za6JwRpknVIlfhPF@work>
 <CAHk-=wjG4jdE19-vWWhAX3ByfbNr4DJS-pwiN9oY38WkhMZ57g@mail.gmail.com>
 <4907a7a3-8533-480a-bc3c-488573e18e66@embeddedor.com>
 <202401261423.7AF702239@keescook>
 <CAHk-=wiaaCatzmF6GXxP97pa8oEX7e4rBpd4JgsbKex3Ek1_9A@mail.gmail.com>
 <f00e15fcba05497a87e91182a33c888f@AcuMS.aculab.com>
 <0c4cc1a7-f409-4597-b110-81f9e45d1ffe@embeddedor.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <0c4cc1a7-f409-4597-b110-81f9e45d1ffe@embeddedor.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/27/24 20:53, Gustavo A. R. Silva wrote:
>
>
> On 1/27/24 09:11, David Laight wrote:
>> From: Linus Torvalds
>>> Sent: 26 January 2024 22:36
>>>
>>> On Fri, 26 Jan 2024 at 14:24, Kees Cook <keescook@chromium.org> wrote:
>>>>
>>>> I think xe has some other weird problems too. This may be related 
>>>> (under
>>>> allocating):
>>>>
>>>> ../drivers/gpu/drm/xe/xe_vm.c: In function 'xe_vma_create':
>>>> ../drivers/gpu/drm/xe/xe_vm.c:806:21: warning: allocation of 
>>>> insufficient size '224' for type
>>> 'struct xe_vma' with size '368' [-Walloc-size]
>>>>    806 |                 vma = kzalloc(sizeof(*vma) - sizeof(struct 
>>>> xe_userptr),
>>>>        |                     ^
>>>
>>> That code is indeed odd, but there's a comment in the xe_vma definition
>>>
>>>          /**
>>>           * @userptr: user pointer state, only allocated for VMAs 
>>> that are
>>>           * user pointers
>>>           */
>>>          struct xe_userptr userptr;
>>>
>>> although I agree that it should probably simply be made a final
>>> variably-sized array instead (and then you make that array size be
>>> 0/1).
>>
>> That entire code is odd.
>> It isn't obvious that the flag values that cause the short allocate
>> are the same ones that control whether the extra data is accessed.
>>
>> Never mind the oddities with the 'flags |= ' assignments int the
>> 'remap next' path.
>>
>> Anyone know how many of these actually get allocated (and their
>> lifetimes)?
>> How much difference would it make to allocate 368 (maybe 384?)
>> bytes instead of 224 (likely 256).
>
> [CC+ xen list and maintainers]
>
> Probably the xen maintainer can help us out here.

Unfortunately the number of these can be quite large, and with a long 
lifetime which I guess was the reason that size optimization was done in 
the first place.

Ideally IMO this should've been subclassed to an xe_userptr_vma, but 
until we have a chance to clean that up, We can look at the 
variable-sized array or simply allocate the full size until we get to that.

Thanks,

Thomas


>
> -- 
> Gustavo
>
>>
>>     David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, 
>> MK1 1PT, UK
>> Registration No: 1397386 (Wales)
