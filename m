Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711B5211F5
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BABB10F657;
	Tue, 10 May 2022 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2E710F657;
 Tue, 10 May 2022 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652177752; x=1683713752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RZ7skA92mISUGKNjGmOYtfYgzdEMz+eCi4vY9WtACtE=;
 b=R2tpJpBumPSdybcxfAnyCP4A5XNi1IrOVyKPcSQoGc0GE/lXR+R2PmOA
 OaR9JE3poR1xuDl6nXyxi4Rl1hXG3oPWnMmA1EEmQUtv4lxaGIPSXwoW4
 eQfeFH/cWFxyzAMhI5FWI0UTwH/BmU0toUg7piU2MdusNTFIZv0w8MTes
 laulJ0YSjwDROFdzsjaBz9PsrenC1oga0GxQ/2LNnxpb81QkAIjyH+YA6
 65Eq4asWbYadg8SAM5aeYYJBZt0dzQwHFH702Kdxogw0DtFXad8OCDtfg
 IkSDyaE6KBc+ecj7KVpzMi2LFoXRvwBILZRJ41pcjbVTUuq3XL/t9bO// Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268992598"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="268992598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="602391290"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2022 03:15:52 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:15:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:15:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJo9s1gQxZLxm1TG4YJ5NDyR86hyUnlhLaFjSSckXuYploxNIomRpGnrnu0LKc6J7wLNAYq5f4bDqt4gVzJIDTpYGUwxo3iZSURcLhqPHhIiy6BZ6AmvAUM7kuDI+NZc2cUL48NN71d1CarIOUciu0V6jn4So3KGRtPTDv5Yusv+tOyXkc4TLL8QCH/Qgs1X40HmKoMEhrfnRuZeHgHyUfnRmmQvcPUF4cKPkT7KL1NE/cgKbyijK2mCqPBN5ZQPps4Ed3cjvKqLZFTwe3yuePgDElsAA+udjzPaH0wLec0PvjeehDj+I0nPieFE68x9bMgyXsIJctCvOsr3xrs9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOK6JymnAN8Q/F6aauZIn+lvXWAxZEBGDcEVbK7YqdI=;
 b=IRj8YiJR8IpeBDUMCjZVN2eJeShoCP/S1OMiMO2WMAMsTuBjpZ9boK/fGD7LwMTywJVB+iFwXsVdLepFyLHfx59jWgP32gMOXURkFR9OYJ30+uE/09TlVmtick+J6xN2ZuHpBNlfq/SjfMzMnA7VNSbQbKuhCLF5SHFa+AtGifyDrdLom9ORBx23iTCevTal0nLH/1XDEfHLKyYzZglevUiqDvmM+dwTk/fyDwl7Y/rk6i9PqnHxoyjWncPjVroNUZoKgY6qq6i7r9xYdVU7CGen2JYvEBqo/Z5vuTDY3qaxg0poCSSlrFZN2FVHBksvXzn9fVYXrrczKJRJhxhDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Tue, 10 May
 2022 10:15:49 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:15:49 +0000
Message-ID: <abda9507-831b-94c9-2f03-d74b1540a010@intel.com>
Date: Tue, 10 May 2022 15:45:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 19/25] drm/edid: add drm_edid helper for
 drm_detect_hdmi_monitor()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <2fbee0d7b544b44ef0866bb154beefac5d260bec.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <2fbee0d7b544b44ef0866bb154beefac5d260bec.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395febc4-11e7-4779-88a3-08da326e0e38
X-MS-TrafficTypeDiagnostic: PH7PR11MB6356:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH7PR11MB63560D46CCF20672621F9A95CEC99@PH7PR11MB6356.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G2yR6I1axm6978HO5S8KbXawiHStSYcR/05y0DLA/jeJn2JK6MJeqahiSZ+gagcjw6NPdlELGfRLEy1G/0dojIc1xoJg0xrYpN/TwgwSnxFSUO/9X4++ToFNr1lIW3PCVMTG8LAZwNfM6cbTVn31exdGSrcPdUzcXTKE4VnpN1JczQBd7k7OLTrnzsaNEaS09V3XLLhygrlvHO40y33tu1+Osru65TNJRbAaAlJibyqnPqMhgRiFGUpZ3r9e1mVwsG0lERKJVEc/uE8m5rPAd1ze+c9foLO4AO8wLeQLSJ0lKsom1+8R67Lj0etuzgx1VZoPdhDz29MvPX5xiRWA9uoAMw6TwQtz7UC/tLMMywsoN0ss6b/junhAvh4h4wBdYQihuMgbZIRsVWE77YAObcrR8OTr6BrLv6/3wxB+j+32OkT6v38rp2pJ7tJrX4XKQi+W12m1i9sOxDQHGX42/IrOKbCJqsx7OQWk2dMvwPqSts+HqAkrdntrgxrEs1fT84YV+hH8LXZ8mPQYz9xdQRWCKfca0ct9mzSEl5COM+1uZOuApCRnxH8xRs8Zb9cPJiCuudmwnLPvyyRV/uaGQy5xL9Nde205vqp2JOVEIl6T4D+RqQ4ve26LlzlmhEZz3sxCNN9uE3Zy+QyMw+0CO1+FeAlIzlBqpA3pNezI4WoTfAPHTbgS+gSQ0w/BHR3MgVbT95TAFwsEsMtoi0pU06LdUijFEJrmAmQya0yDyV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6512007)(316002)(38100700002)(86362001)(83380400001)(31686004)(26005)(53546011)(55236004)(31696002)(36756003)(186003)(82960400001)(66556008)(2616005)(4326008)(6666004)(66476007)(66946007)(508600001)(8676002)(450100002)(6486002)(2906002)(6506007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDAydkN2cFZUUFFHRHU2UUtjemVENEFveXdpaWp1MnNib3pwMmFwTWtIQmY5?=
 =?utf-8?B?KzFSRXdGcm8yblI5dUQxQWIzNGNBcnV3NW94L0o0VHBKVk9wYTFEUXNDR05U?=
 =?utf-8?B?TCs5NzQ3OVBzY1NGbU9rK2xicDdndGNhM09aT0JDNW9FeHl6b3d0eUM3WDlk?=
 =?utf-8?B?S0l0UVR3dVNuOVlSYmljK2dIK083cWNCUEdDQU1uSW9pOXI5cmZJZVQzL2VR?=
 =?utf-8?B?NE5mc2l1TXlmWU8yeTlRKzNDV3M1dGlqdnIya0NoZFBFZ2VVSDZScjN2aW55?=
 =?utf-8?B?MmZWakZSRVpNeXUrNlI2ckFVa0g5SjlNdWUxblJYVlRhV2EvMHI5YjE2bnhn?=
 =?utf-8?B?aGtveTI2ZThGa1lhV2NPQ1lmb0xGMHJ1ckZmSDhJMEt1QVQ3a2Z2TjluYTRZ?=
 =?utf-8?B?Zk9BOEE3NEg3WDR6YUY1OHk3cUIzalFGUzdqZnBJTTVIemU3VE1QL21Oa0c2?=
 =?utf-8?B?RXJwR1F0L3R4Wm5rMzN2T1hsUXM0SkxSODBzYUcwRUlZV0hQNjFwRGVKam84?=
 =?utf-8?B?QlVJeWZWSm41SUk2UXpVZEdCTlFSWExWUFNLL2prcHhxeUFXVU5Fdnc2Sjg0?=
 =?utf-8?B?VTd6a1J4b0hsRWpCcVpOQTVwZ1VrcnUzaHZiOXdXT0MwY3k5emxEV1I1TE1j?=
 =?utf-8?B?TUs0cThzOXVGd1VBZkpoR3d4UHg0b0hBQi93YkhJckV2MTBEVGVkNlFzRHh6?=
 =?utf-8?B?dUVMS2JtUjFleU5jS25MU0FVSEtRazdRQUJTakZRb1RWK1ZaYVhPNytBWUVS?=
 =?utf-8?B?SEdnSHRoa3lzMFk1WksvZUpYcEhrV1V5ZFVzZlRhbGZRditYbWszTTc1WVZz?=
 =?utf-8?B?dVg3RmE0V1pJU3NHWks2OUpnc0xIZE5yREVZS254NlpVc3pucGVNMDBJRDBZ?=
 =?utf-8?B?OVBGQlg1ZHdIMEdZZUpvbHVQeVU5T2F2QUNkYWJUTXF2NWpDVmF2WmtVTm5p?=
 =?utf-8?B?UHZ4aTJYemUvL0p0b2tmT2RKODNxRmZNT2Y4OVVnZVlKS2IyUFBxQmcyc2Q3?=
 =?utf-8?B?UlBsTXh6RXZyeFh4NHNLMzR1WFVKbUFRTjk3VTNGYjlSRnpZTksxREQ5YVhw?=
 =?utf-8?B?V3gzbkZXWGY2ZkloeGg5QlFxcm81dkpBRmZnV01kajBoTWZSVGpHeGpIREJE?=
 =?utf-8?B?OFgyVGcwMEFXR0NoK1hST2phRTJIcGJJZXBZSlBXVVlLWFFWNXU2Tlg2YktP?=
 =?utf-8?B?UCtCOEo1OWxZN2RTblpjVWFVV0ZXV1dQR3dGcFBHYzIwYmxPNWRNY0JybEU1?=
 =?utf-8?B?T1JFRHI0dHZKcFowK3JzaDVYSnZJRkllMEtqaXYxU2dzLzRyZWdENjdkc2pU?=
 =?utf-8?B?bm43d1lDdDd1OGpQbi9uMGZ5MTZzUldvVDFRZkhrSFdWWjRkbUNIaE94dG1M?=
 =?utf-8?B?Tm5GZzVqWE1Rc3paa0FjQWU4dk9nRElVdHBGYngwRlBNMnlXd2trbklHWit0?=
 =?utf-8?B?SVZYY1A4R1IxM05rdEhlb3JkckFORkRoYk5oRVNJUWt3ellUOVNSRlhXSHA3?=
 =?utf-8?B?M1hnOENRMUVCVVlnaFhXNk8xZXUvbWFVNklKaXphenB5c0pCdjIwK3NYbE5t?=
 =?utf-8?B?cTJqM1V1dElRWHRld0ZaNU5mSEI1SDJ6Z3A5bFVibitpenpXOEpmeU9vZ2xY?=
 =?utf-8?B?S1RHVktVWDdQeVAxWFR1Y1BIRGdyN0VIKy96QkU4Um9rUW45YVJjVDRaVkNr?=
 =?utf-8?B?WUpXaU5zOVhtaENmcW4wVnd6cXVIVTNaMm96cWIxbldhdHZOL2tXaXRUcVdv?=
 =?utf-8?B?NlM2M09IblpLdHJLdzlFNGYySW95eGduV2lFS01TU1BvMUIzVElNT0NtbVRa?=
 =?utf-8?B?MDdIenlOZndrR09EeDhjM2phNmhJWDVUYjhabFp1MTZsakkyaXhQd3VRWHpp?=
 =?utf-8?B?OVoraWFzQzFIRDZlVDdIc2hjMXEzSFl2Q3VTd1FOSXgrTHNJTHBDaDFaOWI5?=
 =?utf-8?B?Um1JTGNEM1dDRWVFbTZOanY0VGVyVEcrU3IwUVhJUktuOFRqQ25RaU5xajdp?=
 =?utf-8?B?U2NNNm5JTXlNZVY4Q0VHeXhmbmJYSDRidk1nZ1dMS1JJYUlxaFJNMXF3UndZ?=
 =?utf-8?B?RDBaMDQ3WklOaXVRUUxWb0Y3bk1OR254a0JMU0lCOVFPZUMyNExKaXU5bVFi?=
 =?utf-8?B?QVhTNGIyeUFHQW95WXpWS0pqU05CZlhLTEZkTGdCZjVSbGNCTzZCTmluN1l0?=
 =?utf-8?B?bW1VaW93STFRUTdPTVBtczVpcldLQXlxSDhxQjdLWUl4NXl3R0lUMTl2ejUw?=
 =?utf-8?B?SHAxaDcyRjByR1Fob3BMaUtvMzR2R0tsWURFQ1VXTVM2TTVzSjBoVHlhWkN4?=
 =?utf-8?B?UytQUHlOUEVVcEZUbFdSRXlsQ2JYVHBZeC9zbVdNVUlmMk81cERUZW1MS1JX?=
 =?utf-8?Q?SEtjI9eO3wwJ5Xos=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 395febc4-11e7-4779-88a3-08da326e0e38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:15:49.5848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5dmMH2d8aBnLC7h1HRhF7khOQGUjS8Nw3MadKzVaHZUo9+k2EaGEERs8xPuzUYYPtX2w7VXPwCkWNL3gTKtEuue/3cZb1Sx8XoaOYSfh2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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
> v2: Handle NULL EDID pointer (Ville, CI)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 33 ++++++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5cc851f6d3b3..fc74159cd426 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5113,18 +5113,7 @@ int drm_av_sync_delay(struct drm_connector *connector,
>   }
>   EXPORT_SYMBOL(drm_av_sync_delay);
>   
> -/**
> - * drm_detect_hdmi_monitor - detect whether monitor is HDMI
> - * @edid: monitor EDID information
> - *
> - * Parse the CEA extension according to CEA-861-B.
> - *
> - * Drivers that have added the modes parsed from EDID to drm_display_info
> - * should use &drm_display_info.is_hdmi instead of calling this function.
> - *
> - * Return: True if the monitor is HDMI, false if not or unknown.
> - */
> -bool drm_detect_hdmi_monitor(const struct edid *edid)
> +static bool _drm_detect_hdmi_monitor(const struct drm_edid *drm_edid)
>   {
>   	const struct cea_db *db;
>   	struct cea_db_iter iter;
> @@ -5134,7 +5123,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
>   	 * Because HDMI identifier is in Vendor Specific Block,
>   	 * search it from all data blocks of CEA extension.
>   	 */
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_is_hdmi_vsdb(db)) {
>   			hdmi = true;
> @@ -5145,6 +5134,24 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
>   
>   	return hdmi;
>   }
> +
> +/**
> + * drm_detect_hdmi_monitor - detect whether monitor is HDMI
> + * @edid: monitor EDID information
> + *
> + * Parse the CEA extension according to CEA-861-B.
> + *
> + * Drivers that have added the modes parsed from EDID to drm_display_info
> + * should use &drm_display_info.is_hdmi instead of calling this function.
> + *
> + * Return: True if the monitor is HDMI, false if not or unknown.
> + */
> +bool drm_detect_hdmi_monitor(const struct edid *edid)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return _drm_detect_hdmi_monitor(drm_edid_legacy_init(&drm_edid, edid));
> +}
>   EXPORT_SYMBOL(drm_detect_hdmi_monitor);
>   
>   /**
