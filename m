Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26F5327E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30710EBC0;
	Tue, 24 May 2022 10:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2010E9A3;
 Tue, 24 May 2022 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388773; x=1684924773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5avMHqYC+szKUHtX61xtKWQ+P7qfNe6+bUSlrV2h2v8=;
 b=lsR0cRIEY4LdjJ9qPtWM3VtomBwjdBVKLm788s+TnRaLb6l1+Z1StF8Q
 Go1OLziEikdMtwTeJ6+gBfEylyObqD00HLUb/w2TmCP+MQzmSKGioObCR
 0VKgdgIiSRucDi6FkZz95QZ9NTDamcxJvfU04WB0Q+0NZsC9BbahkSjh7
 Rg571h4YWzHl19Usfo6qafNggrnVyC449nssrUu480by6L8y5OVW38ILa
 3tJ+W6eYOCnYJIexpQB9tbVDkgr/mrEHvX0OCXbRe4qfLl3wBxZ3e5uZz
 kmRM0zqQSBMRNEZtBhEjWqnnCLKlKSpEjrtOVhrnEc8zy86taeTOMk17p w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="272312710"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="272312710"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="745168209"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 24 May 2022 03:39:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 03:39:32 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 03:39:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 24 May 2022 03:39:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 24 May 2022 03:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzshNM0uiuscAqai/6q0mwFJQVl1cLTUkYuVX7L+rVouzuGl+G0iJCUi79S5uN//dIc3U4iEfoFL36UwO8slfYVC5as1uf3otDubpUsX2BOD1MQfVMhIb9v8UfXw9Gbk+ErXOCnceTETsKBm5lLK5p1NQdSPUdqVtn6Peo4tsA4iFcmIm/1yTOKfWmLxgG3sz31pDG/8BPVBgtwYg6S6g+6MsIFDSm9b/Jw52fw3UumDD4tPEV6cl5gG/XbqWtXdKAKz5Ahix4gZF+quaAkH+X7oq5jv9rnpVdOgGZsQOsNAFTPgd2fKUifF2EXOMlhqYuxFbQ0STs3Hr0/2fOkcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4pYH0C51ACmaFR4EVqQ/VnuXunJ+hnoruQmMT1ALpc=;
 b=MoIfEtSaQVLM9nKUvn61xu5ivVqAAMHnuda90q+kZeO/hztlHKz63DB2SUrKcECZdDflv1I6PdmVyJsN0U+dxBX9n60kNfSuC0Lw5G2uD7pbkrMC8+cYmhIs1K8AXThKAPtrkoToV1AeOiSnieRAw+uqdjcIBjhcu52NIDkuSabj37W4bGwSumnZoos37/5ajfT/Auc6yjlLfEDMV3G8AM31vHo1zVZ6jq993WPMwiOQatOURV9lHi5W2oYOC0uZl6+fXWNba2DMUpwWqeI/AmjQLVyNAyJPemuMWiogC99bNDRDnZ+pK+xa2MYXyPXvQBt2ZXupJg8773m9POIc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BY5PR11MB4292.namprd11.prod.outlook.com (2603:10b6:a03:1cb::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 10:39:30 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1079:a2cc:665e:f397%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 10:39:30 +0000
Message-ID: <d9f4e2cb-e4c5-7e4e-8188-d04d96ba248d@intel.com>
Date: Tue, 24 May 2022 12:39:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hwconfig: Report no hwconfig support
 on ADL-N
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220523075116.207677-1-balasubramani.vivekanandan@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220523075116.207677-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:203:91::28) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f618411-9ba0-4352-926a-08da3d71ae98
X-MS-TrafficTypeDiagnostic: BY5PR11MB4292:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB42926E7507E906075B9D93D2EBD79@BY5PR11MB4292.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNhZZJ8Xsm1Xe/Sa+xQ/rnm3z2UlBJ1OxWtHj/8kgjaSH3+98D0Z61RUV201A+MAzY3NwtFRx6F8mzQzl6jx2nlSO6U32dB7xlgS/zHWB/t8Q3M3w0iTA1xGFFKQ78ksEIFM+0iGJPHGFNXijQFA6aGBsNT47pYZ7Rn5N2YJjgZZPHmQIWbkt0lJJGM497pW6P1TYWUmJT8J3+FUQUJcdLmq0t2c3vpwJ4HbObm2Qls8O8UBUWgORfLGUXNzTrthv3Vc/6fiBWF5Uik4/BP21ZlYVfNi8RE8tTOGIhmBDpSCuKKNmTEnsK+i5KgZzwRmOluCkW3xIOij3NrHnHOsuIVW2Oq/CSnQw8wa3CdBkjy7ciXzxdQE1DWFXO8pBr1yW8xYTxT43CqqeXJZybDP1udCSop+Z9xH8N9seJRXoLfIkfW0FKBNFsx6Y69O8Zdzi4O5ME+S3zxW8NQVpz6Kzx7uJ4eIsgpa8AHQMYHiLA3RLT15vjwobokDsNjPmvh5LxKBvwVojEqctDdDyz4S7FLlEaezE4asuu9f3WNvfpTeollkIanFhpB1EfEqFPq61sQ+7DY+UXIJi7DpZeFDxBz1ESs+aiA0DfQNa0ZsGlhQ5YLosJsgA5lCFMgVAkC+yRF7F0hAHEjqfZBXz4L8/JYYZEbiDwI+1PfoXSdpwkzsLuuLIHaUm102Pc6l3GwBBVCO/EQXWVO7s8jdlB/0zbE0whivrq1wtw8jOjvy5To=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6486002)(6512007)(508600001)(31686004)(4744005)(2906002)(36916002)(6506007)(44832011)(8936002)(6666004)(53546011)(5660300002)(83380400001)(8676002)(316002)(38100700002)(82960400001)(66476007)(31696002)(186003)(66946007)(66556008)(2616005)(86362001)(450100002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk1QV1doUUpCRm9TZzFQTDFnOXBGV0YxWWZHVk95U2ZxV0cvaU5mM0hQeER5?=
 =?utf-8?B?STF0Z0pqVUtYcEpWSjNVZkZBT3d6UkpkL3hVZlFlSG5FTjd0MFVvT1JBM3lw?=
 =?utf-8?B?SmZoWExQWXo0RTFjMGNFOWx3b29qSTJrWk5GYWlVM2VuL3Uwc3htakVnakYr?=
 =?utf-8?B?R1RXL2F3YkVKN2NiTG1pZEl5UUEzT0pQY2h4Vmd2Rjk0aWZVTHV5NE1ZTTY0?=
 =?utf-8?B?cmJGN2NVRkhSV3o5MlNXSXRvV3FhN0pXMHNIdFRYNEs2VEMwWVBvc2plM1Zm?=
 =?utf-8?B?cmp4R2xtRjZ5cVRKdDVzVXJiOHFmWDd2K2gzUkxZQnE1QkM1UmpzVnpuZEJ3?=
 =?utf-8?B?QjQ3SzlNUGpoWUR2Zm9ocGd1T1U4R2QzRFI4UHREcXhXSXpyTE4vdVZSQk8z?=
 =?utf-8?B?VklaZ1A2VVBFS1J3cTlMa3QvUHpPU3JkeTFIbjZxUFJHRGNiRm5wMHJTWkpI?=
 =?utf-8?B?QXJFQlErYU4xTkRYVHp6TWlmTEc0YTVQZndPaFVMRFh6UW12TnlUOGIwNVo0?=
 =?utf-8?B?L09CYXFRWndwUFM3NlRxNTVMSnU3V0drNlFocW9EQlNxMmo5TVBURTU0amo2?=
 =?utf-8?B?OC9Zc2V6RUFiK0ZkMk1ZOUl0UUFJaWpNemU1amNVY2Y3cjZObGhWdmpJNmlU?=
 =?utf-8?B?UjkvRzF6cGk3ZFFoWlVEMWdIc0g1bDRFMExUTGh2TzBQODd0dElveVl2VGlr?=
 =?utf-8?B?dUhvL1ZhTU1JUGJScmNHSm04MFNKVEo1V3dtaVY2RklVS2F5UDJvaldhUnhl?=
 =?utf-8?B?YUVGYzlsVEtKTWR5OTY4UXlSMERsOUdCNXlzSkdUbDFiaWd3eEdIOFdnbVVO?=
 =?utf-8?B?dmFSSW9pRWZEdUZXSlBkYXplamlYZXE3S3Arb3c5SUE3T1JidHozV1JMYVN2?=
 =?utf-8?B?dHo1allCUGN6dU5EU0pCaGt6bFVVUVZMdmJtTnpLblUvQitOaktRTUdKWGNR?=
 =?utf-8?B?RGZVdEQwb2pRK2VnQXhOemNFdTYxUWlpcXYwMDNtT0RxVCtPWklDZUxNRE1J?=
 =?utf-8?B?cDlQMC94dlNjMC9KWXk4Q2M2bGJVU2tRc2IyWTVHT2NyQndFc1hubEl5bS9U?=
 =?utf-8?B?dkw3bDJlWG1DSmw4R2dESmVGc2xVbjdDMU5pTWVzeXRYT1R4eTREeEJUOWNz?=
 =?utf-8?B?NElYM29JZ1pwRjg0VkxGMFlVUUdTRnNna0w2emR1WDVPSExmcDFkbk0zRlho?=
 =?utf-8?B?NmxxYytQRVU1MWs3eGMyUTQvNVQ1VlpMWjhsT2VhTnN6SjdIZ3RBVXI2WWJZ?=
 =?utf-8?B?TGRvQzZVbGJXK1Z2SXkxYjRMa2tKaE5RTEJMcTh3STVrQ2VpbUJRaE1JTGRo?=
 =?utf-8?B?OWhuWE9LVkpnV1JFdE05OTJXWUFWZDBOalhNYVZ6ZXI2TVdEYWlGWVg1RDZZ?=
 =?utf-8?B?Wk9DVmN1WXE0NjZ4amMyM2lrSlNjb2NWTTQxdTBYS2VKTy96TGtsVDg3MnMw?=
 =?utf-8?B?eFQzQkhMK2pTOFA3V2RScjFUVXVCSWc5dkNvWElOcStCSUkrK0d2SS9qakJj?=
 =?utf-8?B?ci9HVEszeWRzNno3Y244UmtQVHRXVzlHNmthZ0JOSUFlUG1XMXMzV0xldGtM?=
 =?utf-8?B?cFVMTWM0T1dxZzF6STNmQitPMnhDcFV6dlVRam1XKzllLzRLbjBUWDRVeFhj?=
 =?utf-8?B?WVRKLzJ0MG9IaG1MckZZSFd5Zk5xTWlXYmxDTG42VkhmdzRGckZQM0NRSFpn?=
 =?utf-8?B?TFcvVEhub3lkV2YxeG53aGFnWWhIaWpwSHRhbzVXdm40RG5HdmtwYnM1QW9q?=
 =?utf-8?B?eUE4a0t6dDZiZjcxNFgwOEN5emVrY2VoWW5YdEh2ZDNLdmpzUzFtK3ZZaE9G?=
 =?utf-8?B?Q0FuQkJ4YUlVWHNKMFRHQjJjWnZDSERXc1FsQUNzdU45NDArY2s0L2U5ZDl3?=
 =?utf-8?B?cUwxays4Rzc1QVB0eXRTcXRpUXRGZEVPWTZ0V3c4cmhxZWtYQ3JnNWlFQ2xH?=
 =?utf-8?B?anRJcjRvREppZzBzenJLUVZjYi9YWHkyY0VFWUtiSE0rNU8vM1UyZGhXQ1V1?=
 =?utf-8?B?SE1xRXQzeHlYbVJ5bDRBcGdQQlZXL1dDanRQM1hyZk8xQk5sS1p1MUhrc2hE?=
 =?utf-8?B?YXM5TWZXMjkvT0xkaFlSQnhrU0cwREQvcHlFYXNXcEdCR1ZGdlFHcWRPVEh6?=
 =?utf-8?B?ZnQ4aUtRWjZvd0ZScU16MUlobU12V3hKMDdwL2tnWm5qZUFBWllNVytXRHNR?=
 =?utf-8?B?K1VweXc1a3FHK0FTN1JXY21hTTBLd09VdTU2TytzcFhnTEJpQTBVS2VoVUpa?=
 =?utf-8?B?d1lYSE9WNndBM2dQWWlWeWZkWlZVZmFPek9SNFNjcFJkQzRyTkFWdjdjYktS?=
 =?utf-8?B?eS9nbCt1dFNnRkZlS21seEpTVG1kNjZKV1JNamRaL2JWWXVQQUdpUHVOckxP?=
 =?utf-8?Q?3zYs64nED3aSN31w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f618411-9ba0-4352-926a-08da3d71ae98
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 10:39:29.9929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnaYPGUo2qK9O2kdoDelmSE7WKBgGKS7+fGB2CC+tUMfSrf0NAPOa12Yrjq9AKDOrwts86lVMcxYJkubJEESUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4292
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.05.2022 09:51, Balasubramani Vivekanandan wrote:
> ADL-N being a subplatform of ADL-P, it lacks support for hwconfig
> table. Explicit check added to skip ADL-N.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index 79c66b6b51a3..5aaa3948de74 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -94,7 +94,7 @@ static int guc_hwconfig_fill_buffer(struct intel_guc *guc, struct intel_hwconfig
>   
>   static bool has_table(struct drm_i915_private *i915)
>   {
> -	if (IS_ALDERLAKE_P(i915))
> +	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
>   		return true;
>   	if (IS_DG2(i915))
>   		return true;

