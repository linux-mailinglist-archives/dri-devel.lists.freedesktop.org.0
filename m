Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB25A1FF56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 22:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CA010E22B;
	Mon, 27 Jan 2025 21:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx5ftM2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340AA10E22B;
 Mon, 27 Jan 2025 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738012529; x=1769548529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v7Mro5tojAMrhme2Tda/+rWBSDkjiSJEGnDPa2uvTkg=;
 b=cx5ftM2LDcWelYVdfEJEQNv0Hk4qu2wKhVunScN8VuAjCuofne60hLxA
 r/fTKaZpVVETjwl0rb35dvjrFovjvm1y0QBYRarqokwYvCA3d0wRUwAVY
 cECtwV819CwtSHUDHibSzTPBbRCfBgbkMr41NVMtCdx0yf7bwzKiW5reO
 nlpSjfYb8SkVSjnFRoFO8WEE4cJQjp+ZD8BC2cMG2csFPnvW2Fz+wpSGL
 OVfiePfNqMRMbanqNIjxTgPWZXUqeGW8vNNAd2unKBnww7KD0hbf4gVGB
 iqZ/pnQ5BNm5ICG0bK3qYigVtp4sGXUlclGzf+3h4tk28ieyKIpvE2kP6 w==;
X-CSE-ConnectionGUID: W3xDHciGSXeX/iTx3cgqyg==
X-CSE-MsgGUID: JU4o6Ak1TSKXZDLfrGlK9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="26088864"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="26088864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 13:15:25 -0800
X-CSE-ConnectionGUID: dohaBsn0TkWHJHEXSAE1Vw==
X-CSE-MsgGUID: 5BLOOCvrSsCbeeY73bXYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108354400"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 13:15:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 13:15:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 13:15:24 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 13:15:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwcS1vRTgd9y4/1E1K9u2086xyonaX+AqGOcxh0Q3KHIw2NBP930FKy7A2a9wRifM++P2I3YcGf0NU27maYqZEPSjpduwva87SzktrxBR45f56JHB/FBHjmMAVLnNJfB3KJQty/BCZJkCkahtLN5eOBxK7Srj+4mCQKt+HGbYv0NiDgbF/rzPdNni9KdL7HkSf2Al87DZioOzSkqJez17frosBS7WUfNWM7svYNJhC/GtU31o1Y9xDnluDT0T0yG8ai+66/10HDsnaHrBJ+Qr0ktQezRa5D5CXPUa8qaPy8HY7+y+3cgOvmz2isQZRF5EmI+vyQrop9oecv9V7XRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Mro5tojAMrhme2Tda/+rWBSDkjiSJEGnDPa2uvTkg=;
 b=LszY5b9zilDqlhxHUWJ8RG1fR0X6HC2U2q+tHmQdyIdh6mB3RUcewGZ/h/BtLCpHsviP9lySXPRRHN3k+G/3jAZE+551GvMNAy4h9konIURHEEVbeybkeDjedEtnqx/5S9ZIcj0NBAr6ps5cmP5PrdOYkTyFW9Dua+D1Q3oMbabhGlJPOfRibLHE02iNeTBoqaPYI8S+Slu3V9m8Lp7hKL2F3ZheyaZuPw/QOPOWBjLC6EL9dsFnIrcBEclktMWCAolntsDN8eh72pAMNs4fOsI/BrrHftry0QxrCVMcDAFQQNnd3/mRi0f6yn/rUG15nzosWGAh0JQPLxKLt5x4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 21:15:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 21:15:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Brian Geffon <bgeffon@google.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Srinivas, Vidya" <vidya.srinivas@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Tomasz Figa <tfiga@google.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
Thread-Topic: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
Thread-Index: AQHbcPwx+9rwAJZK7U6RoBnFXO+wBLMrHroA
Date: Mon, 27 Jan 2025 21:15:21 +0000
Message-ID: <CH0PR11MB5444F718F2073C04D7F5729AE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250127204332.336665-1-bgeffon@google.com>
In-Reply-To: <20250127204332.336665-1-bgeffon@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6787:EE_
x-ms-office365-filtering-correlation-id: d3e08255-ef4d-464c-f8b4-08dd3f17b53e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WStQNGFTekhad3N3amFWS1M4dURoNDQ4aFNTbkozYjJVcGYrdkdrRG5GWnhx?=
 =?utf-8?B?TmE2SWI5OVFNMC9mdUwrYUkxOGljeHJ0YjI0UEhtVEFzblZnRHFMeVN3K1VM?=
 =?utf-8?B?SHNQa2t5M25FbEFyL2RoSEFSTnZCaXNYUk92OTRoMVNkQTR1OWlUdS9FZVJ5?=
 =?utf-8?B?Tm80YzRES21YQm93NTh2UHhOak41dCtDeHdEYlZFSmljV1Fsd2w4ZmlZOFl0?=
 =?utf-8?B?bUtwNTJwZXlyRitDSXIxNC9malJKblpGL1pXYU43bERsWlhVa05FRnZ0VkNL?=
 =?utf-8?B?aG5LNkRtM1BDbHQxRmhRY2k3aGNNRUE5WjN4R0ZDYzlHYWZJUHU5NWhMWDRB?=
 =?utf-8?B?dVd5b3lOVEdmWVpCNzRzTmg0U1ZDb0FqU1V4QWd1OG5QQjVzR3MzM3h0bFp6?=
 =?utf-8?B?QUtGQ3lQTmR0V29ZMUN3bm96c3VrZjdhUUdWem1lSmFrN0JGVWdSUERQcVVX?=
 =?utf-8?B?aHJ3TFRwRzdHd1J1akIvbWtJVXFqWUJVNjlHSXRlcEo0VFJubDd3WU9oa1ZZ?=
 =?utf-8?B?MFA5eXJTUFRkZUk0K3A2VjBPNi8yNVdSZ214aDR3ZU8xcGp1ckJEdWdyS1E3?=
 =?utf-8?B?azZVUVZ5bm01MmwrRTVNdWpCUE5vbUFNNTI3OUtkQjRXcE5UVWJHN1Q0QytT?=
 =?utf-8?B?bkNqa1BUdXFnZS9tcnkwNk0zdENjUkFicUFHKy8xSEUzY1pSUWtxZ3pGRDFN?=
 =?utf-8?B?R3hnNStZcUdtYm5SdlQ5WnFBTGVsMExEOWlVU3lQUHRFUXlIeWdyRUJuUzUy?=
 =?utf-8?B?b3J1Zmpqd2ZleWV5ZEJRUnVWdkxmVngrVENFU2tVcWQyUFV5Mk9KYkZpcnU0?=
 =?utf-8?B?WWdYbGxNYTZTMVFoZTUxSUIxZi93VzQ5cmk5cWVTeGc5Mlh3Rkczc1lmWlRj?=
 =?utf-8?B?clFBRWpUZE10U09LYy9YQVoyM2grU3d6cnVMalNpKzNxTk1EQlh2dGp3ZFBv?=
 =?utf-8?B?QXIrR3paL1gxa1VKY3FaY2QwbnQvb3hSVVRwUjFsT3UvTVFwaUVQdGkvWUM2?=
 =?utf-8?B?eG0vdVJOVlNOZUhFaUJKU082ak1XcGJ5eTNFTkkyNlUwWFhlQVJuMkZsMEVS?=
 =?utf-8?B?S2lVb0RQU0JIc0FQZTBmNXRnTWNhVjllV0JLWnFDbjhxL1J1VHJaMjlrcWRI?=
 =?utf-8?B?UXFSZ29reWdUSUNReGxyWnpvYllHTFpkS09iQm1USFd1aFc5YzNiZXhrek9X?=
 =?utf-8?B?dys2NDZyVVhSby91U3NuVHh6M29qOHRQZWI4ZTZXbHF6S0gwWnEwK1VOOWdM?=
 =?utf-8?B?NlNnNU5xTVkxbVRJbFRzbEFxTnhEOTVIMGhRL3FNZTkzUENtK1ZRblNEZ3Jq?=
 =?utf-8?B?cEc5T3pvNHBWRmdMTmYvZU1NZ3p4dmdhVXpGNzhJQmxUVGlPMlREa1FnM1h2?=
 =?utf-8?B?VjlhK3gzU3pZKzBKQm1tcmVkVTRtVnlGSTBLZHRmYTdvc2dGY2p4c2ZKa1Zz?=
 =?utf-8?B?Ums5dVk3dC90RHp0YmlKbThSaXl3V3ptN1FOcDlOMGFQUkZDYXJxWXQ5T3RT?=
 =?utf-8?B?TTZQYzFkdmI4aEkyUUFEeUNMWkl6MzNCS0piWVRrdW1hUmtxMHFWMk1NU3Rl?=
 =?utf-8?B?NjNrZTNZamtoUXViNFlaY2crVXcrcSs4Z3lqYUw2UWw0MksveUxsanRCNEtD?=
 =?utf-8?B?cU9aN2Z4Z0JXQmNhZ2xvczlhOERReTcyOS9OeXk5TE5IYkNIc25Vdzk5SUph?=
 =?utf-8?B?aklWOEFXcGJHR2VKTGpuOE9MT3FUQzJmSHduUWFjczJlbHBIRjUyVjdJOVJJ?=
 =?utf-8?B?V0gxSjJ1VldTNzN3OGpLa0dIRytXL08vUWdqa3pqWWxERmRGUkhVWmJ5cml4?=
 =?utf-8?B?eHJQbnhUeERjY3Y4K1BWSDdiSU5LeVN6TFZhZG5PV05ibXhjZ21NdTA4VXhL?=
 =?utf-8?Q?jjDR55mOd4gNH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHUrdWwreG1hN05Cc3haWnh2bVlKdTU5S2VISld6SjZZT25ZbkUwWExDNVhY?=
 =?utf-8?B?ZlJrNFZKYnQyKzNlZlpEcXhUT3h6cmxrTEdaMkdsMURCNG9OUnlMWXpMUFIw?=
 =?utf-8?B?YzYzL2M5SU5OKzJkSm9hVFdpY2YzaW82aWZORVJvejQxMFBmOVptNDZhanJx?=
 =?utf-8?B?UnNJZGJLMklLWmM5dlNoK2UzMGlyYVUwdG93SXBrRUMxRTI2MW5waUV2OFlu?=
 =?utf-8?B?Ky9ER3UveE1WSWZFV29iU0dzNkxEM3VpVTduUWpKditQZ3NmaTdvNXhTb2F2?=
 =?utf-8?B?UHVJM0ZvNThhYXdzQ1BNZWN3bHJFN0V1YjJDdm96b3RsMElOQjlEWXZJYzBw?=
 =?utf-8?B?RTVHL3VWN2RlL0N2cWpzWjZ5Y1NUeEVkUzFmanBvWmxyYVlJQjl2b294bUlJ?=
 =?utf-8?B?VXNhMlNLU0FTbEczV3FsYVZRTTY2Q3B4cDBCaFFwN2JXKzNGQ3lIZld1RGtO?=
 =?utf-8?B?S2VCSmErWmsveFdQWnVWblBOVmJoUDJnTzU5TVpGdy92eEhtTXUzNVoxWG5D?=
 =?utf-8?B?ZGQyMWRzR0cyTE5WUW8wd2xZVDZucXMyOExyOTRodEpFNUFPMlp0NTFDYzJi?=
 =?utf-8?B?WFNWKzVvaEFZM1Y0UEVFZlJlYnNMVldOWHVpbFFmajlZSURiUkdsdzZZT2h2?=
 =?utf-8?B?cXR5NWxBYXg2cm9EQjRFTkl5dXBFQmdPNWxscVFFbGJtMGxHVWRpSnJFU1ZF?=
 =?utf-8?B?NVdDZVhaQ3lkVXpwUU5IdlNkdG02OTJMWkE2anpaMDFrb0pHYWJuL1c5Ymhs?=
 =?utf-8?B?VmliY1ZJUjZIdWRHdW1IUmFLbGxZdlcvQW0rRzZYMko5RUU4SnN0OU4vZmNm?=
 =?utf-8?B?YmczQ1RKREI4RlEwU3B6SkdXVzc0TUNtaXRpNFhBblNlY1lrbFl6ekhmWWtR?=
 =?utf-8?B?NUJiR1VOR2NLSWdxakJuSXRaWFBvR0M5cFlnMGdNaGNYTHpTOXJQNlZXQS9v?=
 =?utf-8?B?TGUwSGJiaTRTVzNTUXdkMUFibXVjTVNyTjlEYnh0WmxLNHJZRjBKWVFCMTNT?=
 =?utf-8?B?OXR1SHZxT0tQK1hOOWxFSFpuTGNtcDVWbVlab2UwbTF5dlFlREVoYjFTdkdk?=
 =?utf-8?B?bktYTldyVWE3bThpUy9nTlBxZVl4RVBpMjNEUStncE0xWHVEcHFrTE51U3Zo?=
 =?utf-8?B?aDNXL2ZMYkFZZGdyQ2J3ZjVxeVFHeEg5VW1OczBwWFhudy93U2xlNk9uQlNU?=
 =?utf-8?B?ZEFidnA5NzYwa2M3VzNDMlcvOVc1L0Y2dU9ocmdFdy90eHM5a3hNdVVEK2VK?=
 =?utf-8?B?NUFZWGhQUGdEVVFZeTJpaFVyaHQ5b05Eanc1YXZYRUhxWWg2cXlFdzhQUjBT?=
 =?utf-8?B?eGNOejdha2dPRXFWS1hyMFVDa3FkMjhhN05PeFFBL2ZWZHlsWmlWWDMxNjBK?=
 =?utf-8?B?eCtrZ3BGdERJR2RIc2JFWkZoaVNhdkhlaXEzeDQ5Tm5xVE1kb0RSVUhNbEUz?=
 =?utf-8?B?dXg0MUp4M1Ric1hCMjQ3REZkdSswQUNTSk1OY0VUa05hSFBFbW9PenBSZlp3?=
 =?utf-8?B?Sll4VUNidUE0L3IxeFdoN25zenhsSnJwTGhvNWFsQzdoTDdVNGw5ZVpGSEVN?=
 =?utf-8?B?YXIxZmN2TytSbXJ6WlVKUEF6U0cyWkF4TmFMUU9LSVI2UFpIaFNyL2Z5UUt3?=
 =?utf-8?B?ZlIwNGoxeG00alNTTEpGUTJoZW9JZllrTFdiaTdEY3dTU3NWeE05bEFybUFu?=
 =?utf-8?B?blQ4c1UyMnY1dTdsZW0yYVdRdHBmdyszYjVKWFFwdDJXUXNjTDZZRmZoT3Z5?=
 =?utf-8?B?ZDh4T1NLRGUyd3dxazUzaFcvdjVRZFJpTUVodUR5TFkwT3NlU1BtVHo1UGlN?=
 =?utf-8?B?T0VBbWZyYlJveDlpYWdOQmVWZ3NoYXRYTC82NXJoeU94Q2MzRVp6REQyZTlz?=
 =?utf-8?B?RFE4aWpQU0xuWEtjV3RoaFY1T2VYV0NEVml3L3o2SjlIM3N6M2tsOEN1aUFr?=
 =?utf-8?B?cjJMT3FUVnVSRlVGRCtPVWpBdVBSRkxENGQrWFFOT1NvM2FUZUFqY2I0UXpD?=
 =?utf-8?B?L3Y3M2Y3Z0hOMGo0T093WitRQ0UyVFZKMkVKU0d5OUVzbVdRQ004RnB3b2RJ?=
 =?utf-8?B?dGxWZ1hibldVS3p4akk3YTZsbnMvYkZ3OHVRcnBqQXRJUEY2a08vTU82UDV6?=
 =?utf-8?Q?olK5tepjBRMFTlWedZvGeC8bj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e08255-ef4d-464c-f8b4-08dd3f17b53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 21:15:21.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awXvFvsGA0vDfGZL7769SqAHTRDkjnQ/qGrBhiZeOkbLfny5N3QS1MBciZ5F2Z6Tip2J4YLPQkTlzvqbsTKlD5sDVdmg29lwRmBA46wSEVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQnJpYW4gR2VmZm9uDQpT
ZW50OiBNb25kYXksIEphbnVhcnkgMjcsIDIwMjUgMTI6NDQgUE0NClRvOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogV2lsc29uLCBDaHJpcyBQIDxjaHJpcy5wLndpbHNvbkBp
bnRlbC5jb20+OyBTYWFyaW5lbiwgSmFuaSA8amFuaS5zYWFyaW5lbkBpbnRlbC5jb20+OyBNaXN0
YXQsIFRvbWFzeiA8dG9tYXN6Lm1pc3RhdEBpbnRlbC5jb20+OyBTcmluaXZhcywgVmlkeWEgPHZp
ZHlhLnNyaW5pdmFzQGludGVsLmNvbT47IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEpvb25hcyBMYWh0aW5lbiA8am9vbmFz
LmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IEJyaWFuIEdlZmZvbiA8YmdlZmZvbkBnb29nbGUu
Y29tPjsgc3RhYmxlQHZnZXIua2VybmVsLm9yZzsgVG9tYXN6IEZpZ2EgPHRmaWdhQGdvb2dsZS5j
b20+DQpTdWJqZWN0OiBbUEFUQ0ggdjNdIGRybS9pOTE1OiBGaXggcGFnZSBjbGVhbnVwIG9uIERN
QSByZW1hcCBmYWlsdXJlDQo+IA0KPiBXaGVuIGNvbnZlcnRpbmcgdG8gZm9saW9zIHRoZSBjbGVh
bnVwIHBhdGggb2Ygc2htZW1fZ2V0X3BhZ2VzKCkgd2FzDQo+IG1pc3NlZC4gV2hlbiBhIERNQSBy
ZW1hcCBmYWlscyBhbmQgdGhlIG1heCBzZWdtZW50IHNpemUgaXMgZ3JlYXRlciB0aGFuDQo+IFBB
R0VfU0laRSBpdCB3aWxsIGF0dGVtcHQgdG8gcmV0cnkgdGhlIHJlbWFwIHdpdGggYSBQQUdFX1NJ
WkVkIHNlZ21lbnQNCj4gc2l6ZS4gVGhlIGNsZWFudXAgY29kZSBpc24ndCBwcm9wZXJseSB1c2lu
ZyB0aGUgZm9saW8gYXBpcyBhbmQgYXMgYQ0KPiByZXN1bHQgaXNuJ3QgaGFuZGxpbmcgY29tcG91
bmQgcGFnZXMgY29ycmVjdGx5Lg0KPiANCj4gdjIgLT4gdjM6DQo+IChWaWxsZSkgSnVzdCB1c2Ug
c2htZW1fc2dfZnJlZV90YWJsZSgpIGFzLWlzIGluIHRoZSBmYWlsdXJlIHBhdGggb2YNCj4gc2ht
ZW1fZ2V0X3BhZ2VzKCkuIHNobWVtX3NnX2ZyZWVfdGFibGUoKSB3aWxsIGNsZWFyIG1hcHBpbmcg
dW5ldmljdGFibGUNCj4gYnV0IGl0IHdpbGwgYmUgcmVzZXQgd2hlbiBpdCByZXRyaWVzIGluIHNo
bWVtX3NnX2FsbG9jX3RhYmxlKCkuDQo+IA0KPiB2MSAtPiB2MjoNCj4gKFZpbGxlKSBGaXhlZCBs
b2NhdGlvbnMgd2hlcmUgd2Ugd2VyZSBub3QgY2xlYXJpbmcgbWFwcGluZyB1bmV2aWN0YWJsZS4N
Cj4gDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBWaWxsZSBTeXJqYWxhIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFZpZHlhIFNyaW5pdmFzIDx2aWR5
YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTM0ODcNCj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDI1MDExNjEzNTYzNi40MTAxNjQtMS1iZ2VmZm9uQGdvb2dsZS5j
b20vDQo+IEZpeGVzOiAwYjYyYWYyOGYyNDkgKCJpOTE1OiBjb252ZXJ0IHNobWVtX3NnX2ZyZWVf
dGFibGUoKSB0byB1c2UgYSBmb2xpb19iYXRjaCIpDQo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIEdl
ZmZvbiA8YmdlZmZvbkBnb29nbGUuY29tPg0KPiBTdWdnZXN0ZWQtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBnb29nbGUuY29tPg0KDQpTZWVtcyBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IEpvbmF0
aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhhbiBDYXZpdHQN
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jIHwg
NiArLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
c2htZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQo+IGlu
ZGV4IGZlNjlmMmM4NTI3ZC4uYWUzMzQzYzgxYTY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KPiBAQCAtMjA5LDggKzIwOSw2IEBAIHN0YXRpYyBp
bnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopDQo+ICAJ
c3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBvYmotPmJhc2UuZmlscC0+Zl9tYXBwaW5n
Ow0KPiAgCXVuc2lnbmVkIGludCBtYXhfc2VnbWVudCA9IGk5MTVfc2dfc2VnbWVudF9zaXplKGk5
MTUtPmRybS5kZXYpOw0KPiAgCXN0cnVjdCBzZ190YWJsZSAqc3Q7DQo+IC0Jc3RydWN0IHNndF9p
dGVyIHNndF9pdGVyOw0KPiAtCXN0cnVjdCBwYWdlICpwYWdlOw0KPiAgCWludCByZXQ7DQo+ICAN
Cj4gIAkvKg0KPiBAQCAtMjM5LDkgKzIzNyw3IEBAIHN0YXRpYyBpbnQgc2htZW1fZ2V0X3BhZ2Vz
KHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopDQo+ICAJCSAqIGZvciBQQUdFX1NJWkUg
Y2h1bmtzIGluc3RlYWQgbWF5IGJlIGhlbHBmdWwuDQo+ICAJCSAqLw0KPiAgCQlpZiAobWF4X3Nl
Z21lbnQgPiBQQUdFX1NJWkUpIHsNCj4gLQkJCWZvcl9lYWNoX3NndF9wYWdlKHBhZ2UsIHNndF9p
dGVyLCBzdCkNCj4gLQkJCQlwdXRfcGFnZShwYWdlKTsNCj4gLQkJCXNnX2ZyZWVfdGFibGUoc3Qp
Ow0KPiArCQkJc2htZW1fc2dfZnJlZV90YWJsZShzdCwgbWFwcGluZywgZmFsc2UsIGZhbHNlKTsN
Cj4gIAkJCWtmcmVlKHN0KTsNCj4gIA0KPiAgCQkJbWF4X3NlZ21lbnQgPSBQQUdFX1NJWkU7DQo+
IC0tIA0KPiAyLjQ4LjEuMjYyLmc4NWNjOWYyZDFlLWdvb2cNCj4gDQo+IA0K
