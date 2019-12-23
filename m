Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C43129636
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 14:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B567B6E2A8;
	Mon, 23 Dec 2019 13:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57E76E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzhzwQiutTqzQBFF6CCnn7gDeMb0PVvwfewMRw2gHjY=;
 b=7C/ypPSgvkj0YtXrEWzdprp5FOJ0Oe6/xBJGc2NQjyL3+8Mqb5GXQ3XTe5+h7grX2TYy+w6Dk/m7fjP6WDnQP4YUCqOj2ANmupMsoMaNtGWynMXDQMbvm+1NNLxLs9Zr9G6itovo85x7FmdhW5yRc7/Rv+03Ytg7qGfOiZIaMaI=
Received: from AM6PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:20b:b2::17)
 by AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.13; Mon, 23 Dec
 2019 13:02:25 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by AM6PR08CA0005.outlook.office365.com
 (2603:10a6:20b:b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.13 via Frontend
 Transport; Mon, 23 Dec 2019 13:02:25 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Mon, 23 Dec 2019 13:02:24 +0000
Received: ("Tessian outbound 4f3bc9719026:v40");
 Mon, 23 Dec 2019 13:02:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed2d56f2982dfcd2
X-CR-MTA-TID: 64aa7808
Received: from f05765637ff9.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0AD1BCF-E8B6-40DD-8B10-8E136D5A5199.1; 
 Mon, 23 Dec 2019 13:02:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f05765637ff9.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Dec 2019 13:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUt0d/YVij3kAfTc0l/7QpUfv0FOBD/5EQym8EdR+PUcLLZGS0asw28OVDx3nILyUSoiWG7Gq8tmjF6JOM85yRnuMqO8JDDc/7qPDEvCvpu3AkXbd0GmJ9qi/n1xi4nmkrJO10+WrvODHnh6fr9Hhqk2Eu0TeUDPg53e+NpS0efQz5hFjrXnb2MydEEne53LIWwQppuA8ihdtE9wiJBIWklmOUNGz4HmSJZeytcmFGLMIi1wCCq1vnMkymxiJiLlkOChUOkhR+fLtIycHDoeDJOCYgYGJSHrPB+mR9SH6qpRPgDgStRmCLFjTuU3PMsPGJy/JqrjkFEHdp2tGcbKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzhzwQiutTqzQBFF6CCnn7gDeMb0PVvwfewMRw2gHjY=;
 b=cURWmxWwjZGKkkHAUbEV6aPqJWXQk/cJOIJZM9A6YccPWTptEkZQ/4dYB42AMJ2C/hL163XjW2EmQhLQP4TCCpYCkIheClRuxR6u6uPMP9pA/Rq1gM7DjggC3RQsbWWSI+LsME9WGP+BuBUn6vH1oJYHzXt6kQHJuYVVikW/++jrZyiDM39nikm3req0/xbx9LDJromW78iGSCFhAkBLyx3rGMOc1XE2d00CiKBsEpM1TtnscPwJnEm24f6gATk7zjlamiPoxinMMAvaRcF/ZgKfbsHX0uw/mozL3DqNCiBRZdYJH/YzllBBJerkA2okmJYe0YGPo4RZcxdNa3jXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzhzwQiutTqzQBFF6CCnn7gDeMb0PVvwfewMRw2gHjY=;
 b=7C/ypPSgvkj0YtXrEWzdprp5FOJ0Oe6/xBJGc2NQjyL3+8Mqb5GXQ3XTe5+h7grX2TYy+w6Dk/m7fjP6WDnQP4YUCqOj2ANmupMsoMaNtGWynMXDQMbvm+1NNLxLs9Zr9G6itovo85x7FmdhW5yRc7/Rv+03Ytg7qGfOiZIaMaI=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3760.eurprd08.prod.outlook.com (20.178.80.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.19; Mon, 23 Dec 2019 13:02:15 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 13:02:15 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: james qian wang <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Add event handling for EMPTY/FULL
Thread-Topic: [PATCH] drm/komeda: Add event handling for EMPTY/FULL
Thread-Index: AQHVsL2rU4ctbxXpak2vHcPGkTYTb6fHm3SA
Date: Mon, 23 Dec 2019 13:02:15 +0000
Message-ID: <9392127.Ov6ziQ9xEP@e123338-lin>
References: <20191212072737.30116-1-james.qian.wang@arm.com>
In-Reply-To: <20191212072737.30116-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LO2P265CA0364.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::16) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36a287b7-6b3e-40dc-436b-08d787a85b1c
X-MS-TrafficTypeDiagnostic: VI1PR08MB3760:|VI1PR08MB3760:|AM6PR08MB3829:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB382955E04A218F439A0767838F2E0@AM6PR08MB3829.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0260457E99
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(51914003)(189003)(199004)(478600001)(81166006)(8676002)(2906002)(6512007)(9686003)(8936002)(316002)(4326008)(54906003)(6506007)(81156014)(6862004)(33716001)(6486002)(6636002)(86362001)(52116002)(186003)(5660300002)(66946007)(64756008)(66476007)(66446008)(71200400001)(26005)(66556008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3760;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: J02n6PYUkllv2QqiZq+wBcEzyzq5Ec58+wkVeUTx23mSopYZq3XWswy7hvxKomlSQ77hkXU10VlTjGqxdIzwDsP0JvAcQa9Gr+B2P/IQ7rIcDCbQHmR/wLnqpk1eyVTQxeMap7vfCNcR/hY7E0O40u666On2wqIO/6vtBLrLtCP89lfq5Ya/XbmQd6A7pCe0IpQ7ovOzoAfinKbGyWp0wtcDPxO8D5Yy1Rt8g7bl9IOnVMDraom/rupaWNmnR/kUQmXXh2LfRBpxKsAYpQDLSnx5t/99AKoJl2Xjr99oechu7CgyDK4y2JjdnusM8KcDj/UJx0QujgLDxLwOpYC7E16Fp0AlQW23InfkdJfBQAV0EGjUfhZOzmMDvtNu8X6o2/hNdu4OCitIdoDmdpG50VCMXQEj4m5q1sM8mOifT5THoJspJT4+VbOeVlGyZsgE9nBYCUHQvR0jbX6QL3c1ibS1buER+Hze9r7ugKQgIyFpoaZzqhMDb6Qlafy+q1SLKhnBETZ3uedfrYnZUhEHig==
Content-ID: <08FF363DBD80ED40A7E6D6EB3E338690@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3760
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(39860400002)(136003)(346002)(51914003)(199004)(189003)(6636002)(81156014)(81166006)(8936002)(2906002)(86362001)(33716001)(4326008)(76130400001)(356004)(70206006)(336012)(8676002)(5660300002)(70586007)(54906003)(26826003)(6506007)(478600001)(6862004)(6486002)(26005)(316002)(186003)(9686003)(6512007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4bd6488b-c97a-44e7-8bc1-08d787a85540
NoDisclaimer: True
X-Forefront-PRVS: 0260457E99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HfYF1X5WP+vUay26hLLZmZVdlRwBQcyIY649qlq+/g33bMrNaFNOEFRm6D9gUMS1c+rgVgJOPsrVdtt1D4LkyvGlSfZ4qlXFzXYRAdwWsoDaDyu+Kj3KNjLihZC5rmxSkRVF56KN8mKk5bbGasBx1bgHSmcTKbWjmbMhQMnlktp7NyCt8UkQmPGMOeJDYShwGYhfsljqtTRCSeehhq+9iWZZF+7v7ekeYJKIaNT5Hhfa2BK3wIW90qKEZGFyeHfoqAp9pMfYMouhAv+256+cegytp7YvFX6JpmD4C8tZr3tSPLMBPZVilDXsyLEGsu1YAj7jqym34qdoGKZ9eXodjW8Erd8nNKqwPbePdGdQH8+ily1b5+bCdWdK46kosaZ7e5Qhw1aFx2PoU4YPAZ0DJp6bmAGmnF6tsfmS8Dmhxf6cJpiZZPaIBbCYvNoSCz0c15ngqsjrHN4jfpQ0+jI6gdAgXNs9McGGr1y+FmkI4SgPfQl0953K6v9EoFynseUhODQHBSzBbUsrmXWp2nt+w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 13:02:24.8528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a287b7-6b3e-40dc-436b-08d787a85b1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
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
Cc: nd <nd@arm.com>, Oscar Zhang <Oscar.Zhang@arm.com>,
 Tiannan Zhu <Tiannan.Zhu@arm.com>, Jonathan Chai <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Channing Chen <Channing.Chen@arm.com>,
 james qian wang <james.qian.wang@arm.com>, Lowry Li <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi James,

On Thursday, 12 December 2019 07:27:55 GMT james qian wang (Arm Technology China) wrote:
> EMPTY/FULL are HW input/output FIFO condition identifer, which are
> useful information for addressing the problem, so expose them.
> 
> Signed-off-by: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c  | 13 ++++++++++++-
>  drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h |  3 +++
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.h   |  5 ++++-
>  drivers/gpu/drm/arm/display/komeda/komeda_event.c |  2 ++
>  4 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index dd1ecf4276d3..00fa56c29b3e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -20,8 +20,10 @@ static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
>  		evts |= KOMEDA_EVENT_IBSY;
>  	if (raw_status & LPU_IRQ_EOW)
>  		evts |= KOMEDA_EVENT_EOW;
> +	if (raw_status & LPU_IRQ_OVR)
> +		evts |= KOMEDA_EVENT_OVR;
>  
> -	if (raw_status & (LPU_IRQ_ERR | LPU_IRQ_IBSY)) {
> +	if (raw_status & (LPU_IRQ_ERR | LPU_IRQ_IBSY | LPU_IRQ_OVR)) {
>  		u32 restore = 0, tbu_status;
>  		/* Check error of LPU status */
>  		status = malidp_read32(reg, BLK_STATUS);
> @@ -45,6 +47,15 @@ static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
>  			restore |= LPU_STATUS_ACE3;
>  			evts |= KOMEDA_ERR_ACE3;
>  		}
> +		if (status & LPU_STATUS_FEMPTY) {
> +			restore |= LPU_STATUS_FEMPTY;
> +			evts |= KOMEDA_EVENT_EMPTY;
> +		}
> +		if (status & LPU_STATUS_FFULL) {
> +			restore |= LPU_STATUS_FFULL;
> +			evts |= KOMEDA_EVENT_FULL;
> +		}
> +
>  		if (restore != 0)
>  			malidp_write32_mask(reg, BLK_STATUS, restore, 0);
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> index 81de6a23e7f3..e80172a0b320 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> @@ -175,6 +175,7 @@
>  #define TBU_DOUTSTDCAPB_MASK	0x3F
>  
>  /* LPU_IRQ_BITS */
> +#define LPU_IRQ_OVR		BIT(9)
>  #define LPU_IRQ_IBSY		BIT(10)
>  #define LPU_IRQ_ERR		BIT(11)
>  #define LPU_IRQ_EOW		BIT(12)
> @@ -185,6 +186,8 @@
>  #define LPU_STATUS_AXIE		BIT(4)
>  #define LPU_STATUS_AXIRP	BIT(5)
>  #define LPU_STATUS_AXIWP	BIT(6)
> +#define LPU_STATUS_FEMPTY	BIT(11)
> +#define LPU_STATUS_FFULL	BIT(14)
>  #define LPU_STATUS_ACE0		BIT(16)
>  #define LPU_STATUS_ACE1		BIT(17)
>  #define LPU_STATUS_ACE2		BIT(18)
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> index 4a67a80d5fcf..ce27f2f27c24 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> @@ -20,6 +20,8 @@
>  #define KOMEDA_EVENT_OVR		BIT_ULL(4)
>  #define KOMEDA_EVENT_EOW		BIT_ULL(5)
>  #define KOMEDA_EVENT_MODE		BIT_ULL(6)
> +#define KOMEDA_EVENT_FULL		BIT_ULL(7)
> +#define KOMEDA_EVENT_EMPTY		BIT_ULL(8)
>  
>  #define KOMEDA_ERR_TETO			BIT_ULL(14)
>  #define KOMEDA_ERR_TEMR			BIT_ULL(15)
> @@ -49,7 +51,8 @@
>  	KOMEDA_ERR_ZME		| KOMEDA_ERR_MERR	| KOMEDA_ERR_TCF |\
>  	KOMEDA_ERR_TTNG		| KOMEDA_ERR_TTF)
>  
> -#define KOMEDA_WARN_EVENTS	KOMEDA_ERR_CSCE
> +#define KOMEDA_WARN_EVENTS	\
> +	(KOMEDA_ERR_CSCE | KOMEDA_EVENT_FULL | KOMEDA_EVENT_EMPTY)
>  
>  #define KOMEDA_INFO_EVENTS (0 \
>  			    | KOMEDA_EVENT_VSYNC \
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_event.c b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> index 977c38d516da..53f944e66dfc 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_event.c
> @@ -78,6 +78,8 @@ static void evt_str(struct komeda_str *str, u64 events)
>  
>  	/* LPU errors or events */
>  	evt_sprintf(str, events & KOMEDA_EVENT_IBSY, "IBSY|");
> +	evt_sprintf(str, events & KOMEDA_EVENT_EMPTY, "EMPTY|");
> +	evt_sprintf(str, events & KOMEDA_EVENT_FULL, "FULL|");
>  	evt_sprintf(str, events & KOMEDA_ERR_AXIE, "AXIE|");
>  	evt_sprintf(str, events & KOMEDA_ERR_ACE0, "ACE0|");
>  	evt_sprintf(str, events & KOMEDA_ERR_ACE1, "ACE1|");
> 

Thanks for the patch,

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
