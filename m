Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B456EA5D5B7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 06:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901E10E6C9;
	Wed, 12 Mar 2025 05:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5GtZMtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396F10E6C9;
 Wed, 12 Mar 2025 05:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741758523; x=1773294523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i63dSNl/7prAT3DhuJyaDb8zivtLJKHR3TLdSlFvjzQ=;
 b=f5GtZMtr/ZoBRlzDGLGSpdq/dCPOQS06lta98lJjCMNCZvpszbWM+zeq
 9hOkDYxnMgn6A0rTkH7xdQ4A5kli4kFY3XDpRP064SewlWAXBoFXkNXcW
 ZOVGgKZyRDYrMaHJOpqrLISrMX8x6nOtG76r8DyEHAFkLhLMpGZoOd+OB
 O+Ejd22/nsJoDiFl1hXTopZDF2UQbhvZeIGwjv3xFJJi9NcsKM969l2RW
 ifWHeCu/1meTiDcyxoSXB+Qi5/zpRoove5I8Z7RC82gbXc8XeSqUQSSgb
 LTlGhIT/Btc3+swvZUvC4LscpOGtvhjb0i0KTPgmV3f3SUZLzhmIE7+Uk A==;
X-CSE-ConnectionGUID: KmdHNereQteppGiQNrXgTQ==
X-CSE-MsgGUID: kfPuYEC4SmSwbp7jCOHGJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30400467"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="30400467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 22:48:42 -0700
X-CSE-ConnectionGUID: D5bdAxMIQfyXPHpgVD79qQ==
X-CSE-MsgGUID: J667712yS8urFLUCP5RukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="121436496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 22:48:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 22:48:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 22:48:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 22:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjmkiC/18TF4FeNhB6LJmYQ8tYRP+l6n0VzdepSs3iHiWHh4A8owncdhQYEwjkO1Svt25STpPGPBs6gN5zSE7jSJTmQCwzyMYCCRmk24Io9631lX3I0/tNFv6mQDh/t8PXzHl5e69rtgXfiQhkhTHQfM02OzTkbhSjGGa6D9kwgEYB9bFlloLR8Q9awLwztVwgoCJNvG7+0MOe5+5Komx3xKZYrB4WKB72jeKbY3DRjuPWGHUo+gazYvpFFWzlWQv/399SG1FnPbIILyd+Rj26wd8Vc0N/0pbv8il7VdMTvVXBT6qSm8KHjR+pZNM2IedM6Ke9/d+fVGMXNkhrxuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i63dSNl/7prAT3DhuJyaDb8zivtLJKHR3TLdSlFvjzQ=;
 b=SBxw7tDZ4g5Zag0YGFFMuldppyFNdxo+vJczhPcj0k09IOZZLCIXA6utrBp86MuFXgdcf/wXt9/P0RaIF+43T78rZ89FS6jELIXYH23koXbtt+YoxEpteexENMNXEzb48ewNw6t1HZAeH3xj8UXFI+5Lrr6WeuPC32eTkNDjkZ5MtEHt7OfGLHCOu0QZuLtGQrUBeW4FXX0rz8HDpvBwnZPrCm98kearzQ6ns77yYgwrwViwxpASuJ1sWkAMOA3mh7vO5w1n5XeqkuaaoRcdEj12K5nqhelic4weK5RmDSt+Mz4/0mDQWvnxjOO6UE/ALWKHBHu/wIy/j0n9oeC+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 05:48:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:48:38 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v6 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v6 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbgrEpTxj+/VYtsUyB9GzSpGmxkrNvH0UQ
Date: Wed, 12 Mar 2025 05:48:38 +0000
Message-ID: <SJ1PR11MB6129B7B03B375B1A9E62455EB9D02@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
 <20250219-asyn-v6-2-b959e6becb3c@intel.com>
In-Reply-To: <20250219-asyn-v6-2-b959e6becb3c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4531:EE_
x-ms-office365-filtering-correlation-id: 6b73a868-20d6-4eca-949d-08dd612989a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R09QL2EybUVQdEdoS2dNcXkrQ1Z4Skx0WkxUN1V1TGJuMHhFbElISURaV2t5?=
 =?utf-8?B?ZCtYVVhrY1hQQ2Z2Y2haZlk1VXBBYjVUZThncm5iNTJwOUZKZ2N5UUVMRGFt?=
 =?utf-8?B?RmdNeHhXeHJ4SElnOFIwa3RocUtnanlTRUQ3SUJ5Z05sK1piTC9ROStBd0VH?=
 =?utf-8?B?QVNmWnA1WmU2OVg4NGdJaElZQnNPRi80YlF4VW4wb01kQjBnODBiRnhGQjFH?=
 =?utf-8?B?OERSVmtPc2xhVUpiZ0dhcXRZQng5Rmp2UjRHeDd5V2pHUE96RVBQdkczNGtE?=
 =?utf-8?B?MTdwamd0ZVBnQ0x2RlhjTk16SlBUdWhEbit4ZFZNQURKQTdZbkJQcmh2am5y?=
 =?utf-8?B?ak11UzRseGR2M3duVnZ6ZzJhZEhSN3dxQUxuWCtZMzZnQzBoaXVCMjQvRHFu?=
 =?utf-8?B?dURVWit5bkc0QmF4eGpwWVA0OTg1MHJVUFAvdW92Wjl5Z1lLcllHVGhidU56?=
 =?utf-8?B?UU00aXlmVmk0cTBBSi9WNlRpald1clpKemZYdkxFdWs3YU5YTVE5aHo2Kzha?=
 =?utf-8?B?OThINHdKQzhneFdnWnVER0N3cXFBVUovUnNvdGZaakl2UjQ2ZlpHSE9mR09p?=
 =?utf-8?B?WVl0RlJLWlZsUllEUDdydmtRUUtBaTRYYWdKWGtJTWltbTF3eVQ2S2NoLzFJ?=
 =?utf-8?B?dHo0OGFsTnBEd1EvdU1iSHFIOWtVYlA0Z1piaTc5VEpqK3BaOXJYekxkdXg2?=
 =?utf-8?B?VkdHUlJESlFpdklKTlIwNFJ5OFY1dUIvblpFQ3NSVEQ5bkVPaGg2YVFvOVRC?=
 =?utf-8?B?TzZHRDkrRzBrSzhhOUV6L0VBZ1BQWGJjMEZ6RG9jS3ZIM3pRMkpzc2gyaGNy?=
 =?utf-8?B?WnFCM2N3cFZpMGt0UWg3OG9EMDdXVmhIUDlGWVZWYldZL1UzU01yRFpOWFJh?=
 =?utf-8?B?VmQ5ZWQ0K0p6bEpvZVloS2tVb3dhejNIQm9DbXJ5aXpoMFFwQUNlZnJuMXlG?=
 =?utf-8?B?YVlNTEgvVDU5SStWUm44VmJlT2czVEx3OW10cVVNNkxxRHEzMmJyVmxPVHNo?=
 =?utf-8?B?VUlpTktBT1pCcHNCUHNrc1ZCWFJFc3lTaTZ6VW90RnJEa3ZaMmxNUTFtSFZw?=
 =?utf-8?B?bzFqejJDTmFGTnQ0UVNtUTA5c1o5WU91Zkd5dXM1bzRQS0llR2w3NFJ3b2Yz?=
 =?utf-8?B?VHlXaWN1UjhOc0Jwck5uMEhPWWRBVHhTTzU2VUNuYlNmcjNYQi91L2Q3cVFx?=
 =?utf-8?B?UjhrMVZBVGpsck4zWms2M3RqMVM1U3ZsQ1Fvc2N1MDBIbDNya3ZXb3NlV3NU?=
 =?utf-8?B?NmgwUkk1QXNxbGNDVE5tMGhRVXh2ZlZXT0NCelNxL0N4SVg5TkhEQ0J2K1cv?=
 =?utf-8?B?OGVNNWQ3ZDR2YnlzZkJFd0NMbDdTY2hyR0xOYUZMQTU2azY2VktJTU1vRG1m?=
 =?utf-8?B?RlRINUtGMFlEOE9tb2Z0YldUMVU5Vmh6Zmk0SHNhNzFvNXZJcjh5OHp6emhY?=
 =?utf-8?B?ajNjNVNURVZDVnZ0Q1FsUnBocDR6SG9PTzlSazZzZkpoOU10SWtGMWlIaC94?=
 =?utf-8?B?Y0lMdlUvWU9iZElLVzVFT2FiOGhzQnNDQ3MxOXRVNkRkS3k1RDA4RkdzTFBi?=
 =?utf-8?B?QzU2cll1RnFtdnMza2VsOVpUWXpRRE05WjgxY3Y4aDF3a29VWW15R2xJVjBN?=
 =?utf-8?B?TEFJWnlHOVovd1dkOFBHbEZLTmNab3U2OEtvbC9qbGxxczFtQUVEYUJRcUlk?=
 =?utf-8?B?QXhyRFRCRnh1SVJxRVUzZHV0Zk5zY3o2QXZNN1NpWm5MQ1dCVkdGOGtRTEtk?=
 =?utf-8?B?bzMwYUpUTXc4M0dvQW5pYTBWdFMxQWNsbGpaMHpvN2tEUSsrQ1hFaWd0SHJJ?=
 =?utf-8?B?cDFGVWlwbzhzMVZBbDkydTVkVzJSdFFXcGxqQTBMd3hjZzRSc01ETlhLWHVV?=
 =?utf-8?B?MlM1dFJhTEU3OWYxMTIxVXNIbGNSUjJKT2poaE9ZVFhUakNoM3ZLZEMzdDl5?=
 =?utf-8?Q?4Y0GQg/PSg3IQQxpnL6G2pe+NG6NGaIp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXZ1L3RzdmpkQUxlME1pUmY2NGVwSzY3cWNwbU0rNHRiS1M1ckVtTGIyY2Vq?=
 =?utf-8?B?dXZIUTVTMFlreVRIWUFMR2hGSzcydXV1MHBJeVVSR2JhZWxZTkdGUXdJYjh6?=
 =?utf-8?B?TUFFTWszVG0vdEJuMmRUTzQzeU1ONWVXS3lJVlNMWEFTcmNrRjRnaEU3U3Q4?=
 =?utf-8?B?b3lsNmpTT3ZhKzJPTXFHN05hRGszL1IxMHo5dmNKM2lYQkN1cldnOWtuU2lw?=
 =?utf-8?B?RStmWnhWTHgzNUk3eTRseVI1blFMdjNQanFPVC8yS2RXRUg1THVYSG8wbS9z?=
 =?utf-8?B?YXVEUUVSVUJzNG01c3dNUEJ0N016eWhZYUlyb3lvcmhmTEsvZi9oVzc3b1lq?=
 =?utf-8?B?bjBlWGo1eWtzdjc2bHVENnM0WW5hdUd3N1NZYTl2a3ZydHlIVDQvSXRpZkF2?=
 =?utf-8?B?RFhSU0s2MjMrOE9leUZKaWRFUlRqWmwrbzhEYWtNaW9LcWZPcXRyOFZnZHZp?=
 =?utf-8?B?N3JGRFlndVppcnJDS3RBdFVkZ1k1RWtteDlnNmt4ZmxFdk13Y0tESHhYSnls?=
 =?utf-8?B?ZkJFSnBIdWlKTHFNd24vTEZuZG9aZzNNOEJ3SVZZZHhIWWQ5TTFVS1ZucHNL?=
 =?utf-8?B?M2ZRMDZWbEVYakxwSE1oTmJ1ZGZPRnoyRXhMZkZ0My9MWEdvYmtCNERmTTJZ?=
 =?utf-8?B?OENmUVVhSUxWS1VodDQ4UnJMVVRuaVlrSHpsS3lLQ0hGcnFteTBIUXlCQ3ZN?=
 =?utf-8?B?TUJaRHVsU0tVYmI2OUdmWnp6QkRoS1U0cGtTMmQwR1lSeEtsb2xrdkUvT0g5?=
 =?utf-8?B?QzNCSGYyb2h3MzBpOWdCTGhTV0FHRnJFd2QzMEtkVDk1VHd4T3FPRkZETm5D?=
 =?utf-8?B?OXJTcWJhMVlQd3MwR0d2bC9zRjRrelA1eDg2VmZ6eDBsM0wzNjh1UVJhSG9i?=
 =?utf-8?B?U1EzTWZGTXRaUGRGSnhMU1NZbVQwVUNad1pVS05PcTZRU1h0OFBvNTVtRW1j?=
 =?utf-8?B?dkpBQUFkc2VVUkQxNUk4bXp0T2RTQ2ExMWF2c1ZwazdVWXhkb2gyNEJmOFR4?=
 =?utf-8?B?MDljMDNjdHIxMGtDbFQyUU54QUh0eG5xKzltMTVGWHRDVUdlaUdRU1VZT1NK?=
 =?utf-8?B?SG9yZU1kSHdDN2JjQUh4U1M5MThINGlMUUEzTXg0eE9lOUJZN1ZITmRKZGRG?=
 =?utf-8?B?R1FsTjJjQ3FtOGdSeUxkcHBlTWlYNjZjWHBFRHU2NVVTSEtrRUloRjd3TkpF?=
 =?utf-8?B?RkZsYzhEYWppNyswWGJnbEtDMURVdGtHNGozSTVSM0NQZEx1MTJZR3VZdlJj?=
 =?utf-8?B?UkpuY21FOUpjWU9xblpqTk9SU0E5WXJNZjQwUFMvVVZmRjVCelh0TVZVdjdu?=
 =?utf-8?B?ZkVrRStWVHhlYXRmQjdNb3YvVWRtSGZMMjJWUXdGM1RUWmFxV2pzSXpLWldz?=
 =?utf-8?B?MjUwTDI0bmRCdHVQcWc2VUsyK1dtdmpIZ0dGVXdDdCtKL2NrMzV1bFN5VzBI?=
 =?utf-8?B?R01FUmNPWS96dTdKaHhRT0ZPQVBrY2cvcTNUZmJWNys2Rm9JM2Z1dmtmVktL?=
 =?utf-8?B?dWxHRUU3Y25VeG5jVWZiNmZQYUVIZnJLU293ZjZwTDQ5ZjZHekJIYm1haXJi?=
 =?utf-8?B?bFo5NG1VWGtucmZOTyt2bHZvUzFqdVUvRGNWVlNKb3E3VU1JRi9RZ2VhVEJm?=
 =?utf-8?B?Ky9VYXRhKy8wTEIxMzgrYndOeEVNU20rcXdjb3NwQnY4SjM0cGFYUG9OTjBn?=
 =?utf-8?B?TENFTUJrajc4Wm1TcklQL3REd0xGdmtXMlYzQ3Jpa0tyK1R5TTJJWXhKWjNL?=
 =?utf-8?B?am1UbnVXcWhIZkNRMmVUdE13Q1ZCZUZ0dzhxZnlma3pCU1JYQ3JWRGllSE5z?=
 =?utf-8?B?eU43RExNTVk4TmUvWFZTbWE0RXRsVEUxeWNtcW5veXMzSUt0RmZ1MmlqaWUy?=
 =?utf-8?B?VlVwVXhMbjUwWE13bEQ1MGp4QlovNzhZQnFuRklyWVYxYUFqOCtacU1Nb1BR?=
 =?utf-8?B?SGpCZmxiNm9oSytldUNTbU5ZanpVcnVta1pLdmh6N2xLalN4K2IzV24wRlNX?=
 =?utf-8?B?cVNzU0J4T0NSb2pBYUlGMGpySFV4NUlwamUvZVJuSGhKMlB1M0xWWmRYaUp0?=
 =?utf-8?B?NUFaTzIrakQ4RjMxTzhNcW93RW1SbWlISXA0Zk1NdDAvaFErTlhlNWh3anRt?=
 =?utf-8?B?Y3kvdDBCamV3YlFTdzAxakdneVlQTDNvUmFNaHQ0Y0ZsRGZwbkFHYjBRKzhZ?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b73a868-20d6-4eca-949d-08dd612989a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 05:48:38.7498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lgzi7/mu/sM8rarazbFwpASGZkyXLv944qoeBbJfbEBWxiC1DtzJ1/gMmoWvopyiNebbFwav4vsJQAN18TeHTWePFR+T/72Oy4FkRE5NPxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE5
LCAyMDI1IDI6NDcgUE0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5i
b3JhaEBpbnRlbC5jb20+OyBNdXJ0aHksDQo+IEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+OyBLdW1hciwgTmF2ZWVuMQ0KPiA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCB2NiAyLzNdIGRybS9wbGFuZTogbW9kaWZ5IGNyZWF0ZV9pbl9mb3JtYXRzIHRv
DQo+IGFjY29tbW9kYXRlIGFzeW5jDQo+IA0KPiBjcmVhdGVfaW5fZm9ybWF0cyBjcmVhdGVzIHRo
ZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXQvbW9kaWZpZXJzIGZvcg0KPiBzeW5jaHJvbm91cyBm
bGlwcywgbW9kaWZ5IHRoZSBzYW1lIGZ1bmN0aW9uIHNvIGFzIHRvIHRha2UgdGhlDQo+IGZvcm1h
dF9tb2Rfc3VwcG9ydGVkIGFzIGFyZ3VtZW50IGFuZCBjcmVhdGUgbGlzdCBvZiBmb3JtYXQvbW9k
aWZpZXIgZm9yDQo+IGFzeW5jIGFzIHdlbGwuDQo+IA0KPiB2NTogY3JlYXRlX2luX2Zvcm1hdHMg
Y2FuIHJldHVybiAtdmUgdmFsdWUgaW4gZmFpbHVyZSBjYXNlLCBjb3JyZWN0IHRoZSBpZg0KPiBj
b25kaXRpb24gdG8gY2hlY2sgdGhlIGNyZWF0aW9uIG9mIGJsb2IgPENoYWl0YW55YT4gRG9udCBh
ZGQgdGhlIG1vZGlmaWVyIGZvcg0KPiB3aGljaCBub25lIG9mIHRoZSBmb3JtYXRzIGlzIG5vdCBz
dXBwb3J0ZWQuDQo+IHY2OiBSZW1vdmUgdGhlIGNvZGUgZm9yIG1hc2tpbmcgdGhlIHVuc3VwcG9y
dGVkIG1vZGlmaWVycyBhcyBVTUQgY2FuDQo+IGxlYXZlIHdpdGggaXQuIChOYXZlZW4vQ2hhaXRh
bnlhKQ0KPiANCg0KTEdUTQ0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFoIDxj
aGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4g
UiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBUZXN0ZWQtYnk6IE5hdmVlbiBL
dW1hciA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9wbGFuZS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4g
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBpbmRleA0KPiBmZTE4MWMxMDAyMTcxYWNj
NjhkMzA1NGMyZDE3OGY5YjlmNTAxZmUyLi5mYzI2ZWY4YTZjYWIzNDZjOTQ5MTQ5NWI1Nw0KPiBm
ODhmMWViMjA1ZDIyYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiBAQCAtMTkzLDkgKzE5Mywx
MiBAQCBtb2RpZmllcnNfcHRyKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyX2Jsb2INCj4gKmJs
b2IpDQo+ICAJcmV0dXJuIChzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllciAqKSgoKGNoYXIgKili
bG9iKSArIGJsb2ItDQo+ID5tb2RpZmllcnNfb2Zmc2V0KTsgIH0NCj4gDQo+IC1zdGF0aWMgaW50
IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJt
X3BsYW5lDQo+ICpwbGFuZSkNCj4gK3N0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUNCj4gKnBsYW5lLA0KPiArCQkJ
CSBib29sICgqZm9ybWF0X21vZF9zdXBwb3J0ZWQpDQo+ICsJCQkJCQkoc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmUsDQo+ICsJCQkJCQkgdWludDMyX3QgZm9ybWF0LA0KPiArCQkJCQkJIHVpbnQ2NF90
IG1vZGlmaWVyKSkNCj4gIHsNCj4gLQljb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnICpjb25m
aWcgPSAmZGV2LT5tb2RlX2NvbmZpZzsNCj4gIAlzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJs
b2I7DQo+ICAJc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgKm1vZDsNCj4gIAlzaXplX3QgYmxv
Yl9zaXplLCBmb3JtYXRzX3NpemUsIG1vZGlmaWVyc19zaXplOyBAQCAtMjM3LDEzICsyNDAsMTcN
Cj4gQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0DQo+IGRybV9wbGFuZSAqcGxhbmUNCj4gIAltb2QgPSBtb2RpZmllcnNfcHRy
KGJsb2JfZGF0YSk7DQo+ICAJZm9yIChpID0gMDsgaSA8IHBsYW5lLT5tb2RpZmllcl9jb3VudDsg
aSsrKSB7DQo+ICAJCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50OyBqKyspIHsN
Cj4gLQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCB8fA0KPiAtCQkJ
ICAgIHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQocGxhbmUsDQo+IC0JCQkJCQkJ
ICAgICAgIHBsYW5lLQ0KPiA+Zm9ybWF0X3R5cGVzW2pdLA0KPiAtCQkJCQkJCSAgICAgICBwbGFu
ZS0NCj4gPm1vZGlmaWVyc1tpXSkpIHsNCj4gKwkJCWlmICghZm9ybWF0X21vZF9zdXBwb3J0ZWQg
fHwNCj4gZm9ybWF0X21vZF9zdXBwb3J0ZWQNCj4gKwkJCQkJCQkocGxhbmUsDQo+ICsJCQkJCQkJ
IHBsYW5lLQ0KPiA+Zm9ybWF0X3R5cGVzW2pdLA0KPiArCQkJCQkJCSBwbGFuZS0+bW9kaWZpZXJz
W2ldKSkNCj4gew0KPiAgCQkJCW1vZC0+Zm9ybWF0cyB8PSAxVUxMIDw8IGo7DQo+ICAJCQl9DQo+
ICAJCX0NCj4gKwkJaWYgKCFtb2QtPmZvcm1hdHMpIHsNCj4gKwkJCWJsb2JfZGF0YS0+Y291bnRf
bW9kaWZpZXJzLS07DQo+ICsJCQljb250aW51ZTsNCj4gKwkJfQ0KPiANCj4gIAkJbW9kLT5tb2Rp
ZmllciA9IHBsYW5lLT5tb2RpZmllcnNbaV07DQo+ICAJCW1vZC0+b2Zmc2V0ID0gMDsNCj4gQEAg
LTI1MSwxMCArMjU4LDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0
IGRybV9kZXZpY2UNCj4gKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUNCj4gIAkJbW9kKys7
DQo+ICAJfQ0KPiANCj4gLQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2Us
IGNvbmZpZy0NCj4gPm1vZGlmaWVyc19wcm9wZXJ0eSwNCj4gLQkJCQkgICBibG9iLT5iYXNlLmlk
KTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiBibG9iLT5iYXNlLmlkOw0KPiAgfQ0K
PiANCj4gIC8qKg0KPiBAQCAtMzcxLDYgKzM3NSw3IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVy
c2FsX3BsYW5lX2luaXQoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gIAl9Ow0KPiAgCXVu
c2lnbmVkIGludCBmb3JtYXRfbW9kaWZpZXJfY291bnQgPSAwOw0KPiAgCWludCByZXQ7DQo+ICsJ
aW50IGJsb2JfaWQ7DQo+IA0KPiAgCS8qIHBsYW5lIGluZGV4IGlzIHVzZWQgd2l0aCAzMmJpdCBi
aXRtYXNrcyAqLw0KPiAgCWlmIChXQVJOX09OKGNvbmZpZy0+bnVtX3RvdGFsX3BsYW5lID49IDMy
KSkgQEAgLTQ3Nyw4ICs0ODIsMjQNCj4gQEAgc3RhdGljIGludCBfX2RybV91bml2ZXJzYWxfcGxh
bmVfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgCQlkcm1fcGxhbmVfY3JlYXRlX2hv
dHNwb3RfcHJvcGVydGllcyhwbGFuZSk7DQo+ICAJfQ0KPiANCj4gLQlpZiAoZm9ybWF0X21vZGlm
aWVyX2NvdW50KQ0KPiAtCQljcmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSk7DQo+ICsJ
aWYgKGZvcm1hdF9tb2RpZmllcl9jb3VudCkgew0KPiArCQlibG9iX2lkID0gY3JlYXRlX2luX2Zv
cm1hdF9ibG9iKGRldiwgcGxhbmUsDQo+ICsJCQkJCQlwbGFuZS0+ZnVuY3MtDQo+ID5mb3JtYXRf
bW9kX3N1cHBvcnRlZCk7DQo+ICsJCWlmIChibG9iX2lkID4gMCkNCj4gKwkJCWRybV9vYmplY3Rf
YXR0YWNoX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwNCj4gKwkJCQkJCSAgIGNvbmZpZy0+bW9kaWZp
ZXJzX3Byb3BlcnR5LA0KPiArCQkJCQkJICAgYmxvYl9pZCk7DQo+ICsJfQ0KPiArDQo+ICsJaWYg
KHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpIHsNCj4gKwkJYmxvYl9p
ZCA9IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihkZXYsIHBsYW5lLA0KPiArCQkJCQkJcGxhbmUtPmZ1
bmNzLQ0KPiA+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpOw0KPiArCQlpZiAoYmxvYl9pZCA+
IDApDQo+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsDQo+ICsJ
CQkJCQkgICBjb25maWctDQo+ID5hc3luY19tb2RpZmllcnNfcHJvcGVydHksDQo+ICsJCQkJCQkg
ICBibG9iX2lkKTsNCj4gKwl9DQo+ICsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAt
LQ0KPiAyLjI1LjENCg0K
