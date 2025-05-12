Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A815AB45EF
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 23:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82110E4AC;
	Mon, 12 May 2025 21:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KBP7VG4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83710E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 21:04:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso18875e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747083889; x=1747688689;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocHMf+lpxFiUglMvQ3QmzmSqN/TDDldlcwv8ib7D0M4=;
 b=KBP7VG4XYSU94eBzhY14A8ulNEOV5k7MMunElXGUKgIMycGcacMb5S3OY9i95/u982
 MnaRja3yPqaki1LTGfjS/XXuiVcp92wNIDMN228Q9e2RTDRab/LnAs70H3+fXzGODQzZ
 RfB+tZKZMzbLFmSwfCB7CdXibUchyPR4Ub80JfVJ+J5UFw1tFvavZL/u9dx8U+27IRAb
 thYK6Lb/s49hy4w86KuNw2AST0wAiwFTwpBrYeSryhrkadeGz6AuHDJXJqYhqVtUc53F
 nF4elEKDjaYUoW+hirdYRiGPe/GGAWts1WHPgF6hK07+2UKE2KJJMpC2RtrZgi21i40u
 W/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747083889; x=1747688689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocHMf+lpxFiUglMvQ3QmzmSqN/TDDldlcwv8ib7D0M4=;
 b=gBZVZnyGRNtxqYTxwx5aNo5s8YRBL0lICF8AnBGDxuLNA1CV20K6AQSRt/tb+iDsQe
 MCBiAHSwrRdadIRzkayPPERFi8cCjNNfbia66lgFNNcxB8Xiz97ERdG0UTPt0sKIENzM
 r47tkzjMJ+MNeXYEEKGn3UOPtb43sOgQvFl1ek5jBDDLdN6e4xj91e51FNsP7jy0IQLg
 n3U6quR/dLFCxh+shoBkvsBI8OOJhJ6ZRQRHwr/SyV0nZDXZx5OWR8t4ZT2EPnigY22X
 1b0kkHmW+10O+I/Y0eIo6uYkwNv4JQt0lO5Rzte6u7fNg46wFoNV/FrEl7icItraF55V
 E0Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3vkdGJduw8e3NdQCZXqiDkUoWekBqdTc/5btrmWOg2QzhNVvMe7yhRMgIsryA242ZZDuikNefnWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN2soc1PUCWT3JbdhU6qtDIBbtTBQrjpZj194PKKzw9SNpMKV3
 dXbaRRLOs+3cgHkIafHjSlxla+hfyb8WSMRbpzURdqLsgq2e2U4bN1O7sbPrRMS4AzRNtrn+9kM
 Mb9vjls6aXvcKuVtKENrCs7RYSDD1e0B+luOR8YSl
X-Gm-Gg: ASbGncsDPJL2HlkuxbvWhE2EcDp6kjhfbyRA2dA1KXVd2MKmT6zMc64kiwxvjCwKyNF
 hIChbXAmNZBKGX/T2fV1ERZsKQAWDbfss6HBNhymNmNLBWPPhqG1RzYKt2WHBfvZhozGvEe0ymw
 FLJx+TMcxXXEJXhQwFYpKpY26UyCtv8wQ=
X-Google-Smtp-Source: AGHT+IEr0EA2T8//ChQD2cQVB7Yv0cif1v2Nya6VTYqVvclVsxQ7gPAjPiVgt+BRhoXxGJfdm3L5Wdls6puG9ko+yOc=
X-Received: by 2002:a05:600c:1da4:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-442ebbe7e80mr37045e9.1.1747083888729; Mon, 12 May 2025 14:04:48
 -0700 (PDT)
MIME-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
 <20250512174036.266796-6-tjmercier@google.com>
 <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
In-Reply-To: <CAPhsuW6KEtKu5C+Y_X3EFkUFSg8=LnQ9nJFUD81rYgwvBvqzHg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 May 2025 14:04:36 -0700
X-Gm-Features: AX0GCFvIOd-tF5p6eczt7ynOfdOnjScDBhB5U-GpV17T4Ix1WysDKZAupTNpB3E
Message-ID: <CABdmKX20zo5FhUGf2ZJXvcSetbK25HV9Z=AG8MhLU+dnT_kP6w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 5/5] selftests/bpf: Add test for open coded
 dmabuf_iter
To: Song Liu <song@kernel.org>
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

On Mon, May 12, 2025 at 1:30=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, May 12, 2025 at 10:41=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> >
> > Use the same test buffers as the traditional iterator and a new BPF map
> > to verify the test buffers can be found with the open coded dmabuf
> > iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>

Thanks, I'll send v6 this afternoon or tomorrow morning with all changes.

> With a nitpick below.
>
> [...]
>
> >
> > -static int create_test_buffers(void)
> > +static int create_test_buffers(int map_fd)
> >  {
> > +       bool f =3D false;
> > +
> >         udmabuf =3D create_udmabuf();
> >         sysheap_dmabuf =3D create_sys_heap_dmabuf();
> >
> >         if (udmabuf < 0 || sysheap_dmabuf < 0)
> >                 return -1;
> >
> > -       return 0;
> > +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f=
, BPF_ANY) ||
> > +              bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f=
, BPF_ANY);
>
> nit: Instead of passing map_fd in here, we can just call
> bpf_map_update_elem() in test_dmabuf_iter()
>
> [...]
>
