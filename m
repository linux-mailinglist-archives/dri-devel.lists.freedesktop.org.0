Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEC8BE9A0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D2D10E26E;
	Tue,  7 May 2024 16:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="IUME3Xgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD2410F663
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:48:40 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-69b44071a07so35332576d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1715100519; x=1715705319; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gOXMXsqBJM5en+QCPBiSpytwuPa/Zj3rDSRIG7JgC/c=;
 b=IUME3XghqWUr9haHDQBk4sPfYkpAqzwda19fHiMNsTRxQ4FfZ74tCWNQRDdHkAGhSg
 Bq5wcbnJHbpPxeb+XzP1B9dBJQgHzMNOybDdQGUKrGRnHJ1aV8DRHnHCVRwFJ5FM174m
 CDe7Wse83x8izeYi8aRA3bXxcZJQOJvnmq2Y+mKh+pVebMoXQlhX7fcwpqJVJM5QZUBt
 QhTWXQslLswN50CnQzSWSZ9nm2DN1Elhc5ZgqGZ+fDbtBQ5K+FJuQ094GdfVVTYSTPoF
 DrumnOK9yIFU3Iw7EbCAosGtdTc9Kri2QfNbW7km+QNYZz5GRHcd14sE0iD8GZoaYcS0
 yK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715100519; x=1715705319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOXMXsqBJM5en+QCPBiSpytwuPa/Zj3rDSRIG7JgC/c=;
 b=YHLrBdAObv+pWcR6aJoNtAPecFgneNaByYYv5HZl0H0JmQ+wHsN5yxAsCYWQfZXmQB
 jJ5fnxTJpzrg0RtZ1SD0gsAqQSbmU5qFkrpAbMzVlBdq7/tfDiuxWY3m7gybEoVgFHPN
 to2zuFCaYpHKTWSgU/xshpeKTruvTTwbCpziMZbASCvhu3tRPcmDsuYaLqmzpZV2VE5g
 b/3VyMVACyYSTHvM91gbvidVDhp4jLlHd+d8DOieoZMSNpL7hRY+5FTqCLra21HoWSKv
 sZPArw8AWB3Aw2ftPxMu/0SUnZhFEDBnn3SwKsyK/Bf/JRAndAObpTCDCvWa390X+a1+
 YL2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1rzPx32MhqapZtpsR3Kt8K14f4Tf+kit7rD/FmO3AUbpSxG69Apm5cjmSe9PPrkcCgvY0GMVd6sLvp20QvMxM1OMzmElM2XVEZR75MQ3J
X-Gm-Message-State: AOJu0YwuKgv3IRz7HXbsIm2xz+RXB8+uNfcUQrAbzyAowrzXJKe6H7BY
 L+AkupYg8jfVvrRbJSJTnhekcySkl9PGCq8ehrP1Gn6OzT1zukWfcqDywygszQ8=
X-Google-Smtp-Source: AGHT+IFbsxT2Pt8ByXGyT7LtxaJucQY1rIIZhIGZ18mB5aP258L/BIC9x6k5KbmoTctVF3TG4pq55g==
X-Received: by 2002:a05:6214:d6f:b0:6a0:d701:3e2f with SMTP id
 6a1803df08f44-6a1514e62bdmr3983216d6.56.1715100519594; 
 Tue, 07 May 2024 09:48:39 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 m17-20020ad44a11000000b006a0d7154d13sm4802415qvz.78.2024.05.07.09.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 09:48:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s4Nza-0001bb-8V;
 Tue, 07 May 2024 13:48:38 -0300
Date: Tue, 7 May 2024 13:48:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240507164838.GG4718@ziepe.ca>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
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

On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:

> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> think in the past you said it's a uapi you don't link but in the face
> of this pushback you may want to reconsider.

dmabuf does not force a uapi, you can acquire your pages however you
want and wrap them up in a dmabuf. No uapi at all.

The point is that dmabuf already provides ops that do basically what
is needed here. We don't need ops calling ops just because dmabuf's
ops are not understsood or not perfect. Fixup dmabuf.

If io_uring wants to take its existing memory pre-registration it can
wrap that in a dmbauf, and somehow pass it to the netstack. Userspace
doesn't need to know a dmabuf is being used in the background.

Jason
