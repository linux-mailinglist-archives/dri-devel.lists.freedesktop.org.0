Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE7178E12
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D2A6EB06;
	Wed,  4 Mar 2020 10:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0551C6EB06
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDAmaBuZmVRFhqjGUEunOtmuxWP7cprK5RTb6V3m2Hg=;
 b=VvA+Twyz16Hbd4quJAtcmy4CrBby0dcfswKcA3OdhO33PDf/4wlAluvZMx7hzvkm0v25VXefZOppJXYoufl6r7fdOCbG69Z1sJCk5xmKKBONBRofo1Ct2jtrSryjmIzJQqu9hyEP6gLj5mJRDYkhS9z2kFtZAlP8FllWMzi0JqQ=
Received: from VE1PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:803:104::25)
 by AM6PR08MB3830.eurprd08.prod.outlook.com (2603:10a6:20b:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Wed, 4 Mar
 2020 10:11:52 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VE1PR08CA0012.outlook.office365.com
 (2603:10a6:803:104::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.11 via Frontend
 Transport; Wed, 4 Mar 2020 10:11:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Wed, 4 Mar 2020 10:11:52 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42");
 Wed, 04 Mar 2020 10:11:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be2eeef888b58486
X-CR-MTA-TID: 64aa7808
Received: from 203f149c2a3b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C8735B5-1870-4FA1-AEC2-7B0029FD9286.1; 
 Wed, 04 Mar 2020 10:11:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 203f149c2a3b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Mar 2020 10:11:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbQmcGm/nfDA1QBIXreDF5/Lxi2FDb3MJe1OQ3wrmsKjttYxGOBPvcHSZ0bcaoawAk/oVi8i+7hs9LtYDE9ToAP9XqwLf2EPf8oz+iT8GzMT62jepsEiRoE8ckbCscXp79hiem7sopypbW5L1roVGDenhTlt/se1zaDS/dv0aIJAjKGBBLvsQKJ0Nv5ZNUfM/hCDgmJkiMEprgPlpgpF3Aw30CtOoAvNggdhP+BabXF9CqChgIy/M+9/0MYLLftTB1plXA/3P5ixt4oGYRUIH2pvS4PHg5KFSkBYbJkkeixOIYTZc5iL2xQ1rkwN9HEIFara0qtBLRUAlP00U/l+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDAmaBuZmVRFhqjGUEunOtmuxWP7cprK5RTb6V3m2Hg=;
 b=SjtfboHNwRVUwvFJpE3eapEnxSbbYxunInUbAJ3K6loSnkIUQNKaVxlon9oi+GTAqexMHcypxkbCb8/5xGT+YSq1aAJoXZngySiBstcQ8E52at4l7q3gi5LGX5ifvu5MbGCtia4xipsWMlHFxgCPUkS2zi3wI3fRgMDBfqFpg4heILQaiAsaRFC2UhgmWLavqU/voDbuBwRo4o+L46Xm512SvJxOvc89RbGvlzxCjvtsT92zzEUyo3D2DSIDuUjhqKxrND8cEPSBuMyZQqSZgkbSG8z4Ria+XX5KcIeP7277GaM53FqnTF1wLm6KRnjae15u8hyYFaF5vnNBA/oqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDAmaBuZmVRFhqjGUEunOtmuxWP7cprK5RTb6V3m2Hg=;
 b=VvA+Twyz16Hbd4quJAtcmy4CrBby0dcfswKcA3OdhO33PDf/4wlAluvZMx7hzvkm0v25VXefZOppJXYoufl6r7fdOCbG69Z1sJCk5xmKKBONBRofo1Ct2jtrSryjmIzJQqu9hyEP6gLj5mJRDYkhS9z2kFtZAlP8FllWMzi0JqQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5070.eurprd08.prod.outlook.com (20.179.31.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 10:11:44 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 10:11:44 +0000
Date: Wed, 4 Mar 2020 18:11:37 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv6,2/6] drm/core: Add drm_afbc_framebuffer and a
 corresponding helper
Message-ID: <20200304101137.GA13480@jamwan02-TSP300>
References: <20200303120136.18294-3-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20200303120136.18294-3-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HK0PR01CA0063.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Wed, 4 Mar 2020 10:11:43 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a058ffc9-00f2-4647-9c0c-08d7c02475a3
X-MS-TrafficTypeDiagnostic: VE1PR08MB5070:|VE1PR08MB5070:|AM6PR08MB3830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3830717DB9F4C6968D940428B3E50@AM6PR08MB3830.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 0332AACBC3
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(199004)(189003)(6486002)(6666004)(956004)(478600001)(66946007)(186003)(66556008)(66476007)(26005)(33716001)(33656002)(86362001)(9686003)(8936002)(81156014)(4326008)(55236004)(316002)(16526019)(52116002)(6496006)(8676002)(81166006)(5660300002)(6916009)(1076003)(54906003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5070;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wQfgsjZujCZwNaHZqFQ3dTgF3JxaamKTxaY4ckkz0f4/hwrgR1ycK1a+4d3evb/usqa4Zu66VKVay3wGC9zY+eDy8Zc3qzDPipYyb0QAzGAbL6gvyl3vDW6GnbD0Bvv0wtzCAPvBu6ybx7ocrCWcOGKupusmPlQNSKBqeLjixW5GoQsBrELEDsRO/CVGCqwqMJ4pXPKCECVLJKM2vDmegxf7qndymaimKo4pJZW4P9aYB6MKMxQi4SPWftgDkEvB+7drxA1uCmBh4gt0ZQNdht9tzXfxSVCi6sKqHBlMakre9/gAdLoyDshaJ32sMsrDt25O/7tzs00tMv2gM1/W/KNMD+HR7P0qCpKPK15D8MNz7AXMelgWEjK8MGJqlSb4W7QZRUbJzBO1/nvikB+tOTLuzhKgofOl54Uk7nQgp02yFG5YqkeZfB4EMjDiLg8y
X-MS-Exchange-AntiSpam-MessageData: XrUMjo1RfrdxT1Qi5DrgjSxGNpjIoqv5HNGbOetXpge9IR8lw122HW2Wm6KYBpcFilRLkvYrOBG475dHWAv/nRVJPm3nb9KbRm4b9v87h6Vqm32N1FgHkclH22oeZUyBzeOZNVAc31IxAwZrtRWugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5070
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(186003)(33716001)(6496006)(336012)(6666004)(1076003)(26005)(16526019)(86362001)(2906002)(70586007)(956004)(356004)(70206006)(54906003)(81166006)(316002)(9686003)(81156014)(4326008)(6862004)(5660300002)(8936002)(6486002)(478600001)(26826003)(33656002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3830;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 550b74c5-8ea0-403e-bb57-08d7c024710e
X-Forefront-PRVS: 0332AACBC3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lATWILVkF0l+Qvw+ImXhYU+Q3NUcZzXYYeKWyPsuoO1PgPRj78SD/S+nNnXcyBK9uP2ty3T7poNSEyQACo82GB0vJ/FZ7EFNE60aF11OYaxsI8CvvPFcpwno2JAV93Fro6XQ495el1zWizXSnVXaZL9V4Qs4QfvB2ToPfss13Bbps6YR0j9q9BQxQ9fm3oZyV2jHCs5AZqcEVCJwuK9J90nJv1fH3vMIv+O9MUpqeBsvlFIdRF9VKuZxUw9NUMPb2ejf+QfCJLpQyIeoDwDaCzJwRlVAuYibozNFwNyUPSH7LZGFpj8EUtZ6HS60Xe0TzFTFviqkiaMA86ZopNh4kkHu7RRanBD+QKs4I6aIpBKcztN3j1ll55cvVHZ3VvfGuHUMSSNzaFxQ9xv0whYoOFuo/FC/BvM5Ai2GzjZk+lBrzKTGN8KoL66Vp8AhTqEJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2020 10:11:52.1156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a058ffc9-00f2-4647-9c0c-08d7c02475a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3830
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

On Tue, Mar 03, 2020 at 01:01:32PM +0100, Andrzej Pietrasiewicz wrote:
> The new struct contains afbc-specific data.
> 
> The new function can be used by drivers which support afbc to complete
> the preparation of struct drm_afbc_framebuffer. It must be called after
> allocating the said struct and calling drm_gem_fb_init_with_funcs().
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 121 +++++++++++++++++++
>  include/drm/drm_framebuffer.h                |  45 +++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  11 ++
>  3 files changed, 177 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 388a080cd2df..2a30f5b6829f 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -21,6 +21,13 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> +#define AFBC_HEADER_SIZE		16
> +#define AFBC_TH_LAYOUT_ALIGNMENT	8
> +#define AFBC_HDR_ALIGN			64
> +#define AFBC_SUPERBLOCK_PIXELS		256
> +#define AFBC_SUPERBLOCK_ALIGNMENT	128
> +#define AFBC_TH_BODY_START_ALIGNMENT	4096
> +
>  /**
>   * DOC: overview
>   *
> @@ -302,6 +309,120 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>  
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
> +	/* no user exists yet - fall through */
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +	default:
> +		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		return false;
> +	}
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
> +

In this new series, seems we no need to build this get_block_wh to be
an individual func but can directly put them into the following func.

> +static int drm_gem_afbc_min_size(struct drm_device *dev,
> +				 const struct drm_mode_fb_cmd2 *mode_cmd,
> +				 struct drm_afbc_framebuffer *afbc_fb)
> +{
> +	const struct drm_format_info *info;
> +	u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
> +	u32 tmp_bpp; /* remove when all users properly encode cpp in drm_format_info */
> +
> +	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &afbc_fb->block_width, &afbc_fb->block_height))
> +		return -EINVAL;
> +
> +	/* tiled header afbc */
> +	w_alignment = afbc_fb->block_width;
> +	h_alignment = afbc_fb->block_height;
> +	hdr_alignment = AFBC_HDR_ALIGN;
> +	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
> +		w_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
> +		h_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
> +		hdr_alignment = AFBC_TH_BODY_START_ALIGNMENT;
> +	}
> +
> +	afbc_fb->aligned_width = ALIGN(mode_cmd->width, w_alignment);
> +	afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
> +	afbc_fb->offset = mode_cmd->offsets[0];
> +
> +	/* Change to always using info->cpp[0] when all users properly encode it */
> +	info = drm_get_format_info(dev, mode_cmd);
> +	tmp_bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
> +
> +	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height) / AFBC_SUPERBLOCK_PIXELS;
> +	afbc_fb->afbc_size = ALIGN(n_blocks * AFBC_HEADER_SIZE, hdr_alignment);
> +	afbc_fb->afbc_size += n_blocks * ALIGN(tmp_bpp * AFBC_SUPERBLOCK_PIXELS / 8, AFBC_SUPERBLOCK_ALIGNMENT);
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gem_fb_afbc_init() - Helper function for drivers using afbc to
> + *			    fill and validate all the afbc-specific
> + *			    struct drm_afbc_framebuffer members
> + *
> + * @dev: DRM device
> + * @afbc_fb: afbc-specific framebuffer
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + * @afbc_fb: afbc framebuffer
> + *
> + * This function can be used by drivers which support afbc to complete
> + * the preparation of struct drm_afbc_framebuffer. It must be called after
> + * allocating the said struct and calling drm_gem_fb_init_with_funcs().
> + *
> + * Returns:
> + * Zero on success or a negative error value on failure.
> + */
> +int drm_gem_fb_afbc_init(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
> +			 struct drm_afbc_framebuffer *afbc_fb)
> +{
> +	const struct drm_format_info *info;
> +	struct drm_gem_object **objs;
> +	int ret = -EINVAL, i;
> +
> +	objs = afbc_fb->base.obj;
> +	info = drm_get_format_info(dev, mode_cmd);
> +	if (!info)
> +		goto error;
> +
> +	ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
> +	if (ret < 0)
> +		goto error;
> +
> +	if (objs[0]->size < afbc_fb->afbc_size) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	for (i = 0; i < info->num_planes; i++)
> +		drm_gem_object_put_unlocked(objs[i]);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_gem_fb_prepare_fb() - Prepare a GEM backed framebuffer
>   * @plane: Plane
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index c0e0256e3e98..e9f1b0e2968d 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -297,4 +297,49 @@ int drm_framebuffer_plane_width(int width,
>  int drm_framebuffer_plane_height(int height,
>  				 const struct drm_framebuffer *fb, int plane);
>  
> +/**
> + * struct drm_afbc_framebuffer - a special afbc frame buffer object
> + *
> + * A derived class of struct drm_framebuffer, dedicated for afbc use cases.
> + */
> +struct drm_afbc_framebuffer {
> +	/**
> +	 * @base: base framebuffer structure.
> +	 */
> +	struct drm_framebuffer base;
> +	/**
> +	 * @block_widht: width of a single afbc block
> +	 */
> +	u32 block_width;
> +	/**
> +	 * @block_widht: height of a single afbc block
> +	 */
> +	u32 block_height;
> +	/**
> +	 * @aligned_width: aligned frame buffer width
> +	 */
> +	u32 aligned_width;
> +	/**
> +	 * @aligned_height: aligned frame buffer height
> +	 */
> +	u32 aligned_height;
> +	/**
> +	 * @offset: offset of the first afbc header
> +	 */
> +	u32 offset;
> +	/**
> +	 * @afbc_size: minimum size of afbc buffer
> +	 */
> +	u32 afbc_size;
> +	/**
> +	 * @bpp: bpp value for this afbc buffer
> +	 * To be removed when users such as malidp
> +	 * properly store the cpp in drm_format_info.
> +	 * New users should not start using this field.
> +	 */
> +	u32 bpp;
> +};
> +
> +#define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
> +
>  #endif
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 3f61d9f832ee..c17bf0ebbe55 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -1,6 +1,7 @@
>  #ifndef __DRM_GEM_FB_HELPER_H__
>  #define __DRM_GEM_FB_HELPER_H__
>  
> +struct drm_afbc_framebuffer;
>  struct drm_device;
>  struct drm_fb_helper_surface_size;
>  struct drm_file;
> @@ -12,6 +13,8 @@ struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
>  
> +#define AFBC_VENDOR_AND_TYPE_MASK	GENMASK_ULL(63, 52)
> +
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane);
>  void drm_gem_fb_destroy(struct drm_framebuffer *fb);
> @@ -34,6 +37,14 @@ struct drm_framebuffer *
>  drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd);
>  
> +#define drm_is_afbc(modifier) \
> +	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
> +
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h);
> +
> +int drm_gem_fb_afbc_init(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
> +			 struct drm_afbc_framebuffer *afbc_fb);
> +
>  int drm_gem_fb_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *state);
>  int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
