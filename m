Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22127E4A47
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4F010E6B4;
	Tue,  7 Nov 2023 21:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02C710E6B4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:05:57 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a9012ab0adso83362407b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699391157; x=1699995957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=JeYrzwOr78xPwcpsKE4mhPZUV4HYgKXqTY0m7zX5WN8=;
 b=g3cjUf2ISiBb0a0Kc9zch7/oExFABI8dq69UQ59hlNMsN1fHONGLVJdQbYwSVX7yTy
 RCqNXMjqrYIAxO1XusUJwMpq9ypru1u7kb230pZ/cFFN+/zd5UsMPlMncoolmb6KHHqj
 fVDmezimzdg9q13IIfSi+OHZw86D7ue+RC5LGE4jLlEKIYgPJX7LWHb5a59ytRah5vVj
 fQbVsFjnt4zGzvS78xFCcEjXU7btOyzqsz5xx3ipJ9+QptVA//aXo1aArO5JtNONYgr8
 rMHzRsrq70Vr6xgN8D46UTxq2RKfEsTXf5kmjmL/B/E9dK+fI1Iep5NDG8ZPTLA1ZxlH
 vbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699391157; x=1699995957;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JeYrzwOr78xPwcpsKE4mhPZUV4HYgKXqTY0m7zX5WN8=;
 b=nmby3PFLd/ZJ37WVlahgtXQXQ1v+PLBQmMRRLSjSnpyrcLktoXMTQVLdwPwUKTk3pD
 Gdl/whiCSnLMTicuWB1GuuPS56XCzExtWQE2BzEJ/JF88Nl8XA1hh1i5MbKq8xhhEGwG
 iPYM7FGihL4dldtVioRvWVXJL5u7fKPJnDkyyNv+SGe5bAfI5sHFY7MMCk3+UD8RQ7Wk
 BTGffP2wv4KE4SZYT866BMuEjdCUmzTFDMX4Aljpjal+0p0kuxpahyDdjRbeK5tinWCl
 igRpMxkJdj3DdaILPNXIRLdUDp+epzZCxeimQn8L1pkx5nV4Tji43ht4CKmXCmBV0lQU
 cTyQ==
X-Gm-Message-State: AOJu0YxPhKC/1xZsp+KPNlCe1ZWEyl2bj0RqGpkt0P3PXOXgrqKaTnmP
 gS6eigoxllWPjp/yxta5u13PR8U=
X-Google-Smtp-Source: AGHT+IE4UIBdCOBSahaHbXIaAM3E3QwhCi94Cvn3aJLHOo+p0gLkdCty9bKUvZY7uZa3X7IxK0NG/CQ=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a81:830d:0:b0:5a8:6162:b69 with SMTP id
 t13-20020a81830d000000b005a861620b69mr287016ywf.3.1699391156928; Tue, 07 Nov
 2023 13:05:56 -0800 (PST)
Date: Tue, 7 Nov 2023 13:05:55 -0800
In-Reply-To: <CAHS8izNTDsHTahkd17zQVQnjzniZAk-dKNs-Mq0E4shdrXOJbg@mail.gmail.com>
Mime-Version: 1.0
References: <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <CAHS8izNxKHhW5uCqmfau6n3c18=hE3RXzA+ng5LEGiKj12nGcg@mail.gmail.com>
 <ZUmNk98LyO_Ntcy7@google.com>
 <CAHS8izNTDsHTahkd17zQVQnjzniZAk-dKNs-Mq0E4shdrXOJbg@mail.gmail.com>
Message-ID: <ZUqms8QzQpfPQWyy@google.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
From: Stanislav Fomichev <sdf@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07, Mina Almasry wrote:
> On Mon, Nov 6, 2023 at 5:06=E2=80=AFPM Stanislav Fomichev <sdf@google.com=
> wrote:
> [..]
> > > > > And the socket has to know this association; otherwise those toke=
ns
> > > > > are useless since they don't carry anything to identify the dmabu=
f.
> > > > >
> > > > > I think my other issue with MSG_SOCK_DEVMEM being on recvmsg is t=
hat
> > > > > it somehow implies that I have an option of passing or not passin=
g it
> > > > > for an individual system call.
> > >
> > > You do have the option of passing it or not passing it per system
> > > call. The MSG_SOCK_DEVMEM says the application is willing to receive
> > > devmem cmsgs - that's all. The application doesn't get to decide
> > > whether it's actually going to receive a devmem cmsg or not, because
> > > that's dictated by the type of skb that is present in the receive
> > > queue, and not up to the application. I should explain this in the
> > > commit message...
> >
> > What would be the case of passing it or not passing it? Some fallback t=
o
> > the host memory after flow steering update? Yeah, would be useful to
> > document those constrains. I'd lean on starting stricter and relaxing
> > those conditions if we find the use-cases.
> >
>=20
> MSG_SOCK_DEVMEM (or its replacement SOCK_DEVMEM or SO_SOCK_DEVMEM),
> just says that the application is able to receive devmem cmsgs and
> will parse them. The use case for not setting that flag is existing
> applications that are not aware of devmem cmsgs. I don't want those
> applications to think they're receiving data in the linear buffer only
> to find out that the data is in devmem and they ignored the devmem
> cmsg.
>=20
> So, what happens:
>=20
> - MSG_SOCK_DEVMEM provided and next skb in the queue is devmem:
> application receives cmsgs.
> - MSG_SOCK_DEVMEM provided and next skb in the queue is non-devmem:
> application receives in the linear buffer.
> - MSG_SOCK_DEVMEM not provided and net skb is devmem: application
> receives EFAULT.
> - MSG_SOCK_DEVMEM not provided and next skb is non-devmem: application
> receives in the linear buffer.
>=20
> My bad on not including some docs about this. The next version should
> have the commit message beefed up to explain all this, or a docs
> patch.

I don't understand. We require an elaborate setup to receive devmem cmsgs,
why would some random application receive those?
