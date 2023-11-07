Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CAB7E3207
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA3610E47A;
	Tue,  7 Nov 2023 00:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DEE10E47A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:10:14 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc7077d34aso38104645ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699315813; x=1699920613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8eZ4f+HKE0Dret1qHPporvZn8dbeKhvVjY9m+eg4eA=;
 b=in/YozLAcOb3hksv1U8REKwAaXOaFAWumsbswqrRcnoyPN0vSB1CKkbHNhEtSxzd8Q
 LJVnxGXW93rDJSwBIJHKZLAKDwHH3s5Dv9OiDy2j4J7eIlq1TzrI1UEZyjsos10AB3Cq
 zQVKlkDQWb4Ba9+kYubrV1dm6wD3mHrtPQ+gWR4uClDW4vlM9Gae5SndRlNOe/awI5b2
 NT7NW9GxZkQLZhXGkn/CVu8trKYZ2/L/r8ULT5nds4HFTZyC6nRueZA7SWUZteR2S2Gk
 Y3xCINkUCnVOcxCxrzqAVAfCgUvU/FAOWjpk6WsvII4hbHct000WsDOQ5zdcPmy+KTNn
 ER/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315813; x=1699920613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8eZ4f+HKE0Dret1qHPporvZn8dbeKhvVjY9m+eg4eA=;
 b=SrCXwB0BdRuVRlvNBPB67yyvx1ceG2gAASwGWGZ+itjW50nT8Y7o67cl24PWIAAoWu
 YNt7jvkemeWaeUChZfCQNaMnpJ4NX5CjIPBxbQch5mFYVrYg1fCMMt9hciWSApWIwPzp
 kYjprl2vLTXVhzBB2NGkhY2rD6XFnNya55xTW4Jnnf286hox70zhwX4p9JsAF2JHIa13
 rI6l5tUirVK61jtgImTuymh44C191mF77rye7841Q+A59SOG3ojx4YIvghN8wwxsZe0U
 AF/wyHey+rsrMZNsjw8ZPp/lL9JDKuG+F0vHdPnsfqrsuH23qUwE2m7u10hQIhc9noR8
 tl2g==
X-Gm-Message-State: AOJu0YxzVfSLjE6iT0pVCmAxa5UMgs6VYty8cb7Xi03DW1h5dzQJIwfP
 q3uXgRjNKln8s6iXh2U/Mxk=
X-Google-Smtp-Source: AGHT+IHrvLSKOdFW+GmkHNiYDqpZ6dXWWQRLcaGPmm9XNsTWQ7pgImbbpKjHA5FepORg8sPiLvZKKA==
X-Received: by 2002:a17:902:e30a:b0:1cc:644a:211b with SMTP id
 q10-20020a170902e30a00b001cc644a211bmr14076999plc.47.1699315813424; 
 Mon, 06 Nov 2023 16:10:13 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170902704300b001c613091aeasm6349072plt.297.2023.11.06.16.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 16:10:12 -0800 (PST)
Message-ID: <5282cf04-eae4-4170-a833-cf4c4495a943@gmail.com>
Date: Tue, 7 Nov 2023 07:10:01 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
To: Jani Nikula <jani.nikula@intel.com>,
 Hunter Chasens <hunter.chasens18@ncf.edu>, corbet@lwn.net,
 Luca Coelho <luciano.coelho@intel.com>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <8734xj18ck.fsf@intel.com>
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
Cc: tzimmermann@suse.de, Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2023 17:31, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
>>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>>> index c237ebc024cd..23ba7006929b 100644
>>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>>> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>>>  drm_i915_context_engines_parallel_submit to the uAPI to implement this
>>>  extension.
>>>  
>>> -.. c:namespace-push:: rfc
>>> -
>>>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>          :functions: i915_context_engines_parallel_submit
>>>  
>>> -.. c:namespace-pop::
>>> -
> 
> What makes the namespacing unnecessary?
> 
> $ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
> Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
> Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
> 
> And you get [1] and [2].
> 
>>>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>>  -------------------------------------------------------------------
>>>  Contexts that have been configured with the 'set_parallel' extension can only
>>
>> The warnings go away, thanks!
> 
> What warnings go away?
> 

Oops, I mean the patch author had silenced these warnings.

-- 
An old man doll... just what I always wanted! - Clara

