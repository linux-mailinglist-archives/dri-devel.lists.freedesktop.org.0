Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAEE232493
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 20:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC9C6E5D3;
	Wed, 29 Jul 2020 18:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91216E5D3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 18:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBqV1eTr/OsJIR3gnlMlqg26DAWbu5rr0neV3kCfaCKZWyYhTgftGEwtXSGXRQZe5GjpNH9V8Zj/VatGApbsCaw+1i8OoMN/Bv4YY5H1qutV8HztfEayZd7rOWLI1mNOhYZ6pDHirLBdlUxh36hXIHH4R7j65Xf6QZigt/VrzbkcW8+taVDYUdKBy5/u9X3A7Cf//PH+X54UmaGLNeaL1nGSr8XlFH+xis78K/OVr7tCUDFEzhSbnOLd+0J7LMMpsSYML4h8ICu19nYgeL4cZCK2beBGX5DPS+vZ+7m532CbRoZkF0Cv6Zt44ZTrWI7yUBrRJOP9J2cwhJDRKi/vTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfY6RZ8T6pfJK9R0u0RaxTYam5JbSc/xW4bp/4bX7L0=;
 b=PF3Eg8mra94nRKl/OwtgEBH7qIV+HdZTTJagrL2YamnWFW2ps+zz+s6mYFZTRSDoVX6KPHwGu8flk+D6WcVpS7eVAIL48nSJdmJ9Gf7SflnMOZZPLSee9PdMju4Z1ZM8q7CDIVFDDq2hoRmbsgN9oZvy1oDCt/JNmRLGe5LDul/wsrelRtt2rTamsLEhOAm9G8Q6P9/gDwGt6xGsr68+sP6a9M2ddRUfoWcDnQ+enORbssooSeis36baFK3XvmMDRzpvGVXvjVVLeWvlaxzrwLqP898HfUIKRC9ugQKwr96Y/oAEGHRiZ2AlKlC9vlo7brkjWVKxarpuHa00UVWPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=oracle.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfY6RZ8T6pfJK9R0u0RaxTYam5JbSc/xW4bp/4bX7L0=;
 b=DD2ggDyyALWs0hzsyxmLF0AJysuKNQKjcbtX/h1PNxc84PexjUE9kqr9inu91eqtMU3EOEfN+3vVx9JepHxoYidrXNWxmszcvySdTKPOY4Ge0c8/cDNG9HzkQ+ta2034iPKx+SWwsYalDyRaYmgAPRMktJ3QuVu7cPRg548aXHU=
Received: from SN6PR05CA0034.namprd05.prod.outlook.com (2603:10b6:805:de::47)
 by DM5PR0201MB3480.namprd02.prod.outlook.com (2603:10b6:4:7b::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 18:25:10 +0000
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:de:cafe::eb) by SN6PR05CA0034.outlook.office365.com
 (2603:10b6:805:de::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend
 Transport; Wed, 29 Jul 2020 18:25:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT022.mail.protection.outlook.com (10.152.72.148) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 18:25:09
 +0000
Received: from [149.199.38.66] (port=40493 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qjK-0008F8-PZ; Wed, 29 Jul 2020 11:23:06 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qlJ-000135-Hy; Wed, 29 Jul 2020 11:25:09 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06TIP8Zp019710; 
 Wed, 29 Jul 2020 11:25:08 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qlI-00011a-5H; Wed, 29 Jul 2020 11:25:08 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id ECD8A2C238C; Wed, 29 Jul 2020 11:21:16 -0700 (PDT)
Date: Wed, 29 Jul 2020 11:21:16 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
 DisplayPort Subsystem
Message-ID: <20200729182116.GA29204@xilinx.com>
References: <20200727111825.GB389488@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727111825.GB389488@mwanda>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8b3cf64-7a43-4d45-61cc-08d833ecb9f9
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3480:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB34804342EF4B2F04DA3938FDD6700@DM5PR0201MB3480.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8nYZpdKFbvlX7NN7rLE/7idPMt4TecB62zvpJ97UsKrlmljwTKsGplMSFNaJcIWuqZaAhVA564P7Oevthp4zBpb9aKMdNBC53f3q4QFn5wIQdNvdMsKE2rv9wnK9wTYLok1iLGstlZpuhffvMKT6mgCCHbl0rh6H/ywH5AFa3Q8oGolguvA0sz2/zgIDPZ7NxymFXaqzSwrE/4e/JURGRJ5QmVl3T6SSb4Czwg8BRIPNBeR7rs3uUL5wUWb+hSPOnqBwK2GHclVyPRZ2+bBQh7OFoiPge9jOsnuCv9lfmoWOIbLM35UQhj6WSSGqcyyq8WOd5E52bdRiHB1Di9quKhnakqGMWnbLx3e4ML0nTRT5X1BHlm/k7wPJrCsl7i/TtqYyOGGz7jRd+zwVPgw8/zP32XQPeNcywfphY4qVMeXaXyxDTqXG35YvJb+OLgv
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(136003)(376002)(39860400002)(46966005)(42186006)(8676002)(5660300002)(336012)(4326008)(70586007)(8936002)(316002)(26005)(44832011)(70206006)(966005)(6266002)(33656002)(2616005)(6916009)(478600001)(47076004)(426003)(36756003)(82310400002)(83380400001)(82740400003)(1076003)(2906002)(81166007)(186003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 18:25:09.8322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3cf64-7a43-4d45-61cc-08d833ecb9f9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3480
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Thanks for sharing.

On Mon, Jul 27, 2020 at 04:18:25AM -0700, dan.carpenter@oracle.com wrote:
> Hello Hyun Kwon,
> 
> The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> static checker warning:
> 
> 	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
> 	error: iterator underflow 'bws' (-1)-2
> 
> drivers/gpu/drm/xlnx/zynqmp_dp.c
>    566  static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
>    567                                      u8 current_bw)
>    568  {
>    569          int max_rate = dp->link_config.max_rate;
>    570          u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
>    571          u8 max_lanes = dp->link_config.max_lanes;
>    572          u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
>    573          u8 bpp = dp->config.bpp;
>    574          u8 lane_cnt;
>    575          s8 i;
>    576  
>    577          if (current_bw == DP_LINK_BW_1_62) {
>    578                  dev_err(dp->dev, "can't downshift. already lowest link rate\n");
>    579                  return -EINVAL;
>    580          }

There are checks like this that ensure the 'i' to be not negative, but I agree
it should be made clearer. I've sumitted a fix for it [1].

[1] https://lists.freedesktop.org/archives/dri-devel/2020-July/274190.html

Thanks,
-hyun

>    581  
>    582          for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
>                                               ^^^^^^
> This exits with i == -1.
> 
>    583                  if (current_bw && bws[i] >= current_bw)
>    584                          continue;
>    585  
>    586                  if (bws[i] <= max_link_rate_code)
>    587                          break;
>    588          }
>    589  
>    590          for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
>    591                  int bw;
>    592                  u32 rate;
>    593  
>    594                  bw = drm_dp_bw_code_to_link_rate(bws[i]);
>                                                          ^^^^^^
> Potential negative array offset.
> 
>    595                  rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
>    596                  if (pclock <= rate) {
>    597                          dp->mode.bw_code = bws[i];
>    598                          dp->mode.lane_cnt = lane_cnt;
>    599                          dp->mode.pclock = pclock;
>    600                          return dp->mode.bw_code;
>    601                  }
>    602          }
>    603  
>    604          dev_err(dp->dev, "failed to configure link values\n");
>    605  
>    606          return -EINVAL;
>    607  }
> 
> regards,
> dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
