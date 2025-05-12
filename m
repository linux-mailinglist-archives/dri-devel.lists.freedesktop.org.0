Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D000EAB4572
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 22:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9626F10E1DB;
	Mon, 12 May 2025 20:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tBx4KgqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B60310E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:29:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 185E9614B7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B14C4CEF5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747081796;
 bh=Q1AuxTQ7799vYv+9kB6vXV1iWDTncQh/7UoL2uX/9No=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBx4KgqPJq4VQ1ebPq+sGhfPYt+EgimgZpb7ffjTzWptg3sC1RNUxs6d7gcCf1ufJ
 +jlhrT716R8b0aYG9sWKZd0UA1Cq6JqGv1sdbR1gEIHEm8/3uwnkLWEgPJ1aPzIWT3
 +iKaXca7/KFAsH4ypGp05neMEmdp38FQR2qkMH8M+NzEicX3hGT1WQxyLT9JJR+//4
 otYETItWVpkNIl6AeGX04cTSdNpS4loTUB2NTey0KCTnF3+ZpslrhVlfMu47rLC67/
 k8LUu+e+fJAY1GqKc8l/W5F8rgp9XCrSIqM3pFl6+aV3aOg1i22ccZTVVw91I7fuxK
 a3X25K5bACSGw==
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-47692b9d059so77670151cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:29:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrr9TAXSscnspog5GSp2T6q9n+k0KIdcQ8RJaVYTxMXLxY8On8YHsv3olorHycsTrg0RMUTEbY6dY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPypcMpWfvQpQtHTxyEVFJWgEpvfB8EejKjkUANrujqau72kl0
 8wuuVUwkVeDtF+dP8t71QllLCKQrYiraZbA7meyvWmn75RUcvilWECXKLDJa3BnwjvVTcCWvfOI
 uKJGDgetWapLkvdhXlOLosxhixPk=
X-Google-Smtp-Source: AGHT+IG5rkCx/hpDMtSKvEl8qMX6hPk0sGnzSeyFBD0wIK4YZybCKppA5Uh0VUx57tW/L441bM7HGxWCyQByM39LevM=
X-Received: by 2002:ad4:5bc9:0:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6f6e47aa755mr234448176d6.14.1747081795541; Mon, 12 May 2025
 13:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
 <20250512174036.266796-6-tjmercier@google.com>
In-Reply-To: <20250512174036.266796-6-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 12 May 2025 13:29:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
X-Gm-Features: AX0GCFvzZHZSPJCVC-VLXwXHh9XY0gCw1pbH1Gr6Gl6YMKHnqA26hCVsNML8Mo4
Message-ID: <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 5/5] selftests/bpf: Add test for open coded
 dmabuf_iter
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

On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> Use the same test buffers as the traditional iterator and a new BPF map
> to verify the test buffers can be found with the open coded dmabuf
> iterator.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Song Liu <song@kernel.org>

With a nitpick below.

[...]

>
> -static int create_test_buffers(void)
> +static int create_test_buffers(int map_fd)
>  {
> +       bool f =3D false;
> +
>         udmabuf =3D create_udmabuf();
>         sysheap_dmabuf =3D create_sys_heap_dmabuf();
>
>         if (udmabuf < 0 || sysheap_dmabuf < 0)
>                 return -1;
>
> -       return 0;
> +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f, =
BPF_ANY) ||
> +              bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f, =
BPF_ANY);

nit: Instead of passing map_fd in here, we can just call
bpf_map_update_elem() in test_dmabuf_iter()

[...]
