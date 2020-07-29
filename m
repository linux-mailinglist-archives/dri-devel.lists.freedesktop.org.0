Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C62324B8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 20:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194526E152;
	Wed, 29 Jul 2020 18:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80646E152
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 18:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSCHje+w+YD0IXJJ3K4iYfNqhaV8YnOfFUDGVPm1NgWrcWcVDTc7h30UeVnsxrZSO+vWKl8P6xKhPo6RHvGo6R12nxfjVSjs5ArGDaA8iXcQw6dbsu7km6bqH+vqEEB30tXM+9pnLYW6theKeL2/4ulJoCoMqRI9uNdmWxshYlugBo5pEy3MJsd62JZxqIwNtJi1qNcFGJG5ct63PYQSQx6HycPAQ2UDD3Gk8+Pl6MqA2B8Zg+fEDPiFmLf5PXzOVQDPmvR+k2yPrK9+L3qz9CswQ2AcjH2yL0319iptB9iRWWcA7TjDoTB7XRsiP7NVlRRq3XtKURnLX5o6Pj2D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN38+2pQd3VyojX34PAU0ZWrNsn5DniqXqI/U2phHgQ=;
 b=Aj4cSoedlrSb8Ie+Ewqh9T7o8bQvyxSL6QKQyKXc39XBKZXzHJKjuXzNbz2HSjA4RRem6uoyRwlV0/3XHwWIjj1R1Rbo6tBB9FvBVau/bXOA1idh5Dn8BPYNOa1moqXq+ygdEViERmdJ4MiiPc9KhabXWakeW1MqixMS3YbBMU41IOZN3I7ac+He8elB1f0nGmxCDM4CH1vVayemwdalFoFWaXeW27eVRsnMxyKKTz2FoN5dzjzCqhsTaSieKlhWy86SNt2Tg63IApDebPdRGxRkm8qkiALuUKEktUqPLO4pPoC/5CRvmDT2TWsztKqjWG0CDNYgjTDzVbgqdk8Oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN38+2pQd3VyojX34PAU0ZWrNsn5DniqXqI/U2phHgQ=;
 b=qjM1MEPr+h9MUoajJ9mlsJb0fK9y+Xd7EDOdkEbIduzYtSi0feS3/MmL9HEmBYo9EJNZBXT+T2vwWlnwGO0CxscuRQA9E5a3GpMhhxYC/dEE6eaXKtLLuE1oR2rzK5s6fQ4NyZrAKvJRbVgjCeE8m/dy9gahONpf1kY5eSTGJbI=
Received: from SN6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:805:66::41)
 by MN2PR02MB6079.namprd02.prod.outlook.com (2603:10b6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 18:34:01 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::e8) by SN6PR08CA0028.outlook.office365.com
 (2603:10b6:805:66::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 29 Jul 2020 18:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 18:34:01
 +0000
Received: from [149.199.38.66] (port=56110 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qru-0008Nc-IA; Wed, 29 Jul 2020 11:31:58 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qtt-0004X5-Ax; Wed, 29 Jul 2020 11:34:01 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k0qtj-0004Vi-SI; Wed, 29 Jul 2020 11:33:51 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id A0B5F2C238C; Wed, 29 Jul 2020 11:30:00 -0700 (PDT)
Date: Wed, 29 Jul 2020 11:30:00 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200729183000.GA30361@xilinx.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
 <20200728223349.GT13753@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728223349.GT13753@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd52049-943f-48f0-a6d3-08d833edf6fc
X-MS-TrafficTypeDiagnostic: MN2PR02MB6079:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6079896AAE5BF5FB13B902B0D6700@MN2PR02MB6079.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oPaeIc5Qos7Gh0/iqTrmijqs9hlJmHCEiJmwpLwT1dz4EDJsEAGpLy1GDkDLpdP3u5TZ/IM7Q3xM8o2tq87SpEvaRztpuuAcAzAUh/Q5bUre52jvFBwVX1iOrpttHtjGVYCsnnDF3jjLDuLEEOP3Uk848tjqFgLJrR/yORR1IsGSmNGAz1b4xSZVWUFYTilDQ83gjW7Nds0/KuqpLhTGoK1gn73xD0Uk49dKqB5QtDrkpQC0jZRDq09m0BnhCM58BMq79B29dTx1lyouMQqsdMfYpEsCaM5o5I4WvZwr2mn6lkxNiLEQxPYVghphCGbL2eUu0AFwIL7g3qui0f8ehsxq74fPoKk6XxO33rNTJAUfGcZNWI0OKustc8kZiiVtkAtYhkBTonMM6XEtp7bumA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(376002)(39860400002)(346002)(46966005)(186003)(83380400001)(8676002)(54906003)(478600001)(42186006)(47076004)(36756003)(81166007)(6266002)(356005)(316002)(26005)(82740400003)(82310400002)(2616005)(7416002)(70586007)(70206006)(4326008)(6916009)(8936002)(426003)(1076003)(2906002)(5660300002)(336012)(33656002)(44832011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 18:34:01.6823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd52049-943f-48f0-a6d3-08d833edf6fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6079
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wei,

Thanks for the patch.

On Tue, Jul 28, 2020 at 03:33:49PM -0700, Laurent Pinchart wrote:
> Hi Wei,
> 
> Thank you for the patch.
> 
> On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> > Fix typo in parameter description.
> > 
> > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

I'll commit this to drm-misc-next-fixes soon.

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 821f7a71e182..3d53638ab15e 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
> >   */
> >  static uint zynqmp_dp_power_on_delay_ms = 4;
> >  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> > -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> > +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
> >  
> >  /* Link configuration registers */
> >  #define ZYNQMP_DP_LINK_BW_SET				0x0
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
