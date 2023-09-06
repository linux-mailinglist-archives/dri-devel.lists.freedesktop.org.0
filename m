Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD77933A4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 04:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF510E31B;
	Wed,  6 Sep 2023 02:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B86510E31B;
 Wed,  6 Sep 2023 02:14:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRvGJ4Pdk4gUgAA--.64358S3;
 Wed, 06 Sep 2023 10:14:33 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx5syE4PdknuBtAA--.47306S3; 
 Wed, 06 Sep 2023 10:14:29 +0800 (CST)
Message-ID: <42c907fe-a8c3-5a07-a792-737e45f8134e@loongson.cn>
Date: Wed, 6 Sep 2023 10:14:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx5syE4PdknuBtAA--.47306S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4kKr4xGF13Aw4ruFyrZrc_yoW8ZFy8pF
 W5K3W29w4kKw1Yq34xZrnakF45Gws5AFyrC348KwnruFsxu340g34DtFW5Wa47J34FvF15
 tF98G3WvgF4UJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDU
 UUU
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/5 23:05, Thomas Zimmermann wrote:
> However, on modern Linux systems the primary display does not really 
> exist.


No, it do exist.  X server need to know which one is the primary GPU.
The '*' character at the of (4@0:0:0) PCI device is the Primary.
The '*' denote primary, see the log below.

(II) xfree86: Adding drm device (/dev/dri/card2)
(II) xfree86: Adding drm device (/dev/dri/card0)
(II) Platform probe for 
/sys/devices/pci0000:00/0000:00:1c.5/0000:003:00.0/0000:04:00.0/drm/card0
(II) xfree86: Adding drm device (/dev/dri/card3)
(II) Platform probe for 
/sys/devices/pci0000:00/0000:00:1c.6/0000:005:00.0/drm/card3
(--) PCI: (0@0:2:0) 8086:3e91:8086:3e91 rev 0, Mem @ 
0xdb000000/167777216, 0xa0000000/536870912, I/O @ 0x0000f000/64, BIOS @ 
0x????????/131072
(--) PCI: (1@0:0:0) 1002:6771:1043:8636 rev 0, Mem @ 
0xc0000000/2688435456, 0xdf220000/131072, I/O @ 0x0000e000/256, BIOS @ 
0x????????/131072
(--) PCI:*(4@0:0:0) 1a03:2000:1a03:2000 rev 48, Mem @ 
0xde000000/166777216, 0xdf020000/131072, I/O @ 0x0000c000/128, BIOS @ 
0x????????/131072
(--) PCI: (5@0:0:0) 10de:1288:174b:b324 rev 161, Mem @ 
0xdc000000/116777216, 0xd0000000/134217728, 0xd8000000/33554432, I/O @ 
0x0000b000/128, BIOS @@0x????????/524288

The modesetting driver of X server will create framebuffer on the primary video adapter.
If a 2D video adapter (like the aspeed BMC) is not the primary, then it probably will not
be used. The only chance to be able to display something is to functional as a output slave.
But the output slave technology need the PRIME support for cross driver buffer sharing.

So, there do have some difference between the primary and non-primary video adapters.


> 'Primary' is the device that is available via VGA, VESA or EFI. Our 
> drivers don't use these interfaces, but the native registers. As you 
> said yourself, these firmware devices (VGA, VESA, EFI) are removed 
> ASAP by the native drivers. 

