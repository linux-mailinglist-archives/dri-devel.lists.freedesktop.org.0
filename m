Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8E7E6220
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 03:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611C110E1B2;
	Thu,  9 Nov 2023 02:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F31892FD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 02:22:30 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7b9ff2b6f9bso132371241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 18:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699496549; x=1700101349;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSPMpbnqaJyO3ODc5clIYENUiJuL1UHQWRmXr36pztw=;
 b=oJHt0oA3r0QJAieoh0OfFWyblgE46aj2GvZK/MmQBsUHRjeGCs3WOQWLyf9O7xBHUM
 f3sf7jN63Mc7hHfa39O/rqsA18tny9ru5XxCLVPPxTDS37ARlmdP+Vf91PMtM5t4psrh
 haZxdhrtS4mhmpW3OzcC5gGLj+Rn4zX7QWxPHmRWUjR0jJYdHk5UaMjn56JBJLFKAplW
 S9PKXAoD9nKpb6WCn/DgPS97cyqxTD+86CrVgPNAboP+bYBnQsb+mX8AFCuKmi2D+WCt
 8yO/iZzDJKYu75jx031U3bCfBjpmYwXeJkGXnEG1D9hU8d7if0wcBuaHrwHmBSzCR9ED
 RuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699496549; x=1700101349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSPMpbnqaJyO3ODc5clIYENUiJuL1UHQWRmXr36pztw=;
 b=tcu8q7P1loNIyGUnC5NshWmBS3wvhyu1rPwVfD75jIHrha/ZgwPGjc82FYIPJlXokM
 6JaAQ9+ViAdhmQScnX3O7lN1SrsTlaG+oEdndj4ksrgnrbphPsZ7eZib2ZOczu0aUvu1
 SOBD+a0A0aD8EmGFL3z7eETfPI4ed9bV61ZqTWe5iZBqh+JSk7gcHmSaWPCmE9pEUtSH
 eq+VFzRZWZbpMS8ORTx+oIbkNg/0QNuMmNQ0RYDLmObxfZOZ6LI+mHPT8j54utac8qLl
 yt+k6x0DvbKAPNLdzqFSkfYNeq4wjjxFqL95nKnYLWVu5FsWwqQ/vg0B+IkEE4iAiSDB
 LxXg==
X-Gm-Message-State: AOJu0Yyx9p5CTi+ET7Hl8OkrtE2S/YosCWw8nc292qUbyCyMmAwiLmS/
 WUuYt0+eLPz8uuUcq9s2CP0lPNG64GNhF4gJ44KSvQ==
X-Google-Smtp-Source: AGHT+IEbBLd4OCYTD+BfgjfRtM1GreJwxjpgz5yBDiudeMGW3y2SaeG7nGhsX8PgjqXOfiWkFQ0hU/lXsKFFFArEvCc=
X-Received: by 2002:a05:6102:104f:b0:45d:a05f:8d7d with SMTP id
 h15-20020a056102104f00b0045da05f8d7dmr3347254vsq.22.1699496548881; Wed, 08
 Nov 2023 18:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <1fee982f-1e96-4ae8-ede0-7e57bf84c5f7@huawei.com>
 <CAHS8izPV3isMWyjFnr7bJDDPANg-zm_M=UbHyuhYWv1Viy7fRw@mail.gmail.com>
 <c1b689bd-a05b-85e9-0ce4-7264c818c2dc@huawei.com>
In-Reply-To: <c1b689bd-a05b-85e9-0ce4-7264c818c2dc@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 8 Nov 2023 18:22:17 -0800
Message-ID: <CAHS8izMXkaGE_jqYJJk9KpfxWEYDu95XAJNqajws57QWV2yRJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On Tue, Nov 7, 2023 at 7:40=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2023/11/8 5:59, Mina Almasry wrote:
> > On Mon, Nov 6, 2023 at 11:46=E2=80=AFPM Yunsheng Lin <linyunsheng@huawe=
i.com> wrote:
> >>
> >> On 2023/11/6 10:44, Mina Almasry wrote:
> >>> +
> >>> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *bind=
ing)
> >>> +{
> >>> +     size_t size, avail;
> >>> +
> >>> +     gen_pool_for_each_chunk(binding->chunk_pool,
> >>> +                             netdev_devmem_free_chunk_owner, NULL);
> >>> +
> >>> +     size =3D gen_pool_size(binding->chunk_pool);
> >>> +     avail =3D gen_pool_avail(binding->chunk_pool);
> >>> +
> >>> +     if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%lu, =
avail=3D%lu",
> >>> +               size, avail))
> >>> +             gen_pool_destroy(binding->chunk_pool);
> >>
> >>
> >> Is there any other place calling the gen_pool_destroy() when the above
> >> warning is triggered? Do we have a leaking for binding->chunk_pool?
> >>
> >
> > gen_pool_destroy BUG_ON() if it's not empty at the time of destroying.
> > Technically that should never happen, because
> > __netdev_devmem_binding_free() should only be called when the refcount
> > hits 0, so all the chunks have been freed back to the gen_pool. But,
> > just in case, I don't want to crash the server just because I'm
> > leaking a chunk... this is a bit of defensive programming that is
> > typically frowned upon, but the behavior of gen_pool is so severe I
> > think the WARN() + check is warranted here.
>
> It seems it is pretty normal for the above to happen nowadays because of
> retransmits timeouts, NAPI defer schemes mentioned below:
>
> https://lkml.kernel.org/netdev/168269854650.2191653.8465259808498269815.s=
tgit@firesoul/
>
> And currently page pool core handles that by using a workqueue.

Forgive me but I'm not understanding the concern here.

__netdev_devmem_binding_free() is called when binding->ref hits 0.

binding->ref is incremented when an iov slice of the dma-buf is
allocated, and decremented when an iov is freed. So,
__netdev_devmem_binding_free() can't really be called unless all the
iovs have been freed, and gen_pool_size() =3D=3D gen_pool_avail(),
regardless of what's happening on the page_pool side of things, right?

--=20
Thanks,
Mina
