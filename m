Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2089A7E965C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 05:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96710E10A;
	Mon, 13 Nov 2023 04:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBB310E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:54:30 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7b6e1770519so899009241.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699851269; x=1700456069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulZUsxBjy/DYiq3mQzgGs9wuxEBLqLXZ1LrWDxA7qvo=;
 b=iyLLnDKrGLhBzcCalSEx4B2vyLkI1cutBR76whdP6DIQKyYS5W+Z7e1LMK0fJg481Y
 Gr5nIuMHLof58Queg1YUXMegICgFAETvESAGVD7On4BqqsXqaCST/5qgBlkocBLu2iZz
 6sImY40qPT8uChSg7rqm6brsOldh/3/ObyWmzq3h18JtZEr7l0PYobv/WpYXllrkfMmo
 WNl29UG5MiJMAvBmbYAw1RIfI8CRVWO5qif/v5vyRYYsfh/XLjpFMxTLMHa9ge6rD1ix
 HLEvlG3sgoah6gLfE6OyzDAgsVB2wO2+9jI//6/68xTQJqYk800/aomb39XBoxeh2dXi
 5eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699851269; x=1700456069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulZUsxBjy/DYiq3mQzgGs9wuxEBLqLXZ1LrWDxA7qvo=;
 b=ccJSyI4Bi4UjKtp4pA00bGbTzg785bJ62mMGF1/+LBhuqxZXyrZTFDVkyCpagDvreO
 V+KQksKTH7EDUbS8FP9zaObl+SoXoEKDXJqXkiV/msa5QSn2JdXBcuTxdMXx2fhb3sZm
 6YTucLAXUqvQJ8qcTpwSuTFrwCCAuncd1BxEm/tdRt6JiWkTzW/ttgX6/AHIBov4wxSN
 bB8ImkzLB7Kqzyl9uFuIV8CpQSF2qXps0rmhT06FS1hYarU6Zv3w8aZFWZkM803ag1ds
 buLCWG/xNP4MlER8vTy5GLlEp/q6+MW19mmIhOGEDsz5SVqJrZfZDYi/muAJOkvuI3Lh
 wBuw==
X-Gm-Message-State: AOJu0Yzz2K0IreFC5meF6jAk+BlV8/Eyv7PROKKNl1MYxm753AVJl2hB
 IXHO/JzTxGM0q0SYRQeQ343rlk03wPkVBjaN4W3p0Q==
X-Google-Smtp-Source: AGHT+IGBugYmcwQCmYo3XhrW53vx7SnsNtkGBEWopCzRD+dofX6GN+L1OxYsj2HtZsztRRSBDJnHEIwyfhi7gc94JeA=
X-Received: by 2002:a67:ab0d:0:b0:45f:4e67:4420 with SMTP id
 u13-20020a67ab0d000000b0045f4e674420mr2062262vse.2.1699851269262; Sun, 12 Nov
 2023 20:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
 <20231110151622.2f45f618@kernel.org>
In-Reply-To: <20231110151622.2f45f618@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 12 Nov 2023 20:54:18 -0800
Message-ID: <CAHS8izMGNLM18TF1RCDBfdOXXpqseePA4_27qmQt-FsrFzGfdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
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
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 3:16=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  5 Nov 2023 18:44:05 -0800 Mina Almasry wrote:
> > +static int mp_dmabuf_devmem_init(struct page_pool *pool)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D pool->mp_priv;
> > +
> > +     if (!binding)
> > +             return -EINVAL;
> > +
> > +     if (pool->p.flags & PP_FLAG_DMA_MAP ||
> > +         pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> > +             return -EOPNOTSUPP;
>
> This looks backwards, we should _force_ the driver to use the dma
> mapping built into the page pool APIs, to isolate the driver from
> how the DMA addr actually gets obtained. Right?
>
> Maybe seeing driver patches would illuminate.

The full tree with driver patches is here:

https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-v3

This is probably the most relevant patch, it implements POC page-pool
support into GVE + devmem support:

https://github.com/torvalds/linux/commit/3c27aa21eb3374f2f1677ece6258f046da=
234443

But, to answer your question, yes, this is a mistake. devmem doesn't
need to be mapped, which is why I disabled the flag. Actually what
should happen is like you said, we should enforce that PP_FLAG_DMA_MAP
is on, and have it be a no-op, so the driver doesn't try to map the
devmem on its own.

--=20
Thanks,
Mina
