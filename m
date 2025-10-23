Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF88BFF3EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 07:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B8D10E87D;
	Thu, 23 Oct 2025 05:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVtC5asg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2F10E047;
 Thu, 23 Oct 2025 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761197153; x=1792733153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XK0CErhnmkftpglDp3WHQUyF1RHRyKb2SIAMihpOAts=;
 b=cVtC5asgKKyz9Pe+KY7u0BoMNK5fqA2q917cfNxsaudbu8awmTWz2q8K
 Kzswz72g2BJbg2UR7C53HXba/CgXvpHutV3oRYK/LIKQz2ADunkVcPMc+
 tKI4s5ZC2wFB0bLSpiEKWeZYlaswSLyIqXyk1bCCzomKgrzNED1gEd4e5
 3AtFYhd1SbiCYMqJqx0JUk1demKXqRMJTMXkIZNYnrhM5U57TUH/BpgZE
 PHmbh85ym99/rz1ZrofwoHvsUpgMRe9L73QonK1xcwlHAFUWnHhwpSjpW
 lUIVcb9kIaI3xBbW8DRoliZZUGv+ERXt2UPL1CiEZ4lWnS2vYIYXwaaJz g==;
X-CSE-ConnectionGUID: arEFKGflRj2ncPKib/A29w==
X-CSE-MsgGUID: 2ylEKYH9Sn+1ry/w6L+fJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63265401"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63265401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 22:25:53 -0700
X-CSE-ConnectionGUID: qJHGBosOQc6ytE4nn2fHNw==
X-CSE-MsgGUID: BSL5sw+LSLOzaXjuKv5WHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="188109653"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 22:25:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 22:25:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 22:25:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 22:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTXvy6I0cMrh99ws31rnQ9ZB+MpRAgs7j9cAuiXmBHQmtCdZb2v7VERSZAeXG4K2KWZtVNDru2TL1OBznVaLTgK0wrQSbmsOktAHBUIbTVhWY4jvizY7NKzand5jtNryYOuRIJQB/OuK4MckBQ6ZfvrrmAlcI5fcTWVqO76n4Po5tCI2iL8TPesG3kjw7JHLRBFiVy8C1tYIoxiwZL6IW0QHVri4EY+ymqDsfeE8vJkxPQU1pMCvrsKdBxKC+RXlddTjjrxXCYMHfWrS1IvO7rDLzA5SvbSmIK5WeoyhekEkE1M+Bm9Zze00pRpZD+B+whiluYWFrmtqLC30H1Zk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzbwBO7C8Rh5FaNfHrsi3OI+pRV45r1PtKfG63VuaGU=;
 b=Pxm8hkx7ITT3IwZqRVjEXnD5zU5uUss3vCInXgVDR52H+lWR1370Qu7Gy9qS8iXQ4yTmIiPX/CF7XV8ycqYS7hzP+O3sCqaFJP0t1meu+vWk52SZbEKdAvJd4bDWKHIqVDUPsPgOzcREVAhdZOrPhT4mrmVLIeQ3JvfMLGHKeeBsxY5SCyO7nJxHUq6BIpUgbrxD0XdKuN4YqgjvHZIE7LBx1BgGO2DXAGVPmbNifKiz8pOrH5QYJrTMq1aLKE0ncThpclc+pjji5IGNPluW+kYf/lflyosDHT8lkmmsKsS1DOeM/RbXpGwnymFUq3zLySPJhzq89ZfcCtQsfk8RLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7116.namprd11.prod.outlook.com
 (2603:10b6:806:29b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 05:25:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 05:25:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 02/24] drm: Add Color lut range attributes
Thread-Topic: [v5 02/24] drm: Add Color lut range attributes
Thread-Index: AQHb6zDUYppFPl+w2kq8BvIq6aq1ErTP4e9g
Date: Thu, 23 Oct 2025 05:25:44 +0000
Message-ID: <DM3PPF208195D8DADCA1446748CDD46364CE3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-3-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-3-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7116:EE_
x-ms-office365-filtering-correlation-id: f2aa2cc7-312d-40d4-b8b0-08de11f49d53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?j4Ca5lbrDcG73X8yRP73HSiPwq4/cnoeEgKAdY2eQWy5kmBaBuzuQUXXV+WN?=
 =?us-ascii?Q?6zZUkctL+mhoWICMa0TWA1whDK4joK7x+CeDGgTB4YrsRSogk6eCyA6HWSMC?=
 =?us-ascii?Q?HAi0nia+DS7VvTCRHSuQ506FCqhpI3eulzXxQ+lvK+KhcGrpfVjDJiyZo5id?=
 =?us-ascii?Q?x2AIhbuzeF8taoQ7WVpWTMuEn1uI0qK47Cx/LI1aFchDAb2Xj62mDvdHrfpX?=
 =?us-ascii?Q?porsFd9KatQzPoC1QgiUZKh+E5LLNEjVpMMLl6Pbo5FgmkLu33DTTzosZ/IU?=
 =?us-ascii?Q?ey7uH0Hfr+uT2ZToCVia+BV6Xue0oK+EmkTVjzN4i8VjhYB2nITpM2dz1tNF?=
 =?us-ascii?Q?ybxgja7bcEw6ZF91MUk8T3GUmV7MUMkpOguSvUCZ6Cj08rqELzKEIQDw/UQ8?=
 =?us-ascii?Q?93ZozZTkMJjp2Ro8KS0BGn2pKDjS7eQLh1yCP7JdWNKfvh+aB6JzdkeSB3Tc?=
 =?us-ascii?Q?396b5XjDAcxfo90ESL0Dop+E928IgDo3RQeJOVk6aKKsp2Ad5Y2LTYpOv6Rt?=
 =?us-ascii?Q?0NAyQO7Oojxp8TP0SpDsmtDqG6OibIZ2xE5aB4LU82cexsHfnfnRy47nvWEx?=
 =?us-ascii?Q?QDuIDoKZ2RWE+46n8N698hgPdW9tLgYOLLgIG/lvH8yNtGNl2Cza//zFKxzM?=
 =?us-ascii?Q?i00wpe09gXMiwnOWRZz2VoO14SkJrPlANDeTFXCIHLkP2FdI7rUA4MN5Yy6N?=
 =?us-ascii?Q?B3AM+OVetKRWmEdWS6xnO7Hty8/U4YMtrgupG5GU1m7LNcNSPaOuvpJ4xPaQ?=
 =?us-ascii?Q?jKKmN3HT8gflgdku2lcYH07ScIFaYxeu81SZyvIBE5pAPQF/4oZFw8UUKfMn?=
 =?us-ascii?Q?jsJ9AqGfi5gNVw2Ck+V5sPPkHO9yCdjSXxm92Zf0363YBpaxPvQ/7Aru9zLh?=
 =?us-ascii?Q?PeRNDwPTFIH2u8xA6Ij1SvAcF4UWqQH3DdoJ2lglAoiorF8a1+oykC8wRZgi?=
 =?us-ascii?Q?qzMB9zNhyqPC6a3c0HvVhZLxZpQWdt9N0+bKSWo5XvYdEggmqH9VWToq1Hlt?=
 =?us-ascii?Q?RP0nEiX618j7f6L3o3qfeGCQBiNYgL1O1l3WpR7xujHIh1E+ToYLgwEqp8QQ?=
 =?us-ascii?Q?sMSwHlx7zQRG8J745vn0auQLmpmmGUGN9NnCKj9UGxcZs/454hEA9zur3grn?=
 =?us-ascii?Q?FrPNV/d+tYGhJ/8Tix1Ik6PF5II9M8+68GhXmCtj2BqBZQ2f8L7GC8J8FrIe?=
 =?us-ascii?Q?U6w3eY2/XITVkB/zJDHRTfNd/InaVgAyaVw4vfpEHSvFLEWlc/XeZsmmzE5P?=
 =?us-ascii?Q?5CxUexNVYhXEHENaZapnLBIqzm4bnGwMFFyzrJRVO3J7wxDanro9y8xlAZtU?=
 =?us-ascii?Q?/J5esaTdLka6m6OdUxzSWcFQol+0ijFUrH6CN0Ls9mDGp4JB2N6IqeQv7WhH?=
 =?us-ascii?Q?ba7SQLJM7LyO+rWdD3zJbBAJdwx0+oYkwCY1iTG+PXGowrtK0m2eXiNsbwUi?=
 =?us-ascii?Q?nns0Ychy4tru3ZDFjgNEdOQ1StF5FpdPpfjFUgrWIW0+LA8QQuYGGnYRhH7K?=
 =?us-ascii?Q?oJc7c1U5nGwXRJ/blIsFmGxLGbZTkx7CbeBs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9m3FsbZB7Xh8hOu0QoaBElKee/1BnlGNfXRp6sctZid8+oWOO8QOx4+bPCFO?=
 =?us-ascii?Q?82qdqyeZqKRoS+zLU8J1XgpUSNQXzdhItj7GWtPo6tobsUVorrMDjzjntZTH?=
 =?us-ascii?Q?CvpuTkeEVLmMkXig2aNS/FqDumOKXosNz9d5OFU0KU8SQVCA0dVhhPRJoQaA?=
 =?us-ascii?Q?vba5l1x76SgDidoxluAHyskZjO+/vKnA7yvYiSyU/1nJBW/54m0MsWTHaaWb?=
 =?us-ascii?Q?qOdktSoP0xLs+Bvk+9HcqeBQ1EC5NYnDFeFUrU1EltzuWJPuDGHqAW61VO4u?=
 =?us-ascii?Q?FgOa3ms4CqtzV/j5+wtSpQaJpp49pr28kd7zl0NZDe6PwHpv6TIMTiF+N5ws?=
 =?us-ascii?Q?v9PSYyZwrfHVb9hK46oNo+iPf1+dFkmriZCAkh3Sojh3qHsnkrwH0gSLBAMy?=
 =?us-ascii?Q?LnteksX9aZL5wfepcoRCb0PB3W2N7MjoiPjbIB0HKDVri1s6ZQnKcuh1TGOA?=
 =?us-ascii?Q?7wbYFV6gIjKj5J2LpCEONk6qjVMGADuXiiYhYzETy/MYH9o04BLIpHXZJEEF?=
 =?us-ascii?Q?YhFL6U3cmco3jRiDrK/LFX46/TU8DWRgpTwmtKN+E71llwJsyB8RtWOONjGO?=
 =?us-ascii?Q?/sq/cd4qQ0lVPX3A2BOh1m5INpz4khwe7Csoieotia3vGCDCI8vMjCEx8zr7?=
 =?us-ascii?Q?2tA0fSkHHIjASezBEHcpMHZBTPbmSZaVbO8QeREnxHyHFB26unwIUZl1YVyp?=
 =?us-ascii?Q?PJtybv3nETbqGpWsxyGHDiK+ZSyz+jhh+uBUpnWJ+IfO+V8rtlUrJfctk+lk?=
 =?us-ascii?Q?qR18M88MBOGqGpVeeNgNUAguPfs0IzjFej/hZ8rtEzCPZTdN9gzwTcuChttP?=
 =?us-ascii?Q?MNoGUR/+wqnxZl+aIPLir1PHkoZOcV490/0AKwFyyKAs7bw88HYCNl0aiqHS?=
 =?us-ascii?Q?rb3jpnW2/rxdyD5+hqiHFDgyP+Dt4YazfNimvfHoFwKJxdESssZz9LqWOOCk?=
 =?us-ascii?Q?tJrSgN0MaellHSQAMox3GcX47/CM+LauqxhS7lIGKOOSRRHXWcj8nK+qBewr?=
 =?us-ascii?Q?JZD9Zv3pGgtkxLNXXCAqARVz108Bt3vPxiZ4Zo7KWOH4m8eV4h9uOv/lnMFi?=
 =?us-ascii?Q?Lg0OsbO2pfLHbIvFobp98+eCZHWSPjQ1cOb8sj7gtu0/gDiTb3xDLmBO47ZE?=
 =?us-ascii?Q?NzKpIIE1j4CihG0AwOeNryuVFhfA+GqfetUECnLqFbHGlyGFbvY4Z3j6eckN?=
 =?us-ascii?Q?BCzBIHHUn16JPSkMy0RxxwmiATM3VY/UWoTXxe//c+VloQeWqf56q4QdO+bk?=
 =?us-ascii?Q?IcwPT/VTig14HmWzAZ+CFLDCNahWAVGvpUqnvqteHx62AYSmvpZoICGrYp+9?=
 =?us-ascii?Q?k6XsjN9DoBrKlD4q6vhcyOlmP3BaLGcCPT7GhpU9VoETSz/k/1IqnSwghhnx?=
 =?us-ascii?Q?KSr553q7WK4nOvhHon+1Uvv9r9GXBJEAQrqGJN9+28l2fr3sML10872H9l6I?=
 =?us-ascii?Q?owy60r9z+Qju6Qvr12WEf7cnwy4GYlE9+Oc4Yn/X8eCmgAFR8ilc7QybMax3?=
 =?us-ascii?Q?s6dmCgj32YG4eIEuZm0X3lh/9pvOyBePcIRZTLJ0xkbXZTaw92oaA6hsX9Fi?=
 =?us-ascii?Q?UM4qGBdrSgnyfS3IMliEVsFJBkXXPeqdVPo//zgO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aa2cc7-312d-40d4-b8b0-08de11f49d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 05:25:44.1811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKc5PCcWPLd6MpiWIpszz3U01qqH/L2hvZUyYpgh1BPc+3dk38hwGbq01Xed0vCFzW99ingKFjK7af9JFtkCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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

> Subject: [v5 02/24] drm: Add Color lut range attributes

Maybe use LUT since it's a short form
>=20
> This defines a new structure to define color lut ranges, along with relat=
ed

Same here.
Also make the commit message imperative.
So this commit message needs to be become something like
"Define a new structure for color LUT ranges ...... This will help...."

> macro definitions and enums. This will help describe segmented lut
> ranges/PWL LUTs in the hardware.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 64
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index ce14e7cf9651..dd223077f4e9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1127,6 +1127,70 @@ struct hdr_output_metadata {
>  				  DRM_MODE_PAGE_FLIP_ASYNC | \
>  				  DRM_MODE_PAGE_FLIP_TARGET)
>=20
> +/**
> + * DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> + *
> + * linearly interpolate between the points

Start the comments here with capital letters, and you missed a full stop he=
re too
and at some other points below.

> +
> +/**
> + * DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST
> + *
> + * the last value of the previous range is the
> + * first value of the current range.

Ditto.

> + */
> +#define DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST BIT(1)
> +
> +/**
> + * DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING
> + *
> + * the curve must be non-decreasing

Same here.
> + */
> +#define DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING BIT(2)
> +
> +/**
> + * DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE
> + *
> + *  the curve is reflected across origin for negative inputs  */

Same comment here.

> +#define DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE BIT(3)
> +
> +/**
> + * DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL
> + *
> + * the same curve (red) is used for blue and green channels as well  */

Same here.

> +#define DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL BIT(4)
> +
> +/**
> + * struct drm_color_lut_range
> + *
> + * structure to advertise capability of a color hardware
> + * block that accepts LUT values.  It can represent LUTs with
> + * varied number of entries and distributions
> + * (Multi segmented, Logarithmic etc).
> + */
> +
> +struct drm_color_lut_range {
> +	/* DRM_COLOROP_1D_LUT_MULTSEG_* */
> +	__u32 flags;
> +	/* number of points on the curve in the segment */

So usually the documentation follows the syntax
@<field_name>: One liner to define field

A more detailed description if required.

The same thing needs to be done for all other fields here.

Regards,
Suraj Kandpal

> +	__u16 count;
> +	/* input start/end values of the segment */
> +	__s32 start, end;
> +	/* normalization factor. Represents 1.0 in terms of smallest step size =
*/
> +	__u32 norm_factor;
> +
> +	/* precision of HW LUT*/
> +	struct {
> +		/* Integer precision */
> +		__u16 intp;
> +		/* Fractional precision */
> +		__u16 fracp;
> +	} precision;
> +};
> +
>  /*
>   * Request a page flip on the specified crtc.
>   *
> --
> 2.42.0

