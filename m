Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FC80EF74
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A074210E606;
	Tue, 12 Dec 2023 14:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E837010E606
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:58:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso7633397e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702393110; x=1702997910;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzl81dpk3U9T9CudLlEFGkOzt7MaXHqDfkakdpQfiFo=;
 b=O3MgZNCA+ZnJHifGTKNfxhA4Jl1+ObwJ4k+ZYYr7V4j3GaFkFyaHq32xuOX4Dw1ksd
 G5oGWuDyU1tC2Lu2cZiTg8prbIvInDGhVZ8mculffa7vdDqO/GOuML06PntFROfuCPcO
 LNTLtz0U6aS3DLT4LGFnksvmldTcnJNyVsez+Qu9GeEwtRG7wHjYDOEgB8SNRWmGV0cw
 pEC7rjfaowvnBDYidY6auwXgmHkrmOW4rRiWFIOq4X7fR19Vy9exhqVCmz6lHZYFwwN9
 jndWVumGwmZKXzukIFpqdPI6LJpjFsOcP2+oU1D9QcVF+wRkANj+RBE12wJHrt+V0i8v
 eYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702393110; x=1702997910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzl81dpk3U9T9CudLlEFGkOzt7MaXHqDfkakdpQfiFo=;
 b=Quibd/Z/Wk4/EL47+wVrNafjcR9HvUzkoDqLFAkqihU4qICdY2t29m/OODf6Q25t3Q
 eBOj7ySu9rO0aCKoxHWhKH2flQq4q6rXoQUpoTKGjTM29ucj6Dv2Hu/9DnqAEz4WC8g3
 UIrop61BxDw8jOuBckhEI0t+fSue+IRxXG1h1/74OWVlhpMpJ84hFXvn/z4SAOcAjog1
 UZzhQQwwzvec81r1DdtJyi4MCQ9DIv5Vxh+JVwuv9+08BS+Mvh318lY71YHHqKzJV1V6
 eGniMJ04vYYnA1dFpQYXir+TJNi3xc+iPYZNtwTDudhS9AumKdxKRhZP10rcYsGluF8v
 eGhA==
X-Gm-Message-State: AOJu0Yw0/c9HT282hzOlDKRz9DBRS2/hFU4RGT3R7HoJGaNTsHDDsGN/
 Tb4pqlaPLi3kNZWQBErXH9eGl3XiHuE6rYVbCNo8lw==
X-Google-Smtp-Source: AGHT+IERGuBL77UBvy25wKoqAwiWF0N6xvXc57i2t65+NTiYJO5PTJJ6k/4UPi+3laDB/s1BgrFICZhicXsZkg8qeMk=
X-Received: by 2002:ac2:5b4f:0:b0:50b:fa9b:1649 with SMTP id
 i15-20020ac25b4f000000b0050bfa9b1649mr3304569lfp.73.1702393109803; Tue, 12
 Dec 2023 06:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <20231212122535.GA3029808@nvidia.com>
 <CAHS8izMVMx0fpT=dWsnD7piqs1g7Fam8Xf5dK3iOFNxeOQD9vQ@mail.gmail.com>
 <20231212143942.GF3014157@nvidia.com>
In-Reply-To: <20231212143942.GF3014157@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 12 Dec 2023 06:58:17 -0800
Message-ID: <CAHS8izNHtemjjkMf43grCHP1RZ=2UFiMtgea0M6+PaAgC=DDMQ@mail.gmail.com>
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shailend Chand <shailend@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 6:39=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Dec 12, 2023 at 06:26:51AM -0800, Mina Almasry wrote:
> > On Tue, Dec 12, 2023 at 4:25=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com=
> wrote:
> > >
> > > On Thu, Dec 07, 2023 at 04:52:39PM -0800, Mina Almasry wrote:
> > >
> > > > +static inline struct page_pool_iov *page_to_page_pool_iov(struct p=
age *page)
> > > > +{
> > > > +     if (page_is_page_pool_iov(page))
> > > > +             return (struct page_pool_iov *)((unsigned long)page &=
 ~PP_IOV);
> > > > +
> > > > +     DEBUG_NET_WARN_ON_ONCE(true);
> > > > +     return NULL;
> > > > +}
> > >
> > > We already asked not to do this, please do not allocate weird things
> > > can call them 'struct page' when they are not. It undermines the
> > > maintainability of the mm to have things mis-typed like
> > > this. Introduce a new type for your thing so the compiler can check i=
t
> > > properly.
> > >
> >
> > There is a new type introduced, it's the page_pool_iov. We set the LSB
> > on page_pool_iov* and cast it to page* only to avoid the churn of
> > renaming page* to page_pool_iov* in the page_pool and all the net
> > drivers using it. Is that not a reasonable compromise in your opinion?
> > Since the LSB is set on the resulting page pointers, they are not
> > actually usuable as pages, and are never passed to mm APIs per your
> > requirement.
>
> There were two asks, the one you did was to never pass this non-struct
> page memory to the mm, which is great.
>
> The other was to not mistype things, and don't type something as
> struct page when it is, in fact, not.
>
> I fear what you've done is make it so only one driver calls these
> special functions and left the other drivers passing the struct page
> directly to the mm and sort of obfuscating why it is OK based on this
> netdev knowledge of not enabling/using the static branch in the other
> cases.
>

Jason, we set the LSB on page_pool_iov pointers before casting it to
struct page pointers. The resulting pointers are not useable as page
pointers at all.

In order to use the resulting pointers, the driver _must_ use the
special functions that first clear the LSB. It is impossible for the
driver to 'accidentally' use the resulting page pointers with the LSB
set - the kernel would just crash trying to dereference such a
pointer.

The way it works currently is that drivers that support devmem TCP
will declare that support to the net stack, and use the special
functions that clear the LSB and cast the struct back to
page_pool_iov. The drivers that don't support devmem TCP will not
declare support and will get pages allocated from the mm stack from
the page_pool and use them as pages normally.

> Perhaps you can simply avoid this by arranging for this driver to also
> exclusively use some special type to indicate the dual nature of the
> pointer and leave the other drivers as using the struct page version.
>

This is certainly possible, but it requires us to rename all the page
pointers in the page_pool to the new type, and requires the driver
adding devmem TCP support to rename all the page* pointer instances to
the new type. It's possible but it introduces lots of code churn. Is
the LSB + cast not a reasonable compromise here? I feel like the trick
of setting the least significant bit on a pointer to indicate it's
something else has a fair amount of precedent in the kernel.

--
Thanks,
Mina
