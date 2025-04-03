Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B909A7A7E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2610E284;
	Thu,  3 Apr 2025 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1bMN+Cx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5880510E284;
 Thu,  3 Apr 2025 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743697493; x=1775233493;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c9JLloFmZHE0S4mwkuw9ec2CQ3XaEtwBDGqf7Za0YLs=;
 b=F1bMN+CxIRNXoppOISELjhTW022xAWZ2+9dABKJLOuvMDaIMg0lSzYlg
 lyPQGuOUKDTJHPwrNnd7GdLhcvdlTfMjAiBJRYb9IOLNCZpvUzx5gIJ28
 HwY1urWHJkHI3+GmFpvu5mhAUL5JMZ9lYjw1bO2+COUCr3iXJe9D4uH9+
 VNyiiKBWG8aaVaKghQh59+0J99LoQyY1hjTN/xOpuCMxrBfhdGfzRf+GU
 7agE+l18JeXSaD/u4yNavAz4xWDarrltTtOPd2e7Snyw80G2b4wPkkwg5
 cqDr8ZL+9rs7ddiqfo4hD7UEy8T7sQwwK62Ihz8htGEhqXPfFmrWtesvP w==;
X-CSE-ConnectionGUID: Xm1klzglTkWmEro27uNy5w==
X-CSE-MsgGUID: o7RKpahlTleuOeffT3K/WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32720810"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="32720810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:24:51 -0700
X-CSE-ConnectionGUID: S4EmoYmdR96woTzv2DlTBg==
X-CSE-MsgGUID: 974aetqVS8aU8CCU/+0M5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127570624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 09:24:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 09:24:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 09:24:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 09:24:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFiGJ+jf5G0tG7WF+QvCWjOZVwW+ROI+6VvqKcRcO3/UUWdupfMmbTKdDRpDiuBXtZHl0ek5JZIVaHijQSZxVB8XUZsTVAGJ3XAB7lN+kd6CMo/Uje2TogBicz+N5mgaq3BSm9AiALVRL9fTrZu6vFloIPWZjH4alQceyae0r8+8FaC8wskEQ71aQMaV1/W8jiaJEk0gBtyXByNz0ovD/DC8dFy/DaPrnTezkF+2gtvMUpSfM1u3bttZ4tmrVlGcMLcCUvEAvHuQGE0IoRDn1JE5m6MD1QMygx5bYurdUrvmnmqWzy6Q3tMiZRKUqftH4A0VtBcOLjkJ4AzRV4Ut1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MflBrQcxy4pzslE0syLrCLGAfPmCQWRI+px661xohRU=;
 b=LQY4Hccbgijy8L1rXf1XBW5xP2wHDvPWi2spdlfmHT0wZNdcXdDBsfYA/kQQTUcsq9npkddD250yXpHX78tyPi6CB7B9FM9cZjw79MtYwglIhlfVh22W2M5Gecm2bg37Cc8aM4P8rkh55Vt45R7lWqeiTijBVXTfj5PKd3ILs7CU1zSVCrI2nRvHkD5qnRiPutM7xq+816pXXgfzMlgTAQm/KUQF8t5UiOtdH3dAYNwe2fF5Bo+vx9sDej24aSa/t9c78pAKVAePwrK+sn4w6Qb4VO6nPsuqwe7rgR2emoKQNk+CiUrBT1fhVshb2zvVIIOjfKzlptWwbIt8LfD9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 16:24:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 16:24:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Briano, Ivan" <ivan.briano@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbo1UyMiUnphwNSUmsPzSU9KFF+rORBYeAgADvv1A=
Date: Thu, 3 Apr 2025 16:24:47 +0000
Message-ID: <CH0PR11MB54447DCA3471E094766A32A1E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
 <4wixf3hmhcu43ikzs6omjez5wo3tzkaiox2vz7gbi7qe3uru7p@xexdfeqdptdu>
In-Reply-To: <4wixf3hmhcu43ikzs6omjez5wo3tzkaiox2vz7gbi7qe3uru7p@xexdfeqdptdu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB5146:EE_
x-ms-office365-filtering-correlation-id: e4d2919c-38ad-4994-4d65-08dd72cc0ceb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2vDRMb32gkAkzNW7ln+/Wiot8pwiGZv8skE768pJxzTaJylWF2O3uQSYxTLx?=
 =?us-ascii?Q?3xy6iCuTbLzP9bwrSJjTTDF5heB20CJKopJDJRk2DbBdIdGr4qSPWZJkDjyW?=
 =?us-ascii?Q?KfDrL8VWrPua4gCN4Gv9CTikwl1IXdP2JGcTNjpy1UWuJo425p3nTKC0hfim?=
 =?us-ascii?Q?ykarPO7yPQ329xWNsBQP9QCyb2JWSxVFkTVE1l4Vwiaji9CnDOAa6xFnvDH1?=
 =?us-ascii?Q?zg6AUbfRoXrl9st7Ga5NsRGjZrumHBPYfd1QHAIV1pJvBM+fRR9bc5dN97ns?=
 =?us-ascii?Q?QFgTCkP/y4VkZLtuq1UuRgei05h4+96PysFyvd9Pe2HcL/9FFRKO5/VfE0t8?=
 =?us-ascii?Q?hFcs0qj8xJBhJrjxCkuB/rwlgiGtWeI8jJ1eXk4OaYEjQG5g7W/fFE6rN5Vx?=
 =?us-ascii?Q?Z7MKEvrRjga1nGj5IlI070DAwpgLol9vLkZlBBJXiSRPWcXVbvnAEZSd2/hM?=
 =?us-ascii?Q?2SXKKfRF2K0p3FIdlFETbiN+T5kHY2nPI1YNRhpkUwxFg4iAgwxYmY5V0iQV?=
 =?us-ascii?Q?MwihHt4ydDsVNKSQGTZSVBRp85Q8IpljN1luQs3P4eFElEDZML7Jv/FQ8ZjG?=
 =?us-ascii?Q?zFw4b9DN+hLA5tI9BmbeauZwe5uhFpV7Y/+dfuWj/vCjasaorYHS9WwyYIwP?=
 =?us-ascii?Q?ac1eNaYFvw1IzwHMUaa6lPrZSwbG2TxEAxkAp1PEOLOT5/NFJHg5N/N/GXl3?=
 =?us-ascii?Q?a140h/R2JnC3Uw8bSUQBnI2XxqXRWzbue9zE40EByEcz//onicWIoLPHjfJJ?=
 =?us-ascii?Q?6sqXRk8oEeGlIUdm7ydpP/XY8eoF5fVmMt6cd08M+RXsRDSza/8tcW7uM5ha?=
 =?us-ascii?Q?HYdAf4KE0UIE9JS6LDVihDaVSLkx6mZ4+GQi8pGQ01l9bjdHyk3GEhxEXIdE?=
 =?us-ascii?Q?9stwt37eR6kJIxz9fEdgtO+o2M5muhkY7LVGHefi9MSkj9RA9gEkcwsPyvEh?=
 =?us-ascii?Q?vL44ZDy3+RTgo2KshOUA5ch5cH5Fer/QZp20AosYQ0msULkYF2HgbKlT8c7D?=
 =?us-ascii?Q?osU9+dwLZxGX3bN2VkOJ6+9fjDlrCTy73crxgTppmbuYCe8wqDsf0pFUkj9Y?=
 =?us-ascii?Q?AYBL79wUo+K+PY2Nc8XS/odsIa6BoI78j37jkQJveSTeF6BMQz6UpLwox3d0?=
 =?us-ascii?Q?GoICEvcHg+0LlWQrvENfR2OEIuxS8DHIK9dc8W6rypLf6rkc+tHoqiva9n3Z?=
 =?us-ascii?Q?aJcLlySfX37htMsKXPgSgCTiDRMxUgOw0yQbFbDtiZnUXs3qBIikfVl/XTcc?=
 =?us-ascii?Q?WuC8MT60NZfFAI8+WrDhh1obx8ThepldU3CJp9HImR7Thn6YIotUzZ8Ht7J7?=
 =?us-ascii?Q?TZkFqFYcK8lQRW08+5b7iunvRWVaPDgORsApUWTUoBhKkZAAVlmZYE2cvIH2?=
 =?us-ascii?Q?5QKXG6iYJoWmxGrMp1xux+BkmYD61oVKPBKgMWkTXz0rofE65bofh7P/ucfn?=
 =?us-ascii?Q?u7iAhdU+bYU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7h8cK8KtKFan8r798vBxLaqHzDY6e1RsXSS5k3o40PnhyxDjB/zbKKvuiHdb?=
 =?us-ascii?Q?+RA5+sRsem7XPMWJOMpuKL2sB3VpPjpAELdoXZsO4ryKuuqEyvoShKrlNAuZ?=
 =?us-ascii?Q?JqVU36eFEk0m+3iAU0t4puoZGqRhz2inJKKbIkRvinDAAutfbgawG+1cw2a2?=
 =?us-ascii?Q?m/hLCoHM0GOmBxD95I2l5wfK7L+xjJcOWsLHRxzM3P/+pCO/Z3FkGXK7v7dY?=
 =?us-ascii?Q?ag3uUdIGIFgadU4CuRObzQ8Y2ooeMuu60bLKcP1gqp7VMz50k/ZnbQTMPgO3?=
 =?us-ascii?Q?L4pE/dQtE2o4ROiY1J4fcc34TUobbpm3MUiT4ufauMeWulx58ADKtEAflXPf?=
 =?us-ascii?Q?qKo/LiZtFEvY7pLpCbmwnj1pYATbqYakUgJV/C7406yGMFHdf2Y2zMZgeysK?=
 =?us-ascii?Q?30XUwwJjpWd1QMnLtadadXgoaq1hXGUNi5oDHQLatKZdF0vXNJjfW80AvUSR?=
 =?us-ascii?Q?8PRvh7Ww+SevunFI5epbwNy6wh8bb0ItrfpJADHOpz0TaLgAhr89snI8B4vs?=
 =?us-ascii?Q?DXAi2r8WukR2XocEWltqxCBh10nqEHX3UhfwEJeb2ldIncZVhC6QRTdKfFdk?=
 =?us-ascii?Q?Ni93qH/PSyEgHscZNGPUGA7p/TMtnP57Xv8VMhFipR+ECbDGiLEGRbea/HhI?=
 =?us-ascii?Q?4KCxC9gGYbPOdevQqhnlRaLzOl7lgTh6gjW+PdvrVMWS1xqJCO3gatu+1nOc?=
 =?us-ascii?Q?FVDEwxQ485wPvxWFgUlQmRES5LxARKxB8MyPv6J4yjGsEkh3lImQsPv7bvFO?=
 =?us-ascii?Q?+EM67dnJQaQiJrGU4wc2x9p5NCHejwlJaN3fjtbhPhktW+FzkXXmRIe3fDhW?=
 =?us-ascii?Q?EfZS9vvSV58OG2CCYle9JqFVTgz04FSsuxlHgODatEA5INXlZR3pIcIyq7Ew?=
 =?us-ascii?Q?jB0yl7apCTZy1fQUOMXThVw7sin1uzZD8kEvpInhWZeq3u8UU7vaz+D9Thg2?=
 =?us-ascii?Q?DPQwExOMU2GJww0oXJeEPGPD8l4iloLcPpFq35MTPnJSg93eJA4uFIMAZb8X?=
 =?us-ascii?Q?AA4iViHw+WwP8/fx86J2jdb4iGOZxXv4BmsW4aCoSCRTkyaibV/Bfl6e8fgo?=
 =?us-ascii?Q?3B2Cc9SYsFAWHovheV7maF4JpoY+i8z19EnvKa3kSidlAeV8vH7JalGpwzOE?=
 =?us-ascii?Q?pk5aG5VqMNUNk5x/u8sWpbMfIs3M9pJmj/BXUo50nfd2twRFwbITdjTQb7yp?=
 =?us-ascii?Q?NaInw69lMSlJBhTPFhr1K9VKk/xjORbEmGF2UEyf2+plFwQzWunmeya3QApg?=
 =?us-ascii?Q?VEeuKQZdWOSn97b3jYpBcktoqEDElgOPi7Mi6OFiX8In+DLkVgaWa2O41G0F?=
 =?us-ascii?Q?BmHrCe/h6UnUgPl7Oft3VCfhvCQepUuUhP1zr+qX2lZS6pu8ZAD9tx50XD8C?=
 =?us-ascii?Q?F+qq7dtfAdWewAOiJVjpKRQayZPnH6VUh0YvXCoAgKQ670dpflhJwcfbkzj1?=
 =?us-ascii?Q?m3ZpJZ5B2ZlRVE9EwHtm2hHWo06t9UuBOQlmpPS6aKZGNQhWAZLZpOngCUVP?=
 =?us-ascii?Q?B7hA/KHqU4FjHxHTcdLUCcl8duus/S1bLgl+gxvzey77pNVsedPuTJYv2j8k?=
 =?us-ascii?Q?J7Q3f0Qa1sOWPF8iiOOvgg2TcY2HepdlvUGVJknrkm+nTwtDOD8jKx7R6fP4?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d2919c-38ad-4994-4d65-08dd72cc0ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 16:24:47.1996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqqQNZvcdmMeYvdjp/+LYASeBYybgQe4wCpvhmlAYr3K8sFFMqUpLj5ughh8948PieODGzfJpMwyHcxm5FvEPtPd40llrlFoX5Gh6rNmdJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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
From: Briano, Ivan <ivan.briano@intel.com>=20
Sent: Wednesday, April 2, 2025 4:22 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <jo=
hn.c.harrison@intel.com>
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
>=20
> On Tue, Apr 01, 2025 at 10:26:54PM +0000, Jonathan Cavitt wrote:
> > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_=
FAULTS */
> > +struct xe_vm_fault {
> > +	/** @address: Address of the fault */
> > +	__u64 address;
> > +	/** @address_precision: Precision of faulted address */
> > +	__u32 address_precision;
> > +	/** @access_type: Type of address access that resulted in fault */
> > +	__u8 access_type;
> > +	/** @fault_type: Type of fault reported */
> > +	__u8 fault_type;
> > +	/** @fault_level: fault level of the fault */
> > +	__u8 fault_level;
> > +	/** @pad: MBZ */
> > +	__u8 pad;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[4];
> > +};
>=20
> Are the possible values here documented somewhere or should be just
> follow bspec for them?

I think bspec is currently being used for access_type, fault_type, and faul=
t_level.
However, I can add the possible values to the kernel docs if you feel that =
is
pertinent.

The address and address precision don't necessarily follow any currently
documented bspec specifications, but they should be self-explanatory enough
that it's not needed.

-Jonathan Cavitt

>=20
