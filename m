Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78445672E5D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7E10E889;
	Thu, 19 Jan 2023 01:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF4410E886;
 Thu, 19 Jan 2023 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674092441; x=1705628441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ChOknD2j0NQgpk/6xigOP/osiBo+7x2+cOPq7OICItw=;
 b=EiG59STEi6xSRXXnxQzGI0qu3Zvjszqsule0TRAgE5W7xSNL70irS+rl
 hNo6cR4BLxpuo1ojUPHQfTSetAD/8nv9IZc2vrpGLk53scpvUBqVyStOK
 U4QKBUBgjl6wMT1ofFeEUlYtWSAVcbkrQqlF8jdeeOFgnb+7DAzaOCS6k
 4uIJkVUh+wV5woEvBIalF01AEU6uvW9MXNwH3daprGK1nGiAtbS217Y0H
 ulsFbaKSGhV8BKi3nFENRRj87zSm5ea6q5UvMoIccYz4b/hTXKaR0kCji
 SOCIsku11FZS4gnpHvhlqpW1vAiIg/EmYEoW2B9bVJeNUCtEAN/Hq3vDx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304844315"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="304844315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 17:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833810750"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833810750"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 17:40:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 17:40:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 17:40:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 17:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvrQuP/unNyUb+aVYXjHQCZZTlbq7614eGZetlU/WKqRWXkY+nu14y5IUG9ySfDUZl4gVpC9ja/86ni1tWSsTGPUl3tX3pbEtuzzn3iLaeF/5g8cbsf+61vzOvUJrOM9JzlqIZjTHkk6cI55q4FRj+egJItyniXcsMFy0BHRGiWZ6X8ggbMzMfJqzUeaYfhqNg7hmR8npSW13vNvYcB+8gCmUcq7pkcamgv+XMC68VquCa8py0VBwuttAkHb2TenDSyA0MSxIdPaaZio/ebZFzZeg3o4Qs1w0VS7a8QCqwCW/bNKNMk3fQphbzZj7z0GHA44HnhSQV809PSzNdueuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shFDX7j0iVv7dbJSrs8mUhhPKbAseIgRgGPQ+azF/rI=;
 b=iv6afzmHwUPAYnth08/sudrgTcGz1AfCn9KqfrdUUUfPP3oZHPp26RGoY0eKd4CNQBvjqjM+uOm/yafpA6MD38wJzWUPEzyPXPIjQB3QzTFuuNE50aSTVFAzlqDm9b/8JLVxMypRMDs4qPpMt35l+BRsn1nlBMZdIIVYMhVj9GxVsJj0fOaGOwMH2Hyb/0Q5SLgYHivx+zGh5HFdR0xBEivkE3fOI2OYKdUQ5dA1S2FXZtMmMYG38ZikIN/Fr0z0Yb19F/MSXIwPD5lKLQ2Ou/g1gIWDXO8rtoMsYDZUXVSpcowQ4/2dqR4HqXnEP1V+GrJoy0a/FbdyMskhFg9Eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 19 Jan 2023 01:40:38 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 01:40:37 +0000
Message-ID: <2516e7ef-1766-6441-46c9-4de2a1306e79@intel.com>
Date: Wed, 18 Jan 2023 17:40:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-6-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: efd8ee45-a689-4a56-c5c9-08daf9be2a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6P6QGHIwu3rG1KwT+MLuqTE/c0DgldwGQXrsoVGT6LE9SQiPMFrhdsSJClCdXiobsb8lcMe1hJv50iWG8GKjN1eFgRiTNtU6BfpdtuAwPntu/j85sOb+NzmIE4S6wg5lvkbQRnoVe5u5DqSMTgCfpvb8lEUbXC3gDFso0/kSjcAr9fscjmJvF2q3JfLggS+hefWii7xCz9lpTPEWe/7a/8xVqI3e6rbLN5JLUIyU6JnzVTVg5pnJQrlgOluhfFeL1DjMqZYVGlZM39r5eL8kxX2tW3nnfl64zXoMt/5UFmsK4g9mUkiXFJDRAD2ebiRQ4ZfKxyyba8nyVNTKDFtsAV1psRzS7htFEScl1kipwWwBqlJSFeqXlte5d5aGmhUyecachQo1GN3bkCBtGTilEAn6hxd/J8yQIX+OvkChDh+2pQBIMhLS37DTmIbDP47tFOvPkpnUk9oGlF/aErPB8pUlnOiodEFwd2A8XuBZhv4F7a0yExtaSE/G3lCO+0yz9Hcd89j4RKIqHdYRcvMXSIHUyKH/MRLHd90rDnfGMak6kyzzRSthDoGkn6B4mEf1rPP3Hs7Mg6mYIwb6ru8ZithYtOJXMfg/a7ZYWe5s5mlTgx0QH1ODZMfHs+qVNTqFzf7uStefgH2JQKBfHQFhCzXjHbsGu4MB4dLjDGQsnSsKr+U0BcRUy0QtCDHpUQbxYgryc7+JTy/JE/KSxKwWPumDV9tfoyxD2jF+jVPo78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(2616005)(6506007)(38100700002)(6486002)(316002)(26005)(186003)(53546011)(478600001)(6512007)(31686004)(66946007)(5660300002)(8936002)(83380400001)(4326008)(8676002)(41300700001)(82960400001)(2906002)(15650500001)(66556008)(66476007)(36756003)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSt3U1RqNVp0RlhKNnprUlZwakJKNEJ4YTh2TXJsNEQwWTVORzE4MzIxOHZD?=
 =?utf-8?B?S1dhSlZYdWdJVkZnVHlmNW9rWjlpNlJKM3luK3FxQXd2R05oUjdOREVjRitG?=
 =?utf-8?B?VjkwUjBDWnowdFlYUVpZZ0U0V2J2Ym84V2lsNkN0Z1cvNGdlRnIwbTRmRHhO?=
 =?utf-8?B?OGRjbExjUW1Za01XVlRlSE80c1B2TUE4NjVzRDFOVjJZMkdOSkRSTGZWTkZS?=
 =?utf-8?B?SXY1QUQ4WWRKRVduNU9OdUI4SFdZWG45anNDZ3R2bll6eVNBelRoMTZUaDBK?=
 =?utf-8?B?OUxNMkYwSlZDY1d1YnJkOXRxSXVJVzQzWk51SzJIdmFZRXdrRndEKzRNWTdl?=
 =?utf-8?B?dnFkMVFxWkQxSWFKQlB4VS81Qml0VmNNS0U3S1U4RlpXTDlXVFlzQjlPbHhx?=
 =?utf-8?B?YXdyQ0IvU2UvcE5kT0o4eVJzUmxvZldVaEwvSW9uZEcyWW1kaFo2SVp1SmVV?=
 =?utf-8?B?ZW9jbHVDZnNmQy8vZndlM0ZhbHEzSGhQY0ZnRk5HNW5ZMmxoQnphYWhvWlE2?=
 =?utf-8?B?dXhiUThLdXc4WjhzWGtFQzkrRnhETngrN1J3K012b2dTand4RnUrc01aVkRR?=
 =?utf-8?B?ejk0MWJEckFOS0JvSnNTMVE0MGNhenhZLzZDbW85WitrMUN5cHd1UisrTGhn?=
 =?utf-8?B?Z1hQZmlRK0hCRC9ycXpDNEQ0OE5CYk9JSUhUcUl2c0taZlQ5VStOam1WYTdY?=
 =?utf-8?B?UnFEa3hLd3ZpQUVLSWsxRjRMVk9VaEhRbGg0bW1HTncxcFFJYUJqd2tJU2dX?=
 =?utf-8?B?Ymppd3kzQ04xN3BQR3lRaUlsc045N1hyS0VaN0R3a0hWRlhFUENNUzR6dFQv?=
 =?utf-8?B?TkpWaERUZmhKbEtQSnV5bXdyVW5ncTFlYUlsY0NRSnpwWk5Rd3c3cVRnTlBv?=
 =?utf-8?B?NjdpalA1RXVQeTBnb3UraS9ZYTBsZFQ1dFNWZzNTYktZMDVrcTFnbXhSbks4?=
 =?utf-8?B?bFliYkp4b1UvdDhGb1lHRlFZbVhHZTlTb3FoUGFQZkJKR0Jzc0FtZVI1WVAx?=
 =?utf-8?B?WEpDY0o0R0NWMWlncHk5bXVtZENlM3ZyeDlFVlhQbTFLK3NRUTJoRXc5VVpT?=
 =?utf-8?B?OTVUYnJ3aGx0ejF5L1drVnYzSmdicm9RcllSeDBZb215dkRmYnJoOEI2TG9a?=
 =?utf-8?B?L3NUSk00Q0Vrc3MxN0ZRRDVURHNYQWhTbzRZMmd5cUlyU2hCWWhNUTdmU0Fx?=
 =?utf-8?B?YVBLeHUxUU1OeEtqOXJVSkkvZ0EvOStlNHEwZGJPYXd2blJQY2V0MWt0K3I2?=
 =?utf-8?B?b1dCMzk3Y2gyMFNRSkpEYXAxL0pHT1dmdXdTb3l0TjFvSkNBVlo0Z25UT0Er?=
 =?utf-8?B?RzF2bCtIditLTWQyZVVzb0kwUVpuT3VZZWlnZjRXd2Q2NU5CU0xtK3daNmFW?=
 =?utf-8?B?Rk9VMnpwMFMybTRDejJnN2FEbVl1OVh5TGUwQ3pvMFhSbVZKR0RzODRFVkEr?=
 =?utf-8?B?cDNETmhNaUg3dnZDVGZXUWk5U3IwS3QybytvWm1pa2hLRUNGQWVjdVZEN1NZ?=
 =?utf-8?B?dzVMdlF3dkVBZ3ZwSUJ1RDA5UmN1M3pnKy9YdW52cnhXdHl4TlIvQW9SOVhm?=
 =?utf-8?B?T3lmODgraFpCY205NE1RUThLOEhpYXF4S1VXcTBCd3EybDFuU0pRaWJyeHJT?=
 =?utf-8?B?R3MwZ05LMW9sd3hRTCsxcjRhRzhxbFk3U09TTjVYM3p6SE5sTTd4M0V5WkdS?=
 =?utf-8?B?Q2U5MDVXUVZwTmpZblNWNVdhTlFZWGgzS3NESTJzNlFWTTRTRUFsTmlkd1ZR?=
 =?utf-8?B?NkFacU9NNmwwU0x3Y2pCVnpFaXhFS1JiUGZlbXRHa0crYjV5S2FHT2F0ZnhR?=
 =?utf-8?B?bnRQUUtnVkg5aitKSjdtR1ROWFdDQlJWR0ZKMUtESEtNUVFJbFUwVFU4NWlH?=
 =?utf-8?B?ZGpUQldiZFdQS3hxM085NllsSXZrV1FJeDlMZ3lIeFNWUXRqZHN1NTM0K2U3?=
 =?utf-8?B?L0dSN1hRZllJMmdtWnRSUXlERXErNkg0bDIvemo0YXZBNGV3Vndmb3JQQ1V6?=
 =?utf-8?B?ZVp0ZEltck9NRXNKN2NzU3VmakpMcm8zZXp6Y1lIZk43bE1mbmRibHdrTUZj?=
 =?utf-8?B?Y0MrbFRwVFpFNFVqVzBob0FxMGozQWxSRXV1cFpKZUtkTWZDcXNPSmYxRVQv?=
 =?utf-8?B?dHRJVTI3WFVyWkxyVHpZdmJER1I0S2E4SitLeS9FWHQwMW1sZGo5UFl1c21X?=
 =?utf-8?Q?bumr1pIkcji9aQsONEXHf9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efd8ee45-a689-4a56-c5c9-08daf9be2a4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 01:40:37.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2fbSjam/4fHqmSHF9QQYLia390DmZgzyttedPZH+DqplyCiITkGyHVSkr+ewhQWZuSIPdOVBv3jW4tg/pTtM5A4ztWAwWOof18qHXFcTgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Add GSC engine based method for sending PXP firmware packets
> to the GSC firmware for MTL (and future) products. Use the newly
> added helpers to populate the GSC-CS memory header and send the
> message packet to the FW by dispatching the GSC_HECI_CMD_PKT
> instruction on the GSC engine.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 93 ++++++++++++++++++++++
>   1 file changed, 93 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 97ca187e6fde..ff235822743e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -6,6 +6,7 @@
>   #include "gem/i915_gem_internal.h"
>   
>   #include "gt/intel_context.h"
> +#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
>   
>   #include "i915_drv.h"
>   #include "intel_pxp_cmd_interface_43.h"
> @@ -39,6 +40,98 @@ static inline struct gsccs_teelink_priv *pxp_to_gsccs_priv(struct intel_pxp *pxp
>   	return (struct gsccs_teelink_priv *)pxp->gsccs_priv;
>   }
>   
> +static int gsccs_send_message(struct intel_pxp *pxp,

This is unused in this patch, so it would cause a compiler warning 
unless you add  the maybe_unused tag (which needs to be removed when the 
function gets used). It might also be worth squashing this patch with 
the next one to not have an unused function as they're both relatively 
small.

> +			      void *msg_in, size_t msg_in_size,
> +			      void *msg_out, size_t msg_out_size_max,
> +			      size_t *msg_out_len)
> +{
> +	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct gsccs_session_resources *exec = &pxp_to_gsccs_priv(pxp)->arb_exec_res;
> +	struct intel_gsc_mtl_header *header = exec->pkt_vaddr;
> +	struct intel_gsc_heci_non_priv_pkt pkt;
> +	size_t max_msg_size;
> +	u32 reply_size;
> +	int ret;
> +
> +	if (!intel_uc_uses_gsc_uc(&gt->uc))
> +		return -ENODEV;

This also needs a check that the GSC FW is loaded (could also be 
performed at a higher level).

> +
> +	if (!exec->ce)
> +		return -ENODEV;
> +
> +	max_msg_size = PXP43_MAX_HECI_IN_SIZE - sizeof(*header);
> +
> +	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
> +		return -ENOSPC;
> +
> +	mutex_lock(&exec->cmd_mutex);

This seems to perform the same role as pxp->tee_mutex, which is unused 
when we're in gsccs mode. I'm wondering if there is a way to have only 
one mutex and use it in both scenarios. Not a blocker.

Daniele

> +
> +	if (!exec->pkt_vma || !exec->bb_vma)
> +		return -ENOENT;
> +
> +	memset(header, 0, sizeof(*header));
> +	intel_gsc_uc_heci_cmd_emit_mtl_header(header, GSC_HECI_MEADDRESS_PXP,
> +					      msg_in_size + sizeof(*header),
> +					      exec->host_session_handle);
> +
> +	memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
> +
> +	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
> +	pkt.size_in = header->message_size;
> +	pkt.addr_out = pkt.addr_in + PXP43_MAX_HECI_IN_SIZE;
> +	pkt.size_out = msg_out_size_max + sizeof(*header);
> +	pkt.heci_pkt_vma = exec->pkt_vma;
> +	pkt.bb_vma = exec->bb_vma;
> +
> +	ret = intel_gsc_uc_heci_cmd_submit_nonpriv(&pxp->ctrl_gt->uc.gsc,
> +						   exec->ce, &pkt, exec->bb_vaddr, 500);
> +	if (ret) {
> +		drm_err(&i915->drm, "failed to send gsc PXP msg (%d)\n", ret);
> +		goto unlock;
> +	}
> +
> +	/* we keep separate location for reply, so get the response header loc first */
> +	header = exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE;
> +
> +	/* Response validity marker, status and busyness */
> +	if (header->validity_marker != GSC_HECI_VALIDITY_MARKER) {
> +		drm_err(&i915->drm, "gsc PXP reply with invalid validity marker\n");
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +	if (header->status != 0) {
> +		drm_dbg(&i915->drm, "gsc PXP reply status has error = 0x%08x\n",
> +			header->status);
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +	if (header->flags & GSC_HECI_FLAG_MSG_PENDING) {
> +		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	reply_size = header->message_size - sizeof(*header);
> +	if (reply_size > msg_out_size_max) {
> +		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
> +			 reply_size, msg_out_size_max);
> +		reply_size = msg_out_size_max;
> +	} else if (reply_size != msg_out_size_max) {
> +		drm_dbg(&i915->drm, "caller unexpected PXP reply size %u (%ld)\n",
> +			reply_size, msg_out_size_max);
> +	}
> +
> +	memcpy(msg_out, exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE + sizeof(*header),
> +	       reply_size);
> +	if (msg_out_len)
> +		*msg_out_len = reply_size;
> +
> +unlock:
> +	mutex_unlock(&exec->cmd_mutex);
> +	return ret;
> +}
> +
>   int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   				   int arb_session_id)
>   {

