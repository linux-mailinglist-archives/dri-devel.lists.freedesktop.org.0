Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3740D3A498
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0CA10E3DF;
	Mon, 19 Jan 2026 10:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kf0lAfR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADE210E3DA;
 Mon, 19 Jan 2026 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768817835; x=1800353835;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4FkVEjkUapwYvyKckumATNO9QWlLiQR0QHurj6lLsTo=;
 b=kf0lAfR7C7ICNUjyvYS93YGSmsr3aqCBqLJWZjY6qqSYJrdHkoRNPsIp
 ghbl6ZnZHW/p43djRzEQ05ajSeT/s3RKdkJxqtvlSujoxc893uTna8JJy
 F+Q9Ce+yTGPwp/6Rp5yLJvkE97VOSV0SDxXgNzI19uCxbfiTW8F32EegK
 DdUPOwjCHDt+k1ZAU0rQRKNqqyvXDSO7kqPPANYsKtCxixGuL721A0T1i
 fyhMZsDjLhELvimC2Ys6nTfoMcjf1MA4vL1nbpitdIzRJapvPxoHqD7Fj
 SorLrOul3GMTSk529YTen0Wm26SuOXMWZXtmt0TJKZwxbg0UcMe1rnGa9 w==;
X-CSE-ConnectionGUID: 8pFKv/SYR/aJ12Ew3uGdmQ==
X-CSE-MsgGUID: zgG5zd3ySFOmhHTa6sOwsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87441821"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="87441821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:16:46 -0800
X-CSE-ConnectionGUID: +K41GVqBRdyIPY4fpw4C4w==
X-CSE-MsgGUID: JfF20nVkRNS2JTKcf7E5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210321711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:16:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 02:16:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 02:16:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 02:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvjHbCJsB/uNK51S7a2G+DKlKzvoM+SRN3vJRhb6g7d0wVfo6uP/mGKPqwfNokpAGOspQqsNoENQqyYrvcwddYnTSo+2zE9GolYDGlzCTgoxAmtIAyxUuVqBxlMN8nSVA/wlONm1Ynsye/bFUZXGQtI3nVtDhQM639mT9uteyXIrG/U/my28yTTW6Bq+Xj05fPKhTRulZwwOQDM5Rh7plyFzLj9cbaiejNZs/iW0L7dyI/upgyBqfzvq3cSQ+C7jsr6azNPEjsKXpiKnGnIV8HKRcWF50Aniwi0is7OUOe9jfLsQ+uLVMrkfE+3iUCcG8vOmaTRgM0qKixWmPG1mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PryGviWMr8+Yxoh8YK7eSuoP7QUQbboMa/1x88lpdmY=;
 b=v2JgTsYvlfGXCHE3YUUEKfSB8311PloAW1b1uivnIEvbNZqOssA53zZzh5sM40RUFkOaAHjx+3Y64uCuIlok4OGLLuJVkzUSlu1DBK+eYQrVyW98U1YtcHcm80MUbajIqrUFv/zNkKiuycCuV0gXNhsq/F/iEQAdDOJsujui3LFkeDIUawXXlBDF5NY7mFwDykFyfMNoWTmusNKJCInuAfVM6hymFrvT2mV5XKD9vfi+9QYjalbtbdOcfXzLO4BLRDkHASMfptDQOWZOTAOLOcZCTsKjhb+/z6dlhpoALNlsdQio++L4Ni/rf59ZWTfk3yyCsWJgGmgIEHBMiOtFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 10:16:13 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:16:13 +0000
Date: Mon, 19 Jan 2026 10:16:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2] drm/i915/selftests: Prevent userspace mapping invalidation
Message-ID: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: LO2P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: c32abc31-060c-4e11-76a0-08de5743c622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVpySVl6QXJQM1AzcHpCaWtwL2dYbllvVHIzT1dOSUh3K3dMOFAxem8yRDJL?=
 =?utf-8?B?cmFROTBvbVZVaGprVlgzc0tsRGZOeEs2d0ltVDcxMzVLMEtQWjZpTmlOTndn?=
 =?utf-8?B?QVl4eVpEcXY3MHByazBCYmNKNEE2SUZzV1ZqSzJHWG9ndU9YWlB0YzJ3ZUNs?=
 =?utf-8?B?OC8ydzJpRkFiRW9jU0RCejFyK003cWVtaitxMEszYnhNcWtIZnN2dUNZVEFJ?=
 =?utf-8?B?aGZQaHVvZlozL3dydGgvOEtLZE56L214cmhabFZ5bU5taVN0YmZyZTBLRVdP?=
 =?utf-8?B?ZkdhM1ZTMjZkSXdha2hEdzBYQ0FRMGRDUlVZQURYR0Y4aWxvUnc5eC8zNEU5?=
 =?utf-8?B?UVhVdlhzbmUwQjlINXVIdnlydEdpamZycTNTaTRJTEdQdEdUSXcybkNCU3NR?=
 =?utf-8?B?YkVVT1U0TURjZHVIYXNqbnpNaHp5MC9kV2IxQjkxT0RRaFRuelJSOGFxclI4?=
 =?utf-8?B?ZE1DTHBOYVFqdC9uRTdmM3pabjcrTi9udE1BVXhVQzBtWU96ZDBJb1FBbEl5?=
 =?utf-8?B?VjNCbDVSY2FvRWxZNTdaSXpDdGd5UktGYisrT0hDL3BxN1BOWkx4RUpHSXNX?=
 =?utf-8?B?czlxUlZsN2hTelIrdlpRWWR2T1lDdXhUUHU1aVU1WGg1SXkxU2hPczZlZTV4?=
 =?utf-8?B?aGRxSHl1TkZTZ1ZIZURDUHo3SFZsNk5sUkRCekJiSXZzVnVXQ2JNVDY4cVo5?=
 =?utf-8?B?VDJkeWxXeE5ldWtmQUR2c3dwUnZacjE3UkFHcnpnTERNM3E4TERWMXVPdVUy?=
 =?utf-8?B?TEs3cTRvVjdtcHZxTWZWNFhrNndFUWttTjc3eS9ZU1JOam5OQ25sUGhvRUt6?=
 =?utf-8?B?dUxxR3NwQVZXdVBDTkVOOXlYdHUwSnRBUzZkVlhON25hcExXWEdqNi9SVHZG?=
 =?utf-8?B?bnhqWHdIVTRhREMyQ05TWVFSdGxWTWdYZHNSSDFCa1VIcmJRNEVMUTVEbWkz?=
 =?utf-8?B?aC9ZRzVrVEhmM1FuUHU5Mm1uZ2FocXo1Rjc0RzdlTHgwN2tXSU51NklYWEg1?=
 =?utf-8?B?YUJsWlBmcTRzcGdwUVp0NWJqNnZsRFU5YWRCQmNHeXJTaVJoM1R1bVBrZWpM?=
 =?utf-8?B?R1JtcStLanl1LzJWcFpxZXpFY3M4dVBQTnZoRHFZd3RHK0tNdnhJR2cxUUEw?=
 =?utf-8?B?Vm16NkNwNU1DamZmbDd5TzdMdGk1NGg0cmpmbHkzYmozTlBxSkg5T2JRWlV0?=
 =?utf-8?B?NFVUMDRpZEpTbFVhZllFK0grSk5mS1hyQWpmWUlYajhBWTlCZ0pRWEJWMWpO?=
 =?utf-8?B?OThYNEc5N3Awb0owR09UUG9OcFNBYmtJNU5lWkNCNEhxOFdXUyt2V2cyNUVw?=
 =?utf-8?B?Y1FpTW5PdjBXeW4yUkVPOEg2YUtZVGZpOGFHT25rV2YvaUpOU2M1ODVhS05r?=
 =?utf-8?B?WFZReHpGeW5UZzQxYzlJdVZvZ0tuR2NEWTJEdDgxWlNDbnY0bnNxcWd2Mk1w?=
 =?utf-8?B?Z2Q0R2cvZ1MrZFBrTG01M3pzYVZCazlFUVZWVlNFZ2wwdWh0bURQQWFKTUVI?=
 =?utf-8?B?Rm5pQlU1bFBtMXFYV2RiajBQUjgwbHBYYlN0TnlLYzFQT2tnTHpIRmIrMnF3?=
 =?utf-8?B?dzVDSmZLRVU2NTkybjMyb2ZNOHNPaGdsZS92UkZPd1lWOFUxUEF0NlRwWkoz?=
 =?utf-8?B?WlhTNDE0NitBRlpCS05qbmM1VU04Ni9KeWRPSnEwbk1XdVFZaUxiRmI5RVoy?=
 =?utf-8?B?R1BmWkp6Zy9TWjBBUU1HSDNEYlJmOEhFOXdmeDFFVHRabCtXL3FmemZOWTVj?=
 =?utf-8?B?REI0VE9OeFVUYlRrTEJiREt5WjZCUC9ENmlUaVd3dDYyemxDVWpOQWxGcCs1?=
 =?utf-8?B?RW8rc3VGUXFnM0tUWlEzNnFlQnJCSVJ0SXNybHE0dG9LVzJab2FteXE2SzUx?=
 =?utf-8?B?YnJOdFhyaFA4NFZ3TmxqdEVlZG8zcWVBRDJ3YWgweUs4K0hwTkhTK0tERlZi?=
 =?utf-8?B?aWlqQVBPN3pVSFk4cTRlMktxSzJoeC9kN3d2TE5vdGZBNmFaRjFqcVdpZFhD?=
 =?utf-8?B?dGE4eEI4Y3NvRE1aazFKUlpJVEVOZUk5cmx4MXFROGJYaEw4SjY5ZGQ2SWk2?=
 =?utf-8?Q?KBqlis?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MitLcFoxQ2dCMCtMaDk5Q3dLSHV5N2hRSVNINGR1MDMrRmYyMHI5M1o0dC95?=
 =?utf-8?B?L2RDWmFpdmhlNXlxRUFGekJUQ0NvR1lsZnI2V1NoUVRzSlBqVFpNMDI3Y2p5?=
 =?utf-8?B?bnl5S3ZyanJFSzZRNWxDTENPZmJDcVAwaHBoK0c4V0Fyai9xMm1zWTVnVGl6?=
 =?utf-8?B?YmVQZ3hjWjZKTzlFL3AvQVZ5TVAyZHNkbmh3eWE1NG9IdlJjNzZkRnVsYlhX?=
 =?utf-8?B?a3p3WGtBRVBVMUpQYUZzZmE2ajdaSmgrcitCZXd3WFk1WGV0SWpkTlhGQkNo?=
 =?utf-8?B?SHFjWHM0b2g3ME8rVVloVG9BTU5qcnBWSitzWVlOMTZrNTRYU1ZmUXk4MFhL?=
 =?utf-8?B?N2d5dml2R3pMVk01Y3VYQk9JUENvaFhFWFlYMUZxREo0YnBOTVJTd0gyN2Fx?=
 =?utf-8?B?OFowT0pPc1Z5WmRBY1MwdG5hcU1ESTF4SUZUdGFBbmFVNFl5aFdkRTl3OW9F?=
 =?utf-8?B?bkFYUWVMdUJ2OFcxSHZ4MjlGZjkvZ256NUJZdmpVZjNzSGZMYnE3K1JIclRB?=
 =?utf-8?B?MXVPVEZSWjVEQVljTnljOExLbm5sbzQ4Z2FVNDA1RjFSNVJTallibFF1blJ5?=
 =?utf-8?B?c09CdjBydTNuS1dJV1E3Q0RZNWx2NU9FRzh0bFZ0OVYzN2RoS1I0R1NEQm9H?=
 =?utf-8?B?U091TUVzb0ZYRFVpZnRaSjVtMkNlclUycklrTDcrOFZaTG1WLzFIMzhsdWlI?=
 =?utf-8?B?QXJacDVoeGZaUVVxMi9ybHQwaDRsVU1hMGNiOHh4cG5mZXJuc2dMbmtUeXJz?=
 =?utf-8?B?ZzMzZ242Uy9DMlFMMllwYTRMeEowcldDNjBZbVh6R2RieGluNXI1THJ2cDFy?=
 =?utf-8?B?QmNBTkRISWtMQWxwZHZ6ditYVVVheG5aMFByeWFmR3NkbVFWeFJpb0p4TjMr?=
 =?utf-8?B?VHJkbHFVMnlwT3daTDZ3QWZuaW44ZWJPR0owc2IrQUIwUTA2VHB3MG5ZcXVF?=
 =?utf-8?B?cHE3WnRKOXhOdC9mZE1JVFU0MytlWVUxVit3ZHVDWWE0WllKS1FNSVpOQUwr?=
 =?utf-8?B?aWtZaHBjaXNRWlo4c05qREFycVRmT1FCRStsQVE2emMwWkx0anFlUWpxTDBw?=
 =?utf-8?B?TTJXQnNNcUpHSWFEMTFpWVRnTXQxMjBVUUNSZzhHMUIwL3ZXQ2NNcnB6RXlN?=
 =?utf-8?B?WkQvK1ZVNGcrMzhjZDZTWEdVcWE0dmd2MjRnSlZmTEw3TDIyRkt0UDRSVFdC?=
 =?utf-8?B?dGNDVlU1MVJ5UHJRdHA2QU91VUJoakJVeFN5cDlVR2sxMWgyVDFSYmxuREYz?=
 =?utf-8?B?RHRGNHZKZXMzWUlKZjY3OHdhSHBTODlMN1VXejFkQUx3c1JzNGczVVZxMmxH?=
 =?utf-8?B?RDJ3WnhwK044Q0FxWUN2UHVOcE1oRkJyMjhPWW5CblJucnFqS3E0VGJjSnZh?=
 =?utf-8?B?SGk4TmplWnMyZkhVQUpNNU4yb1lYNmdnSndOQzhFOHhzS1EwTXk3eXdZV3Zw?=
 =?utf-8?B?QTlzeVhIUVRQSUljK2lKSHFHejE5aHptN010WjlpOG9YU3JXeC9CNnpPVFdG?=
 =?utf-8?B?U3Nod2ZrYzlibjZMWlJyWmovYzlrVnphZVJVNXdLb0laL0ZMM0lCVjdtemtI?=
 =?utf-8?B?d1Q1bDROSWVOdjdHNExjcmpYS2ZhR3ozdGd5bjB4Qmd3WXFxQko0WlBNVS9N?=
 =?utf-8?B?ajUzUm16WGxDL3BIdkFNblhtb1QxSUMwZExHaWtoRlpJcXREWTk1bzQzRkJu?=
 =?utf-8?B?ZGNrUlU5Zjd6eXZpdzhBbHZCV1lQa0ZYSG5LRXVnZVN4aXhrdnFiUFk5Z2xL?=
 =?utf-8?B?RUw1QnFNYkVsTDN3UjBMYzZIU0JURzJ6a0dzU3lyc01zWXNUK2hsL1BPcm1F?=
 =?utf-8?B?Vk5aOE81WW1weklBVXRMWkJ3aHVYMW9sOEFib2FRNk44N0c2dkt3ZFdWczY1?=
 =?utf-8?B?cWxXYzJCT053ZFlzcU8rZURuZ0VNZEM1a2dZMXpUMy9wampoUnNpd20wek1E?=
 =?utf-8?B?eEc1TjBVdE4wRXNQY0ZrTlpvYVJ4QUQxRTR6TllxQ2RUTENnL1FnK2ZvMzZp?=
 =?utf-8?B?aUZiNGRKY1FlL0pKcEJDN29Fc3FyQWR1NXp4bnZGSjczaFN3TjRqRzdTSWZC?=
 =?utf-8?B?ZGJmSi9UcnZJVzJ5Qjd4NkhCc0pCbXdHK09xSG1XNFlrbzB3cElNd0thUVNR?=
 =?utf-8?B?Z2dyTTA1LzFCNzh1WnNuN2ZnRysyK3Z6QnROVzIvYWwyblVSeVRCZW0xeVhF?=
 =?utf-8?B?cXBxZTVDNVdIbW9zOW5VV0xncXdaUG1SU1E4TExYelV0V0JlSThPTHNFUXVN?=
 =?utf-8?B?Vnl4ajFhQnVsY3ZZVmF5RUhpWXh5SUJwTkluMnd0R2U0SFhoeUFhL2doMFJk?=
 =?utf-8?B?U1k4T1BWRk5WY2V5V3kwUi9hQ0RqSlZnajAybGRaVTJEcytQLzcyNzlzd21z?=
 =?utf-8?Q?rim235WpfOLSCU80=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c32abc31-060c-4e11-76a0-08de5743c622
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:16:13.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cREMZmt7P2Uz0W7LawVHEw3jVoLjEQMrxB7oSZgiFc+a/K9yaa/Wo4825/whtCdnFcnMlG8N14k/lWKeYmCjYKYl21z2OBKP0DuxCbpnOEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

IGT mmap testing in i915 uses current task's address space to
allocate new userspace mapping, without registering real user
for that address space in mm_struct.

It was observed that mm->mm_users would occasionally drop to 0
during tests, which reaped userspace mappings, further leading
to failures upon reading from userland memory.

Prevent this by artificially increasing mm_users counter for the
duration of the test.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
During testing I also found out that this problem affects
another function, __igt_mmap(), which also utilizes userspace
VMAs.

v2:
 * use mmget/mmput() (Jani);
 * include __igt_mmap() in the scope;
 * change comments and commit message;

 .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 0d250d57496a..82ab090f66c8 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
+	/*
+	 * Get a reference to tasks's mm_struct to artificially increase mm_users
+	 * and ensure the kernel does not try to clean up the userspace mappings
+	 * of the current task during the test.
+	 */
+	mmget_not_zero(current->mm);
+
 	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
@@ -968,6 +975,11 @@ static int __igt_mmap(struct drm_i915_private *i915,
 		err = gtt_check(obj);
 out_unmap:
 	vm_munmap(addr, obj->base.size);
+	/*
+	 * mmput() is not supposed to be called on task's own
+	 * mm_struct, so let kernel handle that.
+	 */
+	mmput_async(current->mm);
 	return err;
 }
 
@@ -1177,6 +1189,13 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 	if (err)
 		goto out_put;
 
+	/*
+	 * Get a reference to tasks's mm_struct to artificially increase mm_users
+	 * and ensure the kernel does not try to clean up the userspace mappings
+	 * of the current task during the test.
+	 */
+	mmget_not_zero(current->mm);
+
 	/*
 	 * This will eventually create a GEM context, due to opening dummy drm
 	 * file, which needs a tiny amount of mappable device memory for the top
@@ -1293,6 +1312,11 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 
 out_addr:
 	vm_munmap(addr, obj->base.size);
+	/*
+	 * mmput() is not supposed to be called on task's own
+	 * mm_struct, so let kernel handle that.
+	 */
+	mmput_async(current->mm);
 
 out_put:
 	i915_gem_object_put(obj);
-- 
2.43.0


-- 
Best Regards,
Krzysztof
