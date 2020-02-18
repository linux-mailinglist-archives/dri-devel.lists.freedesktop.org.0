Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B3161FA0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 04:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB346E125;
	Tue, 18 Feb 2020 03:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C446E125
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 03:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3r7iqMWEAmy48nr2Sm6Zg+wtofzS76OghiBIOISFSI=;
 b=0Qg7u6CdPTRRx5fKzsYXTcQ+AdSmDyFBGvswXQc7grzQ9WpfdeA+rwf6WH/DebbVDoFYVImwu4sfJ8QxgSIV+6QmeMjsNaL9BhIDaI6XNOXNNqliJBorHnDzcfGKq4eYJvrcQaoSMPXAolC4Grd4ItKwAuny6etWqoU0tLdKcXQ=
Received: from HE1PR0802CA0023.eurprd08.prod.outlook.com (2603:10a6:3:bd::33)
 by AM5PR0801MB2017.eurprd08.prod.outlook.com (2603:10a6:203:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Tue, 18 Feb
 2020 03:43:05 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by HE1PR0802CA0023.outlook.office365.com
 (2603:10a6:3:bd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.29 via Frontend
 Transport; Tue, 18 Feb 2020 03:43:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 18 Feb 2020 03:43:04 +0000
Received: ("Tessian outbound 3a0cbd311638:v42");
 Tue, 18 Feb 2020 03:43:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed55b37b5edeae2b
X-CR-MTA-TID: 64aa7808
Received: from 37c943d18f25.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0E2C34C-FB81-4E95-82ED-830172A89939.1; 
 Tue, 18 Feb 2020 03:42:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37c943d18f25.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Feb 2020 03:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIuuqaoaVbuuaR0GiXCp4jj4tZT497OypblVkIcaNaUIJPsjXgqqXDLAQw2OnuYQbXkZAjEEytnVkrL4spbuzj7XX15HuFjhpyJxRbd3hSelBRf9PSvQZ0ITWqU3Y6RKPczg8xzQfw470xzH4F1nRbnOL2vDm3yVY2u8WJH5+reFtsnFNbRGbzyQrAZ59cNMvEXurMZZXFNHWxlOsESBDQDioxz/C2X7zu/5Afdfss+EiegkML+Uf6c0DTSPf9t2nYGPSQV3fjoYZb3T1Jpmk5YSd+kOtjKDebhxAcv+IheLXRHvmdY0opwb1Yyeg+3b0kg96NQSPhAaUOthhNPOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3r7iqMWEAmy48nr2Sm6Zg+wtofzS76OghiBIOISFSI=;
 b=OSKTaY4WAJEzvAJ7Jy07SAYGxDBHY4++VEw9So6pspsaK5CcqHV5HkbkcagW3XMCmoMOepnpxFKUloNsECA7F6kW/UflqbLgSvWtNFwkNpYRDk6iE+gHbiNyZ2z4SrKZKiE08ighBo6kfbOziUARDToD2yKlczgzD0xQ7b/FidvuiuUJcEK8cLU4SKCR93Yqj9upfFt95mM6BXKzn2KTHq1syPSxYvD9ZPgKUAPu1IBWN4DuKpYA9/j3ItznBTp5/H7pAPUosa2RogShCYy0MokSHPUxbtSQDzcvJpX5e2DhEISjgHNE2PKXuplNXlT3Tp6uhWZOKxuEGwVAr51i9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3r7iqMWEAmy48nr2Sm6Zg+wtofzS76OghiBIOISFSI=;
 b=0Qg7u6CdPTRRx5fKzsYXTcQ+AdSmDyFBGvswXQc7grzQ9WpfdeA+rwf6WH/DebbVDoFYVImwu4sfJ8QxgSIV+6QmeMjsNaL9BhIDaI6XNOXNNqliJBorHnDzcfGKq4eYJvrcQaoSMPXAolC4Grd4ItKwAuny6etWqoU0tLdKcXQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4783.eurprd08.prod.outlook.com (10.255.114.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 03:42:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 03:42:56 +0000
Date: Tue, 18 Feb 2020 11:42:50 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 03/34] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Message-ID: <20200218034250.GA10524@jamwan02-TSP300>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-4-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191217145020.14645-4-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Tue, 18 Feb 2020 03:42:55 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e291bb60-1969-4496-57c9-08d7b424a93e
X-MS-TrafficTypeDiagnostic: VE1PR08MB4783:|VE1PR08MB4783:|AM5PR0801MB2017:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2017ADB4CFF8EA3C8E5147EAB3110@AM5PR0801MB2017.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(6916009)(26005)(7416002)(55236004)(6666004)(1076003)(54906003)(2906002)(6486002)(9686003)(52116002)(5660300002)(86362001)(33716001)(66946007)(186003)(4326008)(16526019)(478600001)(6496006)(81156014)(81166006)(8936002)(8676002)(33656002)(66476007)(956004)(316002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4783;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dAGj444VSVXlF/qMyh5ZPyzcDEs/SJXurIFN38pUbQbPWbHKFU3GflsZwsZCCawWz+aGwDGHnfJ1l4Flq5qHkx9LQXxl8TQVPVNKf8w4iy50ABq4LRHSzjIl3Ozs21C+ekyvVkmDRS8lasT6mghOzUFiU/5Ze0VzmMde3iP112EVabuJGa0RlLB+46rFPcbcfpBRIP4wSGI9QGnO3S5law+lBrMVyXb4JWH5B8zrZ2KgdKWwJlUg0HbRs+li3rT23+YiGqoY2czLywdAqd3jpGdW9eC5eq5Jsocvcap0q0jHHW/HcmfSJBbRIFxTD7vREOcPdL9g+aOxlBMZQV22VaMBV5cEIl76CYKqAtTnrUzPDpsnE8GQSxmbYX/6xuwjxTklUnccWJvuHRMYoljGPTm1MbY3jEU1VtZ2523lDP23sGTBHFrkiqkqjchVI7yf
X-MS-Exchange-AntiSpam-MessageData: Zovv5ZYHpmVnGPgzaNxmVWfcZdF1PJQx882SXr4uExqGaWX8injKmVUfJsh0s4EYTn7xRjI4SufYAu8frTl3NS/sSEbgC9sHIQnMK1mrPErIIvLjgmwIpA7Wtn8vWtIGVLB5S4waOKtrLqgv6VgOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4783
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(8676002)(33656002)(8936002)(54906003)(70206006)(316002)(4326008)(356004)(16526019)(6666004)(956004)(81156014)(1076003)(26005)(5660300002)(70586007)(336012)(81166006)(186003)(6862004)(6486002)(6496006)(33716001)(9686003)(26826003)(2906002)(478600001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB2017;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40d458d0-71e3-4f9a-bac8-08d7b424a41a
X-Forefront-PRVS: 031763BCAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgpQnLbmOOP1CuMvOOPcNQeM/sESIYE42PgFF5z/6bqTEr5VfV3+JPOdnhAo1VdYiBwozl/iOSHcyZz8hSXetstKHFHzv27mnvkUzfuJroNpwXU2YsjzA0o+Sxp21iAWjvtp6i2MVHYC831VHu7gUY5ZK0NVGT6fQgBZDXhOijZIaOJznNf/oQ4CYt05rECa23oiI05Q4T994p4o9u8wwaMu5YxMbe9wihPO5+9Kb+9T6o1Cs8tfbaCi6axc1d1FFxzrxd0kf3dWt9iQ+sMT5K34Wv2YPM71wbgkzAjGEnUgnRVo1ubDHQMYJTmtKBQPmoU6sPhG4P4OA3owJaHv8vCuyBwV7fMBwRYfE9UPwcONBlcJqnVbLbw151c4SVW+slmPT9/yOnBZFO1gezKZH8utO/Jdr70kJItremIhsyYzkFRM9L6yjmHWjGQ2b3ow
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 03:43:04.7321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e291bb60-1969-4496-57c9-08d7b424a93e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017
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

On Tue, Dec 17, 2019 at 03:49:49PM +0100, Andrzej Pietrasiewicz wrote:
> The new version accepts a struct describing deviations from standard way of
> doing the size checks. The caller must provide the respective values.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 46 ++++++++++++++++----
>  include/drm/drm_gem_framebuffer_helper.h     | 16 +++++++
>  2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index b3494f6b66bb..d2fce1ec8f37 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -300,8 +300,8 @@ int drm_gem_fb_lookup(struct drm_device *dev,
>  EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>  
>  /**
> - * drm_gem_fb_size_check() - Helper function for use in
> - *			     &drm_mode_config_funcs.fb_create implementations
> + * drm_gem_fb_size_check2() - Helper function for use in
> + *			      &drm_mode_config_funcs.fb_create implementations
>   * @dev: DRM device
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
>   *
> @@ -311,9 +311,10 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>   * Returns:
>   * Zero on success or a negative error code on failure.
>   */
> -int drm_gem_fb_size_check(struct drm_device *dev,
> -			  const struct drm_mode_fb_cmd2 *mode_cmd,
> -			  struct drm_gem_object **objs)
> +int drm_gem_fb_size_check2(struct drm_device *dev,

[nit-pick]: how about name it to drm_gem_fb_custom_size_check()

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
James.

> +			   const struct drm_mode_fb_cmd2 *mode_cmd,
> +			   const struct drm_size_check *check,
> +			   struct drm_gem_object **objs)
>  {
>  	const struct drm_format_info *info;
>  	int i;
> @@ -326,10 +327,19 @@ int drm_gem_fb_size_check(struct drm_device *dev,
>  		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
>  		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
>  		unsigned int min_size;
> +		u32 pitch = mode_cmd->pitches[i];
> +
> +		if (check && check->use_pitch_multiplier)
> +			if ((pitch * check->pitch_multiplier[i]) %
> +			    check->pitch_modulo)
> +				return -EINVAL;
>  
> -		min_size = (height - 1) * mode_cmd->pitches[i]
> -			 + drm_format_info_min_pitch(info, i, width)
> -			 + mode_cmd->offsets[i];
> +		if (check && check->use_min_size)
> +			min_size = check->min_size[i];
> +		else
> +			min_size = (height - 1) * pitch
> +				 + drm_format_info_min_pitch(info, i, width)
> +				 + mode_cmd->offsets[i];
>  
>  		if (objs[i]->size < min_size)
>  			return -EINVAL;
> @@ -338,6 +348,26 @@ int drm_gem_fb_size_check(struct drm_device *dev,
>  	return 0;
>  
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_fb_size_check2);
> +
> +/**
> + * drm_gem_fb_size_check() - Helper function for use in
> + *			     &drm_mode_config_funcs.fb_create implementations
> + * @dev: DRM device
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + *
> + * This function can be used to verify buffer sizes for all planes.
> + * It is caller's responsibility to put the objects on failure.
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
> + */
> +int drm_gem_fb_size_check(struct drm_device *dev,
> +			  const struct drm_mode_fb_cmd2 *mode_cmd,
> +			  struct drm_gem_object **objs)
> +{
> +	return drm_gem_fb_size_check2(dev, mode_cmd, NULL, objs);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
>  
>  static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index c85d4b152e91..4955af96d6c3 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -11,6 +11,18 @@ struct drm_mode_fb_cmd2;
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> +struct drm_size_check;
> +
> +/**
> + * struct drm_size_check - Description of special requirements for size checks.
> + */
> +struct drm_size_check {
> +	unsigned int min_size[4];
> +	bool use_min_size;
> +	u32 pitch_multiplier[4];
> +	u32 pitch_modulo;
> +	bool use_pitch_multiplier;
> +};
>  
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane);
> @@ -32,6 +44,10 @@ int drm_gem_fb_lookup(struct drm_device *dev,
>  		      struct drm_file *file,
>  		      const struct drm_mode_fb_cmd2 *mode_cmd,
>  		      struct drm_gem_object **objs);
> +int drm_gem_fb_size_check2(struct drm_device *dev,
> +			   const struct drm_mode_fb_cmd2 *mode_cmd,
> +			   const struct drm_size_check *check,
> +			   struct drm_gem_object **objs);
>  int drm_gem_fb_size_check(struct drm_device *dev,
>  			  const struct drm_mode_fb_cmd2 *mode_cmd,
>  			  struct drm_gem_object **objs);
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
