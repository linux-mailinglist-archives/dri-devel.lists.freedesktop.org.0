Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52E92CF54
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 12:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89FE10E71F;
	Wed, 10 Jul 2024 10:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OOKt2O5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C30910E723
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:37:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so3794856f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720607839; x=1721212639; darn=lists.freedesktop.org;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vldLU5ousstfmDh5bnJGfW4ITCUolQrrvfqTIfAcNhk=;
 b=OOKt2O5vicVF9IkGLaZc7JYt/VPBc9QgWNWOLCYYgOt14qAe+LJI2pUZpQVdHYpm+T
 qJzxPFON/dVyV+RTN+X2TrGDoj99sPIFWEkMdCgJzmL0H8Z51EaBDP9nSIJSP/AoQi9e
 OukCXA+g4AWxu6xGlKNV5D/jLj/MCIUNWrWeSiJcBUDnTYMO+vSIB2ZNKQBBW2PfEff0
 lEbFe2iK9AHrEPJjRFGYLL835lAzJSPiiOSqPG7z4oPmrbw7yWQUQyHMMlFJF0zoD8RJ
 PPoqQ8toPIh68tdIwxZayxCksVsgQM0qQWNk/u9aR0h6p+Y6SNo854tEuAKhVRx/WHZy
 5zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720607839; x=1721212639;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vldLU5ousstfmDh5bnJGfW4ITCUolQrrvfqTIfAcNhk=;
 b=KWPgZzM2ZV8QoQ/cobqUweF3faWsMHBEJeankq7nFqliDdNZiRDHe9IKO21B4MGs2+
 pgV/uSLzBb6OSQIQRgAFwsoNdvbg/NeCzorFBMUs6ntJV13OrTgybN8YRLx1m0M4Z145
 WfzLaU5VVggGPql7GIIuEJnoQBeaUiPp3GI1Q+tRtcFIewAxGV7qiEeqyNFQIhvRtddc
 BxtKEu4f8McyPu7V+BeR7G04cmpwZXvQLQzn5jcnoYLQDCk6icuujTJQCqoV4acUE4sE
 077IHr+9d8U6G0i/dBloQTCF6xefW2ga9yZ7YgwoN2zH/OXiU4qMRhMDVmsZL30N429C
 rd+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ZFO7CWMLkzFHaGVFByR7wxO3y4f55O/z4Rstcl2vI0n3OBog0mlbYZTiyQAFsS8QJwXO22QQS+lXnk+DSj465H8yrSgPV83UOkgsbpze
X-Gm-Message-State: AOJu0YxrgJQOmLG4Wi9mQ1ygJ6yDVrKVqRM1aocThPUOm1TShE+Ruvx9
 mJ+VFsZCyNd5Prpml6QueUxRlk+Bmbpw/o7QfbITofGexReQ6HOZ
X-Google-Smtp-Source: AGHT+IHfVxi0Lmy20qi3zZkkAs93779qbLSUYFgab3guGNLSJuv1zXb2yWVvs5PzjNax6/VrOLGUkw==
X-Received: by 2002:a05:6000:e90:b0:367:9748:ee7f with SMTP id
 ffacd0b85a97d-367cead931emr3298090f8f.65.1720607838413; 
 Wed, 10 Jul 2024 03:37:18 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:d1a7:2644:c75e:c5ee])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab6d3sm4896005f8f.112.2024.07.10.03.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 03:37:17 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,  linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Richard Henderson <richard.henderson@linaro.org>,  Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>,  Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>,  Jesper Dangaard Brouer
 <hawk@kernel.org>,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Arnd Bergmann <arnd@arndb.de>,  Steffen
 Klassert <steffen.klassert@secunet.com>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  David Ahern <dsahern@kernel.org>,  Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>,  Shuah Khan
 <shuah@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>,  =?utf-8?Q?C?=
 =?utf-8?Q?hristian_K=C3=B6nig?= <christian.koenig@amd.com>,  Bagas Sanjaya
 <bagasdotme@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,  Nikolay Aleksandrov
 <razor@blackwall.org>,  Taehee Yoo <ap420073@gmail.com>,  Pavel Begunkov
 <asml.silence@gmail.com>,  David Wei <dw@davidwei.uk>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Yunsheng Lin <linyunsheng@huawei.com>,  Shailend Chand
 <shailend@google.com>,  Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>,
 Stanislav Fomichev <sdf@google.com>
Subject: Re: [PATCH net-next v16 02/13] net: netdev netlink api to bind
 dma-buf to a net device
In-Reply-To: <20240710001749.1388631-3-almasrymina@google.com> (Mina Almasry's
 message of "Wed, 10 Jul 2024 00:17:35 +0000")
Date: Wed, 10 Jul 2024 11:30:12 +0100
Message-ID: <m25xtd1qvf.fsf@gmail.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-3-almasrymina@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Mina Almasry <almasrymina@google.com> writes:

> API takes the dma-buf fd as input, and binds it to the netdevice. The
> user can specify the rx queues to bind the dma-buf to.
>
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
