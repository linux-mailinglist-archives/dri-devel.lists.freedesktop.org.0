Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE08B7B73
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 17:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C75112081;
	Tue, 30 Apr 2024 15:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cvz2w2a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B05112076
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714490854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWtxSZn1N9aOFm19Phv8DcHxTcsBJVBx/PojXqTTIKA=;
 b=Cvz2w2a8tk1j9U1dsXOlEyRCJ1XBkPacZlH5FkwCOkWf9fCExJMthjRzipBojsFrjebyPg
 KUoCidD9VYT+Sz0xGjN3VXc/vgyE7fOoSgbjD7t3u+IR4l+PRCnYorMlu7g2VB3VHfCWhl
 4dvLk5P3UXqckaHgn4yqMgHSFw0KVVw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-mmnSmgjgNCWfCjLMESOMwA-1; Tue, 30 Apr 2024 11:27:33 -0400
X-MC-Unique: mmnSmgjgNCWfCjLMESOMwA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-34d9deebf38so321986f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714490851; x=1715095651;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWtxSZn1N9aOFm19Phv8DcHxTcsBJVBx/PojXqTTIKA=;
 b=IXQt2ifkaMKoJscv0dR0b+mhGBQgIcdpt2EOR58mNEIanF9fk4Ecn9dGniKYTyY6yI
 0FgWh7rs6nv/i4i2tqahn0P8n0H/ujDIMP61oaamdqkxtQMxBwj/ieAkcmUHWbMHQjpi
 yeXwR3IAgvXZpPl8ClETbtUrd5WTL0xd54WhDuOxcJOeJKy57NwW9nFvSiHDrHmAfS5x
 6cFIA8GdP/cN+wLAics0YRkYdC+ImsHu0E+j4UbHXCpzKx17I1EiVNoCKJfr9EJrlr3t
 vWXYbTQdGkQo3sprXVezn/BnY7uB0L4ewk3QuKjiKcQnVCKaN5bDYlWM87ObxWTcdopa
 KE6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JF0mLw3MBUNf4+dhb2VeXvqpdqzcfUFKbiy0gzcoRYxo332YPGOlhqmxkXuZ6+IlPUr57zt2aigGUkhii6TIJOYhJapAb2ab6OBVNO9j
X-Gm-Message-State: AOJu0YzCKYq28fyjFbpqN8HrjAd2N4YOzbpWSQJvMKgr3zV7MQXVMHik
 RqwhY94R3vOnwTrbAUsHELpn9l8RunBG/VWExWTUoscnlt62UoIgHnbl83E2smiPSJVM33Y3kAO
 LL5E/wO39Nr5sCZ3BqA5tx8zKCiFHdxURtZcuuQLKdQhcNMwcYoIAdgV+33CsOUBLxw==
X-Received: by 2002:a5d:6da5:0:b0:34c:b2bf:25a2 with SMTP id
 u5-20020a5d6da5000000b0034cb2bf25a2mr9396663wrs.65.1714490851486; 
 Tue, 30 Apr 2024 08:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu4ZxUrtwb50f+b3zmNkyfi3f2GonTEC8ErfUDVZ55lEzkLL2hQttAJEidMAQDM5rIu1v95w==
X-Received: by 2002:a5d:6da5:0:b0:34c:b2bf:25a2 with SMTP id
 u5-20020a5d6da5000000b0034cb2bf25a2mr9396652wrs.65.1714490851159; 
 Tue, 30 Apr 2024 08:27:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adfa30e000000b0034da4e80885sm971075wrb.59.2024.04.30.08.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 08:27:30 -0700 (PDT)
Message-ID: <848f4b3b-eb6e-41e4-b410-4867351c6eeb@redhat.com>
Date: Tue, 30 Apr 2024 17:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: fix missing linux/debugfs.h includes
To: Jani Nikula <jani.nikula@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, lyude@redhat.com, andrzej.hajda@intel.com,
 lucas.demarchi@intel.com, alexander.deucher@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
References: <20240430142622.217616-1-dakr@redhat.com>
 <875xvy3nr6.fsf@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <875xvy3nr6.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 4/30/24 16:53, Jani Nikula wrote:
> On Tue, 30 Apr 2024, Danilo Krummrich <dakr@redhat.com> wrote:
>> After dropping linux/debugfs.h include from drm/drm_print.h the following
>> files in i915 miss the linux/debugfs.h include: i915_debugfs.c,
>> i915_debugfs_params.c and i915_gpu_error.c.
>>
>> Add the include to fix the corresponding build errors.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 33d5ae6cacf4 ("drm/print: drop include debugfs.h and include where needed")
>> Closes: https://lore.kernel.org/oe-kbuild-all/202404260726.nyGuvl59-lkp@intel.com/
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Thanks, but it's already fixed by commit 7fa043eafdb7 ("drm/i915: fix
> build with missing debugfs includes") in drm-next.

Even better, note that drm-misc-next is still broken though.

- Danilo

> 
> BR,
> Jani.
> 
> 
>> ---
>>   drivers/gpu/drm/i915/i915_debugfs.c        | 1 +
>>   drivers/gpu/drm/i915/i915_debugfs_params.c | 1 +
>>   drivers/gpu/drm/i915/i915_gpu_error.c      | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>> index 24c78873b3cf..b552e27cdcd5 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -26,6 +26,7 @@
>>    *
>>    */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/sched/mm.h>
>>   #include <linux/sort.h>
>>   #include <linux/string_helpers.h>
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
>> index 8bca02025e09..295486b8ceb1 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs_params.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2019 Intel Corporation
>>    */
>>   
>> +#include <linux/debugfs.h>
>>   #include <linux/kernel.h>
>>   
>>   #include "i915_debugfs_params.h"
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 2594eb10c559..625b3c024540 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -28,6 +28,7 @@
>>    */
>>   
>>   #include <linux/ascii85.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/highmem.h>
>>   #include <linux/nmi.h>
>>   #include <linux/pagevec.h>
>>
>> base-commit: 4a9a567ab101e659a4fafb7a691ff6b84531a10a
> 

