Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A25845D6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 20:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23B10E926;
	Thu, 28 Jul 2022 18:33:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94F10E926;
 Thu, 28 Jul 2022 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659033205; x=1690569205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fhJuu3LHlaL5qkVjouhsEn2M/l9HaCXEK/Spy1O8a0s=;
 b=kZhZ+PYTRHQ5E6PWzcv4d8ERROz+FSRk4POlzaZp5OfC36HBmkKeifkG
 9NEKAkNU1aT5hrkO4PG5RzZGZIOuLxCiT7CqOZNWw9ldTdnMJjohTZQrq
 19iPyund+Zf9imB2mcjp8CZaN4nh4L9it4vDfuTdhlb2nlbkwLlbuFPNZ
 J+/HVytfd/9cjqt/Si5AO5dkDQDttv/yKDXi33PceBF0YoZG0IFcT2qaS
 3MiRueEF6gl6qoXXsw59PqLKQw5NtKAv8Fg+hGswSiutMMSqzf0xpwDbM
 TJVfUkQAUvTJAAz9Ti6libMRPrwGxkArctGRloHGYz9m1pz6z7Y/+/0+U A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="286137146"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="286137146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 11:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="727461790"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 28 Jul 2022 11:33:24 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 11:33:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 11:33:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 11:33:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 11:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhITkPcRaJ4yMspGUTpjuW74m8eILAVy+ay6d/sBOiivmjOo5wEi0iIlvMNf9TPV8VR1QMoPMcgUv0M7OpUchVPTvw1BBv/JB+5QemEeyocLGO5IkvJ9AWBfXw5T5wHqmgq69Y1Zm4Aa7c1I5IIyNaJ/rTMG/9PZ/Tryu/30LcBwi6nz2LSEw2tg+F++2rhWUMe78lFaYj6uLYDDk8N9C2NSS+jvkE5y96ViwuDKhxsBeN+cQ6ElYeG8VNM6cMomX/34rNUCLiD4TPOFWv1ruOQ/z41qw0eZQVPgujt3l8E3K7n0ZGMd/r/pwO0cmcYTBjT501c6fRkI7cdeoEr7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM7uyECrGvVI6B5Nm3bDq0hMbTqx2h+5KiUZj0tOBuQ=;
 b=MkI2HQT3rw7uiDFupnexkp67SeRYYOB3JupeCEq7qL92rgMYe2bQ5dc7kucn6n6P8Mhx9gBMLxaUQtj1hiKfec3jb+78F1BRJqVorKeZD9fgtPXtKWfJnEj/k1f7IebR16APxr7UDa17mjER5lN41KUcVCIPBvBEd/eOfU6Ik6BNflsIjjyxsNXIkzp2hcoCoN2c0eRGn9F0fEQTXIlXhT0UENjf80tdAcpdCnfI3qIJqwIDSRibBDCDtAddEkd23VDMN5q21X51crajDURdbBycOLANe/V++fQcNgknpTvNVvARg0U9vUJRYMq7+f5fSNriHIfdphUCWaa0Wxxfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR11MB0060.namprd11.prod.outlook.com (2603:10b6:4:63::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:33:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 18:33:18 +0000
Message-ID: <33d9e24a-7680-3d1b-19cd-508cd18fef24@intel.com>
Date: Thu, 28 Jul 2022 11:33:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] drm/i915/guc: Add selftest for a hung GuC
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <00c5f73d-271e-5413-21fc-3e28afba3178@intel.com>
 <20220728182616.2417491-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220728182616.2417491-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::41) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91141b18-f38c-4497-9cba-08da70c7a484
X-MS-TrafficTypeDiagnostic: DM5PR11MB0060:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gV75Gct8zYmU3C7vsU8YGhYIen0ukhE4v/tvTBk97zHIdAqFTowh09DrJ5ugJZsTH8iYE2hqpzOdOMc0HHWSZfSGfwaD9stNKzsnlFNyIOZst+QHPAAtNBl/Iuc/IQoavBKc9xX0yvgstVMrC1f1uWiP9tnBTBqtr+Ozjn9Ouai7rKRCk9H69v3DIGvfmsNKiJOe37OzhqVmas9DkhsoW2gIKAjw36fE4iF9xGPrgumjr0/hkADbyBajDieIivfoECSaAda5xhbz72DFXxye5GPgPjQbMquGPX3sjhE+IVwBLbzMJIFn/UjjfAiILBkvAl6jfI+kXB9quOAqSLg7l+Vc6zHQpopbljnk22IJWRGOEmGloFBb/JU3PWMwZts3JS8MhGguxZRlV3QnPNL5KBqWJwqmFGm5krYO+8drmZxpDZA/h5k8ZLiis+7XCdHc0lV/pHfvlVxlHqtcci189lFpXYUwwX1yPqMAP4S7brmkIiN8/CQhO+YGNtNkU1Kzj09sICgwyMVOIUc0OPWK3RRBpQX+2x9rN29Hm7qOZ+IOZeLR39EArAPqSzKacyb5SyahuFRdf/nOKuU0oDs6sFsO4NS5orygExr/i6tQ83ZnFAfLDFLtg27mBOU1KT/BYdnJ+tqnPiYSDxxk1YTsgdI25jY9Vc9C+lxT/t/kDDXZOGyUrsj/zQv+G46KmgKDjg+dRSAj6KR8nYXlHiwCYnzxyv2tPZEL6FU5E9cl9E3ajC9p44jLztZunZ23S1QVYrcTBK9NJQwi313Vm9ej/w6v95tEXEo8rced4Vo5eqm9CQbdBxn3pkIdUH5cU4LEktvHX13PKhKpOsJR9OGhlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(39860400002)(136003)(396003)(5660300002)(8936002)(66556008)(450100002)(4326008)(66946007)(8676002)(66476007)(2906002)(83380400001)(86362001)(31696002)(36756003)(82960400001)(6486002)(478600001)(38100700002)(316002)(107886003)(6512007)(26005)(6916009)(186003)(6506007)(41300700001)(2616005)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEtpSzBTeE1GRVR1NmJDRzdsbzR2QnU3MjI2V1ZlU2EvMkZxSTVjYmtJMWNy?=
 =?utf-8?B?NmxVN1lhTmluaDFSTWtKZmZUVHVaUitEbm1ZV2pXQktBM0phTEpXTHVNeGNE?=
 =?utf-8?B?eHFNa1FocmVQZCtNQ1lXOG5aU3pMUDhZNVpUU2pYN0FrWjFuWDhoSGhsSjdr?=
 =?utf-8?B?bWVuUkY4eXlZTzZkZkVSNjllTlBFdFR4Wjc0dnY2YVltSVlETGVvYXBEVmtW?=
 =?utf-8?B?RXg3eXQ2VjZ5NTZxMXhrWWhOQi9Da0JLeEMza08xWEZoWDRCV0RRMGZ0c0hU?=
 =?utf-8?B?Skp2SnE5MXRjSUpjTEV3V3NuMFVLMjh0TWJ1ZjRYM3JSS3FLdVZvU05wTmRz?=
 =?utf-8?B?ZEczWHdWRHJVdW4wNDQvVlhuV2hhSWUwbnhwblc4cDlOT0t5TytQcGNETExZ?=
 =?utf-8?B?U2dGZlhTZkxwUXd4ejdOaEpYRHJEeHhPaFREQWRBQlZBdDNBOE1jYjN3bzF4?=
 =?utf-8?B?bVlxdThtL2JWd0FkeXA1bDl5ZWNTaVBBNDRiTmtVTjF4TmpsYVJKVENxUVkv?=
 =?utf-8?B?RG0xKytSdkgwWXZvcXJEOUhXS1dDK0VLYndDSVJubGlXeDJUbkZMOURZYUJo?=
 =?utf-8?B?NHpnamtyVExtNExSdDFaMVpZOUErUWZXUE5DTVZ1NytPVWtpNWEzR3BFaFBz?=
 =?utf-8?B?ZTkzV0dQWGlmaWNYRm15dnhGQXlnZVAwY3hhOWh1eEVVdjBpTCtXTDZPZWYz?=
 =?utf-8?B?NUx5QzRocDRsS1lpYTVIU1NlZk5aaS9CSVpBZGZSWE5OWERHWGJRcDJYMWsx?=
 =?utf-8?B?ZitUcHNaQlVRR3FEeDZmTXJnYWRFRmhka2pQS3FsOThVbGRQeXltdHZPbU9o?=
 =?utf-8?B?M2dOUVlZZTRoSFhuaHM1eVM0YnphOUVlSXBsWWxBK3BSWXFydklxa0w1MW1D?=
 =?utf-8?B?dGpmZjNFRUd4Z3ZwbW1XMzgrUnp5Y0xIU0ppTm9nQ3h1RlZoL0ZXV0d3d3hB?=
 =?utf-8?B?VjFzSmZzN3ZjYlpFMzVMZjZYK2ZlaFFwMGo5T1N6ZXJDdUdQdkVFQlp1R3Vv?=
 =?utf-8?B?VGp4ZTAxV2R5dUlGODhOVnJPaVNjYzBYbDdwOEtFelVnMTJUVkV4UXk5RzVm?=
 =?utf-8?B?eVo1MWdYcXZwekhPeFhuYjRYUzJGYm01b2Fjc3JpOGlMVkpIaXBvUDFhdTdy?=
 =?utf-8?B?cklibHR0UjFTR0hROUJ6b0EwV2RkdHVCeU5YQTk0T3JVUDJFc0tXdGlDc0Ur?=
 =?utf-8?B?WmNNZXhNMC9OUGgzSHh1Um1FQzh3ay9pZ2pxN1IwRGF5aVIzVTN2RDd6amhJ?=
 =?utf-8?B?V29uY2crbGZXM1JDeFgwK2hJNmNFdkZIdDhaeUF4YWV5VVJROExjQzE2UVNz?=
 =?utf-8?B?QS95UGpCN3hPcGJoeitCWXZpU25kcmdWMlhqYzYzVGFwQXA2Y0JNaHpIenYv?=
 =?utf-8?B?NXlpd295ZUFmNE91cU9YODc1aDJMT0xNSFFOeDN5b1Y0WVRocGtuMW9DRVFm?=
 =?utf-8?B?TmxlaTZBY3dWV1Bqc3FpQUFEWVJuelpBWHlxcFJaQ2I1KzZEUTR5V2c4TmpD?=
 =?utf-8?B?Q3NjVzU0aDRQamhIM01wbWZNcllUNEdpbUFmZlB3eVltQVhIRW91U0M2VXd0?=
 =?utf-8?B?c0JLaHhOSkF0UmkwdWd1RlFlTFhhT1JtRFFUQTh0R1RtQXBEdm1YNzF3bCtB?=
 =?utf-8?B?T2lQVGROUTVQTGZmc2gyZjlHQkRvWWVoc2o5NGVmSUV4UWRnc0p2cnBHWXV2?=
 =?utf-8?B?bUMvN2p4dXZjd21hK3laUWZqUWZWMk9yc090VGE3T2d6NmZ4cjNaelpOaHZK?=
 =?utf-8?B?OFltcnNMbnk2emt2djA4YTVWNmUvMFlQRzdqWUV2cndkdXRIT3hNYnppMnVY?=
 =?utf-8?B?QnRCbFdGSjdpNHhSWTJ6WFN3MFdGSjMzWDJlYitPTlpuejRYVHpzV29tM2hu?=
 =?utf-8?B?dFp4Zll0ZnpyTHN1S0s0elNPS1FLVFJWeVhqV3h2c2Y2d2NXemQrTzNlZTVI?=
 =?utf-8?B?aFlmdnFvZUY1alJQS0d1WUtqQ0RQQithQjNXWEtqTmNlV2VuL29MZFc0NS8y?=
 =?utf-8?B?eG9tTzFURFZkbzFUY1U1WlhjQnd6Y3dVQkJuMWR2MWFhRzhiN2wzVTRyM2FE?=
 =?utf-8?B?YnFOSERGeUVURThZb2ZmaWthSHNNSTA0VXNUbHkweWxoeENvY1V4R0svU3U3?=
 =?utf-8?B?QXVObmpPVHU1ODN4REhVM0pCNGlZK3lzYjQ2M3JteGxmUk9CbldRWWpXYmda?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91141b18-f38c-4497-9cba-08da70c7a484
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:33:18.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwDnz69Dn+QrWhXScguoSexUnj19aigmkhhWJ3cPucMJhK/BaDwnrIC+rnRBghbMayLbhzSv/+CwU4tWje3sV5hxTg/bARTDbYaqXi4yOjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0060
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
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/2022 11:26, John.C.Harrison@Intel.com wrote:
> From: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
>
> Add a test to check that the hangcheck will recover from a submission
> hang in the GuC.
>
> Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   1 +
>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 159 ++++++++++++++++++
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>   3 files changed, 161 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0b8c6450fa344..ff205c4125857 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5177,4 +5177,5 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_guc.c"
>   #include "selftest_guc_multi_lrc.c"
> +#include "selftest_guc_hangcheck.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> new file mode 100644
> index 0000000000000..01f8cd3c31340
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "selftests/igt_spinner.h"
> +#include "selftests/igt_reset.h"
> +#include "selftests/intel_scheduler_helpers.h"
> +#include "gt/intel_engine_heartbeat.h"
> +#include "gem/selftests/mock_context.h"
> +
> +#define BEAT_INTERVAL	100
> +
> +static struct i915_request *nop_request(struct intel_engine_cs *engine)
> +{
> +	struct i915_request *rq;
> +
> +	rq = intel_engine_create_kernel_request(engine);
> +	if (IS_ERR(rq))
> +		return rq;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +
> +	return rq;
> +}
> +
> +static int intel_hang_guc(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	int ret = 0;
> +	struct i915_gem_context *ctx;
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq;
> +	intel_wakeref_t wakeref;
> +	struct i915_gpu_error *global = &gt->i915->gpu_error;
> +	struct intel_engine_cs *engine;
> +	unsigned int reset_count;
> +	u32 guc_status;
> +	u32 old_beat;
> +
> +	ctx = kernel_context(gt->i915, NULL);
> +	if (IS_ERR(ctx)) {
> +		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
> +		return PTR_ERR(ctx);
> +	}
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +
> +	ce = intel_context_create(gt->engine[BCS0]);
> +	if (IS_ERR(ce)) {
> +		ret = PTR_ERR(ce);
> +		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
> +		goto err;
> +	}
> +
> +	engine = ce->engine;
> +	reset_count = i915_reset_count(global);
> +
> +	old_beat = engine->props.heartbeat_interval_ms;
> +	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
> +	if (ret) {
> +		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
> +		goto err;
> +	}
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	intel_context_put(ce);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	ret = request_add_spin(rq, &spin);
> +	if (ret) {
> +		i915_request_put(rq);
> +		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	ret = intel_reset_guc(gt);
> +	if (ret) {
> +		i915_request_put(rq);
> +		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
> +	if (!(guc_status & GS_MIA_IN_RESET)) {
> +		i915_request_put(rq);
> +		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
> +		ret = -EIO;
> +		goto err_spin;
> +	}
> +
> +	/* Wait for the heartbeat to cause a reset */
> +	ret = intel_selftest_wait_for_rq(rq);
> +	i915_request_put(rq);
> +	if (ret) {
> +		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	if (i915_reset_count(global) == reset_count) {
> +		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
> +		ret = -EINVAL;
> +		goto err_spin;
> +	}
> +
> +err_spin:
> +	igt_spinner_end(&spin);
> +	igt_spinner_fini(&spin);
> +	intel_engine_set_heartbeat(engine, old_beat);
> +
> +	if (ret == 0) {
> +		rq = nop_request(engine);
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			goto err;
> +		}
> +
> +		ret = intel_selftest_wait_for_rq(rq);
> +		i915_request_put(rq);
> +		if (ret) {
> +			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
> +err:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	kernel_context_close(ctx);
> +
> +	return ret;
> +}
> +
> +int intel_guc_hang_check(struct drm_i915_private *i915)
> +{
> +	static const struct i915_subtest tests[] = {
> +		SUBTEST(intel_hang_guc),
> +	};
> +	struct intel_gt *gt = to_gt(i915);
> +
> +	if (intel_gt_is_wedged(gt))
> +		return 0;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return 0;
> +
> +	return intel_gt_live_subtests(tests, gt);
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index bdd290f2bf3cd..aaf8a380e5c78 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -49,5 +49,6 @@ selftest(perf, i915_perf_live_selftests)
>   selftest(slpc, intel_slpc_live_selftests)
>   selftest(guc, intel_guc_live_selftests)
>   selftest(guc_multi_lrc, intel_guc_multi_lrc_live_selftests)
> +selftest(guc_hang, intel_guc_hang_check)
>   /* Here be dragons: keep last to run last! */
>   selftest(late_gt_pm, intel_gt_pm_late_selftests)

