Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32461A0B0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 20:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681B410E0DA;
	Fri,  4 Nov 2022 19:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E442B890B2;
 Fri,  4 Nov 2022 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667589408; x=1699125408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RiqNvpuQu7Rtw4Vu6QJlm6Wf9AqnPRzgXMcOoUzDEoc=;
 b=OpozRhT0Ap4KHtPrQcMisZ997D7fm96Y/PUObta15W21B+CB3ERui5Ja
 +uoiXe8ST7apmqqPJkdSFhDHkIQnycDV47XUk8du3Ay+iUSn05Mfm2NB4
 PDgMK8WohOFz6qq3fHr/q/O3pQLOLdbiNJRWFHJA4K/5OlFgCoc1OWtqY
 zn9f8M4nkab2QdJeDHw0YalWE1rR3YxZ7UibyQcKeM9kV0ooK0jWIzs6b
 eN3wrGfAVGW4fq7qg/1WkTnCR6KYmZKwwcmGjiyFWWdew55xySVuG4zcs
 XhkPXE5iF1JblpwSbFztkSE1XsRKArgxK2tJMSXwSMQcbQ36xwbHc4E61 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="311172024"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="311172024"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 12:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="613173904"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="613173904"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 04 Nov 2022 12:16:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 12:16:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 12:16:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 12:16:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 12:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSqsM11iHfllKYQxwZu6+m4tBHCCTFKvvFgcRcTNQsNb+LffWY/dN1gsJh6ednUR+Z03SL2BYbBz34VBo0IUI05iFTbir3BzTXKlOToZTplzxEPAnn6wP62D7wpg7YQkaxr4eap/6vaVIjTewVCrfbgs1WtPOxPfkI8Us9aCIXNZKu67z6OONFjcmRaKIyZUFNq5oOjawwFcLV7MlVo1U+nbNptJDDc5BQy59GYKAY6hMSNn7mD06++nmigUQsBJVkKoesKFcxSwIDlnL3/MsNdoulLdvaPkKNFcBLG2DNFDlq08G3uv11kC8sU9dxAcdrp7wsGWV7OArCHp3uSF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbZT5aY3xbUKpZRaZVZU7Ctrmu5AmqeJN3XKQO53fTQ=;
 b=D/tzR/wtDnVeV1Byjvz4WGSTZidDSAUrFUpGSC1GNjY+NSeM+jXVfNNk9Ibm50+vKFLH160vE7fZsDUjTTfSyoW8PBeIRotzsu9CNFOhS/wfMUkeLkhRGJuL3VbQl/bIir0BefYsYJW7my9ysj/2j0OcX+3NT/EMhTL/QPiRcuT/FHsoPQWlwrSolZEW0ugtQtw8KYLqr3CGmgun+l29vChSIyHcTXzV+KOLP9XR1FIzgY46Aj671AoRRQOI1MZmOSNjRoYjifShuPJXnsPihZHeT7JwRei4PTIBxeVeE67Fz2CBWgNhJxoDfQN9VAUFTCMfixHVgEnVOO9xnSvzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 19:16:37 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::d3a0:457:9c46:51a7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::d3a0:457:9c46:51a7%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 19:16:37 +0000
Message-ID: <fd7c7760-9058-1638-db55-2db3cde8414c@intel.com>
Date: Fri, 4 Nov 2022 12:16:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] drm/i915/mtl: Enable Idle Messaging for GSC CS
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221101033634.1900331-1-badal.nilawar@intel.com>
 <20221101033634.1900331-3-badal.nilawar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20221101033634.1900331-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:a03:54::28) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa2775c-7a1c-427f-db4e-08dabe991838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jz2dupDrnpONPXtrcf/pq4DPbGPpT7UApguXSacoMXog6WAK0Q11iIGth433FFuysUcfA5PDSGWEg23LMPI3CKOqqm6xpvamcQRVdGberCgN4vgQlsQAQmPN6/+O+rfW0kS5iwUZIsSreZayVOpiBNtg6KP2s0VWTuYsoJj0gOZYMtv01dyDDt+nJOWTNFbD3lw55RMHdaMnlZ1t3re14iy5LC4zzcWwfNkJ/EsYQNNaBc9dniIVEKTxlb9ua732R9rwEYYiTRtEpWhZa41KLzXq66Xuh9YTD3jjV0dsZK4Jw2AKo+vRjtT+9172U1ZIP/dO4i42Z8Upk5CbUE240yUhyRuKFPlivYNhjcw07jpkIpvGuTxbn7ijuKQWF5mlGFajt47yh7wzdLI4uuAaDOOqDletXdeJK2hRk1lOzwuVs0cdRWF56MPlOZNL7L+QPjNJaLUF6eJzPH+gPmyIsEpzk/QmpcVlkNfGZtsPjlUfK5pemjMsiwOjWYxuDesIO9c6cCusLJu9kieXHRpHoco9PPaW0Y+RjqJEOshcrN+vRTAh7ZnVMv4yTdN8sH69OFSYRdFe90UGDetaNfeopypeg4Qwe0dTnWpnRFouE89EMpppxi9rRlHdT8kem31cmctRiaxA+WEc72M5Yl6ChXQgzS6ouOixetmf3bXvtr2gW4fUOZLn1GzSF8Ztr+eyqaSTPLltHX//NmhxPS05j88P08BiWd5obMwVKLsmlvS70u5ChcbiWUD15qu1WzQ6UjDvny1fQ8aq+yzZj5XmNTUgfaIz1GO5XmM6peHEENc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(316002)(8676002)(8936002)(4326008)(83380400001)(53546011)(36756003)(5660300002)(66556008)(26005)(66476007)(66946007)(31696002)(6512007)(41300700001)(6506007)(186003)(2616005)(6486002)(82960400001)(38100700002)(86362001)(478600001)(450100002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hMODI5OVBVZkw4bElnUlVHcVp3VG5rQjFzOWhHZ0dIMkNMU0lRUHNaeEZz?=
 =?utf-8?B?WnJpT3Z4aSthQng0WlpuNHBobmlMb1ltakF4TTJ4TEFPUXVUQUtEMktNMmFL?=
 =?utf-8?B?c0VOZW1vZVdmN09LVGRoSlBIeFl5Y2ZYaE5wQ1pCSkFSbERsbWM4bDR2U2NM?=
 =?utf-8?B?cGsxZk1vSTVBOFVIa3pjcVRWcUU1VTIxOGMxOHRlOGttWGg3UWRvYjVxb0hI?=
 =?utf-8?B?U3ZObGlGYW9EWUpvZERxTEFaUHhoUmJ1ZXhpRFdDZmdUVXl3QjNiT3ZkSnB2?=
 =?utf-8?B?YjJqcXlWSWR3bWNSZkY2R3VaYmZNckhkT0VyenZGekJCM2RwR253V2kwc3Ax?=
 =?utf-8?B?ZUJhUisxZkVQdG9FNG9vMVFuQkV5ODFJZ3BDY3c4ZWNtLysrYkphTjZlVXRS?=
 =?utf-8?B?TzZuUzNjRm1YcWNDM1AzbFVzeFR3TC9WQnVSZUhQcE4vZ1N2dTVRblBBT2tx?=
 =?utf-8?B?UWg2ZkJHWHpjWWRHNGdVUGkvNzFCVS9Xa25yUkJRMVpOUUQ4VWVZSWVZdGMx?=
 =?utf-8?B?RE81NnBiOHRveFJ3TzN5SUhBSjB0cVVEbHBSOFVEYVdWSm13Tll5eFZVSG1R?=
 =?utf-8?B?VkRESmZ4Mm5hUFZxSFBZTGJHaTNkT0pKakdORDd2MFRwc3lzNDlBK1U0SmZP?=
 =?utf-8?B?aHZhWHdLMS8xM0tvU2JZc3hpMlRvOGRIN3gyUk5lR0lhOUpCQTJJTEJPUzFE?=
 =?utf-8?B?cFpKY0J5elFWbzh2RjZKNWJDMDY0STgzMXVTMzVPaWlLZUpQOWJzTitZQTAx?=
 =?utf-8?B?KzJzRnptenZoSjFidXF5ajFsWTY1RUJwbHkwTlhUSUFyYXVkT0p5ZU9GcnRO?=
 =?utf-8?B?YllnbGVPajIrQ2swdnQ2NFZaZE1EZjVhY1VOUHA4bG1WTVJhdm45UTg2WUpa?=
 =?utf-8?B?cXA3aFVpUWs3eHdrVWprREMwbnBDeGR6WDN3cHVSaG1MY0NmRkl4blVZK3hB?=
 =?utf-8?B?eFpvam02bnNwc1dDd3hsSkVqM0g4OUpLeGFuNjlwaDNjV2Q5eWFIbkpKQW1t?=
 =?utf-8?B?N3hUUG1uQm1mRkhKK3JyTGFxc1BDSExBbk1mRFo3dFIyTmZjZUNFN2lObFZ1?=
 =?utf-8?B?OEJWTEtGZldacVVBT2NmNDlmZ0hVOXFheDRCUjk2V053ZVJtRFZLS0dIQkZa?=
 =?utf-8?B?ckdCVndjUDFtTDZEWFd6dUlkanNwZzF6am5CWlNNK2FjTzJWOVk4aG1wZE8w?=
 =?utf-8?B?VElvOVUxdm03ckd0NWNzQXBEWW4xV3poV2VVWElIYkkvL1BCbHg4NzYvSUY3?=
 =?utf-8?B?QzNuS3I5U2tBT3BsNG5ZeDFaUzk5Vk45aDhPbzFYK3dEaFdjeWw5WGxBUlAw?=
 =?utf-8?B?aWQ0SkIwa254eFQvVFd3SE4wN01CWUNyaWRVVlVmMFBHZjdPRlN5NHpxazlu?=
 =?utf-8?B?RTdseld2elJsamNzYjhscU1SanhHMm9tQlpmVzB1c29tNC8zZlFQV0R5VC9L?=
 =?utf-8?B?czZ1OGVqamx2YktCRUVEWDhrUTFrVHpsbmxoNTVUZkNzT1E4cHpoWUFnUCtq?=
 =?utf-8?B?Q0F5ZzY5Ukp0cmc2UjBXeHJPNk54dmZnQVhoVEVISy9DRlpOVDZFd2hUWmNU?=
 =?utf-8?B?UGxNNE1xSjZzUFFPQXJiZzFuRlVVcGR0Q1lpSXBjRFo1bkNuTEZWR3hKb2tQ?=
 =?utf-8?B?U1RwSm91ODRHMGUwVEFQT2FqVXpHZDZPcTJBL1pyWUhWS3dsNVk4SjF0c3JC?=
 =?utf-8?B?THE5SFdWM0hBbldMeW9acTd3YjFjbXMzUXllRHJaM2ZPWlEyaEF6SnhGdHdD?=
 =?utf-8?B?NytGTmZ6QU1zK04xWTd2M1JSSEx5ZXRCQXM3eVpHdUo1c29jYnhyb3FBWjdz?=
 =?utf-8?B?WXhMK1J4Q2NBZXBMbkdOQVFKcE5DU1BUcU00WlJpa3Y4bno4U0pqTk10SUxI?=
 =?utf-8?B?blBORjM4dTVkenlkOHo1a1ZlQ0laZEJucksxNEM0NVZVZWFLZVRLZXcxcVNO?=
 =?utf-8?B?UUNReVVaM2NjYk5RUkxDdDh4bmMvdXpYSk5XSmhnMzJQRE1pME1ZV050Y0lO?=
 =?utf-8?B?SE8xUkI4SE4ySC84ZW0wQUtjOWV0TG9xS0k3TTVuVG1TK2J3YW9oUFpHdUVs?=
 =?utf-8?B?R25senZEQVViYXN6MlVwVWhGakVXWll0ckYxZlR6WUF0V09JNkRMK1NTQ2lF?=
 =?utf-8?B?clYrVHVsR285bFA1UlB4UGJGT3orTVFnc01rV2VkenpYSyswWTBLNkwwWkpD?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa2775c-7a1c-427f-db4e-08dabe991838
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 19:16:37.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVV0VhqXBT+A5cFjMaEVJ3K7oeuQwrHAWRK58+VZrEzlVlymd6T7+XuhR8uOCq4XZBW1u1dcM/umdhF4cvxJj/cjINFuDcJ19SBBw9CTEOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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
Cc: radhakrishna.sripada@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/31/2022 8:36 PM, Badal Nilawar wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> entry on media tile idle messaging need to be enabled.
C6 entry instead of RC6. Also *needs*.
>
> Bspec: 71496
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 12 ++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  3 +++
>   2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b0a4a2dbe3ee..8d391f8fd861 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -15,6 +15,7 @@
>   #include "intel_rc6.h"
>   #include "intel_ring.h"
>   #include "shmem_utils.h"
> +#include "intel_gt_regs.h"
>   
>   static void dbg_poison_ce(struct intel_context *ce)
>   {
> @@ -271,10 +272,21 @@ static const struct intel_wakeref_ops wf_ops = {
>   
>   void intel_engine_init__pm(struct intel_engine_cs *engine)
>   {
> +	struct drm_i915_private *i915 = engine->i915;
>   	struct intel_runtime_pm *rpm = engine->uncore->rpm;
>   
>   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>   	intel_engine_init_heartbeat(engine);
> +
> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> +		intel_uncore_write(engine->gt->uncore,
> +				   RC_PSMI_CTRL_GSCCS,
> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> +		drm_dbg(&i915->drm,
> +			"Set GSC CS Idle Reg to: 0x%x",
> +			intel_uncore_read(engine->gt->uncore, RC_PSMI_CTRL_GSCCS));
Do we need the debug print here?
> +	}
> +
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index f4624262dc81..176902a9f2a2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -908,6 +908,9 @@
>   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>   #define  MSG_IDLE_FW_SHIFT	9
>   
> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
> +#define	 IDLE_MSG_DISABLE	BIT(0)

Is the alignment off?

Thanks,

Vinay.

> +
>   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>   
