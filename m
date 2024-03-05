Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DA8727A8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 20:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA00D112C5F;
	Tue,  5 Mar 2024 19:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TfWVyHsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8149112A39
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 19:38:50 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso9185227a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 11:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709667529; x=1710272329;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbu7jPJNusoAIuT8pNXSfufXvY1iYoRgBC5JcoUfIfk=;
 b=TfWVyHscZMqTz3me+/mka3xo87iagjS7JiKEM0eJR8LCaanOhduAptToWH0ADLfitr
 jter5pFn/vj6YcgsKdVWG6NXzTHm5u5YAo3c17dKOpZYju0Toq4Lbuzjh6SOsAipL7RQ
 Ne0z5hOcc5sTpr9xCL9zGmMSFWRPA2ujqAbMjVX/NB43gsDoRbozM6UMVgT8ZdpQpsfA
 zdNpWU3Bk+WleqvFgKr3iPAhtj91UIbazVvhPl6S93obojRGVa5IUpfWtXOVQkk0D/vu
 5YNt5P/fJdvexNuTaMCkE7GDAwoHkLBqjNephDfafxz4Ds4G917NMHHvGvmrutF/hAZM
 VSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709667529; x=1710272329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbu7jPJNusoAIuT8pNXSfufXvY1iYoRgBC5JcoUfIfk=;
 b=Wx7jZYfQK5sO4NKCJEp4cvN4Ns98f9GeQRoJweNPH41iOyQbIwkjG0VSZhp8gQqrQT
 jQGaboEYbyDf/oT4XIWO0ORsB6zj43CMtmYqAWfY3cN6nQexZsgWNxBY4UIrKLuKMxCt
 a9xDCPcLPM0Wdhdoq6nnUVLkZiQ70bwAH9/yWWVOunpvkJqNmq4Ia4u4rCA8LYcbk1fD
 X0AXbORU2y0497kr9cCvO3PAj33mrxR/URx3buFfm1l/WtfdrOS6yweeS1XdTwimBPMk
 MSQEp5eGGkhc3wkkyQpQNpZ3oZZrVfw7WRZJ1MUgFAQJtBhXOpnH3rVjOhNP7j3L2vTX
 FMlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkk0hI3UfSt6iU4Fzaqe4skGk7O8WPo44BstvwjW2bme0y1kAWp28i1rLfYsJ5IFsGTgGnN8IB2AkZlBLmUvLKX5kTfA/n1++hOQnjTt3d
X-Gm-Message-State: AOJu0YwQP/B+9FnQUGLRTTuUeNtHbeZHEat1Ps4MGLquK5gipzF2Pr+P
 hYK+Jj/aS8ldHX6ZtkYJixWnRJ07I7f2yelstMkYjr7Wfp/RMn4Nh06DaEvrB7JH3L1+EoCJ4AC
 Dp/otAczeW0iRA3/NGp+LFa0a96M8jy0uH6Ay
X-Google-Smtp-Source: AGHT+IE9+/I3bSukMGSV69NWucyK49DrCDskm5u3bRNu62YrXsb5GYolXDQb6+2mnF70pbKLSkXCgPSxIq5NsfN3srs=
X-Received: by 2002:a17:906:b790:b0:a45:b36c:55c7 with SMTP id
 dt16-20020a170906b79000b00a45b36c55c7mr421516ejb.63.1709667528752; Tue, 05
 Mar 2024 11:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
In-Reply-To: <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 11:38:37 -0800
Message-ID: <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 00/15] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
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

On Tue, Mar 5, 2024 at 4:54=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/3/5 10:01, Mina Almasry wrote:
>
> ...
>
> >
> > Perf - page-pool benchmark:
> > ---------------------------
> >
> > bench_page_pool_simple.ko tests with and without these changes:
> > https://pastebin.com/raw/ncHDwAbn
> >
> > AFAIK the number that really matters in the perf tests is the
> > 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
> > cycles without the changes but there is some 1 cycle noise in some
> > results.
> >
> > With the patches this regresses to 9 cycles with the changes but there
> > is 1 cycle noise occasionally running this test repeatedly.
> >
> > Lastly I tried disable the static_branch_unlikely() in
> > netmem_is_net_iov() check. To my surprise disabling the
> > static_branch_unlikely() check reduces the fast path back to 8 cycles,
> > but the 1 cycle noise remains.
> >
>
> The last sentence seems to be suggesting the above 1 ns regresses is caus=
ed
> by the static_branch_unlikely() checking?

Note it's not a 1ns regression, it's looks like maybe a 1 cycle
regression (slightly less than 1ns if I'm reading the output of the
test correctly):

# clean net-next
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
2.993 ns (step:0)

# with patches
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 9 cycles(tsc)
3.679 ns (step:0)

# with patches and with diff that disables static branching:
time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
3.248 ns (step:0)

I do see noise in the test results between run and run, and any
regression (if any) is slightly obfuscated by the noise, so it's a bit
hard to make confident statements. So far it looks like a ~0.25ns
regression without static branch and about ~0.65ns with static branch.

Honestly when I saw all 3 results were within some noise I did not
investigate more, but if this looks concerning to you I can dig
further. I likely need to gather a few test runs to filter out the
noise and maybe investigate the assembly my compiler is generating to
maybe narrow down what changes there.

--=20
Thanks,
Mina
