Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A27DBBEF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5447A10E2DE;
	Mon, 30 Oct 2023 14:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFA4510E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:39:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxJvEmwD9l8ME1AA--.39828S3;
 Mon, 30 Oct 2023 22:39:34 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxni8jwD9llgc3AA--.52859S3; 
 Mon, 30 Oct 2023 22:39:34 +0800 (CST)
Message-ID: <9926d2cf-5f92-4f4a-bc4d-423b07e38a3c@loongson.cn>
Date: Mon, 30 Oct 2023 22:39:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
 <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
 <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
 <e4ozgwe7g5s3bioywxqcetuqwxk6byvz2lr3swlgy7wutxcxkp@obvvszcgz2qw>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <e4ozgwe7g5s3bioywxqcetuqwxk6byvz2lr3swlgy7wutxcxkp@obvvszcgz2qw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bxni8jwD9llgc3AA--.52859S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr47Kr17ury5Jw48tr4xAFc_yoW8Cr17pF
 WagFW2kF4vqF1Dtryqyr4xuFWrX39xK3y5Krn5Ja4v93sxuF42vFs8KayY9a47urs3Wa12
 vrZ0vF97JFWDAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UG
 2NtUUUUU=
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/30 21:39, Maxime Ripard wrote:
> On Mon, Oct 30, 2023 at 09:25:50PM +0800, Sui Jingfeng wrote:
>> I think my approach provide a solution, while still keep the bridges drivers
>> to a modular at the same time. Despite simple, it indeed solve the problem.
>> It simple because of explicit control of the loading order by myself, not by
>> rely on the framework or something else (say component)
>>
>> It is not totally duplicating, I have rewrite part of them. You can compare
>> to see what I'm changed. It is just that it66162 was upstream-ed earlier than
>> our solution. But I also have write display drivers for lt8618 and lt8619
>> completely by myself.
>>
>> Even though our local drm bridges driver will not be able to enjoy the updates.
>> We will accept such a results(or pain). I can maintain our local drm bridges
>> drivers by myself. Sorry, on this technique point, we will not follow your idea.
>> I'm sure that my approach is toward to right direction for our device at now.
>> If someone invent a better solution to handle this problem, which make the
>> various drm bridges drivers usable out of box, then I will follow and cooperate
>> to test.
> As far as I'm concerned, the two options are either you reuse the
> already existing driver or this series isn't merged.

It's not that I don't want to use thealready existing display bridge driver, It is just that it is not 
suitable for non DT-based system to use. Our system using UEFI+ACPI, 
beside the I2C, there also have GPIO HPD interrupt hardware. ACPI-based system and DT-based system have different way to use(request) the hardware.
Can you feel my words?

If the variousdisplay bridge drivers are really ready to use, why I have to refuse?


> Ignoring what issue we raised and still merging your patch isn't on the
> table, sorry.
>
> Maxime

