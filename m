Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF56871E30
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA67E10E489;
	Tue,  5 Mar 2024 11:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="gT9ny6Ox";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="r7l5RfFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CE310E489
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:45:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id C5C811140119;
 Tue,  5 Mar 2024 06:45:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Mar 2024 06:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1709639153; x=1709725553; bh=L0V6fINBaj
 l5FUIjF3rvm+rXcNcFq8LiVT+eqTz8+4Q=; b=gT9ny6OxXnueQI9xdCBEag7HKO
 FdCh+erTgJFfAkSJGEeHo3o/CQSkSpNTCQIWB3qHthoZAuHpFNa3Yt2mufh5t8XM
 RkZPoq58i8sQm7QM6k/0UeVnLtSyrqcTvMNlirly12svIohTJGyBpswiVN+4f2nu
 a4Gdmra+RLecfGkvMKV1PStNwiBGeT1YCi3G7T9x+UOhkojR3Vckx7QDUlsLBJrh
 GnA4Jml2c6SDIleCfF0MobGJNkiwYtCpUmXixR4ndlOM77jGOYejxIbDMc9wczNn
 iZ7DAHPx1RtIdjt2UZe+LmMGAeDQIrSxYAiCxR8NGAxvx6HNwGSgGbrfamsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709639153; x=1709725553; bh=L0V6fINBajl5FUIjF3rvm+rXcNcF
 q8LiVT+eqTz8+4Q=; b=r7l5RfFfQCs0KXaQISa21e3Vj0J8W2dG2BZKhtyZbzoa
 xnJHRqLWqDsctD2yeVkohp91MvN0iM/utH2nrY3ZXVonoCPFgkGl4+xB8OrZ+b9C
 XEUEZLCDl8qUJgEzjwQ9t/ozI5aWIhxa1B1Z/Q9Nji3FmFm3ig0Sr9uwe/RVW8Jv
 iI2wHoYdoea+0rd3PPTAyAp9r8DEXTgv5b8fHO8rKJT0zYadppNqGkTzDOJXWjVE
 X673GgaMTas3U54//gV44g6bOwkC0Ldk4+1cJ+vMpiLh2x1Ox0qVnLMvqDHdeNjm
 wpzwqM+OQeVf29lpC0ShM8xvAcsSMVMTFeeWazTa9A==
X-ME-Sender: <xms:8QXnZY1TKoSsgzkFqjvFm4sCKvIM8vRTCf2iLFpBW_rz77-zVucHtw>
 <xme:8QXnZTFdCOHvudbmAbFG1q2XtwcQz8m7HePqTFkmydfa6aMZvb8xbwiMcPkBa9OSh
 QI3wVL_IgjyfAy3WtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:8QXnZQ4M1rLZ00uUutjr9FMXuklVvsc3rxj9vS5XqKuTDeV_HGHlpw>
 <xmx:8QXnZR0iw_m4FxVYsfGb7IBGYE9BtOm6uxR54nz4R68d3WFtuHybbQ>
 <xmx:8QXnZbFYu30BCPH0Qo2KVS5wDMPAdKmgxzoHpEp3zyOQucxb2wTb6A>
 <xmx:8QXnZebooVWsndEZ83Gw-Ut3TBDL0rhPgLrtWUsZkkACk0Pz3WkTrQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A6EEB6008D; Tue,  5 Mar 2024 06:45:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-208-g3f1d79aedb-fm-20240301.002-g3f1d79ae
MIME-Version: 1.0
Message-Id: <b28dfaba-a5d3-4c33-a07c-9d991c0235a2@app.fastmail.com>
In-Reply-To: <20231208005250.2910004-5-almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-5-almasrymina@google.com>
Date: Tue, 05 Mar 2024 12:45:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mina Almasry" <almasrymina@google.com>,
 "Shailend Chand" <shailend@google.com>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Jeroen de Borst" <jeroendb@google.com>,
 "Praveen Kaligineedi" <pkaligineedi@google.com>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "David Ahern" <dsahern@kernel.org>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 shuah <shuah@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Yunsheng Lin" <linyunsheng@huawei.com>,
 "Harshitha Ramamurthy" <hramamurthy@google.com>,
 "Shakeel Butt" <shakeelb@google.com>
Subject: Re: [net-next v1 04/16] gve: implement queue api
Content-Type: text/plain
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

On Fri, Dec 8, 2023, at 01:52, Mina Almasry wrote:
> +static void *gve_rx_queue_mem_alloc(struct net_device *dev, int idx)
> +{
> +	struct gve_per_rx_queue_mem_dqo *gve_q_mem;
...
> +
> +	gve_q_mem = kvcalloc(1, sizeof(*gve_q_mem), GFP_KERNEL);
> +	if (!gve_q_mem)
> +		goto err;

[minor comment]

The structure does not seem overly large, even if you have
an array here, I don't see why you would need the vmalloc
type allocation for struct gve_per_rx_queue_mem_dqo.

   Arnd
