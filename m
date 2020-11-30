Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B62C90D3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0A6E8FE;
	Mon, 30 Nov 2020 22:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209D6E900
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 22:19:21 +0000 (UTC)
IronPort-SDR: 5/SQDjlfWkUCwgAATWe3OOUBBJWW6gkUxxyIXCDS04DK5L9z4wNAtuHIxz/MNa+XTJZzIfMbKI
 c8cuffgukwGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="151975108"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="151975108"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 14:19:21 -0800
IronPort-SDR: NcGdWr4bWSLqPOZK9DFoDM+WSAycYF8L4nNj/zOKfpsce3Ktuhz/k22AG+vcV64QYrLMUBh4qL
 JuyPoXgCX7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="314732247"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2020 14:19:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 14:19:20 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 14:19:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 14:19:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 14:19:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezDwg1qWnQVejOrxeU5Vx0BIrD6/JZlRyJc5xT+YqjaG6HXWaPvwdqXmd0F6bygFVsxJ3CnxrbXSL4my+jWdA3hJpoGg/UkLizBugxm91knUShZuifwK7T4cNuPE+h8yChAQwf1E573rxbtp+1Ih59FFZNxdmx9/+H9Ze6iyuYYSQ/TPLqEpT5qtIBx3KgyasI+3KpkxtPLkNnMIDAEwF0IqsiEEs2BTuS9N6O92X3nWAIE4asnNPBA0YFXpW3Bdm8M/73TNI5HcrDI5kfFPLI4F25WlQVnElocOchOR7RDBTjTjms8SpF4sLX58Kgtew8b4g1TqDUcJsMAAJtsHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRDOFefwR1emV1seqHtQ5kwuW0m9E7ebutEBaQH81dI=;
 b=m8IrNiYIRy8FnPGu4om7GcomXZYT2gSfa7vvUNxs02yPTe/IwlWKe/8kMS3bM7yrbDg6YYQtYDIQ+Ng/K2VAB14syfOcELVydAIElAJ5bQZoK5+samOLLhLLorIl8alGDJ43xQ4JluoCAfsTF9CaCz5YG6T+tuwPRsTBq0oQ4GDbvKP9ZeRnMBMIEGocaV6KIS12GKg1xfY/jOdxM0s0cEb58b475JvKQE5QhexwMh/ghDiVqru34RwAKFPEjjh/7YvHlM0+hxW4hLz5Ft0D8ACQNiyHuQcZImDfT8/r5D1eYLFyGTWbCfuoxfneNzJVwY2oq+AHL5AdQXUt0eOyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRDOFefwR1emV1seqHtQ5kwuW0m9E7ebutEBaQH81dI=;
 b=ERoKYmtMny5twOSIKIeqQ0KHWFsarabwAVT0FbWWUvZ156uA7cKpL5FRcUp3cUI/vBI260kFwwKq5A60EeMU5aQsv2LSOSgKuWDsZGjpE0KTHGJ20CdvI0lj/4zNnef7kk9Y8C8KgM92G1RFK1A/W/B12aZxpW2fP74nMTGGy5k=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 22:19:14 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 22:19:14 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, "Dea, Edmund J" <edmund.j.dea@intel.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Sam
 Ravnborg" <sam@ravnborg.org>
Subject: RE: [PATCH] drm/kmb: fix array bounds warning
Thread-Topic: [PATCH] drm/kmb: fix array bounds warning
Thread-Index: AQHWxouYX6RKw2p6RUm12CsNuNmoW6nhP/Ug
Date: Mon, 30 Nov 2020 22:19:13 +0000
Message-ID: <BY5PR11MB4182B94E480EFACBF817DFFF8CF50@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201129200927.1854104-1-arnd@kernel.org>
In-Reply-To: <20201129200927.1854104-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ca015c6-b3c7-4226-7e62-08d8957df83c
x-ms-traffictypediagnostic: BYAPR11MB3061:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB30613C631CB624AC355A00208CF50@BYAPR11MB3061.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:83;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cu6K0TgBTVuIaOLmC9K3pfmE5NxU8hWQh1qAIUfRm/VsULeVIf9HBg5lY0InkpXa4Zz3Cak5yGyEL8/ZdAgPeou+OZxIKrGkVAeHDyAjVWHcmWOcRfulBYla2rF8tQClH2fjJIBjjX4BqQt9Mj7rVkK2F3xE6yrwpBqpLyR2AiiBqeP6yR3lrBWWLe3rjAKnTshz6STQLuC/h3RlGlkVkhRIRZARLce05XbbzXFVkdRZEVAAsIc05hn6N+iHDcb5p5qqD50N+ZTf54HQUuw+P9KUPpMPDELYNDzhY1ioiHmq63fpSZhYVzFOA+UUJ+6VQFc/yvMSmToUm3jmj4cQPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(186003)(8676002)(8936002)(7696005)(52536014)(83380400001)(4326008)(5660300002)(53546011)(6506007)(66446008)(478600001)(66556008)(55016002)(66476007)(76116006)(64756008)(71200400001)(26005)(33656002)(2906002)(86362001)(316002)(66946007)(110136005)(9686003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gX1IToyszOLOp0CReUpnmM1aSKG+Cms83AiiqN6nYtXq1oRb04XlEnp9WrHK?=
 =?us-ascii?Q?ucbJ7HLudPYRs5O+wrEHwO1xTAVZZ2k1tuFvkB33PhaoHWLwvQQX4r9SSx8N?=
 =?us-ascii?Q?8JqtIsyfubdjBeNmdWOuIAO30k1bAZVc/FHetFFDcn6AhTE2JLrfX2GY5JFo?=
 =?us-ascii?Q?yVNFxpng4XXlJg2lfAqt12ke+kpL0/nlO6lKBo2N+erAOCOGxJRaGr9ACtxc?=
 =?us-ascii?Q?zFmFcPfZfIgr9XOjqbYfrEpONEjzvmJGkWKD30zjSVsq3Vwd7Mn+CK9OBgdL?=
 =?us-ascii?Q?JIa2tSKWeNn870QyluNZ2UhnSmYVqqTumN37D2/YLL5uYmy8lSWw5qZ2W0cQ?=
 =?us-ascii?Q?hS/yw4WRnBKWIMO3YW789WyI3GVAuzrkFl5wLXobQJDtDEwGXiySateci6gb?=
 =?us-ascii?Q?/q+209EEXlDoY8CDr/dwJCev3J2TSQtuPMLlOeRQQA9QgakUUyF0X9EOJ4Ir?=
 =?us-ascii?Q?0vdRGujMXGI/4D5N4fGfyLKF7Vb+a053ttcFaZ0B0zbuulV4wS6WsXYRxRZz?=
 =?us-ascii?Q?euoyFpMjQd0TT14CMvhw7v5IB9xP3djVl+fXzBVyRH7i7E9ZKd/1i9wv5/CF?=
 =?us-ascii?Q?jbxSqjpa5ClH6XBklalc5eO5DkxsSxYAzMBhiXPW01TrgdjM2OFcJ0gB5qlu?=
 =?us-ascii?Q?CfAkgcGHrT222Uk8I165UMORBcunnwbtBKdb7+fbgA+Jq55kUCOvgrB8qeln?=
 =?us-ascii?Q?ZdmQKI2nshf6Wu0S0URxRv04sJIvkP6gpVhq0QD+7GvuFLOo6sIAiGVpKv3b?=
 =?us-ascii?Q?xjKAiQsIvj/d6bNVWWJK2o1/WaQ3FJremw7CUhd0nq6SNLjBuDqSZnr1LDtV?=
 =?us-ascii?Q?/rlpUuf+sBp1jklycrnkFtYvgl2zgIZnCGgMostOY/jkkU5EuzDsQm6Mujpf?=
 =?us-ascii?Q?g1Ljy8YDWpcehXg3I6hw83JE7Gmza6x7QwwIRgDPFNK52udS4doAJ8NdNZqX?=
 =?us-ascii?Q?js+19rMKkwVhwkWamd7qYGNjp/P0upSXRuitn7uvc+o=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca015c6-b3c7-4226-7e62-08d8957df83c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 22:19:13.9730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RApg5hlgkB5KaAXxKjYzk6P1AXy5Rhlzg2kQC8YjNlfIgtDAttp3WLXfwpExOXFeurMKySPk/8tBSAkf+lCUPfa+tiIjIOIN3z5donuHAno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 lkp <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,
Thanks for your patch.

> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Sunday, November 29, 2020 12:09 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>
> Cc: Arnd Bergmann <arnd@arndb.de>; lkp <lkp@intel.com>; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/kmb: fix array bounds warning
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about an out-of-bounds access when the using nonzero
> values for 'plane_id' on kmb->plane_status:
> 
> drivers/gpu/drm/kmb/kmb_plane.c: In function 'kmb_plane_atomic_disable':
> drivers/gpu/drm/kmb/kmb_plane.c:128:20: warning: array subscript 3 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   128 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
>       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> drivers/gpu/drm/kmb/kmb_plane.c:125:20: warning: array subscript 2 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   125 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
>       |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> drivers/gpu/drm/kmb/kmb_plane.c:122:20: warning: array subscript 1 is
> above array bounds of 'struct layer_status[1]' [-Warray-bounds]
>   122 |   kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> 
> Having the array truncated to one entry seems intentional, so add
> a range check before indexing it to make it clearer what is going
> on and shut up the warning.
> 
> I received the warning from the kernel test robot after a private
> patch that turns on Warray-bounds unconditionally.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> index 8448d1edb553..be8eea3830c1 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -114,6 +114,9 @@ static void kmb_plane_atomic_disable(struct
> drm_plane *plane,
> 
>  	kmb = to_kmb(plane->dev);
> 
> +	if (WARN_ON(plane_id >= KMB_MAX_PLANES))
> +		return;
> +
Looks good.

Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>  	switch (plane_id) {
>  	case LAYER_0:
>  		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
> --
> 2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
