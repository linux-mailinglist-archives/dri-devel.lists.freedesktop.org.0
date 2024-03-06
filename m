Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA887369A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBE11313B;
	Wed,  6 Mar 2024 12:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E07A11313B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:37:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TqX3L3NVrzNlbl;
 Wed,  6 Mar 2024 20:35:58 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
 by mail.maildlp.com (Postfix) with ESMTPS id ABDAC14011F;
 Wed,  6 Mar 2024 20:37:36 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 20:37:36 +0800
Subject: Re: [RFC PATCH net-next v6 00/15] Device Memory TCP
To: Mina Almasry <almasrymina@google.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-alpha@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
 <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 David Ahern <dsahern@kernel.org>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand
 <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel
 Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, Praveen
 Kaligineedi <pkaligineedi@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <6208950d-6453-e797-7fc3-1dcf15b49dbe@huawei.com>
 <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <de633244-6d6e-f568-dc09-49b56abd0423@huawei.com>
Date: Wed, 6 Mar 2024 20:37:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izMwTRyqUS0iRtErfAqDVsXRia5Ajx9PRK3vcfo8utJoUA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500005.china.huawei.com (7.185.36.74)
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

On 2024/3/6 3:38, Mina Almasry wrote:
> On Tue, Mar 5, 2024 at 4:54 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> On 2024/3/5 10:01, Mina Almasry wrote:
>>
>> ...
>>
>>>
>>> Perf - page-pool benchmark:
>>> ---------------------------
>>>
>>> bench_page_pool_simple.ko tests with and without these changes:
>>> https://pastebin.com/raw/ncHDwAbn
>>>
>>> AFAIK the number that really matters in the perf tests is the
>>> 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
>>> cycles without the changes but there is some 1 cycle noise in some
>>> results.
>>>
>>> With the patches this regresses to 9 cycles with the changes but there
>>> is 1 cycle noise occasionally running this test repeatedly.
>>>
>>> Lastly I tried disable the static_branch_unlikely() in
>>> netmem_is_net_iov() check. To my surprise disabling the
>>> static_branch_unlikely() check reduces the fast path back to 8 cycles,
>>> but the 1 cycle noise remains.
>>>
>>
>> The last sentence seems to be suggesting the above 1 ns regresses is caused
>> by the static_branch_unlikely() checking?
> 
> Note it's not a 1ns regression, it's looks like maybe a 1 cycle
> regression (slightly less than 1ns if I'm reading the output of the
> test correctly):
> 
> # clean net-next
> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> 2.993 ns (step:0)
> 
> # with patches
> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 9 cycles(tsc)
> 3.679 ns (step:0)
> 
> # with patches and with diff that disables static branching:

> time_bench: Type:tasklet_page_pool01_fast_path Per elem: 8 cycles(tsc)
> 3.248 ns (step:0)
> 
> I do see noise in the test results between run and run, and any
> regression (if any) is slightly obfuscated by the noise, so it's a bit
> hard to make confident statements. So far it looks like a ~0.25ns
> regression without static branch and about ~0.65ns with static branch.
> 
> Honestly when I saw all 3 results were within some noise I did not
> investigate more, but if this looks concerning to you I can dig
> further. I likely need to gather a few test runs to filter out the
> noise and maybe investigate the assembly my compiler is generating to
> maybe narrow down what changes there.

Yes, that is confusing enough that need more investigation.

> 
