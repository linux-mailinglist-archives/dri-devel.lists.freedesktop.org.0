Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729EDA97ACE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 01:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716010E3CC;
	Tue, 22 Apr 2025 23:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P8IrZmOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65710E132
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 23:01:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso4118563f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745362862; x=1745967662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DZZs3urMIkgKkax6S198AR9JC9qXI5Y4B01yv+Q6cc=;
 b=P8IrZmOwqYv3lLdBL9tv2OF5D1x8ebY/y0YBOUfrd7dUqqxKlI+9ULK6pbSmkOMcJr
 2pDl+wlbLe4srLhJJx8GCvHNRBOfh92KTweTwgC1UnUCi3I7x+Ft6jpZl2HHeQ4NZvEM
 Cg4aNAiJSfbVM5zAaSULgkK2MzD1qrweMRyQgec8Gy4cJN4b0ecGjp1R/Hg203oc9Etc
 eYx4xNX8NI4WiXNWm0+a/1HIAtmVaqOAsiR49Q62Fq0JB+6IawjSvQ9KWw6dVBvQYqwa
 LSP4IV/CsYM7C1oPX3HrONyJanOaO1EotHKR0YWtCCI51y+fa9ZVdWXgI3UQBZ8wW8Zz
 Lgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745362862; x=1745967662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DZZs3urMIkgKkax6S198AR9JC9qXI5Y4B01yv+Q6cc=;
 b=YQ7cG3vcyYGMm2BCDU9ENGqrEo3p464s1IMUolrxxCEgGC1u9b6akJetg/ibS5Bgy0
 gWgywXLPG+iW6G4v66+fd0HjKfIyqC1jQmRu3wZ4wnAwMRsPlMz91VW3YYdj/YSTDqO3
 Flm+1gYD5CVJ1gUsG+JIW5lk4TqS8EE20vWIb3f639SP0kMrOwk4JLwBKZbM4pyTZ+Qb
 S1gCzw0vY/f/ag4gDgdpF3WyJaY5nCj6pX9yp2Ogf3Qtd5t3ep0YA5MzkOMPIxS8PuDk
 eP/Ai1ebvLAP6iUKhX6zx5HE9zzfVewKuw3nFWlqlSG87393KO7RUf2wD8R9S1Uv/gP+
 d1tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTYOCMxEzPOviWob1eQiYZjQmPIIp0pvwlxnFROLP5a5qnYhIvgspSwcLc+9ACr0Qgc1UKf8Wg9co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFczX2pI+P54auXe5cQAQPdO+5z/T2fJVOUjv9/o+kIbUFRPeR
 Ho8/GamADAy8gNQHX31iSrfOvN0rf/v4edOfftZqmNgNgSIz5T25JVwXP8k4rU9W3EZlJgCscY+
 ZHU47NiBLmQgERgr3o1QIhhzG9lE=
X-Gm-Gg: ASbGnctW+6jXfC+5GH3Gs6akpJpByNjSAWI/1OgirHlo2aeJKUy69LEFojAew3AiKM1
 e2sW00w4pUcCh1tfaf5d7DcYX7M3s43WQdUgXnkGl+gsZa7WOtXWnUc4T2f/2MJP4OjjXxTOrpe
 r9WNggJja/YIljlc4qaqh/r+yUp6/JWju0EL//6Q==
X-Google-Smtp-Source: AGHT+IGt6+T2kc0TlT5ebzJdvJefOqUojkLn0RGemaQgYEJUKgmj/RrlmcHqYXf+vn/5+dgoo13LpO7auPqItYTUqRE=
X-Received: by 2002:a5d:5983:0:b0:39f:ef3:b51b with SMTP id
 ffacd0b85a97d-39f0ef3b57amr4988601f8f.32.1745362861514; Tue, 22 Apr 2025
 16:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
 <CABdmKX1OqLLsY5+LSMU-c=DDUxTFaivNcyXG3ntD8D0ty1Pwig@mail.gmail.com>
 <CAADnVQ+0PXgm_VuSJDKwr9iomxFLuG-=Chi2Ya3k0YPnKaex_w@mail.gmail.com>
 <CABdmKX1aMuyPTNXD72wXyXAfOi6f58DfcaBDh6uDo0EQ7pKChw@mail.gmail.com>
In-Reply-To: <CABdmKX1aMuyPTNXD72wXyXAfOi6f58DfcaBDh6uDo0EQ7pKChw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 22 Apr 2025 16:00:50 -0700
X-Gm-Features: ATxdqUFV6-ZmprAqwitymw1JEAl4xKZ0kwOCrx-SEEYutS3W3o6khh6mDKj5Uhw
Message-ID: <CAADnVQ+AesNdq_LB+MWxLnHbU08Zrn-8VgwY4+0PKuk7PmRd+w@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
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

On Tue, Apr 22, 2025 at 12:57=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Mon, Apr 21, 2025 at 4:39=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Apr 21, 2025 at 1:40=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > > > new file mode 100644
> > > > > index 000000000000..b4b8be1d6aa4
> > > > > --- /dev/null
> > > > > +++ b/kernel/bpf/dmabuf_iter.c
> > > >
> > > > Maybe we should add this file to drivers/dma-buf. I would like to
> > > > hear other folks thoughts on this.
> > >
> > > This is fine with me, and would save us the extra
> > > CONFIG_DMA_SHARED_BUFFER check that's currently needed in
> > > kernel/bpf/Makefile but would require checking CONFIG_BPF instead.
> > > Sumit / Christian any objections to moving the dmabuf bpf iterator
> > > implementation into drivers/dma-buf?
> >
> > The driver directory would need to 'depends on BPF_SYSCALL'.
> > Are you sure you want this?
> > imo kernel/bpf/ is fine for this.
>
> I don't have a strong preference so either way is fine with me. The
> main difference I see is maintainership.
>
> > You also probably want
> > .feature                =3D BPF_ITER_RESCHED
> > in bpf_dmabuf_reg_info.
>
> Thank you, this looks like a good idea.
>
> > Also have you considered open coded iterator for dmabufs?
> > Would it help with the interface to user space?
>
> I read through the open coded iterator patches, and it looks like they
> would be slightly more efficient by avoiding seq_file overhead. As far
> as the interface to userspace, for the purpose of replacing what's
> currently exposed by CONFIG_DMABUF_SYSFS_STATS I don't think there is
> a difference. However it looks like if I were to try to replace all of
> our userspace analysis of dmabufs with a single bpf program then an
> open coded iterator would make that much easier. I had not considered
> attempting that.
>
> One problem I see with open coded iterators is that support is much
> more recent (2023 vs 2020). We support longterm stable kernels (back
> to 5.4 currently but probably 5.10 by the time this would be used), so
> it seems like it would be harder to backport the kernel support for an
> open-coded iterator that far since it only goes back as far as 6.6
> now. Actually it doesn't look like it is possible while also
> maintaining the stable ABI we provide to device vendors. Which means
> we couldn't get rid of the dmabuf sysfs stats userspace dependency
> until 6.1 EOL in Dec. 2027. :\ So I'm in favor of a traditional bpf
> iterator here for now.

Fair enough, but please implement both and backport only
the old style pinned iterator.
The code will be mostly shared between them.
bpf_iter_dmabuf_new/_next will be more flexible with more
options to return data to user space. Like android can invent
their own binary format. Pack into it in a bpf prog, send to
bpf ringbuf and unmarshal efficiently in user space.
Instead of being limited to text output that pinned iterators
are supposed to do usually.
You can do binary with bpf_seq_write() too, but it's rare.

Also please provide full bpf prog that you'll use in production
in a selftest instead of trivial:
+SEC("iter/dmabuf")
+int dmabuf_collector(struct bpf_iter__dmabuf *ctx)

just to make sure it's tested end to end and future changes
won't break it.

pw-bot: cr
