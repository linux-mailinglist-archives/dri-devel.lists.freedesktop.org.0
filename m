Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401CB8D82BE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 14:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1C10E375;
	Mon,  3 Jun 2024 12:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GV4FTcgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE910E2CA;
 Mon,  3 Jun 2024 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717418937; x=1748954937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CtcaAAeN9PNXZx2AQpo5uhOAqzdrGUpT1XAg+Kz31MA=;
 b=GV4FTcgUT+0fYqvgGfNxWi2BltFr1ZQK5gjQ5lx7FbdhYenaYj2Y6fb+
 7Ltke/mylJ0ttNFNMq5QWCSlizaupqnEEodAVsYc2Zp2E0l0eggCsTpsJ
 2PhFmq7gnker+ofVzJIR1kIInEjfWu0Zm9FEe7WqHuzmGZpKbdhK0kGqH
 fhxWwORqMXyVgD2GfWYDBwd4ko3ZO/Q2Uvdzz+XphHptDpW/CXDoRT/T2
 hpkm3UphJbNXnkDJTTLz65UXQZP7rB/Oq4wB5dPphmUYkLeSQItsKfDmr
 R3IvfjJ1VkBRROYGe5Vc43Nlb6L5tnZmVOA0IXhDOb4HcULcZ0yYTnIgr A==;
X-CSE-ConnectionGUID: n5WTfP+2SpqeTd3UXkrI7Q==
X-CSE-MsgGUID: 3pjdEHsgQIKmjNUeMWizRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25311400"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="25311400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 05:48:56 -0700
X-CSE-ConnectionGUID: VJXuGbSvQGirCB3DK+BKfw==
X-CSE-MsgGUID: mLwtjMVuRCKOPIsDPaWcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36802022"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 05:48:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 05:48:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 05:48:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 05:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYc2oO5Uxnn9CzbRefX8Rs9p2HvKp2XXjoZstVlEa1FXFbLseVoxPe9dt0To4J3BCZC/uEunc7Zf13baFQDScM7L7rMz8W+CMiqWzfsko/QGnADLFbDRDYdfESwTsG/BTVupKBHLE1lMJsaPpH64oryabFQyrXxe82X1nlmKPdx+O9hNPjD9cXO9cBLMl7HyqT4zyH0j5I0WySQl7teJ6d7MPGjNWoqGdTtrnMojC4wrdVdezqZh3KGDghSCcy4/tpjPjY60WlpP6g+RF2h9TWvv7TpNNx0OSPkgtqVh1Mgf/2tvUNjpQ23XojI3jSTnf/RYZ506/SjgCyDvFb5PsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE3RqtNgQG+0FnMtRp3sDKHNuhqRCuabFPwfMba6Kwk=;
 b=dR/nJUrh91iexf0TzsruswEQapkQVoA79OEcboZhR9GxuVQ8aFZBhd9bScs02olG0lh4Tq87UlI4lSG4FLv/9CXxN7sUbMXOk3qadD/BSrRP3oHuBBdF/+0YRS8gMDxV8K9McQKrSPx4lW3ABilHVfkjiGiLEvNOR+PhjHmSG6UtK0Nso+dIg2GegW1ITnIk3o1qzeaytrnPQZp7PiVd8PHsxKxJiGwmnKG0Fj7YR9mZmvvGsvixK47qfkExG4dQ/XoBXENW4lH4u4HS5e16HVuuMMAUfbO25ypGga924OY9KZmbkYcsE4KbUb+aWMw9Sl5qN+RtPao7fQwhNniUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 12:48:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 12:48:53 +0000
Message-ID: <dc7604b7-5068-4055-9c60-927a5e932a4f@intel.com>
Date: Mon, 3 Jun 2024 18:18:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/8] drm/i915/display: Compute Adaptive sync SDP params
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240603054904.222589-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240603054904.222589-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: a1eeb450-0f78-49a4-8384-08dc83cb864e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlPbXpVOTVtb1dRUFBVckVIcTcvejJIZXBPMUk4ZzB5TVg5QjBCbitmMTBs?=
 =?utf-8?B?NlpMM2ZwV2o5L1BBSWk2YnJRcXUwMXBjRDJxd0pkbDJlaXdUVHpEalJUODdK?=
 =?utf-8?B?UktlUEdkMkZxd3ZsNGtac2xqUnY0ZlNyY1p2dkRmM2Q0amZ0VXNQWWg3MlJl?=
 =?utf-8?B?Zmd2QldFNjVnSnZPMkZCblEyTFEvYjc1T1lIUGhmZnBQZ01NK2dqU1RHMi9Z?=
 =?utf-8?B?c2RYS29jeFNCZjRKcDFBb1U4b3k5aU8rL3JyM2xxK1FOVHJMWWJaUVBmMmFU?=
 =?utf-8?B?REVhSGJjcGNsWGdFbHROVjdMT1N4RG1WbkV6UkRVQWdOc2kwUXZyYzZEcjkx?=
 =?utf-8?B?QjBuNE1aU1VrbUJlaWowM0o4YTgzWkNacW40aVE3b0E2SFBpdXBpR28rajNR?=
 =?utf-8?B?TWlLVmhRS2FYY0lqek9mK1ZlYW03d3dnS0pIRWRnaGlTdUYvUVdaSndySTlC?=
 =?utf-8?B?UjNtcHZRanRyWmpHTnpxbWpYN3F6b1pFWDN4ZmtuWXc2OWMzdEFidUR0UHVV?=
 =?utf-8?B?OUxkd2o1MFdDQlhIQlZFV3hJTFFmUHY4UEVLSHQ1ZDZFc0gyUGZ0MnhPUWpa?=
 =?utf-8?B?RnJJdEwrMHQ5aTA3VURXZTZUQmZMWmVHZzE0emxtN0o4cGZURm5WNDl2cWpw?=
 =?utf-8?B?L0srQTd6YTVSckZNL0xYbHVGd04zai9UYXRod3lCMDBzUTh2Q3F6eXpINU1G?=
 =?utf-8?B?M05INFV2RVMvdmx4ajNaZnAyL3lNZ3pyamFwOEhWUWZ6KzBBMzJpVHVHODVx?=
 =?utf-8?B?WWZPd2FjRkRSNkV6TXk1TlVzcFIyOEVjQlhCaTNnVVVjSTNsT1R3eFdWWmlH?=
 =?utf-8?B?Z1NYNWdUQzNTdzFqaXFxU25jcTU3V1MvQ1pHUFhhUW1aVk9TK3l3OWo3Tzdv?=
 =?utf-8?B?cFJBQ3ZUVzNnSFhqWEtxMjJMdFU5a1NJVXkxeDlCTmtLK0RRM1FORXJNR05i?=
 =?utf-8?B?QXZuMVNsNjJvcGdxRDdhOTQ2dlF0d2JMK2hFNVJLUjZrVHlNZVowYVp1UzlW?=
 =?utf-8?B?a0V6M2lzUGVobVQ3UHBjTFgxME1FVnJmZWNmMnZoOThWNXh3c3R3M3ZJMlQ2?=
 =?utf-8?B?eGltSkQ5ZGFXM2xvL09xVGJuRlI2bUFGdjBnNy82aS9lUFU5K1ZQemZDaTVo?=
 =?utf-8?B?dTg3SzdxTzI1YWxnbDBPM3IyNFVJaXpXdk51TThVMlptRWc0K0ZRR0pHc3hM?=
 =?utf-8?B?eTRmOVM5Z2UrbUtNaXRLZHMvd29VbFlPSUkzZEZScXhZeU1PdGxkZW44Qmdr?=
 =?utf-8?B?TXNMVnlpL1Z2UUdJT2F3ZlVBMC8rMEtjNmthbzlka01zSGVEdUFzTnFRRnlz?=
 =?utf-8?B?WDE5eWhWTGRRN1A2Zmw0LzVGSFk4RWtObmJldWh3N1pOditwWk41M2RpRGlD?=
 =?utf-8?B?TUNSZ0FOenFvVjJ6ZktWQVJTYXlkaWNybkMzbVAzLzZTS3ZxQmkyS3pmWnVs?=
 =?utf-8?B?dmNzV0FqOTZ1dE1Na1lzc1AwZktYTGtzajNORzNsWThBZUpBTEo0blhhanR1?=
 =?utf-8?B?T21zdUdaQ3oyaXZSZmc3NWFoR2VuVVhIeWZwTkh1dWwwb2hhQkp4WXBqUWUx?=
 =?utf-8?B?SGpFcllKVW5ERzBJVnBNNkxCRVIyclNUa29wd2p2QVFDa1lKNThpdE4raGlz?=
 =?utf-8?B?TUhRKzBOUlc1THJVOGE2S0RHUUd1eG9LQndOeXpwc1YvRS93dkpsY2JwWHRJ?=
 =?utf-8?B?a3hGTUtUQTNYVGhsVEIwTS9OUTJrK3dtRUEzVDZQYkdCS1lZRjRhTTZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVVU0FPTXNPUHpuaGlmWjdpa3hZK05qQ2NZSjdGT2U1b3I5dDQwR0krOEpu?=
 =?utf-8?B?TFZlRGFETlI0cmtmdjc5UjBiY05KWTlPR2ZtSFlUYUN3dkExbEF4OEROZHJ1?=
 =?utf-8?B?RUFCSVpIN3ZuQmlndjI3dEJxYjJqTWNER3ptRHJjdG9OZDVzYTVtN0ErN211?=
 =?utf-8?B?TGFkVXcxa01DRGs0VHIwcVhNWVJqcFdsNi9vSmRlS0VKaVBncmoxL1UwV3JK?=
 =?utf-8?B?bTdYSE5pR2hUVWV0T0U1TnRaV1Q1RlB6d01oUVFIaCt4c3ZBR3gxYTVFakhG?=
 =?utf-8?B?SUIwYTlLNVRtNDRGZUh5VnJid05rOXo3Q3BYdmhWR0d6ZVlXa0MzSDAyTldV?=
 =?utf-8?B?WG93ZVAxMzR3MFI3TWJna0d5SFExc0JBZEh3TWxYTGN0UkhrTGR1TkdYaFlU?=
 =?utf-8?B?STdVcDVIMHl5d0JQdkNsRjVKNDlhQVFPYkhMQWQ0V3EybDNqVlFHaWFrV2d5?=
 =?utf-8?B?M1lxWWZTNURQSjd6VVFnMmlQbE9kYVhNV2F1MXArU2RMeE85NUEzTnpOcDFO?=
 =?utf-8?B?UjBnTUNNOGxIUDl0a2QxMWFKVWxjbFRsWXNTRGRBdXF2dlZTNzhqVUdEZndK?=
 =?utf-8?B?Z2pOTWc5Tkt6OXF2R1ZNMTZjemlqSEpQRC94L1I3ejV1eUJhYWVBeCtHbnJN?=
 =?utf-8?B?ajBIQVo3WlpYamxBYlVjNmpTUEd3eG93Nk9wemdtem5tSGY1dWptY2tuUG9k?=
 =?utf-8?B?azdlUml2MWNweXByQkxPK0dkNjhaTmU1bnhsbEhuOWV6dzNqUTd4V2JWTUZ5?=
 =?utf-8?B?VmQwdGM1VnBrWmo5VmthL01SM1l0aDVibVM3WHpXZnVGMklLMGRPTTRJSWY1?=
 =?utf-8?B?dUNCczIzZFFPVXhQY0lCL3ZEZXFwV1o2RTFpV1BqeEl1YmVBbmpZakxFbm9Y?=
 =?utf-8?B?ODJqbzkyR1ZScGp0ZkZ0TzRNTFpiQWZSUU53UXpLSURlZG9yMlU0Vitzejgx?=
 =?utf-8?B?Q3NRc3EvUWJSRmhuUlFPL3gyUzBqS293QzBMcngxckFHODNPRExMS09Sclpw?=
 =?utf-8?B?aksxMFVpVFpHOCtwMGJQS2tNQXpmMEMxWmZybXZJZjFYMnl2TFlDRGpMeDd5?=
 =?utf-8?B?N3NaVE5DZVNOYlB3Y3h3TTBaM0FzVFVVMnJScjJSYmZPTG83ekExNUdiU2I5?=
 =?utf-8?B?a3RzUTN4WXVId1BFYnJqYVhudnR6cWUvK1hreGQrQS9IcGN1RjJlSVB0cVp1?=
 =?utf-8?B?QUJPUkZsMWV5QmprcWJFL0o4UWNIc0oxSVdMRkdDMHpOdWtUVWNyWlNtNXpS?=
 =?utf-8?B?K1F3N3N5aXVyT2xUN0xXVUFVUmlZTU0zQ0JUMVhiMGxnTzVKYXNXQ3N4YXR6?=
 =?utf-8?B?b0pQMmY2Qkg4WjR6QjJDZnduWUdjT0hLc1ZnbUtmS0tZQXRFcFUzV1Q5Q1hZ?=
 =?utf-8?B?YmswZHM4ZmxPYlB6TGpBOHk3QlRNbThrM1YvV2VUVWFYb0Z6d25SNnQxdzhQ?=
 =?utf-8?B?N2hvY1Y4UXpNdnpjeWllR25QcHI0dWFhQVlOU1I4ZXloNmNjM2lWU3IxNTRQ?=
 =?utf-8?B?Sm1scm1YUm13QlV4cjhMMTVjRDh5Y05UNStaMnViMTFrbkJ0V3Ntaktqb2Rj?=
 =?utf-8?B?ZHByTDQ2NitGekh2ZVE1VDdSUXRaNW96bVlPcnlTVVgwVWpuekdsTGlMYWt6?=
 =?utf-8?B?RVNJTVVEWWJuYmJHdW1ubWZxSVo2dFNYT2ZyZVMvVUVVWFAwVGZYSjNsZitj?=
 =?utf-8?B?cERpRHhsN0NSMllBaGt5MVNKZ3Mvbm9SS2l6UHl1WG9GWEJrNDV4WHNYVnJJ?=
 =?utf-8?B?ZnFDcm9XYlZBdGdzcUtwd3FjT2FBbmhqZERiNkxIa3k5SkJnVS9sY3JiVVcx?=
 =?utf-8?B?UnhpRnlLTmprc0l1aWE2bU1aWEg3dm1janFCQ0dPd1MzYkhoc2ZBVzVJT0Jz?=
 =?utf-8?B?alBXRWdkMjlkc3ZCUGh2NlJXMHloRGFGLzdhNUlmVXlRbU5ONDhVV2JJZThM?=
 =?utf-8?B?aGhTU1UrRVhRM0dMbWJ5YkI4SzFTODJLd1UwM1dvb29kK1lIbC9jZ1luSktN?=
 =?utf-8?B?MVE2bE9IeTZyd3VYcXQrdFducENycHZSUVdIZHNKMGFLbXh6TEtHZG4vcFJ5?=
 =?utf-8?B?cFdlVkovcXBXaDlNUHFkUGovbWR2Qisvd3l3ZzdLdUdMMDN4RFJzMzBDQ1di?=
 =?utf-8?B?RTlMS1VaN3pPRmZMcmFBZ253Q1Z4aWJrVFR1MmhCc2dZMUkydFRRUzg1Wjkr?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1eeb450-0f78-49a4-8384-08dc83cb864e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:48:53.6127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwnFHbDwYL/4ToOXENiAJgYvIIIPhxUZksIrJoSRXveLlNZPO2trK+mGPzOii2BfV4pMKjBC2sb7oRfQjiGRCwkknBkSTRc4Y3x72i/ov/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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


On 6/3/2024 11:19 AM, Mitul Golani wrote:
> Compute params for Adaptive Sync SDP when Fixed Average Vtotal
> mode is enabled.
>
> --v2:
> Since vrr.enable is set in case of cmrr also, handle accordingly(Ankit).
>
> --v3:
> - Since vrr.enable is set in case of cmrr also, handle
> accordingly(Ankit).
> - check cmrr.enable when CMRR flags are set during intel_dp_compute_as_sdp.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ac81b172b1ec..be3b9ba943a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2637,11 +2637,20 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
>   	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
>   	as_sdp->length = 0x9;
> -	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> -	as_sdp->vtotal = adjusted_mode->vtotal;
> -	as_sdp->target_rr = 0;
>   	as_sdp->duration_incr_ms = 0;
>   	as_sdp->duration_incr_ms = 0;
> +
> +	if (crtc_state->cmrr.enable) {
> +		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
> +		as_sdp->vtotal = adjusted_mode->vtotal;
> +		as_sdp->target_rr = DIV_ROUND_UP(adjusted_mode->clock * 1000,
> +						 adjusted_mode->htotal * adjusted_mode->vtotal);

Perhpas drm_mode_vrefresh() here.

With that change, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +		as_sdp->target_rr_divider = true;
> +	} else {
> +		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> +		as_sdp->vtotal = adjusted_mode->vtotal;
> +		as_sdp->target_rr = 0;
> +	}
>   }
>   
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
