Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53C77E291
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263710E0CA;
	Wed, 16 Aug 2023 13:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3202D10E371
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692192558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zzWey38HM2kl2tP6Yo35O0O7svAYPRwrWuIqvfpikk=;
 b=O4v8xYrOOhAxxOanqHhJ+Yg+/HIHzMibQLxrTRPLiUn0u/7wVfgJuRkl4COjeZYepyylD7
 a1GhWQaSWExOXBE8i917zqXryA1te7Z0j6I9/HsDoGZKFYe/aOdk7erMs2WD6JE1t28633
 ivLbVvln8JcLWN1jJhL6CS0mCYhKiW4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-2Zq-KqSPPyOqzIhBaRuqpw-1; Wed, 16 Aug 2023 09:29:16 -0400
X-MC-Unique: 2Zq-KqSPPyOqzIhBaRuqpw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51d8823eb01so4209859a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692192555; x=1692797355;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zzWey38HM2kl2tP6Yo35O0O7svAYPRwrWuIqvfpikk=;
 b=MayEuJTwF6vWBnji9avG448tXeKDxgR4jfZiJ1/nSPzwwTwhBasvaIJmVG+TIemK63
 Wa5Nx+TiMvwnEsMXI8R3ncrjnVZdNlYYV1zXQAmHpAi8B5R0zDbcj2QDRqOhA4N4bH4O
 Iwxq2ue3ks3TzVwHWZLEQP9zlEFsZI68sLAbL9/n/oHiI3zohzvvJiX3fqYjDswal499
 mNjv+yjsvWg1ewjS8FvSizAbnrgW+8TUxHd4hAg5Hoq9rLvyhcW18BW2osjBR86ukPRH
 e7Vus34TYCRQ+aEOpz+X47j7DeyJ+PFkY+3p5c4S2uAE+llG+uZTE02U9OHKuhhrsN3g
 OmJw==
X-Gm-Message-State: AOJu0YzVXmpKXk6LU1K9ULwqLI7sNQEEjqmCiRm3tdBQl4W1T8RgGpoa
 3MCjFQMHQNVrHRTaerY8pN5SWp//o2W0qf1eJMFo50qptQ3oc1N426Pi68oTqBBMj8i0BHUCB3r
 HvJOVkf1cRJ87sNntGk9vZBgoezqk
X-Received: by 2002:a17:906:118b:b0:99d:f0e8:5623 with SMTP id
 n11-20020a170906118b00b0099df0e85623mr1477940eja.54.1692192555666; 
 Wed, 16 Aug 2023 06:29:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7BO553Uv2K2M6GZIjOmPRpCfK/eILJ+o7OHtWwUS+06gCkH7BYmuFP151ju9neAoHrQ836A==
X-Received: by 2002:a17:906:118b:b0:99d:f0e8:5623 with SMTP id
 n11-20020a170906118b00b0099df0e85623mr1477921eja.54.1692192555305; 
 Wed, 16 Aug 2023 06:29:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gx20-20020a170906f1d400b0099cbe71f3b5sm8452748ejb.0.2023.08.16.06.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 06:29:14 -0700 (PDT)
Message-ID: <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
Date: Wed, 16 Aug 2023 13:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230811023137.659037-2-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On 8/11/23 04:31, Matthew Brost wrote:
> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.
> 
> 1. In XE the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in XE we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> 
> 2. In XE submissions are done via programming a ring buffer (circular
> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> control on the ring for free.

In XE, where does the limitation of MAX_SIZE_PER_JOB come from?

In Nouveau we currently do have such a limitation as well, but it is 
derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
always be 1. However, I think most jobs won't actually utilize the whole 
ring.

Given that, it seems like it would be better to let the scheduler keep 
track of empty ring "slots" instead, such that the scheduler can deceide 
whether a subsequent job will still fit on the ring and if not 
re-evaluate once a previous job finished. Of course each submitted job 
would be required to carry the number of slots it requires on the ring.

What to you think of implementing this as alternative flow control 
mechanism? Implementation wise this could be a union with the existing 
hw_submission_limit.

- Danilo

> 
> A problem with this design is currently a drm_gpu_scheduler uses a
> kthread for submission / job cleanup. This doesn't scale if a large
> number of drm_gpu_scheduler are used. To work around the scaling issue,
> use a worker rather than kthread for submission / job cleanup.
> 
> v2:
>    - (Rob Clark) Fix msm build
>    - Pass in run work queue
> v3:
>    - (Boris) don't have loop in worker
> v4:
>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

