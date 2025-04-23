Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8EBA9963E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2849110E21B;
	Wed, 23 Apr 2025 17:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="giglyroh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523210E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:16:25 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so4485e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745428584; x=1746033384;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIH2Y/xRBv399bxbyyQpx3txjQN3EIidmYTSRd0t7U0=;
 b=giglyroh+e70YlC3Ta+V+3DvAXTFvabgOvVFb7cXpjLlurQz+Yg2WepFOnsTYb6fTi
 BIOFiWsxIxHMeJDrLaK0yyNLXZWSntyS11qqQUpeeXkzLqRo2RrDXicuIVa1zBTUYYMn
 h05cPibH6iOQ9PsjrHc4Y16BqjfssA0hdYK7NfIS4PnasA0xwy9PCe/cK7nw6gayRPHE
 B4wMyzPnWIlmZTizcuBzplqrD+g4hbNz0hKJLkP47kHkP43yHHAf5qPfp0q9obJDc+v5
 McLBxs0VcQd+MmwyyKJsKdnmPlNXRky/vdLYh+Rpk0wHM9DmDlzeH9ThV0OU+3TqwEWi
 b3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745428584; x=1746033384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIH2Y/xRBv399bxbyyQpx3txjQN3EIidmYTSRd0t7U0=;
 b=JY9xgzXar4Ac7C/nmsv0EdJb3N2FC4qiToyoHLZmf7Ej/Bpvfg+w7RHtZOfli1VYV7
 b980dAlzVWV7P2eoEOD73QS0oMQBQhE0bPlZD6zzHPCvrB+eta5OwVETdN98hRIzxVwL
 TfNtknkDbInF4SyBEAmtBWm7Fq6VEfwbA7R+NlupAYjJhoVhG/oORUWflI73wbshCOvN
 4eCiSkeF+lGDwa+3d7gvO89zT57sdvqOgBsuIbH4niKuiDVMhNlR0zNAZn+XRJQ0E0LI
 L9T7JfouI9u1Po12HOed0kP0dILHBdyoyZYYZ32KQXBwx0ATeDMg2q+Lec8AcrKkTEqP
 bZuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvwitu1GuTk6+B/iC0rZauH9fCU/GOXNlPFgNfSxAzt3M88n86k2RLjkLIGQDGxHLqq3F2Jj9clyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzslZ4rvKtODuFGyf/Eiw0bxexAS4D2VwniCFTrGhAoywLEnCh2
 IRuuYCsU0QP3iEJpyq+Djudbvir0dspgE7e1qB7bk7F/VW+KOu3V5dtJk+6YaLjKlrKzAgOFIiD
 98IZY0vw2ae9hACBL8pqdjClo3geoY5BjQwSV
X-Gm-Gg: ASbGncu62ujncsEOzdGJex2SG3jJoMmS96VjOAkeY6/dneMyWOEZjlcHDje+jVl6Hpa
 skRdztc/VhFrxmnBXgw2Xj1SHgAQCw1bdfFNq3GayQi2FoBm0Mdl9j/Iftxt5uZR2G1z5YDN284
 /xSeB50A6QtIhZ0TYNee3o3FMvV5PbXMYT1z7bqUBo+KLmo4Ufh0OB
X-Google-Smtp-Source: AGHT+IEel/YT/gnh0VEYAVLvUZfUcOlX9vT6+bEdhBmfMWss5izqapNDBKSe0DOopFndovC2banc6XkwLECVQbHq0Kw=
X-Received: by 2002:a05:600c:1c85:b0:43d:169e:4d75 with SMTP id
 5b1f17b1804b1-44092d44519mr1219535e9.1.1745428583917; Wed, 23 Apr 2025
 10:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
 <CABdmKX1OqLLsY5+LSMU-c=DDUxTFaivNcyXG3ntD8D0ty1Pwig@mail.gmail.com>
 <CAADnVQ+0PXgm_VuSJDKwr9iomxFLuG-=Chi2Ya3k0YPnKaex_w@mail.gmail.com>
 <CABdmKX1aMuyPTNXD72wXyXAfOi6f58DfcaBDh6uDo0EQ7pKChw@mail.gmail.com>
 <CAADnVQ+AesNdq_LB+MWxLnHbU08Zrn-8VgwY4+0PKuk7PmRd+w@mail.gmail.com>
In-Reply-To: <CAADnVQ+AesNdq_LB+MWxLnHbU08Zrn-8VgwY4+0PKuk7PmRd+w@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 23 Apr 2025 10:16:12 -0700
X-Gm-Features: ATxdqUGSlAvQmLyJTaMr0DEawjdns0rX87YnkYfV8wWxaP1lEb4mrCvXcX0Kneg
Message-ID: <CABdmKX26VGYxjUh1Gc4TBD71-vGr2MLZdhik36cKStpbG5t7=A@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <song@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 android-mm@google.com, simona@ffwll.ch, 
 Jonathan Corbet <corbet@lwn.net>, Eduard <eddyz87@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>
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

On Tue, Apr 22, 2025 at 4:01=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Apr 22, 2025 at 12:57=E2=80=AFPM T.J. Mercier <tjmercier@google.c=
om> wrote:
> >
> > On Mon, Apr 21, 2025 at 4:39=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Mon, Apr 21, 2025 at 1:40=E2=80=AFPM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > >
> > > > > > new file mode 100644
> > > > > > index 000000000000..b4b8be1d6aa4
> > > > > > --- /dev/null
> > > > > > +++ b/kernel/bpf/dmabuf_iter.c
> > > > >
> > > > > Maybe we should add this file to drivers/dma-buf. I would like to
> > > > > hear other folks thoughts on this.
> > > >
> > > > This is fine with me, and would save us the extra
> > > > CONFIG_DMA_SHARED_BUFFER check that's currently needed in
> > > > kernel/bpf/Makefile but would require checking CONFIG_BPF instead.
> > > > Sumit / Christian any objections to moving the dmabuf bpf iterator
> > > > implementation into drivers/dma-buf?
> > >
> > > The driver directory would need to 'depends on BPF_SYSCALL'.
> > > Are you sure you want this?
> > > imo kernel/bpf/ is fine for this.
> >
> > I don't have a strong preference so either way is fine with me. The
> > main difference I see is maintainership.
> >
> > > You also probably want
> > > .feature                =3D BPF_ITER_RESCHED
> > > in bpf_dmabuf_reg_info.
> >
> > Thank you, this looks like a good idea.
> >
> > > Also have you considered open coded iterator for dmabufs?
> > > Would it help with the interface to user space?
> >
> > I read through the open coded iterator patches, and it looks like they
> > would be slightly more efficient by avoiding seq_file overhead. As far
> > as the interface to userspace, for the purpose of replacing what's
> > currently exposed by CONFIG_DMABUF_SYSFS_STATS I don't think there is
> > a difference. However it looks like if I were to try to replace all of
> > our userspace analysis of dmabufs with a single bpf program then an
> > open coded iterator would make that much easier. I had not considered
> > attempting that.
> >
> > One problem I see with open coded iterators is that support is much
> > more recent (2023 vs 2020). We support longterm stable kernels (back
> > to 5.4 currently but probably 5.10 by the time this would be used), so
> > it seems like it would be harder to backport the kernel support for an
> > open-coded iterator that far since it only goes back as far as 6.6
> > now. Actually it doesn't look like it is possible while also
> > maintaining the stable ABI we provide to device vendors. Which means
> > we couldn't get rid of the dmabuf sysfs stats userspace dependency
> > until 6.1 EOL in Dec. 2027. :\ So I'm in favor of a traditional bpf
> > iterator here for now.
>
> Fair enough, but please implement both and backport only
> the old style pinned iterator.

Ok, will do.

> The code will be mostly shared between them.
> bpf_iter_dmabuf_new/_next will be more flexible with more
> options to return data to user space. Like android can invent
> their own binary format. Pack into it in a bpf prog, send to
> bpf ringbuf and unmarshal efficiently in user space.
> Instead of being limited to text output that pinned iterators
> are supposed to do usually.

Also a neat idea!

> You can do binary with bpf_seq_write() too, but it's rare.
>
> Also please provide full bpf prog that you'll use in production
> in a selftest instead of trivial:
> +SEC("iter/dmabuf")
> +int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
>
> just to make sure it's tested end to end and future changes
> won't break it.

The final bpf program should be something pretty close to that, but
I'll start working on the AOSP side as well so I can put up patches.

>
> pw-bot: cr
