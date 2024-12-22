Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BD9FA63D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 15:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D510E04E;
	Sun, 22 Dec 2024 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8iwYbPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0210E01F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 02:00:02 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-85ba92b3acfso1306874241.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 18:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734832801; x=1735437601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OWFU15fJ4L3Ec0ACNvMZbS9c3dQNjLQi5WORN5noOTw=;
 b=h8iwYbPZrzP6QEeAVIUksex+eca2mArPqx/8e4bjlBLAmJfrYcd2IE6/OOYDdw+PIu
 4HCWB/bC5PEZAmeGjviEcPAbhMym2yj0/c8EcxLA9fikJapYU5ub4rFX7xSZvgBMfJx4
 H4V49FjxqNUDfJfWMexHBqLyvUPpneSg8UuSYqYR4OZYBD85kc8wpivIjIpBOlVoxubL
 aTxrK9TFw0DmOuhr/IWh7jHpBN/jHyo1/JGZSvBVIwaoPLZMWHL0YT7i1/0fjqWcvFuV
 QLaVCCd/ZBj61Q8hIDm9YO/iReYbLbawEy1cOWwYEnnm+09TKWPfYTfJip41AMtoBuUa
 28Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734832801; x=1735437601;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWFU15fJ4L3Ec0ACNvMZbS9c3dQNjLQi5WORN5noOTw=;
 b=dtdplNBfGJHIrj0hv3EXt0DsSuufFrpY/TvBwkVqQi6L16g8G/4wF6mqCbO1Hf+0by
 K9LAhCXpxEwvCjQdGgipU8MsSWy5Q7TUg9pGezm7ITf42XXlMgynUBiDQtCv/nMG1kl+
 chSZxFBSkpEqCUM+kCud3EdZ3bTfQ0cYPTzL0qQ1l3mU+wH+j5JyUd7xWi7Wx1KaKH3s
 M53hDCL7z4PCtXpr3JgLMRquSD/9lf4gN2NXBXTW2TrjP6zHzSMc6a6npsxH4AuZBOVP
 nqYLDPWZNlIRM/sK/89NfO2RkSEv2go0vA0J70s11qOuAlgwmIR5TPeA4O690fGZcjov
 kYQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Wa3zDYaWv32KEUeX+pfBNhavIgDzP9z1PkKP6tzE5xiv4rmV4joP7klnAcr4zYA6gRRn0DTLnxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhUs/a/ndqNu+ckanyby30c5F+ahncrVKGP2BLDmHm2XFkxgzL
 5YfCCHXQmd0g5firJ94uguymyOkzuNBOYMBu0YbLnvd4wuBUZi/A
X-Gm-Gg: ASbGncukMaddnbaR6h1onFPRg+II1KBgJR3FWkzCDiYaAjc/7nfbMwTyE/jEIDKMMUj
 EIUS0ZpHM+EGPls1lDxgpjlhLg4n0isqMMgVtmWymrVa7RovHdva3VuW9qK08HyZYvgyV4d7noF
 //x+EcEKEHr+eSiRg16gl9XITbCSjYDeMAGFX3NFInifJGUpi6ygVZ8OtRP3msUYG8jLDi7RJLw
 hTkFthZTrsNwN+TynubCyIDbUrZkHLpq7ct/fnZubgGC460f5SCuTDipJI=
X-Google-Smtp-Source: AGHT+IFKHaVz4WvgkgRU7/knTE0SXER/wJFjxFtceqzkT6YsvNlgrKqNJe11JRtidu0QIkQ76Yt8mw==
X-Received: by 2002:a05:6102:4427:b0:4af:e61d:e22f with SMTP id
 ada2fe7eead31-4b2cc473647mr9803375137.24.1734832801423; 
 Sat, 21 Dec 2024 18:00:01 -0800 (PST)
Received: from [10.138.7.94] ([163.5.171.73]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8610ad582cdsm1134069241.32.2024.12.21.17.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Dec 2024 18:00:00 -0800 (PST)
Message-ID: <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
Date: Sat, 21 Dec 2024 20:59:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Content-Language: en-US
To: Honglei Huang <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 22 Dec 2024 14:49:08 +0000
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

On 12/20/24 10:35 AM, Simona Vetter wrote:
> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>
>> A virtio-gpu userptr is based on HMM notifier.
>> Used for let host access guest userspace memory and
>> notice the change of userspace memory.
>> This series patches are in very beginning state,
>> User space are pinned currently to ensure the host
>> device memory operations are correct.
>> The free and unmap operations for userspace can be
>> handled by MMU notifier this is a simple and basice
>> SVM feature for this series patches.
>> The physical PFNS update operations is splited into
>> two OPs in here. The evicted memories won't be used
>> anymore but remap into host again to achieve same
>> effect with hmm_rang_fault.
> 
> So in my opinion there are two ways to implement userptr that make sense:
> 
> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>   notifier
> 
> - unpinnned userptr where you entirely rely on userptr and do not hold any
>   page references or page pins at all, for full SVM integration. This
>   should use hmm_range_fault ideally, since that's the version that
>   doesn't ever grab any page reference pins.
> 
> All the in-between variants are imo really bad hacks, whether they hold a
> page reference or a temporary page pin (which seems to be what you're
> doing here). In much older kernels there was some justification for them,
> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
> now all sorted out. So there's really only fully pinned, or true svm left
> as clean design choices imo.
> 
> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
> you?

+1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
in complexity that pinning everything avoids.  Furthermore, this avoids the
host having to take action in response to guest memory reclaim requests.
This avoids additional complexity (and thus attack surface) on the host side.
Furthermore, since this is for ROCm and not for graphics, I am less concerned
about supporting systems that require swappable GPU VRAM.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
