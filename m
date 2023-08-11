Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580EC77854D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 04:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5F210E050;
	Fri, 11 Aug 2023 02:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6510E050
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 02:19:50 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-44957b59218so490316137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 19:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691720389; x=1692325189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhSgfyHqn5+CZv2RiR3OdGWwEDtgbbqbNvBOrUw9xvk=;
 b=6NAYIYih3S0lTqiEhyq/71QbC+cEFBxi2jm9a9M4bkmx2FtJqwVQJskNN5qF9wMLiZ
 BchdMSjdr3WV3NjwR31JP4/ZtiS+Xx5TntH9kCrp4Ud0IFKCdSZIFWcqpazGaUgrMR7J
 yfDFfdO4HXTAyzrB+zWZX8KlaZdOtjcp50PGBZdXKYf9Rf59IJEm6bLU+cKRJ/I3rDhe
 tEasqmVSXVmu0bSmpF4cbn816PTA6CWvOS1peMQzxyR1zFIYTpNGJHUe3DH3WazxgaSJ
 bdWq5CDPxuqVh9E8SaQKyMUPTxubVftY2VeQJELBpy74SGQATtBIrOZJzyBfrtL7DCjE
 lQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691720389; x=1692325189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhSgfyHqn5+CZv2RiR3OdGWwEDtgbbqbNvBOrUw9xvk=;
 b=MIY1Lpyb8j2Ti8h8C2l4N24K/LoD8aO2eJtGVRX9onPVmtkdauQYb/4/rLFmoYnhdt
 s+ARG+1wSstMbI1V9g38/jUaydOjW5WLc6ds+YYimJd2PscUtG4PY8i1f/8dMAOmRAV8
 N0StL7V/TMNCYyfhuYxFoBfolk0+AR+KZPSq0Q7utGILAOmMFeA3JSZJVA0ZZJUfn1lZ
 7lZ7fKB5Kf2RQysaqH1VLXZLfl48DVtkW6+9Wff4NsSyyM3QRp7O/wrUg0un3c8K4N2N
 1XZSzNgGa6ALfsLUqBOZgRQu5mTPPnm8OncDnTMNGrC54AtC0vmE2rvlsW+ipnHAAoNt
 W61w==
X-Gm-Message-State: AOJu0YxBrzj/q9hJ66dMj1RDTv8XRe/qIXzHq18j4RYp5zP2FqXhtOr2
 zdmR1wP8WQwLBHW+eGUDGSlWhZcSDFnsUqIooPXtIw==
X-Google-Smtp-Source: AGHT+IFGlBGQlkugoX7n1IuiQz0by2M3WsIkqkjLaVB0lnZ4q7MSgvdAT/b3DDrMPYNFmc8BRx4hNjG7m6xM2QQE49Y=
X-Received: by 2002:a05:6102:404:b0:446:ea0e:f8a3 with SMTP id
 d4-20020a056102040400b00446ea0ef8a3mr2263539vsq.15.1691720388966; Thu, 10 Aug
 2023 19:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-2-almasrymina@google.com>
 <97bf5b80-ca0c-638b-9b5d-1cae70f3df58@intel.com>
In-Reply-To: <97bf5b80-ca0c-638b-9b5d-1cae70f3df58@intel.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 10 Aug 2023 19:19:38 -0700
Message-ID: <CAHS8izNVvenUve=k56vdacfhs6fjYs92BWf8Ry2qTx+0jgLqYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/11] net: add netdev netlink api to bind dma-buf
 to a net device
To: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 9:09=E2=80=AFAM Samudrala, Sridhar
<sridhar.samudrala@intel.com> wrote:
>
>
>
> On 8/9/2023 6:57 PM, Mina Almasry wrote:
> > API takes the dma-buf fd as input, and binds it to the netdevice. The
> > user can specify the rx queue to bind the dma-buf to. The user should b=
e
> > able to bind the same dma-buf to multiple queues, but that is left as
> > a (minor) TODO in this iteration.
>
> To support binding dma-buf fd to multiple queues, can we extend/change
> this interface to bind dma-buf fd to a napi_id? Amritha is currently
> working on a patchset that exposes napi_id's and their association with
> the queues.
>
> https://lore.kernel.org/netdev/169059098829.3736.381753570945338022.stgit=
@anambiarhost.jf.intel.com/
>

Thank you Sridhar,

I think honestly implementing multiple rx queue binding is trivial,
even without the napi_id association. The user should be able to call
the bind-rx API multiple times with the same dma-buf to bind to
multiple queues, or I can convert the queue-idx to a multi-attr
netlink attribute to let the user specify multiple rx queues in 1
call.

Without doing some homework it's not immediately obvious to me that
coupling the dma-buf binding with the napi_id is necessary or
advantageous. Is there a reason coupling those is better?

It seems like napi_id can also refer to TX queues, and binding a
dma-buf with a TX queue doesn't make much sense to me. For TX we need
to couple the dma-buf with the netdev that's sending the dma-buf data,
but not a specific TX queue on the netdev, I think.

--=20
Thanks,
Mina
