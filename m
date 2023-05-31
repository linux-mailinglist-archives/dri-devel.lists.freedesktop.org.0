Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB817188B4
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009E010E1DB;
	Wed, 31 May 2023 17:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96A8110E1DB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:44:59 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:52192.1222275076
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id F41D8100211;
 Thu,  1 Jun 2023 01:44:53 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 025c347b68894a6488d9ac3cc33df447 for helgaas@kernel.org; 
 Thu, 01 Jun 2023 01:44:57 CST
X-Transaction-ID: 025c347b68894a6488d9ac3cc33df447
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <47c5c3ca-b112-9800-a047-10dab4cdef50@189.cn>
Date: Thu, 1 Jun 2023 01:44:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <ZHeDpbtM3FFOPn6d@bhelgaas>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ZHeDpbtM3FFOPn6d@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, Li Yi <liyi@loongson.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jesse Barnes <jbarnes@virtuousgeek.org>, loongson-kernel@lists.loongnix.cn,
 Ben Hutchings <bhutchings@solarflare.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Wilcox <willy@infradead.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Thanks a lot.

Can you receive my email?

I reply several email to you, but Thunderbird told me that may mail is 
returned.

Maybe you could read the content at lore.

```

The recipient's server is busy or down now.
SMTP error, OPEN: Host kernel.org(35.85.114.177) OPEN said 521 5.7.1 Service unavailable; client [114.242.206.163] blocked using zen.spamhaus.org

```


On 2023/6/1 01:28, Bjorn Helgaas wrote:
> On Wed, May 31, 2023 at 06:27:44PM +0800, Sui Jingfeng wrote:
>> As some arch(m68k for example) doesn't have config_pci enabled, drivers[1]
>> call pci_clear_master() without config_pci guard can not pass compile test.
>>
>>     drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:
>>     In function 'etnaviv_gpu_pci_fini':
>>>> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9:
>>     error: implicit declaration of function 'pci_clear_master';
>>     did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
>>        32 |         pci_clear_master(pdev);
>>           |         ^~~~~~~~~~~~~~~~
>>           |         pci_set_master
>>     cc1: some warnings being treated as errors
>>
>> [1] https://patchwork.freedesktop.org/patch/539977/?series=118522&rev=1
>>
>> V2:
>> 	* Adjust commit log style to meet the convention and add Fixes tag
>>
>> Fixes: 6a479079c072 ("PCI: Add pci_clear_master() as opposite of pci_set_master()")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202305301659.4guSLavL-lkp@intel.com/
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Applied to pci/misc for v6.5 as follows:
>
>    Author: Sui Jingfeng <suijingfeng@loongson.cn>
>    Date:   Wed May 31 18:27:44 2023 +0800
>
>      PCI: Add pci_clear_master() stub for non-CONFIG_PCI
>      
>      Add a pci_clear_master() stub when CONFIG_PCI is not set so drivers that
>      support both PCI and platform devices don't need #ifdefs or extra Kconfig
>      symbols for the PCI parts.
>      
>      [bhelgaas: commit log]
>      Fixes: 6a479079c072 ("PCI: Add pci_clear_master() as opposite of pci_set_master()")
>      Link: https://lore.kernel.org/r/20230531102744.2354313-1-suijingfeng@loongson.cn
>      Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>      Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>      Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
>> ---
>>   include/linux/pci.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index d0c19ff0c958..71c85380676c 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -1904,6 +1904,7 @@ static inline int pci_dev_present(const struct pci_device_id *ids)
>>   #define pci_dev_put(dev)	do { } while (0)
>>   
>>   static inline void pci_set_master(struct pci_dev *dev) { }
>> +static inline void pci_clear_master(struct pci_dev *dev) { }
>>   static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
>>   static inline void pci_disable_device(struct pci_dev *dev) { }
>>   static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
>> -- 
>> 2.25.1
>>
