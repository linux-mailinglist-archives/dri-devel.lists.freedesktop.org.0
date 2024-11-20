Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AAF9D3677
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 10:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54AF10E3DA;
	Wed, 20 Nov 2024 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/qn2za6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5342C10E3B0;
 Wed, 20 Nov 2024 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732093784; x=1763629784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GQ79AuNLkD62wd7jBGyKAF/rlgPENOQ7tBSTMC1BagY=;
 b=M/qn2za6NHE+GJqYGhwNKPYr6dYpNL83mT8FL5ZEVewldQ2j1/aVdfUA
 q/tjeYO8hNV4ZaXiZxvhaa5MrEg47b1N8mj6CUd8Fui6oMZC0JrrYoopK
 uaxx8Ml5l0O1YzSFU+zP4bgCE/2n2O0wthakym62lemLnv/Uth7Mpfra4
 QFoKVe9BFMvcjcGGqXeoQxfwlt6z1JndktesK6hqeZGO80dwrOz6lqywk
 ZjU6iNW1kZvGFRvSpZg4wbXj2KShV9o3BTOuJgXIiefeysDX1ks4lYZzE
 XFxgzy/tF43aHkM+I9bfkyh9vaiGxzJQBJvkhRXjWf0d8zl/xdx4tttg/ g==;
X-CSE-ConnectionGUID: 1a4+XginRZy4i4QaWGAVlQ==
X-CSE-MsgGUID: L592QGpOT8SNctbXU4irGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42772758"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="42772758"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 01:09:44 -0800
X-CSE-ConnectionGUID: USgd4F/RQViq8HPSwqhmWA==
X-CSE-MsgGUID: 4K8aDW/SQiCzueEDfTIl5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="120703938"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 01:09:44 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 01:09:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 01:09:43 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 01:09:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYB8usEf1nfKKxa2Jpmh+G2ITx0Uw0DWsD7BvZIiVBHOkxxMNl9QiNe95NPEHguVscS5MVLQRWv02ViH0GYTx3tJQ2nkiJBaEZ2LGRce+wHAWziu0CSc7JZSEaUhFBJ/va69avuTkfC98odt+9Ef7/mVYFJjfJX9NZc4jhef0atilVdFmRn3HO0aDupWeQ1oDHYZj9Xk/LoPVqA0y7HRZOLUxhH0lckMm6COqYEQI5vnE8JJrlsqN98gKSBB2xNIufSo5L3wz5fFybbRwBJT7xNx+5Y06GX8aGcVIiyJ74EGxFSl5hAvxdvNE+I4W312+GLnn81C+iIgwrxVfJ76VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+rqs/x8Vz8jJJ94GQzQX3G69ipEMmcfdmMHSwd9130=;
 b=klizSnrzIslQQrpRWVXtIsv6RvU6fXaons+SJdA5fykBeSXj+/88XvBuyfnXPCg2VrSJCppiBy8sIc1jDed3tfadqvr76SBwPcy10Q3snfnXSnomcTxCBRB/bQiOmWnyKI6lJrxwGdwUOGuccvPmlaB/4GKBWcf/pbL5s2gZpWD3r2moqySVyIxk+8uYJWWt/k+DQj885GC7SQxIObNu66bKKAWtB2rDTZTkhbzKfTdmjpryo1g7FAau5FrKvUzZ/+FQ3V6kTzK6N82bUNh9opOcEgdi3O6fXndhf7k6ust/72t5g0aZJCPzdE2Yh1ujyUeOqwb/6933VmgBheHfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Wed, 20 Nov 2024 09:09:41 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 09:09:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Topic: [PATCH 6/8] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Index: AQHbOnGQxZz1TDJ6bkm8fC5yKYvrALK/2mMg
Date: Wed, 20 Nov 2024 09:09:40 +0000
Message-ID: <SN7PR11MB67509E12E0CB7AB44CA50434E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-7-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-7-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB7904:EE_
x-ms-office365-filtering-correlation-id: 7d687b82-8d20-4d67-cc5f-08dd09431115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?m3BRbNIm54jYfvZKYexPX+OzOQKpBJSoD+vLV3l1LRXK6/lNRVHsyjbnyTf7?=
 =?us-ascii?Q?ZCaQqThNGk/e1/uqG08sGc8cMaMf8nGAShAaJa4zge1PxVWY3ZSUJEmNffBc?=
 =?us-ascii?Q?Mk1i8zUFue4wDDCrp5kccZIb6CR74vvqdZLOmhazXCIMb2D43VqrSUgsbZCm?=
 =?us-ascii?Q?+ChOiKN9BbgGYb0YaJ7bNxaBTdzjv1ZhdR995onkeKyp9ejWabY7/BJlzWBX?=
 =?us-ascii?Q?ZcWkGhKy+V0WQfsXpK4JGOwCgMrKccYvT0SLAb5LqpfBfXJ5uDRtIpHX/Nv8?=
 =?us-ascii?Q?mMCNoegZVqUnvFKD0bK/ZNnunjOYlbY4Q5jOWKgyeLncUfYXHs9565+QGYiX?=
 =?us-ascii?Q?hCE/rjEs2MJoWO9U30oZgZtqvLFp7DKtO+3laHTK4roKZYaI9PbfmPfiFauR?=
 =?us-ascii?Q?z4DpWIXXQTCUX7/F6Zdv9JuTyvOV16dX640WD6j2wlnoat51gubginzeAoRU?=
 =?us-ascii?Q?87ubo73PzJG3lRGDtiq9seCq2Xi1ummIHV4yxgc/V63oMp4RPzpZwvLY4DdQ?=
 =?us-ascii?Q?mh3oHfdKBl6LsYeEf2wJaHs5hLJVioBzfm3P8WiPpXFIzDuG0k+qOYRICWSf?=
 =?us-ascii?Q?lZVLMw4odKWcRn+dxq/sHexvt1QwtNT+P9t8TgYR9w7ggx2REh7OSPobhqmJ?=
 =?us-ascii?Q?BSfOF3RZ1EY7N/jaDocXmuNXr/1kf3mO5N/BgThwyl51MLCryvsRXmAEPUeo?=
 =?us-ascii?Q?YK56esDj1D1EzpeVr9P9CwETCP2okQB3TMNGdTQlao8fEl9pifMv5Rzbo54I?=
 =?us-ascii?Q?064EsfL2AUl5UnQnL1eMoC/wQQKMPJInUXsUYxxvdabFkTbbRIcIged4yCg3?=
 =?us-ascii?Q?O6xTDcsy8K99b6c9woUInPCkDzYPL+KzOMdjRk4dqdkqeqkRhFtTp3rVKfck?=
 =?us-ascii?Q?PKp8TpeJR3LIqIU0ZjsN0ZHyR6hvhZOm7bI00Cgzc6lOOCKCmoA24UMXcmQw?=
 =?us-ascii?Q?dcOiayMXSvEAiAod3rIFIXmyxKG/CXugjwQHOy7x6M9BWc4f9L8Llfq1C1bm?=
 =?us-ascii?Q?iG9Fp2SJGoaanSdr36wjflQ83sCsbULojO5c641+lYGs/hJRhRmZ/whq5eyb?=
 =?us-ascii?Q?daf44Gk5oMql7mUsQrQcvxN5p/2PwtgSmWIIqy3b6RoKjAcXZqmZhIuTpNUM?=
 =?us-ascii?Q?XpJDVxF30P5GZfpcJKMlxEz37shWaho6ZNnPP5YiUlIAO0rJLgMbpGq2WgTW?=
 =?us-ascii?Q?AvjscBwEbRgsPGFo8xJ9ufK1spt5OBFGKPnNbaDcNFCDETnS5oDPnEN/mPAI?=
 =?us-ascii?Q?foaxDvGER0v9ZnfKd7Nd+5fY16T9wLC/iTvlzm9h3d6/gYVOO/fVa4hkNgtl?=
 =?us-ascii?Q?CTmAumrRT3rmqGI/uNjjyAX7MDGwDGyxHXaT6TU0ufdufsepGrZzpPRMjfpE?=
 =?us-ascii?Q?UePjS/w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FEdVnFP9qAEUVcyw+ftGYU2JJhLWfFvI8nU+KCtdo8n0xylc5IHYDX4DcPEz?=
 =?us-ascii?Q?oac2TS3p05RSoigQY8lSm8KKHPFtYIJ+WLNaPwfP+8qbBluCC41rEtxInyWE?=
 =?us-ascii?Q?Tqfbav9KaFZ9tCMmos+ut2gl1p8/KdqYrSKazLaoZAM6qQ/VHTfz53xP2ekZ?=
 =?us-ascii?Q?8LhLBFmOfYB4MO2wown0xvVvWXneTHrz/TY2+8egHVRqtRZrIOkLazUF36CU?=
 =?us-ascii?Q?Q39vIwRIGQ6F0ATRCTWr3F+1eCBszkdXoPtV9s3hEGT6fOBf87xWjCcMhtES?=
 =?us-ascii?Q?VNyKVT8CDJDuVfx9V3zvLs/f5t/9LQuLHfm8vYDGVZjnQPQI25gzu84Y0FRn?=
 =?us-ascii?Q?G7Ho1jYTaC+HZwoyEfW4jr6y/LFhYrR3NctoBHX+ZC8+6YVIREmDx+bp6PZz?=
 =?us-ascii?Q?Yfe/DFOrIsFoiVK1kepLVgZvrOOi5XoR6Of3Go4EsTilNy3EwErQW23636J3?=
 =?us-ascii?Q?bkrYjpSemyDG7GtnlWd6ZogqrljA2NqASqrg7Ew6BbZXCZBFL2gQpVqZ17nj?=
 =?us-ascii?Q?LPtq839x/DMJZbDD6PomHoe79a6CxljTzVChQ8BItPmLvOuX8BBTeCRfLXI7?=
 =?us-ascii?Q?RUFKIToufXTVnzHFd5YEXHId471wxRwbQoa5efHRr8mrzAcoB2TzhQh1fTHV?=
 =?us-ascii?Q?YDTejqvdo9RhoGCpK1l1Ad9HgUPuRCzuj2Hw6wVIHrfde8J9HLrBGYc49PPu?=
 =?us-ascii?Q?NGG+H3Ea2xj48JdL3ew6diZwknMVhX5O4RndP5vqbpTZOct2Dr5mGTDhT1GO?=
 =?us-ascii?Q?MEF5oQ3DuNkFTo+WQIAkXx6pvxPaTMKFTE7u3qbWJMxviZ1YYEmT00YcCsrM?=
 =?us-ascii?Q?6orSYQGah7izbJe2p9Q9d8Wc2MgFXiUoSKPDrcItlR5qvXJhZAJYCZhjd3pF?=
 =?us-ascii?Q?Iwe+iiOSsMSosNSyWQF7LnpOVtQpiETr8FpdZDmKrGLKNCcUtt3uFGyZgmHd?=
 =?us-ascii?Q?zymzpdDX/mW7XAUQdlRy79WhjqyKgc7O2fFWoXmhgJf1OS/raD55Z0p+w4k4?=
 =?us-ascii?Q?nNItn0tgcESZgauTdyG1bfrch83DS8ti59IBzDNuKg7nWuiaQxflOfmBJ/A2?=
 =?us-ascii?Q?slTvxMh7Xt1kRwwSdw9/YeYqzxSsBEOpsZzb2tXgixyIX6kMKFW0cEs8YPZY?=
 =?us-ascii?Q?49YlT2qhxoJc9l/kTlSlhWuomr3qunMw7wubgqE75tFB0PQzLf0c+Lx4wtEt?=
 =?us-ascii?Q?wBH1/nPaiAl9d05TnjsUv28Gpn+MQlBYdNh3+eSot7n0bdVGmEJjnlVXq+hi?=
 =?us-ascii?Q?gyB62G/AzpadWupcAGOOvO6LBnk/2C2MBwOA+py5Bi0TJrpQP/NSfKT66yT4?=
 =?us-ascii?Q?yUvDxEwrTNiehNkVX5sK93JE73XnFouJbvpYmac70lzfE3EkUr09sAhHxa1f?=
 =?us-ascii?Q?r1rf+6o2hwwZD7N6kF7Z/nIfS6hZGvqsodBDYFMW2VB7y5zfT9XnTnSKBL5X?=
 =?us-ascii?Q?EIQ7/YebOztb13/GwZkidZGhKlNg6uu9g8Jqi++2jdzby/5BGyPb46FCnkuD?=
 =?us-ascii?Q?EbKjgQoEsfWs57jw4no7wafnZdZdaV7PxNajn2f80vJg7FI51Q2YcuNZR671?=
 =?us-ascii?Q?R8VD8ecX9EH0Pnot1OrDnIAGbKJcVFD63Omh3si0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d687b82-8d20-4d67-cc5f-08dd09431115
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 09:09:40.9958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3W08Dcm3I3q25PQ1vJTxkwyMRKB3PIR0Jk7Iu+tPl5RmPv7o4kqbQzxEkjedLc2LhLXb6t7Wn1gZUecxTECyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7904
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun=
 R
> Murthy
> Sent: Tuesday, November 19, 2024 4:15 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 6/8] drm/i915/histogram: histogram delay counter doesnt
> reset
>=20
> The delay counter for histogram does not reset and as a result the histog=
ram
> bin never gets updated. Workaround would be to use save and restore
> histogram register.
> Wa: 14014889975

This should be above the Signed-off-by

>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c  | 17 +++++++++++++++++
> .../gpu/drm/i915/display/intel_histogram_regs.h |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index cba65f4260cd..fdcc64677e96 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -74,6 +74,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	struct intel_display *display =3D to_intel_display(intel_crtc);
>  	char *histogram_event[] =3D {"HISTOGRAM=3D1", NULL};
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))

We have shifted to using is_display_verx100 so you can use that instead
Also there is no display ver 13 just 12 and then 14 so maybe this should be=
 just display_ver =3D=3D 12


> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_RESTORE, 0);
> +
>  	/*
>  	 * TODO: PSR to be exited while reading the Histogram data
>  	 * Set DPST_CTL Bin Reg function select to TC @@ -94,6 +99,12 @@
> static void intel_histogram_handle_int_work(struct work_struct *work)
>  				"sending HISTOGRAM event failed\n");
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))
> +		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt
> Delay Counter(bit 23:16) */
> +		intel_de_write(display, DPST_CTL(intel_crtc->pipe),
> intel_de_read(display,
> +			       DPST_CTL(intel_crtc->pipe)) |
> DPST_CTL_RESTORE);
> +

From the WA it seems we need to write 0 in the above Guardband Interrupt De=
lay Counter (bits 23:16) when servicing interrupts
And only write value read from dpst_ctl when enabling  dpst_config or doing=
 an adjustment

Regards,
Suraj Kandpal

>  	/* Enable histogram interrupt */
>  	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
>  		     DPST_GUARD_HIST_INT_EN);
> @@ -240,6 +251,12 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  		return -EINVAL;
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))
> +		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt
> Delay Counter(bit 23:16) */
> +		intel_de_write(display, DPST_CTL(intel_crtc->pipe),
> intel_de_read(display,
> +			       DPST_CTL(intel_crtc->pipe)) |
> DPST_CTL_RESTORE);
> +
>  	/*
>  	 * Set DPST_CTL Bin Reg function select to IE
>  	 * Set DPST_CTL Bin Register Index to 0 diff --git
> a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index 1252b4f339a6..e50b1448bd40 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -16,6 +16,7 @@
>  #define  DPST_CTL_RESTORE				REG_BIT(28)
>  #define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
>  #define  DPST_CTL_HIST_MODE				REG_BIT(24)
> +#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT
> 	REG_GENMASK(23, 16)
>  #define  DPST_CTL_ENHANCEMENT_MODE_MASK
> 	REG_GENMASK(14, 13)
>  #define  DPST_CTL_EN_MULTIPLICATIVE
> 	REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
>  #define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
> --
> 2.25.1

