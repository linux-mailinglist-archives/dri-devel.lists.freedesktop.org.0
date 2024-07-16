Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0993276A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5119F10E656;
	Tue, 16 Jul 2024 13:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwbBhSNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CE10E656
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:26:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-367ac08f80fso2984968f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721136403; x=1721741203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S+JOObWqSN6VhnREeiH5a9x8BzvjSanlFTh/dp+QXsg=;
 b=fwbBhSNx6V0WY7BhNOdyWxz5u8gosPTSh0ZG5jdaKctgFNV498n0s/xDFPH5EqwBko
 LrKbyA3J6kVRBnFpqzRhU7XTn5Z6a0+H7D1+dcUhZ9BI3LsovU3BFVKM3gV0XAyZtCdb
 qXyjn8et8uW+Pu6UOUNDNPYuqQ7pLsu8NHg1DqeKoQOmnoevWtF9x07BPlPC03NVDWW0
 aXRNGfKEo9MWer2vvVzWUsExq3tKKTKyQgUP8se573eO5R+0+jvLZ5tdlHclNkngkF6U
 4O7hHfVNKYAY6aLZFYlpAMqjaHeAPcmhvt/f0yMmtryJsDnniNZ+Cpr1XZttxVxX+YyU
 Sejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721136403; x=1721741203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S+JOObWqSN6VhnREeiH5a9x8BzvjSanlFTh/dp+QXsg=;
 b=QDXQrCKhAUOEexObCryQzKzY9VxZbFDXTgIMUvFE2NgI5BKmy7poKpKGI0Beol7tZs
 rXoL+M0JA4ZnBqhSaSev6xh1DpQg+COGJl//RcP6ko4eI+kIfzJ7jaaHi1Gz3ZfwPQug
 VsQl/+fMO3DceZrgRwSGEltYg7XFNgdno6tKGX1RBlwlRceQA+q7PY/FEOWVWhAX/yJm
 fG7R/a99kLOVfhgNllyu0ggX6UcgHHq5/4QAbTqND+MTE0incFePvE4eloAOkswEMXEP
 skoi6yaaTkFVhYIDPQt/tJUeu0fql/cdXotYZGcDVbMlZx8wV+MHTvcXFeje50ryj+tR
 DoPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDFB6wG2aukLYd7MBvtOd9xZkXGo/32vZmIfODR7S0/VWypaqhdkeRmmwVAzu6OLJCnOT/YsjY7N7kLZD8LAKL1NyIA1r1NfsGj8Pb8nVz
X-Gm-Message-State: AOJu0YxmRdvhGEUApiDoyFeQ6ebN/IiAvWKSTK8YA4W6gzXfEUpugwT8
 krz+T9oqTMrfvScCk640jBnURAIJYI5dceD64QHXN5/nRv5Pd4rI+sJVlTQA
X-Google-Smtp-Source: AGHT+IHPZQStrW5oWlh0MVTXrliE2VAyqDnKNwXgUw9+adiEDvinBCrCdyQUiOSRBoEwoKCoW9GCSQ==
X-Received: by 2002:a5d:4cd0:0:b0:362:7c2e:e9f7 with SMTP id
 ffacd0b85a97d-3682614ee0cmr1298644f8f.32.1721136402452; 
 Tue, 16 Jul 2024 06:26:42 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db0ee46sm9017082f8f.114.2024.07.16.06.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 06:26:41 -0700 (PDT)
Message-ID: <d2dbd3cc-88cc-45e4-9451-6e72578846c1@gmail.com>
Date: Tue, 16 Jul 2024 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Switch reference counting to GEM instead of TTM
To: Danilo Krummrich <dakr@kernel.org>
Cc: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <4e38cc8d-ba25-4e13-adaf-8cd9fc557baa@kernel.org>
 <6819d277-e5c3-4648-8b56-bcfbf793a59d@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <6819d277-e5c3-4648-8b56-bcfbf793a59d@kernel.org>
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

Am 16.07.24 um 15:24 schrieb Danilo Krummrich:
> On 7/16/24 3:12 PM, Danilo Krummrich wrote:
>> Hi Christian,
>>
>
> Forgot to say, please also add driver maintainers and related
> mailing lists, dri-devel gets a lot of messages and I saw this
> series by chance.

Ah, yes good point.

>
> - Danilo
>
>> On 7/16/24 2:35 PM, Christian König wrote:
>>> Hello everyone,
>>>
>>> to make use of drm_exec it is necessary to have TTM drivers actually 
>>> use
>>> the GEM reference count instead of the TTM one.
>>>
>>> This patch set is a start to do that. It switches all uses of
>>> ttm_bo_get/put to the GEM counterpart and then makes ttm_bo_get private
>>> to TTM.
>>
>> That makes a lot of sense.
>>
>> But I think for at least some drivers it requires a bit more than just
>> replacing ttm_bo_{get, put} with drm_gem_object_{get, put}.
>>
>> I gave this a quick shot on Nouveau, and as is, it creates a refcount
>> underflow for the GEM object's reference count.

Crap, I thought I got all of those.

>>
>> At a first glance this seems to happen because some of the previous 
>> ttm_bo_put() calls intend to compensate for the initial refcount of a 
>> ttm_buffer_object.

Mhm, there should be only one left of those.



>>
>> I will have a closer look later on.

Thanks,
Christian.

>>
>> - Danilo
>>
>>>
>>> Netx step is to completely remove the TTM refcounting.
>>>
>>> Please review and/or comment.
>>>
>>> Cheers,
>>> Christian.
>>>
>>>

