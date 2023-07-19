Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D475A08F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 23:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE210E51F;
	Wed, 19 Jul 2023 21:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AD2A10E51E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 21:27:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxrutMVbhkinAHAA--.16356S3;
 Thu, 20 Jul 2023 05:27:40 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF8xLVbhkCBc1AA--.40637S3; 
 Thu, 20 Jul 2023 05:27:39 +0800 (CST)
Message-ID: <bf783bdf-d9e9-127b-cad2-4e19a28b3702@loongson.cn>
Date: Thu, 20 Jul 2023 05:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230719182617.GA509912@bhelgaas>
 <1a10cb43-7c96-069a-bdd2-3a8cdb7727e1@linux.dev>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <1a10cb43-7c96-069a-bdd2-3a8cdb7727e1@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxF8xLVbhkCBc1AA--.40637S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXrykZr1kKw1kCw1kXw45CFX_yoW5ZFWfp3
 48G343G3y0qw1IgrW7ZF18CryUGFy5Ca4UJryftF18Ga12gwn7t3ZIvr4Y9ry5Jr4Fvr12
 yrs7K34Svw47AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Wrv_ZF1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4BHqDUUUU
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/20 05:13, Sui Jingfeng wrote:
> Otherwise there 30+ noisy(useless) events got snooped. See below:
>
>
> ```
>
> [    0.246077] pci 0000:01:00.0: vgaarb: setting as boot VGA device
> [    0.246077] pci 0000:01:00.0: vgaarb: bridge control possible
> [    0.246077] pci 0000:01:00.0: vgaarb: VGA device added: 
> decodes=io+mem,owns=io+mem,locks=none
> [    0.246077] vgaarb: loaded
> [    0.294169] skl_uncore 0000:00:00.0: vgaarb: pci_notify: action=3
> [    0.294182] skl_uncore 0000:00:00.0: vgaarb: pci_notify: action=4
> [    0.301297] pcieport 0000:00:01.0: vgaarb: pci_notify: action=3
> [    0.301482] pcieport 0000:00:01.0: vgaarb: pci_notify: action=4
> [    0.301488] pcieport 0000:00:1c.0: vgaarb: pci_notify: action=3
> [    0.301705] pcieport 0000:00:1c.0: vgaarb: pci_notify: action=4
> [    1.806445] xhci_hcd 0000:00:14.0: vgaarb: pci_notify: action=3
> [    1.810976] ahci 0000:00:17.0: vgaarb: pci_notify: action=3
> [    1.824383] xhci_hcd 0000:00:14.0: vgaarb: pci_notify: action=4
> [    1.857470] ahci 0000:00:17.0: vgaarb: pci_notify: action=4
> [    4.692700] intel_pch_thermal 0000:00:14.2: vgaarb: pci_notify: 
> action=3
> [    4.693110] intel_pch_thermal 0000:00:14.2: vgaarb: pci_notify: 
> action=4
> [    4.746712] i801_smbus 0000:00:1f.4: vgaarb: pci_notify: action=3
> [    4.747212] pci 0000:00:1f.1: vgaarb: pci_notify: action=0
> [    4.747227] pci 0000:00:1f.1: vgaarb: pci_notify: action=1
> [    4.747250] pci 0000:00:1f.1: vgaarb: pci_notify: action=2
> [    4.749098] i801_smbus 0000:00:1f.4: vgaarb: pci_notify: action=4
> [    4.799217] mei_me 0000:00:16.0: vgaarb: pci_notify: action=3
> [    4.802503] mei_me 0000:00:16.0: vgaarb: pci_notify: action=4
> [    4.874880] intel-lpss 0000:00:15.0: vgaarb: pci_notify: action=3
> [    4.881227] intel-lpss 0000:00:15.0: vgaarb: pci_notify: action=4
> [    4.881240] intel-lpss 0000:00:15.1: vgaarb: pci_notify: action=3
> [    4.887578] intel-lpss 0000:00:15.1: vgaarb: pci_notify: action=4
> [    4.985796] r8169 0000:02:00.0: vgaarb: pci_notify: action=3
> [    4.991862] r8169 0000:02:00.0: vgaarb: pci_notify: action=4
> [    5.404835] snd_hda_intel 0000:00:1f.3: vgaarb: pci_notify: action=3
> [    5.405175] snd_hda_intel 0000:00:1f.3: vgaarb: pci_notify: action=4
> [    5.405401] snd_hda_intel 0000:01:00.1: vgaarb: pci_notify: action=3
> [    5.405973] snd_hda_intel 0000:01:00.1: vgaarb: pci_notify: action=4
> [   10.793665] i915 0000:00:02.0: vgaarb: pci_notify: action=3
> [   11.201384] i915 0000:00:02.0: vgaarb: pci_notify: action=4
> [   16.135842] amdgpu 0000:01:00.0: vgaarb: pci_notify: action=3
> [   16.140458] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
> [   16.638564] amdgpu 0000:01:00.0: vgaarb: pci_notify: action=4
>
> ``` 


After apply my patch, this events are still will notify me, it is just 
that if we found it is irrelevant, we will return immediately.

No further process is needed.

