Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89738810815
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 03:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6367810E23D;
	Wed, 13 Dec 2023 02:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7433B10E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 02:19:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 90941CE1144;
 Wed, 13 Dec 2023 02:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD23C433C8;
 Wed, 13 Dec 2023 02:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702433950;
 bh=DQPF3GcanIRKcaZKx1G5ZSV6kAy0I6t5QN8G9OuMZdM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DyCeS9GmtbFGFSsFn5YSGcJgY03zFug1iziwTrwVmg/ZlNI8m4c58IveouykxEdqa
 EMnEhzuZ63StLiesj5cSjbJf4TmG4ZBa1yJ7JCzsdawYg44TMs0dyNRoLJ1GELn1tz
 mZ0ttW2DALNof274ibmywvx6VjyQmwZ21hJje2+EzxdBAhAbf2HCJYKHiiZ+1qP7MN
 awBRzsmBQJpRFMscNENawsc7TC/PSZAjpMEzMokycEPjSXZZ9oUEEmo+Oekfpv6dsz
 Lulob+ZQQMb5SPxcQHqSMtRg1Oa5btnY+jl5DG0GR/t04qzTQhWGqHRNhfn4l51+iE
 FdNU7DP2aIKOg==
Message-ID: <cd464bae-af47-42f1-ac9f-9620137ede89@kernel.org>
Date: Tue, 12 Dec 2023 18:19:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <20231212122535.GA3029808@nvidia.com>
 <CAHS8izMVMx0fpT=dWsnD7piqs1g7Fam8Xf5dK3iOFNxeOQD9vQ@mail.gmail.com>
 <20231212143942.GF3014157@nvidia.com>
 <CAHS8izNHtemjjkMf43grCHP1RZ=2UFiMtgea0M6+PaAgC=DDMQ@mail.gmail.com>
 <20231212150834.GI3014157@nvidia.com>
 <CAHS8izMdKYyjE9bdcFDWWPWECwVZL7XQjtjOFoTq5_bEEJvN6w@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izMdKYyjE9bdcFDWWPWECwVZL7XQjtjOFoTq5_bEEJvN6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shailend Chand <shailend@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/23 6:09 PM, Mina Almasry wrote:
> OK, I imagine this is not that hard to implement - it's really whether
> the change is acceptable to reviewers.
> 
> I figure I can start by implementing a no-op abstraction to page*:
> 
> typedef struct page netmem_t
> 
> and replace the page* in the following places with netmem_t*:
> 
> 1. page_pool API (not internals)
> 2. drivers using the page_pool.
> 3. skb_frag_t.
> 

accessors to skb_frag_t field are now consolidated to
include/linux/skbuff.h (the one IB driver was fixed in Sept by
4ececeb83986), so changing skb_frag_t from bio_vec to something like:

typedef struct skb_frag {
	void *addr;
	unsigned int length;
	unsigned int offset;
};

is trivial. From there, addr can default to `struct page *`. If LSB is
set, strip it and return `struct page_pool_iov *` or `struct buffer_pool *`
