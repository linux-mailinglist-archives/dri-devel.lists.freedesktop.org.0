Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD922BB8BF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 23:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEC46E935;
	Fri, 20 Nov 2020 22:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B8D6E935
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 22:15:59 +0000 (UTC)
IronPort-SDR: A14R97QIQ9L3wyupFwix2BpSRSgApZs7RwUxB5c4OhPEwFnPb7TbKV++woAKDneNA2eTI/Ae7J
 UHQfkPQcjvVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="256259697"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="256259697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 14:15:59 -0800
IronPort-SDR: aMCsvitcStMGQb+wGEGBt8T1upTCxofK+hNN2NocMefsrIENZk7oPS2zU8zlk+/DQQmSuEI+Gi
 DKnY1PZ21gbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="431704883"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2020 14:15:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 14:15:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Nov 2020 14:15:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 20 Nov 2020 14:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHQ9Imk0omUGcI6j6BFT3eJ4xUQSIuGTu4ZHv97IOVLcNmuNS6dfffcesckX7DMBEUVU5ico/xXOLgE6fpknAxdmWS4Cn1uQeia0N1NGEu4ToPy2IjU0ePG06SPq3fBwTI9/Bx2MdiYfr2fgQBPqQMRNRGz2xn8JGpCe/UOhkmWVsXbnsheL/JbT32/yMaDhIVETRmVBmeRl32DyvOtpzohryqpR0eOwV8HrfGQ+rgsXYE3ohaF9TwRdFww00T1eDrj9b2MLCIFkvHlR5/6uWyXhEWMLAKLpYkR5vw/uifAYDICOW8ig3qtAYS8bGk6iTqC6H2VgBpW9tKvEBhinAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24MI9J2TpHyePA2EOB4syz1BiL0lX0lzFHFzUv0adqs=;
 b=bYFfoCtMhwZahWi5IOB1k5U/vtV4+VuqAepJ9ZzvHRunWlWXTOkdmfGccDfrZycz8FYAiK6D8Jikx/CH8nil8/fyk8Gp+vqnZ7EUOo4cQpz6lQW4eOQhQUKsBLb5MOSkTLHLOi3ucntOXZysVnmWKXvrbK28qUzKgf92dpl82hVpIxvzPxKsdW/I9MIsLFGvXsj7CpsGVCAv5B0psCYluEG0Zg4y6xYbiCvOE705hBE+609Hfx5hiQr0wa3/ePXvcjRJV2l7GMweG0lIiWxuf/92lFsjXfrCgMYilkyZCJk7rSeVcAggsbt2Hc+DEOqfvPw+10J30CCkKo9aQ+QIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24MI9J2TpHyePA2EOB4syz1BiL0lX0lzFHFzUv0adqs=;
 b=hPwk0Nv364O/+HGm8+bMNWS7eLsewk5lyE4E8/athhpYKAInDi4raJAWPGG2StzBPrfG+2Zx1ip06ffY1ibZ2N8Ky03kXrTRNwJXHBp0J3YB0rBolvFXVpX2L0JMtO55gRc5c40ptYw9NIMyfuVhe2brjFPfjd22h+e7nvjgTWg=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 22:15:57 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3589.025; Fri, 20 Nov 2020
 22:15:57 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Thread-Topic: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Thread-Index: AQHWvxTE9qkNihoFXEWyzr7cwy2qgKnRlOEg
Date: Fri, 20 Nov 2020 22:15:57 +0000
Message-ID: <BY5PR11MB41823E214598EC70A9EAEEA08CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201117072103.GA1111239@mwanda> <20201120081113.GL18329@kadam>
In-Reply-To: <20201120081113.GL18329@kadam>
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
x-ms-office365-filtering-correlation-id: b62e9ad3-2f55-469b-081c-08d88da1daec
x-ms-traffictypediagnostic: BYAPR11MB2917:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB291703EAAB6F75498CFFFCD68CFF0@BYAPR11MB2917.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lX0al/MNWa7Zc2+JipfkGYOkSYCr2I9ozDZ5+oAnmq+OtRKXlUkzu/qlZnuHyZuwUIeshR6cdnY1SApgSVZ+Y4T6khDeBGpDlYebXuaXFoOVXVXHPMttxZRtYmy1bbiy8QiRhNQebSGptE/5CS7KWh8+jN1q+pB/r6gOWpqu2gvzw/GmD8cntCTYfjubEgAyFXx4QShaCye7XTC6lrjRMQZ71ouh66FW2VLLfIYzCNYvcfC0x6AtM4H+OYJi1CKwBSIyULLskAsN9OH51e4sYa9XjUpqF3vK9PQelPri7FJKAGegtHSj7p6/Ew+MYXRnhEzrly3vUh462xVvLK7bTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(4326008)(54906003)(2906002)(71200400001)(478600001)(33656002)(186003)(6916009)(83380400001)(8936002)(53546011)(9686003)(8676002)(7696005)(55016002)(6506007)(66446008)(66946007)(52536014)(64756008)(86362001)(76116006)(26005)(316002)(66476007)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9mruGyXJUhN2FISSMu9R4bNOxHGsb+UaVg0dY3KdOw/b8X8dwQ5ihjV76g9EjgsolBRc+34Y6lSQJtNQ+9vY25jLUvlsX8rwGPXTIN9KcT9aVf7vmeaPnobqxOSszdXznCqjZU5PUYKdbG1NUek5E4xfC2T8ptIz9COj09OPX8dLd0yL5+5cR31IboNpOrA4G/BtH9JRH+lgpYmMi8Km90ANj7fRAaHH/g5KNWhUOBCHac3+S/2gXzCQ7CSOYxbNK0eExuGHW50KnCckKtLDGXAfjozTXzSKZEXrzIdE3Bj5nfjmtLYy3VPbAZd1flNutUZ0mQNMxyGxYqS4+7n0TjpCDWOn5XjhQm2xB5yoC6mE/mAuWC0sgLuCyiigSOzPhQwcvoCFfDRtTelS5qo1+bLdWS/bkH33L/zL8Rjq51pOPpLD0L+3o1/xi4WvRvuGbgj86wzTiZnGIkCAnJ+wg5UFCcs0RC67NpcOP+WhV/G6pdh9dxN/IHB8Y5fYSvVfmjKtUv6so/BlVQ0BYnrg7hmeqvHNoC5WO+4+w0Ca+UVQm9ENQ8hGFhofpCkk/kRvAaqjfTnTUVOVgu7CTO319GmYRq6rnLQTvj5T/a6Tog5HZh3EaGGzvPHGZcn13eOUVY39pYs+JR808Rh20nMBAQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62e9ad3-2f55-469b-081c-08d88da1daec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 22:15:57.3508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hM7kEv3UYhgJpwke3Fdnp0ifRTsh1Z7FKMn+E0atH/7KKVLo5PDsTO9HTPzM1t5REySYtkG4gfWQssDHwfJg75mEKk6JY2KUUOVlM6a7S3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
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
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,
I see the problem now, thanks for the patch.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Friday, November 20, 2020 12:11 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
> 
> If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
> The kernel will Oops when we pass it to kmb_dsi_host_unregister().
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: write a better commit message
> 
>  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index a31a840ce634..8c43b136765c 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (IS_ERR(kmb->kmb_dsi)) {
>  		drm_err(&kmb->drm, "failed to initialize DSI\n");
>  		ret = PTR_ERR(kmb->kmb_dsi);
> -		goto err_free1;
> +		goto err_clear_drvdata;
>  	}
> 
>  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
>  	drm_crtc_cleanup(&kmb->crtc);
>  	drm_mode_config_cleanup(&kmb->drm);
>   err_free1:
> -	dev_set_drvdata(dev, NULL);
>  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> + err_clear_drvdata:
We still need to unregister the dsi_host that was registered in this call kmb_dsi_host_bridge_init.
This will require more changes in kmb_dsi_host_unregister and/or separate out mipi_dsi_host_unregister.
FYI - I will be out all of next week, will be back the next Monday.
> +	dev_set_drvdata(dev, NULL);
> 
>  	return ret;
>  }
> --
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
