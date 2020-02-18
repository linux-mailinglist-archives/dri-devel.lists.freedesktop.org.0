Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC117161F50
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 04:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073A16E11E;
	Tue, 18 Feb 2020 03:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA96E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 03:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imZEvPfX0tVMl493VwmlX61OoyZfhDBOnCELhe2znTY=;
 b=OTEWk4p04saeAhdCoEeIjgIEc4NrE4viBuEDrGv8MCnYj98PP8Z7ULHFJ1/43wVzoUABuSO0mYsZa2IFTz3lktTo5jGPzIZxBhbKdP6cxl3AKpeNK//SYOPM3Y3xtoYj8y+asgEQ3zEKGRSTblE4BOzayXB83s8RdfOdeUFdZrk=
Received: from VI1PR08CA0233.eurprd08.prod.outlook.com (2603:10a6:802:15::42)
 by AM0PR08MB4532.eurprd08.prod.outlook.com (2603:10a6:208:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Tue, 18 Feb
 2020 03:13:47 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0233.outlook.office365.com
 (2603:10a6:802:15::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Tue, 18 Feb 2020 03:13:47 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 18 Feb 2020 03:13:47 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42");
 Tue, 18 Feb 2020 03:13:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75f16209a7510211
X-CR-MTA-TID: 64aa7808
Received: from 7f295072343a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18960F06-1E84-41C4-9DBF-316DE42F6D08.1; 
 Tue, 18 Feb 2020 03:13:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f295072343a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Feb 2020 03:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecGpLpWal4ViCE2HEKpUH2gp+vmwAi9ry0lGm9wpVdEWoRp0hWaaDi8rXXoaIwFLpbB+5p/a9V7tWgFLn4WgeM4IUVPx/H7ncM2axqlyvZMRaRN4fBJ2VT9zMFFnvr8w+pCYHYmhdQfjwAmceGQ3e/Pt1Tg4r7BoPcBZw0O6aWev1bEHuklr0K9TAJ1WEFF01OhO+LtzfDfpwPaIXXaWw3cUIbozrJFoC+DjoqLz/uQZ1aDcnRDDgF2rQxB2DrnJyysUaNE3sQNzs8Er3ARvvlFNN6X26b0rfQDvoU+9dcRoRZTaYrEdhJG8Vt8kAZCn7l7vDwAUFa4ZqAnYUr28UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imZEvPfX0tVMl493VwmlX61OoyZfhDBOnCELhe2znTY=;
 b=KwComPSPeMDgPJacjLgWc0VBDWL61cMgcD8X4wxnUun8aLRl6lK6sYZIf7PwLYnOS3sWcisa00uIZ4YLii+uVVjYVO8CVNrFvoAIPJnC9gWYCnCFku9VIpA5z9iijeVbTz4CJyu/GWRKv52f9rRVTPv6sNZNNS3mIFMxuUDs94yTErhlwyyncq3OUJtmM9p60RzxJL3vkLR435MRma4ZCXMPcq6aMgTiA8SfQjzlEUwWpE+qIeOVJZTsb82V3dbIojewJi6jUbYsFTW7INj0Rs3z86ZiDD7WbL4pENO9XzFy81Tv5uheFnVFB8VwsH4ZHZSEroFxWxeZwWP3DWQwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imZEvPfX0tVMl493VwmlX61OoyZfhDBOnCELhe2znTY=;
 b=OTEWk4p04saeAhdCoEeIjgIEc4NrE4viBuEDrGv8MCnYj98PP8Z7ULHFJ1/43wVzoUABuSO0mYsZa2IFTz3lktTo5jGPzIZxBhbKdP6cxl3AKpeNK//SYOPM3Y3xtoYj8y+asgEQ3zEKGRSTblE4BOzayXB83s8RdfOdeUFdZrk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4655.eurprd08.prod.outlook.com (10.255.27.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 03:13:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 03:13:39 +0000
Date: Tue, 18 Feb 2020 11:13:33 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 01/34] drm/core: Add afbc helper functions
Message-ID: <20200218031333.GA10307@jamwan02-TSP300>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-2-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191217145020.14645-2-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HKAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:203:d0::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HKAPR04CA0016.apcprd04.prod.outlook.com (2603:1096:203:d0::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23 via Frontend Transport; Tue, 18 Feb 2020 03:13:38 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c46d6077-ca45-4f61-9b07-08d7b42091b4
X-MS-TrafficTypeDiagnostic: VE1PR08MB4655:|VE1PR08MB4655:|AM0PR08MB4532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4532B152739B996315211D85B3110@AM0PR08MB4532.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(33716001)(66946007)(66476007)(66556008)(6916009)(4326008)(8936002)(1076003)(8676002)(81156014)(6666004)(81166006)(2906002)(86362001)(55236004)(33656002)(16526019)(9686003)(26005)(7416002)(956004)(186003)(478600001)(316002)(5660300002)(52116002)(6486002)(6496006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4655;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hnJUnTM8e55+1SzN9XHLP3OKVLCh38bLDJN+XCXC5f4qMfhTuwbd4snxrxmcRnccgzGKYTu8+E+3OjauflYCBtlLMYdWJM6fui8TUTBVl6NDg+iV/Fkv/izlUt9JKak6bB6BJs3NkpawgOFfElJIrsDFYba1ev/xHs5vYkXsyqLIFBmAeS4lJ3PYk2TPVC0rPJPkdZZn2QxhOhUZu8tR5lfHncNHGaMB1F24q0nTmF/UL3Ga4IxA8oT2pd9SyNlS8IceP+Z+I3pcfmP9/VV0XHa9lgMLiigq9koW/FuUG3MCs0NJhvD4t23ROxyBypQBUZZZdF9OzqFybrv6XGmLAwGO8lFvubwqt+0i/w3NyIZHv53/ivRaL9dzmTGmvAzLczve4T8JDSgdkVMLnoqlDGYmvzvALip+thIFrOp61EGTm+0mlf5zFI7S9AUHYATH
X-MS-Exchange-AntiSpam-MessageData: d2kqj0+anzBx3XYI8rTUBcUtE1JRmWtAdjbwEDdLvGv6gO5qKS/k5j9J1XKDj9dYbhOtbT99aZ8MVqA9qCllMF5EYXqqebGdF7+cqZzZLHlmgTzZzXyPjyBAfAtfNvZzoswNMNirdS6Qzl32Uq+bGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4655
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(956004)(6486002)(2906002)(336012)(9686003)(70206006)(33656002)(6666004)(54906003)(8936002)(356004)(6496006)(316002)(70586007)(16526019)(86362001)(33716001)(186003)(478600001)(26005)(4326008)(81166006)(26826003)(5660300002)(8676002)(81156014)(6862004)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4532;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2430ef3c-d27c-4e85-56e0-08d7b4208ce1
X-Forefront-PRVS: 031763BCAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okMDQlqkh/RedUdOmUh6JsuMQChdMCS5tKpVmTUacxSaV/wfhJxM7/mxih6IEyMDcKTtAl/Q0BDHna1lQQal4majfatozRRUd+YAPtqIia383/8LV/5ldib3QZz0epP1rxfED8akdgr/cNvbjI1dJN9dRG3TM1vuWkAukFtXMqp+zALnQe5L5BjcSJhz4MnpYUYTi+IIFALbvkAj8BfnVGceQS8iP679RWI1KT7COkSQOooF4XlwmQHdOPzdBbhJpSPkMC3ak25mx1KPvzretPaFgNPIEBCrpC6fuJ0iJM5Gv6fpcwxqo/LPdX8cLzCBUT+BlgFBxPwNga8bOP3B/h2BQPBAtBbmpfDoeKHAjrS+DG4vS3eJR7KXkxDSP7pKTvA1VNA0LVGl2pjtePuQinTn3ypZCY7CZqxygBrQXxunBLL9Q6n+1p4YSuT70i4u
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 03:13:47.2640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46d6077-ca45-4f61-9b07-08d7b42091b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4532
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
Cc: nd@arm.com, Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej:

On Tue, Dec 17, 2019 at 03:49:47PM +0100, Andrzej Pietrasiewicz wrote:
> Add checking if a modifier is afbc and getting afbc block size.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 53 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_fourcc.h     |  4 +++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index b234bfaeda06..d14dd7c86020 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -29,6 +29,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  
>  static char printable_char(int c)
>  {
> @@ -393,3 +394,55 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
>  			    drm_format_info_block_height(info, plane));
>  }
>  EXPORT_SYMBOL(drm_format_info_min_pitch);
> +
> +/**
> + * drm_is_afbc - test if the modifier describes an afbc buffer
> + * @modifier - modifier to be tested
> + *
> + * Returns: true if the modifier describes an afbc buffer
> + */
> +bool drm_is_afbc(u64 modifier)
> +{
> +	/* is it ARM AFBC? */
> +	if ((modifier & DRM_FORMAT_MOD_ARM_AFBC(0)) == 0)
> +		return false;
> +
> +	/* Block size must be known */
> +	if ((modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) == 0)
> +		return false;

Do we really need this block size check here ?
Since modifier with ARM AFBC modifier but have no BLOCK_SIZE which
should be an error, but this check returns such error to NONE-AFBC.

And I saw you already have such error check in func
get_superblock_wh(), so I think we can del this size check in this
func.

James.

> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_is_afbc);
> +
> +/**
> + * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
> + * @modifier: the modifier to be looked at
> + * @w: address of a place to store the block width
> + * @h: address of a place to store the block height
> + *
> + * Returns: true if the modifier describes a supported block size
> + */
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)
> +{
> +	switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
> +		*w = 16;
> +		*h = 16;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
> +		*w = 32;
> +		*h = 8;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +		/* fall through */
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +		/* fall through */
> +	default:
> +		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		return false;
> +	}
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 306d1efeb5e0..7eb23062bf45 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -320,4 +320,8 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
>  				   int plane, unsigned int buffer_width);
>  const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf);
>  
> +bool drm_is_afbc(u64 modifier);
> +
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h);
> +
>  #endif /* __DRM_FOURCC_H__ */
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
