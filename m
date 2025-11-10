Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDBC4540E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03410E2B9;
	Mon, 10 Nov 2025 07:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNzbHUaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCF410E2B9;
 Mon, 10 Nov 2025 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762761048; x=1794297048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qisyP+6bptmuLFgGk3PaK6sKbyOM6arElWAAfW5tTZ0=;
 b=LNzbHUaw6JUPfwkhVnvAB5o4wu/FKyz4rOMAbdlpci64LeLuWbXJCmB5
 HXs6Eaxn2SvebB8mBdk2BCWQq6LTqjwZHClwAXLy69Y6FurzAwjs38OXD
 iG5urmTLyseA6avnV6nj2vrggrZlxZfSSduAxDtumOLnqwWcjoZBtxWoS
 kiv4YQtlx9WfYjXxR3QBljl4u6tg0muf49+1Yu2LADIWdzYlh5Gd0sLb7
 Pr/yzbEDUTZLe4l7SubaKSzrTOGgK6fn9BrCSd7XerGxT95ByyWpJ23Ag
 C5AJplp5ZJ5qsRIS/xm3gABT+nkznkEinuRwgGOh667KQEZxIAOFb42IU g==;
X-CSE-ConnectionGUID: yAwEY1XRStunMY5dqZLlOQ==
X-CSE-MsgGUID: 4xl3JIj0Tnq4wi0r4+ExWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="52365263"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="52365263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 23:50:47 -0800
X-CSE-ConnectionGUID: /wGLLSYbQW6ynsEwvu1Rzw==
X-CSE-MsgGUID: Ix+OIu8uSgaEBsfZ9gUdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="193621287"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 23:50:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 23:50:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 23:50:46 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 23:50:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP+iogmINUB2JsifNK+slqfG2N6ZA2CtO2wr6IRr2/KztrGCYAwUA/ntv3BMlpjcCMw7e+BNHfu2vdQ2iOIzYR2WNijdUuBwTBsLdmBjEPoKtvxJiP/+x+UcYePavU7LkZuqLihrq/iFmmW8LlEiXfRu3HoUboo3KppJowyuKMZHxJm+OmcKGGmjBCzeiy3yxtwKfLSJ1vkP0LoysIgEddK2m+/K+NufnSysvy0ONnDRPuwRaa6kRrjBNBpIop9hUHzoUQDcKgfSFOkS1irrZiaJct70kBZdBw0CPHeFO3CAHPkcuRQPCwp1q5XqWHAC9mUNdC796AmsJcx4zPOVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qisyP+6bptmuLFgGk3PaK6sKbyOM6arElWAAfW5tTZ0=;
 b=qw/G3C3K7X90KPy2NH22mGDdzDC2vEQPYJYeZLKI455YPTOiZ0lEbDoaHRris6Z1joY1ueH+pIjTPpNnsbCjzVAEQYp82Bh6jTgAzDF7mpRaYgqs0oZoL4Y8oCvoA46AnPmgoi3y438Kq46ZVbYvq0QpASj/Ijaedp1nucsYxh4tfqBXpgk1SwUwiXi7Zf/ZOEYputjBFKDmwChSebzW/O77Iy3zfj3fzbEU7Bbw5ACFDePuYyN/3+SXbV6uqIyQjlPQomt1nRlOM4ypEHVPMBzZ3Oh34k/DJaOLHGNush3CcjSbbqRBvfVnh+S0BDE4RUlA/+8JwsGmUq/cXh33wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 07:50:44 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 07:50:44 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 10/10] drm/i915/alpm: Introduce has_alpm to decouple
 from pr/psr2/lobf
Thread-Topic: [PATCH v2 10/10] drm/i915/alpm: Introduce has_alpm to decouple
 from pr/psr2/lobf
Thread-Index: AQHcTRKFif7mPcNbGU+2YotB6CeaMLTmmNqAgAT593A=
Date: Mon, 10 Nov 2025 07:50:44 +0000
Message-ID: <DS0PR11MB8049C47226A76FE4BED7CD3AF9CEA@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-11-animesh.manna@intel.com>
 <DM3PPF208195D8DEA02EA316FB774349E57E3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DEA02EA316FB774349E57E3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|SJ0PR11MB4990:EE_
x-ms-office365-filtering-correlation-id: 804c3274-d3f0-4297-5f2b-08de202dda8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NTJWQWRWRWl6aHNsdi92czJBVldiamFsM0tJSHNxMHFlRHBUcnZvSlpySHFw?=
 =?utf-8?B?d2xsSk50Rm1NYXplN0ppZVVjc2RKWEhSYUZaNE5MZzJlZjFoU0MzeWNJVWZX?=
 =?utf-8?B?Z3FNVUpKVFVGWFA5a0RYZndLRkZNSEdmZU8vdTkrWWtiZUVTU3drSmR5UnV5?=
 =?utf-8?B?dmxrbVloeWh3bzlBdGxWd3RFdVJiOVNlRWN1V3VDSkxHN1ZFUTlnNzl0Q0J3?=
 =?utf-8?B?MFloRlBpK1dIVS8vMlN6d09Vc29pV1R4dEljakd1bGNHT1FZRWVBeXlOcURu?=
 =?utf-8?B?TTR1dmVSM0FkNEw0NDZvL29WU0JKYVNDMXRPcnNNRjNIUllLdmIwUUNUUGo1?=
 =?utf-8?B?aEM3a1JGcDh4U3BaOUNKTlhRN0o5VjE2K0dQVnNwUGxJN2tsN2liN3FBOGtO?=
 =?utf-8?B?NmRXaU9FWHNZYzJ0ckVlRm1ySW9zN3ZFczRVUUFvUVBNeU5CUmdtMGFmd0Fh?=
 =?utf-8?B?ZXJxbE40bUhVNm9mQS8wUWxQT3MvY2RNN05IaVBtQkI0VzJiTkNVMFRwK0hh?=
 =?utf-8?B?bXl3dlE3Y3BoZHBxZzJxamxpaHZ6TDUrbXhXRENMR0MzSk1kUnlDZ2NBZUFl?=
 =?utf-8?B?K1hjZ2h3U1F2a3RZT1dJUlNiK0lURGlDUklPNnYreHJseERPYVhIbjRhd1NP?=
 =?utf-8?B?UFYwY0hqUEFhQjBQVlFwK05sSmxtVnIwdFBuTEhXY0M4WVdZYVpERWZOR1hO?=
 =?utf-8?B?Wmp6SEtYMHlpakFUa0hGalU3VFRraW9zR3N6QnQ5ZWNDSzg5WnFxZks2elE0?=
 =?utf-8?B?UlpEU0lCMUxhSXI3V3RWUWJIam5SK2NpaW5IeWN3VHRaaXI5bTU2cGpvVVZK?=
 =?utf-8?B?NG1HMWVJL1E3N3dtS2xLT1d0ZjEzQWpCaCtxYndpWU1KWVR4SmZzYTNwL0Jj?=
 =?utf-8?B?dTgxQjA1ZG95K1ppMVNZM0JXRGRId2hQeXdUc1RrTndRYjY3UnNqRFkxeTlZ?=
 =?utf-8?B?Qk9naGRuak1xVWVnZUR2S0VKYnZuWXRwMXh6ME1vUmpsTlpQVTZtUGFWOWgr?=
 =?utf-8?B?RmZ4cnA3MGVPVWcwbzRjWkxmRkh1SVVadGxVWE8yaGhkRE9jOStHVThiQnlH?=
 =?utf-8?B?MWhGMFRadnJkNnNkeDJWTE5mb1l4enFVcjVtMGdRMWF0TER5WEJLdnIvNDg1?=
 =?utf-8?B?Wk56NWlZSWRxZUFwTURQZXk1all1aldnUVdZc2hZVEtRZEQwb0EzU2toVDM0?=
 =?utf-8?B?TXBwYTJMcHYxbmVlMWlSMTVHL3dNcGs3ZjhjMkQ2emZQZ2trNEk4M0p5QWNa?=
 =?utf-8?B?b0Q2NVUzUXVpcU1HNGlKUWJRWkoyV1lYYmo1UjJXek5VZTVHMzlkV1RrOXYx?=
 =?utf-8?B?THM2dVAwOU4xRzJVRFE3Y0N2SEFodjFjbmJzY2QvSU9QRld6djhiQ1kvY0U5?=
 =?utf-8?B?MVBXZFNUREVUdVZldnBKaUhnUmYxTWwyRjZVRzhscUQxUk84UUJ4QUVYaW1S?=
 =?utf-8?B?cmpmRnhNa3JBTk5pYm9vU2N3ci9Oc1hRdVRqd2pRL0NKelhldFlBYzN6SkdC?=
 =?utf-8?B?Vmp0eUp3OFQ2T1JpS0ZNQXV4bHROSUF1b3c1dklHSmI2RDdSeVR4d3F1TzlF?=
 =?utf-8?B?SGV3THJlSXI2L25GT0NwSzI2NFV3YUxqS1FuZUVNeWFkWS8ySUtvb3NrL0NW?=
 =?utf-8?B?VVVJWlc3ODZhUlRyaVBUUlowK1I2YmFNN1JpTFlKSDFPaUhXRmkzVHU5UmYw?=
 =?utf-8?B?UFluRkR1Zmd5UDhJV2lvT3JlVlp0L1JOZVM0UlcyRzZiTldORE1pRHZCb2Qz?=
 =?utf-8?B?b1dMOEg1ZkRPT3UzVDBwc012WEFlTWpoTWIwSUZBUkFUbGI5MDF2NndnVTE0?=
 =?utf-8?B?OXFDeU9GeUllNnkxSTBrVkdoa0NmWHY0ZVNkS0xqZGkySDBxME0wMGtMcmds?=
 =?utf-8?B?dmZzOXE1N3Y2cUl4TXY0eElONExYREUvVm9TT2FsOTB0RTFLQnhPcmhkR2cw?=
 =?utf-8?B?UzRIUjJMT1BHTURzTk1XQ1R4MmdVcWhZMHRoRHJWSHg4WG4xMkRDRFpCQ2VM?=
 =?utf-8?B?SnR5TXBGSlcxU0Mxck9iQlljWkVxeTVzaitJbDhEMHg1ME9sc0FJUmlTTm40?=
 =?utf-8?Q?PiNzZm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFBRa2M0Y05iaHg4QWJkV2pTQ3hYYWtDN0VVZjhvSFg5TTdBdEhGK1hOU1BU?=
 =?utf-8?B?UlZabWRQRnQybEFJbU84ZUtreEdObXFyWkpMMHlUTUJvUE41UGkzcXE0c05S?=
 =?utf-8?B?bGxqQmRXT3ozK1ZnK2d2MXcwTi9DY2locExINnEzNngvZUFKRDBBbTVNMlNN?=
 =?utf-8?B?N2dCdlRuRG9BK2VTa1RXUG4xb3JXb3ZQUFhUUlkxWHB5WGdlbVhTdVdzY2x4?=
 =?utf-8?B?TVMzSWp0ak1SNGhRRjEvdk0vWlNEQnhtQVhXV0JpNDVXYzBVb0tWTzVBZ0RW?=
 =?utf-8?B?eGhBUGFVa3RVM3ZLWUtzdjQ4MWRpcUs3OXJIa1RBbXRvZnNuRlNrWldHU05Z?=
 =?utf-8?B?TlBKUWY2a0FTbVBvU01ab0RrZGNwaVlxK1ZDdjAwb1UyZFp5QTBlMjVDdmNw?=
 =?utf-8?B?R1V0K1J2by9FNkFXZ2RVNU9pb2FIVE1VY1d2UlJseU1WcWc2UXZFcWtVcXVk?=
 =?utf-8?B?VTJuZGdJZTcxbFBManpwZmJRT0hvNVdpbVJTbXJZT0I2bHQ4c1NXd0RuNERm?=
 =?utf-8?B?cXNoU0NmK1NyVS81cXNscWhVck9hQlQrRkFzMWovVEhDZVFTR0wxVlRMOThw?=
 =?utf-8?B?RnhaOU05YXBGNWFZS3dHaTFKZlU0eGhZeW10cmxKckVpdlZLOWtJOU5FZ24x?=
 =?utf-8?B?Z0QvQmVFaE1lclZTY0c1Z1ZxSW12RmxMWlpST051bWNnSEZ0SWU2VlJFZktF?=
 =?utf-8?B?ZlU0SzhmRWFyMEZMcnVHdFJiZ3FXTVhWTDhheHhIejA2L2Fva05RMlJ5ajZs?=
 =?utf-8?B?UUNLbkRUWU1zQjY1dTRZSjJpbkc5a2RvdDFWd1RDNDNzWDJMV3Z6eGozOWVo?=
 =?utf-8?B?YjVWRGRWMnY0aCtPN1pieituaGVpQlV2NzcyQklYV1h3T3dkSmwvdjk4d3ZJ?=
 =?utf-8?B?ZTRqNFpMNmtZQThzenJnRmxib1djUGRjYWtyQmdxeXZXdU5OZ0t1V1cwS2xj?=
 =?utf-8?B?R0x4a3krTUYrVWRQUHJ0ZlVXTnJmYUZaWXJWdkxuRkg5S1BZQ00rVFF5cXM0?=
 =?utf-8?B?dkR4dTdTYmtvOC9QcjRkdjhaTk05d1VCTDZnVXZ5bEMyQ3diTVlpMVFtbTNW?=
 =?utf-8?B?akoyRXZiUHpMMG4vNlRDUDN0Sm5xOGx3bVpxT0FMUWRRdEZ0N25qaUZFSENN?=
 =?utf-8?B?emlZaHhBZjlzdWc2d0ZVZVF0dlZXRm1xbit5ZXFOc2V2c04wdzR5UjRVZXQz?=
 =?utf-8?B?aHNpZlhnL0puMlN3U0VLQ0V2SHRsNlhKc3FBVFg3UklqSU1DNmdjN2pFRVJD?=
 =?utf-8?B?b1BUV3E4WXNsQllzc29jWEttdFhNRTdTaXVFLzl3UEJJRWF5bTd2RWZpak9a?=
 =?utf-8?B?cVBnNytmSFFDY0lJQ3pIYmlwQTBxdGtnNHlGRExXRWUrNHVwK3gyUml1Z09P?=
 =?utf-8?B?cUpxY2pjRk1MWWxYV2dwYlFuOUZBWnpvWW5lbG5WZVhSSHcwa1dxRk95c05M?=
 =?utf-8?B?K3pGSkVJbTFiS3hPNzJMYmR5WU1ha0tuVW4xRi9BMmtlNUlFZTcwbS9PaXFm?=
 =?utf-8?B?L2VINEl6SVJ1VU5oa2QxemJySXovR1RpbzB2Qm5YcWpGcndZOTF1K2hoS3pP?=
 =?utf-8?B?bjBHTnpqVDNlR2w4dS9lL3IzclIra2lVUkJqUmZ5VFlzZjdiZTRmam5xeit3?=
 =?utf-8?B?SkxKSlJuc1R3Q3dmcUFnNFM3bXROYm82RDI5bjhWekpuMDNldDZqVG9Ianpk?=
 =?utf-8?B?cHZxVXEvb20rWm1ocUJMa1V6bWlWa3lHdmRBM2VtMFpDWUlzbnlXNStELzFB?=
 =?utf-8?B?dm1aQXFSSkNibVhXcjZ0aVczU3Z1RG9yaEd0K3NJTzg3ZlB1aENhU0tqY3J3?=
 =?utf-8?B?aUlIb0FaNGRBUTFZZmZhbjlORTNRbWk1MDJIR3BpVkR6YVN1N1RnRUFpbDRH?=
 =?utf-8?B?U2YyN0J5OEFaR28yUmsrYlhKeE1ZNnZNVzc5RG1XMTdFbkdWWXlHRHk3Y1ZP?=
 =?utf-8?B?MFNkdmR2bU82V0RVNlZ5Q1RyTlByOXUxcEpIYnpWV1R5L2JVaEJ5ekt1Zy91?=
 =?utf-8?B?bm5GKzl5dEhIc2ZXZzRmckpPbE5ubDQ5bUJlY2xCa0p3TElCdlhRKytPZ0V4?=
 =?utf-8?B?d2VyMXFLd2cyekM1UktVSE1XREx5aCtUbGJ2bzM1dFlJUjRFZ0IyeXhhTTdH?=
 =?utf-8?Q?KNG8iR+N9zilEONm7cV5SOvbS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804c3274-d3f0-4297-5f2b-08de202dda8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 07:50:44.5263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFCoMi++Drwdi3SaWBt6zakt9tiGd+MP7C94Ry4w0goyJEA8UlyEGJBH+QzzqaC5GuY0TNg5DXmPQybQEcfQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWog
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDcsIDIw
MjUgOToxOSBBTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgTWFubmEsIEFuaW1lc2gNCj4g
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMTAvMTBdIGRybS9pOTE1
L2FscG06IEludHJvZHVjZSBoYXNfYWxwbSB0bw0KPiBkZWNvdXBsZSBmcm9tIHByL3BzcjIvbG9i
Zg0KPiANCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTAvMTBdIGRybS9pOTE1L2FscG06IEludHJv
ZHVjZSBoYXNfYWxwbSB0bw0KPiA+IGRlY291cGxlIGZyb20gcHIvcHNyMi9sb2JmDQo+ID4NCj4g
PiBGb3IgRFAyLjEsIEFMUE0gaXMgb3B0aW9uYWwgYW5kIHRoZXJlIGNhbiBiZSBzY2VuYXJpbyB3
aGVyZSBwYW5lbA0KPiA+IHJlcGxheSB3aWxsIGJlIHN1cHBvcnRlZCB3aXRob3V0IEFMUE0uIFNv
IGRlY291cGxlIEFMUE0gZmVhdXJlIGJ5DQo+ID4gaGFzX2FscG0gZmxhZyBmcm9tDQo+IA0KPiBU
eXBvICpmZWF0dXJlDQo+IA0KPiA+IHJlbGF0ZWQgZGlzcGxheSBmZWF0dXJlcy4NCj4gPg0KPiA+
IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMgICAgIHwg
IDcgKysrLS0tDQo+ID4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMu
aCAgICB8ICAyICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMgICAgICB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuaCAgICAgIHwgIDEgLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGluZGV4IDE2ZmU2NmE3NWYw
NS4uZTE5ODhmNDNjYmI5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMNCj4gPiBAQCAtMzc2LDYgKzM3Niw4IEBAIHZvaWQgaW50ZWxfYWxwbV9s
b2JmX2NvbXB1dGVfY29uZmlnKHN0cnVjdA0KPiA+IGludGVsX2RwICppbnRlbF9kcCwNCj4gPg0K
PiA+ICAJY3J0Y19zdGF0ZS0+aGFzX2xvYmYgPSAoY29udGV4dF9sYXRlbmN5ICsgZ3VhcmRiYW5k
KSA+DQo+ID4gIAkJKGZpcnN0X3NkcF9wb3NpdGlvbiArIHdha2V0aW1lX2luX2xpbmVzKTsNCj4g
PiArDQo+ID4gKwljcnRjX3N0YXRlLT5oYXNfYWxwbSA9IGNydGNfc3RhdGUtPmhhc19sb2JmOw0K
PiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsIEBAIC0zODUsOA0KPiA+ICszODcsNyBAQCBzdGF0aWMgdm9pZCBs
bmxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiAgCWVudW0g
dHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyOw0K
PiA+ICAJdTMyIGFscG1fY3RsOw0KPiA+DQo+ID4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkg
PCAyMCB8fCAoIWludGVsX3Bzcl9uZWVkc19hbHBtKGludGVsX2RwLA0KPiA+IGNydGNfc3RhdGUp
ICYmDQo+ID4gLQkJCQkJICAhY3J0Y19zdGF0ZS0+aGFzX2xvYmYpKQ0KPiA+ICsJaWYgKCFjcnRj
X3N0YXRlLT5oYXNfYWxwbSkNCj4gPiAgCQlyZXR1cm47DQo+ID4NCj4gPiAgCW11dGV4X2xvY2so
JmludGVsX2RwLT5hbHBtLmxvY2spOw0KPiA+IEBAIC01MTAsNyArNTExLDcgQEAgdm9pZCBpbnRl
bF9hbHBtX2VuYWJsZV9zaW5rKHN0cnVjdCBpbnRlbF9kcA0KPiA+ICppbnRlbF9kcCwgIHsNCj4g
PiAgCXU4IHZhbDsNCj4gPg0KPiA+IC0JaWYgKCFpbnRlbF9wc3JfbmVlZHNfYWxwbShpbnRlbF9k
cCwgY3J0Y19zdGF0ZSkgJiYgIWNydGNfc3RhdGUtDQo+ID4gPmhhc19sb2JmKQ0KPiA+ICsJaWYg
KCFjcnRjX3N0YXRlLT5oYXNfYWxwbSkNCj4gPiAgCQlyZXR1cm47DQo+ID4NCj4gPiAgCXZhbCA9
IERQX0FMUE1fRU5BQkxFIHwNCj4gPiBEUF9BTFBNX0xPQ0tfRVJST1JfSVJRX0hQRF9FTkFCTEU7
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfdHlwZXMuaA0KPiA+IGluZGV4IDAwNjAwMTM0YmRhMC4uMGI2MGFkYTRiOTcyIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X3R5cGVzLmgNCj4gPiBAQCAtMTM5Miw2ICsxMzkyLDggQEAgc3RydWN0IGludGVsX2NydGNf
c3RhdGUgew0KPiA+ICAJCXU4IHNpbGVuY2VfcGVyaW9kX3N5bV9jbG9ja3M7DQo+ID4gIAkJdTgg
bGZwc19oYWxmX2N5Y2xlX251bV9vZl9zeW1zOw0KPiA+ICAJfSBhbHBtX3N0YXRlOw0KPiA+ICsN
Cj4gPiArCWJvb2wgaGFzX2FscG07DQo+ID4gIH07DQo+ID4NCj4gPiAgZW51bSBpbnRlbF9waXBl
X2NyY19zb3VyY2Ugew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jDQo+ID4gaW5kZXggMDUwMTRmZmUzY2UxLi5lZWI0MjU1YjVlNWUgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBAQCAtMTY4MSw2
ICsxNjgxLDggQEAgc3RhdGljIGJvb2wgaW50ZWxfc2VsX3VwZGF0ZV9jb25maWdfdmFsaWQoc3Ry
dWN0DQo+ID4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAJY3J0Y19zdGF0ZS0+ZW5hYmxlX3Bz
cjJfc3VfcmVnaW9uX2V0ID0NCj4gPiAgCQlwc3IyX3N1X3JlZ2lvbl9ldF92YWxpZChpbnRlbF9k
cCwgY3J0Y19zdGF0ZS0NCj4gPiA+aGFzX3BhbmVsX3JlcGxheSk7DQo+ID4NCj4gPiArCWNydGNf
c3RhdGUtPmhhc19hbHBtID0gaW50ZWxfYWxwbV9pc19wb3NzaWJsZShpbnRlbF9kcCk7DQo+ID4g
Kw0KPiA+ICAJcmV0dXJuIHRydWU7DQo+ID4NCj4gPiAgdW5zdXBwb3J0ZWQ6DQo+ID4gQEAgLTE3
NTAsMTEgKzE3NTIsMTcgQEAgX3BhbmVsX3JlcGxheV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50
ZWxfZHANCj4gPiAqaW50ZWxfZHAsDQo+ID4gIAkJcmV0dXJuIGZhbHNlOw0KPiA+ICAJfQ0KPiA+
DQo+ID4gKwlpZiAoaW50ZWxfYWxwbV9pc19wb3NzaWJsZShpbnRlbF9kcCkpDQo+ID4gKwkJY3J0
Y19zdGF0ZS0+aGFzX2FscG0gPSBhbHBtX2NvbmZpZ192YWxpZChpbnRlbF9kcCwNCj4gPiBjcnRj
X3N0YXRlLCB0cnVlLA0KPiA+ICt0cnVlLCBmYWxzZSk7DQo+ID4gKw0KPiA+ICAJaWYgKCFpbnRl
bF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiA+ICAJCXJldHVybiB0cnVlOw0KPiA+DQo+ID4gIAkv
KiBSZW1haW5pbmcgY2hlY2tzIGFyZSBmb3IgZURQIG9ubHkgKi8NCj4gPg0KPiA+ICsJaWYgKCFj
cnRjX3N0YXRlLT5oYXNfYWxwbSkNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+IA0KPiBXaHkgcmV0
dXJuIGZhbHNlIGhlcmUgZGlkbid0IHlvdSBzdGF0ZSB0aGF0IEFMUE0gaXMgb3B0aW9uYWwgYW5k
IFBSIGNhbiBCZQ0KPiBzdXBwb3J0ZWQgd2l0aG91dCBpdC4NCg0KVGhpcyBjaGVjayBpcyBmb3Ig
RURQIGFuZCBBTFBNIGlzIG1hbmRhdG9yeSBmb3IgRURQLVBSLg0KDQpSZWdhcmRzLA0KQW5pbWVz
aA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBTdXJhaiBLYW5kcGFsDQo+IA0KPiA+ICsNCj4gPiAgCWlm
ICh0b19pbnRlbF9jcnRjKGNydGNfc3RhdGUtPnVhcGkuY3J0YyktPnBpcGUgIT0gUElQRV9BICYm
DQo+ID4gIAkgICAgdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT51YXBpLmNydGMpLT5waXBlICE9
IFBJUEVfQikNCj4gPiAgCQlyZXR1cm4gZmFsc2U7DQo+ID4gQEAgLTE3NzcsOSArMTc4NSw2IEBA
IF9wYW5lbF9yZXBsYXlfY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVs
X2RwLA0KPiA+ICAJCXJldHVybiBmYWxzZTsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JaWYgKCFhbHBt
X2NvbmZpZ192YWxpZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpKQ0K
PiA+IC0JCXJldHVybiBmYWxzZTsNCj4gPiAtDQo+ID4gIAlyZXR1cm4gdHJ1ZTsNCj4gPiAgfQ0K
PiA+DQo+ID4gQEAgLTQ0NDUsMTYgKzQ0NTAsNiBAQCB2b2lkIGludGVsX3Bzcl9jb25uZWN0b3Jf
ZGVidWdmc19hZGQoc3RydWN0DQo+ID4gaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ID4g
IAkJCQkgICAgY29ubmVjdG9yLCAmaTkxNV9wc3Jfc3RhdHVzX2ZvcHMpOyAgfQ0KPiA+DQo+ID4g
LWJvb2wgaW50ZWxfcHNyX25lZWRzX2FscG0oc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgY29u
c3Qgc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkgLXsNCj4gPiAtCS8q
DQo+ID4gLQkgKiBlRFAgUGFuZWwgUmVwbGF5IHVzZXMgYWx3YXlzIEFMUE0NCj4gPiAtCSAqIFBT
UjIgdXNlcyBBTFBNIGJ1dCBQU1IxIGRvZXNuJ3QNCj4gPiAtCSAqLw0KPiA+IC0JcmV0dXJuIGlu
dGVsX2RwX2lzX2VkcChpbnRlbF9kcCkgJiYgKGNydGNfc3RhdGUtPmhhc19zZWxfdXBkYXRlIHx8
DQo+ID4gLQkJCQkJICAgICBjcnRjX3N0YXRlLT5oYXNfcGFuZWxfcmVwbGF5KTsNCj4gPiAtfQ0K
PiA+IC0NCj4gPiAgYm9vbCBpbnRlbF9wc3JfbmVlZHNfYWxwbV9hdXhfbGVzcyhzdHJ1Y3QgaW50
ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAJCQkJICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKmNydGNfc3RhdGUpICB7DQo+IEBAIC00NDcwLDcNCj4gPiArNDQ2NSw3IEBAIHZvaWQgaW50
ZWxfcHNyX2NvbXB1dGVfY29uZmlnX2xhdGUoc3RydWN0DQo+ID4gaW50ZWxfZHAgKmludGVsX2Rw
LA0KPiA+DQo+ID4gIAlpZiAoaW50ZWxfcHNyX25lZWRzX2FscG1fYXV4X2xlc3MoaW50ZWxfZHAs
IGNydGNfc3RhdGUpKQ0KPiA+ICAJCXdha2VfbGluZXMgPSBjcnRjX3N0YXRlLT5hbHBtX3N0YXRl
LmF1eF9sZXNzX3dha2VfbGluZXM7DQo+ID4gLQllbHNlIGlmIChpbnRlbF9wc3JfbmVlZHNfYWxw
bShpbnRlbF9kcCwgY3J0Y19zdGF0ZSkpDQo+ID4gKwllbHNlIGlmIChjcnRjX3N0YXRlLT5oYXNf
YWxwbSkNCj4gPiAgCQl3YWtlX2xpbmVzID0gRElTUExBWV9WRVIoZGlzcGxheSkgPCAyMCA/DQo+
ID4gIAkJCSAgICAgcHNyMl9ibG9ja19jb3VudF9saW5lcyhjcnRjX3N0YXRlLQ0KPiA+ID5hbHBt
X3N0YXRlLmlvX3dha2VfbGluZXMsDQo+ID4gIAkJCQkJCSAgICBjcnRjX3N0YXRlLQ0KPiA+ID5h
bHBtX3N0YXRlLmZhc3Rfd2FrZV9saW5lcykgOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3Bzci5oDQo+ID4gaW5kZXggNjIwYjM1OTI4ODMyLi4zY2I0ZmEyMGU0
MjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmgN
Cj4gPiBAQCAtODAsNyArODAsNiBAQCB2b2lkIGludGVsX3Bzcl90cmlnZ2VyX2ZyYW1lX2NoYW5n
ZV9ldmVudChzdHJ1Y3QNCj4gPiBpbnRlbF9kc2IgKmRzYiwgIGludCBpbnRlbF9wc3JfbWluX3Nl
dF9jb250ZXh0X2xhdGVuY3koY29uc3Qgc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSk7ICB2b2lkDQo+ID4gaW50ZWxfcHNyX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1
Y3QNCj4gPiBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3Rvcik7ICB2b2lkIGludGVsX3Bzcl9kZWJ1
Z2ZzX3JlZ2lzdGVyKHN0cnVjdA0KPiA+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpOyAtYm9vbCBp
bnRlbF9wc3JfbmVlZHNfYWxwbShzdHJ1Y3QgaW50ZWxfZHANCj4gPiAqaW50ZWxfZHAsIGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKTsgIGJvb2wNCj4gPiBpbnRlbF9w
c3JfbmVlZHNfYWxwbV9hdXhfbGVzcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAJ
CQkJICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpOw0KPiB2b2lk
DQo+ID4gaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnX2xhdGUoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCwNCj4gPiAtLQ0KPiA+IDIuMjkuMA0KDQo=
