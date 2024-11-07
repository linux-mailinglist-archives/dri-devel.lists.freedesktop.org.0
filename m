Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79899BFBD1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 02:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EFE10E07E;
	Thu,  7 Nov 2024 01:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D874D10E07E;
 Thu,  7 Nov 2024 01:43:45 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XkPwr2bTsz4f3jXr;
 Thu,  7 Nov 2024 09:43:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 59DC01A0568;
 Thu,  7 Nov 2024 09:43:42 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP4 (Coremail) with SMTP id gCh0CgBHI4dJGyxnTIlFBA--.58965S3;
 Thu, 07 Nov 2024 09:43:40 +0800 (CST)
Subject: Re: [PATCH 6.6 00/28] fix CVE-2024-46701
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yu Kuai <yukuai1@huaweicloud.com>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, viro@zeniv.linux.org.uk,
 brauner@kernel.org, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 hughd@google.com, willy@infradead.org, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, chiahsuan.chung@amd.com, mingo@kernel.org,
 mgorman@techsingularity.net, chengming.zhou@linux.dev,
 zhangpeng.00@bytedance.com, chuck.lever@oracle.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <e7942272-9157-4baf-a3e4-ac5957f33cc8@lucifer.local>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <f3168978-5371-c8b7-7d97-b2a3e18d1eee@huaweicloud.com>
Date: Thu, 7 Nov 2024 09:43:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e7942272-9157-4baf-a3e4-ac5957f33cc8@lucifer.local>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgBHI4dJGyxnTIlFBA--.58965S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF17AF4rtr1xKF18JryxXwb_yoWrCw48pa
 1kJ3W3KrW7Ary8Gr4Syw42qa4jy395Gw15tw1DGryrAF45Krn3Xr4fCFyfuFWfuayfGr17
 Kr1Yq3W09a4UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7sR_wZ27UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
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

Hi,

ÔÚ 2024/11/06 22:43, Lorenzo Stoakes Ð´µÀ:
> NACK.
> 
> Do this some other way that isn't a terrible mess.
> 
> You've reverted my CRITICAL fix, then didn't cc- me so I'm grumpy.
> 
> Even if you bizarrely brought it back later.
> 
> Don't fail to cc- people you revert in future, please, especially in
> stable. It's not only discourteous it's also an actual security risk.

ok, that's my fault.
> 
> Thanks.
> 
> Also this commit log is ridiculous, you don't even explain WHAT ON EARTH
> YOU ARE DOING HERE. It's not just good enough to reference a CVE and expect
> us to go research this for you, especially one you've 'addressed' in this
> totally bizarre fashion.
> 
> On Thu, Oct 24, 2024 at 09:19:41PM +0800, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> Fix patch is patch 27, relied patches are from:
>>
>>   - patches from set [1] to add helpers to maple_tree, the last patch to
>> improve fork() performance is not backported;
>>   - patches from set [2] to change maple_tree, and follow up fixes;
>>   - patches from set [3] to convert offset_ctx from xarray to maple_tree;
>>
>> Please notice that I'm not an expert in this area, and I'm afraid to
>> make manual changes. That's why patch 16 revert the commit that is
>> different from mainline and will cause conflict backporting new patches.
>> patch 28 pick the original mainline patch again.
> 
> This is... what? :/
> 
> You have to fix conflicts, that's part of what backporting involves.

So, that's the best I can do in this area. I agree that this is
unacceptable now. So I'll just ignore this cve for v6.6, unless
some expert in this area will try to fix conflicts for patch 27 in
a better way.

Thanks,
Kuai

> 
> Yeah, rethink your whole approach, thanks.
> 
>>
>> (And this is what we did to fix the CVE in downstream kernels).
>>
>> [1] https://lore.kernel.org/all/20231027033845.90608-1-zhangpeng.00@bytedance.com/
>> [2] https://lore.kernel.org/all/20231101171629.3612299-2-Liam.Howlett@oracle.com/T/
>> [3] https://lore.kernel.org/all/170820083431.6328.16233178852085891453.stgit@91.116.238.104.host.secureserver.net/
>>
>> Andrew Morton (1):
>>    lib/maple_tree.c: fix build error due to hotfix alteration
>>
>> Chuck Lever (5):
>>    libfs: Re-arrange locking in offset_iterate_dir()
>>    libfs: Define a minimum directory offset
>>    libfs: Add simple_offset_empty()
>>    maple_tree: Add mtree_alloc_cyclic()
>>    libfs: Convert simple directory offsets to use a Maple Tree
>>
>> Liam R. Howlett (12):
>>    maple_tree: remove unnecessary default labels from switch statements
>>    maple_tree: make mas_erase() more robust
>>    maple_tree: move debug check to __mas_set_range()
>>    maple_tree: add end of node tracking to the maple state
>>    maple_tree: use cached node end in mas_next()
>>    maple_tree: use cached node end in mas_destroy()
>>    maple_tree: clean up inlines for some functions
>>    maple_tree: separate ma_state node from status
>>    maple_tree: remove mas_searchable()
>>    maple_tree: use maple state end for write operations
>>    maple_tree: don't find node end in mtree_lookup_walk()
>>    maple_tree: mtree_range_walk() clean up
>>
>> Lorenzo Stoakes (1):
>>    maple_tree: correct tree corruption on spanning store
>>
>> Peng Zhang (7):
>>    maple_tree: add mt_free_one() and mt_attr() helpers
>>    maple_tree: introduce {mtree,mas}_lock_nested()
>>    maple_tree: introduce interfaces __mt_dup() and mtree_dup()
>>    maple_tree: skip other tests when BENCH is enabled
>>    maple_tree: preserve the tree attributes when destroying maple tree
>>    maple_tree: add test for mtree_dup()
>>    maple_tree: avoid checking other gaps after getting the largest gap
>>
>> Yu Kuai (1):
>>    Revert "maple_tree: correct tree corruption on spanning store"
>>
>> yangerkun (1):
>>    libfs: fix infinite directory reads for offset dir
>>
>>   fs/libfs.c                                  |  129 ++-
>>   include/linux/fs.h                          |    6 +-
>>   include/linux/maple_tree.h                  |  356 +++---
>>   include/linux/mm_types.h                    |    3 +-
>>   lib/maple_tree.c                            | 1096 +++++++++++++------
>>   lib/test_maple_tree.c                       |  218 ++--
>>   mm/internal.h                               |   10 +-
>>   mm/shmem.c                                  |    4 +-
>>   tools/include/linux/spinlock.h              |    1 +
>>   tools/testing/radix-tree/linux/maple_tree.h |    2 +-
>>   tools/testing/radix-tree/maple.c            |  390 ++++++-
>>   11 files changed, 1564 insertions(+), 651 deletions(-)
>>
>> --
>> 2.39.2
>>
> 
> .
> 

