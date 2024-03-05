Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93648727BC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 20:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017410F1C1;
	Tue,  5 Mar 2024 19:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="cPMvx4Zv";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="JlMxRde3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wflow2-smtp.messagingengine.com
 (wflow2-smtp.messagingengine.com [64.147.123.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1910F1C1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 19:40:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.west.internal (Postfix) with ESMTP id C01C42CC021F;
 Tue,  5 Mar 2024 14:40:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Mar 2024 14:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1709667607;
 x=1709674807; bh=/FrVbuG+NmXdRaEhMkfyj7JdlCIJB5MvqaHthubPGLI=; b=
 cPMvx4Zv2YoBIkL8xsE7Kw8/B90EvpPWMuFqT908td/fDqbbJ/EkWQFzK0Hy3reO
 wy/kOMD4gaX5VmyMxrKqFBE/7DSCRTUsKCSEpFUH8GJGKnXTjgFK055Sy4Mc0atB
 xVfzXYkCV8bCAUP6T5xsoBB67HXYLaJ86uAT5/JrCTrBzClb4O87cfVyUkzgMYLe
 ceIazN91U9vao0obIvn24T7gpfGeNbefC5M2MqvzRBG/n+HfgTSLqx9tsH6eVsrs
 kGPxOc3QSeh/ewvkWq493K+TzTsJTYL+BYkeZDTGBvpkILIUxIp80/mk/CS9ZEmL
 6GNNgHPfBR7YI0JylkqKgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709667607; x=
 1709674807; bh=/FrVbuG+NmXdRaEhMkfyj7JdlCIJB5MvqaHthubPGLI=; b=J
 lMxRde3ko4PJQTtjaUXgAei17Q/G4wbmF53bN5Taddc0ZMMr1vEkooyUpR5UCz2/
 sABteFvwgOFD4ygXhGI5F9wkZQp/YnFYKPkN3EoPTzLLBkUdyBZZ5Rymwi2u901b
 pxUZCM2V5zkwLsZsCiBa3cVZQLqzO+IEI8eiEq+QEAlSgkIm0aZ3x/rI4XX6yWyL
 xluEz90B+1jW1nyo9QMdzbeBxn8+M+3Xwh60Od7G6bz1SIAOaRtH94ZbQ8SeHZxJ
 yDNp6Pgy5EOnYneBDlAAPmQMG7H8br2SUKfhLK5cIsx0pzEq1Vx+gv+it257b1HG
 L2NhPYDf9sBgom+tdewRQ==
X-ME-Sender: <xms:FHXnZQFzCqt-JaImtI40w0_QiFy9HkkcV9oC785SH8GBx1H1HvOkCQ>
 <xme:FHXnZZX5p2EzAAScXeycJjZ5opYEuWOuM1lQlBmR9enRNj9JgfxSg8PFlooVUsyLL
 7jffEYKtEZRX2FMTQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheelgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FXXnZaJ6fcFaDhPVsmb7HXuXDRhO4pChJ6FsGuJV2oBbDnsj1e4tvw>
 <xmx:FXXnZSEv1uxsvg7h2f-giJzRl1QHURRUvbBFRz7hDUDoJWesaAdxCw>
 <xmx:FXXnZWV7OZJ6FdhEbAoskQw6BQK8iXDV649C39D0kdIKBUOopCeYvw>
 <xmx:F3XnZZa6NaU2n6qyY4IJDUQVU0cMTgfowBETn8TnsJKRwBU0LMthDLjDaT0oVsX6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DD7D2B6008F; Tue,  5 Mar 2024 14:40:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-208-g3f1d79aedb-fm-20240301.002-g3f1d79ae
MIME-Version: 1.0
Message-Id: <b7ef0a2b-40e8-4fac-8396-fe0f394bf0e3@app.fastmail.com>
In-Reply-To: <CAHS8izPbBHz=rr65ZtCy-+OGPbXXaY66_5EFSXw2bbhfGweRWg@mail.gmail.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-13-almasrymina@google.com>
 <a2d926be-695a-484b-b2b5-098da47e372e@app.fastmail.com>
 <CAHS8izPbBHz=rr65ZtCy-+OGPbXXaY66_5EFSXw2bbhfGweRWg@mail.gmail.com>
Date: Tue, 05 Mar 2024 20:39:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mina Almasry" <almasrymina@google.com>
Cc: Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andreas Larsson" <andreas@gaisler.com>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@google.com>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "David Ahern" <dsahern@kernel.org>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 shuah <shuah@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pavel Begunkov" <asml.silence@gmail.com>, "David Wei" <dw@davidwei.uk>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Yunsheng Lin" <linyunsheng@huawei.com>,
 "Shailend Chand" <shailend@google.com>,
 "Harshitha Ramamurthy" <hramamurthy@google.com>,
 "Shakeel Butt" <shakeelb@google.com>,
 "Jeroen de Borst" <jeroendb@google.com>,
 "Praveen Kaligineedi" <pkaligineedi@google.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "Kaiyuan Zhang" <kaiyuanz@google.com>
Subject: Re: [RFC PATCH net-next v6 12/15] tcp: RX path for devmem TCP
Content-Type: text/plain;charset=utf-8
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

On Tue, Mar 5, 2024, at 20:22, Mina Almasry wrote:
> On Tue, Mar 5, 2024 at 12:42=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Tue, Mar 5, 2024, at 03:01, Mina Almasry wrote:

>>
>> This structure requires a special compat handler to run
>> x86-32 binaries on x86-64 because of the different alignment
>> requirements. Any uapi-visible structures should be defined
>> to avoid this and just have no holes in them. Maybe extend
>> one of the __u32 members to __u64 or add another 32-bit padding field?
>>
>
> Honestly the 32-bit fields as-is are somewhat comically large. I don't
> think extending the __u32 -> __u64 is preferred because I don't see us
> needing that much, so maybe I can add another 32-bit padding field.
> Does this look good to you?

Having a reserved field works but requires that you check it for
being zero already, so you can detect an incompatible caller.

> struct dmabuf_cmsg {
>   __u64 frag_offset;
>   __u32 frag_size;
>   __u32 frag_token;
>   __u32 dmabuf_id;
>   __u32 ext; /* reserved for future flags */
> };

Maybe call it 'flags'?

> Another option is to actually compress frag_token & dmabuf_id to be
> 32-bit combined size if that addresses your concern. I prefer that
> less in case they end up being too small for future use cases.

I don't know what either of those fields is. Is dmabuf_id not a
file descriptor? If it is, it has to be 32 bits wide. Otherwise
having two 16-bit fields and a 32-bit field would indeed add up
to a multiple of the structure alignment on all architectures and
solve the problem.

        Arnd
