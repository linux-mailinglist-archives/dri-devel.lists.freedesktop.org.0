Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FEA3132C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C6D10E736;
	Tue, 11 Feb 2025 17:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cc9Zmg+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62EB10E736;
 Tue, 11 Feb 2025 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739295245; x=1770831245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gUL+J5uzKDvcWeFOCx2wo+mPUzvJif/PEBmahx0aXLk=;
 b=cc9Zmg+OVsIn07Pw7a9Pg2MWXQSgsPyQ+av4EZw6Z/DEyH8w3Z5cFRFv
 D9HZetiDzn9IhrdwdIaCEM+ujlMKojL27h7EggEs3z+35418TDEjzQzsc
 70g7/ySMY7EqYWexFQSz+UrqWid2ElHp4DY8c4QV+SOl1MjOQZ1FA6+so
 nVYoTTrqVyNqWVz67r4iicoknxka/4BUNzWfxshpBJNUDb7jNE/rWB5+5
 wjMG0Tpb1mmqwKXdRtdC2IWG5cNYIaDeEEUY8NFyxPo7XHTR/oLMIsVrb
 +QORnR2iGagYC48khKSqbZ//s212n2jbJrCIeyfHXZtQ1+jAYrqUjXrKT w==;
X-CSE-ConnectionGUID: km60q2r0T+uc72csPdoPWw==
X-CSE-MsgGUID: 6CmMVxaBRKevI2IrJtbckw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39841199"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39841199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:34:04 -0800
X-CSE-ConnectionGUID: dZ2UCLpcRCydYrhiy8s8ig==
X-CSE-MsgGUID: 8+eZky64Qh6UUCMWEwpQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="112409940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 09:34:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 09:34:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 09:34:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 09:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS2XH9iRTMBBcwJu8VShDtlQnK7i18/Kc8El/KaI6k8QxOkg7U2jNwxakELaqsc9C5VOcBWGApYLZRtRSdfSA9Syahc0Y6R5D67iripX+0GH4r4uhIp4P0iW/kTFtDAx7la/8vmrwi2n40xUSppUApJk2v7NLXHPJfpTxOvtGuNGKdnwVy08teXggfadKA3cudpEtv+xHVqMvVJ6e+ft+ZlkEsD2AfSkClOcUiD4TG8+e8kemMjZaMekjemL8YuZQYY3xZcwef6mrtSZNpj6zJeLYCru7Q+qTRXrRmSf28yCjVANLK7DFfuM1pHNRZae/D00jOyb2u8NaKUzT9i8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUL+J5uzKDvcWeFOCx2wo+mPUzvJif/PEBmahx0aXLk=;
 b=hsu52m7MnVArvkhsA20O0eP4Nw2loy932JEZgj6TyXJ6HcK+OQYWlM642xXjd4ozh7bEBQN6+avnZ0OqcDcKvxFKOnlqK9QyGQ2vdQyv9T7yEtK3D7Q4oC8esZ2gHVWQ+FK+wqP4L5Xcdv71Ybn5AeZXScdNeXWGeBzZ9OjuJo5GNDk9yHFtW8XQpFUYTBNSmh03a8bwmlj07FiTalUnSXBNj8VOWV7k6Hh3UgGVq/1qGMqvKNr85l0iBt3jsppY4xSJyWHYOcn+P60IQdLcb+DkXmlwHLL1o0a4H6pTdaXDhmBK9mrU6/GxAIE3iXOoaoS8wiRMKlGMtXvIvpP9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Tue, 11 Feb
 2025 17:34:00 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 17:34:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 5/6] drm/xe/xe_hw_engine: Update xe_hw_engine capture
 for debugfs/gt_reset
Thread-Topic: [PATCH v7 5/6] drm/xe/xe_hw_engine: Update xe_hw_engine capture
 for debugfs/gt_reset
Thread-Index: AQHbfBREPXRoVfvlA0GRHpmilMtkFLNCXhoA
Date: Tue, 11 Feb 2025 17:34:00 +0000
Message-ID: <917819dcd25fabc9732fbf151b1cc4e4b1f0bb30.camel@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250210233254.419587-6-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|PH8PR11MB7093:EE_
x-ms-office365-filtering-correlation-id: 03c6eef5-6e8f-474b-fee5-08dd4ac2452d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dWlzSDd6TWpDVEFEMWxYbk9UdmhTMWpPM2lOSXhOSExmOVBSbEs3U2xBSHpZ?=
 =?utf-8?B?N2s0L3lYajJCUGlOOFNpcW9sL2xURk5nNldaTGIzY3VEd2ZINkp3bVUyRk9Z?=
 =?utf-8?B?WXZTYWtydnR2MDZJaCt5QXdHZDlqT1dpQzdxUjJ5WGEwOVZZOTFlZnZKa1Zy?=
 =?utf-8?B?aDgyNVd3eXEvaWFkV1d6OTdXRjZiRnRQZGIxRXpJWVZ3SzhKeCsySnFUY1hP?=
 =?utf-8?B?ekxOS3VBb2ZxSXBrS2tIVGNLanBsVitCRUlmeHhOci9RTkEvb3NXN1lkK2RE?=
 =?utf-8?B?dzNDcW9vYTRjOWEzZXNuYmZ6ejFzRnFmSFJLNkdZc1VTelc3dlZjR1gySk56?=
 =?utf-8?B?cEZaZTlTcjhqdE50RWlkUG1PMzQ4MTNUODNnNGJYd2FJV3Z0ekZhNkcxdGdz?=
 =?utf-8?B?d3Z2NXpQRXBvTjFoWldmUkVzcXVzdTczdkVHeDhVUnU2M3B0Mm5wc1ZrYmdm?=
 =?utf-8?B?dGdUcUdVNWttYXdFclJKVHp6VklrSyt2VXVieCttY3N2VHZLZEN1YW1GVENO?=
 =?utf-8?B?Vm5jK293SytnYXp3S1Vlc1RJQkdPMUhoVEFEWmY4V0FSc2VzTGh2U0NqenJ2?=
 =?utf-8?B?eXlVMW90UU5GVU9TMmt5K2dTNWpNc0FzUkVUeFVWcWFuZkoxRC9YVVovS2Yv?=
 =?utf-8?B?QkJVekluWkVucGxMRTVpSUoySGlQRmZNcHBTZUtRbG9RcWlBNlVJOFFsQlNF?=
 =?utf-8?B?NFJ1aHR3TDQzRTVTbEtXTVhrWlJ1Q1BpRjVMM0FVY2d6RUl2SnZQekZhaVlx?=
 =?utf-8?B?SkF6NzZlUlovc0NBMFNHeXh3cjZiU2lxYzFzaHdqNDlwYXRIYlBXZEZFaXZO?=
 =?utf-8?B?UEphS21CeC85V3ltZzlGLzY2ZDVZYnFOSEhTTTNBUTZVaWZLeFY3b2VmWXM0?=
 =?utf-8?B?bjArMWg2am85cnNWVS9CeHBvdTZwK3I4NFpzQnhhdVQ4anZZZ3lscnRwcm1G?=
 =?utf-8?B?Wi8vNnBtajR5UXB5aVhBait0Z2F1L21xYmpiL1RXU1hCcmh2L2FMc2dPMUdN?=
 =?utf-8?B?WkNVdjZ6RVZ5eXlMd00zWEQ5K0tCSGxhNXM1SWRCd3BkWTdsRmhNRFhZUklZ?=
 =?utf-8?B?eTFNcUlCSGpzTitWMC8waUdndXhpeGlNMDhyaGpZMTJSRTlsNkFuTEFzalZV?=
 =?utf-8?B?dnhCL3BXdXVPcm1UTCtJZXBaZG40TFd3OVpETXZndzcwN1lHYjdPVk9GUjJk?=
 =?utf-8?B?cERxdTZMUmhFUloxbmpRM1VSWDFCcktieG1nRmdBOTRhc1cyTDhDSVFja3A5?=
 =?utf-8?B?SHRvc0VZUmtHSHlLUXJTa3FCeVh0LytYOFJrbXY1WkxLMjdVck94MEZreCtj?=
 =?utf-8?B?ZmI4WXl6RzBSZ1JpYmhsOU4vNkVtTWYwSXB4bStxcjJFNUNQVTQrVzJJSWhJ?=
 =?utf-8?B?LzVTL0JtV1pMZnRrcDBGYjRxRjk1Q0t2bFdyWGhubDhFR29CL3N1b1NvcGxE?=
 =?utf-8?B?L2VvYm5haEFieU1aOUpWb3NpQXdQejJXc01lTWxCY0tMNFhKbDhUbEFMa0Rn?=
 =?utf-8?B?Y2RlL09XQjd3eXVUQkJYdFh6bHo2dWxCczNIK2dYT1RtRGZsbUF0UHdGaHJv?=
 =?utf-8?B?VE1YR05IR3pWVHk4WkIwUDUyZGhtNHZSdjk1alRLYlJNZkg1K0cvd3ZFa3VT?=
 =?utf-8?B?MzY4cUJoWDlYWXdlb3pLY216VnlFMEx6VGgzQUZJVGJLY1hzcW5PbytaRzBJ?=
 =?utf-8?B?aEVmd250VVFacVlRdlVtWDV3VFlwSTkzTXlXK0tOMWtiNlNPdVdlTFliSmox?=
 =?utf-8?B?VyszQmE2RThDRUtwMGNoSHhRTEpMQlRBem9aR1QwRG1HR1Z2Skw4WFhtWHpk?=
 =?utf-8?B?aDliQjlTckk0RGFsS2NWRlhpZ2hCN1FrY00rOU9ZTHJkK1BEL0c0ZkFHNGla?=
 =?utf-8?B?V2lEWFFhRWM2cFROL25qU2ZQb2IzTWFmRE1JeUUzZFFjc0ZKWHRLWlNLcnBO?=
 =?utf-8?Q?84VKn2FCXzGqB7k7lS7OiGJOgs8E5MtD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXhpMTdFME9ydTc4RDlxVWdLMXVYVzRqbHlabUVxWFJYK2FxUUpIOHNkZVN6?=
 =?utf-8?B?Q2FpSmpublFnbHhxS0d1Z0hiaStDaGhvVUxMaTZqa0tmSHZsNlRSY2dpT3Uz?=
 =?utf-8?B?cHBjWVduQk1ZUFd6NHFBR1dCOFNlYU5VUm1uN1BidDR3Y1VVcU8zaXY2R3Ey?=
 =?utf-8?B?WTc0V1BISktrTi9iMFpPeFp6ZnlTbmNBRzhVbjdsT1dPeUJEWWF1QkM1MkJY?=
 =?utf-8?B?WmI0eEhSTXA5UUhlUXFTYVI1b2hGZXh4UGlZdnZnNG1kVEdIRjlDTVJWNklP?=
 =?utf-8?B?QjNUQnZHaDVGSGJ5akdrSXlCQXhrOW1VNWR2MFV4NVJoUVRCQ3JEcjlScjFF?=
 =?utf-8?B?VUx5OVVZN1FKM1J1ekZSeDc5MVFtdjJDMjVVKytoQjlsM25CRHFMOWMvbXN2?=
 =?utf-8?B?dlI0U3dtOHVXaHlYTUUwRXpsN2J6dXRoOTh2ZzYwSkwzbExUUVBMOEJodHpP?=
 =?utf-8?B?NVh3TUVEbmZSNVVTVW1YdUt4OUxobVJ4UzVxMXg5RFBwSmd4QWJxcGU2UERj?=
 =?utf-8?B?OHU5RS9QZGh2VENPeDBSWnBqTUdlUUpyS3ZYL1RiZ3BPdm9Jb3pmRzN0R1JH?=
 =?utf-8?B?RHRPcEpKemswS2N3MGVreVVFL2ZVOUI0RWRmSGFjTFpzcDNid3FTeU1ybU9q?=
 =?utf-8?B?NGZ2STQ4cTJvYVEvRWhLY01ROGhsTTJCaEM4cVdLekRleWxXY01mOWRtb0VB?=
 =?utf-8?B?ZlFUOXgxdlEwTTczSUY0L3dUdXBDZFhtaXhlcTlpKzJzUTg3eWtVVE82bVBv?=
 =?utf-8?B?RUNJZWZNOCtZNW5MRHRlZzB2NEw4SVVtM2g3UVBGTUJhTUtVRFJGRkNhbm9T?=
 =?utf-8?B?WlZneWtvUHgxcDh4OXN2TWRENityd3lXY0gxbWw3S1UzQmd4UVR3ZitRVllW?=
 =?utf-8?B?Q0ZSdE13RzhIK2VQc1ltWFV4L1ZMaTJSM0JCNjFXcnlsNm9BeEZSLzZ6alFF?=
 =?utf-8?B?TGQvUllQbUc5UlFvTVdjSzRVbVVMWlFVbDB3UWJLQlk1bjQ2aEJNQ1psMjk4?=
 =?utf-8?B?bUsxbjVJdDMyOFRlbkxLTU5FRjdxQ1pHMldvZVBHWXh5ZCs4THFaM01nT085?=
 =?utf-8?B?UThjWTJLbjNNS2VVaXZkUWozeGRNaGlRVWxyT2NHbjNzR3pjTGcwbE9sUkhr?=
 =?utf-8?B?bnVIYmRxYXF5UHlTcEdVc3ZQNko0TVFuMWt4SjhTMzZRcUFZUmtEM2hKekhn?=
 =?utf-8?B?dFZYQjJBZjM4ZTR0anUyeXlJdEg3ZkR1MlpKd2xNaVJHSTdKd0NIbTFTWW5T?=
 =?utf-8?B?NUZvYWNMVHk4OFVWNW9YTkxZLzM0U3FLcjl0NllUYXJSckQ5ZGY3MXBUalVM?=
 =?utf-8?B?QnI3c3ByY1RPdjNSSStMYjd0N0o1RjNSNlJsMGJITWYvbmlnN3kwbjN3N3dp?=
 =?utf-8?B?cDJ6cXJ1SFh0b1BvelBIb0ZLakdQZ3VHY25CWWIremtwZFJUN1hOTzFNTzlF?=
 =?utf-8?B?SDFVcEFvVkp5TlY1V3luY3M5U1ZjcERkU0ZudWVMWDRXVzVsN3pnSCs2RzN2?=
 =?utf-8?B?eEJsYnlCN0Y1aDl3RjdZRkZQeTc5MDd4MGdLZ05PejlENWVXNUFkUFFBc013?=
 =?utf-8?B?aHZqKzZTMkhFSGUyZkRlTVFMT09OUFlrSm1ML1JxZFloSFJac0NtTUtiUlhF?=
 =?utf-8?B?SVAxV3hvZkhDSVpRR2hZbmtCRFl0YUFNZCs1TVR4UFNieHlWWmswTU5hNFdN?=
 =?utf-8?B?Q3g0K2llaHpvWE9VaW53SFgwcFVscXBsZzBWQlJrTURUUnZ0d1pKa0Q0MEdj?=
 =?utf-8?B?VEk2cW1BVHQ5cDJUM3FEWktDWUVZSk5IZ2xBRTY3T0hsVjBWaEkveWVhNG1p?=
 =?utf-8?B?NHpwY0wrSkVPd0QxR0lGMlRtZnpURDBmMndVZzhRN3J0N3JZa0RHdmViZkhR?=
 =?utf-8?B?dkhWUDVDWUREeVpLUEZSVmZXOFI2aVhiTytROUpMWHprY3pEQW1qTkUwUFN5?=
 =?utf-8?B?MFM4eVhFcVVsSmM3bzhCcU9aWkNoSEJvY29IRWs2UFRmaVoybXlMNzY2dWJD?=
 =?utf-8?B?MkdBU0NVS1FIL0V3U21oZ2JVZ0tGUFBTZVdaR1RlQi9XVUVYMWVPL1p2Rjgz?=
 =?utf-8?B?RE9DYXdEOXlSOGh3YkpibjIyRW03dlk1MDhTS3d3Tm01R1c0ODVLajBRWjhp?=
 =?utf-8?B?NWtEZkRJbjJwYlJrelhJR0s2UUxWTWJjZ3A4dDJieG1IdHZHT1ZaSUdXekp5?=
 =?utf-8?Q?bIHn3QCBGjnKwDvBkOFqXqc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D641850083A2A419C931B8CC8728686@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c6eef5-6e8f-474b-fee5-08dd4ac2452d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 17:34:00.1125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mkFqOWNuCq8YQk0Az/LqRkw7ei/U6gNhfT9Zs7tE0mJhwbpohJ6oiHx/vGBHupYyjQiPfX3n1jUSugZEAXL/RHrrwFKtLieRLI2mMv3kaP0io3+EcRBjGJxtz4soSqf/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDE1OjMyIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiB4ZV9od19lbmdpbmVfcHJpbnQgaXMgY2FsbGVkIGJ5IGRlYnVnZnMgdG8g
ZG8gYW4gaW1tZWRpYXRlIHJhdw0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Nh
cHR1cmVfc25hcHNob3RfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2NhcHR1cmVfc25hcHNob3RfdHlwZXMuaA0KPiBAQCAtMTIsNyArMTIsMTEgQEANCj4gwqBzdHJ1
Y3QgZ3VjX21taW9fcmVnOw0KPiDCoA0KPiDCoGVudW0geGVfZ3VjX2NhcHR1cmVfc25hcHNob3Rf
c291cmNlIHsNCj4gLcKgwqDCoMKgwqDCoMKgWEVfRU5HSU5FX0NBUFRVUkVfU09VUkNFX01BTlVB
TCwNCj4gK8KgwqDCoMKgwqDCoMKgLyogS01EIGNhcHR1cmVkIGVuZ2luZSByZWdpc3RlcnMgd2hl
biBqb2IgdGltZW91dCBpcyBkZXRlY3RlZCAqLw0KPiArwqDCoMKgwqDCoMKgwqBYRV9FTkdJTkVf
Q0FQVFVSRV9TT1VSQ0VfTUFOVUFMX0pPQiwNCj4gK8KgwqDCoMKgwqDCoMKgLyogS01EIGNhcHR1
cmVkIHJhdyBlbmdpbmUgcmVnaXN0ZXJzIHdpdGhvdXQgYW55IGpvYiBhc3NvY2lhdGlvbiAqLw0K
PiArwqDCoMKgwqDCoMKgwqBYRV9FTkdJTkVfQ0FQVFVSRV9TT1VSQ0VfTUFOVUFMX1JBVywNCj4g
K8KgwqDCoMKgwqDCoMKgLyogR1VDLUZXIGNhcHR1cmVkIGVuZ2luZSByZWdpc3RlcnMgYmVmb3Jl
IHdvcmtsb2FkIHdhcyBraWxsZWQgKi8NCj4gwqDCoMKgwqDCoMKgwqDCoFhFX0VOR0lORV9DQVBU
VVJFX1NPVVJDRV9HVUMNCj4gwqB9Ow0KPiDCoA0KYWxhbjogc29tZSBvZmZsaW5lIGZlZWRiYWNr
IHdhcyBnaXZlbiB0byByZW5hbWUgdGhlIGVudW0gdG8gbWF0Y2g6DQoiZW51bSB4ZV9ndWNfY2Fw
dHVyZV9zbmFwc2hvdF9zb3VyY2UiIC0+ICJlbnVtIHhlX2VuZ2luZV9jYXB0dXJlX3NvdXJjZSIN
Cg0KDQo=
