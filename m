Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC007E4A6E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633710E2D7;
	Tue,  7 Nov 2023 21:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7C10E013
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:17:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so717a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699391876; x=1699996676;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2QCCZhbNaMLPXpYCBN6556bTQl/R/gNcXFBlSEHr6s=;
 b=B43ZGeF/pexSTWVrpj8SprirbrI4hbS2Jg8f7xWXxg9Yq/vSY+0RJYfl/cQxAf3+vC
 onvhx8jbjXJalG7sdBLh8JdSvDoaTffeJqDvAwN8W+D5WCKS972zgkVpoFidKGupAmsD
 R5biD158Vv0Jr5W9mezXMdU8yabLHotGDfy+6p7vS0qzIpw0MANJW0pjevKI+NDpAkYd
 m82wmIfbLxU/kfNcgmu7YiEmQAZRt8YtIYM/4vc0lADwTgBQydz4KF2uLKAGvXs/y4RV
 qyHWWRR5XlKjIzr2aNyu4KlDvW3C+Do8mjSFe057ewUQ5hjGLWVAbFgSPFE44MW18CeO
 MSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699391876; x=1699996676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2QCCZhbNaMLPXpYCBN6556bTQl/R/gNcXFBlSEHr6s=;
 b=nVyUDJ1uVpRfbTf/8Qxs8vrlMPlMbwlxfQJhqbuc63Jji1xqMrb2uK1+46nhM4JsO5
 E0OARI5fbNqK+kcbiYHON9LTQcHFYdRaxFaTMi4KMQKWGKAFHb0AHw9NZSvxaHMMAxah
 Pl9rceudZJYUhzk1skCSizRdS2dcajPmqg1YnMUDPh3fCHAc75tnMzrdT0ToCWg1BEZd
 SAc0DY50NktZvrVWWXIhO45sKX7VLipTe/4eZO/t3LBkEqxs//nODdE4VAcuvs8fxCWl
 0chgQh31gviSo01jL95OD441LhNyJWFlS/Iuna0Ge0Ks08x+T3CPXae1wBppLSBW/gVD
 TZ3w==
X-Gm-Message-State: AOJu0YxApJT/n4OCqmJuFkTjs9s6O/fZqz1jkIpLH9iH81lob5R9s+w5
 Q8nlJXpSlte/HeCZcRVjWa8NHeG9QXtyO8CQeQD7+g==
X-Google-Smtp-Source: AGHT+IE2BJYg2o+RWiBo7zUK8rUJLrxbtosbDGcrLcTm47eDVBdJN7KV0TjFmGvpMtQ446xGBJBrXEpJoAJUwEcp3Q0=
X-Received: by 2002:a05:6402:e84:b0:544:e249:be8f with SMTP id
 h4-20020a0564020e8400b00544e249be8fmr179390eda.1.1699391875922; Tue, 07 Nov
 2023 13:17:55 -0800 (PST)
MIME-Version: 1.0
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
 <ZUqms8QzQpfPQWyy@google.com>
In-Reply-To: <ZUqms8QzQpfPQWyy@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 7 Nov 2023 22:17:42 +0100
Message-ID: <CANn89iJNR8bYYBO92=f5_2hFoTK8+giH11o-7NHURoahwvV11w@mail.gmail.com>
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 linux-arch@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 10:05=E2=80=AFPM Stanislav Fomichev <sdf@google.com>=
 wrote:

>
> I don't understand. We require an elaborate setup to receive devmem cmsgs=
,
> why would some random application receive those?


A TCP socket can receive 'valid TCP packets' from many different sources,
especially with BPF hooks...

Think of a bonding setup, packets being mirrored by some switches or
even from tc.

Better double check than be sorry.

We have not added a 5th component in the 4-tuple lookups, being "is
this socket a devmem one".

A mix of regular/devmem skb is supported.
