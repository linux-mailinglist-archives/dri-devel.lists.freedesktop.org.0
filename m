Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C972C9B1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C64210E057;
	Mon, 12 Jun 2023 15:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9210E057
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686583176; x=1718119176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ObUt8xX8OuDWXm+bNVA94E1zqYKBEfobnbK6DJ/u9a4=;
 b=EdNtM1tYYnFQDHOI2Qu7Ct3EL7uReE1JKz0D8aNW7vpREWH2/+yDp7S2
 sBj8n80D0WbNJ9jzOCbnF2a2rvBdJmbRb9AkWCivKk9U9odGUlRPSISpe
 +UH6tyh0Unvb2j6p1fFYIFpdoE/egjOblpEwQXae2wQybXLiubnjBn0QU
 h+v2w2QCNJpCQVG6q+EsDUSwj/EKRzjlrV+gbOIdlZiDWVcw2YTVjQ8tf
 5VaA0//mygecJH0ZEl09kCnpaHDGVytZo7x11dkwN+7LaBGXbyKIjW4BN
 rljC9mAxYhZgObWlimFx3jtR9C9r1O27EFNDWSYd4rBGAxgk497mq0irQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342758921"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342758921"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885471292"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="885471292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2023 08:17:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:17:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:17:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 08:17:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 08:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+yC/fi8Uq9YSIsXzFKBYfE5tXSn/npUCesweAMOxEls679BZ0bavJxbtMXDTmF4eKPeFMRiEAr+Gw2oFb62tSPSiuo/rRm10ZXeSCbKaOoYVLKFL84ihYjtWYd9HY3BK85F5ko6rfnHlmBJ3QFd7AEa+khOfCX3sXaaE/vK7sfOfXDR2hu+Epjv3QmH+8ROW4hFhubDSZMzQd9flMMBnfN/4LRMPfCAmVxNBpGUoXz5uxpIA1doRbEyYFWEvyQ1OCvJ4qiPxgmKpbt9xjN50xLzTvB0K+bNlZX2iydJmrgsGK+18+hoAY5iul10XuMf4ecqKSLkmrQAbU619EBOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9L5JGXV4Vk/z9qK+3ElCBoXABg4m2HT7KFv07ClMTU=;
 b=H/GNMYjfkSN3gLyTTwSqIitU+Pv2FkvE5e1LogqiifiLQMO5zFzw43Y0B/VlZFtCTffZzdp74PjDcdmluwUsg9ZfjyJe2+NMl0p70sHqBDLYD2KA+dBNMzr1n0IbOvpOciF4dELzV1rKnFEJBSUMDEPvGHCZdlkvSx298HTQjetQxipTiuN0nw4gfdnzGUacJdhGUfLAbGUlGizmFnUFZ+hvfFopaAiXTvyJa2v0kzF7sEYntnyJiOBytfqe9+SqJvO0WD9hKDLwC2E7gy08URtl6e6psBLE96mvIAjAwkNhDEuVJwni3sU78ZWPgXrvSXLs6D3trIhodNpP+SHgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 15:17:43 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 15:17:43 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "javierm@redhat.com" <javierm@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "lee@kernel.org"
 <lee@kernel.org>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Subject: RE: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Thread-Topic: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Thread-Index: AQHZnTgtEZa+Yf7M/Uyn0VM1axsFgK+HRkGg
Date: Mon, 12 Jun 2023 15:17:43 +0000
Message-ID: <IA1PR11MB641822AFCB0E0EA5856C7E59C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
In-Reply-To: <20230612141352.29939-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB8033:EE_
x-ms-office365-filtering-correlation-id: 429e829a-734c-49e0-77a5-08db6b582ba2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hlEXc27VP1yJ1dA5LAU9lslQZEz7QMVelfAn6lzsNtKN6ncMOZZgA8HZ9daFeTAbCMSVW/4NIYz2tBqMxYxSCQZW6PwFUIhjIRp8TsqBdeDjLbH3laxvJQ1gTBDD21Xyio8eL7HvTzNqg2pmFfQz2PhSIpNWKc70eIc99RuxyALLz26/3RmmSuQAIHvFpG6st/L0a7WQObKG671eWh+Jq+c053pYUZvmYfs5N+T1Ynv4Ypr9TiCVZcJA9tnIH/GDNqXHF5LROc2I7f3kPuHSGaGdcCIhGokq/jNM7qiyNE6E/fRBot+g32Gr79+Dv/gRjx3dom2Tf5fzgFDIfBd/WjWRmPELekn0otBnGUs3j71WCzdnajkTTfKS9w/x7ZRekKYfoA4n4QjKlVqW5G36f8zetY4+hpbq3OeK2gIURzQuGyTdaR/IZ6mO49XeNALqf46RqKbsUa3GXKD0AnAsMNVtVtcwftJZxDadTZRUQfHT80rG0b1Pwyz1cjczpRbtvUZKgFLyaTsmXLsiaOX4HObQ0kwuJH0OO5rm8F0tCT98NZ8xg5KQ2hjJQCeafZSbVEZvVDP9Yofu2uNarJ833eDOFifyQYiw793rYHm9iRaerPCPCppE5Z62PS4eUY/Ku67knIMp0LwsZ+ecLPEptw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(7416002)(8676002)(8936002)(478600001)(54906003)(110136005)(7696005)(55016003)(52536014)(316002)(5660300002)(41300700001)(26005)(76116006)(6506007)(9686003)(64756008)(66446008)(66476007)(71200400001)(66946007)(4326008)(66556008)(186003)(83380400001)(2906002)(82960400001)(38100700002)(921005)(122000001)(86362001)(38070700005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sbZy9do+O2W+7EaTO87y25qlmsUHPeYmdSpf3XM1sH5WH2A75VGw9lu06wdD?=
 =?us-ascii?Q?nhu9CsYBtsT8uxJAa+SIAftTwkTXLL+cU0CGpT7WpQ766s78kiS7DT1JJ4FZ?=
 =?us-ascii?Q?QcbVUZt/lqZnlBVWs9mRvBKo/9O8Luoz8kB1NQEvYExJ6FgU4G8kgChLN0NJ?=
 =?us-ascii?Q?cCCZl1fhaji8jXc9KrgQUlJ1VYj/DqbvTKlw960R2jLoBWH1CciRBb+Z7UG9?=
 =?us-ascii?Q?BWNVrZXyPh6Fe+1jT9YY8F94Ovw5fDcysFSH79H4eX8i7p6EkJ83Y1Na3hUq?=
 =?us-ascii?Q?oHp+sdG2gxfI52Im/tdOQxune/BWuxdt1WrECmjgPWqRklBLXUEkNKShq6W2?=
 =?us-ascii?Q?A0LPnma6wiLpj7nckp+AsTjhTiUvjW4qnttqX4H2mhrPE4BJmdddpVgxU1Fe?=
 =?us-ascii?Q?z89SEA9HpfGUuiKbtoCgCLH9Tlx7rjjAnQFItxij4p6DnNQESD0bXvR0TggP?=
 =?us-ascii?Q?8BY4OJU10N/D+/ITFLqQmbRIwQuR1BBv2J+JxVxKjoNmsTZB4l4fXOBHcIBe?=
 =?us-ascii?Q?DyXSHmPRVOFpYsSOPAAPIBLZlDxjmalfBE7MrJMlKsNCAe9xEolQTuvxTlPS?=
 =?us-ascii?Q?Cw/iVGUcjTs1cXkZPeBlKi2qZM+maMs2bZ6uZdRx+XWB+nlgb5K5D2WK75x5?=
 =?us-ascii?Q?tOaIrOIOUjtGYBmJOSCBFwcsVoZ4OL1L9d93zr11qnB+y6wDU0s27cFJST77?=
 =?us-ascii?Q?oszru/27N91wCEkXDuhIDjkbGhbIZDHivCdR47Th7cdiu0PZqp+o6xFQKv7Z?=
 =?us-ascii?Q?pKkE2cu4nJJsc2Y1alubAU6oiqV9h1v/CcQiRptEdHbTxBISFBZQPh+bHiaj?=
 =?us-ascii?Q?eLBiasRAHw911AQUtI3Q4Ms/OtelveOR8nOEO5RkqHfvIbMutkuUO7o9FNjD?=
 =?us-ascii?Q?ja+NY7jVuE4FnVqoHOeAoiSJov+iJcCbS9y2fmh68paPAIHeJ2Uom4j5k0Ou?=
 =?us-ascii?Q?A/qoGK2/LmuwO0ORGhcC/asB9sRpdevGy91vZCmIf6s3fcSnjoth4yktdNVL?=
 =?us-ascii?Q?ri8uTtVy2uJCiZlYa8RXSa/zyaYb7IktLTJ91YBuQBYIk0qGKReTGi7K4ZDE?=
 =?us-ascii?Q?cVYdUTOXFkdI4uSPW8U9N3M7kAdNX5Z6ZhhEI4aUpcfyauvhxye9RnZYeVst?=
 =?us-ascii?Q?M2qYrKV0DKJz4kwx85Uw229pnIm/CiAovu7kppB+NDMBacqr5Yj5vsNssiKQ?=
 =?us-ascii?Q?vHGLo5w1w62J7sZn0k0EnKSmsjwhgETR+x83mMGU9yqAn9p+MQZ7pk/+PLtN?=
 =?us-ascii?Q?EZJ4Ct8PmV/N0RczK4FTP06ty1vtD2yLZpixM4YxfM9tvhQ4gmO2z/PL22va?=
 =?us-ascii?Q?Jbtu6h8b8LMzWPpB4VVlnWYTCd+WABa+CjgjFoejnihWW0jXGcsuqjpft1KF?=
 =?us-ascii?Q?8k4vFGRMY8ztVkYWPc/yufSxwC401SzlvV0eKP87plNcX/VGljIieKGeuFBc?=
 =?us-ascii?Q?9z4vSs4DxRL/trlZQ1T98cbUBaFEztEJdaCnGy7PoeHqqTC9wpWzZU69oWsK?=
 =?us-ascii?Q?Cv1uRo4pZmfeLSjKoCvfpXPJJfe4MmCa5QbkIYHWpvEPbzZ2k2wLoQ1iql0U?=
 =?us-ascii?Q?2faG7KW6rIcDgIiezWOBvtY/DygySFAwtW7FkVVL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429e829a-734c-49e0-77a5-08db6b582ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 15:17:43.5991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/BpvOtxd7A9Fl2Vu39ZWtpxAoJkInQtv3mCET3Ctq0Uh3o5D9gnUHigS22/dbd+ZznkJuqd10vEafXK70O07l2sAqcz+KVlCmRtZnox2EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Monday, June 12, 2023 10:08 AM
>To: daniel@ffwll.ch; javierm@redhat.com; sam@ravnborg.org;
>deller@gmx.de; geert+renesas@glider.be; lee@kernel.org;
>daniel.thompson@linaro.org; jingoohan1@gmail.com;
>dan.carpenter@linaro.org; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: linux-fbdev@vger.kernel.org; Laurent Pinchart
><laurent.pinchart+renesas@ideasonboard.com>; linux-sh@vger.kernel.org;
>linux-staging@lists.linux.dev; linux-kernel@vger.kernel.org; dri-
>devel@lists.freedesktop.org; stable@vger.kernel.org; Thomas Zimmermann
><tzimmermann@suse.de>; linux-omap@vger.kernel.org
>Subject: [PATCH v2 01/38] backlight/bd6107: Compare against struct
>fb_info.device
>
>Struct bd6107_platform_data refers to a platform device within
>the Linux device hierarchy. The test in bd6107_backlight_check_fb()
>compares it against the fbdev device in struct fb_info.dev, which
>is different. Fix the test by comparing to struct fb_info.device.
>
>Fixes a bug in the backlight driver and prepares fbdev for making
>struct fb_info.dev optional.
>
>v2:
>	* move renames into separate patch (Javier, Sam, Michael)
>
>Fixes: 67b43e590415 ("backlight: Add ROHM BD6107 backlight driver")
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>Cc: Lee Jones <lee@kernel.org>
>Cc: Daniel Thompson <daniel.thompson@linaro.org>
>Cc: Jingoo Han <jingoohan1@gmail.com>
>Cc: dri-devel@lists.freedesktop.org
>Cc: <stable@vger.kernel.org> # v3.12+
>Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>---
> drivers/video/backlight/bd6107.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/video/backlight/bd6107.c
>b/drivers/video/backlight/bd6107.c
>index f4db6c064635b..e3410444ea235 100644
>--- a/drivers/video/backlight/bd6107.c
>+++ b/drivers/video/backlight/bd6107.c
>@@ -104,7 +104,7 @@ static int bd6107_backlight_check_fb(struct
>backlight_device *backlight,
> {
> 	struct bd6107 *bd =3D bl_get_data(backlight);
>
>-	return bd->pdata->fbdev =3D=3D NULL || bd->pdata->fbdev =3D=3D info->dev=
;
>+	return bd->pdata->fbdev =3D=3D NULL || bd->pdata->fbdev =3D=3D info->dev=
ice;

Thomas,

Looking at the fb.h file I see:

	struct device *device;		/* This is the parent */
	struct device *dev;		/* This is this fb device */

Is this documentation "correct"?  If so, how does that match what you are d=
oing here?

Thanks,

M

> }
>
> static const struct backlight_ops bd6107_backlight_ops =3D {
>--
>2.41.0

