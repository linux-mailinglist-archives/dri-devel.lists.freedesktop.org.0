Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C06F2168
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 01:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA1410E0AC;
	Fri, 28 Apr 2023 23:53:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053D410E0AC;
 Fri, 28 Apr 2023 23:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682726015; x=1714262015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4BhIkWoS/aUOH6wsnX7oXakqFVAFKdn7S3p4Hj4vf3A=;
 b=gsxC0eKtTapCYTM3dCJapnvT53w6gk4Wo8ZOmz7V3QT5vG0KNu/12Ujo
 Esz7s1kz+oxo6jne/jIR6TqPiFXGxhPC8wSIsYq/jprQov+frjmVDstik
 w6/M/jgKdynMBbkbPYiFHh1RqY9v/86nkCO0LbYK1BjZe4o+h7841RrG9
 yQe466+kKY/KtH/ojxzViTwsTw25EnZzHHXvfRL9GcthJ3olKCyNHC/ff
 9YJNkHtdzychJ6cwMTMTLw0RA6jJux6mQ6pWTZMAMdDwu7/GwVOKKJro7
 fq9okmI9p7zQm7kflN7cekeC04W601qPlPu/hLthUh36gDf470RWKRSXZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347908883"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="347908883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 16:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725524616"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="725524616"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 16:53:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 16:53:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 16:53:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 16:53:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 16:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSIaeuwem7uvYUg/WlxxqDruuIMPu2hp4BL0+Bzj54ls226GBQDY+0t3FrGhi89uF/GjdN/OvCfm2gzFVzJmqFcyg7tF6NjHhs/QoTxDcWhLDgicR7KlTY8NY9F1m0/2FKzXdiFLP3LF5gU7bXfSpKpOyUKwhCtr2qsT4q7WM/08Ge1SyIWLzxWlYHZ8MsCSd/78r/PvFzT2Psfo8b60LOAORNn9LWE59sZxZYF1O87dAJJvH8GFmsNAUYMDVWcvlaX/8znzNijscMyVTdjhKPbbEvxziL1gh41/HM7InlenL3/GHBjwme6qkvn+RceD1SKaGM9x5+DYppgfkWLr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxjSkq7Tuluvx/udRRtNghwVZ3P4OoHAwaEoPu1yrYM=;
 b=IxosHHZ++mUdqxs1P229IhverWe1mopOl2RSPoG8mJw3VQDcaNq0TU3k+nQawY2nTqHQSq4U63w7fKpSd+2RvuoljXQS/quFUQVqwgDynSLxuG46TZw7X6cfLnvKX6olbm63rNp1HHJB8CnztseNeMyDeyg3xWEyxDZMWAMULe7eYZX+UVL/4xyAVzgIoX2JXoS0zi45DB+FpdObt+bd0ebrlyB1+17sz1kUr3ryn2/JBvkkqkvE7EwiMs11NZIJSJKQCBMv9+0NYz+V73dKJm+6mP5mXikF7+IAT2buiPb80+vDYWXblx0T+xHzoJQkElO21tKJcnrh5MrMOe6Qqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22; Fri, 28 Apr 2023 23:53:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 23:53:31 +0000
Message-ID: <02ee29c3-65f4-60ae-95c7-79f01f3dbf38@intel.com>
Date: Fri, 28 Apr 2023 16:53:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] drm/i915/uc: Track patch level versions on reduced
 version firmware files
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230421011525.3282664-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae2a146-7e3d-4717-6124-08db4843c4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /wgJrjFq76DX8/U5iHhjPayUbRBvo4C308i8HFw6r0Uk6QnS/W7cle2vAhMofFkJFuWgNggWNNk+qj6HssH4ETsEHy456pvXXhMpmsvFuhW3Q3ZmCa1rFv8MU/WWOvJn01Eam3ZgOur+6ZtpoGF43gB9OpPOX8de7BQcv5p01RKVWNnUIi0eKEa6dR8DCPKxMKn5AEIYwSKQPH1QpXzqR/mmOOD82+8jhJcGlhnH+iPUHklzOgR+UH8Oh/20kYWDKSO30cU8FUAEqtrM+fA3DNfR0vCy2Py0BxqhW3O8tcrJ3zXd5Ediy/lxRHUbpJ/waLm7ORj/UfWNftJi9o7r1Nc/R8HUaa82BYZ/eDKrOvjODRI1xSqELl1j2bPzDDyVBgzUgInjuogUGKOZnLRgtKY60H3uZuHo4+B9NHYpzob46ntysKFcE4vEYCy4LIOH2hO2KK5CAYGKZoLg6/15YupkUhtza21d3/m2LWolT0h3Ql7rym1EtcuvQj8INe4nUwYKVMLI8w8SwzheF2Ocd9o8oSEiw+kMBL9zvVSJ/TXPtNoqTsdMTRGDQxyrZNHBjLjm1jZ61VdM76Wdi3rzCdOmm9H3X/nWUCBWPJQzmeBhqjAdVTftjmVdTWHV8KIXmszy3e6k2ZkBvTtCc5mLLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(4326008)(66476007)(66946007)(478600001)(66556008)(450100002)(8676002)(8936002)(316002)(5660300002)(38100700002)(41300700001)(82960400001)(186003)(53546011)(26005)(83380400001)(2616005)(6486002)(6506007)(6512007)(6666004)(86362001)(31696002)(36756003)(2906002)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlRWYmVUSGV3Z2ZQUzMwNGF3NnR4cmsyT29JMmlvWDNyM0VScEp1K2swbFNH?=
 =?utf-8?B?QnZ6V0tWVjFPeVg1Z29DcXVLQ0lBcVYyTGV5WGkxUEYyMzltT3JrOWdQZ2Jp?=
 =?utf-8?B?U1BFQi8rYXlueExCY1I3VmhYSXpRMzA0a3dvaHVTTnBXM0NIcGJHR0ZiME00?=
 =?utf-8?B?QVp3U2s0N0JRY1owMk9VZkVOVnVOUkNzV0lhVHdQZnpzOERDQ0I0emdFMWxa?=
 =?utf-8?B?NmxiSVpNbHhHSzBSQmcwZG5JM2dLN0E3QVdkQkhSQW93WGo0blB5RGxhQkVB?=
 =?utf-8?B?L2oxM1ZJQWFsek5lTzIwdXlnT1FvQVRVN0xzMzNpb0p1L3pNT0Jtc21UQWZO?=
 =?utf-8?B?eHk1bkpnajJMZ1FxYTB2dmpwVUZIei9hZ2hlWUJBQkF0MjVQampmQ3Y1RXhN?=
 =?utf-8?B?UVFlL2J2aFI0akdGM0RnNVEvcFVDY1FuQ3l2bVNJY0lhNkVpOGovTmptbFl1?=
 =?utf-8?B?S21kUUZteE1MRThPa3M2OWVHd3FXSGNhbzNmdWpiMXVCakg3em5qL2U3QVlU?=
 =?utf-8?B?aTZOQUxHQ25kZjVZNXVsWmhKeGw3Ry9WRkMxWjEyUENyM3VPSmNPd2ZFMTB4?=
 =?utf-8?B?TlRtRnlvSDdMak02bnYyTEV3eGF3aWRWcm1aMW40R21jWVVUc0NOWkhjamMx?=
 =?utf-8?B?V1QxbmJ5YnM3L1hrUzlFQ1FkVjlMb21TZDEzTXliSllldWEvZTRiVzZOaEc5?=
 =?utf-8?B?Ykl2Wi8vVlYvOWxVN0tHLzNBSUszN3ZCZkRsdTFsQkJQcUhlOWZydnFIUGhi?=
 =?utf-8?B?eTB5TDZER2tRWDlSVEczbmlmQXM5U0xEMTZkcGhKajh6a0UrK0kxbVdFWWFq?=
 =?utf-8?B?QmFidjFjRnRuUENXTWZlcHBnZGJxR2lwbE0rbDVHWmZ0NUJLV09aNUFHcEl2?=
 =?utf-8?B?bTRGQlU2RUlaRGZCcU91eGR6Mi9XaDZPbzV4c3RobCtmVklwZmFWeXpQaStJ?=
 =?utf-8?B?Z0VDeURmOFFEK243L09kN2VzMkVvT1FOSjhhZW9keERVV216WUVnN1JqMXlQ?=
 =?utf-8?B?bVdPNm9tL0lDZUJIRVl4WHlXN2ZCU2FwZUQvWGdWd1p6U2ZYL0o2V01tTVU4?=
 =?utf-8?B?K0o2SmEreTNrU1JpNkNPd1lYeVdzVndRaG4xaWVzMysxVmZKOExPbERaTGgy?=
 =?utf-8?B?RUgwcm1SNzFuSWFtR2c0UUl1OWF4OFBUUXIwNmswcW5ZQ0ZVR1Bzd0NTbzQ2?=
 =?utf-8?B?OEJDVWhsS2VTVWVPQzhCclV3SlZkQU5DQjlmb1lEeXY1SEZYekU4djd1dTNX?=
 =?utf-8?B?NVAya1Y4Vm1ucHo1d2lpWncrMFo4aHR4TG5TS3dzeFp0YVcrRklaeXhoVStn?=
 =?utf-8?B?NlpNTm5PSGlvRERZcUxGQlBMRTVlWmRjTWp1Vk05a3I5MXJYaFU2NzBua0Rl?=
 =?utf-8?B?WUlRMER5SmhxS2c1ZGxKSGEwKy9SbzFlNGFIaVc0eEhoYUI5Z0owemNodHU4?=
 =?utf-8?B?WEFBWk9GaThVNTJLaXlsRW9PWlBTVDNBMnpISy9NWFI2bWpHbmJ4TEpHNE1a?=
 =?utf-8?B?bWtMV253ZHdoR0RwU3ZOZm5GYWJURkJQd3RRT2tOWERYRjRUejlVR3JJUnY3?=
 =?utf-8?B?M1hoamdaaVFSeTRXbGthSXFmdjd6Z1R1TnNjVGdYRTFIZFEvNzd4QlVRSkh2?=
 =?utf-8?B?WXNKS2ViMXJ4TEdFVjZMVUd0ZE9hV3JkQlRxeEhONTRFbURmMzdHUkJQRXU5?=
 =?utf-8?B?ZzJ6ZzBQMjYxK25PbCtGazZOSWtKSUNXMG04T2xEOXFqSjZLZnZ1MFVob01v?=
 =?utf-8?B?b3RzRGFra1Ezd2o4aytDUDgxNXZ3dTZyT0hDVDl3M3hqNldJTTlRQjJrYmFv?=
 =?utf-8?B?VnJ3V1IzUXVDLzArRE95cVFwSkwwTW9WVjlOTmdrQXUwOVU2UnBPa00xR09x?=
 =?utf-8?B?QXBFcUhiRFJQQ2NGOHFRaW1sekN0REpYdWxNRlpYcTVIdE85dXVJc1NjNWEy?=
 =?utf-8?B?dzlib2lLUkttaUt6aW5zRlJmN1h5TGdzTnlGZnhLWWVYUWZPd1QwQWNxREVO?=
 =?utf-8?B?M0dhK1Z3dnVud2RNYU10UkFJMXhWQ1o3dEZGMVZyWHYrYkx4OFN6TzVpVFMy?=
 =?utf-8?B?WkhmT3Z0V1FmNDBkUUkvcTVuMk5WWXBGM2xTZ1JxZlJRZkpVWDZyTkV2eUFy?=
 =?utf-8?B?SWs5SDBOaWFLK1BlTHQwM3A2UHpDMHYvd0gyUEcwMnlGeTFUem1DdVFEc09i?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae2a146-7e3d-4717-6124-08db4843c4e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 23:53:30.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU+l2hX7XGxzIn/N6lwPqDEzbtpgrkjrMeSB7B8I7oXOj2lr/dag1nalDcXXqEhcv9assY7mV4Kn1jqfbHODvz6MxLXSubIVUdQIXueUwO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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



On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When reduced version firmware files were added (matching major
> component being the only strict requirement), the minor version was
> still tracked and a notification reported if it was older. However,
> the patch version should really be tracked as well for the same
> reasons. The KMD can work without the change but if the effort has
> been taken to release a new firmware with the change then there must
> be a valid reason for doing so - important bug fix, security fix, etc.
> And in that case it would be good to alert the user if they are
> missing out on that new fix.
>
> v2: Use correct patch version number and drop redunant debug print
> (review by Daniele / CI results).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 30 +++++++++++++++---------
>   1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index a82a53dbbc86d..c9cd9bb47577f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -80,14 +80,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>   	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
> -	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
> -	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
> +	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
> +	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> -	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
> +	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
> +	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 1)) \
>   	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
> @@ -141,7 +141,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	__stringify(patch_) ".bin"
>   
>   /* Minor for internal driver use, not part of file name */
> -#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_) \
>   	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>   
>   #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> @@ -197,9 +197,9 @@ struct __packed uc_fw_blob {
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>   	  .legacy = true }
>   
> -#define GUC_FW_BLOB(prefix_, major_, minor_) \
> -	UC_FW_BLOB_NEW(major_, minor_, 0, false, \
> -		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
> +#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
> +	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
> +		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))
>   
>   #define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>   	UC_FW_BLOB_OLD(major_, minor_, patch_, \
> @@ -296,6 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.ver.major = blob->major;
>   		uc_fw->file_wanted.ver.minor = blob->minor;
> +		uc_fw->file_wanted.ver.patch = blob->patch;
>   		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>   		found = true;
>   		break;
> @@ -790,6 +791,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   		} else {
>   			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
>   				old_ver = true;
> +			else if ((uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
> +				 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
> +				old_ver = true;
>   		}
>   	}
>   
> @@ -797,12 +801,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   		/* Preserve the version that was really wanted */
>   		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
>   
> -		gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
> +		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
>   			  intel_uc_fw_type_repr(uc_fw->type),
>   			  uc_fw->file_wanted.path,
> -			  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
> +			  uc_fw->file_wanted.ver.major,
> +			  uc_fw->file_wanted.ver.minor,
> +			  uc_fw->file_wanted.ver.patch,
>   			  uc_fw->file_selected.path,
> -			  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
> +			  uc_fw->file_selected.ver.major,
> +			  uc_fw->file_selected.ver.minor,
> +			  uc_fw->file_selected.ver.patch);
>   		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			INTEL_UC_FIRMWARE_URL);
>   	}

