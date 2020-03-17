Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D81877FC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 04:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348386E029;
	Tue, 17 Mar 2020 03:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30048.outbound.protection.outlook.com [40.107.3.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C786E029
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 03:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFrReFZD7GgJ+sNFaFgexdWEyERDA+kKUAH5d7U+tOs=;
 b=WPYP4WzqdrLf+6Shvnr0SF8iEtllYXeX5lQZe8GKQxEPuGrD731uVqkSGvs0q+Sg3lRiJIc3HxrNkrLnMclEgV+Mp0Qk1bip0G2oX60mbEIXVRS339lYO7qdLOn3Vz2aVdYiRbhMdzyvrQfO8bj6mWKiwGFAUrX4eVHY8F+SUfc=
Received: from AM0PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:208:15::24) by HE1PR0802MB2267.eurprd08.prod.outlook.com
 (2603:10a6:3:ce::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13; Tue, 17 Mar
 2020 03:08:54 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::75) by AM0PR0402CA0011.outlook.office365.com
 (2603:10a6:208:15::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend
 Transport; Tue, 17 Mar 2020 03:08:54 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Tue, 17 Mar 2020 03:08:53 +0000
Received: ("Tessian outbound efdea641ed36:v42");
 Tue, 17 Mar 2020 03:08:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 276e1ae7977ce5c8
X-CR-MTA-TID: 64aa7808
Received: from e0f5806c79a5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 051D07D5-100E-43B9-9165-1E46DDE825E8.1; 
 Tue, 17 Mar 2020 03:08:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0f5806c79a5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Mar 2020 03:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtWFsIOeEYnOUD93axS+6+Q396+pjoeBB7gPNCkHxRC0XB+tXS1Zk07v8zXTtmUy4xKZ+P+BivwdfS+nKFC0vXBdu8Vm8EwhpmFVA8GH4mHyMO6i+5/uyR1h9zISbFJ82kI0wEiBpVNdUhg58zX0t3oC9DuA1gc4N1tcnAaxTX0UVVV94Svb1mPsa1Ic7RddXIU8rz4GvEfKfF622xSm8NvUCR8xPm0RdYL33Y5PZEjo0YiAoTMZFzMn1Jd6jxnI7Ypil0S6mcYv7ebf0WbZVWiIbl85zQL1Wp5iO6Yepx6QigjBa37tCqf5boQVNWe0T6gta7c/Junpeq8PVJG5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFrReFZD7GgJ+sNFaFgexdWEyERDA+kKUAH5d7U+tOs=;
 b=ZdHxGYqY81UkrXNw8APtb7bs94HX70v+51CFifR2HNFKyfrBLy1bxhqN6QaX9cJbGonrwv5p7HKqRJHScXUeSW45S5oyki0+61x6i6f5niQshXC0M4LpcI8yWWMnLiF66MIWBA91kTBnJs3xzrFK5+0I0yTU01PhIP3t3zX+O+sKHEIjTfMkM3yv+rQyA9arNiNHeu3b6Vr+LtxCb6uKsh65MjNgM1Lt9xmpNmJjkLELRrCEYN2dFVN9ctZWviHVarUdgbw3dl8lxYcs/MZvlAMp98JA7qTCIAo3cWanW7hTXKV6nzIzgfUUwV5i2zTR6i/9zzfol93WLTMGsKhCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFrReFZD7GgJ+sNFaFgexdWEyERDA+kKUAH5d7U+tOs=;
 b=WPYP4WzqdrLf+6Shvnr0SF8iEtllYXeX5lQZe8GKQxEPuGrD731uVqkSGvs0q+Sg3lRiJIc3HxrNkrLnMclEgV+Mp0Qk1bip0G2oX60mbEIXVRS339lYO7qdLOn3Vz2aVdYiRbhMdzyvrQfO8bj6mWKiwGFAUrX4eVHY8F+SUfc=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4813.eurprd08.prod.outlook.com (10.255.115.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Tue, 17 Mar 2020 03:08:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2d29:e139:a5a5:f08b]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2d29:e139:a5a5:f08b%3]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 03:08:45 +0000
Date: Tue, 17 Mar 2020 11:08:39 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv7 1/6] drm/core: Allow drivers allocate a subclass of
 struct drm_framebuffer
Message-ID: <20200317030839.GA11556@jamwan02-TSP300>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-2-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20200311145541.29186-2-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR03CA0044.apcprd03.prod.outlook.com
 (2603:1096:202:17::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HK2PR03CA0044.apcprd03.prod.outlook.com (2603:1096:202:17::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.7 via Frontend Transport; Tue, 17 Mar 2020 03:08:44 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55514256-51ca-490e-857f-08d7ca208670
X-MS-TrafficTypeDiagnostic: VE1PR08MB4813:|VE1PR08MB4813:|HE1PR0802MB2267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2267F60DFFA5D15A26DE467FB3F60@HE1PR0802MB2267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:454;OLM:454;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(366004)(396003)(376002)(136003)(199004)(9686003)(186003)(8936002)(478600001)(16526019)(6666004)(4326008)(8676002)(52116002)(81166006)(316002)(54906003)(6496006)(1076003)(55236004)(26005)(81156014)(6916009)(6486002)(7416002)(33716001)(86362001)(66946007)(5660300002)(2906002)(66476007)(33656002)(66556008)(956004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4813;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: TUGev1bQZyQf6fPeCokjakYcMdEPs0V42Ax+E83LaSrMsHZaHwnfRlbJh9VwMsMjfhG3+DU9jcBLqOw1dgisxKPpTCRLdkBDU+5SoDJy6HqiJG3JfwOBZBQm56nVQOLPMJLZDH9Y+Sb96vS/BFo/v0e+u6l/xZhQnixEFFOXrBaMby6TQuV2lRdEhLCBh55IKqKFkbokEFzrTssEeScaFWM6fr0ZrZTT0qa4rIlW7AZcGJvAI6maZeWSLb5XOHhq9v7T1iL8Jm6nv/eK3GLDlv991tBLcw0kgqimtmJGmsTWK6bRQJB+g4QJGbXm4PddqkwOxf3ie44mlRJdx4YXaoZaICU79ljGURt5z1V9UmpurSJpWHVrbGwqHBmnNn3uS4ls8gF3KKZq8Wp+bLlSWG7dprbCRCLdhz+Fg5ly30OUF3wBpFFtSKPhVViMd0e8
X-MS-Exchange-AntiSpam-MessageData: knzW01p/Yxv97ww2M4ISI091S9A50xbNczZ6RWYEfzTDwinL290UQM62NYwn5LbAaV3+BBbnUIKbzyIvOkQumMv9zDwoVp1BdJlSUrjm+s2bmSc+OWeeODzVXkYnfWiNd3JxlWylw0VjnDHzQQeyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4813
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(346002)(136003)(396003)(39860400002)(199004)(46966005)(6486002)(6496006)(2906002)(36906005)(5660300002)(316002)(956004)(33656002)(186003)(16526019)(336012)(26005)(54906003)(478600001)(26826003)(4326008)(70586007)(70206006)(6862004)(33716001)(6666004)(1076003)(47076004)(9686003)(356004)(8676002)(81166006)(81156014)(86362001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2267;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ddc9b70-c333-46c7-e7bc-08d7ca208114
X-Forefront-PRVS: 0345CFD558
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MueFfTFn6ve3kkJNWCSH2DjN2BhgEc9ojJ+j2g9GZjHUHoVN+ggJ/2aSaC1nuVR40naSKXrCgthtlGyQUawhb4eyNBcDDbl3Y/7ppO6bIjAFDXGOZH2EubRzIlePDcwU8J/na0nfgi+Es88ZyIUAy1v3LI1yeAImETT+AqhP0Ba5lIK9UphvRGH6fagjtO8Hor3sYuSSGU52W99h1Qn2PmkUz8YYSKkrb+jURG8JSNNPdSzpOAFQzKSJddOgEWdoae6R0OiinphPRj7g58Yz6vj73Gp8xya0fFvVPnjRJLPYl07TYDUVzWy/rMeKRyViBK7YxeYO+RpNkUGVMg1lYDIfTUbnbSeFNqoMImwHiDdbDZSjS0NJw2/KhLCs8lbhtCe1iteFMQBNyMKKaMxsXjHkREiMiyDH0UpXaXNx+pvRPO+k42d4eCZk4gTav+x/tljGLhfdBq3uY4IBo6d3KLANOhdbehTUtzhWRytInpZMm/XKLa+gYmYz6sAGX+d1YribZcx/Ta3rerp9ex6rXA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 03:08:53.8479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55514256-51ca-490e-857f-08d7ca208670
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2267
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

On Wed, Mar 11, 2020 at 10:55:36PM +0800, Andrzej Pietrasiewicz wrote:
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

Looks good to me. :)

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

Thanks
James

> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 87 ++++++++++++++------
>  include/drm/drm_gem_framebuffer_helper.h     |  5 ++
>  2 files changed, 67 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 3a7ace19a902..86c1907c579a 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -54,19 +54,15 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  
> -static struct drm_framebuffer *
> -drm_gem_fb_alloc(struct drm_device *dev,
> +static int
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
> @@ -76,10 +72,9 @@ drm_gem_fb_alloc(struct drm_device *dev,
>  	if (ret) {
>  		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
>  		kfree(fb);
> -		return ERR_PTR(ret);
>  	}
>  
> -	return fb;
> +	return ret;
>  }
>  
>  /**
> @@ -123,10 +118,13 @@ int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
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
> @@ -134,23 +132,26 @@ EXPORT_SYMBOL(drm_gem_fb_create_handle);
>   * This function can be used to set &drm_framebuffer_funcs for drivers that need
>   * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
>   * change &drm_framebuffer_funcs. The function does buffer size validation.
> + * The buffer size validation is for a general case, though, so users should
> + * pay attention to the checks being appropriate for them or, at least,
> + * non-conflicting.
>   *
>   * Returns:
> - * Pointer to a &drm_framebuffer on success or an error pointer on failure.
> + * Zero or a negative error code.
>   */
> -struct drm_framebuffer *
> -drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> -			     const struct drm_mode_fb_cmd2 *mode_cmd,
> -			     const struct drm_framebuffer_funcs *funcs)
> +int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> +			       struct drm_framebuffer *fb,
> +			       struct drm_file *file,
> +			       const struct drm_mode_fb_cmd2 *mode_cmd,
> +			       const struct drm_framebuffer_funcs *funcs)
>  {
>  	const struct drm_format_info *info;
>  	struct drm_gem_object *objs[4];
> -	struct drm_framebuffer *fb;
>  	int ret, i;
>  
>  	info = drm_get_format_info(dev, mode_cmd);
>  	if (!info)
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> @@ -175,19 +176,55 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  		}
>  	}
>  
> -	fb = drm_gem_fb_alloc(dev, mode_cmd, objs, i, funcs);
> -	if (IS_ERR(fb)) {
> -		ret = PTR_ERR(fb);
> +	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
> +	if (ret)
>  		goto err_gem_object_put;
> -	}
>  
> -	return fb;
> +	return 0;
>  
>  err_gem_object_put:
>  	for (i--; i >= 0; i--)
>  		drm_gem_object_put_unlocked(objs[i]);
>  
> -	return ERR_PTR(ret);
> +	return ret;
> +}
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
> +	struct drm_framebuffer *fb;
> +	int ret;
> +
> +	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> +	if (!fb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
> +	if (ret) {
> +		kfree(fb);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return fb;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
>  
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index d9f13fd25b0a..c029c1618661 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -18,6 +18,11 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb);
>  int drm_gem_fb_create_handle(struct drm_framebuffer *fb, struct drm_file *file,
>  			     unsigned int *handle);
>  
> +int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> +			       struct drm_framebuffer *fb,
> +			       struct drm_file *file,
> +			       const struct drm_mode_fb_cmd2 *mode_cmd,
> +			       const struct drm_framebuffer_funcs *funcs);
>  struct drm_framebuffer *
>  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd,
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
