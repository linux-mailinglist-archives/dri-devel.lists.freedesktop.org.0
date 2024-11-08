Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B79C1386
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 02:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93510E139;
	Fri,  8 Nov 2024 01:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21210E139;
 Fri,  8 Nov 2024 01:19:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xl1Lm6fbkz4f3jXs;
 Fri,  8 Nov 2024 09:19:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id E8FD91A0196;
 Fri,  8 Nov 2024 09:19:46 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP4 (Coremail) with SMTP id gCh0CgDHo4ctZy1n00WkBA--.29471S3;
 Fri, 08 Nov 2024 09:19:44 +0800 (CST)
Subject: Re: [PATCH 6.6 00/28] fix CVE-2024-46701
To: Chuck Lever <chuck.lever@oracle.com>, Yu Kuai <yukuai1@huaweicloud.com>
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
 <8bdd405e-0086-5441-e185-3641446ba49d@huaweicloud.com>
 <ZyzRsR9rMQeIaIkM@tissot.1015granger.net>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <4db0a28b-8587-e999-b7a1-1d54fac4e19c@huaweicloud.com>
Date: Fri, 8 Nov 2024 09:19:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZyzRsR9rMQeIaIkM@tissot.1015granger.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDHo4ctZy1n00WkBA--.29471S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW7CF45Jw13Cw4DtFWDurg_yoW8Kw48pF
 ZFqas8KwsrJw17KrnFyw1jqFWFyws8Jr15Xrs8Wr1UAF90kr1SgFWxGr1Ykas7Wrs3uw4U
 KF4ava4xJF1UGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pR1lkxUUUUU=
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

在 2024/11/07 22:41, Chuck Lever 写道:
> On Thu, Nov 07, 2024 at 08:57:23AM +0800, Yu Kuai wrote:
>> Hi,
>>
>> 在 2024/11/06 23:19, Chuck Lever III 写道:
>>>
>>>
>>>> On Nov 6, 2024, at 1:16 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Thu, Oct 24, 2024 at 09:19:41PM +0800, Yu Kuai wrote:
>>>>> From: Yu Kuai <yukuai3@huawei.com>
>>>>>
>>>>> Fix patch is patch 27, relied patches are from:
>>>
>>> I assume patch 27 is:
>>>
>>> libfs: fix infinite directory reads for offset dir
>>>
>>> https://lore.kernel.org/stable/20241024132225.2271667-12-yukuai1@huaweicloud.com/
>>>
>>> I don't think the Maple tree patches are a hard
>>> requirement for this fix. And note that libfs did
>>> not use Maple tree originally because I was told
>>> at that time that Maple tree was not yet mature.
>>>
>>> So, a better approach might be to fit the fix
>>> onto linux-6.6.y while sticking with xarray.
>>
>> The painful part is that using xarray is not acceptable, the offet
>> is just 32 bit and if it overflows, readdir will read nothing. That's
>> why maple_tree has to be used.
> 
> A 32-bit range should be entirely adequate for this usage.
> 
>   - The offset allocator wraps when it reaches the maximum, it
>     doesn't overflow unless there are actually billions of extant
>     entries in the directory, which IMO is not likely.

Yes, it's not likely, but it's possible, and not hard to trigger for
test. And please notice that the offset will increase for each new file,
and file can be removed, while offset stays the same.
> 
>   - The offset values are dense, so the directory can use all 2- or
>     4- billion in the 32-bit integer range before wrapping.

A simple math, if user create and remove 1 file in each seconds, it will
cost about 130 years to overflow. And if user create and remove 1000
files in each second, it will cost about 1 month to overflow.

maple tree use 64 bit value for the offset, which is impossible to
overflow for the rest of our lifes.
> 
>   - No-one complained about this limitation when offset_readdir() was
>     first merged. The xarray was replaced for performance reasons,
>     not because of the 32-bit range limit.
> 
> It is always possible that I have misunderstood your concern!

The problem is that if the next_offset overflows to 0, then after patch
27, offset_dir_open() will record the 0, and later offset_readdir will
return directly, while there can be many files.

Thanks,
Kuai

