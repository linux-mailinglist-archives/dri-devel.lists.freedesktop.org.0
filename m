Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3F2683B7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 06:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230F26E0BA;
	Mon, 14 Sep 2020 04:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26EC6E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 04:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no3aEZIVfafDU0g1Vk+0rY3v5K8/boxynHwzHfkOnWg=;
 b=pkK+i4OKvrweczoaFGIFPdMFt7pcEvTsGVv7ENNyEeGOglLZuHEX7Zv6daFNa0tpbR/gL+9SrnfHUO4Fmi/V7P9pqrHIwyli9UXgaTx+Xry4yQLrhQ8m/JGeN6wHf9oF53vMKLFwnwzCdJdb0pGLnsC7GRc/UPThlFPnZsXGso4=
Received: from AM5PR0201CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::30) by DB7PR08MB3660.eurprd08.prod.outlook.com
 (2603:10a6:10:46::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 04:41:29 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::ec) by AM5PR0201CA0020.outlook.office365.com
 (2603:10a6:203:3d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 04:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 04:41:28 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Mon, 14 Sep 2020 04:41:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36a9696eb03fc44d
X-CR-MTA-TID: 64aa7808
Received: from 56a215cdb72a.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81BDDEF5-363D-41BD-AEBD-133AFB83078C.1; 
 Mon, 14 Sep 2020 04:41:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56a215cdb72a.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Sep 2020 04:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWuij2RUpXWstfI/uPQ45FBrQhjIv3htvR+5LHunBJ9qZPi7tALJnv3hdbsYzFYWcGjhfAKglxpPi8q/ybHSX+VlwmytxJQgoYd/Wr3f/HymMbRXYMS/vhqE8p5o/T8agwyFTi3oLAvVh/0Yunj4rpgXATjh31JDw7H/6YBcB0al2TtsBYrr1BQOu3JYDxwEcfJVFK6QqvjjfFNgsCqO70Dtz9HOSEj75llZmqhC8/KJ4S+F/5Cq1i708wlnC9j4rvlpbHXqvNuyP9k/Vt2xljXsogs0Wn7jZuYmPOmLGRIC/tciihJkXN18GKM3B/hFHX6IeYc/sckCUFx/7bOl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no3aEZIVfafDU0g1Vk+0rY3v5K8/boxynHwzHfkOnWg=;
 b=T6aW06gCLqxkHkfooTZvt1K8NPUGszNiDKCS1jSz9jnb+xTN2jWH36EVOGFszm+kPQTQmjijxS0Evq5Iyu5JXdUf2IomFFlCvS8a60VeOw45LRf4JDmH4f5l1Ee2PGTcJwnPTDoinN0yulFoDBV7mhc/T0f7OsBuDndgNLbewNU2/z/Dt//WdX3qvbQSU4gHTJ6DnIXOKDCRs0qGq9ggwu2zE59VPITpueUhTm0/QE+7u0g2ju/HNNeQfFpI889hwDqNXa7SoxKjiBIAjFgbFP4Q8N/tzHAHi8IWbGjFJXZ37Fv4TyQ3lRrrJNQEX0IC7WpbzgrTQzT0Rv6Ai+kRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no3aEZIVfafDU0g1Vk+0rY3v5K8/boxynHwzHfkOnWg=;
 b=pkK+i4OKvrweczoaFGIFPdMFt7pcEvTsGVv7ENNyEeGOglLZuHEX7Zv6daFNa0tpbR/gL+9SrnfHUO4Fmi/V7P9pqrHIwyli9UXgaTx+Xry4yQLrhQ8m/JGeN6wHf9oF53vMKLFwnwzCdJdb0pGLnsC7GRc/UPThlFPnZsXGso4=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20)
 by DB8PR08MB4171.eurprd08.prod.outlook.com (2603:10a6:10:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 04:41:20 +0000
Received: from DB6PR0802MB2598.eurprd08.prod.outlook.com
 ([fe80::5807:d5a5:e875:484c]) by DB6PR0802MB2598.eurprd08.prod.outlook.com
 ([fe80::5807:d5a5:e875:484c%10]) with mapi id 15.20.3370.019; Mon, 14 Sep
 2020 04:41:19 +0000
Date: Mon, 14 Sep 2020 12:41:13 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/komeda: Drop local dma_parms
Message-ID: <20200914044113.GA1918670@jamwan02-TSP300>
References: <8de297b5b916628c77b99068fb5aac1a69eed6f5.1599164796.git.robin.murphy@arm.com>
 <f7702954-0bea-71c2-b92d-472782203f4b@arm.com>
Content-Disposition: inline
In-Reply-To: <f7702954-0bea-71c2-b92d-472782203f4b@arm.com>
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To DB6PR0802MB2598.eurprd08.prod.outlook.com
 (2603:10a6:4:97::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.112) by
 SG2PR02CA0071.apcprd02.prod.outlook.com (2603:1096:4:54::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17 via Frontend Transport; Mon, 14 Sep 2020 04:41:18 +0000
X-Originating-IP: [203.126.0.112]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd4cbc2b-2015-4d69-4b55-08d858687212
X-MS-TrafficTypeDiagnostic: DB8PR08MB4171:|DB7PR08MB3660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3660B74A0C0013C51F014D84B3230@DB7PR08MB3660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:813;OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wO0XOMUkU92G+yV0cGTFJu6ayv2BKmSlsfrVdzWhB7fKLf2ulr6K6MLwgkdfjizjWZQLBRWcULdxzhcvIbLg3vwEqJXVeTVE4Z07nzCMR5A7WeVpXGkyf3N9Qj8ptralLeHCqHYfuina2czlakWPodydnBGUO1ZuI+2+VwuhKO7HKU1BBvxFrIZ92T03j8XLrxX7zlFy2Vv5HGmHATiTWQ+WuBIr6uHxFmFBsfHLQtg8FOL6TXG5JHXpcFhhptyReHcXVzopP8WVfZ4lYBbtZi8eHYcmCC95e6Iq9kC/znOHixFipZV3VwU6FSCOAWQau1T5np549n844uSeClYBG0oLnMnblGfpvNVKiaU/BEA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0802MB2598.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(136003)(396003)(376002)(39850400004)(366004)(52116002)(478600001)(6486002)(5660300002)(53546011)(6496006)(6862004)(83380400001)(66946007)(966005)(4326008)(316002)(33716001)(86362001)(6636002)(66476007)(2906002)(66556008)(9686003)(6666004)(1076003)(16526019)(186003)(956004)(33656002)(26005)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NLk40NzefRRo3Tp5XYDNzi3qggI4sK/jzXWAWim5Hcu+T/+egv/n3p+zbXjpy/c8t0oldGn/ivRoUqGfeiufzLNWsxurEguDmCkw8ynaYtZEScnyrYvRyq8PYUD+CAtByXcTpdXEzk78vWI4MPStrZRRZl085TH8M2Clzp32vxFi9iD0imqW7MuDVdUj1Pxvce92W9ls0tuW0JVFDrWMZP866BZdEbq1IcnUGJ/pBsIaSiCuHYfYmVAgpNfI2hg75sdW/5UyJng/YKZ4+j6noxOmVVaMRlmKH8AKVgSij+GbI12Lb8S82u4zefBDLioSXc6K1qi/sxLMVPefWUIhaFljxQPdkjTMfbE1tayQ9mJQCTUVxcKT4Sl5UyqvMoM5akixf+DxKgLrRLJWk+TrYO5Pp/lnsGAgkyyuysBQ+qkvQ/E4+jVs6KhHPbjo/qvIKRTDeo3SPkpwcRKeP/i+dMmZ53466kh47Hj3mhC/ZYLOvsG+26CeqlAqJ/ekedcrNaab4/6YmDReiYgSokqlnFPX3ilJuS4YoxfO7pluVLRUfKC72jU38W3uQJNT7NNWDYKbGbSOhv6+62KakDNRhfTBwTpLzmpPkwxJzmPyOltTkC5vO5hMFu/Hq1AQM7f6wc0qxrIlFaS1RAHCJUOJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4171
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3612934-7985-4ae4-2b0e-08d858686c93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wkG6FE+FYpIofsQCG2ra/qSil5bZ4p8S8qzz9qPvVeguswhwuxyhMDHtBjahUdlpw1+GbOhZOniVtZch9pvhixVEwf2IXXJcbvDZRjJhpK8Zo+//iI2yW8MfabDdwuzW1/AfOdIdjm7eD9XY+/OZHpn21V8q73mn8CarszbLnlVoHMCJA0EBfyZSnFGiJHc+Ln9syWmPjFXaF3t0j7xjeL1796dLVh5dulgzbro1dlpe8z5HYe45lZNoPtklXOdcigvbTnXXLxaPiAyrDZxYWvKUJKxQLbNGDbBfwa5uWm9is+s9LIgnKA+TY3jW7y951CFQOKPlleq/XMiGhoY/nqBkPNl8WAOsPakwajQ5BOfVzUnBgu0Y+hVPObdTf6UvhTKuqILbkrRysElURZEPz+cTqfYQBJLoGzhWMOdLmcRJB+JnUC262FgzUgysNZN
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(346002)(39850400004)(396003)(136003)(46966005)(83380400001)(6636002)(2906002)(478600001)(82740400003)(9686003)(86362001)(6862004)(336012)(6486002)(1076003)(33656002)(956004)(36906005)(82310400003)(8676002)(316002)(47076004)(5660300002)(81166007)(186003)(16526019)(26005)(70206006)(70586007)(4326008)(6496006)(53546011)(6666004)(33716001)(8936002)(356005)(966005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 04:41:28.5460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4cbc2b-2015-4d69-4b55-08d858687212
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3660
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
Cc: mihail.atanassov@arm.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, malidp@foss.arm.com, lowry.li@arm.com,
 nd@arm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 10:26:50PM +0100, Robin Murphy wrote:
> On 2020-09-03 21:36, Robin Murphy wrote:
> > Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> > for platform devices"), struct platform_device already provides a
> > dma_parms structure, so we can save allocating another one.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> > 
> > FYI, get_maintainer.pl seems to be choking on your L: entry somehow,
> > since it just shows " (open list:ARM KOMEDA DRM-KMS DRIVER)" without the
> > description or address, not sure what's up with that.
> > 
> >   drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 1 -
> >   drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 --
> >   2 files changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > index 1d767473ba8a..e7bb905062d9 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > @@ -261,7 +261,6 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
> >   		goto disable_clk;
> >   	}
> > 
> > -	dev->dma_parms = &mdev->dma_parms;
> >   	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> 
> Oops, I missed my "Also the DMA segment size is simply a size, not a
> bitmask" bit here - ideally this should be changed to UINT_MAX while we're
> cleaning up. Maybe that could just be fixed up when applying, but let me
> know if you'd like a resend.

Don't worry, I can fix it when applying. :)

And thank you for this patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

> Cheers,
> Robin.
> 
> >   	mdev->iommu = iommu_get_domain_for_dev(mdev->dev);
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> > index ce27f2f27c24..5b536f0cb548 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> > @@ -163,8 +163,6 @@ struct komeda_dev {
> >   	struct device *dev;
> >   	/** @reg_base: the base address of komeda io space */
> >   	u32 __iomem   *reg_base;
> > -	/** @dma_parms: the dma parameters of komeda */
> > -	struct device_dma_parameters dma_parms;
> > 
> >   	/** @chip: the basic chip information */
> >   	struct komeda_chip_info chip;
> > --
> > 2.28.0.dirty
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
