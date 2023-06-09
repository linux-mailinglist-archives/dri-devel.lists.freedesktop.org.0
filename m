Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BD72A1CE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 20:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85AF10E6D7;
	Fri,  9 Jun 2023 18:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5475A10E169;
 Fri,  9 Jun 2023 18:08:02 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx+el_aoNkI1YBAA--.3749S3;
 Sat, 10 Jun 2023 02:07:59 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxduR+aoNkljUMAA--.36552S3; 
 Sat, 10 Jun 2023 02:07:59 +0800 (CST)
Message-ID: <79e07134-4f89-22dd-5a9c-3c8dfac50bf2@loongson.cn>
Date: Sat, 10 Jun 2023 02:07:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 6/8] drm/etnaviv: add driver support for the PCI devices
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230609175201.GA1253027@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230609175201.GA1253027@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxduR+aoNkljUMAA--.36552S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw1furWfXw15Wry7Kw1fKrX_yoW8AFy7pr
 WYva409a17tr1xJr1Ivw1kWF95tw4rA3s0vas8ur18KrnY93Z0gFy0vF4DWryagr1UJa4I
 yw43ZFy3AanrW3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
 vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUU
 U
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
Cc: Li Yi <liyi@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bjorn Helgaas <bhelgaas@google.com>, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/10 01:52, Bjorn Helgaas wrote:
> On Fri, Jun 09, 2023 at 09:37:02AM +0800, Sui Jingfeng wrote:
>> On 2023/6/9 01:32, Bjorn Helgaas wrote:
>>> On Wed, Jun 07, 2023 at 06:55:49PM +0800, Sui Jingfeng wrote:
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>> This patch adds PCI driver support on top of what we already have. Take
>>>> the GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device
>>>> driver. There is only one GPU core for the GC1000 in the LS7A1000 and
>>>> LS2K1000. Therefore, component frameworks can be avoided.
>>>> +	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>>>> +	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>>> PCI_VDEVICE()
>> This make it impossible to hook device-specific data in the future.
>>
>> But currently there no device specific data associated with the
>> 0x7a05 and 0x7a15,
>>
>> so it's acceptable for now. Thanks.
> Haha, ISTR having this conversation before, sorry for repeating it.
>
> Indeed, it's fine as-is.  But PCI_VDEVICE() actually *does* allow for
> vendor-specific data because it doesn't include the data element,
> which defaults to zero if you don't specify it.
>
> So for example, drivers/net/ethernet/realtek/r8169_main.c has this:
>
>    { PCI_VDEVICE(REALTEK, 0x8129) },
>    { PCI_VDEVICE(REALTEK, 0x8136), RTL_CFG_NO_GBIT },
>
> where 0x8129 has no driver_data (it defaults to zero), but 0x8136
> does.

Yeah, I'm wrong.

PCI_VDEVICE macro end with two zero. (I thought it was three)

Thanks for the education.

With those lessons learned, I somewhat know how to create patch.

It should meet community's requirement before sending.

I'm too naive in the before.

Thanks a lot, really.

> Bjorn

-- 
Jingfeng

