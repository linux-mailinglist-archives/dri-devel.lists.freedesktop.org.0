Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFEE75A1FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 00:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F7510E529;
	Wed, 19 Jul 2023 22:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B22110E525;
 Wed, 19 Jul 2023 22:32:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxBfFzZLhkPnUHAA--.18889S3;
 Thu, 20 Jul 2023 06:32:19 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c5zZLhkDh41AA--.15520S3; 
 Thu, 20 Jul 2023 06:32:19 +0800 (CST)
Message-ID: <f87a48c6-909e-39ba-62b0-289e78798540@loongson.cn>
Date: Thu, 20 Jul 2023 06:32:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/9] PCI/VGA: Improve the default VGA device selection
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230719193233.GA511659@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230719193233.GA511659@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cx_c5zZLhkDh41AA--.15520S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF18WFW7Cw1kAr15Zr15Jrc_yoW5Jr1rp3
 yaga1akrs7XFWUtry7A34kXFyavw4fX3yrGr1rG34j9398G3s5JrW8Ka15Ka47Zw18WF42
 vFy8tw12kay5Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8
 Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8jQ6J
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/20 03:32, Bjorn Helgaas wrote:
> [+cc linux-pci (please cc in the future since the bulk of this patch
> is in drivers/pci/)]
>
> On Wed, Jul 12, 2023 at 12:43:05AM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Currently, the strategy of selecting the default boot on a multiple video
>> card coexistence system is not perfect. Potential problems are:
>>
>> 1) This function is a no-op on non-x86 architectures.
> Which function in particular is a no-op for non-x86?


I refer to the vga_is_firmware_default() function,

I will improve the commit message at the next version. (To make it more 
human readable).

Thanks you point it out.


>> 2) It does not take the PCI Bar may get relocated into consideration.
>> 3) It is not effective for the PCI device without a dedicated VRAM Bar.
>> 4) It is device-agnostic, thus it has to waste the effort to iterate all
>>     of the PCI Bar to find the VRAM aperture.
>> 5) It has invented lots of methods to determine which one is the default
>>     boot device, but this is still a policy because it doesn't give the
>>     user a choice to override.
> I don't think we need a list of *potential* problems.  We need an
> example of the specific problem this will solve, i.e., what currently
> does not work?

1) The selection of primary GPU on Non-x86 platform. (Arm64, risc-v, 
powerpc etc)

Mostly server platforms have equipped with aspeed bmc, and such hardware 
platforms have a lot PCIe slot.

So I think, aspeed bmc V.S (P.K) radeon(or amdgpu) is very common.


2) The ability to pass the control back to the end user.

Convert the *device driven* to the "driver driven" or "human driven".

Currently, it is the machine making the decision.

Emm, I probably will be able to give some examples at the next version.


> The drm/ast and maybe drm/loongson patches are the only ones that use
> the new callback, so I assume there are real problems with those
> drivers.
>
> CONFIG_DRM_AST is a tristate.  We're talking about identifying the
> boot-time console device.  So if CONFIG_DRM_AST=m, I guess we don't
> get the benefit of the new callback unless the module gets loaded?
>
Since, this patch set is mostly for the user of X server.

It is actually okey if CONFIG_DRM_AST=m. (it will be works no matter CONFIG_DRM_AST=m or CONFIG_DRM_AST=y)


As the device and the driver bound at a latter time.

So we are lucky, we need this behavior to implement the override.

