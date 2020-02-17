Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78C160A42
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 07:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645306E4AB;
	Mon, 17 Feb 2020 06:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08B6E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXNGZmnTOZIzk+83/iZu8zdjzDrCl/+TdQn8bLtgnoU=;
 b=7UlDriNVyFjyDGQz2VX3rHp8WlXODES3nFtSY2pArjour/AW6mWQO/MnmRW+mTww3r1/bl/Fi3AnLlULKrv9tnXCMLcIovlb0/obgpvwwh6Vl+eqk54mbToElS8xVFR3nu0TO7qnTmwUJYXkn7VWi1bP0vnc32IYbAEp3BguWNc=
Received: from VI1PR08CA0159.eurprd08.prod.outlook.com (2603:10a6:800:d1::13)
 by VI1PR0801MB1645.eurprd08.prod.outlook.com (2603:10a6:800:4e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 06:09:29 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0159.outlook.office365.com
 (2603:10a6:800:d1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 06:09:29 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 06:09:29 +0000
Received: ("Tessian outbound 0420f1404d58:v42");
 Mon, 17 Feb 2020 06:09:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00d3ec97565cb69b
X-CR-MTA-TID: 64aa7808
Received: from e756755dfcc5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36796F70-4810-4F3F-AB72-9EE01E771F06.1; 
 Mon, 17 Feb 2020 06:09:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e756755dfcc5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 06:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSgc7A58z07u3q+eROP6WnFoNq+HTZPeKiTotIuJg4IxmyExBcDNlcEAQ6noW8NwsCx4it5tmXmP8oZYcYG6Lk2Xo7BgwlQqiG8sfnymXZ+FoESFAV8Jpfx9sPqI2OUHOCgYJn6JnCjmJY81EQHY+H7/gJ1vSh/BWxlMTrl4w2toa+WE1WSX0eigjGqO60m/21CtLiFJRfZvBJvqcgFTtO5USbQltCvQi3WYtcqviJh3REIAEowajU5vJ+bAErQeUV6Y++HDPsu9XOTyVmqAUnus7uzaxStFFd29LdYDqr7CbT7J3HiH7CV0+I8LVrycPrBXkPCGINRPk7EmMdrIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXNGZmnTOZIzk+83/iZu8zdjzDrCl/+TdQn8bLtgnoU=;
 b=keC5vVgsm9jyj/hfR0QTmwDyg1POAuKT6boNT6xlEyYirghVffOd5IUwJIt0SwcwTCNvOgz0LTKkW1Q57Ry2GqY1BOSzP1MPQvCZ3ibGbYbC8icoLp6H51aFPe/TXak5rRKIyTya0j5tYdoZ12bAeG1HwufuqWV2z0YAUpR+HraOFGZu5sZmXJ+8RbPFLGJIRSVi1o9680rL+ojTMTg842++K1zUZF0zB70GfZvS1HHWxAMt2MK1+RKeDhz/AOOc4UsYfy+NVL/vqBkiPgQ3H6CjAjTGgjU+TO/FGmi/PQSpHT6foJ6XAT4bcZc3wAipCArft1dLAZxMD17L60L9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXNGZmnTOZIzk+83/iZu8zdjzDrCl/+TdQn8bLtgnoU=;
 b=7UlDriNVyFjyDGQz2VX3rHp8WlXODES3nFtSY2pArjour/AW6mWQO/MnmRW+mTww3r1/bl/Fi3AnLlULKrv9tnXCMLcIovlb0/obgpvwwh6Vl+eqk54mbToElS8xVFR3nu0TO7qnTmwUJYXkn7VWi1bP0vnc32IYbAEp3BguWNc=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5038.eurprd08.prod.outlook.com (10.255.159.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 06:09:22 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 06:09:22 +0000
Date: Mon, 17 Feb 2020 14:09:14 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,02/36] drm/core: Add afbc helper functions
Message-ID: <20200217060914.GA4374@jamwan02-TSP300>
References: <20191213155907.16581-3-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-3-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24 via Frontend Transport; Mon, 17 Feb 2020 06:09:21 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72ff3ec7-13e4-4f30-8dd4-08d7b36ff2b8
X-MS-TrafficTypeDiagnostic: VE1PR08MB5038:|VE1PR08MB5038:|VI1PR0801MB1645:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB16459A37B673370459875F94B3160@VI1PR0801MB1645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(366004)(346002)(39850400004)(396003)(189003)(199004)(956004)(54906003)(6916009)(8936002)(81156014)(81166006)(9686003)(8676002)(4326008)(478600001)(316002)(55236004)(6496006)(52116002)(66946007)(66556008)(66476007)(86362001)(6666004)(5660300002)(33656002)(1076003)(26005)(6486002)(33716001)(186003)(2906002)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5038;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LsP4Iw3PdWWWgCVaJ7ECvKAg67a8ib4YNIzuzNNl90BnI6zL7GZfl3EeXA7QVGj8rtbiPfo3rAzNLG2t6WvV9ZuJLDJpnxpInivedYj3h6PRZZMw5Cz6igNVDL89AEBFgjNa+uZNJ/JP9WMMrz2pmE6o26pj1ePJ0rI1ByOLTD+zIBnxIq4CON7nu1BG/nONjf4nFNSjXgzNCEIvUsIk3Nd2NwHlInlv1rYJiQxadQS0b3S7GbVWps/sOyq++EnDKwvWECpDvwqcPK8Dn62V04n8s62WUtwXqAvOV7XsEpRFEUY8kZsOcz6sM3Rd09DpC03/7YEDA2HFw1Yr6SMLPLuW+zMjzw1cVMEaE721/r4zgg6XWOYZ6ktY2oJVTZ522mpYjlfXXj2XGt/EPIJNJ/6mlJaM8mODvTdBPyasLmm5KfB3MLJo5cX2VBmBvEP5
X-MS-Exchange-AntiSpam-MessageData: jKKi+icKyRWaf2hUfH4uXS9O2yDtQzwesA5butB8LAXrNT+y7roNxib+zhA/2+JFUyDx4+EVJIZrF/tjdJFJqPmlNiXGU7XZzvV/UmKfFccJM7LYSZvQ4eccvqtZU71JJ5Twqe8XxQKr/u/VxpKT8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5038
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(346002)(39850400004)(136003)(189003)(199004)(336012)(33716001)(6666004)(356004)(956004)(8936002)(81156014)(8676002)(81166006)(6496006)(6862004)(86362001)(4326008)(36906005)(6486002)(54906003)(26005)(33656002)(16526019)(186003)(70206006)(70586007)(9686003)(5660300002)(316002)(2906002)(478600001)(26826003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1645;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bab7eae7-eeb5-4a0a-b4bc-08d7b36fee54
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z3GJmjSJSQkspfqXp34EfpWlHVgPU7Y+NW+xq67nQ8TUspg0NQJ0juACH2ScQZQCYzlyAc/0AlJWN05MmgC4V3QPSqC+/rq+Ic/l6599wGdDjyItcfshlw4x58TV0YZVJ2QbU9ld+8Xmb7kowtkfma+4AkzesUw9RmTX5Qrf4Fq3xZW+nfCQqW4UtM7IC2XfNebFtsQYoOT2MgSq6G0LdU6LVhM+5muQ3bR8NzUbZCKBX9cNTLSHbikYuoFZRFPUrjdZtIhdMUDkJ+JPfpnIODbVt83JLl0i+k/3H58fuD5ANzEzPnBhmUiEDOOVZm4Uy0rTCgGSq+QXsoziTgqwXm679nzfPnQ7/EJTtn8xdHHGgTUk3VXq2BpSF9BtBf0cAFD/tdRl3O5RBuljaQ5thT6EgHYglnZ6XmK0Z1PwiE6DvI3L3wcn3ho9AnJgtuml
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 06:09:29.0547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ff3ec7-13e4-4f30-8dd4-08d7b36ff2b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1645
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
Cc: nd@arm.com, kernel@collabora.com,
 Mihail Atanassov <mihail.atanassov@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 04:58:33PM +0100, Andrzej Pietrasiewicz wrote:
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
And i saw you already have such error check in func
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
