Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F21900AD8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 18:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0750510E6AD;
	Fri,  7 Jun 2024 16:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TAqAdyed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFFF10E6AD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 16:59:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so3011990a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717779569; x=1718384369;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b716fHLqA+q2jVEnF0wQCq5rwwcoiNDI2tYRdVxGBJ8=;
 b=TAqAdyed/XddNl09/NvBijVgGVfefYbQytvVKJ2JJlUUwrc1lC06rLCNCTtat/8Zzv
 3+Qgpgd3f++Vlo763T5TEg6yKut6hiCIhU1NClwn/7mAXHSF7iAdHi6JYWARLkX/n5kR
 5WwJ2wqzb0uFG4hBEUkJbfKeoarDTO7jC4BvZOYEAqEpd25p5OCXIhDiXoSdbnZHLkAw
 nJCC1UrGtAsLw8ShIdtiaMpzGpWo+eK/uDnleJlM5RDN4lko7+C6VuUa8nvQqlQ5S1XJ
 8DhEy3v2sR+ZNViASTBZ7XPoY/n0mMbd17g1I3+cR+4KhqDEh3ERUftVKeDbynI8ohGO
 pHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779569; x=1718384369;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b716fHLqA+q2jVEnF0wQCq5rwwcoiNDI2tYRdVxGBJ8=;
 b=pUh61EWBxNoJEMMma0cPr4JnkjLwqbe7q1QzzV6JspLiumC7rvaCDfnuApl/WsRHsX
 8j1ycXkz54CxkaUugkQ0a9xpBHnim5WXFmrkia1zJ13iffQLk7ndawYTApch26pBJHQz
 jTVO+zbiyqLmgqlqjZ6ygtkm4fjH04WfitDqdeRU+OpQfEqCterwGeANKUExZDq8I7rn
 ha5IUp58zWjsXYPuZTQeScWbuanRTTIA4IOvHaTl+fMx/bQVg4cKOHe56r6fXf7i2hGz
 us3P5II58H+3qxLc6JQgTpiMBr9EZi3bjLHE7sXA32h5/hwLK3G7bKGocoMyyHSFZU8i
 KtcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxxfXSlsKNIJ4qPkk4fX+1ny+gIlun+wHrAjiCzvHQypebUw9N84M7M6FD64PT0woosAj+v30Out/EnABZ0vAOTqpnFErBepY6qEKF69Vp
X-Gm-Message-State: AOJu0YyhRw61d5ChoLGgeEBuLBX+QcGXmzLqqAZWfHTQVq2Y2VKcG7tr
 eZ54LI0ucKLjhROMI/7OEBjQM+HPYI9C9+cBr6UEJpFayb4FdwipGJpg4wSd2ka4zhwIP8q8jzz
 cjNkAQMn9Z1r8xIDVxl+aQI9IggeRrtCpHFAJ
X-Google-Smtp-Source: AGHT+IFO8pnZEEr0e5+OyIy57985L/vijoXMBq19GG2GOaDteqsHQMVykhBCrf2eEzDSRbH9iO1UMt7DJvGo0PZ4Mj4=
X-Received: by 2002:a17:906:12c1:b0:a63:3cd4:97d2 with SMTP id
 a640c23a62f3a-a6cdbd0d2e5mr206803066b.63.1717779569136; Fri, 07 Jun 2024
 09:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <8f44ca2a-8910-418f-b4a6-ca1e051484ba@gmail.com>
 <a8df4459-30bf-4414-aeca-2f67c461adc4@gmail.com>
In-Reply-To: <a8df4459-30bf-4414-aeca-2f67c461adc4@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 7 Jun 2024 09:59:16 -0700
Message-ID: <CAHS8izNcYMsSpTNVSGRJHK6u+kDxnFab5Km1rYy8b++0FeUNgA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, 
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

On Fri, Jun 7, 2024 at 8:47=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 6/7/24 16:42, Pavel Begunkov wrote:
> > On 6/7/24 15:27, David Ahern wrote:
> >> On 6/7/24 7:42 AM, Pavel Begunkov wrote:
> >>> I haven't seen any arguments against from the (net) maintainers so
> >>> far. Nor I see any objection against callbacks from them (considering
> >>> that either option adds an if).
> >>
> >> I have said before I do not understand why the dmabuf paradigm is not
> >> sufficient for both device memory and host memory. A less than ideal
> >> control path to put hostmem in a dmabuf wrapper vs extra checks and
> >> changes in the datapath. The former should always be preferred.
> >
> > If we're talking about types of memory specifically, I'm not strictly
> > against wrapping into dmabuf in kernel, but that just doesn't give
> > anything.
>
> And the reason I don't have too strong of an opinion on that is
> mainly because it's just setup/cleanup path.
>

I agree wrapping io uring in dmabuf seems to be an unnecessary detour.
I never understood the need or upside to do that, but it could be a
lack of understanding on my part.

However, the concern that David brings up may materialize. I've had to
spend a lot of time minimizing or justifying checks to the code with
page pool benchmarks that detect even 1 cycle regressions. You may be
asked to run the same benchmarks and minimize similar overhead.

The benchmark in question is Jesper's bench_page_pool_simple. I've
forked it and applied it on top of net-next here:
https://github.com/mina/linux/commit/927596f87ab5791a8a6ba8597ba2189747396e=
54

As io_uring ZC comes close to merging, I suspect it would be good to
run this to understand the regression in the fast path, if any. If
there are no to little regressions, I have no concerns over io uring
memory not being wrapped in dmabufs, and David may agree as well.

--
Thanks,
Mina
