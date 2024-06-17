Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0290A903
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA0D10E216;
	Mon, 17 Jun 2024 09:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="FdgfeV8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9010E319
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:06:03 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso525607566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1718615162; x=1719219962; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gvRmkc7UYREFAt7qwezSV/9vtY87peLc2FPTpzihZiY=;
 b=FdgfeV8b06czuZ+tvWHX8VOlaNmzYh8WlrfedQ47X5QpXDg7QUOZgL/IOiBnT7Gr/L
 xdND5UbpwE1TbBWOkO9XgVG3VysRVEVlf32cYLs5686XCYO7W9ZHOYN+1ooFj+mL7HXG
 LCw7qAR0MppD70KBe0U4VvNjwjZLZcTGnJF0aiw7/AjG9lV1Sq+T4PvxUWBk4dA0CRCv
 UgFbAiw7QwZ8AZTQYjVFIFHq1uzB7LMc+u8LNeSj5DQq/+RYbAvmyD58WFUneLmuUMuA
 YJh8pEEmSsosT/+uNOnGdXMZ8wxaLwiU/NhxAyK9TRjRBUAdtbGgLmX7lilq3555iGF8
 0t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718615162; x=1719219962;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvRmkc7UYREFAt7qwezSV/9vtY87peLc2FPTpzihZiY=;
 b=f2OXOYSCtsS/ilar1MK6Xe5g2OlPDDyFqJAcfW5AgqekPlfFoulGgOV/quymEABwNn
 idR1xt7lppecpguY9tFH1xUyuY0STHzTzWewxi9CMtGYJlNs2quSh+TTGxp2wFhwdphU
 WV/0dsB1OZPft1udPIpc77oRfzXtDPFPq8IzbYqbik9v90RjW2hL3urViuPQBC0OSzXi
 z74ClRkY6MK7r3y5JWHU7gv+cYzdwdkQICuUr3dIxYxFxNlOUCb1HyJNp9mMsDMPRqm7
 I2pdWgPVfIFvJwO3nIgKW4A0ND/ki8EzeP95LFMDDR/y15gzlgNanaNl2OHbGH+ZsmCu
 UR0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxQsYhCJHoSs4zvrqXGqD81NPaZFlUpTKFPC+YM6NEL/xqY082VivpQa1q/ubj5P9vm+XWHyV6vB//sbsKwKZjEHO87tueJFFMY2eF8oi2
X-Gm-Message-State: AOJu0YzcyPZyvzpgUEdPYZmXx2G8jWhaUE1iUyrIDHTqv02tJF1uUggK
 cF0NrKaWqQPvZxYkVvRvT++dNzFnMfelHgbznJE7UBxKHThwYh8SEAXOTpVHsw==
X-Google-Smtp-Source: AGHT+IFio7W2H3McMW1GKQcHEpdNgG7x0U4Q8MuX4Z8BRf4WELajR7xgxbuujSAPdNrXPTo6eholRw==
X-Received: by 2002:a17:906:f2ce:b0:a6f:1045:d5e2 with SMTP id
 a640c23a62f3a-a6f60cee9c6mr613581266b.4.1718615161595; 
 Mon, 17 Jun 2024 02:06:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4486sm495066766b.1.2024.06.17.02.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:06:01 -0700 (PDT)
Message-ID: <b4b14998-8b17-4a22-9c1d-427be61c06a9@suse.com>
Date: Mon, 17 Jun 2024 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <Zmxxbk-xWp9AjqIB@itl-email>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <Zmxxbk-xWp9AjqIB@itl-email>
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

On 14.06.2024 18:35, Demi Marie Obenour wrote:
> On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
>> On 13.06.2024 20:43, Demi Marie Obenour wrote:
>>> 2. Add support for `XEN_DOMCTL_memory_mapping` to use system RAM, not
>>>    just IOMEM.  Mappings made with `XEN_DOMCTL_memory_mapping` are
>>>    guaranteed to be able to be successfully revoked with
>>>    `XEN_DOMCTL_memory_mapping`, so all operations that would create
>>>    extra references to the mapped memory must be forbidden.  These
>>>    include, but may not be limited to:
>>>
>>>    1. Granting the pages to the same or other domains.
>>>    2. Mapping into another domain using `XEN_DOMCTL_memory_mapping`.
>>>    3. Another domain accessing the pages using the foreign memory APIs,
>>>       unless it is privileged over the domain that owns the pages.
>>
>> All of which may call for actually converting the memory to kind-of-MMIO,
>> with a means to later convert it back.
> 
> Would this support the case where the mapping domain is not fully
> priviliged, and where it might be a PV guest?

I suppose that should be a goal.

Jan
