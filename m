Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F9A709FB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648210E5D6;
	Tue, 25 Mar 2025 19:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="ndUrjd6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB27210E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2iH+LhhhTU7re1BDgPFxhgxg8LWMEfSYvFSy097SVGt0ZV9gXSqJYzf394pocqyIbDFGsKFIIvjEEeyS9kTZpnyMzNrKV4CsjcOLg4yxnEXVZedUIPvzwfpA5EDcH9E7m+lHPHY9wI5m++hEhZCw5Hi19ocekG4JgI+XXKP82HhI3l0EMgpIq/MEj21Sy4Xohdz8aZ4AFTbXuCE7yIa6JA93ByxlD5C4LXp2zffyEOCq52zwXaSmPWRnDd9/mhe1E+Ni2cejSLc1kiaM4WjRLAmRnSl61eDZGWpv3kxcJshky53L3upVGANNeTl1RblBk6P2smfyazDRrdeOlbIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/OWFlJP2GqXT2jHZGKjEV3Fet+zHPoiU7OVuaFzysY=;
 b=v99agZ8Lx/Cy+JWNH2Zd6AyFkyFQBj018k+iAz3Vb2prPB3RSnp3AiLsQj1fPVrOP9gOM+9IOlOhgTpblYnVdl8xuBOz5kYboeTjqCFvmHfnFp9GJFhKiJm9Dpz93mZHiazLnaFjtXajOVdVoPr236/KOI79XEJ7LSUWMrJhKrpfw2uX3er6eEgyM27XCcIt1vAXzbw6uc2gIHZxSFwwDJKwfrsYLrY5fQbRm5Z/4iefwH7z7nTXnJvr5JTf07rAPUcP1IoC587kLZayRlGR9ZlX7sYeB6a7FCWnCsEBrOoKfKvyXgyaCZSIC6sghP2qzyHsdHa65cco3YTCdvnoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/OWFlJP2GqXT2jHZGKjEV3Fet+zHPoiU7OVuaFzysY=;
 b=ndUrjd6A4CgHikdW7K1J/K+rLuFgW8XB3U/FC8VcsdSNTRPcoaBf6JwufQZpCdraoB3g2q/4e37NzyY4l71wlupSf6W7IoiUQA9r2T6HwMgNrZmet5jxloBl9TgjIWqSpe2ghlRc5OzMRZAGnKF+nV8GHOtZYjkjiBCNZJzMDgAZmg6CYNhRdgPp1Gtzm7uSXF42K3w4NloOfDiUVpq6klS43tyWlqmhPqecC5UFcEjse1wTrcmMvDF9QxOH6RTV7E5JrAzXJWTi8pO0XrO/M2IDsOH+f+CwZ5tuqMv8RAmwlI3shw1T0bxTq7pZ8gZ6LJdiDABvrVqTdt65e5HEPA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB9110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:11:18 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:11:17 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "rfoss@kernel.org" <rfoss@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "aradhya.bhatia@linux.dev" <aradhya.bhatia@linux.dev>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "j-choudhary@ti.com" <j-choudhary@ti.com>, "u-kumar1@ti.com"
 <u-kumar1@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nm@ti.com"
 <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "praneeth@ti.com"
 <praneeth@ti.com>
Subject: Re: [PATCH v10 10/13] drm/atomic-helper: Refactor crtc &
 encoder-bridge op loops into separate functions
Thread-Topic: [PATCH v10 10/13] drm/atomic-helper: Refactor crtc &
 encoder-bridge op loops into separate functions
Thread-Index: AQHbmedTmCdrEP2sCEmxT4VgKjvz8LOEP44A
Date: Tue, 25 Mar 2025 19:11:17 +0000
Message-ID: <d42cfd782bb194754b20ef198f984cbc30a2b029.camel@siemens.com>
References: <20250226155228.564289-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20250226155737.565931-3-aradhya.bhatia@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB9110:EE_
x-ms-office365-filtering-correlation-id: 654f3035-6f22-41a4-051a-08dd6bd0d221
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?YVRpM3ZNdGVkNm9UYW1SN0ZONWlOQXQ4dUxwZmlpVzhRZHJIbXlzdjBZTFFS?=
 =?utf-8?B?dHd3ZVlKQ3RkMnZJZFRvcUFXa2JPZ0ppbTk2Q29xSHUyckZ0UjNFZmVxcUR0?=
 =?utf-8?B?aVE2TnZKVHB1NnlsUmhXeUFUOXNSUmJMb3R1NjVXVE0xaElSb3RnTXBEVllH?=
 =?utf-8?B?ejA1QUZOY0JobDkzTFduSlgrMWpYcjlmYUVHcGVmZEFOakdGajVRMHp0aG5S?=
 =?utf-8?B?ajZUYXN5Vjdtdnp2ZzF0YkI0RGp0L1ZNVkg0TW5CeUszR01QZ0N2RDhlWWpi?=
 =?utf-8?B?ZDB2RnhQN2F1bXNWVlM2TGFvc2JWVzRxNyt3OE1BQXIvYmZrZEQ5Myt4UUUx?=
 =?utf-8?B?YUVGZDZFRVhZak9Pczh2WFRWMjk0bzJPakQvR0t2N1lqUTQ2azJyeEFrQU1w?=
 =?utf-8?B?aW1WOU1aeFNEL01rbTR5cnhza2t2OHVNK3RySVhNVGtGY09Ib3lSVUlRWlM5?=
 =?utf-8?B?Rk1hU3pFOTZSTlJVL0sxTkZvNHdXRXJ1ZUFIU3BzL1dWRTFHaVF6Y3lZcUMx?=
 =?utf-8?B?NE9uRnVPcGdCQkQ2UzNKcXRKWHl3NU9hYzB3UzA4L1BjVnA1MnZZT2hEcS82?=
 =?utf-8?B?ZmNTMCs2b1FhdGJEZzlic0RKUllaOVZGNldPcGdQRUdnNmY0M1IyM3NOa1Nq?=
 =?utf-8?B?YTExQUxtQnBrWU11UTRpZDlWaVBIekhINE1xSzd1VUs2dzBvU3lyYUxBOWw4?=
 =?utf-8?B?MGtIQ2Y4bU81UVlkNUFuMVlxblNtTFZWck5STXc3dTlxYWI4bVliSEVxMTJL?=
 =?utf-8?B?ZjNDRlhzL3RvVS9ISEwyTGVvT1RkendyWGVSbjN4UEZsRjBPUFFYL1hBaDBZ?=
 =?utf-8?B?OXFvaGVPMUsrM1Byd082WFFmL1lrMzJoQVhHRnFWNko3bHF3YzdIaEdReVBX?=
 =?utf-8?B?Y05xRnQ2ME9idFJSOTN2N0ZaSzBhQnAvSnZnSUVyMnlTOGhxZERZc1RtNE5i?=
 =?utf-8?B?cC91Qk5tZys1MDdSbTV2a0k4SDZNQUFKc050SFI2V0dqYlQ0cm9JLytPRmZK?=
 =?utf-8?B?OVV2ZCs1bDdTR0hKUmRBMGZZcFYxZGlXdWRCM2NscUtTN0FSQkNEbVpMaUh6?=
 =?utf-8?B?SkVNSUJiV2V4WWZPUFA2a0dLS2RjeGh6Q0k4ajJnZDl4UDNpSFBDbXc2aHhS?=
 =?utf-8?B?WWR0YkhqVDdvblo0dzhkamVzM3Z4Y0N6djBjRlBFMVg4cjJDczR0Vi96c3hs?=
 =?utf-8?B?amd1djJETTFiWWRQWG1CdEZkazdvNnY3UHlNN3l2SnFIRktXSnppU3M0eUF0?=
 =?utf-8?B?aXhDSFFZWmlVVHIxZ2hwQXowNUJZdFhpTlpSdmg5WXNGOU45bW1rQ0xSNm5k?=
 =?utf-8?B?TWhYZWN3UmZiTklOaWNDUTdHK0l1VjZSSDZ2T2VjZTdEVWx5Sll6akh3NWdv?=
 =?utf-8?B?VlUvd2R3dEFoWmRrdEp5RGZIdXlzeWZDZ21LSnpFWkJNNDRZSW96aHpvcm90?=
 =?utf-8?B?Ui95VlYxUFdyTEJva0YvVUNTVlhFUDc0dzVWSGFSM3pGOFJSbk5icWt2eWpo?=
 =?utf-8?B?cG1YQkFjL3dDdDlGVkkzTHdBcW53b0phc3JJUkd6UW9yL3c4V3dYMXZRZ2lR?=
 =?utf-8?B?TGdsWlQzK0lScy9BdW5qLzVCWHFDNG1zN2RrSXNxR3VQMjFOMm9GVi9UeHYy?=
 =?utf-8?B?VEo5aFFGcEdGeWdmaUZOa0UvODN3b1VuUzJzc05WY2tOd0ZFRFFuT0szWjlz?=
 =?utf-8?B?VXN5ME44MnI2V1ZSckloUEpYWVpib3A2MXZGR2gxUUk1ODYyV2d2RHlxNjd5?=
 =?utf-8?B?NjBpT1RZNi9FM05VWG9pYlRtT0JhUGxGYWd2ZFpaZUVHQUdwZVR3QWZ1dEhY?=
 =?utf-8?B?U28yUTZVcXVCemNKY0phOC9FcjRrT1RmdGtJamxPc1RzUmI2dHdMTlkwd1k2?=
 =?utf-8?B?MWJoNitUY2ZFTU9IUDBIOXhGbUx6a0U0OS9neEd6MzIwL0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZ5M3ZkVVpMK2FIc1g1elJTZjRETHFWVnRoaUxqL0VEaVRGNHpQcnZNYi90?=
 =?utf-8?B?MExwMUNjek4vL2RhK3F6NDgxZmdsak9Ld2Fidlh1WVF3YUJjZk04Rk1BZUlD?=
 =?utf-8?B?MkRoUWFJYlJ0WnpFRi9vdVdpeXVpeUhsZUllNmltcmtBdkFhMmN1WWwzL1dh?=
 =?utf-8?B?VjRDQktzSTRXd2tTM3BPd0VKc3dPSWhjKzBkOU9IQlk2SDI5TXo2S3A1T2xk?=
 =?utf-8?B?VGhQSjdKV09FbzRIV3c4NWNwNHRmNFNmQkQxYlNoeGpGVitVTjVSNGtoY3Rv?=
 =?utf-8?B?Qmc1Q0NVeHRnS1dkQmhVN1RTOWtjMmIxZUphSmwrZkp6UmgyN3NsWjRHQkdJ?=
 =?utf-8?B?VzdnSHh6UzJXS0FaY3ZTM1V5bDZwUXA3ckR0YmUyWTJTSHkyeHdBa2tjN2JU?=
 =?utf-8?B?VGVqVTMyQXg2aGwrRXBCTkdRYzJRR00wMjhRc0tiVkVSdDA0d3Fzb3oxZnRS?=
 =?utf-8?B?Rm1zdVdLVURKc2ZMWE9mYkxwMXhPTGlxb1VOb2VIckJaTnIyc29kanRVTzNT?=
 =?utf-8?B?M2czeUhMZ0p5NitGYlZmSFhoa3FRa3RxeURwdFI4S0JVQlpPelcrS0dWMi8v?=
 =?utf-8?B?UTFGUnk4UHQ3Mm9nQXNydHdtL0MxRld0REVaREZ5WTF4OWdhS0tUS2RrZ1pH?=
 =?utf-8?B?VkltdkU3MnpJQWUya01ZcHZtamJnOUdZUktSYU1KQy94QjFHSW5DTlJjNzVM?=
 =?utf-8?B?TTdxbWVHT3NuVGd0TUhYY3lXcWJvTkVDcnR1blN3QWpFRlJSRTA1TUpIRnlO?=
 =?utf-8?B?SkY0QmJMT1dHTHR6cEFaMnViaHhxUHd3OW5oT0ZMajNDRzl1NFhzVXB6TEVs?=
 =?utf-8?B?cFZoZFNJVlJiOEVlckxoUEdBTDdHSFhIUDJhRzlobW1nNUs4WnBCdnhuUXUv?=
 =?utf-8?B?anBPSEFnL1kzR1c1WllmM0FoOUFNa3R4M1YzU3hiQjgxNGJUME1ZZ3VlV2Yw?=
 =?utf-8?B?L2pMaGpWMlpKOUt4alF3bG9KQ0FnUERBcUlRUkUxL001dmw3NW1qb2RnNVIx?=
 =?utf-8?B?M3RZVUFKKzd3MDF6Q1ordVcwWFoydVNYQkpFNHRqUkNESHlDbnNWTEZpTndy?=
 =?utf-8?B?dUtYZ3V0d1RpcE1Jb3RwSUtzRlk1MEsvZWYvdjByeEZHS1NEK1JueThSVHhV?=
 =?utf-8?B?VVFHeVY0MTgvYWlsL3BxYUxrNjRYNHBWNjhkei83SWl3WW1mY0QvSlRkY3F2?=
 =?utf-8?B?RGVaYjlPb0tVWkJZdmtmUGtDeHRIclgyaHVLazljQUo0SDlmK3pKUlVub3l2?=
 =?utf-8?B?UGhGK1I1UmdnYjEvTy9nSUFxN2RoMFVSSmJxbGxTaXpDOVIxSCtFSGxwZnpu?=
 =?utf-8?B?WW1aWjlzVmdsWitxOUdGaGwrcVArTjVGQWpyYWc4cElqRXZYWFZ4U2ZhaHM0?=
 =?utf-8?B?Yy9jSHljYXREWDdiSk1oT0MwYlM5V3FVbDNCdXJhV1RtUjhweGovcVl0OTFQ?=
 =?utf-8?B?bGpTZjhsS1Z6VkhySmlyNjR4S1IzaEFOTjZtK1ByRXlPblE0akR4a2NBenNX?=
 =?utf-8?B?SFlFUUlpNk83L3BBN3dWeG1SL1FGUmFqNE1FWmlLYzBGL0xaamU0ek9ZM2Fn?=
 =?utf-8?B?VmJCTTFmOGlXRDRQYXF2TEpFd2NsUnFUVHU0czdNWng4NHpEY1Z3cnl0a3ov?=
 =?utf-8?B?WWdlVmhwUU1kV2VjWHlSbUxTK2Z0N2luUjFUVXp3TTlaMTFzdXRGWmM5ajVo?=
 =?utf-8?B?TnBubWpoNi9DeE5TQ211SUJjeE1kSzFuamMzVXdjQ1BlcUowdDlySEhNdWJC?=
 =?utf-8?B?a1M1b3p3UFJjT0NiYnRJZjIzU3RGakQyc1NSV0lJZDduYjRIZEJybDk0Smor?=
 =?utf-8?B?Y011bjQzR0hhZVdLL3lMWWREd0pzd2xDU2VHNDJreGtyMm1OS2lUbnVvdmh6?=
 =?utf-8?B?dkVLMk03SHpjSTRkNGpmdHhIeVd4N2tEUUtIWW1BOEhvRjJuZzVyOUE2VVlj?=
 =?utf-8?B?VkM5NmxnOHZIVWVucUxVbmtnM2RreFV6ZDVGZFNjMDB1Z3k0anpwMVd3RjB3?=
 =?utf-8?B?NGwwemNCaG5lNDg0eHFFUDVKWEl4N2VPRTBrKzVROGVUY0pWUjRUbXp5VTRy?=
 =?utf-8?B?aTYzT2poMStSZlBTQXU1aUF6MDY5TWVFdVFMZVdWQ0xCYmM3RytOdUNKM0FM?=
 =?utf-8?B?bzlWQ3NuT0RoOEg2N3Q3SnI2WTRFdlJDMWtGT2RDUEQyRzBCRkxYblZKV0dC?=
 =?utf-8?Q?LDscxp8kzy61bxAXmHvXtFk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CD7EC4BD70C11428E46ADD7DD818EB4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 654f3035-6f22-41a4-051a-08dd6bd0d221
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 19:11:17.8664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/+p8I1ARpo9tc25blnQuZdyRJBl+wEGpg5mcB7OikqUDjhxEvZhASMTfgtdKFEfisEQo5YXAPcIVsYQVHeAhecBxpvjhQ1gz3AGdjELTL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9110
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDIxOjI3ICswNTMwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToN
Cj4gRnJvbTogQXJhZGh5YSBCaGF0aWEgPGEtYmhhdGlhMUB0aS5jb20+DQo+IA0KPiBUaGUgd2F5
IGFueSBzaW5ndWxhciBkaXNwbGF5IHBpcGVsaW5lLCBpbiBuZWVkIG9mIGEgbW9kZXNldCwgZ2V0
cw0KPiBlbmFibGVkIGlzIGFzIGZvbGxvd3MgLQ0KPiANCj4gCWNydGMgZW5hYmxlDQo+IAkoYWxs
KSBicmlkZ2UgcHJlLWVuYWJsZQ0KPiAJZW5jb2RlciBlbmFibGUNCj4gCShhbGwpIGJyaWRnZSBl
bmFibGUNCj4gDQo+IC0gYW5kIHRoZSBkaXNhYmxlIHNlcXVlbmNlIGlzIGV4YWN0bHkgdGhlIHJl
dmVyc2Ugb2YgdGhpcy4NCj4gDQo+IFRoZSBjcnRjIG9wZXJhdGlvbnMgb2NjdXIgYnkgbG9vcGlu
ZyBvdmVyIHRoZSBvbGQgYW5kIG5ldyBjcnRjIHN0YXRlcywNCj4gd2hpbGUgdGhlIGVuY29kZXIg
YW5kIGJyaWRnZSBvcGVyYXRpb25zIG9jY3VyIHRvZ2V0aGVyLCBieSBsb29waW5nIG92ZXINCj4g
dGhlIGNvbm5lY3RvciBzdGF0ZXMgb2YgdGhlIGRpc3BsYXkgcGlwZWxpbmVzLg0KPiANCj4gUmVm
YWN0b3IgdGhlc2Ugb3BlcmF0aW9ucyAtIGNydGMgZW5hYmxlL2Rpc2FibGUsIGFuZCBlbmNvZGVy
ICYgYnJpZGdlDQo+IChwcmUvcG9zdCkgZW5hYmxlL2Rpc2FibGUgLSBpbnRvIHNlcGFyYXRlIGZ1
bmN0aW9ucyBlYWNoLCB0byBtYWtlIHdheQ0KPiBmb3IgdGhlIHJlLW9yZGVyaW5nIG9mIHRoZSBl
bmFibGUvZGlzYWJsZSBzZXF1ZW5jZXMuDQo+IA0KPiBUaGlzIHBhdGNoIGRvZXNuJ3QgYWx0ZXIg
dGhlIHNlcXVlbmNlIG9mIGNydGMvZW5jb2Rlci9icmlkZ2Ugb3BlcmF0aW9ucw0KPiBpbiBhbnkg
d2F5LCBidXQgaGVscHMgdG8gY2xlYW5seSBwYXZlIHRoZSB3YXkgZm9yIHRoZSBuZXh0IHR3byBw
YXRjaGVzLA0KPiBieSBtYWludGFpbmluZyBsb2dpY2FsIGJpc2VjdGFiaWxpdHkuDQo+IA0KPiBS
ZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5j
b20+DQo+IFJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxp
bmFyby5vcmc+DQo+IFRlc3RlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlk
ZWFzb25ib2FyZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFyYWRoeWEgQmhhdGlhIDxhLWJoYXRp
YTFAdGkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJoYXRpYSA8YXJhZGh5YS5iaGF0
aWFAbGludXguZGV2Pg0KDQpUZXN0ZWQgd2l0aCBBTTYyIE9MREkgc2VyaWVzIFsxXSBvbiBBTTYy
NSB3aXRoIHNpbmdsZSBjaGFubmVsIEFVTyA4MDB4NDgwDQpMVkRTIHBhbmVsLiBObyBpc3N1ZXMg
d2l0aCB0aGUgcGF0Y2ghDQoNClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5k
ZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQoNClsxXSBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTAyMjYxODEzMDAuNzU2NjEwLTEtYXJhZGh5YS5iaGF0aWFAbGludXguZGV2
Lw0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgNjkg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNDkgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpT
aWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
