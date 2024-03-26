Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6588CE07
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C382C10F280;
	Tue, 26 Mar 2024 20:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VtIfANrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5010F280
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:14:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56c0bd07e7bso3059636a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711484093; x=1712088893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jKpOWJ+LWFlZC4DPjtJM6QnKsaH5cXRpUTLZjP2Byk=;
 b=VtIfANrUpmYtXnBB/62CKJ3Cnc9leEr6ozSwQI49fwCuZGLK7PLbzK1psae0d4aRQd
 Wh7+gkJeJ97JLO4/hxMz1VUgQ+Mi8Sg6LF+ATEbogN9DWilHJ7dA5u/IFdvZoKxzIjSS
 aoBfrIx1F+GtEJi6hFB4vDgxm1/AEKdiGrjLuaSc9dygiQH4Ouubg2TfvvvbsfODYFWl
 QcThe3SkYJVRLm8Kd2XJ2u/vs4JWOfi2Rvfudu86p5gQL1aVvgmggAB4laG9m+sE+hRn
 J0bUhNIWTaYF+i/Dishu6TbpdbSZDrweoL85g3j5gbFJ2HgkeMQtrZAS1pQE0lqI8s0H
 jEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484093; x=1712088893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jKpOWJ+LWFlZC4DPjtJM6QnKsaH5cXRpUTLZjP2Byk=;
 b=q3Ahr/f7bC3h+7HfBzz2jq+8Yh1leDSZpkjV/92Bk0iZnjOtOqplTBPu+OFx1WDoSw
 nQ9CtBp10kG9Yks8UPGyFOkyb6WrKpUQPPCZ6jPGBna10Uwjx4PQHqRn4a5Yn5+YKEet
 yHREuVBs3EyiDLouY6PM+AiZ4xzu6F7pfPlwVqqewW1n9awI8xgLkRG31MhNLA3vHET5
 hg2crrTAH5iYUFfYsogKvF6zk2bNUm5PdQ8ksKsGfPv7keFpAtmdHk33p1fT98pxwDov
 hSLs43I8gnZKtSaUinItTb7a1WWKRIdqjOvxIJLn8YTQPUUS30/pqSVUH7YUYYfc8NcC
 fjIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG5VhdNkb/qwT+fqhTxus7jodT6dTXgPmA8lCXJQTYiWwcECN99ICPB/bChKJMkW1XS0T7PW+sjmF2FxEP+NHflLIxgsOqpBeT/hl+xl6q
X-Gm-Message-State: AOJu0YzCt+d84TLMOMAEofGL6Bxr5joqZBy7RP/NRzfGV6Nt5lZExdsI
 FfJiWZi3Zb4AakDt2UNIxyFB8T7iHJdkj+M1i+qzo0EYl7FsTuoluxsG66hOMp5gCkpcDjiUb1h
 x5iKniu6dnoyOmxF4ZRNyXhz1/7DS+IltSkf6
X-Google-Smtp-Source: AGHT+IHNbZvU94ocsPuARsH8Mie4+EyFLOQLiJ99ddFMOV+2ee5fWO0HjR082QS+izq6JTEydRhhd/UQfdi1W0fksuE=
X-Received: by 2002:a17:907:76f2:b0:a47:32b3:18c5 with SMTP id
 kg18-20020a17090776f200b00a4732b318c5mr521341ejc.68.1711484092750; Tue, 26
 Mar 2024 13:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
 <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
 <CAHS8izPR+SioMKNv3=2ajK=GGOE26BTaxOMykHJfjttqYjx1wQ@mail.gmail.com>
 <ca9ab650-3f77-509c-7a29-6d7dd775b6d1@huawei.com>
In-Reply-To: <ca9ab650-3f77-509c-7a29-6d7dd775b6d1@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 26 Mar 2024 13:14:39 -0700
Message-ID: <CAHS8izPPiyNQNKSGfZ22DU3ta2vmq6pZOJPPGqxD_5hNpuJU+Q@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 00/15] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>, shakeel.butt@linux.dev
Cc: YiFei Zhu <zhuyifei@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
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

On Tue, Mar 26, 2024 at 5:47=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2024/3/26 8:28, Mina Almasry wrote:
> > On Tue, Mar 5, 2024 at 11:38=E2=80=AFAM Mina Almasry <almasrymina@googl=
e.com> wrote:
> >>
> >> On Tue, Mar 5, 2024 at 4:54=E2=80=AFAM Yunsheng Lin <linyunsheng@huawe=
i.com> wrote:
> >>>
> >>> On 2024/3/5 10:01, Mina Almasry wrote:
> >>>
> >>> ...
> >>>
> >>>>
> >>>> Perf - page-pool benchmark:
> >>>> ---------------------------
> >>>>
> >>>> bench_page_pool_simple.ko tests with and without these changes:
> >>>> https://pastebin.com/raw/ncHDwAbn
> >>>>
> >>>> AFAIK the number that really matters in the perf tests is the
> >>>> 'tasklet_page_pool01_fast_path Per elem'. This one measures at about=
 8
> >>>> cycles without the changes but there is some 1 cycle noise in some
> >>>> results.
> >>>>
> >>>> With the patches this regresses to 9 cycles with the changes but the=
re
> >>>> is 1 cycle noise occasionally running this test repeatedly.
> >>>>
> >>>> Lastly I tried disable the static_branch_unlikely() in
> >>>> netmem_is_net_iov() check. To my surprise disabling the
> >>>> static_branch_unlikely() check reduces the fast path back to 8 cycle=
s,
> >>>> but the 1 cycle noise remains.
> >>>>
> >>>
> >>> The last sentence seems to be suggesting the above 1 ns regresses is =
caused
> >>> by the static_branch_unlikely() checking?
> >>
> >> Note it's not a 1ns regression, it's looks like maybe a 1 cycle
> >> regression (slightly less than 1ns if I'm reading the output of the
> >> test correctly):
> >>
> >> # clean net-next
> >> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> >> 2.993 ns (step:0)
> >>
> >> # with patches
> >> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 9 cycles(tsc)
> >> 3.679 ns (step:0)
> >>
> >> # with patches and with diff that disables static branching:
> >> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> >> 3.248 ns (step:0)
> >>
> >> I do see noise in the test results between run and run, and any
> >> regression (if any) is slightly obfuscated by the noise, so it's a bit
> >> hard to make confident statements. So far it looks like a ~0.25ns
> >> regression without static branch and about ~0.65ns with static branch.
> >>
> >> Honestly when I saw all 3 results were within some noise I did not
> >> investigate more, but if this looks concerning to you I can dig
> >> further. I likely need to gather a few test runs to filter out the
> >> noise and maybe investigate the assembly my compiler is generating to
> >> maybe narrow down what changes there.
> >>
> >
> > I did some more investigation here to gather more data to filter out
> > the noise, and recorded the summary here:
> >
> > https://pastebin.com/raw/v5dYRg8L
> >
> > Long story short, the page_pool benchmark results are consistent with
> > some outlier noise results that I'm discounting here. Currently
> > page_pool fast path is at 8 cycles
> >
> > [ 2115.724510] time_bench: Type:tasklet_page_pool01_fast_path Per
> > elem: 8 cycles(tsc) 3.187 ns (step:0) - (measurement period
> > time:0.031870585 sec time_interval:31870585) - (invoke count:10000000
> > tsc_interval:86043192)
> >
> > and with this patch series it degrades to 10 cycles, or about a 0.7ns
> > degradation or so:
>
> Even if the absolute value for the overhead is small, we seems have a
> degradation of about 20% for tasklet_page_pool01_fast_path testcase,
> which seems scary.
>
> I am assuming that every page is recyclable for tasklet_page_pool01_fast_=
path
> testcase, and that code path matters for page_pool, it would be good to
> remove any additional checking for that code path.
>

We can remove the usage of static_branch_unlikely in the net_iov
check, which reduces the overhead to 1 cycle (8->9), only 12.5%
overhead. The addition of the static_branch_unlikely is not improving
the performance of devmem TCP anyway. From previous discussions with
Jesper he deemed a 1 cycle degradation acceptable, but he hasn't
commented in a while, he may have changed his mind but so far no
complaints.

We can additionally only add the check only if
CONFIG_SHARED_DMA_BUFFER is enabled. I've tested that and the fast
path goes back to 8 cycles (0 overhead). If CONFIG_SHARED_DMA_BUFFER
is not enabled then netmem can't be dmabuf anyway, so no reason to
check.

> And we already have pool->has_init_callback checking when we have to use
> a new page, it may make sense to refactor that to share the same checking
> for provider to avoid the overhead as much as possible.
>
> Also, I am not sure if it really matter that much, as with the introducin=
g
> of netmem_is_net_iov() checking spreading in the networking, the overhead
> might add up for other case too.


--=20
Thanks,
Mina
