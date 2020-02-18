Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDF161FFB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 06:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A4D6E128;
	Tue, 18 Feb 2020 05:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10077.outbound.protection.outlook.com [40.107.1.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5677D6E128
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 05:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CN1mYuh/dynvq5Ra6dOq7HIaOzCui/HngNwdAoQDp4=;
 b=sLkjYIMu9DqzSh8/miacv33/SudNuA/43N2ZQq6sL4xU2kJovOWawcymnKE9Fk3ctwqE2i+gZ4OJ7LG3wBDnJ1XAFTVx7t64JZac/W3kBykNyDVJlWst1SRUo90UXuNLNMQJwQ8Fq5ZuUGwMR2Buz4i4y+xaLNSW4DR1iHTE++0=
Received: from VI1PR08CA0246.eurprd08.prod.outlook.com (2603:10a6:803:dc::19)
 by DB7PR08MB3065.eurprd08.prod.outlook.com (2603:10a6:5:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Tue, 18 Feb
 2020 05:02:53 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0246.outlook.office365.com
 (2603:10a6:803:dc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Tue, 18 Feb 2020 05:02:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 18 Feb 2020 05:02:52 +0000
Received: ("Tessian outbound da94dc68d1bb:v42");
 Tue, 18 Feb 2020 05:02:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec94406bf5ff787c
X-CR-MTA-TID: 64aa7808
Received: from 29056cebd8ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 288E10B5-7152-4306-A91F-842163348817.1; 
 Tue, 18 Feb 2020 05:02:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29056cebd8ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Feb 2020 05:02:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAMK3MBudeef4Xi9wNk5uB5VCa4WE54TaQfg4vsntXqZ3IR6yjipX5RjGack3U6jYNu4xkbwbJ3w1S8k0ssvFAi4TveVp3CF7L7jpUMZ4pwpQtgUiBPGHLreJIIMcv904gvqdCLfEAOMVB/2y7LukAI/X+5uEk/25rhMUljrj5N37ZzaV/CIsCSUeXpiDR7J2Y1m9fVo7rEIUz9+x29ABqZRgkRGl85HLjA15XQnpOIUQLQYAj2LDVmpKqSSnDFqmggZvmMw6/ZWeqDo+rwjvZIfCfKJcKyenKrA3kDVzr6EU6AbIHcOce2QgjIAJs+6wAXWA8I9ye3rpUlxzobDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CN1mYuh/dynvq5Ra6dOq7HIaOzCui/HngNwdAoQDp4=;
 b=c+8twpwf5k2Gh2ShDxJ5UB9qDIcHT2DetW19O5QsaGRLIlJVBj55jbyC6CNWyGhVb7bcwNg8YsQXZUHfArs7b2rklmbJ4yJt63wgpkTHO5nMla3T0e6yQchrY3cCGk5oMdPcTlqpCVNoG/+7MbwzGFOgphl3ecL29UZKMbGmXL0pWcZhVTvpogEQVah1Kv8P4hdE6cJeAPKc4zsPMyIa5o5E7gYxi4Bvqam+2Nf/byfdb/RhidkCnpie+yirWjSAXySE6CsonNR2fN5XT8n6VK8dpwCvP9oP0qB03vaxvH+Gi2DwPfgljhQoL4rAUd5/SwlHNhQGhZz9fW1ursSC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CN1mYuh/dynvq5Ra6dOq7HIaOzCui/HngNwdAoQDp4=;
 b=sLkjYIMu9DqzSh8/miacv33/SudNuA/43N2ZQq6sL4xU2kJovOWawcymnKE9Fk3ctwqE2i+gZ4OJ7LG3wBDnJ1XAFTVx7t64JZac/W3kBykNyDVJlWst1SRUo90UXuNLNMQJwQ8Fq5ZuUGwMR2Buz4i4y+xaLNSW4DR1iHTE++0=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4989.eurprd08.prod.outlook.com (10.255.159.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 05:02:44 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 05:02:44 +0000
Date: Tue, 18 Feb 2020 13:02:36 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 04/34] drm/gem-fb-helper: Add generic afbc size checks
Message-ID: <20200218050236.GA10649@jamwan02-TSP300>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-5-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191217145020.14645-5-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:202:16::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR02CA0127.apcprd02.prod.outlook.com (2603:1096:202:16::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Tue, 18 Feb 2020 05:02:43 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74c9334a-b238-47c1-2f5d-08d7b42fcf32
X-MS-TrafficTypeDiagnostic: VE1PR08MB4989:|VE1PR08MB4989:|DB7PR08MB3065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB30653D8685F4B803EA46489AB3110@DB7PR08MB3065.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(5660300002)(956004)(16526019)(26005)(4326008)(55236004)(81166006)(186003)(316002)(8676002)(6496006)(81156014)(8936002)(2906002)(54906003)(33716001)(52116002)(6916009)(66476007)(33656002)(66556008)(9686003)(7416002)(6666004)(478600001)(1076003)(6486002)(86362001)(66946007)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4989;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wbC9iCanlliHprwOVO1kg1ahBB11pxk3yKcVwgAiTCvM1p9Jn0zStzKLIBw+mFge49aSSKaTfySfxw3ClXWJizrCua7YT0Ux6cVKkPsyA8dqSn78SFO9xqcLx1Tap09xCoIQttKBVWu30S9olPiSV8w1xP71uc77wFLuZ0vbhz4k0vNyMkRtXl/7T1HaKnLgkQFLWyZXUQsaBSN6izsmuusk41dJRtMGpL16uTwtDi3Z3yZSKbBRWxwsoAYLTbLdwvNEu/qTgx93zohNKHmRXO12osUNuBN682Ll6moJ5MV+rb6kVvmu18MZ0sgqwzIePg0Kilg6DY1BH7jGz7eEJhGsWXf/tqHtm4xUbc5zfy+BU5/i3FqXQyLsN4I2EP5rvLQ0JiWAt0X9DsYZqCldqc/HZlOmQoa8Pn5CpzEX8UmQC0GnHGWzlR2JmrqL+kT19fyd3tuQhQ+zmxlkPayqAZUeaOOROlJJ02d6mUcRjDLB1n6WQuw4FpB3jmNov2Ve
X-MS-Exchange-AntiSpam-MessageData: OyS0nl1VMWGa6pe0VV9Zny5tRhCiY+s/N3XjDrLCCcjziJDA2O6jVaa33eaHdukQqe/mRp3KWTEvb6e7lBTFzX51Fgbeau5aLpca1ac85qK6uaidaUSZkKsMzcg0n5qDueMYwZ+aWOEa8a2woDgzqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4989
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(356004)(6666004)(2906002)(6486002)(9686003)(33716001)(26826003)(316002)(478600001)(33656002)(26005)(336012)(81156014)(6862004)(5660300002)(86362001)(4326008)(8676002)(54906003)(81166006)(1076003)(6496006)(956004)(36906005)(8936002)(70206006)(186003)(16526019)(70586007)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3065;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c743a30d-3355-4f20-5341-08d7b42fc9bf
X-Forefront-PRVS: 031763BCAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqlfMC5JbFdAC8BTFcu+CjytCvZ27Iy3Q1ekpkjolmqnj1tssTtXXyGAJULzlZWAqRQMlZM9B5btkg502JYWZctsugPCZgJ23MjylJkJVXGOIEE+mE3hvRLpxYJZg0mESHz7HdYNMrtnV3rZqPVaVWzeCUKWBoqfG7+cIoVeQeomd47390qgZ0wp+sQvm/pXeG6+U/uUoQilprfah6ou1x6HSrpI3h69Jey/UPjZ1Dsre4lMB2e3wLgFAmi1Mrd0lfmaAcegdYaESNUAq9/xyVO5n+9dQ8YjaSNBo2BW2dqV/WLcsvSvQDXsC1lZACxfAeszqwdjMvNbo2rRSQovJMZw5FJwgI1O5q+61yRVeTEhlInicYIjj4RkYTXvgRTxbkCKipnytCYb1BZ/hq1ANHnoilADjnqqaJGfao15k5ncD+fYgJGRsKpfkvlnVg76AhaqgoahK/rc+8sMni3dxgvm+hQEcFwJuwJYBM4s9s7uq44g5A3gxHxwWvEp91QG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 05:02:52.8089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c9334a-b238-47c1-2f5d-08d7b42fcf32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3065
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

On Tue, Dec 17, 2019 at 03:49:50PM +0100, Andrzej Pietrasiewicz wrote:
> Extend the size-checking special function to handle afbc.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 49 +++++++++++++++++--
>  include/drm/drm_framebuffer.h                | 50 ++++++++++++++++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  1 +
>  3 files changed, 96 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index d2fce1ec8f37..5fe9032a5ee8 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -21,6 +21,11 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> +#define AFBC_HEADER_SIZE		16
> +#define AFBC_TH_LAYOUT_ALIGNMENT	8
> +#define AFBC_SUPERBLOCK_PIXELS		256
> +#define AFBC_SUPERBLOCK_ALIGNMENT	128
> +
>  /**
>   * DOC: overview
>   *
> @@ -299,6 +304,34 @@ int drm_gem_fb_lookup(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>  
> +static int drm_gem_afbc_min_size(struct drm_device *dev,
> +				 const struct drm_mode_fb_cmd2 *mode_cmd,
> +				 struct drm_afbc_framebuffer *afbc_fb)
> +{
> +	u32 n_blocks;
> +
> +	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &afbc_fb->block_width, &afbc_fb->block_height))
> +		return -EINVAL;
> +
> +	/* tiled header afbc */
> +	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
> +		afbc_fb->block_width *= AFBC_TH_LAYOUT_ALIGNMENT;
> +		afbc_fb->block_height *= AFBC_TH_LAYOUT_ALIGNMENT;
> +	}

TBH, here caculated afbc_fb->block_with/height are not
block_width/height, but fb w/h alignment.
Per my understanding, afbc only has block size: 16x16, 32x8, 64x4 ...
generally the afbc w/h alignment according the the block_size, but once the
tiled header enabled, since one tiled header describes 8x8 superblocks,
so the alignment of w/h need to mutiple 8.

So I think we'd better name the variable to width/height_alignment.


BTW: no matter block_w/h or w/h_alignmtent are only for size
calculation, seems no need to store them to afbc_fb.

> +
> +	afbc_fb->aligned_width = ALIGN(mode_cmd->width, afbc_fb->block_width);
> +	afbc_fb->aligned_height = ALIGN(mode_cmd->height, afbc_fb->block_height);
> +	afbc_fb->offset = mode_cmd->offsets[0];
> +
> +	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height) / AFBC_SUPERBLOCK_PIXELS;
> +	afbc_fb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE, afbc_fb->alignment_header);
> +

After check the references in malidp, rockchip and komeda, seems this
afbc->alignment_header is dedicated for komeda only and a pass in
argument.

This is not true. Per afbc HW spec alignment is essential for
all afbc usage. according to the spec the requiremnt are:

  AFBC1.0/1.1: 64 byte alignment both for header and body buffer.
  AFBC1.2 (tiled header enabled): 4096 alignment.

So this alignement is not a vendor specific value, but afbc feature
requirement, can be determined by afbc modifier.
(malidp and komeda obeys this spec, not sure about Rockchip, but I
think it should be)

But you may see, komeda uses 1024 (not 64) for none-tiled-header afbc,
that's because GPU(MALI) changed this value to 1024 for bus
performance (sorry I don't know the detail), and komeda changed to
1024 to follow.

Back to alignment_header here, I think we can just follow the spec, use 64
for none-tiled-header, 4096 for tiled-header, and no need to let the caller
to specify it

> +	afbc_fb->afbc_size = afbc_fb->offset_payload
> +			   + n_blocks * ALIGN(afbc_fb->bpp * AFBC_SUPERBLOCK_PIXELS / 8, AFBC_SUPERBLOCK_ALIGNMENT);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_gem_fb_size_check2() - Helper function for use in
>   *			      &drm_mode_config_funcs.fb_create implementations
> @@ -334,19 +367,27 @@ int drm_gem_fb_size_check2(struct drm_device *dev,
>  			    check->pitch_modulo)
>  				return -EINVAL;
>  
> -		if (check && check->use_min_size)
> +		if (check && check->use_min_size) {
>  			min_size = check->min_size[i];
> -		else
> +		} else if (check && check->data && drm_is_afbc(mode_cmd->modifier[0])) {
> +			struct drm_afbc_framebuffer *afbc_fb;
> +			int ret;
> +
> +			afbc_fb = check->data;
> +			ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
> +			if (ret < 0)
> +				return ret;
> +			min_size = ret;
> +		} else {
>  			min_size = (height - 1) * pitch
>  				 + drm_format_info_min_pitch(info, i, width)
>  				 + mode_cmd->offsets[i];
> -
> +		}
>  		if (objs[i]->size < min_size)
>  			return -EINVAL;
>  	}
>  
>  	return 0;
> -
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_size_check2);
>  
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index c0e0256e3e98..c8a06e37585a 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -297,4 +297,54 @@ int drm_framebuffer_plane_width(int width,
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

Since malidp and komeda have no requirement for none-zero offset, so I
think we can reject none zero offset as error like did in rockchip in
afbc_size_check().

> +	/**
> +	 * @alignment_header: required alignment for afbc headers
> +	 */
> +	u32 alignment_header;
> +	/**
> +	 * @afbc_size: minimum size of afbc buffer
> +	 */
> +	u32 afbc_size;
> +	/**
> +	 * @offset_payload: start of afbc body buffer
> +	 */
> +	u32 offset_payload;
> +	/**
> +	 * @bpp: bpp value for this afbc buffer
> +	 */
> +	u32 bpp;

Seems we can remove this bpp or no need to define it as a pass in argument
for size check, maybe the komeda/malidp get_afbc_bpp() function mislead
you that afbc formats may have vendor specific bpp.

But the story is:

for afbc only formats like DRM_FORMAT_YUV420_8BIT/10BIT, we have set
nothing in drm_format_info, neither cpp nor block_size, so both malidp
or komeda introduce a get_bpp(), but actually the two funcs basically
are same.

So my suggestion is we can temporary use the get_afbc_bpp() in malidp
or komeda. and eventually I think we'd better set the block size
for these formats, then we can defines a common get_bpp() like pitch

Thanks
James

> +};
> +
> +#define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
> +
>  #endif
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 4955af96d6c3..17e3f849a0fb 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -22,6 +22,7 @@ struct drm_size_check {
>  	u32 pitch_multiplier[4];
>  	u32 pitch_modulo;
>  	bool use_pitch_multiplier;
> +	void *data;
>  };
>  
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
