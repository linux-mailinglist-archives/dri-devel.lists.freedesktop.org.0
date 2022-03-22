Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8914E3FAC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4410E709;
	Tue, 22 Mar 2022 13:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0E6210E709
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:38:34 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:60198.555504461
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id C74A8100225;
 Tue, 22 Mar 2022 21:38:28 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 bbab2de56e904e23a38356a55f9eb734 for jiaxun.yang@flygoat.com; 
 Tue, 22 Mar 2022 21:38:31 CST
X-Transaction-ID: bbab2de56e904e23a38356a55f9eb734
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
Date: Tue, 22 Mar 2022 21:38:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/22 21:05, Jiaxun Yang wrote:
>
>
> 在 2022/3/21 16:29, Sui Jingfeng 写道:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
>> mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe GEN2 x8 slot,
>> therefore can play with discrete graphics card.
>
> Hi Jingfeng,
>
> As we've discussed before if you are going to introduce new dts then 
> you *MUST*
> include it in makefile and wire it up in code.
>
> A dts file doing nothing lying in the tree is just suspicious.
>
> Thanks.
> - Jiaxun
>
Hi, Jiaxun,

I know what you means, but it is the kernel side developer's job.
I am just a naive graphic driver developer,I can not care so much.
Below is my private patch which can be used to built specific dts
into the linux kernel, therefore make the verification easier.


diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 5c6433e441ee..99b66675c4a1 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -1,9 +1,22 @@
  # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64_2core_2k1000.dtb
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_ls7a.dtb
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
+
+dtb-$(CONFIG_LOONGSON64_LS2K1000_PAI_V1_5)	+= ls2k1000_pai.dtb
+dtb-$(CONFIG_LOONGSON64_LS2K1000_EVB_V1_2)	+= ls2k1000_evb.dtb
+dtb-$(CONFIG_LOONGSON64_LS2K1000_GENERIC)	+= loongson64_2core_2k1000.dtb
+
+dtb-$(CONFIG_LOONGSON64_LS3A3000_LS7A1000)	+= loongson64c_4core_ls7a.dtb
+dtb-$(CONFIG_LOONGSON64_LS3A3000_RS780E)	+= loongson64c_4core_rs780e.dtb
+dtb-$(CONFIG_LOONGSON64_LS3B3000_RS780E)	+= loongson64c_8core_rs780e.dtb
+
+dtb-$(CONFIG_LOONGSON64_LS3A4000_7A1000_LEMOTE_A1901) += lemote_a1901.dtb
+dtb-$(CONFIG_LOONGSON64_LS3A4000_7A1000_EVB_V1_4) += ls3a4000_7a1000_evb.dtb
+dtb-$(CONFIG_LOONGSON64_LS3A4000_7A1000_GENERIC)  += loongson64g_4core_ls7a.dtb
+
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64_2core_2k1000.dtb
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64c_4core_ls7a.dtb
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64c_4core_rs780e.dtb
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64c_8core_rs780e.dtb
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64g_4core_ls7a.dtb
+dtb-$(CONFIG_LOONGSON64_BOARD_DEFAULT)	+= loongson64v_4core_virtio.dtb
  
  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
index 8be710557bdb..605bfa47b4b9 100644
--- a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -8,10 +8,10 @@
  #ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
  #define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
  
-extern u32 __dtb_loongson64_2core_2k1000_begin[];
-extern u32 __dtb_loongson64c_4core_ls7a_begin[];
-extern u32 __dtb_loongson64c_4core_rs780e_begin[];
-extern u32 __dtb_loongson64c_8core_rs780e_begin[];
-extern u32 __dtb_loongson64g_4core_ls7a_begin[];
-extern u32 __dtb_loongson64v_4core_virtio_begin[];
+extern u32 __weak __dtb_loongson64_2core_2k1000_begin[];
+extern u32 __weak __dtb_loongson64c_4core_ls7a_begin[];
+extern u32 __weak __dtb_loongson64c_4core_rs780e_begin[];
+extern u32 __weak __dtb_loongson64c_8core_rs780e_begin[];
+extern u32 __weak __dtb_loongson64g_4core_ls7a_begin[];
+extern u32 __weak __dtb_loongson64v_4core_virtio_begin[];
  #endif
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 517f1f8e81fb..7030185ed0c6 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -12,4 +12,43 @@ config RS780_HPET
  	  Note: This driver is doing some dangerous hack. Please only enable
  	  it on RS780E systems.
  
+choice
+	prompt "Board type"
+	depends on MACH_LOONGSON64
+	depends on BUILTIN_DTB
+	help
+	 pick a device tree that matches the target board.
+
+config LOONGSON64_BOARD_DEFAULT
+	bool "Default"
+
+config LOONGSON64_LS3A4000_7A1000_LEMOTE_A1901
+	bool "LEMOTE A1901 LS3A4000 board"
+
+config LOONGSON64_LS3A4000_7A1000_EVB_V1_4
+	bool "LS3A4000 LS7A1000 evaluation board v1.4"
+
+config LOONGSON64_LS3A4000_7A1000_GENERIC
+	bool "LS3A4000 LS7A1000 generic board"
+
+config LOONGSON64_LS3A3000_LS7A1000
+	bool "LS3A3000 LS7A1000 generic board"
+
+config LOONGSON64_LS3A3000_RS780E
+	bool "LS3A3000 RS780E generic board"
+
+config LOONGSON64_LS3B3000_RS780E
+	bool "LS3B3000 RS780E generic board"
+
+config LOONGSON64_LS2K1000_PAI_V1_5
+	bool "LS2K1000 PAI board V1.5"
+
+config LOONGSON64_LS2K1000_EVB_V1_2
+	bool "LS2K1000 evaluation board V1.2"
+
+config LOONGSON64_LS2K1000_GENERIC
+	bool "LS2K1000 generic"
+
+endchoice
+
  endif # MACH_LOONGSON64
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index cb10d14da433..f8859039a4e0 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -16,6 +16,13 @@ void *loongson_fdt_blob;
  
  void __init plat_mem_setup(void)
  {
+	void *fdt;
+
+	fdt = get_fdt();
+
+	if (fdt)
+		loongson_fdt_blob = fdt;
+
  	if (loongson_fdt_blob)
  		__dt_setup_arch(loongson_fdt_blob);
  }

>>
>> While the integrated display copntroller is equipped with a VGA output
>> and a DVI output, the VGA is connect to the DVO0 output port of the
>> display controller, the DVI is connected to DVO1 output port of the
>> display controller.
>>
>>      +------+            +-----------------------------------+
>>      | DDR4 |            |  +-------------------+            |
>>      +------+            |  | PCIe Root complex |   LS7A1000 |
>>         || MC0           |  +--++---------++----+            |
>>    +----------+  HT 3.0  |     ||         ||                 |
>>    | LS3A4000 |<-------->| +---++---+  +--++--+ +---------+   +------+
>>    |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| 
>> VRAM |
>>    +----------+          | +--------+  +-+--+-+    +---------+ +------+
>>         || MC1           +---------------|--|----------------+
>>      +------+                            |  |
>>      | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>>      +------+   VGA <--|ADV7125|<--------+ +-------->|TFP410|--> 
>> DVI/HDMI
>>                        +-------+                      +------+
>>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 136 ++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>   create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>>
>> diff --git a/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts 
>> b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>> new file mode 100644
>> index 000000000000..f467eddccdac
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>> @@ -0,0 +1,136 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/dts-v1/;
>> +
>> +#include "loongson64g-package.dtsi"
>> +#include "ls7a-pch.dtsi"
>> +
>> +/ {
>> +    compatible = "loongson,loongson64g-4core-ls7a";
>> +    model = "LS3A4000_7A1000_EVB_BOARD_V1.4";
>> +
>> +    vga-encoder {
>> +        compatible = "adi,adv7123", "dumb-vga-dac";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                adv7123_in: endpoint {
>> +                    remote-endpoint = <&dc_out_rgb0>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                adv7123_out: endpoint {
>> +                    remote-endpoint = <&vga_connector_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    vga-connector {
>> +        compatible = "vga-connector";
>> +        label = "vga";
>> +
>> +        ddc-i2c-bus = <&i2c6>;
>> +
>> +        port {
>> +            vga_connector_in: endpoint {
>> +                remote-endpoint = <&adv7123_out>;
>> +            };
>> +        };
>> +    };
>> +
>> +    tfp410: dvi-encoder {
>> +        compatible = "ti,tfp410";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                tfp410_in: endpoint {
>> +                    pclk-sample = <1>;
>> +                    bus-width = <24>;
>> +                    remote-endpoint = <&dc_out_rgb1>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                tfp410_out: endpoint {
>> +                    remote-endpoint = <&dvi_connector_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    dvi-connector {
>> +        compatible = "dvi-connector";
>> +        label = "dvi";
>> +        digital;
>> +
>> +        ddc-i2c-bus = <&i2c7>;
>> +
>> +        port {
>> +            dvi_connector_in: endpoint {
>> +                remote-endpoint = <&tfp410_out>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&package0 {
>> +    htvec: interrupt-controller@efdfb000080 {
>> +        compatible = "loongson,htvec-1.0";
>> +        reg = <0xefd 0xfb000080 0x40>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        interrupt-parent = <&liointc>;
>> +        interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <25 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <26 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <27 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <28 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <29 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <30 IRQ_TYPE_LEVEL_HIGH>,
>> +                 <31 IRQ_TYPE_LEVEL_HIGH>;
>> +    };
>> +};
>> +
>> +&pch {
>> +    msi: msi-controller@2ff00000 {
>> +        compatible = "loongson,pch-msi-1.0";
>> +        reg = <0 0x2ff00000 0 0x8>;
>> +        interrupt-controller;
>> +        msi-controller;
>> +        loongson,msi-base-vec = <64>;
>> +        loongson,msi-num-vecs = <192>;
>> +        interrupt-parent = <&htvec>;
>> +    };
>> +};
>> +
>> +&lsdc {
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +            endpoint {
>> +                remote-endpoint = <&adv7123_in>;
>> +            };
>> +        };
>> +
>> +        port@1 {
>> +            endpoint {
>> +                remote-endpoint = <&tfp410_in>;
>> +            };
>> +        };
>> +    };
>> +};
>
