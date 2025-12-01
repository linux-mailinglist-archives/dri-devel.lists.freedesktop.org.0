Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479DBC990E4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA2B10E490;
	Mon,  1 Dec 2025 20:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDNtkm26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230C10E487;
 Mon,  1 Dec 2025 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764621525; x=1796157525;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IMw5Kguade7+qE4ZIQplYkqKHRB7IZfF7G3DS8b7tnI=;
 b=bDNtkm26EvXYucClsgs2jGW2neK9NtxDGouubD8QPRe+F+skh6otfFkA
 p//6c8hJULIckUC+BKLfDvYvAml2pzpaZUOvp/tI9gAKMx6LuXh1+9vvM
 RY6lBjcGF6XkP01wkRJfBdDAopy8KkL97h6itMBUO1gq9fo3qCMV2Pk8A
 cfEK6fNK4Wm23V7fR9TkediAaLmK4oLGsbwJecBN3X/5i3w874HV99DU9
 PP2SdhMbir803rv/aRYQrW5PhgQvGxq8mEe6SkBeVtPF3Gh/8hQLX2Hph
 qToHkRvzFDBDsAniyPH9iVTAl9hW6rBIMMP0GswlVWU0Xjo1uoz/jHD8m w==;
X-CSE-ConnectionGUID: e2f7lVFsTLSMBNOng4yRew==
X-CSE-MsgGUID: vmctrV71Qiixidi/rH1U7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70423116"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70423116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:38:44 -0800
X-CSE-ConnectionGUID: 9zA75DMbTyCNoHuekcTLng==
X-CSE-MsgGUID: +ayU+E25S/qszqCXZj6Qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194973132"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:38:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:38:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:38:43 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:38:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFrq+rCf7MdP3m56aRvMt51gmnS3KrguRfYF96//ai7voWs6O3mzkZiH3AgPrldSEO0Yuk2NgIWhUprvuCVKMBtQBEvy5xukfVKqN1En0wDGwDdxvHZKcjoYx8gjUvAF0RlRrAoBr70pvy0S3REgGXoHDiEcCIIi5WCH4uYeM3Qmme4Rd/IAtWwIp7Z80qjJtVgwdmS+WbhPjdWgqGUVsaEn+maAtYbB7Id94Aq1m1Z5VDKD7yhqvVQYZvoXOaYKfNCOywSvv3L2/mfwlio5Dtwth8MWj+8iigN6VKXXFTtK+7CE6jmSFbZ3LLaaCuNA9kiHLNz0myyjL5iXGquwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK4lTpqSJO05T51LeEBGV6edVXbBBf3t3SQnzm3OU3Q=;
 b=LDKJT4K9SwWDkUy4NYeAiafx4skjFZNbiHzLFPgGVcpyVHejrje7NcUFo5UbKlWzo28xPWQEt3xqd8VfqFLmnHIbdFYHlI8Fbsq/RqjKBhsEq9mbmTUPYW2Ab49aW2M6xdQPw11Ahxbpm4sdw6QwgyVb9Z4vGCert7oGLAx+rsPyyi0YH23ck3/73L/YCC13axX5QgFcSBSW69VZSOT3IPWnPvHGbj7ivOdXHhO7Uwp+WV8tBqN1Cp2MUFsrppdN6PW4MMWhV8r1TbhUMjZ5pFodTv80N+68sKebOgd5m3f1VKGnNoFnhk2LnaIEAxa+W6XBHQM9UUkc8BeQlKnqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:38:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:38:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHcYuo1LRVeBLM3YUGnI2LefzW2+rUNKKMAgAAPYNCAAAZuIA==
Date: Mon, 1 Dec 2025 20:38:40 +0000
Message-ID: <CH0PR11MB5444153AD1DAD1E73B7C883FE5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251201174443.139151-6-jonathan.cavitt@intel.com>
 <20251201174443.139151-9-jonathan.cavitt@intel.com>
 <aS3p9Cwhwu8tWFNb@lstrano-desk.jf.intel.com>
 <CH0PR11MB54440A4D690DE5A8730EF7C3E5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54440A4D690DE5A8730EF7C3E5DBA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4588:EE_
x-ms-office365-filtering-correlation-id: a601381c-5a45-473a-2b6a-08de31199cc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rk6Vdig/6K3OsahUYUmNeuhCNuIbJrVPibZF11Fx/wmU1uauutoOsJO/n8wG?=
 =?us-ascii?Q?zkLt8pnhObh4pxApTvVKkW95ieC5iOuyqdPV2+QO6YDFF+9sIarH4odc94IO?=
 =?us-ascii?Q?iRFJ+qwQ0qKoF7I/yxB5FcZa15pNzf+lYroquiWTKWvt3kllHrgvm3sly7HB?=
 =?us-ascii?Q?QUyRf/1fgO2WBhrl3SIlMofc7WLuVOKUZZ7eeq/ssOkYuzIcR6sCJyMyOX03?=
 =?us-ascii?Q?7tiY87U+vEAfLhQF1Tp6qZunA29fFX4rRkX9CGH12iISk/fFuYXerw8AamDP?=
 =?us-ascii?Q?E2EdiiNs/anVl5XqHq25/6/eCh5VwFU/Ln73ljcoCyRI3k3wcUzq/aIOPzK+?=
 =?us-ascii?Q?Ao+o3dBdPEsaBBjEj/2lTNzIRKxFe/Ej+XZShGgCSwvo2Ia6X8eCpVQ8TYON?=
 =?us-ascii?Q?HwCKpKH6u/zvANuTl+6FpD6gsnN4cD1Akhv2MkeLK/qQBkn8y1S1NthoA1Vp?=
 =?us-ascii?Q?SYlrrUJW4wMkTRlJrpIX6DM9KHQ4TbTZTfaRz7+2nY1dwPpeM9Q0mTtJacxE?=
 =?us-ascii?Q?E7+QAtcsdkX1PjuOJuPE3C2uJmTHeLDSbOplIKgkbkYtbkdFAuDMIidqFjCH?=
 =?us-ascii?Q?q1oa/EMukaMkqZnKWA/06vaWeimZjPKfIIrYehx47crNu6m4Qv8t7HHcKBY/?=
 =?us-ascii?Q?Lqjs1aaKbdLSlE4SmvC99rCNcLMmCXmWE7KpN+LI53Lw0DCVNZ7x0mQzmBaB?=
 =?us-ascii?Q?q8/bl6dVWABZx9IQOrVUzQx/sLyyILtFCN33B0MgNGsiwcf9qSqWAGWfZcWy?=
 =?us-ascii?Q?9LY4uQ6vpwgz9+um1uRSWCvFgAkDVmxLi0xhUfJUv+HLBFOFt2Z9XmexlJO3?=
 =?us-ascii?Q?uN/ub3WDPDoml8TIALwS7JDl+qPW+2WJZWZxbgbJkqUkEgq9+kKq/aX4U8dx?=
 =?us-ascii?Q?0crWtb/HKq/M1D09ooJOH4AQa359vyro3/rSylofvFWxCMOsPyoZ5JcN32Om?=
 =?us-ascii?Q?We7pFcdS/nonoJLvjvnLuWOvxvltqHmr09QRXRsGXC3Sp3EYLsdZB2k5twmE?=
 =?us-ascii?Q?HjFATl+Ip9Dv7kg4CZu92fu3zLEWmqKpYrJCECuNDglr/9tQHuj87YqI8FMP?=
 =?us-ascii?Q?EyKRuhgW4Q1xnC5MczgwA9+a0jmfbbfs35Aqs1E79XfIwNKsxmHdJeBeDy7M?=
 =?us-ascii?Q?5cIdXnO06Fun3GDYCryx72QefBXxqDemuhDEZmbU9SpaOOiqGrreXYwFB2mI?=
 =?us-ascii?Q?ymfUyzcBTcaq57eOOKQiodsGHxtz4zrgMd0Lh3qNLzxl+MVFO/q1vfcvv2MD?=
 =?us-ascii?Q?cawYaD77iySdZ0Abj0AiVPk85uf9PATTNmee+Mwg6SoF97WAdNi7sfY7KP6F?=
 =?us-ascii?Q?tFhz6absim1rYfr+CQtPGmiGgmoxCQICuLXaRx0vJvzzx/ffgLM2nPKrifnh?=
 =?us-ascii?Q?8VcMKesE+26u7FJsnQK7CiGXp5QvCHd5iWFEGvG7Ov4wXgx0M920t2Z4sWB6?=
 =?us-ascii?Q?2E1I3qaX0xSn3ZyQN2X6Xon0DxqndEkObkNHOdg+UGmZYt6p9P4yk7ASjXZE?=
 =?us-ascii?Q?+wTMrL6eyW33xl/9Wq8RZ2s8LfGW/+FNfixy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sYRn+rQYOZm3jH4sg86GlrKORCyJX3mggUKZkoabTReHnITPh7kSE2fSaZiu?=
 =?us-ascii?Q?a8h29ehx7LDEesnoghcu2RvMl0GXVd0ebQ3Ay/JJ6ma83nrRUxJzdXxSsOjR?=
 =?us-ascii?Q?glEDN4k4Bv45qvKsxX90Inrdq2vZlUh1P7fEles5ohSNAHNasWu+w9rZf0wZ?=
 =?us-ascii?Q?rI+ea9TyDI353tau2WP1iRlULHKGJ2gOeNB+Abz4KkKphZj+v4nhW8PZZGPg?=
 =?us-ascii?Q?QBitciK0zsGVcFaumpBHJU65uSb84y4otb9UNiGcRscrdBISy1nYK1pyIAHy?=
 =?us-ascii?Q?tjITuEIuKziAwNnbZ+LUyf35qOjq6IfRraxJfE/KtFxszmBXd8XnQLEoyZaB?=
 =?us-ascii?Q?JUkGMMI7fxz2pZ2brab8Aak4iVH05dJrFHXEW+N5SGg4QQlI+gsCr7lwo4oB?=
 =?us-ascii?Q?3N19XKNz5cr/3iLo0XSIDaMHd3jKHJkrEhN0ZL6srgGdKrOmio7HOuQ+QZub?=
 =?us-ascii?Q?qXzQ/qzvexbIwIw3u74Vh8Ow3p/XLIQw3hKp1GJZ/KOF9Uc4fZA7g93KZuPF?=
 =?us-ascii?Q?DBJZ08q3iD+UZBUMtJ0b8DtyJzjENw5CcN9QRwJLtXRN/c3diOWw59/i9A3y?=
 =?us-ascii?Q?SRXYsNPorvIbYDSaZSj+E+6qMvev9K8R5FXLhrsob555Ac56oreKHA10/RJa?=
 =?us-ascii?Q?MIMabjcwf7ehurpxGosV1gdCEaHnjjCoAOu+GXFeqoCsv8rAAHuQ47gpi1hQ?=
 =?us-ascii?Q?uAUSV2v4s8BqYSK/LyuTjM2dqlP4/CElwdhiYnK+bm1UMBC6g/pWbDMdFRnH?=
 =?us-ascii?Q?oPstdDdMY4WXGoMNAIsqfm4/hPeWYCC5Rw+xwfno89X2ctuLE6Wng1875D8J?=
 =?us-ascii?Q?+jzwPCbPjU/6VR7BKZSal6DGfV3zb2hX9QGBaIWotXz9LId3DjrEhnTveJQT?=
 =?us-ascii?Q?0Oi5FMpJloriootkjQVGxdt4ebziQlcK3hyZOuB2qB/QpydJ6p2valCI55xn?=
 =?us-ascii?Q?5sIQyxZWQvttjOkvQm3rlA97549KWJBjwOGg5U76jt/7LeJhmjGWOchX/SwP?=
 =?us-ascii?Q?Zd5UM/Uqin5Up8BUsABm6bJHzGbn7EokKTq5Kl9zp60mBUqaGi+BImnJb4ff?=
 =?us-ascii?Q?NZKL8IkZrPS5mw37cBpL+sbpHOz04hIaQw0Xo10aHyOOXm0T0VuZ9Uuw/5We?=
 =?us-ascii?Q?19aHi75rGYhyvKvqGRtVJ46QUBJah/WNrnlmeMWev5Esm57mQvNg8+r2Ts7e?=
 =?us-ascii?Q?xQG3Wkju3P1M/iNoh7aW3y9Gu3LQbzdMEXPbro7JMEThKkKGndEgQ10rnlAo?=
 =?us-ascii?Q?rtoluV0d1EJckA7jptGNqfaPA46NZejvh0BhECcrqHk5LkpGcBFYONndhCDH?=
 =?us-ascii?Q?Fg0iyuFYF1x6IkXTEFiMpTeadXHAsFMlPtxIZHkjiizpWAxePueceZw7ojzV?=
 =?us-ascii?Q?46uSkov8i7vQ/Le2XO5o2+7pAtm8LRNOCTo+LllhQyZKRGFk3IIIRqs5KEPi?=
 =?us-ascii?Q?qUrdTNpiot227iCOdVDNY9GE8QPxhqJ1Pu8UuTvRBUjFWJy3LzIvQWgHMW5x?=
 =?us-ascii?Q?TdfsQI8drFy8Dr3F4/rHkan9nHVu+w7LirVBKkBwWjlkNFKqTi3cx6MLtyhm?=
 =?us-ascii?Q?2CyyGVR3kpIyqMyZr7zI1QeGFdbeFDTQsluiQIhO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a601381c-5a45-473a-2b6a-08de31199cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 20:38:40.6436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmUmnpOTt+Ed7cXv43N34HTdIo4T0Dm2Z4ySaK+jhGREhhYe/uj2v9EEwJxt52exX5kAwoTE7QRKP4iDn54mg1IYYHdegOm7ecAxm9GRmyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Monday, December 1, 2025 12:25 PM
To: Brost, Matthew <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; john.c.harrison@intel.com; Briano, Ivan <ivan.briano@intel.com=
>; Auld, Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirschf=
eld@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
>=20
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>=20
> Sent: Monday, December 1, 2025 11:18 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel=
.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zha=
ng, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.=
com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@=
intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jad=
av@intel.com>; john.c.harrison@intel.com; Briano, Ivan <ivan.briano@intel.c=
om>; Auld, Matthew <matthew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirsc=
hfeld@intel.com>
> Subject: Re: [PATCH v27 3/4] drm/xe/xe_vm: Add per VM fault info
> >=20
> > On Mon, Dec 01, 2025 at 05:44:47PM +0000, Jonathan Cavitt wrote:
> > > Add additional information to each VM so they can report up to the fi=
rst
> > > 50 seen faults.  Only pagefaults are saved this way currently, though=
 in
> > > the future, all faults should be tracked by the VM for future reporti=
ng.
> > >=20
> > > Additionally, of the pagefaults reported, only failed pagefaults are
> > > saved this way, as successful pagefaults should recover silently and =
not
> > > need to be reported to userspace.
> > >=20
> > > v2:
> > > - Free vm after use (Shuicheng)
> > > - Compress pf copy logic (Shuicheng)
> > > - Update fault_unsuccessful before storing (Shuicheng)
> > > - Fix old struct name in comments (Shuicheng)
> > > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > >=20
> > > v3:
> > > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > > - Fix double-locking error (jcavitt)
> > > - Assert kmemdump is successful (Shuicheng)
> > >=20
> > > v4:
> > > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > > - Store address, address type, and address precision per fault (jcavi=
tt)
> > > - Store engine class and instance data per fault (Jianxun)
> > > - Add and fix kernel docs (Michal W)
> > > - Properly handle kzalloc error (Michal W)
> > > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > > - Store fault level per fault (Micahl M)
> > >=20
> > > v5:
> > > - Store fault and access type instead of address type (Jianxun)
> > >=20
> > > v6:
> > > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> > >=20
> > > v7:
> > > - Fix kernel docs and comments (Michal W)
> > >=20
> > > v8:
> > > - Fix double-locking issue (Jianxun)
> > >=20
> > > v9:
> > > - Do not report faults from reserved engines (Jianxun)
> > >=20
> > > v10:
> > > - Remove engine class and instance (Ivan)
> > >=20
> > > v11:
> > > - Perform kzalloc outside of lock (Auld)
> > >=20
> > > v12:
> > > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> > >=20
> > > v13:
> > > - Rebase and refactor (jcavitt)
> > >=20
> > > v14:
> > > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> > >=20
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > > Cc: Ivan Briano <ivan.briano@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pagefault.c | 26 +++++++++
> > >  drivers/gpu/drm/xe/xe_vm.c        | 88 +++++++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/xe/xe_vm.h        |  9 ++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 ++++++++++
> > >  4 files changed, 152 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/x=
e_pagefault.c
> > > index 0b625a52a598..5997023a5889 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefau=
lt *pf)
> > >  		  pf->consumer.engine_instance);
> > >  }
> > > =20
> > > +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pag=
efault *pf)
> >=20
> > Every function in xe_pagefault.c starts with 'xe_pagefault_'
> >=20
> > So maybe: s/save_pagefault_to_vm/xe_pagefault_save_to_vm
> >=20
> > > +{
> > > +	struct xe_vm *vm;
> > > +
> > > +	/*
> > > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > > +	 * mode, return VM anyways.
> > > +	 */
> > > +	down_read(&xe->usm.lock);
> > > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > > +	if (vm)
> > > +		xe_vm_get(vm);
> > > +	else
> > > +		vm =3D ERR_PTR(-EINVAL);
> > > +	up_read(&xe->usm.lock);
> > > +
> > > +	if (IS_ERR(vm))
> > > +		return;
> > > +
> > > +	xe_vm_add_fault_entry_pf(vm, pf);
> > > +
> > > +	xe_vm_put(vm);
> > > +}
> > > +
> > >  static void xe_pagefault_queue_work(struct work_struct *w)
> > >  {
> > >  	struct xe_pagefault_queue *pf_queue =3D
> > > @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_s=
truct *w)
> > >  		err =3D xe_pagefault_service(&pf);
> > >  		if (err) {
> > >  			xe_pagefault_print(&pf);
> > > +			save_pagefault_to_vm(gt_to_xe(pf.gt), &pf);
> > >  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> > >  				  ERR_PTR(err));
> > >  		}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 8ab726289583..e69e10233b00 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -27,6 +27,7 @@
> > >  #include "xe_device.h"
> > >  #include "xe_drm_client.h"
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_pat.h"
> > >  #include "xe_pm.h"
> > > @@ -578,6 +579,88 @@ static void preempt_rebind_work_func(struct work=
_struct *w)
> > >  	trace_xe_vm_rebind_worker_exit(vm);
> > >  }
> > > =20
> > > +static struct xe_hw_engine *
> > > +hw_engine_lookup_class_instance(struct xe_vm *vm,
> > > +				enum xe_engine_class class,
> > > +				u16 instance)
> >=20
> > Can we use xe_hw_engine_lookup or xe_gt_hw_engine rather than adding a
> > new helper?
>=20
> Both of those functions require the GT ID, which is unknown.

Okay, correction: This function WAS necessary a few weeks ago because the G=
T ID
USED to be unknown, but now it's stored in the pagefault structure and is t=
hus
unnecessary.  I'll be using xe_gt_hw_engine shortly, I guess.
-Jonathan Cavitt

>=20
> >=20
> > > +{
> > > +	struct xe_device *xe =3D vm->xe;
> > > +	struct xe_hw_engine *hwe;
> > > +	enum xe_hw_engine_id id;
> > > +	struct xe_gt *gt;
> > > +	u8 gt_id;
> > > +
> > > +	for_each_gt(gt, xe, gt_id)
> > > +		for_each_hw_engine(hwe, gt, id)
> > > +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> > > +				return hwe;
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > > + * @vm: The VM.
> > > + * @pf: The pagefault.
> > > + *
> > > + * This function takes the data from the pagefault @pf and saves it =
to @vm->faults.list.
> > > + *
> > > + * The function exits silently if the list is full, and reports a wa=
rning if the pagefault
> > > + * could not be saved to the list.
> > > + */
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault =
*pf)
> > > +{
> > > +	struct xe_vm_fault_entry *e =3D NULL;
> > > +	struct xe_hw_engine *hwe;
> > > +
> > > +	/* Do not report faults on reserved engines */
> > > +	hwe =3D hw_engine_lookup_class_instance(vm, pf->consumer.engine_cla=
ss,
> > > +					      pf->consumer.engine_instance);
> > > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > > +		return;
> > > +
> > > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > > +	if (!e) {
> > > +		drm_warn(&vm->xe->drm,
> > > +			 "Could not allocate memory for fault!\n");
> > > +		return;
> > > +	}
> > > +
> > > +	spin_lock(&vm->faults.lock);
> > > +
> >=20
> > Michal would say use guard(spinlock)(&vm->faults.lock) here. Probably
> > a little cleaner as the goto can be avoided.
> >=20
> > > +	/*
> > > +	 * Limit the number of faults in the fault list to prevent
> > > +	 * memory overuse.
> > > +	 */
> > > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > > +		kfree(e);
> > > +		goto out;
> > > +	}
> > > +
> > > +	e->address =3D pf->consumer.page_addr;
> > > +	e->address_precision =3D 1;
> > > +	e->access_type =3D pf->consumer.access_type;
> > > +	e->fault_type =3D pf->consumer.fault_type;
> > > +	e->fault_level =3D pf->consumer.fault_level;
> > > +
> > > +	list_add_tail(&e->list, &vm->faults.list);
> > > +	vm->faults.len++;
> > > +out:
> > > +	spin_unlock(&vm->faults.lock);
> > > +}
> > > +
> > > +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> > > +{
> > > +	struct xe_vm_fault_entry *e, *tmp;
> > > +
> > > +	spin_lock(&vm->faults.lock);
> >=20
> > Probably a guard here too.
> >=20
> > Nits aside, overall LGTM.
> >=20
> > Matt
> >=20
> > > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > > +		list_del(&e->list);
> > > +		kfree(e);
> > > +	}
> > > +	vm->faults.len =3D 0;
> > > +	spin_unlock(&vm->faults.lock);
> > > +}
> > > +
> > >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_b=
inds)
> > >  {
> > >  	int i;
> > > @@ -1503,6 +1586,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe=
, u32 flags, struct xe_file *xef)
> > >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> > >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > > =20
> > > +	INIT_LIST_HEAD(&vm->faults.list);
> > > +	spin_lock_init(&vm->faults.lock);
> > > +
> > >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > =20
> > >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > > @@ -1808,6 +1894,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  	}
> > >  	up_write(&xe->usm.lock);
> > > =20
> > > +	xe_vm_clear_fault_entries(vm);
> > > +
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > > =20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 361f10b3c453..e9f2de4189e0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -12,6 +12,12 @@
> > >  #include "xe_map.h"
> > >  #include "xe_vm_types.h"
> > > =20
> > > +/**
> > > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can st=
ore before future
> > > + * faults are discarded to prevent memory overuse
> > > + */
> > > +#define MAX_FAULTS_SAVED_PER_VM	50
> > > +
> > >  struct drm_device;
> > >  struct drm_printer;
> > >  struct drm_file;
> > > @@ -22,6 +28,7 @@ struct dma_fence;
> > > =20
> > >  struct xe_exec_queue;
> > >  struct xe_file;
> > > +struct xe_pagefault;
> > >  struct xe_sync_entry;
> > >  struct xe_svm_range;
> > >  struct drm_exec;
> > > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_=
snapshot *snap);
> > >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_pr=
inter *p);
> > >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > =20
> > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault =
*pf);
> > > +
> > >  /**
> > >   * xe_vm_set_validating() - Register this task as currently making b=
os resident
> > >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm w=
hen
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe=
_vm_types.h
> > > index 3bf912bfbdcc..fff914fb0aa6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_userptr.h"
> > > =20
> > >  struct xe_bo;
> > > +struct xe_pagefault;
> > >  struct xe_svm_range;
> > >  struct xe_sync_entry;
> > >  struct xe_user_fence;
> > > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > > =20
> > >  struct xe_device;
> > > =20
> > > +/**
> > > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > > + * @list: link into @xe_vm.faults.list
> > > + * @address: address of the fault
> > > + * @address_precision: precision of faulted address
> > > + * @access_type: type of address access that resulted in fault
> > > + * @fault_type: type of fault reported
> > > + * @fault_level: fault level of the fault
> > > + */
> > > +struct xe_vm_fault_entry {
> > > +	struct list_head list;
> > > +	u64 address;
> > > +	u32 address_precision;
> > > +	u8 access_type;
> > > +	u8 fault_type;
> > > +	u8 fault_level;
> > > +};
> > > +
> > >  struct xe_vm {
> > >  	/** @gpuvm: base GPUVM used to track VMAs */
> > >  	struct drm_gpuvm gpuvm;
> > > @@ -302,6 +321,16 @@ struct xe_vm {
> > >  		bool capture_once;
> > >  	} error_capture;
> > > =20
> > > +	/** @faults: List of all faults associated with this VM */
> > > +	struct {
> > > +		/** @faults.lock: lock protecting @faults.list */
> > > +		spinlock_t lock;
> > > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > > +		struct list_head list;
> > > +		/** @faults.len: length of @faults.list */
> > > +		unsigned int len;
> > > +	} faults;
> > > +
> > >  	/**
> > >  	 * @validation: Validation data only valid with the vm resv held.
> > >  	 * Note: This is really task state of the task holding the vm resv,
> > > --=20
> > > 2.43.0
> > >=20
> >=20
>=20
