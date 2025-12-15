Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664ECBD457
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3D10E3DC;
	Mon, 15 Dec 2025 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmBC+h03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB810E3D2;
 Mon, 15 Dec 2025 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765792237; x=1797328237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZVN+furnVVB87LfqVZM/+qZF2SydkFgvvMjnP3mznyo=;
 b=hmBC+h03MfOVS/6jZUVcCF/AatxfeELABDZFNBYWSTXSJZFCRiFDUQz/
 1ZxYua2tgq/YVWQ6qcvvpTbWny1ukmfUnwjtG3DQ3x+uSr0Gm5k8Rf0wU
 mz73jQDU4hTJrdLq2NIZsMDhj4l0oFAzanGj7EuEGqyH6VFiExegOlAyN
 MrpRoNEtV6dl4a+ADqXuDOcHpQfN0jct5JRyt3LxVU247X93rjAjRYNWQ
 pXp4yy9hPOOB+/N63leLuJTcWUt5PkSUZlUVGfya9z/HpoMENxOmX6piV
 fY9V0C18d4mwqgKjKdXMIgB594RzzHvaEwN2fueLjAJq2hCPoACT59NC3 Q==;
X-CSE-ConnectionGUID: b93krlvLQP+PHw4i6ejBaw==
X-CSE-MsgGUID: MH7IBApeTbmKzy6LHTwpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67441815"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67441815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:50:31 -0800
X-CSE-ConnectionGUID: bBbZwHSfTAe3E2QHWZ4yYQ==
X-CSE-MsgGUID: hB4APsb0Q1eKgG60Kxd6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202789455"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:50:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:50:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 01:50:30 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnIi7atzBlSO5qzoydjUxa0wqSrtRYpq3lB56nbC2tnqx/lkgrqepL4iuqOu1YTI7uvCHscZqhCBelY7P8UOUwiuBHJ8xVpU/MqruEp/1Ig9c7FYtOd0u0Mw8fl0RbrWL6YziBHNRbaJn1vKtHE9UCDvk2DOsRlcEr8EAOtObqYB//j0ncN7dP5QGZrJlFCaVWXCspwvGb1lpryIYUPoiBo4XgOvYCeR0twKLQUKtqhvi+D7Dc89E4i6gXFxTYZvyJ3sd73tr43picVaiSP93s2lZuOmalXszswPP0d+/ALJBpb2NFFso7r8tZg3EEqDPNPjX2Lr8wSfB9Y4Lmad2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOBZyaKE1hGLGXAyKuNfgHcV8ZhEaI4c2ENlP/rr7I0=;
 b=IP9YD9F38iovQCAYNmiGdpAYEgW+4Zy1tWfpLmXxjxREFg/0PakJMvYNIA0/Rra0vgrl5tEq6sRLF7R3/h+cBP19nzo+0XBlsUZ2QpD8GQB23dXo6r26nhfIOQcrDcXl7SwIT46aRZuJJBR0QzprFxzLoFG3x85LdLw+MZkMuCryRB5butsro+Wwh9wv5CPPmhlC9nKEYVP5hUUzSUx62e11BEHPx+t2kwd7w1vvqgcCuFmreqNrPDSZY1j8A+e2qFTuyCdFovQjpaXIJjZoLDGojy/Ha8ASP2sawz2AvHJ/ax/WZ+ZaGrQtExXtvDzt0a/4fiZ0cWJrhCTIVfMYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:50:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 09:50:23 +0000
Message-ID: <65d38da8-3591-4e80-a19d-0e15aad41710@intel.com>
Date: Mon, 15 Dec 2025 15:20:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: fix build for mm_get_unmapped_area() call after
 backmerge
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>
References: <20251215092706.3218018-1-jani.nikula@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251215092706.3218018-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 86387328-75dd-4d59-8610-08de3bbf5d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VllGdmVXOFAyWmpseHp4VGs0K1hVUEhFYjl2c1FKUWJjN3h3b2JYMk02QUxX?=
 =?utf-8?B?MEJXRmZKZU5KRStDbTR2cjR1eGg4S1JuK0dmSXpQZmR5WWI0N3RCNmFtUWlX?=
 =?utf-8?B?L2JuQ094ejBQa29PYzk1cEtWTFdKQ1ZveHNCTTF0emtHMkIwN296dEhQWm9H?=
 =?utf-8?B?RlM0OURQbE1FZ003cUppSTFpaFF3ZkgvNkZraGdNdThWd01qdFV3TmNCTGRn?=
 =?utf-8?B?TEVsQlRLN29aVldRMzB5WGF4U09uRUtuaDRiZFZmdWxFN3NNc2syQVhHZ1dM?=
 =?utf-8?B?QTJoZkZNOUdGa1RtOXU1VFlYVWRLMklGS09HeHZhd2ZuYkJicEFTK1EwK0VC?=
 =?utf-8?B?RlF2VEhZREZwWmYzY3EwaTZLNDVURzFjMHh0dE1ZSkZrRGZTcWdGVU43Snc0?=
 =?utf-8?B?V2dYaWhvNzVNOXhUSElQcTNnY3RHMEVibVkxMG03Q0Z3VVlPL0FQTEwrV0lq?=
 =?utf-8?B?UEQ2VGs0d25lR3NUaEMwVU82c1ZqUCt3NXhiRXBjbmJ0eWNmQnovRUhObFBW?=
 =?utf-8?B?NDNvYkpmZExwZDBNdmdEV3JxTk9ab1orTC9BdFFWRmUxTTNia2k3ODNtVm1M?=
 =?utf-8?B?clEvQm1XNGxCSkRhZk5FSEtMQS9hVkhvYWtiYk5CWHRGeDY4N0dyWkFzaXdL?=
 =?utf-8?B?U1JVUHo0MU4xaUJqOVQ1dGJzN0VsQ3FoL0hkU2tHZkZJdHhNaSt5RFI1VFdC?=
 =?utf-8?B?eHJVS3hpYnlPeWtDQWtUSEtZSll0azdaZHAreGc0bXU3ZzMvMFpRb0lrbytm?=
 =?utf-8?B?Rm0vUGNEWHNTSXIyemhibzBubFJ3MHZBeVJMNnZCOWlqcklzNE1VbCtYRnBQ?=
 =?utf-8?B?Rk5YWVpoRWFveUJ2YXJhYVJ6M3VnSTdtU0lNOUlGdlFQT0k0OVhRZFpmVDlI?=
 =?utf-8?B?L3A1dytUb0ZSMDJRR3pqa0cxankwZjczdmJ2L05USHQ2dUdzVFFtclpOY25N?=
 =?utf-8?B?c3BkRmpvUlVINzcxSnEwS1F0UWREcjBabXZMVXN2Z3EveldNSi9lSTZPMGg2?=
 =?utf-8?B?YTJ3MFJ0N3k2Z01oRkJ5NjdEV3A3NVJkbFh0UmpNWGJOTzdGbk1PL0Naamtt?=
 =?utf-8?B?UFpqTGlWaGIwdk9zUElvNTNSdFNaWVIwY2NHS1hhOFg3dzl4YmphRitpc3Ja?=
 =?utf-8?B?bkpzWm9BWnpNMGNwRmtIblJiQWpXdlJWc3hJZmlBN2pMemFjQ2wxb09Dak1T?=
 =?utf-8?B?MXoySWFscEd2ekhidXJXRlRMOFpNYXBJMkkwb2U0R2JUUFhMNm0rVWxSVks0?=
 =?utf-8?B?cGdHbG1MWWlGRlMvTmxrVWRnTEQxVGtac21ndlhhdUdrbENaTmo3NEVxSTgx?=
 =?utf-8?B?YzU1WFEydWF4K0lnZzNtbXNXa2Z1ZFpwc2lOenBiTUdJSnkwbE9BcHVaRk5F?=
 =?utf-8?B?NEJmeVBXeWlVNUd1Z2JiK0trWHZPbnJXTUJ0SFR6ZGIxOFhhZ0M1ekVFaktw?=
 =?utf-8?B?Z283OG1SMS83Y0cvK0JJZnVPemtBQldOaHI3NFJMRGdRcUdrR20xL0lxQisy?=
 =?utf-8?B?d1NmeGVYVks3N1pYc0RTN01ENkhtTFRFYXliT2xiR293MlZiOURMR1hwTlhz?=
 =?utf-8?B?aFIxZ1RuUFhKKy9HMmg4ekE0Y3U4L0hkVHE0eld2blJTSTFLaDZLTTdidElT?=
 =?utf-8?B?UVZxbjFKVjlSM1VtcGJCK0RaeVJLS1FjKy9wTUV0RmpKSlZjUDRQSlBTanFo?=
 =?utf-8?B?c3J0WFAxdGJyL3FIWWV4Q3o3cmhzNkZmKzU1aXdkTmdNTlN0aXVST2U1RUtn?=
 =?utf-8?B?eVp3T0VUeXRYcnhEM0JQQXp6M0Z1VDVpSVZXVEtyOXNaMHNCNFJaWGltRW5s?=
 =?utf-8?B?QjdIUko3WTRRVDJCYm9EV1NKR3orS2luVUpwZHhaZ3RvZmt4Sm5heTE5dTg5?=
 =?utf-8?B?NjcveDZ2RTArTk5RT0p1M0lBcWRENlNrYXpWY01aM2F2ZFlmUGJrODhKZ3dG?=
 =?utf-8?Q?L/3pebmFsBVbXaSb/OjjVQSclq0DMgxE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBvTGl0TlZXSmg5WE93YXN3WGM1aUVXNE5BckNMZEwvVFAwL0s2Q2hkTHhx?=
 =?utf-8?B?NVNvc1B1UzhlaTRUZCtVT1R3K1kycGQxeHJMNS96Qkk0TmJGOGR5amV1bXhN?=
 =?utf-8?B?N0x4cjQwRXN2bU9LNW1EN05xaFNQa29JMWdOMlBFTS80MkRqWkJWUUsvSzFX?=
 =?utf-8?B?Y3p6eW93ZS9nVjFvWE1ycWZOT01va3RyQVEzTjQya3g1ZEFqRzExVUZKdWRr?=
 =?utf-8?B?NVE1cThrTVhjMnp4di9KdzA1a3NCMTAwK2N1RVlQZWZQZ1JYMlFrVzF2UGJv?=
 =?utf-8?B?LzNzWXByeHZOUEJKZ2hvNXBpejRpSThKMS9mWm1ZUnIwcWNXcGlwdUxlbm5x?=
 =?utf-8?B?cmZmQWFFUDJ1ak9lbERQY2ZHKzNTSU9lT3h5cnppLy8vUk9TV3dHTkk3dWp1?=
 =?utf-8?B?OHFMVFNjT1h5eDNnOFNBclZxSW5mYTR0V1VZcDdzWnI0KzFydkpzaTdFTjJF?=
 =?utf-8?B?QitwM0tvaG82azhaMWgwSzZlMGxaa2kwV09WQUMxT3I0QTFyVFVGZzIzVjBF?=
 =?utf-8?B?UE1aVStEY2FDNnlDaHQ3TWZDQVQyZmM1S3RUaDB0RmQwRjMrcUdpV0pwRlZS?=
 =?utf-8?B?SE5mNTdBQ3A0WVlqaU1INm94bmN5ampLZEtzMlowaW1Rem45N2RvOUtlTlcr?=
 =?utf-8?B?RmRvUUduSnoreDFmY24vOHFnYUJpQ0pyWlR6eVdHbzM4VXc0SVJjOFFMVFFJ?=
 =?utf-8?B?Y3ZpRjM2OEdsaE81Y095STlUcVoxeDlyNjZPNWEwU0JUdFVjUkQ4amJyUFhR?=
 =?utf-8?B?dFptVnc0RWRBc3cwaEJzT01zbDBYUHdaQTdnd2R2SHQ5cjNCNnpsUFZIRldx?=
 =?utf-8?B?ZzlWNGJNUGs2bnQ1Y2c0aEdSV3VDT25ZUEMrbXJJT01TK2JKR2I5NUtadCt2?=
 =?utf-8?B?YmZUc0l6ZUVMT3BETHJ4NlVLK2xUWllXWUJsaFBwWHVpa2wvUEQvc3VxT0lC?=
 =?utf-8?B?cmswSlF1cUsycVNFTDlhcWRoR29xcCtNMTVMQ3Y0TE96WnpxR2Y0a0crRS9Y?=
 =?utf-8?B?RUpSTXA2WG8xeXZzaytMU3poL3phcU1zNnVhcXJibGo2ZG9OSTErQ3BTL0gx?=
 =?utf-8?B?dDdZdjBKYmxYNGpUT29BaWJBbDFvU1U3Tm1CZmNlTmdyaktyYThUdzFGd0Vq?=
 =?utf-8?B?N01RbkduakVvTENlZEx6aytDWHAyWWpvYllycnFGNWtsbGdQbmhEVHFwV2Fw?=
 =?utf-8?B?VjFBQ3dEOWFBc0JPNXMvVmF6a056V3RENUVZZEY0TldOL1ZwNkNiMzVaWS9w?=
 =?utf-8?B?R0NvbnY2Qi9CbUhRNHRjT1ZicUh6dkw0TVo5QzFkdC9mdzRaekdweXRIZTVp?=
 =?utf-8?B?d2FoamcyNnZjM0kzMzFUeXVqWlB1bXNnblZGWjg4MldvTG9uOFh3VzcvaHZw?=
 =?utf-8?B?eWVnRDFPek4xdk94ZTg0WEtwRkNyU01VMnN3WUFlVGo1MjFpU1lKZUNRWXM1?=
 =?utf-8?B?YUFiOHNoRzJpZzE2dHZjVFQ1Z04xd3JSMUJSV25xbjVmeitpZFVvRFd0MkVp?=
 =?utf-8?B?SktBTlN3akhvc1VsYVNNR1RRQnh4ZXFZRGpxRlRtUnNINGxGU0RlbDNKZmQ0?=
 =?utf-8?B?SmFJWENkWUxpN1EwdEsvR0krdFVQbFdPMmQ1TnJOZjdzRHVuTDFqbWprN2py?=
 =?utf-8?B?Vk8yUUM5VjJZNWpPaTFEL2tFTFErbnpKMEFMc1IxVzVlNUlqQXBqWHBHaVJS?=
 =?utf-8?B?a211NnhERXZpMFZML1krQkV6dE5QWjhBVkVORFprbStCcHh2dUt1Slp2MDNl?=
 =?utf-8?B?STNsbFh6czhXNWRZQnFGK0NVSW9FbEJHaGFOZExGWlloN1hlcnJLS0pzS2xG?=
 =?utf-8?B?bHNPMUd0NkloWTAwTzk0d21LMFkzb1picElwdmEwdlh1aEIvcG9pOWI0Vm9l?=
 =?utf-8?B?VVM1YytRdjd3aDEyT09aZWl4eHZtclBkcnhMVlJJdmFjNGdsUmVEZWdJUEpm?=
 =?utf-8?B?cElOMXN5bHlDbWkxa0NXYUhNbzBzZGtGdFZxYWU4NFI1Ukl0bGl6QXhjWlJq?=
 =?utf-8?B?eXRJbGZvdjVsRHZhUTB2WTNrZmxGNFFBSlc1bDJuZFF1RDFFMFJWZGg2OU0z?=
 =?utf-8?B?V1ZnRHFXWklOZ1l6eGJNNnZuUnVCTjIyU21TR2VTc0d0Q1lob0I5bzJhWUZh?=
 =?utf-8?B?ZXcrV1NneG1RM3h3QXRuT3h3ZjBnT1lOZlcraXoxSWxMNUVjUUZLTTRBNXZw?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86387328-75dd-4d59-8610-08de3bbf5d9e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:50:23.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nivsminYTeipxS7wH1EgfzHE9Kd5fGpf8FKYr/k+cwA+1mHgtXYO5yPjE+nrhNZ4OZ7ozaTDxGLfTKdukY9S2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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


On 15-12-2025 14:57, Jani Nikula wrote:
> Commit 9ac09bb9feac ("mm: consistently use current->mm in
> mm_get_unmapped_area()") upstream dropped a parameter from
> mm_get_unmapped_area() while commit 99bda20d6d4c ("drm/gem: Introduce
> drm_gem_get_unmapped_area() fop") in drm-misc-next added a new user.
>
> Drop the extra parameter from the call.
>
> Fixes: 7f790dd21a93 ("Merge drm/drm-next into drm-misc-next")
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bcc08a6aebf8..28d6792112be 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1303,8 +1303,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>   
>   	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>   	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> -		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
> -					    flags);
> +		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   
>   	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>   						 flags);
