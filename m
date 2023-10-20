Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404647D172D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 22:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6298F10E5EF;
	Fri, 20 Oct 2023 20:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3F10E5EC;
 Fri, 20 Oct 2023 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697834427; x=1729370427;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bbZh1IuvEAc/BjDvDhBp65cjhc3MS62QRk0OLdwoadI=;
 b=CcZAWLkVT8MGtc93pCFNfjYgwCbENwhv5eFVXSunYukxM3y7edD5e8UN
 DaMgntz7BlMBBTnkb/BP9xbmenhCKklH/dGxEFLt9dJ92Rqam/XxjJP9p
 fpwdMz0vxP/dNXf0+DVUXyJ70W912paKcIyT+oc/t8BXG+/0ZnKT0by35
 kGYImuyUYAOoGNo9l/h9jz7cGePKs3vVbuMLcOwlz22il5ainJ59huSbF
 TsnSa7Kjx+yZ4MQhToZvKcQRawZ4pvECEhrynDZqy0mHM2oCmH/NPqZ+S
 14YHbhWs7DZrM0U8IpBmKmf6ChXONw7oeeJFBYyimFiUwVQdOUuHJUice g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="365908764"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="365908764"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848199260"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="848199260"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:40:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:40:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:40:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHwXtGHv7YgZmAlcf6yxt/RHfdH8INI4DWSrGHuCHeJd/Hrvauhehc/qKXYtfbYH7eXBlczEHD0OS8xEOlFyZ/mpxQ2NVqJzj2HuEy4E90sxUz4Hkymlx7b82FYiwviSO1brCsDZHOAjtF56Tnri2VLWGqaZbVCny7YFnCLsSPjBuKae0S1x7fSgOHLBjCLyNteUQw85GhAANbgA5orl7MT0z03p7k6mJVr/Yhgodl2VJlRWnUUwlo1Il0lXNFODNVolUmEplJq2sfav23yauPH0Xdmf6x/elke2qf/GzXpyaYffrqap/y6LhyV3kp62gmaFrHY14h177Aw+DNX5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6u4IIR+wIdT+pzhXgILPg3c9tI5HZp86IyYa/IUHT4=;
 b=AvjY2Iqu7A6ZwzoKpjh3thqKOYlx+r7AI2+8qlaHO2anOCfUvW4/Flf/MDo48qpzhY88IWXnutQ9khnWe4TF57efgJ0xY7o0mVMjcW2CzBsVtIy/le59xaX/L0A7kPPQZr7qLDxXzSlCwvlnu583A5LCoumm7rX3Gx+pnM8k+kmyEcFkl3LFKkK0Oz/PWBj0S4H/XSi0XzFnk4lzwAZcpZWquXfsnnQS+aSjZuD095K7lX3hCuwzAEHqhq1Dy3j7KTk3rvRPKjgLYQgaKkOK7+MQvCWFS/zaTiN4vXlesOgL0fkEynkJV8IphmJ5Plb8w0c0xiESCnvd6Z6MCqac4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 20:40:23 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 20:40:23 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "Tayar, Tomer (Habana)"
 <ttayar@habana.ai>, "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>, "Luben.Tuikov@amd.com"
 <Luben.Tuikov@amd.com>
Subject: RE: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Thread-Topic: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of
 an error
Thread-Index: AQHaA24AkhLc7g3Q5kCl4PqSccxIxrBTJFqA
Date: Fri, 20 Oct 2023 20:40:23 +0000
Message-ID: <IA1PR11MB6418821DC015720BD13196DDC1DBA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB7657:EE_
x-ms-office365-filtering-correlation-id: 268a8618-767b-4f8d-3188-08dbd1acc8db
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3hu5x1vga0faU4y1r+rgvjlU6H5pH9+KMmTYEKXvl8RSgoH558lXNKc22cz0NGw9cdUQe18Pup+aeKTZnxPvipfFM8XlneH5mmjbhys/gzv981erqaSXv8ApTqCvHzfghRxF6xl8utd9AretFtGXqxYbGVehx7fshmTsNSKo9i84PVKAWQqwy2pYPHAHudsXSw13Wt7jmL7ISmw1/5/stUnHaPH0rXY8NlkT7a5jrV2Jm/fgzhLvMB9RPGPmLkBJjN6/xo1iT3prL2mk4QLcK/+v0njcniB+7umHcqpK1Fp1LTufFwJ1oWLFd/fyLbjjhGChxZ1DMOacz7WHFT/5NDVOdIkc4kJVORZDnOzUr4qCZD0WeFDv1bA5onFXMZv94aOby7yo4114mN3yON5kqOGCcAFjC+LYjGENtNF+VVTqpMBFGGs0ust46K5izEVWzLh8OFLLaZtJbcVCb0O8pfK6DgJHAWU7cRyVoLvMMT+wqiUJwutPpLugfpOcr/U3nqJIbBv0tTXg+s8hwgoWkdg0QGA2VTsO0QK2XTsYrkeywsTMLwr1q9sVhTvrpIVnKwQ+iz7M854pbC0z4tBU0Z5ISgKI50Xmq9npXC4TXaljWBEAD4QMg6VFUD+o4eEG474MIENNoN+Frn7JprPwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(55016003)(38070700009)(2906002)(86362001)(7696005)(38100700002)(7416002)(52536014)(41300700001)(5660300002)(83380400001)(82960400001)(122000001)(6506007)(9686003)(26005)(8676002)(8936002)(478600001)(33656002)(66476007)(110136005)(76116006)(316002)(64756008)(66446008)(66556008)(71200400001)(921008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wz1X+upTU3yLPUWGurVqA7g0B+imqSvDzICzvAvMAy7/TMoW2LKSFpMqY1V7?=
 =?us-ascii?Q?qPtuRuidnAlJFqqMkE28nAzC6mZf3fZv+LeutGn+5zu7JFx0XhT8xcM5ZF1T?=
 =?us-ascii?Q?QbYTxUuLf+eQ6layz6KoZ9PMHmu7rzk8ZjbMZwfBrjoHrLryFCta7OoB1Ujj?=
 =?us-ascii?Q?zgtCLSgAxgFaFiaZqfwOqaT/4S1XRMuxjMgWiWqMc6573E/9rNvzMps4i4ci?=
 =?us-ascii?Q?I8yjrecul0FMQOlh/G8KAmN7OM6F/Q9rocypuGhYIjzn0c6RH42w9YD4kg3l?=
 =?us-ascii?Q?xHCDIKd2Th68h2HXzTmkSIJf4naD0xWsABma32+oVtrtjo/gLflJqm5/Oeya?=
 =?us-ascii?Q?2v0zW7gfa4i0A8O/zb+7enDCjpvdLuMZFczd++B+F0fL8pl0NGD5NRqB5aFL?=
 =?us-ascii?Q?fO6rRadtcXkXqKtG8CDuOR5oM7Xc5iQazBYIT/+56msbyzgbDoYwq/1OSbnw?=
 =?us-ascii?Q?Da8rTPDoffwOYDki4TBRajFZMNatvWLHj/jfrsTfpNSykAkGDqbkz4GAs0XF?=
 =?us-ascii?Q?TqzlIfpEu8Tr0GxHZ14l4HLLkAzDBk2ijrLd1IPxRfOdvj+mVuAOtFKelscO?=
 =?us-ascii?Q?5z47R1G98kf/EvIDOAEfkmGYT956Roh4kbMM5665q3qHiBEvIQUxTvCNoI0H?=
 =?us-ascii?Q?S75nXg1a4AGPl9Kl/wTg+D/bAeaarGckRZx3AWI8lM+HGiRI81HMa1s47bZO?=
 =?us-ascii?Q?isf3OlJkaHfKDmfiodhmJg5Is66akOGW8KyMDwTFKzu/1syrSGNpH7Iw34cX?=
 =?us-ascii?Q?eTIcBOr05n5TVlxh5T3hFtBJidv1DIy7vv0qcLt+TNm5wLaLemKp2wQ3nn54?=
 =?us-ascii?Q?V70Skm8vese9QtViNciDBGWLWdfOQvKwxXUYJGkjVtwfDEUYygETVJ9R4MYg?=
 =?us-ascii?Q?oxRo7XVWnDpBi7H986MLa9C4bfQmGTAY2C5KDp31UWvHQ6K0qrROcjb546sY?=
 =?us-ascii?Q?3MBgoefi5pRFTdbVk4Z6ffqGm5+ENtpRjMWeHvRyPHC7oKVZQ37Bmn5bQg9I?=
 =?us-ascii?Q?V/g2dax1Y+mK6wUIuVQYx4L2uYaPXwtKw79QDaAXkjKvc+8DIAqHqmNz8bj5?=
 =?us-ascii?Q?hK8sj8EQRZGNlgJ7s45NFk7/0QUPHZLsdP2PrH7UGapl1pC8nULrvapqlB35?=
 =?us-ascii?Q?qsDqzmENtKdXxovktpfrysn7NL3RVRDb07GxGA8epcLS/WokF1YB3Nm/71jq?=
 =?us-ascii?Q?rOqKtGZa/GLmA/UChO8V4TsFWu/OyLimQZSpQ0BxIwP3Xg8aX9MjUJ1TPKBv?=
 =?us-ascii?Q?wBiyBoJKa71URakrvCjNz2tYU9q0N363GUiLVPJBDBN1YStGYEEmo8LzQ0EV?=
 =?us-ascii?Q?ezB8pENsG3LkLuuLH3yoXXSPwnmzvD+RHaQRb5Fh+vGQiNT58jUGn90SUr3E?=
 =?us-ascii?Q?iZ3ohtoAJyOCV5SltG3wlXKoo/CIpUkjU9F3YR2KphkmxFe5dWQeuG1xfBKw?=
 =?us-ascii?Q?bkkX2KaPDkKEk8Nh4QlQxr5QYAfo+YmpJeGAfI2HXcsJsdnvaCq/B1v9T/jU?=
 =?us-ascii?Q?CaslKr8vFS9L3vcAE5ma9LUBdLZryGif4N6Bwl59U8MaJq0QVQNMOzL6VJ8x?=
 =?us-ascii?Q?jtThspFlNBShOqKuOrB1gai3kjuEdwdl30S8GjW9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268a8618-767b-4f8d-3188-08dbd1acc8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 20:40:23.7127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X9VJpvkYNh6w8rXK0migy1IC6NNWZnozbbP80pemIaF/1mH4UI39EDm5lQR5AW5jSM7H/ILhBZjKK/k9YZSPS0NGPbF1x5yAgTKq2vW8mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Sent: Friday, October 20, 2023 11:59 AM
>To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>alexander.deucher@amd.com; airlied@gmail.com; daniel@ffwll.ch;
>joonas.lahtinen@linux.intel.com; ogabbay@kernel.org; Tayar, Tomer (Habana)
><ttayar@habana.ai>; Hawking.Zhang@amd.com;
>Harish.Kasiviswanathan@amd.com; Felix.Kuehling@amd.com;
>Luben.Tuikov@amd.com; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
>error
>
>Whenever a correctable or an uncorrectable error happens an event is sent
>to the corresponding listeners of these groups.
>
>v2: Rebase

Hi Aravind,

This looks reasonable to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_error.c | 33
>++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>b/drivers/gpu/drm/xe/xe_hw_error.c
>index bab6d4cf0b69..b0befb5e01cb 100644
>--- a/drivers/gpu/drm/xe/xe_hw_error.c
>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>@@ -786,6 +786,37 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const
>enum hardware_error hw_err)
> 				(HARDWARE_ERROR_MAX << 1) + 1);
> }
>
>+static void
>+generate_netlink_event(struct xe_device *xe, const enum hardware_error
>hw_err)
>+{
>+	struct sk_buff *msg;
>+	void *hdr;
>+
>+	if (!xe->drm.drm_genl_family.module)
>+		return;
>+
>+	msg =3D nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
>+	if (!msg) {
>+		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error
>multicast event\n");
>+		return;
>+	}
>+
>+	hdr =3D genlmsg_put(msg, 0, 0, &xe->drm.drm_genl_family, 0,
>DRM_RAS_CMD_ERROR_EVENT);
>+	if (!hdr) {
>+		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
>+		nlmsg_free(msg);
>+		return;
>+	}
>+
>+	genlmsg_end(msg, hdr);
>+
>+	genlmsg_multicast(&xe->drm.drm_genl_family, msg, 0,
>+			  hw_err ?
>+			  DRM_GENL_MCAST_UNCORR_ERR
>+			  : DRM_GENL_MCAST_CORR_ERR,
>+			  GFP_ATOMIC);
>+}
>+
> static void
> xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_erro=
r
>hw_err)
> {
>@@ -849,6 +880,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const
>enum hardware_error hw_er
> 	}
>
> 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
>+
>+	generate_netlink_event(tile_to_xe(tile), hw_err);
> unlock:
> 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> }
>--
>2.25.1

