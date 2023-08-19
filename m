Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD7781C7E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 07:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989910E105;
	Sun, 20 Aug 2023 05:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB3D10E0B4
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 16:12:54 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-48a94e0e6b0so781200e0c.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692461573; x=1693066373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHplbIquQyqQFzUN09CWVXVZgBdbvA0qztADJp9Jgt0=;
 b=d6P1pBvTIvQc1AKT2WN8J2FoWD+l0ohoQBoYerXwFkor+zfa86W9ZqpQ90qvKPA3Ks
 DmJ52VsTZDARZlP0oeB5PKiVeEdkMfDXs0tHKa+kQmjKn24t35RCBwKPHVq0h0m4UCGP
 kokXHppGzL3kc93CY4BGfzZeZ619W/yOWMlpPtvaTTPvjF+Odx9ZTTCNfoGdvoO7GDSi
 x2crI/qD/ih/RTTiQIYNazeXcfIjKzht6s17MLaKQMWv93FRMRe9QTHj9YOZcJAhuhLE
 0av4gHqPD73RCRD/SBUth3RM0RxUIlH268AhrcHA5N4McEWg1QEtKc6zruUWT6lBZjDB
 WSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692461573; x=1693066373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHplbIquQyqQFzUN09CWVXVZgBdbvA0qztADJp9Jgt0=;
 b=Tz96ccWzcB6kwjI6uu6AMtGWhXAQuoQsNpOPdyqzf20EFehBp3CN5lzvA7PguDir6T
 AX+vcpFaIrVkPw3NfzWzT3Ef1p4uC4FBR5NOUwffL3ENGCwTK+nM8PNnBsdyLkXk4dxD
 VBWg58x9c9IneupQDRMF+Pft8tlEDHk8DVp/COZJMBqdMkz6xSZLxZYLIpJQLZsK9C7p
 zjs9DLC8OCaSHhQGxl0oPspfL/Neb5igQ8iuo4QAT/oLaG5KLgl3pUf3zvCKGzNCYve8
 Sx/ly4yXgkUAgJWg3udbMt4x/zP20a2XlA9hXheQ93mI9XbKFMXMQ7F8YpSuH6n76rpB
 jAnQ==
X-Gm-Message-State: AOJu0Yzfk3f7MqVfdCApxMbyw/4SCtfGgbQii1K/Ru8eE5McqqiPHWQa
 8lx7Is6ivJs7O5KMZWelAqaBjt8Q4kzSDWu/H9M=
X-Google-Smtp-Source: AGHT+IHml63XQJifUq6TukqroKgh1irkYJc5zutoZfWbNyCx6upCQCtONuf3+IVCRXH5C9AA39xbv5oXumN8Pz0ssMk=
X-Received: by 2002:a1f:c904:0:b0:48d:9a8:e2f0 with SMTP id
 z4-20020a1fc904000000b0048d09a8e2f0mr1012516vkf.5.1692461573080; Sat, 19 Aug
 2023 09:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
 <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
In-Reply-To: <4f19143d-5975-05d4-3697-0218ed2881c6@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sat, 19 Aug 2023 12:12:16 -0400
Message-ID: <CAF=yD-+wXynvcntVccUAM2+PAumZbRE9E6f3MS6X6qkGrG7_Ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To: David Ahern <dsahern@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 20 Aug 2023 05:17:20 +0000
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
Cc: Mina Almasry <almasrymina@google.com>, sdf@google.com,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Hari Ramakrishnan <rharix@google.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 brouer@redhat.com, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 19, 2023 at 11:49=E2=80=AFAM David Ahern <dsahern@kernel.org> w=
rote:
>
> On 8/19/23 9:22 AM, Jesper Dangaard Brouer wrote:
> >
> > I do see the problem of depending on having a struct page, as the
> > page_pool_iov isn't related to struct page.  Having "page" in the name
> > of "page_pool_iov" is also confusing (hardest problem is CS is naming,
> > as we all know).
> >
> > To support more allocator types, perhaps skb->pp_recycle bit need to
> > grow another bit (and be renamed skb->recycle), so we can tell allocato=
r
> > types apart, those that are page based and those whom are not.
> >
> >
> >> I think the feedback has been strong to not multiplex yet another
> >> memory type into that struct, that is not a real page. Which is why
> >> we went into this direction. This latest series limits the impact larg=
ely
> >> to networking structures and code.
> >>
> >
> > Some what related what I'm objecting to: the "page_pool_iov" is not a
> > real page, but this getting recycled into something called "page_pool",
> > which funny enough deals with struct-pages internally and depend on the
> > struct-page-refcnt.
> >
> > Given the approach changed way from using struct page, then I also don'=
t
> > see the connection with the page_pool. Sorry.
>
> I do not care for the page_pool_iov name either; I presumed it was least
> change to prove an idea and the name and details would evolve.
>
> How about something like buffer_pool or netdev_buf_pool that can operate
> with either pages, dma addresses, or something else in the future?

Sounds good. I suggested this name, but I see how using page in the
name is not very clear.

> >
> >> As for the LSB trick: that avoided adding a lot of boilerplate churn
> >> with new type and helper functions.
> >>
> >
> > Says the lazy programmer :-P ... sorry could not resist ;-)

:-) For the record, there is a prior version that added a separate type.

I did not like the churn it brought and asked for this.

>
> Use of the LSB (or bits depending on alignment expectations) is a common
> trick and already done in quite a few places in the networking stack.
> This trick is essential to any realistic change here to incorporate gpu
> memory; way too much code will have unnecessary churn without it.
>
> I do prefer my earlier suggestion though where the skb_frag_t has a
> union of relevant types though. Instead of `struct page *page` it could
> be `void *addr` with the helpers indicating page, iov, or other.

Okay. I think that is how we did it previously.
