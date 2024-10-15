Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D926199DD2A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 06:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D5110E4EE;
	Tue, 15 Oct 2024 04:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5nlbWi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B969510E4EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 04:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728966214; x=1760502214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k2eRAe1H18RvwewdF+D8exdEa6DSsxYeuYWWy50JyAU=;
 b=C5nlbWi5VcW8NujMkq0306AmNLv/Hty+fCZUNQYColSVyTlPh2cP+buF
 dlRnm2VYfAdJfVlLQX7F1nfojwa3K9nfN8Y9yAmhU2c73vd8U3TvpQGuO
 wKhhZDvruOXyspCNPx2Dn8kp7d9HOwQRVxJqRNSVslmbSTodVOmKPD932
 FLlk1wPF39fo8nuZWACBYTLP7A41KKSGnQ5SN2enqm3HGsp2L70FwncXs
 CzMUI5vRdbktt7f6rnm4rRjnF2EXiqv77oO1gZ0G7psbL8i2DKtU2d+PP
 JNcw+bpP8Egar3+mAiTizsixCgrj8T2L315MRYvoCcy0Xqkzel8ifU1tL Q==;
X-CSE-ConnectionGUID: QpTa9l9/TCmNj2fLAUZdcQ==
X-CSE-MsgGUID: 9n5dptOIRomqSiOVNNoy1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28126243"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28126243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 21:23:33 -0700
X-CSE-ConnectionGUID: M2oM8YXvRTucPW68/HmaVA==
X-CSE-MsgGUID: cD9Bfm4LR36wNIoDZ550Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="77779648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 21:23:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 21:23:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 21:23:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0uduY7BDnTRgvxnIblH+PG9iJMixAflEgJ8dBkF4y5Ma92aDUVh0S0lVsvgiCYS9aPCGzY/KHfWKCGsF8ImgsuIlXRkPsDPdmbDUIIkOtVia5GppEd6o7tREvtqvPIifLw8q51ZY8tcOW1A/XRmyKNYv79xrHcPe1XyvlFafA7t4hmt22M29BhQney5gbVzkmApaT5U6kxHypTElULSP+x75xCCs03Fhiu1S/GZmOA531jEmwO8PDyopwb8TVaxsWJrV6auyoP3incflW8HUPLxrd/L7aWO5sO0b0RyybUR9iXjBP5MTiQr+h0zwGAokrlABz6Kgc3ZpODjmuPZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2eRAe1H18RvwewdF+D8exdEa6DSsxYeuYWWy50JyAU=;
 b=UDeUmKsyJDJMGRwkKGY+OUv0+BbzsJmi7ATGni/OCeazlkO+iAU6Ya3FVyT8+Gc16+OfRSxYu1aZ5i161DDvdX8tGjrRGeW9MDqH+B2+7H79oxHOO2WuIJOslvYwffM97zI0G35YR+lKq/UX3ClInNu725/ecaux7pjNnw8l8/Rz/A+rT4+DY66pkVRyckfZZPmCbyVbrOZCzB0QP9pzvzf2HyDIHoeB7G9lNUlz6Wu85zG/3g38fLoCCGVEcs57HG2JhfgFEwXvIVeNN2fLNy8wPQM1AqBnRZ36qNG++dNTC9PsX5XA0s2/C2qTi9HIZl5cgAyMWg6o/PYLGMWAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6795.namprd11.prod.outlook.com (2603:10b6:510:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 04:23:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 04:23:24 +0000
Date: Mon, 14 Oct 2024 23:23:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Ian Rogers <irogers@google.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/5] perf: Add dummy pmu module
Message-ID: <xio3nq6fzigj2p3dm57bfbuia6lwfamyyrrybkmkmj7na7ogbz@auajowi3m56h>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-2-lucas.demarchi@intel.com>
 <1ad917db-6039-4269-8f59-a6d03557d27c@quicinc.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1ad917db-6039-4269-8f59-a6d03557d27c@quicinc.com>
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 588c2267-285e-4722-ffc0-08dcecd11bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5CV01hKalZGm8R0oTT6YfRVmmRpcCsBRya5DR3pLCyHJWVd8r4dj1+ub1hBw?=
 =?us-ascii?Q?N8NCjuw7dyp/3rEIKm4wOlilfC1t6nNhhZLG3/5+GultJ1ReoLOEk2CdrN4M?=
 =?us-ascii?Q?ZAlVk/GvrYSfxnKBDyvjZ01PX2JKbYFjzhO8PRMbgDYx7D+QvV+SLm0SUywA?=
 =?us-ascii?Q?m9wnr8CGztm34BhlqPHZhBR3i+StTtA8C/qOQk5JDaYVN8ss2p1WczaxLtvx?=
 =?us-ascii?Q?+yaBw4lTFe2P3o3Kg0xtNQMrMMdxn6TBdw9DEjef4iSK5ENaWQzujujGwrd4?=
 =?us-ascii?Q?Z++/Y2pcufKTlEuUluBR09kmzSDgU3AaG5rj4rJi4jDqLfSw0ofXTTmky0z7?=
 =?us-ascii?Q?QcTzEDxJznTrwJjtx9Qv1Y3CNigtQZ/S1Ikn1FHXca2mbMUZ2Fxn0hG5f/Wj?=
 =?us-ascii?Q?EHvn6x1cHYtGc2PIYAkJ2nwarknc9EvqXN9rn5UvxBN08Va4tieUWWY/bO0i?=
 =?us-ascii?Q?qvasFMPw9iXg7SMN/AaxPRMJeXtO3lqJm0dL9FaySw7EOOh4wDdkVGdv6H1c?=
 =?us-ascii?Q?uWNJEnedmFl5GONCE/3klH4lMxm2nf7JDP8QG3I26Qo05CJK8t+s2PS6dT8c?=
 =?us-ascii?Q?z3+dISWHaJO8JbOdrYpATa0fIv98rXOfMuRIyd4sa0OI+ToyAd2ifpw/AvyG?=
 =?us-ascii?Q?t2pY5hPjqCfD6vmMPsRB3s7MBhLkgnE5aNkffZ/XAsuqrec+3k8BbPSUQz7c?=
 =?us-ascii?Q?pVC/awGASdG1flkQv43vd6fkJul1IBgoMHJPwBUbZVv4jhxQHW3gvcC89s9j?=
 =?us-ascii?Q?Ci9/ttbv6nNJLjmrwvjqX6cfuUZ/vDzhLYgOBxdfgXwVziPEbvKECImH7ufx?=
 =?us-ascii?Q?roMrmD0IFmREd+1pMCnvSxNeXcbKpcJ4qVrOkBvM/nb5HucqlF1L4crwTFwo?=
 =?us-ascii?Q?qwlJvup4z2PyWAqf+CdVJK1wpMPxR5KZsnmN49cT/XAWejjTf3CqqQ7woSYr?=
 =?us-ascii?Q?byGsHN9M+kvNY5VSwNUSBki5H1P4vOcgcA7NlvhA2jR4lKrZucC/EZTYmHsc?=
 =?us-ascii?Q?ney3mmlKU87BxmgaztY+fXgaHcd5exINXZgLgqP5CQDowoJbq3vlyD5Uec4Q?=
 =?us-ascii?Q?WUMmYr0mk2e+FPaTQPtoQAu6wiU45a1LzqPtgWB3VMG9mxdOiRQZkB4+atIw?=
 =?us-ascii?Q?BAgQaeI4mnV9v1TIchtafTP0cBphtb+xk7KCBdkJnUiJ0mHzgdsWDU4dALyK?=
 =?us-ascii?Q?mVVvXqv2nJ5awvae3kE0fhyd92FZyUjRzOz02RRxS5Fb+AgvB/FMGwEt2tP4?=
 =?us-ascii?Q?UPmAVidzeVAkuV21FZ2K8YC0BzVDsKPQy2MejRjV4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MAhQuSdxezUNgIVi9lVUNmWktBlKjrswbawEN8Zfv/0YiIx1BjUUi4P3XhYF?=
 =?us-ascii?Q?yUy9pU/WnaUtMJ9n5KSk8Ohyw+0Kw6TDtRdk7JaZVQlkrwx0Q0QXHU2hu3XA?=
 =?us-ascii?Q?DK/cduqOe8EXWjRBU+yuKXeGtLaCE0gw/Z8CYtF7Tw2Ysxp+SSU8B9iq2JTO?=
 =?us-ascii?Q?UgaqvptN/7gFoQCnhCUPposiODQnMAspVQqKytkP0qa+f6blg7WXnXeZ7RJj?=
 =?us-ascii?Q?8mZ76ILaW02hIGesQOD0su/1zrraj5LuzXZMLe72H+oeKSI/WJaEJs2s6pnP?=
 =?us-ascii?Q?8xeSPyQtFjUAxs90y/d8q036yNBDW7yYSQtobR6hKmw8ogL5pwQ3U4dnZPw1?=
 =?us-ascii?Q?L2s+sgj24N2CadUwtEi8+nlBcd9znXSiRitqGU1ScTqRz+NDcjyIIe8W0MUD?=
 =?us-ascii?Q?JtLc1L4rxZJ6D6XKkZh3zi1CPMJsQtVxFc6DDotAXRnYk3gLIn05xWFbor8G?=
 =?us-ascii?Q?9R2gnDxKzqHkQQv7X6FM4rVvIviQutUDTODTvZnGTtLoUNsaCLPRh3URxVCZ?=
 =?us-ascii?Q?CVPQvcXw5R7Vn3tXy1Ig0qew1wpE02ppo18exlAe610VMxnRjOpb6mbOsXdH?=
 =?us-ascii?Q?m7qrYWrBgyHf0N1S6cBObo3gcT+2+WDR8WyMmmAtzwBv75xstPTwt9mxtEci?=
 =?us-ascii?Q?/V9PLoaG9UKQOt1mHlC232b490j/vbHnflXInnvfdVMj8DES4tDdKxyO4rpj?=
 =?us-ascii?Q?XcvqBiQXJVNAJ65QYaod0AXuWgeIs/0brDNLWlmAO0KAYO/P4K6bWEcVoK15?=
 =?us-ascii?Q?kEWSN9jsVlDhhS5Jl21r47rcZ2XXlUF+NkFtHxsz4JDVdooXEGu7QveX7egz?=
 =?us-ascii?Q?HkA+pSFS8VfiwTiHLKwGeOwWLfv1S0ZugKQRPbonW2cCJxBdil1hmYREqUWD?=
 =?us-ascii?Q?6l32mKbEFxI9jI04MohEe79I7jpqS5WLwLa5fIlIyzdaOBDPCNBR1MuZ8nw/?=
 =?us-ascii?Q?vhYay5duVYCTEFASBy8mBq2tWGJbJ7WwwKhz8INGpYFTJl03N5y0Q/JBJN0u?=
 =?us-ascii?Q?YDCyOidsUaBi/OArO0gYDsvFu4qzv/U3LQ4sQVyhvFEkfq+DYRLT3jYGc31S?=
 =?us-ascii?Q?R/lmuTzazeetJgci6Qg4qH7n49T27fspZ9Z/CZDc11RsrZxItoq5plv5iDUd?=
 =?us-ascii?Q?R5Mi+5qbvfiK+CeQp5LMYwrKZ/FBEnCQhV8b5RiW35zx5wFjl9TJXMvIspsh?=
 =?us-ascii?Q?Y9Jqz6r9401vcpi+7rdNOuLpd3pj3eydyAa7eT6y/3a/1bi0dowZJtQBd765?=
 =?us-ascii?Q?8tK4VY0f7pee3OtZY7BzopbVizEqrDemShImK4IiK9RC9Xl74pcYUeNfIwKj?=
 =?us-ascii?Q?AdJAxf+FM6OdwgIhHINOKn+5Q7ec5esrlME38pQ+svtLnXpWzufjnz3KD9ek?=
 =?us-ascii?Q?xcDQid9DkmHlKYpfG9iaucKVJCx3wUTT5oNoa9emUDJB6ISAJQVrdrNpQ/II?=
 =?us-ascii?Q?6GkdHZOuS5wLeemRL3JLZkjAn1ca5dC01bAM/AFjDb8x1ejpXj/NIBCCfggs?=
 =?us-ascii?Q?sCbyV23507QXNscfGcxLWo+C4/mD6xAyScCbHONxujB0zcvyG91Z2GRJqkOC?=
 =?us-ascii?Q?UB6v1l4leuTVC5Kvlk86V4Db1kTghNcEVfFSzqZq1SUPtOFXnh6+gBxwCjiX?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 588c2267-285e-4722-ffc0-08dcecd11bfb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 04:23:24.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCn5YEmgJhI5q+4ZxTUQxK9eMsp7PMsUzJxu+qt1OCyu6FrDsLVnZXfQbSLw2dyRTzgjQ/nnhHSy8tt19OJG8ImegOvYDpQALLzI0ccChKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6795
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

On Mon, Oct 14, 2024 at 05:26:19PM -0700, Jeff Johnson wrote:
>On 10/8/24 11:34, Lucas De Marchi wrote:
>...
>> +module_init(dummy_init);
>> +module_exit(dummy_exit);
>> +
>> +MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
>> +MODULE_LICENSE("GPL");
>
>Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
>description is missing"), a module without a MODULE_DESCRIPTION() will
>result in a warning when built with make W=1. Recently, multiple
>developers have been eradicating these warnings treewide, and very few
>(if any) are left, so please don't introduce a new one :)
>
>Please add the missing MODULE_DESCRIPTION()

Thanks. This patch is not intended to be applied - it serves only to
demonstrate the issue solved by the other patches. But I will keep that
in mind if I re-submit it.

Lucas De Marchi
