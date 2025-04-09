Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A721A81B2B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 04:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA2010E7B7;
	Wed,  9 Apr 2025 02:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UWZB7YYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7A310E7B8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 02:40:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e614da8615so561002a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 19:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1744166414; x=1744771214;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IOQlV1YENNqfnMcYfC29B125TJM1XhvCjinQE4wwzk8=;
 b=UWZB7YYXXJwmXVTD0wsioIafsFejnJUHfRSTqPIPqg1SY4Yut7Hp8SkvM2d3Q5J7x0
 Ss56bNVn6dmPQcKiRArOWRTgNKV67ylS/KHU0UYcpL1vhiRrMw9rb4R8L9QX8jRYcRYT
 ATR8Oe48zBvGch5WWT3rNRzLWkslgQckDmmJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744166414; x=1744771214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOQlV1YENNqfnMcYfC29B125TJM1XhvCjinQE4wwzk8=;
 b=X1rvNrwJEQaBZ4uYjFhu+KlQrIjNJUneqB7hJJQcPHBzv87bJwEr7FiSHU/maTuFYl
 pfIZ4+LNj8cwWzcXaC5U//LVK+bX11XkfpReI5vOOCv0GEgYHvfydh38TwbAcMgh985b
 sVdWdFkWDHM81PJxgYQNNsA80ULj43zH0NHLmVdcbtqkOO7f7V/cIVqsQMOnB5vT/ONh
 NruAJ4M1ruhqZ7WiAa9kwx1K5NkANO/1+4gt81sarog/0PW1GYlTayh2uOXIfNqYRCWz
 1cy8+Za+DIbl0/ksU0P3bsZPi/OoqNfntXcV1p+2WJong8yDV4vRZrVD1LNunVwQ/KxT
 Pn4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2mHK2U6vnbJw2Q02LR9v/lh2DYW2bmEE6j0CAbSrzY8/A0pe1z6RJh2E5vrZWyZT35oqfrWoRpkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDtPInsCo7N61Xwy3MS6ds1cQz0BGmaIW6gTSnHbKspRKTG12u
 nKGn0849qxL8r8SRnicFsKzCltfVnN2Muw476wk3Wh3KnltyGfSN43eYGfDgA6s/Veee6Wn6OTA
 54do=
X-Gm-Gg: ASbGnctVTJaBulTdrPsoA10emdQHxAa1LBkZc0cnOQa7Wv8D8qtgN7ZLeZpXzBfgvNo
 BOTeYxg2U1l7Lq1FYMXn6U4wu7ieheu1g5bX6fBT6gA8qu9aI/5y6kRZHc3KF6Q3A0lWsa4PbE/
 2ITp8Zyet+k0e7wvEEUSrCuLha/PoB+UJyOYiRyn4U9Ro4M0xv6GUtFvhfp/4JhfPa2Ef44Vy5O
 YIuNn/X1e9oV7oBo00gLn4bjDQSuYybldB9NJH+3E429RZQjb4ZKwe1YQcKPktGaSvNVzDElNDj
 Nm/0SJR9pfIGibxyqmvXKBiTTxSg2/UK+/0pU4+xjVpBmKoqNHL1mYN3dcLIpbJXjitVGkTSMfA
 W/1KvEQtTj9A+pRh9Ydl5UI/CPCFlaQ==
X-Google-Smtp-Source: AGHT+IGs19V5VN2zw/P+VqgcaLl70O57FB3qmXHRLB8qqf63tuKlWqL++tjWViV32Ysktz31FnloHA==
X-Received: by 2002:a05:6402:5c8:b0:5ec:6feb:5742 with SMTP id
 4fb4d7f45d1cf-5f2f76fbcb1mr1055931a12.16.1744166414153; 
 Tue, 08 Apr 2025 19:40:14 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbc2e3f8sm89539a12.48.2025.04.08.19.40.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 19:40:13 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so55023666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 19:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcdYzLREedg3LjONb4BJLNbWzZgB2n91ujq3A69tSZWxvZJHf54zej55OHWON4mytxJ+yH3/SBrk0=@lists.freedesktop.org
X-Received: by 2002:a17:907:86ac:b0:ac7:334d:3217 with SMTP id
 a640c23a62f3a-ac81a611619mr581097266b.12.1744166411592; Tue, 08 Apr 2025
 19:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
In-Reply-To: <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 19:39:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
X-Gm-Features: ATxdqUFiHF52bUvLryR7rfFOaLA0UC5CBMTbxxULmYgSReDeZj_UCJwCfpJ84AQ
Message-ID: <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 8 Apr 2025 at 09:07, Fedor Pchelkin <pchelkin@ispras.ru> wrote:
>
> > Linus comment is about kvmalloc(), but the code here is using
> > kvmalloc_array() which as far as I know is explicitly made to safely
> > allocate arrays with parameters provided by userspace.

No.

ABSOLUTELY NOTHING CAN ALLOCATE ARRAYS WITH PARAMETERS PROVIDED BY USER SPACE.

All kvmalloc_array() does is to check for overflow on the multiplication.

That does *not* mean that you can then just blindly take user space
input and pass it to kvmalloc_array().

That could easily cause the machine to run out of memory immediately,
for example. Or just cause huge latency issues. Or any number of other
things.

> [27651.163361] WARNING: CPU: 3 PID: 183060 at mm/util.c:657 __kvmalloc_node_noprof+0xc1/0xd0
> [27651.163411] CPU: 3 UID: 0 PID: 183060 Comm: a.out Not tainted 6.13.9-200.fc41.x86_64 #1
> [27651.163412] Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
> [27651.163413] RIP: 0010:__kvmalloc_node_noprof+0xc1/0xd0
> [27651.163424] Call Trace:
> That's just
>
>     union drm_amdgpu_bo_list bo_list;
>     int fd, ret;
>
>     memset(&bo_list, 0, sizeof(bo_list));
>
>     fd = open(DEVICE_PATH, O_RDWR);
>
>     bo_list.in.bo_number = 1 << 31;
>     ret = ioctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &bo_list);

Yes, exactly, and that's bogus code in the DRM layer to just blindly
trust user space.

User space input absolutely has to be validated for sanity.

There's a very real reason why we have things like PATH_MAX.

Could we allocate any amount of memory for user paths, with the
argument that path length shouldn't be limited to some (pretty small)
number?

Sure. We *could* do that.

And that would be a huge mistake. Limiting and sanity-checking user
space arguments isn't just a good idea - it's an absolute requirement.

So that kvmalloc warning exists *exactly* so that you will get a
warning if you do something stupid like just blindly trust user space.

Because no, "doesn't overflow" isn't even remotely a valid limit. A
real limit on memory allocations - and most other things, for that
matter - needs to be about practical real issues, not about something
like  "this doesn't overflow".

            Linus
