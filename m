Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB685B2385
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE66C10EB57;
	Thu,  8 Sep 2022 16:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4D10EB56;
 Thu,  8 Sep 2022 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662654205; x=1694190205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=REd8TepiavQ7FrubQBy1JINaAhQrN+RcmJSgpAEazec=;
 b=RDGjgLRuDUDRK9NmeE8a2mjIHXCS2tF2KqiszDUvvXNIEo1spfkLoEm2
 KdGI+lEKnWK8TsKng3DdyeD2dq32tes1iMvDSW0o+GPFzlPQpoSRbxI86
 oEQ+ycEAt57ICWHF6R5GNvNmjWllO9FEaruoKI9yqvcTBks8Torb+/vBO
 dULB/XHlARbupaiB/4Srw1EXKKmtqxhNvNqFEBsUgOpM+eS0BONJDLI48
 i+pDgBDAYOAP6hkCtUavISHow5cHi6a8x/NpD3ok2QEHL8ItZ5tY5fcCb
 simruAT455V8Mj8ivc20g2B4lpVzpBAwrpU9oMFue/Mb1ZDFLcaaclNfZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294826462"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294826462"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 09:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676764209"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2022 09:22:49 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 09:22:49 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 09:22:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 09:22:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 09:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbCM7O0bZqlNE/Rv7gjRfn889T3Hao49myhLHek//R+1sNypudwv0N0CT57uSuGtmtXhufoaaVbTxSHX75IjA0GcJdcyXW9MMoklI9MDokwcYHwtsNSriuQdSl63NcaigTovICXHC/qtpDJf0tJ13gyrNgRcOSEa+E+5tfuRgo1+ZkNFquhTqsZrmBAyYg33Y7xoV1kHq0eBXueQIzorC50U3ZEnyOtjR7HQUCMdVPpdy4JwMEzM4eLlPYLVOLkEHQyE4VlWWLabgbDd39p4iibz6gcJlN959GnzpuXCWh7A6R8i39v4W+kOHqFzTV8JLQX8DqLUFd6MxdSsVizdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIFjBZ33dvWHrZ9p1hGq8bzLfn9/6NxchGj8xfjH/O0=;
 b=bKNzF/YkWoOvEs1lVuYU3nnQpmryB+qeTu54zUMXL7GWfQYNKibZHI9V9sprVIcbXznVOpkg0hu5K1nUPt0iYJhlV5bsusxQPY3NC7lvEbGCKdx/DDwrjKZQ68JMEdW0Rwz6SiCD/3PqJWVN8/6Ty3qYuWHw+8L8tEUQlJNJyP1UyRlG6iKc+HH3FcglJx1Wjmva2tdWxDhCCzOJ68N/n65B0BbP+0r7YkkxmvQuWuK0EQ3d4GbqAgY0hTrl4HFhY6N3N6Zzr4qjVuwB3CmaPq6REEDXUvCX5DeQXAGxjYU79ZfL/5KrF2HT6n3NxmZGVDzthWyjkGyK5Mkh9NotHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Thu, 8 Sep
 2022 16:22:41 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%7]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 16:22:41 +0000
Message-ID: <7ba63af7-e6cc-85ca-6b95-8a87800d4ede@intel.com>
Date: Thu, 8 Sep 2022 21:52:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v3 12/14] drm/i915/xelpmp: Expose media as another GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-13-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220906234934.3655440-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::16) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 569952cd-b0ab-4a05-adae-08da91b65a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RieEEfoVasidkpX9gD7vF3qjjh4lBj5VHcJZZRQ7+RldDfZCVTcCCzGybh5fXg5rsyzUIYsrR6oLqz8pWUfsgIWbp4svuHyxa1/yauptgGOYmFXdkDd962Efn5oGvPa87A0tn8RIoqkSf/WqJAwQnPCVW0UH23nhU+vc5lL2Hc71UdQXS3tMjKnjfqfY9g6BcMgxUK8MgJOQjCyIqinDz++h7+cgiakFQJs/k+27jcw6goK5CuqzNX3XslUtw75P+d1ZiJNDZIRb1EqYZrY9b3MJIt9Bu7CkVbkr7feSo0UQtO36+pq9eY3CcIbqFfpKoj7nhFV05D8rN3RCVW16z1DJCyBPrHtvUclpR035/D2ijy0nExq7JqnmaaxII97I+Yw0+FCGjMe6OOR4PmyCFC3ikyOVj1SLx8Lek3ytrlbrwzihZjYy3820wHCepnUTNvg1V05MIwvhtGSTM9I29yPOZE8wDFdRa4kSVwSsj2KmmRrEUc7oeLEmUluZnsEc9mnbZOQCnF/hLvk2h6N0clYUuLYK7YQmODEoFKHLZeQSKvPkXJrN7cMEJ9ZIfLofDsJnwEgp7I7KOQb/+OHzxLmw3VuumUmX09IX7gVVuvg8ZKCx12eRFUE9GvqqULfkfCYmqWwBhKHfKjFX7hoBrwhI5ZiL/CA0jdTqlR2Ne8uODapiiyWxn4KN+Dt7DY5l0KeDJOPDms7purUr6kTTlEGZZlHaPg9qRWdkSk8j8PBR/iSwExQaCZc78nk85twZxXVpYqdaklbjyJdNxczr9jQxP1mZixs7XqCbLHTsRig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(31696002)(6512007)(316002)(478600001)(6506007)(53546011)(26005)(6666004)(107886003)(86362001)(8936002)(31686004)(5660300002)(36756003)(66476007)(66556008)(66946007)(82960400001)(186003)(8676002)(2906002)(2616005)(41300700001)(38100700002)(4326008)(6486002)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3BXOS8zMjZlSHVmaDNHZ2s2NS81OHZFU3J0VUVmOXM0RUs1NklkQS9WdnF5?=
 =?utf-8?B?UWdzbXZjZ0FJbFgxVXlOV25uaFc3QzRxSGxjQVVWeGxNbUtHQm1aQS9TWU5U?=
 =?utf-8?B?c2wrcjRpUitIWGFPNHR4c1NJZVZxQkl5YmV2YzNkNXRqaFJJY1puVkVxZEUy?=
 =?utf-8?B?YTVDTjhIcmNJWXNPeHdweUpncFpNbjRhbzFLamowZjFCNndxOW1Kd0oxcWNm?=
 =?utf-8?B?dEhkMlJuUjZsWi9ObXBKZ3JTUjBHcm5PTmtIL0QveEtmU0FsMDVPRDVpMjF4?=
 =?utf-8?B?ekdSU0gyWGo0Ynk2di9zZDVmZHZmS0pvWnU5aEM3dDNTNVJHVjVnRTJrRE0x?=
 =?utf-8?B?Tm9jZWJhVnRjWkFza29NOXpWSC9wTEpYSXZiK29iV2Y1bThvS1VGeEtTcGV0?=
 =?utf-8?B?b2Q0ckZDVTlicjBVZGJ6bzJZWWZ2WGZuM0ZINjJtYWhIVkFqYjBJR05CNjli?=
 =?utf-8?B?QzBxbjNFeW5uSWdxTlRJeTRlT3Q0RkNtSjJjNjJobE53SjFuMEtsOG1DOHFP?=
 =?utf-8?B?NnhPMUh1UDFNWG5PU280aGIxOWRoZmpWZmpaRFRtR01Kb2xwRUQ3eFFwdEY2?=
 =?utf-8?B?eXA2eFdSSk1MazdURjdnaytJa3diSmFyUnBJbldkbEVmSFVyMUxMT0Z1ZGwv?=
 =?utf-8?B?SnhQQ1Q1SjFDdGg0eWFvWUhiTVh2Qi9pdUY1NFQwT05oeE9IUXA2dEtzT0Qy?=
 =?utf-8?B?VTVFS09vWG1RQjd3WngrbTYvVFhKVFFPNXorRGxJM0xWZ0lMSGpUL0dpeUxs?=
 =?utf-8?B?SGhDLzBlb0hWa3c4Q2k4WU5GcEF5RDdrSVVST0o2Nzd1VlV5WXRQYmN3M3Q3?=
 =?utf-8?B?ZHUyMHJncG5FTlR3YmxwRklBclVuLzdodVpDdU5HalhzZEVWSnBOUjNVN3ov?=
 =?utf-8?B?Z2ZFRlovUXZUZU9zOEhhWUVWa1J4bGJoQWF0MW1GWHFURkRhaGc1RUpPQ1ND?=
 =?utf-8?B?UHd1d0krODFRMkdUV2lyR21kS2NkVE41d0VSMVBzcTMvcllkYTFhRXZJV0dY?=
 =?utf-8?B?L0xET25BUnBFQUw5clJ3c1JlbWJiaFF1VXhCMGpnVTVDbDdrWW9JRlJoNmFo?=
 =?utf-8?B?K3c0MmR0L1BITzV2dWhwbmdjQzV5Z1BBYzlQdlF1WUtNME1RM1ZQNml1M1Yw?=
 =?utf-8?B?OGw3UmZoMEhISFBIa00raW52N0JxU05PZVQ0TDRvRU1nUldSckVMQXRGOXV3?=
 =?utf-8?B?cVhYdk1BUlVXWnZlc2JpdEU2M1VFV2ZKNkNDK2pEL1BKVTNubG9ScmQvVGxO?=
 =?utf-8?B?aVJCOXdaY3pIODZRREM4K3I1R2Q2UW1jZERFb1RDSXN4Y3h0N0tGT3htUFl2?=
 =?utf-8?B?Zm5VNG43TWp5VVBOd0xmSjhjWlk0bHhoNExmVThTMlBwV2M5ZlcybWh6YlBa?=
 =?utf-8?B?b0tJTEpQN2twVjFlL05nSUh2ay8wZENheHNIMWRlejZ6WFJ3MzJXOTVuN1hE?=
 =?utf-8?B?aEx4MG05OGhxMHFVdjVrSmRPZTduaUtpWnp5L3c5NjdRODJaLzg4Y2tSWkNF?=
 =?utf-8?B?bDZqVGNsZnNYMExjOWUvRkZQVkNkem5KK21Vd05vSS9kNTdrRmQxRGdEcTlM?=
 =?utf-8?B?OUo4b0JEQWs3em42eXcyeFJwVjVFRWdSdEhSd2tSVDByQ3grTFhINlpCR3A1?=
 =?utf-8?B?dEYrbWhDNjBpQTBkQTBSVnlCWHY1cTVtL2x6QkQ0Z2F2T01JVC9VTzhuUkZo?=
 =?utf-8?B?YythRG9RR3hoazBOcmw1eURJWDYxd3JGc1ZPTUllZVJtVE5HRkNPVDFWbnFo?=
 =?utf-8?B?RU1KUDBFQWxmYjBZNmQ1S1R1VHA0WVJEaVgvR0YxZmozZWRjWnE0cm1PUDFt?=
 =?utf-8?B?dkpycTFDaWRQM0UxMFlBN2o5SThaWEphYUkxVlF0dzZXbnAyMDlLcXM4RUs1?=
 =?utf-8?B?NDR6OWt0c0c3U0lpaEVJSm02OUxqRzJmeC8zN045YlF1aUw2NC9lZjFHRnJi?=
 =?utf-8?B?dS8ycTJzdzYvc1FTUEt6Y2RQSVorRE9IVEFVRjUxUmpKM0RRZUVpNkExcUZE?=
 =?utf-8?B?RXZNQVJ5dWRmSWZSZWRXUERwNmhPWVJJRXJKcmhHMU16T1d2bDM5RDlHNVZL?=
 =?utf-8?B?ZnI3MVhSMVlpMWFsNFY4OU5BbUJKUkJJc1J2MFRjK2tjbmtKUHg3bWp0L3pz?=
 =?utf-8?B?N2ZBL04xazlwbmxTbGRxSFczT2JISmpEOWt6OEVHdmpDa2hCTmtnbnRSc1dM?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 569952cd-b0ab-4a05-adae-08da91b65a58
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:22:41.5463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpugT3srxMh0IaKULa54YxSjjc4KoeYDzrpEKDMIrDD7j7FpGoo9B3kHOew/yPp6mqA4m6uZ5CVvZj97/cmoD+zGIh0fExppjQZ9Y8Y8otU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07-09-2022 05:19, Matt Roper wrote:
> Xe_LPM+ platforms have "standalone media."  I.e., the media unit is
> designed as an additional GT with its own engine list, GuC, forcewake,
> etc.  Let's allow platforms to include media GTs in their device info.
> 
> v2:
>  - Simplify GSI register handling and split it out to a separate patch
>    for ease of review.  (Daniele)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile            |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt.c       |  6 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  8 +++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_sa_media.c | 39 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_sa_media.h | 15 +++++++++
>  drivers/gpu/drm/i915/i915_pci.c          | 14 +++++++++
>  7 files changed, 84 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 522ef9b4aff3..e83e4cd46968 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -123,6 +123,7 @@ gt-y += \
>  	gt/intel_ring.o \
>  	gt/intel_ring_submission.o \
>  	gt/intel_rps.o \
> +	gt/intel_sa_media.o \
>  	gt/intel_sseu.o \
>  	gt/intel_sseu_debugfs.o \
>  	gt/intel_timeline.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index aa0e40987798..9b9c0ea73b7f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -31,6 +31,7 @@
>  #include "intel_rc6.h"
>  #include "intel_renderstate.h"
>  #include "intel_rps.h"
> +#include "intel_sa_media.h"
>  #include "intel_gt_sysfs.h"
>  #include "intel_uncore.h"
>  #include "shmem_utils.h"
> @@ -864,6 +865,11 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  			ret = intel_gt_tile_setup(gt, phys_addr + gtdef->mapping_base);
>  			break;
>  
> +		case GT_MEDIA:
> +			ret = intel_sa_mediagt_setup(gt, phys_addr + gtdef->mapping_base,
> +						     gtdef->gsi_offset);
> +			break;
> +
>  		case GT_PRIMARY:
>  			/* Primary GT should not appear in extra GT list */
>  		default:
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index d414785003cc..fb2c56777480 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1578,4 +1578,12 @@
>  
>  #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
>  
> +/*
> + * Standalone Media's non-engine GT registers are located at their regular GT
> + * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
> + * structure so that the existing code can be used for both GTs without
> + * modification.
> + */
> +#define MTL_MEDIA_GSI_BASE			0x380000
> +
>  #endif /* __INTEL_GT_REGS__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 82dc28643572..726695936a79 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -84,6 +84,7 @@ struct gt_defaults {
>  enum intel_gt_type {
>  	GT_PRIMARY,
>  	GT_TILE,
> +	GT_MEDIA,
>  };
>  
>  struct intel_gt {
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> new file mode 100644
> index 000000000000..8c5c519457cc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "i915_drv.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_sa_media.h"
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_uncore *uncore;
> +
> +	uncore = drmm_kzalloc(&i915->drm, sizeof(*uncore), GFP_KERNEL);
> +	if (!uncore)
> +		return -ENOMEM;
> +
> +	uncore->gsi_offset = gsi_offset;
> +
> +	intel_gt_common_init_early(gt);
> +	intel_uncore_init_early(uncore, gt);
> +
> +	/*
> +	 * Standalone media shares the general MMIO space with the primary
> +	 * GT.  We'll re-use the primary GT's mapping.
> +	 */
> +	uncore->regs = i915->uncore.regs;
> +	if (drm_WARN_ON(&i915->drm, uncore->regs == NULL))
> +		return -EIO;
> +
> +	gt->uncore = uncore;
> +	gt->phys_addr = phys_addr;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.h b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> new file mode 100644
> index 000000000000..3afb310de932
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef __INTEL_SA_MEDIA__
> +#define __INTEL_SA_MEDIA__
> +
> +#include <linux/types.h>
> +
> +struct intel_gt;
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset);
> +
> +#endif /* __INTEL_SA_MEDIA_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 26b25d9434d6..19fc00bcd7b9 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -26,6 +26,9 @@
>  #include <drm/drm_drv.h>
>  #include <drm/i915_pciids.h>
>  
> +#include "gt/intel_gt_regs.h"
> +#include "gt/intel_sa_media.h"
> +
>  #include "i915_driver.h"
>  #include "i915_drv.h"
>  #include "i915_pci.h"
> @@ -1115,6 +1118,16 @@ static const struct intel_device_info pvc_info = {
>  	.display.has_cdclk_crawl = 1, \
>  	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>  
> +static const struct intel_gt_definition xelpmp_extra_gt[] = {
> +	{
> +		.type = GT_MEDIA,
> +		.name = "Standalone Media GT",
> +		.gsi_offset = MTL_MEDIA_GSI_BASE,
> +		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
> +	},
> +	{}
> +};
> +
>  __maybe_unused
>  static const struct intel_device_info mtl_info = {
>  	XE_HP_FEATURES,
> @@ -1128,6 +1141,7 @@ static const struct intel_device_info mtl_info = {
>  	.media.ver = 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.display.has_modular_fia = 1,
> +	.extra_gt_list = xelpmp_extra_gt,
>  	.has_flat_ccs = 0,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,

Ya this is just a rebased based on "Prepare more multi-GT
initialization". As this already has an r-b giving an ack.

Acked-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

thanks,
Aravind.
