Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E749DA74321
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 06:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006B910E983;
	Fri, 28 Mar 2025 05:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZ2Kc0fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF86410E99F;
 Fri, 28 Mar 2025 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743138379; x=1774674379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPN6TaOkZcZAdox5TUWXUUw5iUAwSJs/totOV224dHM=;
 b=eZ2Kc0firJeOofUJMu+grrDcy9YlwRM38q6cVyNsH8vtnxYBnkBxF59o
 eVzufj5LYL4DUSUM0HXTkjIyFsNnXLKnp99n/svIo15DQnV2hKKAPGgj0
 4nW8KHOEu76Fh0lZ71YfU7j5EjaoYrCIAqfeOh6FqsuGk6Bu5YRX9uf4q
 1/jAT9TrB5YNQrb62y5lPmlPJA/0W/Bq6idusTXmSa8dpf0uNnDWReQKf
 SURQR4cvgT6WuVp5Hzf1fubpZ5s2iCjerH4V4CEEBhEWCAhuKXI9BdBCv
 gu1PndwWLqndvryvTIxRJ77zWdWKM8Vt0P14artFcWPBSdul71117H36q Q==;
X-CSE-ConnectionGUID: HiRCUIxySUCrpdp0O8hwaA==
X-CSE-MsgGUID: X5DPXu/3SBWY2cYSppNKdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48366492"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48366492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:06:19 -0700
X-CSE-ConnectionGUID: hZt7P5F2TCCHcS4Tb7owew==
X-CSE-MsgGUID: 2DxZPWa8Qe6o8XPKrrurCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125799957"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 22:06:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 22:06:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 22:06:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 22:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8CM4xO6G0XPdQ1lS+YJ6p3paY8zUgG/C4XAT7yTZKptK8IQNM0AkJEW3Gz9RdMVYYUeo8tjp6Ty8CA0LXl7ImStJxSRXaHqN+40fw1WGC2cetrgG/3WEq9QwHOtQxiX80s3JFK/yaIsSDmZhhasQR15GaVj3qcHZcqEDEW5xEmvq+9HBRALg4Aux83ZeqXOxogEo55NiJ+E+b0UjIQUnf+3JoZA9aaYRyqOObLBdyw4kxQnPqCJksVFyVC8/Q14tXkuo6JFkbt6wqBgNaf3DW99MfQGkl0+Ua6EufRtlTCqQNFaRPGE+gAxlfTkPBnnPL1QMW9iBPbbs1it1BCemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iIMllTpJSEchY0OKWxebU2oxNGIELI8/zapr6roLWQ=;
 b=isoeayaGl8cmbgLU46RYFXuOITp5KOidLhw+zv2jSNXH4M5ATTN3SCs5oWW/jE2gHoNAyM1dVrbhiIpyHGe3dOYmjhtrzu5p5zvReCXNpuROo+boPocX0zq153A7IXbJqe/8hWBI/Zl2UUhZeUS2FmWudkycJOkqMQQetmofi0e6/iG/thZcuOu7ZjMFLJ8LPhQjbGxgmuG4Dwkhb+ZmFRd6Gx4UGlIrai+1yUQ77ljVPS4xGl1DQQddaikoK2sChVf4F9iEwZ7talHbpwKQaxbZW45Gc7EWAQWhaMIK5zKAjtckF3IrXysG5vhDrRbuEpUkGtM0htkA8Pcp6o3V1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 05:06:16 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 05:06:15 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>, "Vetter,
 Simona" <simona.vetter@intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6G7w9j1lfJu02jbAwOIME0fLNLZHIAgAFIb4CAALFTgIAAw7qAgAJZP4CAEMRZAIAAGCkAgBlP9DCAAWiDgIAJMiMAgAHHjYCAAVBywA==
Date: Fri, 28 Mar 2025 05:06:15 +0000
Message-ID: <IA0PR11MB7307082B787829CA3569F25FBAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>	<20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
 <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
 <20250220175047.412ee8d4@eldfell>
 <95a3e35d-2c5e-4861-b7bf-f38815a44e14@intel.com>
 <20250303112010.469b9685@eldfell>
 <IA0PR11MB7307CCBB82AF958121A6B3A9BAD92@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250320112309.1d9c3e09@eldfell>
 <IA0PR11MB73070374E14C44DA1C7EDFA3BAA62@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20250327105925.1e9e8609@eldfell>
In-Reply-To: <20250327105925.1e9e8609@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6504:EE_
x-ms-office365-filtering-correlation-id: bf4af93a-5e42-4e90-5ef6-08dd6db6448c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pvwbsbtVDggKZ2wwUy8CBfGs7vDTiJkjYqipSNgJT6n8PnrKEmovdEfhLtFR?=
 =?us-ascii?Q?KneKSJNYUaGLAtce0TU+XQ1vRvHWJcil0Tg+76AIAd3QEv/12q+qoIdj/DZ9?=
 =?us-ascii?Q?jM+I/nWmv1LHFyuzlIWiiyKPmphwdUjnszACCKHeCvP2kBphAl4RspslPvv1?=
 =?us-ascii?Q?Po1S5fywSM+TdVuzo4rf4D/8PtOhUv9aTJ/qe42uYUkOVy2slzmbP4MzZbxb?=
 =?us-ascii?Q?3V3sKQEJ3LhBMjh83netfj+KgLWFU0PH38LjNshTrTIJnHH8WiRlng5bAA2s?=
 =?us-ascii?Q?w5HmBR2NPxQ+rofgAJ9SLnfGOCgQTM4YCjLI1sFa51n4ASJhGyejb84TgfdV?=
 =?us-ascii?Q?WqPmf50TvbLTugcrDb6tdnNAz/hCfBkmPH6/rDc6IEPC/FW7AkDeEi1PLjso?=
 =?us-ascii?Q?W+mrfdBoW0lkpxywyJV1gze0QjbOY/ew073UoGediuTXVen8dsl6y/DS4LR+?=
 =?us-ascii?Q?NYFVdHW40aeETPczLVehDyUBWwnnjsKLQ9W1eBi4H6dje0CWvZ33RZEZNyR3?=
 =?us-ascii?Q?85WXhCihETRzHmoUQf+nooW4NNY+PYo1LGy60h/RdQTeaP0KiFgG9X/lse2w?=
 =?us-ascii?Q?47cO0KP+iTsk0RKO5pH346BZpk9Coh2YBeuwD4Q9p8EGbkFFR7c60PSjZTJW?=
 =?us-ascii?Q?+zEDkn4+VyCuSHHxiJzLvqktEikAvZ1CsnzYmu6C/mO6V16A8Lxkir5llkiH?=
 =?us-ascii?Q?w1DTmsjWhX4PdJ3PMxUpRdhOkBeP4D3D2vSyR743bSzjg+jbtAsiuw2CuxaG?=
 =?us-ascii?Q?Cl3maxndFJD9sSiXB6XA55LGIt2wlMwSDas2KkpiKrHGwZWmRET4mgHrwcXP?=
 =?us-ascii?Q?N36RLfrRJ8v3Tj07LApBCt9US3QpDpip9Uqt6rzCNPh5G/czHa13sXNPwOJ6?=
 =?us-ascii?Q?CFqYQzbWuZMmDlXlrZwZ/4qWRy7SLi5WZXwb9++v8V70XwtOZJyGCs4m67rT?=
 =?us-ascii?Q?roSIYqBmCYNIcnD1bcaiJ/GpIpcnNXtE3jCio5ql6Bkmk0QSLTVDXSY94slC?=
 =?us-ascii?Q?2qhgQABvlhXxpJAsloL6yczLgu3I9BpuSyvGJ47nI0faOzdqulUJH8Odxsbr?=
 =?us-ascii?Q?quwoYU+UBsIwRdMsmZJsu5fqyokyNxlmyvXZbHBdU+DK8pajKf0i8HOluKo+?=
 =?us-ascii?Q?MRlEZGUgkJqgMJA/FiNjpiGJqQVaWfYm4NeJWBEAKCmNlO6hXssWY4odG3bM?=
 =?us-ascii?Q?q+Z2FqmiEEXhE1F2PiRdX7Ao+k5mfVt6U1zLFnQejTdyGDjQdJ+ZYV31hjVj?=
 =?us-ascii?Q?t2kgHqjsGQTuS1mYb3MHjle3jWCkVKByvmuiSp4FulhUunWn3+3Qm1QGa6s4?=
 =?us-ascii?Q?IC3wScbXk7zHNWGqahb2ZXYkeZDzJcWzcd5+LGHpRXVN3kW7gcKYVquGxjWM?=
 =?us-ascii?Q?VMwl5I4zTH3X6IqQ6zmttkh1PL1vKsWzCY4ZHJk3m+DOijjPZqHCuCpK8uAs?=
 =?us-ascii?Q?LPeLt30i0PBibYEbEFlFNi3k+mZil+Az?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zLVsEGjckXsK25TXzg/H8KZ3C8m80yAKlRbeoVEz2nnUzeKFsxO5m9XCYYOC?=
 =?us-ascii?Q?Qsho5dRYzMfKOzKFc6DCWldEzfM5BJelJB21XsYnSNsyuJrm2TVG+OEZJrCJ?=
 =?us-ascii?Q?zpfmvNFPyr6jVcoZFk+T3NuAT2JBupWBMCKWNOyW7RP9/KTZwqy30wCTtoVf?=
 =?us-ascii?Q?k89bH0VU1MtHrH3rbWamY/t/6OA08yAilvHdglDRqrJ7bWtheZnkB2l2s+C0?=
 =?us-ascii?Q?eHLQy2QLbszZia3/+S7TBgY+QARh59y3QRH9b8ytgOel9qkrExh/vMsnBTMW?=
 =?us-ascii?Q?1i50BsbXbjNii1sxtpQhDW02XHeo5BqqcAho+AGyPeThL0nhk8gYPOZ5hGLm?=
 =?us-ascii?Q?mBM0XTHHH6W/IQeadk5/btQwrhYLwqeoZZpc0uEVse8JZH3PDrnGse6V4Fi4?=
 =?us-ascii?Q?yDIJ15aeQC1wtOL+45fJGbMGDpwxKxLlUkyuOmZS6ZNt3w9Jf+7NMvZmgYsl?=
 =?us-ascii?Q?tnXE3wfQqv1G2qQGPZGCXxglr0NtKYEuKc+/LDreNgthFtnDzzJWMcar0D2R?=
 =?us-ascii?Q?BcxzjeVjO7BbZZKFz+rTYvr//8L9+1VJzcL0wUm+bC/2egqSYifglgDHtEo7?=
 =?us-ascii?Q?ogY1R5Pq39TXpOz80U9bEoM6nOSFoc4hbV6Q/ohvr33VkX0iE8usFfg3xQ9T?=
 =?us-ascii?Q?j7fRH1RPqSgBhukpe8TDfsvSNgzDNJSmTwpMqho0W3puKkgksDEen/CC/aPh?=
 =?us-ascii?Q?16Ep/PfVz9L0BgHr9/dSzULjhubH0k5AxMOTdPqL46lL5clWa7RChALcZB1x?=
 =?us-ascii?Q?Kri/+1IOgtG14ZW9aalMXQDRPRfyPJPI76/jDxMia+SMgBZ47rqYKy5whvHn?=
 =?us-ascii?Q?TyqH3bmCmH7ThbA5q6eJiLozRPBslZ9Juatd8aqHZcuaWKR3Do41NyBjyaUv?=
 =?us-ascii?Q?4dfXuo8i/7CsMl93CqLj5JNLPFu6ZtYr2AWmOv7k5I12uMIXTh0n2om/eRbK?=
 =?us-ascii?Q?7mYLBASwVZ+eRYSJuUYGydNuLR3TL0iNVR7xDrbiIHlW+155cJ+pEUxxlDVl?=
 =?us-ascii?Q?RrvQqJP663BRs9CypHv6KbIH9KnT98M6CsGEY/1luVU49lp3cEaaFeNn58TC?=
 =?us-ascii?Q?v/7XCQ3KVjlQic49sZdOZbKc5DXiNYzRApR6u+ZGm9TgeYPbWpduy3Oh2aeH?=
 =?us-ascii?Q?BRG5pAqDeIsZQhpS8prZFDSxslldvAlA1WLj37TksYOtdMsBPmVTJYczwQcb?=
 =?us-ascii?Q?ZXgbQ6r0IAovXyIU1+4cl9gZIH6av9Bzss5zlic+l0q3POrc0ZdXmsQTRRLs?=
 =?us-ascii?Q?AgsoL8c6amCqZ53yZqUAuqG1S/FkqMFlUmWWlmn8mvwbJT+YJafCzgHylk0q?=
 =?us-ascii?Q?G4gACGAhs1DtbDlCRM8wd5+CWVjKnGHVa3HEE1bZIMX85Pe1S68iNX7xVbCF?=
 =?us-ascii?Q?MIxq9PjtP6bfrqcZvKfwt9gU4qOL8ogEILeXxpOQ+RLiOmfH3lD6xncraYcW?=
 =?us-ascii?Q?ZJkC+hHbgv1FKuvW3sX4jjw4ClT6jcJ/558n/JsoEn9UtW14hwwzCakIktb4?=
 =?us-ascii?Q?4LbbO12Ww9szuHpjXD3XEbgwWzFaCKUGAZPv9o+QYeDhXZ+s4bznUuKuFTlC?=
 =?us-ascii?Q?/wnyGGcEwEhudEjxKQew1UfKV2cnDRZo+V4ueXhc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4af93a-5e42-4e90-5ef6-08dd6db6448c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 05:06:15.7738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDIdluRN+1UjwcF5mwWmC7jJ/S04Ak++ow6+bJJZeNv5AD8i93iJd8qp0Nmb8bqOBYF4xHvuA4Fs4TgiwyyR+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

> On Wed, 26 Mar 2025 06:03:27 +0000
> "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>=20
> > > On Wed, 19 Mar 2025 12:08:15 +0000
> > > "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> > >
> > > > > On Mon, 3 Mar 2025 13:23:42 +0530 "Murthy, Arun R"
> > > > > <arun.r.murthy@intel.com> wrote:
> > > > >
> > > > > > On 20-02-2025 21:20, Pekka Paalanen wrote:
> > > > > > > On Wed, 19 Feb 2025 09:28:51 +0530 "Murthy, Arun R"
> > > > > > > <arun.r.murthy@intel.com> wrote:
> > >
> > > ...
> > >
> > > > > > Hi Pekka,
> > > > > > Sorry got getting back late on this.
> > > > > > I totally agree that the UAPI should not be any hardware
> > > > > > specific and have taken care to get rid of such if any.
> > > > > > Here we are just exposing the histogram data and what point is
> > > > > > the histogram generated is out of the scope.
> > > > >
> > > > > It's not out of scope. Understanding exactly at what point the
> > > > > histogram is generated in the KMS pixel pipeline is paramount to
> > > > > being able to use the results correctly - how it relates to the
> framebuffers'
> > > > > contents and KMS pixel pipeline configuration.
> > > > >
> > > >
> > > > While working around this comment, it looks to be quite
> > > > challenging to address this comment and agree that this will have
> > > > to be addressed and is important for the user to know at which
> > > > point in the pixel pipeline configuration the histogram is generate=
d.
> > > > I can think of 2 options on addressing this.
> > > >
> > > > 1.  Have this documented in the driver. Since this can vary on
> > > > each vendor hardware, can have this documented in the drivers or Re=
ST
> document.
> > > >
> > >
> > > Hi Arun,
> > >
> > > this is not acceptable in KMS, because it requires userspace to have
> > > code that depends on the hardware revision or identity. When new
> > > hardware appears, it will not be enough to update the drivers, one
> > > will also need to update userspace. There currently is no userspace
> > > "standard KMS library" to abstract all drivers further, like there is=
 libcamera
> and Mesa.
> > >
> > > > 2. Maybe have a bitmapping like we have it for histogram_mode.
> > > > Define user readable macros for that.
> > > > Ex: CC1_DEGAMMA_HIST_CC2
> > > > In this case histogram is between the two color conversion
> > > > hardware block in the pixel pipeline.
> > > > This macro will have to be defined on need basis and define a u32
> > > > variable for this bit manipulation.
> > >
> > > This one still has problems in that some hardware may not have all
> > > the non- HIST elements or not in the same order. It's a better
> > > abstraction than option 1, but it's still weak.
> > >
> > > I can see one solid solution, but it won't be usable for quite some
> > > time I
> > > suppose:
> > >
> > > https://lore.kernel.org/dri-devel/20241220043410.416867-5-
> > > alex.hung@amd.com/
> > >
> > > The current work on the color pipelines UAPI is concentrated on the
> > > per-plane operations. The idea is that once those are hashed out,
> > > the same design is applied to CRTCs as well, deprecating all
> > > existing CRTC color processing properties. A histogram processing
> > > element could be exposed as a colorop object, and its position in a
> > > CRTC color pipeline represents the point where the histogram is colle=
cted.
> > >
> > > That would be the best possible UAPI design on current knowledge in
> > > my opinion.
> > >
> > Yes this would be the best design, but looking into the timeline for
> > this CRTC color pipeline can we proceed with this as in interim solutio=
n.
> > Once we have the CRTC color pipeline in drm, will rebase this
> > histogram to make use of the pipeline.
> > We can also take up the crtc color pipeline and will also start
> > contributing to get things faster but since there is not timeline
> > defined for that activity, would it be viable to go ahead with option2 =
as in
> interim solution?
>=20
> Hi Arun,
>=20
> I think that's something the DRM maintainers should chime in on.
>=20
>=20
> Thanks,
> pq
>=20
drm Maintainers, any inputs on this?

Thanks and Regards,
Arun R Murthy
--------------------
