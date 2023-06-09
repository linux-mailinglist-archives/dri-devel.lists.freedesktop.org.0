Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BB729A08
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E6210E699;
	Fri,  9 Jun 2023 12:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 578D310E693
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:30:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxV+l7G4Nk2hYBAA--.1309S3;
 Fri, 09 Jun 2023 20:30:51 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxC8p6G4NkWi0LAA--.25323S3; 
 Fri, 09 Jun 2023 20:30:50 +0800 (CST)
Message-ID: <09b71ed0-6c85-016b-5925-af9f924c1dd0@loongson.cn>
Date: Fri, 9 Jun 2023 20:30:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 3/4] PCI/VGA: Tidy up the code and comment format
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230609112417.632313-1-suijingfeng@loongson.cn>
 <20230609112417.632313-3-suijingfeng@loongson.cn>
 <ZIMUQCuxLG4x1FP0@ashyti-mobl2.lan>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZIMUQCuxLG4x1FP0@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxC8p6G4NkWi0LAA--.25323S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3uryfCw1UKrWfuFWkGr1Dtwc_yoW8Gw47Go
 WfGrs3Xr4xCry7JFW0yryxXr13XFZYg3W5uF1ruw4qkFnIq3WY9Fy3W3W5XFZruF4Yka1x
 C34xJw1rAFWxt34fl-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUOr7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
 xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
 AKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa
 7IU8m0P3UUUUU==
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/9 20:00, Andi Shyti wrote:
> Hi Sui,
>
> On Fri, Jun 09, 2023 at 07:24:16PM +0800, Sui Jingfeng wrote:
>> This patch replaces the leading space with a tab and removes the double
>> blank line, no functional change.
> You mainly fixed comment style, though and it's not written here.
>
> No need to resend for me as you also wrote it in the title. But
> next time please list all the changes in the commit log.

OK, I remember this.

This patch is trivial, that's fine.

There are probably more complex patch in future, probably will send to 
you if the checkpatch.pl script  mandate it.

  :-)

Thanks a lot really.

>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Andi
>
>> ---
>>   drivers/pci/vgaarb.c   | 108 ++++++++++++++++++++++++-----------------
>>   include/linux/vgaarb.h |   4 +-
>>   2 files changed, 65 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 22a505e877dc..ceb914245383 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -61,7 +61,6 @@ static bool vga_arbiter_used;
>>   static DEFINE_SPINLOCK(vga_lock);
>>   static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>>   
>> -
>>   static const char *vga_iostate_to_str(unsigned int iostate)
>>   {
>>   	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
>> @@ -79,8 +78,10 @@ static const char *vga_iostate_to_str(unsigned int iostate)
>>   
>>   static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
>>   {
>> -	/* we could in theory hand out locks on IO and mem
>> -	 * separately to userspace but it can cause deadlocks */
>> +	/*
>> +	 * We could in theory hand out locks on IO and mem
>> +	 * separately to userspace but it can cause deadlocks
>> +	 */
>>   	if (strncmp(buf, "none", 4) == 0) {
>>   		*io_state = VGA_RSRC_NONE;
>>   		return 1;
>> @@ -99,7 +100,7 @@ static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
>>   	return 1;
>>   }
>>   
>> -/* this is only used a cookie - it should not be dereferenced */
>> +/* This is only used as cookie, it should not be dereferenced */
>>   static struct pci_dev *vga_default;
>>   
>>   /* Find somebody in our list */
>> @@ -193,14 +194,17 @@ int vga_remove_vgacon(struct pci_dev *pdev)
>>   #endif
>>   EXPORT_SYMBOL(vga_remove_vgacon);
>>   
>> -/* If we don't ever use VGA arb we should avoid
>> -   turning off anything anywhere due to old X servers getting
>> -   confused about the boot device not being VGA */
>> +/*
>> + * If we don't ever use VGA arb we should avoid
>> + * turning off anything anywhere due to old X servers getting
>> + * confused about the boot device not being VGA
>> + */
>>   static void vga_check_first_use(void)
>>   {
>> -	/* we should inform all GPUs in the system that
>> -	 * VGA arb has occurred and to try and disable resources
>> -	 * if they can */
>> +	/*
>> +	 * We should inform all GPUs in the system that
>> +	 * vgaarb has occurred and to try and disable resources if they can
>> +	 */
>>   	if (!vga_arbiter_used) {
>>   		vga_arbiter_used = true;
>>   		vga_arbiter_notify_clients();
>> @@ -216,7 +220,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   	unsigned int pci_bits;
>>   	u32 flags = 0;
>>   
>> -	/* Account for "normal" resources to lock. If we decode the legacy,
>> +	/*
>> +	 * Account for "normal" resources to lock. If we decode the legacy,
>>   	 * counterpart, we need to request it as well
>>   	 */
>>   	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
>> @@ -236,7 +241,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   	if (wants == 0)
>>   		goto lock_them;
>>   
>> -	/* We don't need to request a legacy resource, we just enable
>> +	/*
>> +	 * We don't need to request a legacy resource, we just enable
>>   	 * appropriate decoding and go
>>   	 */
>>   	legacy_wants = wants & VGA_RSRC_LEGACY_MASK;
>> @@ -252,7 +258,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   		if (vgadev == conflict)
>>   			continue;
>>   
>> -		/* We have a possible conflict. before we go further, we must
>> +		/*
>> +		 * We have a possible conflict. before we go further, we must
>>   		 * check if we sit on the same bus as the conflicting device.
>>   		 * if we don't, then we must tie both IO and MEM resources
>>   		 * together since there is only a single bit controlling
>> @@ -263,13 +270,15 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   			lwants = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
>>   		}
>>   
>> -		/* Check if the guy has a lock on the resource. If he does,
>> +		/*
>> +		 * Check if the guy has a lock on the resource. If he does,
>>   		 * return the conflicting entry
>>   		 */
>>   		if (conflict->locks & lwants)
>>   			return conflict;
>>   
>> -		/* Ok, now check if it owns the resource we want.  We can
>> +		/*
>> +		 * Ok, now check if it owns the resource we want.  We can
>>   		 * lock resources that are not decoded, therefore a device
>>   		 * can own resources it doesn't decode.
>>   		 */
>> @@ -277,14 +286,16 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   		if (!match)
>>   			continue;
>>   
>> -		/* looks like he doesn't have a lock, we can steal
>> +		/*
>> +		 * Looks like he doesn't have a lock, we can steal
>>   		 * them from him
>>   		 */
>>   
>>   		flags = 0;
>>   		pci_bits = 0;
>>   
>> -		/* If we can't control legacy resources via the bridge, we
>> +		/*
>> +		 * If we can't control legacy resources via the bridge, we
>>   		 * also need to disable normal decoding.
>>   		 */
>>   		if (!conflict->bridge_has_one_vga) {
>> @@ -311,7 +322,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>>   	}
>>   
>>   enable_them:
>> -	/* ok dude, we got it, everybody conflicting has been disabled, let's
>> +	/*
>> +	 * Ok dude, we got it, everybody conflicting has been disabled, let's
>>   	 * enable us.  Mark any bits in "owns" regardless of whether we
>>   	 * decoded them.  We can lock resources we don't decode, therefore
>>   	 * we must track them via "owns".
>> @@ -353,7 +365,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
>>   
>>   	vgaarb_dbg(dev, "%s\n", __func__);
>>   
>> -	/* Update our counters, and account for equivalent legacy resources
>> +	/*
>> +	 * Update our counters, and account for equivalent legacy resources
>>   	 * if we decode them
>>   	 */
>>   	if ((rsrc & VGA_RSRC_NORMAL_IO) && vgadev->io_norm_cnt > 0) {
>> @@ -371,7 +384,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
>>   	if ((rsrc & VGA_RSRC_LEGACY_MEM) && vgadev->mem_lock_cnt > 0)
>>   		vgadev->mem_lock_cnt--;
>>   
>> -	/* Just clear lock bits, we do lazy operations so we don't really
>> +	/*
>> +	 * Just clear lock bits, we do lazy operations so we don't really
>>   	 * have to bother about anything else at this point
>>   	 */
>>   	if (vgadev->io_lock_cnt == 0)
>> @@ -379,7 +393,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
>>   	if (vgadev->mem_lock_cnt == 0)
>>   		vgadev->locks &= ~VGA_RSRC_LEGACY_MEM;
>>   
>> -	/* Kick the wait queue in case somebody was waiting if we actually
>> +	/*
>> +	 * Kick the wait queue in case somebody was waiting if we actually
>>   	 * released something
>>   	 */
>>   	if (old_locks != vgadev->locks)
>> @@ -447,8 +462,8 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
>>   		if (conflict == NULL)
>>   			break;
>>   
>> -
>> -		/* We have a conflict, we wait until somebody kicks the
>> +		/*
>> +		 * We have a conflict, we wait until somebody kicks the
>>   		 * work queue. Currently we have one work queue that we
>>   		 * kick each time some resources are released, but it would
>>   		 * be fairly easy to have a per device one so that we only
>> @@ -665,7 +680,7 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>   	}
>>   
>>   	/*
>> -	 * vgadev has neither IO nor MEM enabled.  If we haven't found any
>> +	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>   	 * other VGA devices, it is the best candidate so far.
>>   	 */
>>   	if (!boot_vga)
>> @@ -706,7 +721,7 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
>>   			bus = same_bridge_vgadev->pdev->bus;
>>   			bridge = bus->self;
>>   
>> -			/* see if the share a bridge with this device */
>> +			/* See if the share a bridge with this device */
>>   			if (new_bridge == bridge) {
>>   				/*
>>   				 * If their direct parent bridge is the same
>> @@ -777,9 +792,10 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>>   	vgadev->decodes = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
>>   			  VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
>>   
>> -	/* by default mark it as decoding */
>> +	/* By default, mark it as decoding */
>>   	vga_decode_count++;
>> -	/* Mark that we "own" resources based on our enables, we will
>> +	/*
>> +	 * Mark that we "own" resources based on our enables, we will
>>   	 * clear that below if the bridge isn't forwarding
>>   	 */
>>   	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>> @@ -860,7 +876,7 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
>>   	return ret;
>>   }
>>   
>> -/* this is called with the lock */
>> +/* This is called with the lock */
>>   static inline void vga_update_device_decodes(struct vga_device *vgadev,
>>   					     int new_decodes)
>>   {
>> @@ -877,7 +893,7 @@ static inline void vga_update_device_decodes(struct vga_device *vgadev,
>>   		vga_iostate_to_str(vgadev->decodes),
>>   		vga_iostate_to_str(vgadev->owns));
>>   
>> -	/* if we removed locked decodes, lock count goes to zero, and release */
>> +	/* If we removed locked decodes, lock count goes to zero, and release */
>>   	if (decodes_unlocked) {
>>   		if (decodes_unlocked & VGA_RSRC_LEGACY_IO)
>>   			vgadev->io_lock_cnt = 0;
>> @@ -886,7 +902,7 @@ static inline void vga_update_device_decodes(struct vga_device *vgadev,
>>   		__vga_put(vgadev, decodes_unlocked);
>>   	}
>>   
>> -	/* change decodes counter */
>> +	/* Change decodes counter */
>>   	if (old_decodes & VGA_RSRC_LEGACY_MASK &&
>>   	    !(new_decodes & VGA_RSRC_LEGACY_MASK))
>>   		vga_decode_count--;
>> @@ -910,14 +926,15 @@ static void __vga_set_legacy_decoding(struct pci_dev *pdev,
>>   	if (vgadev == NULL)
>>   		goto bail;
>>   
>> -	/* don't let userspace futz with kernel driver decodes */
>> +	/* Don't let userspace futz with kernel driver decodes */
>>   	if (userspace && vgadev->set_decode)
>>   		goto bail;
>>   
>> -	/* update the device decodes + counter */
>> +	/* Update the device decodes + counter */
>>   	vga_update_device_decodes(vgadev, decodes);
>>   
>> -	/* XXX if somebody is going from "doesn't decode" to "decodes" state
>> +	/*
>> +	 * XXX if somebody is going from "doesn't decode" to "decodes" state
>>   	 * here, additional care must be taken as we may have pending owner
>>   	 * ship of non-legacy region ...
>>   	 */
>> @@ -952,9 +969,9 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>>    * @set_decode callback: If a client can disable its GPU VGA resource, it
>>    * will get a callback from this to set the encode/decode state.
>>    *
>> - * Rationale: we cannot disable VGA decode resources unconditionally some single
>> - * GPU laptops seem to require ACPI or BIOS access to the VGA registers to
>> - * control things like backlights etc.  Hopefully newer multi-GPU laptops do
>> + * Rationale: we cannot disable VGA decode resources unconditionally, some
>> + * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
>> + * to control things like backlights etc. Hopefully newer multi-GPU laptops do
>>    * something saner, and desktops won't have any special ACPI for this. The
>>    * driver will get a callback when VGA arbitration is first used by userspace
>>    * since some older X servers have issues.
>> @@ -984,7 +1001,6 @@ int vga_client_register(struct pci_dev *pdev,
>>   bail:
>>   	spin_unlock_irqrestore(&vga_lock, flags);
>>   	return ret;
>> -
>>   }
>>   EXPORT_SYMBOL(vga_client_register);
>>   
>> @@ -1075,7 +1091,6 @@ static int vga_pci_str_to_vars(char *buf, int count, unsigned int *domain,
>>   	int n;
>>   	unsigned int slot, func;
>>   
>> -
>>   	n = sscanf(buf, "PCI:%x:%x:%x.%x", domain, bus, &slot, &func);
>>   	if (n != 4)
>>   		return 0;
>> @@ -1310,7 +1325,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
>>   		curr_pos += 7;
>>   		remaining -= 7;
>>   		pr_debug("client 0x%p called 'target'\n", priv);
>> -		/* if target is default */
>> +		/* If target is default */
>>   		if (!strncmp(curr_pos, "default", 7))
>>   			pdev = pci_dev_get(vga_default_device());
>>   		else {
>> @@ -1427,7 +1442,6 @@ static int vga_arb_open(struct inode *inode, struct file *file)
>>   	priv->cards[0].io_cnt = 0;
>>   	priv->cards[0].mem_cnt = 0;
>>   
>> -
>>   	return 0;
>>   }
>>   
>> @@ -1461,7 +1475,7 @@ static int vga_arb_release(struct inode *inode, struct file *file)
>>   }
>>   
>>   /*
>> - * callback any registered clients to let them know we have a
>> + * Callback any registered clients to let them know we have a
>>    * change in VGA cards
>>    */
>>   static void vga_arbiter_notify_clients(void)
>> @@ -1500,9 +1514,11 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>   	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
>>   		return 0;
>>   
>> -	/* For now we're only intereted in devices added and removed. I didn't
>> +	/*
>> +	 * For now we're only intereted in devices added and removed. I didn't
>>   	 * test this thing here, so someone needs to double check for the
>> -	 * cases of hotplugable vga cards. */
>> +	 * cases of hotplugable vga cards.
>> +	 */
>>   	if (action == BUS_NOTIFY_ADD_DEVICE)
>>   		notify = vga_arbiter_add_pci_device(pdev);
>>   	else if (action == BUS_NOTIFY_DEL_DEVICE)
>> @@ -1543,8 +1559,10 @@ static int __init vga_arb_device_init(void)
>>   
>>   	bus_register_notifier(&pci_bus_type, &pci_notifier);
>>   
>> -	/* We add all PCI devices satisfying VGA class in the arbiter by
>> -	 * default */
>> +	/*
>> +	 * We add all PCI devices satisfying VGA class in the arbiter by
>> +	 * default
>> +	 */
>>   	while (1) {
>>   		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
>>   		if (!pdev)
>> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
>> index b4b9137f9792..6d5465f8c3f2 100644
>> --- a/include/linux/vgaarb.h
>> +++ b/include/linux/vgaarb.h
>> @@ -96,7 +96,7 @@ static inline int vga_client_register(struct pci_dev *pdev,
>>   static inline int vga_get_interruptible(struct pci_dev *pdev,
>>   					unsigned int rsrc)
>>   {
>> -       return vga_get(pdev, rsrc, 1);
>> +	return vga_get(pdev, rsrc, 1);
>>   }
>>   
>>   /**
>> @@ -111,7 +111,7 @@ static inline int vga_get_interruptible(struct pci_dev *pdev,
>>   static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>>   					  unsigned int rsrc)
>>   {
>> -       return vga_get(pdev, rsrc, 0);
>> +	return vga_get(pdev, rsrc, 0);
>>   }
>>   
>>   static inline void vga_client_unregister(struct pci_dev *pdev)
>> -- 
>> 2.25.1

-- 
Jingfeng

