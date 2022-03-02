Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A07B4CAD6A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30D10E3D3;
	Wed,  2 Mar 2022 18:22:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536A410E3D3;
 Wed,  2 Mar 2022 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646245343; x=1677781343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MASPePgkuRByxBykHKXoR7LPUQhBWEC8WkcttgIfqEE=;
 b=bdbuAVjbKCywhNj5VE003EwGMWERB+oLeYFOMUfRC9wdmETNmAAt2/bt
 lwPGMAP+b8MS1U8pfr/qCYmtHF5GlRBStXnoihfSRVOguGfBg6/fM9eAE
 X3Zqcn02GB97ftQNgAAX7Z3BY1VHg2Dmv9u5Ulsn3y8UC5/AAivNgyCty
 LfdzWzPh7EcdqK1Jq7vpcjrsjI/QAlJRvqgxpyNigmlhFEa5y5wXCJnla
 6QQ6wT2sMeMCXvT9RrUjIbMv69CtvZJ9kQCxxr5u7IWsFoPBfE6QNH7nG
 agXwfDAsp0gm0oeQS/6HaY0DSoTa8w5ntn59yTOCjA/nJbJ7CZH2BIqyK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253203647"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="253203647"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 10:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="630499983"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2022 10:22:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 10:22:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 10:22:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 10:22:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2ea/lp9ytFB//K61IOaJWal+vD4fXgZMdl8jaHPckpuJfJgSmgOo5Bibl71TPcgJXQyOqhgXSIJB9+8U+AVOcOp/jHXOr7EfYGjUxks3RZscKUiui26GNafBAURQE1x/N5CIgjMXd1oGGH5dJFtM7dxG9ZAplI6CazUNYRMyZuH75zOLxLpP/SiDaZ3zY7tHf3jLroaPr/FVnkBJbF1j4H09WCPt6Lwp+vZxy+YQLKzX+f3h2inQ6+8gf8SuI2DDJDDaYOf///WBesGoEFRMLjIEwtjPX8NBk5rbe8p5b23Lv0t2+VF4Q1xpfTzJ5BpoIFNbDnWhOkoT7PizunGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl9ZluKsMcnUAFJaqZTKUF5CK5UxMl5ZC3jyKTCzONg=;
 b=HaMNIq6x7Aivl7FLiISQPVTFQfKP9FBnmqzTG+SPJwYSUHvYxf/JR4xOswXNhaFAJYasJeakGI9BnNkq3bQhJQgp/6vR4NWJy2BWu6HJs79tKDfqTqO5BkloEPtUI4hY5HabDhqHYHLDbhYGTrPitD9QspvfnxznO0pxBp8hcwYIz3PAaI8Mb0mlUu9TwxisLGc3COZ4KBPqSidCDFMCtRQ0gNGf4Eomf0vxsulJlaDqVKmtWECZwAqRuL9/66tim44ZG+tQawOrg4rygizRyzbZPic//xoXtwwtle2wZsOB4hKnjPid5qTsAJw1YASfjKpI2nA3UA6uYE9Ca1Yggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 18:22:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 18:22:19 +0000
Message-ID: <8edadd30-cefb-c0aa-6078-cfa62bba543c@intel.com>
Date: Wed, 2 Mar 2022 10:22:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/i915/guc: Limit scheduling
 properties to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
 <20220225204151.2248027-2-John.C.Harrison@Intel.com>
 <abf830db-d613-8374-038f-c0d2a93df73f@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <abf830db-d613-8374-038f-c0d2a93df73f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477c0de9-c1d7-4e93-0cf0-08d9fc799614
X-MS-TrafficTypeDiagnostic: BN0PR11MB5695:EE_
X-Microsoft-Antispam-PRVS: <BN0PR11MB5695BB2468C46F1CB9F7A96EBD039@BN0PR11MB5695.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Y4yCKpY+yeTC6PU7xyuI43dTyRrL0ZGMxbk4SrfMkO2Z+sMzxwXtpeHAHX5ya0JW44Ot7g0mRIKyT/vvowrbqiO/6GCaiEbut6qZpgILAla5okZL4nJ4ZmBM4+FRH/FEMxHWtOLfXCWAKiAvV+ZlK975oacbQwbv/6PVJehtuoG5hNd+eeqN7U65Z/rQu1/vzFquhv04mIyFxqeOtbnfdaMSNBW+3ZKTz2aDeSj7RGXp0DcfS8GkZansnfaFMDdoQ7988kcVrtAYv82thNdSKDjOjOXQi/DeHB3lI5yOEa3AakXIKUyGiZDFrylo2XED7DFoPwEdvPDQnGK4Xr7CvWRVChCXHybl1m9diRnAJLRWr1HofcsTgUyVh4IMs4otitSDcRbpFStL67CLqyquK4rpQRBwNO5Lk9cYyQbVlT8HFpu7z1c9gc9AY9TGo7j9AdZx8XuJ06VLXgRJC8St6UaVRwHkXSTMj7w8pR41iNqT/CKhre6GbMvHwTm/Lr8XrQPTgqbFcfxMzc3nsPW/Q4XlPsJWGW/2WPk+9IL9L8dvFHM9SqX30fa52iLrztq0P7xjFwEEmgcJ2YkbgpFBl13h3u0WS76mFxMtHt990ToBxZhHHFIXz6kEREatBMBLK4O9hl28IbmkzTepS84nQpr2YP7paiaON8Mn7WrVvgtNfZ6FOKBzprWtFmGVPLE6Se5T6Bpu9bOZ9MA9eiSrH3YPwRqp2b7lzAh6/VXMpOc3Qd1MflaPt2NvbHhEtS6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(83380400001)(36756003)(8676002)(2616005)(186003)(26005)(4326008)(8936002)(53546011)(508600001)(66946007)(38100700002)(6512007)(6666004)(31696002)(6506007)(66476007)(86362001)(66556008)(82960400001)(5660300002)(6486002)(316002)(30864003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZzM3pENlNuYTVrdUFSZW4vNXJxNzR1QlhVT1prbjJjSExGV3g0R3ZWdldv?=
 =?utf-8?B?MlZ0UlQ0cmNDVEdtOEl1VnkrWDNJelhQZXJiZncvcTVES3QzNG1rb3N4WTN2?=
 =?utf-8?B?Rk1CSFg0SFJFVGI2SGZSanFLdlVrRC9kSTZSZVFGM1RzUWtxbjZacStoeWwx?=
 =?utf-8?B?Y0lYS2dvcUdnbVp4QVBqbDYzSG51enlIVHRPZk5sd2x2NnRoaEIxaGZVYlBR?=
 =?utf-8?B?TXhVVUloOTFrYitXbG9Lbnl0ZHFwdURzT3Y1SHphTjd0NlFxb3lUblRBN2Jx?=
 =?utf-8?B?ZGVuUmxDVXBteDFzL3REUTNLMnB6bmtueUxMS0NDd2RlNkY5Y3Q1SGVYYTlB?=
 =?utf-8?B?cFEwcjlJejgvNHArTFFUdjE0MmsySVZOem9aOERET1ZScS92SVVCTkxrdXdy?=
 =?utf-8?B?TURrdll4WFBsblI5aFN1U2MwQ3JBQWNvenlncDhrRE41bStCaTFXN2xyRVdo?=
 =?utf-8?B?RUlsZzN4aUtDSjZ0VHZiMjR2Z1hESVBZQlNGaUU4KzdlRkNwWGFVUzdUY2Ft?=
 =?utf-8?B?THZxRngvYU1hUmptVmdYQXFzaCtvU2JCaTVoR3BtM0dGUGthSitJVW9YcGlk?=
 =?utf-8?B?amFGc09kNnNRUVpoYU9uRmU5TXZDdUoyVHpnSzB5dlFsdU9LY2NhTXViUzBy?=
 =?utf-8?B?T2FvaEt2MmpqSnpQTmJlT1Urc0FGSW9ESWVqSzJGVFZXWTRpN3BtMDR0ODNS?=
 =?utf-8?B?MmJ5UG5WdXVLcVFwUHFKUHhTeXZLQmdTRldVVmxkL3A2SmRscTAyVHlqMlRP?=
 =?utf-8?B?bnRxMXROVjVIbFlKS2RIUXQveFlOZTI4d08rZmx4dkZuVDZud0ZNcEpQbnJ4?=
 =?utf-8?B?Q1Q4N1pnTkhYUjBPQ2JpSFpDNDFZVXNCQ2dGZDlQSGxmVWQveHhHNTlNWFNS?=
 =?utf-8?B?NEl0UWdJUnhKbURvV2RxVWlWUkFxNnE0UUZzNmIrMWR2ZzByTGFrZ1NYeFBT?=
 =?utf-8?B?Zkw5eGd0K0ppQlI1L0phQXhzbXBjQlhUWkU4Y2VRYlJublZZSndadWRCTlVB?=
 =?utf-8?B?RytSdi9NditkTGZRVVRHSG1Wdk9HZGVkV2MrN2Y0Y3RmdWJVWFdCNDdQK3RF?=
 =?utf-8?B?TTRsS1pnRWNOcnM3dHNCTnFHaElJSE9MMjlqMFk4Y2JOcHNONGdUSUNLWVE3?=
 =?utf-8?B?QWU2bjcrelYzdnVmaDVUMDNCV3g0VzNSY2VxRzBQbDRZTG90QjZWQXVGNmdz?=
 =?utf-8?B?Qi9DRWtUVmtMbXFZUVA3NDlyM3RybS9LYi80TEFhbmpKWGlwVjY4RzlhbjJj?=
 =?utf-8?B?dHMxekZZRG1VTnZKaGxlWStTYjJHTXBUbHE1d1d1Uk0xUUxuNWJNMk5sbG5W?=
 =?utf-8?B?YmI2WUN2WDVheHFjcjVDRU9kREtFcHcrUUF4TW1hclA0TmpwakZJR05oSWox?=
 =?utf-8?B?bnVNYWoyZGtxcW9kWWI1UGVCQzE5VkdLMEN2aTRnOWIwc0QyUGJvZHZYY2Qz?=
 =?utf-8?B?Q2htWDZWTFJ1UXVuc0c3NzJuR1BHRkxiOStESEhyUzBUbXorNHFNWU1EL0ND?=
 =?utf-8?B?VXQ1OUlPM2JxMVExV3RvV205TlB2YzkwWFdrc0JPeWIvN3dJOENrYm1TY1Nq?=
 =?utf-8?B?VmdyaFBvWDdINnJNREFkSnNJZXpOcVFNdFFJbkw4VDBDeUFXYzQxL0VFWWZ1?=
 =?utf-8?B?bFhYZDlYTzJWR3YzR3pTejRJeHZlU3lUOGV4K0w5NXVqb0l0Y2tpTGFuL0Fr?=
 =?utf-8?B?eERVT0tzSVZOQjJMS0tXNXhPUzZKdlIzREZ6eXJ5M0dybzU0TUZXa3RqL2pa?=
 =?utf-8?B?cEM1enNzODk0QUtneGRkbkhTS1czOHBPRW04b3FYUnpuZmQ2ZFAxemkxZW9C?=
 =?utf-8?B?VlN4bStmVHZLRDl3WFViU3V4dFk1c3FNVlduTmhQLzhITXhRM0NITFpodEJU?=
 =?utf-8?B?ZW5UZ21GcFhYdWVuaG9hWjBwc29YaXZJZXpCWjdTTlNBdXNWbnFiektYRVJh?=
 =?utf-8?B?UzczMDhrSVMvRkJ0SktNWWp5V1dEalNyU1dnWStxQm1SWEZKWWx1U0lPOXZt?=
 =?utf-8?B?WTdNQXNkaitRTUsxL1p4WEh5RVY2Rjg2Q0NzTm1GemFjaC9kdzV2OUNqZGxk?=
 =?utf-8?B?SU84RG03MCt2SjdGK05INjVYRnNrblNlWkF6Y3J5K2EyMkRJbXVXVEwreUFl?=
 =?utf-8?B?L3p0WmhCbmIvOGZKcWJGMHJIMVYva1dLWlBBZkhycFR2elZUMjJzWGhONmtX?=
 =?utf-8?B?VytlcGdBaGkxa01aTUdUaDUzRWVhaHlDK0UwUlFKNFErOHFNOUxLdVlkT2FD?=
 =?utf-8?Q?KGwH5VSisTZxs/2M3WJkSSQMglZ1n97MbVdoLJpfO8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 477c0de9-c1d7-4e93-0cf0-08d9fc799614
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 18:22:19.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7vNXVtCqbdfFi6eJKHvE+L7HjcRnMaOQNvMJPdF7gO1hnYPSH1K9hFdCN7zZj5m6CEBY+7Y3nLWpo4OLAj2dHZCdFUBRnbJAsZ6EqBSGFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
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

On 3/2/2022 01:49, Tvrtko Ursulin wrote:
> On 25/02/2022 20:41, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC converts the pre-emption timeout and timeslice quantum values into
>> clock ticks internally. That significantly reduces the point of 32bit
>> overflow. On current platforms, worst case scenario is approximately
>> 110 seconds. Rather than allowing the user to set higher values and
>> then get confused by early timeouts, add limits when setting these
>> values.
>>
>> v2: Add helper functins for clamping (review feedback from Tvrtko).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
>> (v1)
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine.h      |  6 ++
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 69 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 25 +++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++
>>   4 files changed, 99 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index be4b1e65442f..5a9186f784c4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -349,4 +349,10 @@ intel_engine_get_hung_context(struct 
>> intel_engine_cs *engine)
>>       return engine->hung_ce;
>>   }
>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>> *engine, u64 value);
>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>> *engine, u64 value);
>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>> u64 value);
>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>> value);
>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>> *engine, u64 value);
>> +
>>   #endif /* _INTEL_RINGBUFFER_H_ */
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index e855c801ba28..7ad9e6006656 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -399,6 +399,26 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>           engine->props.preempt_timeout_ms = 0;
>>   +    /* Cap properties according to any system limits */
>> +#define CLAMP_PROP(field) \
>> +    do { \
>> +        u64 clamp = intel_clamp_##field(engine, engine->props.field); \
>> +        if (clamp != engine->props.field) { \
>> +            drm_notice(&engine->i915->drm, \
>> +                   "Warning, clamping %s to %lld to prevent 
>> overflow\n", \
>> +                   #field, clamp); \
>> +            engine->props.field = clamp; \
>> +        } \
>> +    } while (0)
>> +
>> +    CLAMP_PROP(heartbeat_interval_ms);
>> +    CLAMP_PROP(max_busywait_duration_ns);
>> +    CLAMP_PROP(preempt_timeout_ms);
>> +    CLAMP_PROP(stop_timeout_ms);
>> +    CLAMP_PROP(timeslice_duration_ms);
>> +
>> +#undef CLAMP_PROP
>> +
>>       engine->defaults = engine->props; /* never to change again */
>>         engine->context_size = intel_engine_context_size(gt, 
>> engine->class);
>> @@ -421,6 +441,55 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       return 0;
>>   }
>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    value = min(value, jiffies_to_nsecs(2));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>> u64 value)
>> +{
>> +    /*
>> +     * NB: The GuC API only supports 32bit values. However, the 
>> limit is further
>> +     * reduced due to internal calculations which would otherwise 
>> overflow.
>> +     */
>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>> +        value = min_t(u64, value, GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>> +
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>> value)
>> +{
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    /*
>> +     * NB: The GuC API only supports 32bit values. However, the 
>> limit is further
>> +     * reduced due to internal calculations which would otherwise 
>> overflow.
>> +     */
>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>> +        value = min_t(u64, value, GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>> +
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>>   static void __setup_engine_capabilities(struct intel_engine_cs 
>> *engine)
>>   {
>>       struct drm_i915_private *i915 = engine->i915;
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> index 967031056202..f2d9858d827c 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>              const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_nsecs(2))
>> +    clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
>> @@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>           const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_timeslice_duration_ms(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>> @@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>          const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_stop_timeout_ms(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.stop_timeout_ms, duration);
>> @@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>                 const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long timeout;
>> +    unsigned long long timeout, clamped;
>>       int err;
>>         /*
>> @@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
>> +    if (timeout != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>> @@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>           const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long delay;
>> +    unsigned long long delay, clamped;
>>       int err;
>>         /*
>> @@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
>> +    if (delay != clamped)
>>           return -EINVAL;
>>         err = intel_engine_set_heartbeat(engine, delay);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 6a4612a852e2..ad131092f8df 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>   +/*
>> + * GuC converts the timeout to clock ticks internally. Different 
>> platforms have
>> + * different GuC clocks. Thus, the maximum value before overflow is 
>> platform
>> + * dependent. Current worst case scenario is about 110s. So, limit 
>> to 100s to be
>> + * safe.
>> + */
>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>> +
>>   struct guc_policies {
>>       u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>>       /* In micro seconds. How much time to allow before DPC 
>> processing is
>
> LGTM. Pretty please:
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..8208164c25e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2218,13 +2218,24 @@ static inline u32 
> get_children_join_value(struct intel_context *ce,
>  static void guc_context_policy_init(struct intel_engine_cs *engine,
>                                     struct guc_lrc_desc *desc)
>  {
> +       struct drm_device *drm = &engine->i915->drm;
> +
>         desc->policy_flags = 0;
>
>         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>                 desc->policy_flags |= 
> CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
>
>         /* NB: For both of these, zero means disabled. */
> +       if (overflows_type(engine->props.timeslice_duration_ms * 1000,
> +                          desc->execution_quantum))
> +               drm_warn_once(drm, "GuC interface cannot support %lums 
> timeslice!\n",
> + engine->props.timeslice_duration_ms);
>         desc->execution_quantum = engine->props.timeslice_duration_ms 
> * 1000;
> +
> +       if (overflows_type(engine->props.preempt_timeout_ms * 1000,
> +                          desc->preemption_timeout))
> +               drm_warn_once(drm, "GuC interface cannot support %lums 
> preemption timeout!\n",
> + engine->props.preempt_timeout_ms);
>         desc->preemption_timeout = engine->props.preempt_timeout_ms * 
> 1000;
>  }
>
As per comments in other thread, this is redundant code and is too late 
in the chain to do anything. If such a check is present then should be a 
BUG not a drm_warn. The whole point of the helper function is to 
consolidate all limits in one place at the point where it is still 
possible to correct for problems.

> With that:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Any idea what happened with the CI run? It's full of odd failures.
Not sure where 'rev3' came from, it's the 'rev2' code and I don't recall 
hitting the 'retest' button. Either way, that version just hit a merge 
conflict and didn't build. The previous two revs seemed to be hitting 
'failed to reset' problems in an execlist selftest on execlist only 
platforms. I'm not seeing how that could be related. The changes should 
only kick in on Gen12 platforms and/or with GuC submission but the 
failures are all on earlier platforms. I'm planning to grab a SKL or 
something to test on to make sure, I just haven't had the time to do so yet.

John.


>
> Regards,
>
> Tvrtko

