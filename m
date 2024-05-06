Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5E8BCD81
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CADE10F2FA;
	Mon,  6 May 2024 12:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hizm2dS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D8710EDCB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714997472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSfOAhrFUm53Kqin9+YfTRe0LHiAcFIiQAaaSKoiif8=;
 b=Hizm2dS6hKYoDQlDBdSDPIkBi55wp9uhmGe6AQne2GMVjCGxKJBhvMQK2fX7xC5lV3u8Ke
 EA3mGfJ+T0RH8AucaHl3Git8okk8+08KVqTn1dSQG0ZreayZmYmnKJPQn+3fCvMCw5OBsd
 hr7QuR0kJPOu+Cp6J4fE1n4W6CmDpxg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-iLxrrr34P0CSm2UF0a54Fg-1; Mon, 06 May 2024 08:11:10 -0400
X-MC-Unique: iLxrrr34P0CSm2UF0a54Fg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2e1e7954970so17189491fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714997469; x=1715602269;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSfOAhrFUm53Kqin9+YfTRe0LHiAcFIiQAaaSKoiif8=;
 b=kond/3AChzcXlt1ePnkTD2oKDa9MjskrekEMjX+G9Bgw4DIzwBvqm5Y2doOlXHlAtN
 PdoSeUKuxxx2VRes42auRSDZFUbF42nweOhqRyGa2Qx125NfjXdXXKcG1ieafcEQA3YW
 vWYnm/56NOq7rDIEr1Tb+MLVZJdncXmXYGxWWhQ6Gle2cpQN+uLkzRCvhzrOWAG4EZfS
 4EUQ6cMF46WVpaF7CGRWtMPfdDNxt3/DC6DIQjANmg2T2O0u0p0Bon7bLOLFXLbUV7eI
 wVDJdLTiVUSFWxyjBaFGlzo9OK1Aa7tBTJTFu3TvhDMmZJNzQJBmTV5FIoVt3RidP66S
 JEHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOpMCVe3XS/Gpd1f0dh/X7yx0Enf31+2tlJycbwOHbqpAJ0AVxYxlGZPHpo7dFL/1TlQKxrvZnEMNFCctEbYpPA0uohPwoL5ISulknOyp5
X-Gm-Message-State: AOJu0Yxx6Xu4b8Hy0a50P3Qs3/JflyXS7rHrhwr52wK/1XiwuwRWQtXH
 bfQylx2ob0vroeuQqX6S6/BriwDnbKs+ME2iwAcK8jq5lBKz3YcKAZ8WNBaOWaYYpMf4qLDMFMr
 GsQNfSC3rZyux7gmiXf8XliDovMqgKpNMc39aEAuE1oYfZfstE+53Q6fNAY50Rfat5g==
X-Received: by 2002:a05:6512:3f21:b0:51f:5d1a:b320 with SMTP id
 y33-20020a0565123f2100b0051f5d1ab320mr8765212lfa.68.1714997469263; 
 Mon, 06 May 2024 05:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp4bcHitMTSdTCl9aCNeXV3I621ghOgDSk6RE5J+9JJSbX/V6SpGWsuuHMuUKGZd320jEJ5A==
X-Received: by 2002:a05:6512:3f21:b0:51f:5d1a:b320 with SMTP id
 y33-20020a0565123f2100b0051f5d1ab320mr8765187lfa.68.1714997468807; 
 Mon, 06 May 2024 05:11:08 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a1709066b8c00b00a59c0ecd559sm2003340ejr.112.2024.05.06.05.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:11:08 -0700 (PDT)
Message-ID: <d0821bab-be2e-4476-82e8-8b363a951e50@redhat.com>
Date: Mon, 6 May 2024 14:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240506-dazzling-nippy-rhino-eabccd@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi Maxime,

On 5/6/24 2:05 PM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
>> Hi dma-buf maintainers, et.al.,
>>
>> Various people have been working on making complex/MIPI cameras work OOTB
>> with mainline Linux kernels and an opensource userspace stack.
>>
>> The generic solution adds a software ISP (for Debayering and 3A) to
>> libcamera. Libcamera's API guarantees that buffers handed to applications
>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>>
>> In order to meet this API guarantee the libcamera software ISP allocates
>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
>> the Fedora COPR repo for the PoC of this:
>> https://hansdegoede.dreamwidth.org/28153.html
> 
> For the record, we're also considering using them for ARM KMS devices,
> so it would be better if the solution wasn't only considering v4l2
> devices.
> 
>> I have added a simple udev rule to give physically present users access
>> to the dma_heap-s:
>>
>> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
>>
>> (and on Rasperry Pi devices any users in the video group get access)
>>
>> This was just a quick fix for the PoC. Now that we are ready to move out
>> of the PoC phase and start actually integrating this into distributions
>> the question becomes if this is an acceptable solution; or if we need some
>> other way to deal with this ?
>>
>> Specifically the question is if this will have any negative security
>> implications? I can certainly see this being used to do some sort of
>> denial of service attack on the system (1). This is especially true for
>> the cma heap which generally speaking is a limited resource.
> 
> There's plenty of other ways to exhaust CMA, like allocating too much
> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> differently than those if it's part of our threat model.

Ack.

>> But devices tagged for uaccess are only opened up to users who are 
>> physcially present behind the machine and those can just hit
>> the powerbutton, so I don't believe that any *on purpose* DOS is part of
>> the thread model. 
> 
> How would that work for headless devices?

The uaccess tag solution does not work for headless devices, but it
also should not hurt any headless scenarios.

Headless devices could use something like the video group solution
(dma_heap group?) which Raspberry Pi is using and them make sure that
any services which need access run as a user in that group.

This can co-exist with uaccess tags since those use ACLs not classic Unix
permissions.

Regards,

Hans


