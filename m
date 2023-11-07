Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBE7E320A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55D510E47B;
	Tue,  7 Nov 2023 00:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF59F10E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:11:30 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1cc394f4cdfso34825445ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699315890; x=1699920690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7B09rSr5GJkw/0dQmc8mF4yG+hQAobhEyf39vTwquM=;
 b=Ez9/u1Sj9he2eidSyza90VESRuI0qIAqz50/ybhtft0WpPb7wSGaAaiOMR35YcaJxh
 12iYFPUJP+zo+1pHezrjKyTUZYa9dDbacLM9S7ruE+kZHnyRi+m/D/yJQ0KbnZtheSg2
 tDr/NT+eLVkUohxo7kE+1x/d6sMijAbtmJnioGcCb6heDdo9sD4t61TOvZsi5p1p2+2Y
 A2ZtAQUBuOhKQjcs5FdigClKFYMhWdReeY4c2B/OhqpO5z9JjkFJ0H/KDz21yzbWGQfU
 6R2HxWXo1YvzG9zdXWMhqBpx4ECRDnwfkMlmpmf1XM5c0E3/TxYGKgNz5Wqzm7f37rAE
 aAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315890; x=1699920690;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7B09rSr5GJkw/0dQmc8mF4yG+hQAobhEyf39vTwquM=;
 b=i23a6Cc4NoAp/uwjPu3NYOv5km3R1nS9dExw59kYFmfTsEB4BD/nKBE+AZRyQUWfXX
 XzVSNlncVYSNENZYrl2flBXTplc3J7mF3SWcSY8lwz7Y8ZCCSOiPX9uFFFjJnEeUAmPk
 QabHOg0nGMfeEyHmiQJhleTjcN2fieW27IhMAqTTzYYxY8C7CuGlKv7F1woD7ARgSvHB
 vd7OJF3yXTAa3GJqI3x/ULICjmIrTVW/cokk6DRelogY+4JPmYQrmK6kS1auEB1kcEBV
 5ms6+YJ6Ir4iWXQEwVW6EkjwTAVgo5xdjuP93kPdmr+8KSS8lBcdj9Z0a76UAgHxc1lu
 cDrA==
X-Gm-Message-State: AOJu0Yxvxjn5unqCsI7uMIvaiMhwSElTdmTrFdLK97fJJCk/njH40MtD
 qbGsgKwQ5G8pPlejzWOTbYM=
X-Google-Smtp-Source: AGHT+IGrJMlHOCbcpWm2X90lUXcYyOPz2Ac8+C5VB8yvaTcCqw7r5AWnImvajZcO6HTUrg73F2RBiA==
X-Received: by 2002:a17:902:f28b:b0:1ca:8169:e853 with SMTP id
 k11-20020a170902f28b00b001ca8169e853mr21625676plc.4.1699315890325; 
 Mon, 06 Nov 2023 16:11:30 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170902704300b001c613091aeasm6349072plt.297.2023.11.06.16.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 16:11:29 -0800 (PST)
Message-ID: <ccf8c3df-ba3c-4546-88fb-dfd78ea974eb@gmail.com>
Date: Tue, 7 Nov 2023 07:11:26 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Hunter Chasens <hunter.chasens18@ncf.edu>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
 <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
 <87edh2zn2y.fsf@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87edh2zn2y.fsf@intel.com>
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
Cc: tzimmermann@suse.de, corbet@lwn.net,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mripard@kernel.org,
 Luca Coelho <luciano.coelho@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/11/2023 02:41, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Hunter Chasens <hunter.chasens18@ncf.edu> wrote:
>> When running `make htmldocs` the following warnings are given.
>>
>> ```
>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING:
>> Unknown directive type "c:namespace-push".
>>
>> .. c:namespace-push:: rfc
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
>> Unknown directive type "c:namespace-pop".
>>
>> .. c:namespace-pop::
>> ```
>>
>> The kernel test robot also reported it here.
>> Link: https://lore.kernel.org/all/202311061623.86pTQrie-lkp@intel.com/
>>
>> Last year Maryam Tahhan <mtahhan@redhat.com> from Redhat noticed something
>> similar. "The missing support of c:namespace-push:: and c:namespace-pop::
>> directives by helper scripts for kernel documentation prevents using the
>> ``c:function::`` directive with proper namespacing." From the context, it
>> sounds like this was brought about from a Sphinx update.
>>
>> Link: https://lore.kernel.org/all/20221123092321.88558-3-mtahhan@redhat.com/
>>
>> When compiled the `.. kernel-doc::` literal gives it the same formatting with
>> or without the namespace directives present. Due to the above information I
>> think it safe to remove these, as they don't seem to do anything but
>> throw warnings.
> 
> Not so fast!
> 
> Looks like this is because namespacing was introduced in Sphinx 3.1
> [1]. With earlier Sphinx, you get a warning about the namespace
> directives.
> 
> However, with newer Sphinx, you get the warning mentioned in commit
> f6757dfcfde7 ("drm/doc: fix duplicate declaration warning") if you
> remove the namespace directives:
> 
> linux/Documentation/gpu/driver-uapi.rst:2279: WARNING: Duplicate C declaration, also defined at rfc/i915_scheduler:3.
> Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.
> 
> It would be short-sighted to just remove the directives. Sooner or later
> we're gong to bump the (IMO extremely conservative) minimum version
> requirement.
> 

OK, thanks for explanation!

-- 
An old man doll... just what I always wanted! - Clara

