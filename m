Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD69AB1847
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B36310EA54;
	Fri,  9 May 2025 15:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Y/Ps341G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0210EA54
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:21:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso76655e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746804108; x=1747408908;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PODw7ulR9PB7arm5tdpwF+f90XRe1aMGGhaLajPSDEc=;
 b=Y/Ps341GxII283mKe5zHk0N+U4IzHqlR0AR4WZ1E1D86CzuRt8nR5sBILuW1Q8gveQ
 VE/GspXvAeOrwKHzsUh2A9ilfW0VkiNCBypabE0unjMw+DOlmrcXPRiJ6/lHhpYBJA69
 7CxhiS1AmwwyhexKsD6SmE0Lusec6nFhap+nveCfsTqnjedjmgwo/KKcb45U+XMkdBfI
 IuG3/7I5RI9cTp+9ujDoFukjn4h5bZ9Qi1hC19m5DoYnStfVR0EqRC8rXwp7G/LleplO
 Yb6EhyMXy5dbziqV6MCRfoL48xN9VMVcEi/yUfpEXWo6O6JEqGXrMpq1iYQu/EBoYN14
 dgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804108; x=1747408908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PODw7ulR9PB7arm5tdpwF+f90XRe1aMGGhaLajPSDEc=;
 b=UYZZ2FYGwMqwBDyZ2F47svZs8rma9hdE+WjDmfCMsVedbjRgobIh8SbzEUNBMM8rgt
 mVa1kX1VlVeMPxaOMh+m6TeuLYfASK82pEON4cO1n8hNYU+W5xipgGtZ+fOET/V+6vij
 nJmkkOLGD21v5DmPyZY3R5uMJY5DvHANsJm5BYbWH4A9FV10AbPVDOHswwxYffO9r2bp
 GIqEA/D6ldz/AgswgmWqwbpUIRGnj+0RLMbQsYsLGa16X1zo2L2QRIkvlrZQNVa1EX4v
 AJrsMiByx6j3rl9NysjZk4NiKVKOF0gMS30x5ZpOas1j6r3c9t514V34d7GsYgT/Oqx7
 AqyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP13Z2f9+XIF8Xmz8kw9IWdepYUEssMZ+EBWKxyUKDwjBEzdL6+ndgLFImTTgCcKtPRQ8dF7Gvk9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNFPr9SKL4HkLUu8+DJPAf14TlgWWM0wHGU5Q4zPJRN5Hb6K2z
 gY2msiSzWKwPbXEZclj43gy5jLJ+8Z4ICaM3FZBED2WSewpFdbX8CzAB1nwicm6QuBzhpxnRiow
 rq4rmAjnR4bV8ZHPHIKKuC+279RUqylD7t9qc
X-Gm-Gg: ASbGncuU3jIhkVHPPZn2dbehOI9M716AqfMIcCNREieWVxwz8CmMa2oxNLNvdTtUHaX
 atDcNqgO4arLHv6489ke0wDkEXlmmWjESySWlNXiAUXM2nJMvdX7C0RRzlQPm5nNUyldB67Ue4O
 6N9Zk0UYk2we7BgoJQLQW6
X-Google-Smtp-Source: AGHT+IFxWr7UYH5UXN0HFUB2iPnwNf7bB78kgOChbtof0mjoiWXBuO/ayaFDhJMwRvTwWokPxNYOF8Jo1WiZoneiOiw=
X-Received: by 2002:a05:600c:4394:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-442d6ed7d6amr1049915e9.2.1746804107643; Fri, 09 May 2025
 08:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <b1e53d0b-04ba-4ad7-abdf-2406283a9cfb@amd.com>
In-Reply-To: <b1e53d0b-04ba-4ad7-abdf-2406283a9cfb@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 08:21:35 -0700
X-Gm-Features: AX0GCFvggZ1wxI53q8jeqfq4ZRzo6BIGXGFyIIxksh_oUSEqZ6C2et9zbwejpqA
Message-ID: <CABdmKX0FSPtF08sjr5dKTZXTPs9SqbHfXYKVGJ7sPk5vsRctDw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/5] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: sumit.semwal@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, skhan@linuxfoundation.org, 
 alexei.starovoitov@gmail.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
 eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
 kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, mykolal@fb.com, 
 shuah@kernel.org, song@kernel.org
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

On Thu, May 8, 2025 at 11:04=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Feel free to add my Acked-by to the patches which don't have my rb yet.
>
> And ping me when I should upstream this through drm-misc-next, but if you=
 want to upstream this through some other branch then that is fine with me =
as well.

Thanks Christian. Alexei mentioned he was willing to take the series
through bpf-next here:
https://lore.kernel.org/all/CAADnVQLqv-ZpoQEhk2UwvSZorSLcjgF7qLD76oHguH5-Gc=
SXxA@mail.gmail.com/

I think it makes sense to send the CONFIG_DMABUF_SYSFS_STATS removal
through drm-misc-next though, so I'll resend that as a standalone
patch whenever I hear about the next longterm stable release.

>
> Regards,
> Christian.
>
> On 5/8/25 20:20, T.J. Mercier wrote:
> > Until CONFIG_DMABUF_SYSFS_STATS was added [1] it was only possible to
> > perform per-buffer accounting with debugfs which is not suitable for
> > production environments. Eventually we discovered the overhead with
> > per-buffer sysfs file creation/removal was significantly impacting
> > allocation and free times, and exacerbated kernfs lock contention. [2]
> > dma_buf_stats_setup() is responsible for 39% of single-page buffer
> > creation duration, or 74% of single-page dma_buf_export() duration when
> > stressing dmabuf allocations and frees.
> >
> > I prototyped a change from per-buffer to per-exporter statistics with a
> > RCU protected list of exporter allocations that accommodates most (but
> > not all) of our use-cases and avoids almost all of the sysfs overhead.
> > While that adds less overhead than per-buffer sysfs, and less even than
> > the maintenance of the dmabuf debugfs_list, it's still *additional*
> > overhead on top of the debugfs_list and doesn't give us per-buffer info=
.
> >
> > This series uses the existing dmabuf debugfs_list to implement a BPF
> > dmabuf iterator, which adds no overhead to buffer allocation/free and
> > provides per-buffer info. The list has been moved outside of
> > CONFIG_DEBUG_FS scope so that it is always populated. The BPF program
> > loaded by userspace that extracts per-buffer information gets to define
> > its own interface which avoids the lack of ABI stability with debugfs.
> >
> > This will allow us to replace our use of CONFIG_DMABUF_SYSFS_STATS, and
> > the plan is to remove it from the kernel after the next longterm stable
> > release.
> >
> > [1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya=
@google.com
> > [2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@goog=
le.com
> >
> > v1: https://lore.kernel.org/all/20250414225227.3642618-1-tjmercier@goog=
le.com
> > v1 -> v2:
> > Make the DMA buffer list independent of CONFIG_DEBUG_FS per Christian K=
=C3=B6nig
> > Add CONFIG_DMA_SHARED_BUFFER check to kernel/bpf/Makefile per kernel te=
st robot
> > Use BTF_ID_LIST_SINGLE instead of BTF_ID_LIST_GLOBAL_SINGLE per Song Li=
u
> > Fixup comment style, mixing code/declarations, and use ASSERT_OK_FD in =
selftest per Song Liu
> > Add BPF_ITER_RESCHED feature to bpf_dmabuf_reg_info per Alexei Starovoi=
tov
> > Add open-coded iterator and selftest per Alexei Starovoitov
> > Add a second test buffer from the system dmabuf heap to selftests
> > Use the BPF program we'll use in production for selftest per Alexei Sta=
rovoitov
> >   https://r.android.com/c/platform/system/bpfprogs/+/3616123/2/dmabufIt=
er.c
> >   https://r.android.com/c/platform/system/memory/libmeminfo/+/3614259/1=
/libdmabufinfo/dmabuf_bpf_stats.cpp
> > v2: https://lore.kernel.org/all/20250504224149.1033867-1-tjmercier@goog=
le.com
> > v2 -> v3:
> > Rebase onto bpf-next/master
> > Move get_next_dmabuf() into drivers/dma-buf/dma-buf.c, along with the
> >   new get_first_dmabuf(). This avoids having to expose the dmabuf list
> >   and mutex to the rest of the kernel, and keeps the dmabuf mutex
> >   operations near each other in the same file. (Christian K=C3=B6nig)
> > Add Christian's RB to dma-buf: Rename debugfs symbols
> > Drop RFC: dma-buf: Remove DMA-BUF statistics
> > v3: https://lore.kernel.org/all/20250507001036.2278781-1-tjmercier@goog=
le.com
> > v3 -> v4:
> > Fix selftest BPF program comment style (not kdoc) per Alexei Starovoito=
v
> > Fix dma-buf.c kdoc comment style per Alexei Starovoitov
> > Rename get_first_dmabuf / get_next_dmabuf to dma_buf_iter_begin /
> >   dma_buf_iter_next per Christian K=C3=B6nig
> > Add Christian's RB to bpf: Add dmabuf iterator
> >
> > T.J. Mercier (5):
> >   dma-buf: Rename debugfs symbols
> >   bpf: Add dmabuf iterator
> >   bpf: Add open coded dmabuf iterator
> >   selftests/bpf: Add test for dmabuf_iter
> >   selftests/bpf: Add test for open coded dmabuf_iter
> >
> >  drivers/dma-buf/dma-buf.c                     |  98 +++++--
> >  include/linux/dma-buf.h                       |   4 +-
> >  kernel/bpf/Makefile                           |   3 +
> >  kernel/bpf/dmabuf_iter.c                      | 149 ++++++++++
> >  kernel/bpf/helpers.c                          |   5 +
> >  .../testing/selftests/bpf/bpf_experimental.h  |   5 +
> >  tools/testing/selftests/bpf/config            |   3 +
> >  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 258 ++++++++++++++++++
> >  .../testing/selftests/bpf/progs/dmabuf_iter.c |  91 ++++++
> >  9 files changed, 594 insertions(+), 22 deletions(-)
> >  create mode 100644 kernel/bpf/dmabuf_iter.c
> >  create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.=
c
> >  create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c
> >
> >
> > base-commit: 43745d11bfd9683abdf08ad7a5cc403d6a9ffd15
>
