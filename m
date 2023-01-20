Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4F6761AE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2B710EB24;
	Fri, 20 Jan 2023 23:40:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71BA10EB24;
 Fri, 20 Jan 2023 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674258034; x=1705794034;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n8hDuVwpykWEBPiV3q0Ps2HdNuubXQr8Du1+y1olLgk=;
 b=TYAOpdAbFq0Vao3vWb0Ff0+/A1ZlusZavMhv4bOjx3DVf7SK1HERtr5d
 uEVfLKvtrQzfMhjkJmcjnHo0WoJE6m4G/XFuI2wsZcbxyzKC6BagmPgv8
 PkqWkcs3ND/+3UiGeJDT9gqOAUvrumJQogqxBkvH5QEg1kQ+0uQldtYq+
 GL8awOl0oSD+/6yuZs1rqmopF5WHOKkckgTEmpoavAe5syVHw2HNhNTKY
 KXEONrNnbJO6M9ctZthSCo2KxiT+VHX/l2ogRnPzKSZFUtVurZU8WDqMX
 mgmcVwRw5NxBFU9aob0lAPBE2RnEBiPK03OFwsnHmRwUmEHmx0uUHwAMY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323414890"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="323414890"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729275846"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="729275846"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2023 15:40:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 15:40:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 15:40:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 15:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWeRCxUb/LtyKyegiHWbn8GSHHqT/qkYRMX5Ds5tRN8m/b6HLa7Z76CoohBSdGX5EwFrDU2vc5Tk9BiIixWZBW7tK2OdbtXJFOt3fAMY2iBBS/sj0oMM/p0IDELO21z3fJCJP7SfyBhaKXuh9XiIEeHAeTPb/KgBOnBVmZ+/V57pRZoh4a54uOUNqlVwrBioIq4k1Z0jt1XAqEIgIv5/DMs1zJhF3WgZ4zPawKezkT1631rMXe6ehAIywtZPHuknDY8EN+xZ+mbW7pfFFSq/0Ee0gOdJUw9aM9DxxDY2XtneV/o3B3arGjgaX6g3H4BPyBz8sD8C7UobWXlUuB2CGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YESl8WjQuR4uHqNCBCLSX5ptQ7Ahhp7q9vmrRSi1DZ4=;
 b=hom3nLBEc5/rhCVyRHYIUeUirPzR9DFomvJUf4ffOU99ZNfY4bdV9NTeq0GzM5ThK95tey+pTDx5qIb4zBCFMyX7siQJpv6/HIIs+7UvQkiAj1Ady7PhwusV2ZFUnJe9FeYDiXKur1hTz2jpKQ1mtZSQN+hdZvpd3gI8CT6JkhbIplZgM/koeHA693eUV36Ok7YZc8+lnzDrFDrOwO+54MNzqNVXxkQSSf2eagItSJpL4XYEdh0V93N1dyuHMcRqIN9CeAan8hKto+BJbL2GPzdpH66ok4I9+e0jZhKsAdw/x0bthimMTancdONNWoLy++wtocp0SHHfDJwRuAAVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO6PR11MB5666.namprd11.prod.outlook.com (2603:10b6:303:13a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 23:40:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 23:40:31 +0000
Message-ID: <95439a9b-241e-553f-1d69-762901259840@intel.com>
Date: Fri, 20 Jan 2023 15:40:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/7] drm/i915: Fix up locking around dumping requests
 lists
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-3-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120232831.28177-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO6PR11MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: ad68690a-ddf7-48ed-7a38-08dafb3fb7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etm/zqKT74UEcRIbEtL8QrsdE3jFZO0wmDq1DhTu60+xG+CBZJT6DJfff1cNC/u4BN4kn6UhxPjgtQedwb2G1pFYoLlmwaJWXYxvGGJf72PTUdGZRVqfCwvyFyM/Ae60GmE0gFmU3A0i4UQS11/gq3MEAPfCGPJ4DcRjW41Rf965FgN31F+Pkw4VSdO2P7B1foQzefQMl+5oAGQu+Hm7uUcAYQDERXxN8J/MVC2sna5+HSrxr8tBscLeQQRhVm+0KogWBsX+gByBmSKyYeRQ7bfWm0/HWb6C49xpZiVPVADFrHNv9F7xFortqoHvNFKr99f2jUhoYPee9Krs+PCP8z+hjyD6EIOI2sUAWakDn5MZ8h1LBmuEOOD95nYZa1HT1GKL10a8DI02QUOh66TqUqKP+hk1j4ABHyNXM8X3uicq6hkLnXM62zgIH6tQXAXes675HCybnsqKfZnEao509AREuhBW4Kg4z2gmrKQ5mpWumsApzQG+3s4gw5Tk+W74NTRDY5sNGjBq5f7hj6cGq8B2h3t+5vVlvNEUXbaLlDaVTq87I9lsUsnKL3mkCOLkSpFIxUA5QycHoZ+Siv4+0lR2RD0DLEko5FJkIDq2aYev8eg9SsEcZqI4ke3aTcHgKJD7TE3BkTy7l6pSqVG9ECdgYDI2z3A2O1iRWr+ThJxSlVbwZr0BglfuCDHGXpbSgoM1GMGB87HsMhHedxXfFa/qkG8DLafBd6NIERi4JTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(5660300002)(6916009)(82960400001)(8676002)(66476007)(4326008)(66556008)(316002)(53546011)(36756003)(2616005)(6506007)(8936002)(41300700001)(38100700002)(31686004)(478600001)(2906002)(83380400001)(86362001)(26005)(6512007)(186003)(450100002)(6486002)(66946007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNLTzZvWVhYVjVoZXdqNkowYlBOejY0NUNRMnUzZVBnVXA3aVBGUFJMMTRG?=
 =?utf-8?B?eWIyendaNkJYSnR1aEZkaXZjbTlVYlpIWlp0a2x6TnIrMzNpVWRLbHdlNXNi?=
 =?utf-8?B?cUI2T2VlM29lODYxMndGdUk2cUM4ajY1ZWVzbGZjZmFQSkdGU2dJbkoxcmZI?=
 =?utf-8?B?Z1QwN2dNYk0ya0Y2akM2ZmV6V2JTMkZyajFTT0ZwVWdLVWg3QzNCa2ZneTg4?=
 =?utf-8?B?QkhzQXdnMlprKzRtQWJWWUVEU2Vwdk5nNkVqdFJYREpqNEJLc0pSSklEY0Zu?=
 =?utf-8?B?dmZyRkJ6aUE4aFpxZ28wUWlhOHBVeGxzbnQrYVMxd1JTVGRwbC9LU0lFdWND?=
 =?utf-8?B?SG1uR2dVQTlqcGcrSG5ZZVdkSU1BMTBuRktDd1lsQit3alhQMWdrV3JvRWhN?=
 =?utf-8?B?cmZFRE1kTGRzbml4TktMMFBIeGJ3bGhaa1VoMWFmS051VGF0RUNQOUl2QWEx?=
 =?utf-8?B?L29jTDgranp0R2tpN3hyczNBajRCc0dzWWt5cjU4ekQvdHJSdHdxS3hkbisw?=
 =?utf-8?B?UklTT2VzMFc1cmJVTDNDeEtFSTZNdWluc0tTQVZQdkJ5K21KZXVpS0ZSaXdS?=
 =?utf-8?B?NzNBYnpZeC9iWjNQT0YxODFIL1BxS3J0aFhFdjdRNFNnV0NhQUx4OWYzd1Uv?=
 =?utf-8?B?NFlsSUdqWHBacW9NdVMxelZVa1N4L2tDemlOOHRzcitRazJNdFRUOFV0V0dR?=
 =?utf-8?B?MzFFSHMyQnlxZDNOWmRCMmRYQnN0c2FEQTVsbjJhTkY4c084eUlwdlcwY25r?=
 =?utf-8?B?Q1BVTjdDQzNjZ1ptMENJd3JFK25jWWtjL1FVck9vaXlhZnovcmlZdXF4UVdk?=
 =?utf-8?B?WmViR1l3ZlhBUXBJSjVwa2ZwOTFNWnRhcElUN29zd0k4bmFhQ3FTaHF4WTRt?=
 =?utf-8?B?MzFrdE5Ma054eGxkcmNkYXFoSUN2TVFrT1FGRWlzdHF2amVvbUh6V0NyeGtx?=
 =?utf-8?B?enJXRHhrUWprSjExNjcxZHNKRjJHNm9xVzk4VGlYb1d5S0ljai94YWJtRDVy?=
 =?utf-8?B?b1hrUDNXNUhtV3FXK2JVVmNRQVRZTGkwNVFiaXpjS0hwNHRLZmFqWUloR0hu?=
 =?utf-8?B?aFFPTVhYYmlycWlNaEpkVWJsbktEaDYreEhpeEMxNk1tanl5Rys3bDdIdGc4?=
 =?utf-8?B?cXhYYyt0M1VvZ0NtRjJvM3d5ZERuaHVZK1B2WCtZd3NrTmplUUF1RmRpc29Z?=
 =?utf-8?B?RkhWdFhxejY4RUZEN1JSTFhMRXV3bFhRZ0kyNms4Z3FsWEdLbmttWXIzR0Z4?=
 =?utf-8?B?ZW1yeFVnTkZlZEpoMExESFFFMlZvSzdFbllUcEMxdlY0c2RvaGJFRk5wd0VT?=
 =?utf-8?B?QkkwRGEraW1PdFRKbTI3MjJBZGNzbFAybkd4cjhoTURaaGRlTXlCOWRabk5T?=
 =?utf-8?B?b0lQS3JyMFQwV3dxUHRXZnhwRW8yZUR5VUFOaCtzRXRZeVNzSmkxVXBxMW13?=
 =?utf-8?B?ZnplQjhvZjh2N3pqT1Q0MXgzUjVFYkNBbWRkcmRWOGhMUjhTTmE1blZmTDQy?=
 =?utf-8?B?a1hURnBzeU80Vm9wQkRodkF4eFBWUDhaNDQwbXhFQ0ZFRFVjYTJiUm42dWlK?=
 =?utf-8?B?YlF2WnBxb0I4aTlOQ0Z4Ny9PL2dXWDRDdDdVcDlvUGlvN2o3WVVNYVVOVnMy?=
 =?utf-8?B?T2NmYytJN3JIZndQdG42QzBzRGZLSjFTN2cyWTJvSnIyUURQaWpUVU85N2pN?=
 =?utf-8?B?cWFJL2xlV3E3b3RLakNxQVVKdW9LZnVRQkJPM2JhTEo2YnNIYjRYWWkxMTQ3?=
 =?utf-8?B?ZVRwK3JPaGowdEN4Q0dJWlpqZEtYT3UxSXBmc2wxbVZ1Tm5jK3huc3lkT0Vw?=
 =?utf-8?B?bkRvRkhMQnE4a1pRa2xHYzNhR0VlS0d6R09uY1dpMDRERUtTY0hTYzJsTVE1?=
 =?utf-8?B?NVI4ekZYYmNHT0d0d2dFUkxLRXYxUmlCSTBleWlGUC9tNHF1WlY5UW12NWxR?=
 =?utf-8?B?OFJIWGhtT1g3c2I2QWRBQ0N6UVVKTEVIVDJmRzlXY0hOeSt4WDNZdXZwVks3?=
 =?utf-8?B?TVViQXpEeDdFY1JaYkRPcm9TS1cwSnZwWEQyY3p2Qkl1WWZjaGhCL1VweVdM?=
 =?utf-8?B?bkxZM3lxMXhwdFZMeldvTERpWE52M1k3eWVZYVNqay9EeFpiYmhwamJRMCtp?=
 =?utf-8?B?UUd1azVBNHVZN1phRlFpNlZZQmkvRm1ZNkk0SFlVdGV0NjRyekxvWHpUWnFp?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad68690a-ddf7-48ed-7a38-08dafb3fb7c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 23:40:31.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skOUsNTSBi09yLB+LB2a4RbE87VCIZ1Tgula5GPKEQ2bSN9XjpzwxiOebDDjaOqH5u22LcmvDDCnuJZ0JyW2ykvbEjNz/lSlNcRs254Jll4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5666
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/2023 15:28, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The debugfs dump of requests was confused about what state requires
> the execlist lock versus the GuC lock. There was also a bunch of
> duplicated messy code between it and the error capture code.
>
> So refactor the hung request search into a re-usable function. And
> reduce the span of the execlist state lock to only the execlist
> specific code paths. In order to do that, also move the report of hold
> count (which is an execlist only concept) from the top level dump
> function to the lower level execlist specific function. Also, move the
> execlist specific code into the execlist source file.
>
> v2: Rename some functions and move to more appropriate files (Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU 
reset with GuC")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Michael Cheng <michael.cheng@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org

John.

