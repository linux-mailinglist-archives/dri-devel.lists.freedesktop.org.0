Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BACA6E053
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D958A10E171;
	Mon, 24 Mar 2025 16:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ8LSN81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC84710E171;
 Mon, 24 Mar 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742835434; x=1774371434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ostavZtE06psJfLWwWS/iVSLP58Uti+x0xQ+aSOU7g8=;
 b=NJ8LSN81wLCdiqK8pbJJUwg1s/RbLf9Gq6huB782QZUeAKhYFixFoi3d
 vSOza5qj+YgPEvBvnaFMNr6ST5eVoQUco61DRljWSG/L7phdpK9tpaYVx
 Vii/EbRvUW4fHFhCDeGCorIRt14gdnrLZzigD8ihzy6DHwWjQCDOfIkHq
 FxnbnfS4DS9BZzKb4CgCatURS3R6l8Z0L60T4uevwKpe3MgdQYPLzLimg
 Pc790iTSLwuvW1AqC99HmNVoW5gtT3WR355+sDe/6M5nnfeAHMeRFmnCA
 kewImUSTED1yIHOlj+j2cUGrMbyMHKhgBG7YVairYMuOAezdaog3kHpW8 w==;
X-CSE-ConnectionGUID: NI+ytDnnS/icHzycNyJDiQ==
X-CSE-MsgGUID: UH6bGFwxRhK44KQCfuoZrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61445308"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="61445308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:57:12 -0700
X-CSE-ConnectionGUID: 3zaQojPdQh+8LLViWjShEA==
X-CSE-MsgGUID: b3pBm4TyRz6cOfZz9rrgwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124891791"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:57:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 09:57:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 09:57:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 09:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6rfR6DgYfMp/W/U7YsW26j2jMVzVZHd4u+cP8kKxEiPXRG0ZOE3uAYcce6XoaRGsZR5zOQZvjpqRiuKBZnq0q/NhpZ2kPKQi6Brf78HoiKSgkgaGtgoxYBwDGR5LXop6uaLPpFzrjDjPT3xJSUBmXCBAuL7GUX76vRYWAEoWgXgwZTP5pkgZVkN/fvFPyT1G4ss/iP2/NbbhGsTpOiBXMoSWAS14xLBIs8uVbCXZeuOjsfkJ1r5HXcGwUYzg5tiNDGNbCdY08OxXn94tMshd7EeFsURONhwG9XhuX/XpOcgzyV+/swv26k+1qhCPtHMRII+66t4RnTCKzesdzjFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9gzf/siMH16jy++NzN3JSyQmx0mSAaAHAmt5BYZIcc=;
 b=XOxQQlE//XxhHN6nnB0IcQynDl0weZMfQevb+6xfckPjm4Cy7nx+LJgOul0QF+3XnpozbXQ69GfMbud3oVBOka5uWXIjWrbgqooiZbjSLwQohPTXmWP5PDmv529nfYGOWD82Zui8/qx6aI4hoOBpHsfBndNcgX5l9is9IF/2ccqfpTlhSDpORlEEXt7liDu7Mj3qCRCgpr8d2UW5FMJ+b46X/i7ty6D1BwYCU3myYyxC+IyVeUOYC+f2LapPu8VNmTW+hmpqzhMGllMmXUJgd3qX1liscbJ/qw1YG2ZPNZEKo/3tUvMzPsDMcmuWpCPU5EcC+fOvrwQLs+V8YMs5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:57:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:57:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbmaxz60pzmV6QPUmyocFpZL7O4LN+QOmAgAQd96A=
Date: Mon, 24 Mar 2025 16:57:08 +0000
Message-ID: <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
 <Z934F9fz_-d1oGiC@black.fi.intel.com>
In-Reply-To: <Z934F9fz_-d1oGiC@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6553:EE_
x-ms-office365-filtering-correlation-id: e9d75112-085e-4aa1-2490-08dd6af4ea2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FqEBm7mY7Rq+pNcb3DBmLXNBm5mHzTRsxTjWDcZ3epsYdG3qXRjQlOyEDaQP?=
 =?us-ascii?Q?S8e3KX3c9g0QsCbv5zW75U7UoHkRSfYDftvFgoMEK7jva5oos+nkEZ1QXaTS?=
 =?us-ascii?Q?XG0ShhGzhDQzwMTMQgWOh/vBnod7Emoy+oc7XZbD6cR8/mZ3YYHMFzAILrTW?=
 =?us-ascii?Q?GKAoJH6hSnTZktPfkhxegVFLxjhlxtnma6qIARNKma5IKRQfTU/pd7bIFEfk?=
 =?us-ascii?Q?Jcq9qMqaAAYUvEIlQYRUoOzY0KMGc0e+sfB1XBnWXwMAmpSdts+LNWnqDFO0?=
 =?us-ascii?Q?muSpsks7LLNnRXKVPA7K/gNJ3jScFKo1c2FXb9kHAIG9DS4FFJIrRduPPyjV?=
 =?us-ascii?Q?Eq3NaD3qTVbaj5Th6lMadLCYg6P6aBoNQ/wcr4l8U9BMV1NyJ6iDOJijZ0ct?=
 =?us-ascii?Q?MJ41mwIxlPbBCzsMFxS3VWwQxINqYVJt8pm/dsrrFaWsw/d7aMQ9+r95lkbx?=
 =?us-ascii?Q?oFVhBnLVpU34g2GfwKT+fGddsJIMvjZTqymAbwaJrrUrliFebczc/V9W6SxW?=
 =?us-ascii?Q?MhG81KGT30atYXQExrqkHCWcosiBNKE5P6BXsHd7Egd1y6tPXdMi0oKgdXXV?=
 =?us-ascii?Q?kWk5g/gqMqnn4BlgErPzZvH/iZHbolBN/OyCizDrAA6N+g8EGbH3A+tidHfG?=
 =?us-ascii?Q?+jFbGH4K0z9hiy236xYcxlyCjSIZMP5wVDP9DT35kIMuE7MBfhJN/YLics1G?=
 =?us-ascii?Q?MzElEazyke0ZGmGnnFU3x8+E3eYkhzIIu/St9zdT6+hVfZwN41MP8aW8nwwC?=
 =?us-ascii?Q?e0NDeyLLhx6o0CeFmyG6RUUEsgB6DF1IGrakGlBPPFFZpWnO0YQms/xZPDNX?=
 =?us-ascii?Q?/YkeOo0p+6vOKI6wJk5ypv0VnvX0Pp3K4ysM/dEa78JHahBDrAnS7SMY9Wtb?=
 =?us-ascii?Q?MctcZs0e0QBOZ5Oha0iYHJJXrgWZEo5F3dGqGWNwmBhxWGQwsMwGgfoo4r22?=
 =?us-ascii?Q?SewIUhpKlK1GLE2ZlLEweW6RTcwrU12GBi6moOvtbAlhnAKrw6PBsZNyp5Jn?=
 =?us-ascii?Q?3eEQQEncJEGGJXrmmArdfmOqFiCCihDlyM6rB2S7MOMqklqt2xx9BpGmG4z3?=
 =?us-ascii?Q?ao3s/qY71+pjkOmeTtZ/Lmct+JAc06Iqg7tgW9A1FFEL+remM3aRXavTSXGM?=
 =?us-ascii?Q?7ZrULgBdv982lRkQRyLQ4bh9CZAtTVnx3DdFlhKve7uaiS3JXNg/XXmpf2Az?=
 =?us-ascii?Q?vL+3jkMMQELx04FVgGpeGXIgcVfY0eo+N2yyr5C5/3IHSyxkRyxEGy2Z+Y8U?=
 =?us-ascii?Q?54ChNl9u7WKiQE3VA/3y+kXKDhZ6BVL1CbBlZuRuGOnEQOmoe/gYWveh/eNq?=
 =?us-ascii?Q?DwzXedLSk/bddCyx+C3WwYAwLMgJ+888P2maGZrhE/sxdOcc8cWZqbWJE/LV?=
 =?us-ascii?Q?rFX3NxRzJroQcaFVauYTlfOAvC+T1SF629brwig44LolY8OAg56AdKNJolCB?=
 =?us-ascii?Q?ElfK6V0yvClZ6ULETwl9ZSljVOujOqIZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lG8Luhv/V2E8ualNYMzluuAKFf1PnoMKmdb7gXa+QH6jqEqwOuT99S0l9fRA?=
 =?us-ascii?Q?/Ds/1zc8G75bo5zhCOWzYTzuYp/2ghZtEMPxme35TtncZBrHtf2R8NJjBtKY?=
 =?us-ascii?Q?7ekR/YpPQxbTVRSa5sUVMM8eZdXy1K58Jwn2CtBP31fudClniL/2derFjfAK?=
 =?us-ascii?Q?Y4N84p2fxUEFWHnDlxa+9eyWWPyjQMBBAmHMrXF3l1N06uytdpIILTGcRN+X?=
 =?us-ascii?Q?y7Obc0haIELV6bU4EAaq5r32J7YDCvvNVH8wiNK+dlCppZjLtmXyCdr2fMbJ?=
 =?us-ascii?Q?qjg03cvwcs03pJACTCtBgXmOIEGt3RrXu6SEnD4dwGS/oS6MX8rtrpk2l78d?=
 =?us-ascii?Q?S36b8q1vHlfsSGIeRUtvi/hEKsYxl01pZrswMhWKFjgLoSyXH/5k2DIeOlho?=
 =?us-ascii?Q?5YsqFpn947hLlzLZKfwuigpSjcze1QWgbaOdmxMEsNo+fk6LgTH/CrFbjQtA?=
 =?us-ascii?Q?YUDib30C1MlgyUFz2NpPIOC0dhAt8f01QynNYc5gsRMmZtOZUano/7H+GIDB?=
 =?us-ascii?Q?pFkqQCK5yhGwKLrmufxzx7Uxi7NgmmBj8q5ruAcro5bL2ENVkkH+BpnRgiNS?=
 =?us-ascii?Q?G/kSc6XlIshbJ/G8kyjlfVkBcq8e6/2j5WKnAXkjzlMYpCTXNymx2qVeNJCw?=
 =?us-ascii?Q?EIyJvgL+khdVykM3ie6NVdiypd8+VTG5eayYVCLE4HGTs7PxyI4R2aapbAWh?=
 =?us-ascii?Q?LsQ2SiX6KrCKd7LhAVwgImghsSm/yuajjji3i5vOAG1smsmUm/7jdjvbfaCg?=
 =?us-ascii?Q?7NpQlUVrTBPm7GGJqrvgga9Ddvll/IrYvfVXHQ4ErsDc+/q2NSdCq1MxdvLM?=
 =?us-ascii?Q?GEaY/DCU5iuOomxW8cH5GqTTRW4t1XPXRBwhIIgdMNUWE+wtNumSBKBcUDqp?=
 =?us-ascii?Q?JbYL5+nBqD5q/KasCg87bb4wAVrOC+gXdJj6rvDuGl6Pmv1+xqeFeh8zEOxg?=
 =?us-ascii?Q?peRj/GtN3KhWGo4TcwYvOCO3BZmOQIuRTlX3JqeodmJuMxuX4oD1hBJa1QRY?=
 =?us-ascii?Q?1AqOUo3aZnuCEOd5wNxZTqDXY8uX3BmqP/rPN8025Q7XPBzscQmgFZoKfY7O?=
 =?us-ascii?Q?THUr56I9nLcTtTtuSmMxv6jc8wDUfZ6YEcjH24de5hMi/3llSMGbWAlp9Qzl?=
 =?us-ascii?Q?7u7TniHl9ptNyBXQBT+mY9b/tiWoSwnUDkAKSm9PM++V8nvHuoyOREzUaSFy?=
 =?us-ascii?Q?ao0t7g4yVShtdI4G2pACkQxebxV0uj18j+ffcGA77a37AAmvgbfPER+WxCO7?=
 =?us-ascii?Q?vgns2imLsPsyf30MmdRClOXsvnsRhSXesAVaavfHYPivZa4F5lB1iQc9xc2w?=
 =?us-ascii?Q?nWIX1VE4QO2YfaNazzNUWz2/8LZwjEiJ3jWlDPBzwpb/osfiuyXS31LT4t7+?=
 =?us-ascii?Q?N0KT+mxAO82tlqfhnS9psgF4co1qdp4V0/umaEkzCGW/eyh4R056sRc9Lzvu?=
 =?us-ascii?Q?ent/jUPuh2QxsFOOK4rqQYbL/4a6uMrRGIlWD0u/QHos5Z+Q0GO0CEJgKsvp?=
 =?us-ascii?Q?fWWfKe4Fr6dAkmlO/JF1Q9DDAdL3obyCevf8zoDCq23WaOZRCgB/xxzNi2/x?=
 =?us-ascii?Q?wlvB/lxe0xxMq+vIzB30Etm3aIpK2ooh9bhcPAyy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d75112-085e-4aa1-2490-08dd6af4ea2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 16:57:08.9395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aX9rS3fe1CWlclXqDxZ/jmeqUKGIW60qimzXJpad9mkGEWBUggAy7drdO1ozxSHobVYDFyjy+UO70H5oj9AIbEKf758NDsS5AlNMSCA9jGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
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

-----Original Message-----
From: Jadav, Raag <raag.jadav@intel.com>=20
Sent: Friday, March 21, 2025 4:37 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> > Add support for userspace to request a list of observed faults
> > from a specified VM.
>=20
> ...
>=20
> > +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> > +{
> > +	int size =3D -EINVAL;
>=20
> Mixing size and error codes is usually received with mixed feelings.
>=20
> > +
> > +	switch (property) {
> > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > +		spin_lock(&vm->faults.lock);
> > +		size =3D vm->faults.len * sizeof(struct xe_vm_fault);
>=20
> size_mul() and,
> [1] perhaps fill it up into the pointer passed by the caller here?

"The pointer passed by the caller".  You mean the args pointer?

We'd still need to check that the args->size value is empty here before ove=
rwriting
it, and we'd also still need to return the size to the ioctl so we can veri=
fy it's
acceptable later in xe_vm_get_property_verify_size.

Unless you want to merge those two processes together into here?
"""
static int xe_vm_get_property_report_size(struct xe_vm *vm,
				struct drm_xe_vm_get_property *args)
{
	int size;

	switch(args->property) {
	case DRM_XE_VM_GET_PROPERTY_FAULTS:
		spin_lock(&vm->faults.lock);
		size =3D size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
		spin_unlock(&vm->faults.lock);

		if (args->size)
			/*
			 * Number of faults may increase between calls to
			 * xe_vm_get_property_ioctl, so just report the
			 * number of faults the user requests if it's less
			 * than or equal to the number of faults in the VM
			 * fault array.
			 */
			return args->size <=3D size ? 0 : -EINVAL;
		else
			args->size =3D size;
		return 0;
	}
	return -EINVAL;
}
"""

Then, below, we'd need to branch based on the initial state of args->size:

"""
	vm =3D xe_vm_lookup(xef, args->vm_id);
	if (XE_IOCTL_DBG(xe, !vm))
		return -ENOENT;

	size =3D args->size;
	ret =3D xe_vm_get_property_report_size(vm, args);
	/*
	 * Either the xe_vm_get_property_report_size function failed, or
	 * userspace is expected to provide a memory allocation for the
	 * property.  In either case, exit early.
	 */
	if ((args->size && !size) || ret)
		goto put_vm;
"""

Something about this seems a bit cluttered, and it'll only get worse if
we need to add more properties, but maybe this would work.

...

I just looked below.  When you're referring to "the pointer", you're
referring to a new pointer to store the size in, not "the args pointer"...

I guess that would also work, though we'd still need to branch execution
so we can store the new size in args if a size is requested/reported.

>=20
> > +		spin_unlock(&vm->faults.lock);
> > +		break;
> > +	default:
> > +		break;
>=20
> Do we need the default case?

That's a fair point.  I thought that if I didn't include the default case,
either checkpatch would complain or the switch case would not run
properly, but I double-checked and it seems like it's not necessary.

>=20
> > +	}
> > +	return size;
> > +}
> > +
> > +static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 proper=
ty,
> > +					  int expected, int actual)
> > +{
> > +	switch (property) {
> > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
>=20
> Unless we're expecting more cases (that we confidently know of), there's
> not much point of single case switch.

I guess one could argue that if the property value was anything other than
DRM_XE_VM_GET_PROPERTY_FAULTS, the test would have failed by
xe_vm_get_property_size, so any further checks are unnecessary.

Though given a previous ask (or at least a misinterpretation of a previous =
ask),
this function probably won't exist for much longer anyways.

>=20
> > +		/*
> > +		 * Number of faults may increase between calls to
> > +		 * xe_vm_get_property_ioctl, so just report the
> > +		 * number of faults the user requests if it's less
> > +		 * than or equal to the number of faults in the VM
> > +		 * fault array.
> > +		 */
> > +		if (actual < expected)
> > +			return -EINVAL;
> > +		break;
> > +	default:
> > +		if (actual !=3D expected)
> > +			return -EINVAL;
> > +		break;
> > +	}
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +static int xe_vm_get_property_fill_data(struct xe_vm *vm,
> > +					struct drm_xe_vm_get_property *args)
> > +{
> > +	switch (args->property) {
> > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > +		return fill_faults(vm, args);
> > +	default:
> > +		break;
>=20
> Same as above.

"above" as in "unless we expect more properties, having a single switch cas=
e is pointless",
or "above" as in "we don't need a default case if all it's doing is breakin=
g out of the switch"?

>=20
> > +	}
> > +	return -EINVAL;
> > +}
> > +
> > +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> > +			     struct drm_file *file)
> > +{
> > +	struct xe_device *xe =3D to_xe_device(drm);
> > +	struct xe_file *xef =3D to_xe_file(file);
> > +	struct drm_xe_vm_get_property *args =3D data;
> > +	struct xe_vm *vm;
> > +	int size, ret =3D 0;
> > +
> > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +		return -EINVAL;
> > +
> > +	vm =3D xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -ENOENT;
> > +
> > +	size =3D xe_vm_get_property_size(vm, args->property);
> > +
> > +	if (size < 0) {
> > +		ret =3D size;
> > +		goto put_vm;
> > +	} else if (!args->size && size) {
> > +		args->size =3D size;
> > +		goto put_vm;
> > +	}
>=20
> With [1] in place, this gymnastics can be dropped
>=20
> 	ret =3D xe_vm_get_property_size(vm, args->property, &size);
> 	if (ret)
> 		goto put_vm;

We'd still need to branch execution so we can store the new size in args if=
 a
size is requested/reported.
So, it'd actually look something more like:
"""
	ret =3D xe_vm_get_property_size(vm, args->property, &size);
	if (ret) {
		goto put_vm;
	} else if (!args->size && size) {
		args->size =3D size;
		goto put_vm;
	}
"""
I won't deny it's cleaner to look at, but it's not particularly better comp=
ressed
than before.
-Jonathan Cavitt

>=20
> > +
> > +	ret =3D xe_vm_get_property_verify_size(vm, args->property,
> > +					     args->size, size);
> > +	if (XE_IOCTL_DBG(xe, ret))
> > +		goto put_vm;
> > +
> > +	ret =3D xe_vm_get_property_fill_data(vm, args);
> > +
> > +put_vm:
> > +	xe_vm_put(vm);
> > +	return ret;
> > +}
>=20
> Raag
>=20
