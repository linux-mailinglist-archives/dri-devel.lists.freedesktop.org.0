Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F8A70417
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060110E58C;
	Tue, 25 Mar 2025 14:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MY70BF+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB3A10E3A8;
 Tue, 25 Mar 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742913963; x=1774449963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vofa9fVqSHGWBd21YIEhC8wXBtHZJKdZeOu7aZA1ueM=;
 b=MY70BF+KsZB+cqowDeclnZLqBZVFl2odYCD0+PLUdaHmJphVcG8oPNHH
 elMrcBt5IGoYGY+sw+EUSc6ch0uQnC5AHu4BoUUEzTxnoC20sk2t6xIfe
 gUuRl83YpKfxjPJYU+M+WPL2NC66X+2a3MzsZ+NndjM7WpyHkhLFgkzwc
 co5C+ut0H12qhsqf7c3cUq4g2BDlnNiR5/LnRLZVWKqlNuZ+HUJfihIpm
 7nFS8kgNOJaiyQtxy7+VggkOofon2imRhYkHieaHtvGPrYxEAUOiCT8Ds
 dyt6HH2wrOlefd8INsY5/6EkdQVcX9mol1sIqXgcCeDuzlXnL1bEJLoKB A==;
X-CSE-ConnectionGUID: Qpd1J6mwRJaJMxfza8DzCg==
X-CSE-MsgGUID: tRStIW8TRRCH8bvFhIa4Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31767484"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="31767484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:46:02 -0700
X-CSE-ConnectionGUID: MH7BF2dmTEWxxWunkDKN8A==
X-CSE-MsgGUID: FXS5pTr8ROinsIW/GS3qUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124367995"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:46:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 07:46:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 07:46:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 07:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEcfc+i2YpyNx5QxPrMv5iItABeRgFFQUDdstST2U4pW99ZqumYm0L0+SW6mEoI8msklZXUBVT77UjpMDSLn+PLbVXDTwvjoJomLFbOdLsmbPCIqPT5VF62boU+t5AIPS3dcBpPtOBi7kaVxKifae1AY0jt247bfC2dihpfNlEiPIsazEppadSJ1eByWgTkLKthJdlQpTwitNdHZB1ndyC+/zIJEDSPVL/NwnazmzFgq3ML6ox5TGePWr0ot0Gwiy6o/3VBcWiZoSvXiJQeeXInnkM6v92ZJEliT5PTSsUBUaNNtJMGyeYY9m5CM2nU3o0aA2632rwv2vGn8xAQloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReGzjzzgr/u13Hc3jeh4P0lR41/tNzGHInJuIqBAVck=;
 b=fBHDZ39z4k/Sv4esHIq2n2f2Da7QKIg0sEIDmAA3/otURfgddmDQUd3940bfKhocO4fhw0rZbAcOYSouuksVjrl51+T4QKHJWdRRsp08rlc+3nZsjXm66Yl3ZQqNVlJXfb8nNB+09/DhLi44zfqt4CD+iM5nkMAZWGjmi9LP9eeBsWySAXm8tK/X/Kgp2OtMko/9KgjPCmybUNCUX603fn+rJZmjTo5T3EIimiszzpmb57BnylNLlxHFn+MEWYqio/j96VVY2uD7/dASnCImdF1ulGXIz26pcE4iZc0mTpXRNHpgo6j90ou0ZXzPmzbCrnjMsePlZwGcjuZcnYxn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 14:46:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 14:46:00 +0000
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
Subject: RE: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbnRHUJ6o9fMfhP023SUzR3Zt4/rODeBMAgABso3A=
Date: Tue, 25 Mar 2025 14:45:59 +0000
Message-ID: <CH0PR11MB5444B65CB663C9123B41F7CFE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
 <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
In-Reply-To: <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PR11MB8670:EE_
x-ms-office365-filtering-correlation-id: 81e1e86d-883f-4426-2526-08dd6babc246
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tBH/jZQPrv7nMJYMZJedHEj0/Z9Ghw7KDjvFthyNxc+yYQyE9oEW2gkvd/W3?=
 =?us-ascii?Q?hnymickIy2h+eC0DCfQbkXWfPNtYDee7BHAlxNy5QSrhKJkgE4WlyDoHaCbf?=
 =?us-ascii?Q?FX4BgqciChecEXA2nAmafFTTXt2SjKj+1r6/M+j9riM5pumUzQoJMRbePbQ5?=
 =?us-ascii?Q?6BTNZobbLrNAhh4EuOcy0iA9/rW68Nt/yRvlEB3bVDjx61PPY5bkXpISHbL8?=
 =?us-ascii?Q?YP58i8R1/4TjdNy5oDMgQWGA8NRdZWKaCQotZORrgXPz6SpojTBHLb+30YCp?=
 =?us-ascii?Q?yG9pM5O2YUJsCPraF00CiG+wS28CEFZ79Q6oplF25Y+5nVIAaRFkXFP1nLHd?=
 =?us-ascii?Q?Hw/rLibcC72rBwxyXivtxxKSyu4L2MXeVJCJzwx9tK9UOsnoMPaohKwd1TUj?=
 =?us-ascii?Q?PXZAhdy60DdbApNAFT29XQW5US4BMsMuVfsPY94060cyzCtyYBrbJEu45YkX?=
 =?us-ascii?Q?6APQsM9CBoMCw7lD+EGmoYACDrhTxetMbL8D0/rV7P+rS+h5hVWgTOGszgeO?=
 =?us-ascii?Q?XMFE2oyO08vhIZaEGqSaSRaSjmYsSzh5EGeAwSFSEWj41kab14p3UQJiPm+s?=
 =?us-ascii?Q?MmBWEobMLR7Pgix6MabHCNTNZ7b2E1rJ01gCvKiwg/L467ts3HfGDq/cPLaS?=
 =?us-ascii?Q?GJgch1T3hieuoWaVJLuZFeJIb9v0YvxSXDA3M0twBqOxobZ0DOA/V8u4LgtL?=
 =?us-ascii?Q?MrD2QVALLw/mgPK9Rgfao54+GWqXYORQ3W3JfE2y2b+xlN0372izsRl7+xLO?=
 =?us-ascii?Q?2KG1kTLsVAX7eyXSIhdLj7bbhGrec4CePhRGhSnH2mh6cr1mCixsVsohMSa4?=
 =?us-ascii?Q?J35UoK7xW2GQxdlyLDtHUtsjsgI+snJI04wR3/WD8LtY2nHa14TcJ8NM+REM?=
 =?us-ascii?Q?3w1eC9Qwa/MIeFLD7zN7jG50edkCvn23quMxgV64XqdnlGWBeclHt+6z5xfl?=
 =?us-ascii?Q?3kEfuDRJNtPQx31vvgLbQMqntZHHqXWIRgec5M/nxva8E2Yi1H9xVIdu7ZNz?=
 =?us-ascii?Q?VT8mv0NWenVCq/NsdCKOU1f7Z2O5UHPdOhfK37FD/04u8uKBCaS2jKYc7PGg?=
 =?us-ascii?Q?mT4VFxFSevZ7yuS62btvbkLIHo/MNcqbwhFjUDltAI5D5MHMHbImMMKXkYZr?=
 =?us-ascii?Q?LTo4otR30VJ1KsCazlmXD1+Swn0e+sOeQ3kh3x7GPknF6f3Dr4j9e4vLKIna?=
 =?us-ascii?Q?aIUBM2qsh3l6xbYiu3xp2AwyiFuWZ5+QjAKS3NX2Xk6JESF/uryOODMt+27z?=
 =?us-ascii?Q?HfLmsMJpPuPoHe3ZXwwnpU4MOd3LTBo6WcGCmK7yFhze0mOOl1YERmAmm2VU?=
 =?us-ascii?Q?fIxHLVIRKIL3AfCNKpXkld3y2unnIWOVGcWJ0dY3XsRcTxx0/V9Sxc/NgDhT?=
 =?us-ascii?Q?AasNe+6swwsDqIO6Pj2JJQXTo7JcIJk1svz388qxLhGuendRW6pR4pyU6H3I?=
 =?us-ascii?Q?8FnYD34C2Trw/QfESzmzSzAi6GMOmvE/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WYVnj/tnjq3ADjALh2iZWC5xTV+Wx3RR1rgiK4QFXlqZ9nYmHyY95xvHQsmT?=
 =?us-ascii?Q?e82jyD1ict0U0zmuOdjso/jEnkFNyRhfDcTI07EONH8fhqZ0n2oBt3lSyzt/?=
 =?us-ascii?Q?q+CzPrRG/It1HthS83qeiodMlqVZYjTKxgraFS5HbLu7u7t2ocoyY9mdhtrk?=
 =?us-ascii?Q?DoQgCJ6OYd8M0G6DGVJr44Y1HUl3EaIKlPYTHRUyfVzPDJRAvcNXMKYc1JBZ?=
 =?us-ascii?Q?SfWuby9Ec2vkU5rzHIAbfcDrm/nPefSKd2glbzxAUD2hOZaXPGuBzDCLGDUG?=
 =?us-ascii?Q?cQIK2Mug/b2+NYgV9Ceg1H53HMO0/RE+N/gQGP1/Djus5P2FvcUcKNO960xW?=
 =?us-ascii?Q?rPztPrSeRbGmbfDoEasDwBxi8TzSwnNWZX811QdayL1U94YnFX7a79bhNWHz?=
 =?us-ascii?Q?/1bV0GkyYlp4ffwyUie8l957t4FwPCj7neoO7UH5xAjVOIaQj+qYY0k0LLVG?=
 =?us-ascii?Q?HWpekZBjjWiV9oyG7viNVwh7ZFHL/BD16JcT4ae+JpYWm5SqghiXWolUwYo1?=
 =?us-ascii?Q?e40NKkdRaSJj9iU3Uq6xKMXprCqW6owhfSkODVShVpewRZWwu6AH62F0wiIX?=
 =?us-ascii?Q?pQnNQFmzN/rEqhBpRD/+dFN6l2yceLVtHQlHvEdonAB1cP+HkrFlrnk23VGD?=
 =?us-ascii?Q?gKmpxA0rnQHhggDF3zzniSzeRZPZgEvLiMU24ixSFKsPUlrmfFGSlwHtC3/b?=
 =?us-ascii?Q?jgRbpAkMweuu9lSFSRBq/H7be6l51CLheDFI4cb51npTbLJrhnMWcy3c+vvd?=
 =?us-ascii?Q?klzXJDbV0vp3v9Owgd0PEmntASWyVDfXJcARf6MREnAPA1AhJA1K+7rvR9vs?=
 =?us-ascii?Q?O6IAmxKMsK1H9lNmkvO7ZEi740fs46jUeeVUUn+u7BJI1E7eIKmVW/K0r2yV?=
 =?us-ascii?Q?zbwU5jFL2/DvVJh/7zEH9eOAy/e0PX4aYlY3DX2onyM11f5LFkooIhXIOqnW?=
 =?us-ascii?Q?tg4DmOLQvqNi4WNyMag27U6zNsG0uvJsbtWePW3Q9STQRTIsJS/wZWiAhPYz?=
 =?us-ascii?Q?Ps7xz42zbF7XCpH1Rz+6gLG+TkkeITgJ6Tn/urMikrr8/4lljITN7VchU5ev?=
 =?us-ascii?Q?aDUHH/KrTp4iOLG9ihBJgzTtSFhs7pgWF8rUqjIqDyJuodwO2vVY1Ay3yaVE?=
 =?us-ascii?Q?9qv21xxnzCKDKYf2CPuoN9RgEZo6PrgtJ9zQHYVq0zhYvESZAan1dUBnvEfx?=
 =?us-ascii?Q?Lu2VL4NKrfpvP4EpdOI1F7bLRYKJpbp94rv76vRSugB12p78Tg3KJRfDwS4G?=
 =?us-ascii?Q?YrTg+CB+05rJClw9uI4StHcv+Zivua5ykQMe4xYJDVbOfiXThL9QYTBIrcYL?=
 =?us-ascii?Q?y5TS8//3O5zvntN8iKifVqkT2fyV7qaf+YbC4hfvX0ej+WDL2Rf0HWwArnVW?=
 =?us-ascii?Q?EkLpRx6KzhHepmWuviNOn4JMxmmh7T1S4cjEwVGtijeto98akYV+2aX1wkYk?=
 =?us-ascii?Q?4e5yM0IQAuS+/wFGBCXoEP5wPkWBIFoAox1WxahAFtK8y882m4UnPChDcCek?=
 =?us-ascii?Q?Dx+Wym0MPABCgG+zHvfoxBD4dUXNwTqhzL7thUrtAxQ5MJYPPaKE/xA/qznU?=
 =?us-ascii?Q?pbntyEMcIHURxiNCgqFdkbbDEjsJEvt6vpdeMSAH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e1e86d-883f-4426-2526-08dd6babc246
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 14:45:59.9258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bq8yPoYCz0HCEBOFYJPWpWtzrM1u6dIWCAZ7sMxO/ZCtoREMIj84IzneNBE5rYls1VZLdOolR5nzbC7r1gCDTv80GsVRDoSk8MwnRceaMD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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
Sent: Tuesday, March 25, 2025 12:40 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>
Subject: Re: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Mon, Mar 24, 2025 at 11:09:28PM +0000, Jonathan Cavitt wrote:
> > Add support for userspace to request a list of observed faults
> > from a specified VM.
>=20
> ...
>=20
> > v10:
> > - Remove unnecessary switch case logic (Raag)
>=20
> This is usually "changes present in version" and not "comments received
> in version" but I guess this must be one of those drm things.

I'm fairly certain change logs are supposed to be written in the future ten=
se.
Or at the very least, I think I picked up the habit in college.  Is this no=
t correct?

>=20
> ...
>=20
> > +static int xe_vm_get_property_helper(struct xe_vm *vm,
> > +				     struct drm_xe_vm_get_property *args)
> > +{
> > +	int size;
> > +
> > +	switch (args->property) {
> > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > +		spin_lock(&vm->faults.lock);
> > +		size =3D size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> > +		spin_unlock(&vm->faults.lock);
> > +
> > +		if (args->size)
> > +			/*
> > +			 * Number of faults may increase between calls to
> > +			 * xe_vm_get_property_ioctl, so just report the
> > +			 * number of faults the user requests if it's less
> > +			 * than or equal to the number of faults in the VM
> > +			 * fault array.
> > +			 */
> > +			return args->size <=3D size ? fill_faults(vm, args) : -EINVAL;
>=20
> You're comparing an int with u32 and I'm not sure how this plays out.
> The usual practice is to use size_t (even in the struct)=20

Size is a u32 in struct drm_xe_device_query.

> but I'm not aware of its userspace counterpart.

You mean the associated IGT tests?  The interface has been changing so much
that I've been putting off making the IGT tests until the interface has bee=
n
finalized.

Or do you mean the use case?  Because that's
https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_device_fau=
lt.html
-Jonathan Cavitt

>=20
> Raag
>=20
