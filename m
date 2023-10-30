Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3367DB644
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5310E261;
	Mon, 30 Oct 2023 09:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEE9F10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:42:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxc_B5ej9lQbY1AA--.39567S3;
 Mon, 30 Oct 2023 17:42:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxkN12ej9lD+o2AA--.54880S3; 
 Mon, 30 Oct 2023 17:42:17 +0800 (CST)
Message-ID: <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
Date: Mon, 30 Oct 2023 17:42:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxkN12ej9lD+o2AA--.54880S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4xAry7tF17Cr4xGw4DAwc_yoW8AFyfpa
 nFkw1YkrWUXrW2y39xGF1UJFy5Za93GFWfWFsrJ3s3Wr9xAa40yrn8JFW5Jry7Xa43Ar42
 qrZ7GFWUW3WYkrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UX_-PUUUUU=
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/30 06:53, Dmitry Baryshkov wrote:
> On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
>> chip to support HDMI output. Thus add a drm bridge based driver for it.
>> This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.
> Please use the original bridge driver instead of adding a new one.

I'm agree with the spirit of code sharing, but this is nearly impossible for non-DT system.

Because the original bridge driver(say it66121.ko) is fully dependent on the DT.
UEFI+ACPI based system can not use with it.

Our I2C adapter is created by the drm/loongson.ko on the runtime.
The potential problem is that *cyclic dependency* !

I2C adapter driver is depend on drm/loongson
drm/loongson depend on drm bridge driver (say it66121.ko)
drm bridge driver (say it66121.ko) depend on I2C adapter to setup.

This plus the defer probe mechanism is totally a trap,
incurring troubles and don't work.


>   If
> it needs to be changed in any way, please help everyone else by
> improving it instead of introducing new driver.
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/Kconfig            |   1 +
>>   drivers/gpu/drm/loongson/Makefile           |   2 +
>>   drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
>>   drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
>>   drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
>>   5 files changed, 1039 insertions(+)
>>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
>>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
>>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h
>

