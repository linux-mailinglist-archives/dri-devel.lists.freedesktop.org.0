Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A3788233
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614A10E627;
	Fri, 25 Aug 2023 08:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9CEA10E627
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 08:37:25 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxVuhAaOhk0cYbAA--.21231S3;
 Fri, 25 Aug 2023 16:37:21 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx4eQvaOhkwj9jAA--.44533S3; 
 Fri, 25 Aug 2023 16:37:20 +0800 (CST)
Message-ID: <f338968a-35c4-b153-f2af-d5212b62f774@loongson.cn>
Date: Fri, 25 Aug 2023 16:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/gma500: Fix call trace when psb_gem_mm_init() fails
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230727185855.713318-1-suijingfeng@loongson.cn>
 <gnrgfhdpwyw5kpmt3bo6ufgzqz4nct6v5qbmuhknda2u33dpkw@4nbzhodx7kq5>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <gnrgfhdpwyw5kpmt3bo6ufgzqz4nct6v5qbmuhknda2u33dpkw@4nbzhodx7kq5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx4eQvaOhkwj9jAA--.44533S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3AF1kGrW5KFyDGr4fAw4fWFX_yoWxWryrpF
 yUG3WDGrW0yr48tr4UJF15G3WUGw4kAa4UurykJrn3ZF1jkrn8Aw18Aw4UGa4UJw18Zr93
 JF9xAw18KF1xGagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
 vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/25 14:54, Patrik Jakobsson wrote:
> On Fri, Jul 28, 2023 at 02:58:55AM +0800, Sui Jingfeng wrote:
>> Because the gma_irq_install() is call after psb_gem_mm_init() function,
>> when psb_gem_mm_init() fails, the interrupt line haven't been allocated.
>> Yet the gma_irq_uninstall() is called in the psb_driver_unload() function
>> without checking if checking the irq is registered or not.
>>
>> The calltrace is appended as following:
>>
>> [   20.539253] ioremap memtype_reserve failed -16
>> [   20.543895] gma500 0000:00:02.0: Failure to map stolen base.
>> [   20.565049] ------------[ cut here ]------------
>> [   20.565066] Trying to free already-free IRQ 16
>> [   20.565087] WARNING: CPU: 1 PID: 381 at kernel/irq/manage.c:1893 free_irq+0x209/0x370
>> [   20.565316] CPU: 1 PID: 381 Comm: systemd-udevd Tainted: G         C         6.5.0-rc1+ #368
>> [   20.565329] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./IMB-140D Plus, BIOS P1.10 11/18/2013
>> [   20.565338] RIP: 0010:free_irq+0x209/0x370
>> [   20.565357] Code: 41 5d 41 5e 41 5f 5d 31 d2 89 d1 89 d6 89 d7 41 89 d1 c3 cc cc cc cc 8b 75 d0 48 c7 c7 e0 77 12 9f 4c 89 4d c8 e8 57 fe f4 ff <0f> 0b 48 8b 75 c8 4c 89 f7 e8 29 f3 f1 00 49 8b 47 40 48 8b 40 78
>> [   20.565369] RSP: 0018:ffffae3b40733808 EFLAGS: 00010046
>> [   20.565382] RAX: 0000000000000000 RBX: ffff9f8082bfe000 RCX: 0000000000000000
>> [   20.565390] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> [   20.565397] RBP: ffffae3b40733840 R08: 0000000000000000 R09: 0000000000000000
>> [   20.565405] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9f80871c3100
>> [   20.565413] R13: ffff9f80835d3360 R14: ffff9f80835d32a4 R15: ffff9f80835d3200
>> [   20.565424] FS:  00007f13d36458c0(0000) GS:ffff9f8138880000(0000) knlGS:0000000000000000
>> [   20.565434] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   20.565441] CR2: 00007f0d046f3f20 CR3: 0000000006c8c000 CR4: 00000000000006e0
>> [   20.565450] Call Trace:
>> [   20.565458]  <TASK>
>> [   20.565470]  ? show_regs+0x72/0x90
>> [   20.565488]  ? free_irq+0x209/0x370
>> [   20.565504]  ? __warn+0x8d/0x160
>> [   20.565520]  ? free_irq+0x209/0x370
>> [   20.565536]  ? report_bug+0x1bb/0x1d0
>> [   20.565555]  ? handle_bug+0x46/0x90
>> [   20.565572]  ? exc_invalid_op+0x19/0x80
>> [   20.565587]  ? asm_exc_invalid_op+0x1b/0x20
>> [   20.565607]  ? free_irq+0x209/0x370
>> [   20.565625]  ? free_irq+0x209/0x370
>> [   20.565644]  gma_irq_uninstall+0x15b/0x1e0 [gma500_gfx]
>> [   20.565728]  psb_driver_unload+0x27/0x190 [gma500_gfx]
>> [   20.565800]  psb_pci_probe+0x5d2/0x790 [gma500_gfx]
>> [   20.565873]  local_pci_probe+0x48/0xb0
>> [   20.565892]  pci_device_probe+0xc8/0x280
>> [   20.565912]  really_probe+0x1d2/0x440
>> [   20.565929]  __driver_probe_device+0x8a/0x190
>> [   20.565944]  driver_probe_device+0x23/0xd0
>> [   20.565957]  __driver_attach+0x10f/0x220
>> [   20.565971]  ? __pfx___driver_attach+0x10/0x10
>> [   20.565984]  bus_for_each_dev+0x7a/0xe0
>> [   20.566002]  driver_attach+0x1e/0x30
>> [   20.566014]  bus_add_driver+0x127/0x240
>> [   20.566029]  driver_register+0x64/0x140
>> [   20.566043]  ? __pfx_psb_init+0x10/0x10 [gma500_gfx]
>> [   20.566111]  __pci_register_driver+0x68/0x80
>> [   20.566128]  psb_init+0x2c/0xff0 [gma500_gfx]
>> [   20.566194]  do_one_initcall+0x46/0x330
>> [   20.566214]  ? kmalloc_trace+0x2a/0xb0
>> [   20.566233]  do_init_module+0x6a/0x270
>> [   20.566250]  load_module+0x207f/0x23a0
>> [   20.566278]  init_module_from_file+0x9c/0xf0
>> [   20.566293]  ? init_module_from_file+0x9c/0xf0
>> [   20.566315]  idempotent_init_module+0x184/0x240
>> [   20.566335]  __x64_sys_finit_module+0x64/0xd0
>> [   20.566352]  do_syscall_64+0x59/0x90
>> [   20.566366]  ? ksys_mmap_pgoff+0x123/0x270
>> [   20.566378]  ? __secure_computing+0x9b/0x110
>> [   20.566392]  ? exit_to_user_mode_prepare+0x39/0x190
>> [   20.566406]  ? syscall_exit_to_user_mode+0x2a/0x50
>> [   20.566420]  ? do_syscall_64+0x69/0x90
>> [   20.566433]  ? do_syscall_64+0x69/0x90
>> [   20.566445]  ? do_syscall_64+0x69/0x90
>> [   20.566458]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>> [   20.566472] RIP: 0033:0x7f13d351ea3d
>> [   20.566485] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 a3 0f 00 f7 d8 64 89 01 48
>> [   20.566496] RSP: 002b:00007ffe566c1fd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> [   20.566510] RAX: ffffffffffffffda RBX: 000055e66806eec0 RCX: 00007f13d351ea3d
>> [   20.566519] RDX: 0000000000000000 RSI: 00007f13d36d9441 RDI: 0000000000000010
>> [   20.566527] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
>> [   20.566535] R10: 0000000000000010 R11: 0000000000000246 R12: 00007f13d36d9441
>> [   20.566543] R13: 000055e6681108c0 R14: 000055e66805ba70 R15: 000055e66819a9c0
>> [   20.566559]  </TASK>
>> [   20.566566] ---[ end trace 0000000000000000 ]---
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Applied to drm-misc-next


Thanks a lot.


> Thanks
> Patrik
>
>> ---
>>   drivers/gpu/drm/gma500/psb_drv.h | 1 +
>>   drivers/gpu/drm/gma500/psb_irq.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
>> index f7f709df99b4..70d9adafa233 100644
>> --- a/drivers/gpu/drm/gma500/psb_drv.h
>> +++ b/drivers/gpu/drm/gma500/psb_drv.h
>> @@ -424,6 +424,7 @@ struct drm_psb_private {
>>   	uint32_t pipestat[PSB_NUM_PIPE];
>>   
>>   	spinlock_t irqmask_lock;
>> +	bool irq_enabled;
>>   
>>   	/* Power */
>>   	bool pm_initialized;
>> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
>> index 343c51250207..7bbb79b0497d 100644
>> --- a/drivers/gpu/drm/gma500/psb_irq.c
>> +++ b/drivers/gpu/drm/gma500/psb_irq.c
>> @@ -327,6 +327,8 @@ int gma_irq_install(struct drm_device *dev)
>>   
>>   	gma_irq_postinstall(dev);
>>   
>> +	dev_priv->irq_enabled = true;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -337,6 +339,9 @@ void gma_irq_uninstall(struct drm_device *dev)
>>   	unsigned long irqflags;
>>   	unsigned int i;
>>   
>> +	if (!dev_priv->irq_enabled)
>> +		return;
>> +
>>   	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>>   
>>   	if (dev_priv->ops->hotplug_enable)
>> -- 
>> 2.34.1
>>

