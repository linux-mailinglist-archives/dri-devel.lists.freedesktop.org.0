Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB47592EC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6B210E459;
	Wed, 19 Jul 2023 10:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD1010E459;
 Wed, 19 Jul 2023 10:26:41 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R5X571QjyzVjhv;
 Wed, 19 Jul 2023 18:25:15 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 18:26:38 +0800
Message-ID: <9093cbf3-a0be-b1e7-cc6d-0d47ab3035a5@huawei.com>
Date: Wed, 19 Jul 2023 18:26:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 4/4] perf/core: use vma_is_initial_stack() and
 vma_is_initial_heap()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-5-wangkefeng.wang@huawei.com>
 <20230719092915.GA3529602@hirez.programming.kicks-ass.net>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230719092915.GA3529602@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/19 17:29, Peter Zijlstra wrote:
> On Wed, Jul 19, 2023 at 03:51:14PM +0800, Kefeng Wang wrote:
>> Use the helpers to simplify code, also kill unneeded goto cpy_name.
> 
> Grrr.. why am I only getting 4/4 ?
> 
> I'm going to write a bot that auto NAKs all partial series :/
Sorry, I should add all to cc list, here is all patches linke[1]

[1] 
https://lore.kernel.org/linux-mm/20230719075127.47736-1-wangkefeng.wang@huawei.com/ 


Thanks.
> 
