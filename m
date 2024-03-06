Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A28739F5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FD510F0A0;
	Wed,  6 Mar 2024 14:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mj7C0mhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4210F0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:59:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33dcd8dec88so4430728f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709737178; x=1710341978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k3KTBSf8CRlcIZfoKRwDp/o4UHKfshbIbaLHqnkKL/Q=;
 b=Mj7C0mhJZdXrm/7Y/hs4o7a+TcqxS7t52TUPRH5PTrnnmspFTjaVFdmyTbZPVzpfQ2
 TcB5j49l4VNuVd7wMHWDxL4kVFoDi7S1ftc2+oVVRh5U3wGbBV0mHl7uokPqWZ2BD2JS
 Fh7wqOjUDY39+8irhuQwMEHjm1JEZMZ0nj6iObzD2Phurim+IWwMyf5EEf28O6NDvqqX
 lBAO3IYCdNYQI4kByVoX5ZidXn7qVE3Xs4rbptUQy5KL367B2Fs29aPvBdGOkFkTOKhB
 bzg1pAowEd1y8hzP4P/Y0LPMmytJT5E/KeCKxpDZjPEw7MMIQfmPJM2eW7O9gNH87F0W
 cn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709737178; x=1710341978;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k3KTBSf8CRlcIZfoKRwDp/o4UHKfshbIbaLHqnkKL/Q=;
 b=DSH9laDqFY062GQDz/3OxiP/8m8ZN+CEYuK2OFFj4SATYofhmqXq8zTQhW5DtWerXe
 fIbvW1ClzaECSTiFSZ7mJU9O3L91psXHCEUmG1FW2MmHs3C2KLTVl9L0S0PUHjy1FZBC
 tdpPDyoZPuUClAclwdojTXhVh5dh9nR2BKe4f3TZ8NnZ4oZVaAzg3Qq/sk3jB7jRbx6H
 mNbgkB0UYBJx/E3kMiUxWvshPW9jfmdNOqRplrHKN7zyK6ybYgUYrY3/JJJP4ooa0DsM
 XoRVVi0ofq3LPA9c2xZNZiEUqdxTwhidQ3CNKRM98vwhMAETBvQknxYS1qbaPsmSQbqf
 IgDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUsZq+z8XpIr1JMsEZFmEoFiantAM4r+IZa8T1IkLNpanUT61jghPeD5H/0K7eHOjREz/r9aw7qMh2waS8fXI+z7Xirs7OGRqCVzV+OjQ3
X-Gm-Message-State: AOJu0YwlBxfIVjjZuuB8C04Sb/uTvQxgzB3C68SP2x9Z+tdBiLDvuVf1
 Qto0lZY3zEK59K3L2bTtZOrxPdIkoRNHVBvx1X6buGo+bSIOEAq9
X-Google-Smtp-Source: AGHT+IFqyav+emKmFSd0bSOzFBUFGtQwTCEQWXrbswWn1syNw+koJNQ7CeSt912Wgj47JjnPQnfG0g==
X-Received: by 2002:a5d:6b4a:0:b0:33e:1b80:ae95 with SMTP id
 x10-20020a5d6b4a000000b0033e1b80ae95mr10870719wrw.11.1709737178481; 
 Wed, 06 Mar 2024 06:59:38 -0800 (PST)
Received: from [192.168.8.100] ([85.255.233.174])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d58ea000000b0033d4cf751b2sm17698519wrd.33.2024.03.06.06.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 06:59:38 -0800 (PST)
Message-ID: <b85b36bd-7082-47a5-bf46-50cff8eb60be@gmail.com>
Date: Wed, 6 Mar 2024 14:58:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 09/15] memory-provider: dmabuf devmem
 memory provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-10-almasrymina@google.com>
 <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
 <CAHS8izP_PzDJVxycwZe_d_x10-SX4=Q-CWpKTjoOQ5dc2NSn3w@mail.gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izP_PzDJVxycwZe_d_x10-SX4=Q-CWpKTjoOQ5dc2NSn3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/6/24 02:42, Mina Almasry wrote:
> On Tue, Mar 5, 2024 at 6:28 PM David Wei <dw@davidwei.uk> wrote:
>>
>> On 2024-03-04 18:01, Mina Almasry wrote:
>>> +     if (pool->p.queue)
>>> +             binding = READ_ONCE(pool->p.queue->binding);
>>> +
>>> +     if (binding) {
>>> +             pool->mp_ops = &dmabuf_devmem_ops;
>>> +             pool->mp_priv = binding;
>>> +     }
>>
>> This is specific to TCP devmem. For ZC Rx we will need something more
>> generic to let us pass our own memory provider backend down to the page
>> pool.
>>
>> What about storing ops and priv void ptr in struct netdev_rx_queue
>> instead? Then we can both use it.
> 
> Yes, this is dmabuf specific, I was thinking you'd define your own
> member of netdev_rx_queue, and then add something like this to
> page_pool_init:

That would be quite annoying, there are 3 expected users together
with huge pages, each would need a field and check all others are
disabled as you mentioned and so on. It should be cleaner to pass
a generic {pp_ops,pp_private} pair instead.

If header dependencies is a problem, you it can probably be

struct pp_provider_param {
	struct pp_ops ops;
	void *private;
};

# netdev_rx_queue.h

// definition is not included here
struct pp_provider_params;

struct netdev_rx_queue {
	...
	struct pp_provider_params *pp_params;
};

-- 
Pavel Begunkov
