Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0D521052
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5A10EA7E;
	Tue, 10 May 2022 09:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CB110EA7E;
 Tue, 10 May 2022 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652173587; x=1683709587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9qFvogidFTBDiji9f+cnjVzk+RTXpAhAbMCXB2sZon8=;
 b=d+tRc+eJG76dgKDKtH9FhnlHS5/jbeHJcGl+Z6A/MNS0DT5IEoLksYrK
 zeMdH7ZidacLJTsfw7RBUNckQWd1geRt3QS3Dqsu1iLu/fcujlZin4RxW
 okowa1TabICId+HNa16TLF9Gbo3+jcL5Lr1gwUaSg8VuxRe1reiOp68i8
 8JUwmqj0dk/dLFFcPeRvbpLgOjMdYpKs5pfURLZZTvAjd2ldT0gkgdrdW
 Qserd6yCP+UxOxq0iQIjI8UPbwDqhu5M6+dUisQn48iZGrFa3UiN4235N
 x9IJSdBvgP9hN4UQlIRZ1VIQo37SeiN5GrTO+WN9VK7QG1FB/LZZhiwlD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249844315"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="249844315"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="602371917"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2022 02:06:08 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:06:07 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:06:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:06:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzdgnWrkSTPWPDvMNlWI7UA7JeluliRJIYqTp4D9B0kt4EqGUJDRl4tyTUasi7MO3i38ufIDKsOCJZliGhLVBYAQl3KyH7iYhNSNm1T3fCXS+eHt87SRSKWCnpQ/Eo/ZzJqGdWy9+BGIDgAKYb1jXLhSmzEKkCdepNmpo1k8IbhZz+k2VXHu9/82DDz0bEHcr/7iGdyMDBqYhCdgdU7HLXXEbCKK2ckaqjz7Z3rfxjAOTnjmWJ7Mvzww+KuXIRygR5PSmrJ9ywe1NI+hpa90uWKIRyIpOwBkvsQu0ECBuuxNSJ7RDYeECEgm0uxQDp5ibr2telujzS02JBsLXb1Wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM2JXItJbZpMvGjqfc0meil5DI7FPXXiRfRrYGGpzFg=;
 b=cpuCXvZbRmzpdBEn7dBNvbBDdmjdGfpK+DmikufLRsssVA0BtePTWpMf+F7AubuqUVER9PYW51n1kn7pPQ/fUsXlmTtmpCDdpyXdBDYIzW4WnVzitNa/wJXUFfO7lBHlWe6dy8luDZBcTDI0eVv2MAsVtw3E2IDK7wJvFzR5C41xdJ4wkU59FUa+okSY3DN96uq91OIQ1U0WeYX/pm3cSRWUjR9QVIpNb9BcsSl5F8oKycrnEreY0ilZSLWvakf+GDWDxPICWklP8qRxDvbdjkZJP8JPdZIoXPCKcwrIdaw8aOHiFKvAT77W79SzOVqi3GE86N8D3OivGKMyyWn3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN6PR11MB3517.namprd11.prod.outlook.com (2603:10b6:805:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 09:06:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:06:05 +0000
Message-ID: <91a6b9c0-9e16-e6fe-2f8c-626ca7f1754b@intel.com>
Date: Tue, 10 May 2022 14:35:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 11/25] drm/edid: convert drm_gtf_modes_for_range() to
 drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <b50377ce67fd3cee6628ea5865c80fa0fa7da990.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <b50377ce67fd3cee6628ea5865c80fa0fa7da990.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4a645e-d5d4-4ea8-7823-08da32645032
X-MS-TrafficTypeDiagnostic: SN6PR11MB3517:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB3517E43A8E084C33FF780578CEC99@SN6PR11MB3517.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl9k+1yK40BMwuTt08TEtv+xqahR4Lj8tdGQuszY5eecF/dNzJWAcu3wPeBErxgyXdEltnFigNvZE+EOF4/I4GBLw6OG/3AYjNiV2UPnhts0Ma++qvQSP50wLpSH4ws3X6duDIKm+wINyXBEkf5Go0260GMOZw8Su5MfE301Hn6b5WwYwJaOHY+cQ220ygy2uhdvT15abSFOWm6qUHX0VhjyBLALQgKqhpbYwLwRY45NMP4VkmF5FbgYgyHFv5SeqZSaZv1lke1jcNaGJzcqoFQ07CqqHt/H/uxlT/B7uFvqtSWwLT+kB0jQuFNYgD42kEIFfQPk0CXq/IuMxKxZvlho8TZGD4+Nxl8gCVs1tpmA3jVykMGjidH13gRm0i9bcHwffbJwPCRV5VzEqxKzAQJWz+6JLM+1HAlBwSyBvLaEoIckU0i/Xv1utxNjW0U3mJcv8Ua/iXptfZHMemwbqTWlGaGiZB+jgpqVAQGdnclnMOnLAxxaWTXj8wVsC64xjMinPpXBelBt9Ef3MT6zHZAxvhCVJRmfIWOnREljlCz0yJH4t+1JV2ezanS5yLr6LudpkQuDS0mTfJfF1hABLS1IdScqW9Naxjy4JlZSAhd6c1DO8Fu/kD6rZSiPiZWe/h65mJZaH82ST9A6aR+ndn+HDxIhncY22Azc0Sro2SjMEOmJsdwV5tH7DZgeJBFTNEgFboYK6tlNMTkRM0RV1H4cjA3uvO60PxjVpyylx8AIr3QqXG6HZAVxRJ4jzzFS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6666004)(26005)(186003)(5660300002)(31696002)(508600001)(8936002)(2906002)(83380400001)(6486002)(6506007)(53546011)(2616005)(31686004)(55236004)(36756003)(82960400001)(316002)(38100700002)(8676002)(6512007)(4326008)(450100002)(66556008)(66946007)(66476007)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZsa2lqTlQzcEppWUQxV3R0RUdQWlMvcWhhTElWa3hPaWF3VHpRWGdkK0Zy?=
 =?utf-8?B?V0V4SVRIWTVQSWduY0xybVJIbzVGYjRGQ2Q0Q1dqNk1scFdGMUZKWkZFdkhi?=
 =?utf-8?B?WXBCL2RIRVBKbklDWGdBRFA0eW5lVVZ5bGdlUkNIUUdUaDRWd29NZnc5NWNh?=
 =?utf-8?B?Z3BJU1NoSEt2c1dKWFRxOUswbTdnNEtyeGh0cXVQSzVHd21xWHNwS0RGa1JL?=
 =?utf-8?B?RXZiQ1dmU3BZVXpsR3FvdlE4REFEbWN2YzhNaU9kRnRnMmR1N3F2bEQ2cS9F?=
 =?utf-8?B?Nm9SSjYxVFlmN3JsOEdEaS9UZ25rK0dSS0hzS2tya0IwdDcxMGQ2eW4xalpH?=
 =?utf-8?B?WWNGVmNNaUxtcXNlN3d2M2xXTzV5bjJmRVhmUkVlVGpXMVpFU3VzZFNROWdl?=
 =?utf-8?B?My9wVS9yQUJ6dVUwcm5oOFcrRmlRZE5FcXJsMFc3Mkw5T2FXalplKzk5S3h1?=
 =?utf-8?B?MjR3NXBGdTVJa3dlSXpPSW5jVmgxSHUxcG02NlQ0VlBsV01RZlFRMHV5VlZo?=
 =?utf-8?B?MzYwYjhwYWNXYmFhdG9GMThhMGZ3U2pmeHhtNE0yR3JOcmdJMUFYUTlid3Vp?=
 =?utf-8?B?dnJhaFBucTNmRVZxd1I3UEpKWS83WDZDeHhFcFAzM1UwQVlrcVRFRnJWRFQ1?=
 =?utf-8?B?WnJVbFBKM3ZuWG5CcUFCQXJzaGZyTHpDa2crbWY0b1pYMTBLOHpGeFd3RGdn?=
 =?utf-8?B?cXd1aEJXZGc5RC92R3J2YjlsdXgyODR2N3ZNQ0R4TUFXb2NHMm5tWEtmZlR0?=
 =?utf-8?B?YWc0SmljVkdOcjNrM3FxS2huN2pUdXNiSDkvN2tJUnFPQjZBZ2VBNWVTNHVj?=
 =?utf-8?B?dmdSa3ozNmo2VUhwUU1icGVSSjJwTkxlZ2NTU2JQZlNaenNtaU91WEgzS0l5?=
 =?utf-8?B?ZFRCV2srbVFwSkxBOExwTWgvUTc4alBteTZ4Vkx6UndQYldmNkE3UzJ5NnYv?=
 =?utf-8?B?VGxrMDNST1R2RlZSLzRIdDlPMHVwbkFuZDZhNGpRR2JCcUxaQkJ4VW41ZEx3?=
 =?utf-8?B?TjE0ZUFwQU4wTFhmNitBQlRmZVRqK0UvNHhScDRkK3dqOGJsdENiVllUb1Zo?=
 =?utf-8?B?UTV4V05KTUREdDZxOE55VEs1VHBRN1NjQ1ZPcmpyWTVFR3U1M3B2dTl2eGdq?=
 =?utf-8?B?TTJFeitvTFBHQVplWGY4a3JXRG4zUENqdmhNbGgwNDA1THhXbmtZUVVaM3F1?=
 =?utf-8?B?UmZUazhZT2hJM1NpSG53dWYyeTVJT21BZTZRTjBKdVpUZGwrZmNxSkNKUE1D?=
 =?utf-8?B?Tmg5SkRWWVptVGpNNDNmdW1qNVpWVWgrZE1UeitsUi9vbDRQeVNXU291TFh5?=
 =?utf-8?B?UXZGLzQxUlV3WmJtNEZzSThubTVZbjdkaHRxT3liR3dLQ252SzZGUFNNNXF5?=
 =?utf-8?B?YVlucVBja0NLVll4eEdXVlZVZkg3ZXJBa29sWE0vNklOT1lqQWpHRDV1TnIx?=
 =?utf-8?B?ZG94Zy9QeENncFFXUkVQTVZtazNLSHZtNHE4bmJXWW83T3NtcG9DYWl1TG9W?=
 =?utf-8?B?VS85MmxOQ0ZhV3JHYzhFeVNrSnVEcGNid2cwcUVnZm1GZWpKblZXL3hGVnAx?=
 =?utf-8?B?UXAzbU5YUE9tMStheFJLOUtESzdlclpmRFg0YVZHa28reXB1VGV5U2RlU1gr?=
 =?utf-8?B?MTEyTEh6QVdiVDBBMUFIaFkzMEdURGljZzJXOHp2Wm55cmJpV1dONFF0TFgv?=
 =?utf-8?B?QXdsb1ozSjFpSFVBUXV2WkRuNllBcUswQ1FadFo5N2JGSkdHVSt6cXFRcXlX?=
 =?utf-8?B?RU9JUWZiN0Y3UnNJdjdwaE9tYitKZnpXUTdock9COFBEVTd6QmVvU1Aya0lX?=
 =?utf-8?B?dkt5ajBCWThyZ1gzdHBXZnlqcXBXbjBpSEh6alpDekZPcTA4V3QzT0tuMk1S?=
 =?utf-8?B?Zk80UXFTOXNjbXNhaFBhQngyZVYwZzZwVXJvUmVTMkpPQWRxMGNubW5BSEFQ?=
 =?utf-8?B?K2J3TUhGSHhSVER2TkVqbnJVVjBDNUp0dnZKUmoxSFVSR3QxaCtIMnVWeitn?=
 =?utf-8?B?NkNjWW1ESTh2elkwY2dUU3drNjQzeWcxREpURmJCQm9JZ1lPYkNxQWgrWjZX?=
 =?utf-8?B?T0VEOWI5MFNRKzJCWFFEWHNROXZobXVsWGRaOGxmeEJCQ0psOHZYUTRtQksx?=
 =?utf-8?B?UmkyWTk1c2pNK1hXb2FqTyszSnFReTUvOHh6YnJmYnpCazdueFJmcVVEb1Ur?=
 =?utf-8?B?VDNmc29WUi91alk1d1V3cFhvdUpIeGZkb1ZPUUZIdWQ3OHVELzRlK1JJeFJj?=
 =?utf-8?B?OFZKeCtReXlsOXgvT3R1RG9xMVpMUHR1dDBaZWxSOGhVQjc3M1R6MUtaQ203?=
 =?utf-8?B?QTU2a093UGkweVN0SkNMNEpnRmltbkdvRnJXRmR5WVVVZWpBV0hrRU0rTVU0?=
 =?utf-8?Q?EmrtmvZZGEp1mZVM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4a645e-d5d4-4ea8-7823-08da32645032
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:06:05.3543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPdw90QcmqOLWlmelhgUAIoTCdu34CcfFjCU1j+dNUpMbpT8tKQ0NqN4DFyveuyKQlqtH3TEucbZG7SpJWQA4SNbW48D2Q1H9uGmLwosOI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3517
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5d8744a7b62e..037102a4d0b5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3156,9 +3156,9 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
>   	}
>   }
>   
> -static int
> -drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
> -			const struct detailed_timing *timing)
> +static int drm_gtf_modes_for_range(struct drm_connector *connector,
> +				   const struct drm_edid *drm_edid,
> +				   const struct detailed_timing *timing)
>   {
>   	int i, modes = 0;
>   	struct drm_display_mode *newmode;
> @@ -3172,7 +3172,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid
>   			return modes;
>   
>   		drm_mode_fixup_1366x768(newmode);
> -		if (!mode_in_range(newmode, edid, timing) ||
> +		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
>   		    !valid_inferred_mode(connector, newmode)) {
>   			drm_mode_destroy(dev, newmode);
>   			continue;
> @@ -3236,7 +3236,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   	case 0x02: /* secondary gtf, XXX could do more */
>   	case 0x00: /* default gtf */
>   		closure->modes += drm_gtf_modes_for_range(closure->connector,
> -							  closure->drm_edid->edid,
> +							  closure->drm_edid,
>   							  timing);
>   		break;
>   	case 0x04: /* cvt, only in 1.4+ */
