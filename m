Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFB5B320C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E2D10EBF0;
	Fri,  9 Sep 2022 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3310EBF0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662713120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2375jzK4L/VUdiKpDPnBq2OpG9wMKoV+TqOTUCux+Gw=;
 b=V62pMVxfWy8dhZk5HOTlXwXIN8aMpmzj1asNZ0DNGs4CgBSbQlHDddtXFKlUKSVbHtwLkT
 9nPmGaHTNzCEYULpAssf46DTzqGlQunOLVZQXQMFvAfKV9Z3sQaNoteSnlGktKR4a6haUG
 XprNP9G0R4viQCdrnFgZ9avvWARoNwA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-fjuGZ_oLPYGuVltzxQ2dOg-1; Fri, 09 Sep 2022 04:45:17 -0400
X-MC-Unique: fjuGZ_oLPYGuVltzxQ2dOg-1
Received: by mail-ed1-f69.google.com with SMTP id
 p4-20020a056402500400b00447e8b6f62bso773071eda.17
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 01:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2375jzK4L/VUdiKpDPnBq2OpG9wMKoV+TqOTUCux+Gw=;
 b=qd0YbD2T86DECWlgYH8duJO5OvvJ57Jm7rWFw2g9pd/t45kVMHSfPmBjt5F/oXl8xk
 s9U6NHu7u0NmEwh3KJDVVJtiEzMi5rc0RSeqwv9FABUy5uKKSTObXs83XMcUnLMLfKP4
 dR4HJ/SZkjUuRyht3E0ZaEXbP5VCFTvaya/Z1XCH4OV5Brh/E9TBOO+zorVWCcwqHFzE
 zl/y/opfwZ80ORc/ySeoeQ6iP9U2Cbd33j/1NljUcJRA5m9LjKoikSEhrk7aKCDBAYVs
 C4SS69KaM/bWDcny9M9JQsizRi0/OnaWX1AV8bmMqc4x2GbtcPm4WC3CUPvJjCG1wi/Y
 x8jw==
X-Gm-Message-State: ACgBeo2WadTeCPYrxgggb9fzzYg7VXriGXvDwFW20XrUQIsvP8L6Mskz
 vadygAsMMe43ygjtccLuXOLE7XmA19RuTOk18J8oxjvl6sW4KBWANKmxPqw5HsnF6otmBNpO8Hn
 kaUmJX7dpkNj7GJezMdQOTrXLhmmx
X-Received: by 2002:a17:907:a422:b0:73f:18a8:4137 with SMTP id
 sg34-20020a170907a42200b0073f18a84137mr9377194ejc.10.1662713115971; 
 Fri, 09 Sep 2022 01:45:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GaeenrsBi1qU351edaTBnXcBw7khS1d/f9vTVKQYkePm4995cleAAYRJCkH/W+tK2/C2y0w==
X-Received: by 2002:a17:907:a422:b0:73f:18a8:4137 with SMTP id
 sg34-20020a170907a42200b0073f18a84137mr9377174ejc.10.1662713115512; 
 Fri, 09 Sep 2022 01:45:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b0073100dfa7b5sm655635ejh.33.2022.09.09.01.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:45:15 -0700 (PDT)
Message-ID: <07347903-f8b2-d2ad-4c86-651243a2090a@redhat.com>
Date: Fri, 9 Sep 2022 10:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] drm/gma500: Fix (vblank) IRQs not working after
 suspend/resume
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-4-hdegoede@redhat.com>
 <CAMeQTsYwrtAwb2_Lj2RyrWCov88Nq=-_tScD5dXC548Fog3X0w@mail.gmail.com>
 <69fc33c6-b6b0-ba98-d2c6-0fb35df63933@redhat.com>
 <CAMeQTsae12K7WzCBQSVoMk5+CO1H6tO=r0iAfsqNo96ekp4SmA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsae12K7WzCBQSVoMk5+CO1H6tO=r0iAfsqNo96ekp4SmA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/9/22 09:34, Patrik Jakobsson wrote:
> On Thu, Sep 8, 2022 at 3:39 PM Hans de Goede
> <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 9/8/22 15:26, Patrik Jakobsson wrote:
>>> On Tue, Sep 6, 2022 at 10:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Fix gnome-shell (and other page-flip users) hanging after suspend/resume
>>>> because of the gma500's IRQs not working.
>>>>
>>>> This fixes 2 problems with the IRQ handling:
>>>>
>>>> 1. gma_power_off() calls gma_irq_uninstall() which does a free_irq(), but
>>>>    gma_power_on() called gma_irq_preinstall() + gma_irq_postinstall() which
>>>>    do not call request_irq. Replace the pre- + post-install calls with
>>>>    gma_irq_install() which does prep + request + post.
>>>
>>> Hmm, I don't think we're supposed to do free_irq() during suspend in
>>> the first place. request_irq() and free_irq() are normally only called
>>> in the pci device probe/remove hooks. Same is true for msi
>>> enable/disable.
>>
>> Right. I first tried to switch to disable_irq() / enable_irq() which are
>> expected to be used during suspend/resume. That did resolve the issue
>> of there no longer being an IRQ handler registered after suspend/resume,
>> but the IRQ still would no longer fire after a suspend/resume.
> 
> The irq enable/disable is handled by writing PSB_INT_ENABLE_R in
> gma_irq_install/uninstall(). Also using disable_irq() and enable_irq()
> shouldn't be required. But the docs could be wrong and this might fix
> the interrupts I'm seeing on PSB after resume.

That just disables the sender of the IRQ, where as disable_irq()
disables the IRQ at the receiving end. And the sending end goes
in full powerdown during suspend, after which the IRQ line might
float or be pulled in a specific direction by the powered-down
display-engine block.

So yes this might be the cause of the "irq 16: nobody cared"
message.

Note that on the Packard Bell Dot SC when I disable MSI the
IRQ line is shared with an UHCI controller, so that might
be part of the problem here too.

>> So then I tried the pci_disable_msi() + pci_enable_msi() and that
>> did the trick. And since we should not call pci_disable_msi() with an
>> IRQ handler registered I decided to keep the free_irq + request_irq
>> over suspend/resume.
> 
> Ok, then I understand your motivation for the free/request dance.
> However, I would argue that if this problem is specific to your
> Packard Bell Dot SC it is better handled with a quirk.

I only have the one machine to test on. But the Packard Bell Dot SC
is actually a rebrand of the somewhat popular Acer Aspire One D270
up to the point where they both use the same BIOS updater. So if we
go with a quirk this should at least also apply to the Acer AOD270,
but I expect more models to be impacted by this. Typically the BIOS-es
on these devices are a copy & paste job from some reference
implementation.

And this workaround should work fine on machines which don't stricly
need it too. So my preference would be to just do this everywhere.

>> Another option is to never call pci_enable_msi() and use APIC style
>> IRQs instead. At least on the Packard Bell Dot SC (cedarview) that
>> works.
> 
> Yes, the quirk could be to not use MSI on the Packard Bell Dot SC. But
> let me check this on other Cedarview systems first.

Not using MSI means sharing the IRQ, which although it should work fine
is better to avoid.

I wonder if you have ever tried enabling MSI on a poulsebo machine ?

>>> I can take this patch as is since it improves on the current situation
>>> but feel free to dig deeper if you like.
>>
>> I'm not sure what else I can do to dig deeper though. TBH I'm happy
>> I managed to come up with something which works at all.
> 
> Digging deeper would be to figure out why pci_restore_msi_state() is
> not doing its job.

Yes that would be an option. I suspect that the issue actually a setting
on the PCI host bridge side which gets poked by the BIOS during S3
suspend and pci_restore_msi_state() presumable only touched
the devices state.  While pci_enable_msi() (presumably) also re-does
the host side of the MSI setup.  Anyways I'm afraid I don't have
time to investigate this further.

> The fact that gma500 is touching those MSI
> registers in PCI config space manually is worrying. Did you test if
> MSI works after resume if you remove the save/restore of
> PSB_PCIx_MSI_ADDR_LOC and PSB_PCIx_MSI_DATA_LOC?

Yes I did try removing those save/restores and that did not help.

Note that this patch does get rid of them.

>>> On Poulsbo I can see
>>> interrupts not getting handled during suspend/resume even with this
>>> patch applied.
>>
>> "during" ?  I guess you mean _after_ a suspend/resume ?
> 
> Yes. I get: irq 16: nobody cared (try booting with the "irqpoll" option).
> But perhaps the system is just too slow to respond.
> 
>>
>> I have been refactoring the backlight (detection) code on
>> x86/acpi devices. See:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
>>
>> As you can see there are also some drm driver changes involved for
>> all the (non virtual) drm/kms drivers used on x86/acpi laptops.
>>
>> I am working on also making matching changes (*) to the gma500 code,
>> which is why I scrounged up the Packard Bell Dot SC I'm testing this on.
> 
> I'll have a look.
> 
>>
>> So all the fixes in this series are somewhat of a distraction of what
>> I'm actually trying to acomplish.
> 
> Fair enough, let's not focus too much on the details here. I can take
> this patch as is so you can continue work on the backlight code.
> Sounds good?

Yes if you can take this patch as is that would be great.

Note I have commit/push rights to all the drm-* repositories myself
too. So if you prefer you can just give your Acked-by or Reviewed-by
and then I can push things out myself.

>> I have also scrounged up a Sony Vaio VPCX11S1E which has an Atom
>> Z540 with PSB graphics. I have yet to test on that one though...
> 
> If you do, bring lots of patience. Those systems are very slow. You
> can literally sip on coffee while waiting for the cursor to move :)

Hehe, I'll survive :)

Regards,

Hans




>> *) For wip code see:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commits/main
>>
>> and specifically:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commit/97a1dbbd320b0bdbacf935e52f786e8185005298
>>
>> which unifies the backlight handling between all 3 different
>> SoC types supported by the gma500 code resulting in a nice cleanup.
>>
>>
>>
>>
>>
>>>> 2. After fixing 1. IRQs still do not work on a Packard Bell Dot SC (Intel
>>>>    Atom N2600, cedarview) netbook.
>>>>
>>>>    Cederview uses MSI interrupts and it seems that the BIOS re-configures
>>>>    things back to normal APIC based interrupts during S3 suspend. There is
>>>>    some MSI PCI-config registers save/restore code which tries to deal with
>>>>    this, but on the Packard Bell Dot SC this is not sufficient to restore
>>>>    MSI IRQ functionality after a suspend/resume.
>>>>
>>>>    Replace the PCI-config registers save/restore with pci_disable_msi() on
>>>>    suspend + pci_enable_msi() on resume. Fixing e.g. gnome-shell hanging.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/gpu/drm/gma500/cdv_device.c      |  4 +---
>>>>  drivers/gpu/drm/gma500/oaktrail_device.c |  5 +----
>>>>  drivers/gpu/drm/gma500/power.c           |  8 +-------
>>>>  drivers/gpu/drm/gma500/psb_drv.c         |  2 +-
>>>>  drivers/gpu/drm/gma500/psb_drv.h         |  5 +----
>>>>  drivers/gpu/drm/gma500/psb_irq.c         | 15 ++++++++++++---
>>>>  drivers/gpu/drm/gma500/psb_irq.h         |  2 +-
>>>>  7 files changed, 18 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
>>>> index dd32b484dd82..ce96234f3df2 100644
>>>> --- a/drivers/gpu/drm/gma500/cdv_device.c
>>>> +++ b/drivers/gpu/drm/gma500/cdv_device.c
>>>> @@ -581,11 +581,9 @@ static const struct psb_offset cdv_regmap[2] = {
>>>>  static int cdv_chip_setup(struct drm_device *dev)
>>>>  {
>>>>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>>>> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>>         INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
>>>>
>>>> -       if (pci_enable_msi(pdev))
>>>> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
>>>> +       dev_priv->use_msi = true;
>>>>         dev_priv->regmap = cdv_regmap;
>>>>         gma_get_core_freq(dev);
>>>>         psb_intel_opregion_init(dev);
>>>> diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
>>>> index 5923a9c89312..f90e628cb482 100644
>>>> --- a/drivers/gpu/drm/gma500/oaktrail_device.c
>>>> +++ b/drivers/gpu/drm/gma500/oaktrail_device.c
>>>> @@ -501,12 +501,9 @@ static const struct psb_offset oaktrail_regmap[2] = {
>>>>  static int oaktrail_chip_setup(struct drm_device *dev)
>>>>  {
>>>>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>>>> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>>         int ret;
>>>>
>>>> -       if (pci_enable_msi(pdev))
>>>> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
>>>> -
>>>> +       dev_priv->use_msi = true;
>>>>         dev_priv->regmap = oaktrail_regmap;
>>>>
>>>>         ret = mid_chip_setup(dev);
>>>> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
>>>> index b91de6d36e41..66873085d450 100644
>>>> --- a/drivers/gpu/drm/gma500/power.c
>>>> +++ b/drivers/gpu/drm/gma500/power.c
>>>> @@ -139,8 +139,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
>>>>         dev_priv->regs.saveBSM = bsm;
>>>>         pci_read_config_dword(pdev, 0xFC, &vbt);
>>>>         dev_priv->regs.saveVBT = vbt;
>>>> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, &dev_priv->msi_addr);
>>>> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, &dev_priv->msi_data);
>>>>
>>>>         pci_disable_device(pdev);
>>>>         pci_set_power_state(pdev, PCI_D3hot);
>>>> @@ -168,9 +166,6 @@ static bool gma_resume_pci(struct pci_dev *pdev)
>>>>         pci_restore_state(pdev);
>>>>         pci_write_config_dword(pdev, 0x5c, dev_priv->regs.saveBSM);
>>>>         pci_write_config_dword(pdev, 0xFC, dev_priv->regs.saveVBT);
>>>> -       /* restoring MSI address and data in PCIx space */
>>>> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, dev_priv->msi_addr);
>>>> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, dev_priv->msi_data);
>>>>         ret = pci_enable_device(pdev);
>>>>
>>>>         if (ret != 0)
>>>> @@ -223,8 +218,7 @@ int gma_power_resume(struct device *_dev)
>>>>         mutex_lock(&power_mutex);
>>>>         gma_resume_pci(pdev);
>>>>         gma_resume_display(pdev);
>>>> -       gma_irq_preinstall(dev);
>>>> -       gma_irq_postinstall(dev);
>>>> +       gma_irq_install(dev);
>>>>         mutex_unlock(&power_mutex);
>>>>         return 0;
>>>>  }
>>>> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
>>>> index 1d8744f3e702..54e756b48606 100644
>>>> --- a/drivers/gpu/drm/gma500/psb_drv.c
>>>> +++ b/drivers/gpu/drm/gma500/psb_drv.c
>>>> @@ -383,7 +383,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>>>>         PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
>>>>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>>>>
>>>> -       gma_irq_install(dev, pdev->irq);
>>>> +       gma_irq_install(dev);
>>>>
>>>>         dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
>>>>
>>>> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
>>>> index 0ea3d23575f3..731cc356c07a 100644
>>>> --- a/drivers/gpu/drm/gma500/psb_drv.h
>>>> +++ b/drivers/gpu/drm/gma500/psb_drv.h
>>>> @@ -490,6 +490,7 @@ struct drm_psb_private {
>>>>         int rpm_enabled;
>>>>
>>>>         /* MID specific */
>>>> +       bool use_msi;
>>>>         bool has_gct;
>>>>         struct oaktrail_gct_data gct_data;
>>>>
>>>> @@ -499,10 +500,6 @@ struct drm_psb_private {
>>>>         /* Register state */
>>>>         struct psb_save_area regs;
>>>>
>>>> -       /* MSI reg save */
>>>> -       uint32_t msi_addr;
>>>> -       uint32_t msi_data;
>>>> -
>>>>         /* Hotplug handling */
>>>>         struct work_struct hotplug_work;
>>>>
>>>> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
>>>> index e6e6d61bbeab..038f18ed0a95 100644
>>>> --- a/drivers/gpu/drm/gma500/psb_irq.c
>>>> +++ b/drivers/gpu/drm/gma500/psb_irq.c
>>>> @@ -316,17 +316,24 @@ void gma_irq_postinstall(struct drm_device *dev)
>>>>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>>>>  }
>>>>
>>>> -int gma_irq_install(struct drm_device *dev, unsigned int irq)
>>>> +int gma_irq_install(struct drm_device *dev)
>>>>  {
>>>> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>>>> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>>         int ret;
>>>>
>>>> -       if (irq == IRQ_NOTCONNECTED)
>>>> +       if (dev_priv->use_msi && pci_enable_msi(pdev)) {
>>>> +               dev_warn(dev->dev, "Enabling MSI failed!\n");
>>>> +               dev_priv->use_msi = false;
>>>> +       }
>>>> +
>>>> +       if (pdev->irq == IRQ_NOTCONNECTED)
>>>>                 return -ENOTCONN;
>>>>
>>>>         gma_irq_preinstall(dev);
>>>>
>>>>         /* PCI devices require shared interrupts. */
>>>> -       ret = request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
>>>> +       ret = request_irq(pdev->irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> @@ -369,6 +376,8 @@ void gma_irq_uninstall(struct drm_device *dev)
>>>>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>>>>
>>>>         free_irq(pdev->irq, dev);
>>>> +       if (dev_priv->use_msi)
>>>> +               pci_disable_msi(pdev);
>>>>  }
>>>>
>>>>  int gma_crtc_enable_vblank(struct drm_crtc *crtc)
>>>> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
>>>> index b51e395194ff..7648f69824a5 100644
>>>> --- a/drivers/gpu/drm/gma500/psb_irq.h
>>>> +++ b/drivers/gpu/drm/gma500/psb_irq.h
>>>> @@ -17,7 +17,7 @@ struct drm_device;
>>>>
>>>>  void gma_irq_preinstall(struct drm_device *dev);
>>>>  void gma_irq_postinstall(struct drm_device *dev);
>>>> -int  gma_irq_install(struct drm_device *dev, unsigned int irq);
>>>> +int  gma_irq_install(struct drm_device *dev);
>>>>  void gma_irq_uninstall(struct drm_device *dev);
>>>>
>>>>  int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
>>>> --
>>>> 2.37.2
>>>>
>>>
>>
> 

