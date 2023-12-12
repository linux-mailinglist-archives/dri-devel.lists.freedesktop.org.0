Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EA80EEAB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2E310E5D4;
	Tue, 12 Dec 2023 14:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CD010E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:27:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54dca2a3f16so10521025a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702391224; x=1702996024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCZPRFlYELlSqnd7f+LApbuWWSOTUwHuWf2lhre3cTY=;
 b=lTM3YYYFhPQJUwwtzZ0qLVn5ey6KvGpLnn2vBQzVt1u2P4Us1T2k3+NkikL7FkEgJ/
 dCUWogDi/JdX61/9rsPhqm8Jg04KM3NApWPskcXrM3Hvm2/K1QE49QanZHO/4pty7sss
 S6a+ndLhA6+53VhpuAPyCfnGzs9+21nX46FmwzHokwc1YVKP5mN+5VlYS07LPlsiIKqZ
 HSCcmISrsbstE8oloZhS5J80eRrtNJJuWePXQvZXF/zK/S6pq/uwfsvDrw5BGrgQncf3
 hvNaj8mOZXW9xOCVHrrCQGYSuAXqoe05mtXyiqMrjw0IkJoLDniCPz1A1Pz9weGlpbac
 dtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702391224; x=1702996024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCZPRFlYELlSqnd7f+LApbuWWSOTUwHuWf2lhre3cTY=;
 b=a5QgEbGzu7ry83y4cWpIwG2L++S1mGYbyMROxukieroUBbcyK9Oor8K7TySfWk22PO
 VidTqWietXaIGipD96qlGY3EfiaS/5EfDCgVenSA4+P8erogJ2azWAojrloDVu0tJfBb
 HZYHGIiJDaDJQ1ZUD7ZfAlJXjYkWB5yB5VuO6p0zpMjF5gims97z84ZvLxj59HAz2A5O
 tSd5M11xP25QbX9zxNTEMzlHI8kfqdcGJtJ5b4d/7wXyYnfdidBikI3FKwwKQOwOrLNY
 0OrY7ynHSwoHGUjhoR/F9XurcjhFufp8gSkz4YuNNj4XadE882M1jNBCOJuxMO1jotOL
 SpAQ==
X-Gm-Message-State: AOJu0YxXyIEKfWgIcqNeDQUIUcq7N+9DTHRjYoau5lwTYqCBtr9taH+m
 2kM7q9joXZg+lLvu7huURWqXTPPJPExV4Sz+C+cFug==
X-Google-Smtp-Source: AGHT+IEOyCkF2DgwL7RBhVnTjCksBIhJaDTVsJX1VcMmek5dl3277Sns8cp70gbrdUy6r5MpVMdk0OJS5kwbSqhfdhU=
X-Received: by 2002:a17:906:51de:b0:9f2:859f:713e with SMTP id
 v30-20020a17090651de00b009f2859f713emr7079811ejk.3.1702391223630; Tue, 12 Dec
 2023 06:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <20231212122535.GA3029808@nvidia.com>
In-Reply-To: <20231212122535.GA3029808@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 12 Dec 2023 06:26:51 -0800
Message-ID: <CAHS8izMVMx0fpT=dWsnD7piqs1g7Fam8Xf5dK3iOFNxeOQD9vQ@mail.gmail.com>
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

On Tue, Dec 12, 2023 at 4:25=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Dec 07, 2023 at 04:52:39PM -0800, Mina Almasry wrote:
>
> > +static inline struct page_pool_iov *page_to_page_pool_iov(struct page =
*page)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return (struct page_pool_iov *)((unsigned long)page & ~PP=
_IOV);
> > +
> > +     DEBUG_NET_WARN_ON_ONCE(true);
> > +     return NULL;
> > +}
>
> We already asked not to do this, please do not allocate weird things
> can call them 'struct page' when they are not. It undermines the
> maintainability of the mm to have things mis-typed like
> this. Introduce a new type for your thing so the compiler can check it
> properly.
>

There is a new type introduced, it's the page_pool_iov. We set the LSB
on page_pool_iov* and cast it to page* only to avoid the churn of
renaming page* to page_pool_iov* in the page_pool and all the net
drivers using it. Is that not a reasonable compromise in your opinion?
Since the LSB is set on the resulting page pointers, they are not
actually usuable as pages, and are never passed to mm APIs per your
requirement.

--=20
Thanks,
Mina
