Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C634CABFBF9
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 19:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE3C10E745;
	Wed, 21 May 2025 17:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Be/ENxQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5410F2B7;
 Wed, 21 May 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747846883; x=1779382883;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yT4JCgIilGSILdlklbPsrikrTU3YI2qzHLDVgl+wD7o=;
 b=Be/ENxQ1JimCAQ3q0H6DY05NvUv3WTk9D3yK7/lBdfzQit+Yp8hfKdJa
 0crMGBNM/s0A8ojfdevywA5s3UMw639UGTWw0OHMHsCnV3c3HEdxHKJDI
 cg+0XstlmP/8pzjREa99UyHJlslsoHUCnM9b7JfHhNfx64NhSx1trLRQK
 Na45Y+RRFNmh+bj4+VjR6kbJft24FC59JqSmLOcRUaSeQn861ZBIqJjbk
 rNcMroayx9NhKOAUe/lMAYHrBvr0ryWkqbWWXRuhRrpWXQxoxdLCw+9oh
 ayOsSubkrNKLnDOrQiE5Q5K7tBbiZrFlMz0MyF2rGIZ2ts51+Z2s5MUL3 w==;
X-CSE-ConnectionGUID: CB+oAfASSSe9zoXAdHEK9A==
X-CSE-MsgGUID: 82fAjHR9TnOTZhpk/sJuVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67252796"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="67252796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 10:01:22 -0700
X-CSE-ConnectionGUID: VC9r4K+LRlu+z+Prl7Qv+Q==
X-CSE-MsgGUID: id+y+ROOSgKVZMPrngkZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="171031140"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 10:01:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 10:01:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 10:01:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 10:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDVwItR2VSQx288Pm3QJIsQtAoRYohYJIVr3Pv6kUNPl3pCRtmTTp5353Et4HSbYcnmJ2xU4jG1OwAHnTaQRk7aApzdVHe/WsNQPQUXvixEo16XdEBKqtBhhfDk+/N0nY5WoFOdvl5BIrA/g+2t4e9Gth44FMhzJ2a21fNjIY8oZ9gA+z3Oakmzdnu5gEiY4RU469GrhDA+ZleqxTH4jvgjcKJZcrNCjovh47oXVsc8I8pgvzOuDd3v69vL82fKPamBAlpdMhKOEd7mFPineuo/pe9YM9d8sObu3XnAOb38mxP3lHunHjKThKPIT/PoAKpCo5kjutVjXhhbXmFTbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ka97J7WRLpdP65RtC/5M2Y9ZRRuWl37uamslrlwpuk=;
 b=OZpXhU4WYwZ5MNlJlONKq8vYpGTlqzQdiGvPAwT//38IWKCM+SrPI/LjgxkbjIg4Os3VpUUVIYCG2/KgYXhPCx9SAIbE3dc2/aBOBiTfNO/xxW7C98hjkK724uCSShVTmycfl6EgW9hJfw1Cq7ZDcDglyOrIPdU2WH93ib77dV3AW/NOP+Eaf97d+xY6UgUOd2R1NRRmAFOT22+olecgt0L19hSd7Z4n0HONkHtKiOo4r+lmcqTCAs9xwTt7jG61TMzw5QJ7Yl1MjysJjLwWe82jgsCJCty0+VFEM6Iz7FcdEZqg81dZhAh7G0vLeF3xl8F22n9YVvycFYSx7dxF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 17:01:17 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 17:01:17 +0000
Date: Wed, 21 May 2025 19:01:09 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
Message-ID: <rarpco7532oygroxaqv75qelkyeak47yblhqsvqdxskbal5rr6@yicffautqjbt>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
 <wmejfsw4evmyg2apuo2dwlt4i44eduzhkcyqsi6x7erq7udbnn@t5pwllrdmh6u>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <wmejfsw4evmyg2apuo2dwlt4i44eduzhkcyqsi6x7erq7udbnn@t5pwllrdmh6u>
X-ClientProxiedBy: DU2PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::31) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2e6cc2-a0ef-4be2-0621-08dd98891a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDBBaVV1VlNPazFGdW96Ym03NWI1ai9UL2VlYzZLNGovSmhEMjR2dXhmcVR1?=
 =?utf-8?B?OEUrLzV4WUEzbjNWQnVNV2pPSi9DcmVNS1FGNGNLSmFFVloySzFwVW9VbnB3?=
 =?utf-8?B?YkdCWUZpc2g3YkxMNjBvWWJYcFBiSzRLYnFwNkhMM1hvUDFEMEk0Z0V0QUE4?=
 =?utf-8?B?cW9WM1JCV0lsdHdQUm00eTkvd1VPMDcwQ2NrVmpSYWNYMW14U1dPOWFqR0cx?=
 =?utf-8?B?ODFvYVAvMzlBL096UE5uWHFwSmYwcW4wSmtmaVdOcU1UTGM3L2lhZUFTQ1Y5?=
 =?utf-8?B?eUkzZUhQV2xMbXF5YitlZFB2a0ZPUWxHNm45eENZTkEvWnBkNENNY2ViT3FP?=
 =?utf-8?B?ZlpWR0FGcDhBTEo3TVhtUVFSSU1weDBqVHV6clI4UFowWUxzeGEzREdqZGNO?=
 =?utf-8?B?ME5WS3Z3aytYVEZ6dStuR1FaMGMyRUtXSEs2ZHRSTlJ2N20vVGYxOFowaGJj?=
 =?utf-8?B?MXNLQUVjK01mUm5YVC9NSW1nYmNXS2RHQ3N0WGthK1NRQ2Z0a1NNdlUwcjNB?=
 =?utf-8?B?TlJyQlJiQUI5ZmhnaHlscHdpQmxjSSt2RFRHek5LV2ZmR0o0MEk2LzFudmZQ?=
 =?utf-8?B?N2pId1c4bWJCU3lyQ3VEOGE5TG0ySUpZUDdMNXdtQURhNjBTUGtiVE9lSU14?=
 =?utf-8?B?OEpnQnV2dGU2TTFYajZqL1FTeGwzSlF6Z3pOWXovVjllMW9aT0lLWXA2NnM5?=
 =?utf-8?B?ZERFcVo2ZGp1RlhZcXdOcHNObDF5MmJsTnNhNXRQRlBCSXg0REI3ak9RM2RL?=
 =?utf-8?B?L3VPTjVtcldacVMyeUtQb3NLUDlhWHVXcHFGcWQ0RWZ1SXJKd3lvRVJIS2pm?=
 =?utf-8?B?QXZJK2Qvd09rL3E4VUtEWDdTWHp1TktsS1pITUlUTE5MbWE5NlV5VXFjTlZY?=
 =?utf-8?B?cS9Zb21Da2NodXZQaWlIaDc1VGVPYkdkUDExM1NERnBncXlxVHVKQld3MzNC?=
 =?utf-8?B?VWp3anNlWEZKVDdyaWlxRVZJMnNQNzZiZkZ6RUh5VFhYYXdlb2d4N2JJWVlD?=
 =?utf-8?B?MHlCOVJpbTY1WWlaamxWNEtKWXdtUmdYQjhGVXcvVnJzUG1vSXBJd1IwSisw?=
 =?utf-8?B?dFNYWVhKVVpQLzhkYTZOSERyWkYrbVAvSWlqRTRGS0xBSnJ0SzF1ZmtBS3NT?=
 =?utf-8?B?WWZKbWtIYkVQWXJLbTNEaytEclp0YS9MK3U4aFo1cXp3N21iME5sdE5MU2po?=
 =?utf-8?B?V01nVnJTNmdMUld3bHhlWnlMTGFidVdvOTAzU1EvMHFMdlc1cnhOU1RjTUxp?=
 =?utf-8?B?TFFyUXRSaG9zaTM4cmtNVHBrREl3a20vdjgzK3dQNk1TNkQ0NEZITjNidDFM?=
 =?utf-8?B?MG1JTm1iM2lja2JQMkdVZWNNY1NnQjlGMzlWT3NMV2F0b2RNdzM3VEo1WGhU?=
 =?utf-8?B?NmFMbUtpT05abVBFNW9WekVMMVR6RW1wN0lyQXNCZlZQczcyUTlldEhmaXYw?=
 =?utf-8?B?QTRTTktHZFAxRzYvcGEyd3NuNXdWcGo1empMSklsQjNOb3BDWHRXTGZSVlhZ?=
 =?utf-8?B?amU3OHZlUHNMUGdPMzNPTlNDZnRsbWU4ZTI5OGdGRTNYYkt4VHBLekxDYUhO?=
 =?utf-8?B?UUJDMGoyVW5KM1ZRc2NKcUQxNGMySkZYKzIydi9KbEdsTHJxMlU4SHpYaDJU?=
 =?utf-8?B?MXFjWjJlL1hIbGhBZ1lOdkJnSUJ5ZFAzbkZVQ21VTG5Ga24xK3V0K3phbkIx?=
 =?utf-8?B?K0lSbUZqQnQvemRUVXBLUGJ5ZWZRMjVYYUs0aSszdlNWVVl2K3lXN2tJVitN?=
 =?utf-8?B?djRuVkdWRmZGOG5kaTFuejRjTzdIaThGZVNxY0tTcE03Rm9SQVl2c3NqUXJx?=
 =?utf-8?B?K0NTVEFVVk43UXVJR01rL2VHdE1jZFhKUTZUSDRUbkJtbzNUVE5pRVpUeEZ5?=
 =?utf-8?B?bWI5b09YWGJ6THJwR3p2RUZxYUFaQml0TTV0OGFlM0VCK1dpeVFjMStXM0Zh?=
 =?utf-8?Q?kGPXVOoYRIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3dGV3MxWW8zdWQ0UEFHZk1ObTN4ZVRvV0lqZVkwOUkvazlENzBDT1JFWmxJ?=
 =?utf-8?B?elR5V2t0MElpdkNXUm9PMVlEdGVDWDZjNjJmR2NjMU4zdDhDOUhBV09idzcy?=
 =?utf-8?B?L0NGZVVxUGtMVUV0QmVVbFMxMnJTZTVGa2pIUVV4aTdBT0h2UW9nWlJZdG9v?=
 =?utf-8?B?ZlVZYlhqcFc5dkpTZDdHQ2owQXVmcjVFUUlFMThFV05rYmVJbWFDQW5BdHBr?=
 =?utf-8?B?c2VwWlg3QlhraisrZ3FoY3MrQzdtbWc1R0pROGZjMS9mbkhaRHJ1c0cyWXZu?=
 =?utf-8?B?cGZJSWY2Q1JHcjlTR2o0QVMwTmZkUmwyaldsMlpTdExhallORTJQemFZL2ha?=
 =?utf-8?B?ODFPNXpRcFZPVWZtcE8zemlOdlpxS1c3SUpPWE5RdjNEK3VZcXU2N2xwV1M2?=
 =?utf-8?B?SHJ0N290NGQyZzJBTDMwSmVIUVZXZnRqTm9lQUw3cDhsSms1VldoSjJHL3dR?=
 =?utf-8?B?WEU0cTRndlJGckZYWDIvOWRNd2IzRi9YMGNXZ3JuRG1pY2lmR3VsVHljS3NX?=
 =?utf-8?B?RVJ0YStwVDdoQ0F5b3hXdTNRcWJGdm5QUVhMdmhuNFQxbmUrVzhDQXp0bUpV?=
 =?utf-8?B?b3M2WFlOSzRIaEZQOXN3WlRtMngyeFN3dlJURWFDeEFmV0ZxTW1pUTdNcUtw?=
 =?utf-8?B?dVZ4QUJUNmY1UTYvWTRZSDVtNkxJRnVPd1V5R1ovb0NzdlRyQUJOTm9sdnh1?=
 =?utf-8?B?QlhHU1ZNa2NyZC9zVHpRVHEvUlhaYUp2YnRZQ3l6elJkYkcyRG5xekVORGxX?=
 =?utf-8?B?amRKU1h5b0FPTXloUktHQnNZVUdVYVZyTUlpM1pLSnVTRkswTy9VbjhNL1Bj?=
 =?utf-8?B?QnkwcGJMdFpiQkVvRE1LQWtNTHA4UzRUaStnU2hyUG16d3pMZWVyUTY0Vy8w?=
 =?utf-8?B?UGhqL1FzUGQxVUx4VnVKYzJ3ZUxmSzlrWU5BdTA3dW8vYm1wc1lSMDBpQS9o?=
 =?utf-8?B?VmllMmVpenJpNDUwNGJTRjVwa1pFaTZsZDFXWG9yTVJ5OU1HRVpNZVl6MTlk?=
 =?utf-8?B?MXBLWFN4Zmd0SEQ1a05kMTRaWE5HSFhsbGIza3BtVmhhcmJpWjVyKzlyWHZx?=
 =?utf-8?B?OHAvUHVWMTgyaUxRSUZTYTZqelFxVWt2Tng0Mmh3aXc5ZU5qM0psdmJLVmlK?=
 =?utf-8?B?K3FSbDRBRlhKNElIY0QxdTZjdFZ3M09pV2Q3Wjh3YlBxVDdkdkZiRDRHNjht?=
 =?utf-8?B?Mk0yS3pzVEZGNy9YdHpQL2NQRTlzUFBlT0I1U0krUzJ0U2t4UW94V0JVWW5Y?=
 =?utf-8?B?OTNxb3dHM0FkTHd1dXlqSzBSM2xjY2lKNjZCbmR1K1VET29kNnhQRlJlUms5?=
 =?utf-8?B?WFBOVlZNOGMvdWhXcmJnYjNXZk0wZjBOd3ZyTVZwUUYxWC9WZVVCcDZHM2xM?=
 =?utf-8?B?ZGpXTFVNdTE4czdnc1VrOEdlQVFhUnBXdEk4TEpaYllPL3V4bmJDSHg1VEtx?=
 =?utf-8?B?OTlsS0FXenErYjBhZEdoOG5kNllmUURSL0lUendvMWVQdUxhWmVTNGJRRiti?=
 =?utf-8?B?RVI3TFg1V3ZHV2hsVk9Vb1NhYmt2a3hHZlBIakhFVGNMbVhuZFFJeVJLT0Zp?=
 =?utf-8?B?b3owRUVXZDNRakc0R3k4c0pmSlB5am5UQmhiRjdTN2VqeVIvZVdESWJIdTNs?=
 =?utf-8?B?d3lpRVZ1NGx4Y1ErT1FjZmp4MjFMcXJrMExieW9ZQVNuWEJZOUkwUTN0UytP?=
 =?utf-8?B?NC9EMkc0YXJxaGRaVXU1b2Znc3RpelNreWxyTjBGNm1VR040RVpGRTdOV1Fl?=
 =?utf-8?B?NTExMmN3U21wR2R5UWZxVW0yQW1UK3pZSVBSY0wxdE1GajZFNEU2ZlUxQmRu?=
 =?utf-8?B?UEFRZmxIdW8wTExNcmM0WTNxUWJ4MGZ0MjF6WVV0dENlMkZRLzI0UEMzRWRi?=
 =?utf-8?B?UUdTMjZkS09hL3lDWVUyaHNiYnZWVFRPVkdOcGdHUk9NeTU2TDNwbFlnZno1?=
 =?utf-8?B?UDZyeGFjZzNiSkVsdUdVWGUyNmZBWHErbDcraHJzbUNhWDVDck1LQ2VDSzhu?=
 =?utf-8?B?MkozY29RRlM2UEpRalowU3R0OWZNcm05WmpkaFRvQXRJNHpmakpnSkxvWmtJ?=
 =?utf-8?B?ZndKUDQvS3hQKys1RitRZDlKSjYyeFhlakdZeHdlWnU1eGZ6T1Rka3Jhakgr?=
 =?utf-8?B?bkJDNHBkNzlwQjl5UnNaT2lJNCs3TTRmS2FQZTJVQ010M2dNSkxXSG1JTnM0?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2e6cc2-a0ef-4be2-0621-08dd98891a1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:01:17.5021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BwDcLVlOCjVWAkkmxreAnWPunCxvqkN53vPET2CvUQ5dq49gBaSBvtaiS0PXe+ckXpl1cir8Uc7UHfT7/SOJtkOJ5L1eNA6F5KbURK28i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

Hi,

On 2025-05-20 at 19:46:48 GMT, Andi Shyti wrote:
> Hi,
> 
> On Tue, May 20, 2025 at 06:01:12PM +0300, Joonas Lahtinen wrote:
> > Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
> > > This series introduces a way for applications to read local memory
> > > information via files in the sysfs. So far the only way to do this was
> > > via i915_query ioctl. This is slightly less handy than sysfs for
> > > external users. Additionally, the ioctl has a capability check which
> > > limits which users of a system might use it to get information.
> > > 
> > > The goals of this series are:
> > > 
> > >         1) Introduce a simpler interface to access lmem information,
> > >         2) Lift the CAP_PERFMON check on that information, OR provide
> > >            the administrator with a way to optionally lift it.
> > > 
> > > The first patch introduces the general mechanism without protections.
> > > This will effectively lift a capability check on obtaining the memory
> > > information. The second patch introduces that check back inside the
> > > _show() functions, but also adds a sysctl parameter allowing to override
> > > the checks, if an administrator so decides.
> > > 
> > > I'm sending this as RFC because I have a feeling that there's no
> > > consensus whether memory information exposed in the patch should be
> > > protected or not. Showing it to any user is strictly speaking an info
> > > leak, but the severity thereof might be considered not that high, so I'd
> > > rather leave it up to discussion first.
> > > 
> > > If we decide for lifting the check, the first patch is sufficient.
> > 
> > Nack on that.
> > 
> > CPU memory footprint and GPU memory footprint have a very different
> > nature. This was discussed to quite a length, please refer to mailing
> > list archives.
> > 
> > > If we
> > > decide against it, the second patch protects the information by default,
> > > but with a way to expose it as a conscious decision of the admin. I find
> > > it a decent compromise.
> > 
> > No need for the added complexity if we were to add a sysfs.
> > 
> > If a sysfs is added, it can be made root readable by default but system
> > admin is free to chown or chmod the file for more relaxed access. Back
> > in the original discussion time, this was omitted for lack of users.
> > 
> > Even now, userspace/sysadmin could already essentially use setuid helper
> > process that will only report the memory statistics.
> > 
> > So I'm not really fully convinced this is needed at all.
> 
> yeah! What is the real use case? Who is the userspace client?
> 
> There are already ways to read out the GPU memory footprint so
> that we need to know whether we need for another uAPI.
> 

I'm sorry if I wasn't clear enough in the cover letter; client is
MangoHUD[1]. It's a popular overlay for benchmarking games. They reached
out to us because they have no convenient way to read total memory
information.

[1] https://github.com/flightlessmango/MangoHud

Thanks
Krzysztof

> Andi
> 
> > And if it is to be added for the convenience of usersppace, it should
> > probably then be considered to be a standard interface across DRM drivers
> > ala fdinfo or cgroups.
> > 
> > Regards, Joonas
> > 
> > > 
> > > This change has been requested in these parallel issues for i915 and Xe:
> > > 
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
> > > 
> > > Thanks
> > > Krzysztof
> > > 
> > > Krzysztof Niemiec (2):
> > >   drm/i915: Expose local memory information via sysfs
> > >   drm/i915: Add protections to sysfs local memory information
> > > 
> > >  drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
> > >  drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
> > >  drivers/gpu/drm/i915/intel_memory_region.h |   3 +
> > >  3 files changed, 145 insertions(+)
> > > 
> > > -- 
> > > 2.45.2
> > > _
