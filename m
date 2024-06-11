Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C152D904325
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 20:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7105110E159;
	Tue, 11 Jun 2024 18:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="F/3IZsr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127810E722
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 18:09:32 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a68b41ef3f6so677469266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718129370; x=1718734170;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lxPetrPpHvENSTokBRC6xognbIAj4RmicEAyuXDxTU=;
 b=F/3IZsr1vSxdKmY/vRNrthNp8X/YRDkdZKAPbSKPyf28b7deOAB8JdLugwWooQvEIR
 kCjsMk+cwGVnM9hBdOiK7lynCMQqIoAZdWF83t8SXfHlUI8w/wIcFkf/RE8lBD/7e4Kp
 2INThTcm/s6Gb4VEIfRZ9lXFoL9veLH3J+n3H6HrkiGCYMDQxLYPY0jvn9T22KF/MaJM
 1UqcoUvWWj/bJY+8lPjJcLXfrJWgncEMBBXMcd9c/HntU0patiiDZ2gf5OwLT9e0KhDW
 aXcukAlpYbAK/RcXbxa5DxMP7WrKoce87QYrdf/yPnYBWKvm+zxjK63bmg91zAEnW10n
 5OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718129370; x=1718734170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lxPetrPpHvENSTokBRC6xognbIAj4RmicEAyuXDxTU=;
 b=ke+XufA6yQYoxfOwR6cYGvOgYWYLH6IGUKuDddGLcFRpFoP1V3udpBvI/k+pPYceqG
 MXZnxqexqhZw6Ss4jUZUxrjNomk6AA4JYrepytlYh5eOK4sNc7tED2+Eh3BAVblJ29DK
 XrlCE5m8GaXeAVdrJEFDZZegYzEKjH3dGQeZVGSf64ye9vGZp5pZPQK3pSGGRuocVyy3
 YG/ZmZPi2vHcuKpWioLjj/q8RAOZ9YEZ9TMj6ho7xon8JXoUhIQW2jh/a8pa7W48AXOx
 /nFyU9ux2pFVE4G5jDisEu725vFeG0sr0b3/N0VJGrQyBwXwEM1R8M3mP18UkG6eQBsu
 3WUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVGZ7Gkjln4ZIHNwXWhcNgcrVY/9dIOW+9ExsIOy2TPZTE5QrgXWCAKr57StGM5XPFV9rLrfx/U1IycIYLnMue4ep7UYou/SEox8eXRM8r
X-Gm-Message-State: AOJu0YyFdvbcufehmXHEQr1SqxB7I5dnHpW9MxrdH0sb3k8hFclkQiME
 uhMQPsjDW+/oSi3v2QAgsbb8KkEol2b357TAxr+vMtf6k4txNMJB5ZckUEsFi1M23TSBWhDkRl1
 6/qXZPbQ0MZfAdT9Sd826nSK/GjzRktEHM0+z
X-Google-Smtp-Source: AGHT+IHSnbMlQQE9x/zPWpkI90JIlOTBHgyEzLn5RoXQZyiGaSSB2YwhfXwjdqq72pgI+LQF0hGDSafJjuWqavJQlB4=
X-Received: by 2002:a17:906:4742:b0:a6f:393a:9dea with SMTP id
 a640c23a62f3a-a6f393aa161mr132795366b.77.1718129370030; Tue, 11 Jun 2024
 11:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
 <20240610221500.GN791043@ziepe.ca>
In-Reply-To: <20240610221500.GN791043@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 11 Jun 2024 11:09:15 -0700
Message-ID: <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
 David Wei <dw@davidwei.uk>, Christoph Hellwig <hch@infradead.org>,
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
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
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

On Mon, Jun 10, 2024 at 3:15=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jun 10, 2024 at 08:20:08PM +0100, Pavel Begunkov wrote:
> > On 6/10/24 16:16, David Ahern wrote:
>
> > > > There is no reason you shouldn't be able to use your fast io_uring
> > > > completion and lifecycle flow with DMABUF backed memory. Those are =
not
> > > > widly different things and there is good reason they should work
> > > > together.
> >
> > Let's not mix up devmem TCP and dmabuf specifically, as I see it
> > your question was concerning the latter: "... DMABUF memory registered
> > through Mina's mechanism". io_uring's zcrx can trivially get dmabuf
> > support in future, as mentioned it's mostly the setup side. ABI,
> > buffer workflow and some details is a separate issue, and I don't
> > see how further integration aside from what we're already sharing
> > is beneficial, on opposite it'll complicate things.
>
> Again, I am talking about composability here, duplicating the DMABUF
> stuff into io_uring is not composable, it is just duplicating things.
>
> It does not match the view that there should be two distinct layers
> here, one that provides the pages and one that manages the
> lifecycle. As HCH pushes for pages either come from the allocator and
> get to use the struct folio or the come from a dmabuf and they
> don't. That is it, the only two choices.
>
> The iouring stuff is trying to confuse the source of the pages with
> the lifecycle - which is surely convenient, but is why Christoph is
> opposing it.
>

Just curious: in Pavel's effort, io_uring - which is not a device - is
trying to share memory with the page_pool, which is also not a device.
And Pavel is being asked to wrap the memory in a dmabuf. Is dmabuf
going to be the kernel's standard for any memory sharing between any 2
components in the future, even when they're not devices? As in you
expect dmabuf exporters which are not devices to be added to the
kernel? Currently the only dmabuf exporter which is not a device
(AFAIK) is udmabuf, which is used for testing and emulation, not
really a production thing, I think.

--=20
Thanks,
Mina
