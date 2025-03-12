Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF32FA5D5BA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 06:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C6610E6CE;
	Wed, 12 Mar 2025 05:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjVTI104";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F2C10E6CB;
 Wed, 12 Mar 2025 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741758654; x=1773294654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+l+OG4Oc12GqCx2vnCOxSK/hwUQZbV7DZflvcbXD3Eg=;
 b=CjVTI104SQuYndim0MdX2+aYWCYaBHf00ld1zWiNM6tLYkAJWTyGemJP
 fgjdJtlsR7uDRffjnOkvKr4q1Vcinil0mic6RAkAI9VeW0MwgwK4TaDeH
 yr7ISr6DlvQnLXzhBAqRDZbsDQgWaCox97BxKOGWLN+QR8qnzfCHhtYf6
 UWQj0AunEnc397ZQw4vcKZ1Aog1G+9COGi3XwwEb30S8VpGmmVmWdIfXv
 S0xinQkVRzOEGUK8u7BJW100VIg9egVcl7C9RxcPug2D4elvrkiW9D8ZS
 HHvdJZIwHhoqG2GOpDRpnKKcg9S5F3oWj0sIvIaEMl+9lPy/a6oC6/nGt w==;
X-CSE-ConnectionGUID: ROxg9J57SPWpnAU3b4omEA==
X-CSE-MsgGUID: XyIO89icTQ6TLtzOfHy3Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42859307"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42859307"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 22:50:53 -0700
X-CSE-ConnectionGUID: zYJDgl47QU20dTGv4scOsQ==
X-CSE-MsgGUID: BtdWAGVZQJO151LeJ+O/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="121437046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 22:50:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 22:50:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 22:50:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 22:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHyxi5FRh4JsmY0JXQSJYQ6/mRwIf7k0KJnzygAchO4sE8/ftZXJtbvnbr06uuq07XQf+w0mZ68+3BP+xE0+zuo+5Aro7GqE4K3b9JLt1UPQh6siiDla7igz0ryxC2io4yKcZ66Y+T91UAYcnujQwq/QQ4a/ZlOd93xsY0SOo+SXTch/Oo84dn+Q/9K1PgOq1pjGmwSGlJ69kXVM3oFiQrlxry1c4gC9RB9Rb72BGs9CNIV2UUjjf9HUWgVVs1KFQbXU1dbdIjFD5h1nJL+Fzt+C8iB0WyRpy2TBX0sHMNTc6hL7sLV/KrHwJ2YmjOVNSciG7ApHSAZsjFRNLJrycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l+OG4Oc12GqCx2vnCOxSK/hwUQZbV7DZflvcbXD3Eg=;
 b=OPSW58T4KgFtC5gEw9gl6K7NUSpuys+lAWnWk6Ln6Ta8xvdamp35/ns1JZPK6mfa7vxf36+J7apQ4oOlp/C2bOFGZpMk2+zqUg86xia05hmeAne73nfquJOBPZRjkCll1JNDuijjqXxGOlfwZFrr6wWx8axUDxGc3hGpI1bpGfEH0zDubKmD/iiaBIMJGkzTHxFGOa/vLGHkQYWwPX1U9ypo4j6xbap3YA6ERwwi22WASxj5Xs1gOt/jCK+imALL3U/LpXRPAu34t4h5mYzCGfoIz3Ud5v35PDRjeNTopbosDnt8g6saz1O/WrOBaI73yqwoXSUeqw/iyEh556O/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 05:50:43 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:50:43 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>
Subject: RE: [PATCH v7 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v7 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbh1m4kkYCX9B9PkCfZxq6awq80rNvFpGA
Date: Wed, 12 Mar 2025 05:50:43 +0000
Message-ID: <SJ1PR11MB6129A2EED631B44A2B0AD179B9D02@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
 <20250225-asyn-v7-2-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-2-20b81122f4ce@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ1PR11MB6132:EE_
x-ms-office365-filtering-correlation-id: f17698fa-5efc-4268-46cd-08dd6129d3f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MkVSUGRiTXgrVVh4bDlwQ3FmcWZ2NE5tVk9qRzArYzhOWGxsblRsNHZEZ3Nw?=
 =?utf-8?B?dndnYXIzd25MN3d3ZUhFM1V0L3U3Qko3OXhQVEsrczhMMS9GUlpHbDU3Tk9q?=
 =?utf-8?B?Q2I3UmZmVGh4M0dnQWtzdFc1d3pLSG81MGF6RDNUQy8yaVNCMnlEN29ROHpp?=
 =?utf-8?B?bkszeGIwV05nSWd4RmV3WkU5VWpNcXh5REdaYkpXT3lWTTJYQmFaZ3NsVU5F?=
 =?utf-8?B?NzNEWUhxRkdFSWsyeUFVL3JPM2o5cnRLTjZXK3FqNi8zTkhrMmRDaXhQVlVi?=
 =?utf-8?B?NTc5Y3NXb29ZdnUweGVucS9UVi9xWU1NSDF2VnIvMktRMTEzQ0lQWnNvYUk1?=
 =?utf-8?B?VHVCZDJ0elJSNE83SzZ1K0doemZUOFBQTmhzRTJwT1p3Q1FKU2ZFdGdmWG5X?=
 =?utf-8?B?OWZmVmFvMWdVcWdiMVpQOU94aVU5WFBqaVhxd0ovRFFVYWcvNEJtZnBkVWZi?=
 =?utf-8?B?ZSsrVWZzU3Q4cWlPa2E2VTR3TFozaVNKRXdhd1V1bXV5RGdUQzRYbWI2UG5q?=
 =?utf-8?B?N1d0eEIyQkwvaExwQjVPTGYvYWFJVXlvMDVjZk8wWDd1R09Ma1J3NXJvdWtE?=
 =?utf-8?B?MEFzQUx4ZEp6Und1YW5YM3gwOUJFc1ZjNGFoc2ZhZVA5Zlk3bm1DSUlydDV1?=
 =?utf-8?B?R01IRnI0UEhWVnYzQmhldlRXNjFWNk9hVFB0NkNCVjQ4alVKTlRMdm8ydUJr?=
 =?utf-8?B?Q1plWXcyL1NzV0pza1lXSTNuTk9RVGIzbW5ab2pDRWtxeDk5SHBDVGNPWlls?=
 =?utf-8?B?V1dpZllDbTNaYlhuc0JJRFpuY0ZIRjJKZnN3L3lCV05rZ2k5aTJjRHI2bVdF?=
 =?utf-8?B?cEJTMlpIL25uTXNYMjZXN1lQci9ZU2VmZ0NlRXpJbVFUWFlHUm42MkdXMHg1?=
 =?utf-8?B?ckh1UXEyNDkrM2t6RkhyZDc3UnNNcEpkbWNKSTBLdE9WSEhKUCs3WVQ1N01l?=
 =?utf-8?B?VUsrNFNJdC92c2drSW5QeEFkbDRINGRvVkRlUGx6NGhsemdwd1VoOWROT215?=
 =?utf-8?B?cy8wSjNhRWFYMVhaWklicXFZQ2JxSUZEZ1llanBqd2RwUVNrdWREdWhhNy9x?=
 =?utf-8?B?RkN3WWV1ZGNMempCUFpYZ2hSRHZvYWh0dEFuRkxRMm5YNDZHcVV4NTg4dGkx?=
 =?utf-8?B?aEJOYTMxcXFWMFpBZmdtaUdrV2lVVXJIWXR5eTNHZU5RYzRKRHZzTDZEdlZh?=
 =?utf-8?B?dnJ6elNIOGkrYk5NV0ZZNWNpclArQVRYZHd4eVRraGZWZC9TYm12Tm0ya1Ey?=
 =?utf-8?B?THZrcHEvRTk5ZzI3TXJZSmZlL3NIUURZaTlKSEhNL29xaldlWlpIdE9pa3di?=
 =?utf-8?B?ZWhnVnN4cFdsS0xpM3YyYldEUm5KUnROREhDd3BBaDI0elZGOVphajIyRWFt?=
 =?utf-8?B?enF0VEFvVGlEeG5tL29FUW9veVg5QXhSckZBYitXWlpZajdFNWdvU0Fqbldq?=
 =?utf-8?B?eFZPY1Jhb0YrV1lEM0p5b0l0MWl3eW9MVzg5S2cvWUZhVzdEaXdUMEdnU2FR?=
 =?utf-8?B?d282RDZXR05hdkRYeXgxUDhyOWcwUm12ZXpEa3FhWkxSYlh1WE5ta3F4MlVK?=
 =?utf-8?B?bFVNRGQxQU9KOEVSdGxzN3lHODlzYmMxcStVQ201Y2tpZUZlck5nQ0IvWFdr?=
 =?utf-8?B?U3ZPRVhKcWNnalVuMUNncXZWMFd5clpNenZDemVHM0txOUN0STBaRjVzWjB3?=
 =?utf-8?B?WlAxNmZPL1YwSDZnaDJkck1EQ3hYMEtiY0lKYWoycyt5UkVESGNkMUxCMHJ3?=
 =?utf-8?B?dndaN05GUENnRjdxbHpHYmZjY1oyamova0pYc2NZVldaQWR1aVlNYXhhaEpF?=
 =?utf-8?B?WWFqdThnQWlSNXpZRWxNVUQ0anNZTTMweUdlVDNTMFJadUhjWklEUWdoU3Bw?=
 =?utf-8?B?U2xmREFUNEJqYUp3RlRvdUJ2ajNVQTdQTk9lL3RxekdtQnZiZlRUNFUvQ01v?=
 =?utf-8?Q?ILAYwWFp52T3HkthBhpBh8J1kHOpj/Ju?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTN5QXMyZG9SM0NLSGIxMnZtZTlaUXpLL21RRTg1T0dERjc1UG9TNU1ZZWp6?=
 =?utf-8?B?ZHFPdjNsbWZKNXRyVDFxK0xBcmZoV3ZRWUZzM1A3ekN6TjE4UERXMFFGZmh3?=
 =?utf-8?B?QUZkYnZVam5NTzVnS3RoQVk2bUFWSks3dnhrRzVmQ0VGd2FVTnpYNUdpUXNl?=
 =?utf-8?B?UENZejY5TytPcForMlRnbzlIdWlLWUwwUXlDOE5CUFI4RVdtQVdqa1RQb0Zq?=
 =?utf-8?B?U2ljeS93YzNYbGpDNGRWdjhCbzZaakY2UnlWR29QbjFPbnRIY0t1NVVsRURG?=
 =?utf-8?B?K21lanBVOUVQbC8wUmhvRWNDWE9Oa2N4L0NmZzFVcDVqSkJxVGdGUDlnNVI2?=
 =?utf-8?B?alk4ZXRibzNBNTB3dC9rSkpPK2Y4MHRSWXhGMEJmV2ZvaU1WYkFJZWpOWmFj?=
 =?utf-8?B?UkRSZFNEeDVaNDR4L2dEQ1NaeEdPc0hJZEc1SzNpckRETkxydm1NUEplQnps?=
 =?utf-8?B?MVlCK0cwd3ZlYUwvbG8wTUFLRzhHeEpscmpua2ZuNkZvN1ZCTUZGQlQ1T1lB?=
 =?utf-8?B?VThQa0dsTXJER0VmNWJ3VGExcWJhZ0FMU1dad3JTVldGTEtLSytCMEUvS0Mw?=
 =?utf-8?B?ZkhtSlE4SEhrc211RHVqVlVpWWE2UVNuWlV5bHIrSFJaRUpLM0dFamh2Tk12?=
 =?utf-8?B?NnVOU2l6UTFPOVdwWDhNbTdSdHJGMjFIeUJoa2daMHd4WTkyU1dXVXoxd2N3?=
 =?utf-8?B?Uyt1RXhLR25yS2k4MnBNOFdSRGg1a3AyUW5ZNzdDRXFCOXJpUVRYT04vS0g5?=
 =?utf-8?B?NUpZNmJkWGEveUhiMTVSSWsraG5JclBDZEYzbzFyRnYwbDg1KzZxcjFoWTFq?=
 =?utf-8?B?ayszOGhQUzU1bUk1R3ltRktCQkhzMENiSXptOTNWVUUraU11MFk4Nmg4Mk1m?=
 =?utf-8?B?TU9XZzJPVFJhWThKOW1ZZGxrNVNpYWVnZTdvdC9uTkt6VVd0OWM1bUtnNzJD?=
 =?utf-8?B?eCtZY3VJUDdpTWxMY1kxMHJiWUo0UFVTY0JuQ1JnVG1xUHF4cXRDNXJhdTZ2?=
 =?utf-8?B?R1pLYWl6T3VGQW5QQWoxZWVXeVhIdDVrdFhYcEFDZEhnL01DQU5rRUVES3Iv?=
 =?utf-8?B?aGtqSUNhR2wrMU5qUktDU2wzcEJyZWJuck9qVFB0Uk44ejhMRG9LeVJUQjdy?=
 =?utf-8?B?ZVg3K01MM213WHJTRFJhMUNiNXBPVXR0b1JTZ0IwTlh5SVJ3azcxbVltSFdV?=
 =?utf-8?B?SFhpUERYbyt0b0JDM2Y0b3I5aEk3SWx2SjY3Sk44clB1OEZrSjk2Y3Q4UEEy?=
 =?utf-8?B?aHJ6YjhqMldTVjY1clVMQlJqS2FUZEl1YnE1SmlRY0h4N1JEYnJyZVBCVnQz?=
 =?utf-8?B?UzhRMG5tN1dsakFLUlllenQvZldlTldaRVVtWVhlUFUwVitqMm5qbTc0d280?=
 =?utf-8?B?TzNFSEtLTXNjenR6VkJ3MVNSM3owTHRYMGJzaG9aUDh2TFVndjhHcFlYZWM0?=
 =?utf-8?B?UFV0WHFYMzVORWRuaFQxODFGMStvRDRsQ3pQZk9YazZyL0lwUWdIN2t5bzhl?=
 =?utf-8?B?ck5rRk4wQ0dWUEFicTlPV0t3bVN0a2xEYkM2RXVrRU05R1RJWHlKTlV0MnJM?=
 =?utf-8?B?cVFFNEx3a09wWFVmWkswUUFHN3lHRzQxdTF4aDdnNEFZN04xTXVpaW1KK0hm?=
 =?utf-8?B?Yitxc2FmSGVPTUZ0TWR0N1pLQ2NhbzI4OWs2ZTFJekNSNVg3OHA4amNkVFc3?=
 =?utf-8?B?MVJVRlVtYXg5VGhWWDFXQVBXNDNpV2RaKzl5bkhNTkV5UWZrOG9VZHJVNUls?=
 =?utf-8?B?SCtDMGFYcncyRTJjUFRZMnJla0o1NTRrSDUzaWVZQnZwVDVvTDNsNHd2SGxE?=
 =?utf-8?B?cWZaSXZnZ3hNQUpRQzA1YTNCU3BFazhwVXNJZmxKWTlKSFRMRVR4S0hxSGJH?=
 =?utf-8?B?Y3hxaXJlZlZXdDVUNjJudkR4QjNETWpqcUlzb1hYNlBpUTN6MlVxV2VkeDJl?=
 =?utf-8?B?RzI4TkswcCtFT1ZNOXl6QWlsMFFaR2t0RmwvUnEzS0grczlNbk1EeDBYYUl1?=
 =?utf-8?B?UlNnSFFIRFNZRGpRY3kyZU95UGI1QzBOOHJjMlBVZXVRMlZUM08xTFJRQVBk?=
 =?utf-8?B?N1FIQXMzYU9lZ0x4YUU1N3R2TmtlbTE1d0tzTUFKNnhqUEdGR2tEdWdDQTBZ?=
 =?utf-8?B?MjNmVHpEMkxlZ2RucldFTDlldEowN3huVExCNm1YdDZMdVAvQW5ZbkpvbUhT?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17698fa-5efc-4268-46cd-08dd6129d3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 05:50:43.3352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnvj85+Ct6YnxfXG8XRLFkEV2sCM8ZLQdiDr82Qf7x53X0M3ktfb4kPzdH7+TbxwoP/iWdwpJp5RnCP+IN47I3JcZbh7WR1QwXyDZd1XxmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBBcnVu
IFIgTXVydGh5DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI1LCAyMDI1IDE6MDQgUE0NCj4g
VG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tDQo+IENjOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+OyBLdW1hciwgTmF2ZWVuMQ0KPiA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAyLzNdIGRybS9wbGFuZTogbW9kaWZ5IGNyZWF0ZV9pbl9m
b3JtYXRzIHRvDQo+IGFjY29tbW9kYXRlIGFzeW5jDQo+IA0KPiBjcmVhdGVfaW5fZm9ybWF0cyBj
cmVhdGVzIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXQvbW9kaWZpZXJzIGZvcg0KPiBzeW5j
aHJvbm91cyBmbGlwcywgbW9kaWZ5IHRoZSBzYW1lIGZ1bmN0aW9uIHNvIGFzIHRvIHRha2UgdGhl
DQo+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkIGFzIGFyZ3VtZW50IGFuZCBjcmVhdGUgbGlzdCBvZiBm
b3JtYXQvbW9kaWZpZXIgZm9yDQo+IGFzeW5jIGFzIHdlbGwuDQo+IA0KPiB2NTogY3JlYXRlX2lu
X2Zvcm1hdHMgY2FuIHJldHVybiAtdmUgdmFsdWUgaW4gZmFpbHVyZSBjYXNlLCBjb3JyZWN0IHRo
ZSBpZg0KPiBjb25kaXRpb24gdG8gY2hlY2sgdGhlIGNyZWF0aW9uIG9mIGJsb2IgPENoYWl0YW55
YT4gRG9udCBhZGQgdGhlIG1vZGlmaWVyIGZvcg0KPiB3aGljaCBub25lIG9mIHRoZSBmb3JtYXRz
IGlzIG5vdCBzdXBwb3J0ZWQuDQo+IHY2OiBSZW1vdmUgdGhlIGNvZGUgZm9yIG1hc2tpbmcgdGhl
IHVuc3VwcG9ydGVkIG1vZGlmaWVycyBhcyBVTUQgY2FuDQo+IGxlYXZlIHdpdGggaXQuIChOYXZl
ZW4vQ2hhaXRhbnlhKQ0KPiB2NzogUmV0YWluIHRoZSB1bnN1cHBvcnRlZCBtb2RpZmllcnMsIHVz
ZXJzcGFjZSBzaG91bGQgaGF2ZSBubyBpbXBhY3QsDQo+IHJldHVybiBwb2ludGVyIHRvIGJsb2Ig
aW5zdGVhZCBvZiBibG9iX2lkKFZpbGxlKQ0KPiANCg0KTEdUTQ0KDQoNClJldmlld2VkLWJ5OiBD
aGFpdGFueWEgS3VtYXIgQm9yYWggPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQoN
Cg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwu
Y29tPg0KPiBUZXN0ZWQtYnk6IE5hdmVlbiBLdW1hciA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgNDEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAtLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjkg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IGlu
ZGV4DQo+IGZlMTgxYzEwMDIxNzFhY2M2OGQzMDU0YzJkMTc4ZjliOWY1MDFmZTIuLjk3YTM4N2E5
NjY2MjJmNGI1M2IwNDUyMjcNCj4gOTYxN2NiMjdiNDJmN2IyIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jDQo+IEBAIC0xOTMsOSArMTkzLDEyIEBAIG1vZGlmaWVyc19wdHIoc3RydWN0IGRybV9mb3Jt
YXRfbW9kaWZpZXJfYmxvYg0KPiAqYmxvYikNCj4gIAlyZXR1cm4gKHN0cnVjdCBkcm1fZm9ybWF0
X21vZGlmaWVyICopKCgoY2hhciAqKWJsb2IpICsgYmxvYi0NCj4gPm1vZGlmaWVyc19vZmZzZXQp
OyAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUNCj4gKnBsYW5lKQ0KPiArc3RhdGljIHN0cnVj
dCBkcm1fcHJvcGVydHlfYmxvYiAqY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2
aWNlDQo+ICpkZXYsDQo+ICsJCQkJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+
ICsJCQkJCQkgICAgICAgYm9vbA0KPiAoKmZvcm1hdF9tb2Rfc3VwcG9ydGVkKShzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZSwNCj4gKwkJCQkJCSAgICAgICB1MzIgZm9ybWF0LA0KPiArCQkJCQkJICAg
ICAgIHU2NCBtb2RpZmllcikpDQo+ICB7DQo+IC0JY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZp
ZyAqY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7DQo+ICAJc3RydWN0IGRybV9wcm9wZXJ0eV9i
bG9iICpibG9iOw0KPiAgCXN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyICptb2Q7DQo+ICAJc2l6
ZV90IGJsb2Jfc2l6ZSwgZm9ybWF0c19zaXplLCBtb2RpZmllcnNfc2l6ZTsgQEAgLTIzNywxMCAr
MjQwLDEwDQo+IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBkcm1fcGxhbmUgKnBsYW5lDQo+ICAJbW9kID0gbW9kaWZp
ZXJzX3B0cihibG9iX2RhdGEpOw0KPiAgCWZvciAoaSA9IDA7IGkgPCBwbGFuZS0+bW9kaWZpZXJf
Y291bnQ7IGkrKykgew0KPiAgCQlmb3IgKGogPSAwOyBqIDwgcGxhbmUtPmZvcm1hdF9jb3VudDsg
aisrKSB7DQo+IC0JCQlpZiAoIXBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQgfHwN
Cj4gLQkJCSAgICBwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKHBsYW5lLA0KPiAt
CQkJCQkJCSAgICAgICBwbGFuZS0NCj4gPmZvcm1hdF90eXBlc1tqXSwNCj4gLQkJCQkJCQkgICAg
ICAgcGxhbmUtDQo+ID5tb2RpZmllcnNbaV0pKSB7DQo+ICsJCQlpZiAoIWZvcm1hdF9tb2Rfc3Vw
cG9ydGVkIHx8DQo+ICsJCQkgICAgZm9ybWF0X21vZF9zdXBwb3J0ZWQocGxhbmUsDQo+ICsJCQkJ
CQkgcGxhbmUtPmZvcm1hdF90eXBlc1tqXSwNCj4gKwkJCQkJCSBwbGFuZS0+bW9kaWZpZXJzW2ld
KSkgew0KPiAgCQkJCW1vZC0+Zm9ybWF0cyB8PSAxVUxMIDw8IGo7DQo+ICAJCQl9DQo+ICAJCX0N
Cj4gQEAgLTI1MSwxMCArMjU0LDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Io
c3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUNCj4gIAkJ
bW9kKys7DQo+ICAJfQ0KPiANCj4gLQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUt
PmJhc2UsIGNvbmZpZy0NCj4gPm1vZGlmaWVyc19wcm9wZXJ0eSwNCj4gLQkJCQkgICBibG9iLT5i
YXNlLmlkKTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiBibG9iOw0KPiAgfQ0KPiAN
Cj4gIC8qKg0KPiBAQCAtMzY2LDYgKzM2Niw3IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2Fs
X3BsYW5lX2luaXQoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gIAkJCQkgICAgICBjb25z
dCBjaGFyICpuYW1lLCB2YV9saXN0IGFwKSAgew0KPiAgCXN0cnVjdCBkcm1fbW9kZV9jb25maWcg
KmNvbmZpZyA9ICZkZXYtPm1vZGVfY29uZmlnOw0KPiArCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxv
YiAqYmxvYjsNCj4gIAlzdGF0aWMgY29uc3QgdWludDY0X3QgZGVmYXVsdF9tb2RpZmllcnNbXSA9
IHsNCj4gIAkJRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KPiAgCX07DQo+IEBAIC00NzcsOCArNDc4
LDI0IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0DQo+IGRy
bV9kZXZpY2UgKmRldiwNCj4gIAkJZHJtX3BsYW5lX2NyZWF0ZV9ob3RzcG90X3Byb3BlcnRpZXMo
cGxhbmUpOw0KPiAgCX0NCj4gDQo+IC0JaWYgKGZvcm1hdF9tb2RpZmllcl9jb3VudCkNCj4gLQkJ
Y3JlYXRlX2luX2Zvcm1hdF9ibG9iKGRldiwgcGxhbmUpOw0KPiArCWlmIChmb3JtYXRfbW9kaWZp
ZXJfY291bnQpIHsNCj4gKwkJYmxvYiA9IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihkZXYsIHBsYW5l
LA0KPiArCQkJCQkgICAgIHBsYW5lLT5mdW5jcy0NCj4gPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKTsN
Cj4gKwkJaWYgKCFJU19FUlIoYmxvYikpDQo+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0
eSgmcGxhbmUtPmJhc2UsDQo+ICsJCQkJCQkgICBjb25maWctPm1vZGlmaWVyc19wcm9wZXJ0eSwN
Cj4gKwkJCQkJCSAgIGJsb2ItPmJhc2UuaWQpOw0KPiArCX0NCj4gKw0KPiArCWlmIChwbGFuZS0+
ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jKSB7DQo+ICsJCWJsb2IgPSBjcmVhdGVf
aW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSwNCj4gKwkJCQkJICAgICBwbGFuZS0+ZnVuY3MtDQo+
ID5mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyk7DQo+ICsJCWlmICghSVNfRVJSKGJsb2IpKQ0K
PiArCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLA0KPiArCQkJCQkJ
ICAgY29uZmlnLQ0KPiA+YXN5bmNfbW9kaWZpZXJzX3Byb3BlcnR5LA0KPiArCQkJCQkJICAgYmxv
Yi0+YmFzZS5pZCk7DQo+ICsJfQ0KPiArDQo+IA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANCj4g
LS0NCj4gMi4yNS4xDQoNCg==
