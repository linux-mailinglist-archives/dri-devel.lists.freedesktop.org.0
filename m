Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD549A7B11F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D2110EB7C;
	Thu,  3 Apr 2025 21:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEwdujcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7810EB85;
 Thu,  3 Apr 2025 21:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715744; x=1775251744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=950gkgBuo10Xmt9NpkK0XXepoXsX1IjcQxOlXLMfBLA=;
 b=fEwdujcT08fE8IETqd/0gIDupEJK0r9jHnr2crZx2U9h32APnn/w8Zvc
 +xf7oeNJ+wWUhM17IBjUVLugctg5MYv8G/TegdN67qIE+UnI5SVejY8+p
 tQcwClNG0G0vA+jbMIlqK6tX+e2J2/DRfGWA4DO14jNHVPB9ThLDfzNyM
 rwCOFykpky5M+4FMJ0FxTewZp5S2cC7KmMmtiLyPILAph4HmmfLg/Ner+
 e8gv1TBkWAaeSVSRpGSN+nSjTC8yDAFfB6i0puIBPZs02+xB7teFqz6fw
 pNTNm7HEs3FdnJSmtEYyxHi9I49im94PdTexiTJfdTCGFXwir10NpVxZu g==;
X-CSE-ConnectionGUID: 1fWyv4fdT8qDFMRk/u0v9g==
X-CSE-MsgGUID: DsYtJ+gnSbqdk4odm8GP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62547159"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="62547159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:29:03 -0700
X-CSE-ConnectionGUID: T9kJOaTrSPG5lGGNFC6Ihg==
X-CSE-MsgGUID: CcVW0JJjTBCJfceb1pm9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="128058807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:29:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 14:29:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 14:29:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI3OcO2M0zA4efRcy9tNCOf4zWT+IB75poIlByHKEXz/35L4SWrToA8o9J7juI7ZP/PORPdPc7e2e2maWzSRZbJWlTldJ0Y7o7vilDwm2U5+4D3tMhURxXA1qLmpxDEci33C6RFnAaVFnAesWhtHrDEACOMvO5nc06JZR1HRpuQsahT48Br2toOe9YqY1BLUQxMcbk48VsAgBJjHW+eBJpExqAta8Ju9elFYSu+UvvItl+cQzikGCJ+kiJZiNZBfZgj0ciNSZKM3RfLEzBm3vU/3zX2jRXSQor/FtHqEDNKTkB/8MNQFrkXRbLXSXT2e4gaeRu0Tp5aMnpTQpjiq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXtBXxgMkanZ/gaj0kDfVh1PxEJF4zUn7hAUyY99Fu4=;
 b=rRrhuSqz7xdrojbzgovGS3F/sUChAeuC61fJqAbLAS4FxrEA6NMknld1J3UWzHkXm4GWAQ8EPc3wF4NX2HQ/fBgdJFZYMyrQ+wo0/DBzDSD+NG3BpPONNyp3vUFF0FZwcKJKnlnkPiGk9GKAnTBypmynLKaN+K1aF6Em08Nebg7W5sQWGw9keyf0uY/x4fZaCNInXwhT3XBfXijxBo7e+KUR+Gci6PquR08VI4fs7Q1yXgRpXI61YcSriSbZaMetnu5UH0sq8oB/ROg1+k06OP6hespz52kdgJxHsvvl+f2CnwsO/mcM/mwOI1JfsMDNyLC3LtL686mSeyHWAVG+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:29:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:29:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 4/4] drm/xe: Abort printing coredump in VM printer
 output if full
Thread-Topic: [PATCH v2 4/4] drm/xe: Abort printing coredump in VM printer
 output if full
Thread-Index: AQHbpNaolVsKUN/zo0CP6pF7mm/7ZLOSdLNA
Date: Thu, 3 Apr 2025 21:28:59 +0000
Message-ID: <CH0PR11MB54444E52400BDED96DE6A0D0E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-5-matthew.brost@intel.com>
In-Reply-To: <20250403202705.18488-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: 70488f85-170a-4a39-3098-08dd72f68c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o3Y4f7d2UPPB/Dwty3qJNBJFGkHi8ysycY78aqk+PvV7Z/0VgfeQ1FLVoTNa?=
 =?us-ascii?Q?MPwLzUc1DJjadYDDTCiHkfwaBBACF152UAzQOd7K2gZjFHgNzXVQ+qpPa4VK?=
 =?us-ascii?Q?p3mRoWPqSQk2cxMAgOmg3GEvHST0h20w1pkmbofqTEB3WvhmtIlaEJZe69yS?=
 =?us-ascii?Q?2p36JqC9r2hAQhNS5bAsBo6Y9ZyzmE+qaEz81D9KF6eidX3brIIC5l4hfjNh?=
 =?us-ascii?Q?JL15JsGvJrg/y0LjxSWp9hOee1FS+gIn7sfKEbPGwV3MupRbbWeAqKOGnZUx?=
 =?us-ascii?Q?c88gLpQoTYRHrQGUyxbjUfYfga0ULsWou8jtsd0wN7RTzNpg7/40mYyuya+1?=
 =?us-ascii?Q?TqyT6mkCY5ekgIyw29V5CCPcI0PIRgXiHvwXfy9IB87Dr6ynnvvcpYMKIqd5?=
 =?us-ascii?Q?uNd0ZnVUcHJNiU+qWVuQNDDggHcb+0koK6s/vVQ3ZxRDZ+LYVcVMSrRUQkWu?=
 =?us-ascii?Q?RHiEjkBmq94IiUf+IW7xGsBTSgJao8VmWcPUuZkNI/lU+6lj5AOl58sRPQ+j?=
 =?us-ascii?Q?jn7wc0oPkV8oqctw6zG6BAcJTYfXcDegcyRlEzHmC8v38OT+jzoGcMm1b4C4?=
 =?us-ascii?Q?yBy9VKsoLpXiC4tLP5hwfn8Igs2+Lc67rqmJuEKls6DMwLQ/XSYCj+vE59bV?=
 =?us-ascii?Q?eLhjbog6l8/BACkLRYlERdNwo9Z7Mx0iF/3CCy6F9difUQGyJgXwC+f5aQL4?=
 =?us-ascii?Q?IyBMUvc0iY244EjjQfOMZ9CzQHQjsEEqjbKecAQVhgLwfmFeADb0G+/cygc+?=
 =?us-ascii?Q?BtCmuew/RmfEBEauF5GjfyD4d8QA4SZhLXRBRATBgkKoaXtR/GPfs8kaWBEs?=
 =?us-ascii?Q?MMIMxqBNVK8cpLkp+hlT7jVWt7NQN00RGMtpDhE7iEi9G1ytQvFiN6c9HaYy?=
 =?us-ascii?Q?gAPuFy1Dz7y1E5uRCrTVFViY1qNGtAHvXQwFXR4lWwW9jeDKTYdSY/tSNAbr?=
 =?us-ascii?Q?fDP/ylIW+UqIumoWNNJHwmTgujvqJ+ATi/40FmfGuDDDMN6Dxxg2sV8iGI0n?=
 =?us-ascii?Q?a6g07Xw/07u1DeFC39ld227orr1UfzpHzuf3yD5rOWMPfA/9k0uXmywC7cO1?=
 =?us-ascii?Q?RJjOF0guqoUELyUp030DHE+YVLJT2AYlD5mIANFFqdgoLYhgGcq57+pYn8Pm?=
 =?us-ascii?Q?7AQU65f9qX7Io6KO46jXgTHb973Ni6RFFac1CfJ1J4RHnToLjdHk3guhMgiH?=
 =?us-ascii?Q?OWrpzJf8ltqliHe7oYlaymHloiu5zFtjQ/+WNXrfXzsa6ZKSVzSiVPtRTHQl?=
 =?us-ascii?Q?wovOhOlIJOI3NATODATJtm2A9rsnd3kJxrfd3FS61+qY5bCFnzGf7ctAjGpw?=
 =?us-ascii?Q?soM5bCUwBhYjar0+bW++v8xXZXwWz4JaqDBSmOqNIVvQpmU7d44wzoAABbef?=
 =?us-ascii?Q?uC4GEBp6rpjoEPBJi6mbWiZMEL3oHhLF6Lel/LP13KkCs+AKxAvHLuC/Mirf?=
 =?us-ascii?Q?MWumGEs4vvjyEK3Iyi/xGVMcJwvY7GKF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BJcE56AoE+oxPKZosHVtk1vLioWMeflCutRFp0p+27xVhRi7yf94q9rx1Ze9?=
 =?us-ascii?Q?fFJzXBpbvgkfojsinqUSD6jVOkG/24zcdqjXvgZYGC1MCdew3ROx/QfVOH5w?=
 =?us-ascii?Q?pyilL+qarO6xYaJAqWXqhaUs2zsbaq85EetaqL59HA+Mo4vJWddIQhLJEei4?=
 =?us-ascii?Q?3F5R8itjpyRw9e4oR0Mu7iOlkXVtB1vtnvIe7Vh3P+rctMRkX4GelU4gtHLO?=
 =?us-ascii?Q?5C/D+QOOOIKqKtxhqGckl8DBBaPq64yoA/RwdF/jmOjTNXioRBk30NNLp5OC?=
 =?us-ascii?Q?g04803Pd13JSb/edsMD2oYWtCZlZIrGVUHXRAkogbHFjkVsWwWrPUZdxILBL?=
 =?us-ascii?Q?+MXg6Wfc6EJWiSn18V49KFxFyW3fDAxgv7oK3/p+3CLmVsXxlMfjVNMwi4E7?=
 =?us-ascii?Q?/IpCpmr+GlGXZMos7MPCcqBqgzQCsOfZn7PtdKY7Fi3sDogXFvYM8MGRsuYx?=
 =?us-ascii?Q?MjkoZdftv9Fbmza/UHZpsJEA5wNVX0UFCYzKvFgyar1RaT979NoxOSb71Rt1?=
 =?us-ascii?Q?GupZWGXlR41PCrg78x8FndxPpQEf2RkkyUn3YGTCKV9l9vrsyH9Q6BirLIW0?=
 =?us-ascii?Q?wlSAKuWoLCYTFbFKZc2Cu23yVqQGlHGDJ66yhhxfu2rQSuGAZD+1IAGIfUC4?=
 =?us-ascii?Q?RfqR05I2kwznUdQHoV31IT22TYJhmMUpQ8unqKo4XRQcVtL+jh5XuoHr726h?=
 =?us-ascii?Q?8a//vns1fYwLDW/zVyfHjga7E3GKGe2MUmQIIbNM48n3t6tRD0aObUnWVrBs?=
 =?us-ascii?Q?nIKYZtKLRk/C1EmsBLNfN89XHr12bRYie2zJhuXwLk0WG7mxAhF3Znp455YY?=
 =?us-ascii?Q?7KqKebOQEEQQ5iemXNafe3F6o2smufvAqOSl1u9qUFDllbK6Dv5UfdNQf6EU?=
 =?us-ascii?Q?vbZaDydYHUeKAtwBMOnEoGc8YKyvtkw2ew7JKr7Vq3YlJ/9WK2dJEYdOcaAQ?=
 =?us-ascii?Q?kmF6EQ82yFPrUKnSTXDxUGSoY7nFh15eiLswW92eJQj9PbBBrZHuby4KZ3HD?=
 =?us-ascii?Q?Iw7O7jKdJlChs7uWj1ra02aCsIvInnoQ48EQlvcbJ6UCRqsLMg2hpm9NxXzR?=
 =?us-ascii?Q?muo+c26OvIu/KA0wfe78YqkbnugwS/epx60FiISIJ7qNGeL9aFjYAPShe5jP?=
 =?us-ascii?Q?FytMZspYYaAg3bEBDwfvbYwSsbUh39hhJv185IT9u6WMkk76rWbQMZksSELv?=
 =?us-ascii?Q?YuOm5ARnm+UDktu1EUAgFjmGDzHOL1ew6tEphlOQCBaPyc6GZxK3BGBEZPIx?=
 =?us-ascii?Q?mk1HK4el+xMAbpJsn03NZNSjh2yz4m+B36+nUU/xYycSp11Hrp9iLpZ5DVZ2?=
 =?us-ascii?Q?39SccGtGa/1ICWpbDyxcC6hy/xrMTGPv8tRVe4Du4BEUJZXWTHTtJc59AlXj?=
 =?us-ascii?Q?hDiv7forbbpBmupJsPjlltklaBr6a93Ot4zAgPYMwExl+vnGl7tmQH4erHfL?=
 =?us-ascii?Q?GrNp/am9h5o61CTrdCkc6c0Lm8xIpd9hfmVa7l/nem1A0BJ/IlhZugDyurE6?=
 =?us-ascii?Q?ckxPapoF6FeZu1scxa+yLBe4f6A47CpdNXT1VvELXiYpRWj+LrJeU42GaUQN?=
 =?us-ascii?Q?na7t4/oq4bfBiN9L/hHkWdPQwvknt5uIknZ/OrObLWxqMxyMIF/iVaYfASWE?=
 =?us-ascii?Q?sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70488f85-170a-4a39-3098-08dd72f68c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 21:28:59.9938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/FpwiYSdVLj6v+Z1k/KmKRkkKIsJBb9xehzmPQ8YTAkQzjCuSOFAKJN7JPjfa0l3NSkn14hJTTjLBWDC+CWcULKa3x1FeNmOXPDlAxTMHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Thursday, April 3, 2025 1:27 PM
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/xe: Abort printing coredump in VM printer outpu=
t if full
>=20
> Abort printing coredump in VM printer output if full. Helps speedup
> large coredumps which need to walked multiple times in
> xe_devcoredump_read.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 864266e38aa7..164824617a2e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3847,6 +3847,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  		}
> =20
>  		drm_puts(p, "\n");
> +
> +		if (drm_printer_is_full(p))
> +			return;
>  	}
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
