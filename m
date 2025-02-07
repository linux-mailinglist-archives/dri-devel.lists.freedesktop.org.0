Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A45A2C3FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9D710EB05;
	Fri,  7 Feb 2025 13:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3SeZ027";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D3D10EAF0;
 Fri,  7 Feb 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738935802; x=1770471802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OzGNRfTVoI5M6mg429NB5jPdVSK+cUcwwpitxhWx4pg=;
 b=B3SeZ027YSte+EL5EGEfQ8sVokc71cA4KBJmax6eslwntNwKDmBeNpix
 V7grtaF8Bw/xzIykwdAyO5QyvQXv3HQ6JZ3BXX+8yugXzRzxpvfSTTV07
 3aR0GAFnyoeNC8rZ/7ROXs+tJiyCpKcHgesRCEb2BKjyul8qPlHMYcCuv
 uHV7nsZEw3bDMhPSz1FVyqBXcpdXMhcotubhHCdh6hoMXVDbP5XW2QEnG
 fZITnVvpeLYcH2Bi4htX4rNN2Wlf+QJF11oTUAspiDRK+5sW1aSk8uWAE
 5c0egHns2vWf6DXCRYqazPWXD8gF3gN+fs8AnFO06mav9rLD30WpKlWEQ Q==;
X-CSE-ConnectionGUID: x0wYu/HzQTqizTylWdnd2A==
X-CSE-MsgGUID: x1XAh+O+R8mpJ/Wih7f2VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="56990759"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="56990759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:43:21 -0800
X-CSE-ConnectionGUID: h+ewjmigTg++nM1wIxg3sA==
X-CSE-MsgGUID: BhQZgXpmR9WL2WtRWjs7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116730960"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 05:43:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 05:43:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 05:43:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 05:43:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK0v6rXBliIGx4ThxCfmoRJRpHMUnY9xISHKaVc5rYcUi+JBTZebQ5od31QtSi8HBuzCaRlOAmo3JTg7Amaw9XH6i1Oglv8ZgMZkNcT2QCsb2KvNMP5dXJq5wuINPMf9d3U9HikAnF2yzb1Q4LiKhFGefvMuPQ88SjjkoJmbJCIKb+oi+Z6CiqMQsA4GFO2e4miy9K/dUYhcRzO92RRdJai8biDzlspgb+tLXwueKs+D+hvrnuTot/S5Og3X76QucZ0wlSfJP2GcgEKZzCIF/esWqhhMWAZJ3tdXDbvgDksujNj2zegQ4BV5GkIfh9aIXjMkpBwCXCjmq1TPCjPL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzGNRfTVoI5M6mg429NB5jPdVSK+cUcwwpitxhWx4pg=;
 b=teXM3ndWfyKgnVTeDYn74IqY0m+jSzix0pAHnjTsb2vphxGH2hHiKJoJuUnsRAkGruHocGEKJleNybI9GHBC7oAgJ/7a1hMeNQFoRY0pI+Zv5RdSHRfunnNb+4jJ+jrlLm2P3AWbntqpKUGGQqisz+A0QSFJYdqjF7w95L6zp7qeGjxQpTwS6yrsJJ8JsAP2v+bsH+c2FN4uN9TzLSPLjlZQwjx31Yg0M75pLA/VS5FgjbXm7S/rDonuKMr+nq+wvo5hKLbwqxITc6yWlEhcJXPnRhyeOQpmrdgmYIjeyFlICXW+SOOn2X0JcDDGrNrtSKKRjVxU2yJtL0Z0fUs+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 13:43:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 13:43:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "felix.kuehling@amd.com" <felix.kuehling@amd.com>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: RE: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Thread-Topic: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Thread-Index: AQHbcoc6IK3m7+D8CUaHJVyDYfbdjLM73KoAgAAJyrA=
Date: Fri, 7 Feb 2025 13:43:11 +0000
Message-ID: <SJ1PR11MB620444FAF69535A6993ED48081F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-20-matthew.brost@intel.com>
 <59bb51deb61f3fbc54656b189fa2aef1de9806da.camel@linux.intel.com>
In-Reply-To: <59bb51deb61f3fbc54656b189fa2aef1de9806da.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB7327:EE_
x-ms-office365-filtering-correlation-id: 317c2b94-ded0-4f47-9211-08dd477d5ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SUt5aHNhSS8xbG5rTTdzakJ1bGNuZW4rbXhVWTduNzVyaE1ucE5ZVW01Sll1?=
 =?utf-8?B?VnpWRzRBMVRNcWxXbnpsNXZyUnBqcEJQNVE3dHNNbHl2OXdIVkpMWGVMSjNQ?=
 =?utf-8?B?NnlFdzdoSFVaWHZxQ2ttaS9vZTU2enhiZWhhY2VTaXpHVFltREFvOXVqQktB?=
 =?utf-8?B?YVRuMjlOYWFoVnJnSndKb0o0V3k5RlJwZit3K2ZLN0hSQUM1L2kyQ2FMNGsr?=
 =?utf-8?B?d1ZpOVp5anVnYTJQQzZCL2l1d3lpdkZKbjBxOUwvejFLL0RhMnJIbHlUQlFX?=
 =?utf-8?B?L1k3WldPb3FqNUtXd21USmorMVJnWkJCQzVOS1lTVTdKV3pkVFF2WFl1NWxj?=
 =?utf-8?B?WnVVVi9GYllsZTlwc2x5enFFaTJNdDVTN3VZNEEvdE1DMWYwTEYxTGVYU1po?=
 =?utf-8?B?dE1lUlRRZW1CbU8yRW1FR0o5L0dzcnREYldrSHl2TFJHWGxyVE43MWZYOEVj?=
 =?utf-8?B?bDRpQ3IxcnorQkhxL1BqQ2xqVkQvMW1yM2w0SGZhMGVsQ0ZZL1pYZWo3SFph?=
 =?utf-8?B?TGVaOFVNWGl4c2FBTE1NbVNOUXl6ZzBXa3luVkgvb0JDbSs4ZVBPTjl2TmFr?=
 =?utf-8?B?Rnd2d0FsRVJ6ZVlrMEpzQ0FhUU42YkJVQzIranJJSXlwK1E5Nm4zMUFnRjlI?=
 =?utf-8?B?MFFxelNZSlNkL1pPYS90aTVVU241aGJSZnFxSSsvT05wSCtZRkRhUmRhaDZ3?=
 =?utf-8?B?NDZGOExNNHo5TjRTL0JvSytnVk9jUmwwSzJCK1hKait6cnJ6dU5qU0VQcnBI?=
 =?utf-8?B?Wkx4bDVzRFJJcXhOVkxQOVhCT3RudU10NXJjeDVGM0pwa3VOb2dPQ2pIczUv?=
 =?utf-8?B?a21Jdkppc1FTckc3VTBQZWlxdXdacnowalF3emVhOXhmQUkvSmtabmw0OHdk?=
 =?utf-8?B?UjJtdDkzQzFYeHE1bkttelZPUnFJQ1Y0dTdZWVZubXRvZmZKSC90QjdXZVlO?=
 =?utf-8?B?M1RQQ2tucEcrR0l6WXk5aHhZdWo3aGoyam51Mm90cHFFeDFkRTFYWEJGK1BH?=
 =?utf-8?B?dDZMeW5RL3F0cmNBUHFSQkhDV3BGSEVnV3RJbnNMR2FVMmN0Z1dBQ08xdWVG?=
 =?utf-8?B?ajBFdmxMTTM1OG0xR3lQbU1XdFNsendKbDhoUmU0NnZpUGlRTUNLazVTREpl?=
 =?utf-8?B?THpHME1meE4xUTcwZ3RHdjZ3S3BzZmc2SkFmdjJERk5Td3lFaU95T2FMdVRP?=
 =?utf-8?B?Z1JsSTlHUTl4MEFRYVE1QnRSblI3blNLbjgyNTc5NmxEaFg3R0dMZ0VsRTZG?=
 =?utf-8?B?UndwMjU2U0xmNktRMk0xdXFiZS8vc3UxZTFyM0JYK1FQNFF2MXRuZWZJa216?=
 =?utf-8?B?Tm44K0V1OXpRSGdSM21rR3hweFJkU0tQY1ptUG5PUkx0VnFIYkF3UXZNd3Rt?=
 =?utf-8?B?Z3pjZVZoSm9DdWErOVVNZDRXQy8wN3hRaFk4Y2llUTU3Z011UktDUXp3MHE0?=
 =?utf-8?B?Ny9wUUFOUEx0c0szN0Iwc1ZzQmRoejZsR201WXdvRlJPdmFZQTdVdnE3K1lw?=
 =?utf-8?B?dURoQStvUkJIaENhc2VDRjNIaytWM0xmZ3FKWU5mWDY1K3JlOHJ1c2NpMlVC?=
 =?utf-8?B?bEJvSDFlVVN4V1crNHptcFlrR1dFaW9mMmJPaEFBSUNxSW1qcVVLUHNiNy95?=
 =?utf-8?B?SlI5MHVxQ0Y5QWZFcTJxT2lwVkl1QThQcTBpTzZzK1dieGc4NVM0ejZLYzM0?=
 =?utf-8?B?SEZKeUJSQk9IT1Q5clR5RlQvdU9TZnJyS3RZVW1IVXc0dkxTanBzSEJRcWFN?=
 =?utf-8?B?akxGMUExTTFuRllIWTZOc2FSQ0VnYVZjcDRyMHVTbW5kV3g0OUdDSnFpNHF2?=
 =?utf-8?B?UG1YNUszbWFjL2hIMFNWN0NtdXRhRFhWU1RLNFRxY0IzcmQwU2N2bi9Qei9R?=
 =?utf-8?Q?yfmcqgJLmhf5i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjdUbXIraTJ1ZXNDdXFUS29YbTBickhTL0ZoSnJJQXlLS1N0Mm5aUHk3RCtY?=
 =?utf-8?B?QmgzN0ZqQTNGVGZmRllQTXBraFlPN1BmZWkyZG1SSkZ2dEhCSFFFT1E5Q3Vy?=
 =?utf-8?B?SVU3NlR5REpqY29TNm1EamRCTjZ1L3BKNEZDeEZoNVBLVTBuTS9nMkhHYzI4?=
 =?utf-8?B?QTJ6R054ZjdkRGJ3QmVZNldkeXBEU01PTmQzVEVBSW1YUDZQN09OeDQrN1cv?=
 =?utf-8?B?dVY0ekE4ZEl1ckZ4U2F0aG5tQmxCRFNBanMzWmJoWHBsaGdwK1FDd2NwbG5z?=
 =?utf-8?B?WmhjM3d0RDRzcyt6L1pHOXdXeUFMWGE1TWRySXZsUkxCbjRncFRSZnlFSERs?=
 =?utf-8?B?cndyVTQ5Z250VTR1SHRUcWtPczJxaTlsd0pnVEdEWTBuZ2FSQi96c0ZML1Jw?=
 =?utf-8?B?cjRNclMzcUxmeDdPTWdHWHpsWmtCbW1TNWFZd2x4dzBQL2JPdzJJSDVNSUEv?=
 =?utf-8?B?NFA5K0hlc0tiVXVyU2crdXovZUNDZUh1eTBMZDZLTERQQXFWd1pMQkllYzN5?=
 =?utf-8?B?eWRSNVM2dHB1WFBSanVVdW8xd2JDNDdrM2lLVXdhVFc1NGJJWTZqSzYvbFJz?=
 =?utf-8?B?azBseXlEZ3U4bERWUFlyZFc0R3NHRUprTmhRM1daVktjWWxyUTc0SGxXZ3FI?=
 =?utf-8?B?blhweGpPckNNeGt4Z0VRYmVwQi9GakJiOEFxcDlyVmRMcG0ybnRkTHdvREhi?=
 =?utf-8?B?dUF0Tm5QWGVFd28vcTh3eEVKUU41bFdybDJlWDFqRzhjY3A0dlhnSk5qb2Ns?=
 =?utf-8?B?SFNwVHBJTFo4QWg0ZXJBS2tkU2ZpL2hFdHFSTFZ1OXVLSjVVeXd2ck5Kdll4?=
 =?utf-8?B?Q0hWYlo2V0dmTGxLdFJwNGViMUFtUENJTCtuSnVHSEFtY3VDNHZjWXE2TkVk?=
 =?utf-8?B?KzNPOUlMQVo4UkxYaVptZ3B5c1ViZUM5WXlzN2N2L09tM2dZclhjOUZhV0cz?=
 =?utf-8?B?eUxxVzQ0MkRNM3l6cWRyVEJWNWNYQW1uRkd6TWlPYk42bjVNeW51MU0xempR?=
 =?utf-8?B?eEIybmF3bThEdXk2TCt0T05EV3N1M08rb0NoNlM0L2V3NUJEWWdvL0ZzbktJ?=
 =?utf-8?B?WnFoRjlvMGljdC9ldERzaWdiMUNSYnVzNitoQmJ1SHk3UExYZElIRkJIazJy?=
 =?utf-8?B?RG9HOVRiTlB1eVBPWHhhT0U2ckp4VkErSVlLZVc4NFFtNUVsbjk1UnNnZFly?=
 =?utf-8?B?MlNNa3hYTmhXMkxjdWlqcFY2WFAzUFkxaEoxYUZ1V1FWT0pyZ05EMU1mYUNn?=
 =?utf-8?B?RFdEajk3Qmcrcm1QOFVBQUtIY3RwVm5kc01mVmY2UWxyaVh3VzRtTXFiTys1?=
 =?utf-8?B?RmhBTnpiWTBZcUVlTSsrRFdkR0t0VWc4aTlCSHhmcyt5VklHeE5IZEpVdi94?=
 =?utf-8?B?c0ZqZXZKRkdFMTRIL2dDdWhQQXR1WmIwMlVLckl1L0FweXNJV1drTGRwRUJR?=
 =?utf-8?B?WUJkeEFTNE92Yk9vMHhhckZNTGFPcnh1NUxUSjkySmtRRnNybEJWRE1zTVJu?=
 =?utf-8?B?eFFZM2MxSDZyWlhsZDdQSitFbFZhci9RWWViUDNZbzlmdmdvU3kzLzRFcmZ6?=
 =?utf-8?B?VjExUmQyblo1bGpHOElHd09vV0dkSURKRmpoNDVyVXhMcmRFZTk3NW9rZy9z?=
 =?utf-8?B?d3owMDRXKzFWcnUxRzJ0eVFXbUZOaUt4MFNrcEZHUlR5TXZWNFgwUHBJYVZz?=
 =?utf-8?B?VEdHaFEzQXlHaWI1WmtNNkFiQXkxRkM2ZGFmTTdoWmlGK0dMbmd6Wk45OUhs?=
 =?utf-8?B?WGROaWtHMDVkdzgrc1hybkEvMHFNdW16dTlEUGlGZ1g2OE1LM0U4VldOK3Fu?=
 =?utf-8?B?R1l1M0llOGdseSthQysvSkRiaU9iQ2x4cTZRT2pCaDdML2k5NUtraFBDWkx3?=
 =?utf-8?B?aGRTaGpEVTlDQ3YyRyt4cC80cDIvOEFndTVnWHhybnJrOWczUFZDeldOajEr?=
 =?utf-8?B?MHpJZWVNdVhxNEhJSDdxUENFZ3owRnVqSHhxeDJUYS9wbTEvSjlYbWN4cXNv?=
 =?utf-8?B?YjlmSm10UGtlNjAyVktKMzJJSVZKQ0VySGhRL3hDSDBRVUxMd1lsOVNxM3Yv?=
 =?utf-8?B?NzlFeVdMSk5VOTdCZ3JqYU1pYVdHbUNWeUlTZDZwYU5PYS92OCt1MkxTeElQ?=
 =?utf-8?Q?xGXyNGVKbL/FOeHEhmz+j7eDv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317c2b94-ded0-4f47-9211-08dd477d5ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 13:43:11.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pwtbB0PPOhQSY3el+WUJx7/H8Uxt9iZFkDZ7rgMa5OxJFR9Ku7djMZvEnGgl4Ni/eVxUtWXrzdK4iZfVSuceCIaTlcSYHuKd4L+qXFccnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGhvbWFzDQo+
IEhlbGxzdHLDtm0NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA3LCAyMDI1IDY6MzUgUE0NCj4g
VG86IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IGludGVsLQ0KPiB4
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRl
bC5jb20+Ow0KPiBhcG9wcGxlQG52aWRpYS5jb207IGFpcmxpZWRAZ21haWwuY29tOyBzaW1vbmEu
dmV0dGVyQGZmd2xsLmNoOw0KPiBmZWxpeC5rdWVobGluZ0BhbWQuY29tOyBkYWtyQGtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxOS8zM10gZHJtL3hlL3VhcGk6IEFkZA0KPiBE
Uk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0NQVV9BRERSX01JUlJPUg0KPiANCj4gT24gV2Vk
LCAyMDI1LTAxLTI5IGF0IDExOjUxIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+IEFk
ZCB0aGUgRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHX0hBU19DUFVfQUREUl9NSVJST1IgZGV2aWNl
DQo+IHF1ZXJ5DQo+ID4gZmxhZywgd2hpY2ggaW5kaWNhdGVzIHdoZXRoZXIgdGhlIGRldmljZSBz
dXBwb3J0cyBDUFUgYWRkcmVzcw0KPiA+IG1pcnJvcmluZy4NCj4gPiBUaGUNCj4gPiBpbnRlbnQg
aXMgZm9yIFVNRHMgdG8gdXNlIHRoaXMgcXVlcnkgdG8gZGV0ZXJtaW5lIGlmIGEgVk0gY2FuIGJl
IHNldA0KPiA+IHVwIHdpdGggQ1BVIGFkZHJlc3MgbWlycm9yaW5nLiBUaGlzIGZsYWcgaXMgaW1w
bGVtZW50ZWQgYnkgY2hlY2tpbmcgaWYNCj4gPiB0aGUgZGV2aWNlIHN1cHBvcnRzIEdQVSBmYXVs
dHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcXVlcnkuYyB8IDUgKysrKy0NCj4gPiDCoGluY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmjCoMKgwqDCoCB8IDMgKysrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBpbmRleCBj
MDU5NjM5NjEzZjcuLjQwZjU2ZWFmOThmYQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMNCj4gPiBAQCAtMzMzLDggKzMzMywxMSBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gPiBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVl
cnkpDQo+ID4gwqAJY29uZmlnLT5pbmZvW0RSTV9YRV9RVUVSWV9DT05GSUdfUkVWX0FORF9ERVZJ
Q0VfSURdID0NCj4gPiDCoAkJeGUtPmluZm8uZGV2aWQgfCAoeGUtPmluZm8ucmV2aWQgPDwgMTYp
Ow0KPiA+IMKgCWlmICh4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSktPm1lbS52cmFtLnVzYWJs
ZV9zaXplKQ0KPiA+IC0JCWNvbmZpZy0+aW5mb1tEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdTXSA9
DQo+ID4gKwkJY29uZmlnLT5pbmZvW0RSTV9YRV9RVUVSWV9DT05GSUdfRkxBR1NdIHw9DQo+ID4g
wqAJCQlEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX1ZSQU07DQo+ID4gKwlpZiAoeGUtPmlu
Zm8uaGFzX3VzbSkNCj4gPiArCQljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFH
U10gfD0NCj4gPiArDQo+IAlEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0NQVV9BRERSX01J
UlJPUg0KPiA+IDsNCj4gPiDCoAljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19NSU5f
QUxJR05NRU5UXSA9DQo+ID4gwqAJCXhlLT5pbmZvLnZyYW1fZmxhZ3MgJiBYRV9WUkFNX0ZMQUdT
X05FRUQ2NEsgPyBTWl82NEsNCj4gPiA6IFNaXzRLOw0KPiA+IMKgCWNvbmZpZy0+aW5mb1tEUk1f
WEVfUVVFUllfQ09ORklHX1ZBX0JJVFNdID0geGUtDQo+ID4gPmluZm8udmFfYml0czsNCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gPiBpbmRleCBiODZkYzFiNGMyZmUuLjM3ZTU0Y2E2ZmZlOSAxMDA2NDQNCj4g
PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBp
L2RybS94ZV9kcm0uaA0KPiA+IEBAIC0zOTMsNiArMzkzLDggQEAgc3RydWN0IGRybV94ZV9xdWVy
eV9tZW1fcmVnaW9ucyB7DQo+ID4gwqAgKg0KPiA+IMKgICrCoMKgwqAgLSAlRFJNX1hFX1FVRVJZ
X0NPTkZJR19GTEFHX0hBU19WUkFNIC0gRmxhZyBpcyBzZXQgaWYgdGhlDQo+ID4gZGV2aWNlDQo+
ID4gwqAgKsKgwqDCoMKgwqAgaGFzIHVzYWJsZSBWUkFNDQo+ID4gKyAqwqDCoMKgIC0gJURSTV9Y
RV9RVUVSWV9DT05GSUdfRkxBR19IQVNfQ1BVX0FERFJfTUlSUk9SIC0gRmxhZyBpcw0KPiBzZXQN
Cj4gPiBpZiB0aGUNCj4gPiArICrCoMKgwqDCoMKgIGRldmljZSBoYXMgQ1BVIGFkZHJlc3MgbWly
cm9yaW5nIHN1cHBvcnQNCj4gPiDCoCAqwqAgLSAlRFJNX1hFX1FVRVJZX0NPTkZJR19NSU5fQUxJ
R05NRU5UIC0gTWluaW1hbCBtZW1vcnkNCj4gYWxpZ25tZW50DQo+ID4gwqAgKsKgwqDCoCByZXF1
aXJlZCBieSB0aGlzIGRldmljZSwgdHlwaWNhbGx5IFNaXzRLIG9yIFNaXzY0Sw0KPiA+IMKgICrC
oCAtICVEUk1fWEVfUVVFUllfQ09ORklHX1ZBX0JJVFMgLSBNYXhpbXVtIGJpdHMgb2YgYSB2aXJ0
dWFsDQo+ID4gYWRkcmVzcyBAQCAtNDA5LDYgKzQxMSw3IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlf
Y29uZmlnIHsNCj4gPiDCoCNkZWZpbmUgRFJNX1hFX1FVRVJZX0NPTkZJR19SRVZfQU5EX0RFVklD
RV9JRAkwDQo+ID4gwqAjZGVmaW5lIERSTV9YRV9RVUVSWV9DT05GSUdfRkxBR1MJCQkxDQo+ID4g
wqAJI2RlZmluZSBEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX1ZSQU0JKDEgPDwgMCkNCj4g
PiArCSNkZWZpbmUgRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHX0hBU19DUFVfQUREUl9NSVJST1IN
Cj4gCSgxDQo+ID4gPDwgMSkNCg0KSSBkb27igJl0IGtub3cgaG93IHdlIGhhbmRsZSB0aGlzLCBi
dXQgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzYzNTgzNC8gaXMgZ2V0
dGluZyBtZXJnZWQgc29vbiwgd2lsbCBjb25mbGljdCB3aXRoICgxIDw8IDEpLiBJZiBpdHMgbGlr
ZSB3aG9ldmVyIG1lcmdlcyBmaXJzdCB0aGVuIGl0IHNob3VsZCBiZSBvayB0byBrZWVwIGl0IHRo
aXMgd2F5IGFuZCB5b3UgY2FuIGFkZCBteSByLW8tYi4gT3IgZWxzZSBpZiB3ZSBzaG91bGQgYWRq
dXN0IG5vdyENCg0KQW55d2F5cywNClJldmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KDQo+ID4gwqAjZGVmaW5lIERSTV9YRV9RVUVSWV9DT05GSUdf
TUlOX0FMSUdOTUVOVAkJMg0KPiA+IMKgI2RlZmluZSBEUk1fWEVfUVVFUllfQ09ORklHX1ZBX0JJ
VFMJCQkzDQo+ID4gwqAjZGVmaW5lIERSTV9YRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVf
UFJJT1JJVFkJNA0KDQo=
