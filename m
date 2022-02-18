Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B754BC02A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717B10E7D2;
	Fri, 18 Feb 2022 19:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83B210E7D2;
 Fri, 18 Feb 2022 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645211699; x=1676747699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3ZaTylFXAzc782a7IBO/kATFs1CjneEV2Yl/oqFVOHA=;
 b=C2oLnAlxO3SbPCBEFHgJ0ipvJquIPR52yECxvMgKOZQXGJdxE7fEIzwr
 7tNbc56qkzhNAzMrfC9geMAKi1joibCBA8t48zmnr1fx4JkGLbH1gvuDL
 cDBnsPpFANKgkEjvJPYCFHaO5kAKVaH3OIxIfMD+Fr82WuduliIXwgr7D
 qLIOlMXJLgMLRgz1rX3qniq3RbWDNq2JgD85R3ADenJKBezz/3BM1E/w8
 lamukN4F3alPYjhnRdc0eUOUspq9J0zpqoWlDxUUDz5zDur0OLgkDddmv
 rbyMNc4NSRpdBKL/9Nd9J05pRVxLHXkKNkAlJarBL2Tj1KhvEu91/cHHW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="337640669"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="337640669"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 11:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="531030190"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 18 Feb 2022 11:14:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 11:14:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 11:14:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 11:14:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTzkZl/wPZBSwZEzT0IRbU7TOU0a9DBshOmw7TEd2unWfacbtt1bsNYoiWeZ4CO2QRIxHt6hbuWEEGtdPAAjUuJ+9TfWtmeLq/Ubrw09cmfR00HixvUMqG/C4xiBMH3sb4OAVr9xCed6N7LXHaPYcE5dwJXQ8GOR42prmXpUaR0BWGq4lh7pjKON6FR3GMTQ+T4fTokNJwmF6rJSarl7R0wWW0HMASBrlGNIX+zx9arOBWfOYm6x10FSWrQkBqgcOMeB8W8Ww1zdsBh4dXnQVGEaeCFpartDjn9KfejTXrP8T+zK5L71W8UusFn8zRo5EZL8/4CUdQrIWzwvn8TNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE8CIE54pa3rgaFkbR5J6UvnQIK5kCR1Kuk8q4iCmVs=;
 b=VjMC9nvj0UAGwVtZJxW9fF7GjckZakb2rDQYxKck3EzKSXFCDtwUQFeBdgpAUhBu3zI1pPxQumDH3BAYAX7LgnOcZzxG2XVLNWX24qoGKzHBY1DcWQo2ALQdXM+K3+1lj+Vr7RT2MXRTRk+CzkMWTWmvQA9K+bEA7SB7S/ghPZzvagY6vAofA7yScjHi6smuv+HcTYkja/itfPeGZXUClkup2HhrfupheQgvglG6gelrDtfBKxTzaRXyudKKJn70EUMSMLeb1BlHFhkskzNrdCG/lzulSAyp9x4BpwaVTCHcSEY+dezDVPZgv/+VVZoQ7NEOmqTnPBt3+08Aw755rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by MN2PR11MB4413.namprd11.prod.outlook.com (2603:10b6:208:191::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 19:14:53 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573%2]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 19:14:53 +0000
Message-ID: <24183a7c-2350-2b71-e885-ae5c5fe1da60@intel.com>
Date: Fri, 18 Feb 2022 11:14:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 01/15] drm/i915/dg2: Define GuC firmware version for DG2
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
 <20220218184752.7524-2-ramalingam.c@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220218184752.7524-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c34e2b-a115-46c8-0399-08d9f312f174
X-MS-TrafficTypeDiagnostic: MN2PR11MB4413:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4413B72C27B8530A77CEBB71F4379@MN2PR11MB4413.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6y91FqvOer28uUh5O591h6OUN4kLLKWRE7ISTPMQgw+Dn+bGPt5qqCWNhinCGIIgIlaLh4nW5NpdU1OIUj3lbV5oXFP8KL3WtOezs4/AkJDmOV1h1oGHy7vtXRh/mH0s0wuDkbUfv0sblzc1I0ncATfuraHSbbDTQqYNDGPRJRLXPCuR/SiEiRhdjPV+FOQY5pPC6lnKsDNMn4gpggSCj5vcyRHEypR2Uf94AFShJkt6r4suTSpsf2F4ktTdE+3e1BRbQJYePk0vQnBFsM/vYrtdGgJOFJ+sG4cKHLLNTyRmBfDg9eNutqn/Z+Tcahn3e3efNwX8pcT2QjL60lU+4uTvIf8V9Y4E1H3a7FiQmlTBdF35YlKkx0YbESTd+AoOpQkP8VpQIWyqS2L/HL7imNWtMqmI3UuDiFfJaPO/z3cpjz1DDydDK4Qt0Y9WnW/VVgHfXlpFY39fGypW2IqglEXLzhVg1zSyQyXTZr7wGz98iQRhzG2/cwCs/mGVUoP+zqcWMatuvd0kgPViraRBlJ6isXhgLGEM3K67OXrF8vv3s0oviO/0p6CEW8z9t0HaV6Y6A9QFa8X/X/8Ur4sSgp7N/ErZEL8Mqmjc4hWxbxcv/04tbLYfd6Fo9eH6Jeu62U86my1PR3oalzNoMMCVckk3mnV8UgpfQGCDVApJ3wray9O/JJH4Wpzba5AV+TJPMnE70LOD4n4aUKZetRNj9XNA68Ys/gvhVjqZ6PAdc1uyan9zfeyXaHWf1IoZ5sy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(31696002)(186003)(38100700002)(6666004)(31686004)(6512007)(26005)(110136005)(36756003)(54906003)(2906002)(66946007)(8936002)(86362001)(316002)(508600001)(6486002)(6506007)(5660300002)(53546011)(66476007)(4326008)(8676002)(66556008)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxWS2IxRjlqMGJYejFaT2o4M3Z1b2xVMnZwRlNIMFlZMHBYUU0wNzZnN2Fv?=
 =?utf-8?B?cjRVYVlMb2VXNkdsdkw0aWYvMU5uQmJ1T0xCMVFJVTJxMXd1V0hhVWtZTExm?=
 =?utf-8?B?TStUN2hzSzA4NENobVpGd1pCNnorYy9CRUFrU1RtYzFNb0ZXMXpCekV0K2Rm?=
 =?utf-8?B?N0ZISkt5dXhOZzlEakNzSmpoalZRYlBDWTdyNWRUdHRBN2MzTUpsd29Dc2pu?=
 =?utf-8?B?MFA4VUFEZjNIb0wxeXpUcnpQeFY3RXZ0UnFQRm96RVFwM1pDRGVRditzSFpZ?=
 =?utf-8?B?SDJHRW1yYWk5U3U2aEVleTZGei9yZ1FRMlY0Z1cvcGRFeDVsVmtDUHo4SUtH?=
 =?utf-8?B?UDlwODA5Y2JuZXdBZS9taFFkelE5S243ZDQvWFBqMThhbXIxSE5NWk1JWFIr?=
 =?utf-8?B?cUEyREZFeXoxZHkxNHR4TnE4K2ZvVHZFTzdiWGh6a2FUUVBBL2tlTEJZVURZ?=
 =?utf-8?B?WjlpTlhVTmFVUXFLOTQ3emZ5VWlqNU5oUmVYV1dtR0NSQU1yVUpsRkZDWkc0?=
 =?utf-8?B?M3BOQ0ZqY3VTdXRFYUJLZW1nMWJnbFNXQnhpQUptcjNRclkrMGZzZGc2U01m?=
 =?utf-8?B?YkljamFpYU5Cd0ZObE03TWgrWXJWSURUNitxVW11YzdrUVVXck95NDNVbFQ3?=
 =?utf-8?B?UXMySEptczlNL3R6VUtjRjNOU0NIOCsvMG4rajJZY2ZSYi9xajlrM1A3Ymk0?=
 =?utf-8?B?d2hjcjQyekFwc1R3TmdzSXdqS1QxOUJZRFFzRW9xTElMbEswc3hNTlZZRWZM?=
 =?utf-8?B?QkprelFkTkxkR2FlMnhDNWxHelR5T3AweXlNdTdKQnd3azhrUlVTdU1jak55?=
 =?utf-8?B?SlBrRzVBS2pqUnF1NnRlMGtjaEtpMUVacnZvT0NCMGNTQ2dvY1MraGdIRUts?=
 =?utf-8?B?b0FnR2NGbWcxdWNSbDU3Y1BUNlhMQ0RWUzhVbmVLRmRzb01qRWlyaFVjdENo?=
 =?utf-8?B?WmpJNHQ3ZVZKRDJzMForSDRJKzh4cFc2akRkYkpqLzd2QmRiLytFSTA4aHlh?=
 =?utf-8?B?UUlUOFlzSGtLQXIvejdzWVF3L28zL3ZHUXZaTTczODlxRTZiYitoQUdxZjJT?=
 =?utf-8?B?NEh5ZFRWKzVqVy8xMEhNbnZFWng1YS9oUGdScmtyYm1JV2E0ZlkwSndvTDVk?=
 =?utf-8?B?RmhCNCs5bzV2ZXV4Y2dia0VyMkhFZzVCU0RpVG1sYjcyQ1FiSXNlSTBhQTcw?=
 =?utf-8?B?SmdqNkRkdmNscFA1eDNMNGx3bUgwVnRsdmY2VlNWZWZlYTd3Q0hmd1hsdU96?=
 =?utf-8?B?ZVhnRS9UcHdiQ1E1V25CcGt5RUI0Q0lhdnc5d005K0daMUhIRmNTdStnV01U?=
 =?utf-8?B?bXpEeFJvc0xZaHNxc2lvWmRTcEdqTUpYYnBmOThFN29LQkRpTDJKZUVJdElI?=
 =?utf-8?B?U3dVeHNDeDhvVlU1ZU55a1A3ZUEyRWQ4T0RyTnlsUmN5NStHWnI2QnlaUW5L?=
 =?utf-8?B?QnhZRFdybXlTOCtVSWxPQUUzaE1DVHlpUk5Yay9yYldtQWNoMnhvWGZSSmxm?=
 =?utf-8?B?S1I5QkN3SEZkSWRCZGc4czFDSDZFT2xRdUUxWFE4OE9PbG9zTlpwL0VpcEli?=
 =?utf-8?B?aGpmYk54OVc5S01BSGQyZjVEN2R1Tjl5WWsxdTFzaDZqN1lXMTVhL2xMK240?=
 =?utf-8?B?enZsK3JZcEp0WktNbktLT2JFdkxwajIxTGlWZk9uWHEzWmNjWHZFeXpucWsz?=
 =?utf-8?B?NVhIYzZXVmlnUkNiREVhWGhtMHpuUldXV3FCNWw1MUcyK3RwVFpaTVFnQ2p3?=
 =?utf-8?B?cjI3cTNMVFg0b1BGaFhRQkVEdnc5djM1Zmt6L1NtT1BLREQyNlJmVDByello?=
 =?utf-8?B?Z0xaeDZvV3JRa0ltNjUzQkJGVDdDdC9kS1JKWEN4cjVSVDBxQnBNOWxwSUo5?=
 =?utf-8?B?VHFQbEg1aGJJYUhPaTBuQnNuQ0ljNDJTdmg3V0VwVnVTN1dlbFU5RmRMa25P?=
 =?utf-8?B?aUFWMW9GRS9MTjhwR0ZFYU8zOWlLOUFJQWZpZkhBdlNUWGRmaElTMzRCNEdw?=
 =?utf-8?B?bWVqVVR4eGg2Z21rem1xMDFXajVyU1hSVEwxZUVORFNhNEcwK0J4SHRJalhS?=
 =?utf-8?B?VEI1bmRSWHlESG5vV0tiTGg5MG4zdTQ3NTMzOFhhZ2RQbVlQRGRjSjhBV28v?=
 =?utf-8?B?MmkzREU2TUIxS1RGOVJSdDNYMm1YUlFKTkhXbVFQRWxVQm9CODhvNTBOUmUx?=
 =?utf-8?B?OE05VFRFS0ZyTGxOamY5K2NqNlp1K0lyNGhDUmllUmxpQTNyVEhZTzhQMDJY?=
 =?utf-8?B?VzU3Q3gvb2FybGtQYXJza0hyUGZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c34e2b-a115-46c8-0399-08d9f312f174
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:14:53.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fofVledch2nh32nLNmHwtvaMMrF+AnRFwcHvHyBmojsDEyaGTb8lsE+sbcWqRNOKwFcyf8jgu7dNZj91NnuFqp7xMLOYEbw1xFADoNhV7hQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4413
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
Cc: Tomasz Mistat <tomasz.mistat@intel.com>, lucas.demarchi@intel.com,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/18/2022 10:47 AM, Ramalingam C wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> First release of GuC for DG2.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> CC: Tomasz Mistat <tomasz.mistat@intel.com>
> CC: Ramalingam C <ramalingam.c@intel.com>
> CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index c88113044494..55512db29183 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -52,6 +52,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> +	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
>   	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
>   	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
>   	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \

