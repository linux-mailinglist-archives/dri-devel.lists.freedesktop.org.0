Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEC2D5553
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C73A6EA2F;
	Thu, 10 Dec 2020 08:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3BE6E133
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 19:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMdPrJ2a3hYQWs1WLaadD8KtOKwYMqkc3Mi39fNpXyOEdiCDR5lHpRbGWbw6GdEyoMCJnkQsXz6L5726YZetrME12UG68kK34Al5c3fr73XdgOrLpmAQMBo9EIdemzKzJ7euuLmJRqPSWTKDAIiV+dl5HiU1eE5XRDPcPl5q3bVGZqfdNhlBa050Ps0YU8MrB7AUWrkDzMX9CN1Qyv5TunMbKgYtGrxv9UVCuHL3ITTSzOxVLVitEO/M1hEwgEImMQihoPKIDsg6llEbXEky608CyWdhJtwsF7jkXv5PvhZqtzuyGRgZ0B48QLziXJIMCbYJg0qSUduie9TOcqynOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8VPzXLiM4p9h/Hd9kIgUfgIPmWLRHkfIwEDzg/KWGE=;
 b=XL1Mfm/PAlyR+VOAJy3OB9dY28B91HUhst9RiHKm1JfKfl7SJBi+/lSGKqjfNDn/t74knG+JTg66cNduf5eVZz2PHArmNshrhWYLPy9VVvclL1+2pL4uyrQHk5aQ9rqbvGzIQ3eac8BYiH9bXoWm5C2q7zyKUwCTo86hu7ropNovPe7EgxOyxAccfUuIXMcfyxhiJZZgfL0xvyDrcSJsGpQSmiNRgBtTyjBM9ji0JzOp9XDajxJWoS11FPC5yeWWiW6aFSaV7dOONO1F77blwq0Yp+KnfievM6mZ1S5sQeCHH3tjaQ6G5kUaCD2Efbo14pt1uo1SPLRM3xpeMxT7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8VPzXLiM4p9h/Hd9kIgUfgIPmWLRHkfIwEDzg/KWGE=;
 b=Nrw7DXvcg52lMkgAppHpmcKsCLLTaFD3/pzMgLolSKZ8Weix6C+s9kSggmdA9bWGNKC6HKrzsIYjFtR/PP+SKE0GoyX9Bb7Sbx/aHL5SBr0l7orI0ZAm3Pq02LTKlnbNX5dzTB46YBkFHomRLB6yBJcFLsuLVps7GP1qcicUBMc=
Received: from CY4PR22CA0070.namprd22.prod.outlook.com (2603:10b6:903:ae::32)
 by BYAPR02MB5510.namprd02.prod.outlook.com (2603:10b6:a03:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 19:52:24 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::38) by CY4PR22CA0070.outlook.office365.com
 (2603:10b6:903:ae::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 19:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 19:52:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 9 Dec 2020 11:52:23 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 9 Dec 2020 11:52:23 -0800
Envelope-to: ravi.patel@xilinx.com, manish.narani@xilinx.com,
 tejas.patel@xilinx.com, rajan.vaja@xilinx.com,
 dragan.cvetic@xilinx.com, derek.kiernan@xilinx.com,
 michal.simek@xilinx.com, wendy.liang@xilinx.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 christian.koenig@amd.com, sumit.semwal@linaro.org,
 gregkh@linuxfoundation.org, arnd@arndb.de, robh@kernel.org
Received: from [10.23.123.121] (port=51445)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kn5Ve-0002GZ-UO; Wed, 09 Dec 2020 11:52:22 -0800
Subject: Re: [PATCH v3 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
To: Rob Herring <robh@kernel.org>, Wendy Liang <wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <1606722505-16194-2-git-send-email-wendy.liang@xilinx.com>
 <20201208234127.GA3303888@robh.at.kernel.org>
From: Jiaying Liang <wendy.liang@xilinx.com>
Message-ID: <2ca6ea61-5aab-c0dd-8432-0b2bcff7169f@xilinx.com>
Date: Wed, 9 Dec 2020 11:52:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208234127.GA3303888@robh.at.kernel.org>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb73b7af-f2eb-4a03-0126-08d89c7bf283
X-MS-TrafficTypeDiagnostic: BYAPR02MB5510:
X-Microsoft-Antispam-PRVS: <BYAPR02MB551044CD6635DF7AB3399D7EB0CC0@BYAPR02MB5510.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: guIpYb8NaTSHkt2saDIFuKS9sey99STqqfKV3dX3R3xxrY+E0l63b0H4RAtxWRU7FyVJz7UaumEcyBhwNwkBe2xb9t9JbX6fSh2lrfUDYNN7SNltq2I/GNrQM23VLz2kDvfTWTwbmELtlWAYi6xFRmWkzP4CewM4Fx71A4VVf+lXdQWlYjuVm55p8ymWdu6O0e5tzXLy6GoT1+r3XVWe96GG4K1PSCyfZbbRGoG5gNDtGRtAPQ0PKLl1etoK3LS4RmXn5KSdqPjC3LvkBXr05sjWS3LqVBLtPLD/WoNcvja/Gzylz2SHRjtcmTNqa7okGDMuGvOkId3GYUpR8q2rcYVrGte32x//ze0PZEDzIJFIdo65vZ80lfA73MwtcFbOzNMUkOtOrCBXL1iuj3whkYor35jmer/jrt14WgLFPEbvk9NBRo8jo6SGO/GXCbxZ1N97zn5wE00OcjzagPMpmcyh4UK43GzsOftLSvnLPIR1iaOSmqswEerCii2452gli8EcRyxA9I76xnWkluGsnQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(46966005)(2616005)(186003)(31696002)(36906005)(508600001)(53546011)(82310400003)(426003)(356005)(36756003)(47076004)(7636003)(8676002)(5660300002)(8936002)(7416002)(70206006)(26005)(336012)(9786002)(966005)(110136005)(83380400001)(2906002)(54906003)(31686004)(70586007)(4326008)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 19:52:23.5877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb73b7af-f2eb-4a03-0126-08d89c7bf283
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5510
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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
Cc: tejas.patel@xilinx.com, ravi.patel@xilinx.com, linux-kernel@vger.kernel.org,
 rajan.vaja@xilinx.com, arnd@arndb.de, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, dragan.cvetic@xilinx.com, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, manish.narani@xilinx.com,
 derek.kiernan@xilinx.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/8/20 3:41 PM, Rob Herring wrote:
> On Sun, Nov 29, 2020 at 11:48:17PM -0800, Wendy Liang wrote:
>> Xilinx AI engine array can be partitioned statically for different
>> applications. In the device tree, there will be device node for the AI
>> engine device, and device nodes for the statically configured AI engine
>> partitions. Each of the statically configured partition has a partition
>> ID in the system.
>>
>> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
>> ---
>>   .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 +++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>> new file mode 100644
>> index 0000000..1de5623
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>> @@ -0,0 +1,126 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Xilinx AI Engine
>> +
>> +maintainers:
>> +  - Wendy Liang <wendy.liang@xilinx.com>
>> +
>> +description: |+
> You don't need '|' unless there's formatting to preserve.
Will change
>
>> +  The Xilinx AI Engine is a tile processor with many cores (up to 400) that
>> +  can run in parallel. The data routing between cores is configured through
>> +  internal switches, and shim tiles interface with external interconnect, such
>> +  as memory or PL.
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,ai-engine-v1.0
> This is soft logic? If not, don't use version numbers.

It is not soft logic, if there is a future version of the device, can we 
use version number

in compatible to describe the device version?

>
>> +
>> +  reg:
>> +    description: |
>> +      Physical base address and length of the device registers.
> That's every 'reg' property. Drop.
[Wendy] will drop it.
>
>> +      The AI engine address space assigned to Linux is defined by Xilinx
>> +      platform design tool.
>> +
>> +  '#address-cells':
>> +    enum: [2]
> const: 2
Will change
>
>> +    description: |
>> +      size of cell to describe AI engine range of tiles address.
>> +      It is the location of the starting tile of the range.
>> +      As the AI engine tiles are 2D array, the location of a tile
>> +      is presented as (column, row), the address cell is 2.
>> +
>> +  '#size-cells':
>> +    enum: [2]
>> +    description: |
>> +      size of cell to describe AI engine range of tiles size.
>> +      As the AI engine tiles are 2D array, the size cell is 2.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description: phandle to the associated power domain
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    description: |
>> +      Should be "interrupt1", "interrupt2" or "interrupt3".
> Really, not useful names. If you do have names, they should be a schema,
> not freeform text.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +  - power-domains
>> +  - interrupt-parent
> Generally, never required because it could be in the parent node.
will remove
>
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +patternProperties:
>> +  "^aie_partition@[0-9]+$":
> aie-partition@
>
> The unit-address is just the 1st cell of reg (the row)? Or needs to be
> row and column, in which case you'd want something like '@0,0'. Also,
> unit-address values are typically hex, not decimal.
It will be col,row, will change to address format with starting column 
and row
>
>> +    type: object
>> +    description: |
>> +      AI engine partition which is a group of column based tiles of the AI
>> +      engine device. Each AI engine partition is isolated from the other
>> +      AI engine partitions. An AI engine partition is defined by Xilinx
>> +      platform design tools. Each partition has a SHIM row and core tiles rows.
>> +      A SHIM row contains SHIM tiles which are the interface to external
>> +      components. AXI master can access AI engine registers, push data to and
>> +      fetch data from AI engine through the SHIM tiles. Core tiles are the
>> +      compute tiles.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          It describes the group of tiles of the AI engine partition. It needs
>> +          to include the SHIM row. The format is defined by the parent AI engine
>> +          device node's '#address-cells' and '#size-cells' properties. e.g. a v1
>> +          AI engine device has 2D tiles array, the first row is SHIM row. A
>> +          partition which has 50 columns and 8 rows of core tiles and 1 row of
>> +          SHIM tiles will be presented as <0 0 50 9>.
> You should be able to write some constraints like max row and column
> values?

The max row and columns depends on the underline hardware platform, the 
driver can

get the max allowed row and columns from the size field of the "reg" 
property in the parent

AI engine device node.

>
>> +
>> +      label:
>> +        maxItems: 1
> 'label' is not an array. Why do you need label?
>
>> +
>> +      xlnx,partition-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          AI engine partition ID, which is defined by Xilinx platform design
>> +          tool to identify the AI engine partition in the system.
> I find the use of 'reg' a bit odd here. Maybe using 'reg' for partition
> would make more sense? Which is more closely associated with how you
> address the partition?

I am not clear on this comments, are you referring to partition-id?

The partition id is generated by Xilinx tool to identify the AI engine 
partition in the firmware.

The "reg" of the partition device node is to describe the location of 
the partition within

the AI engine device node.


Thanks,

Wendy

>
>> +
>> +    required:
>> +      - reg
>> +      - xlnx,partition-id
>> +    additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    bus {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      ai_engine: ai-engine@20000000000 {
>> +        compatible = "xlnx,ai-engine-v1.0";
>> +        reg = <0x200 0x0 0x1 0x0>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        power-domains = <&versal_firmware 0x18224072>;
>> +        interrupt-parent = <&gic>;
>> +        interrupts = <0x0 0x94 0x4>,
>> +                     <0x0 0x95 0x4>,
>> +                     <0x0 0x96 0x4>;
>> +        interrupt-names = "interrupt1", "interrupt2", "interrupt3";
>> +
>> +        aie_partition0: aie_partition@0 {
>> +                /* 50 columns and 8 core tile rows + 1 SHIM row */
>> +                reg = <0 0 50 9>;
>> +                xlnx,partition-id = <1>;
>> +        };
>> +      };
>> +    };
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
