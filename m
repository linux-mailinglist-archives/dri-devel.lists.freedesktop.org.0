Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE5C67A88
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EE610E40F;
	Tue, 18 Nov 2025 06:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+6c5UoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A35110E20F;
 Tue, 18 Nov 2025 06:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763446191; x=1794982191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KWzCQ7ELQav2dkZAqxBX0D9yJ+OcTDW4ztLU2TEztkA=;
 b=I+6c5UoGTM0qa0ABU7byUmWMl6Dxui90ZLpEMgB7SSKW2Py88Z0vbujg
 5pJGwszlvPhVp4ETKKqHUkkuZ/jvohsndChe7OR34DNI7Qd9jUSHoOcKg
 kA16XqL2prAFGsebS00eXj/Lb3TJO3xorNwKYI7pfge4ba442sIi3Ob6O
 9ffVY6muIa1Ymk+se51euiERD5qVOIxuU6+WxYYtA53imMgOxaG1qsZxe
 bK26NB9eXtA+yHPFqreZ17J0fw+LZ3/WHe6sab5tHVNFrV9vSbb+LQpSB
 ojdFaIJUH1rhMIF5XppyeJEwjofR3AjesLlTbxr6o4/9cWyny+qhB6BkV A==;
X-CSE-ConnectionGUID: A4rQQuFgSRmWY/wKseu9aA==
X-CSE-MsgGUID: aGi2Gk7TQB+WMDBu93FBHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76810799"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76810799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:09:51 -0800
X-CSE-ConnectionGUID: /BxJYy2BSQSg9+MbRRJB3Q==
X-CSE-MsgGUID: l/QIsyyaT3OPC6IvbEg4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214062023"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:09:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:09:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:09:50 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg3IbeZPgyX48hwueWD6BePn/IridP2Mc6NjQo+7fjoOwWA7CFTjsOQxM5uSQrEc97OH0hfjlUPn44s4nuno/LP0beNpqxvrv18EaHy3+YLhS823P5EYRqxfTSHjH2hU3sf9YOtSlG39mos2lrKuqglqqAB1kuwIwPh+x1la7UUB64IhYPZ4in8dg3TGEQMJKi98D8Q7O9jg1qP4dXQSoZ+2n5oRMmcdpln+61ovoIveZ5wEUf5Ztzw83l4QA3e2s4nlBCp9jZYbOMj66B/+ETrr9EtzoVaGwdOc3DWjfyf+E4oeeCqT+sI90YZdPWNy4ihsudKcveeTi9IYKKh88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhiLbnuXAnvsCcK32t1Fo0VMLQFn2gGeWa2a4fDwpVg=;
 b=RmqC9bQ0CQ0P5PZtxFOYceNaG3k+dPBX5j6ZGN4PvnEt3OdmQKRO7dG6/JIQXBduI9fwi8ym8j4NpRo9HZTFp+sCdd6ywvz+dYu1Rn/mrgUvoqn8/r84r0b8toa+8PEbziQ1f+LHdTMI3GEFLoNIzY8Hf6ryvL0ymciBaj9WQHOjIBv5UVnaRQ0t9Ph77xm4Db4pYJiGhF6WemOFD6x7uakRS0lf7WafCcy8srhml7l1EYH2ywvQaUq5jS3AMGtmCQdwwd6uUgXbEVBQ3Bj6s0HZ1MWFGMzBuDtVKvfKjxCp02hsC/UAnWTXluLWx6rxqN7PSfL5ifg8GKFEQC7kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB9495.namprd11.prod.outlook.com
 (2603:10b6:208:59f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 06:09:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:09:48 +0000
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 04/16] drm/i915/color: Add helper to create intel colorop
Thread-Topic: [v6 04/16] drm/i915/color: Add helper to create intel colorop
Thread-Index: AQHcTk7w09RHabOksUyPSW82RXkXErT4ByQA
Date: Tue, 18 Nov 2025 06:09:48 +0000
Message-ID: <DM3PPF208195D8D0174EFBDC1EA950654DCE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-5-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-5-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB9495:EE_
x-ms-office365-filtering-correlation-id: 53caf6dc-3aba-4ba2-9496-08de26691430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UaKfh0IaJiW39AyDSk4dIG6Dn+FuHISTQ9hEoeu1Yc8+E2/K2nCOP5fBgvk+?=
 =?us-ascii?Q?89x18Zb9yicJJsRIdIGJfI+9IdmqQ4I3EM+NLv73ncUOzvpxYaDfinMWWgn/?=
 =?us-ascii?Q?hp8+zGSA2HyuFj08/4rcTnkivK4iAupef2fddpXEImBPq2PBkNJmPHsyslhB?=
 =?us-ascii?Q?rXXRfGkw4RGR77bOcL2aQDVj1lMJRmh/38JGRv4sqr8fHw/TFQRfj2DFKpjh?=
 =?us-ascii?Q?MP4QcWkKG7f/iShmJkF7QjRuzZRr3KQ0ZtbwKJUmebvKzFn/zzXQtnVjc3jP?=
 =?us-ascii?Q?HAyoTsvsscTBUDMP4Di4d+suLDer+2IuIoL8xfc+K9N3Z+8yAxY8ILKZJPX/?=
 =?us-ascii?Q?l00O48og5TxkqfXhnPJt2mAMbMBwICRro05gQwU8Cp3ka60utzWHCTrwrQ9j?=
 =?us-ascii?Q?Kh/9/htUid/ADi6koGzKUU1XF7Zr+7hXWhbX7sxVgf34CD/5gWgGJCUVH8Iu?=
 =?us-ascii?Q?bh39B7opeeQ/9Nm8Mo0MPbOzbA6iwiGh8cLRNhSUCjY75ZoYtRXTNYDV/eET?=
 =?us-ascii?Q?ozempTiaBoP4S5NSNYccLgB8+5o7ntkZ32ZFz/ialk9pxYiFOJnp1+fNW/TW?=
 =?us-ascii?Q?hCBEcua80vBVMvVqZ/fq1fRDzHJuM/L9Bz+Y1zUQIFuXHkVqJAKH2ShjSP2Q?=
 =?us-ascii?Q?vGj2EkG4ev5f+ScnmtJ461YlAQ+4WcIy8F8D6440HVyfP0qOOnDB7qXKsGkH?=
 =?us-ascii?Q?PRFV/KVMM79f/8+5hbjBDEeVc5udKzQOXLXsu2Xpz3ob/wPSKHMA9OT24arz?=
 =?us-ascii?Q?0knPVI83I3Vhzjg2fN6JASbKjjcsRqxKIeJv/Nv9UDbqOJd7WoYQH1dl2L3E?=
 =?us-ascii?Q?Z8aO+BQc93rNYJHaKO8YYVE2IXHwLGk6+u9WGDn1GPyXR8SpqIBN587+Y8GO?=
 =?us-ascii?Q?bwLYQwezLRDX0Y6Ez4P2a1S3aKJC7oRXz+guNS2TDRW01ExPwBXyFAVDJdW2?=
 =?us-ascii?Q?F0Gs1Y8G5VornmZ0yQLZm056PKYS5i7Lmr803M+5PatTwto7rfM00hoAUrlr?=
 =?us-ascii?Q?hcJXPEocI6GUDhmZDHgRen6HSr1bXJ0wzi6llUc6AxmG+Vz3SdO0tzF7pRd6?=
 =?us-ascii?Q?DeItjFCgV3IKPvC2WgJbyhWV6TXYTOXkPFzHcGYE3Lve/tmUJLCCScmzVTZp?=
 =?us-ascii?Q?HokwaMRmWDgkxfila0gjcH84rOrSNnmSPg0L+krhIl/yxtpMDaYWSHts04FB?=
 =?us-ascii?Q?4xfNi7eOjhO25sByN3ghFwNLJ8DNNf4WsUTzXfF2Fadgd9GsRA19j65j8FMN?=
 =?us-ascii?Q?y/PSaigRvLJu8bRN0QuC8qNehbqckgXJwh39WPV7fAovzsuPuwCl56VAzgWD?=
 =?us-ascii?Q?xZo3VjVm6yowLKqTW/KCKLHRANpgr0leDYx2U9VTbeTbvBcq7mJgFYgPw/Q/?=
 =?us-ascii?Q?Si8GgJoYJSgVmryYenng1hReiaqNAYYV+ASE3zFD4k5bTg1vPCC9QChKhB3c?=
 =?us-ascii?Q?iPsUOChQM+dEtmB1eV8cUMb48YUW3AVhlFR/M5DrAxDbFgp0sUnLmimpEQQm?=
 =?us-ascii?Q?LONvQKBbqSekZOMjOtHtB06fR2jTTSue6sbj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mOAE2J1spLnwq16OcHsFFBH3FjDNBq0eUthbQc2F8b5bgLXa7qSaYnFeYv9j?=
 =?us-ascii?Q?ky3955DSsnKs8PJFvFvTrHQfNtnSBghPC2qfo8GMTXaYJezt00gUdM3feweV?=
 =?us-ascii?Q?C9ZEUUr0nMiWcvtXJP78d98dozSqzQQTawowxEEvdbMlT2BrSQQCPD6eMMWk?=
 =?us-ascii?Q?POWeI4qXlq+9Az0nxx9lmxKxQ6EroAm2t2NoiH/hBy2HESMHeWZeycaGNtYS?=
 =?us-ascii?Q?k9TpiS1aNCRS6bka/w/nxWBTpf076KtiI1ywwLdwQt1lY56cSAqbRayZ72AB?=
 =?us-ascii?Q?9vvTsdBukGDvUR9UGCNt6InykvbD9zY/DnmM3PDquQX1bT+kt0C8e/Z789HF?=
 =?us-ascii?Q?PtX8K0+zsztBTAfw6yUsOH7orRVz9SiuUMn7AsTr/EvONAI1P8631sU7UOTG?=
 =?us-ascii?Q?7Fx06rQNQxyLjQHcsXjPpAVcbsbwclUMLRPLIl+NBW+/EOxevugEvHygZA3R?=
 =?us-ascii?Q?0EtKzfUc3ipTQaVM8CgosO16q+gGQ+z2pnTtPf4LFgYlDLoEtUKBUZESuZaS?=
 =?us-ascii?Q?vK81ciT2101fKIBuGcedawEzpvknIV7etbtgYfY4A96w/uDSSXX/LK4lKIff?=
 =?us-ascii?Q?v1mArJmqkhjBmsD0MxbXSykPzKvTsyz5Crj1RHYQ+5qDNqHlzrx9azyfM3OQ?=
 =?us-ascii?Q?tOjNhtR5UBxSIxnsHToByUAW+Gtzgo1VluUssJkxWRabFzhrBCCjGC4diUba?=
 =?us-ascii?Q?QiZMmpK3x9pmcba0jq21Aar0CvkS/5aL57q9G04uZNBjZOoKkQeNh78xpKIM?=
 =?us-ascii?Q?StDJ4iNYLTdWzuKmo1XhlDdOdRjLa5YyQcwVLOE69/HUgXEQlpa58OCO+Tnw?=
 =?us-ascii?Q?dj3xK+BBbnHRjq/bMH2cWEsf1QKHWK8QPwSr+ieDSUSqBzpppEVQsWxAn2LE?=
 =?us-ascii?Q?y1UZdTpx66g0NdCI4mjmKW4j9Hciwzy7+7H8WIfAVcmykouzwPwknXg0w+pX?=
 =?us-ascii?Q?MV1FXilUX5lt3ZR14C4rvOeulXtufZKAYVUYjpMYXFN2tpUHlbJBj4CeAa06?=
 =?us-ascii?Q?tmM4Vs5mpwWI26yoAUNPsa6zX172d1EHoUBWKCkBWwFsWDhm7FckVTBxw9ZC?=
 =?us-ascii?Q?X8fgV9IctlbHPgsBl7t+ycQ9vLm73nk+9UALVgasXbBj/FoaHz0N/ttl6J0f?=
 =?us-ascii?Q?VnzglPyv4jFCxLgcjo1J1BKu8XMXZ1T/Qvg74MPYf7mCTJv5j1GsVqbyn5G3?=
 =?us-ascii?Q?MoVbJK7z7xC1PVJr0WjigS+PPYr6hA8hXGOu+ZuschobGKHjQWBrOxi4c3CU?=
 =?us-ascii?Q?suSy7nCP4oGOJfI0SITsmdWLKQ4hxWUAyTHFk3rzcWb44kOUZveOdp2FyC6+?=
 =?us-ascii?Q?RYLCKXpD4M85zWQ3WJTyJA6sdpZAXZZXP0UXsVTJdebfHi7MKNgEg022H5RE?=
 =?us-ascii?Q?nmcpxaqcJTEAzuVIronUrZdLoSvZVQNKIYdGBbwT0UfxnoQNu+vXK8KwV13j?=
 =?us-ascii?Q?vTLITjncq2RfQoZKw+O0Vhr7vgnKvO0nhLnq+yPAjMAw7p1jcjxAlVCJMaba?=
 =?us-ascii?Q?yf1kRfJRGaVY/j4aaF4MNeSgGiFBKbHM1EbzGgWbauG4VF9BIC0FFBjee7VS?=
 =?us-ascii?Q?BXUP7SGxAqnvpv7L59GccYWFK7Z3C56UmOuocHfo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53caf6dc-3aba-4ba2-9496-08de26691430
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:09:48.5266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIfDWq4R6h72P0JDQ8LqITZOyEJ3qXepdvfva7FAMwQNAVAHT8+vlOwe/JAectRf30QbcZiFyPJAy9+d/5qzPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9495
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

> Subject: [v6 04/16] drm/i915/color: Add helper to create intel colorop
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add intel colorop create helper
>=20
> v2:
>  - Make function names consistent (Jani)
>  - Remove redundant code related to colorop state
>  - Refactor code to separate files
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_colorop.c | 25 ++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_colorop.h |  2 ++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c
> b/drivers/gpu/drm/i915/display/intel_colorop.c
> index eaab50d2d126..f2fc0d8780ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.c
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.c
> @@ -8,3 +8,28 @@ struct intel_colorop *to_intel_colorop(struct drm_coloro=
p
> *colorop)  {
>  	return container_of(colorop, struct intel_colorop, base);  }
> +
> +struct intel_colorop *intel_colorop_alloc(void) {
> +	struct intel_colorop *colorop;
> +
> +	colorop =3D kzalloc(sizeof(*colorop), GFP_KERNEL);
> +	if (!colorop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return colorop;
> +}
> +
> +struct intel_colorop *intel_colorop_create(enum intel_color_block id) {
> +	struct intel_colorop *colorop;
> +
> +	colorop =3D intel_colorop_alloc();
> +
> +	if (IS_ERR(colorop))
> +		return colorop;
> +
> +	colorop->id =3D id;
> +
> +	return colorop;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h
> b/drivers/gpu/drm/i915/display/intel_colorop.h
> index 23a29a565949..21d58eb9f3d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_colorop.h
> +++ b/drivers/gpu/drm/i915/display/intel_colorop.h
> @@ -9,5 +9,7 @@
>  #include "intel_display_types.h"
>=20
>  struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
> +struct intel_colorop *intel_colorop_alloc(void); struct intel_colorop
> +*intel_colorop_create(enum intel_color_block id);
>=20
>  #endif /* __INTEL_COLOROP_H__ */
> --
> 2.50.1

