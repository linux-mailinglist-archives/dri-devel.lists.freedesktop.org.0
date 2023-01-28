Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD767F3FC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 03:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0610E2F0;
	Sat, 28 Jan 2023 02:28:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971210E2F0;
 Sat, 28 Jan 2023 02:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674872903; x=1706408903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dUoAhWucw2ueiG0p86OokUlLMTmqAUiOoAOMKR5xJZs=;
 b=Dc5/GwgHMpAtrOqeqKefCzXY4dqm8QMu7xNsFbiAKBrIeZK3RjzPsgjT
 g4mNpmCZr/xNXnUfia9aWX+YT4bdt5y5jTxRLDeCvtl996BnzVbb+5Xiy
 o4G8ginK2Fjuz3DPfL7/FZV5QFrSv0EOXUjX04GPUHGHgIUpDFndniRAs
 30J27d1ixHiGs0WrQnB2JjLuh9aQLVeVyAXbYPnmgEz/jAhaGRPe/5rgq
 cOIEPAa7l4dY5tW/a00LBH/ObXFOglgadlmg3RAJvauNIpINLTDvOE8rL
 6dlj+cMwJo+FtxSya+iYPREATuhC2rmth3447ydZ6Uw17+Uo+SvfsUqOe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="327269679"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="327269679"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 18:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="837347734"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="837347734"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 27 Jan 2023 18:28:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 18:28:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 18:28:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 18:28:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 18:28:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRq0QObPjdeMsVGcksmDsb77OGdEfAvZe/wfcOH0ISIHwEYKBkGSavLvYZhXBcsGMMRqgtqMA/gGQUFq9+I8S4ztITeO/PQ3PcyJ4aHONOk0pBnB4ONsHXecR2aLIl8pQeBEQP7SVdKAomctfKNVUD1HvirhjzUYc0tkuCxk+uy1ISvqUzghf/T4rRK8pMFbKfso6RwUd7HNuDcUPFSek+QWqWpDZGt29uRiUWobhl/OtaV0K6wO4HA7NuvDVa6UEYx2Nrr+ok1TKVsHpjMveZjzGt10VS/ulBJL4e/yODzXRxz6QBkb96juk4U39VwmdOlTul81eSlxLG46wjjTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd2g6VSpSbv1e62NZaRg6q50agbi8270QKmjR/TO0A0=;
 b=j5ywi8tYj2s6/wjjHon9ia+M6aDMsyMGt1F/sdT782aDm3vZ99SjVvX9t9Qf3yhfz8bp/MiyToF5qhig3lQpb4F3r3ckd0loSwUzVqH9r9AAEVXrrOdDUPcXpb15DPRQwSMjw3ZLFHQLhZpfG7wdmUdPTtSv7NlxqQlyvwwHzH2C/CTwydaWNjTVA+Ovgu5EZWpAp688s8iH9bvAo/oSKOQDBX89OKTvjN3B+tl2s2G1mVTIAGd2gl8CeDM1O0inQEtuC+vOZJvwbpmnBaos8sqhSu/k2K593FyKbmrurtq8CitNBQH+Up+ePfv4+DBCzIDDRxkYzey7QIFFfnPMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sat, 28 Jan
 2023 02:28:14 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 02:28:14 +0000
Message-ID: <ece46d94-1b77-ada4-fa24-1a7287ad79e5@intel.com>
Date: Fri, 27 Jan 2023 18:28:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/guc: Fix missing ecodes
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230125004935.1986479-1-John.C.Harrison@Intel.com>
 <a8fec1b746e540aa6ac275139b26a524488d6a0a.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a8fec1b746e540aa6ac275139b26a524488d6a0a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: b61069ac-5e38-4470-a66e-08db00d74e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58dra3vewnAuY1SqLHzx2Ud2GcrkgfKb0x71ulDXE5ZIqm+ZvD0hOBfB0iaqCsgA4YuENJ90gpa1wr/NzQQq3Fwt7KmjdKUs3RNwavUXl4azRyUEQWrZCInEN08Sd5o37yTq928+TEmo4j8d2qaRR9VwHxVeok4/gzfPfCQ1EmVB18kUweZXFwqAr7nKnf124K0rWPkaO74YQUfEQiKb5PA097+0IVn1C6ye5/C3NUv44iB7UURbNUVk2jI7cLvXFzkL0ddLKdY6dTtoYPm4eah5zlk4bDp6NlHyIuQjeX/iOCIWu68HTmR1QW6INCC2WSDoW0eGE6cg4xm/H7UmCdh9vDBwgQ69Z8ugibkC+3gCmqVwnhRq/d/vWXCMFZOhqt3Gk9bjvW8EyA2kE0OC0q3bJmdzwUTBArRFN0kCkiuUmtg9VwN6juy4NEEZAWPmmo7yqo/gP+T3ZO3w1sb0oaHRpLT9xHBcZB9LRDqy+fsbP5BqMq3vjjiO1gSycK0asXC0JTGFc6Yfa8Zjx6mOz4xTGT4qeW0Ca2zUCr3BvfMSq6IH4yjW7sLmb6P6qHX3xxQCD6xJRRx1OdMnVGE2uu7oNYNqhKxbKBpgYyaP6OIUsomBHhS5g9JQdL5rjmRoJ1oJy7bWX2PQjtV3jdk96TSK1T3bnp3yyfhxJb2gmg25hBQr/8iVVSD7DqeTIEm8l69uItHVjeB3w4LsRquW8vjJEVVGrI1fOsFpOgVDR50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199018)(41300700001)(450100002)(66946007)(66556008)(66476007)(83380400001)(8676002)(4326008)(31686004)(8936002)(316002)(6512007)(186003)(36756003)(2906002)(110136005)(5660300002)(478600001)(86362001)(6666004)(6506007)(82960400001)(26005)(6486002)(31696002)(53546011)(2616005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU9kRklTUmM5TlFjdWxGMHNmdmdaZWJEYlpTNGlUNG1aNEU4djdZWUVDZE5k?=
 =?utf-8?B?MXNTUDRxcVV6bC9scDJpUjkrM2FqY3oyMysyU1Ywc0wxd1ZKYkxWajNLUDBj?=
 =?utf-8?B?U0tKSjJKUldxc1M4YXZqdTdJd2puL1U4UnlTZGtFRVU4dWZDbCtydmtKcGNs?=
 =?utf-8?B?M2I0WGtIczB5U1lWWkkzbTNzcEJZZzhJYUZ5S1YweDlWVmluT1phQXJPWHh2?=
 =?utf-8?B?SEtWQnVFUkVJVll0RFc4REdyNmRGUlJPdnVpbFc0NDZqT3VPZTU1Vkt2YmhX?=
 =?utf-8?B?bVltbVhzTFFnaE0wbFdHYjR0UXZkT1FOTXdOK1FrWDRuakxad1ZBdjZhVlpT?=
 =?utf-8?B?eHdBR2JHZ3p6K1oxcTZvbmNOS2tNWStjeWZIdlNGTmpwVlRac1VFQVhCSXd1?=
 =?utf-8?B?UWd6aTNBend1UVU5UDVpMlZsOWFPTms3WU8wcUloeDFTRjlLUE4zV2JTUmxo?=
 =?utf-8?B?c2d4ZnZ3QXREcFc0Qm5TY0Q0RVM0ZzBxRy96SDZUakEyRFQrY1FiYjRPakl4?=
 =?utf-8?B?aVB6L0RIa0QyenF3dlFpVm5YM1oxZ3ZVQVJ3alJyK01nSnBXY2liYmJLSXIy?=
 =?utf-8?B?dVBpaDFsY3dNV3RPR1J2b0kyWDdBRFZJNDJRb1JEdjY3cUZPZmVhNTVzejZa?=
 =?utf-8?B?S25LbzY2ZnVpd3IyNThkV2RETmFlODlzYms2ZzhVbVBWUWp3a1lkaGdXa0Vy?=
 =?utf-8?B?aVlHRGFkZndzVko4WjUyM1BEVUE4b011OVhmcjFhV2FDRUxrbWcydGpOQUg5?=
 =?utf-8?B?S0VZd0VOZEhuMFgzWGFUc0p2NGRCbHR0T1JSdkNaOVhpSmdpNDV5cUFpd2V0?=
 =?utf-8?B?WVNVemFJYk5FL0VBQ1EvNGpYR29aOG1EYTVYem1jd3BBVERrbFFZRGQ3VE44?=
 =?utf-8?B?aERjbDRqSHFYblFGYVpOYWVrZ0ErWll3Tmt0NENKQ3p5UFIwdEt1M0RqU1RC?=
 =?utf-8?B?U3dyTlM5ZHp0RjdZV3BHY3RCeXhLaWJqK2k4bjR3M3hxY1BQNHpYWTJMYXFR?=
 =?utf-8?B?ODFmT20zL1JaVmdZbzhpT1lzaFZ3WVo0Vy9rSjZoZFBLL1dWRjM0NzVNQzUx?=
 =?utf-8?B?bmVud2JVRXplYnliY0g3VUtmZ1o4Q1BOeWJZQ3VPSGtPOS80bnU1Y0I4V2g1?=
 =?utf-8?B?MHo2bCt2aHFvOEFMY2M0RGxaYlVzWk04N2VHcGxRbmpOdWZXTVVJMWx2OXhx?=
 =?utf-8?B?ZVJRNU1iWitZTFdDalhVc2ticTFGUzJJN3NXZFBsdUFTT0RGTlFUdExCZlM0?=
 =?utf-8?B?Vk0yTmpYWFBMdDUzMVlEeUZjekUyaHVjOW40dzlRVVA3T2VsQTBueXV2WWI0?=
 =?utf-8?B?SDJUQks5ZnNTN2lZaHkyQ2NiTnZNaEh4K2FzRWxlM2lpOTBlU2ZNN0ZjUlNy?=
 =?utf-8?B?OTJzWmhjNExQUm45ZGFhbE5wcmk5bjg1UWlScmtDMjVxQlhXV2x4Qkx1SThJ?=
 =?utf-8?B?WVpKTVVrUFJSRC9ROHdzR3ZqcldxRGk3Z1RRZlFHQjFmWnRHU3VLdXN0dFRh?=
 =?utf-8?B?Rm05TGZmRUVWZmNYNDdxZGNUa1BLTUFjNitaVW1UcFYvUnlsRzJWTUV4NnAx?=
 =?utf-8?B?ZTlQOVJNR2hSSFI1WElNcnpuN1dzZnUwLzBwRUFRc3pzZS9HNk9Gc3V5RFhW?=
 =?utf-8?B?cEltR2h3RDNncWxlTUQ1Ky9MazRIaStKdVhUcXR6MDlBZkVGaTd3ODBKZmRO?=
 =?utf-8?B?Z2pFYmVrM3hab0FFc1g4L2Q1NTlzWU0zUzBRejFwbmJhQkVKN1MzZzgvN2lq?=
 =?utf-8?B?eENUYm1lMDJzbU95akcvS3hETTQvMzRNb3pTSmdkTmdPUWV2bVk0YVBoMnNp?=
 =?utf-8?B?Z1NRbkZpaFhISHZ6UmIxZGxtTXVKanM2M2cxWkxhQjZIeDRtZEE1RDBBWHBL?=
 =?utf-8?B?aE8vQkY3WVkxY011UUVNNHdVbklpd3NmbzlWV1dnY1c5Tk5Uc01GRFltVDJn?=
 =?utf-8?B?UVAzb2RDT1JGaGFISGttVktyOVFhUnZOampXQmlHYjBBem85N2lHblBMTWQw?=
 =?utf-8?B?YURFUDFHTkMyZllKY2o0MTE4dHZjUXl6OThIdHp6RUZIcHlPNitQMzNwczg0?=
 =?utf-8?B?RVRiLzFuV05DeUgrQmpPNERtNXlCc2Z6Y0pYWFhGT1ZTczI0dkE5QjFaUEZl?=
 =?utf-8?B?cjNVMWc0ZjZXWE80RXFrMDlPYWROeUVQQUlHR2lYMlRvbi9lVGYrUG9YSzdR?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b61069ac-5e38-4470-a66e-08db00d74e52
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 02:28:13.7721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P47Eli4crc3HsdfYdnvqFefH4hAzEr+2ZTWqbmaaL81LAVWXi/1LXidnQVRkewcuWI1fefm9RKjhGryt1h8nGez8sRvMChyvJ89tptAiwTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/2023 11:17, Teres Alexis, Alan Previn wrote:
> Firstly, thanks for catching this miss.
> Since I only have one trivial nit and one non-blocker ask.
> and the non-blocker ask will not impact the patch intent as it merely
> tweaks an existing debug message, I believe we have an rb:
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Tue, 2023-01-24 at 16:49 -0800, Harrison, John C wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Error captures are tagged with an 'ecode'. This is a pseduo-unique magic
>> number that is meant to distinguish similar seeming bugs with
>> different underlying signatures. It is a combination of two ring state
>> registers. Unfortunately, the register state being used is only valid
>> in execlist mode. In GuC mode, the register state exists in a separate
>> list of arbitrary register address/value pairs rather than the named
>> entry structure. So, search through that list to find the two exciting
>> registers and copy them over to the structure's named members.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Fixes: a6f0f9cf330a ("drm/i915/guc: Plumb GuC-capture into gpu_coredump")
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Michael Cheng <michael.cheng@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Bruce Chang <yu.bruce.chang@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> index 1c1b85073b4bd..4e0b06ceed96d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> @@ -1571,6 +1571,27 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
>>   
>>   #endif //CONFIG_DRM_I915_CAPTURE_ERROR
>>   
>> +static void guc_capture_find_ecode(struct intel_engine_coredump *ee)
>> +{
>> +       struct gcap_reg_list_info *reginfo;
>> +       struct guc_mmio_reg *regs;
>> +       i915_reg_t reg_ipehr = RING_IPEHR(0);
>> +       i915_reg_t reg_instdone = RING_INSTDONE(0);
>> +       int i;
>> +
>> +       if (!ee->guc_capture_node)
>> +               return;
>> +
>> +       reginfo = ee->guc_capture_node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
>> +       regs = reginfo->regs;
>> +       for (i = 0; i < reginfo->num_regs; i++) {
>> +               if (regs[i].offset == reg_ipehr.reg)
>> +                       ee->ipehr = regs[i].value;
>> +               if (regs[i].offset == reg_instdone.reg)
> nit: "else if"?
>> +                       ee->instdone.instdone = regs[i].value;
>> +       }
>> +}
>> +
>>   void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
>>   {
>>          if (!ee || !ee->guc_capture_node)
>> @@ -1612,6 +1633,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>>                          list_del(&n->link);
>>                          ee->guc_capture_node = n;
>>                          ee->capture = guc->capture;
>> +                       guc_capture_find_ecode(ee);
>>                          return;
>>                  }
>>          }
> alan: only one non-blocker request:
> while we are here, could we update the debug message when we can't find a matching captured node?
> Current code:
> 	drm_dbg(&i915->drm, "GuC capture can't match ee to node\n");
> New suggestion:
> 	drm_dbg(&i915->drm, "GuC capture can't find node for ee-ctx: lcra = 0x%08x | gucid = 0x%08x\n",
> 		ce->lrc.lrca, ce->guc_id.id);
Regarding the search test, there seem to be some incorrect terms in 
there. The if itself is also not the easiest to read with some terms 
across multiple lines and other lines with multiple terms. Breaking it down:
     (n->eng_inst == GUC_ID_TO_ENGINE_INSTANCE(ee->engine->guc_id) &&
     n->eng_class == GUC_ID_TO_ENGINE_CLASS(ee->engine->guc_id) &&
     n->guc_id &&
Why does the GuC id have to be non zero? Zero is a valid id. And even if 
it isn't, comparing to ce->guc_id.id is sufficient to filter out 
anything bad.
     n->guc_id == ce->guc_id.id &&
     (n->lrca & CTX_GTT_ADDRESS_MASK) &&
Again, address zero is not invalid but the next test makes this one 
redundant anyway.
     (n->lrca & CTX_GTT_ADDRESS_MASK) == (ce->lrc.lrca & 
CTX_GTT_ADDRESS_MASK)) {

Any objection to dropping the !zero tests and reformatting the whole thing?

John.

>
>
>

