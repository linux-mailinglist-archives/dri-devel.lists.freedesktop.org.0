Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E389CD3C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862E911297F;
	Mon,  8 Apr 2024 21:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IpPpWluk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8C10E263
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:57:53 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-29c14800a7fso3278143a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591873; x=1713196673; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=untIyZUBolJmBC+haXZFudxoskemR2WDjgQpB/oOF7s=;
 b=IpPpWlukx5kktXVJCEdPqGGRelA1jc6nmkrb3XSYCUcb4Xo/q2c/+DBnaXi+ddeFkE
 uYMX/Z38X3eLtk/46pTLW95IjvnGHY7xT0fijtqEnBjpwnP408Tkw2N8kMDy6GN+9wm7
 7MGF2to1X87i6MtG+LveGyFzq0fnucHEfAPxpolYqC+h2uFh+N6LM8BiOsNkeLCQvcAo
 /1ARRNQRnC+pmkCK0ZehkCAu38LhRS70ViKG4up2Yatj/AwGIIOfEBf4h2/DgBeuN4MO
 2AnkQ84xnBWDqUKNUgWkZRPWdfOlUkh0bjUhgFiBWf48H9KLCH0IcsGyMBbF6mnqdE3L
 qRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591873; x=1713196673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=untIyZUBolJmBC+haXZFudxoskemR2WDjgQpB/oOF7s=;
 b=WL2VZct1EncYK5b3eeee2pQDF8RJH1oMyO776B87B5ishRmsL+p3js8PbZ2tVA57mK
 +z99fo3qo1OdmcX9+nkXVXZydc8BcaL49BQrhp2CykMd4Hr/wlXKlYvXrDBG5XrH6gsn
 95mc+U5LbzaQMNWfH7cHdskAhgtvl5pyXbsYZraWLn77gb+p7fbD90yhwS/SJTCo0sU3
 txm0xgMmKtgA6+lWZGqdOYOWE9uzo7TtrxnhoaJQufPKZYoDITNcGeRlotU/Cbhli03p
 BwRlPd3D8HkU+OeL7yJhZqOeE1m5Rs+VjJnUBhtg+f7/XhdBL6LQvbRXVtFbNLAqdz/V
 DV9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV89/gWfdjRbnfcY0ihdgNq18hgJaFw+OzeAsvm911Se/jIlzdA77GrRpiiW6Gt7Dw7mZxBb2H6PHmKLkRjAgvlgHpD8jb8N8EECllpVLvB
X-Gm-Message-State: AOJu0Yy8wfGKLcX9A8uUmTAahkeskg/649YDwTuNgh88RwjrPFnkGC4x
 qX9gJlScFIKdo9EMi6e/zn75WohaClMLTqM/95SvwU0CLa8POo58
X-Google-Smtp-Source: AGHT+IGJbb2MaWRtYADIA840woW+fg7lVmIt69WB4JS2RPl12DQD69jPbBmSk/iEenJzneHNW7DHjg==
X-Received: by 2002:a17:90a:ab0d:b0:2a5:513:921e with SMTP id
 m13-20020a17090aab0d00b002a50513921emr2739861pjq.31.1712591873008; 
 Mon, 08 Apr 2024 08:57:53 -0700 (PDT)
Received: from localhost ([2601:647:6881:9060:13a8:4fe8:4da1:7ea2])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a17090ab11800b002a2559fe52esm6580894pjq.56.2024.04.08.08.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:57:52 -0700 (PDT)
Date: Mon, 8 Apr 2024 08:57:51 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Abel Wu <wuyun.abel@bytedance.com>, Breno Leitao <leitao@debian.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 14/14] selftests: add ncdevmem, netcat
 for devmem TCP
Message-ID: <ZhQT/4RpKIkUmWut@pop-os.localdomain>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-15-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403002053.2376017-15-almasrymina@google.com>
X-Mailman-Approved-At: Mon, 08 Apr 2024 21:12:18 +0000
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

On Tue, Apr 02, 2024 at 05:20:51PM -0700, Mina Almasry wrote:
> +static char *server_ip = "192.168.1.4";
> +static char *client_ip = "192.168.1.2";
> +static char *port = "5201";
> +static size_t do_validation;
> +static int start_queue = 8;
> +static int num_queues = 8;
> +static char *ifname = "eth1";
> +static unsigned int ifindex = 3;
> +static char *nic_pci_addr = "0000:06:00.0";

It seems this is set but never used.

Thanks.
