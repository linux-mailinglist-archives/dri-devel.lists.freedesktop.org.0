Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A98BFFE0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFED112319;
	Wed,  8 May 2024 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="MGVmLN2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A646112319
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:25:33 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5b203c9933dso2366198eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1715178332; x=1715783132; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AgrD1WoYkdj8wg28imEY2ANZlllvJHBViF8cNCfVJ94=;
 b=MGVmLN2yFntAflOOA9XFV/OK+JJ3nI+BEWss0DglqVwZ9JVU2vuD8RMOmCzRjZp2oj
 DS1gGPgkBMHrIzOMfZG2oxuLlmmvRC0JyO5PysMTAFJNXH9eRvamEY3FG042RSvY1bIA
 Fjw97p48Q/lp687PHgbJNrnBE3Wp8Gh/XUtr7RiCHu/MkUZubqXo+27xHcOA50S15B5A
 FTGWJ2vrTbjISZd9N7HeU0dWHkFplegsEd6F5Aq3yA8kcSTlywpAmxvdMK1j3Cf5XYEF
 794LkF+XgobjOROL4mhfzJ3aaWh5CeRV10GGWAw2yAZfXo0h/rrGpxREfIWMSNOtZoTT
 0OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715178332; x=1715783132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AgrD1WoYkdj8wg28imEY2ANZlllvJHBViF8cNCfVJ94=;
 b=GIzQlnstNOYmVQIj6YbOCclj6uHu4V8KkXJNYAn/aWfRwLAQ/9Mvj8Bo2WYk05ALDu
 xPwsX+270kMbA1A3idRpY98TNW5E8Fyzf40PCSQ7DEAh1v7Yi8gvNRp5+AXUuuCioSow
 1Fu8feoq5fyjrjU2YZi2Hzt4grr61wcJQ1RT9wp2ryTjHl4R+IYNHhtPlDaHyL3BY7XH
 +P+YkVtAI/pnwETUc3HUH3Ld4R2QDJ/eKeKLVO6QCpXoQbH1wXW16fXRQ0mtAwU46zB9
 5CDXsFpfph9OlfgJK2tosqfP41PTl2RBTXVje2N4YjVZWBArB9I7S4JQJ+LlNjTqrhhG
 eM8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhBkXy1SJ1r6ZP4abKZco+dupF9j2KKzEoNMmTsLLxB3otEPEbbi/uvI6ebyNe2mvWRrIn9uwZdqLyATzpKlpM2mAXyEafD4zSrTQt0JWz
X-Gm-Message-State: AOJu0YzjCkn9ZOxEi9XMR6YZXDOjyeoTTnvfIPJND0VkG+ygmnL7B7XQ
 hAxjlbVo4ir5HuO3a7RS/BVxfER7qgCRZ4CzsqUwZyEv/L+eSA9OookG/cKhPIU=
X-Google-Smtp-Source: AGHT+IHjV+YjcifEHKw5oQYkCNsBVkCIuACEQyUL/WL5v5GcAhnL6ouYxG09iM1YvQ+6Pe3rmrQdgA==
X-Received: by 2002:a4a:8c24:0:b0:5aa:538a:ed60 with SMTP id
 006d021491bc7-5b24d28fdb4mr2495842eaf.3.1715178331994; 
 Wed, 08 May 2024 07:25:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 o18-20020ac86992000000b0043d4245dd4csm4389539qtq.84.2024.05.08.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 07:25:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1s4iEc-0016QI-DE;
 Wed, 08 May 2024 11:25:30 -0300
Date: Wed, 8 May 2024 11:25:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
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
Message-ID: <20240508142530.GR4718@ziepe.ca>
References: <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
 <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
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

On Wed, May 08, 2024 at 12:30:07PM +0100, Pavel Begunkov wrote:

> > I'm not going to pretend to know about page pool details, but dmabuf
> > is the way to get the bulk of pages into a pool within the net stack's
> > allocator and keep that bulk properly refcounted while.> An object like
> > dmabuf is needed for the general case because there are
> > not going to be per-page references or otherwise available.
> 
> They are already pinned, memory is owned by the provider, io_uring
> in this case, and it should not be freed circumventing io_uring,
> and at this stage calling release_pages() is not such a hassle,
> especially comparing to introducing an additional object.

Something needs to co-ordinate when the net stack's allocator is done
with the bulk of pages and when io_uring and do the final
put_user_page() to free it. DMABUF is not an unreasonable choice for
this.

> > topic to me, and honestly hacking into the allocator free function
> > seems a bit weird..
> 
> Do you also think that DMA_BUF_IOCTL_SYNC is a weird hack, because
> it "delays free" by pinning the dmabuf object and letting the user
> read memory instead of copying it? I can find many examples

It seems to me the flow you want is for the driver to allocate a page,
put it on a rx ring, process it through the netstack, and deliver it
to io_uring. io_uring would then sit on the allocation until userspace
it done and return it back to the netstack allocator.

Hooking the free of the netstack allocator and then defering it seems
like a weird and indirect way to get there. Why can't io_uring just be
the entity that does the final free and not mess with the logic
allocator?

Jason
