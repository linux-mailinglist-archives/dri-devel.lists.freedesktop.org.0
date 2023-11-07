Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DD7E4B33
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A676310E6BE;
	Tue,  7 Nov 2023 21:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CBD10E6BE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:57:05 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5be6d6c04bfso606767b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699394224; x=1699999024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=za6M8Y2d+jQ3Qt9gKNkmeDGWA71k/TCax11+8YIBTGE=;
 b=kg1b2n28bRWSVsT3AnpPPaQPRbr1/iYtKioPEw+8e7S9lA0czsEutWm5a6++eG4g8S
 BQzqHcOAsD8IV9B90hs1a7FFBMdlSrd8DP4B9PrqN23VNgTRzprJG7wp3Mbtrq0aJsUa
 Mu0cRjsHAegsKQqbbdFA9KhBoqbv8cjxx0uLBBOzIE3qUqF9vDkVyPc81oNDqKeYUh+b
 iYEgWRKjBgyrgEPgdfzd6brEEfsZte3F4Y/9q6RaWyfqZT8d/wxEel28y17PPjHlmyp7
 rbiGczZG5Z48RmVE+tq/hbdoRfrMQed6n7a5zUiqFhGpCc8wG9V1IzoIO2ZRYcMQCaA8
 lsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699394224; x=1699999024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=za6M8Y2d+jQ3Qt9gKNkmeDGWA71k/TCax11+8YIBTGE=;
 b=iV8pEVCgj3FQcgw93jpm10xxJwf6h5U/gnIz5XkM/FsoRJY6kso+J9+LHNF21CAyPQ
 JVAT+wk8pWSXqCJTGAnXut+L6HotH98TjLCYNVzmbh7B/1BjcS06v5AEJ5aEZkumzYZD
 2fczUY8JMplWmj0KQO8/yX1lJifRAykMIRqofXP0SiMXuS2EiOCFmy3hLkOE/ZoFCXuW
 4XO0SwXpTfN9w6QTUxDNzqNFjXBq0SWX9OJJRE+hQySN08sjgPjDYEi+tt0agaXOcbpN
 stDa18GqMXCGQGhjOPRT7mMzJeD/wyh+hGgom8SkMEsflv2rqFRdN6TBt4KhUj/ANQRi
 /fbg==
X-Gm-Message-State: AOJu0YwQHj+hf++aqQm/XpacfUPqRv0nbEW2idZFmP2cuNe7Fs0xVQIN
 UHqRJ9GUqJObucdn2saQUukg1DgLr9aKhzLcssgxWg==
X-Google-Smtp-Source: AGHT+IF/bsw99ICNUinQH8HJWUTE/TqZCFPYGxxxKhtjJLazoPWjgkibzNnUub2UFOZbJnwmVInaoZNQXuN3J7zXnD4=
X-Received: by 2002:a05:690c:15:b0:5b3:3eb5:6624 with SMTP id
 bc21-20020a05690c001500b005b33eb56624mr13539795ywb.46.1699394224143; Tue, 07
 Nov 2023 13:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-8-almasrymina@google.com>
 <4a0e9d53-324d-e19b-2a30-ba86f9e5569e@huawei.com>
In-Reply-To: <4a0e9d53-324d-e19b-2a30-ba86f9e5569e@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 13:56:51 -0800
Message-ID: <CAHS8izNbw7vAGo2euQGA+TF9CgQ8zwrDqTVGsOSxh22_uo0R1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/12] page-pool: device memory support
To: Yunsheng Lin <linyunsheng@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 12:00=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/11/6 10:44, Mina Almasry wrote:
> > Overload the LSB of struct page* to indicate that it's a page_pool_iov.
> >
> > Refactor mm calls on struct page* into helpers, and add page_pool_iov
> > handling on those helpers. Modify callers of these mm APIs with calls t=
o
> > these helpers instead.
> >
> > In areas where struct page* is dereferenced, add a check for special
> > handling of page_pool_iov.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >  include/net/page_pool/helpers.h | 74 ++++++++++++++++++++++++++++++++-
> >  net/core/page_pool.c            | 63 ++++++++++++++++++++--------
> >  2 files changed, 118 insertions(+), 19 deletions(-)
> >
> > diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/he=
lpers.h
> > index b93243c2a640..08f1a2cc70d2 100644
> > --- a/include/net/page_pool/helpers.h
> > +++ b/include/net/page_pool/helpers.h
> > @@ -151,6 +151,64 @@ static inline struct page_pool_iov *page_to_page_p=
ool_iov(struct page *page)
> >       return NULL;
> >  }
> >
> > +static inline int page_pool_page_ref_count(struct page *page)
> > +{
> > +     if (page_is_page_pool_iov(page))
> > +             return page_pool_iov_refcount(page_to_page_pool_iov(page)=
);
>
> We have added a lot of 'if' for the devmem case, it would be better to
> make it more generic so that we can have more unified metadata handling
> for normal page and devmem. If we add another memory type here, do we
> need another 'if' here?

Maybe, not sure. I'm guessing new memory types will either be pages or
iovs, so maybe no new if statements needed.

> That is part of the reason I suggested using a more unified metadata for
> all the types of memory chunks used by page_pool.

I think your suggestion was to use struct pages for devmem. That was
thoroughly considered and intensely argued about in the initial
conversations regarding devmem and the initial RFC, and from the
conclusions there it's extremely clear to me that devmem struct pages
are categorically a no-go.

--
Thanks,
Mina
