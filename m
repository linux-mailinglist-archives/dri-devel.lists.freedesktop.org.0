Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301EA4F2F5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 01:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E331A10E7A8;
	Wed,  5 Mar 2025 00:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sR++b8nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D210E7A0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 00:48:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4393ee912e1so11755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741135708; x=1741740508;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpdfKf6RfaEe0n4JSWIwj1bvttMewhoSuLGnC7ajBRY=;
 b=sR++b8nHuzoP1+L84R+zUmMNeXNtSEHVKAGdnOat0W5VlHHeE3M2KZR4EPtHCixvRh
 6VSEB+hpIQpaYx9v/7FzZnNi3fykC7mg5NpxNVimHq++tTCTzRF+y85mHnMHJ3FDMzwc
 dB/o+tLHi8HXZM9h+BUJNh8Q/iM/hIHqEp4L5tuDUIv2IXakj7dFccTCTJaVwNGMgcmk
 ewrALe21f7CCEO3WwywOc/MF4lVhekPJ787zbYbVedqGjDrG6z5x6MY2tKS1jCKlrWNH
 xYsfcoKB4MEC7jHhUI2P951OJYfcpTDT3BzeqsAj+fRjq8MvtvQE0x/aZSGP6MQWlPvb
 aN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741135708; x=1741740508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpdfKf6RfaEe0n4JSWIwj1bvttMewhoSuLGnC7ajBRY=;
 b=XljrBx46T3eoOM6SuMCGbBBGYQqx5iUKQHuNY+pOXk8nejmUMHmo/rez4Dvg3EoeNT
 o3bS4kab/l/SG9scQIgZovPSX0Kc5+TTh7Y1E0x5+3oE7T7r2sQf6RUQrJ6key2d35uz
 6oMfFgOu2yg2Tgl30WJhfuSNmLdg0XnEC7XTTzQsD8PL3Tcj5oEPE20/3CBaS4JR2TTG
 Td9TsPI4x3qDKg6y9sjuQA7gNwR3JQIaf55ITER/U634yAav7MCLXah45Rgurnm1XWov
 dPcbbclK1i4aZ2hrXhYTiees45r9T1uGFisO8NrR55hLsngW5/4WdK8tz7kqv9WRaTwl
 t3IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Ug97Exm7zSaPlkF14orracbgYa2UG32sjenWsi3K1qvyRg3R/pTELcJQ/WK4zsBZfhgFYO6LKKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSUym0GthqPo1xn/qB0pZhRI3lLULCKJyVYDujSWjI5P6qtHCe
 VrjJDZ0cxiqJHn9R2Rs0DOJgFEdDkazSMubr2zGV7TimuKFZKL/RRT9wapGcCXh99kVaj7Q+t39
 HMEwR/yyyQG/gkh2dTGhdb55Bna4NYucO7H8V
X-Gm-Gg: ASbGnctHp0SRVD53hDxbBxh/CLugbD507hB80sqwW53AnT1lX30STgaBcnbi1UtWLZL
 05uvb06ad/XM7rMmSMz8/0E/yQGmn9hVNiXTKWFnGPrP3B5Qs90fnUJSSXnRrmqRxSqngctYhfa
 R1jTYbzoFhDfUzmxf+Izy43rblqQNOGZmQLp/3rGIddMN937X5WlyRDQeR
X-Google-Smtp-Source: AGHT+IHS/CmjXgegGcxmRpNS98l46ZS6jKoa5Lns8rQL3j5jNusGGs4P4kOCp/wB0pBcvC4rGkpBgAWFwp9wMlZaewY=
X-Received: by 2002:a05:600c:a20e:b0:439:7fc2:c7ad with SMTP id
 5b1f17b1804b1-43bd360dd0bmr264395e9.7.1741135707908; Tue, 04 Mar 2025
 16:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20250303160249.118549-1-mripard@kernel.org>
In-Reply-To: <20250303160249.118549-1-mripard@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 4 Mar 2025 16:48:16 -0800
X-Gm-Features: AQ5f1Jq3ZGx0qLsX7f-KsnmsL9RZFbs2tncfnAJKVdS694Nl6LlvniytB56xX18
Message-ID: <CABdmKX2bA3R3RTvzaRTj5313o5cxdhf8b30YTNNKFq5Bqs09=Q@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: dma-buf: heaps: Add heap name
 definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
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

On Mon, Mar 3, 2025 at 8:02=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
>
> ---
>
> Changes from v2:
>   - Remove exhaustive list of names for platforms, and just mention the
>     alternatives.
>   - Add MAINTAINERS entry
>
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  MAINTAINERS                                   |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..5b92d69646f6
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,25 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Allocating dma-buf using heaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They =
are
> +typically used to allocate buffers from a specific allocation pool, or t=
o share
> +buffers across frameworks.
> +
> +Heaps
> +=3D=3D=3D=3D=3D
> +
> +A heap represent a specific allocator. The Linux kernel currently suppor=
ts the

"represents"

> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s

Period at the end?

This description is my understanding of the current state of things, so:
Reviewed-by: T.J. Mercier <tjmercier@google.com>
