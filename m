Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11E680B898
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 04:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B0010E0EA;
	Sun, 10 Dec 2023 03:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5FF10E0EA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 03:48:10 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-5c5dd157f5cso1838804a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 19:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702180090; x=1702784890;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jTjMvUzMQM9T6vvixVNHYaRMSP0ZcmvH/bM1JLogYsw=;
 b=N8BpNzO4EYKNR+Kc1OK0qAAVkncDjgsvzQLpzxbVAWEWgS7fjMvGiWeyC07eyBrsa6
 87IiloAxWaU3E2ZLQMPfgQfNN6pW1eQUZJnCC1E3V9xNOzy1Jjao45tinaSzqbtC8kej
 48HMwfWPMTst6VMu+WG0FcI83pM+DrSp53MaCfKpKTVkbyrAw1iNFrhwXmACP497JBL8
 MgBfbDkycMIX8ahsH86k3f0qZclRGxKBnaO2AR3kHwrPulYqbWUhE011+fg0WCYbA75P
 YwVhXA/kW2NEL+G3O2iTUsnvNRw76XIkYUZ9+kq5cNak7bhgZOrNCkvzMr2vXx9DUNIZ
 svKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702180090; x=1702784890;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTjMvUzMQM9T6vvixVNHYaRMSP0ZcmvH/bM1JLogYsw=;
 b=rM0ucXWZV9b4P+t+tp8PqfU6TvVyP/YYHWR3uo/i4LlEi45NKJrLEbyPgiocvNTfRR
 umaDQFC9fKdq3N2crasQ7wURdP1Q9Nbgn7euMKHFLn3IZZ0mJOfuZJNzDZShQDF9NkmH
 qvytmj6IRiet+CQvHKnImxZ1NQlJjfVZA0zPcWmDpsp6vVkP+N/LiznFCmt1MV9A1jPw
 dduFmQdw//R+21fHw8x4YYQ/bsthWGUeQFzQbIq+1EcvmAo0rzRoo62v48rhfXpE4UtU
 L/IcLhZCzxgPmo0qvMKuji5bePApiJO13W5K5/uFSI+ua8dn001OU4fy8tJv64YbueY6
 Flpw==
X-Gm-Message-State: AOJu0Yzehblj3b2G+trnqgfdMVFS9poUnxdi5QxvvY1+phLelGb5SIuh
 rZ3Pvuv7vd5AIbvtFr0qzqgr4khvY9m6jw==
X-Google-Smtp-Source: AGHT+IEuVYUkbdK82q9MQX/+KKZwtIfK+d+dsTME32So5XP7njZIF7u7LEU9iLCbfAno9hDEov5qyerx5QbU2Q==
X-Received: from shakeelb.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a63:9854:0:b0:5bd:bbb4:5275 with SMTP id
 l20-20020a639854000000b005bdbbb45275mr16828pgo.10.1702180089637; Sat, 09 Dec
 2023 19:48:09 -0800 (PST)
Date: Sun, 10 Dec 2023 03:48:07 +0000
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
Message-ID: <20231210034807.kqspmykhxpkdtoiy@google.com>
Subject: Re: [net-next v1 00/16] Device Memory TCP
From: Shakeel Butt <shakeelb@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:52:31PM -0800, Mina Almasry wrote:
[...]
> 
> Today, the majority of the Device-to-Device data transfers the network are

'the network' in above can be removed.

> implemented as the following low level operations: Device-to-Host copy,
> Host-to-Host network transfer, and Host-to-Device copy.
> 

[...]

> 
> ** Part 5: recvmsg() APIs
> 
> We define user APIs for the user to send and receive device memory.
> 
> Not included with this RFC is the GVE devmem TCP support, just to

no more RFC

> simplify the review. Code available here if desired:
> https://github.com/mina/linux/tree/tcpdevmem
> 
> This RFC is built on top of net-next with Jakub's pp-providers changes

no more RFC

[...]
> 
> ** Test Setup
> 
> Kernel: net-next with this RFC and memory provider API cherry-picked

no more RFC

> locally.
> 
> Hardware: Google Cloud A3 VMs.
> 
> NIC: GVE with header split & RSS & flow steering support.
> 
