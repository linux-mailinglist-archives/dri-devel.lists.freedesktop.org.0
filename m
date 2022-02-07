Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F324ACB2A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 22:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140D810F92F;
	Mon,  7 Feb 2022 21:19:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171A410F92A;
 Mon,  7 Feb 2022 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644268783; x=1675804783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rBwi/mp9mufDNk+Kvzntt/EmXxZM4BjaVCnxg4CO5Q0=;
 b=VQqD5ScIenozKH16h7rgaNJyXTqXLA75A5/7ViNOsUO3o/jJa6ROWoyJ
 qYv/bklJDQQf6gNMlR3VbyQw7C9zwStUZEN5ccCdqV5JkxZAIChv6fT2S
 Vl2I3b2pqdLp3ZbZTkRENYlmpBKzfiFrNO1CAGPoPBAVkmUjTIySPY9d0
 VyuwaOq2wZRdAal/4acYSn9TDM75T0YOWSv/aDDDa1mT1zLuek4MhiDLk
 ZZ3wFbP9OSxReOjwvOIRFrYJ3dQW52jp7Mm+hMotY3y9gDWR8reL2pVtr
 tuLZYLMbUGG5rWygZqLGqwQUBTHXDK6Rbw0/IrdWgFS0RFal0V/X9vyMW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335213121"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="335213121"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 13:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="601023007"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2022 13:19:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 13:19:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 13:19:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 13:19:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUdQsI15Whww5svB+zrbHXygieRtHxUX85zMaZpuWIYfUFA3eYVUmiZyST12u5s673XNu2U/jWIzxiS7NkJDmxV1S4qsK/+D5Q0xf58xMoApjKhtyKhcXwppscSvPPthoQ94R4AT37TiMHGqHZpC/A8rczIHEaplJBtCtIXwHQQfqismhPKSWlOReoqNrHi26i/20Wrs5auxBK3gSlO/LqCbdUrlwZbzgHmtzp/G4Q/QgRAeJoN5Xo2FJiTLRRjkexrOmYQ3Ip83RPAkDGJy2GtG91SN/WkBekFPjy/8F9jg0M5KWE3m47poFDtuFIsyIB/V2+UZ+OzhNegXoYh30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0ZNHZtXIPupDRQ14hx5Sk4iLVxka3apymgt7g9METc=;
 b=EQ+S7gLjgKr8siFdGu7Ya8OUqHyf907PkMoudo3htoZtx/oh3Ws/dh3H+KcTuX16p1Z8oMd5/+A1LiSMzU9kPI1tl841AUWgL+V3CISeISXvsLHWLg07Lb/oCmjMm7x/v4kxytEv2hM+l4Iwk/CLv2osB0RAx0T7fUe9ySU7xmj5jui5og5hZpIiEeoRMbRXPp9cxIEy+S4LUxr+PrzbdKMBZDzX8eYCHQRWY+MFanIiOd7ZTRCT3Bv9HlgXar4x/950rlGagx42v8Mnv6RDEfOzm4uHF9NWjwfwd7v9Hz0izBY20KxqMR6wIAHCcM9ZTy4lzZCIyaCQLtYhtxzqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 21:19:37 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8%3]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 21:19:37 +0000
Message-ID: <4e4d90e5-ff7d-c572-1d19-df28602c394c@intel.com>
Date: Mon, 7 Feb 2022 13:19:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v3] drm/i915/dg2: Define GuC firmware version for DG2
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edbd63c7-fceb-4c8c-7592-08d9ea7f8b8d
X-MS-TrafficTypeDiagnostic: MN2PR11MB4552:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4552337C8BE6159C20102F6FBD2C9@MN2PR11MB4552.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +VO/Z2UD1PDs1o7TOeQkIGSe7Q43fUlFp6MseEdtG1U23Xndq5ErF062mgu6xR0FTe6I1cejUGmIc19HRLqSflZRQwnLXsg7f5JS6/rSNKlUBmZjQ1wD+YAj7zAR3hk8nWKdn8dC/jWTzsSdHLwW+gwYpctJRbiriGIbsRFpVUgjCd94IcbCgcafkQ1EMqrt50SHRRN5DyAgKV5rkyqZf0Z2e2FGFU5mOFXg8nkzlac4/CD6/fr0/PXFhTxJG1eNGSxdGpljk5uNpbsDjNp0/1Vu0dG2e+f8OlnkVpD1h7IaTg3CzummrFFbTDHasDTVfm2cANdjLSVHTFZ//7HEo8gFrMvj0xE2hDvI56jQxMxc1se6v7NmSw1RouiPTSzvAaWfnclOjzgho/iCRiQK2PoLbW4slh4HNiRwnEaAu01lBcZ7SsFn9IrZYE644x+yXkcdlO0ob66DQWhZjY6ts18Sv7/9ed5+xJSFNletPgO6AlYtZOstMXCcCxFGbZJAUz2XN7pN9idqjPfkgj+RCOwjac3c24hQzsuTOZtMmipUx9MITcVxsHSWR6CBLU5h8ODyKl6Qqrek+8vNUOvC4rZTT0102iSety6NrRFO6EbrpuQpFjAGUWQeLU7OiztxOmg56UZO58C/lNKjY41WSMNIE/FLajuGrN1CYNf9PCgKnnE2AZ40smz4bXsk7AB7443VduvIZZg2D7+Jo6lMCKyYINgBunVrIKrzRbr7qFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(36756003)(2906002)(6486002)(5660300002)(38100700002)(82960400001)(53546011)(4326008)(8676002)(66556008)(186003)(66476007)(66946007)(450100002)(8936002)(316002)(26005)(6916009)(54906003)(2616005)(6512007)(107886003)(508600001)(31696002)(6506007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlBKTUNxeXJqVllLZk1LTXEraDc1bW1kZ2xNNksvNGVoVHg1UkxUS1E5TVNi?=
 =?utf-8?B?dXdWRTdnYXVWandBcTA1VWQ5SFhOVGMyZjFLcU8reFpwOHllYmtodTh1Zmw4?=
 =?utf-8?B?dkNuNzZzdllkQ0w3clRvT1pIQjJ4SDB0blZDZVNKbmVST1cwRGdtNEUwM1No?=
 =?utf-8?B?WW5CK1JKWVhQNE5zbTFkVTFRTU5LeXhzQkVkd0tjd2JUVUExZk93TXEyanFP?=
 =?utf-8?B?MVdUTndVdXJrNDNBelBEMTV6U0cvQ3MxRUhSaWZhSk1WR3NWS2MxeHJWc0Y2?=
 =?utf-8?B?WG1XeXIwWTUrK21pRTBMdVFnaFgxcTl5UXBzMHhEU1dock5QaFYwR09ULzBF?=
 =?utf-8?B?enE5b0l4RGRxbXVDRmozTUxYZldFUVlOZURTeXVpTDFrRnFmSEpLb3pwdW9s?=
 =?utf-8?B?MlNKTFJITmFwNHhtT0xBdnhrSi9oZXRoMkxCSkdWSDE0MlFiSmJCSmYvZkpM?=
 =?utf-8?B?RG1BYmQrTHcrUEhRSURsVHVRMm5sVm9xWkdKSG03K0JuNE1TMXBwa0xxWDlW?=
 =?utf-8?B?WnN4S3VhRXg4UHNKNjd4TXZlODFCcWhnRXN6TEw0c3JqUnNlemJaYjJGVTB1?=
 =?utf-8?B?VjJUQi9QTTlNdTNrK2NPYUUvcHVVTEZOaDNJbjYzb0hYRS9GZGRHMllvejFZ?=
 =?utf-8?B?K1k5Qnp0NERWTWlxN0VtMWdJeXZSdVpNY0IyeUQyT2UrUlFOTk5jQ21WcG5z?=
 =?utf-8?B?RGxIcmJLeUNMSGlNVk5MNWRDUVk2SUErOUJmci8yS1F3RUYrK0J1S1pBRk4r?=
 =?utf-8?B?cHZid29FdVpZYm50cGN6Y25zYXY5azBvdjNkL2JGdmp3QUp1V2hIMk9uNE9P?=
 =?utf-8?B?R3VURDJ0VzZzWjJiNk5tU1RqbTVlWWFST05FeGtmcllOZzBENDYzQSttdmdy?=
 =?utf-8?B?NlRpaHpYSkRFVDR4R3creDBSbEhOc0J4RmV4bmd5bmhXYXdiSHBkcWkrNjFV?=
 =?utf-8?B?MlMxSHRuVDJpQmYrL3pBazAxMmdkZGU1TEoyRGwrMnRsZUkyV1V5NkZ3aXgr?=
 =?utf-8?B?Y2dNcU1Rc09hK1AzQVRGeHQ3MlJxdHF6U280NUtaMkpZWXBTQlY2aHVwYk90?=
 =?utf-8?B?UFd5SVpqYUZsM01FWEZDUUdhZ2NmVFoydHpncEN2TVFIaDBEaFEwOXAxUUEr?=
 =?utf-8?B?MWtuazlkZGMyZUFtTWlJMVMxRjRtYlVKdmdRVVUvVUFxOEZYWHQweFlIZUNY?=
 =?utf-8?B?V3J0MUl1VnNFRUdFM2o2RFY1WHVucGdBMnNDMHBreVJLaFpwWi9FZFVVWnNi?=
 =?utf-8?B?WnZ3WU5meGdEQ25qcU1mZzlBVG1xdzBFRERydS84NzNzT05uRTdjdjBWRll6?=
 =?utf-8?B?M0RsT1A2d2k4SjdEbHRSQjN6UEwrODJ5Zi96NXdBbUR1WHpNMWRkZUF3NGg4?=
 =?utf-8?B?d04xVTR5V2pjL2Q4Mm9YblZsQ3R2NnlKSWdxeXJKSTB2WlBqSUJjcEpueHZR?=
 =?utf-8?B?ZWtHYXp3Si9BOHlFZDJEYVpwTVVzbE8rSk43UXdGaVRvSXpMcmY2UmpHRXAv?=
 =?utf-8?B?SEVOQkJZLzkvY1ZickhZOXdheVJJMldyNjIzSnNic1M3NzhYL2pIb1hsQTB5?=
 =?utf-8?B?RFY1ejRrQmtrOEZpVm9DQTlEdHJ0UWVwWHgvUTFSaEg4NG84cTExazdxRFNL?=
 =?utf-8?B?RzZaVk1qa0hVUWZlek0yb0pXQTJRT1lsL0VNTEtDNmJhL3FNQjM3VmRpU1NQ?=
 =?utf-8?B?UVpJbHg2YWZzMnhvaDQvc21jVkNhVGlZR2dsdEU2M0JlQjVmVGhTenNPNVNL?=
 =?utf-8?B?SUcwcW96QmYxZEl4WEQ2S2EyVzcxSnhVdjZJSmZ5a0laSmN5ZVgyK01oTm5x?=
 =?utf-8?B?ZUpudWFZV0t2WFlEVkNQM09UTHhCajdOZFBlbDRrZlpqTk8xeVcyRDd6REd3?=
 =?utf-8?B?S0dBcjdsYWJiVm9lR0U4THVKN01xVG9tY0o1UEZWckx6aVBUVlB1ODI3NzdH?=
 =?utf-8?B?bHorbjBEUWlVOGxnSzhiMkxVb1JlWklXK253WTlJS3NjR0piQTMyME1qT2p6?=
 =?utf-8?B?NDdocE1sdzBpQWxEUUY0VmpDNXpBbDFkSVo1cFpZZklzSThkSE1zSVk0c2xF?=
 =?utf-8?B?NFN1dkZNemtyTUU2UE50aUVSbHh4dXo0Zlk4Qll4Q3AyNy9jMUY5ZUMzWDRN?=
 =?utf-8?B?bFA2QU9PNUd1cXFlem96TzhEWE1xSnU2eDlqL2x1L3h4aWx5VmRCV1pnZkpo?=
 =?utf-8?B?dHE3VkZjZkZWdTBoK1VNL09YL21MRmZ6YWxtdTN3dHkrdE5TQkYzRGQvb05B?=
 =?utf-8?B?SnorMS9hVXNWTUQ2NGJUOHNXVHZnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edbd63c7-fceb-4c8c-7592-08d9ea7f8b8d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 21:19:37.5185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLYqWGivJvgSztMvGGiA9U3fVN3P4zi8SRZ807s9qah3DLO0o0nJ+4sjQoeHf757OmDn4uVtRJ93xZuVwOZSwmI+x7itoUggrbtaik4XIEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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
Cc: Tomasz Mistat <tomasz.mistat@intel.com>, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hmm, this is actually v1 not v3! Had something stale when posting.

John.


On 2/7/2022 12:36, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> First release of GuC for DG2.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> CC: Tomasz Mistat <tomasz.mistat@intel.com>
> CC: Ramalingam C <ramalingam.c@intel.com>
> CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index ba4f0970749b..efe0a6dcf9f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -50,6 +50,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> +	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
>   	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
>   	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
>   	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \

