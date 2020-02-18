Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3D161F8C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 04:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A856E123;
	Tue, 18 Feb 2020 03:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10078.outbound.protection.outlook.com [40.107.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4893F6E123
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 03:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hDK4clf2ehzcz3vx/vduyaG0ZvLPlUlbNQSUyBbqf8=;
 b=CDUjAadYKWG1I6g/LdF2L04TQ42uqYLo6088tdhzYRX4NPbW/RKee0YuMprgMxdz05xVzqOr+Qj9wk6jIOQ30O8NxAU+EO8kWSo4qItvjR5WxGqeGNUNgHVH1aq49I+25VHstgbWfb5DtKLOcq4WSBAHcYtLaMP+nNPfqYvqfqQ=
Received: from AM6PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:20b:b2::14)
 by HE1PR0802MB2619.eurprd08.prod.outlook.com (2603:10a6:3:d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Tue, 18 Feb
 2020 03:35:13 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by AM6PR08CA0002.outlook.office365.com
 (2603:10a6:20b:b2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Tue, 18 Feb 2020 03:35:13 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 18 Feb 2020 03:35:13 +0000
Received: ("Tessian outbound d1ceabc7047e:v42");
 Tue, 18 Feb 2020 03:35:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaabfa417d8f7188
X-CR-MTA-TID: 64aa7808
Received: from ba08ce9fa207.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8591DAA0-2023-40B7-86C7-4F8679FB5D9F.1; 
 Tue, 18 Feb 2020 03:35:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba08ce9fa207.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Feb 2020 03:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnXuh1NWf0xfBela1COhiASGJaOtrapk2SkrNtATd3nf1arn6zNODlcpmjuuo3br4i663aj18TQgOwqRDaehbIuqyYqydYJK3Cs9enEHthHtzayOSpeSQcwfISDPfngQWqJ+f/zCaV9oEdY2Z54T9FcnwqeUFPTSgC6RIkgLerwqRwiI4n70WI8Wy5w58+59h0coExk3WE05JhUjJjudxrK4ftpRyqIYGYff8qy6hv2bFP2y90LBjtCLjdEFCbx+0hWz3fUEYC14k+NcPjC4VWMEJJWLOONWQM6Kn9nY1lTVLK8hSy27sfhfOzxGJI5XHlakfURSG6Zl66Ql1oDACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hDK4clf2ehzcz3vx/vduyaG0ZvLPlUlbNQSUyBbqf8=;
 b=VXziu7ilGl/6gokK/V690CYyKYR6PaFzscVqMIoEo3k35zfVRtDgkJ2TLtQ5iOknUnleixQ0Cx3lxqGV5C/ctXcv0a0FU1jsGJM2+w6inaeDjFHDzA+Eyx/P4Vfy0lcOhLpZMHSQGV1EHlVMD30VuGOpUW3O8vXr1Cw9cP5iNnBCjSwh0YgaKI0GeKODdC4waNrUOpgYI6E93vzuAadjcahvYmLbC4DqloOaRAa3+VwSa0wXddILUO6JXldWOO1HFzeZGC34JePq9VsAGh5Sj9tcptYLCDcYtdQzuCb0RgBOSsrK4lojRYKurSg+mJW7Tse5cJevcg0YcHSD6YI57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hDK4clf2ehzcz3vx/vduyaG0ZvLPlUlbNQSUyBbqf8=;
 b=CDUjAadYKWG1I6g/LdF2L04TQ42uqYLo6088tdhzYRX4NPbW/RKee0YuMprgMxdz05xVzqOr+Qj9wk6jIOQ30O8NxAU+EO8kWSo4qItvjR5WxGqeGNUNgHVH1aq49I+25VHstgbWfb5DtKLOcq4WSBAHcYtLaMP+nNPfqYvqfqQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5056.eurprd08.prod.outlook.com (10.255.159.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Tue, 18 Feb 2020 03:35:05 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 03:35:05 +0000
Date: Tue, 18 Feb 2020 11:34:56 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 02/34] drm/gem-fb-helper: Allow drivers to allocate
 struct drm_framebuffer on their own
Message-ID: <20200218033456.GA10425@jamwan02-TSP300>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-3-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191217145020.14645-3-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR02CA0213.apcprd02.prod.outlook.com (2603:1096:201:20::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24 via Frontend Transport; Tue, 18 Feb 2020 03:35:04 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf5788fd-41e5-4cd0-23c2-08d7b4239053
X-MS-TrafficTypeDiagnostic: VE1PR08MB5056:|VE1PR08MB5056:|HE1PR0802MB2619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB26194B3DEE20473559A4F67BB3110@HE1PR0802MB2619.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(396003)(136003)(376002)(39860400002)(366004)(189003)(199004)(9686003)(33716001)(86362001)(4326008)(33656002)(6486002)(6666004)(81166006)(81156014)(8676002)(6496006)(55236004)(52116002)(66476007)(66556008)(1076003)(316002)(66946007)(7416002)(26005)(30864003)(8936002)(54906003)(2906002)(5660300002)(6916009)(478600001)(186003)(956004)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5056;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9ZZ1807oj3LvgX54Lz6kYzOK0WBv/Dut8Wy3naIiNYtUJQDAYQh9wdrxA2YEqB7yyl6nrLc/SfM0SgtVj/G3BF7zUFjaznLRJQhnwDN+LZnA0Lej22j4TicE+xcw8Ypb/8B4cHmBGDpVawFD6d41O01qeZblSoIIZiG2WEhlGYim33/3zCg/lQ2CEhDzYkRb2MfDvjKz2g4fBeufcb8pASWqDO4IbzNUFhsOEkYcMrCQuxq2umndfahNOooRy6v0rvJopuH5QnVH0mxxHXSnycXdm/2SRSfTnYTRGR7ONreK7UUnIRxpl/bvNAFWLe9YxoixD9DOQH7pTbJEP7qqcXBDhxPorhbZyUbCuMEaWjSdcsuYhA0j1V6M9KLjp0zdxCl2Dtsutu/t6LYAmd12jxJTLG3+WJ3f63mLC093N6VKSDhfJy379XYp4vjGqgeQ
X-MS-Exchange-AntiSpam-MessageData: zGcBCzvvSOgkAQe0PWiZndbzOolGa5HN+EMSQB+PE/BCV36U5Gi0P16ckUjlMV9SFH8bCLbjcp2d1mfMXaEpZQCrvgwtv9lBQ07Z826xKrHyyLOvFkpnV1EeyDTnFk//T4YpNDczJCL1/k75Zw448g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5056
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(956004)(5660300002)(16526019)(356004)(336012)(4326008)(2906002)(186003)(1076003)(6862004)(33656002)(26005)(6666004)(86362001)(70206006)(316002)(81156014)(36906005)(6486002)(81166006)(54906003)(30864003)(26826003)(9686003)(70586007)(33716001)(6496006)(478600001)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2619;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f10a04d-9bf8-477b-e19c-08d7b4238b62
X-Forefront-PRVS: 031763BCAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vZwpnp05OTNlBBCF8PsU5lyx37VVazklRfvecWQs5w1lYmD1f5dhwHRMCRADcmrLKyBia5NOkiJOHwuVS8csXDC9k9Eo4EH8cWie7KJJ3KIZe+ieZViSOdRPazE6nIwcWvlmlyAoUsmfaAHhcC56Ug6vRGWUHQ/iRPGbjg8cXqrKgvtN7NpRKvbvwqm9lHmeOoW6AEWLFTLI4UDd4xe7xy5KJbbgHIHhSdMH1jDrK93G4XPP01iOWIpz/ByDLFK6JcCR1NIWSnsazQnh0bvOk/Cssl0H/MDXiOl/jYccTguvm9D+6c5Erfuo4fO3fu6HmCXX+XpT3TL8xh2C7bjTNLBa50InIdfJjVuEyxCJ1dkQefqWKG2iV6G68q/CC6hj6PAbM10uLlcYXRL3dLMIiYNlxsVli09QRyraB2x+VLvryLPhEFfmld0/99W43wL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 03:35:13.2876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5788fd-41e5-4cd0-23c2-08d7b4239053
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2619
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
On Tue, Dec 17, 2019 at 03:49:48PM +0100, Andrzej Pietrasiewicz wrote:
> Prepare tools for drivers which need to allocate a struct drm_framebuffer
> (or a container of struct drm_framebuffer) explicitly, before calling
> helpers. In such a case we need new helpers which omit allocating the
> struct drm_framebuffer and this patch provides them. Consequently, they
> are used also inside the helpers themselves.
> 
> The interested drivers will likely need to be able to perform object
> lookups and size checks in separate invocations and this patch provides
> that as well. Helpers themselves are updated, too.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 216 ++++++++++++++-----
>  include/drm/drm_gem_framebuffer_helper.h     |  17 ++
>  2 files changed, 181 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index b9bcd310ca2d..b3494f6b66bb 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -54,6 +54,69 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  
> +/**
> + * drm_gem_fb_init_with_funcs() - Initialize an already allocated framebuffer
> + * @fb: Framebuffer
> + * @dev: DRM device
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + * @obj: GEM objects to be assigned to the framebuffer
> + * @num_planes: number of planes
> + * @funcs: vtable to be used for the framebuffer object
> + *
> + * This variant of the function allows passing a custom vtable.
> + *
> + * Returns:
> + * 0 on success or a negative error code
> + */
> +int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
> +			       struct drm_device *dev,
> +			       const struct drm_mode_fb_cmd2 *mode_cmd,
> +			       struct drm_gem_object **obj,
> +			       unsigned int num_planes,
> +			       const struct drm_framebuffer_funcs *funcs)
> +{
> +	int ret, i;
> +
> +	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +
> +	for (i = 0; i < num_planes; i++)
> +		fb->obj[i] = obj[i];
> +
> +	ret = drm_framebuffer_init(dev, fb, funcs);
> +	if (ret)
> +		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
> +
> +static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
> +	.destroy	= drm_gem_fb_destroy,
> +	.create_handle	= drm_gem_fb_create_handle,
> +};
> +
> +/**
> + * drm_gem_fb_init() - Initialize an already allocated framebuffer
> + * @fb: Framebuffer
> + * @dev: DRM device
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + * @obj: GEM objects to be assigned to the framebuffer
> + * @num_planes: number of planes
> + *
> + * This variant of the function uses a default vtable.
> + *
> + * Returns:
> + * 0 on success or a negative error code
> + */
> +int drm_gem_fb_init(struct drm_framebuffer *fb,
> +		    struct drm_device *dev,
> +		    const struct drm_mode_fb_cmd2 *mode_cmd,
> +		    struct drm_gem_object **obj, unsigned int num_planes)
> +{
> +	return drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes, &drm_gem_fb_funcs);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_init);
> +
>  static struct drm_framebuffer *
>  drm_gem_fb_alloc(struct drm_device *dev,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd,
> @@ -61,21 +124,14 @@ drm_gem_fb_alloc(struct drm_device *dev,
>  		 const struct drm_framebuffer_funcs *funcs)
>  {
>  	struct drm_framebuffer *fb;
> -	int ret, i;
> +	int ret;
>  
>  	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
>  	if (!fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> -
> -	for (i = 0; i < num_planes; i++)
> -		fb->obj[i] = obj[i];
> -
> -	ret = drm_framebuffer_init(dev, fb, funcs);
> +	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes, funcs);
>  	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
> -			      ret);
>  		kfree(fb);
>  		return ERR_PTR(ret);
>  	}
> @@ -144,59 +200,29 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
>  			     const struct drm_framebuffer_funcs *funcs)
>  {
> -	const struct drm_format_info *info;
>  	struct drm_gem_object *objs[4];
>  	struct drm_framebuffer *fb;
> -	int ret, i;
> -
> -	info = drm_get_format_info(dev, mode_cmd);
> -	if (!info)
> -		return ERR_PTR(-EINVAL);
> -
> -	for (i = 0; i < info->num_planes; i++) {
> -		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> -		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> -		unsigned int min_size;
> +	int ret, num_planes;
>  
> -		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
> -		if (!objs[i]) {
> -			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> -			ret = -ENOENT;
> -			goto err_gem_object_put;
> -		}
> -
> -		min_size = (height - 1) * mode_cmd->pitches[i]
> -			 + drm_format_info_min_pitch(info, i, width)
> -			 + mode_cmd->offsets[i];
> +	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +	num_planes = ret;
>  
> -		if (objs[i]->size < min_size) {
> -			drm_gem_object_put_unlocked(objs[i]);
> -			ret = -EINVAL;
> -			goto err_gem_object_put;
> -		}
> -	}
> +	ret = drm_gem_fb_size_check(dev, mode_cmd, objs);
> +	if (ret)
> +		fb = ERR_PTR(ret);
> +	else
> +		fb = drm_gem_fb_alloc(dev, mode_cmd, objs, num_planes, funcs);
>  
> -	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
> -	if (IS_ERR(fb)) {
> -		ret = PTR_ERR(fb);
> -		goto err_gem_object_put;
> -	}
> +	if (IS_ERR(fb))
> +		for (num_planes--; num_planes >= 0; num_planes--)
> +			drm_gem_object_put_unlocked(objs[num_planes]);
>  
>  	return fb;
> -
> -err_gem_object_put:
> -	for (i--; i >= 0; i--)
> -		drm_gem_object_put_unlocked(objs[i]);
> -
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
>  
> -static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
> -	.destroy	= drm_gem_fb_destroy,
> -	.create_handle	= drm_gem_fb_create_handle,
> -};
> -
>  /**
>   * drm_gem_fb_create() - Helper function for the
>   *                       &drm_mode_config_funcs.fb_create callback
> @@ -228,6 +254,92 @@ drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create);
>  
> +/**
> + * drm_gem_fb_lookup() - Helper function for use in
> + *			 &drm_mode_config_funcs.fb_create implementations
> + * @dev: DRM device
> + * @file: DRM file that holds the GEM handle(s) backing the framebuffer
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + *
> + * This function can be used to look up the objects for all planes.
> + * In case an error is returned all the objects are put by the
> + * function before returning.
> + *
> + * Returns:
> + * Number of planes on success or a negative error code on failure.
> + */
> +int drm_gem_fb_lookup(struct drm_device *dev,

[nit-pick] How about name it to drm_gem_fb_objs_lookup() ?

> +		      struct drm_file *file,
> +		      const struct drm_mode_fb_cmd2 *mode_cmd,
> +		      struct drm_gem_object **objs)
> +{
> +	const struct drm_format_info *info;
> +	int ret, i;
> +
> +	info = drm_get_format_info(dev, mode_cmd);
> +	if (!info)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info->num_planes; i++) {
> +		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
> +		if (!objs[i]) {
> +			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> +			ret = -ENOENT;
> +			goto err_gem_object_put;
> +		}
> +	}
> +
> +	return i;
> +
> +err_gem_object_put:
> +	for (i--; i >= 0; i--)
> +		drm_gem_object_put_unlocked(objs[i]);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
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
> +	const struct drm_format_info *info;
> +	int i;
> +
> +	info = drm_get_format_info(dev, mode_cmd);
> +	if (!info)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info->num_planes; i++) {
> +		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> +		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> +		unsigned int min_size;
> +
> +		min_size = (height - 1) * mode_cmd->pitches[i]
> +			 + drm_format_info_min_pitch(info, i, width)
> +			 + mode_cmd->offsets[i];
> +
> +		if (objs[i]->size < min_size)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
> +
>  static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
>  	.destroy	= drm_gem_fb_destroy,
>  	.create_handle	= drm_gem_fb_create_handle,
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index d9f13fd25b0a..c85d4b152e91 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -14,10 +14,27 @@ struct drm_simple_display_pipe;
>  
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane);
> +int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
> +			       struct drm_device *dev,
> +			       const struct drm_mode_fb_cmd2 *mode_cmd,
> +			       struct drm_gem_object **obj,
> +			       unsigned int num_planes,
> +			       const struct drm_framebuffer_funcs *funcs);
> +int drm_gem_fb_init(struct drm_framebuffer *fb,
> +		    struct drm_device *dev,
> +		    const struct drm_mode_fb_cmd2 *mode_cmd,
> +		    struct drm_gem_object **obj, unsigned int num_planes);
>  void drm_gem_fb_destroy(struct drm_framebuffer *fb);
>  int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  			     unsigned int *handle);
>  
> +int drm_gem_fb_lookup(struct drm_device *dev,
> +		      struct drm_file *file,
> +		      const struct drm_mode_fb_cmd2 *mode_cmd,
> +		      struct drm_gem_object **objs);
> +int drm_gem_fb_size_check(struct drm_device *dev,
> +			  const struct drm_mode_fb_cmd2 *mode_cmd,
> +			  struct drm_gem_object **objs);
>  struct drm_framebuffer *
>  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>

James.

> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
