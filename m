Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C2AB775A
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22F310E641;
	Wed, 14 May 2025 20:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+7lhvmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B4210E641
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:53:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8355C5C6848
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36132C4CEF5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747255979;
 bh=yopj8kp9gj1XHzlGCcggbJ7Bvw1EUaauJtS9Wiq+DYs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V+7lhvmB+pEFkJ9HAYTEnzeC3P14rSkrGHsokdU9rVa39iol6muzSqm2X47P/PnoI
 FAtsqJ4qSlR76R919bLmMjh9KkNACt/f2lHG6ICQTIxZu1Ujgf+ruZ2+SUyhVs4tDd
 I8CSimqmJ0cfoGKP3Bigs1I2wRVp9JBM5sq8LU35JTPuHd+6ViQ+znjmI0UFQ9UVOn
 TzaZfecW3+nvjMFlaus+/KCPx/EYd72bD5qHGsstDcJLKxz+Qh5j3bx1sTXatFheHv
 XDoOwKVfhT3J+tHOhSZFe2INjr9Zzd+6BQ/EvtskmcsFgReBsnzmOdYPiS1ljl3hWr
 eed/X4sAHrGGQ==
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6f0c30a1ca3so3372846d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:52:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWagCDfXZDJA/jbvkzwspyZRQtAXhWbQprYBCiYAjwjzDowepm6rgTYTdai38jnXeGA9r4esrhTJWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB4qYjMnzkvbcZkEFkXOc3BY4UfN3CTiXvAkGyOH16WerA81pM
 k6kdJqeTSr/EYdb6P235C6Hz6CrQ45syYJBxyFLkmtCf7pLJg6qjaMxbtdlAg2BeON+8ujICUzE
 Oh4m8JbMXUbkTTBn0d0CrXrrNyEY=
X-Google-Smtp-Source: AGHT+IF+lU54dRQgA6FljOacFL6BtlmDcxeXXsOoomxe1/Zd8JrltM3ML4OV0csJ0D38X9rF0QBQTupLitG0FckfaaU=
X-Received: by 2002:a05:6214:4111:b0:6e4:4484:f354 with SMTP id
 6a1803df08f44-6f896ebfcd2mr82588646d6.38.1747255978285; Wed, 14 May 2025
 13:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com>
 <20250513163601.812317-5-tjmercier@google.com>
In-Reply-To: <20250513163601.812317-5-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Wed, 14 May 2025 13:52:46 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
X-Gm-Features: AX0GCFuA5wm_VloqqAKn29YZ1ukdwZp2SKcoDkcPO-HV2pyFkhTxmiZUesveYWU
Message-ID: <CAPhsuW4uKxFP=i2KgaKPvezD5sBcVheQRBF1fY5DyYafin_yFQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 4/5] selftests/bpf: Add test for dmabuf_iter
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Tue, May 13, 2025 at 9:36=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> This test creates a udmabuf, and a dmabuf from the system dmabuf heap,
> and uses a BPF program that prints dmabuf metadata with the new
> dmabuf_iter to verify they can be found.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Song Liu <song@kernel.org>

With one more comment below.

[...]

> diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/test=
ing/selftests/bpf/progs/dmabuf_iter.c
> new file mode 100644
> index 000000000000..2a1b5397196d
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025 Google LLC */
> +#include <vmlinux.h>
> +#include <bpf/bpf_core_read.h>
> +#include <bpf/bpf_helpers.h>
> +
> +/* From uapi/linux/dma-buf.h */
> +#define DMA_BUF_NAME_LEN 32
> +
> +char _license[] SEC("license") =3D "GPL";
> +
> +/*
> + * Fields output by this iterator are delimited by newlines. Convert any
> + * newlines in user-provided printed strings to spaces.
> + */
> +static void sanitize_string(char *src, size_t size)
> +{
> +       for (char *c =3D src; *c && (size_t)(c - src) < size; ++c)

We should do the size check first, right? IOW:

for (char *c =3D src; (size_t)(c - src) < size && *c; ++c)



> +               if (*c =3D=3D '\n')
> +                       *c =3D ' ';
> +}
> +
[...]
