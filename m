Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3D8C5A1D
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE5F10E134;
	Tue, 14 May 2024 17:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hR38xZBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9710E134
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:15:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a599c55055dso55747966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715706934; x=1716311734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JphrTnGE11d/hcgLanrvMdnjxLSu0oYp2e2Hwwop9sM=;
 b=hR38xZBTtG+e+WOUr53gVbSB/rKworu31Zu8yu7zQLNvTapYJvOk9gSTjCE4sgnlKL
 P2ktDzf6zB5c9JxSgeVWsat+WL4nHs835woqUGs9+Yoxw9V5aPfjnSoqF5MmEf3lMZBq
 IBWFrBf8mENgTGDl5dpd92OtJck9D2Am8EEEQz1x5iat33wuWk/qtGDqXlMOEDcZh/hB
 5c3wZhjfJB5BHYpRpbC08/eNsfiIWRmhvc2aPhaOZDUkMBu5Bbwrou6piJWcsvnY8FcE
 E+MJgF4HKyCJ0tsLeDLeabU3u6GrHjTobTvITV0xP4xtohkeuKBMECVG8nwX29EprGx2
 xYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715706934; x=1716311734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JphrTnGE11d/hcgLanrvMdnjxLSu0oYp2e2Hwwop9sM=;
 b=eyvWGqQLrud5a2ARmLg9v499W+UrO8bNXRiSKoeHxhkndO8nW+kPMcsB5qESogs5Rv
 TZtO+o+IfNbwRTYyyrS0SQTuzQ9rn4sMH+vwIotyLwFGvHtR+FYtajSS+hdwyy8jS9Zq
 RpwmhZWsJBnWKyQCrkGXA37TeS5KG8LG0oRK4eqG9np05HhkmexFNQ2GVutfBwfqYRDL
 C7D33FNRCz82p7ExJjIirvF72+w3GQ1MajCY5ayZQ39fQF0cz3h0nN9ozmuhepj4miHB
 G2V78B7XJqcP44Zz78Hulwc5rrwQGcLVj57mJhxsTgGw2PHyWAEgW9IMv7Aam0WmqH4F
 GcZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaiCOmgylbHZVWJMMrvueIK73QOgkv1afNFqPjic6Q5b+avXT0Z69z8hp/cuNMIUztKtT+xy9/9zIqSiNV3YuGTDHzBRYptrQlmTY3N19y
X-Gm-Message-State: AOJu0YzCtADujSToopMJE/NnRsU9euYBjsiXukyHHSyNyo1/YiAgg8la
 KYVJgw8OIkCLUMl9Y/4OesfYnvN/12vmupNFa64utVXcLeQFRr/ZM0149BOLzWqVm+CoAZndF7Q
 xGSRKKLYd8vLgsyE/D+CiUfN6KfiNpZUtwlxe
X-Google-Smtp-Source: AGHT+IEwOQpqw4ZMKIlz9X6LbLlfb8P5lzGCaO4YFYW5AVzaTN7hWpB9KsS7Ts3tYb3EwJ+JwuI+UCM3+u1xlOEFWOo=
X-Received: by 2002:a17:906:714a:b0:a5a:8ac4:3c4c with SMTP id
 a640c23a62f3a-a5a8ac43e15mr130162166b.68.1715706933383; Tue, 14 May 2024
 10:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240513163114.52b44f66@kernel.org>
In-Reply-To: <20240513163114.52b44f66@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 14 May 2024 10:15:18 -0700
Message-ID: <CAHS8izMH9223wbHQk8zbtqP-hfydvqkmo3k3BYeWYrpkuVcnVw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 00/14] Device Memory TCP
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
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
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
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

On Mon, May 13, 2024 at 4:31=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 10 May 2024 16:21:11 -0700 Mina Almasry wrote:
> > Device Memory TCP
>
> Sorry Mina, this is too big to apply during the merge window :(

No worries at all. I'll repost once it re-opens with any feedback I
get in the meantime.

--=20
Thanks,
Mina
