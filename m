Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370389BFB04
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 01:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895F110E03C;
	Thu,  7 Nov 2024 00:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3410E03C;
 Thu,  7 Nov 2024 00:57:32 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XkNvT1669z4f3mJG;
 Thu,  7 Nov 2024 08:57:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 064ED1A0359;
 Thu,  7 Nov 2024 08:57:28 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP4 (Coremail) with SMTP id gCh0CgCHYoZzECxnGnRCBA--.54616S3;
 Thu, 07 Nov 2024 08:57:25 +0800 (CST)
Subject: Re: [PATCH 6.6 00/28] fix CVE-2024-46701
To: Chuck Lever III <chuck.lever@oracle.com>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 linux-stable <stable@vger.kernel.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Sasha Levin <sashal@kernel.org>,
 "srinivasan.shanmugam@amd.com" <srinivasan.shanmugam@amd.com>,
 "chiahsuan.chung@amd.com" <chiahsuan.chung@amd.com>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "mgorman@techsingularity.net" <mgorman@techsingularity.net>,
 "chengming.zhou@linux.dev" <chengming.zhou@linux.dev>,
 "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, "yi.zhang@huawei.com" <yi.zhang@huawei.com>,
 yangerkun <yangerkun@huawei.com>, "yukuai (C)" <yukuai3@huawei.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <2024110625-earwig-deport-d050@gregkh>
 <7AB98056-93CC-4DE5-AD42-49BA582D3BEF@oracle.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <8bdd405e-0086-5441-e185-3641446ba49d@huaweicloud.com>
Date: Thu, 7 Nov 2024 08:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7AB98056-93CC-4DE5-AD42-49BA582D3BEF@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHYoZzECxnGnRCBA--.54616S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy8CryxXw1UtrWkXFWxCrg_yoW8tF4Upa
 yfJ3Z8Kr47ur18Gws7tayjvay0kan5X345urn5K345ZF1Y9FySgrWI9F15uF97GrsxCr17
 KF1aqwn7J3WUJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRJMa0UUUUU
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

在 2024/11/06 23:19, Chuck Lever III 写道:
> 
> 
>> On Nov 6, 2024, at 1:16 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Oct 24, 2024 at 09:19:41PM +0800, Yu Kuai wrote:
>>> From: Yu Kuai <yukuai3@huawei.com>
>>>
>>> Fix patch is patch 27, relied patches are from:
> 
> I assume patch 27 is:
> 
> libfs: fix infinite directory reads for offset dir
> 
> https://lore.kernel.org/stable/20241024132225.2271667-12-yukuai1@huaweicloud.com/
> 
> I don't think the Maple tree patches are a hard
> requirement for this fix. And note that libfs did
> not use Maple tree originally because I was told
> at that time that Maple tree was not yet mature.
> 
> So, a better approach might be to fit the fix
> onto linux-6.6.y while sticking with xarray.

The painful part is that using xarray is not acceptable, the offet
is just 32 bit and if it overflows, readdir will read nothing. That's
why maple_tree has to be used.

Thanks,
Kuai

> 
> This is the first I've heard of this CVE. It
> would help if the patch authors got some
> notification when these are filed.
> 
> 
>>> - patches from set [1] to add helpers to maple_tree, the last patch to
>>> improve fork() performance is not backported;
>>
>> So things slowed down?
>>
>>> - patches from set [2] to change maple_tree, and follow up fixes;
>>> - patches from set [3] to convert offset_ctx from xarray to maple_tree;
>>>
>>> Please notice that I'm not an expert in this area, and I'm afraid to
>>> make manual changes. That's why patch 16 revert the commit that is
>>> different from mainline and will cause conflict backporting new patches.
>>> patch 28 pick the original mainline patch again.
>>>
>>> (And this is what we did to fix the CVE in downstream kernels).
>>>
>>> [1] https://lore.kernel.org/all/20231027033845.90608-1-zhangpeng.00@bytedance.com/
>>> [2] https://lore.kernel.org/all/20231101171629.3612299-2-Liam.Howlett@oracle.com/T/
>>> [3] https://lore.kernel.org/all/170820083431.6328.16233178852085891453.stgit@91.116.238.104.host.secureserver.net/
>>
>> This series looks rough.  I want to have the maintainers of these
>> files/subsystems to ack this before being able to take them.
>>
>> thanks,
>>
>> greg k-h
> 
> --
> Chuck Lever
> 
> 

