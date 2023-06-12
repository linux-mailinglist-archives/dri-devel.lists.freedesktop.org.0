Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B572CDC3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96010E05B;
	Mon, 12 Jun 2023 18:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED3F510E1FB;
 Mon, 12 Jun 2023 18:20:03 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxL_DRYYdk0vkDAA--.8719S3;
 Tue, 13 Jun 2023 02:20:01 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxjcrQYYdkO+gWAA--.57583S3; 
 Tue, 13 Jun 2023 02:20:00 +0800 (CST)
Message-ID: <90fb836f-ba54-1d3c-965c-67f91ff89fb0@loongson.cn>
Date: Tue, 13 Jun 2023 02:20:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: etnaviv: Replace of_platform.h with explicit includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230410232647.1561308-1-robh@kernel.org>
 <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
 <0ce32e34-d53b-4038-ef39-3b0f3e2f8a7f@loongson.cn>
 <CAL_JsqKsa9KQxk6r=ZxtY30Mk5nk9ST5ejJ+8VXZ5vPJAGHMBg@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CAL_JsqKsa9KQxk6r=ZxtY30Mk5nk9ST5ejJ+8VXZ5vPJAGHMBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxjcrQYYdkO+gWAA--.57583S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr4rWFWUXF1xGr13KrWkKrX_yoWDuFgE9F
 1I9w4kWr4fGr97Ja90yFyDZr909ry3JF4DZ3Z5tFn3W3sayry5JrykCryrXa43WF1IkFnx
 X3Z3AF93Ar1IgosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWU
 JVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
 0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
 Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
 xvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU
 =
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/13 02:15, Rob Herring wrote:
> On Sun, Jun 11, 2023 at 12:49 AM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>>
>> On 2023/6/10 04:17, Rob Herring wrote:
>>> On Mon, Apr 10, 2023 at 5:26 PM Rob Herring <robh@kernel.org> wrote:
>>>> Etnaviv doesn't use anything from of_platform.h, but depends on
>>>> of.h, of_device.h, and platform_device.h which are all implicitly
>>>> included, but that is going to be removed soon.
>>>>
>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>> Ping!
>>
>> of_device.h already has 'linux/of.h' and 'linux/platform_device.h' included,
>>
>> Would it be sufficient by simply including linux/of_device.h ?
> That's part of what I'm trying to remove. Standard practice is to not
> rely on implicit includes.

Ok, that's fine then.


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


> Rob

-- 
Jingfeng

