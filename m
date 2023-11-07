Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBA7E4969
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 20:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564C10E688;
	Tue,  7 Nov 2023 19:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E5C10E688
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 19:53:37 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-45da75867d3so1054463137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699386816; x=1699991616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnuTqDfsVwYZum4mgCN3P8a9mRjXV0bf7p3FmGowjyI=;
 b=drMOXqI9/J993iUNRMneSuU4weWkfJU8IoArH4K8rbMWySLvF1+XDEtxgJkJrX+KQa
 xAUh4bhcDyfdMYR+Iz0YdtyCg1LtSNqMAgXp6qt7aX/2RDybAOxdlMh+BjjDlockLTmK
 QNUGsxb1YeZwJN6QHdDJ6DMhlr9bC8PIQ9e6b5zHb1OjiciuyE6LZ0s/Kbn0ugut4VYU
 yEJyqi1bx2G7o8W5+9rZpuLcX41ZDBQaojRtCFMchosvgVwHqAov1YwBrYKqoKf+aNr3
 xbEoxYBvhW3TIIKGWpB6saP7fqZe/1MnjQUkAvZNz/vxHd7n3sfrk6S3ntwi8y+NJ0L5
 JSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699386816; x=1699991616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnuTqDfsVwYZum4mgCN3P8a9mRjXV0bf7p3FmGowjyI=;
 b=PMPWrVIg0Vb6sgn3gVwR+fpl++KsUNs+xzA+I14Z6xzRpVJeE36HDMuFZhgSzlMQoV
 OxmrPDZzOWcWvYasUQn327WxYV7vVPL+gbJf5I/0JNy4yFoPcJGzVTBEk1WPkWaGV1T4
 wquDB6BUxdxuyPioYgb2fmQY10zZU7bAuQ/TZBfcqfgSuk8zgvaH2iO/gQgYi2GVI44V
 DBghUv27nFcQNaXoGTGwAAWJGHDYwTe0SHXwxVwVlbpUNoYb4Ke/tP2+iXx8HAwLYVRu
 8p+ZNGFmeMZoTVwcz6L/z1cjJ4cbxLUmwShH4Tkcptgoj1nhlT0MGqWgCxMDtv0YVEPU
 WBsA==
X-Gm-Message-State: AOJu0YyAQ/Fa95zjHBSNZ69U5ISb35qbwr95TkzT+90wo0qyWAxQvYyR
 RiwRrWK17eMAJ7BRADHloMOCQRar5vngE/THGubdsw==
X-Google-Smtp-Source: AGHT+IFRfpykRqgBWNCOXyp4/VIT9n7OcqngEslUuXORQ+jDqZ50qQ8GNzo4lC3gCBtUGRfNYYENwfnNi6aElAPXvi8=
X-Received: by 2002:a05:6102:475a:b0:45d:86d0:27 with SMTP id
 ej26-20020a056102475a00b0045d86d00027mr11736495vsb.33.1699386816008; Tue, 07
 Nov 2023 11:53:36 -0800 (PST)
MIME-Version: 1.0
References: <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <CAHS8izNxKHhW5uCqmfau6n3c18=hE3RXzA+ng5LEGiKj12nGcg@mail.gmail.com>
 <ZUmNk98LyO_Ntcy7@google.com>
In-Reply-To: <ZUmNk98LyO_Ntcy7@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 11:53:22 -0800
Message-ID: <CAHS8izNTDsHTahkd17zQVQnjzniZAk-dKNs-Mq0E4shdrXOJbg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: Stanislav Fomichev <sdf@google.com>
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

On Mon, Nov 6, 2023 at 5:06=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:
[..]
> > > > And the socket has to know this association; otherwise those tokens
> > > > are useless since they don't carry anything to identify the dmabuf.
> > > >
> > > > I think my other issue with MSG_SOCK_DEVMEM being on recvmsg is tha=
t
> > > > it somehow implies that I have an option of passing or not passing =
it
> > > > for an individual system call.
> >
> > You do have the option of passing it or not passing it per system
> > call. The MSG_SOCK_DEVMEM says the application is willing to receive
> > devmem cmsgs - that's all. The application doesn't get to decide
> > whether it's actually going to receive a devmem cmsg or not, because
> > that's dictated by the type of skb that is present in the receive
> > queue, and not up to the application. I should explain this in the
> > commit message...
>
> What would be the case of passing it or not passing it? Some fallback to
> the host memory after flow steering update? Yeah, would be useful to
> document those constrains. I'd lean on starting stricter and relaxing
> those conditions if we find the use-cases.
>

MSG_SOCK_DEVMEM (or its replacement SOCK_DEVMEM or SO_SOCK_DEVMEM),
just says that the application is able to receive devmem cmsgs and
will parse them. The use case for not setting that flag is existing
applications that are not aware of devmem cmsgs. I don't want those
applications to think they're receiving data in the linear buffer only
to find out that the data is in devmem and they ignored the devmem
cmsg.

So, what happens:

- MSG_SOCK_DEVMEM provided and next skb in the queue is devmem:
application receives cmsgs.
- MSG_SOCK_DEVMEM provided and next skb in the queue is non-devmem:
application receives in the linear buffer.
- MSG_SOCK_DEVMEM not provided and net skb is devmem: application
receives EFAULT.
- MSG_SOCK_DEVMEM not provided and next skb is non-devmem: application
receives in the linear buffer.

My bad on not including some docs about this. The next version should
have the commit message beefed up to explain all this, or a docs
patch.


--=20
Thanks,
Mina
