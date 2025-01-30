Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FCA23381
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491EC10E9C3;
	Thu, 30 Jan 2025 17:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acb2emo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357ED10E033;
 Thu, 30 Jan 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738259915; x=1769795915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sQMsOe20xVpw3GbIfnlFViNdfdDbHnmJnay7a5w8TXI=;
 b=acb2emo8EczSzottAa+ANvtBtBHXhsLfWSHaeN8IHtkPyfwp1wZdLeD0
 ZXfVP5CbmrMTi/ixPaPCn0wrr/5GlnTmQJqey0NP5ZY/SfzjqHTP9IxzC
 C5aTA0+/TTWv+j8SAE6ngxfhIXxYAeHUA5qqIdNpjURa9xWM00GtraYlL
 1dYQGwQ5Tj/uhGjMavDb50a/GkSZy6ATiwXKs+5ztDs1hCo+eVjH1hb01
 p/pyxOVdSt2W3JmMdFrOqXBaH248ZDCWErFt6p095/muUNDaeXKBLme58
 AOCoVHXdoMHd4cZCCeoBvPcJdCr2Ns+41tR0TGZWmx80EQfaCiWnAldeS g==;
X-CSE-ConnectionGUID: wKnymk1uSTmAfs8ygM5/Xg==
X-CSE-MsgGUID: vVpRt2aNTvC/mQ4J5ug+mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49411900"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49411900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:58:28 -0800
X-CSE-ConnectionGUID: NJT5u2mmSMuYkZa2Ycil3w==
X-CSE-MsgGUID: yqikXozrTyuZTghkAnvcLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109968291"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:58:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:58:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:58:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:58:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id1BbojaKSa77Rcd5Hsw8eG25vKzizCKclVDw6w5s7KOA9sY9UgZAX5yd70/qFK4fRBSIZqJa5I8+RCw/n8/+6zF0u4ONosRPoMIaQ8FI5IwwZ7DAAPTCNyX1uNlZJyB+Fq60xqiks1/37d0gr6iEx34pdfjfX/byYoJp8SER+q43rDIPk0RU6k218dZE5UD6jqt1177DP+OFCaAMKCiiuQZeDxxIO5m7Eu6vTUtIDvfkZxEvRVYWKzJwYCKgrz2E2GvFSp+36Ms24mauRw1M7txnastx8eS7NK4ZwkxeTjHMRk8smaPryHGf2uckVA9nUam2YhOxgMh7X8GfO6w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQMsOe20xVpw3GbIfnlFViNdfdDbHnmJnay7a5w8TXI=;
 b=BFW7I0/lsJgWByl3iZkgbjVaCh813KSrrReotXWb5d0YGyYFQLRe49mbHI79jcNY4nJVOJPI5NmeZdGEjrg2JhxSJrct5Z3eez9Q+jMIk2VDDFs+9qfad8GelHxN1YKjMFVzbLdwuXy9grS1ekdzgdbyx68wsLTnhZDKf22hIlyPL1L6n3M6dzAHIi5ruKaA5r8+0AfO6np3p3mi0n3baUVhLGcowVKA7z/XEqysCnlwRslJFaGij6MymFP06flGyhHlA6yEeiaOoMGJdEl6qXtsxzim+39cKvnl/TWAvnwutXo3zoiv/aocVSKTeFjxwlzwaD8Ddit82C9SLUppZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 17:57:57 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Thu, 30 Jan 2025
 17:57:56 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Don't store capture nodes in
 xe_devcoredump_snapshot
Thread-Topic: [PATCH v6 2/6] drm/xe/guc: Don't store capture nodes in
 xe_devcoredump_snapshot
Thread-Index: AQHbcbOgOgeOUp7C5UeI0tbcZJhcAbMvnZKA
Date: Thu, 30 Jan 2025 17:57:56 +0000
Message-ID: <18a003982875f1d613344a5982ce99037ef2c450.camel@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250128183653.4027915-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB5911:EE_
x-ms-office365-filtering-correlation-id: 1413a6fe-f9e3-4348-2ddf-08dd4157a098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c05CNCswWjhnT1RhUlZVNVVzNGVhUkpmcEcxK29hcEhQdUN0VHZaUWd2UEd4?=
 =?utf-8?B?b0w2U1pRdEh6VC9OTkhEVnNaVHE2SlNMdVVLTmdTYnlGK1I0ZTBhNDhpZVBD?=
 =?utf-8?B?Wlc0dXdVREw2UHRxMHpyYm9jZll4dTRUc3VVQkpGeUxjSG5mNk9OemtUb1o3?=
 =?utf-8?B?eUZ5NFh5V2NuU3JXK0NqL3U2M1ZkN1RpZXlYYVk0QkdWOE50RzhWUEFLOVE2?=
 =?utf-8?B?ZDBKeUZjNDREeE1YRTRkVFIySUVnUEY3OC8zKzJQOHIyUTlCVTdaaWtPZ0ov?=
 =?utf-8?B?ZE1GN2ZvdWxnV1E4bERsZytIMWF2cWhtRFowd2pPeVVBU1RLNm5TbHp4Rjkv?=
 =?utf-8?B?ZVJtUXlWakJreUtFY3Bweld0Uy90L1Nmb21ZT1JuenpkcVFJZ1NPTVBZNzhQ?=
 =?utf-8?B?bGpMTm50YXNFd3MrNFNWcUdpRFJPeG1nZUlsVTlmcWFhbm4xTDAxZlpJUUVB?=
 =?utf-8?B?OHRsb2Fla3F0MjVYd2lldmFBbXV2SnNoWTFYbWVhVmZveThjRk9ETG41MmNp?=
 =?utf-8?B?TFZ1Zlozc0JKb1ZnemhLVVdvNlcvUVF3U0J6ak01dnIyOEcxUG1zdkNBcWZE?=
 =?utf-8?B?cll2ckltUWVoUmZ4QVhhaEttQVgvQzR2cGY2UUF4UE5vUUhnMHdzeWduakxj?=
 =?utf-8?B?NUNaVXFxNEEzMFZkQTE0ZkRTMTJxTkNtTjNOZWlCVjFKb1kvczNsLzBpdW5Q?=
 =?utf-8?B?bDFWK2xENzJXNnVzVW9DeVJXSWdSYlh5QlRVc241Q0FZMjlPVTBGUkl0ajBR?=
 =?utf-8?B?QVhMZHZmekVtMkQrczNCU0NsaHpEMThYRzRRMHhCMnJNNDhiZFZ1cmJzYnR1?=
 =?utf-8?B?WlRDL1FjeHVydHlhM0kyNXhSSDM3TzBRT3R4V2lCTzA1RHRyRTRTdzhDbFJi?=
 =?utf-8?B?eVRPMG0yS3doRWFxVERJZTllSm4rWERFbkNac09KSWVFUXpuV3ZKTk16V2Uz?=
 =?utf-8?B?S2FPay83UktKVmJGM1lDUXptSEpadUtRbDlZZkVHRVJvMVZUbjkyYXdpcTZ3?=
 =?utf-8?B?RmExVUd4d1p4dkFKdjhDRVN3aHRyeWVGSEFMU3lMZjV4ZTZlSW8xV0dPU0Np?=
 =?utf-8?B?MWdxT3VLU0Rjek5KYlF5ejJqWlFBR0xHMjZnMG51alJCWEd4bnRGQlIyVWUw?=
 =?utf-8?B?T0tsK2xTd3ExQjN1Z083cHJ3RnEzQ2VEY2xaRjRueW1jWkREY0k4R0hURWo5?=
 =?utf-8?B?UVpqS2c5NUlkVUhQQUFuYTdreHRjLzJOS2ljN2JlMXNGR2FSZWZmRldnWXBG?=
 =?utf-8?B?d0RIUm5PL1drcUVscjlRdkFmeXlFQmN5dFM0SWo2dkpHVC90bTZHY2djUm9n?=
 =?utf-8?B?Mjh1azl5T0lyQld3dENqYWNtcVFyR1Y0bGJPcy84ZGE1S2NuN0ZrYk9SRXda?=
 =?utf-8?B?aUF3NFN0RmR3ays2S3lJUS9nUEpWR2tOWWJua1pUdGtycVpuZDZySG1mK3Fy?=
 =?utf-8?B?Ym11eXZLWDd6b3VlTjkxTUhWQ1RwQ1BQU3JJSHI0V1I4T2REUnYvcjNoZWVB?=
 =?utf-8?B?SHFMVFpHZVdPZ1RBeFRCNWd6WUNxWG01aUJlV2kzQ3Y3NkptYTZNOWpGekVv?=
 =?utf-8?B?QjlFYlB3RUltRTFRaGpiK3ZJRmVibWdNLzA1b3ZMTkVSaXBhbTY5TE92c2dU?=
 =?utf-8?B?ZzNQS3R4N0ZHU0JCbk1GbzlwWFk0N0FCbStWcURoVlNCL3FrbFNBamNTQ0dq?=
 =?utf-8?B?eWtwOXppU1JUcGZScitMbmxFazlFUnAzeXVBNGo1TTBYeHRRcTVJWEhwSk9p?=
 =?utf-8?B?TXNVUFRkR1lqNW1rTm1qS2EyYThKa09EMWFFV3JvNUdrbjRzVE5wOVBsWU54?=
 =?utf-8?B?eDh4MWNTRU5DR0ljMFQyYUJIWGw4WlplanhxM0dBdldrRk5kUGVJVDZFZmRC?=
 =?utf-8?B?ZitwaVM2Ym1pOE9BYVFsQ1lPTThZR0FZSEJuSTFoQVdDYjdWek1FZVU3QVNo?=
 =?utf-8?Q?2HsIL3Nm1Ms=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUhWN0ZGcG5LTmpCNmJZZWRrUU1TUlNidUlWU2Q1eVlsekszN2lwbWpiWE1Q?=
 =?utf-8?B?UkdHTVRaV2hmV2FyaEkraGprNzZUeFJqbW9IeW9EZ0VMNE9YODRMYkpyZVNx?=
 =?utf-8?B?NXFhb3NXMG1GRG9wSmF1cGxjbHpTMDJGTGZNKzg0NGd1NzlJWjhjeWlqN3BQ?=
 =?utf-8?B?djhMVzB0c2V2RzN6aUZMdERHQUI0ZUg5NzIxclMwL1NsY2NjMlA2OStsOFF0?=
 =?utf-8?B?NmprZGV1OW9LUHpZQnIvWUkxalhIdnV6RWlnSmVndmV2RStJYkFvNDlIaDRN?=
 =?utf-8?B?Q3hPaU9VSWhCL3pEdmFwMG9JVVZTa1JVMlNncFB3MkpTM0NRTjFLYlR4YVJ1?=
 =?utf-8?B?dGp6WEczNXlVbkprTFRiS2QzdTJLVm50RThvalVDeFJMd0ZJdnp3OGNGSlNj?=
 =?utf-8?B?NkEvTjlTRi8yTXJDeTRvOW5oVi9MSFd6NjYzOFRkTlBPdXo4aVhZNGtCcjNu?=
 =?utf-8?B?RE14cDN4c1V6QTc1T2QwVHJKNHphWWdXN01waThxYWJyQUZ4aC9DS1Mwb0M3?=
 =?utf-8?B?eTFPS2dWVnYwU0ltT2JMS0FSeTE0NXlaV3Y0dXROeVFUWU91bGJ2Y2JFUnZP?=
 =?utf-8?B?OGdLTVBybytjNmFBeTc3SFI1eGQyVFBTSlZtYUJORU5ETmYvcUM5d3kra084?=
 =?utf-8?B?RUtBc0pHMnN5RDVrMVlCQU9oMDg3Ky9WSkUzYUJXR09jOWtkNS9JM0VJcGhN?=
 =?utf-8?B?aXUvazE0V0lTMHU3byt2dDQ1YUhqd1Zab2NuN1o2M1QzUkh4MXo4SkFqQ3BB?=
 =?utf-8?B?NWxEMDF2UytMM1NNUGpMTXZDU1hWOFRnZ3RSSmRkTHV6RHdSZmM2NkxOSVBB?=
 =?utf-8?B?bWpRMnJ0MUJKWlJFRy9XK2YzSmdhR3BlaUFQZzZTSENOTy9nSTdTM2Y1eUVL?=
 =?utf-8?B?RThkRFM5ZDlQNU1tSUNFUlZPWkRHN2R1REIxMFBDcDkzNWpTZGNta0g1Q3BB?=
 =?utf-8?B?eDBOUGhWVkxGT3lrZmZHVTJ1djdNM2RmTWlCMjZ2T2U3c0Rub3hVTm1zcjV6?=
 =?utf-8?B?UkJYZVJsTjhySTZ4WE8vS1pZUEoyOVkxNEd1OFRKbWFTbXNUb3pyUHZaaUx4?=
 =?utf-8?B?bW5wQ3lYWGdVRzRPTnJuVmFZVnJ4VGNXeEdtaXFIa0l5b3VRbmNRbVdiMUsy?=
 =?utf-8?B?R05yL2p1OVpybk5YcmcyVTBiZWJneHNDTFc1bHVMa0VJQWJBaytKNzU4ckxF?=
 =?utf-8?B?QkY1bFduSnhBUW9uanN3ZWdHdTN3V2J0QVdRZjJUejBGMFA0TjRkRVRtZXpZ?=
 =?utf-8?B?NmpscFc3cVhSanJTTFlDYlhKZWZ6eTBsWTdEc1p6VUxpRGdsMU5rYmowMWtJ?=
 =?utf-8?B?dW9JWlc2akx4TFFKQUZPazZKZkNOR0xrK2xUYnhYQ1RWM2U3bzErVWFMRGxF?=
 =?utf-8?B?c3ZlYzIxTjVSemZ1M3FYaUs1SU02dzhuWEMzV0Z4UDRYOWxJUndvRDdqNktT?=
 =?utf-8?B?WXdmM05iTTNOYjdJUDE0eXlKSmVQMEMzQzhyazNOS05CWk4zck1WdHU1K3Fu?=
 =?utf-8?B?SS8ra0locnBXUmxnTlY3QW9UcG5HUkxsandJQk9ka3cxS2laaDVzd1NxSGFU?=
 =?utf-8?B?YkN5dHJFc2lqa2ZvaUhEbC9jMFF2L0I5V21tOHZiVXFsTC9pUmF0cHhjYm9P?=
 =?utf-8?B?OHBVUGlEa25SbTlwRlNDMFdoNDRXNXZ0NFFBS2drUlBZRWlhUDQ1NlVHbWd1?=
 =?utf-8?B?YTIyTGwxVFVHVEl3NEJYcm0zd3J2Q1BFQjRNS2EyVFQzWjd5MldXb0FNZEhE?=
 =?utf-8?B?RlRjdnNYSGJuc2hUUEVxMXpiSGtBSStEYUp4UkZ1RlhsZzdHLy9FOG9pNHRZ?=
 =?utf-8?B?RzJkNm5DaW9Sa3JYaGIrQzhycW1UaHFKVmlMYkJTVllPbW96Q3kvTC9LL2x5?=
 =?utf-8?B?alhCT0o0Mld1TE1XQVZKajliUUFydkZNdy9qalg0UDJRSHd0amg2T0FicURJ?=
 =?utf-8?B?K1BWSVZWbXBRVDYvQUtvVFoyb2ZoUDU5UXN1U1dhKy94VHF1YUovUnc1eHJC?=
 =?utf-8?B?bzVpL2ZFSG5acjJUYzl1Y205T0JsQ1QvTmlMR25lYXhxa1g0RG9nWGxLUWZP?=
 =?utf-8?B?TzdkSGFJK0lMN2tUbTMvUVA0UEFZdGNIdkxKNGZqbVNjMjFzaGYycnlIYnVH?=
 =?utf-8?B?TlZ0Y3pCSFh5aWNaOGFWRmU1aGgrRlpOaEJoNU1xOGxWYXJHMUh2Z0YzbU5z?=
 =?utf-8?Q?vvGaavlV3nKvzDh79OIODHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D690DAA0BF5A54AB8275AAA86341F93@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1413a6fe-f9e3-4348-2ddf-08dd4157a098
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 17:57:56.8276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26AgZ3nUZXoXw4Q6GUgTrhG4vU543W7j/qPPr76a83+MkmMmY0OaKy0IA9zCZ4PCB3CSQ+2WkFq+Wh5xNCzdKaBmdnUGwxBJCXH0Y2dlvxgKeldhQitXAyVBp9UTmApF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

T24gVHVlLCAyMDI1LTAxLTI4IGF0IDEwOjM2IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOgo+IEd1Qy1FcnItQ2FwdHVyZSBzaG91bGQgbm90IGJlIHN0b3JpbmcgcmVnaXN0
ZXIgc25hcHNob3QKPiBub2RlcyBkaXJlY3RseSBpbnNpZGUgb2YgdGhlIHRvcCBsZXZlbCB4ZV9k
ZXZjb3JlZHVtcF9zbmFwc2hvdAo+IHN0cnVjdHVyZSB0aGF0IGl0IGRvZXNuJ3QgY29udHJvbC4g
RnVydGhlcm1vcmUsIHRoYXQgaXMKPiBpcyBub3QgcmlnaHQgZnJvbSBhIGRyaXZlciBzdWJzeXN0
ZW0gbGF5ZXJpbmcgcGVyc3BlY3RpdmUuCj4gCj4gCmFsYW46c25pcAoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3X2VuZ2luZS5jCj4gaW5kZXggYTk5ZTMxNjA3MjRiLi4yNjAwNmQ3MjkwNGYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiDCoCNpbmNsdWRl
ICJ4ZV9ndF9tY3IuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndF90b3BvbG9neS5oIgo+IMKgI2luY2x1
ZGUgInhlX2d1Y19jYXB0dXJlLmgiCj4gKyNpbmNsdWRlICJ4ZV9ndWNfY2FwdHVyZV9zbmFwc2hv
dF90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX2h3X2VuZ2luZV9ncm91cC5oIgo+IMKgI2luY2x1
ZGUgInhlX2h3X2ZlbmNlLmgiCj4gwqAjaW5jbHVkZSAieGVfaXJxLmgiCj4gQEAgLTg2NywyMiAr
ODY4LDIwIEBAIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV9od19lbmdp
bmUgKmh3ZSwgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gc25hcHNob3Q7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHEp
IHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogSWYgZ290IGd1YyBjYXB0dXJl
LCBzZXQgc291cmNlIHRvIEd1QyAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBu
b2RlID0geGVfZ3VjX2NhcHR1cmVfZ2V0X21hdGNoaW5nX2FuZF9sb2NrKHEpOwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobm9kZSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194
ZShod2UtPmd0KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHN0cnVjdCB4ZV9kZXZjb3JlZHVtcCAqY29yZWR1bXAgPSAmeGUtPmRldmNvcmVkdW1wOwo+
IC0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvcmVk
dW1wLT5zbmFwc2hvdC5tYXRjaGVkX25vZGUgPSBub2RlOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZGJnKGh3ZS0+Z3QsICJGb3VuZCBhbmQg
bG9ja2VkIEd1Qy1lcnItY2FwdHVyZSBub2RlIik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc25hcHNob3Q7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC8qIEZpcnN0LCByZXRyaWV2ZSB0aGUgbWFudWFsIEd1Qy1FcnJvci1D
YXB0dXJlIG5vZGUgaWYgaXQgZXhpc3RzICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG5vZGUgPSB4ZV9ndWNfY2FwdHVyZV9nZXRfbWF0Y2hpbmdfYW5kX2xvY2socSwgWEVfRU5H
SU5FX0NBUFRVUkVfU09VUkNFX01BTlVBTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC8qIEZpbmQgcHJlZmVycmVkIG5vZGUgdHlwZSBzb3VyY2VkIGZyb20gZmlybXdhcmUgaWYg
YXZhaWxhYmxlICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5t
YXRjaGVkX25vZGUgPSB4ZV9ndWNfY2FwdHVyZV9nZXRfbWF0Y2hpbmdfYW5kX2xvY2socSwgWEVf
RU5HSU5FX0NBUFRVUkVfU09VUkNFX0dVQyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmICghc25hcHNob3QtPm1hdGNoZWRfbm9kZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZGJnKGh3ZS0+Z3QsICJObyBmdyBzb3Vy
Y2VkIEd1Qy1FcnItQ2FwdHVyZSBmb3IgcXVldWUgJXMiLCBxLT5uYW1lKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5tYXRjaGVkX25v
ZGUgPSBub2RlOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKG5v
ZGUpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X2d1Y19jYXB0dXJlX3B1dF9tYXRjaGVkX25vZGVzKCZod2UtPmd0LT51Yy5ndWMsIG5vZGUpOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIXNuYXBzaG90LT5tYXRjaGVkX25vZGUpCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF93YXJuKGh3ZS0+Z3QsICJDYW4n
dCByZXRyaWV2ZSBhbnkgR3VDLUVyci1DYXB0dXJlIG5vZGUiKTsKYWxhbjogYSBjb3VwbGUgb2Yg
dGhlIENJIGZ1bGwtdGVzdCBmYWlsdXJlcyB3YXMgY2F1c2VkIGJ5IHRoaXMuIEl0IHR1cm5zIG91
dCB0aGF0CndlIGhhdmUgb3RoZXIgY29kZSBwYXRocyB0aGF0IGNhbiBhdHRlbXB0IHRvIGdlbmVy
YXRlIGEgeGVfZGV2Y29yZWR1bXAgd2l0aG91dCBiZWluZyB0cmlnZ2VyZWQKZnJvbSBhIHRpbWVk
LW91dC1qb2IgZXZlbnQuIEpvaG4gSGFycmlzb24gZmVkYmFjayB0aGF0IHN1Y2ggY2FzZXMgYXJl
IHN0aWxsIHZhbGlkIHNvIHRoaXMgc2hvdWxkCmJlIGEgeGVfZ3RfZGJnLCBub3QgeGVfZ3Rfd2Fy
bi4gQWRkaXRpb25hbGx5LCB3ZSBhZ3JlZWQgdGhhdCB0aGVyZSBpcyB2YWx1ZSBpbiByZXBvcnRp
bmcKc3VjaCBjYXNlcyBpbiB0aGUgZHVtcCBmaWxlLiBTbyBhcyBvcHBvc2VkIHRvICJHdUMgc291
cmNlIiB2cyAiTWFudWFsIHNvdXJjZSIgZW5naW5lIGR1bXBzCndlIGNvdWxkIGFkZCBhZGRpdGlv
bmFsIGRpZmZlcmVudGlhdGlvbiBHdWMtc3JjIHZzIE1hbnVhbC1lYXJseSB2cyBNYW51YWwtbGF0
ZS4KCldpbGwgYWRkIHRoYXQgaW4gbmV4dCByZXYuCgoKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKg
Cj4gLcKgwqDCoMKgwqDCoMKgLyogb3RoZXJ3aXNlLCBkbyBtYW51YWwgY2FwdHVyZSAqLwo+IC3C
oMKgwqDCoMKgwqDCoHhlX2VuZ2luZV9tYW51YWxfY2FwdHVyZShod2UsIHNuYXBzaG90KTsKPiAt
wqDCoMKgwqDCoMKgwqB4ZV9ndF9kYmcoaHdlLT5ndCwgIlByb2NlZWRpbmcgd2l0aCBtYW51YWwg
ZW5naW5lIHNuYXBzaG90Iik7Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc25hcHNob3Q7
Cj4gwqB9Cj4gwqAKPiBAQCAtOTAwLDEyICs4OTksNyBAQCB2b2lkIHhlX2h3X2VuZ2luZV9zbmFw
c2hvdF9mcmVlKHN0cnVjdCB4ZV9od19lbmdpbmVfc25hcHNob3QgKnNuYXBzaG90KQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oGd0ID0gc25hcHNob3QtPmh3ZS0+Z3Q7Cj4gLcKgwqDCoMKgwqDCoMKgLyoKPiAtwqDCoMKgwqDC
oMKgwqAgKiB4ZV9ndWNfY2FwdHVyZV9wdXRfbWF0Y2hlZF9ub2RlcyBpcyBjYWxsZWQgaGVyZSBh
bmQgZnJvbQo+IC3CoMKgwqDCoMKgwqDCoCAqIHhlX2RldmNvcmVkdW1wX3NuYXBzaG90X2ZyZWUs
IHRvIGNvdmVyIHRoZSAyIGNhbGxpbmcgcGF0aHMKPiAtwqDCoMKgwqDCoMKgwqAgKiBvZiBod19l
bmdpbmVzIC0gZGVidWdmcyBhbmQgZGV2Y29yZWR1bXAgZnJlZS4KPiAtwqDCoMKgwqDCoMKgwqAg
Ki8KPiAtwqDCoMKgwqDCoMKgwqB4ZV9ndWNfY2FwdHVyZV9wdXRfbWF0Y2hlZF9ub2RlcygmZ3Qt
PnVjLmd1Yyk7Cj4gK8KgwqDCoMKgwqDCoMKgeGVfZ3VjX2NhcHR1cmVfcHV0X21hdGNoZWRfbm9k
ZXMoJmd0LT51Yy5ndWMsIHNuYXBzaG90LT5tYXRjaGVkX25vZGUpOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoGtmcmVlKHNuYXBzaG90LT5uYW1lKTsKPiDCoMKgwqDCoMKgwqDCoMKga2ZyZWUoc25h
cHNob3QpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lX3R5
cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmgKPiBpbmRleCBk
ZTY5ZTI2MjhmMmYuLmRlMWY4MmMxMWJjZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaHdfZW5naW5lX3R5cGVzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lX3R5cGVzLmgKPiBAQCAtMTUyLDYgKzE1Miw3IEBAIHN0cnVjdCB4ZV9od19lbmdpbmUg
ewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfaHdfZW5naW5lX2dyb3VwICpod19lbmdpbmVf
Z3JvdXA7Cj4gwqB9Owo+IMKgCj4gK3N0cnVjdCB4ZV9ndWNfY2FwdHVyZV9zbmFwc2hvdDsKPiDC
oC8qKgo+IMKgICogc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAtIEhhcmR3YXJlIGVuZ2lu
ZSBzbmFwc2hvdAo+IMKgICoKPiBAQCAtMTc1LDYgKzE3NiwxMyBAQCBzdHJ1Y3QgeGVfaHdfZW5n
aW5lX3NuYXBzaG90IHsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyIG1taW9fYmFzZTsKPiDCoMKgwqDC
oMKgwqDCoMKgLyoqIEBrZXJuZWxfcmVzZXJ2ZWQ6IEVuZ2luZSByZXNlcnZlZCwgY2FuJ3QgYmUg
dXNlZCBieSB1c2Vyc3BhY2UgKi8KPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBrZXJuZWxfcmVzZXJ2
ZWQ7Cj4gK8KgwqDCoMKgwqDCoMKgLyoqCj4gK8KgwqDCoMKgwqDCoMKgICogQG1hdGNoZWRfbm9k
ZTogR3VDIENhcHR1cmUgc25hcHNob3Q6Cj4gK8KgwqDCoMKgwqDCoMKgICogVGhlIG1hdGNoZWQg
Y2FwdHVyZSBub2RlIGZvciB0aGUgdGltZWRvdXQgam9iCj4gK8KgwqDCoMKgwqDCoMKgICogdGhp
cyBzaW5nbGUtbm9kZSB0cmFja2VyIHdvcmtzIGJlY2F1c2UgZGV2Y29yZWR1bXAgd2lsbCBhbHdh
eXMgb25seQo+ICvCoMKgwqDCoMKgwqDCoCAqIHByb2R1Y2Ugb25lIGh3LWVuZ2luZSBjYXB0dXJl
IHBlciBkZXZjb3JlZHVtcCBldmVudAo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCB4ZV9ndWNfY2FwdHVyZV9zbmFwc2hvdCAqbWF0Y2hlZF9ub2RlOwo+IMKgfTsK
PiDCoAo+IMKgI2VuZGlmCgo=
