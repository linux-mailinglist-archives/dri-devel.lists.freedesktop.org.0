Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59F7BB6A8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0761910E105;
	Fri,  6 Oct 2023 11:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98FE310E105
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:40:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxyOhA8h9lQIMvAA--.55273S3;
 Fri, 06 Oct 2023 19:40:48 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxeuQ78h9lglQZAA--.55836S3; 
 Fri, 06 Oct 2023 19:40:46 +0800 (CST)
Message-ID: <42a15522-7bed-c5b1-1dc3-65446b65e348@loongson.cn>
Date: Fri, 6 Oct 2023 19:40:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [-next 1/5] PCI: Add the pci_is_vga() helper
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20231005225101.GA792747@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20231005225101.GA792747@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxeuQ78h9lglQZAA--.55836S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF4DAw4xJr1UAw4rur1fXwc_yoW5tF1fpF
 W8AFy8GF18WF17Gwnav3WIga45ZFZ5CF98Ar1agw1Ykrnxta4YqrWFkry5Wa1xZr4vgF4f
 trWqqr45Cw1DXFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU466zUUUUU
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 virtualization@lists.linux-foundation.org,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/6 06:51, Bjorn Helgaas wrote:
> On Wed, Aug 30, 2023 at 07:15:28PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> The PCI code and ID assignment specification defined four types of
>> display controllers for the display base class(03h), and the devices
>> with 0x00h sub-class code are VGA devices. VGA devices with programming
> I can update this with the spec details (PCI Code and Assignment spec
> r1.15, secs 1.1 and 1.4).
>
>> interface 0x00 is VGA-compatible, VGA devices with programming interface
>> 0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
>> is defined to provide backward compatibility for devices that were built
>> before the class code field was defined. Hence, introduce the pci_is_vga()
>> helper, let it handle the details for us. It returns true if the PCI(e)
>> device being tested belongs to the VGA devices category.
>>
>> Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   include/linux/pci.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index cf6e0b057752..ace727001911 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -713,6 +713,33 @@ static inline bool pci_is_bridge(struct pci_dev *dev)
>>   		dev->hdr_type == PCI_HEADER_TYPE_CARDBUS;
>>   }
>>   
>> +/**
>> + * The PCI code and ID assignment specification defined four types of
>> + * display controllers for the display base class(03h), and the devices
>> + * with 0x00h sub-class code are VGA devices. VGA devices with programming
>> + * interface 0x00 is VGA-compatible, VGA devices with programming interface
>> + * 0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
>> + * is defined to provide backward compatibility for devices that were built
>> + * before the class code field was defined. This means that it belong to the
>> + * VGA devices category also.
>> + *
>> + * Returns:
>> + * true if the PCI device is a VGA device, false otherwise.
>> + */
>> +static inline bool pci_is_vga(struct pci_dev *pdev)
>> +{
>> +	if (!pdev)
>> +		return false;
>> +
>> +	if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>> +		return true;
>> +
>> +	if ((pdev->class >> 8) == PCI_CLASS_NOT_DEFINED_VGA)
>> +		return true;
> Are you seeing a problem that will be fixed by this series, i.e., a
> PCI_CLASS_NOT_DEFINED_VGA device that we currently don't handle
> correctly?

No, I write it according to the spec.
But I'm sure that the boot_vga will not be shown at sysfs for a PCI_CLASS_NOT_DEFINED_VGA device.


> I think this makes sense per the spec, but there's always a risk of
> breaking something, so it's nice if the change actually *fixes*
> something to make that risk worthwhile.


Maciej mentioned that PCI_CLASS_NOT_DEFINED_VGA device should also be handled in the past.
see [1]. But if no one interested in PCI_CLASS_NOT_DEFINED_VGA nowaday, then I guess
the gains of this patch may not deserve the time and risk. But I don't mind if someone
would like pick it up for other purpose.

Thanks for the reviewing. :-)

[1] https://lkml.org/lkml/2023/6/18/315


>> +	return false;
>> +}
>> +
>>   #define for_each_pci_bridge(dev, bus)				\
>>   	list_for_each_entry(dev, &bus->devices, bus_list)	\
>>   		if (!pci_is_bridge(dev)) {} else
>> -- 
>> 2.34.1
>>

