Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC12B9F9B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 02:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48646E83E;
	Fri, 20 Nov 2020 01:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0EB6E83E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:19:09 +0000 (UTC)
IronPort-SDR: UFomMcF95CgID23Yp6BY5myKt4yArYsA534GphkJ+v1xh1se0DWoFgoBlbmfw8InTJa45McAqT
 9x/DBSpgTVqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="189492547"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="189492547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 17:19:08 -0800
IronPort-SDR: hPGI83Cyr34NWDXwcn5KIu7zsyvPyjcXPzEu2OHUXnLL/8FBUQVfkSERA4+d4CjweH1/Zy3PJk
 dOk8nKYX5M9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="545251856"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 19 Nov 2020 17:19:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 17:19:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Nov 2020 17:19:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 19 Nov 2020 17:19:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQvFNxYM9rUNf8jMLbJhbbNqAAaepyGhXMxpb1aUTRLSZVmRF8FVLubBwydonkvfQ/ihHdbX4b1X7eNkme87Zu7cjgnQCRsNIgESs6wLXuRTINQNnRc4OTZ10aASYhvbXlLM8X566pLtmVdz8X3+xwNFTc/NuNzk3LoJDp+WmCNi+H/yxfKl6eENqoWExSWJUzrG7UFNDoi1+rDMcbwmbPH+FlnyAjU57ibFQOtO0mPpcbX1GVi6aUi7Cx15eTmelCkXTzm30dOLyJLJM73kNOJPQha/UcOoA5JupDFiJC0BBASSLCJsCDIC7B7NtM/dS51nUwk2XZ0dGO2HRQTt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uktefD+j1KyPntWuEKpZAHPGq2aY8dga8QuG3DuXRvU=;
 b=jHQZQw9f3o1tI4hKimVYLQdnlouUSIK88bdAWtrVwkWRn5OM2BJOMhOkRdhBFGTjX+psHaCLS+AsLQfbZCdjTOJRIY/ilBiQWBE1QEEbnYhzhdqDGa+uiUMNZIR//JHRtGJi5LlTgKI2nZyMW3jtiDaKIk7PxtWNK7K2ACu9uYvSO0RIKkpRKyqR4MqIq9PYCJfGUoIH3j57nXQfEQd+QQ7sK78OHYl4txy15op68YgiQ9tiLa5R5VVuqpIQOhGftRxOO6MtHOgs28bgYfmzpHiL7wDGYgritxWxbQKwakEUhCjlPaSlpZCzRN9By8UgwtZOA3iEVSyJaVvuhfCjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uktefD+j1KyPntWuEKpZAHPGq2aY8dga8QuG3DuXRvU=;
 b=oYjFFFwKEAH71Bzwzcc0bzYYrGdUlPT7Yw0mEHCSG/ucrKEreUboWaPh7J74ifaPee5UYibPu4GHD9tlacYbLxgwkwDivgF6JXtgPjhRCLczCOzHg6I2qzgs5R9heDGL8ZjHOrQNSs6CyA3LC0eS+4wm/dwNayFrbmplpqs6Ab4=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3910.namprd11.prod.outlook.com (2603:10b6:a03:185::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Fri, 20 Nov
 2020 01:19:06 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3589.025; Fri, 20 Nov 2020
 01:19:06 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH] drm/kmb: Remove an unnecessary NULL check
Thread-Topic: [PATCH] drm/kmb: Remove an unnecessary NULL check
Thread-Index: AQHWvLJbMwK5pifWsE+YWksAFZ5UE6nQPLCg
Date: Fri, 20 Nov 2020 01:19:06 +0000
Message-ID: <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201117072137.GB1111239@mwanda>
In-Reply-To: <20201117072137.GB1111239@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c407e3cb-f4b2-46a1-8286-08d88cf2466b
x-ms-traffictypediagnostic: BY5PR11MB3910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3910EB4EF1F4588C0F227C998CFF0@BY5PR11MB3910.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xw3Fo58A+TXo209nZ1yYoz+YymfMG7OwMXQpqxoAVQ3iX2sGH3AOQxBr8gt8fifMfSvGdT4i9opAnrsokIylmYHqVgRyJtrKDiHIdsCRuBGkek53wjWMI+YrhXdRY5ExPL7eaxHlaKEJnIsUvBeOp8uvsR+3GeLWkEB6Kazq+KBGzk14Jc79QAkYGJzb08Pj5ZfibQbp8FdCgbuv6tKPO2mxTuA4XNKoWn2CEBMxbq2P3jrvKSf6no/KcPX5IYddVIO8E7qeK7WqxFfL824ifCr/8C1lOtqoSw2l+S8yX4JCTLmH8k7mQi8EcKJVGc9e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(83380400001)(6506007)(9686003)(64756008)(7696005)(54906003)(6916009)(53546011)(478600001)(186003)(316002)(26005)(55016002)(66476007)(52536014)(8676002)(8936002)(2906002)(71200400001)(86362001)(5660300002)(66556008)(4326008)(33656002)(66946007)(66446008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: GeQ0rgD98lQkMivyUHHGCiw4sA3NI5CmHZqptm4gPBFNSEX5KUmg0sFY5GxiRSLJdOcXVD5ab54vRI7+scA/7/9iMxtJ7ifqESPv0hxd3nLVJc4g2vrClTbcnw9QinPuT1c4XO8AdLmfAIw9lyAYIY92jaGUIvIZxRHfyMdiDDN2Y7lrigMxpk7xXQHXXg0PniHT4StbOZwyfraEjcR7mfJ/pEWe4S4LVqOD4XSoKCQtrBBlBOU9sQmkHItqP3JdeOTIbDuYKs/CbsWJxtKCihBHxYLkOr8LqsAfqoIISHy8WaQmKwJzEH9oJZd+cAy1CK7fUqBGF0fMlYBrYFuGLNVX+6WvR6Cmlxi+4HavNJURd8WcFO/C+dL4VsqUVQxLMkFZeYIf3iYp1z+fC2sjmqykMUp1XGeuilex4sep9LGfQ2dkdq0/5AJA1ZiOMrJCwSDLYrUG5BMvLD1OYe20+xZNMN2UF0wy0mT0KO1U/47d7+2Zzci2NK68BbhJ6dZRQCxrk00a+e4JfcE7+Q4XAt64GAP3PTdOjvPU3nqQy3wCP57JRmG+h3EbhuHSr3m7CojlCHcGc/I3r2/YeQIKE4sVX+XpWstd9sNGuM5xRAXMyNqgj53TbDopK2mEfdTYvz3Ial0LFPW0mgR/GvTylg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c407e3cb-f4b2-46a1-8286-08d88cf2466b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 01:19:06.3650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UystGHMz9eGnA8y5ppezovZcCnG8kC4S7jBQJYobaV9bZzQIWh+wkgIGfascBnXGmXgHi3KxmnpBsFbq0kkZASI+AflbdrnJuBaS5dcyH1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3910
X-OriginatorOrg: intel.com
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good to me.

Anitha

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, November 16, 2020 11:22 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] drm/kmb: Remove an unnecessary NULL check
> 
> The NULL checking isn't done consistently in this function and it leads
> to a static checker warning:
> 
>     drivers/gpu/drm/kmb/kmb_drv.c:561 kmb_pm_suspend()
>     error: we previously assumed 'drm' could be null (see line 559)
> 
> Fortunately "drm" cannot be NULL at this point so the check can just be
> removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index 8c43b136765c..5ff392644603 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -557,7 +557,7 @@ MODULE_DEVICE_TABLE(of, kmb_of_match);
>  static int __maybe_unused kmb_pm_suspend(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> -	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
> +	struct kmb_drm_private *kmb = to_kmb(drm);
> 
>  	drm_kms_helper_poll_disable(drm);
> 
> --
> 2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
