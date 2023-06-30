Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A78E74329B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 04:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4510E43C;
	Fri, 30 Jun 2023 02:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C7F910E434;
 Fri, 30 Jun 2023 02:14:18 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxpMR3Op5kyh0EAA--.6715S3;
 Fri, 30 Jun 2023 10:14:15 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxxsxzOp5kA3oSAA--.41851S3; 
 Fri, 30 Jun 2023 10:14:11 +0800 (CST)
Message-ID: <2c81fbe3-308a-4c5e-0150-32006253b3ea@loongson.cn>
Date: Fri, 30 Jun 2023 10:14:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "15330273260@189.cn" <15330273260@189.cn>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230629155436.GA397963@bhelgaas>
 <bcfdc77d-a94d-bca1-56e3-5e14e91f6fd9@189.cn>
 <MN0PR12MB6101CDB6FF9DC8F8EDEF5F45E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <MN0PR12MB6101CDB6FF9DC8F8EDEF5F45E225A@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxxsxzOp5kA3oSAA--.41851S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JryDGFWfuryxZw1xGryrZrc_yoW7ZF4xpr
 WY9FsIkrs7Xr1rAF1kKa4UAF1jq3y8J343Wrn8t3W8ur909F1SqrZaqr4a9Fy5Ar1akF4Y
 vw4agrn2k395Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
 xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jD8n
 5UUUUU=
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang,
 Bokun" <Bokun.Zhang@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/30 01:44, Limonciello, Mario wrote:
> [Public]
>
>> -----Original Message-----
>> From: 15330273260@189.cn <15330273260@189.cn>
>> Sent: Thursday, June 29, 2023 12:00 PM
>> To: Bjorn Helgaas <helgaas@kernel.org>; Sui Jingfeng
>> <suijingfeng@loongson.cn>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>; linux-fbdev@vger.kernel.org;
>> Cornelia Huck <cohuck@redhat.com>; Karol Herbst <kherbst@redhat.com>;
>> nouveau@lists.freedesktop.org; Joonas Lahtinen
>> <joonas.lahtinen@linux.intel.com>; dri-devel@lists.freedesktop.org; Chai,
>> Thomas <YiPeng.Chai@amd.com>; Limonciello, Mario
>> <Mario.Limonciello@amd.com>; Gao, Likun <Likun.Gao@amd.com>; David
>> Airlie <airlied@gmail.com>; Ville Syrjala <ville.syrjala@linux.intel.com>; Yi Liu
>> <yi.l.liu@intel.com>; kvm@vger.kernel.org; amd-gfx@lists.freedesktop.org;
>> Jason Gunthorpe <jgg@ziepe.ca>; Ben Skeggs <bskeggs@redhat.com>; linux-
>> pci@vger.kernel.org; Kevin Tian <kevin.tian@intel.com>; Lazar, Lijo
>> <Lijo.Lazar@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>;
>> Zhang, Bokun <Bokun.Zhang@amd.com>; intel-gfx@lists.freedesktop.org;
>> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Jani Nikula
>> <jani.nikula@linux.intel.com>; Alex Williamson
>> <alex.williamson@redhat.com>; Abhishek Sahu <abhsahu@nvidia.com>;
>> Maxime Ripard <mripard@kernel.org>; Rodrigo Vivi <rodrigo.vivi@intel.com>;
>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Yishai Hadas
>> <yishaih@nvidia.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; linux-
>> kernel@vger.kernel.org; Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
>> Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
>> callback to vga_client_register
>>
>> Hi,
>>
>> On 2023/6/29 23:54, Bjorn Helgaas wrote:
>>> On Thu, Jun 22, 2023 at 01:08:15PM +0800, Sui Jingfeng wrote:
>>>> Hi,
>>>>
>>>>
>>>> A nouveau developer(Lyude) from redhat send me a R-B,
>>>>
>>>> Thanks for the developers of nouveau project.
>>>>
>>>>
>>>> Please allow me add a link[1] here.
>>>>
>>>>
>>>> [1]
>> https://lore.kernel.org/all/0afadc69f99a36bc9d03ecf54ff25859dbc10e28.ca
>> mel@redhat.com/
>>> 1) Thanks for this.  If you post another version of this series,
>>>      please pick up Lyude's Reviewed-by and include it in the relevant
>>>      patches (as long as you haven't made significant changes to the
>>>      code Lyude reviewed).
>> Yes, no significant changes. Just fix typo.
>>
>> I also would like to add support for other DRM drivers.
>>
>> But I think this deserve another patch.
>>
>>>    Whoever applies this should automatically
>>>      pick up Reviewed-by/Ack/etc that are replies to the version being
>>>      applied, but they won't go through previous revisions to find them.
>>>
>>> 2) Please mention the commit to which the series applies.  I tried to
>>>      apply this on v6.4-rc1, but it doesn't apply cleanly.
>> Since I'm a graphic driver developer, I'm using drm-tip.
>>
>> I just have already pulled, it still apply cleanly on drm-tip.
>>
>>> 3) Thanks for including cover letters in your postings.  Please
>>>      include a little changelog in the cover letter so we know what
>>>      changed between v6 and v7, etc.
>> No change between v6 and v7,
>>
>> it seems that it is because the mailbox don't allow me to sending too
>> many mails a day.
>>
>> so some of the patch is failed to delivery because out of quota.
>>
>>
>>> 4) Right now we're in the middle of the v6.5 merge window, so new
>>>      content, e.g., this series, is too late for v6.5.  Most
>>>      maintainers, including me, wait to merge new content until the
>>>      merge window closes and a new -rc1 is tagged.  This merge window
>>>      should close on July 9, and people will start merging content for
>>>      v6.6, typically based on v6.5-rc1.
>> I'm wondering
>>
>> Would you will merge all of the patches in this series (e.g. including
>> the patch for drm/amdgpu(7/8) and drm/radeon(8/8)) ?
>>
>> Or just part of them?
>>
>> Emm, I don't know because my patch seems across different subsystem of
>> Linux kernel.
>>
>> There is also a developer for AMDGPU (Mario) give me a R-B for the
>> patch-0002 of this series.
>>
>> So, at least, PATCH-0001, PATCH-0002, PATCH-0003, PATCH-0004, PATCH-
>> 0006
>> are already OK(got reviewed by).
>>
>> Those 5 patch are already qualified to be merged, I think.
> I think what you can do is pick up all the tags in your next version.  Once the
> whole series has tags we can discuss how it merges.

Thanks a lot, Mario.


Is it possible to merge the PCI/VGA part as fast as possible, especially the

PATCH-0006 PCI/VGA: Introduce is_boot_device function callback to vga_client_register

As this patch is fundamental, it introduce no functional change, as long as the drm

driver side don't introduce a callback.

I'm not hurry, but drm driver-side's patch have a dependency on this patch,

I think it is better the PCI/VGA-side's patch got merge first.

At least for get the first four cleanup(0001 ~ 0004) patch merged first,

so that I don't have to send so much on the next version on one series.

Being exposed so far, there no obvious objection.

It saying that other people also want it got merged.

Bjorn, is this OK ?

>
>> I means that if you could merge those 5 patch first, then there no need
>> to send another version again.
>>
>> I will refine the rest patch with more details and description.
>>
>> I'm fear of making too much noise.
>>
>>> Bjorn

