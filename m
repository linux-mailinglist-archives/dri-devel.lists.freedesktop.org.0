Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB38A0A786
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 09:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9E510E38D;
	Sun, 12 Jan 2025 08:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZv7vQE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D2810E2EB;
 Sun, 12 Jan 2025 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736668967; x=1768204967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h5O9atRnaARYFjiaM5SVdqBzgMrgHo4z6lQW1/U9P2o=;
 b=UZv7vQE8vY4Zf3UUSBWCpPRkcnqbwSONqNwzL5Z1HHTkl66wSXC8XXVt
 WL2hSy7fngf6v3Tf9Md30a/rtizZdulK3JTYjCS+t5n8Bix6a7UvAeRzi
 kOnt+87INc2haW6bn1GOATLymObDxvoS5LgtBztRDjSECGk8Bs9jvS6NK
 eceNevElq2DsablABFCEYQ/3c1tTSQ970r4FFRcCFJrGFvCkaJZPhzi3i
 SUkULcKliSJw5xTaWq3uR6nUJ00Twu0BqJW2ndrXNRWunLabIUIzqlqMT
 0akxg/CiYZynXhnCqJ79J+t9cu1bdl8kh9ALcWMnvJ7UGkxwIkFFVvRs7 Q==;
X-CSE-ConnectionGUID: L73nd8qiSc68qlqo972HTg==
X-CSE-MsgGUID: PE0zvDdIRji28XY8lZ3dsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36814945"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="36814945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 00:02:46 -0800
X-CSE-ConnectionGUID: 22XrI2LNSuSfuIthK0TAXA==
X-CSE-MsgGUID: h1MakJLsTv2onM0JsKTrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="104701805"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 00:02:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 00:02:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 00:02:45 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 00:02:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi3d89XTJVG6s5/jpE3nOB6oKwnFiRTim9Fvf2TP7WNybPE0EXlcFvE2TB9odwwYcbxfmSN8zU+9ctES4euKdznyl2UBws9k2e8+xfhFdX3iMDP2l0Omv5/adA35vwMoaHwAtq6txTG1Exn2fs3UspsdlDwna8wBEm0r/T4fRJvVb01p2045c2dCe2XClzeOWO1Glmljk6oT6XY5ZA3ZUziecv0hA5JDNUR/cUKNg5BQZH9Wll8/pF7bExh15AtKvnIuXc8pow0g9KzKNGbv/4IW0eoOhYYEL6al/cdz1Ry5WWUZVbo1vCbqcI877AmDz5a4Cawhold4U/+uK0jqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5O9atRnaARYFjiaM5SVdqBzgMrgHo4z6lQW1/U9P2o=;
 b=mYFeWcItRz5zmdXdwoVszHLLY5/EEz98WjhaMSFP0Wr0UoA/8UxZSieEneeNDX8QRILEsoInaUUgJyLGgDxG+JYZ7SLK/ioZJb+WEYOiJEm+a+1mLrgQqP76u9Cj4OUK+8gO0JnaVFsS5tm2gEaOAMHUOzB6bIjbXPGzUt+zN+LidTFX6wKM6rAVWgqKF7jXkzKiCetDo6mW6GbdhguV3rhcH24t/uJJzml9XtaVkwHJmCZZMx5A7BtXb6qWelWX6Npg3hV534lfa/E0Fdz08262q0GXY7wbq8OkzXC89vbv/AjXiK8HFbo4+VfyUB+/2GWeZItffWYSojcei9fgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 08:02:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 08:02:41 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 5/5] drm/i915/display: Add function for
 format_mod_supported_async
Thread-Topic: [PATCH v3 5/5] drm/i915/display: Add function for
 format_mod_supported_async
Thread-Index: AQHbYZG4Suu97PDYBUewxC1GlXDsUbMSwyIg
Date: Sun, 12 Jan 2025 08:02:41 +0000
Message-ID: <SJ1PR11MB61299EECD0262C9234612A98B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-5-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-5-f4399635eec9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 3840ae23-cffe-4e31-b41e-08dd32df7d27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UmlzN1ZwL3pob3A0SDJSMGlJQ3dwQkJjc1lIMmVMQU04RWlKYzRhNGt6V3M5?=
 =?utf-8?B?K3RuaUNZTjhwc2N2Rlp5RkE1OWhlaEs4VVUzQ0tKMUZHcVdqeGEwY0huZVlM?=
 =?utf-8?B?MG5vOEd3RmtFd3J5RVQyUzBDK0hGNXhMRkd1MVMzNkhSb1JWM0crenZNaWN6?=
 =?utf-8?B?TERTeEZBdkQrSWdPVHZWd3VOMCtiV2J4ejN4c2dpZDJ5ZFQvTzhvT2NJc1hv?=
 =?utf-8?B?aTRQTE4xMVJjL3VnT1NiVzZWTWxTQS9MNDJHZjZGY0ZhaWdpeFNYejVZSUNV?=
 =?utf-8?B?LzErQnY5ek1Wd2hlR0U1U2FVYzVwUEcrRm1tNUdlbExVS0VRSDBLWjVWblh1?=
 =?utf-8?B?NlFYV2Y0Y2NBeE9DdnhHVjFLRlJGZUNaS1ZIZUhVeWRNY0JHRzh6eUgxNmZK?=
 =?utf-8?B?dWREeXhEVEJ5bHhGNHZVWExJYm0wcTl5dFJieWlpUGNVTEV5QWJmWDM0c1BH?=
 =?utf-8?B?dW9LckExMHlweWJEOEtIR1ZOTHo3K0JGWHNJbFNmN0FiTExkZ29SRkJOWjRK?=
 =?utf-8?B?RnVjbWg4U0REVnc2OUlwcHJ2bkJaNlZxWEpHTTdlZDlvZ1VFYW5SRXYxbHJI?=
 =?utf-8?B?NklrU0oycHVGVlJuU3FwRXJIdGplRHJwN1U3UHlVTUJRd0FkcGlXZjdSRlkr?=
 =?utf-8?B?WEZoR25xM1dDMWFJOVNnRzZjSDdralVXSncwaysvSEtaR3lJdy9iOUY1bm9y?=
 =?utf-8?B?NlAyVmpJVXRKamxjV25KZUp5R1R6eHNpaTZZN3JLSXN4NGMwK0JQczJ4V3JF?=
 =?utf-8?B?YUMvVFRUWTJma2ZvUk01UGZyRm1XVWNaZFpVdG1YbUlUNVNxQUYyNE5qMEY1?=
 =?utf-8?B?c3p1VHdYMmIxSWdnc2tnVDBoV3RxeEczUGdoTnkvUmxtckxiZjBsQWVVUkJu?=
 =?utf-8?B?VVlzbXF4VGtQeDRCdHFSTWVJRStOVStzdkM4TlZKZWczdmpTdVh3dEhCVW5D?=
 =?utf-8?B?SE1zb1RNUDJnT2tWNlpGbVI4VUlib0dHTXJyTU5sMnpGWmxxOStUc0MxcVdC?=
 =?utf-8?B?TWMxYVo5elBhYkpaTkkvZXArV1lyYlpla3M3Qy9UeWIwSjVlTnlXbjZFMElE?=
 =?utf-8?B?emZiQWFvSFFIa2svQzNtQVFZMGtjWTN5cmRXZ1B0UEsvUndJQXZlaTdiNmFD?=
 =?utf-8?B?NGExUURPTmNERHFaVk1HdEVYQzMvSmwrbDZwMzZGcU5GRWtSVUdodlRtUHp0?=
 =?utf-8?B?b0g3Q3BYd0pzRW1GS2ZQSFp6L1BjM2R0MUthU3hXbUllM0VRbUplWTUvVExN?=
 =?utf-8?B?VmMvSDhSM3VoT2NkODU3QzROWUcyUzZZWm00T3FzTnhCb1RZSVRzMlk5YWV5?=
 =?utf-8?B?Yy8xTHczTmpoZXBldjEwUk1vNDZEN2R6d1hnYmc2TWU1ejZrSkhjVkQrQzJv?=
 =?utf-8?B?c1lpWFM5ZXpGc21rZS9Ec1d1aUtzZlBkU1BQQWV5U3dsdGsrSWpsU0pvenhE?=
 =?utf-8?B?VTlzNlhMV283Z2tOSXU2RS9kWjNsRFEyT0VsRkJVYTVjVFJuZTIveENUb3U3?=
 =?utf-8?B?QzhLcHFXT1ByNFdTNWpKdHIyOTlaUXU1OGp0M1doWnpyOEwvb0ZuQ1IzUDJk?=
 =?utf-8?B?YlRaR1ZJRzdodlk3NDEzaXdWWkhpaEFZdVlNY2pHSGNPQjRzcmNLZDJQSmxH?=
 =?utf-8?B?OUUzdzdOc1FtN1RINS9yaFcrRGp5OWdFOXhFTk0xd1BMWndtVTY0KzhCUFFp?=
 =?utf-8?B?dlhReVhuQVpPUDVHRGFIakNoekk5TmNmVFdrSEdJRDhWRlJzbitUWi9XbVFy?=
 =?utf-8?B?SzZnaUVtM0xVMmhBRmFkR3kxSnYwemJwSkdFYXI4MVBVYUdMdjUrSUhRTlZn?=
 =?utf-8?B?MkMwOWRsL3gwU1J6aHlYbFUxd29VNWEwbE00R1Fualdhcll4M2owQVpGRi9X?=
 =?utf-8?B?cnJZV0I3VmU0Ykprb2RFK2pxaVhJTktHQW9iaUlSUmx1ejJRVm1Sd1c2ZU5q?=
 =?utf-8?Q?HYy8yw2vCeK70DqllKSkKK3xZIHF9KsJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXlyMWdoVzcvbDRDTXdWdDVsZUE1ZDAzWXlodllLd1Y3SFZqd1BDL0pmMkNY?=
 =?utf-8?B?NFNaWlZudEh4T29MQlk0V3ZyNnY5VDFQV2k0U3hvNm1Rc3RFdTFqYUxsNUVM?=
 =?utf-8?B?ajZ4L2VIbkFRS2x5aW1URUVlRnlDa0tsQnpZWUM5UWF1b0NQRm5kNllza09U?=
 =?utf-8?B?cXlDbm9VQng4aTRpNlh6dEpYajFwZE0xN0owOXl2L1pRK3ZuMVYxSDBpVnVP?=
 =?utf-8?B?U2JVOGpBcmxFMXNJTlFCV3ZWOTRhUys0KzZ2YUNOOWNESHArYkRBejNFU2Js?=
 =?utf-8?B?aWtWMFU4akQxeUttYmduL0xKYUF2UkNZenBPN0xKeUpBZEFwL0RjcjhrZFVv?=
 =?utf-8?B?S09WYjRVdDBCSEFLN3VqSDZkL2wrcEo4b282QlA2NFFDdWtUa3M1RDRqZTFS?=
 =?utf-8?B?UXhrWUphazlJdERaSWZrTlFFTTgyZ1BMc3RDeTFoeVJvOU5CSjlDTU5KYng5?=
 =?utf-8?B?NGUzU2JmVHhxUC9KcUIyYjdEYUdTcDdRSURyMHBhN0p5b0hKMDZrc0VtY2I2?=
 =?utf-8?B?RDVTVG5OZksyN29qTGsxK01yRi9UeEg3UFh0L294ODJDOTBBQklUN2p6ak1i?=
 =?utf-8?B?TTZlUThpeFljcjh3WHRPemxxRG9PRWtuaUQ1eTZIM0FWOUJ4Z29BSEZQU3po?=
 =?utf-8?B?SUtDZlZqWVYwRThqM1VMS0t1a3VaWnRzV3FaS2tTMWx2VWU0VHlDc3UvWVhE?=
 =?utf-8?B?eWttcXJ2dW1zRm5QaSs1WGxTWEhhMnZYUVFPcE1aVlpmaFhtbEk3bXdEU3Jt?=
 =?utf-8?B?R3ZtSHprTHZkM1lBQlBScnJNaEFUMXZKMVBoTHpGUUZoOGl2cFBhZkhLdm1x?=
 =?utf-8?B?T0lTZ0ZEK0cyZTV5cVdOeEx1YUFtL3ZIQ1NkOUVwbWF3MGE5QXA5UUtKaC9p?=
 =?utf-8?B?WUloWkc4ZUFnbWZvVno3NjVrK0tIbS9MZlZOMU1yWmxwUjlScmh3NDlmVE42?=
 =?utf-8?B?VkJLV2lteC9GSzB4REJQTDFZY2lQUENCWHcxWmpIWE5pTDlTUy9xeVpldUQw?=
 =?utf-8?B?ZTgvazEybnpobHVBVStwK0p1T3h0cXhiMTNZVlJsdHRZWFNZd2dWMllXeDVZ?=
 =?utf-8?B?N1JUc1d5dUFtRDFYWnJoZXZKL2FlYi9sa1VsWm9RdGJtclpoc2d2UDFORUF3?=
 =?utf-8?B?aUgrSDlkV3JHeXdGTlk4bEM5dkpyVDQxYmVUbDBSMzNrV2tWVTZ6b29ybXBP?=
 =?utf-8?B?b2ZSRGFxOW12aFdTZldpWUJ1YWU4UGhXWGhUNlhCT1BMc2MvaW9TV21KUUFV?=
 =?utf-8?B?S0FHcWdjWGJaNmF3MkcrQ25VeDZ4czUvS3RHK1JLa1c2VWliSVNIMmRHL2FK?=
 =?utf-8?B?cTdNNUcwbExlVk1LY2N2VVhaUWgzUHZDOStRRHpDdTRxZTRGaWt1R3pwYlFn?=
 =?utf-8?B?QTRqRVJDWHlZVHpCTm9rdFk4Q0FPei92dmRQL0tDNnFqOWUxNDRyNmIxYnY4?=
 =?utf-8?B?T21Dbmp0akFDMFQ5SWk2MkZlem9peW1ZdlZGSHZobGdVMjdRZDY4VTJVK2Jp?=
 =?utf-8?B?bGNxcWc0czhoQ012ZXNpb1c4UldSTDMrYk9yT3FDekhGM2RJTEdEODNLOVFy?=
 =?utf-8?B?d0pWdThqdlJzUWhtKzZaSkxDNnAzTVpYakVjV0JWODhuNS9nRHd3QTJJcmxs?=
 =?utf-8?B?Z0E0VzFXaG5BTHcyN0NhcGZkM3AvR29Bb1cyYXhhRnBSZjJ1Mnh1dWUxU2Fv?=
 =?utf-8?B?ZmdzcjJ5SHdGekEwL0FXbnVaaFZXbThtVU53cUVyQU1sOGdhNlVSNGVPNk96?=
 =?utf-8?B?OWpCMlkrYXpRSW5qall5NS9RNDQ4eXB2MVlkWnVjakNLbzl1MGRqTEtoZEFV?=
 =?utf-8?B?M29KOFRGTVFaQytxUE1lT2tEdWZVUVJOKzcwWjZXTUhEdG9QbVhwVTVXRVdi?=
 =?utf-8?B?M0RvdXlNZFVyV01IK1k4aDk4R0p3c1duUXpiU29BcnVzbG1sN21TVjFnZW5x?=
 =?utf-8?B?RGNYQmZIUUE5OC9QVDBMVkRNQW1HTG5hWDg5V3pTVWhmOUJUVzdDSlRSYTVG?=
 =?utf-8?B?UTY0N1ByRDBLUnZYZ2orRksvQTMzRDFoY1AwcXE5M0dyRVg1QUg1NHFVQ01r?=
 =?utf-8?B?RkVBeDlza3c2VnFqamdnWHBsaVdUdStuWjRmbzhHUGRjSHJ6Vk1nd0t4UlVo?=
 =?utf-8?B?SE9FVjVXRU5FNlpucTVtV0ZKVERWSWtqODdsS0k4VVJBZzRUU1JQOTkyci9V?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3840ae23-cffe-4e31-b41e-08dd32df7d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 08:02:41.5078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkdU+7qaFbc+O3feMLtDkAeYnnjk8hfduB2At+BLiBo4WJyom55RlIRfl+iWEbf4ekp5xOHBIyrUrpbh/Jir8pdzOgXYJsHe4J2cGVvKYzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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
IFIgTXVydGh5DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDExOjA5IEFNDQo+
IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBN
dXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyA1LzVdIGRybS9pOTE1L2Rpc3BsYXk6IEFkZCBmdW5jdGlvbiBmb3INCj4gZm9ybWF0X21v
ZF9zdXBwb3J0ZWRfYXN5bmMNCj4gDQo+IEFkZCBkcml2ZXIgc3BlY2lmaWMgZnVuY3Rpb24gZGVm
aW5pdGlvbiBmb3IgdGhlIHBsYW5lLT5mdW5jcw0KPiBmb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3lu
YyB0byBjaGVjayBpZiB0aGUgcHJvdmlkZWQgZm9ybWF0L21vZGlmaWVyIGlzDQo+IHN1cHBvcnRl
ZCBmb3IgYXN5bmNocm9ub3VzIGZsaXAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVy
dGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYyB8IDYyICsrKysrKysrKysrKysrKyst
DQo+IC0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9z
a2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Nr
bF91bml2ZXJzYWxfcGxhbmUuYw0KPiBpbmRleA0KPiBlNWU0N2YyMjE5ZGFlNjJlNzZjYmRlMmVm
YjQwMjY2YjA0N2FiMmIyLi4wMGFhMjU0YTNiNGU5OTIyNjhjOTE1OQ0KPiBiYzE1Njg3ZTU0NzE4
ZGM0MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5p
dmVyc2FsX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xf
dW5pdmVyc2FsX3BsYW5lLmMNCj4gQEAgLTI1MjYsMzAgKzI1MjYsNjIgQEAgc3RhdGljIGJvb2wN
Cj4gdGdsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkKHN0cnVjdCBkcm1fcGxhbmUgKl9wbGFu
ZSwNCj4gIAl9DQo+ICB9DQo+IA0KPiArc3RhdGljIGJvb2wgaW50ZWxfcGxhbmVfZm9ybWF0X21v
ZF9zdXBwb3J0ZWRfYXN5bmMoc3RydWN0IGRybV9wbGFuZQ0KPiAqX3BsYW5lLA0KPiArCQkJCQkJ
ICAgdTMyIGZvcm1hdCwgdTY0IG1vZGlmaWVyKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9wbGFu
ZSAqcGxhbmUgPSB0b19pbnRlbF9wbGFuZShfcGxhbmUpOw0KPiArCXN0cnVjdCBpbnRlbF9kaXNw
bGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShwbGFuZSk7DQo+ICsJaW50IGksIGZvdW5k
ID0gZmFsc2U7DQo+ICsJdTY0ICphc3luY19tb2RpZmllcnM7DQo+ICsNCj4gKwlpZiAocGxhbmUt
PmlkICE9IDEpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCWlmIChESVNQTEFZX1ZFUihk
aXNwbGF5KSA+PSAxMikNCj4gKwkJYXN5bmNfbW9kaWZpZXJzID0gdGdsX2FzeW5fbW9kaWZpZXJz
Ow0KPiArCWVsc2UgaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID09IDExKQ0KPiArCQlhc3luY19t
b2RpZmllcnMgPSBpY2xfYXN5bmNfbW9kaWZpZXJzOw0KPiArCWVsc2UNCj4gKwkJYXN5bmNfbW9k
aWZpZXJzID0gc2tsX2FzeW5jX21vZGlmaWVyczsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBz
aXplb2YoYXN5bmNfbW9kaWZpZXJzKTsgaSsrKSB7DQoNCkFycmF5IHNpemUgY2hlY2sgaXMgaW5j
b3JyZWN0Lg0KDQo+ICsJCWlmIChtb2RpZmllciA9PSBhc3luY19tb2RpZmllcnNbaV0pDQo+ICsJ
CQlmb3VuZCA9IHRydWU7DQo+ICsJfQ0KPiArCWlmICghZm91bmQpDQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKw0KPiArCS8qIEFzeW5jIGZsaXAgc3VwcG9ydGVkIG9ubHkgb24gUkdCIGZvcm1hdHMg
Ki8NCj4gKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKGludGVsX2FzeW5jX2Zvcm1hdHMpOyBpKysp
IHsNCg0KQXJyYXkgc2l6ZSBjaGVjayBpcyBpbmNvcnJlY3QuDQoNCj4gKwkJaWYgKGZvcm1hdCA9
PSBpbnRlbF9hc3luY19mb3JtYXRzW2ldKQ0KPiArCQkJcmV0dXJuIHRydWU7DQo+ICsJfQ0KPiAr
CXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KDQpJdCBpcyBiZXR0ZXIgdG8gaW1wbGVtZW50IHRo
aXMgZnVuY3Rpb24gaW4gdGhlIHN3aXRjaCBjYXNlIGZvcm1hdCB0aGF0IFhYWF9wbGFuZV9mb3Jt
YXRfbW9kX3N1cHBvcnRlZCgpIGZ1bmN0aW9ucyBhcmUgaW1wbGVtZW50ZWQuDQpJbWFnaW5lIGEg
c2NlbmFyaW8gd2hlcmUgYSBtb2RpZmllciBpcyBzdXBwb3J0ZWQgZm9yIHNvbWUgZm9ybWF0cyBi
dXQgbm90IG90aGVycy4gVGhpcyBmdW5jdGlvbiB3b24ndCBiZSBhYmxlIHRvIG1ha2UgdGhlIGRp
c3RpbmN0aW9uLg0KDQpSZWdhcmRzDQoNCkNoYWl0YW55YQ0KDQo+ICsjZGVmaW5lIElOVEVMX1BM
QU5FX0ZVTkNTIFwNCj4gKwkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRl
X3BsYW5lLCBcDQo+ICsJLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXNhYmxl
X3BsYW5lLCBcDQo+ICsJLmRlc3Ryb3kgPSBpbnRlbF9wbGFuZV9kZXN0cm95LCBcDQo+ICsJLmF0
b21pY19kdXBsaWNhdGVfc3RhdGUgPSBpbnRlbF9wbGFuZV9kdXBsaWNhdGVfc3RhdGUsIFwNCj4g
KwkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9wbGFuZV9kZXN0cm95X3N0YXRlLCBcDQo+
ICsJLmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jID0NCj4gaW50ZWxfcGxhbmVfZm9ybWF0X21v
ZF9zdXBwb3J0ZWRfYXN5bmMNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVf
ZnVuY3Mgc2tsX3BsYW5lX2Z1bmNzID0gew0KPiAtCS51cGRhdGVfcGxhbmUgPSBkcm1fYXRvbWlj
X2hlbHBlcl91cGRhdGVfcGxhbmUsDQo+IC0JLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hl
bHBlcl9kaXNhYmxlX3BsYW5lLA0KPiAtCS5kZXN0cm95ID0gaW50ZWxfcGxhbmVfZGVzdHJveSwN
Cj4gLQkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGludGVsX3BsYW5lX2R1cGxpY2F0ZV9zdGF0
ZSwNCj4gLQkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9wbGFuZV9kZXN0cm95X3N0YXRl
LA0KPiArCUlOVEVMX1BMQU5FX0ZVTkNTLA0KPiArDQo+ICAJLmZvcm1hdF9tb2Rfc3VwcG9ydGVk
ID0gc2tsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkLCAgfTsNCj4gDQo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBpY2xfcGxhbmVfZnVuY3MgPSB7DQo+IC0JLnVwZGF0
ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9wbGFuZSwNCj4gLQkuZGlzYWJsZV9w
bGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2FibGVfcGxhbmUsDQo+IC0JLmRlc3Ryb3kgPSBp
bnRlbF9wbGFuZV9kZXN0cm95LA0KPiAtCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxf
cGxhbmVfZHVwbGljYXRlX3N0YXRlLA0KPiAtCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGludGVs
X3BsYW5lX2Rlc3Ryb3lfc3RhdGUsDQo+ICsJSU5URUxfUExBTkVfRlVOQ1MsDQo+ICsNCj4gIAku
Zm9ybWF0X21vZF9zdXBwb3J0ZWQgPSBpY2xfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWQsICB9
Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIHRnbF9wbGFuZV9m
dW5jcyA9IHsNCj4gLQkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3Bs
YW5lLA0KPiAtCS5kaXNhYmxlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfZGlzYWJsZV9wbGFu
ZSwNCj4gLQkuZGVzdHJveSA9IGludGVsX3BsYW5lX2Rlc3Ryb3ksDQo+IC0JLmF0b21pY19kdXBs
aWNhdGVfc3RhdGUgPSBpbnRlbF9wbGFuZV9kdXBsaWNhdGVfc3RhdGUsDQo+IC0JLmF0b21pY19k
ZXN0cm95X3N0YXRlID0gaW50ZWxfcGxhbmVfZGVzdHJveV9zdGF0ZSwNCj4gKwlJTlRFTF9QTEFO
RV9GVU5DUywNCj4gKw0KPiAgCS5mb3JtYXRfbW9kX3N1cHBvcnRlZCA9IHRnbF9wbGFuZV9mb3Jt
YXRfbW9kX3N1cHBvcnRlZCwgIH07DQo+IA0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
