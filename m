Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA9543F39
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405E9112BE5;
	Wed,  8 Jun 2022 22:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECB7112BE4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 22:36:05 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKKER-1oKJmj0RrD-00LjJZ; Thu, 09 Jun 2022 00:35:34 +0200
Message-ID: <d315b387-8500-ceee-d7ef-1d11779baf54@i2se.com>
Date: Thu, 9 Jun 2022 00:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Peter Robinson <pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <20220608125113.q6bfhf3o424iwuzn@mail.igalia.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220608125113.q6bfhf3o424iwuzn@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XeocH6bh5+umXROrV69UM9f2AoqI2hCIywMcMk0r6wzLP9EGcrh
 H5h+/qRx+GQMDNtmdXGFc7IhlyO8aOWmH2d3n5IDrtUwD2QYsOYnNM/0Rf5tQL6qWk/nFpO
 YDfXWXZPSX2TO7+lttmWYM20jnaOXV/faQir16UumJIAoXMsrsMz/ogkxRigXS81sXc/Ypl
 wcMfOgppIbjYJ2+/ZmbhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2VfwKV7+e14=:qQmsPFZm+fXF28lz48QiKC
 Efl6HjpqxHVSeppd8KOGzDJ8Wwnj0SWuWlmBhUTdiv/7aEtFBa0Ea7la5N+6Wn03n8/aN4CA7
 g9BmT94R/ucZcfYJ+87R0M21Vs/aa5rhCOFIq2RTMTjRUzIW+CsRtqYtbP2BaPfvhWzETGtsS
 Rz/mRxQzJi6Tds4sdEXN935ZH5omOK22hegFbinW2M6SpsFOiN/CGqZklwd8PBSLdhbQmxGmL
 wJzfukWWq34XVvn+iQDyyTw0JfFUlbLIji3X33vWLr5XcZkEs0Qjv7COHcGaGi7sKL4LdoS2g
 Ykqch9R5Y28ncWJynlVcd7POMdkaguOKGZiNE1bA+THjihtPiLtpxZFroDBFme/WsMFVpEiQi
 Si2/5W+v/D8Yig/fGyxE9+ku+b6VpRodDHWFzv+taNtjMo0aDoesFE8v0UK9jM2ghP3ROGLZh
 UklNvxafkJUr/adAGebfY9bOQSfaYhQ+tCzSRc6NGarSVv5GRcUV4Q1RHyX0o/QoOqDO8XMLf
 vXKY4bsSQRfKo/E4HIwrqEZoJKAp2kZdOR4II5yc5QNbf9+1xPbabnp3CCgSndi5S/6agVaeF
 VtyXapyxchdT8tExV192A+WGkL6xItL3CIcK1kd0u8LXN37D/sXwN+MfYdBDJ6RA7R+Zz0pf3
 vnudHoW4/AroOkITLraJa4M8IJeZ+d97zTfcmsq/HNUZVqfhwl2BuGIA43u5Kp79h620DUphG
 1Zht/M5BfKktRFDWeO45Zgr1VEhpAVh2EVBkO7LskPpoWhKdPVmq0sM0S9Y=
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Emma Anholt <emma@anholt.net>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

Am 08.06.22 um 14:51 schrieb Melissa Wen:
> On 06/03, Peter Robinson wrote:
>> This is a follow up from my v4 patchset. The power management pieces have
>> been split out to a separate independent set of patches by Stefan [1]. This
>> version 5 of the DRM patches are independent and given the V3D driver has
>> been upstream for some time the two patches to enable it in defconfigs can
>> be taken at anytime independent of the enablement for the Raspberry Pi 4.
> Hi Peter,
>
> I was able to check and run some tests on arm64, and it seems ok. But I
> was not successful on bringing it up for arm using multi_v7_defconfig +
> device_tree=bcm2711-rpi-4-b.dtb.

for Raspberry Pi 4 you also need to enable CONFIG_ARM_LPAE, which is not 
enabled in multi_v7_defconfig.

Best regards

>
> How can I check this path?
>
> Btw, using the config from rpi downstream kernel works nicely for arm
> (on my side)
>
> Best regards,
>
> Melissa
>> I've tested this using mesa 22.0.x and Wayland/Gnome on Fedora 36, it's
>> more or less stable with basic testing.
>>
>> Changes since v5:
>> - Update the DT compatible to match the others that were updated
>> - Adjust the Kconfig help text
>> - Add review tags
>>
>> Changes since v4:
>> - Fixes for device tree and bindings
>> - Split out the power management changes into an independent set
>> - Rebase to 5.18
>> - Individual changes in patches
>>
>> [1] https://www.spinics.net/lists/arm-kernel/msg980342.html
>>
>> Nicolas Saenz Julienne (1):
>>    arm64: config: Enable DRM_V3D
>>
>> Peter Robinson (5):
>>    dt-bindings: gpu: v3d: Add BCM2711's compatible
>>    drm/v3d: Get rid of pm code
>>    drm/v3d: Add support for bcm2711
>>    ARM: dts: bcm2711: Enable V3D
>>    ARM: configs: Enable DRM_V3D
>>
>>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml  |  1 +
>>   arch/arm/boot/dts/bcm2711-rpi.dtsi             |  4 ++++
>>   arch/arm/boot/dts/bcm2711.dtsi                 | 11 +++++++++++
>>   arch/arm/configs/bcm2835_defconfig             |  1 +
>>   arch/arm/configs/multi_v7_defconfig            |  1 +
>>   arch/arm64/configs/defconfig                   |  1 +
>>   drivers/gpu/drm/v3d/Kconfig                    |  5 +++--
>>   drivers/gpu/drm/v3d/v3d_debugfs.c              | 18 +-----------------
>>   drivers/gpu/drm/v3d/v3d_drv.c                  | 12 +-----------
>>   drivers/gpu/drm/v3d/v3d_gem.c                  | 12 +-----------
>>   10 files changed, 25 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.36.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
