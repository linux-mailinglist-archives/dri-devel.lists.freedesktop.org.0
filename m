Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530BA82D91
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C6E10E258;
	Wed,  9 Apr 2025 17:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WwF7PIVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390CD10E26B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:27:33 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e5b6f3025dso10017812a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1744219651; x=1744824451;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pK2SJRHEMGZQKPPhXQK2rlcnL3fUmvPRMjfdbeZZl1I=;
 b=WwF7PIVqv2Wqgl8vRkTs4ceEFKEw6lpnQxBnzHs0dEF7PgmgfA5xzvtkq6VuExHS8X
 QV9QA7AJGdoVeMbmKqDk+zGPauG0iR4f17qMDPOZJRm7W5BHDBziyE/AhLSpnqd094vc
 HiZqEpUaDXOZ0yj0H/fYlTDpG03DKEL4/ZwHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744219651; x=1744824451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pK2SJRHEMGZQKPPhXQK2rlcnL3fUmvPRMjfdbeZZl1I=;
 b=hr0t2UuILRZYd/GW/fxQwFvYJMg30kyrJoX1TT54d+4hAdDhwMETV5ZhA3IKK0aj3U
 TC88sKWesXfXSdwF1ZxfCHnGTTsHwbLXINuDUjOcVitDS8Mv10ngkKWfX7lVtbjfN1wn
 OXkm4Pjb1QWdq993fEi94sdINzObJeb+ospTa3zqIgEOBxTPJ+gaLyV2uMT7PFDeIgbG
 t7FNHALUFRji5RKCVDmhiSXXHgZGMwwOL62vXOdYpORZEIdZ94UQfVv4ncgvtDM/UnkK
 zJbQSzaafRWBPGafvWhFJoEB6x4pVRvfz3Q2jTMopJZLrKR/VabKQ9skxX1zgDdeW5+E
 XZKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWugl02oaAVoHXkVNaqbqMAKQleILCJj/O1FbQ3Hgl9Hf1UrYffkKL6+PYS59pnG0VaJCuuL3iSUGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWpuYJsDytgzD3Zhhu22+57Qj9hGJ3zbzgZ5jXwbek6gOOwmU+
 XM5TSLWi9W+aX/aIZYop+JYPNl+NwBcl/fq0zdmm7gmCF5fsgod/7RxP1KVYur0RZEkoDDsjX+8
 JDLc=
X-Gm-Gg: ASbGncuA5i/KGwvfmOVglesx+d/UhvNrSDz3rkqYwnHf/y05cewTz1Oz//Qh0IPQ0t4
 9K1s4TqrElXjq9bdRO64rNzn0GbW3Hvd4dzj3TVEGOSV8gO8Th5vSeM5/60EctJ2TjxpSmZArpp
 FE4FcWPWJ+38TjQB7UHRo23SEbSF/zCk7knOT4Io0hcJrFilMtfKVzHu9ED0avmrEFfPLWqEvI+
 yhtH2WI+/xPo03RLLLTx1LEBqEZvAws2Ek3VDaE0Kbk0lKnTkX9773ydAVFoCsShUzc3KrgZ/3f
 nJyqHqvpDttT6SWw5unJ0Hg7npyxOvUJtfuQG3L/8Iq7C8Rv7knQWhnpIw7nViN/3VLQgKAWG0x
 byjM7E8cjwVLVvj4=
X-Google-Smtp-Source: AGHT+IHZ0ucUlL2MWv/ygodqSrFFN7zXATedAh8lRIhxP31x6Zy2tH0jbYQyLglDefvWfuDnuIsXcw==
X-Received: by 2002:a17:906:6a0f:b0:ac8:1798:f57 with SMTP id
 a640c23a62f3a-aca9b70dcf2mr353277966b.38.1744219651403; 
 Wed, 09 Apr 2025 10:27:31 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1be9198sm124795966b.49.2025.04.09.10.27.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 10:27:30 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso1220119566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 10:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVpQUQvOksc+ja/08robWFvblSdRdKgqHv+xUVrguzPP5K6FxOBac0YNkxxGcDf9UY69c18nOHXZY=@lists.freedesktop.org
X-Received: by 2002:a17:907:3e8c:b0:ac7:c59e:fc3e with SMTP id
 a640c23a62f3a-aca9b67684bmr382920066b.25.1744219649909; Wed, 09 Apr 2025
 10:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
 <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
In-Reply-To: <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 10:27:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
X-Gm-Features: ATxdqUGsb92LP0ScG527vuGNoNqzICJmAsHs4dqdA5fj_-LSDqiGYUn4VgwYYwc
Message-ID: <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Denis Arefev <arefev@swemel.ru>, 
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 9 Apr 2025 at 00:29, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> I mean open coding the limit checks everywhere certainly works, but as fa=
r as I can see it would be more defensive if we do that inside kvmalloc_arr=
ay().

No.

If we add some limit to kvmalloc_array(), I guarantee that people will
just then call it with ~0UL.

Making it all entirely pointless.

So thus the "kvmalloc_array() warns about unreasonable uses
unconditionally, at a limit that is high enough to be useful, and low
enough that the automated code randomization tools will hopefully
trigger it and find bad code that doesn't validate kernel input".

> BTW we have been running into the kvmalloc() check on valid use cases as =
well.

*IF* you do proper validation, you can just use the raw vmalloc()
interfaces by hand and avoid it all.

The VM layer allows larger allocations. But the "this is a simple
allocation, choose kmalloc or vmalloc automatically based on size"
helper says "you are being simple, I'm going to check your arguments
are actually sane".

So the drm code can easily have a function that validates the input
for your specific cases, and then you (a) don't need the helper
function that does the overflow protection and (b) don't want it.

But it should actually validate arguments for real sanity at that
point. Not just open-code kvmalloc() without the sanity check.

             Linus
