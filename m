Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D28187806
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 04:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D656E507;
	Tue, 17 Mar 2020 03:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27EA6E507
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 03:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjq5Du/7KTmOsAjlImL7DcU6Bsi8RXMWEED5o4Wqxc8=;
 b=yldhjkQaJdt1vN5JkwrTzTveyn5qb6ne4lx96Yy1YHo9rK3oQ8hbo6MpzeaEu5avzvFiQPVxFI6bGL2JanIY5cB5QWiWKpUxGwMQMq8kAR0mT8Ef9g/PV4wCYJ+AmMec3I/bGmkb8olfr3f4nkSp90Vb6vRcn6mNTbAN+mEM3TQ=
Received: from DB6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::21) by
 VI1PR0802MB2528.eurprd08.prod.outlook.com (2603:10a6:800:ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Tue, 17 Mar
 2020 03:15:58 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::20) by DB6P191CA0011.outlook.office365.com
 (2603:10a6:6:28::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend
 Transport; Tue, 17 Mar 2020 03:15:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Tue, 17 Mar 2020 03:15:57 +0000
Received: ("Tessian outbound 846b976b3941:v42");
 Tue, 17 Mar 2020 03:15:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74603bf2cf1739f3
X-CR-MTA-TID: 64aa7808
Received: from c5578e74c362.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38B8EE39-0474-42DD-BDA4-405C22A59A3E.1; 
 Tue, 17 Mar 2020 03:15:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5578e74c362.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Mar 2020 03:15:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpWGYRoHAbkWHItWnLrKTrQEl1aY9NVOBT+xH7tqrRESmdoIgiGYe21UtW+WvB00ZpGKZbUI+pJKALfICG4KS0hsf04ar3su8kf0WPAOHFSQeVI4tF9FRXMXaHB+uAHZZvWvoOwhf6aePazo+5l9ATda6K9dlV+NO019wGa5gx9JXpu3wrPK2bByNvBTP15LK+KMlfwMf2bE/Vb1tWJ30NNxyDkqK+e+UawSL/1cH2sxUnZsAf3ffWYxt5FWjO2s9r4bNu2WV6C3obm8oNwABpO5nyqQJHjDnkEK6KYx2nthieqFnYYZqbQ6D6D7mBsmp/ncNQ7T6HrwbdaAl4IdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjq5Du/7KTmOsAjlImL7DcU6Bsi8RXMWEED5o4Wqxc8=;
 b=gNCOjugUoxo2Jh/zhYwB+8UUdOkZYwPZxTUj+ZdU9P3b9pEKYJdyZKSB7jyRbEmEqDKuWOf1HVZndfwEZrrFewRHnSbPcKXf8pfUyycBcJNaVAg27bszHSxGt6tO3CfkCnNWCzTiV9tgZbMzxiPY12x2eoFfLvzUW0S0jplnBGl3niyt74o8pM4Dhir/qJxZqUW9yco6QBDIFlvETFeUD1rkuDrzfhLTv9RmEsjnNNQI7EsTQ+jQrNqF7QCewXAZABYgy9ZTBObTdlV2CWDO/JOXpW/rb7ZX26XclIbUm0kGCr1fCPDC6RXw6ApkrtgHdNdx5xbjdoLbqpUSKXirHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjq5Du/7KTmOsAjlImL7DcU6Bsi8RXMWEED5o4Wqxc8=;
 b=yldhjkQaJdt1vN5JkwrTzTveyn5qb6ne4lx96Yy1YHo9rK3oQ8hbo6MpzeaEu5avzvFiQPVxFI6bGL2JanIY5cB5QWiWKpUxGwMQMq8kAR0mT8Ef9g/PV4wCYJ+AmMec3I/bGmkb8olfr3f4nkSp90Vb6vRcn6mNTbAN+mEM3TQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4831.eurprd08.prod.outlook.com (10.255.115.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.22; Tue, 17 Mar 2020 03:15:49 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2d29:e139:a5a5:f08b]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2d29:e139:a5a5:f08b%3]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 03:15:48 +0000
Date: Tue, 17 Mar 2020 11:15:41 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv7 2/6] drm/core: Add drm_afbc_framebuffer and a
 corresponding helper
Message-ID: <20200317031541.GB11556@jamwan02-TSP300>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-3-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20200311145541.29186-3-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HKAPR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:203:d0::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HKAPR04CA0014.apcprd04.prod.outlook.com (2603:1096:203:d0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14 via Frontend Transport; Tue, 17 Mar 2020 03:15:47 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd76eb09-7562-40af-c4e1-08d7ca218322
X-MS-TrafficTypeDiagnostic: VE1PR08MB4831:|VE1PR08MB4831:|VI1PR0802MB2528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB252886BE08CD1672637B9632B3F60@VI1PR0802MB2528.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(199004)(316002)(1076003)(33716001)(6666004)(55236004)(52116002)(16526019)(186003)(54906003)(6916009)(33656002)(6496006)(7416002)(86362001)(26005)(66946007)(6486002)(9686003)(66476007)(66556008)(478600001)(4326008)(956004)(81166006)(8676002)(8936002)(81156014)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4831;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: huVgIBIV6HtiO7z00GP6V4Dl8A+3XZdUOuj0m9hfbgwWE2b5A0llTT1F2cbe9GoOZeny1rj+yEI3QaUiIBpNBLrXMXI3mQwDCCQNWyEa18UA8ssP/DuK9mPKM7nkUNBuAal8jQ0+wwtMUqa26zE8NoVhURqTBbrKMBYPxNIkd2Ry6p1AuNioS1OlY5lxuPZU2ejtBoMw/O21ARt7JVGnpwpJ96mql1InAOAdGTDvc3ZbdABuypg0bLVRu/APu9CLVBSUdGMpIYckhVFEbvwNuhzkeUjCW/5T20K+ZLl15+RGcNcSCQpmfZcMnRE6m4I3K2lQXGh9Ytl/FIIRZ72gi40U6oxphKSBYYtinDouZQs+AYIHWU9VOTkP9zXk5ODVy+0RH0bUS1L5zf1uPBvDr5nM2S79fNLA6n3p4zka69mCBKBTvvYM2diKw96t4dkg
X-MS-Exchange-AntiSpam-MessageData: mTu5vaCMg/FWGLWdkkXG663rasO3I34cnMN0fTBop505b0P8iff81vkoIlhrLTJPCcn2/yHuex4AFkrJgGr2tu0uXyvkl/jn0SQOqmif30wN92u/+jUTbU++zI9QHzUAhehBYHk4IDd0et54SETCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4831
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(396003)(39860400002)(136003)(199004)(46966005)(33656002)(316002)(478600001)(54906003)(4326008)(6862004)(26826003)(6486002)(8676002)(9686003)(81156014)(81166006)(1076003)(956004)(6496006)(336012)(16526019)(33716001)(8936002)(6666004)(356004)(26005)(186003)(5660300002)(86362001)(70586007)(70206006)(47076004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2528;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 572df797-33d5-411c-7cb1-08d7ca217d91
X-Forefront-PRVS: 0345CFD558
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7cyu7DrQQ0yrSW9h72LnrXGZR8sdkeZsOo/dJdNEzPjYDoWOqe8l+nVwidhJNKMgqL7+cGnFwi8C/XZH+UNQNDCVRKSNH+JCqxdmxHvB9FmH2c3Z1z2X1ji4LPH5KajJAWM927HV2/UnVvHWg0ogdGHc0H/C4JOzMoppFV+bYkk8jm0JVH708HSpX9RVYT9hgo08DYifuys7NnYA40PSmiBDSJlX5EPxZqEr6Keh7UtR9xSfdJh1zIaPN3GU0OlpFzx67gbkgf41jxa9PkVr3dw4hayHnd/YAnkYN5nulG4d8u9BXZK+gArcUkTahtDBspWfYTjIles7WBjUV5ANp+Z3pE65rKn4YH+NrSPdiiqJeAVwq+AmwjIe7n8dw38wfmwPLEVsYqVfW60AwCfLoTw2OAJMI4GYRlly5KkzAAgkp0G3s00FA7G8CUr695RhfPGS14m09VM+O1OwHsEzL1okWmgZRygIjKtasI+Se1i89i6515dV9i9psKNnJV8olVMDIFo5Cp788TqIhNCxA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 03:15:57.8969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd76eb09-7562-40af-c4e1-08d7ca218322
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2528
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
Cc: nd@arm.com, Ayan Halder <Ayan.Halder@arm.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 10:55:37PM +0800, Andrzej Pietrasiewicz wrote:
> The new struct contains afbc-specific data.
> 
> The new function can be used by drivers which support afbc to complete
> the preparation of struct drm_afbc_framebuffer. It must be called after
> allocating the said struct and calling drm_gem_fb_init_with_funcs().
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Looks good to me.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

Thanks
James
> ---
>  Documentation/gpu/todo.rst                   |  15 +++
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 108 +++++++++++++++++++
>  include/drm/drm_framebuffer.h                |  45 ++++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  10 ++
>  4 files changed, 178 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 439656f55c5d..37a3a023c114 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -404,6 +404,21 @@ Contact: Laurent Pinchart, respective driver maintainers
>  
>  Level: Intermediate
>  
> +Encode cpp properly in malidp
> +-----------------------------
> +
> +cpp (chars per pixel) is not encoded properly in malidp, zero is
> +used instead. afbc implementation needs bpp or cpp, but if it is
> +zero it needs to be provided elsewhere, and so the bpp field exists
> +in struct drm_afbc_framebuffer.
> +
> +Properly encode cpp in malidp and remove the bpp field in struct
> +drm_afbc_framebuffer.
> +
> +Contact: malidp maintainers
> +
> +Level: Intermediate
> +
>  Core refactorings
>  =================
>  
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 86c1907c579a..7e3982c36baa 100644
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
> @@ -302,6 +309,107 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>  
> +static int drm_gem_afbc_min_size(struct drm_device *dev,
> +				 const struct drm_mode_fb_cmd2 *mode_cmd,
> +				 struct drm_afbc_framebuffer *afbc_fb)
> +{
> +	const struct drm_format_info *info;
> +	__u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
> +	/* remove bpp when all users properly encode cpp in drm_format_info */
> +	__u32 bpp;
> +
> +	switch (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
> +		afbc_fb->block_width = 16;
> +		afbc_fb->block_height = 16;
> +		break;
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
> +		afbc_fb->block_width = 32;
> +		afbc_fb->block_height = 8;
> +		break;
> +	/* no user exists yet - fall through */
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +	default:
> +		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			      mode_cmd->modifier[0]
> +			      & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		return -EINVAL;
> +	}
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
> +	info = drm_get_format_info(dev, mode_cmd);
> +	/*
> +	 * Change to always using info->cpp[0]
> +	 * when all users properly encode it
> +	 */
> +	bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
> +
> +	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height)
> +		   / AFBC_SUPERBLOCK_PIXELS;
> +	afbc_fb->afbc_size = ALIGN(n_blocks * AFBC_HEADER_SIZE, hdr_alignment);
> +	afbc_fb->afbc_size += n_blocks * ALIGN(bpp * AFBC_SUPERBLOCK_PIXELS / 8,
> +					       AFBC_SUPERBLOCK_ALIGNMENT);
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
> + * It is caller's responsibility to put afbc_fb->base.obj objects in case
> + * the call is unsuccessful.
> + *
> + * Returns:
> + * Zero on success or a negative error value on failure.
> + */
> +int drm_gem_fb_afbc_init(struct drm_device *dev,
> +			 const struct drm_mode_fb_cmd2 *mode_cmd,
> +			 struct drm_afbc_framebuffer *afbc_fb)
> +{
> +	const struct drm_format_info *info;
> +	struct drm_gem_object **objs;
> +	int ret;
> +
> +	objs = afbc_fb->base.obj;
> +	info = drm_get_format_info(dev, mode_cmd);
> +	if (!info)
> +		return -EINVAL;
> +
> +	ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (objs[0]->size < afbc_fb->afbc_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_afbc_init);
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
> index c029c1618661..6b013154911d 100644
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
> @@ -34,6 +37,13 @@ struct drm_framebuffer *
>  drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd);
>  
> +#define drm_is_afbc(modifier) \
> +	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
> +
> +int drm_gem_fb_afbc_init(struct drm_device *dev,
> +			 const struct drm_mode_fb_cmd2 *mode_cmd,
> +			 struct drm_afbc_framebuffer *afbc_fb);
> +
>  int drm_gem_fb_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *state);
>  int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
