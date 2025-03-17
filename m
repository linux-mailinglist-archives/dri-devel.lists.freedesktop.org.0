Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE7A65936
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A41F10E435;
	Mon, 17 Mar 2025 16:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9yozP64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE18510E435;
 Mon, 17 Mar 2025 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230632; x=1773766632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0kBDb2yb/NEDLZeXS+VMk0HbcPSgmq+RiIa2Y0l17A8=;
 b=V9yozP64KyqayFDIS8yvBepBI5hJSobTudo1dUGy60hK6c7NFK6GZ3Sm
 LJL2wpESD96WXe8UiiT8tlT/saybPLuHCr9KcOIC07TvRQMsdYrI8aRx2
 YORrmT0ceIbVywmId1zqYDUcAEJKw5/w32rvT7f/rfUDhH3rxZvjQDBP7
 bBUmT7mvvz8Q7iCxmVbK1dMcANjnOcKF2ilz69gC1XF1XzcGWiIXA5vND
 NX5Vkj3J0jRZFaDBHBNt/DIGpRvXRwpsWC0ao/mnlLIX94RKBNGrWMduC
 ZH/r3kuVMuqoHM1tDquWsvsEUrE9+iu3XrPbNI+IQnKKlaqAV1ssUyU0f w==;
X-CSE-ConnectionGUID: sNwmU/ECRkGpRvnGfXVSHw==
X-CSE-MsgGUID: ByiPjEWdSEu70BiC/LMt+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42584178"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="42584178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:57:12 -0700
X-CSE-ConnectionGUID: 4qCBX1pjTj6j4PSdrYeDDw==
X-CSE-MsgGUID: vWQhHIMNQd+NCQhQKS3qUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="126853199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2025 09:57:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Mar 2025 09:57:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 09:57:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 09:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPDeh7j8KtY6/SnfuXPl7O5pyskDzRcGpsBjkMn2v0aDiF46CUr3nu/S+x0VbOJaeiVBRBP+0f2dm4AoUoYL36FStDRZ9V6HuoDMfDUJPfmbeJuT2ujTz+GL9nfZVGPXG+nif6yxaboEmwvBra7bAIBQ6PTjd/1mQtHJE3Ip9Vy2EOWsjrNOMHtTgL69qruR0wBhHoSz+NFMxPWObe+BAG8Sns6mexNpLWwssWgzzpHXFrQyomg7pAt528ggaOCPu6jJLZp1wALkidBAZ7REBuRwH/3CmMVk3pa58QlSFIf3TEikSPDZo7XUJnQ2OzTXp98XVMoNWwaNYspM7eg+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqRrABmLx4aWBQ5EMCvKaCgCfuoqG72sJ/DxLZMOlqM=;
 b=TD66oPxQUfsN9PCuzjmM6iqn+MjLyt6k1TSY8pngg3ursmfWHEyH1/RNfajHsQuOGWBuoR/xOuF++SPfYhQbF676995vJAcf8pSSi9IzebDDStBZylR+KqilqK9b8GL9bYEK0CkG8BbBNK7eTOFF0Xe8spHtaZgjyfK4BhsMYaPfCjGehobxkooBfYqe26Xey1m+JDc4fECD6A0ckKo1JxlOi/Gzv2lS0AxcnxyBIQtvIytPrJrd8m0wgs7OdwjZFKIjvMawzMZCGiU0cv15hcwenFRZ3fPjIGAT+n0sdese1uNirnnkpnq/wOy6JqWzPKiXly/z9Rl1KPY50/bsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:56:38 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:56:38 +0000
Date: Mon, 17 Mar 2025 17:56:31 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
Subject: Re: [PATCH v5 3/3] drm/i915: Fix harmful driver register/unregister
 asymmetry
Message-ID: <w344sh6xhviimfu5gc2nxn3qn6v2lac4nyikquerlx2gh7nayn@nhvel7f7jqj2>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-8-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-8-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 115b3317-5117-4f18-6273-08dd6574af03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm9MazJseFh4M0YvM1JqZ1J6THE5YUREalY5UDJWVEE0V0dwbDBER085MlBM?=
 =?utf-8?B?eTVCQnNVMHNobkdTSEEvMWdKaEtTS0FuaWJGd1pTNTArNVllUkI5OExTMTh5?=
 =?utf-8?B?WTR4VnhQZmkrdXhBYm1McjJwSDdvOGdib1JSUy9nM2pTQ2VveXpQUFZ6QUkz?=
 =?utf-8?B?dkxnd0ZkUERudnhTTU80WmFoS2RZem5uWDl4dmtPY0xuSGJ4U2h6bW1pekhP?=
 =?utf-8?B?aGUycCtDN0VZRU1ZbW5nelFOcWVLZzQwSHdIWmsvZ2ZWVVoyVnhuMDg4OEhM?=
 =?utf-8?B?VDMyb2tidTVZeXQ0REdzajZGak01RzRPN3NZSFpUL3F5Nmc3c0lodWFQTU5l?=
 =?utf-8?B?eENwc3ZuTHd0d2pIK0RlS3djM3FtTS9NMU9EalZja29vN0hrYUEwMG11Y2U3?=
 =?utf-8?B?UDdNTFNmOFFFcUlMV1BmS1RRVTZtaXhkUXo3SUQ2b3ZXMmoySmYvS0FRZkR3?=
 =?utf-8?B?NVI2TWYzSDQ4Yi9kOGUwTjRnSGQwRDYyZ01sYk5FeWFCSzRLcVBXV200WGYw?=
 =?utf-8?B?NEVYRjk0b29JTHNGditLZEJLNFhRRU5uYnRHVlVMWVpiNTNrQVVsRXU0dEQz?=
 =?utf-8?B?bTVXcWpSalBNeUtjQ0YxekhpcXFsVmdIb2VYb0pFVnhpWVVXc0p4RHJWY0J1?=
 =?utf-8?B?WmxXcXVydnpNc2VWMVZ6WnB1eDljWnp1cGtlajZZL05mUXNubndNTGgraWZE?=
 =?utf-8?B?SGVrWVNSeHZQZnViQ2ZkZTFZN0dXNnQ3Z3AzNGFmdUNqOXZCcUtLaXJaem1X?=
 =?utf-8?B?ZEVSZUpJYmFzeU84amJwSjRFU1N3ckxvN3pxdmRNTForN2lHZDREbWN1KzNH?=
 =?utf-8?B?ZUZGSlA5dS8vMnY5REF0ZGZWbHo0ek9BSDVFY3QrYlp1c2lXWFJiTUQ2ZGhn?=
 =?utf-8?B?MnNVOENFcVVuOXNEb0FFeERCMlZHTlZId0xqUFo0WmhyVXVjS1FwMUxZcGtt?=
 =?utf-8?B?VllxenExTnJnT1FCMzd2OU13cWlkVGVIcEVtSm8yMHlUeWpwK21UZUdVWXB4?=
 =?utf-8?B?dEFrc3ZocmNrclhzTFhWbkVFM1VHb1NKcm9zY1h4OVZWSWhUdWFBYTBIVkpn?=
 =?utf-8?B?RmpGVEdTL1EyMlJMZ3VhQnU4aFV3VWZ2Q3dVazBuNzVkc1JoUmZ0bEFiK1dr?=
 =?utf-8?B?MDFBdjRkbTljcjh0QlZ6RkpyKzg4Z0VkOEdvY3dEanhIWXRsYkdac20zb0R4?=
 =?utf-8?B?VXRkQWU4Sndtd0Vra1BWdjBtMHNRRGs1VnlQVjlNeE13TGRvaXZsdXYxbTFH?=
 =?utf-8?B?ZFZ4d2JmVXQvUlgwMklZMnduZ2UyWlFPd3RyNW1oVHIrQ09lR05zdy85aHhq?=
 =?utf-8?B?Rm1NQTlvbzhmb0Vhc3duakpTL0hjYjlzc2c3M2FlazlidmFleDdUTEQ1RklL?=
 =?utf-8?B?dUlscFNXN2FqbTJwNGRrNEo2dFF0VnZacFhZV2pNa2NUQnBuelpWdnFIdkxa?=
 =?utf-8?B?Q1VuQkxSM1RkQjV6UjFjK3o2WEhnQ0ZRK3plbkU0UmRzWlVQVHNhL0ZzV21O?=
 =?utf-8?B?UHVSMElwUm80YnZNQy9ZYlZ5c25YbjRqQUNQS0EwaTNaMVg1N3VWeW05dFFy?=
 =?utf-8?B?Q0xHaEVFT0NheWFkcG5HbnRoQ1A0QW54Yy9KRWJpNStqUTNrZjI4QU4yUHg5?=
 =?utf-8?B?cUlNZEwrV1dzSXdjdHZKUXJNcXpIWDRFMFIxOHh3RFlWMHRNUG9pTkN0WWVt?=
 =?utf-8?B?UXQ0SWlEb2V1S2o5bjVWWmdHNXBFeFNmQXlsU2lCTVJROEt6YXFEMVBKQUwy?=
 =?utf-8?B?UnV4RTdFSjZVR2k0YjM0QmtwTkhyMi9RbFNxcUVpTEZmUWhwOVJyQmxaOHk0?=
 =?utf-8?B?anU0aHZXdTd3UkVMV0hoZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdHZGZTaTBqVXlOUHpyUTJwUnFlcWtjdEt5cGpkSnRoczN1bzBobDNDdkhj?=
 =?utf-8?B?a0lnZ0s5Vi9uSHhoL0ZPNnhBYTdvQTd5STAzcGl6Tnh3WEtZcys4eERST1pG?=
 =?utf-8?B?enBlZnZCZjlnQlNOY2QxY2t6dXViTWE2dzAwOEpvMGVOdm5nUWZnOEJOUXFl?=
 =?utf-8?B?WUpQWkh6cWFiQmlGS2QwNDN2eGJKVjkzSEUzZVU4a0Exd3ZUd3I1RUFxczUy?=
 =?utf-8?B?NlQwSDdOVElpYkNsdk95UlVWRFdhRXlQUmc3NHdKVTMwOUo3SGNmWXdkQWVU?=
 =?utf-8?B?NGQrNHBYbVB6aGhGajRSVTh3ZkRuNkNlZVhDdjYzdUpPdU5ueUdiTmIvTy83?=
 =?utf-8?B?R0ptL2JPcUlPaVlIVFNKUllRWTN2eHRLVEVsMVR2akJqK3lYMWErOUliQlNY?=
 =?utf-8?B?MStpd2tNWVlOcnYveS9Wb2dqNFVSMkgvZkU3em84b050QVJieE0yblVSamhT?=
 =?utf-8?B?S0JSdDlsdDZYOE9xeTM5QTRzVXZKWVloV3ZYSkNlZkRhMSs3V0RiMnFhNzlh?=
 =?utf-8?B?dC9hQU9aU1NMcVUyRzBhSmZ4eVJpUHNnUXVBcjZaY0ZIdGZKNklTYVdNS2hp?=
 =?utf-8?B?WHhqRGhreGMzaVdBKzJpMFp5VVFjUmJSZlErM1BMcEJnRkRQTGpxOXNBR2hz?=
 =?utf-8?B?cERjSVZWejhUdlFkbjF6MVhrQ3BCbWpHS2lxTXRvTGp2cDJFWGYzUDhncWQx?=
 =?utf-8?B?VXYyZ2xzSFFtNVJ3ZW12ZDJpaUhnR0FnNHdHWngvcWJrcldqOVJjdEcyWHdk?=
 =?utf-8?B?QUFjVzdEeFp0akQyRlo0V2RydTZSNGMvNk5YYTl6T3h3aGx0WG91VFo4ajJP?=
 =?utf-8?B?TWRuYkY2YmZaM1h3MmxaYlFVci9YYmpReEQwSjhuaUUrczJETlBURTZxd2lN?=
 =?utf-8?B?SUxyZ2NOYUh1c0RkU1J2a3RoSDVOKzRiWmwwOFRTSEJ5YmZub2hjN2I3N3Vo?=
 =?utf-8?B?S1ZrN0orcHpjeTVRRzJ1dW5tWXByWWVNdnNTUXFqdTJKbERwNmZyNnR4NjFk?=
 =?utf-8?B?dVFycjUrYmZqZ1RJa1FGbTRMZlNNNUh3UUF3c3ZaY1pIVTdFMDhRT3REWHhK?=
 =?utf-8?B?T1BOUk9KUGl3cTdORTdhb0lpUEpWY3hmdm1LVmQydktFMEpQbFFNTTNGSTNz?=
 =?utf-8?B?c0FQczlXVXNZU2pmWUZ4Nm5kK2lkWFFqRlZYTmo4eEhNckZ4TDFLaHI3TEZq?=
 =?utf-8?B?RFEyRU5qODFHOUkzVzhVa1htbGFxYU55Rmh0UXJnN1B3WEErMjFQd0x2SW1L?=
 =?utf-8?B?NFJ5TWQ5THZ2WXlhNFp6TnhDSXhFRU1ZcGRpSGFvdGNYWHV6MExlWWFUYXds?=
 =?utf-8?B?K0tpU2EzL1M0NCtWVHRtM3U1cHo1WXN1SUxUbGtZeEJ4anFPTXVrUTk3RzdN?=
 =?utf-8?B?OWcwdnpSbTYyQnppczIxdy8zRVVHNmJ1a1FtMlY5eGkzUDMyUmNHQWZUM0JJ?=
 =?utf-8?B?azdlV2UrVnkxTWw2bXRzMk5RS2t6VnRMRmNjNjVaa0NlZkRBdVZSZlpWckla?=
 =?utf-8?B?WUI3cmcydTUyeDhna09NMkk1RWNqdTJLZU9zQy9VVWVaa0V2eWE1dm1FSUhn?=
 =?utf-8?B?c0pBSURaT2F1T0pkWFBUVEJTK2lpOGdJWkRpQnA5Ky9QNFNadkp6Tlc3cnRo?=
 =?utf-8?B?V3ZEbGhYWjJqeXNwNmpVNldQSXZCT3RSQlZDWXJGbk9TYzFDNXVLVDMxWjRQ?=
 =?utf-8?B?MmdHL1pzQUxFdFZ1NStsd2dZaTdETWJ0OFQxNUVOcWJ2MUR6U3J1L285dTZN?=
 =?utf-8?B?WUV6LzlteXRaMXZKVnl2TGRNSlowSFJFVHNIT0VTYzBST2I0RG05U0JqSllP?=
 =?utf-8?B?NW5HekU3S2pPODh4dlQwT2dRTGZpS3NLTkVhdTBGQ1lONU9xOUhaaDA1Uzdo?=
 =?utf-8?B?NWJHWUtCYWhGdlhzNWRUYlJGYUl3OUd6ZE5jeTA5YytzOW1SRSs1SGdPT2Jo?=
 =?utf-8?B?Mm5ETFBScFNmSFdOblJnT3dlZmtzRmcweVhoT29mOFEwNnhBeFdqa2dpWnla?=
 =?utf-8?B?UTlZOS83MlJMVUllL3Y2M3d0UGwwSTlkN2w2MWVVY3BkR1Z3ZmJMbXR0TWsr?=
 =?utf-8?B?b28vcU9GYTQxaE5ISXhoaHJaRnltemJ5c09RL2EwYzJ1M1ZLeWZaQVBxQUhk?=
 =?utf-8?B?dEROVTBKSGE4N1pJSGdsZ3JYbnNjSCthZDFrcHBJeEd6S1BSZk90MElSM3lz?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 115b3317-5117-4f18-6273-08dd6574af03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:56:38.4854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ieeDdrIpJe6CjTyRUAtSs9NOGqn86BRhn/fE0zli0KSpRMfoUfT0NvMX+67OaRYteFuQuwJRao+18l5o47zmj9RJnUeIHg69raCc4YtazI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

On 2025-03-14 at 21:38:35 GMT, Janusz Krzysztofik wrote:
> Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> drm_dev_register() fails"), we return from i915_driver_register()
> immediately if drm_dev_register() fails, skipping remaining registration
> steps, and continue only with remaining probe steps.  However, the
> _unregister() counterpart called at driver remove knows nothing about that
> skip and executes reverts of all those steps.  As a consequence, a number
> of kernel warnings that taint the kernel are triggered:
> 
> <3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for userspace access!
> ...
> <4> [525.831069] ------------[ cut here ]------------
> <4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init_wakeref)
> <4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/display/intel_display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G     U             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
> ...
> <4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831483] Call Trace:
> <4> [525.831484]  <TASK>
> ...
> <4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
> <4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
> <4> [525.832099]  pci_device_remove+0x3e/0xb0
> <4> [525.832103]  device_remove+0x40/0x80
> <4> [525.832107]  device_release_driver_internal+0x215/0x280
> ...
> 
> Moreover, that unexpected PM reference is left untouched (not released)
> but overwritten, then that triggers another kernel warning at driver
> release phase:
> 
> <4> [526.685700] ------------[ cut here ]------------
> <4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cleanup
> <4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_runtime_pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
> ...
> <4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i915]
> ...
> <4> [526.686294] Call Trace:
> <4> [526.686296]  <TASK>
> ...
> <4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
> <4> [526.687243]  drm_dev_put.part.0+0x47/0x90
> <4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
> <4> [526.687255]  devm_action_release+0x12/0x30
> <4> [526.687261]  release_nodes+0x3a/0x120
> <4> [526.687268]  devres_release_all+0x97/0xe0
> <4> [526.687277]  device_unbind_cleanup+0x12/0x80
> <4> [526.687282]  device_release_driver_internal+0x23a/0x280
> ...
> 
> A call to intel_power_domains_disable() was already there.  It triggers
> the drm_WARN_ON() when it finds a reference to a wakeref taken on device
> probe and not released after device registration failure.  That wakeref is
> then left held forever once its handle gets lost overwritten with another
> wakeref, hence another WARN() is called from
> intel_runtime_pm_driver_release().
> 
> The WARN() triggered by kernfs_remove_by_name_ns() from
> i915_teardown_sysfs()->i915_gpu_error_sysfs_teardown(), formerly
> i915_teardown_error_capture(), was also there when the return was added.
> 
> A call to intel_gt_sysfs_unregister() that triggers the WARN() from
> kobject_put() was added to intel_gt_driver_unregister() with commit
> 69d6bf5c3754ff ("drm/i915/gt: Fix memory leaks in per-gt sysfs").
> 
> Fix the asymmetry by failing the driver probe on device registration
> failure and going through rewind paths.
> 
> For that to work as expected, we apparently need to start the rewind path
> of i915_driver_register() with drm_dev_unregister(), even if
> drm_dev_register() returned an error.
> 
> v5: Drop unsigned keyword from ret variable declaration (Krzysztof),
>   - keep the "Failed to register driver for userspace access" error
>     message (Krzysztof),
>   - split PXP cleanup addition to rewind path out to a separate patch.
> v4: Switch to taking an error rewind path on device registration failure
>     (Krzysztof, Lucas).
> v3: Based on Andi's commitment on introducing a flag, try to address
>     Jani's "must find another way" by finding a better place and name for
>     the flag (in hope that's what Jani had on mind),
>   - split into a series of patches and limit the scope of the first (this)
>     one to a minimum of omitting conditionally only those unregister
>     (sub)steps that trigger kernel warnings when not registered.
> v2: Check in _unregister whether the drm_dev_register has succeeded and
>     skip some of the _unregister() steps. (Andi)
> 
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
