Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B090924E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 20:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55CA10EE20;
	Fri, 14 Jun 2024 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SdcJhzgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C9310EDDF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 18:32:25 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b064c4857dso12079626d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718389944; x=1718994744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=a+ZJEh6x6Lv8M2AN3cpcyYkfsWGE1WXAQKMbV67aTJY=;
 b=SdcJhzgcrsPU4BlzVTmWfjVPqABbr4oEtGddyNjGKNxo89BSiim/JH39ixYG+qo7X7
 U4zgxLgnroRxX3Ns4st9N8LDYWe0sw5GeCi3XQMismn9Q4iQBNqWGk54ULf8vktGoImy
 /xYTirn+mGANs8hZTrcT3Y49RTgaaZYx+El5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718389944; x=1718994744;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+ZJEh6x6Lv8M2AN3cpcyYkfsWGE1WXAQKMbV67aTJY=;
 b=OSgcys6stACmNtlVtjYa4ZRp/Nawla+F300KvN09/K8wMQUmwggkP6Gh7EKjMEaQKM
 AWmAZeFZ7YuYWjXB5ilBRNmz7sQ7MX+KdAOZLNGbAcrX10iu0I8pf60WCm4HbJDLpLer
 VPtwKJq/ImP7Dc4HilKm3WOqXKSeC7P1oP62/1wZj/4YSiheQZ+tsII/NOJw8fx4wZu5
 6XE1IlkBxsJjxMfD9SfVKCxGayQ9U0t428H2PM8c02ilSKFCo+rk3ArVWWPBNZc1tLyz
 ZQzW4vWBoTolpfsPhmrF2mr/ZoJ1bOvL077Ym9W7qbiMKpVZQltRNAYNt/GdnaKfDvT/
 QPUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwpqWJjS40mb8Wo9kieVQG4f0GDcbDUpDZgF1Z2fj2oMxBhp6o+BHlm6lVj019nnwvOZ+X6uycWvLLKXy4FqFHxTZxzhugB7Tkfi+8VPUf
X-Gm-Message-State: AOJu0Yzhx1kzeI46KUlZE9myWJIgjXSTMnOsQNM3XH7zpvEsfySmmmlO
 NwC89QUdWT0Wjj8u7ktKX1Ysp0LULeT048ArCu6oCRpOsY7KH0bcYOezAtva2Q==
X-Google-Smtp-Source: AGHT+IGioDtYzmWk+SYhqfm9DebuWAb/mp0AENVr2ydYI4ZP81ROYuzpODtzdxlMQipzCd3UYBAVtw==
X-Received: by 2002:ad4:55c3:0:b0:6b0:8041:8ae1 with SMTP id
 6a1803df08f44-6b2afd94baamr30167806d6.61.1718389944507; 
 Fri, 14 Jun 2024 11:32:24 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c10580sm21164366d6.32.2024.06.14.11.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 11:32:24 -0700 (PDT)
Message-ID: <1750e44f-f9a9-4c2a-afb3-f1ae8237ccb0@broadcom.com>
Date: Fri, 14 Jun 2024 11:32:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com, Tim Merrifield <tim.merrifield@broadcom.com>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
 <20240613191650.9913-9-alexey.makhalov@broadcom.com>
 <844ef200-aabe-4497-85c9-44fc46c9133a@intel.com>
 <20240614161404.GCZmxsTNLSoYTqoRoj@fat_crate.local>
 <74f8300b-3520-4824-81e3-71464e3da3b6@intel.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <74f8300b-3520-4824-81e3-71464e3da3b6@intel.com>
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



On 6/14/24 9:19 AM, Dave Hansen wrote:
> On 6/14/24 09:14, Borislav Petkov wrote:
>> On Fri, Jun 14, 2024 at 09:03:22AM -0700, Dave Hansen wrote:
> ...
>>> You need to zero out all of 'args' somehow.
>>
>> You mean like this:
>>
>> 	struct tdx_module_args args = {};
>>
>> ?
> 
> Yes, or do all the assignments with the initializer.  We seem to do it
> both ways, so whatever works.

Thanks Dave for pointing that out. I missed that at v7.
