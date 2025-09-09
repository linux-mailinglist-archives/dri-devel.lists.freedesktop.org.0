Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D94B4A566
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594510E655;
	Tue,  9 Sep 2025 08:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a3IE4ixO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722B210E655
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757406918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRwU3Tf4e9BAn16grpDelyCP6SF+f+tK6tH4I4H1cTI=;
 b=a3IE4ixOc8xOGiqJtp1x+Ls8DKsyxB9elwUwIVtE3YeyqAeKLHIaFDQ3OwgMuX4ZX1i86G
 sJve1CmDWVmavwNi4GuluG+Sa+HJJoMlzoWfnfLVhNHzNJafyDuzv3U/smqte+E4g/Dx4C
 MiVxUNF9zuQ5oBrw1JBj1gU2floTEgU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-VYG1R_zCNL6mhVkVgSWVfA-1; Tue, 09 Sep 2025 04:35:17 -0400
X-MC-Unique: VYG1R_zCNL6mhVkVgSWVfA-1
X-Mimecast-MFC-AGG-ID: VYG1R_zCNL6mhVkVgSWVfA_1757406916
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45ddbdb92c5so18727345e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 01:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757406916; x=1758011716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pRwU3Tf4e9BAn16grpDelyCP6SF+f+tK6tH4I4H1cTI=;
 b=HOqPk32MOzuI5gX0sOcqWn0s07gCHFAT7cNTOonULUHvk4cdcGVtJZiStOEVEFC+0B
 Xonu35+5UTZuCRoYUpGmzCUcGW/DDqRo5XTfXvhmnL5XoTIwAG2PFZHLh9aumHOA93Q0
 slkolLwDgSRkt3OKngz+HTNqgYsdLbi5XhrhQZU7BzdqUbVF2zbfk/g4z+7gxdrxCS6D
 mzJeX5JQwpL7DYIdCs3unsPi1Z/mdfuX8oDV2U6MfT9AzlV6DWL5haonTc5bdwzQz/KB
 g58ht/pbXxWmhfSZguu9T4XRPE0r2+nA5KmNh2/xQ6g2eYDA2zzsO7TQkxTbScmVDn9R
 HfzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEFb0I5/XE5lSsME01U1/g85X5kWV/bg86H/6UYM47HZ6HaHcPireKB1lOrHyMUV0wiTM1Q/FTiiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS99S/NBSlCtzWqYwvz4uShc42ul2mEBYjIar9VSNz8Mn3dHPM
 HtP9oVBBvUP58zGKnZ5yOaUjyUWCbzdbigrHNSPeN7YHKUaNQYTZK/3yLZi9BhXrlR+LZC6G9bM
 T0M10qb0JrGVhUldy6L0LWl5yO/EC6kSerzBhLl2Ara4vo7RaR+RgN4EsZuAAprJ0hhIN4A==
X-Gm-Gg: ASbGnct6hDngHVXruDguqJJbC/8HiWN4hnwzhktaEDBDJKSCMTDo2iZr9EkvAiPDvTV
 mymC2Dwshz13CZBAQ91PgP/BmU1obn20GHiUg+DCWffXl/GY4s+5p+8kvIm/J+s1uDCwkJbRoob
 5FLoFijEiw9Gh2sj+UvLZy+cARuwGW8DUVQjc1A1SYYG1afv/m6jUuPoydtfD6b/MnB9/HCSfa3
 ffg/w5pJqSlFW0xlBjcPOffjJtjhtZr+L5sJP0F9rPEU2QFfdDzE0iwBUPyOchquE9zLsA5fOFJ
 5ksGJ5+mo7U1/2KbNXVPXDwSxX8VpXr8BJjs5hZcekK8QcQwbUMHG5hcEYbCUyVVl8eQCiqddtP
 3P98=
X-Received: by 2002:a05:600c:4f47:b0:45d:d903:beea with SMTP id
 5b1f17b1804b1-45dec7992demr28468455e9.30.1757406915601; 
 Tue, 09 Sep 2025 01:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUazJCUacJXQ6oBlfOIRmN1i8Vqv0hg7TTzbVGz98N/lGvO+upxJKi/IvXMF/CIovMGN8ywg==
X-Received: by 2002:a05:600c:4f47:b0:45d:d903:beea with SMTP id
 5b1f17b1804b1-45dec7992demr28468065e9.30.1757406914960; 
 Tue, 09 Sep 2025 01:35:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df026aa13sm5942365e9.4.2025.09.09.01.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 01:35:13 -0700 (PDT)
Message-ID: <d24559ab-9ab1-48cf-9621-05ab7af009ee@redhat.com>
Date: Tue, 9 Sep 2025 10:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
 <923276d2-9240-48bd-95df-13b4e9e23dcd@suse.de>
 <7ff51c5b-939e-47d9-8c3b-3c596565d114@redhat.com>
 <pucvcimuuyz7f7ih7hx7l6bmutarlryvzwiqh7a26bk65ya5sf@uj7agoqm4lm3>
 <533c2197-d7bb-4294-a094-c4f993a5893c@redhat.com>
 <20250903-benevolent-boobook-of-wholeness-e631f9@penduick>
 <a8af8630-043f-4bdf-af77-8f02f992f221@redhat.com>
 <20250909-terrestrial-straight-piculet-c43bd6@houat>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250909-terrestrial-straight-piculet-c43bd6@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zSGwpoaRsj-VQvR_ykd0-2Umis7_HWGQIDH7SlB-Uik_1757406916
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

On 09/09/2025 10:01, Maxime Ripard wrote:
> On Mon, Sep 08, 2025 at 10:55:17AM +0200, Jocelyn Falempe wrote:
>> On 03/09/2025 10:19, Maxime Ripard wrote:
>>> On Wed, Sep 03, 2025 at 09:30:23AM +0200, Jocelyn Falempe wrote:
>>>> On 02/09/2025 18:58, Maxime Ripard wrote:
>>>>> On Mon, Sep 01, 2025 at 03:04:26PM +0200, Jocelyn Falempe wrote:
>>>>>> On 27/08/2025 12:45, Thomas Zimmermann wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
>>>>>>>> This is a bit hacky, but very handy if you want to customize the
>>>>>>>> panic screen.
>>>>>>>> It allows to dump the generated images to the logs, and then a python
>>>>>>>> script can convert it to .png files. It makes it easy to check how
>>>>>>>> the panic screen will look on different resolutions, without having
>>>>>>>> to crash a VM.
>>>>>>>> To not pollute the logs, it uses a monochrome framebuffer, compress
>>>>>>>> it with zlib, and base64 encode it.
>>>>>>>
>>>>>>> May I suggest to export the raw image via debugfs? Debugfs can also
>>>>>>> export additional information in additional files, such as width/height/
>>>>>>> stride/format. This could provide the real/last image on the fly, simply
>>>>>>> by reading the files. No workarounds or encodings needed.
>>>>>>
>>>>>> I'm looking into that. The difficulty is to get the debugfs content outside
>>>>>> of the test kernel. As I'm using a uml kernel for testing, I will need a
>>>>>> special initrd, and a way to share files with the host.
>>>>>
>>>>> Yeah, I agree that it's not very practical. If only because the test
>>>>> context doesn't stick around once it's been executed, so you would
>>>>> effectively leak an arbritrarily long buffer with no hope of getting
>>>>> back its memory.
>>>>
>>>> I've made a prototype with debugfs, a small ramdisk with busybox, and using
>>>> hostfs to mount the host filesystem in the uml kernel, and it allows to dump
>>>> the raw panic buffer easily.
>>>> Even if it's a bit more complex to setup, I think this use case is not
>>>> really a kunit test, so it's probably better that way.
>>>>
>>>> Let me a few days to clean that up, and I will send a v2 of the kunit tests,
>>>> and a new series to add a debugfs interface.
>>>>
>>>> Thanks for your reviews,
>>>
>>> We also have to think about how it's going to be shipped and used. If
>>> your debugfs integration has to be disabled everytime we're running
>>> kunit through uml, qemu, and in CI (because we can't retrieve the
>>> result), on a live system (because it would leak memory indefinitely),
>>> how is it useful?
>>
>> There is already a kconfig for this:
>> CONFIG_DRM_PANIC_DEBUG
>>
>> Also I have an implementation that doesn't leak memory. (memory is freed
>> when the debugfs file is closed).
> 
> So, if userspace completely ignores it, you still leak it.

I think we should discuss that on the v2 I sent yesterday.
But basically memory is allocated when the debugfs file is written, and 
freed when the file is closed.

So if userspace ignores it, no memory is allocated, nothing happens.
The drawback is you can't do:
echo 1024x768:XR24 > /sys/kernel/debug/drm_panic/draw_test
cat /sys/kernel/debug/drm_panic/draw_test > panic_screen.raw

You need to keep the file opened in bash between write and read:

cd /sys/kernel/debug/drm_panic/
exec 3<> draw_test
echo 1024x768:XR24 >&3
cat <&3 > ~/panic_screen.raw
exec 3<&-

I hope that clarify things.

-- 

Jocelyn
> 
>> It's also more flexible, as you can change the parameters, and test any
>> color format, and check the binary result.
>>
>> I think the goal of this is not to test for regression, but to help building
>> a new panic screen.
>>
>>>
>>> The diagnostic lines are part of the test result, are in the logs, and
>>> can be distributed. You're having all those problems solved already,
>>> without having any additional work to do.
>>
>> I feel sending an image through log is not really efficient, and I don't
>> want to pollute all the CI with that.
> 
> Then maybe we should just ignore that part of your series for now. But
> having a framebuffer lingering around in the system is a no-go for me.
> 
> Maxime

