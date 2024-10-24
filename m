Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37029AE84E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D79810E293;
	Thu, 24 Oct 2024 14:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a48AugoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE610E293
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:22:33 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso134213466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729779752; x=1730384552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0pSqi+3PC05VeA94dhrf62qDJWgidvaFzLSlQCgbK+0=;
 b=a48AugoN+p/cFzzMZj4+CNFtnlJlCt5CZ2t7sXj5s+T34C2zGIW3u9nXW/BYL7/Fjt
 pKPz7kr+qIp6KkqchKm++hlv3BP06C/8BDuJHiDYmWixgcKTZiI83vjoaAdIne413biy
 TKWDr+PSLgJ/t01HvFam3YE/b8uRly5VeQSHnFE98DZOWZ/Z4izcsXS8h9jWXQPWL2Fh
 k3Tfnyzf0UWADmv7TEIr2zqzFBYQayt3nlhGtOBy+YF3Tc0f++CRpKiS2X5K0PgL44hb
 UQQOpaS0ZQTFZnu6oJYNDlnDIvkQQy2xwomyqL/ps38o9R+ixuPK8bTVmwNmqmAHw21y
 SoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729779752; x=1730384552;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0pSqi+3PC05VeA94dhrf62qDJWgidvaFzLSlQCgbK+0=;
 b=V8dJNwCxm3b2wrUFFuSdMgLtb/YeX9CgvoYXe/vg0yDIwhP2SqDOrY0PNqfFUQ0jzy
 vQo9rlN1xIUeK/8CLBgzdLqkWzXlSyXbeBWnrhkIHDcUVM4Q8TOqhwlzFyjfjjt5XVNp
 DuJ+qDdA8AK6BTrkMtUj4o72g7ezH0PKRO7EbxZHd+YbDnBBVCZ/XhVzthl0SuZU0Xct
 RFAaoUn1qTUMRExX9nLNvAglIdpta1nG0ZyNqfdRjCu2rQuz7hTHMCdGFZPXaXiiGW2A
 CXTqGnKh2gWKFBGZ+y7FLYVQO9DaVxFmZZ+WfpPM4h2PyHkg2WIVwcAv0KRiaFK8XzJ7
 gRfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFtY8DzSUXdZWwh+K0l3UndsZxiLPVXb8JOd/nrzQrc2tFSninqDOSjB8AUmlA6cb5xe0jD2YZgls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEv+nIsG39ZTc+spP9Gmyu3uBiJWdYNIbqVHtkwPJlEV3RrC7W
 RKQcycb8aDtzhFAxvAFjAJ1iQUtsaGyu6DyiYttHMOR/8Q5/QcUr
X-Google-Smtp-Source: AGHT+IEhWU2BvgzQwO2fdoa0iaeVhQCobTSzJZ6wAch+t8B6eIAoD1nCu9Hb/QFiEcfBfYcdzO7TPA==
X-Received: by 2002:a17:907:7e88:b0:a9a:2afc:e4cc with SMTP id
 a640c23a62f3a-a9ad2861ac4mr203963166b.58.1729779751939; 
 Thu, 24 Oct 2024 07:22:31 -0700 (PDT)
Received: from [192.168.42.27] ([85.255.233.224])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6ef1sm618829266b.38.2024.10.24.07.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 07:22:31 -0700 (PDT)
Message-ID: <a6864bf1-dd88-4ae0-bc67-b88bb4c17b44@gmail.com>
Date: Thu, 24 Oct 2024 15:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] net: generalise net_iov chunk owners
To: Christoph Hellwig <hch@infradead.org>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org,
 netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, David Ahern <dsahern@kernel.org>,
 Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <stfomichev@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20241016185252.3746190-1-dw@davidwei.uk>
 <20241016185252.3746190-3-dw@davidwei.uk> <ZxijxiqNGONin3IY@infradead.org>
 <264c8f95-2a69-4d49-8af6-d035fa890ef1@gmail.com>
 <ZxoSBhC6sMEbXQi8@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZxoSBhC6sMEbXQi8@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/24 10:23, Christoph Hellwig wrote:
> On Wed, Oct 23, 2024 at 03:34:53PM +0100, Pavel Begunkov wrote:
>> It doesn't care much what kind of memory it is, nor it's important
>> for internals how it's imported, it's user addresses -> pages for
>> user convenience sake. All the net_iov setup code is in the page pool
>> core code. What it does, however, is implementing the user API, so
> 
> That's not what this series does.  It adds the new memory_provider_ops
> set of hooks, with once implementation for dmabufs, and one for
> io_uring zero copy.

First, it's not a _new_ abstraction over a buffer as you called it
before, the abstraction (net_iov) is already merged.

Second, you mention devmem TCP, and it's not just a page pool with
"dmabufs", it's a user API to use it and other memory agnostic
allocation logic. And yes, dmabufs there is the least technically
important part. Just having a dmabuf handle solves absolutely nothing.

> So you are precluding zero copy RX into anything but your magic
> io_uring buffers, and using an odd abstraction for that.

Right io_uring zero copy RX API expects transfer to happen into io_uring
controlled buffers, and that's the entire idea. Buffers that are based
on an existing network specific abstraction, which are not restricted to
pages or anything specific in the long run, but the flow of which from
net stack to user and back is controlled by io_uring. If you worry about
abuse, io_uring can't even sanely initialise those buffers itself and
therefore asking the page pool code to do that.

> The right way would be to support zero copy RX into every
> designated dmabuf, and make io_uring work with udmabuf or if

I have no idea what you mean, but shoving dmabufs into every single
place regardless whether it makes sense or not is hardly a good
way forward.

> absolutely needed it's own kind of dmabuf.  Instead we create

I'm even more confused how that would help. The user API has to
be implemented and adding a new dmabuf gives nothing, not even
mentioning it's not clear what semantics of that beast is
supposed to be.

> a maze of incompatible abstractions here.  The use case of e.g.
> doing zero copy receive into a NVMe CMB using PCIe P2P transactions
> is every but made up, so this does create a problem.

That's some kind of a confusion again, there is no reason why
it can't be supported, transparently to the non-setup code at
that. That's left out as other bits to further iterations to
keep this set simpler.

-- 
Pavel Begunkov
