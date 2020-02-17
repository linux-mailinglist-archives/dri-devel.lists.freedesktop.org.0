Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AED160CB7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484066E51C;
	Mon, 17 Feb 2020 08:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB46E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW4/nQaGZzdkozalHNeHGh07SL89map2HVWU2NkqUyg=;
 b=JUc30ce7RZszkDcFfSMPuZlAKMaEd5Lka8Y/Ri43lkPCliZn60/3jNN4DnvwBjAEIU/xogHdmvUJ776kozZ1hO3fh3ZolahfruRIuzLw96JPUxErLY9yMYBD539t9SBxIlEN0pV8TUYmzHLScKzO9lHsr+bvhI6e+WXIyWjG4is=
Received: from VI1PR0801CA0071.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::15) by AM6PR08MB5015.eurprd08.prod.outlook.com
 (2603:10a6:20b:e5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 08:16:44 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by VI1PR0801CA0071.outlook.office365.com
 (2603:10a6:800:7d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 08:16:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 08:16:43 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42");
 Mon, 17 Feb 2020 08:16:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 372059a113a0daae
X-CR-MTA-TID: 64aa7808
Received: from 4baeb3f03dc6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B6DC65D-1F58-4D70-B38B-99FE477A0521.1; 
 Mon, 17 Feb 2020 08:16:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4baeb3f03dc6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 08:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUMtaCx/ZtUUa8nHxU2bfl+ylIf/1jJvqkNWhYC2WIcDnktyuh92ZRXOxGZ3/28lggtO3UFdchpD7Y0hWiDQw5uNGZv66agpOMtDOhxNfcpO3Q2+wHLhouHs5nELO/0e5XEiHn5KxhDyBwKBPRHLXm3KN0AVWisLSDv50O3gJamTqXv59O0GHqQ1F4V49Kt9oWVqSJk6mspeQVmbAkjvSuNohT3HSM4K/kCdm0auFi19F/sIWS6J1CQdRaVz8VlHHk7l+h8sAajSuGRiz80SC4+xF0HAZuaJKB5001ZOfQvpBkB+ot4Hni+AkqNsfXF3ua6bZL5oYxJzdUfHd34Muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW4/nQaGZzdkozalHNeHGh07SL89map2HVWU2NkqUyg=;
 b=LNQwHT4nvu/eFsN1vHwnn+LTPiRLgIk/reetz9YI6gsHiHD5gapa0UZ5q2qB9Lcg7tYcVeS3CZG6SRa34rC2rwQr+T4L5qAT/GhztCYQkA/FkGSSE0KLy1B4+xicKT5jtJ+QQgxh/wMshk3Pn0id/KHfmaTgCuJIeuD1BC1o8ToGts3KQGyk4Jux0okkufhJXA8gsqAgT+D7UtzyNLXGzWPJw8aQ0/uCKlmiwnv2j5yv/i+VbvJs37eVS34lFQekOmpwYAIa8zRmHV/SkDIbaswz3RaBYNTnDcNOjWI7OV0WEVYZOfQ66QtxD1w5tDD9d1Y/kwPIsm7rjvz1qXQMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW4/nQaGZzdkozalHNeHGh07SL89map2HVWU2NkqUyg=;
 b=JUc30ce7RZszkDcFfSMPuZlAKMaEd5Lka8Y/Ri43lkPCliZn60/3jNN4DnvwBjAEIU/xogHdmvUJ776kozZ1hO3fh3ZolahfruRIuzLw96JPUxErLY9yMYBD539t9SBxIlEN0pV8TUYmzHLScKzO9lHsr+bvhI6e+WXIyWjG4is=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4655.eurprd08.prod.outlook.com (10.255.27.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 08:16:36 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 08:16:36 +0000
Date: Mon, 17 Feb 2020 16:16:27 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,04/36] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Message-ID: <20200217081627.GA5151@jamwan02-TSP300>
References: <20191213155907.16581-5-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-5-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR02CA0213.apcprd02.prod.outlook.com (2603:1096:201:20::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24 via Frontend Transport; Mon, 17 Feb 2020 08:16:35 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05e17e8d-8c71-46f8-d335-08d7b381b957
X-MS-TrafficTypeDiagnostic: VE1PR08MB4655:|VE1PR08MB4655:|AM6PR08MB5015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5015BD66F3045B78A7E80260B3160@AM6PR08MB5015.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(33716001)(66946007)(66476007)(66556008)(6666004)(4326008)(81166006)(8936002)(81156014)(2906002)(1076003)(8676002)(33656002)(86362001)(6916009)(55236004)(6486002)(9686003)(16526019)(186003)(26005)(956004)(478600001)(316002)(5660300002)(52116002)(6496006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4655;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mjDcVwsvnG5nqiTqzqlYqGwNBNVXArJZv5ZQd//n4Np2Nbit4n/wbo5UK23xHlSwva+ibgF9hBWhr5Eyfj5gax4MXwnbTGn63OcK4A7qxEyotefTZ/b/eFaFUjD5D2552dwDzbL3UaL/Y4RzhZArecHeleq82aI9QKAipdIBTvH0zRHwtBhegjn7e0kF7HbhA4+OgLeyEQluwaA+v082jFWctxcN0VBBjVl/WX7GYooCrs2gELeMDetB0rLNATI+ntMkDJ5DBVCdW82Pq2oR2CcIBe9+tLB9ZIwYpIvmu1SFjnZmN3m5gV4T484gxj0eV3+hulzB+h+DXmXeIG4YW+lgdvPYYF/erBhybLKJBkxPqZn4SVwIhKD/iAnkWqRXmvjQ2QiCE2YZWl7G3CrO0skGV2Pqo8eVxqf+VeIqoqCe92wi66FONpNmNEwhgUEo
X-MS-Exchange-AntiSpam-MessageData: qER1klyGUjwS+LNvR0y0xuuCPd/uyoDUrNtkqnMjsn1h92bLp2k+d6OL5RJLzMyrYAMi0E5mmFGl2UixjonH/LWF5SqEVjR6AY/VvkeboL4rkkoe3Yy2g3pGOcqpcvk78/jSInX3O6brG/iN8XINdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4655
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(33656002)(26005)(86362001)(8936002)(5660300002)(336012)(6862004)(70586007)(186003)(2906002)(956004)(33716001)(6496006)(70206006)(16526019)(26826003)(81166006)(81156014)(1076003)(316002)(478600001)(36906005)(9686003)(8676002)(6486002)(4326008)(6666004)(54906003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5015;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7db1e187-f10d-4f2f-4025-08d7b381b4bc
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kk+b/QqeUTSPJMNK2qxe1U1oXNOt/y88rYa6jH45j8DydevsMCc6L1aXKRRfEfAFkUZMsiBSKbRxXhSEDrpOMlO9Bjf1Lne2YhXdLBCo1hcUycab+tmjNMtAMKVFPQScQ2Mmy/U9vQhq3Sf4KXdVH4/xE+qUXKY27qUAgl/CY5fvQ6UP/QI+5a2xDYHvYIm3CiAY9vqezIeJXjBc2sAFGJ1g1NHDHzYvrc2uRXMkgAXLlZiVY2JyDnT+RsZUp4cSGpMhj45lSRTSEgVFkwZZcarppUBIMNm3J8vRH4bg5/V6f3f4ivMAUfiNCaqN25GbYG4SEC3uBERepZb2SqaLX4w5VegzgtTZiuQ9+GmKkwHigHW3pVeXXs9HgaXdY6qefE/LkVwWvErqcKWST4DHyqi+IDi47py/0+dbU0wE4PMCNG9So7d1PCGcRBBbqLrY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 08:16:43.6507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e17e8d-8c71-46f8-d335-08d7b381b957
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5015
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

Hi Andrzej:

Really a good idea for introducing this custom size check, it's very
useful for some Komeda/malidp format, espcially pitch_multiplier, maybe
in future we can add it into into the drm_format_info.    

On Fri, Dec 13, 2019 at 04:58:35PM +0100, Andrzej Pietrasiewicz wrote:
> The new version accepts a struct describing deviations from standard way of
> doing the size checks. The caller must provide the respective values.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 47 ++++++++++++++++----
>  include/drm/drm_gem_framebuffer_helper.h     | 16 +++++++
>  2 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 787edb9a916b..4201dc1f32a5 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -201,8 +201,9 @@ int drm_gem_fb_lookup(struct drm_device *dev,
>  EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>  
>  /**
> - * drm_gem_fb_size_check() - Helper function for use in
> - *			     &drm_mode_config_funcs.fb_create implementations
> + * drm_gem_fb_size_check_special() - Helper function for use in
> + *				     &drm_mode_config_funcs.fb_create
> + *				     implementations
>   * @dev: DRM device
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
>   *
> @@ -212,9 +213,10 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>   * Returns:
>   * Zero on success or a negative error code on failure.
>   */
> -int drm_gem_fb_size_check(struct drm_device *dev,
> -			  const struct drm_mode_fb_cmd2 *mode_cmd,
> -			  struct drm_gem_object **objs)
> +int drm_gem_fb_size_check_special(struct drm_device *dev,

How about name it to drm_gem_fb_custom_size_check()

> +				  const struct drm_mode_fb_cmd2 *mode_cmd,
> +				  const struct drm_size_check *check,
> +				  struct drm_gem_object **objs)
>  {
>  	const struct drm_format_info *info;
>  	int i;
> @@ -227,10 +229,19 @@ int drm_gem_fb_size_check(struct drm_device *dev,
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
> @@ -239,6 +250,26 @@ int drm_gem_fb_size_check(struct drm_device *dev,
>  	return 0;
>  
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_fb_size_check_special);
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
> +	return drm_gem_fb_size_check_special(dev, mode_cmd, NULL, objs);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
>  
>  /**
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index c85d4b152e91..74304a268694 100644
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
> +int drm_gem_fb_size_check_special(struct drm_device *dev,
> +				  const struct drm_mode_fb_cmd2 *mode_cmd,
> +				  const struct drm_size_check *check,
> +				  struct drm_gem_object **objs);
>  int drm_gem_fb_size_check(struct drm_device *dev,
>  			  const struct drm_mode_fb_cmd2 *mode_cmd,
>  			  struct drm_gem_object **objs);

For this common case can we just define it as a MACRO, or a inline
func here in this header.

Thanks
James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
