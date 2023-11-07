Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2E7E4BA6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365BC10E0D8;
	Tue,  7 Nov 2023 22:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CC310E0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:23:22 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1cc2efd22ccso55040665ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699395802; x=1700000602;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=0Pmozh0ybI7SbfNg64kEULMiwr3zKJkFxXH8jQ6gCVM=;
 b=DafWbwLUF9bAsfjFO1oXSx+PplfkYS3hXzcJo+JH/RQbhJCPFEwFnncXuVwHKkt4mO
 3oOUnjTM3j+p0xnWTn1KGeuHFfAeN/XgP+Er0gK6avYhZaWt0xgVQMoR6C4g9DO5FoxZ
 DBnTvUl46HPRR/vRZ+fsY8XFByEUeXkimD19rjlalGxTxmzTDVzq/5vY0tHAS9x2F2Bj
 ZXXfSFccAUp9pu6AghRHsFf56wFanN1V6AhLBNJRzX8aozoClsaNdMLc8TJH6OKw80gE
 cuBx5Xg3cRu8su742Mm8iheJUuwURvYied3dbTitpOlcbImaWPhooufPIEyXrvi3AVDD
 rsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699395802; x=1700000602;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0Pmozh0ybI7SbfNg64kEULMiwr3zKJkFxXH8jQ6gCVM=;
 b=W27LwjQl0niiHIVxme0NZsi3jZK9fcx4T1J1f7Z2a1wlVEnxWna+fdFYp4omY5Vn3/
 x1H6XvnBIQUGt0404C9JDxuLvgMuAzL3QQtuMJ9MHSSj4VuLvRZkXye8GcBSzAF0L7Od
 l5oLzeISPnxMQ6phyHNfKowVaVoy5ap1G7FnQMiSK32apigdB6tN3Z8eMAphuQ0MzNVi
 8hjN7vEM/VDrswBfk2gREi+zvjkma9k/LHitRkiqrl7KI6I3FvWds1asoGYa6Vko+rMe
 ek78tE3K7KTfir8wMW84LZQBTUU4ENzIGOmOX+P+7xBshKqbTJ5w7xyNl53o7qutJ3+t
 4J7g==
X-Gm-Message-State: AOJu0YxSTFkObZDfqe6P8jc5KIsJO0q9zUqRvMY+RBPae6//IHWIu7Hh
 L9VglEomC4/35JO443OTb9jVcY0=
X-Google-Smtp-Source: AGHT+IH1xKdg+nrZdYHc/L2SejfqkQOSdqRffH8LAz7J5HMiZt1d8BbpMO2b6yTqmZzIZmhgTiZbQUk=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:903:3244:b0:1cc:bb7f:bd60 with SMTP id
 ji4-20020a170903324400b001ccbb7fbd60mr6825plb.6.1699395801930; Tue, 07 Nov
 2023 14:23:21 -0800 (PST)
Date: Tue, 7 Nov 2023 14:23:20 -0800
In-Reply-To: <CANn89iJNR8bYYBO92=f5_2hFoTK8+giH11o-7NHURoahwvV11w@mail.gmail.com>
Mime-Version: 1.0
References: <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <CAHS8izNxKHhW5uCqmfau6n3c18=hE3RXzA+ng5LEGiKj12nGcg@mail.gmail.com>
 <ZUmNk98LyO_Ntcy7@google.com>
 <CAHS8izNTDsHTahkd17zQVQnjzniZAk-dKNs-Mq0E4shdrXOJbg@mail.gmail.com>
 <ZUqms8QzQpfPQWyy@google.com>
 <CANn89iJNR8bYYBO92=f5_2hFoTK8+giH11o-7NHURoahwvV11w@mail.gmail.com>
Message-ID: <ZUq42Po1Pn-9QxrM@google.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
From: Stanislav Fomichev <sdf@google.com>
To: Eric Dumazet <edumazet@google.com>
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07, Eric Dumazet wrote:
> On Tue, Nov 7, 2023 at 10:05=E2=80=AFPM Stanislav Fomichev <sdf@google.co=
m> wrote:
>=20
> >
> > I don't understand. We require an elaborate setup to receive devmem cms=
gs,
> > why would some random application receive those?
>=20
>=20
> A TCP socket can receive 'valid TCP packets' from many different sources,
> especially with BPF hooks...
>=20
> Think of a bonding setup, packets being mirrored by some switches or
> even from tc.
>=20
> Better double check than be sorry.
>=20
> We have not added a 5th component in the 4-tuple lookups, being "is
> this socket a devmem one".
>=20
> A mix of regular/devmem skb is supported.

Can we mark a socket as devmem-only? Do we have any use-case for those
hybrid setups? Or, let me put it that way: do we expect API callers
to handle both linear and non-linear cases correctly?
As a consumer of the previous versions of these apis internally,
I find all those corner cases confusing :-( Hence trying to understand
whether we can make it a bit more rigid and properly defined upstream.

But going back to that MSG_SOCK_DEVMEM flag. If the application is
supposed to handle both linear and devmem chucks, why do we need
this extra MSG_SOCK_DEVMEM opt-in to signal that it's able to process
it? From Mina's reply, it seemed like MSG_SOCK_DEVMEM is there to
protect random applications that get misrouted devmem skb. I don't
see how returning EFAULT helps in that case.
