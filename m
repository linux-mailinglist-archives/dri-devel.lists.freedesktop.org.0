Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEDB178DDA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 10:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFFB6EB04;
	Wed,  4 Mar 2020 09:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9337C6E142
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYWk9QdlgPQoudIEgW5jlx5K17Go+5Rxo085xMPdr80=;
 b=ffTlHjDFoJ+IuOxyE83UVkMWKEG6MENLD6tB+0sF32SxiAZDZmmlBDDTMW93asHOa7N2gIIGQZKHshi7wtcx7tRrkF4N+8lKZedThtB6Ls0CIIiEPsZsdU1AMEkUAq9bjYwBg4h9tI560IE+8GbI/Y8x8ZbJvUymRtKKDB8mac4=
Received: from VI1PR08CA0276.eurprd08.prod.outlook.com (2603:10a6:803:dc::49)
 by AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Wed, 4 Mar
 2020 09:54:58 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0276.outlook.office365.com
 (2603:10a6:803:dc::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Wed, 4 Mar 2020 09:54:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Wed, 4 Mar 2020 09:54:58 +0000
Received: ("Tessian outbound da94dc68d1bb:v42");
 Wed, 04 Mar 2020 09:54:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fdc23524f5b7730
X-CR-MTA-TID: 64aa7808
Received: from f0a5a2616780.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B953763A-AC0D-48CB-B2C9-ECE0B60A25F6.1; 
 Wed, 04 Mar 2020 09:54:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0a5a2616780.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Mar 2020 09:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEkuxMjfatGUI2UGyc+aiaGc2TvNLl4xAFLKF/nujrlK5frazQiDafttpHBOqs83Kc2RrLnYfEj5QG4TqTWZfwYo3bDrwWk85Z8bo9NtUK/W4xSLXeDC4f2SXhIxb+RcFzfy4e3EEHb4yEbWC0pBbFB+6G168pK4m1kPelqVgL9m4p+eHF0RuRcvozhExF70JggkReDhHdLRB0PcSWN6jb6KskSLAc1MIMBDkA19MgFVvOpH7m40Dj6Wuw5seCsq+YE6x24Tn1IACtiAP0EjXOZ9md7BrQ/ntRU8l7G9f/VhdXHjscJ7YkOtR+spJUlb+bXaYctkxhi4nIAk3etNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYWk9QdlgPQoudIEgW5jlx5K17Go+5Rxo085xMPdr80=;
 b=UreZmVJ2/sq8ebjLdPViEwrqP9EO9o5TskkovAXi8La/mAkGgWrC8LZWT5OObPmeZjTOANA5zLO97+IV3baZPvXV2g3DORCgxtb2Zp1OOZP4LMKMnE9rQUXvqPw6Tuf/IdNeGBwC0mFfj0eCl/4GAdakXyCO4RRnZL398cDXpxryFlynGhFagT3faUAOJA9u4mBS7AF5kY06TWBoOMwtAurXGVlioj+dt3Pz2iVMgxhgYEk9xSGPVkb2HdLEoEvwVmx7+A+gc9EWE8yZ6WlHecsG0JoaOu3EoUnYXSNorpO0SA0CSGHFIfBKWrmnUx2vtiFfU8rELp70XhwFdF1eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYWk9QdlgPQoudIEgW5jlx5K17Go+5Rxo085xMPdr80=;
 b=ffTlHjDFoJ+IuOxyE83UVkMWKEG6MENLD6tB+0sF32SxiAZDZmmlBDDTMW93asHOa7N2gIIGQZKHshi7wtcx7tRrkF4N+8lKZedThtB6Ls0CIIiEPsZsdU1AMEkUAq9bjYwBg4h9tI560IE+8GbI/Y8x8ZbJvUymRtKKDB8mac4=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4927.eurprd08.prod.outlook.com (10.255.27.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Wed, 4 Mar 2020 09:54:51 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 09:54:51 +0000
Date: Wed, 4 Mar 2020 17:54:44 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv6,1/6] drm/core: Allow drivers allocate a subclass of
 struct drm_framebuffer
Message-ID: <20200304095444.GA13317@jamwan02-TSP300>
References: <20200303120136.18294-2-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20200303120136.18294-2-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HK0PR03CA0119.apcprd03.prod.outlook.com (2603:1096:203:b0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Wed, 4 Mar 2020 09:54:50 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8efc16c4-5184-4502-081c-08d7c0221982
X-MS-TrafficTypeDiagnostic: VE1PR08MB4927:|VE1PR08MB4927:|AM6PR08MB4213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4213933DCDB53B494423C6A8B3E50@AM6PR08MB4213.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-Forefront-PRVS: 0332AACBC3
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(54906003)(66946007)(66476007)(66556008)(6916009)(316002)(33656002)(33716001)(2906002)(956004)(52116002)(4326008)(6496006)(1076003)(8676002)(478600001)(9686003)(6666004)(5660300002)(86362001)(16526019)(186003)(81156014)(55236004)(81166006)(8936002)(26005)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4927;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: skdoUFh7XiOR0QOOjsxHnzxYSAfB6M6bZEE4rD5EM46lvZzFTsYqEK4TdS6XzrLtT6T2FJUFjlKW8RvcjrJbiQtu2Lkk9LgppJvOTub+Jk8FJABHsMMeBusJkIVFK5cPOFPtZvVyIRwf75IgjyXjiuq3h5d51ML4xWX5B3EzuhB8wk8X+J/9gGsg5xCcAD/mwv3FyIvKOgPofzYE5g2l1U0+YwqHoQQXFE3ZKARRelfpbfxqjy9QzHlgYe9BHuhEky0ctGy7o/a9Dv6wniN06umt/KYycnjDronuj/jZ6NP8Exb3Yrdyyl57yD5neTrervBl3ZU4bqJN12fi5yRhoEnlZgHJCQMlCEe5Fsp4u0p0tCelQ6p/AvPIh2zFjpBHgvPhyM4WxpJn20d02ePDHFW+pAAOuoGQvXFfB5bYrJotmJxLQc9p3gBwZzjPxgVZ
X-MS-Exchange-AntiSpam-MessageData: 89L+MV68vcP2MWSRlAmdqZAZym6aYXnlbU31AY1XlVbMuTdk+OSXY1D12hipBt6xtQG49KR165gYxONpkveq1CCLQCgJFgCAzJtDTKLaq7mCcQbnVuNXE+JsLf+8yslkWzyGKiB+upBopfiwvVWLNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4927
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(36906005)(54906003)(6862004)(4326008)(478600001)(26826003)(2906002)(316002)(86362001)(6496006)(956004)(336012)(5660300002)(70586007)(356004)(6666004)(186003)(26005)(16526019)(81156014)(81166006)(8676002)(1076003)(33716001)(70206006)(8936002)(33656002)(9686003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4213;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b52dd402-e934-49fe-6f2e-08d7c0221501
X-Forefront-PRVS: 0332AACBC3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npPw9eowEhkBJlGmZfeL93vS6qz/2/mxNvpSv1Jmo54RNa6lm5M123GfaUA2NKvCtcup62ciJ7a3TV8X2UFdqHP+CrUWuoHrGAz5bcHZ2E9ZZAjRqLemN8GMeLVg7/THCE03VVZiVVCEC2Us8VzlRxqfHHh9WI9fwi+IBMZmnIHI8+YGvy32I4yamuo3peEZggb2bmclKeZHc/MmRAfPpxhGYhKtP4zzzNRNXrT9Mwok8+f0VC7SXukczBk6Z73JdRFtlywbMVoaRPFHsYXJvfAWszoaeFZZKirHlaIBnHdqBQNUdd30tCSJCCgQj7tDup70u+qoztzhyfPqB2lI6kutGA4nutf0BLylrwiWMB20N0BeFXWSTMgGs3r4T3zYs1KX1rlfY8C7x4cFpyM9AOPeEfSs8dUzkZ3oMOb6n3Em2Z6eWtXWSzgB4/kIVTOP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2020 09:54:58.4977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efc16c4-5184-4502-081c-08d7c0221982
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
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

On Tue, Mar 03, 2020 at 01:01:31PM +0100, Andrzej Pietrasiewicz wrote:
> Allow allocating a specialized version of struct drm_framebuffer
> by moving the actual fb allocation out of drm_gem_fb_create_with_funcs();
> the respective functions names are adjusted to reflect that fact.
> Please note, though, that standard size checks are performed on buffers,
> so the drm_gem_fb_init_with_funcs() is useful for cases where those
> standard size checks are appropriate or at least don't conflict the
> checks to be performed in the specialized case.
> 
> Thanks to this change the drivers can call drm_gem_fb_init_with_funcs()
> having allocated their special version of struct drm_framebuffer, exactly
> the way the new version of drm_gem_fb_create_with_funcs() does.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 65 +++++++++++++++-----
>  include/drm/drm_gem_framebuffer_helper.h     |  5 ++
>  2 files changed, 56 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 3a7ace19a902..388a080cd2df 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -55,18 +55,14 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  
>  static struct drm_framebuffer *
> -drm_gem_fb_alloc(struct drm_device *dev,
> +drm_gem_fb_init(struct drm_device *dev,
> +		 struct drm_framebuffer *fb,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd,
>  		 struct drm_gem_object **obj, unsigned int num_planes,
>  		 const struct drm_framebuffer_funcs *funcs)
>  {
> -	struct drm_framebuffer *fb;
>  	int ret, i;
>  
> -	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> -	if (!fb)
> -		return ERR_PTR(-ENOMEM);
> -
>  	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>  
>  	for (i = 0; i < num_planes; i++)
> @@ -123,10 +119,13 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  EXPORT_SYMBOL(drm_gem_fb_create_handle);
>  
>  /**
> - * drm_gem_fb_create_with_funcs() - Helper function for the
> - *                                  &drm_mode_config_funcs.fb_create
> - *                                  callback
> + * drm_gem_fb_init_with_funcs() - Helper function for implementing
> + *				  &drm_mode_config_funcs.fb_create
> + *				  callback in cases when the driver
> + *				  allocates a subclass of
> + *				  struct drm_framebuffer
>   * @dev: DRM device
> + * @fb: framebuffer object
>   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
>   * @funcs: vtable to be used for the new framebuffer object
> @@ -134,18 +133,21 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
>   * This function can be used to set &drm_framebuffer_funcs for drivers that need
>   * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
>   * change &drm_framebuffer_funcs. The function does buffer size validation.
> + * The buffer size validation is for a general case, though, so users should
> + * pay attention to the checks being appropriate for them or, at least,
> + * non-conflicting.
>   *
>   * Returns:
>   * Pointer to a &drm_framebuffer on success or an error pointer on failure.
>   */
>  struct drm_framebuffer *
> -drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> -			     const struct drm_mode_fb_cmd2 *mode_cmd,
> -			     const struct drm_framebuffer_funcs *funcs)
> +drm_gem_fb_init_with_funcs(struct drm_device *dev, struct drm_framebuffer *fb,
> +			   struct drm_file *file,
> +			   const struct drm_mode_fb_cmd2 *mode_cmd,
> +			   const struct drm_framebuffer_funcs *funcs)

For these two new added funcs: fb_init()/fb_init_with_funcs(), can we change
the return type "struct drm_framebuffer *" to "int".

>  {
>  	const struct drm_format_info *info;
>  	struct drm_gem_object *objs[4];
> -	struct drm_framebuffer *fb;
>  	int ret, i;
>  
>  	info = drm_get_format_info(dev, mode_cmd);
> @@ -175,7 +177,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  		}
>  	}
>  
> -	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
> +	fb = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (IS_ERR(fb)) {
>  		ret = PTR_ERR(fb);
>  		goto err_gem_object_put;
> @@ -189,6 +191,41 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
> +
> +/**
> + * drm_gem_fb_create_with_funcs() - Helper function for the
> + *                                  &drm_mode_config_funcs.fb_create
> + *                                  callback
> + * @dev: DRM device
> + * @file: DRM file that holds the GEM handle(s) backing the framebuffer
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + * @funcs: vtable to be used for the new framebuffer object
> + *
> + * This function can be used to set &drm_framebuffer_funcs for drivers that need
> + * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
> + * change &drm_framebuffer_funcs. The function does buffer size validation.
> + *
> + * Returns:
> + * Pointer to a &drm_framebuffer on success or an error pointer on failure.
> + */
> +struct drm_framebuffer *
> +drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> +			     const struct drm_mode_fb_cmd2 *mode_cmd,
> +			     const struct drm_framebuffer_funcs *funcs)
> +{
> +	struct drm_framebuffer *fb, *ret;
> +
> +	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> +	if (!fb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
> +	if (IS_ERR_OR_NULL(ret))
> +		kfree(fb);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
>  
>  static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index d9f13fd25b0a..3f61d9f832ee 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -19,6 +19,11 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  			     unsigned int *handle);
>  
>  struct drm_framebuffer *
> +drm_gem_fb_init_with_funcs(struct drm_device *dev, struct drm_framebuffer *fb,
> +			   struct drm_file *file,
> +			   const struct drm_mode_fb_cmd2 *mode_cmd,
> +			   const struct drm_framebuffer_funcs *funcs);
> +struct drm_framebuffer *
>  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
>  			     const struct drm_framebuffer_funcs *funcs);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
