Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60635A83F2F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC410E86E;
	Thu, 10 Apr 2025 09:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUCIJjFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0310E843;
 Thu, 10 Apr 2025 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744278278; x=1775814278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iVAh+ZCQnegDGh2XGqGNPN7AuJN+Y0wC5T5Z0Vl73/E=;
 b=eUCIJjFYymJ6sPQ1NOBbXKzrBOX3kbWUuxiXyVRhMz0SI+LW3HYy2elj
 rm0wejS3icF0lPdEdTVwkCAypbOKOsprjdx5OPA43rV+2BTCgzNNA21b8
 DtaldOm6iClMdrRojQ1HSKcjlEBniTyqAdUxV0O+YjZ08Z7cAAMyDOup9
 UretmXyuysMiSuxsA1exk0dOuK+FrSZETFg7qdhE6rvAkJYQRKi037ncI
 EKZZ/3Ua3es35fB8FUUbVTU3Ocf+XF1MVa0sjaw0UorZ4yap5jii5Okkv
 WTltdWjAYIlK+cWQfAR7UiBZXxL2dkrbFRSjCNBCCOlIvp9fVLVD90Igp w==;
X-CSE-ConnectionGUID: vzuroHQKRymwPNcoJ9biJg==
X-CSE-MsgGUID: mXCkrz5pTNuRfBVxG/yONA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49587730"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49587730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:44:37 -0700
X-CSE-ConnectionGUID: lDv32MwwSuqlgWXmWJw0qQ==
X-CSE-MsgGUID: Lg7FjJ1GQYCuCAmYygYEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="152028731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:44:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 02:44:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 02:44:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 02:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frDRO/foMXaodzpUxdzGYxo9r2QYgJv94X/wMjOljwJX9iRymtgxuBnjmwVeCEx+pTroPZ+dUW0jjdsZeeT3MJk+VvmYxRnjcs5OzhClmiKWwBW+ny7J0qWHIzg/hq2Bnt2QcQNoFv7n/C59NOrdlJPIBgixvNDkKix9AJxKq8TukX0/GkjIQWd4GF+8VhYpDr9zySmpw8uNaPp15hoHwvL5sHiah9+yRkUV1xMRqnfTEmXJ5DnxXlXa6obXcB4EGg3hF/tYtwBrK1ZQWdMHr0UGkzppdnZ6ZjMHX7Znlwarjp9+dtOPWKK9U2GshbCiS8qn++TUJVTsg9qnaVmvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVAh+ZCQnegDGh2XGqGNPN7AuJN+Y0wC5T5Z0Vl73/E=;
 b=aHm/fpzRC3qYdOjzPqIvUUJ1+l6AxQ2kgvrtyZoCFpJF4a0jAS2P3VMiXV7AbE1QvazECrwZWxgHT8gQdXMKplkF7ThAFXdzqFXh6+eAQaWFx3/VSry7BN4j47f0HOubFQheAnklnn8b9ywoLxNEBwOX80/ARX7QBXDJnmqC5nqptuLMEq/G1JVxx1sv24gwI4dDoGmdCNy6+/c+gifPZdoRdrLJHGsAcih8/NMgX57I3KJ+qZy6gB2KeuKnZvjGVgTr/5TXMKN5ZSqBuHRsHg4MUemwipCqthlESLWUH/IJC9bkIoXACD1AD8UqvZvEMI+0jhxJi2gAEDLhCC9nTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Thu, 10 Apr
 2025 09:44:23 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 09:44:22 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
Thread-Topic: [PATCH v7 01/12] mtd: core: always create master device
Thread-Index: AQHbnmT6czHkKmL9wkq39BK9P9qwmbOO8SWHgAjtlcCAA1DrIYABjPIQ
Date: Thu, 10 Apr 2025 09:44:22 +0000
Message-ID: <CY5PR11MB63664C1F1C2094580649F4D5EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
 <87ecycrko4.fsf@bootlin.com>
 <CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87zfgpejtu.fsf@bootlin.com>
In-Reply-To: <87zfgpejtu.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6056:EE_
x-ms-office365-filtering-correlation-id: 041b4c67-f328-46a1-4238-08dd78144634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aXJPNDNkcEhpaC9McCtpV2ErRGQwK0ljc01OVVh0Yi9mWVhXaUdQWC9memFp?=
 =?utf-8?B?MlBkNUxwRmVuM3lsYTl5Q2trbS8rMTBQdzVsajNoWUIyeGY3Ris4aEZpSS9y?=
 =?utf-8?B?YUpKcjZySmVzV2Q3bTVhVFIxY21TN1ZTMC93UmEzei96ZzBaaEJGd091eWFZ?=
 =?utf-8?B?OGFvYjE5YllHU0FXQjh0Wjhzc1pJT2ZYQ0ZLMDZSMGczSVZYakZDZjRiWmpo?=
 =?utf-8?B?eEtwcXNmSzkyTC85cHZ6SkdEaDZkRHRhTC9ZMThpZENabElFMkpjektRK2Z6?=
 =?utf-8?B?YXpaOHUrUHMxeGpZS3pzTkNnL1JSbEZROWUvNE9venlRc2pLWGZjbGswS2My?=
 =?utf-8?B?WDNSRGhNb0lWSlR2L1psaFZ5WnlGYUtSL25sbTYvYTlrZUZ0cXRYZ3dhcWg2?=
 =?utf-8?B?ZXpVc3JYUXhYSGFwdHBsVktlcjdaUHczR3FWWU16UnNQZ0JRbUU5ZkJnUnBH?=
 =?utf-8?B?MllFWXNaZzJEU25EUlVMMUdreVFrNkQrZmdpdTdremN0aUVtZEphby8rdENz?=
 =?utf-8?B?aHd3ejc1Z2lTNUVxSy9VUmFYbWE1SVFPT1ViSjdLMXlhVVRZMHBTcHREenQ4?=
 =?utf-8?B?TmcxcnZhOGlDelFNQkxNMnlwOHFxSEx1Mk1RSDVrcmZQNjFBUUFyS2JsUlpG?=
 =?utf-8?B?MWFFTTAwV3F6TzRsdEduODRIc2gwQ1dXVHNyaER3cFFDbDNCeTJERVhuRTcz?=
 =?utf-8?B?YktJVnpKZUFNeUNMaXgwbVNxaVZydDMwcXlHRGV3ZG8xUk1aU2JlN054VURT?=
 =?utf-8?B?Q21Md2dldEdlc0FVTVF6RHNodmhRam95M2R3L2c4c09UMkhjWitGS09UREYy?=
 =?utf-8?B?NTNuWmhGSys4M0ZwOE9xK1ZtV3RTQzlNUyt0anQ5Y3NCQkgwNkE3dlVZU0tz?=
 =?utf-8?B?TXFvUkNqMHp0WVlmM3RJbGJCdnNUR0R5STVTVGhvQ2xTRm1VVzUxWSttdnZQ?=
 =?utf-8?B?UVBWSTNBQ1k2WGZ0NmsrS2xCUmR2cnFyMGVvbEJxVEt1c05EQk9PN2tlMXho?=
 =?utf-8?B?NDhWcFNpMndab2JUdjFiV09NTDdmMXN3cUU5YVAxc1FpejlNTmV2UFR2QjIx?=
 =?utf-8?B?UHE2bFdZZVhRTWJyK0tHcERGV3JMNlYwVlFRR0wxc0FEbHdFNHROTDVrVi9y?=
 =?utf-8?B?cVRWNUhkL2E2VGpoYm1XVFVrRVFlTHFTQnMzdnkzQ3dXK0JRT1czMWE4Z09q?=
 =?utf-8?B?dkRQaVZaSHQxSTYrdm9SUk5IejZ5TncrTnlmWXpRaGkxRk5oOXBpeHBpOXdr?=
 =?utf-8?B?OFplMExsbXJwOGxpcUhtVWNNT3NyYXVVZDBUejVzNE5HUE1BMVJoQ0tZc01H?=
 =?utf-8?B?RlZhbjBJaTRRaUFEV3ZPQmF6NmI3N3hWczc1ZHl4Y1JjQnJ4Q3pNZ2RGMFlR?=
 =?utf-8?B?QldBRWJmZTQ5a1VUdVpydUhvTVNObXBZQlZuWFMrM2w3MTNFY3Q0VzJ4SzNp?=
 =?utf-8?B?bGh5MGY2U0FZKys0YkwvQmxXWUFTUlMrNzZQRUw5VGVWU00yNHVpRFp5eWdx?=
 =?utf-8?B?WDN0UDZaeExGNUw4R09aaHh2azFxbVhWRXcxejMyVzFqZXdaaTlTRGgxZ3ZG?=
 =?utf-8?B?OGRCd0RjaGs1ZDFPVjNqb0dmMmNOYkFwTGZ4Qmt5WjgzbkpUZENaeVNJc3Zq?=
 =?utf-8?B?T2pmS1c5MElnYzN1Mlk0S0ZFWDZZZDFUMHdnNW00VEtIYzlYdGt1cTlheHUw?=
 =?utf-8?B?SzhXcUhpc2ZNUEIzazYwYTBRUTRlNVdWSG94ejBSQkJuS0lTYTUyODhORmgz?=
 =?utf-8?B?S3NpSC9YN2lCdENrakpUTGkxUXl6OWJmUjgrTGtFV0lKYnVwc0tqVUZXUTVs?=
 =?utf-8?B?a3p1S1YvZE13RjRWRVU4cTJXamlEU0JPY0tBZURwSzhFVHJRcnhHMVRpZTRu?=
 =?utf-8?B?blNrWGN5VDgzcHBYTGNaRkJiTUhvRVczMTB0MmNJUWNEVHRUZ2h0S1laVDNV?=
 =?utf-8?Q?AWwUlhT61Zb5/VIJdUvDjvFu47SzaKKY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjFFYnZwdjIvVlpCclFZb0dDb2tWYW90aUJ6VmREcjAyZm0xME03SGFBRVE2?=
 =?utf-8?B?Ylhhd2NPY3VuMnh6b3kzRHVrdWFXdXZ5MWZCYmllVjhaV0dOa0dOSnBSd0xI?=
 =?utf-8?B?SzFrTjdKb0JSUEdaNjV4YXUxdFU0OGhZSUNCZXNVUi9TdUhpVTQ1aSszbjBN?=
 =?utf-8?B?ZUV5SFNnWk53QU8rampjSFRzeFBzZHdCdHlFeHp3dVZKUDBySFZKU0szVkM0?=
 =?utf-8?B?VktwU09UZjhhejZCbGR3WGFrMHYwckpNSFloMVJHVVIzVVZLYlJ5ODNheXhq?=
 =?utf-8?B?eWxBaStQYzB4WlhIK3NMVCtMUWlGTUZsUVltbVM4eHBmWDVmajBoRmN3OU9G?=
 =?utf-8?B?eERqL0UrUnRDUEEySlhTYjlKRHVSVHFCTGFUODNMalo1M2lFSFI5WXd4RW42?=
 =?utf-8?B?L2pDaWtTd1l2VXhpbDlSZldJWTBSbjdHdGlvZktqcENkRjZvTWZmQWFCTlFi?=
 =?utf-8?B?dzdDZDNDUmYvV0tUYnBVbGpicmE3bDZKdHE5VWZSd0p5bWZrck01MjMvOE9U?=
 =?utf-8?B?bGlkUTduV1c5bWpkU2dvYVBReXdUOWFCRk9YQ1BIUnhhZkpkd0VHRzBWZnFh?=
 =?utf-8?B?cjBkaUZrN1NZZGpJemd4THl1TTVVbW1VQ1hYa1BTK2lvQWZSMHNQeXFmYm0z?=
 =?utf-8?B?Z2pYTGRCMzU3ZTAxWFpsQm1aVmcraW5aWDVPTEZFUWhFWllHQmI4bmhhc01x?=
 =?utf-8?B?Y0JINitpelV0cXJxM0EvM082amdLdENEdk51VDhKL1FkdFNONGZLTFFuMHBI?=
 =?utf-8?B?SUtaenRDcktGMDdtR0tYVlVBYTRPNGJCRnkzZkpDRUdGQ3pjei9QQmJ2cWN3?=
 =?utf-8?B?VVdQUUtGYzRzVitVcDBlaEV1b2xiSkN5OFY0aDNtd3YrdnprUGdjL0lJTDBI?=
 =?utf-8?B?cHgvd3NHRkpIVElzTzE0c3AxZ29Jb2NuVXdicWt0T0xXTTRxNGVuTy9SZnRC?=
 =?utf-8?B?aE5GbUd5V1JsemN3ZldpeHVLWERoSUJYSzN5VGppMTMycC81ZTd3WGRTQlF1?=
 =?utf-8?B?Y3ZqaDNkMkZCMUxIbWtJQTFnQnFVWnhjSFBNZDFMK0NYaDBDK2d2b1NNQ1dk?=
 =?utf-8?B?NWYzV3I5YStvbzFNdkpmWXBtcTZKY3VydFdZNVVjbnhuV0gxbkkxWW01ZitC?=
 =?utf-8?B?aTZ6Y1FuMW5nUXZBdEFtUHFQSkVRb240cVI2WlpTbzk2czRZUUgvVGVQNi9R?=
 =?utf-8?B?N28vVGlIeXN0K2tra0dKMStMOUVJQzBPREp6V3c0MFlZYnNPZU9Zc0cvY3Z0?=
 =?utf-8?B?MUROYzdENG9QMFpIYzJFZ0pPcjFTamI4dnc4aGg5MmN4dENhVW1NMjhXZHFJ?=
 =?utf-8?B?bkd0YlR4d0VnVVZMUVNPUDZnUWp4YXMza2haZjFJUWVBRXpBSUkxejY3cXFk?=
 =?utf-8?B?QWdGSkV3aHVIWFBvL0dwai9YbnRaVy9VakQwUmVHajY3SVIwQURIYjEwSGxo?=
 =?utf-8?B?VEUvME91bThZL3duK0tsSm9tRUpqTUFNajVhYkFPVnlLMkI1NW43ZDFwTTBr?=
 =?utf-8?B?Y29SY2RhbnRRcFpDVzhGKzNSbWpGMVJDaU1HVWhDSU9XUHlJRjFocFU1czdR?=
 =?utf-8?B?QXRPMUtpSTViSHVsd25RdTVWWW5BTURlQm1WeVovYmcramZKbFRLb3N1Tk9l?=
 =?utf-8?B?RUhzVnhidlRxYng5ZXc4R3lqNlNReVljNHJDbzdSQ0VzK2tmYXRFdEw5OHkz?=
 =?utf-8?B?enk5d2NyaThtdFZBSlRVQkhaRzRBaEF6SktJdzdCTlRITjl0UE1GUlRHWGp4?=
 =?utf-8?B?UVoxVkFiVkxlMEZsc29VRktqTDhvMkh2d3R0UWZ2OHdMbmxZNktaZjk2YUFK?=
 =?utf-8?B?akpxT1dlaW1PWWc5d21XaFVFd3FqSFJjTVppeTRoZGxyR0hveDBHVUVWUmNQ?=
 =?utf-8?B?b1dMMWprRXkwM0pyMHlVZ20ybEtLMm9Wd3VsMTRxYkM2SmU5UitwQU45QVZI?=
 =?utf-8?B?N2IvNVRzUVVyckpwNVlUS3dPSk43ODFaSUNwY2ZLQlRNS1Z6QVMvSUVtVks5?=
 =?utf-8?B?ZGFpZFZ1NWVwY09wYnRGQ1RyUitPMHo0QzVjMWRFSjRRT2toeE5JSm9GZUhD?=
 =?utf-8?B?Qk5kNkpmZlhkZEdLc1RnQWFRSnB0UVh0UjZMU0Q5eXRSWEEzQmFvMXBVWGRi?=
 =?utf-8?Q?1Lh5pP0STaYQnGEQbXuXAMKTl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041b4c67-f328-46a1-4238-08dd78144634
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 09:44:22.8929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqJzeHCOuu/FP5f0ua/DiKQbKhW6Xv9Wa1G5iOB3IpC8Z0C9RB4Mj165Qdcj8rgen3OLyZQdSGSjT8UT3W9h3DZhov0WP9eN+/IaSdasNiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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

SGkNCiANCj4gSGVsbG8sDQo+IA0KPiA+IFRoZSBtdGRfbWFzdGVyIGlzIGNvbXBsZXRlbHkgZGlm
ZmVyZW50IGNsYXNzIHRvIGF2b2lkIG10ZCB0cmVlIGRpc3R1cmJhbmNlcy4NCj4gPiBJdCBpcyBy
ZWFsIGtlcm5lbCBkZXZpY2Ugb2JqZWN0LCBJJ20gbm90IHN1cmUgaG93IHdlIGNhbiBkbyAnbGlu
ayB0bycNCj4gPiBtYWdpYyBoZXJlLg0KPiANCj4gTWF5YmUgd2UgY2FuIGFkZCB0aGF0IGxhdGVy
IGlmIHNvbWVvbmUgbmVlZHMuDQo+IA0KPiA+IEFib3V0IE1URF9QQVJUSVRJT05FRF9NQVNURVIg
LSB3ZSBjYW4gdHJlYXQgaXQgYXMgYW5vdGhlciBwYXJ0aXRpb24NCj4gYW5kDQo+ID4gY3JlYXRl
IG1hc3RlciBkZXZpY2UgcGx1cyB3aG9sZSBkZXZpY2UgcGFydGl0aW9uIGFzIGl0J3MgY2hpbGQg
d2l0aCBhbGwgb3RoZXINCj4gPiBwYXJ0aXRpb25zIGFzIGNoaWxkcmVuIG9mIG1hc3RlciBkZXZp
Y2UuDQo+ID4gRm9yIHVucGFydGl0aW9uZWQgZGV2aWNlIHRoaXMgbWVhbiB0aGF0IHdlIGNyZWF0
ZSBtYXN0ZXIgZGV2aWNlIGFuZA0KPiBwYXJ0aXRpb24NCj4gPiByZWdhcmRsZXNzIG9mIE1URF9Q
QVJUSVRJT05FRF9NQVNURVIgZmxhZy4NCj4gDQo+IEkgYW0gbm90IHN1cmUgSSBmb2xsb3cgeW91
LiBJIGFtIHByb3Bvc2luZyB0byBjcmVhdGUgdGhlIG10ZF9tYXN0ZXINCj4gZGV2aWNlIGluIGFs
bCBjYXNlcy4gSSBiZWxpZXZlIHRoaXMgaXMgdGhlIGZ1dHVyZS1wcm9vZiBhcHByb2FjaC4gQ2Fu
DQo+IHlvdSBtYWtlIHRoaXMgY2hhbmdlPw0KPiANCj4gUmVnYXJkaW5nIHRoZSBoaWVyYXJjaHks
IEkgaW5kZWVkIGFncmVlIHdpdGggd2hhdCB5b3UgcHJvcG9zZToNCj4gbXRkX21hc3RlciBwYXJl
bnQgb2Ygd2hvbGUgcGFydGl0aW9uIGRldmljZSAoaWYgYW55KSBwYXJlbnQgb2YNCj4gcGFydGl0
aW9ucy4NCj4gDQoNClRvIGJlIHN1cmU6DQoNCllvdSB3YW50IHRvIGhhdmUgdGhpcyBoaWVyYXJj
aHkgd2l0aG91dCBNVERfUEFSVElUSU9ORURfTUFTVEVSOg0KbXRkX21hc3Rlcg0KXC8NCnwtPnBh
cnRpdGlvbjENCnwtPnBhcnRpdGlvbjINCg0KV2l0aCBNVERfUEFSVElUSU9ORURfTUFTVEVSIGZs
YWc6DQoNCm10ZF9tYXN0ZXINClwvDQp8LT5tYXN0ZXJfcGFydGl0aW9uDQogICBcLw0KICAgfC0+
cGFydGl0aW9uMQ0KICAgfC0+cGFydGl0aW9uMg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoN
Cj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo=
