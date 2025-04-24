Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03457A99FBA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 05:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892ED10E71E;
	Thu, 24 Apr 2025 03:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="habL/agO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4DB10E71E;
 Thu, 24 Apr 2025 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745466672; x=1777002672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y9zAE6HfoYRehNt0LqOgPZsuZEu3pCyGsy6LQ+DkKhA=;
 b=habL/agOW5gQkpnPXtfZHPW+iOv43BRY+Ff+q4ULzVHcOjSaB3mt+1XZ
 lOtnYIiGV/FVFy2vo3FTZHoPMXhedhFi057/F2J+UbV8A87dNp/4KFNYA
 M91QJVoIurI8MSKc5MGAY4uMCkglru4pMadHex4CU+oJxlNiJAS0VCpcK
 cTjB+1ryhgJFavFEYeKrcmaq7UijCk5zKq653JPCID7qVHm67vVLm8216
 E1lmQFNtEXwwpHnclg46qPQtmup/3rQmIGs1GOVnPaa8SqG5LjjFsyJkG
 y0JZxYbCZlZx2vPG647DzDUwj5uH2jLuYoaxNrLwqsCX3sSpycY3Bb8yQ Q==;
X-CSE-ConnectionGUID: dhh/3WKOSxWxPTF/l/t4Rw==
X-CSE-MsgGUID: 1bZYt5OrTSOmpsY9haND8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64611746"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64611746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 20:49:12 -0700
X-CSE-ConnectionGUID: oFSiEGb7S3q1Hmf93JUyww==
X-CSE-MsgGUID: W5tGv0MfQtmLuR/v3bg7YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132407627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 20:49:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 20:49:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 20:49:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 20:49:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZyQtwn9xSjPmepHKu260sjq6K+dnL3MhFNA6Qz3Y0yfhP1ydyJ7JmeEBdmUv2kgjJ89ElgCyhikORVscgyBtSWRwR7zYZRYlc0qL+CRvsnYnGsc3Uf0j7dDazvAjhB2vXsYb9kvuQBbU/TPU237iwnhEaMZphYyZhhi8KIWSBMQJ6m6JTA3jhrjnJtC/ftLNQU7x4FDUh0qIBkXW/Yi8pz2bZLLW8J5D98IJTzHQaRVPfecaPbdCRgdOevHfs4dKk56yBJxsiAQdk2bho+MOPvCow7Zu5J6xoOa7VX/eS3LKS76YxXcu76t6X4KsJZ8PjJlkqs7vrjJVILrBh57bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IemGPmdjEj7zlCL7YuostpZck20++DF9OCnMOc8TfE=;
 b=ZFm0HvjFiy9HUMHjzNZFf0XQWZJWpYKA3/8ShO8wDqEKsVH0urLjNvyn/GXbHC9nF6dR89DTB4LJUGveffUQrk4P8mDTOFwYMwNJirH7FNZi+4I3lE8FoZ/zJncwXAXG1ptoZqeotVBaQvH5Exa6wnGhzvMAqTYrLWo2T8cAV26m+InUH0+7hoNXJrNkEJvTnNkFzpD0XX9qtuG3qP+bzjblEmK6wVGCGkmqkFPL7i8g37drQD8/rDpLXhprEmeLF3u2bbltO/ONDQUKBJLfEaoekDEmSchJ5gkzNZzj2mb99Ext2/I+o/sS+9TRCz+XuX6Z88gtPXypcxWMTsbrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 03:49:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 03:49:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v21 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v21 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHbtIz8/lW+53CFikWb88uH0cblu7OyFBig
Date: Thu, 24 Apr 2025 03:49:08 +0000
Message-ID: <DM4PR11MB5456188FB0B6C2D70DCD3CEDEA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-5-jonathan.cavitt@intel.com>
In-Reply-To: <20250423201858.132630-5-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB6938:EE_
x-ms-office365-filtering-correlation-id: 8e503295-2f7f-44d9-b042-08dd82e2f763
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BlHVvbljEkCz9W/bptBRgQi9CAtY/5sGYcheUa9/8KAdvJf/+GNX2fhQNI+d?=
 =?us-ascii?Q?loPQ93YUZmzJXlH4q+ENBEPFuafZ5nesUc2kVFyziDZy0yJRpGY/HCfLTR6+?=
 =?us-ascii?Q?EGxkKOE+hPh7PtEM+k6qJRjZMmUnPGHnyaRsaO+/+8763oVA36CouxNu05uw?=
 =?us-ascii?Q?XEBt+NJkoI0qz94XKLbBwJOaL+BKJjCYCmC0gGp/06tf89RttTbo6DVI2f8r?=
 =?us-ascii?Q?Lv8lwNkbgFXZRl24wVufo3TjT8RIdqyVyjwfzdGMxzb4v/gOn8k2yDIuWmBT?=
 =?us-ascii?Q?F2NA1btFTTe7OR0cxIw/JvQX/Rwh5GZx/bUg8jHBs+IGSc1Z2ioPeIj2VUiL?=
 =?us-ascii?Q?FI5aoj00cEUYE1r5RNZ1z+CCc2Jd0NeI43ntKn2bqSw9eqOGhIoZ6HHm/jgw?=
 =?us-ascii?Q?6MJ8IZcuxRJnu/eRbb3sW6gZWMVUCYog7xFPU7EyR3Uf/oNkLB2nTTHLpUm0?=
 =?us-ascii?Q?5b6YfClY27rdlNdZj4cAtxXDwvnexJl8wMqH4I4rR0iIvUqirWQzcVwmaiZo?=
 =?us-ascii?Q?h+QqtGdTThGqWNTzjxfq813cgnWUwAZRWagW/SfRWTwCKA/km3XJEqK8KWyV?=
 =?us-ascii?Q?ryESjyZ8+7iAG51yaEyKxRDvV8rqZLtPkrzX/cWv3BToMJ+KDhKfM8Y58pcl?=
 =?us-ascii?Q?t2cieylwA0NIiWRBgrsApiIwb8hbk6rBgh6pbWrTNaMIY4dDInm5KI4YoGo0?=
 =?us-ascii?Q?khVSxkLOg8Gw/QOv+ZCS2IiYfV579Grk9ZuR+LCdI9aDgie+YcZkD/l+0ev3?=
 =?us-ascii?Q?DWgPpji7z02QjLbOTDl414+iO/WLly2L9B1WbsXlqWemo2Oe5y9HMvYze5XM?=
 =?us-ascii?Q?7KP9NPnO6K4HVS+JpTDt61xKkEAzrAwT5rWmSLsWbKD1fJsx4JzbFNpMYQUc?=
 =?us-ascii?Q?f7ETubl+T8JDSF1mPQfYRbuSuwi2I2j3mCKSj7vWEc/OoHwSKCF6NOLnncA2?=
 =?us-ascii?Q?xth1/9+M7pdmltWFtiFcz3482RiQJRmM8vjb0G3wCMThbZJAhUKxbWir8fPi?=
 =?us-ascii?Q?0CYAbjfRO4vDZeTdonFXfV3jd9rwBYM49fzDWvqDev/Spi+pUs8O8ItHFtTQ?=
 =?us-ascii?Q?7nNP1/WmaFtnRwpecWoytxn7AkMvVeTIsBT4Nk5KLyGW+bop5PuMHxBwQEFF?=
 =?us-ascii?Q?qCdaE9f1hRSLxdBzs/MEVCRyl50mZPPI1ldJl45a/XL48Xgu46iAcloMUMKg?=
 =?us-ascii?Q?2BgFkk9vknZVx8cuLo6vdfoUk+HeT1e70mNVM2Fvo291c3JGl0anoFJd1POZ?=
 =?us-ascii?Q?ay+2wt2ViKwQbw+0kOAKprTxZ4O3g8uIR6W3I2QMW4LQIcGzSlfuDl1TUk45?=
 =?us-ascii?Q?Gv+vOyzVnTYWv/7ncDCNZoXyHpjEwYW8EkK7rr1br4qBgfxF/KzcA6/LwYRG?=
 =?us-ascii?Q?0ijUoKnX1B2ueMmNzO7R0eP/v6eTSyfTtBVGxJq6SwFQbgTT23XUJ4lv4dVv?=
 =?us-ascii?Q?nXegkMdvnHPhW2DyHTWlnoDcEh7XkEN9UyDjeATIbvjiE+7O6eQu8jfHU98w?=
 =?us-ascii?Q?S72dHb4B8nU7c0Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gXlAUAcqWlZNodqx5sv4BEDpZV4B9JU3adhVF2Uvb60bIToPmQQxn6U1xjdI?=
 =?us-ascii?Q?c3h6m0l5GXTO53Q/mm2CXML/DAuBfXfTwE78ev5C0d7bb15hD2tb55ln0uRv?=
 =?us-ascii?Q?3eO9eM5QRQ8ZvhmoWR9DZnLdmGlczoui3Z01mUIFyTkNMXd1FVKAOdPuzlgV?=
 =?us-ascii?Q?kPad37IHd5JXqNCyIaSHM8BiaGndYhlpSl9PkNKy/qJpwjq2DVjtjwXbXYnZ?=
 =?us-ascii?Q?hmNGLB4SZZPV8wpWFHkPASqFTxAZXMG5IxnMrwEQCSe7274Y9yfTNV2ZTpXi?=
 =?us-ascii?Q?yo5ZxRpMa/dfkdTsn8rkQbDJiU7x4slzbZWpkLW9GCme5iBHdmiJohSZj9Sp?=
 =?us-ascii?Q?HIGLA6PiwS9T1TZ1WeMZzVvusxpjQ71wK7lAqrCM4qAtzz71PzTBzTUfBl7h?=
 =?us-ascii?Q?dnSLNORfGobcc+QvPNfaA/5sw4cjFEeNnK8OQUbVo158hmcjGCJRjfI2A9lv?=
 =?us-ascii?Q?PPXg5YqnIO3tijXpM5mtHJlXbx40itoHfgT/FkNUKdIhpyxiVwjgaguUJZ9K?=
 =?us-ascii?Q?7IyhQq6MsvPAX6Dp36itcRRP0ucapn9kznLujrD+y5Ccu1kTmjhNtTPpmD7J?=
 =?us-ascii?Q?XxzWFbjsx4Q9mZDCXSP2fiCM+aWLgOXnggUo18PWWlYDcPK+bGRL2MH7wg1Y?=
 =?us-ascii?Q?hf7U0K+sYPS1nCknCaqtfKup5BzzjJs8y62RSjknhGvi1XxORppEJ2wBI2XN?=
 =?us-ascii?Q?keWksbTjJQyRZM4pmwvQcIM0ab6EjMG3zfENpJvwSIrpTBlMPMs4jT6yMK3J?=
 =?us-ascii?Q?NErIzZ5b6cDGMxplxgVT9ZI7HDYED+g41QE7XjC0IHVraIeeJRhOwaDO7yv7?=
 =?us-ascii?Q?7R4pC1sMR3YIWDgnq7ba0OHlzn4YJi+9M5UMxRwGgmoEUjlWUNWk/oo104J9?=
 =?us-ascii?Q?XtUkz2LfSBM3hcnuQagLaQiw00NRYtIHPwKO1NzOifI1Oy5MIRVhAxouJ5Mh?=
 =?us-ascii?Q?Mbv98ia8w0DDk4LeZz8zpUXcZT8+km+oAuL8w01Hq5c0PEE4Pi799sDvGhpf?=
 =?us-ascii?Q?vYZUAG6jJc04jLrvjXcUdoTuMaA75h1sAXS+K6/a3KldsIpcx0V+BZEpk2vv?=
 =?us-ascii?Q?X9Qc74voznNvMYois64YyjQMLRGTbIQj+J8+OorAvQWyoN9GFn1r+CchKHdc?=
 =?us-ascii?Q?XgI6/zpq8ajKZpMk24hNA5CZqa/JDTYGnd/iaCS1/72ZKc2HKM8sYWPMYOPB?=
 =?us-ascii?Q?Xs7V7YbukP089w9T67HvLY2s5QwknhPCtpmEX716iSS3h3JARm6yIoGSffw2?=
 =?us-ascii?Q?3n+nrqXtBxm+ITBIAmKuf75aTbSHspsWL0CNYt1qMe7Ko//jcgHe42lygOS0?=
 =?us-ascii?Q?1HVfylrrtlE3pFrQ1EwD7fOWZGPTZEA54A3yZ4xF3XC26eFOJTTsyCjFuhky?=
 =?us-ascii?Q?N5Mx478gJ26aPvhVpFumwRtnbAXc2ErC/E4VifYFqxwUwA1cRVKxQHbcqEs2?=
 =?us-ascii?Q?at6i9nSMJuyz6zlFrN/Jr8zQG0ZNWtSP3cUcYmENgJbYeSeIDzrw9YoZMGrm?=
 =?us-ascii?Q?w0K+m7MYgErWRGtAvhJE/a7NUn7qBm+WgEDsAyJpU97eqoL737KVSaS8e18f?=
 =?us-ascii?Q?n0UIXnnqjFY9vbQFVDb+pQgBdMX30OC88mhLMuCe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e503295-2f7f-44d9-b042-08dd82e2f763
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 03:49:08.0706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +DOmN0SYnGznIFvZzBzwKXmcUeAaNo1LUk5KSUDdv//WoDEGMPl+Kl89MLIBSLnpDZGvYh3FQ/ryolS5i521Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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

On Wed, April 23, 2025 1:19 PM Cavitt, Jonathan wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in =
the
> future, all faults should be tracked by the VM for future reporting.
>=20
> Additionally, of the pagefaults reported, only failed pagefaults are save=
d this
> way, as successful pagefaults should recover silently and not need to be
> reported to userspace.
>=20
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
>=20
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
>=20
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
>=20
> v5:
> - Store fault and access type instead of address type (Jianxun)
>=20
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
>=20
> v7:
> - Fix kernel docs and comments (Michal W)
>=20
> v8:
> - Fix double-locking issue (Jianxun)
>=20
> v9:
> - Do not report faults from reserved engines (Jianxun)
>=20
> v10:
> - Remove engine class and instance (Ivan)
>=20
> v11:
> - Perform kzalloc outside of lock (Auld)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 26 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 88 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  9 +++
>  drivers/gpu/drm/xe/xe_vm_types.h     | 28 +++++++++
>  4 files changed, 151 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 93afa54c8780..a84f6247f8a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -345,6 +345,31 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>=20
> +static void save_pagefault_to_vm(struct xe_device *xe, struct
> +xe_gt_pagefault *pf) {
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be associated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if vm is not in fault
> +	 * mode, return the VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm =3D ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>=20
>  static void pf_queue_work_func(struct work_struct *w) @@ -364,6 +389,7
> @@ static void pf_queue_work_func(struct work_struct *w)
>  		if (unlikely(ret)) {
>  			print_pagefault(xe, &pf);
>  			pf.fault_unsuccessful =3D 1;
> +			save_pagefault_to_vm(xe, &pf);
>  			drm_dbg(&xe->drm, "Fault response:
> Unsuccessful %d\n", ret);
>  		}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 0c69ef6b5ec5..107e397b4987 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,7 +27,9 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_pagefault_types.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
> @@ -778,6 +780,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -
> EAGAIN;  }
>=20
> +static struct xe_hw_engine *
> +hw_engine_lookup_class_instance(struct xe_vm *vm,
> +				enum xe_engine_class class,
> +				u16 instance)
> +{
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id)
> +		for_each_hw_engine(hwe, gt, id)
> +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> +				return hwe;
> +	return NULL;
> +}

There is a similar function xe_gt_hw_engine() to lookup to hwe.
Anyway, I am ok with the function.

Shuicheng

> +
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @=
vm-
> >faults.list.
> + *
> + * The function exits silently if the list is full, and reports a
> +warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> +*pf) {
> +	struct xe_vm_fault_entry *e =3D NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe =3D hw_engine_lookup_class_instance(vm, pf->engine_class, pf-
> >engine_instance);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault!\n");
> +		return;
> +	}
> +
> +	spin_lock(&vm->faults.lock);
> +
> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> +		kfree(e);
> +		goto out;
> +	}
> +
> +	e->address =3D pf->page_addr;
> +	e->address_precision =3D 1;
> +	e->access_type =3D pf->access_type;
> +	e->fault_type =3D pf->fault_type;
> +	e->fault_level =3D pf->fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +out:
> +	spin_unlock(&vm->faults.lock);
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm) {
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len =3D 0;
> +	spin_unlock(&vm->faults.lock);
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds=
)  {
>  	int i;
> @@ -1660,6 +1743,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>=20
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>=20
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> 1930,6 +2016,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>=20
> +	xe_vm_clear_fault_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 0ef811fc2bde..9bd7e93824da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>=20
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can
> store
> +before future
> + * faults are discarded to prevent memory overuse  */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>=20
>  struct xe_exec_queue;
>  struct xe_file;
> +struct xe_gt_pagefault;
>  struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
> @@ -257,6 +264,8 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma);
>=20
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>=20
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> +*pf);
> +
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t
> *end);
>=20
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma); diff --gi=
t
> a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1662604c4486..ff67d3c7145d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
>  #include "xe_range_fence.h"
>=20
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -142,6 +143,23 @@ struct xe_userptr_vma {
>=20
>  struct xe_device;
>=20
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_type: type of address access that resulted in fault

Should be access_type? And fault_type is missing.
Also, the sequence is different from the structure definition.

Shuicheng

> + * @address_precision: precision of faulted address
> + * @fault_level: fault level of the fault  */ struct xe_vm_fault_entry
> +{
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -305,6 +323,16 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>=20
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>  	/**
>  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>  	 * protected by the vm resv.
> --
> 2.43.0

