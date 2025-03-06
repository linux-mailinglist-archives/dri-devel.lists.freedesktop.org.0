Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D239A5489A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 12:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AE410E939;
	Thu,  6 Mar 2025 11:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMm3vcQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B19A10E939;
 Thu,  6 Mar 2025 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741258858; x=1772794858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=orL7cnYYYdPjR1V+zDlEKV9iN+yjfnc7qmC/qizgrPA=;
 b=WMm3vcQr3ffw5zwlYteBAwFD9JM5PMcwuMMZ8BS5/hZ/zEg/tEAgG3G2
 O+76EXfmjuczQAAEys4PL6abJJ5w86NNB1FRWizSKJPFYakz5vuNko107
 OshBUxGvyEhXCiq2lXjdFMQs8cJ+ccHljfXntGrfnTBSd45DgrbdxcW4g
 RnFelzY8PpW0MbOzH9vjo3bIg8GOc+ib1pYZmV+47PT5Du3wyazDHuhdz
 YP7Bwi4lDGGWYd5bYqhgYtyf3CSTPAvIpIBh/inx0EJ4TrV9gvM4rGV91
 2xBs86jQ8CxLzwfTjGbpYw1nh8/PqIAo+Y+tsYsH+fv0gOLrRQiPskUe0 A==;
X-CSE-ConnectionGUID: GooXLzoUTyaDgGFZvFIQ8A==
X-CSE-MsgGUID: kq/AMjaTSCej0sbmkw4k4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53659875"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53659875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:00:58 -0800
X-CSE-ConnectionGUID: aKl+npl9RqatEeRn23T88A==
X-CSE-MsgGUID: ejdD6TGOQMyfPJe4Loq84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="149771007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 03:00:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 03:00:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 03:00:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 03:00:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWwwBF0Z4ezv/GaN8OEJEu7oR8gI1Dm7FhjzSRi1Rgo7zU+zVGoBoSMZJcxInTRbvFpE5iJtTrpWpXn5AlOF3J6GYXyCQ+B94UVJ6ocx7tawwVnXBQqjAechfarHRCP7MpkdiF2cGaLSzi1+MrixrqyN2cO56QZ3eBAKZa/lmbDVI50hzONnqhi9AZtwTpTO9OtTd3dFvl9Y7D+pO7X6lcPv0SXs7XCPvR4IzY7wJtVKGogxR6nOIs2Ser5PXoRZhWWZwKWim7aU6Q7PIMkpGHJbM0NJccyu5MAVXAxixtiYR/mrOMdiBIulyxe70NPStuZsjSX+vKha2qwDkHPdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6mUqnsWOjugGyPOTI1BYFUccLdsBlw5S0MZbiF38SI=;
 b=lwYpz3Idw7LUDryoQkpomzBDz0hYFq8YF9/dV2RPSEWsPc3KiZxE3sWieJ3a2bFIYWvdzSJl02iTKOERefWUv0LP6gTL55TnIfX30GxUZH1zkR2TeGlE+TCVHy2B9DnpBEMjIVsnqKSNq0M/Jbm78FgngwVQZhxkNYWKDerHSyDuQ0WjVSRNsVqlDoZcgoGXIKdEH0bwUsXSAG6BcCPMEA1uebo6LT5uG35jgOTaVzczC8Q3x4VLQSEALl2PXddyTLvW1+zHZdY4osIDpKuOBVTQf1KXGkgEFClu104BGikRHN7V3U3Yhg9JM5ncE3BXFeHFg8XzbFuQgxKPdFzovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB6884.namprd11.prod.outlook.com (2603:10b6:510:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 11:00:51 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:00:51 +0000
Date: Thu, 6 Mar 2025 11:00:40 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 0/4] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <3de2rgkr5lwzqs2v3rvmyds5zsjtj4eoitsojs5kd4bl545nn4@rzkcinr6f2bi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB6PR0301CA0090.eurprd03.prod.outlook.com
 (2603:10a6:6:30::37) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a794d8-1d5a-4421-65cd-08dd5c9e285f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmxyVGpDcFRPWUx3dnhoS2puQ1JIS0xnWEk1U2t3RS9BYjVpMlZ6ZGpuaVZT?=
 =?utf-8?B?cnNmcVcvM3o4Q3NvZXFlQ1l6em4yQTNVQUlwMnRvUDZIc1dWUlMwMUxzNjhD?=
 =?utf-8?B?a003ZlpYdG5YZjRidVFOOHZCdllUa3pQaXNWSjNXYVlXaFhwVDRUUUk4akdY?=
 =?utf-8?B?V2g1VDNWMEJpaklGSG1HSldaSjA0UGtiWlVTcTgzb2tqNitFSzFKaVZCUSs1?=
 =?utf-8?B?WEMzd0hEZ1FGQmI4Qk9ZNmliWWNqb1hIaG5vUTVrUDQxR2xWR3pkMHpZYnJz?=
 =?utf-8?B?MlE1enEyQzVOaUUxTm50TjdzTk0rTWJMY2FLK0xoYUFLUU96YThSSnV0N3Aw?=
 =?utf-8?B?aExNRXJFWHRHTHFNdFdSTWhCcEViVThBZXRjWlM2a1dBVjEyWVM3aktSU1NY?=
 =?utf-8?B?L2xRa0xLRTVJQ2hGVER6cFYyaGZGa1dmS3JOVzlreCsyUDdMRm84ZDFiQWdU?=
 =?utf-8?B?ZjJaZUdpV0xQWTN2TXBMWmhuczZDNkFlOHRJaCt1Q1c2ME40MUVDTXRHZGdS?=
 =?utf-8?B?b2g5c1pXa2hLWEg1UGt3cG4rcGlCdXl4NWZuOTFES1J0YjNtVkl4aUx4OW5D?=
 =?utf-8?B?Um50U2lzaDkvWFltWVNVSEVCWXpnYlF2bGNHZzZCeTRQbW1taE95bG9pWTRa?=
 =?utf-8?B?V1BpMmtLYVd1eERkSjl1YlpldWFjNVVDVWZvRUZMeXNvYzh2eXRhTnRIcm9m?=
 =?utf-8?B?aUFsZm8vNEw5Q2xvandIUlVGcEVIdGU4N0FOd2d2aVowcHk2cDIvYy8wazFn?=
 =?utf-8?B?U25tWk5kNDV6V0JmSklsYlBoU2JIMTR0bm96VDdCZ0l3ZnFubzJMYitWbVg2?=
 =?utf-8?B?R3QzOEZOMUIxazRpdU9rZ3JTbXlKMnVBQVNvdzFuQy9Talo5WFRGLzBVRVpI?=
 =?utf-8?B?TnVsUkdVS1MzYUc3dXdZQ3M0cHprUnpYR1FDa3FYNDdMNjdlYVF6dVlxaG1D?=
 =?utf-8?B?M2N4aTJnRi82UUQzQUVJZnpDc2lHTDQ4dkFSMGxJY1FTMURNUnFQeEtIak9x?=
 =?utf-8?B?amdEU2dMcWkxaElLcWNYZ3VkY01MZzFjdFBUN09oZDEyZnlRZFB1WU9ubUJw?=
 =?utf-8?B?NUdzL0pXMTZNNnlKMTdMU01hSC9acnJTL2ZpcThmekllQkUvWC80V25qcDcw?=
 =?utf-8?B?ZnRaanpuTHNjZHZyTmprZWtlQnJVYTBDTUNSM1FiMXBLN2cwcEt4TjdZdWRX?=
 =?utf-8?B?akRPbG1GK05XQ2NEY0ZnZ2lYUzNFTU50SVpvUmVKU25GU0FhdHFZV21zejB3?=
 =?utf-8?B?aGRNUkdqYW02bmswQmlvM0ZVYnRWa0JEMWY4cW9RanJ3VzNRTVBBUUlPQnIr?=
 =?utf-8?B?UktOc1A3QUY2VFg4ZGx3U2pGYTVqdzE1ajl5aEROYUlObEYvSVFYdmU1R2lo?=
 =?utf-8?B?aHprY052S0Q4UEJHczZzbEViWkNpK1RNcFQwbGlRTFpHTHZJVVVpaVZJMFVt?=
 =?utf-8?B?TkROeW9MVGJKM05yZjBwdDdBY2ZBaEJ0c2xHWGE1bGUzZHExU2JUYWdIVGM3?=
 =?utf-8?B?SzBWNFFibUZMMlFQYnhnaEhZbTlEQjNvKzIvQ01hT0VNdG4vczJHR3BmN3NN?=
 =?utf-8?B?eS96WW81Z3JXWTFhMSsyQ3ZTaEJlYUZuRjJucW41QmVCTUMvNkwyVEhIbnZE?=
 =?utf-8?B?OHUvN1B2WXlNcDJPZEIvVWR0cjhBcCt1THFqTnRYY2tUaUpvUnBQZk91Zzky?=
 =?utf-8?B?SXpxdVRyR2tBY3FqOFRCRXY3cTRBODVSU3kwSE5BendhOFBQUjRSRFhJelJC?=
 =?utf-8?B?MnNSUDJMZVNicHJ4UFluanljTVBESTFKbWR0aG9yRTBGaWlCRkpVUVJSckdp?=
 =?utf-8?B?M0Y3c2ZmSnFlQ0czVi92RmRubUYwdWttd0dmYlZpcVFLNk5wQkJtZXRMRkh2?=
 =?utf-8?Q?b9Hpf+97mXv7m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lOeFhGaUk2cFhXbk5WcU9KbGhuZFhFSm14YUV0R2ZyRkUySEZaVHhJSFAz?=
 =?utf-8?B?MjlOTWtLeTRoM3duZ0tlYTR6RGc4eENhY0MzdVpPUWIwcGMyNzRjb3BGREN1?=
 =?utf-8?B?b0NNUjhnZk90N3gxYjhKbksyVzZ0YWVPNlJSQzdUcGo4N2p1b0RWZWpZMGdU?=
 =?utf-8?B?Kzdvc3JoQVpZbTFIbENibGdTZk5oUzBtMkpUTTNZSTVqaGl4bExxdDZDNjBY?=
 =?utf-8?B?SjdwcGtIUjMwaFZ5MlBrQndjWmNSdXZZNDBydGlBOTJSMCsvYU1CbHd1Qmk3?=
 =?utf-8?B?cW16RjI5U1JybG9ITW5RR3NsZ0pJOWcvUCtZREJZWXpWZCtZOExTT1p4WlVD?=
 =?utf-8?B?ZkdENC9wWmhxckR1MXgrR2ZZYS9XcW5DbENSayszcXRJY3ZHVGRnQ3E5alpF?=
 =?utf-8?B?bURSZkFMVklmUkxsS2VpZmNBYzJuaE1RWnVYSkkvU1k0L29Lb0wvb1dqV1pX?=
 =?utf-8?B?M2RGcW5JNkR1SHUrSFNyckcxVjhobzJZYzRDaUZ6S0hkMUVBNGxDcWcxUVY0?=
 =?utf-8?B?RDFqUGVQcGZKdE1ZcHB3QkpJWDZiQll5V3I0bG1iMmloNEFyQjVVZ3U1Q01x?=
 =?utf-8?B?SVhRZkZhY3h6R0l5cEgxTWQvUHVXT2VXS0luNk41Z3p0OGtwMGdVL2M4Y0Zl?=
 =?utf-8?B?dThyM1MwR1BsVHdIcVdLVVBwUTdCK1o2aWJjVmE0QU82RDBMMEQ3a01NYWFv?=
 =?utf-8?B?V2tXZmN1OVV1NXNoNnR1eDFLbmhEVmdTZ1g3SFpGTDBWVjgyQ2hhbzRpWWdy?=
 =?utf-8?B?bDArNDdvZG5YaENTZGMxZ051VFFTY0Y5anIrUFhxSnU2NmVVdnpJZHhNSXhY?=
 =?utf-8?B?bGtjTTRaTytVSE0zQ1U2K2N3ZGF3N3lwZkRxTDdyMUFGOWNVcHpya0I0TDNt?=
 =?utf-8?B?REtIRXBnTlA1Tkt6VnJVRzJ2alhaaDNTbklVbE5RdHFIem91Q0h1VVNpZFAw?=
 =?utf-8?B?QjdaK01WZG1WYU9mdG5FckZPSTVRbGRZR21NOUlnUWpBRmcvRi9VWWhGL0R3?=
 =?utf-8?B?QmhBOWorRFFsY2szTkMzWUs5RDVkUkpkRXpsWitkZEpFNmlpdnNGYW45S08z?=
 =?utf-8?B?YWZtN2ZJUnBMWjRueUxCSkJ4V3JFRVdETHZiQ1V1eDlXVWR1WnJUcUR2WUVa?=
 =?utf-8?B?cWVKM3BnZUhtemVUdHRCR0JQaFRadUxVSlpSSkVpVXNGOGF4QmFyaUwyOVRY?=
 =?utf-8?B?RWFaMVJEWWNuRkFNdEFvRnByRFMyckEwaGluanExSXo3Y3I3MTZFNHdhK1E5?=
 =?utf-8?B?dWk4SHZ2bENwbWhQc3pON1JIRXBDK2FRb3RtMms2NW85VjFJMGlURW53bEpO?=
 =?utf-8?B?OFVvSm9tK1dpUFlFUUFVNm9vc08rUjlodDh1K0ZhSzdiRWJQUXFSMlVweno5?=
 =?utf-8?B?NER0OU90MTFLU01RcWttZUlhZzRmZ3pyMExyZWgyakhsaDZ2N2hCYTdRYXRs?=
 =?utf-8?B?ZGtGdStNc2orMTBuRGdhMkRRdWJmSFBQdXlFdUE1U2NYVzkvbnc5WHo4K2kv?=
 =?utf-8?B?L3dzaXhXQjJXNzZ6L0xyN3VuNGpjNFV0b0IrQ1hyQnYwcHdEMHoxSVpBNVRC?=
 =?utf-8?B?UE9VVXh3Zmh1em9LMXRyN3N0dEtXeUtKeE1hMW55elowa1dZVGhJbFg3YXIx?=
 =?utf-8?B?M1plQkpQU2VZZVRtY2syUkNjd0ppazdpWlNzbUpoNnVyazlFTWJHZ2srZ1Az?=
 =?utf-8?B?N2dMNmZ6U3gzeXcwV0FucFduV2E4aFhjYlhreWN4bnRFdEFPcy90TVpLQnlz?=
 =?utf-8?B?SHorS3dsK2xvYy9YMXlPL3JBQk5PSlZTeDZDakhJTENkTk9NNVp3cEIyNnM3?=
 =?utf-8?B?cXRxQVppUVZXU1Rrekw3NHJRQTRGZXd1MjF4N0YxWjdBSHA4aWpqNDBiWlov?=
 =?utf-8?B?SWlndnFQaDE1QmtySmdPQ2NxZDVLMDQySkJIN2NmUVlTZVQyYUdlZTkwS0cw?=
 =?utf-8?B?NVpvTW92Y2NrM2dUVFBVZktHRmk2TnVFckRHZTJ2ZFNBc0lwS3RxbjJFckxG?=
 =?utf-8?B?bi91Q1Z4NTlabll3U1pFY3kwNUVYN0ZCMUxONGJwNEhxY0RJRm5SZ05ubGtH?=
 =?utf-8?B?MXFIcEdFYzBpeFJ2WkNtY0F6eFpoOTZmSmpOZC9ISUFhYURmT3NCeU1sMHRy?=
 =?utf-8?B?eFVZdlVQVSt0QmJESmwrMzFoWFgvQmYrdW9PWlRPcTBQaHNEUTNjbHlBQm5E?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a794d8-1d5a-4421-65cd-08dd5c9e285f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:00:50.9635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ePVYYPQeLD7G5GeQ6p22lx1QrEh5crFhfSsHWOaOlfdH8d9PXGORV+cjuy8Vhe6R+dIplmiG0dKcHFEI2F8TSUfvFp53sUQZXnChFD4D+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6884
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

Hi Janusz,

throughout the series you modify the code right after
introducing it. How about changing the order of things a bit:
 1) order the functions in a symmetrical way between
  register/unregister steps and group them as you see necessary,
  (At that point you would not be fixing the issue yet, but
  prepare the code for further changes)

 2) then introduce the new flag along with all the labels needed
  for clean unregistration.

I think that way you could reduce number of patches (and changes
in code needing review) while also fixing the original issue.

Overall, I believe this is a good effort and much needed change
in registration and unregistering process.

Best Regards,
Krzysztof

> Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> drm_dev_register() fails"), we may return from i915_driver_register()
> immediately, skipping remaining registration steps.  However, the
> _unregister() counterpart called at device remove knows nothing about that
> skip and executes reverts of all those steps.  As a consequence, a number
> of kernel warnings that taint the kernel are triggered.
> 
> Introduce a flag that indicates device registration status and raise it on
> device registration success.  As a minimum (first patch), when that flag
> is found not set while unregistering the driver, jump over those reverts
> of registration steps omitted after device registration failure that are
> not ready for being called unconditionally (and trigger the kernel
> warnings).
> 
> With the second patch, also jump over reverts of other driver registration
> steps that were not called due to device registration failure.  Some
> unregister function calls, found implementing additional steps beyond the
> register reverts, are still executed.
> 
> To simplify i915_driver_unregister() code, the third patch makes sure
> reverts of driver registration steps executed before potentially
> unsuccessful device registration are symmetrically called after
> the device unplug.
> 
> Finally, the last patch further simplifies the i915_driver_unregister()
> code by moving two required steps down, right after device unplug.
> 
> The first patch may be squashed with one or more of its follow-ups if so
> decided.
> 
> Janusz Krzysztofik (4):
>   drm/i915: Skip harmful unregister steps if not registered
>   drm/i915: Omit unnecessary driver unregister steps
>   drm/i915: Fix asymmetry in PMU register/unregister step order
>   drm/i915: Group not skipped unregister steps
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c |  6 ++++++
>  drivers/gpu/drm/i915/i915_driver.c | 18 ++++++++++++------
>  drivers/gpu/drm/i915/i915_drv.h    |  2 ++
>  3 files changed, 20 insertions(+), 6 deletions(-)
> 
> -- 
> 2.48.1
> 
