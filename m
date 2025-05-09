Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58DAB1F78
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8FD10EB01;
	Fri,  9 May 2025 21:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GP2JHmkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF40B10EB01
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 932BCA4D4CC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3E2C4AF0C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746827935;
 bh=bod7OgH9FMLNk7FKdLh8z63aV2T+h8TH6ReCA7jp2gc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GP2JHmkHqZVSr+nu2crQWjues0U90e8i3Ya914vkXMQIl53Xt374D30l8Nocq3q1w
 4vv16J/RpNVizNh0xqEHsrxtYURtqTJBqU8ToXF60C06jGI7aPY/imBTJCTYV9ecEI
 IyW9iIDRaPJDx+Rpw4tep1hStJTboWEJSu8eLp6L5nARY6Z4tQeq12IM5LSDCKKW1s
 KmwWKQ2ziUtniPX3N2pTCsxLcSReBf67ZkuDv4TSD7xtQvwSG/RJLvAYEylZRU/elu
 tTpPGRZk1g3UFgfUbucXxPK8dGvPCYeM9C7odJk9FL2nEK/hQxLzAABaAvQ1+Gjld6
 XzkpTaTXrlE7w==
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-476ab588f32so39898441cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 14:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKeLFtwDNWazhd5NL22kvwzlCjuqGPvKO6xrDuj7SVZGEcBFd5IcaCghjYWPkMDJ4OuYKc5HH8khY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1Am0Wr2p0mRULbqzgr85gm24bg/dTnrO2k4Gns2QbXWcceiI3
 zPWmCdqBbfWPbQSKKq3AMDv9q3XD9wgSxrmyJugB9EbsFBXu1fgZFC9ZJBfJTXki3MdMilLP80+
 4pU6NZSUn2Ert5FgoeZi55zLFWRQ=
X-Google-Smtp-Source: AGHT+IEgw/OIWDWXmJWHEkTR/5DcaJ04lcLlTsKykO84AozF3RympSmmA4dzDH25HCRL4W/HlqroK6FilrCD1i+wCWA=
X-Received: by 2002:ad4:5cc7:0:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6f6e47bd8a3mr77458376d6.17.1746827933963; Fri, 09 May 2025
 14:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-6-tjmercier@google.com>
 <CAPhsuW5WOmyfPqBc_Hn7ApGWP_2uz_cJwyaDWF_VwiHJu9s_1A@mail.gmail.com>
 <CABdmKX2h5cGjNbJshGkQ+2XJ7eOnM+VfbmVr5Pj5c0qfxQA-qg@mail.gmail.com>
In-Reply-To: <CABdmKX2h5cGjNbJshGkQ+2XJ7eOnM+VfbmVr5Pj5c0qfxQA-qg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 9 May 2025 14:58:42 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7BM=X06Tr+HURsCbD8LwAO=Fdu+ZfKDy6RNK=UNNC1Rg@mail.gmail.com>
X-Gm-Features: ATxdqUHtjHO0cnNYi6P788wo4nENW6QfEqucHX0SCFZlWpdcEK8f_Ki_Hjh7ovQ
Message-ID: <CAPhsuW7BM=X06Tr+HURsCbD8LwAO=Fdu+ZfKDy6RNK=UNNC1Rg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 5/5] selftests/bpf: Add test for open coded
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

On Fri, May 9, 2025 at 2:43=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
[...]
> >
> > Personally, I would prefer we just merge all the logic of
> > create_udmabuf() and create_sys_heap_dmabuf()
> > into create_test_buffers().
>
> That's a lot of different stuff to put in one place. How about
> returning file descriptors from the buffer create functions while
> having them clean up after themselves:

I do like this version better. Some nitpicks though.

>
> -static int memfd, udmabuf;
> +static int udmabuf;

About this, and ...

>  static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D
> "udmabuf_test_buffer_for_iter";
>  static size_t udmabuf_test_buffer_size;
>  static int sysheap_dmabuf;
>  static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D
> "sysheap_test_buffer_for_iter";
>  static size_t sysheap_test_buffer_size;
>
> -static int create_udmabuf(int map_fd)
> +static int create_udmabuf(void)
>  {
>         struct udmabuf_create create;
> -       int dev_udmabuf;
> -       bool f =3D false;
> +       int dev_udmabuf, memfd, udmabuf;
.. here.

It is not ideal to have a global udmabuf and a local udmabuf.
If we want the global version, let's rename the local one.

[...]

>
>  static int create_test_buffers(int map_fd)
>  {
> -       int ret;
> +       bool f =3D false;
> +
> +       udmabuf =3D create_udmabuf();
> +       sysheap_dmabuf =3D create_sys_heap_dmabuf();
>
> -       ret =3D create_udmabuf(map_fd);
> -       if (ret)
> -               return ret;
> +       if (udmabuf < 0 || sysheap_dmabuf < 0)
> +               return -1;

We also need destroy_test_buffers() on the error path here,
or at the caller.

>
> -       return create_sys_heap_dmabuf(map_fd);
> +       return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name,
> &f, BPF_ANY) ||
> +              bpf_map_update_elem(map_fd, sysheap_test_buffer_name,
> &f, BPF_ANY);
>  }
>
>  static void destroy_test_buffers(void)
>  {
>         close(udmabuf);
> -       close(memfd);
>         close(sysheap_dmabuf);

For the two global fds, let's reset them to -1 right after close().

Thanks,
Song
