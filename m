Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCA7355F1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 13:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DACE10E1EE;
	Mon, 19 Jun 2023 11:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5BD810E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 11:36:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxe+q8PZBkRdgGAA--.14136S3;
 Mon, 19 Jun 2023 19:36:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMq7PZBkRD4gAA--.16495S3; 
 Mon, 19 Jun 2023 19:36:27 +0800 (CST)
Message-ID: <06b6d50b-48f8-b386-097e-5a5a1276d598@loongson.cn>
Date: Mon, 19 Jun 2023 19:36:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display
 controller
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
References: <20230615143613.1236245-1-15330273260@189.cn>
 <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com>
 <3e41da42-7bfc-c934-d8a1-ec18047849dc@loongson.cn>
 <CAAhV-H5XR+tbxuDoGHZo3vshes6xwhBOGC=OrZy11Mq5fizaCA@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CAAhV-H5XR+tbxuDoGHZo3vshes6xwhBOGC=OrZy11Mq5fizaCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbMq7PZBkRD4gAA--.16495S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrGFyrAFyxCr1xKF4kCrWUJrc_yoWxGFc_uw
 n5u34kCw10gFW7C39FyrWYvFZ8Kry7Xr1fGrsaqr4kAws3tr98AF4UWF1Ivan8XrW2kFnx
 urn3CFsxCFWIqosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
 s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
 cSsGvfJTRUUUbg8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
 vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8
 Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8oGQD
 UUUUU==
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, inux-kernel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <15330273260@189.cn>, loongson-kernel@lists.loongnix.cn,
 Liu Peibao <liupeibao@loongson.cn>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/19 18:20, Huacai Chen wrote:
> On Mon, Jun 19, 2023 at 6:12 PM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Hi.
>>
>> On 2023/6/19 17:18, Huacai Chen wrote:
>>>> +
>>>> +enum loongson_chip_id {
>>>> +       CHIP_LS7A1000 = 0,
>>>> +       CHIP_LS7A2000 = 1,
>>>> +       CHIP_LS_LAST,
>>> CHIP_LAST or CHIP_LOONGSON_LAST?
>>>
>> This is intended,  CHIP_LAST is already defined by other drivers.
>>
>> It will not cause redefinition,  but it deny my VIM text editor jump to
>>
>> the right place on one shot.
> Then use CHIP_LOONGSON_LAST please.
OK, this is acceptable.
> Huacai
>> --
>> Jingfeng
>>
-- 
Jingfeng

