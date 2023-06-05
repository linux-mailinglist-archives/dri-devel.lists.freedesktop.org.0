Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED13B72310A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 22:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEEF10E052;
	Mon,  5 Jun 2023 20:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5E110E052
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685996347; x=1717532347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zonRdUfn5g8svz1JUUo+UCWQov+K25UYxdNFV1maBqM=;
 b=TspnJ9f1dvJ91TJrYthG0l4aSI4tPzJhpsmkdJ9yIgnrHzTombc7z8yq
 zJpEdkT9lC/nbDbg3CtgwqOzNIXwZsF2/jafI2geniz6I+mkoTRsvM+4k
 ZoNeCBOLFnUydUHpRqfW1OfqUfVoTOZXyCxZtAJdaMCM8BWb965ElGV/t
 pkH06L/+UyRSSube2HkYAuZjVgg6a3Q/U0Bssf4XC7ErtTLWopoYKWmFw
 NdouZYJNx7cJWxxIYlwlaf4u/ASffvmeRky04fQnrjzv+ATZ2TrRpqUeb
 YPvx3fVPf231JoNBc1OmFUrOVloAocJLqHjpANXdzdYf9+xf+ciIaQ5Y7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356481238"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="356481238"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="711935537"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="711935537"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 13:19:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 13:19:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 13:19:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 13:19:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 13:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrIc1AEufCjfOJ4mwLxFFdOPdmgDSi2pku4x7prtXTOzHLkL3rmPK5hEN0NRMBExaBsnmFEBhkputAI5t9dvd8rHeC+h/kl2+QE/uE8ZrA8U9+bXVrwDYPFIJWmj77DV5OnNiLFtcjo7/H40wpcF/NnSt0BiIzmifLFfxvP0SUJ9Va7NttGCmlQIZOE0hB4y9roWgLeiDHHt7sLqqcECUPo3CiO/VphvIvLoQBfsBpBH1xcP1eVCdOhZcBGAlhFxS9IFfzILCHktVkngVjR/b6p2jxLx/hAsOYUQzsDUUeUX4YaaBhObkykUkvOn5VkLjDqKpmdajsj+U7tV8mMwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOy4lOYNvE0eQb9lwrWoRJr1lToaZvGwnNGr1lK3Fzo=;
 b=liYcU4rr5vowEaQHltJhtqOwDC3/rZO7Gt5i2V4VCUVeLHQHtoRaNjQyb4SprBE/poxVLliMExD804qGGZV7VcAJgB55pqeg2rWDgDJYKiinMiMAw4bbEJgpYdJpo1VgLcqg7l9yYgsmR9Z2sq2eCY4rChw3BpfurFBA3mCVlo3cXP0UUoCjtUEP6pJczpQuqFGsGbsUxc8KswW3xnTVs3UHaVM/T+kNYbOiqRBIgvDdqScclrFzbKZb1XL+Uu85pgHZ1FtSEI6uOQY8SfmxWPLHZFSWJ6kfRfq1VMA+cPR54nSSfhSf3JNowNCDeZzGeX4ixL921g0KL5RIkJDNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 20:19:03 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 20:19:03 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "javierm@redhat.com" <javierm@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "lee@kernel.org"
 <lee@kernel.org>, "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>
Subject: RE: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Thread-Topic: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Thread-Index: AQHZl7zgyIG+qRqVTUyv8ft4ggwl5q98pi5g
Date: Mon, 5 Jun 2023 20:19:02 +0000
Message-ID: <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB4813:EE_
x-ms-office365-filtering-correlation-id: 21f7eb1f-6117-432b-8871-08db66021ae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SzHlqBxV3X4wtG0/gCHkAOXPw/QSBvR1nzb9A5iWYZhifGaycG1JWxmx5bQp62seqrebijHDB3q/kB/e6GVLiCZG8bVCq4X+SbOCXGQRIWmr48g0dzyjyloNTNdvs6GPWQBy80WY3iVEwpfgmSmbLDkGGORoGWDbiKJmM6mQezNNwaDWtx354ZVxVJJGtOmCwc6PMKaJLQY0k3l88qEdbHgQBrwkbtGUDyrY9yR99z4S5pu/kRwNe/0zcc2PvyruNhirf808NMVhO7eeJn0VJYvp4Ymeno7jkuAOl0uCg/8itCK89/f3V0KGstp0pBkPV9rYVdyo8Eoap4jfSflCCcesl9iK37UW5smBs4eAh/dJJTi7dvpFvaPV8zrPRc717hpOYnY7CDan2DIbjLmzfCMSZzPeIdRMAVtXNG1s3wo0GxfJOFPStRdNICW4SSQle38CYrMoWPHkkIB5zcgOfBXwDjjnL9VetO6Cj6PKzFiol/ii6V/WQdY/6VOvyzsREaqrNkQjJ2lSKG1SecBWif14nbI8BgeWc2zOWNvExE7OUl5SeBaPWNq+9CHYEIrpqxdnnY2DqGE9au+cih0qRelJrVxKSyIFJi7FweG557nhepVZqegMtxu0dyNla0iL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(9686003)(6506007)(26005)(83380400001)(33656002)(86362001)(38070700005)(122000001)(82960400001)(38100700002)(186003)(55016003)(41300700001)(54906003)(110136005)(2906002)(64756008)(478600001)(76116006)(66946007)(66476007)(8676002)(4326008)(8936002)(316002)(5660300002)(7416002)(52536014)(7696005)(71200400001)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qaq5KesfpyTDVMWoTNZP/+2TWV4bRadoZZYR3ri5E3HqYZUuqVzDT/pNPCGs?=
 =?us-ascii?Q?beFQhrLjto6UxcyWVfLyBHDjvhKbHM0XNaKPfKN5DhQmWcLpE/aV3rpid+UW?=
 =?us-ascii?Q?oD8czzH8WTGYwI4HKwSrN/ElLSSCrlJKZ7VDijbwJX3mgDowyKNY1dmPyg6C?=
 =?us-ascii?Q?8HlWMPQD064P1z4nsrzc98Q+KOevghznRZC32YS5bji74XE2zJvDXi43Ry2H?=
 =?us-ascii?Q?ob0JcymF0NtwPUkIvUC4KyL//+yTDGV22mJnCeE3YqOOSMgA0dbu4KcXeYmj?=
 =?us-ascii?Q?pNk72ljwB5JftmWyPXLp9m24YhO7fUef+X9GkQm7uWzRj9YqChPLiNYWT1i1?=
 =?us-ascii?Q?TGAHm+toDGlOMZ9D+D15UPo5bHP7n+I6jNjZYS9iLsxSaCLFu9bo2NQMt7gg?=
 =?us-ascii?Q?fcjKM/rsKRLQm2lYncaOWUtikd7VKVUy6rIGIDgRtBKPOLoUmfGSuNzeTBue?=
 =?us-ascii?Q?QdGAkSU6ZvwviQ5NCOPBI6T0WiD+SY5VDT6649JdKoBRAAE5D7g4dDi6KdOF?=
 =?us-ascii?Q?mVi+pVMuk5KlKA3mfg+mpGTtWFEmDG8/ziOI2+YSnNAIjAtHsQLQaoxwS2lv?=
 =?us-ascii?Q?rva/Pffh920L1eVH3lFoXJw7IUcqerEpGkBPWS43c3QmErp82xSxh0oQiUvn?=
 =?us-ascii?Q?AXMBA1xCk3UtGObBJ2mWu1V7D0LrT3sm5FTXSiUOImvr4cjqLo1P4+jPijE+?=
 =?us-ascii?Q?URGhDONOx8Bo7aCv+UO8YMGWXVZIedCeCJhNZq5y+gq9EZDWATtbSm7Zb0ia?=
 =?us-ascii?Q?HNMRWUFUYH++D0t85kAtHwKI2ZuwvbNOSCMwkT8wol6QaaQLYAEi8luLcPsx?=
 =?us-ascii?Q?kCOQpsOCV+L14/KZMpoLqV0TlMRRTk7aPb1KQVVFW8Lovp9VxzMik5LSJCyL?=
 =?us-ascii?Q?o/IOQL8BSPVl4kk8CIcYTLVqisuBM1sOxqJrjPT05nnOmHxdEctR50DThB9a?=
 =?us-ascii?Q?9whn+H/67OY8HxgjVO4/AdsAY/GBuOxPltD5AxkZRUHcG1mMHM2vGGP8kL1Y?=
 =?us-ascii?Q?54vCt6lgx9caej9uk2XtIVsIrX1QT7nsjbNFLXFLpsUGIqA7IpasnhJ3ta84?=
 =?us-ascii?Q?JbbOErNtCcu6fuStz3W9/lAuMrwuN1AKWQWdZwVstZpzrsE7PlBes8bTLW5b?=
 =?us-ascii?Q?byQNFEYXlNPPQoiz+Ik5siqH3HVc9tGxx0F7/nTBnW9f8jwVSZbajQXUB5E5?=
 =?us-ascii?Q?Iha3eXuc2RfKyWQLucUIX/Bh47yBwLLqd5HqMiz5gvfVfkoteGSq9o4Iyr45?=
 =?us-ascii?Q?Cxa/Az2lQ65RW2hAvgEiTJYeslYrrrIrpKABAbk4DZKdY+30ILBwMAPOuhM2?=
 =?us-ascii?Q?lUOmSKMU6L10NSAr3fgc4Eb7C3TdRnwOzy3CcDSF7UcLwKycE2hVp1+IS7CU?=
 =?us-ascii?Q?di5w9j4uf0euxMDNlRhdbpPlap1ZoFBuR9inaP6/5ssLY3H9WlqYokxAs2Vy?=
 =?us-ascii?Q?bJjkmJRyBrFgtvCjejShlr9/MQfCxlOoMSx2YVIrVrI1d0yBYEey45lcscQa?=
 =?us-ascii?Q?H0WQGpDN11mfKc14gyu/sTB/hx0au8I+nGSN/TcVmyIUlN65pUM/731akzTN?=
 =?us-ascii?Q?efjfF9EDOpQS/V8A1XC6oB+077FucNp1jTH18pl2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f7eb1f-6117-432b-8871-08db66021ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 20:19:02.9957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3moIx9YeKkhwsFKOdCk4NfLxXGYzXzKBgGnDSyt5mWfCg5OJPD4z9bAYrqIxihFYDl+5N0crtmuKY7w1p9it1ly/QQ9GLFj6f4GVHmdPtAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Monday, June 5, 2023 10:48 AM
>To: daniel@ffwll.ch; javierm@redhat.com; sam@ravnborg.org;
>deller@gmx.de; geert+renesas@glider.be; lee@kernel.org;
>daniel.thompson@linaro.org; jingoohan1@gmail.com
>Cc: linux-fbdev@vger.kernel.org; Rich Felker <dalias@libc.org>; linux-
>sh@vger.kernel.org; linux-staging@lists.linux.dev; dri-
>devel@lists.freedesktop.org; Thomas Zimmermann
><tzimmermann@suse.de>; John Paul Adrian Glaubitz <glaubitz@physik.fu-
>berlin.de>; linux-omap@vger.kernel.org
>Subject: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
>fb_info.device
>
>Struct gpio_backlight_platform_data refers to a platform device within
>the Linux device hierarchy. The test in gpio_backlight_check_fb()
>compares it against the fbdev device in struct fb_info.dev, which
>is different. Fix the test by comparing to struct fb_info.device.
>
>Fixes a bug in the backlight driver and prepares fbdev for making
>struct fb_info.dev optional.

I only see a rename from fbdev  to dev...

Is there missing code?

Would  a fixes: be useful?

M

>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: Rich Felker <dalias@libc.org>
>Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>Cc: Lee Jones <lee@kernel.org>
>Cc: Daniel Thompson <daniel.thompson@linaro.org>
>Cc: Jingoo Han <jingoohan1@gmail.com>
>Cc: linux-sh@vger.kernel.org
>---
> arch/sh/boards/mach-ecovec24/setup.c         | 2 +-
> drivers/video/backlight/gpio_backlight.c     | 6 +++---
> include/linux/platform_data/gpio_backlight.h | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-
>ecovec24/setup.c
>index 674da7ebd8b7..310513646c9b 100644
>--- a/arch/sh/boards/mach-ecovec24/setup.c
>+++ b/arch/sh/boards/mach-ecovec24/setup.c
>@@ -386,7 +386,7 @@ static struct property_entry gpio_backlight_props[] =
=3D {
> };
>
> static struct gpio_backlight_platform_data gpio_backlight_data =3D {
>-	.fbdev =3D &lcdc_device.dev,
>+	.dev =3D &lcdc_device.dev,
> };
>
> static const struct platform_device_info gpio_backlight_device_info =3D {
>diff --git a/drivers/video/backlight/gpio_backlight.c
>b/drivers/video/backlight/gpio_backlight.c
>index 6f78d928f054..d3bea42407f1 100644
>--- a/drivers/video/backlight/gpio_backlight.c
>+++ b/drivers/video/backlight/gpio_backlight.c
>@@ -17,7 +17,7 @@
> #include <linux/slab.h>
>
> struct gpio_backlight {
>-	struct device *fbdev;
>+	struct device *dev;
> 	struct gpio_desc *gpiod;
> };
>
>@@ -35,7 +35,7 @@ static int gpio_backlight_check_fb(struct
>backlight_device *bl,
> {
> 	struct gpio_backlight *gbl =3D bl_get_data(bl);
>
>-	return gbl->fbdev =3D=3D NULL || gbl->fbdev =3D=3D info->dev;
>+	return !gbl->dev || gbl->dev =3D=3D info->device;
> }
>
> static const struct backlight_ops gpio_backlight_ops =3D {
>@@ -59,7 +59,7 @@ static int gpio_backlight_probe(struct platform_device
>*pdev)
> 		return -ENOMEM;
>
> 	if (pdata)
>-		gbl->fbdev =3D pdata->fbdev;
>+		gbl->dev =3D pdata->dev;
>
> 	def_value =3D device_property_read_bool(dev, "default-on");
>
>diff --git a/include/linux/platform_data/gpio_backlight.h
>b/include/linux/platform_data/gpio_backlight.h
>index 1a8b5b1946fe..323fbf5f7613 100644
>--- a/include/linux/platform_data/gpio_backlight.h
>+++ b/include/linux/platform_data/gpio_backlight.h
>@@ -8,7 +8,7 @@
> struct device;
>
> struct gpio_backlight_platform_data {
>-	struct device *fbdev;
>+	struct device *dev;
> };
>
> #endif
>--
>2.40.1

