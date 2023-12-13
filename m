Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACEB810758
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 02:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE99810E229;
	Wed, 13 Dec 2023 01:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E710E229
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:09:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso39588355e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 17:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702429789; x=1703034589;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0i1d9QvoS4OxhYISeUTScW7akaFRcF7KdLSyFQ8hFdE=;
 b=QZCZeCpw5RfRd4zLmCSVkhxHsJArKn6EQ4uAdzFhMOASvKZXnH25PKMq5WRyUBNI4j
 Y8fDq92zXmI9L+EgQAs31OW7UYyfp6CVlSD5OYo+3rUyRiQGKJ1okp/AMHxSkcNbZBzV
 KM2fmYfzp2BlN+ch730kTWpXl53Xn4zx7HF8Gphh5clPk/x+MvlasoT5ZSfw+uYslw9y
 Y5AuWB/Lm6q2nLDGs5xCeNJyjzuDqdi8lbtrubIaqopdUaJ0pQVrF+PE9B6N36Zjvla7
 Bb5LDIqXXZaoMhU1FO+7aEkpve4F0vNucSKsNo9qETnBF0u2ryIVG91FdZhSUvB53oaf
 sYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702429789; x=1703034589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0i1d9QvoS4OxhYISeUTScW7akaFRcF7KdLSyFQ8hFdE=;
 b=HJKw8TSngYKoADjdLu1WR72zup90F96mbqm+o+AEJBeEAZrr1xF+ZT8VVsOIVkmO5Z
 Ru+YfjOLaqr7EC3qER8g1JoYmUiSl13mhn3Tz4x9NVusyGXZ4ErNXbYrtboDhIZfjbiC
 GfpHx9uI3MDrLvxPon7oCNoiUoxo+Do0HulEnjItWqBX62CECkkqRYGmXjwnH+R3+BdS
 SzWteiEtlm+1I1YayyRZlQh6ppcGN0gUTlvxGpe1b66Prp9HTNvlhkgvDwQXAvwn7pxH
 N89nIW+XT5XY852Kc1J5x73CMRbo3ZrYlYAHWZU64vJfFtAOmrSWRIcbVKGdjjYV7HsN
 n0qw==
X-Gm-Message-State: AOJu0YwimGrMU4D5THCawN0ZT7yFMcBiy5Zgl2kwkVP+t8D9gfO2YkLB
 DahUlbJTJQh++BANqBhyu3sXLZeVV4//xuGx8IZFlQ==
X-Google-Smtp-Source: AGHT+IFHv6ulP97j2C3dKg3abBYpoQRGbAehnWd7YHUNtYhyRmrdi8aZpqMGubt6wRgBcXdnMdT0ZlS6rLmxwPeMcJk=
X-Received: by 2002:a05:600c:4f86:b0:40c:48fb:ea01 with SMTP id
 n6-20020a05600c4f8600b0040c48fbea01mr1374675wmq.209.1702429789212; Tue, 12
 Dec 2023 17:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <20231212122535.GA3029808@nvidia.com>
 <CAHS8izMVMx0fpT=dWsnD7piqs1g7Fam8Xf5dK3iOFNxeOQD9vQ@mail.gmail.com>
 <20231212143942.GF3014157@nvidia.com>
 <CAHS8izNHtemjjkMf43grCHP1RZ=2UFiMtgea0M6+PaAgC=DDMQ@mail.gmail.com>
 <20231212150834.GI3014157@nvidia.com>
In-Reply-To: <20231212150834.GI3014157@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 12 Dec 2023 17:09:35 -0800
Message-ID: <CAHS8izMdKYyjE9bdcFDWWPWECwVZL7XQjtjOFoTq5_bEEJvN6w@mail.gmail.com>
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

On Tue, Dec 12, 2023 at 7:08=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Dec 12, 2023 at 06:58:17AM -0800, Mina Almasry wrote:
>
> > Jason, we set the LSB on page_pool_iov pointers before casting it to
> > struct page pointers. The resulting pointers are not useable as page
> > pointers at all.
>
> I understand that, the second ask is about maintainability of the mm
> by using correct types.
>
> > > Perhaps you can simply avoid this by arranging for this driver to als=
o
> > > exclusively use some special type to indicate the dual nature of the
> > > pointer and leave the other drivers as using the struct page version.
> >
> > This is certainly possible, but it requires us to rename all the page
> > pointers in the page_pool to the new type, and requires the driver
> > adding devmem TCP support to rename all the page* pointer instances to
> > the new type. It's possible but it introduces lots of code churn. Is
> > the LSB + cast not a reasonable compromise here? I feel like the trick
> > of setting the least significant bit on a pointer to indicate it's
> > something else has a fair amount of precedent in the kernel.
>
> Linus himself has complained about exactly this before, and written a cle=
anup:
>
> https://lore.kernel.org/linux-mm/20221108194139.57604-1-torvalds@linux-fo=
undation.org/
>
> If you mangle a pointer *so it is no longer a pointer* then give it a
> proper opaque type so the compiler can check everything statically and
> require that the necessary converters are called in all cases.
>
> You call it churn, I call it future maintainability. :(
>
> No objection to using the LSB, just properly type a LSB mangled
> pointer so everyone knows what is going on and don't call it MM's
> struct page *.
>
> I would say this is important here because it is a large driver facing
> API surface.
>

OK, I imagine this is not that hard to implement - it's really whether
the change is acceptable to reviewers.

I figure I can start by implementing a no-op abstraction to page*:

typedef struct page netmem_t

and replace the page* in the following places with netmem_t*:

1. page_pool API (not internals)
2. drivers using the page_pool.
3. skb_frag_t.

I think that change needs to be a separate series by itself. Then the
devmem patches would on top of that change netmem_t such that it can
be a union between struct page and page_pool_iov and add the special
handling of page_pool_iov. Does this sound reasonable?


--
Thanks,
Mina
