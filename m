Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2924C8BF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172FE6E1AA;
	Thu, 20 Aug 2020 23:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400446E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJCmfOZK6DOYsVtsKjMar4RuANVLkXtKDSD9QUl8wfkJTLVAetbITjr69YDmpnsauoilPCsSy18IdT0W/ueVLVwyBuQmgZY7ucnoyIc9OKiDG/AOfsOfu9LAzKwaOM0ob0XnNcRegpetb3f69mqQ8ZIzoq8ELwkQ8RxhKtUPxXctucKexMQ0/4kNibSBIFEVZ8ci7z8ep2+irAv33XwVoMJVBe3ErBN7Oep3NQhZr0i0tDZGVLqHLeM+/0GQOXgHEYOesgZ/uV3NTFVlI1FUY/qL6s3QETbToJcegvCfUu52bGNUbhHe8PC/+EGtW7RpqGO4FYwNCBQRnR04OE6Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLxZ+qZ93U3l/KX8blipVuPupSgJ5BHI9+p5V4DCtbw=;
 b=J/RGb0iG2I/rxYxoAk44uB7xSG2XvgoB8R46l/3Bffc3zTNUnMmLyjPeZGAiD2TLLfaFiWcG/YltoEFCR035CScnk0hoTRj7YDTCuUl4Xnfvj1lD+EI4ENv9/P271WzN6w4rzuK967h2bL1lhjNyQvri3R+T2yDd6Cf+ZkDbfhLaxc5ZE2Xj/xKINQV1WTMvB+CFwulyCQtmHPmrGxRNyzyLYFM3RphT+W/fIynuYhz6Rp2MAqBUNcJ/GIH755vVvb4T0Xzxc1iAzLnXJxuHkVxv0pqlcLoYAC3tD6HsucEyMlFPWX0Z/s+Vc8+nqhdAJFn28tnFfcP4MKYoas/uXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLxZ+qZ93U3l/KX8blipVuPupSgJ5BHI9+p5V4DCtbw=;
 b=CpAyFzR0M/nQBOJp9fzbPaFNXQIY+L6wT8fqVS07Vjhh3/W+KSsUgkWs4rPud01LngF4dqWzPY+5GZuxBrCRUIFJCxlKDBgctikVuZ1qbPZl186FgKI9yxEzeXL9r1T+esWbOIsN8VohHtqH2Mrb+Terape9sNqX4D/6Iy17Mmo=
Received: from CY4PR1101CA0024.namprd11.prod.outlook.com
 (2603:10b6:910:15::34) by DM6PR02MB5083.namprd02.prod.outlook.com
 (2603:10b6:5:4f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 23:43:44 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:15:cafe::70) by CY4PR1101CA0024.outlook.office365.com
 (2603:10b6:910:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 23:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with Microsoft SMTP
 Server id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 23:43:44
 +0000
Received: from [149.199.38.66] (port=33231 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k8uDK-0003Tp-Dv; Thu, 20 Aug 2020 16:43:22 -0700
Received: from [127.0.0.1] (helo=xsj-pvapsmtp01)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k8uDg-0003ze-3n; Thu, 20 Aug 2020 16:43:44 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyunk@smtp.xilinx.com>)
 id 1k8uDf-0003zb-Pf; Thu, 20 Aug 2020 16:43:43 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id 7B5A62C69F0; Thu, 20 Aug 2020 16:38:18 -0700 (PDT)
Date: Thu, 20 Aug 2020 16:38:18 -0700
To: Kenneth Sloat <ksloat@designlinxhs.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: dt-bindings: display: xlnx: mixer: Inconsistent pixel format
 terminology in dt docs
Message-ID: <20200820233817.GA508@xilinx.com>
References: <1ac0eeed-7455-b0a3-a3e4-4501ae3129df@designlinxhs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ac0eeed-7455-b0a3-a3e4-4501ae3129df@designlinxhs.com>
Thread-Topic: dt-bindings: display: xlnx: mixer: Inconsistent pixel format
 terminology in dt docs
Thread-Index: AQHWdzdZDHMJ4RCJPEqeVWmACT1c3alBo8Yg
Content-Language: en-US
User-Agent: Mutt/1.5.24 (2015-08-30)
From: hyun.kwon@xilinx.com (Hyun Kwon)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 280bfc78-fbc5-4006-ae1d-08d84562e037
X-MS-TrafficTypeDiagnostic: DM6PR02MB5083:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5083D0F8916CFDB13C0204CBD65A0@DM6PR02MB5083.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i/OIUorq/+IDQ0oYKald12UJtKldeXRyFafQT67RZlGTEXw+YD1U2GsFZ7Ri+mSOQHkge4rj6Cxk5XnN3lyNzoduHezBk3q6n6v7v2RDGQfwryalUD8s+A9jtYAtVL+mP6ifHa64I84y+8LyVgivHCltdzh5M9CgScyVhQWLKv3XaDCic7mtsKVc9CaSAMULgbE1dp4FUkXGFn/iSCHGHci+JPkbxJN14xJ4gYNnUOU06vXOOq2rGc2AcjB9y0K+LscmElLxUF8oKBTy4wTraJWYRM3LD6X/MoKsvoSi3oY1Pufo4CU04CCahZONFelHMp/b2GpVzGp6cqGn7tK090shUJQ/ivbxuUqczsN2mJnCXLpnlnCeavn40gs87sB3lT7mn+Vq2AbepX0BHxL6eA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(136003)(46966005)(70206006)(8676002)(336012)(4326008)(82310400002)(42882007)(478600001)(70586007)(8936002)(53546011)(81166007)(356005)(83170400001)(83380400001)(82740400003)(47076004)(2906002)(186003)(26005)(6266002)(1076003)(54906003)(42186006)(426003)(36756003)(5660300002)(9686003)(316002)(33656002)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 23:43:44.3682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 280bfc78-fbc5-4006-ae1d-08d84562e037
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5083
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kenneth,

> -----Original Message-----
> From: Kenneth Sloat <ksloat@designlinxhs.com>
> Sent: Thursday, August 20, 2020 2:18 PM
> To: Hyun Kwon <hyunk@xilinx.com>; linux-arm-kernel@lists.infradead.org
> Cc: Michal Simek <michals@xilinx.com>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; laurent.pinchart@ideasonboard.com;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> mark.rutland@arm.com
> Subject: dt-bindings: display: xlnx: mixer: Inconsistent pixel format terminology
> in dt docs
> 
> Hello,
> 
> The Xilinx Video mixer IP uses the DRM fourcc string as a device tree binding in
> order to describe the format for a specific DRM layer/plane. Currently, in the
> device tree doc in
> "Documentation/devicetree/bindings/dma/xilinx/xilinx_frmbuf.txt" there is a list
> called "VIDEO FORMATS" with a table containing "Mixer IP Format" and
> associated "Driver supported Format String" (fourcc). In general, this table is not
> helpful, because "Mixer IP Format" does not match the Xilinx IP datasheet
> terminology for formats but rather some other commonly used nomenclature.
> This is also inconsistent from other Xilinx dts binding docs which specify the
> actual correct IP name and at times list other format nomenclature where
> helpful (i.e. xilinx_frmbuf.txt)
> 
> My suggestion is to remove the current "Mixer IP Format" strings in the doc and
> replace them with the actual IP names in the datasheet (which also match those
> used in Xilinx's Vivado FPGA tool). Otherwise, the programmer must cross
> reference other dts documentation or the code in order to figure these out. I am
> happy to provide a patch for this but wanted to throw out the suggestion first.

I agree. The bindings should be in sync with datasheet and not rely on
software definitions. Since the driver is only in Xilinx vendor tree,
please send directly to git@xilinx.com.

Thanks!

-hyun

> 
> Thanks
> 
> Sincerely,
> Ken Sloat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
