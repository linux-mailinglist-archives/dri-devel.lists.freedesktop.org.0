Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CE80AD09
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 20:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53E10EB02;
	Fri,  8 Dec 2023 19:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A280910EB02
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 19:31:16 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4b3288df490so337277e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702063875; x=1702668675;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWu+J+wzMOcih150vf6YNmhjcZNaZMBMCrHoJTVq0Uw=;
 b=oQ7srfTes6YkWWkmhTdqsrJTUpCcNscid/z8NAjfd/yWJ6XBWcyr2I8dQRVPt5hL4d
 IkfSGr5tXu7czCweWY2ORrXBx3aL7TQ7P7hafwJnnE4Kwc/T5cURS34ybLqZTtJnqO1T
 6bMoBn/YUdQbNxBGmxnUUeUphBXi6y72U0KFvzvSe0TL+xILRjlZBB2NumJcgBVzuB4L
 n95AQymBTSQubJyWxsM8kK/696zN1ML0jGRs9xzefH79g8tqa/qTmOEgirBVKqKkSTwF
 PhLoVwf+7pFKkU4tWh3BKS//xTLt9FiaoqJFSMFuIv6ejym8v6bENf+UJGXAdyWymXoi
 t/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702063875; x=1702668675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWu+J+wzMOcih150vf6YNmhjcZNaZMBMCrHoJTVq0Uw=;
 b=bUADsSGAoHcdpBT+MwlQUQ1nK6Q/esGs9TF/KcbDWTENHaaKazD09OOHQPy5nM4cZK
 HZx11PR9YHPW5nEhue3S8UmclaBskesp4zWfEsFWTg3P1/DQWrl+jGKjEyM0v7Sg3yJq
 XCKro99YvH4fLetqrbs0SpiDDxecwSu0C0a1VxN3GTXrCw5Fsm7WG2lgAVGmdUR36p7T
 ZGTZEyq1MhYsbgjcMg5tngXsB7vK9FAM/Vi7m0g3CH8pWrf6PaY+CiLV8F5otOmJLtDA
 WYzAUoimgjMRngFdwsaF1jfHFTI7NNlVHzCibhtWwpP/hIVXpEd/QpG+BFKIIkqW7d4A
 rb3g==
X-Gm-Message-State: AOJu0YxJqVDYLypbGjJQnX20nTaKZx80Q+qCreEZrttISEQcwkO+y+/Y
 ycTkuPgPhJ/hVnWIABpO3atqqgpGM+MQSaQlZGvFXA==
X-Google-Smtp-Source: AGHT+IEWy2ZoASGB97Xf4UzepNASdfhsiRufEtATUoKuaLdGqOq89E4y/cKAIuTMSGCSkffzh0Lc4oz7kiKBOoq4yro=
X-Received: by 2002:a05:6102:3ec4:b0:464:40b2:e59f with SMTP id
 n4-20020a0561023ec400b0046440b2e59fmr628329vsv.32.1702063875124; Fri, 08 Dec
 2023 11:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <3fea9ae9-e9e6-4ba5-812b-2775a6ed9e6a@kernel.org>
In-Reply-To: <3fea9ae9-e9e6-4ba5-812b-2775a6ed9e6a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 11:31:01 -0800
Message-ID: <CAHS8izOc05jQEhU+s6FZtBN4fynUwVPrKsXBtjYo-X8fHQXOjg@mail.gmail.com>
Subject: Re: [net-next v1 00/16] Device Memory TCP
To: David Ahern <dsahern@kernel.org>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 9:57=E2=80=AFAM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 12/7/23 5:52 PM, Mina Almasry wrote:
> > Major changes in v1:
> > --------------
> >
> > 1. Implemented MVP queue API ndos to remove the userspace-visible
> >    driver reset.
> >
> > 2. Fixed issues in the napi_pp_put_page() devmem frag unref path.
> >
> > 3. Removed RFC tag.
> >
> > Many smaller addressed comments across all the patches (patches have
> > individual change log).
> >
> > Full tree including the rest of the GVE driver changes:
> > https://github.com/mina/linux/commits/tcpdevmem-v1
> >
>
> Still a lot of DEVMEM references (e.g., socket API). Any reason not to
> move those to DMABUF?
>

In my mind the naming (maybe too silly/complicated, feel free to correct) i=
s:

The feature is devmem TCP because we really care about TCPing into
device memory. So the uapi/feature name retains devmem.

dmabuf is the abstraction for devmem that we use. In theory someone
can come up with a driver that doesn't like dmabuf and uses something
else instead, and the devmem TCP support can be extended to support
that something else. Functions that handle specifically dmabuf and are
not generic to support general devmem are named accordingly
(netdev_alloc_dmabuf/netdev_free_dmabuf)

page_pool_iov is a generic type to support generic non-paged memory,
functions that are supposed to handle any generic non-paged memory and
named accordingly (page_pool_iov_get_many).


--=20
Thanks,
Mina
