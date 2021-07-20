Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FE3CF12B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 03:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861836E222;
	Tue, 20 Jul 2021 01:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBCF6E21A;
 Tue, 20 Jul 2021 01:13:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="211216676"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="211216676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 18:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="461803690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 19 Jul 2021 18:13:32 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:13:32 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 18:13:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 19 Jul 2021 18:13:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 18:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxgM0adhwP3/GY8AP0/SngsCTAl6xOdELY/gjyrNfqWH6YZkoXWynvu2jRfC4vgXE6oP+uZ3aBmrx03vs7ETyZ1SGzl26zQS1hP9PaQ/88715NkkhyGzcAsbtShKotdlYwTj1pMEimAaDlFqXRMXqVI5s4XN0+r0nGdQ+10PnZULXDpc0sjXXP6lsZPcZsxk7fSw5DwBtRLAn/9+Hf2TegDUejxbPl8vbIWyJ8tRuMc/9hVvudtXjFmmed6cAG+ztKwsQTXo8GVMy4jcVjDl6JM6oNlNWTLCLG9KJc93VnbUvlgCjSnKNu3WjCgPBBzSNswmpA8X5nrL12yTWpyh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLZbc4cZpZFmpK9H95Xsb9XOVw5YECZW8PxqccmCc04=;
 b=HN9+Z2JubDhUV2fgdbK1RpgUNmzKp3t3StBsnE0hexNo0pHpk9P5/zIHVnz78u47MJcp3m+7p4NPfa/I+qgPtJToeLLmFABtGBCfNvWFi2DzKFdMicoyCqKJwFLImurKqa7UevGm987wNBKJ5hN2nOpxRdT0wsIaxEGELi8KLJO2xmJZVMwpkgkLjUDygcQR0Sdxl4DwzB7z3zo7tVw5QAEvI9A/Om5LezXGBbIoHZmRiGvG6rSjh2TiMT8+YDYYAeHo/wha4Dn1GIXqI4GPxfK3my3Jf2lVQbY5WKQYoNRLrxluxcPf8Scsqjv/9WNgwKqrzfwk5ka2ebMv8YYcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLZbc4cZpZFmpK9H95Xsb9XOVw5YECZW8PxqccmCc04=;
 b=FVuGBf7BQRSqEkxgZkUogMDCKle1UvlwQcQXAWv4PFHTyfajVMnDDbeOM6DP71/+eVbaB9Uy/sVFQlXdqDE69asmVAcjvQL08edtRDSXcIvGWCFa5AnxBmp+vmdl2DkSFR0g+dPuZHUQfGMe2tBNpaX5+4I5LtAaS/MkuaDekf8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 01:13:30 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 01:13:29 +0000
Subject: Re: [PATCH 16/51] drm/i915/guc: Update GuC debugfs to support new GuC
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-17-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <672e4276-d156-053b-a273-798175a98bbd@intel.com>
Date: Mon, 19 Jul 2021 18:13:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0004.namprd14.prod.outlook.com
 (2603:10b6:300:ae::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR14CA0004.namprd14.prod.outlook.com (2603:10b6:300:ae::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:13:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44eb33e9-ac9a-42e4-8296-08d94b1b95b3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5675F41A8859CABAF6705696BDE29@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3f3XlU5+cVjVpQKcA25xEUEK2EGyykf20OBbtNRuZ0QUeOI0SWP9mIHB6xhWRvS85vYl+2Bbq+BlEPgE8VJEvKGIJZONfTmh/I+lkeI1WSJg2yDmsmJ4DK+H0QkSOS2PtEFsZ1PpWtJ77rvH5WMwV7uh7TvucgdKMUyW6elPkHZfJQk9p2Kd/M9Dal/MV23h8VdEboj1ass77HD9e/bBCikW1KV5woZz3Rz8M7HcG2OOHNwcY9qiAfzin0H9ElyPnYyQXuRgrsJSSAjD1y9ssJgH2nVgD8pwCB8gnOHMAF3lmc9Vni/G2jjroM/NGqjRbhfUbo1/T7lMDI9hJS5pgaiXObxTq7o6mgQj77y/oydDJW9aJxkP4+7ll+rgR2TSZtMPTyfhnBw5PI7yAJ9vDyv8Sxjq/+71nynwDW5RJv2LSXAUfu+u7yUTGSQLAzBBbY9l3sCneeSxG4NrTRET/R8TTQkrayX9bnvfM0uKrsdMg/aGALe3+f75N12rKhRiiH4JphFYhIx3IfZqeGS4moKk334HkuORwWJTTY3bvZa1ANNsMe7F9J4sdS9CHekUQfbIuS5LHlOsCpt7YHg5rntYylYyn7bEZQlewmfQ/m74S/SmLpMPQaUzeKYJeiGixxKsqV2iC/ydzwdKJuPt60y0WAof+sj23H1uDyVsk9uuEZicMOjpodFke38YnzsOWujjhpxB/X67mbCTSz/ODgfDEZ5CY0Yf8mfMniiF3Xr+4pNA1D+fxtQN7WgENkg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(4326008)(316002)(26005)(6486002)(5660300002)(83380400001)(6666004)(956004)(8676002)(16576012)(107886003)(186003)(478600001)(2906002)(15650500001)(31696002)(66556008)(53546011)(2616005)(450100002)(66946007)(66476007)(86362001)(38100700002)(8936002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXY2OGJCOGlZZUFaOCs1SGZrbmhnbkJjRE12azZnOS9wTWovMTQrVmQyUHhG?=
 =?utf-8?B?UWVzcDNRMUVEQTFwOCt5YXNZM1I2K0JGOTJ5eVRlVmJ1KzIzTDFycG9GZ29t?=
 =?utf-8?B?MStwaEZmSzdwU3FGbm1yOVhMU3hpMVNrczNVTmJZaVlxeGJVM0F5UlpvT2pO?=
 =?utf-8?B?Rm54QjhHaXB3b0JnUEF2OVRVbHZ0K2dtaTRlT2pjaWs4L2ptY05ndWpRRDg5?=
 =?utf-8?B?ZU43SEExU01MdFFXczh6Qks2eWVTN1dtTzAxMDBzNjc3dnRIM3NPekdaYW5U?=
 =?utf-8?B?Z0gvZjgxa1I4OVk2THJpVUNoQnJHNldiUFRHWEZmRVFZZnFtTG43L3JwMHVs?=
 =?utf-8?B?RnV4TitRTzFhMDl0Y1FsTkNFQ01XM2xXdzRtTU5OQUxoRU5qNFU2eEFnck1l?=
 =?utf-8?B?MG8waGdnSGhwR1lmN2RJbkYycVJUdXphK0F2STluQ20xSmk4b2NuejRoa1Z2?=
 =?utf-8?B?NFFIRGk3SmRUV1FFUjJHZ3cvZW1UUkkycFhreDJNbmJqY1lIVTZlejFjMFYy?=
 =?utf-8?B?enhpai80b29BdDRpRk5UTHdzbEczZmhkcmZrVnhVTlAwbEhRTnkreG1PTkRF?=
 =?utf-8?B?ajZ0a1ZFUzNvV3U0V3ozTEV5c0VFUzd4Q0ttRGh5QlJ6MmYxMm9GVUM1eTlW?=
 =?utf-8?B?dVFDamZoTEhiU0loaEI4V0EycitmNkx0Z0pjZjlsZkxNR1hOMUxXTUdSRmNr?=
 =?utf-8?B?RURSeE9vb1ZVS05xU0hDaHZFVmR0bnowUzlCbGZ5NWt4dzhQV3gvd1BUUmUz?=
 =?utf-8?B?QlZoYnY1OTIraHJ3RGF4bXloNGtWZjFQRlJ6bWZvNURmQjNtMXVqZDdxOVJo?=
 =?utf-8?B?akdmOWNJam1kQ1RqS2ptQnlJWXhsU3AxM3JtY2RpQ3NXS0lsdlZtUjVkR2t4?=
 =?utf-8?B?UEFMdGZSbFFMNUVNeGpWb3ZnSk94c3c3LzdrY0l6YVJVVmtFUkpjNGY5ZCtT?=
 =?utf-8?B?T3kyWXdVYWVyQ1dVOWhCMWNiZS9FV0RIWXkyMG5EUnRhNEoyNXFjYWEwM2tY?=
 =?utf-8?B?ZFI0a2FBWGRNLy9wRFlXcU9rRmpaeXh4dC9ySjRXMXFBdS8ydjFxZzgxQ3Jm?=
 =?utf-8?B?OXh4R1VIM0FLVzB1TzRLM3p6ZmtCWTJtNXF6UnZzYnh3RUd3R2R2Z0ZnMHN4?=
 =?utf-8?B?bEc2Sm8xR2w3SVBya1JEcEkyaVMwSkJ1Qk9CM3RNZGRHYWlLWVZrT0ltVXUw?=
 =?utf-8?B?Qk5qSnR1V0dKZzQwM3pCQW5uQjdGekdnT0lDMllSOEZ2ekcyb2JMOFV0RkZK?=
 =?utf-8?B?bkJNRmRCY2xmSldJNldydmU1ZjJlWFZDZGRlbnR3TmR5OHpqcWdaZEo3QTNM?=
 =?utf-8?B?MzhZVDhaRS9GdzN0RkdRTENjNzkxUDVoZmxodzZDYVlzNHpwSnlCNkdsSTgr?=
 =?utf-8?B?MXY1dWhXTHRkRHNqdk54WEVyYVpvbjUzME1XeFEvd0FLRHp3YnRBcnlLVStn?=
 =?utf-8?B?WWlQbUlxby9lMkovalJVY1p1V3dTcTNaY2xXbENJZyticE11d2psUVAwVksv?=
 =?utf-8?B?blVmQytTSVpKS1IvajN0M2Z2ZXdjT0ZwdkE3RmUrd0ZjUHlpNWJPbnVZN1kx?=
 =?utf-8?B?cW4ybEN4UHFVSXVVRi9hTnNoU0dHTzZyWEJHVjUxMjA0d3Zvcmw1eEY5RC9q?=
 =?utf-8?B?amgwNXh4MXVSY2NUZWYxajg1MlNJV1V2aUI3bHVzM2xJczZyalJCaExZQVFZ?=
 =?utf-8?B?akorcnI1NzJXd3pLYXNEWVNCd3hVNGxFRk1hK01mdjVySTNGYWRucWIyOGhX?=
 =?utf-8?Q?sgkaPIhZBNMxcKLxQPv5ROV2FNz/cYx5HoUvG3P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eb33e9-ac9a-42e4-8296-08d94b1b95b3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:13:29.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJh4ccN9XPJ8Ffhu2BN1jqMPSEnr4B7EuC2K8c1IuKlnE59AX/FbWVIUZfuh8/pn7ve4yBW/BoMpJrUz3B0iFz1vg4j1r2gm+kUh/TsoXuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Update GuC debugfs to support the new GuC structures.
>
> v2:
>   (John Harrison)
>    - Remove intel_lrc_reg.h include from i915_debugfs.c
>   (Michal)
>    - Rename GuC debugfs functions
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 22 ++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  3 +
>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 23 +++++++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 55 +++++++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  5 ++
>   5 files changed, 107 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f1cbed6b9f0a..503a78517610 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1171,3 +1171,25 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
>   
>   	ct_try_receive_message(ct);
>   }
> +
> +void intel_guc_ct_print_info(struct intel_guc_ct *ct,
> +			     struct drm_printer *p)
> +{
> +	drm_printf(p, "CT %s\n", enableddisabled(ct->enabled));
> +
> +	if (!ct->enabled)
> +		return;
> +
> +	drm_printf(p, "H2G Space: %u\n",
> +		   atomic_read(&ct->ctbs.send.space) * 4);
> +	drm_printf(p, "Head: %u\n",
> +		   ct->ctbs.send.desc->head);
> +	drm_printf(p, "Tail: %u\n",
> +		   ct->ctbs.send.desc->tail);
> +	drm_printf(p, "G2H Space: %u\n",
> +		   atomic_read(&ct->ctbs.recv.space) * 4);
> +	drm_printf(p, "Head: %u\n",
> +		   ct->ctbs.recv.desc->head);
> +	drm_printf(p, "Tail: %u\n",
> +		   ct->ctbs.recv.desc->tail);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 4b30a562ae63..7b34026d264a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -16,6 +16,7 @@
>   
>   struct i915_vma;
>   struct intel_guc;
> +struct drm_printer;
>   
>   /**
>    * DOC: Command Transport (CT).
> @@ -112,4 +113,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>   		      u32 *response_buf, u32 response_buf_size, u32 flags);
>   void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
>   
> +void intel_guc_ct_print_info(struct intel_guc_ct *ct, struct drm_printer *p);
> +
>   #endif /* _INTEL_GUC_CT_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> index fe7cb7b29a1e..7a454c91a736 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> @@ -9,6 +9,8 @@
>   #include "intel_guc.h"
>   #include "intel_guc_debugfs.h"
>   #include "intel_guc_log_debugfs.h"
> +#include "gt/uc/intel_guc_ct.h"
> +#include "gt/uc/intel_guc_submission.h"
>   
>   static int guc_info_show(struct seq_file *m, void *data)
>   {
> @@ -22,16 +24,35 @@ static int guc_info_show(struct seq_file *m, void *data)
>   	drm_puts(&p, "\n");
>   	intel_guc_log_info(&guc->log, &p);
>   
> -	/* Add more as required ... */
> +	if (!intel_guc_submission_is_used(guc))
> +		return 0;
> +
> +	intel_guc_ct_print_info(&guc->ct, &p);
> +	intel_guc_submission_print_info(guc, &p);
>   
>   	return 0;
>   }
>   DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_info);
>   
> +static int guc_registered_contexts_show(struct seq_file *m, void *data)
> +{
> +	struct intel_guc *guc = m->private;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!intel_guc_submission_is_used(guc))
> +		return -ENODEV;
> +
> +	intel_guc_submission_print_context_info(guc, &p);
> +
> +	return 0;
> +}
> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
> +
>   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>   {
>   	static const struct debugfs_gt_file files[] = {
>   		{ "guc_info", &guc_info_fops, NULL },
> +		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>   	};
>   
>   	if (!intel_guc_is_supported(guc))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 088d11e2e497..a2af7e17dcc2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1602,3 +1602,58 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   
>   	return 0;
>   }
> +
> +void intel_guc_submission_print_info(struct intel_guc *guc,
> +				     struct drm_printer *p)
> +{
> +	struct i915_sched_engine *sched_engine = guc->sched_engine;
> +	struct rb_node *rb;
> +	unsigned long flags;
> +
> +	if (!sched_engine)
> +		return;
> +
> +	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
> +		   atomic_read(&guc->outstanding_submission_g2h));
> +	drm_printf(p, "GuC tasklet count: %u\n\n",
> +		   atomic_read(&sched_engine->tasklet.count));
> +
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +	drm_printf(p, "Requests in GuC submit tasklet:\n");
> +	for (rb = rb_first_cached(&sched_engine->queue); rb; rb = rb_next(rb)) {
> +		struct i915_priolist *pl = to_priolist(rb);
> +		struct i915_request *rq;
> +
> +		priolist_for_each_request(rq, pl)
> +			drm_printf(p, "guc_id=%u, seqno=%llu\n",
> +				   rq->context->guc_id,
> +				   rq->fence.seqno);
> +	}
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +	drm_printf(p, "\n");
> +}
> +
> +void intel_guc_submission_print_context_info(struct intel_guc *guc,
> +					     struct drm_printer *p)
> +{
> +	struct intel_context *ce;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->context_lookup, index, ce) {
> +		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> +		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> +		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> +			   ce->ring->head,
> +			   ce->lrc_reg_state[CTX_RING_HEAD]);
> +		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> +			   ce->ring->tail,
> +			   ce->lrc_reg_state[CTX_RING_TAIL]);
> +		drm_printf(p, "\t\tContext Pin Count: %u\n",
> +			   atomic_read(&ce->pin_count));
> +		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> +			   atomic_read(&ce->guc_id_ref));
> +		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> +			   ce->guc_state.sched_state,
> +			   atomic_read(&ce->guc_sched_state_no_lock));
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 3f7005018939..2b9470c90558 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -10,6 +10,7 @@
>   
>   #include "intel_guc.h"
>   
> +struct drm_printer;
>   struct intel_engine_cs;
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc);
> @@ -20,6 +21,10 @@ void intel_guc_submission_fini(struct intel_guc *guc);
>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>   void intel_guc_preempt_work_destroy(struct intel_guc *guc);
>   int intel_guc_submission_setup(struct intel_engine_cs *engine);
> +void intel_guc_submission_print_info(struct intel_guc *guc,
> +				     struct drm_printer *p);
> +void intel_guc_submission_print_context_info(struct intel_guc *guc,
> +					     struct drm_printer *p);
>   
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {

