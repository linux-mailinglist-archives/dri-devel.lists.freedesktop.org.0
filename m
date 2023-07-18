Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900D757115
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163410E2C0;
	Tue, 18 Jul 2023 00:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4C210E2BD;
 Tue, 18 Jul 2023 00:50:53 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R4gN02ZJyz18LXj;
 Tue, 18 Jul 2023 08:50:08 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:50:49 +0800
Message-ID: <66b5cff0-3c06-222a-c8ab-af18dc7af7f1@huawei.com>
Date: Tue, 18 Jul 2023 08:50:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/5] mm: use vma_is_stack() and vma_is_heap()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-3-wangkefeng.wang@huawei.com>
 <2000511c-d551-5b3d-a9a9-adb4ba3be1f1@redhat.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <2000511c-d551-5b3d-a9a9-adb4ba3be1f1@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/17 18:25, David Hildenbrand wrote:
> On 12.07.23 16:38, Kefeng Wang wrote:
>> Use the helpers to simplify code.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   fs/proc/task_mmu.c   | 24 ++++--------------------
>>   fs/proc/task_nommu.c | 15 +--------------
>>   2 files changed, 5 insertions(+), 34 deletions(-)
>>
> 
> Please squash patch #1 and this patch and call it something like
> 
> "mm: factor out VMA stack and heap checks"
> 
> And then, maybe also keep the comments in these functions, they sound 
> reasonable to have.

Thanks, will re-post them.
> 
