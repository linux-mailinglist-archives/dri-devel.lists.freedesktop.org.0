Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415B723506
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 04:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6732310E129;
	Tue,  6 Jun 2023 02:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A22F910E0EB;
 Tue,  6 Jun 2023 02:06:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dx9vCalH5kRFUAAA--.1028S3;
 Tue, 06 Jun 2023 10:06:18 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuSXlH5kIp0BAA--.7051S3; 
 Tue, 06 Jun 2023 10:06:17 +0800 (CST)
Message-ID: <f9e67fe9-a93b-75ab-1fdb-87d3783fe5fc@loongson.cn>
Date: Tue, 6 Jun 2023 10:06:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] vgaarb: various coding style and
 comments fix
To: Andi Shyti <andi.shyti@linux.intel.com>, Sui Jingfeng <15330273260@189.cn>
References: <20230604205831.3357596-1-15330273260@189.cn>
 <ZH5epG6rfTOWT6CS@ashyti-mobl2.lan>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZH5epG6rfTOWT6CS@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxZuSXlH5kIp0BAA--.7051S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWkWw4DZFyfKFWDAw47Awc_yoW5XryDpF
 Zakas5Cw4kJrs7ZFy2qF4UJF1ruws3JFy7ArZIk3s7AF13J348JFsxCrZ8Z3y3XryfuF40
 vr4UWr1DGayDZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84E_t
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/6 06:16, Andi Shyti wrote:
> Hi Sui,
>
> On Mon, Jun 05, 2023 at 04:58:30AM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> To keep consistent with vga_iostate_to_str() function, the third argument
>> of vga_str_to_iostate() function should be 'unsigned int *'.
> I think the real reason is not to keep consistent with
> vga_iostate_to_str() but because vga_str_to_iostate() is actually
> only taking "unsigned int *" parameters.

Yes, right.

my expression is not completely correct, I will update it at next version.


I think, we have the same opinion.

Originally, I also want to express the opinion.

Because, it make no sense to  interpret the return value

(VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM) as int type.


IO state should be should be donate by a unsigned type.

vga_iostate_to_str() also receive unsigned type.

static const char *vga_iostate_to_str(unsigned int iostate)

>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c   | 29 +++++++++++++++--------------
>>   include/linux/vgaarb.h |  8 +++-----
>>   2 files changed, 18 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 5a696078b382..e40e6e5e5f03 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -61,7 +61,6 @@ static bool vga_arbiter_used;
>>   static DEFINE_SPINLOCK(vga_lock);
>>   static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>>   
>> -
> drop this change

OK,

This is a double blank line.

Originally, I intend to accumulate all tiny fix, commit together.

As they are trivial.

Now, Should I split this patch,

then this patch set will contain two trivial patch ?

>>   static const char *vga_iostate_to_str(unsigned int iostate)
>>   {
>>   	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
>> @@ -77,10 +76,12 @@ static const char *vga_iostate_to_str(unsigned int iostate)
>>   	return "none";
>>   }
>>   
>> -static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
>> +static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
> this is OK, it's actually what you are describing in the commit
> log, but...
>
>>   {
>> -	/* we could in theory hand out locks on IO and mem
>> -	 * separately to userspace but it can cause deadlocks */
>> +	/*
>> +	 * we could in theory hand out locks on IO and mem
>> +	 * separately to userspace but it can cause deadlocks
>> +	 */
> ... all the rest needs to go on different patches as it doesn't
> have anything to do with what you describe.

OK,

I will wait a few days for more reviews,

I process them together,   also avoid version grow too fast.

Thanks.

> Andi

-- 
Jingfeng

