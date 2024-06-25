Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BF9169FA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6209610E66D;
	Tue, 25 Jun 2024 14:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="j1blAjly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9F10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:16:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57cd26347d3so6149353a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719324976; x=1719929776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txMg1yBI3C5zZj9b3iG0sb1mrfRfqVzlgNpFi+lwATA=;
 b=j1blAjlycVEtVSFkmxoOW9cOfSFVJ0PoYtZhzPXcTt1rxccRZxUojgRlJ2layMiD9h
 RhMOIoG6MdzgmnboIJglGrdl3re07w/Gw9thHocWmPpn2jStQcsVEAtB6lrEMAGxVwo4
 PS+Xk6sb2X9CmUmjhu/TEIClL6XS+8IG6HvYKgyXjt0Pjef9TB9QFFrcBuieiPOOjDC7
 bBXzjy1OioJ7VmUtVMNneCZtwFUQ745c/0d780k68oA+Rj/OnaeL91aCUM6e8NJpjMda
 KvMnlZ3YRh3IjfqTK903JlmITr20H2sANBarUKBsGMjxlq+q7is5loXC/08233KfZM7D
 WJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719324976; x=1719929776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=txMg1yBI3C5zZj9b3iG0sb1mrfRfqVzlgNpFi+lwATA=;
 b=QNkCUP8XDyz3IumrmeHjBNSglJ+k1J3MTdLyttqnBdNqKhO1ycKR1LOr+ppD4/RMK/
 8SSBSzNpYSRobxSKYSV9dye4jIZqL8MEvOqTYBMzVxYfrYzMzmkcBNC1jPp51zfqGsf3
 BrMQppsW+DWeW3ItmQMUedGHcca/k084oGcqh8poFpuQ2CPL81LCAFGvsLKBgvQC46O0
 9va6b5yYdYPVMLDbeRtpYuogl4uS8OylGCo3hGdl9Mv84uZHuNkKnP1fyYwLY5X+vDLd
 OTELLli0IEsgNjl7u7iXgZNtxE5zmqsvTUeOWlcEAfw6lBUMVvY/At0dZLNWPkXZ8lzt
 1Tpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUry8vOCQ5uOYOe/5Iw6hCQ5TE7VAf1QcDp+V3NyI1q46d8YeaTzslg04ez72o1/tHRLUIzXylqp3UeaiEYpdwOtN693Q9yBjn3bD/NXgI0
X-Gm-Message-State: AOJu0YxBJgfCkkbbsP0uQWt2HXT5EX4Ix2rqg2hhEZnEXlYWzNkn5VBF
 MI7GEFWv6bZEUVHwtebAmvSPXIHhAja4TzYsOQXScp7gURO8M0llBD1e9McmQLwH2z5hfB2gjWv
 EKbhwr1UOpJZVFZ4oPfRCIZPvZIgp0hE4Vpan
X-Google-Smtp-Source: AGHT+IFscpUDigK3sjiafRtyPgDq4I1SxTB/v4k5zCynhP82Entzul2Gkuvq6bg+VXWqgIpi6/XH2Nq4EJopbPxoaxU=
X-Received: by 2002:a17:907:c301:b0:a6f:5f5d:e924 with SMTP id
 a640c23a62f3a-a7245b4c9bcmr662856066b.6.1719324975303; Tue, 25 Jun 2024
 07:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240625024721.2140656-1-almasrymina@google.com>
In-Reply-To: <20240625024721.2140656-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 25 Jun 2024 07:16:00 -0700
Message-ID: <CAHS8izO1g5vZodyvKBNyE-Fx7A4EoD70RuDLwXtzE3yvfRw_2g@mail.gmail.com>
Subject: Re: [PATCH net-next v13 00/13] Device Memory TCP
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
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

On Mon, Jun 24, 2024 at 7:47=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> v13: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D861406=
&archive=3Dboth&state=3D*
> =3D=3D=3D=3D
>
> Major changes:
> --------------
>
> This iteration addresses Pavel's review comments, applies his
> reviewed-by's, and seeks to fix the patchwork build error (sorry!).
>

This series is showing a inapplicable to net-next error on patchwork:

https://patchwork.kernel.org/project/netdevbpf/list/?series=3D865135

What happened here is that I sync'd to net-next, ran all the tests
including the allmodconfig build which took a few hours, then posted
the series. In the meantime 34 patches got merged to net-next, and one
of those patches seems to generate a git am failure when I try to use
b4 to apply:

b4 am 20240625024721.2140656-2-almasrymina@google.com
...
git am ./v13_20240625_almasrymina_device_memory_tcp.mbx
...
Applying: tcp: RX path for devmem TCP
Using index info to reconstruct a base tree...
M       include/net/sock.h
M       net/ipv4/tcp_ipv4.c
Falling back to patching base and 3-way merge...
Auto-merging net/ipv4/tcp_ipv4.c
Auto-merging include/net/sock.h

Not sure if I'm getting very unlucky or if this was something I can do
to avoid this. I think I didn't tax NIPA too much since it's an apply
error. I'll repost after the 24hr cooldown, sorry again.
