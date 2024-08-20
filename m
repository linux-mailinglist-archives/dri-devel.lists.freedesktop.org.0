Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D427E958CD7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6310E480;
	Tue, 20 Aug 2024 17:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vOCrYu6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987E810E7E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:11:35 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-44fee2bfd28so12781cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724173894; x=1724778694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BnG3mTCoiILr908gRTdf9mnBK5WkLmZC0rD5sCvrluY=;
 b=vOCrYu6N4ZE8Tf1zIQ1r5h2ac+7zDXE1lcQaobHZPXa2gzbk1gpCOGRSpwf3n9WcON
 3z3XhdxUPw29/NqiQXZzvkEXyZ8TVe49lvn3d/rjM0VOZyeP2sYNXKyplYtn4qPCmba7
 xaUGE4deUi7bkFKVnup0JoS8JKo9AAZCg4Fq4fxd3AtI8YkvPVIXBZ4OW4512o7Y79W7
 3jksGgTMJaM6SVWMC96VvgmuFIAEcZUZFoga9fMPTCrxKjXPhGgyAUZE3iABpYpoEirp
 5U59wewDv+a0dOj7jPVmEA7JAEq9WzQzhVhhAf65WTyB4Q7Q+JAwUxDLxM/r53CuJd0e
 9NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724173894; x=1724778694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BnG3mTCoiILr908gRTdf9mnBK5WkLmZC0rD5sCvrluY=;
 b=W/htES8DWANW0mOZBc1866NYbXSDPMN/Dog9jLPoQMDH/HFYyrMn8h7KbQkxSklZVt
 FE8iEnVGSEoF/yrVqOEiSABjocVJO7UQtW4OCLNt/hlX9TGCAremlLiNPtR43FM6wy+x
 bx0YrKNKGqymMgL9sfnsDlJ2ikrG6LNhu+re6YqImF0jFtX2ozelnlYuPMNT7sVZXE3a
 unfOi2LHD9sZMA9V85MaNSNuryS7cSKlKEKlN3CeJRbPnNlkfeNYpkt3CVN0jn+/ZvZU
 tij9fQQsBQLwINrOrb/xbrSs5FIlJ28pV4hO1paHEiXGViJh57g0DEOuhlGv7Oh9rfHO
 ITFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtJZdxHwUUE0abhofHUvxn8mASAfjNCj+/QIK2vQbq/0XJmBVKvOroCfqGqEXRwkjz8vd3sYpy+Go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPHaKU8M85zJv3h+qD1EyZOspdfZt4yHCHw80MPuKzccFfVIIT
 MIpLsXzxXxOM5j0OPqEMCL4WmSpPUCbL3yThk8wCCF+SL36TNk2IyKZSksQK490CJlYsX4mIR4S
 GBDmYbiP4lfNbdy0X8vbg3Q0Ej9UjZz07HHy/
X-Google-Smtp-Source: AGHT+IEBYChI7KLbhDnxhptDasxvi66SSRGAyIIecU3g/9eHhycAcmIuoWtzgGhG2Nmu+KCELaheAYpAv+Ak2asKVEA=
X-Received: by 2002:a05:622a:5297:b0:453:5f2f:d5d2 with SMTP id
 d75a77b69052e-454e852f800mr2224121cf.1.1724173894153; Tue, 20 Aug 2024
 10:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com>
 <20240819155257.1148e869@kernel.org>
 <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
 <20240820081920.6630a73f@kernel.org>
In-Reply-To: <20240820081920.6630a73f@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Aug 2024 13:11:20 -0400
Message-ID: <CAHS8izO-F2qwbEEtYONOYgNFsP3jxpv0etgSKknnAQ8itA5Cdw@mail.gmail.com>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 11:19=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 20 Aug 2024 00:01:02 -0400 Mina Almasry wrote:
> > Took a bit of a look here. Forgive me, I'm not that familiar with XDP
> > and virtual interfaces, so I'm a bit unsure what to do here.
> >
> > For veth, it seems, the device behind the veth is stored in
> > veth_priv->peer, so it seems maybe a dev_get_max_mp_channel() check on
> > veth_priv->peer is the way to go to disable this for veth? I think we
> > need to do this check on creation of the veth and on the ndo_bpf of
> > veth.
>
> veth is a SW device pair, it can't reasonably support netmem.
> Given all the unreasonable features it grew over time we can't
> rule out that someone will try, but that's not our problem now.
>
> > For bonding, it seems we need to add mp channel check in bond_xdp_set,
> > and bond_enslave?
>
> Sort of, I'd factor out that logic into the core first, as some
> sort of "xdp propagate" helper. Then we can add that check once.
> I don't see anything bond specific in the logic.
>
> > There are a few other drivers that define ndo_add_slave, seems a check
> > in br_add_slave is needed as well.
>
> I don't think it's that broad. Not many drivers propagate XDP:
>
> $ git grep -C 200 '\.ndo_add_slave' | grep '\.ndo_bpf'
> drivers/net/bonding/bond_main.c-        .ndo_bpf                =3D bond_=
xdp,
>
> $ git grep --files-with-matches  'ops->ndo_bpf' -- drivers/
> drivers/net/bonding/bond_main.c
> drivers/net/hyperv/netvsc_bpf.c
>

OK, got it, I'll take a deeper look and hopefully figure out something
reasonable here.

> > This seems like a potentially deep rabbit hole with a few checks to
> > add all of the place. Is this blocking the series?
>
> Protecting the stack from unreadable memory is *the* challenge
> in this series. The rest is a fairly straightforward.

Understandable. I pulled the trigger on v21 with the build fix last
night after reading your response on the other thread. If you manage
to review that and let me know of any other issues I'm going to run
into down the road, that would be great. But I read in some other
thread that you're overloaded. Sorry if I'm piling on. Feel free to cr
it if necessary, of course.

--
Thanks,
Mina
