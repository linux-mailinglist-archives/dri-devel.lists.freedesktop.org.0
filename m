Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F43160A9E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 07:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569F6E4E6;
	Mon, 17 Feb 2020 06:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FA36E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lc/zFcvJfmUaIdXHyLSyodPXwGB+Z8nU041S2jZIcI=;
 b=4n+QwgjxO1RXrucIA+MggdtuCBquMJAplMm5p/tfWq6nCrgDjVbUziMEYIg6z9TGJisgcn+YIGze+ZmCf9L3o2/hq96ynmvkhm99eQUw7Jl8OkPnAQjv8vTFgobVkMgdXKAqHFERTQ6XVC0q+jJ2n9CaXvPwhqG9nXF7SKOe9RQ=
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by DBBPR08MB4853.eurprd08.prod.outlook.com (2603:10a6:10:d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 06:39:53 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 06:39:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 06:39:53 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42");
 Mon, 17 Feb 2020 06:39:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7732dafeda8b225
X-CR-MTA-TID: 64aa7808
Received: from 6beec001024a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F0D8B37-42A9-4F60-9F85-975B802E7446.1; 
 Mon, 17 Feb 2020 06:39:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6beec001024a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 06:39:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL6VE1+F6DcnPcvB1m12Zir0eCauozhMLsbLDEF0DSuplqew410pITDZpaG6m71LuEHZC9lNMMzGbTqme7PkH9qbAStDBfif2ddpxpESsTQwggZWO9V1xAynJSeonc6FeInNI2jGooKZ3DHvvujm//8IIKQ9hohi8emxKOv+SorEoknUYlJ3A7V9uUpy1txybZCwImx5gGi5Ls6Y3Ko3dmYleCK49Lrycysfs4lfSpZ2EWZraA0lQnwXaUxfLMujdK6DdUUAN/fHvhU6jFnW8joA3z0lxU6GS4PHcmfNWw3/KBRtdGizAfS2pJPRe4zD9InPUYWIGorTbjUJeK/CRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lc/zFcvJfmUaIdXHyLSyodPXwGB+Z8nU041S2jZIcI=;
 b=Y0PdoqwLx3YWUGKUojP1z4LDQ9WKFraqjloEsHkC0HsSLMMYbMdIxNSxSLPDAoy2rOSjBSeiXMu5ZRiHqLfyqnITf1ANuC4dJ58U+BN4zG67MbjePN0BsE6LiE6XPiiNKZTV8g8JjvbDHVXfQSl3gEZ0DcpgBU2kuZcqoVTJygLsqqa+GoEQw6g5JgL6hK8XGEy5P/B3yVCjZjZG7k3XEJGIJ8xN44IxUJpPKRmBygCcgr2OUuitF2Zq7M68r39zbPyR+mYpmR1+3aY9EYOv3JkNLtKh992yxsBtn2iyHae5uu43fjmrW2g+vKT5MkyUnQgnZwiKbdA77mcLXyvyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lc/zFcvJfmUaIdXHyLSyodPXwGB+Z8nU041S2jZIcI=;
 b=4n+QwgjxO1RXrucIA+MggdtuCBquMJAplMm5p/tfWq6nCrgDjVbUziMEYIg6z9TGJisgcn+YIGze+ZmCf9L3o2/hq96ynmvkhm99eQUw7Jl8OkPnAQjv8vTFgobVkMgdXKAqHFERTQ6XVC0q+jJ2n9CaXvPwhqG9nXF7SKOe9RQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4687.eurprd08.prod.outlook.com (10.255.113.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Mon, 17 Feb 2020 06:39:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 06:39:46 +0000
Date: Mon, 17 Feb 2020 14:39:39 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,03/36] drm/gem-fb-helper: Allow drivers to allocate
 struct drm_framebuffer on their own
Message-ID: <20200217063939.GA4624@jamwan02-TSP300>
References: <20191213155907.16581-4-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-4-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 06:39:45 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3641d96a-ab60-493a-c519-08d7b3743223
X-MS-TrafficTypeDiagnostic: VE1PR08MB4687:|VE1PR08MB4687:|DBBPR08MB4853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB485386F1F9103D383606516AB3160@DBBPR08MB4853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:446;OLM:446;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(6486002)(2906002)(956004)(9686003)(33656002)(6666004)(66556008)(54906003)(52116002)(8936002)(6496006)(66476007)(66946007)(316002)(55236004)(16526019)(86362001)(6916009)(186003)(33716001)(26005)(30864003)(4326008)(81166006)(5660300002)(8676002)(81156014)(1076003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4687;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +Tp0PvZn1HXjD5yllRZeY9WUKiq3Uap61uPXSgUVy4sUVIw1a4ZNTnIBogBiFWWzIxZL9pB/HZmGALAYAFv91fLm7WQP4RDzV2vLV5R1odtkIS6d7sBcSdkBfnoEjuT3HxyS9iCBu5NLIqbzrx9r5f/CoPuUI50CpDtkgbmgx6HT/yTRHZS+rVNLanb/pEhCznw8IVca6g9GpgQ51uDmIYjam6m67p0GGTDcmaP7VAPznLozZM8bOweML3JcQCSGOgOgoyFJ3Oa3Qhwc/9URW4gl5RiBl+/NLKEvLIs/XPFqWyPJExywxSuaQLF8kXtd9qFEQU0ul5iQn+Md6Q63qFzYk7riQAz/sY/ntC2z5h8yCR9FNUjihN/vwI+jq2gDFxGszYZnUNgNTugQBEIyai4DGMZDncM1mhfO4fXsQHxydW+FLFCwK+TNJqIFWEiv
X-MS-Exchange-AntiSpam-MessageData: ZH4ubmasat7m63zHb+Sl2+Ni4hJCZUjXiIiR3/w1BvS0NjhaRWcaU5607OwVP9r87YV4mgmCf+v8zkGvaC/G1OSZ+NKZc65FgzN+U23RB6kWam5Mf57+q/5pUq38eTAE7hY38h0xSsfFdYtmjivDbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4687
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(6486002)(956004)(2906002)(336012)(9686003)(70206006)(33656002)(54906003)(6666004)(8936002)(356004)(6496006)(316002)(36906005)(70586007)(16526019)(86362001)(186003)(33716001)(30864003)(4326008)(478600001)(26826003)(26005)(5660300002)(81166006)(81156014)(6862004)(8676002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4853;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f085c7c4-dc88-4208-41d7-08d7b3742d98
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24CubisM5y5EHc4RN7iRe2BPcrCn1hwv0zhi/auJ8ZBSyR+x9aFqvwmPzFyfhk+k9Mv6wRdoHozbqEOwWsCylZRAaP2/YobQnmrZNEyr6TK8cMJ9/OZPkxLr9c6AD7wWKZiPsCKuRNEW4b+kpprOYyazFZumssFbRbA0LF/aOdDzfzkyrE0LQRkjSQlLOklJ5EAZ7k3M4FhKGgmpn7U2q6MnXNSBXOjoQuL0DLbZ9bjvGVFcoGBJ56e4pXv76aMTuNoEKeRy1Dx+fdnY8WNUjmzS22hscwt328EPLGfhejROjv3ntfgrNrMDUw558hJz0nLSZ1vnjFId2cRAoJ+iUgbwUNTh16KtW+24/RjSH2hQwP8vtHPnTT2KgXxe24LQ1eChC5hmAJm88DOC2zkppgE7x5SQysOqxD6A7cmjHkGfnsTXZo28vJxZcuIV+yuD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 06:39:53.3586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3641d96a-ab60-493a-c519-08d7b3743223
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4853
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

Good work.

It's a real useful patch, with it seems most vendor-specific fb_create
can be simplified by these helper funcs.

On Fri, Dec 13, 2019 at 04:58:34PM +0100, Andrzej Pietrasiewicz wrote:
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
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 184 ++++++++++++++-----
>  include/drm/drm_gem_framebuffer_helper.h     |  17 ++
>  2 files changed, 153 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index b9bcd310ca2d..787edb9a916b 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -54,6 +54,44 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  
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
> +		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
> +			      ret);
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
> +int drm_gem_fb_init(struct drm_framebuffer *fb,
> +		    struct drm_device *dev,
> +		    const struct drm_mode_fb_cmd2 *mode_cmd,
> +		    struct drm_gem_object **obj, unsigned int num_planes)
> +{
> +	return drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes,
> +					  &drm_gem_fb_funcs);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_init);
> +
>  static struct drm_framebuffer *
>  drm_gem_fb_alloc(struct drm_device *dev,
>  		 const struct drm_mode_fb_cmd2 *mode_cmd,
> @@ -61,21 +99,15 @@ drm_gem_fb_alloc(struct drm_device *dev,
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
> +	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes,
> +					 funcs);
>  	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
> -			      ret);
>  		kfree(fb);
>  		return ERR_PTR(ret);
>  	}
> @@ -124,79 +156,135 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  EXPORT_SYMBOL(drm_gem_fb_create_handle);
>  
>  /**
> - * drm_gem_fb_create_with_funcs() - Helper function for the
> - *                                  &drm_mode_config_funcs.fb_create
> - *                                  callback
> + * drm_gem_fb_lookup() - Helper function for use in
> + *			 &drm_mode_config_funcs.fb_create implementations
>   * @dev: DRM device
>   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
>   * @mode_cmd: Metadata from the userspace framebuffer creation request
> - * @funcs: vtable to be used for the new framebuffer object
>   *
> - * This function can be used to set &drm_framebuffer_funcs for drivers that need
> - * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
> - * change &drm_framebuffer_funcs. The function does buffer size validation.
> + * This function can be used to look up the objects for all planes.
> + * In case an error is returned all the objects are put by the
> + * function before returning.
>   *
>   * Returns:
> - * Pointer to a &drm_framebuffer on success or an error pointer on failure.
> + * Number of planes on success or a negative error code on failure.
>   */
> -struct drm_framebuffer *
> -drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> -			     const struct drm_mode_fb_cmd2 *mode_cmd,
> -			     const struct drm_framebuffer_funcs *funcs)
> +int drm_gem_fb_lookup(struct drm_device *dev,

[nit-pick] Maybe name it to drm_gem_fb_objs_lookup()

> +		      struct drm_file *file,
> +		      const struct drm_mode_fb_cmd2 *mode_cmd,
> +		      struct drm_gem_object **objs)
>  {
>  	const struct drm_format_info *info;
> -	struct drm_gem_object *objs[4];
> -	struct drm_framebuffer *fb;
>  	int ret, i;
>  
>  	info = drm_get_format_info(dev, mode_cmd);
>  	if (!info)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	for (i = 0; i < info->num_planes; i++) {
> -		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> -		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> -		unsigned int min_size;
> -
>  		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
>  		if (!objs[i]) {
>  			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
>  			ret = -ENOENT;
>  			goto err_gem_object_put;
>  		}
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
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
>  			 + mode_cmd->offsets[i];
>  
> -		if (objs[i]->size < min_size) {
> -			drm_gem_object_put_unlocked(objs[i]);
> -			ret = -EINVAL;
> -			goto err_gem_object_put;
> -		}
> +		if (objs[i]->size < min_size)
> +			return -EINVAL;
>  	}
>  
> -	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
> -	if (IS_ERR(fb)) {
> -		ret = PTR_ERR(fb);
> -		goto err_gem_object_put;
> -	}
> +	return 0;
>  
> -	return fb;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_size_check);
>  
> -err_gem_object_put:
> -	for (i--; i >= 0; i--)
> -		drm_gem_object_put_unlocked(objs[i]);
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
> +	struct drm_gem_object *objs[4];
> +	struct drm_framebuffer *fb;
> +	int ret, num_planes;
> +
> +	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +	num_planes = ret;
> +
> +	ret = drm_gem_fb_size_check(dev, mode_cmd, objs);
> +	if (ret)
> +		fb = ERR_PTR(ret);
> +	else
> +		fb = drm_gem_fb_alloc(dev, mode_cmd, objs, num_planes, funcs);
>  
> -	return ERR_PTR(ret);
> +	if (IS_ERR(fb))
> +		for (num_planes--; num_planes >= 0; num_planes--)
> +			drm_gem_object_put_unlocked(objs[num_planes]);
> +
> +	return fb;
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
