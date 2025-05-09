Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106CAB1FE1
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 00:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1924188668;
	Fri,  9 May 2025 22:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SK5Mk+rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D95410E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:28:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso8455e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 15:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746829689; x=1747434489;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Dwe+AkRWKyTQFcGk+FB1loDELsepTcogcqqbMFr0lI=;
 b=SK5Mk+rCeDqNdbgJqQZUbyYBBmpYy0CVbtfeD9ZtQdpYrybbuBpNokvxAXexXi3zeb
 pgvd6AhyPQS67Y6oNHtS7xNyqyIeQouWLdV+TTKQudbiG/XuVtWy2SbGX7PkJUIEei0V
 56YHkbwliBtXLGVyUzm/m8jrJCIhA1/qzKeAlGvPTRbV/YPsD5vVuXaKNVRkQ2gz7IRc
 e8xOxYi/YrcTsBhbhmWgQuETNkMBZYyJGOzeapz36qYDigupyyBR60Z82pEhbcrM8ODB
 VXMeDP5b2/8HPe67tA0Sl5Im2vYoF3kw0ZNBM7N+oM9Y0YP57N0Fp74pdmn3zGsQ2BB/
 /1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746829689; x=1747434489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Dwe+AkRWKyTQFcGk+FB1loDELsepTcogcqqbMFr0lI=;
 b=iXUhUtU1tFqIPURYsn6fmhKkNTz+Yx9aA9qsoj/7kG0OYArlP8M50TleDVP6MoaQ2o
 k3Xawx7ZEEAMhgl/eX5xQrYlzsOGsb4sviefoArBnujkV5qu/9EAyM26tNsLQoYFB2Xd
 XCuZiQPTnaRzoc8g+Z2YCWbw7t2GUszj5xVkUoBF+mI2Qqrm1VeewmiUGy3cEoTRuFGZ
 7v7gZGIb0GyYwvoRFDoYcHLvzMYsqOGfwCbEJMSMYyzlAkhgzHIi/WZGB4LyI0kXpUDJ
 vnUdaSSYljpeqs3s1uaNg8Z22brj2JFskOZkMDoHmZa35jkTjNVTwbVaCNFaO4SGX1J+
 jUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMEset5KpCxVMMETaN+f2cUorMVfjsV1xTYwzsRX/Z+XOo1CYUxK3K1UyqXJnQwXgSel1dG1xh9y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBDJh0wmtkAjubZNJV9E6z8/KSnUBsqWfH1h/wMVRT7Zx1a6MG
 jW6r0dVANwiymcptkQH8u1VpaONJNZ0omS6O65eqFmBBfKJVyGcz9285YQ3itjtB7rPWyyy94mr
 oefFPLz5vVIBst1DdcQVBbugK1mgYuQVJax4L
X-Gm-Gg: ASbGncvjPF5WLPOik2aWUlHmO1YwAkEXXBKhOD8XsUN8RPYeMlRVsvuQL2AGF3Q4kIJ
 aCUDUuDeFNadAqq/5Y2kgyKH/KcSxbzsaJZMR31dkvXGiUCQgEx9lThnaJuc5B5N/cfPOw28VML
 6ERBNDRifj5mooLsKzGHHDKRUBNLAbnso=
X-Google-Smtp-Source: AGHT+IGvqHCr2YbTyc+Q5mGzfoBCTKlc5wlIEM2vVFXqFenxVP+WaJU85XX6Sq5GSXEM+agSTCbYVlJfJ7nbfIdFhI8=
X-Received: by 2002:a05:600c:5009:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-442de0efd25mr426825e9.2.1746829689429; Fri, 09 May 2025
 15:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-6-tjmercier@google.com>
 <CAPhsuW5WOmyfPqBc_Hn7ApGWP_2uz_cJwyaDWF_VwiHJu9s_1A@mail.gmail.com>
 <CABdmKX2h5cGjNbJshGkQ+2XJ7eOnM+VfbmVr5Pj5c0qfxQA-qg@mail.gmail.com>
 <CAPhsuW7BM=X06Tr+HURsCbD8LwAO=Fdu+ZfKDy6RNK=UNNC1Rg@mail.gmail.com>
In-Reply-To: <CAPhsuW7BM=X06Tr+HURsCbD8LwAO=Fdu+ZfKDy6RNK=UNNC1Rg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 15:27:54 -0700
X-Gm-Features: AX0GCFuz9iFkCIfsshnA0MUw61-2gqEtE-ai4BVujTpqsH3eB8SQA_jIOEXe8bw
Message-ID: <CABdmKX3LMJLTZN8-x8jFAM8p58pg-6P5-B=mHBf98_uAVtxxwQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 5/5] selftests/bpf: Add test for open coded
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

On Fri, May 9, 2025 at 2:58=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Fri, May 9, 2025 at 2:43=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> [...]
> > >
> > > Personally, I would prefer we just merge all the logic of
> > > create_udmabuf() and create_sys_heap_dmabuf()
> > > into create_test_buffers().
> >
> > That's a lot of different stuff to put in one place. How about
> > returning file descriptors from the buffer create functions while
> > having them clean up after themselves:
>
> I do like this version better. Some nitpicks though.
>
> >
> > -static int memfd, udmabuf;
> > +static int udmabuf;
>
> About this, and ...
>
> >  static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D
> > "udmabuf_test_buffer_for_iter";
> >  static size_t udmabuf_test_buffer_size;
> >  static int sysheap_dmabuf;
> >  static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D
> > "sysheap_test_buffer_for_iter";
> >  static size_t sysheap_test_buffer_size;
> >
> > -static int create_udmabuf(int map_fd)
> > +static int create_udmabuf(void)
> >  {
> >         struct udmabuf_create create;
> > -       int dev_udmabuf;
> > -       bool f =3D false;
> > +       int dev_udmabuf, memfd, udmabuf;
> .. here.
>
> It is not ideal to have a global udmabuf and a local udmabuf.
> If we want the global version, let's rename the local one.

Ok let me change up the name of the aliasing variable to local_udmabuf.

> [...]
>
> >
> >  static int create_test_buffers(int map_fd)
> >  {
> > -       int ret;
> > +       bool f =3D false;
> > +
> > +       udmabuf =3D create_udmabuf();
> > +       sysheap_dmabuf =3D create_sys_heap_dmabuf();
> >
> > -       ret =3D create_udmabuf(map_fd);
> > -       if (ret)
> > -               return ret;
> > +       if (udmabuf < 0 || sysheap_dmabuf < 0)
> > +               return -1;
>
> We also need destroy_test_buffers() on the error path here,
> or at the caller.

The caller does currently check to decide if it should bother running
the tests or not, and calls destroy_test_buffers() if not.

> > -       return create_sys_heap_dmabuf(map_fd);
> > +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name,
> > &f, BPF_ANY) ||
> > +              bpf_map_update_elem(map_fd, sysheap_test_buffer_name,
> > &f, BPF_ANY);
> >  }
> >
> >  static void destroy_test_buffers(void)
> >  {
> >         close(udmabuf);
> > -       close(memfd);
> >         close(sysheap_dmabuf);
>
> For the two global fds, let's reset them to -1 right after close().
>
> Thanks,
> Song

Will do, thanks.
