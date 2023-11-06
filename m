Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B417E2EC1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424CF10E427;
	Mon,  6 Nov 2023 21:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7D810E427
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:15:03 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4ac1988ca66so1515067e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699305302; x=1699910102; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pDNcwAtyE05sKduQb5rMgv/slyyDqYM9dQystHpAe00=;
 b=TKBwRqvrIU3iDcdk/LWmHidJnVqNVyn2Eh2kNZmLLlzJ8CsfQ9lMGlkYeajdpaJm6r
 mSz2telIHccWgOWLGvGLrFtUCztt4Y7UotgiQQRZ1CBKCTdQxPnYNqrgL1cYMqgwIw8j
 czKOjP+0qj2rqIseagdheN2qwF3YQmNtQJ1k0CFTyeXqmAqfOAjlm19UtNLY2fcMDViY
 6/0SaNq9zcEAsMxm3NYgcTjhvceLbAHsDUVbd+oOtZp1D8XK5sUk9864LBhe84U5WnMT
 u37OG2U46Im6HhZmMi7V+hk56jiaePOuwCnO0Q3fmOb5tq1PczC3DNbv6pwSZM5B5ZNj
 lPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699305302; x=1699910102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDNcwAtyE05sKduQb5rMgv/slyyDqYM9dQystHpAe00=;
 b=T8QYMkq2TOr8MdM11nBJsnXyqcfi/2t5Wgb9f/fZjFAU8GDietONvcXXlt2GNh4euZ
 5KTGuMkOkpQuGLtwZ5zubFa1M+8LqGELyjhXoR6oo98geJGsCsUybqiQD0LnDnFn6x9Y
 pX8d4oMr+PsN+ubp86mQ4xCyu3LhdPBpNfkJPJW3JJ37+Pmvu9YsVCEcNbypitrRKw/e
 9nojbNkwzNLCLEhkHBt0yIo/Ks8wwQmQ5cCBfduZ9lMznE8pYEZJMVYhE3DIr3rWtGyr
 97BSgu9mqqADXYsK9xTczRSKSGuLPS7z9KufCDmXzxXsYojeQVlkcX7DfS6BB0zFrc2k
 Fgyg==
X-Gm-Message-State: AOJu0YyveEgzoOJ9h1SIvOOxOOs2+rxrmLvnd8PHz5Rz+bOGNXjm8xo1
 rLx7my+V7I5R6fRqGcgeXh5xoI+rYoFM68xQ58c=
X-Google-Smtp-Source: AGHT+IFSfXgdSlZ+tas3UVj7xs8CWVob5ysFpk92liyDA5WPCjjGPD1amiOzYCm06+9kKyONPbaGF06Qrr1pItVwWII=
X-Received: by 2002:a05:6122:4694:b0:49d:20fb:c899 with SMTP id
 di20-20020a056122469400b0049d20fbc899mr441320vkb.4.1699305302147; Mon, 06 Nov
 2023 13:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
In-Reply-To: <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 6 Nov 2023 13:14:25 -0800
Message-ID: <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > IMHO, we need a better UAPI to receive the tokens and give them back to
> > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
> > but look dated and hacky :-(
> >
> > We should either do some kind of user/kernel shared memory queue to
> > receive/return the tokens (similar to what Jonathan was doing in his
> > proposal?)
>
> I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> familiar but I wanted to respond :-) But is the suggestion here to
> build a new kernel-user communication channel primitive for the
> purpose of passing the information in the devmem cmsg? IMHO that seems
> like an overkill. Why add 100-200 lines of code to the kernel to add
> something that can already be done with existing primitives? I don't
> see anything concretely wrong with cmsg & setsockopt approach, and if
> we switch to something I'd prefer to switch to an existing primitive
> for simplicity?
>
> The only other existing primitive to pass data outside of the linear
> buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> preferred? Any other suggestions or existing primitives I'm not aware
> of?
>
> > or bite the bullet and switch to io_uring.
> >
>
> IMO io_uring & socket support are orthogonal, and one doesn't preclude
> the other. As you know we like to use sockets and I believe there are
> issues with io_uring adoption at Google that I'm not familiar with
> (and could be wrong). I'm interested in exploring io_uring support as
> a follow up but I think David Wei will be interested in io_uring
> support as well anyway.

I also disagree that we need to replace a standard socket interface
with something "faster", in quotes.

This interface is not the bottleneck to the target workload.

Replacing the synchronous sockets interface with something more
performant for workloads where it is, is an orthogonal challenge.
However we do that, I think that traditional sockets should continue
to be supported.

The feature may already even work with io_uring, as both recvmsg with
cmsg and setsockopt have io_uring support now.
