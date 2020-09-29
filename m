Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1D27BDC1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1756E453;
	Tue, 29 Sep 2020 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7521689DEA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 06:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks7oZ/rnqbMXqQCopFBm7deE8l/qeC/w88ZGLvCj49IXgCIj0lPYaGC62MkG3q410DcNVSH3EzflytMoqWLi1HqbJGbxlau/6b1mr5Y8twzVkYYVc6XXBxQ+y6bsqCLm+IDDnjE99Vr84v1F6yT+jG+SEuBwPVSBlaym/0EJUQXXcYD8UwMvqTeuih+umfN02eZwR3bXc2fhDZryN8LmPOL3VK47rm84CR+NkS4/pr7ltxKTD2rn8JhzeIaJ4tfcpg3yrdWDN4aCNPTgZ9J49LfkIeUc1ldtx55vc9mGosOfhLz+YoNv4h6QhdSclK/qIcQ3VAz910wyZ0oFrdnVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk1Gh0Rm9b9x9PxjjNYgp4j400ngpKn4v+SU5+ALYpg=;
 b=dz++3v5KCUzG8aTkwhsNrfI2YXAoNHsNRtgt9vjNfo/fSFh026OlLqpUVPlmc3zMsLrMg8auaPyTbdrhWOnn/707Brhv8dbk+pJ0dKzeFSCaIDZ/wqjTZQY3CvLCNURZSeWY2J/wSLpctF+bt1Ub92x4QVbW582kiLjcIOJ7pemY7M/ujWUVJ3w94vWMuNObhm0bcAunMy8OiZd6yBwlKUzkojHUDCLEMz+UOT458Ub3AT9U9if/ggwYoz5MPGZH0T820yezUXgpiGG9bdkZ7JQjPCQUw2Q4G5EbikdJaw13V6uFcNa9EHIm4hCjWQfAlGNPQzENgjpaXiScjv8mhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk1Gh0Rm9b9x9PxjjNYgp4j400ngpKn4v+SU5+ALYpg=;
 b=cAhb7IkNZcIk7z4ocrlOBV9pcqkHr4jU38k0ycjlBfLABSgPnWCT/Oh2ec4vhV38urkFDm/kqoPOONYePGGjqx+VCAgKJ+fWRfUnz1ip/IqOXhJKkdevPoyldcLmicNKh3zO9qkf6mPCn7hClmiocgQrqizG0DsUFoHN3UzSwd8=
Received: from DM6PR13CA0030.namprd13.prod.outlook.com (2603:10b6:5:bc::43) by
 BN6PR02MB2691.namprd02.prod.outlook.com (2603:10b6:404:fb::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.25; Tue, 29 Sep 2020 06:55:39 +0000
Received: from CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::d9) by DM6PR13CA0030.outlook.office365.com
 (2603:10b6:5:bc::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.20 via Frontend
 Transport; Tue, 29 Sep 2020 06:55:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT045.mail.protection.outlook.com (10.152.75.111) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 06:55:39
 +0000
Received: from [149.199.38.66] (port=44137 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1kN9Xf-0006Oo-2t; Mon, 28 Sep 2020 23:55:15 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1kN9Y3-00044g-2J; Mon, 28 Sep 2020 23:55:39 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08T6tasv010098; 
 Mon, 28 Sep 2020 23:55:36 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1kN9Y0-00044D-A2; Mon, 28 Sep 2020 23:55:36 -0700
Subject: Re: [PATCH] dt-bindings: Fix 'reg' size issues in zynqmp examples
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20200928155953.2819930-1-robh@kernel.org>
From: Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <68d57be8-c2e9-4bfd-4f7f-041aa3ce2e92@xilinx.com>
Date: Tue, 29 Sep 2020 08:55:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928155953.2819930-1-robh@kernel.org>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b041b7-fd0c-40a4-6472-08d86444acd7
X-MS-TrafficTypeDiagnostic: BN6PR02MB2691:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2691B026AE8C33E62E49C2DDC6320@BN6PR02MB2691.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqLTNEP8db/5I8/AYX8jTMUPza2AIBLFGMtmV3V/D1Qr4rhZFli8EsOkVrdVSUf60rvfh0Zkq8R2AFWF2alXhUOb9xMNk1JSmV2K1JM5tIzUjnjMNG9cWoBsNQE+ZUsPtBLJuIyx3P32DOH60SC+eGDefw5W0dDjI9DOWw0TQ5AgMmZaB54GmhpYa9l6n4lSZU4nia6XapM5m1FL8JUBI/b5dXgn6KJFCTTMqIWmAEqA4KljkmVVRMSXUItKi6BhcbFt5PjDnXCFrnIyPxx3KkZLrtUvT3q95Tb+20xUyFjlMzoPnF2dkKrJEIvmK6nF3yoIMFWVfHjFGMna6iOZIq3RdQpJxIy9pFWosv0IHgncws2guxe9igDmDqghpBgoxTn6K+/2Ew17iWx696gBdCtZwryTVUZ+0tatliGgGk2XEbAb5q/OgibBQFC56klkLLnFsp6lI/TitJOZCXxmR53jgVPo5H9f89VnYYeWLXs=
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(346002)(376002)(46966005)(2616005)(6666004)(54906003)(316002)(8676002)(478600001)(8936002)(426003)(36756003)(44832011)(186003)(4326008)(82310400003)(82740400003)(47076004)(31686004)(356005)(83380400001)(81166007)(9786002)(2906002)(70586007)(70206006)(31696002)(26005)(336012)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 06:55:39.3176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b041b7-fd0c-40a4-6472-08d86444acd7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2691
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 28. 09. 20 17:59, Rob Herring wrote:
> The default sizes in examples for 'reg' are 1 cell each. Fix the
> incorrect sizes in zynqmp examples:
> 
> Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.example.dt.yaml: example-0: dma-controller@fd4c0000:reg:0: [0, 4249616384, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:0: [0, 4249485312, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:1: [0, 4249526272, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:2: [0, 4249530368, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml: example-0: display@fd4a0000:reg:3: [0, 4249534464, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> 
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml          | 8 ++++----
>  .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> index 52a939cade3b..7b9d468c3e52 100644
> --- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> @@ -145,10 +145,10 @@ examples:
>  
>      display@fd4a0000 {
>          compatible = "xlnx,zynqmp-dpsub-1.7";
> -        reg = <0x0 0xfd4a0000 0x0 0x1000>,
> -              <0x0 0xfd4aa000 0x0 0x1000>,
> -              <0x0 0xfd4ab000 0x0 0x1000>,
> -              <0x0 0xfd4ac000 0x0 0x1000>;
> +        reg = <0xfd4a0000 0x1000>,
> +              <0xfd4aa000 0x1000>,
> +              <0xfd4ab000 0x1000>,
> +              <0xfd4ac000 0x1000>;
>          reg-names = "dp", "blend", "av_buf", "aud";
>          interrupts = <0 119 4>;
>          interrupt-parent = <&gic>;
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> index 5de510f8c88c..2a595b18ff6c 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> @@ -57,7 +57,7 @@ examples:
>  
>      dma: dma-controller@fd4c0000 {
>        compatible = "xlnx,zynqmp-dpdma";
> -      reg = <0x0 0xfd4c0000 0x0 0x1000>;
> +      reg = <0xfd4c0000 0x1000>;
>        interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>        interrupt-parent = <&gic>;
>        clocks = <&dpdma_clk>;
> 

I would prefer to keep 64bit version.
I use this style.

    bus {
      #address-cells = <2>;
      #size-cells = <2>;
       ...
    };

Thanks,
Michal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
