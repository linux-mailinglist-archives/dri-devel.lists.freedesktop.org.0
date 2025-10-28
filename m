Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807DC12B79
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 04:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C6410E1D4;
	Tue, 28 Oct 2025 03:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iShMUKFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3F710E1C8;
 Tue, 28 Oct 2025 03:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761620787; x=1793156787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wSPTRZ4loZ0PpPpxn86vXd86iak38HQWIVEAwX83WEw=;
 b=iShMUKFFaNbOnymk/Pvc+dojJdpVm2jFhdeQn8FR1RdIgoS7SiwuoAbm
 Sm3VK4ZR4PLrXrGGDr/a7XyKKVXq+h5Jhe5dcPcC71fjoukdNpFIbSA29
 /J6QLAGdzroxuqmpOUJpt1GWUPkAPaWDUK1GcHMUzt/rx4hVbYxuNeR4k
 kjCYbmQzW2U7f6lf0S0pobPBrrBoHfys1FCP5J5Itkc23nr4h6aB+QHR2
 ue6qIM9ffXeb6hKKCv73cr+H1jJvTziEnUHg+iE2oMkYHicn1glIeyEhr
 qWiodIjTF2xkErJ4hyboe8r7g/QueDnJTPpkjFSMZH9XQAKLmSTsiFUZa Q==;
X-CSE-ConnectionGUID: JZOwj9toQ+iRdKyfih1OAA==
X-CSE-MsgGUID: cZ/Qo36+T+KM5UoH8vCr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74387421"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74387421"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:06:27 -0700
X-CSE-ConnectionGUID: WI6EWyoNTgCEyRaHeRjK7w==
X-CSE-MsgGUID: 5+yMA1TcTlm1IFYjo27D0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184923017"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:06:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 20:06:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQPK6G4yovib4jrJK0C87aMJKGqC07JMpNeAU7H0UYW5j9ti/qmTh8awu2Dm2N078vg1JveqpZ4jjfyGe+l+RJk7paw/OZmITLal+viPgQ3PDkjCZiTHGnBnglma2OPcR27Me4V6IF8tINMMCuwL+SAcT3WiKT4j9Zlp69Ih8EykUbaD+6oJNXlJSNMgmCnB0cgI//5S4J8TM72fl4yl9T3Q1Eg/uKzx1FWl84maKGgn0bAzi30JSp1fbUJxr/eJvI9C+RLgmBkcLnc45lizJHqGkMZKPvMn8r+6S7rz9AiPsxYnI02MMC9bHAXkniX3lsM7cPrXXT0eMRah1fmd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSPTRZ4loZ0PpPpxn86vXd86iak38HQWIVEAwX83WEw=;
 b=n7qiQ47ro6hecwxZuR/5+G5r5e5gLX1cSSWLuzvLtzdTjNL1KdgAogCAGkWKXbijb8KyBwpHj4dvkDEZoXsw8wr8c0/0RGQ4GQbgoP9VOdeGXN+wvv7KcjFwpR9OuQ/P/9+Yw1YPohkHBO4fYvlMlC3QuDq9RnUfjnyOYrooYNYV+xoOEYA35IOFmwQ7YqnvBwa7pBp4M1TS18hRmeNgMDk3r/thjPfMN2OfyAHy6JZdkI8mcMXvuOQDTzVJRCtmp+MVyq+1C3wXB8Fo1cjJGt9T1k8j1i6leqBC4jfCsrRlwa7CxBN82aN8XgNYW7UCv/oVBpehhHEISqG9OCIaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 03:06:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 03:06:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
Thread-Topic: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
Thread-Index: AQHcQtv5nY6pGc8ytkyTHEcAWL8IbLTW4TIg
Date: Tue, 28 Oct 2025 03:06:14 +0000
Message-ID: <BN9PR11MB527672ACB8C157B343DD17DF8CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-4-michal.winiarski@intel.com>
In-Reply-To: <20251021224133.577765-4-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM3PPFE50071912:EE_
x-ms-office365-filtering-correlation-id: 5e907f40-c3ad-48cd-e146-08de15cef4ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aXFGOFpEcWdPUGJhSHRzN0p4eUEyS3hweTNBLzBTanVJTWVjSzhsa3hRMHJI?=
 =?utf-8?B?NlVNNlBOSm14NzcvOE1FTk9NNS9qOW1mMVc5OVlKOWtiVys0cU1CSTZuZlBu?=
 =?utf-8?B?cDQ4TCs1NXR3SkNwYlcvUzFkMzVob2NlZUFZOElIRFBmVUJvcTkrRlMrZ0pS?=
 =?utf-8?B?ajVkM0swRUN6M1BnWWltUlhCQWpWa3Q5dUVWa1k2cHVXNEdCM2laMnY0L090?=
 =?utf-8?B?d2NWMkJKajdxd1dTaTA1QzNoRVBrVk16ZTMxNjViZU5DR29aZnM3RmdJT3Rp?=
 =?utf-8?B?ZkxvRUFQWFdZRVk4MTBVUjhmeTEwNGJCVGNmMFdaK1NsT0tGbG5qaTdxS2Fh?=
 =?utf-8?B?UGFoUVNhM0xrdVNYa2RxYmxKUCtIOHBaNlBwbVNvV2NqOEFZcE1OM21OVHNp?=
 =?utf-8?B?WWtPNzhzNUNvYXBBZW84Z1lpaFk4M21ETDJ1cyt5bDdxdGkyMWZwYlhUL3hD?=
 =?utf-8?B?d3N6RDV0NDJ1TTBRYnRiNktpdk1PZXlrMTNDUnJDajVCM3M5YTgraCtreE1p?=
 =?utf-8?B?V2NxbWJ6RmpwaGNETzJucjlNQWhPNzlwSFc0TGZzdFFCV2RKT2ljTURZMnVL?=
 =?utf-8?B?ck5DRHJTNUkya3N4cjZ4SlFMWGFxZjFPVzZhWnVMSUpqZUFkR3ZZOWJRTS81?=
 =?utf-8?B?bkM2UDd1NFc3cEtrY3N6a05wbEJ4K2pKczJNbmFrdzBiK0NtS2VxWXNlQ3hZ?=
 =?utf-8?B?alFhTTMyTkViUTMyT1BGaG9BRnZzUUxiWDRHUXhqdC91VXJvWHplR0RxVWFu?=
 =?utf-8?B?RUo2eDR2RFoxYXNsVzNaTGhhVndIR1p5N0JaUjNlSytkVm9CZ1dvOVJWWGE5?=
 =?utf-8?B?cXlQSVJFOUtmSFRBR2pJc2U1S2F1ekhKc3pYWGVPNEg5TUd3T0VJT1Fzck1F?=
 =?utf-8?B?ekNNektBeVJWNml5U2gvTlFkSzFRT0RnVjl2TTNhaEs4T1pvUzVZZy9TUVhQ?=
 =?utf-8?B?WVVoZVFIZzllUDhwRjFGZFc0MWF3OHVIZlFDT2Qwd00waVNnVUtaV1dYcWJS?=
 =?utf-8?B?RWUreThpaE05d1Y0Zm5FQytvcDlNbnhHM3lSbFhiQ1ArMFBQdklHQU1CcGpp?=
 =?utf-8?B?MkgrSTloMlZsaWhEdURuYWZXWjZVSDBQK0RBTXI1TkVscnRMVktPOGFENDVq?=
 =?utf-8?B?RHBwK29vbGovZy9LWCtQbFFZSmdzQ3N1eEJhVzlmdVhYclI4OXdsWERobVNW?=
 =?utf-8?B?SUIwYXkvRklRRnFZbmhBNzU0TUx5Z0hWYXpyYlMvR2p6WmVWY0dPVVV6d1NM?=
 =?utf-8?B?M1RBZlF0VUJHSVg3MWI1bXJJZDg4cmJ6bldkM1h0ZWJnbkhlTWJpNzN1M0lE?=
 =?utf-8?B?NlAwVjJha2lmb080eUg5cFlqWVZYVzN6bW5SbHpkYjN0U2s5a2x6YUJvSzNL?=
 =?utf-8?B?WkJNcjNNZWtDdGVIL2c1dnM5RkFDZ0xpSnZyY0pTTTV5bnFOWXNEeVByMExN?=
 =?utf-8?B?L0xFTGJ3eWhwMlNleDIyZGJ6dmQweVBrOTdES3lvTjJIZ1dkVkZQajFlVkdL?=
 =?utf-8?B?M3JYVDZ2anhlOThRN1phb2ZaSjFybGgxclhtNlgvMjFteFdMektvZ3FDajdW?=
 =?utf-8?B?L0dYMklIZ0hqNDFDdXhhWUplOVpDd2F5Rm8xeXd1WUdDNk9GUHJJSGpXdmlj?=
 =?utf-8?B?UHBkOTdHV2Y5aVpEOG5hSHA2Q3g2bWdZUFZSR091eFdxTW8wUUpramRMNk5F?=
 =?utf-8?B?aEZWcklIRDNZNCtOVVZRam5WQjRnK08wVjYydVI1b09IUEsvMU5XQU5talBs?=
 =?utf-8?B?bmJjYlBvSlFONXc4ZGdiQ3pvdXdCdjBwaXo4c0ZESGZad1ZLYnhFd3hxSUx6?=
 =?utf-8?B?Q0N0UDZnMFNpS3J2cjFUQys3UXBUUUlXM1dtWjRrR3lrVGo0RzVEMlRsa3F2?=
 =?utf-8?B?UlZZdmtqME45Z0VxQnRMYkx5cHhkL3ZsOG1YK2VqRjczZ3A0OGZOR1o1U2NT?=
 =?utf-8?B?VGNSdzdMOFRCWDRORVZtU1NTZlFTYXgxQ01uREU4SXBGM1Z5WjcrdytRZ3p6?=
 =?utf-8?B?OG1NazBFZjE0UkVxajIxS1VZUnh0RmNFUFBvbEpYNzdFMGVScno3TVAwZWFj?=
 =?utf-8?B?UE15c21rUzVzTG1UYVJZUHhGelFiY1c1cGQwdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S09lUWV4eVFnRXd6cWE1SFYwOC9sUHI0UkJNYkF3VjA2VU5lZEV4RmsxVFBo?=
 =?utf-8?B?eldYV1FMUlMzbHI2MTNqQTVkQ3JLeHVBNVl1bTM3VFNMRXZGZGpUUmphM0RM?=
 =?utf-8?B?RjB3a3M3dk5LRVdkNFo0OE01NUZVN2pQd3FNMTI3em16aXR1VHZSV0FWdnAv?=
 =?utf-8?B?Y05TNEVNSm9vcVRlMk1aRUs3SjJNcnFTRkJrVWtjc0FQVnBiRHF3bE1lSFoy?=
 =?utf-8?B?MDNXTUxMZ3llY2hHeU9UNk14MkU3TUVDZXBVOWJkdzdtY1ZSeUlkSmltVWhW?=
 =?utf-8?B?U25hcEkzMHYwa2tOUExqam1heWdpenU4Wm40SFRtcVlZMWtLbHVVK2dBUTVq?=
 =?utf-8?B?VGphbVpxZFUxbkRXQ2ltVVZCUnhnMGVLTTR4eGg0Slg0UzBhY3ZmMUlYRFp1?=
 =?utf-8?B?S2xQTGRybEl3VWVQdnpkZ2NNeXAxN2ZWZnZVZjZxbG14WjBZNTRhZmFUcEl1?=
 =?utf-8?B?bjdYaGxVSVMxT1ZOVU5uR1ZpQ04zZVgrazRRUjA3cjBTRG9OalBzUWFaVnc2?=
 =?utf-8?B?SEM2amFBSTJ1QUxOdEJFNHBBenpscnZjc3NxUzUxUnlVc3AzRFZQNlVBTGxa?=
 =?utf-8?B?dGs1QkNNcCt1cldsbDlDeW4yclhUZnZFT2dud1YxcDZnamtVV1ByYXowdzdv?=
 =?utf-8?B?ZmJNeG1xMmUycEtlYlJkUUx1SXdnTDZwWnFuVXJjZ1Qxd1FZcnFsZXRqQWpy?=
 =?utf-8?B?RE5kVkFhd21QNkgxbmpTSlBQMlVCSHBiTjVnQkM3RFYxTHlXc21JTEZIaUJO?=
 =?utf-8?B?SzFscU5HQjRYMGZvaU9POU1LY09pSERHdFExVGhCcjdlZG5VUVEzZDIrWm5G?=
 =?utf-8?B?cnR5dkREc3lEclR0V0doRnJkSnlYRnl2UEVkeERhUkZqMGR2ZS9rc2R6bnNR?=
 =?utf-8?B?cm9abnpkTzZwVStVS2hDd0pUV0JXQmRxS2NTNkRZMVpGeG1Dem43MU5wR1Ey?=
 =?utf-8?B?VTFQVTVsV2FxMGNCVWI4bUg5M1VOTWpUY01ZcjBkcUtZY1dVSllHU29WT3Ns?=
 =?utf-8?B?VUdpR3I3cTFpUVBTQVNTemtneFV0NHFFYzU0Y2loM2FYNURmelQyL0FvZEdE?=
 =?utf-8?B?SjBGYXBEWGR3bzdEeXYxbHFlZjR0eS9Jbkx0NnU1YXBMUzhpVGZWMFpMTlZ6?=
 =?utf-8?B?bE9PMFZkc0JuQk1QUkRXOEl4blhHdWFGWGhsdUlGTEZZWkN5RFc5aW41aWRB?=
 =?utf-8?B?RWM0MVd6TmpBNjNqZ2Yxa1pwR1QzQ2pmZGNTT3RBM21vdHdHK2ZuV2t2V0ti?=
 =?utf-8?B?QjJmRXhJVHQ5aWg0ZzZJTTUwT1IxSVE3b1NvaHZRY25VRm5sNDRhNEI5R2py?=
 =?utf-8?B?V2tpUmZkd0lJWEJmd0VZOElRMUhMczlodit4SHFhekVlNHljK2N6c3RZNUZC?=
 =?utf-8?B?SWc3QkdKd2FFM1NRUXBzU21ubXdxK3krQVlxb293WE5aaktkQlFXRVBOUnpa?=
 =?utf-8?B?ZC9HL3RWa0dNSUlGSDgvTzVBZFJWRmJIeGRwYzZNc2hTQ2pYS3VXMGEyRCt2?=
 =?utf-8?B?YnlRL1JoeHZ0SW9rNW9JYVZFY3kvcjNVQTI2U25XMGNMclhCSDhJSXJWTHgx?=
 =?utf-8?B?Wk5tK3NuV3MwT3J2RjFXdFREUXJqYTlkNkpBTzRGR0NpRG9iYk1Wam5CUUdx?=
 =?utf-8?B?NFRhV09xVDdISHRxYXd6SDFTaENneVhja2N1WXJQN3EwdHlGNXVPd0dncjEy?=
 =?utf-8?B?dG82WHNzTUFmbFRTYnphMXVTelRMZS8zZHUyUzNaNUYwRWhLQVArQnBETFhJ?=
 =?utf-8?B?SG9ybWF1V2R2c01UaU9paklUMlA4eVNncjJ2N3lrdzBxMW55clRaZmpnOFM2?=
 =?utf-8?B?YzhIRmdPSTdmUEhQa05kQW1SOGxjQVpqaFlxck1ISnI4YnFLNlFHczRaVlNZ?=
 =?utf-8?B?c042YjJtSGd0ckhtMlVuMU9EL0FFRm0yV2Q0TVpJbUQ2VXRjZ3p0bFdwTTBO?=
 =?utf-8?B?aWhwZU4xMlF4NFBZaUN5blBrUFZ3OGJTbnU1RjNqTjVqQ3pWUVY1Q3lhd0tv?=
 =?utf-8?B?akh5NjJQUXg4VEJsaGtBK3VJTDYyU1FPZzgxZFRpU21oU0dkR0VXQ2Zya2NI?=
 =?utf-8?B?RUk2cHV6VjlvZEVpcE1tekFJREVTZHFmWWJiWlNVRU9tcU0yb3hUOFU4VXVB?=
 =?utf-8?Q?jEKWSoZIphscDr4FqcA9CprGk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e907f40-c3ad-48cd-e146-08de15cef4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 03:06:14.9698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYrzDMWHqQJPG7T/Ck4feoM1ppXRGeVifZ3E7pKs33pfH7+9b45nhBT/W9xWa/zCwmivLfRqq0Zv+7q3DHgpFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMiwgMjAyNSA2OjQxIEFNDQo+DQo+ICtpbnQgeGVf
Z3Rfc3Jpb3ZfcGZfY29udHJvbF90cmlnZ2VyX3NhdmVfdmYoc3RydWN0IHhlX2d0ICpndCwgdW5z
aWduZWQgaW50DQo+IHZmaWQpDQoNCnRoZSBwcmVmaXggaXMgdG9vIGxvbmcuIHhlX2d0X3NyaW92
X3RyaWdnZXJfc2F2ZV92ZigpIG9yDQp4ZV9ndF90cmlnZ2VyX3NhdmVfdmYoKSBpcyBzdWZmaWNp
ZW50LiANCg==
