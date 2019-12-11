Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F214F11BA54
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D636EB98;
	Wed, 11 Dec 2019 17:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0306A6EB9A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkjQCAL9ZFZp+f4BfxqRhIWfwp0Zc4UqtP35JMThWI=;
 b=pK1IkGZPi/oAa4rpwzkL+iMAnSCSl7VOcMYbZqClskruq+rOrpiPXJJBcVCMmrsQF5secYGD9mFaFTJQ4bFpBdx0oVB+m95jkfVBUOzuokpgJa3brO7pI/S5CGLcLgx64P7WoBSxb+ARoL6QOfdGxPtfjo4wHQj0MwYj2LYeNAE=
Received: from VI1PR08CA0116.eurprd08.prod.outlook.com (2603:10a6:800:d4::18)
 by AM0PR08MB3857.eurprd08.prod.outlook.com (2603:10a6:208:104::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14; Wed, 11 Dec
 2019 17:30:08 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by VI1PR08CA0116.outlook.office365.com
 (2603:10a6:800:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Wed, 11 Dec 2019 17:30:07 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 17:30:07 +0000
Received: ("Tessian outbound a4662a02422d:v37");
 Wed, 11 Dec 2019 17:30:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15aad32656efb4c3
X-CR-MTA-TID: 64aa7808
Received: from 0c035635b898.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 912F53FB-404B-4E17-BCBD-4DD285DBB536.1; 
 Wed, 11 Dec 2019 17:30:01 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c035635b898.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 17:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZuTQVQdpYWJaL0V1hXEyLj81UVsF9omBQh4xIO9o3HIpmA9btQi52QtdPAfgyK6JHo5hDNfJZit9hfoKTNh5rJc5x0ZG9JU7QZ3vYrrMsdK4DM2oytpImZaxk9SInCzlYaLkUJDHxNdOGShrolkVVolXzgvxUEW75gDZcXwYEkmjvsNcjX8PD7h5315bxYjcu3mR4DPTrJg/M5EN8eV5OacV62Wgdu9kO+gAvNsSo2ItUVAlNj8z+JpkgwoKGWw/ug6RTvU24cWgHEiCaPAjeUy4ka4xa7yVjmLjagXFVgFyWpFUd3bt6Ve/O2KuMw+7d/oElAAv406yEYiSgF9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkjQCAL9ZFZp+f4BfxqRhIWfwp0Zc4UqtP35JMThWI=;
 b=n/A4Nz/Fys+Z5fZxtSivhII+Fa0IsvTxSJwHxIxaM0v4yD0xA1BpucJPVJEzwb3MYEdsXFC87iIN+9t8kB+56c0eXGWyCnuiJuyXdjV1ja4pcHKQdlJEyeH8haLqu7a+CZJ+IMs57oHQOjtq1+w2mpn6YEBfpWRcr6QwL6nmKcrY8D+/BnOK1c5+EIaeiFOahbdG1dWv9i4BhxHMq5A5Ofyp73ruZ3CtSA6QBuoISVx1DfiYic8APPcgmc8pRoWVIUjpSpNCBbK8+bKnoTQchMkE9m/ETsceiOORSVgN7edYY9fAjPx7mB5I8yvkO1Pyy2uzIclR2Hhvj8CvX4thHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkjQCAL9ZFZp+f4BfxqRhIWfwp0Zc4UqtP35JMThWI=;
 b=pK1IkGZPi/oAa4rpwzkL+iMAnSCSl7VOcMYbZqClskruq+rOrpiPXJJBcVCMmrsQF5secYGD9mFaFTJQ4bFpBdx0oVB+m95jkfVBUOzuokpgJa3brO7pI/S5CGLcLgx64P7WoBSxb+ARoL6QOfdGxPtfjo4wHQj0MwYj2LYeNAE=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3151.eurprd08.prod.outlook.com (52.133.15.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 17:29:59 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 17:29:59 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>
Subject: Re: [PATCH 1/2] drm/komeda: Add basic support for D77
Thread-Topic: [PATCH 1/2] drm/komeda: Add basic support for D77
Thread-Index: AQHVsA37vEFecnVUP0KwGagtYw5RIqe1JOsA
Date: Wed, 11 Dec 2019 17:29:59 +0000
Message-ID: <54382923.ZnOG7sc7g6@e123338-lin>
References: <20191211102948.27117-1-tiannan.zhu@arm.com>
 <20191211102948.27117-2-tiannan.zhu@arm.com>
In-Reply-To: <20191211102948.27117-2-tiannan.zhu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c0a9602-2ee6-4f17-79ae-08d77e5fc463
X-MS-TrafficTypeDiagnostic: VI1PR08MB3151:|VI1PR08MB3151:|AM0PR08MB3857:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3857B973EE55CADDC6CB80738F5A0@AM0PR08MB3857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(51914003)(199004)(189003)(8936002)(5660300002)(86362001)(478600001)(6636002)(2906002)(54906003)(71200400001)(8676002)(81156014)(81166006)(66446008)(52116002)(186003)(4326008)(6512007)(26005)(64756008)(316002)(33716001)(9686003)(6862004)(6486002)(6506007)(66476007)(66556008)(66946007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3151;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OIEgzZtXQq/Rg+FUcP2kUS8XYmM/MyMLdL+4em/kTOfHvnQ5haK/eIq3MoPL1fVqpdVuC18zRYEFCcwIK5hiQSPJo9DxokBNw6MCdmvnX452iI5NK6YOxEFidpoVqUgZ20IqAlLoUc85Tqq/iRT2XmB8L/CNSP4+v3DeURdNwjG4Vk3D9OvjfC2nzHBH2J+n9nOocSPnOgAuMpFUNNHHp6RYCb4mk9CbHmd6mzKiCimZrtlm9mq7/YmTr212DCi9VRTmiF5dHALRgy08EnHFG3qatYh2ez8KfISuLzlKcpkRXh0RpGwEa54QF8kiQPWyMMUD6SX3sbQDuiHne10ZFrgd5inedbOpEV0of9XXf4/+yD2EaZ1EMF2HM1p3BJpLDp86npgPuQsNl+hwUa/gx4u8zU5s7iBgXqES8sHhXhhMCnSg91qMEnr1aI9HYPpe+3zFntUsBIZjWU+FXHZ08n0oYgRUFTdD6vPU1pAwVcFO7A2WFoZKFF2r7NkYli0uhm+6O5yeZblrcng/AaOalA==
Content-ID: <C514851268A70D41955C58CE376D0613@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3151
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(51914003)(189003)(199004)(54906003)(316002)(26005)(6486002)(6506007)(33716001)(76130400001)(70206006)(6636002)(70586007)(2906002)(356004)(478600001)(26826003)(8676002)(81166006)(8936002)(186003)(81156014)(86362001)(4326008)(36906005)(336012)(6862004)(6512007)(5660300002)(9686003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3857;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f472de10-c0b5-486d-bdcf-08d77e5fbf64
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CSxu20jVDO/thGShx7US7MJQJH4f+DuoKTu3gG20XScVzwS7qemZGlp6rD6KJjoZnBAGaqGb6v4Tf1RYozV4J7h/67n6+7CX13CWj5BN/zKaoYcnUNyUozX85mzj8G1pGNc1zqharbFGQsS339VmEuZ8LnxCKlc5RQ47f0XVAU+qbInreBFY+QElnMtsxIEP68DG80rPuSYjGrzjhrytGmx6ZhosCYXdxfP+ahb7QrmmHeNFqcEdHez1H4ZEJ4izxD19tHEva7TSAdrBPKpdEuknPQfH6f0XLVQsK+zSvnGYoK2JGWJfytzJjPJN+Y/WvUWLC4HFQ4Q0bTpZvVtkx15lKuHIgccF0cJ0gq3UDFSPAjzxuLNoCAuWLnUrxvkT6plpY5zg3DsFq8rDDpn9SsNymCY9zoeVDwsPfgWNf6DzTkWDiwWb1LLpbot4xyTf7TILDjQe5BQCGLU92FMgkDtPPnMr9Nulno88ZJZdJ90TY/GFTh87XTdqy8OKdqikUebV5Vv7uFHL03+YAbTWIA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 17:30:07.6900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0a9602-2ee6-4f17-79ae-08d77e5fc463
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3857
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang
 \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tiannan,

Thanks for the patch.

On Wednesday, 11 December 2019 10:30:09 GMT Tiannan Zhu (Arm Technology China) wrote:
> Make komeda driver can recongise D77, D77 is arm latest display
> product, compare with D71, D77 support some new features:
> 1. Crossbar: adjust every plane's zorder
> 2. ATU: Asynchronous Timewarp Unit, which is used to support VR/AR

I don't think the new features listing is relevant for this patch. I'd just
put a simple wording along the lines of:

Add D77 support via a new DT compatible string. The existing code is
sufficient for basic bring-up.

> 
> Signed-off-by: Tiannan Zhu (Arm Technology China) <tiannan.zhu@arm.com>
> ---
>  .../gpu/drm/arm/display/include/malidp_product.h  |  1 +
>  .../drm/arm/display/komeda/d71/d71_component.c    | 15 +++++++++++++++
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c  |  1 +
>  drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h |  4 ++++
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c   |  1 +
>  5 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/include/malidp_product.h b/drivers/gpu/drm/arm/display/include/malidp_product.h
> index dbd3d4765065..cbde47f06c9f 100644
> --- a/drivers/gpu/drm/arm/display/include/malidp_product.h
> +++ b/drivers/gpu/drm/arm/display/include/malidp_product.h
> @@ -19,6 +19,7 @@
>  
>  /* Mali-display product IDs */
>  #define MALIDP_D71_PRODUCT_ID	0x0071
> +#define MALIDP_D77_PRODUCT_ID	0x0072
>  #define MALIDP_D32_PRODUCT_ID	0x0032
>  
>  union komeda_config_id {
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> index c7f7e9c545c7..ec96b69a5ade 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> @@ -1347,6 +1347,21 @@ int d71_probe_block(struct d71_dev *d71,
>  		d71->glb_scl_coeff_addr[blk_id] = reg;
>  		break;
>  
> +	case D71_BLK_TYPE_GLB_SC_COEFF:
> +		break;
> +
> +	case D77_BLK_TYPE_CBU:
> +		break;
> +
> +	case D77_BLK_TYPE_ATU:
> +		break;
> +
> +	case D77_BLK_TYPE_ATU_VP:
> +		break;
> +
> +	case D77_BLK_TYPE_LPU_PERF:
> +		break;
> +

I'd omit this from the basic enablement patch since it's effectively dead
code. Add it when you need it.

>  	default:
>  		DRM_ERROR("Unknown block (block_info: 0x%x) is found\n",
>  			  blk->block_info);
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 2d429e310e5b..7598e4856e0c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -614,6 +614,7 @@ d71_identify(u32 __iomem *reg_base, struct komeda_chip_info *chip)
>  	switch (product_id) {
>  	case MALIDP_D71_PRODUCT_ID:
>  	case MALIDP_D32_PRODUCT_ID:
> +	case MALIDP_D77_PRODUCT_ID:
>  		funcs = &d71_chip_funcs;
>  		break;
>  	default:
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> index 81de6a23e7f3..01ea53918cf1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> @@ -477,8 +477,11 @@ enum d71_blk_type {
>  	D71_BLK_TYPE_PERIPH		= 0x08,
>  	D71_BLK_TYPE_LPU_TRUSTED	= 0x09,
>  	D71_BLK_TYPE_AEU_TRUSTED	= 0x0A,
> +	D77_BLK_TYPE_CBU		= 0x0B,
> +	D77_BLK_TYPE_ATU		= 0x0C,
>  	D71_BLK_TYPE_LPU_LAYER		= 0x10,
>  	D71_BLK_TYPE_LPU_WB_LAYER	= 0x11,
> +	D77_BLK_TYPE_LPU_PERF		= 0x12,
>  	D71_BLK_TYPE_CU_SPLITTER	= 0x20,
>  	D71_BLK_TYPE_CU_SCALER		= 0x21,
>  	D71_BLK_TYPE_CU_MERGER		= 0x22,
> @@ -487,6 +490,7 @@ enum d71_blk_type {
>  	D71_BLK_TYPE_DOU_FT_COEFF	= 0x32,
>  	D71_BLK_TYPE_AEU_DS		= 0x40,
>  	D71_BLK_TYPE_AEU_AES		= 0x41,
> +	D77_BLK_TYPE_ATU_VP		= 0xC0,

Same for all these block types.

>  	D71_BLK_TYPE_RESERVED		= 0xFF
>  };
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index ad38bbc7431e..3ac6b43beb2c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -126,6 +126,7 @@ static int komeda_platform_remove(struct platform_device *pdev)
>  static const struct of_device_id komeda_of_match[] = {
>  	{ .compatible = "arm,mali-d71", .data = d71_identify, },
>  	{ .compatible = "arm,mali-d32", .data = d71_identify, },
> +	{ .compatible = "arm,mali-d77", .data = d71_identify, },
>  	{},
>  };
>  
> 


-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
