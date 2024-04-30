Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61D8B8064
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 21:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048AD112E86;
	Tue, 30 Apr 2024 19:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tTazM7Os";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77AB112E86
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 19:19:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51bae805c56so7095899e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714504773; x=1715109573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBbLSd4KX1Ml6Kx/U9tspaOWXAez2c+6/7rMF07WiMA=;
 b=tTazM7OsFKi7oASBTbCivVsV2pIECxpTux4rU6HnGHNZaiZ+Fd7GE0IbGPg8RSyQ+R
 SLxe5PxjpUVcDzw4L1mRi7tvwtENWlPSZ5ynxG0P0c2PKbZhTLB2dA7zPoWJVRR5iVWX
 xokgwtgTp6sLdKM8UnyYuEXM0WWHp7qsYeb9SScODmviVY5D1BxqgH104R1FzTF5/K7d
 sXJH9acw4bZwzRtC3mwB4ZYok3GMN82eB25bHRu84Uo2kXXc5GCb/B+gEG9MTLKnS6hg
 V6aDHvCPm10g0d9v6kUeVYCuOqyRaf7epwes81tTqzp3T9jo+t9Yh9lTuwGnuEbfpT8V
 +hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714504773; x=1715109573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBbLSd4KX1Ml6Kx/U9tspaOWXAez2c+6/7rMF07WiMA=;
 b=LLExPvinYayh3sFPuvXBL6MtELLyMZQlUuXP68GrBrSxemcj+0ygdHkdy747VvSpol
 lxjeR3JoKC4fOqYlF1r0MFAV/v7w7NOMy3Q5h++Z9jkwk5pvsCkwYfR5N1JDSRFNe4SC
 RZ1zA1/Xqok+YZntKRxJ0QYbNLCntkqtMy52qzZUejgIxvR+7Kd0bw3e5UOnKvXEW101
 oJh72jwIqSxP5uZHw020v5TPW1Yt/vakFeL+MEB91ttq4MxFCLrzjp17QomiwFezj4Xf
 G1YCLepHRHIQIWshBDn87ZfZ8/DCGJqIs3yKMGwcZFKx4DETRYAeenRV3PMndYcJpWPS
 kITw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXJcRD/P5xEio2Lb1/xCv1xq4NlC/+VXG9aYMrA3fn8U9dJIxGKSWMteEeiJ6O75+0vu+Oe18SpbsesrJ0Epk3f8QJjoRcRA17A9kj+YLE
X-Gm-Message-State: AOJu0Yzh2FOBmo30hgI2T54ld00PuQjV0K01cc+pYwylK/tHDpesT21F
 nY7MpUxlQP7w+hblC3e7aQjicJ6psLtQrRXjwH8/2zfjUXy/uR1lLS6hI8PCTqnVnDYKZ9Rf7Xy
 pwuXj6/Xb8bPuMY5xf1ZnOZ2Q+VsieGpX6M5J
X-Google-Smtp-Source: AGHT+IEv1vAD5KmPx2DuK83e++oMbqGnWC2h94YZYICJhje+Ouaos+1vgy9d2n+Zn+VtRp04liNfK+AEGoM+Z6BbCWI=
X-Received: by 2002:a05:6512:3492:b0:517:8ad8:c64 with SMTP id
 v18-20020a056512349200b005178ad80c64mr259130lfr.21.1714504772286; Tue, 30 Apr
 2024 12:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-8-almasrymina@google.com>
 <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
 <CAHS8izPeYryoLdCAQdGQU-wn7YVdtuofVKNvRFjFjhqTDsT7zA@mail.gmail.com>
 <aafbbf09-a33d-4e73-99c8-9ddab5910657@kernel.dk>
 <CAHS8izMKLYATo6g3xkj_thFo3whCfq6LSoex5s0m5XZd-U7SVQ@mail.gmail.com>
 <11f52113-7b67-4b45-ba1d-29b070050cec@kernel.dk>
In-Reply-To: <11f52113-7b67-4b45-ba1d-29b070050cec@kernel.dk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 30 Apr 2024 12:19:17 -0700
Message-ID: <CAHS8izP3KtH_CHyQKE+=vrY-yREq5Bb_Kd+KLyJ4j-_AdjNk-Q@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 07/14] page_pool: devmem support
To: Jens Axboe <axboe@kernel.dk>
Cc: David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
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
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>, 
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
 Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
 Matthew Wilcox <willy@infradead.org>
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

On Tue, Apr 30, 2024 at 11:55=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote=
:
>
> On 4/30/24 12:29 PM, Mina Almasry wrote:
> > On Tue, Apr 30, 2024 at 6:46?AM Jens Axboe <axboe@kernel.dk> wrote:
> >>
> >> On 4/26/24 8:11 PM, Mina Almasry wrote:
> >>> On Fri, Apr 26, 2024 at 5:18?PM David Wei <dw@davidwei.uk> wrote:
> >>>>
> >>>> On 2024-04-02 5:20 pm, Mina Almasry wrote:
> >>>>> @@ -69,20 +106,26 @@ net_iov_binding(const struct net_iov *niov)
> >>>>>   */
> >>>>>  typedef unsigned long __bitwise netmem_ref;
> >>>>>
> >>>>> +static inline bool netmem_is_net_iov(const netmem_ref netmem)
> >>>>> +{
> >>>>> +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_DMA_SHARED_BUFFER)
> >>>>
> >>>> I am guessing you added this to try and speed up the fast path? It's
> >>>> overly restrictive for us since we do not need dmabuf necessarily. I
> >>>> spent a bit too much time wondering why things aren't working only t=
o
> >>>> find this :(
> >>>
> >>> My apologies, I'll try to put the changelog somewhere prominent, or
> >>> notify you when I do something that I think breaks you.
> >>>
> >>> Yes, this is a by-product of a discussion with regards to the
> >>> page_pool benchmark regressions due to adding devmem. There is some
> >>> background on why this was added and the impact on the
> >>> bench_page_pool_simple tests in the cover letter.
> >>>
> >>> For you, I imagine you want to change this to something like:
> >>>
> >>> #if defined(CONFIG_PAGE_POOL)
> >>> #if defined(CONFIG_DMA_SHARED_BUFFER) || defined(CONFIG_IOURING)
> >>>
> >>> or something like that, right? Not sure if this is something I should
> >>> do here or if something more appropriate to be in the patches you
> >>> apply on top.
> >>
> >> In general, attempting to hide overhead behind config options is alway=
s
> >> a losing proposition. It merely serves to say "look, if these things
> >> aren't enabled, the overhead isn't there", while distros blindly enabl=
e
> >> pretty much everything and then you're back where you started.
> >>
> >
> > The history there is that this check adds 1 cycle regression to the
> > page_pool fast path benchmark. The regression last I measured is 8->9
> > cycles, so in % wise it's a quite significant 12.5% (more details in
> > the cover letter[1]). I doubt I can do much better than that to be
> > honest.
>
> I'm all for cycle counting, and do it myself too, but is that even
> measurable in anything that isn't a super targeted microbenchmark? Or
> even in that?
>

Not as far as I can tell, no. This was purely to improve the page_pool
benchmark.

> > There was a desire not to pay this overhead in setups that will likely
> > not care about devmem, like embedded devices maybe, or setups without
> > GPUs. Adding a CONFIG check here seemed like very low hanging fruit,
> > but yes it just hides the overhead in some configs, not really removes
> > it.
> >
> > There was a discussion about adding this entire netmem/devmem work
> > under a new CONFIG. There was pushback particularly from Willem that
> > at the end of the day what is enabled on most distros is what matters
> > and we added code churn and CONFIG churn for little value.
> >
> > If there is significant pushback to the CONFIG check I can remove it.
> > I don't feel like it's critical, it just mirco-optimizes some setups
> > that doesn't really care about this work area.
>
> That is true, but in practice it'll be enabled anyway. Seems like it's
> not really worth it in this scenario.
>

OK, no pushback from me. I'll remove the CONFIG check in the next iteration=
.

--=20
Thanks,
Mina
