Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52711BA56
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F036EB9F;
	Wed, 11 Dec 2019 17:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50045.outbound.protection.outlook.com [40.107.5.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7226EB9E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u06jmu2D/8YUMymSB5K7vVkoOJMOJErSBpiGDn56oxM=;
 b=w2A9WgAUpN+ROmgBi1zDDIBWwMwaaHmmbcGGgSYeWgWQpkrqmoRZpuvdZH+82LOIdNfok1sTuOJIsibld9HGUAA8mYgkqzwW75s3wghxac06HLogTvq157sGNLyhW4BwWixLJWhG8VIlB1tjTLAFbNKW2Dpu7weZsbrCiXTWKeQ=
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by VI1PR08MB3008.eurprd08.prod.outlook.com (2603:10a6:803:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 11 Dec
 2019 17:30:13 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 11 Dec 2019 17:30:13 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 17:30:12 +0000
Received: ("Tessian outbound 5574dd7ffaa4:v37");
 Wed, 11 Dec 2019 17:30:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 789f128aa5f3e7d5
X-CR-MTA-TID: 64aa7808
Received: from 0c035635b898.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4B34377-D237-493F-A40E-A505506A9E6E.1; 
 Wed, 11 Dec 2019 17:30:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c035635b898.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 17:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0ckJwhUhP7DfShkKQCD5oeA5SSvOUpxu9zTyFaT+BZMrcaztbEh5vzs2ntkhHHH23YSf673K0loGYoCR4hD70xlATUERgtYTIPxFuDyBm+RLC/NU/FaV/ExL4Xrh+uS/LPnAlB5Cn32XAy4SgHMTQp6ESORWNNekyatpvGeFmPyFNDWhkV1UZ5dsNq4vnqyAaIuwmbf5NqTV47dE5BoAzXP5xyyiYqrlNsT18f1nSmq88iUH+N7veW4LqaKFfls69Or3Toc0QtaQxhre8S3TumzbCn+ocaUJyhWaA/sUbY4OnH2M7s1ZFuDJGuG4oQmGuI8CrL9ZCwWv3SstQO62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u06jmu2D/8YUMymSB5K7vVkoOJMOJErSBpiGDn56oxM=;
 b=lKDoal9PPOLKXOKMHjIQFE63VvQ+viIlSLt6ohOJGByGZhvSR/Z9DWum6mREJ2L1fL8BB1vg/nvbm4BDONniBYD33XkpVk/vWDA9l2GOqbNaWYgGCIn6dFi2gXbKq1oHvqsBM7s3rl+uBnFV55foKAFIUqgqVasjk0Ohw82xAUIIeO9uWCWvkiT+mElEd/rO5ofpoupNet+6wvqehuiUGYvQ7P7LP5E2AJBaw2TNQWQ1y0JzppGmvCANJbvRWqhgZDlVhnz7eJN3KstPURQuKn977G2+GZDsJv9iYDcaTdHF5gCm5WktZuc3K9COVjE1NQsUXhHj47drztOcAfuWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u06jmu2D/8YUMymSB5K7vVkoOJMOJErSBpiGDn56oxM=;
 b=w2A9WgAUpN+ROmgBi1zDDIBWwMwaaHmmbcGGgSYeWgWQpkrqmoRZpuvdZH+82LOIdNfok1sTuOJIsibld9HGUAA8mYgkqzwW75s3wghxac06HLogTvq157sGNLyhW4BwWixLJWhG8VIlB1tjTLAFbNKW2Dpu7weZsbrCiXTWKeQ=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3151.eurprd08.prod.outlook.com (52.133.15.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 17:30:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 17:30:02 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v3 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v3 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVrzaqVXP2GgFQ50yR2yvi7QM25Ke1G/iA
Date: Wed, 11 Dec 2019 17:30:02 +0000
Message-ID: <1885100.onhcTcTa0I@e123338-lin>
References: <20191210084828.19664-1-james.qian.wang@arm.com>
 <20191210084828.19664-3-james.qian.wang@arm.com>
In-Reply-To: <20191210084828.19664-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::22) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed79d94d-027a-404a-f7cc-08d77e5fc77a
X-MS-TrafficTypeDiagnostic: VI1PR08MB3151:|VI1PR08MB3151:|VI1PR08MB3008:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3008F3A0CF47873E9BF7394A8F5A0@VI1PR08MB3008.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(8936002)(5660300002)(86362001)(478600001)(6636002)(2906002)(54906003)(71200400001)(8676002)(81156014)(81166006)(66446008)(52116002)(186003)(4326008)(6512007)(26005)(64756008)(316002)(33716001)(9686003)(6862004)(6486002)(6506007)(66476007)(66556008)(66946007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3151;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: D7ckdVs9JX8ipyN6F3LUMkyhocP1HfH6eqoZwI4dAxOWsC5BWmGlrb3FfBNaQzLpv5yDFZlcAEbDiFXMOCrW7JKKByyXDBVtfmWvQmBQukv3Rq6CI1iIejvOVqaC90K4bFtT01yFs/K2IuxU9IGWMFyDwqg6xSs9n2r+Y9ht+ELHqPquRFriiy3aOnRFU/PYM4fzBhR7oX5wf0a4mS6HmDQEmDSmbVmqaOUsKyTmugxpjq23EfQRVk5F6HnJFq2ppT+OtsqGzzjKGD8L4yFpNYtYKaf9DA9O2lutXnI8NmTy0hmyLVhjq1JCdx0LB2H7CqJdKCIlJ8K3EZeBqkZKtjJcKM9XVE0h3yQSvCy7FvWZDB0ovSt21wRfwQFb5Tpujlk02rn7S3x+EQqm/PVpEw32whJsjegSXPCkNTE1aK4ONhDmxeHbbHIw+45wycLaE+7bpnJnhsA24G07p+fEkEf26HhuDuo9rj3ulrAdngdxw5E2+C7EutJz7vRoaM0E
Content-ID: <20B3528BBC97F947823614B53546D8A1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3151
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(396003)(346002)(39860400002)(189003)(199004)(81156014)(6512007)(70586007)(6486002)(8676002)(316002)(54906003)(8936002)(76130400001)(6636002)(70206006)(81166006)(4326008)(33716001)(86362001)(9686003)(2906002)(6862004)(36906005)(336012)(26005)(356004)(26826003)(186003)(5660300002)(6506007)(478600001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3008;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3239391d-82a8-428b-230c-08d77e5fc106
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qrTrmWWPj+MyLKvZwirAvyzSQkXIE/rbP5lutIHKzhxeiABwSFj0Xlkzp0MShgEMVDVSJor8/clMjDiBUwV0WcznwRxJ3dgFI/3L8V5CSYoEJUU6WRxoOkTyB27fPjwrABKaxPBNMT4J+tndISRyXECEABowPiwOpQOj0L+0h/CncuUQ75Y/qLy5D/sDy7KoJ9QtF4V77JkoypQNGULC892pPC0TzrPsPNZDRHxNYr2xz/ZBlMntaJsmcY08KB1LVgfP3z1ZSYaNzTdXQPWBk7uWzXJgLPtnaH4xC6uvady0DvCbuTTLZNo54FNmPql5PWX7/oQoXA0FdZBdg2RkHj6Iz1128jvVYI5dFHS2AzJROht4cllnLSO3pfg87kA0TCi1/lAjGYYqzSy7oXnazZnKs394YO5N5XRBxKvludTubYPqkslIoDwFf9s/IkmQjprLYgSnC4a9nEIPHmOGONJhhHEKkzyE85Zj5MSrEaJua9SlFZ62svzJkxXXkO4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 17:30:12.8901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed79d94d-027a-404a-f7cc-08d77e5fc77a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3008
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 10 December 2019 08:48:51 GMT james qian wang (Arm Technology China) wrote:
> D32 is simple version of D71, the difference is:
> - Only has one pipeline
> - Drop the periph block and merge it to GCU
> 
> v2: Rebase.
> v3: Isolate the block counting fix to a new patch

I would've expected the fix to be a part of this series as 2/3 and this
patch as 3/3.

Otherwise, this patch is
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

> 
> Signed-off-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> ---
>  .../drm/arm/display/include/malidp_product.h  |  3 +-
>  .../arm/display/komeda/d71/d71_component.c    |  2 +-
>  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 39 ++++++++++++-------
>  .../gpu/drm/arm/display/komeda/d71/d71_regs.h | 13 +++++++
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  1 +
>  5 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/include/malidp_product.h b/drivers/gpu/drm/arm/display/include/malidp_product.h
> index 1053b11352eb..16a8a2c22c42 100644
> --- a/drivers/gpu/drm/arm/display/include/malidp_product.h
> +++ b/drivers/gpu/drm/arm/display/include/malidp_product.h
> @@ -18,7 +18,8 @@
>  #define MALIDP_CORE_ID_STATUS(__core_id)     (((__u32)(__core_id)) & 0xFF)
>  
>  /* Mali-display product IDs */
> -#define MALIDP_D71_PRODUCT_ID   0x0071
> +#define MALIDP_D71_PRODUCT_ID	0x0071
> +#define MALIDP_D32_PRODUCT_ID	0x0032
>  
>  union komeda_config_id {
>  	struct {
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> index b6517c46e670..8a02ade369db 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> @@ -1270,7 +1270,7 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
>  
>  	ctrlr = to_ctrlr(c);
>  
> -	ctrlr->supports_dual_link = true;
> +	ctrlr->supports_dual_link = d71->supports_dual_link;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 7e79c2e88421..dd1ecf4276d3 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -371,23 +371,33 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  		goto err_cleanup;
>  	}
>  
> -	/* probe PERIPH */
> +	/* Only the legacy HW has the periph block, the newer merges the periph
> +	 * into GCU
> +	 */
>  	value = malidp_read32(d71->periph_addr, BLK_BLOCK_INFO);
> -	if (BLOCK_INFO_BLK_TYPE(value) != D71_BLK_TYPE_PERIPH) {
> -		DRM_ERROR("access blk periph but got blk: %d.\n",
> -			  BLOCK_INFO_BLK_TYPE(value));
> -		err = -EINVAL;
> -		goto err_cleanup;
> +	if (BLOCK_INFO_BLK_TYPE(value) != D71_BLK_TYPE_PERIPH)
> +		d71->periph_addr = NULL;
> +
> +	if (d71->periph_addr) {
> +		/* probe PERIPHERAL in legacy HW */
> +		value = malidp_read32(d71->periph_addr, PERIPH_CONFIGURATION_ID);
> +
> +		d71->max_line_size	= value & PERIPH_MAX_LINE_SIZE ? 4096 : 2048;
> +		d71->max_vsize		= 4096;
> +		d71->num_rich_layers	= value & PERIPH_NUM_RICH_LAYERS ? 2 : 1;
> +		d71->supports_dual_link	= !!(value & PERIPH_SPLIT_EN);
> +		d71->integrates_tbu	= !!(value & PERIPH_TBU_EN);
> +	} else {
> +		value = malidp_read32(d71->gcu_addr, GCU_CONFIGURATION_ID0);
> +		d71->max_line_size	= GCU_MAX_LINE_SIZE(value);
> +		d71->max_vsize		= GCU_MAX_NUM_LINES(value);
> +
> +		value = malidp_read32(d71->gcu_addr, GCU_CONFIGURATION_ID1);
> +		d71->num_rich_layers	= GCU_NUM_RICH_LAYERS(value);
> +		d71->supports_dual_link	= GCU_DISPLAY_SPLIT_EN(value);
> +		d71->integrates_tbu	= GCU_DISPLAY_TBU_EN(value);
>  	}
>  
> -	value = malidp_read32(d71->periph_addr, PERIPH_CONFIGURATION_ID);
> -
> -	d71->max_line_size	= value & PERIPH_MAX_LINE_SIZE ? 4096 : 2048;
> -	d71->max_vsize		= 4096;
> -	d71->num_rich_layers	= value & PERIPH_NUM_RICH_LAYERS ? 2 : 1;
> -	d71->supports_dual_link	= value & PERIPH_SPLIT_EN ? true : false;
> -	d71->integrates_tbu	= value & PERIPH_TBU_EN ? true : false;
> -
>  	for (i = 0; i < d71->num_pipelines; i++) {
>  		pipe = komeda_pipeline_add(mdev, sizeof(struct d71_pipeline),
>  					   &d71_pipeline_funcs);
> @@ -606,6 +616,7 @@ d71_identify(u32 __iomem *reg_base, struct komeda_chip_info *chip)
>  
>  	switch (product_id) {
>  	case MALIDP_D71_PRODUCT_ID:
> +	case MALIDP_D32_PRODUCT_ID:
>  		funcs = &d71_chip_funcs;
>  		break;
>  	default:
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> index 1727dc993909..81de6a23e7f3 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> @@ -72,6 +72,19 @@
>  #define GCU_CONTROL_MODE(x)	((x) & 0x7)
>  #define GCU_CONTROL_SRST	BIT(16)
>  
> +/* GCU_CONFIGURATION registers */
> +#define GCU_CONFIGURATION_ID0	0x100
> +#define GCU_CONFIGURATION_ID1	0x104
> +
> +/* GCU configuration */
> +#define GCU_MAX_LINE_SIZE(x)	((x) & 0xFFFF)
> +#define GCU_MAX_NUM_LINES(x)	((x) >> 16)
> +#define GCU_NUM_RICH_LAYERS(x)	((x) & 0x7)
> +#define GCU_NUM_PIPELINES(x)	(((x) >> 3) & 0x7)
> +#define GCU_NUM_SCALERS(x)	(((x) >> 6) & 0x7)
> +#define GCU_DISPLAY_SPLIT_EN(x)	(((x) >> 16) & 0x1)
> +#define GCU_DISPLAY_TBU_EN(x)	(((x) >> 17) & 0x1)
> +
>  /* GCU opmode */
>  #define INACTIVE_MODE		0
>  #define TBU_CONNECT_MODE	1
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index b7a1097c45c4..ad38bbc7431e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -125,6 +125,7 @@ static int komeda_platform_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id komeda_of_match[] = {
>  	{ .compatible = "arm,mali-d71", .data = d71_identify, },
> +	{ .compatible = "arm,mali-d32", .data = d71_identify, },
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
