Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1B2C3AA1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C01B6E856;
	Wed, 25 Nov 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344B06E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 08:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUlo/Qjw80yIjc17t2ZONeqXpIAXs5ghFNPBY2BHUgOjsVydtAC6ZRePDAjxBtm1Ykukx45Ssrg9cxfotog8ZN0Ly9IrsU+Kg5DV8MIkvlaQWqkUdnFChHbDxhEbRQUF1E0JQqiD5EcUW4o1Y8kS8rcdPILAMENsBRcsx8tA5eo7yBPDx68pUl3UI3NKCPyCU48rTLQhTAT42j7Erse+LqWwvcxN36/q5mysAPOSN7/jf5Dav0E1hiq63fELa6SR4a9JPzpS/YY9CsBDU33y9DpZkszBG96UeAAXCnfWwvpJEqsLDHuZ47wHlOAGhgeNjZyPYT82PORbIR4A7EDLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hty7fTnDSDdYVxAMDOPsPFcjdud3Y29jnrtjl2bfTcg=;
 b=cI7m6j7QeWj0W4eMzGyqQ8jk8W5uKvY02tqINiTj4r+73erENJd3AsRiENJCKHegqacy+kGDBIKrGpP96JAQ30hSnO9pxZO38QFC2d7WuIADoGPxUSqp5PRUcI9E7zBXcNvItzqZp6LfhjSqCtlShJpDkN9AfOB7HUjUyRNaUldvC/bdwt0SLrPSALjt07btoL6Iwns1IdhkVaaP6BlvLv/w3YuAQb9Rt6IrtoVQbeWp4xXE88bRKno/Dla+4OZiSROAkK3Mboqxu9QoGZHfmQGgwA+mOx1PUyWt7Ekk8dxvOAM4ezHbhfcZSv1fmuC9oZEl3nr4ejUBi55BtiGIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hty7fTnDSDdYVxAMDOPsPFcjdud3Y29jnrtjl2bfTcg=;
 b=UdVLst9sKMZE6p/Dc0a/urWb8y5XLFllIFKNRRpeYgm/Msv486hcWz1KJWmGMJkh9+1CuDZgH5rWc6z2GpMPFPSwtn/Xu6vZ3WS1vt1v2NfzgAcrkW5CVte4WVwYPvO+MIgxKvnFezoqZTZNwq3gSzcLQl84drYxOazs9wUQWzQ=
Received: from CY4PR06CA0050.namprd06.prod.outlook.com (2603:10b6:903:13d::12)
 by BYAPR02MB5749.namprd02.prod.outlook.com (2603:10b6:a03:119::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 08:27:18 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13d:cafe::75) by CY4PR06CA0050.outlook.office365.com
 (2603:10b6:903:13d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 08:27:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 08:27:18 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 24 Nov 2020 00:27:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 24 Nov 2020 00:27:17 -0800
Envelope-to: hyun.kwon@xilinx.com, ravi.patel@xilinx.com,
 manish.narani@xilinx.com, tejas.patel@xilinx.com,
 rajan.vaja@xilinx.com, dragan.cvetic@xilinx.com,
 derek.kiernan@xilinx.com, michal.simek@xilinx.com,
 wendy.liang@xilinx.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, christian.koenig@amd.com,
 sumit.semwal@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, robh+dt@kernel.org, airlied@gmail.com
Received: from [10.23.123.18] (port=60401)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1khTfR-0005yK-HV; Tue, 24 Nov 2020 00:27:17 -0800
Subject: Re: [PATCH v2 2/9] misc: Add Xilinx AI engine device driver
To: Dave Airlie <airlied@gmail.com>, Wendy Liang <wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
 <1605743289-26575-3-git-send-email-wendy.liang@xilinx.com>
 <CAPM=9tyNJ_dsONzwunDTjLtTkUq6h73mvnES4ghK_snc_iv62Q@mail.gmail.com>
From: Wendy Liang <wendy.liang@xilinx.com>
Message-ID: <788fb013-97af-058b-d561-860d283e7861@xilinx.com>
Date: Tue, 24 Nov 2020 00:27:16 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tyNJ_dsONzwunDTjLtTkUq6h73mvnES4ghK_snc_iv62Q@mail.gmail.com>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1355e32e-9825-47ee-1534-08d89052c19e
X-MS-TrafficTypeDiagnostic: BYAPR02MB5749:
X-Microsoft-Antispam-PRVS: <BYAPR02MB57495B9DF7C5150DB6471731B0FB0@BYAPR02MB5749.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnomUkRe3PVBVOSGn9uETVz21eCiTRJE1PZYAar3wDBI8uHFk71SaTDi5Thf9s2ozUHQUPVE1E9TYjB5LjEI9YTvdOMuTxFc2pfBFiIvGKxz5MYwSyZEYyZux/0YX9s0STVfQCydWniDUKhw7nIkF8LKx3NGVWitgID6cIJL6u+vyNg9Veq0Icmny22XOcDti/IZjpeNrSRq4zT9+HThjL2xpAnixZjcy4ETddHJwmMpZhzJbAmoEmsOpJvhPZb3x+E1Z5+JIUVcYzNTk76wabnJ2m2u5POIRHkB/5EK+00Ifwsl6orcOxvyXu/rkNowZonkzOqDEWKU4pBuahBZxfj6A6R2z88JcRl6x6JvWwS2KjeoXopfnfJ/MG57In31mEhBo1E5C2pVdkKh4tLGSZt83+UExk7bmuWj6cq4BQWJdgkyxNtrdSmREF4vBY0jf3hs6cVsjSx23IyfGZbueOtwA9D4u0jGkmT5/AuWy5XxBj+GD3kJYD4RaCCcrFU2g9R27s4NMVDplCA1gfrFdA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(36906005)(70206006)(47076004)(4326008)(110136005)(31686004)(5660300002)(336012)(356005)(2616005)(7636003)(83380400001)(44832011)(82740400003)(316002)(82310400003)(54906003)(966005)(7416002)(478600001)(186003)(53546011)(426003)(8936002)(70586007)(31696002)(8676002)(9786002)(107886003)(36756003)(26005)(2906002)(30864003)(50156003)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 08:27:18.2376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1355e32e-9825-47ee-1534-08d89052c19e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5749
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: tejas.patel@xilinx.com, ravi.patel@xilinx.com,
 LKML <linux-kernel@vger.kernel.org>, rajan.vaja@xilinx.com,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dragan.cvetic@xilinx.com, michal.simek@xilinx.com,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 manish.narani@xilinx.com, derek.kiernan@xilinx.com,
 Hyun Kwon <hyun.kwon@xilinx.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/19/20 12:12 PM, Dave Airlie wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5cc595a..40e3351 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19283,6 +19283,14 @@ T:     git https://github.com/Xilinx/linux-xlnx.git
>>   F:     Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
>>   F:     drivers/phy/xilinx/phy-zynqmp.c
>>
>> +XILINX AI ENGINE DRIVER
>> +M:     Wendy Liang <wendy.liang@xilinx.com>
>> +S:     Supported
>> +F:     Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>> +F:     drivers/misc/xilinx-ai-engine/
>> +F:     include/linux/xlnx-ai-engine.h
>> +F:     include/uapi/linux/xlnx-ai-engine.h
>> +
>>   XILLYBUS DRIVER
>>   M:     Eli Billauer <eli.billauer@gmail.com>
>>   L:     linux-kernel@vger.kernel.org
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index fafa8b0..0b8ce4d 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -444,6 +444,18 @@ config XILINX_SDFEC
>>
>>            If unsure, say N.
>>
>> +config XILINX_AIE
>> +       tristate "Xilinx AI engine"
>> +       depends on ARM64 || COMPILE_TEST
>> +       help
>> +         This option enables support for the Xilinx AI engine driver.
>> +         One Xilinx AI engine device can have multiple partitions (groups of
>> +         AI engine tiles). Xilinx AI engine device driver instance manages
>> +         AI engine partitions. User application access its partitions through
>> +         AI engine partition instance file operations.
>> +
>> +         If unsure, say N
>> +
>>   config MISC_RTSX
>>          tristate
>>          default MISC_RTSX_PCI || MISC_RTSX_USB
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index d23231e..2176b18 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -57,3 +57,4 @@ obj-$(CONFIG_HABANA_AI)               += habanalabs/
>>   obj-$(CONFIG_UACCE)            += uacce/
>>   obj-$(CONFIG_XILINX_SDFEC)     += xilinx_sdfec.o
>>   obj-$(CONFIG_HISI_HIKEY_USB)   += hisi_hikey_usb.o
>> +obj-$(CONFIG_XILINX_AIE)       += xilinx-ai-engine/
>> diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
>> new file mode 100644
>> index 0000000..7827a0a
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/Makefile
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Makefile for Xilinx AI engine device driver
>> +#
>> +
>> +obj-$(CONFIG_XILINX_AIE)       += xilinx-aie.o
>> +
>> +xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
>> +                                  ai-engine-dev.o \
>> +                                  ai-engine-part.o \
>> +                                  ai-engine-res.o
>> diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>> new file mode 100644
>> index 0000000..319260f
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>> @@ -0,0 +1,115 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Xilinx AI Engine driver AIE device specific implementation
>> + *
>> + * Copyright (C) 2020 Xilinx, Inc.
>> + */
>> +
>> +#include <linux/slab.h>
>> +
>> +#include "ai-engine-internal.h"
>> +
>> +#define AIE_ARRAY_SHIFT                30U
>> +#define AIE_COL_SHIFT          23U
>> +#define AIE_ROW_SHIFT          18U
>> +
>> +/*
>> + * Registers offsets
>> + */
>> +#define AIE_SHIMNOC_L2INTR_MASK_REGOFF         0x00015000U
>> +#define AIE_SHIMNOC_L2INTR_INTR_REGOFF         0x00015010U
>> +#define AIE_SHIMNOC_DMA_BD0_ADDRLOW_REGOFF     0x0001d000U
>> +#define AIE_SHIMNOC_DMA_BD15_PACKET_REGOFF     0x0001d13cU
>> +#define AIE_SHIMNOC_AXIMM_REGOFF               0x0001e020U
>> +#define AIE_SHIMPL_L1INTR_MASK_A_REGOFF                0x00035000U
>> +#define AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGOFF 0x00035050U
>> +#define AIE_SHIMPL_CLKCNTR_REGOFF              0x00036040U
>> +#define AIE_SHIMPL_RESET_REGOFF                        0x0003604cU
>> +#define AIE_TILE_CORE_CLKCNTR_REGOFF           0x00036040U
>> +
>> +static const struct aie_tile_regs aie_kernel_regs[] = {
>> +       /* SHIM AXI MM Config */
>> +       {.attribute = AIE_TILE_TYPE_SHIMNOC << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMNOC_AXIMM_REGOFF,
>> +        .eoff = AIE_SHIMNOC_AXIMM_REGOFF,
>> +       },
>> +       /* SHIM DMA ADDRESS range */
>> +       {.attribute = AIE_TILE_TYPE_SHIMNOC << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMNOC_DMA_BD0_ADDRLOW_REGOFF,
>> +        .eoff = AIE_SHIMNOC_DMA_BD15_PACKET_REGOFF,
>> +       },
>> +       /* SHIM 2nd level interrupt controller */
>> +       {.attribute = AIE_TILE_TYPE_SHIMNOC << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMNOC_L2INTR_MASK_REGOFF,
>> +        .eoff = AIE_SHIMNOC_L2INTR_INTR_REGOFF,
>> +       },
>> +       /* SHIM 1st level interrupt controller */
>> +       {.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
>> +                     AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMPL_L1INTR_MASK_A_REGOFF,
>> +        .eoff = AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGOFF,
>> +       },
>> +       /* SHIM reset Enable */
>> +       {.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
>> +                     AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMPL_RESET_REGOFF,
>> +        .eoff = AIE_SHIMPL_RESET_REGOFF,
>> +       },
>> +       /* SHIM clock control */
>> +       {.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
>> +                     AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_SHIMPL_CLKCNTR_REGOFF,
>> +        .eoff = AIE_SHIMPL_CLKCNTR_REGOFF,
>> +       },
>> +       /* Tile clock control */
>> +       {.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
>> +        .soff = AIE_TILE_CORE_CLKCNTR_REGOFF,
>> +        .eoff = AIE_TILE_CORE_CLKCNTR_REGOFF,
>> +       },
>> +};
>> +
>> +static u32 aie_get_tile_type(struct aie_location *loc)
>> +{
>> +       if (loc->row)
>> +               return AIE_TILE_TYPE_TILE;
>> +       /* SHIM row */
>> +       if ((loc->col % 4) < 2)
>> +               return AIE_TILE_TYPE_SHIMPL;
>> +
>> +       return AIE_TILE_TYPE_SHIMNOC;
>> +}
>> +
>> +static const struct aie_tile_operations aie_ops = {
>> +       .get_tile_type = aie_get_tile_type,
>> +};
>> +
>> +/**
>> + * aie_device_init() - Initialize AI engine device struct AIE specific
>> + *                    properties
>> + * @adev: AI engine device
>> + * @return: 0 for success, negative value for failure.
>> + *
>> + * This function initialize the AI engine device structure device version
>> + * specific elements such as register addressing related array shift,
>> + * column shift, and row shift; AIE specific device operations, device
>> + * columns resource.
>> + */
>> +int aie_device_init(struct aie_device *adev)
>> +{
>> +       int ret;
>> +
>> +       adev->array_shift = AIE_ARRAY_SHIFT;
>> +       adev->col_shift = AIE_COL_SHIFT;
>> +       adev->row_shift = AIE_ROW_SHIFT;
>> +       adev->ops = &aie_ops;
>> +       adev->num_kernel_regs = ARRAY_SIZE(aie_kernel_regs);
>> +       adev->kernel_regs = aie_kernel_regs;
>> +
>> +       /* Get the columns resource */
>> +       /* Get number of columns from AI engine memory resource */
>> +       ret = aie_resource_initialize(&adev->cols_res, 50);
>> +       if (ret)
>> +               dev_err(&adev->dev, "failed to initialize columns resource.\n");
>> +
>> +       return ret;
>> +}
>> diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>> new file mode 100644
>> index 0000000..2ab2dc8
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>> @@ -0,0 +1,448 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Xilinx AI Engine device driver
>> + *
>> + * Copyright (C) 2020 Xilinx, Inc.
>> + */
>> +
>> +#include <linux/anon_inodes.h>
>> +#include <linux/cdev.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/file.h>
>> +#include <linux/fs.h>
>> +#include <linux/idr.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +#include <uapi/linux/xlnx-ai-engine.h>
>> +
>> +#include "ai-engine-internal.h"
>> +
>> +#define AIE_DEV_MAX    (MINORMASK + 1)
>> +
>> +static dev_t aie_major;
>> +struct class *aie_class;
>> +
>> +static DEFINE_IDA(aie_device_ida);
>> +static DEFINE_IDA(aie_minor_ida);
>> +
>> +/**
>> + * aie_get_partition_fd() - Get AI engine partition file descriptor
>> + * @apart: AI engine partition
>> + * @return: file descriptor for AI engine partition for success, or negative
>> + *         value for failure.
>> + *
>> + * This function gets a file descriptor for the AI engine partition.
>> + */
>> +static int aie_get_partition_fd(struct aie_partition *apart)
>> +{
>> +       struct file *filep;
>> +       int ret;
>> +
>> +       /*
>> +        * We can't use anon_inode_getfd() because we need to modify
>> +        * the f_mode flags directly to allow more than just ioctls
>> +        */
>> +       ret = get_unused_fd_flags(O_CLOEXEC);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       filep = anon_inode_getfile(dev_name(&apart->dev), &aie_part_fops,
>> +                                  apart, O_RDWR);
>> +       if (IS_ERR(filep)) {
>> +               put_unused_fd(ret);
>> +               ret = PTR_ERR(filep);
>> +               return ret;
>> +       }
>> +       filep->f_mode |= (FMODE_LSEEK | FMODE_PREAD | FMODE_PWRITE);
>> +       fd_install(ret, filep);
>> +
>> +       return ret;
>> +}
>> +
>> +/**
>> + * aie_enquire_partitions() - get AI engine partitions information
>> + * @adev: AI engine device
>> + * @query: data struct to store the partition information
>> + * @return: 0 for success, and negative value for failure.
>> + */
>> +static int aie_enquire_partitions(struct aie_device *adev,
>> +                                 struct aie_partition_query *query)
>> +{
>> +       struct aie_partition *apart;
>> +       u32 partition_cnt, i = 0;
>> +       int ret;
>> +
>> +       if (!query->partitions) {
>> +               /*
>> +                * If partitions information buffer is NULL.
>> +                * It is to get the number of partitions.
>> +                */
>> +               query->partition_cnt = 0;
>> +               list_for_each_entry(apart, &adev->partitions, node)
>> +                       query->partition_cnt++;
>> +               return 0;
>> +       }
>> +
>> +       partition_cnt = query->partition_cnt;
>> +       if (!partition_cnt)
>> +               return 0;
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret)
>> +               return ret;
>> +
>> +       list_for_each_entry(apart, &adev->partitions, node) {
>> +               struct aie_range_args part;
>> +
>> +               if (i >= partition_cnt)
>> +                       break;
>> +               part.partition_id = apart->partition_id;
>> +               /*
>> +                * TBD: check with PLM that if the partition is programmed
>> +                * and get the UID of the image which is loaded on the AI
>> +                * engine partition.
>> +                */
>> +               part.uid = 0;
>> +               part.range.start.col = apart->range.start.col;
>> +               part.range.start.row = apart->range.start.row;
>> +               part.range.size.col = apart->range.size.col;
>> +               part.range.size.row = apart->range.size.row;
>> +               /* Check if partition is in use */
>> +               part.status = apart->status;
>> +               if (copy_to_user((void __user *)&query->partitions[i], &part,
>> +                                sizeof(part))) {
>> +                       mutex_unlock(&adev->mlock);
>> +                       return -EFAULT;
>> +               }
>> +               i++;
>> +       }
>> +       mutex_unlock(&adev->mlock);
>> +       query->partition_cnt = i;
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * aie_get_partition_from_id() - get AI engine partition from id
>> + * @adev: AI engine device
>> + * @partition_id: partition id to check
>> + * @return: partition pointer if partition exists, otherwise, NULL.
>> + *
>> + * This function checks defined partitions with partition id.
>> + * This function expect the caller to lock mlock of @adev.
>> + */
>> +struct aie_partition *aie_get_partition_from_id(struct aie_device *adev,
>> +                                               u32 partition_id)
>> +{
>> +       struct aie_partition *apart;
>> +
>> +       list_for_each_entry(apart, &adev->partitions, node) {
>> +               if (apart->partition_id == partition_id)
>> +                       return apart;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +/**
>> + * aie_request_partition() - request AI engine partition
>> + * @adev: AI engine device
>> + * @req: partition request, includes the requested AI engine information
>> + *      such as partition node ID and the UID of the image which is
>> + *      loaded on the partition.
>> + * @return: partition pointer if partition exists, otherwise, NULL.
>> + *
>> + * This function finds a defined partition which matches the specified
>> + * partition id, request it if it hasn't been requested, and returns it.
>> + */
>> +struct aie_partition *aie_request_partition(struct aie_device *adev,
>> +                                           struct aie_partition_req *req)
>> +{
>> +       struct aie_partition *apart;
>> +       int ret;
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>> +       apart = aie_get_partition_from_id(adev, req->partition_id);
>> +       if (!apart) {
>> +               dev_err(&adev->dev,
>> +                       "request partition %u failed, not exist.\n",
>> +                       req->partition_id);
>> +               mutex_unlock(&adev->mlock);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +       /*
>> +        * TBD: It will check image UID too to see if the user matches
>> +        * what's loaded in the AI engine partition. And check the meta
>> +        * data to see which resources used by application.
>> +        */
>> +
>> +       ret = mutex_lock_interruptible(&apart->mlock);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>> +       if (apart->status & XAIE_PART_STATUS_INUSE) {
>> +               mutex_unlock(&apart->mlock);
>> +               dev_err(&adev->dev,
>> +                       "request partition %u failed, partition in use.\n",
>> +                       req->partition_id);
>> +               apart = ERR_PTR(-EBUSY);
>> +       } else {
>> +               /*
>> +                * TBD:
>> +                * 1. setup NOC AXI MM config to only generate error events
>> +                *    for slave error and decode error.
>> +                * 2. scan to see which tiles have been clock gated.
>> +                *
>> +                * This needs to be done before the AI engine partition is
>> +                * exported for user to access.
>> +                */
>> +               apart->status = XAIE_PART_STATUS_INUSE;
>> +               mutex_unlock(&apart->mlock);
>> +       }
>> +       mutex_unlock(&adev->mlock);
>> +
>> +       return apart;
>> +}
>> +
>> +static long xilinx_ai_engine_ioctl(struct file *filp, unsigned int cmd,
>> +                                  unsigned long arg)
>> +{
>> +       struct inode *inode = file_inode(filp);
>> +       struct aie_device *adev = cdev_to_aiedev(inode->i_cdev);
>> +       void __user *argp = (void __user *)arg;
>> +       int ret;
>> +
>> +       switch (cmd) {
>> +       case AIE_ENQUIRE_PART_IOCTL:
>> +       {
>> +               struct aie_partition_query query;
>> +               struct aie_partition_query  __user *uquery_ptr = argp;
>> +
>> +               if (copy_from_user(&query, uquery_ptr, sizeof(query)))
>> +                       return -EFAULT;
>> +               ret = aie_enquire_partitions(adev, &query);
>> +               if (ret < 0)
>> +                       return ret;
>> +               if (copy_to_user((void __user *)&uquery_ptr->partition_cnt,
>> +                                &query.partition_cnt,
>> +                                sizeof(query.partition_cnt)))
>> +                       return -EFAULT;
>> +               break;
>> +       }
>> +       case AIE_REQUEST_PART_IOCTL:
>> +       {
>> +               struct aie_partition_req req;
>> +               struct aie_partition *apart;
>> +
>> +               if (copy_from_user(&req, argp, sizeof(req)))
>> +                       return -EFAULT;
>> +               apart = aie_request_partition(adev, &req);
>> +               if (IS_ERR(apart))
>> +                       return PTR_ERR(apart);
>> +               ret = aie_get_partition_fd(apart);
>> +               if (ret < 0) {
>> +                       dev_err(&apart->dev, "failed to get fd.\n");
>> +                       break;
>> +               }
>> +               break;
>> +       }
>> +       default:
>> +               dev_err(&adev->dev, "Invalid ioctl command %u.\n", cmd);
>> +               ret = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static const struct file_operations aie_device_fops = {
>> +       .owner          = THIS_MODULE,
>> +       .unlocked_ioctl = xilinx_ai_engine_ioctl,
>> +};
>> +
>> +static void xilinx_ai_engine_release_device(struct device *dev)
>> +{
>> +       struct aie_device *adev = dev_to_aiedev(dev);
>> +
>> +       ida_simple_remove(&aie_device_ida, dev->id);
>> +       ida_simple_remove(&aie_minor_ida, MINOR(dev->devt));
>> +       cdev_del(&adev->cdev);
>> +       aie_resource_uninitialize(&adev->cols_res);
>> +}
>> +
>> +/**
>> + * of_xilinx_ai_engine_part_probe() - probes for AI engine partition nodes
>> + * @adev: AI engine device
>> + *
>> + * This function will probe for children AI engine partition nodes and create
>> + * an AI engine partition instance for each node.
>> + */
>> +static void of_xilinx_ai_engine_part_probe(struct aie_device *adev)
>> +{
>> +       struct device_node *nc;
>> +
>> +       for_each_available_child_of_node(adev->dev.of_node, nc) {
>> +               struct aie_partition *apart;
>> +
>> +               if (of_node_test_and_set_flag(nc, OF_POPULATED))
>> +                       continue;
>> +               apart = of_aie_part_probe(adev, nc);
>> +               if (IS_ERR(apart)) {
>> +                       dev_err(&adev->dev,
>> +                               "Failed to probe AI engine part for %pOF\n",
>> +                               nc);
>> +                       of_node_clear_flag(nc, OF_POPULATED);
>> +               }
>> +       }
>> +}
>> +
>> +static int xilinx_ai_engine_probe(struct platform_device *pdev)
>> +{
>> +       struct aie_device *adev;
>> +       struct device *dev;
>> +       int ret;
>> +
>> +       adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
>> +       if (!adev)
>> +               return -ENOMEM;
>> +       platform_set_drvdata(pdev, adev);
>> +       INIT_LIST_HEAD(&adev->partitions);
>> +       mutex_init(&adev->mlock);
>> +
>> +       adev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!adev->res) {
>> +               dev_err(&pdev->dev, "No memory resource.\n");
>> +               return -EINVAL;
>> +       }
>> +       adev->base = devm_ioremap_resource(&pdev->dev, adev->res);
>> +       if (IS_ERR(adev->base)) {
>> +               dev_err(&pdev->dev, "no io memory resource.\n");
>> +               return PTR_ERR(adev->base);
>> +       }
>> +
>> +       /* Initialize AIE device specific instance. */
>> +       ret = aie_device_init(adev);
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "failed to initialize device instance.\n");
>> +               return ret;
>> +       }
>> +
>> +       dev = &adev->dev;
>> +       device_initialize(dev);
>> +       dev->class = aie_class;
>> +       dev->parent = &pdev->dev;
>> +       dev->of_node = pdev->dev.of_node;
>> +
>> +       ret = ida_simple_get(&aie_minor_ida, 0, AIE_DEV_MAX, GFP_KERNEL);
>> +       if (ret < 0)
>> +               goto free_dev;
>> +       dev->devt = MKDEV(MAJOR(aie_major), ret);
>> +       ret = ida_simple_get(&aie_device_ida, 0, 0, GFP_KERNEL);
>> +       if (ret < 0)
>> +               goto free_minor_ida;
>> +       dev->id = ret;
>> +       dev_set_name(&adev->dev, "aie%d", dev->id);
>> +
>> +       cdev_init(&adev->cdev, &aie_device_fops);
>> +       adev->cdev.owner = THIS_MODULE;
>> +       ret = cdev_add(&adev->cdev, dev->devt, 1);
>> +       if (ret)
>> +               goto free_ida;
>> +       /* We can now rely on the release function for cleanup */
>> +       dev->release = xilinx_ai_engine_release_device;
>> +
>> +       ret = device_add(dev);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "device_add failed: %d\n", ret);
>> +               put_device(dev);
>> +               return ret;
>> +       }
>> +
>> +       of_xilinx_ai_engine_part_probe(adev);
>> +       dev_info(&pdev->dev, "Xilinx AI Engine device(cols=%u) probed\n",
>> +                adev->cols_res.total);
>> +       return 0;
>> +
>> +free_ida:
>> +       ida_simple_remove(&aie_device_ida, dev->id);
>> +free_minor_ida:
>> +       ida_simple_remove(&aie_minor_ida, MINOR(dev->devt));
>> +free_dev:
>> +       put_device(dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int xilinx_ai_engine_remove(struct platform_device *pdev)
>> +{
>> +       struct aie_device *adev = platform_get_drvdata(pdev);
>> +       struct aie_partition *apart;
>> +
>> +       list_for_each_entry(apart, &adev->partitions, node)
>> +               aie_part_remove(apart);
>> +
>> +       device_del(&adev->dev);
>> +       put_device(&adev->dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id xilinx_ai_engine_of_match[] = {
>> +       { .compatible = "xlnx,ai-engine-v1.0", },
>> +       { /* end of table */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, xilinx_ai_engine_of_match);
>> +
>> +static struct platform_driver xilinx_ai_engine_driver = {
>> +       .probe                  = xilinx_ai_engine_probe,
>> +       .remove                 = xilinx_ai_engine_remove,
>> +       .driver                 = {
>> +               .name           = "xilinx-ai-engine",
>> +               .of_match_table = xilinx_ai_engine_of_match,
>> +       },
>> +};
>> +
>> +static int __init xilinx_ai_engine_init(void)
>> +{
>> +       int ret;
>> +
>> +       ret = alloc_chrdev_region(&aie_major, 0, AIE_DEV_MAX, "aie");
>> +       if (ret < 0) {
>> +               pr_err("aie: failed to allocate aie region\n");
>> +               return ret;
>> +       }
>> +
>> +       aie_class = class_create(THIS_MODULE, "aie");
>> +       if (IS_ERR(aie_class)) {
>> +               pr_err("failed to create aie class\n");
>> +               unregister_chrdev_region(aie_major, AIE_DEV_MAX);
>> +               return PTR_ERR(aie_class);
>> +       }
>> +
>> +       platform_driver_register(&xilinx_ai_engine_driver);
>> +
>> +       return 0;
>> +}
>> +postcore_initcall(xilinx_ai_engine_init);
>> +
>> +static void __exit xilinx_ai_engine_exit(void)
>> +{
>> +       platform_driver_unregister(&xilinx_ai_engine_driver);
>> +       class_destroy(aie_class);
>> +       unregister_chrdev_region(aie_major, AIE_DEV_MAX);
>> +}
>> +module_exit(xilinx_ai_engine_exit);
>> +
>> +MODULE_AUTHOR("Xilinx, Inc.");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>> new file mode 100644
>> index 0000000..6a69946
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>> @@ -0,0 +1,226 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Xilinx AI Engine driver internal header
>> + *
>> + * Copyright (C) 2020 Xilinx, Inc.
>> + */
>> +
>> +#ifndef AIE_INTERNAL_H
>> +#define AIE_INTERNAL_H
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/cdev.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <uapi/linux/xlnx-ai-engine.h>
>> +
>> +/*
>> + * Macros for AI engine tile type bitmasks
>> + */
>> +#define AIE_TILE_TYPE_TILE     BIT(0)
>> +#define AIE_TILE_TYPE_SHIMPL   BIT(1)
>> +/* SHIM NOC tile includes SHIM PL and SHIM NOC modules */
>> +#define AIE_TILE_TYPE_SHIMNOC  BIT(2)
>> +
>> +/*
>> + * Macros for attribute property of AI engine registers accessed by kernel
>> + * 0 - 7 bits: tile type bits
>> + * 8 - 15 bits: permission bits. If it is 1, it allows write from userspace
>> + */
>> +#define AIE_REGS_ATTR_TILE_TYPE_SHIFT  0U
>> +#define AIE_REGS_ATTR_PERM_SHIFT       8U
>> +#define AIE_REGS_ATTR_TILE_TYPE_MASK   GENMASK(AIE_REGS_ATTR_PERM_SHIFT - 1, \
>> +                                               AIE_REGS_ATTR_TILE_TYPE_SHIFT)
>> +#define AIE_REGS_ATTR_PERM_MASK                GENMASK(15, \
>> +                                               AIE_REGS_ATTR_PERM_SHIFT)
>> +
>> +/**
>> + * struct aie_tile_regs - contiguous range of AI engine register
>> + *                       within an AI engine tile
>> + * @soff: start offset of the range
>> + * @eoff: end offset of the range
>> + * @attribute: registers attribute. It uses AIE_REGS_ATTR_* macros defined
>> + *            above.
>> + */
>> +struct aie_tile_regs {
>> +       size_t soff;
>> +       size_t eoff;
>> +       u32 attribute;
>> +};
>> +
>> +struct aie_device;
>> +struct aie_partition;
>> +
>> +/**
>> + * struct aie_tile_operations - AI engine device operations
>> + * @get_tile_type: get type of tile based on tile operation
>> + *
>> + * Different AI engine device version has its own device
>> + * operation.
>> + */
>> +struct aie_tile_operations {
>> +       u32 (*get_tile_type)(struct aie_location *loc);
>> +};
>> +
>> +/**
>> + * struct aie_resource - AI engine resource structure
>> + * @bitmap: resource bitmap
>> + * @total: total number of resource
>> + */
>> +struct aie_resource {
>> +       unsigned long *bitmap;
>> +       u32 total;
>> +};
>> +
>> +/**
>> + * struct aie_device - AI engine device structure
>> + * @partitions: list of partitions requested
>> + * @cdev: cdev for the AI engine
>> + * @dev: device for the AI engine device
>> + * @mlock: protection for AI engine device operations
>> + * @base: AI engine device base virtual address
>> + * @res: memory resource of AI engine device
>> + * @kernel_regs: array of kernel only registers
>> + * @ops: tile operations
>> + * @size: size of the AI engine address space
>> + * @array_shift: array address shift
>> + * @col_shift: column address shift
>> + * @row_shift: row address shift
>> + * @cols_res: AI engine columns resources to indicate
>> + *           while columns are occupied by partitions.
>> + * @num_kernel_regs: number of kernel only registers range
>> + * @version: AI engine device version
>> + */
>> +struct aie_device {
>> +       struct list_head partitions;
>> +       struct cdev cdev;
>> +       struct device dev;
>> +       struct mutex mlock; /* protection for AI engine partitions */
>> +       void __iomem *base;
>> +       struct resource *res;
>> +       const struct aie_tile_regs *kernel_regs;
>> +       const struct aie_tile_operations *ops;
>> +       size_t size;
>> +       struct aie_resource cols_res;
>> +       u32 array_shift;
>> +       u32 col_shift;
>> +       u32 row_shift;
>> +       u32 num_kernel_regs;
>> +       int version;
>> +};
>> +
>> +/**
>> + * struct aie_partition - AI engine partition structure
>> + * @node: list node
>> + * @adev: pointer to AI device instance
>> + * @range: range of partition
>> + * @mlock: protection for AI engine partition operations
>> + * @dev: device for the AI engine partition
>> + * @partition_id: partition id. Partition ID is the identifier
>> + *               of the AI engine partition in the system.
>> + * @status: indicate if the partition is in use
>> + */
>> +struct aie_partition {
>> +       struct list_head node;
>> +       struct aie_device *adev;
>> +       struct aie_range range;
>> +       struct mutex mlock; /* protection for AI engine partition operations */
>> +       struct device dev;
>> +       u32 partition_id;
>> +       u32 status;
>> +};
>> +
>> +extern struct class *aie_class;
>> +extern const struct file_operations aie_part_fops;
>> +
>> +#define cdev_to_aiedev(i_cdev) container_of((i_cdev), struct aie_device, cdev)
>> +#define dev_to_aiedev(_dev) container_of((_dev), struct aie_device, dev)
>> +#define dev_to_aiepart(_dev) container_of((_dev), struct aie_partition, dev)
>> +
>> +#define aie_col_mask(adev) ({ \
>> +       struct aie_device *_adev = (adev); \
>> +       GENMASK_ULL(_adev->array_shift - 1, _adev->col_shift);  \
>> +       })
>> +
>> +#define aie_row_mask(adev) ({ \
>> +       struct aie_device *_adev = (adev); \
>> +       GENMASK_ULL(_adev->col_shift - 1, _adev->row_shift);  \
>> +       })
>> +
>> +#define aie_tile_reg_mask(adev) ({ \
>> +       struct aie_device *_adev = (adev); \
>> +       GENMASK_ULL(_adev->row_shift - 1, 0);  \
>> +       })
>> +
>> +/*
>> + * Need to define field get, as AI engine shift mask is not constant.
>> + * Cannot use FIELD_GET()
>> + */
>> +#define aie_tile_reg_field_get(mask, shift, regoff) ( \
>> +       ((regoff) & (mask)) >> (shift))
>> +
>> +#define aie_cal_tile_reg(adev, regoff) ( \
>> +       aie_tile_reg_field_get(aie_tile_reg_mask(adev), 0, regoff))
>> +
>> +/**
>> + * aie_cal_regoff() - calculate register offset to the whole AI engine
>> + *                   device start address
>> + * @adev: AI engine device
>> + * @loc: AI engine tile location
>> + * @regoff_intile: register offset within a tile
>> + * @return: register offset to the whole AI engine device start address
>> + */
>> +static inline u32 aie_cal_regoff(struct aie_device *adev,
>> +                                struct aie_location loc, u32 regoff_intile)
>> +{
>> +       return regoff_intile + (loc.col << adev->col_shift) +
>> +              (loc.row << adev->row_shift);
>> +}
>> +
>> +/**
>> + * aie_validate_location() - validate tile location within an AI engine
>> + *                          partition
>> + * @apart: AI engine partition
>> + * @loc: AI engine tile location
>> + * @return: return 0 if it is valid, negative value for errors.
>> + *
>> + * This function checks if the AI engine location is within the AI engine
>> + * partition.
>> + */
>> +static inline int aie_validate_location(struct aie_partition *apart,
>> +                                       struct aie_location loc)
>> +{
>> +       if (loc.col < apart->range.start.col ||
>> +           loc.col >= apart->range.start.col + apart->range.size.col ||
>> +           loc.row < apart->range.start.row ||
>> +           loc.row >= apart->range.start.row + apart->range.size.row)
>> +               return -EINVAL;
>> +
>> +       return 0;
>> +}
>> +
>> +int aie_resource_initialize(struct aie_resource *res, int count);
>> +void aie_resource_uninitialize(struct aie_resource *res);
>> +int aie_resource_check_region(struct aie_resource *res, u32 start,
>> +                             u32 count);
>> +int aie_resource_get_region(struct aie_resource *res, u32 start,
>> +                           u32 count);
>> +void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
>> +
>> +const struct file_operations *aie_part_get_fops(void);
>> +u8 aie_part_in_use(struct aie_partition *apart);
>> +struct aie_partition *aie_get_partition_from_id(struct aie_device *adev,
>> +                                               u32 partition_id);
>> +struct aie_partition *aie_request_partition(struct aie_device *adev,
>> +                                           struct aie_partition_req *req);
>> +struct aie_partition *of_aie_part_probe(struct aie_device *adev,
>> +                                       struct device_node *nc);
>> +void aie_part_remove(struct aie_partition *apart);
>> +
>> +int aie_device_init(struct aie_device *adev);
>> +#endif /* AIE_INTERNAL_H */
>> diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
>> new file mode 100644
>> index 0000000..fc8f9f5
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
>> @@ -0,0 +1,498 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Xilinx AI Engine partition driver
>> + *
>> + * Copyright (C) 2020 Xilinx, Inc.
>> + */
>> +
>> +#include <linux/cdev.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/fs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/mm.h>
>> +#include <linux/mman.h>
>> +#include <linux/mmu_context.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/uio.h>
>> +#include <uapi/linux/xlnx-ai-engine.h>
>> +
>> +#include "ai-engine-internal.h"
>> +
>> +/**
>> + * aie_cal_loc() - calculate tile location from register offset to the AI
>> + *                engine device
>> + * @adev: AI engine device
>> + * @loc: memory pointer to restore returning location information
>> + * @regoff: tile internal register offset
>> + *
>> + * This function returns the tile location.
>> + */
>> +static void aie_cal_loc(struct aie_device *adev,
>> +                       struct aie_location *loc, u64 regoff)
>> +{
>> +       loc->col = (u32)aie_tile_reg_field_get(aie_col_mask(adev),
>> +                                              adev->col_shift, regoff);
>> +       loc->row = (u32)aie_tile_reg_field_get(aie_row_mask(adev),
>> +                                              adev->row_shift, regoff);
>> +}
>> +
>> +/**
>> + * aie_part_reg_validation() - validate AI engine partition register access
>> + * @apart: AI engine partition
>> + * @offset: AI engine register offset
>> + * @len: len of data to write/read
>> + * @is_write: is the access to write to register
>> + * @return: 0 for success, or negative value for failure.
>> + *
>> + * This function validate if the register to access is within the AI engine
>> + * partition. If it is write access, if the register is writable by user.
>> + */
>> +static int aie_part_reg_validation(struct aie_partition *apart, size_t offset,
>> +                                  size_t len, u8 is_write)
>> +{
>> +       struct aie_device *adev;
>> +       u32 regend32, ttype;
>> +       u64 regoff, regend64;
>> +       struct aie_location loc;
>> +       unsigned int i;
>> +
>> +       adev = apart->adev;
>> +       if (offset % sizeof(u32)) {
>> +               dev_err(&apart->dev,
>> +                       "Invalid reg off(0x%zx), not 32bit aligned.\n",
>> +                       offset);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (len % sizeof(u32)) {
>> +               dev_err(&apart->dev, "Invalid reg operation len %zu.\n", len);
>> +               return -EINVAL;
>> +       }
>> +
>> +       regoff = aie_cal_tile_reg(adev, offset);
>> +       regend64 = regoff + len;
>> +       if (regend64 >= BIT_ULL(adev->row_shift)) {
>> +               dev_err(&apart->dev,
>> +                       "Invalid reg operation len %zu.\n", len);
>> +               return -EINVAL;
>> +       }
>> +
>> +       aie_cal_loc(adev, &loc, offset);
>> +       if (aie_validate_location(apart, loc)) {
>> +               dev_err(&apart->dev,
>> +                       "Invalid (%d,%d) out of part(%d,%d),(%d,%d)\n",
>> +                       loc.col, loc.row,
>> +                       apart->range.start.col, apart->range.start.row,
>> +                       apart->range.size.col, apart->range.size.row);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (!is_write)
>> +               return 0;
>> +
>> +       regend32 = lower_32_bits(regend64);
>> +       ttype = adev->ops->get_tile_type(&loc);
>> +       for (i = 0; i < adev->num_kernel_regs; i++) {
>> +               const struct aie_tile_regs *regs;
>> +               u32 rttype, writable;
>> +
>> +               regs = &adev->kernel_regs[i];
>> +               rttype = (regs->attribute & AIE_REGS_ATTR_TILE_TYPE_MASK) >>
>> +                        AIE_REGS_ATTR_TILE_TYPE_SHIFT;
>> +               writable = (regs->attribute & AIE_REGS_ATTR_PERM_MASK) >>
>> +                          AIE_REGS_ATTR_PERM_SHIFT;
>> +               if (!(ttype & rttype))
>> +                       continue;
>> +               if ((regoff >= regs->soff && regoff <= regs->eoff) ||
>> +                   (regend32 >= regs->soff && regend32 <= regs->eoff)) {
>> +                       if (!writable) {
>> +                               dev_err(&apart->dev,
>> +                                       "reg 0x%zx,0x%zx not writable.\n",
>> +                                       offset, len);
>> +                               return -EINVAL;
>> +                       }
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * aie_part_write_register() - AI engine partition write register
>> + * @apart: AI engine partition
>> + * @offset: AI engine register offset
>> + * @len: len of data to write
>> + * @data: data to write
>> + * @mask: mask, if it is non 0, it is mask write.
>> + * @return: number of bytes write for success, or negative value for failure.
>> + *
>> + * This function writes data to the specified registers.
>> + * If the mask is non 0, it is mask write.
>> + */
>> +static int aie_part_write_register(struct aie_partition *apart, size_t offset,
>> +                                  size_t len, void *data, u32 mask)
>> +{
>> +       int ret;
>> +       void __iomem *va;
>> +
>> +       if (mask && len > sizeof(u32)) {
>> +               /* For mask write, only allow 32bit. */
>> +               dev_err(&apart->dev,
>> +                       "failed mask write, len is more that 32bit.\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* offset is expected to be relative to the start of the partition */
>> +       offset += aie_cal_regoff(apart->adev, apart->range.start, 0);
>> +       ret = aie_part_reg_validation(apart, offset, len, 1);
>> +       if (ret < 0) {
>> +               dev_err(&apart->dev, "failed to write to 0x%zx,0x%zx.\n",
>> +                       offset, len);
>> +               return ret;
>> +       }
>> +
>> +       va = apart->adev->base + offset;
>> +       if (!mask) {
>> +               if (len == sizeof(u32))
>> +                       iowrite32(*((u32 *)data),  va);
>> +               else
>> +                       memcpy_toio(va, data, len);
>> +       } else {
>> +               u32 val = ioread32(va);
>> +
>> +               val &= ~mask;
>> +               val |= *((u32 *)data) & mask;
>> +               iowrite32(val, va);
>> +       }
>> +
>> +       return (int)len;
>> +}
>> +
>> +/**
>> + * aie_part_access_regs() - AI engine partition registers access
>> + * @apart: AI engine partition
>> + * @num_reqs: number of access requests
>> + * @reqs: array of registers access
>> + * @return: 0 for success, and negative value for failure.
>> + *
>> + * This function executes AI engine partition register access requests.
>> + */
>> +static int aie_part_access_regs(struct aie_partition *apart, u32 num_reqs,
>> +                               struct aie_reg_args *reqs)
>> +{
>> +       u32 i;
>> +
>> +       for (i = 0; i < num_reqs; i++) {
>> +               struct aie_reg_args *args = &reqs[i];
>> +               int ret;
>> +
>> +               if (args->op != AIE_REG_WRITE) {
>> +                       dev_err(&apart->dev,
>> +                               "Invalid register command type: %u.\n",
>> +                               args->op);
>> +                       return -EINVAL;
>> +               }
>> +               ret = aie_part_write_register(apart,
>> +                                             (size_t)args->offset,
>> +                                             sizeof(args->val),
>> +                                             &args->val, args->mask);
>> +               if (ret < 0) {
>> +                       dev_err(&apart->dev, "reg op %u failed: 0x%llx.\n",
>> +                               args->op, args->offset);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int aie_part_release(struct inode *inode, struct file *filp)
>> +{
>> +       struct aie_partition *apart = filp->private_data;
>> +       int ret;
>> +
>> +       /*
>> +        * TODO: It will need to reset the SHIM columns and gate the
>> +        * tiles of the partition.
>> +        */
>> +       ret = mutex_lock_interruptible(&apart->mlock);
>> +       if (ret)
>> +               return ret;
>> +
>> +       apart->status = 0;
>> +       mutex_unlock(&apart->mlock);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct vm_operations_struct aie_part_physical_vm_ops = {
>> +#ifdef CONFIG_HAVE_IOREMAP_PROT
>> +       .access = generic_access_phys,
>> +#endif
>> +};
>> +
>> +static int aie_part_mmap(struct file *fp, struct vm_area_struct *vma)
>> +{
>> +       struct aie_partition *apart = fp->private_data;
>> +       struct aie_device *adev = apart->adev;
>> +       unsigned long offset = vma->vm_pgoff * PAGE_SIZE;
>> +       phys_addr_t addr;
>> +       size_t size;
>> +
>> +       if (vma->vm_end < vma->vm_start)
>> +               return -EINVAL;
>> +       /* Only allow userspace directly read registers */
>> +       if (vma->vm_flags & VM_WRITE) {
>> +               dev_err(&apart->dev, "%s: do not support writable mmap.\n",
>> +                       __func__);
>> +               return -EINVAL;
>> +       }
>> +       vma->vm_private_data = apart;
>> +       vma->vm_ops = &aie_part_physical_vm_ops;
>> +       size = apart->range.size.col << adev->col_shift;
>> +       if ((vma->vm_end - vma->vm_start) > (size - offset)) {
>> +               dev_err(&apart->dev,
>> +                       "%s: size exceed.\n", __func__);
>> +               return -EINVAL;
>> +       }
>> +       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +       /* Calculate the partition address */
>> +       addr = adev->res->start;
>> +       addr += apart->range.start.col << adev->col_shift;
>> +       addr += apart->range.start.row << adev->row_shift;
>> +       addr += offset;
>> +       return remap_pfn_range(vma,
>> +                              vma->vm_start,
>> +                              addr >> PAGE_SHIFT,
>> +                              vma->vm_end - vma->vm_start,
>> +                              vma->vm_page_prot);
>> +}
>> +
>> +static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +{
>> +       struct aie_partition *apart = fp->private_data;
>> +       void __user *argp = (void __user *)arg;
>> +       long ret;
>> +
>> +       switch (cmd) {
>> +       case AIE_REG_IOCTL:
>> +       {
>> +               struct aie_reg_args raccess;
>> +
>> +               if (copy_from_user(&raccess, argp, sizeof(raccess)))
>> +                       return -EFAULT;
>> +
>> +               ret = mutex_lock_interruptible(&apart->mlock);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               ret = aie_part_access_regs(apart, 1, &raccess);
>> +               mutex_unlock(&apart->mlock);
>> +               break;
>> +       }
>> +       default:
>> +               dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
>> +               ret = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +const struct file_operations aie_part_fops = {
>> +       .owner          = THIS_MODULE,
>> +       .release        = aie_part_release,
>> +       .mmap           = aie_part_mmap,
>> +       .unlocked_ioctl = aie_part_ioctl,
>> +};
>> +
>> +/**
>> + * aie_part_release_device() - release an AI engine partition instance
>> + * @dev: AI engine partition device
>> + *
>> + * It will be called by device driver core when no one holds a valid
>> + * pointer to @dev anymore.
>> + */
>> +static void aie_part_release_device(struct device *dev)
>> +{
>> +       struct aie_partition *apart = dev_to_aiepart(dev);
>> +       struct aie_device *adev = apart->adev;
>> +       int ret;
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret) {
>> +               dev_warn(&apart->dev,
>> +                        "getting adev->mlock is interrupted by signal\n");
>> +       }
>> +
>> +       aie_resource_put_region(&adev->cols_res, apart->range.start.col,
>> +                               apart->range.size.col);
>> +       list_del(&apart->node);
>> +       mutex_unlock(&adev->mlock);
>> +       put_device(apart->dev.parent);
>> +}
>> +
>> +/**
>> + * aie_create_partition() - create AI engine partition instance
>> + * @adev: AI engine device
>> + * @range: AI engine partition range to check. A range describes a group
>> + *        of AI engine tiles.
>> + * @return: created AI engine partition pointer for success, and PTR_ERR
>> + *         for failure.
>> + *
>> + * This function creates an AI engine partition instance.
>> + * It creates AI engine partition, the AI engine partition device and
>> + * the AI engine partition character device.
>> + */
>> +static struct aie_partition *aie_create_partition(struct aie_device *adev,
>> +                                                 struct aie_range *range)
>> +{
>> +       struct aie_partition *apart;
>> +       struct device *dev;
>> +       char devname[32];
>> +       int ret;
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>> +       ret = aie_resource_check_region(&adev->cols_res, range->start.col,
>> +                                       range->size.col);
>> +       if (ret != range->start.col) {
>> +               dev_err(&adev->dev, "invalid partition (%u,%u)(%u,%u).\n",
>> +                       range->start.col, range->start.row,
>> +                       range->size.col, range->size.row);
>> +               mutex_unlock(&adev->mlock);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +       ret = aie_resource_get_region(&adev->cols_res, range->start.col,
>> +                                     range->size.col);
>> +       if (ret != range->start.col) {
>> +               dev_err(&adev->dev, "failed to get partition (%u,%u)(%u,%u).\n",
>> +                       range->start.col, range->start.row,
>> +                       range->size.col, range->size.row);
>> +               mutex_unlock(&adev->mlock);
>> +               return ERR_PTR(-EFAULT);
>> +       }
>> +       mutex_unlock(&adev->mlock);
>> +
>> +       apart = devm_kzalloc(&adev->dev, sizeof(*apart), GFP_KERNEL);
>> +       if (!apart)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       apart->adev = adev;
>> +       memcpy(&apart->range, range, sizeof(*range));
>> +       mutex_init(&apart->mlock);
>> +
>> +       /* Create AI engine partition device */
>> +       dev = &apart->dev;
>> +       device_initialize(dev);
>> +       dev->parent = &adev->dev;
>> +       dev->class = aie_class;
>> +       dev_set_drvdata(dev, apart);
>> +       snprintf(devname, sizeof(devname) - 1, "aiepart_%d_%d",
>> +                apart->range.start.col, apart->range.size.col);
>> +       dev_set_name(dev, devname);
>> +       /* We can now rely on the release function for cleanup */
>> +       dev->release = aie_part_release_device;
>> +       ret = device_add(dev);
>> +       if (ret) {
>> +               dev_err(dev, "device_add failed: %d\n", ret);
>> +               put_device(dev);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret) {
>> +               put_device(dev);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       list_add_tail(&apart->node, &adev->partitions);
>> +       mutex_unlock(&adev->mlock);
>> +       get_device(&adev->dev);
>> +       dev_dbg(dev, "created AIE partition device.\n");
>> +
>> +       return apart;
>> +}
>> +
>> +struct aie_partition *
>> +of_aie_part_probe(struct aie_device *adev, struct device_node *nc)
>> +{
>> +       struct aie_partition *apart;
>> +       struct aie_range range;
>> +       u32 partition_id, regs[4];
>> +       int ret;
>> +
>> +       /* Select device driver */
>> +       ret = of_property_read_u32_array(nc, "reg", regs, ARRAY_SIZE(regs));
>> +       if (ret < 0) {
>> +               dev_err(&adev->dev,
>> +                       "probe %pOF failed, no tiles range information.\n",
>> +                       nc);
>> +               return ERR_PTR(ret);
>> +       }
>> +       range.start.col = regs[0];
>> +       range.start.row = regs[1];
>> +       range.size.col = regs[2];
>> +       range.size.row = regs[3];
>> +
>> +       ret = of_property_read_u32_index(nc, "xlnx,partition-id", 0,
>> +                                        &partition_id);
>> +       if (ret < 0) {
>> +               dev_err(&adev->dev,
>> +                       "probe %pOF failed, no partition id.\n", nc);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       ret = mutex_lock_interruptible(&adev->mlock);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>> +       apart = aie_get_partition_from_id(adev, partition_id);
>> +       mutex_unlock(&adev->mlock);
>> +       if (apart) {
>> +               dev_err(&adev->dev,
>> +                       "probe failed: partition %u exists.\n",
>> +                       partition_id);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       apart = aie_create_partition(adev, &range);
>> +       if (IS_ERR(apart)) {
>> +               dev_err(&adev->dev,
>> +                       "%s: failed to create part(%u,%u),(%u,%u).\n",
>> +                       __func__, range.start.col, range.start.row,
>> +                       range.size.col, range.size.row);
>> +               return apart;
>> +       }
>> +
>> +       of_node_get(nc);
>> +       apart->dev.of_node = nc;
>> +       apart->partition_id = partition_id;
>> +
>> +       dev_info(&adev->dev,
>> +                "AI engine part(%u,%u),(%u,%u), id %u is probed successfully.\n",
>> +                range.start.col, range.start.row,
>> +                range.size.col, range.size.row, apart->partition_id);
>> +
>> +       return apart;
>> +}
>> +
>> +/**
>> + * aie_destroy_part() - destroy AI engine partition
>> + * @apart: AI engine partition
>> + *
>> + * This function will remove AI engine partition.
>> + */
>> +void aie_part_remove(struct aie_partition *apart)
>> +{
>> +       device_del(&apart->dev);
>> +       put_device(&apart->dev);
>> +}
>> diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-res.c b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
>> new file mode 100644
>> index 0000000..36f08bf
>> --- /dev/null
>> +++ b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Xilinx AI Engine device driver
>> + *
>> + * Copyright (C) 2020 Xilinx, Inc.
>> + */
>> +
>> +#include <linux/bitmap.h>
>> +
>> +#include "ai-engine-internal.h"
>> +
>> +/**
>> + * aie_resource_initialize() - initialize AI engine resource
>> + * @res: pointer to AI engine resource
>> + * @count: total number of element of this resource
>> + * @return: 0 for success, negative value for failure.
>> + *
>> + * This function will initialize the data structure for the
>> + * resource.
>> + */
>> +int aie_resource_initialize(struct aie_resource *res, int count)
>> +{
>> +       if (!res || !count)
>> +               return -EINVAL;
>> +       res->bitmap = bitmap_zalloc(count, GFP_KERNEL);
>> +       if (!res->bitmap)
>> +               return -ENOMEM;
>> +       res->total = count;
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * aie_resource_uninitialize() - uninitialize AI engine resource
>> + * @res: pointer to AI engine resource
>> + *
>> + * This function will release the AI engine resource data members.
>> + */
>> +void aie_resource_uninitialize(struct aie_resource *res)
>> +{
>> +       res->total = 0;
>> +       if (res->bitmap)
>> +               bitmap_free(res->bitmap);
>> +}
>> +
>> +/**
>> + * aie_resource_check() - check availability of requested resource
>> + * @res: pointer to AI engine resource to check
>> + * @start: start index of the required resource, it will only be used if
>> + *        @continuous is 1. It will check the available resource starting from
>> + *        @start
>> + * @count: number of requested element
>> + * @return: start resource id if the requested number of resources are available
>> + *         It will return negative value of errors.
>> + *
>> + * This function will check the availability. It will return start resource id
>> + * if the requested number of resources are available.
>> + */
>> +int aie_resource_check_region(struct aie_resource *res,
>> +                             u32 start, u32 count)
>> +{
>> +       unsigned long id;
>> +
>> +       if (!res || !res->bitmap || !count)
>> +               return -EINVAL;
>> +       id = bitmap_find_next_zero_area(res->bitmap, res->total, start,
>> +                                       count, 0);
>> +       if (id >= res->total)
>> +               return -ERANGE;
>> +
>> +       return (int)id;
>> +}
>> +
>> +/**
>> + * aie_resource_get_region() - get requested AI engine resource
>> + * @res: pointer to AI engine resource to check
>> + * @count: number of requested element
>> + * @start: start index of the required resource
>> + * @return: start resource id for success, and negative value for failure.
>> + *
>> + * This function check if the requested AI engine resource is available.
>> + * If it is available, mark it used and return the start resource id.
>> + */
>> +int aie_resource_get_region(struct aie_resource *res, u32 start, u32 count)
>> +{
>> +       unsigned long off;
>> +
>> +       if (!res || !res->bitmap || !count)
>> +               return -EINVAL;
>> +       off = bitmap_find_next_zero_area(res->bitmap, res->total, start,
>> +                                        count, 0);
>> +       if (off >= res->total) {
>> +               pr_err("Failed to get available AI engine resource.\n");
>> +               return -ERANGE;
>> +       }
>> +       bitmap_set(res->bitmap, off, count);
>> +
>> +       return (int)off;
>> +}
>> +
>> +/**
>> + * aie_resource_put_region() - release requested AI engine resource
>> + * @res: pointer to AI engine resource to check
>> + * @start: start index of the resource to release
>> + * @count: number of elements to release
>> + *
>> + * This function release the requested AI engine resource.
>> + */
>> +void aie_resource_put_region(struct aie_resource *res, int start, u32 count)
>> +{
>> +       if (!res || !count)
>> +               return;
>> +       bitmap_clear(res->bitmap, start, count);
>> +}
>> diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
>> new file mode 100644
>> index 0000000..acbc781
>> --- /dev/null
>> +++ b/include/uapi/linux/xlnx-ai-engine.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) 2020, Xilinx Inc.
>> + */
>> +
>> +#ifndef _UAPI_AI_ENGINE_H_
>> +#define _UAPI_AI_ENGINE_H_
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +enum aie_reg_op {
>> +       AIE_REG_WRITE,
>> +};
>> +
>> +/* AI engine partition is in use */
>> +#define XAIE_PART_STATUS_INUSE         (1U << 0)
>> +
>> +/**
>> + * struct aie_location - AIE location information
>> + * @col: column id
>> + * @row: row id
>> + */
>> +struct aie_location {
>> +       __u32 col;
>> +       __u32 row;
>> +};
>> +
>> +/**
>> + * struct aie_range - AIE range information
>> + * @start: start tile location
>> + * @size: size of the range, number of columns and rows
>> + */
>> +struct aie_range {
>> +       struct aie_location start;
>> +       struct aie_location size;
>> +};
>> +
>> +/**
>> + * struct aie_reg_args - AIE access register arguments
>> + * @op: if this request is to read, write or poll register
>> + * @mask: mask for mask write, 0 for not mask write
>> + * @offset: offset of register to the start of an AI engine partition
>> + * @val: value to write or get
>> + */
>> +struct aie_reg_args {
>> +       enum aie_reg_op op;
>> +       __u32 mask;
>> +       __u64 offset;
>> +       __u32 val;
>> +};
>> +
>> +/**
>> + * struct aie_range_args - AIE range request arguments
>> + * @partition_id: partition id. It is used to identify the
>> + *               AI engine partition in the system.
>> + * @uid: image identifier loaded on the AI engine partition
>> + * @range: range of AIE tiles
>> + * @status: indicate if the AI engine is in use.
>> + *         0 means not in used, otherwise, in use.
>> + */
>> +struct aie_range_args {
>> +       __u32 partition_id;
>> +       __u32 uid;
>> +       struct aie_range range;
>> +       __u32 status;
>> +};
>> +
>> +/**
>> + * struct aie_partition_query - AIE partition query arguments
>> + * @partition_cnt: number of defined partitions in the system
>> + * @partitions: buffer to store defined partitions information.
>> + */
>> +struct aie_partition_query {
>> +       struct aie_range_args *partitions;
>> +       __u32 partition_cnt;
>> +};
>> +
>> +/**
>> + * struct aie_partition_req - AIE request partition arguments
>> + * @partition_id: partition node id. It is used to identify the AI engine
>> + *               partition in the system.
>> + * @uid: image identifier loaded on the AI engine partition
>> + * @meta_data: meta data to indicate which resources used by application.
>> + * @flag: used for application to indicate particular driver requirements
>> + *       application wants to have for the partition. e.g. do not clean
>> + *       resource when closing the partition.
>> + */
>> +struct aie_partition_req {
>> +       __u32 partition_id;
>> +       __u32 uid;
>> +       __u64 meta_data;
>> +       __u32 flag;
>> +};
>> +
>> +#define AIE_IOCTL_BASE 'A'
>> +
>> +/* AI engine device IOCTL operations */
>> +#define AIE_ENQUIRE_PART_IOCTL         _IOWR(AIE_IOCTL_BASE, 0x1, \
>> +                                             struct aie_partition_query)
>> +#define AIE_REQUEST_PART_IOCTL         _IOR(AIE_IOCTL_BASE, 0x2, \
>> +                                            struct aie_partition_req)
>> +
>> +/* AI engine partition IOCTL operations */
>> +#define AIE_REG_IOCTL                  _IOWR(AIE_IOCTL_BASE, 0x8, \
>> +                                             struct aie_reg_args)
>> +#endif
> 
> Not really a review but don't use pointers in ioctls, don't use enums in ioctl
> 
> For ptrs use __u64 and enums use __u32
Will make the change
> 
> I think aie_partition_req also may need a __u32 pad to align to 64-bit properly.
I don't quite get this comment, partition_id and uid are __u32, there 
should be no hole before meta_data. and flag after meta_data is __u32, i 
am not clear on the usage of adding __u32 pad.

Thanks,
Wendy

> 
> Dave.
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
