Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A708F76416C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01C810E4BF;
	Wed, 26 Jul 2023 21:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731E10E4BF;
 Wed, 26 Jul 2023 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690408252; x=1721944252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ManQVWgRAizJkfEMC3OLmT/N3U++WozPsB+JWwAIMvE=;
 b=drlruXcaQX97ZEucilvTjiDJCu/rK8j6fvBaTUasyNhiQBN04krqHjZF
 4HrFDL8t+rxo3ihiItzQPMORR+sgU/Oz9hqwKdVD6I0n7OtMqYiC5TyhR
 7yq6f9MkWXJwsnZ9pQomicOnJY52bjmNRSe3BnCxKtJ5FyMa/oEIvy39G
 mGepq5ietkrcUER1WfBkZB+5F/BrP8lqXTNtLx3IS+onZ2W+rCC5VnaI4
 Dg5ypEkIKhTBCoK7OE0IkryhOZfGeH7ks6rOI5HBtwU2XarhAdUkZctb3
 2FzsOge8uRcxZX3FxChYplEkzcUHxyxbIbWmmsM+fkBdePavkmnX6cnoU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365600163"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="365600163"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 14:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="720644776"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="720644776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 26 Jul 2023 14:50:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:50:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:50:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:50:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbXfen/lscgrzmGgso7eBfzyW2aX8HnM1qoP+1Pf79HavJH65X1YDgImv1D2x40lQSuJ6JvgsYGsOsgcLiToFdVdc9MBgisHVim8TQDa8AIO4qLIyIwc4n0f/LOmjQlw1OgzdWAQpWQELpCUt2IGsvXzx4/o1xz3t54U/uGZfAT1hHxVWjitBPI/1p7RxZ0CHRmHfK/7a6fl/fsf/CPJbFkE0sYHu7zZ1BqYAk7aJiaXsRzmfaJINm9EalBhgTgu5PG7riqXSnPgSiDNFP8FzQObNRSjH+EdyA5q9WOIY9BaHuOx64go4y4r/+2Iy1dNnUVeme44KbOpxuMeR4PtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMrtKfohGVywCmd3BFKmvPlnAZEj0kmCuZBHYW3A6pY=;
 b=Z891FQSu4/BXl4knaiLwTOB6c5xL5xjOkVU9l3KF4TeEZgUMlLTSRrYOUO5r6uci9FEcfP8iNh5tefCfEX1vDvsKagTUb8BoN9c7WzHG3Zry++tLaiJJCgoUJFKIz60GO7j4ccM4v1Sxl7DU3+ftu9qGvBIlUuD499x/mhf3lKNmXFmcuOvVCg+F5LlsbAU6iALlsP8of+aBedlISGrNY/gGJ5bxDlL2WVh79L7g/gMnaWB43AWWFwcTYHAu26CXLaJuBMbFN1IY0Hwb3poXGd57oKrrALEMH5CSzcIQahKGUgdIZk4pSqjVndogRE4If8jKL4vHwz1X603qp4c73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 21:50:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 21:50:36 +0000
Message-ID: <9c178458-9da9-396d-21ea-9ef4d29ccdc5@intel.com>
Date: Wed, 26 Jul 2023 14:50:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230720230126.375566-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230720230126.375566-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: f26ce68d-b310-4def-4930-08db8e22580c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCRO62LPoF0P2NSGsNSH6KQ6usUH5B9u8HAqUeLHw3zgSKnfHrR9sK0gHDTudoiI6LA2MbYsbm+0PqzHl9h6pUexpk+NTHsdY0QqkB1XmQu1pXfTNJ6Y3h/2PnDYmiHEj3CNR1S1WiE7dOG9B2I8hrO00lY206iW2uj9PpysgxMDhtPNAM2KgBTlkPsKXCiB9Y3jq5gOQQ8B2cVCZoNb2RAndN57EGBhWOAtFsz9v7+HfbCEusmtRA5GcTfYOF5WnhnmlTvoTOwwWLTIS1mfgu4JmzBfC946Fn0OMxRGsjD1EmLLJsZMV2gWLdaF8jBR6aRjypfQOmmLnETMB2NlFsJrfSDF8L4DBLVRZV33704uMBTBOwKeHHmr/ZSTsJJhM9sv9iFNXyEwyoxqfXpZlfhBTFnYZoQxGjN3dT+1WtoMItz7wRlOZBzGWtcd7RTqLlF8Yz+qRsXsY6893rYpTIUzL9OD79Hcbp1bElinXc+yhiAA5LVK5s2LF9QP7inz4gz7JDm5oqyti8wHO1gTu6O5QJVy3+9+52UiF+ZZai8ZwizYvsHVUAPTLOgohSJPNtvhyJsShkj67PAtZxbZt1blTRZVd+/ltFZr/p6gOHhl9NC/53WIt5DR5GgyfW8QFme24kDxzfznIIz0YvOTIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(86362001)(31696002)(36756003)(31686004)(2906002)(54906003)(478600001)(38100700002)(82960400001)(186003)(2616005)(26005)(53546011)(6506007)(107886003)(41300700001)(5660300002)(6512007)(6486002)(8676002)(316002)(450100002)(66946007)(66556008)(83380400001)(4326008)(8936002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWZNellrUU9KWm5ZK2J4U0RLRXJ2N2NyOVMreEszbmQwTnVCRVMweEpQdSt2?=
 =?utf-8?B?aHpxdXZoenVsa2R1ZEllM0VwL0FYdEVlZUd1czZCK1R0aFBhMFd2UnRNeTlS?=
 =?utf-8?B?REJqdFk1UDJQNmIwaVFpTjdKcVFvcktVTHVFa1BmMUUvMzZZclNibWRCSm1x?=
 =?utf-8?B?NEMvVTFTSklPdUVUQUV2dmM0TjJma3J6K05pUFF6bThzbURhOS9xbFZHei9X?=
 =?utf-8?B?aDh3aW1sR0MxTVhsT2RmZUNRSGVBM3hYU0FMR1dveVdpWHA5K1JNNmNGaWpM?=
 =?utf-8?B?bzBmWm5CYWNKZWY0eHNlWXZTRDdIV1c0MHVZbE9VQ0NYeGpVTGtSNjVmUFlU?=
 =?utf-8?B?bkc4MGg3YnhzYWNxSkNFRWZlYVNPcVdXZ3BVOU5GbG9xQW1YNk04UHJ6cU5l?=
 =?utf-8?B?aXozZ3c1N1ZlVUVRSkZ0VC9wdS9Uc3NnUFFnNEhjMlZuM3Z5WmthMGJPdU9W?=
 =?utf-8?B?Mm11d2tHS1Z1cXZ1aUVmU1NobTVIbEcvNzlwMUJ3NGRmR3FJcGZHa2dHRGFF?=
 =?utf-8?B?L2N0QkpUYUMzOGJyOXlJMUZ5QW9ZbHNTOVJuSkN4KysvOGh1ZDdFa3pIaUND?=
 =?utf-8?B?eU1nNy8yR3MwRjBkNnBaTE11am9ObDk5Z1NuZUYwNEd0cUhlUVlOakkyRUxi?=
 =?utf-8?B?QXpzQklqQ0llTCtodTl3NEF3b2QzeEx0bjROMEhDVjdMT1N6cjNaYmtUb285?=
 =?utf-8?B?R3lLN1pNbnpMYWo2WkYrK1VGV2N4TjlFcFlXanY1MjBYblhBandwbXc0NXdr?=
 =?utf-8?B?aGhpUFQ1Qm9OUWtMSjJVOXVuanRySksyMEpRa3ZlL2ZTN1Nqc3Aya2RxQm82?=
 =?utf-8?B?eHRaNWNhN0duRSs2SUw1TC9hOC9KUytCcHEwOWY5WnV2MVpFMWZTNUZDcDVw?=
 =?utf-8?B?U21xKzdiUFpjaE9xM0dXK3RnemxQMXBILzFnd05KZzl6YzF5SUtleGMydzhn?=
 =?utf-8?B?MUFIa2xOaElzRUptNWl1QmhpbXVnU0RrZDJKT084bzRBNkoxSEhpY1FKVytq?=
 =?utf-8?B?eGFRNHV5aFBLNWNmODc2VWFLejZMR3hiTWFaSDRUOEkwSXp4Vi9Yenp3RG9x?=
 =?utf-8?B?ZHJSNHZxU1dPK2RBT3RFc2tPKy83eSt3MW9leW8xM1pzQjJGUFRvY3FNSzVz?=
 =?utf-8?B?UTdnMDNLTTFrZjNzWEc5UFlDN2RPbVdqWGxXdHF2djg4clJWUi8vWmxQOXlv?=
 =?utf-8?B?QWJZS0pFSUdqcEtsWHI0QklzeW1rQnVWY0NvL2p4aVJlUE5CS3pwN1d4ZnJa?=
 =?utf-8?B?R1l5dUp1UnhRckxSMklRVHdyejdCN3JaV1NFdEJnSkNIQ2h3NjdPY1d2THh6?=
 =?utf-8?B?K0s4VEF2bjd6c2dSdnJVN2RqdHM3QVV5dkxVZTFvSHN4OGw1Z0NjbzlYUXpo?=
 =?utf-8?B?M1JxanFWQUZPc3pZQ1REODBCVFJXS3BhbFZrbmUxU1N5UXpoQUJnNzN5SUxX?=
 =?utf-8?B?Z20rYVEvb1RoZzZOd0crZ0FZdVkzYWk0OS90OUUxNUovWHFjY1dwMXQydjNJ?=
 =?utf-8?B?b0tOclduTkJNYmNQOGlORExWaEZ2VFgxbGdIK2tRVDBaQUtLcHRpZHdkV0VB?=
 =?utf-8?B?VnZ1LzZNdmxjNTNuVmd0WkNKQWFuVVAzVnl1Vy9NZXBkWmphZkNBK29pRS9S?=
 =?utf-8?B?RmdVcXZIQ1hSK2p1ckhtWW9XZ0hhM3pSVVRyUHZtTnJ0Z0RTSEZhQmFzK3hl?=
 =?utf-8?B?N2VRL1pvRFJiQ3JLeFVsSUhDcFI2MG1icDlrNVVGYVE5Yk1JWng4SUJWbHI1?=
 =?utf-8?B?UThON1lMekljOEh5VVRWQ0IxYWpIdnZUaVg1L2lhRzJySGsrdHkzVkVtaXR1?=
 =?utf-8?B?ZWpMRFFJZEUxdCtUUlVZUzZ4Lzd4S29tNTI2NU9Cd0hIWXBnYVFnRkxMdjNE?=
 =?utf-8?B?NzFIeE50dURWSW1FQ3ZVN3FJVHlhYlphdUlQV2NCSzdtL1YzMHFia0ZHVUF0?=
 =?utf-8?B?SjZNcEVremlxMXdqZzZsQ1lQWStleEdCYktIaFZlNWg1K0pGYUluZThxK2JQ?=
 =?utf-8?B?eW1aMFNuUkdVQ0kxYlIzU0pCVWl4N0pSRHpFWXF6VHM4WWpaWTlpZEd0cHVn?=
 =?utf-8?B?UEdYSnM3OGxaSUZKbWdCbGNjQzJJQmdMU21yMDZhdUhJNEFnRmFnWWxXT1dK?=
 =?utf-8?B?RE14c3ljaC80Njg1bG9uRXZLT2N3cGRBWkJOMFVCOTloZkkyQUpBeWJXR0Ra?=
 =?utf-8?Q?2bhm2o4jBbdV+NiClPPhGtU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f26ce68d-b310-4def-4930-08db8e22580c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:50:36.1753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQvFQZLLGK3cCE0LDIUDUHuj/UtVWYSLnBlU+Jr4wOJOT0G5SgSREN3VJ0WoBTOQGYjVwPmwJacb0rBUVPnkvDo2rm1OfkqjGVTs/skbyoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/2023 4:01 PM, Alan Previn wrote:
> On MTL, if the GSC Proxy init flows haven't completed, submissions to the
> GSC engine will fail. Those init flows are dependent on the mei's
> gsc_proxy component that is loaded in parallel with i915 and a
> worker that could potentially start after i915 driver init is done.
>
> That said, all subsytems that access the GSC engine today does check
> for such init flow completion before using the GSC engine. However,
> selftests currently don't wait on anything before starting.
>
> To fix this, add a waiter function at the start of __run_selftests
> that waits for gsc-proxy init flows to complete. Selftests shouldn't
> care if the proxy-init failed as that should be flagged elsewhere.
>
> Difference from prior versions:
>     v7: - Change the fw status to INTEL_UC_FIRMWARE_LOAD_FAIL if the
>           proxy-init fails so that intel_gsc_uc_fw_proxy_get_status
>           catches it. (Daniele)
>     v6: - Add a helper that returns something more than a boolean
>           so we selftest can stop waiting if proxy-init hadn't
>           completed but failed (Daniele).
>     v5: - Move the call to __wait_gsc_proxy_completed from common
>           __run_selftests dispatcher to the group-level selftest
>           function (Trvtko).
>         - change the pr_info to pr_warn if we hit the timeout.
>     v4: - Remove generalized waiters function table framework (Tvrtko).
>         - Remove mention of CI-framework-timeout from comments (Tvrtko).
>     v3: - Rebase to latest drm-tip.
>     v2: - Based on internal testing, increase the timeout for gsc-proxy
>           specific case to 8 seconds.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 14 +++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 13 +++++++-
>   .../gpu/drm/i915/selftests/i915_selftest.c    | 31 +++++++++++++++++++
>   4 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index ab1a456f833d..163021705210 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -45,6 +45,20 @@ bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakere
>   	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
>   }
>   
> +int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc)
> +{
> +	if (!(IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)))
> +		return -ENODEV;
> +	if (!intel_uc_fw_is_loadable(&gsc->fw))
> +		return -ENODEV;
> +	if (__intel_uc_fw_status(&gsc->fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return -ENOLINK;
> +	if (!intel_gsc_uc_fw_proxy_init_done(gsc, true))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   {
>   	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore, false) &
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> index ad2167ce9137..bc9dd0de8aaf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -16,5 +16,6 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakeref);
> +int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 034b53a71541..0d3b22a74365 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -62,8 +62,18 @@ static void gsc_work(struct work_struct *work)
>   		}
>   
>   		ret = intel_gsc_proxy_request_handler(gsc);
> -		if (ret)
> +		if (ret) {
> +			if (actions & GSC_ACTION_FW_LOAD) {
> +				/*
> +				 * A proxy failure right after firmware load means the proxy-init
> +				 * step has failed so mark GSC as not usable after this
> +				 */
> +				drm_err(&gt->i915->drm,
> +					"GSC proxy handler failed to init\n");
> +				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
> +			}
>   			goto out_put;
> +		}
>   
>   		/* mark the GSC FW init as done the first time we run this */
>   		if (actions & GSC_ACTION_FW_LOAD) {
> @@ -78,6 +88,7 @@ static void gsc_work(struct work_struct *work)
>   			} else {
>   				drm_err(&gt->i915->drm,
>   					"GSC status reports proxy init not complete\n");
> +				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   			}
>   		}
>   	}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> index 39da0fb0d6d2..ee79e0809a6d 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -24,6 +24,8 @@
>   #include <linux/random.h>
>   
>   #include "gt/intel_gt_pm.h"
> +#include "gt/uc/intel_gsc_fw.h"
> +
>   #include "i915_driver.h"
>   #include "i915_drv.h"
>   #include "i915_selftest.h"
> @@ -127,6 +129,31 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
>   		st[i].enabled = true;
>   }
>   
> +static bool
> +__gsc_proxy_init_progressing(struct intel_gsc_uc *gsc)
> +{
> +	return intel_gsc_uc_fw_proxy_get_status(gsc) == -EAGAIN;
> +}
> +
> +static void
> +__wait_gsc_proxy_completed(struct drm_i915_private *i915)
> +{
> +	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
> +			     i915->media_gt &&
> +			     HAS_ENGINE(i915->media_gt, GSC0) &&
> +			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
> +	/*
> +	 * The gsc proxy component depends on the kernel component driver load ordering
> +	 * and in corner cases (the first time after an IFWI flash), init-completion
> +	 * firmware flows take longer.
> +	 */
> +	unsigned long timeout_ms = 8000;
> +
> +	if (need_to_wait && wait_for(!__gsc_proxy_init_progressing(&i915->media_gt->uc.gsc),
> +				     timeout_ms))
> +		pr_warn(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
> +}
> +
>   static int __run_selftests(const char *name,
>   			   struct selftest *st,
>   			   unsigned int count,
> @@ -206,6 +233,8 @@ int i915_live_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.live)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(live, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.live = err;
> @@ -227,6 +256,8 @@ int i915_perf_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.perf)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(perf, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.perf = err;
>
> base-commit: cc69df372f21eb3073c062132ee9eb3649605931

