Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6C5F1139
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 19:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9C810E2FF;
	Fri, 30 Sep 2022 17:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1EC10E2FF;
 Fri, 30 Sep 2022 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664560545; x=1696096545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z+T6fORu3aiz0ckJsGlKoHhyGA+puTVIx6FAxOHHRbI=;
 b=BBt7wbOTDUP05K4uAKQJsaAXJXRYJD1fFn/9i0P8AOJihobnNsDguhzT
 +GIOb5vRzzboSJAUvzKbkNdd40cq9uVeiw8gsMQc3cjM7+2eI2hgHtZjK
 nIEE36hPJqGRNRBt7nmKpLv5hgIfPm01F5f/PFf7epzmbVqQVCd+K/NlC
 /0Q91Vju2JLWZ9aaKMjkdKfA0PEq3DRODO7v2WS3vZ9gEx020V6i3HQYK
 en+sPf0WFXq3m8i0zMPaD4v9a4OouyAqgorPQleovuo3JT9qnq1D79S0a
 t8FSKpv0ihJaGGZ7Y5Df9yL7E6yIWNzFrCYuyg+mLYKWwKE0aO8Mp97pa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="299852061"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="299852061"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 10:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="726948414"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="726948414"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2022 10:55:44 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:55:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:55:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 10:55:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 10:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbLdTyUCgRRW+ZOQrsz3ls80iasdM6NVJ30fR7lEptrCJ8NwKecVLjk5+683qE/IgJG3pDo8ajXpVXxdRHl7v1Z9dqn7A3OujP+nOv6r7PTAs3D4k8ZbQWMoT91rqnLI6mtIHkio9oNDTdmG367Xov2vtWbgnnIknDEJlk8eqJqowAIi0WXhDR5ANKCzpEAbYubT+Ec85YMngT3FZynPxbEWScSEe8K6cjtKvhr02GGBaHQIDVManzrOHAL4VUtecUcGd/mfKXsSd8OfkjmTnH3czbZhSpG4AdPlFOt5CF95cDjDA7+9MBMlgxYhCC1tf9tUk5u6Gpw9bwjwnvZAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXTC5h//1v76K8s6AZd+QU9kbDjGuTBGeJoqnIgSqBo=;
 b=FjtQShmPrHZWuqWOFj7DEQLpii5za71JxEsUHzRSXJh3cQMEWB5N5kbHLQ0b6MSKk7smtOPKaspmREv6pnRs4+T1Di6jhOMbHywQxZwX5IkYxeLUJAEPjczIvukBmvOj/9AElR2Oy5d9WiXHW6kmC8AjbWtubSQdsKH+xes3hvKqmNA4C6KJSqmMSMCpGRZ+sbE3i13ElMcgSJ1JLuauIN9s/xBDshjfP8IyvjTW6tg/Xp816NMYqUEyBwVK8AdO2fEun02naegPG9fjcY+OBh1H8pQBaaaIz+TfjWYK2uUS5N0bryRZ4oqZxfjyqKAAL1r0eZ1pcuR1s2YseQoNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 17:55:41 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 17:55:40 +0000
Date: Fri, 30 Sep 2022 10:55:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/gt: Document function to decode register
 state context
Message-ID: <YzctmY5tOw2Con2i@mdroper-desk1.amr.corp.intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
 <20220930050903.3479619-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220930050903.3479619-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec4c0b5-4f11-4e09-36c6-08daa30cfd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9KB/GUbUfDUBPYRFX8W2EI9m6M5FSIN+JWE1tZUHXaDrT2ZAPGucR881fg79zb6rhFcrWBd+Vtu+n4D3uTN3ffXJ7KaAsNQGQ7nGb9eWcSSsvrzEGd2OMTvT/iLokkDmuxezkWLsO7nTI+A4dUpML7kLGuyByxvs50cn115yMJqdQ0NnrZDa/uQ44Qf0ZudWtU5CAt2cfVPKHL7B0lEsJ1Ltj5AF9z0zXSjocJHxKFb4RIUhFmInpm7hYVehLXSQv6pkxRXBE+hGc66B0eydn7DcQjYH72R0aFJnVjgx8ddjWkXu0fSFw/i5ZA+i7aGBw/Ph/XHxHOMlEhHGTvZ270hIvZGqD05sBmCHCYdbz+sZz22+vGcag6+La4KV0FS59n8OJOBIma8FepjTsPdBaAJRYaZBnTOoMIWp1YIjOhCNb8ePeNP/NKHeD5QGQupyVEbBJUHVzYE6mEuqc/C2EZ3jzFSNR3Xxy1HAWabNCb7mG8vRztapJL07cToIVzTQcYCUGzClAvVMO703OWbwFE2BycsKSJFRTegeaz8+RtYuPRnL3mwoT/Cr1R/xIwo+fwwC1E6fUJyKYuHGUNBAolbKRIk/tvboSJ0zO8ULECfUSNm2Y8SCWrqd53KyO4BHJVzo2nu8hAYSe8aUQmUq9A5TKhD5ThHGIdb2/ThSYlrMu1X86oghNH/Iyep3sSPdpRpWVqjXrpM5FBC2U4xXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(6506007)(478600001)(107886003)(6486002)(6666004)(6512007)(5660300002)(26005)(41300700001)(186003)(6636002)(54906003)(2906002)(8676002)(450100002)(66476007)(66556008)(66946007)(316002)(6862004)(8936002)(86362001)(82960400001)(38100700002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mBsgHJqkDgEhqfNp53t/Y5sjGoNsEFGI+d0Xny4ewO40mtvvEKiV6lS/GKO8?=
 =?us-ascii?Q?6kbtwrgrE9PQMNZs8Yh+da9d+vLUkmK6H05TSTIxoyNmzypYOgxi+2aKdFjy?=
 =?us-ascii?Q?MtPjfbWfNl88u3V1T2iM+u+6zn6qGBlMAPLPf+tYKSSjrHaHX02QEU3cZx5K?=
 =?us-ascii?Q?NPz4ebwEiQA/EzkfrQYymxKrnQQboT0PcG/FpuC5TmQexxH6xSEw3J+QUMM/?=
 =?us-ascii?Q?HyKDux41G8FS8XHDrbsX0Wdyve9TzmRCd0UQrSeVs8hfHLyeZfb/hOH/65tc?=
 =?us-ascii?Q?pTRDAhOKOHBdH/adlTmIGveF4lESkWPx9sRT2m0SBPnqvG690GS8RRHDcPfX?=
 =?us-ascii?Q?L8BYaN/d0I6nLjqOvmUbtGFhtlcN3qvy6utbNVwyTJBaBD3M17VScBqG27Ld?=
 =?us-ascii?Q?uH4qBWnOB7nlkAtJgW+SvnN4ac4eUMrqNF6Eb9y2m09ukPSLItzJ9n10TwsT?=
 =?us-ascii?Q?BpF/HuCEM7v0NUPhWyFq7590wlafnUTULTWwD51j5xz4+9tVGCGeiJ01hKU5?=
 =?us-ascii?Q?vw671AnsC6VRGXbs+xlohBtrSTXqsFARnxAAYlKYEYugKYaiLh5s+vybpsnS?=
 =?us-ascii?Q?G4rLS6ynGR1uYFTCpSjtvPsURRoCrEB78l4TjuF3u5a9xaTqmDnjgnwevHPr?=
 =?us-ascii?Q?v8VOU6KFlTczlK+8rL6VgQg3O7FUiIzMDvWubrOf3dhYjQZAzxa6vTv3H/v9?=
 =?us-ascii?Q?MiNmC2KP2cfjc0kkL1Z/c5bnVixDpyBJh13ef5eRM88wI2lkeB4m7kI+ASK/?=
 =?us-ascii?Q?sFAhc9hrvesVC81hSw8an+FrdvisGb+4xBcbrqZermytAighXMozNJz8Du96?=
 =?us-ascii?Q?35h11Bsw2vf+c1sp+hlQR3mNOgESokF1uKvCmfpqxpBjx52BxtIgnj4wzO6h?=
 =?us-ascii?Q?xUpgXDwf+Ui0k+XXBoxQ9hGsYjuiJj+LpUV3xQLpyyezqeoKndpYRjl0HgvQ?=
 =?us-ascii?Q?r+S3RsivWHphHnqijf5ORhmw8lcfdJIQZD97lQv5ijHWGLbXPFWuBI9z2OAS?=
 =?us-ascii?Q?nJMoIbE4ns2lmI3ve/MI3unQtJUAushSOXQecBrFv8kRyMk23TA7LXFhS9aS?=
 =?us-ascii?Q?YfpIEtPNJMSTpQ+t4QaWPhzh9Zu2Hp1Nid3ArLCq0Xsmos0kjo/CU9zC5epR?=
 =?us-ascii?Q?1aV+UayuTnmdG+z7MQVpLh6VzF0sUG5gh2vZNnLOIU1PcQqaIJZd0e8TKeR/?=
 =?us-ascii?Q?5l/fXzHKPukoUGaOmszFeWkTVbgcQP03Oyh2UXXrTpkJginWLBb8QijOJt2h?=
 =?us-ascii?Q?mnvi9BC7ahppAmH/ilVFed9Zw4gkmHWYtX5CJ2UXShVFYJFV1ddbUZWslAL+?=
 =?us-ascii?Q?LsPGPf5QwB0sGoAT2TkC1lnLFSKL66awwB04GUjrsAiMa3+W1MtMIuS4V8NB?=
 =?us-ascii?Q?jqRISu9AYL7wif9q8LYopnh6jHeDQfljnF8M1zLm1Ywd2N7utGfIJJQizhJ7?=
 =?us-ascii?Q?wVwVb1ZHF6chraioH2dGlWth7SEA2mtKUI5WUnA9ZoJ2gnUcXJpW2ZDS2PoF?=
 =?us-ascii?Q?87fCqz1zCQOOyITaxVxuV2W7cwaReJArIP/+Udlk/oJl3MYg19Guh+75WwdA?=
 =?us-ascii?Q?o5WgB9Q9E5cPjrS12WTQyS3zbJHqcWNX+bT240gHj1D2TlU+plxCA0YCcZLa?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec4c0b5-4f11-4e09-36c6-08daa30cfd13
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 17:55:40.8895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9euNu8DTkc/Tv34X72zGpDNAeef0ePrJHjkSA8xTOiEwROcopgyq58diTpQa7qIeuiGq7a1BxK3iMdbSFbl98QhsiS/LYyDtk7S3tJKiFHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 10:09:02PM -0700, Lucas De Marchi wrote:
> It's no obviously clear how the encode/decode of the per platform tables

This should probably say "...not obvious..." or "...not clear..."

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> is done. Document it so while adding tables for new platforms people can
> be confident they right things is being done.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 3515882a91fb..7771a19008c6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -20,6 +20,30 @@
>  #include "intel_ring.h"
>  #include "shmem_utils.h"
>  
> +/*
> + * The per-platform tables are u8-encoded in @data. Decode @data and set the
> + * addresses' offset and commands in @regs. The following encoding is used
> + * for each byte. There are 2 steps: decoding commands and decoding addresses.
> + *
> + * Commands:
> + * [7]: create NOPs - number of NOPs are set in lower bits
> + * [6]: When creating MI_LOAD_REGISTER_IMM command, allow to set
> + *      MI_LRI_FORCE_POSTED
> + * [5:0]: Number of NOPs or registers to set values to in case of
> + *        MI_LOAD_REGISTER_IMM
> + *
> + * Addresses: these are decoded after a MI_LOAD_REGISTER_IMM command by "count"
> + * number of registers. They are set by using the REG/REG16 macros: the former
> + * is used for offsets smaller than 0x200 while the latter is for values bigger
> + * than that. Those macros already set all the bits documented below correctly:
> + *
> + * [7]: When a register offset needs more than 6 bits, use additional bytes, to
> + *      follow, for the lower bits
> + * [6:0]: Register offset, without considering the engine base.
> + *
> + * This function only tweaks the commands and register offsets. Values are not
> + * filled out.
> + */
>  static void set_offsets(u32 *regs,
>  			const u8 *data,
>  			const struct intel_engine_cs *engine,
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
