Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBC7E4DAE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881510E18B;
	Wed,  8 Nov 2023 00:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233210E18B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:02:50 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-45d968e3f92so1793670137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699401769; x=1700006569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhGCgNMMnqKk3D3DcXRS957yq5a/Kz42rRw6Zd9CW+U=;
 b=Z5g9LoijLXMA5lHyYq/eFHi1BQoRS6z0Bj2PKmy82dC+V1aMvGT2/+J1TPtExecU1t
 I+j2eDADgj1OLislHLNEbu403RViqMlyjBzDbhEuuaGvdct12r30lNgaeQ1KKUCRBnaN
 nmIQt+dtGf1KBjoM9fCkf7a7pznxeagpEqJCAbO3DtxsHTdVwKb862aT+IW9Ao/Wv2K6
 jwRXseM0U3XyBdSGmHT57sff3dxaGN8pzEAofVMpmnLB9csJEi6z+a6+lc6dDC0y1eCW
 oRovD37acUjUyCVIsPlWH+ALZKaGpqKPWN6byovQdzjIfJEA9Kui/LnnO0M3lQTyxgEN
 1Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699401769; x=1700006569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhGCgNMMnqKk3D3DcXRS957yq5a/Kz42rRw6Zd9CW+U=;
 b=M9x67uzX2SIb7zrWfqUTC+WBWXFrCt8uSlSo01Zhxm0QfyxC24YAykOU7DC9xo6RGU
 q+P36o+ajwL7qV/s+82712SEji//OwTyga+kecVC97TCPaD6Pgny64dnuZje5D4vHVB6
 UGbCIwML7twsB6Cwoc0QFAJwc1ylIW5QT4Eohup8gmoRxiqC2nHK6D7JTy3xsiykeDsx
 ALRLgZtVr5CsXoalLbaTPWNa3HxiCCX9rkZOp+K//H+c7qSlpOIy6r4fYQMX00wpnnbr
 LlDn2M7UE1+b/AaMohoDHd6BDJTYM14h1MDHOEQRggoC3qiChtnIO7hHSVbXXWyXlNHk
 wPpA==
X-Gm-Message-State: AOJu0Yz5IyjbnqPiCTGeJ5Eyz5Io9Zj4o/w8LCdPMEsorouVcPWzxgEq
 KJ+i5aE/tqI9zBMmX/iI8nvZMQpMrG5zjyC05sS/Nw==
X-Google-Smtp-Source: AGHT+IFms8ZvtGXtemkp+mi4ABPteesfsjhExnDKjmFJ+Eb3POz3AZg+/vWO+o8o1uY0zVVc5E9w65kScoa/ixFh4MU=
X-Received: by 2002:a05:6102:20de:b0:45f:57b4:c20d with SMTP id
 i30-20020a05610220de00b0045f57b4c20dmr259111vsr.2.1699401769314; Tue, 07 Nov
 2023 16:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
 <583db67b-96c6-4e17-bea0-b5a14799db4a@kernel.org>
In-Reply-To: <583db67b-96c6-4e17-bea0-b5a14799db4a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 16:02:38 -0800
Message-ID: <CAHS8izME7NixQrrh+qKnMR4+FyTzKW=B2pYyNffJ+igiehe-7g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
To: David Ahern <dsahern@kernel.org>
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
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 1:02=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:
>
> On 11/05, Mina Almasry wrote:
> > +static inline bool page_is_page_pool_iov(const struct page *page)
> > +{
> > +     return (unsigned long)page & PP_DEVMEM;
> > +}
>
> Speaking of bpf: one thing that might be problematic with this PP_DEVMEM
> bit is that it will make debugging with bpftrace a bit (more)
> complicated. If somebody were trying to get to that page_pool_iov from
> the frags, they will have to do the equivalent of page_is_page_pool_iov,
> but probably not a big deal? (thinking out loud)

Good point, but that doesn't only apply to bpf I think. I'm guessing
even debugger drgn access to the bv_page in the frag will have trouble
if it's actually accessing an iov with LSB set.

But this is not specific to this use for LSB pointer trick. I think
all code that currently uses LSB pointer trick will have similar
troubles. In this context my humble vote is that we get such big
upside from reducing code churn that it's reasonable to tolerate such
side effects.

I could alleviate some of the issues by teaching drgn to do the right
thing for devmem/iovs... time permitting.

On Mon, Nov 6, 2023 at 3:49=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/5/23 7:44 PM, Mina Almasry wrote:
> > diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/he=
lpers.h
> > index 78cbb040af94..b93243c2a640 100644
> > --- a/include/net/page_pool/helpers.h
> > +++ b/include/net/page_pool/helpers.h
> > @@ -111,6 +112,45 @@ page_pool_iov_binding(const struct page_pool_iov *=
ppiov)
> >       return page_pool_iov_owner(ppiov)->binding;
> >  }
> >
> > +static inline int page_pool_iov_refcount(const struct page_pool_iov *p=
piov)
> > +{
> > +     return refcount_read(&ppiov->refcount);
> > +}
> > +
> > +static inline void page_pool_iov_get_many(struct page_pool_iov *ppiov,
> > +                                       unsigned int count)
> > +{
> > +     refcount_add(count, &ppiov->refcount);
> > +}
> > +
> > +void __page_pool_iov_free(struct page_pool_iov *ppiov);
> > +
> > +static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
> > +                                       unsigned int count)
> > +{
> > +     if (!refcount_sub_and_test(count, &ppiov->refcount))
> > +             return;
> > +
> > +     __page_pool_iov_free(ppiov);
> > +}
> > +
> > +/* page pool mm helpers */
> > +
> > +static inline bool page_is_page_pool_iov(const struct page *page)
> > +{
> > +     return (unsigned long)page & PP_DEVMEM;
>
> This is another one where the code can be more generic to not force a
> lot changes later.  e.g., PP_CUSTOM or PP_NO_PAGE. Then io_uring use
> case with host memory can leverage the iov pool in a similar manner.
>
> That does mean skb->devmem needs to be a flag on the page pool and not
> just assume iov =3D=3D device memory.
>
>
>


--=20
Thanks,
Mina
