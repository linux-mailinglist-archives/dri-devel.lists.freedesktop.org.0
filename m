Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA80521049
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0E810EAFA;
	Tue, 10 May 2022 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F6010E9F9;
 Tue, 10 May 2022 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652173476; x=1683709476;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7JTA/YCMRk7SnWg9hOG8Fmvp/s4XrnZUh4wGX8pYRTc=;
 b=nBhpSIFMMkUKerQGJeKG+PAzpp34coCfsAkjwiyX27FUGX11MP18XiEK
 ZpkmBRknCuZhyyzCarUFjdZruV3AWlpzJL9MrcWaXH7+h1teQlzaOLj59
 uiaR0xW5iB11PROSLNR7bOUrpNDHvH/w/bgej3LxYJG2Gp1msh+8ZsrcO
 TQwwbCZSQ1ZrrvFNzqgt1fgJyZnTOAxIUmv2Sec4ucCNp6t/iaAf84sV9
 0lQ3hC7R7kffS061wGKaNy2pZIE13YaWl6N7vGjAjyOGVRfZ9ySzflc0J
 l1zw32sCn3zkv2xM6B+dFL//NN1i09Fl32afDLPQpesukH+fvDpdi3zEb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332348349"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="332348349"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="696989484"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2022 02:04:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:04:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:04:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:04:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:04:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvykWAGOSQYQDYCA4CB37g7vUsz1hKTVgJad48hKw4oaQjdW/16fxtepyVUZvFwMhv7yzcLw411StxsPdKoXFmYE68GSexLyOdJtTpsFj9sMCwzhr/TflKMT27a4NrGK/ht9WkXyZbSTboHcCGCVzsScTdCysUAqNSi2ih04koExx2Ugf5tXQZ+ZeskaASEc9KqaFSpX6CrynhYMhIMWE0C3iZmyrcKMaO3lHvuNrGwvXplNc6NXj8CwGTTXQ80+TRebMBSCSU9zOek7mwMCFTEfvxGDW++SveO1QuM6cxSOO7UO0gV3MS5KQQG32EGHesgxAB90KGA9u5Okx7BFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8arROFE8/GmJOwDSI5CnKRUIOllLaNy/cYf0skUU8w=;
 b=ddmYkLp4pTRcuGUe9rCIWZ38qdsFOCi6bhtTovOu9ma9H0eeZ+gltWt1eruER6gbbYp2txJj4jsk33UZSIoyFMN+nZceuiSb1eaWZw4xrnTfy51a0jWLPUU/5jqDrnQ0v77N8D9cfzlhPwy/C6Ei2V0VRWifetA4wiaMNmtu87nQmM3MOtHM0eH+dnIIyzDAn1b2I/9m132/ErOjmPxdZveokZCbOtR2FtgsnVYEUz57/iNZ3Tt6OHjHFuLHw3gVYbS37Zi4/pRemSgKCFmBzM+aHAL+1Kqa5GjFjca4ffE48F6fX7o3jRUPrb+Dt3KnZFMOoJjchbR1x+6CBcrMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN6PR11MB3200.namprd11.prod.outlook.com (2603:10b6:805:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 09:04:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:04:33 +0000
Message-ID: <1a8ea85c-5717-854c-26f3-0dc4ea1e2e71@intel.com>
Date: Tue, 10 May 2022 14:34:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 10/25] drm/edid: convert
 drm_dmt_modes_for_range() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <a8f393263225321e74f1e2884e81b3346d1adf20.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <a8f393263225321e74f1e2884e81b3346d1adf20.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2a6d80-1e22-4252-b6f8-08da3264192b
X-MS-TrafficTypeDiagnostic: SN6PR11MB3200:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB32009E84AC010AAE1946AE30CEC99@SN6PR11MB3200.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhjDY6z7ZcLpZo9Airy/og7FRIgbmpLCo6bp3RJqZRMkin+khlG770YMgL7t987Y8UPorSCmZPyJ42zuOp0+S7CucJaTQgPk74TQsBmLQmf0Alms2SbRhD6xNcu8zPMe3shOyfa6Qt7zwQd01P+nrQCFfcG7+ZNnS239lqPwyWY7qu2HiwnA0ixFvWGWQQAdCO4GBKMrsDIVRiwV29S46gbYeCXHywabbbLtB2OPNDyIInqt+Sm8PN+B229OXnNrREYxsw6GeDAGdcZm81VUQF9Q2PnVi9J04ZM9OIHhdYoomgc9ndIBjSvQow5Sk+OdXtWut0F1ljcTT4uN1KOpihRduHobgZ9UCYZWa3zf25mco8eM2Bu4Z9UDVcIwxoizdvWqnxWpiCxUKhkogfm50AXYC+7HDWgnI81mGkZIQfIXzYlsqu3UMvzqHCnOHADyvMiLy1zhiUoWonIjuVrZdLizCzV0ilwK1QzM1Z3UW6zN5haPKz0FbB+8Cdww4UWnD5O01zBHBbz9pZ5DqJxDKhlsno7uHhVJbifPKOxNxZWJ4K7IOW0HpCV+SerBr5v5hc/vZzJKcyuKydRgLFR4uWUreCRA7IW5afRVyxypEZo42IhH8Pe8miS538RllcPZSFFu04rM1MEBWDC1/LnRUL5BOpR/ryS4elLeW2pgpbybxK4/TJYdbpt6gu+JuBueR7N5Wp1GyWRDFBFIq3ZXECU80VGZFDoFkKgKXIwPsPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(31696002)(86362001)(6506007)(8936002)(6486002)(508600001)(5660300002)(53546011)(6666004)(55236004)(83380400001)(6512007)(38100700002)(26005)(82960400001)(2616005)(186003)(66556008)(66476007)(66946007)(316002)(450100002)(4326008)(36756003)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVRMY01rUHJESTRUeEkvbkp3SHcvTlRlQU1pUWlHYVYxS3Q0Q3hOMjExRlZJ?=
 =?utf-8?B?UW95ZXNCOGl5VDZTRjkrN0wyZ2JONnRDcW9NazRIeW8weDNyZERwaU5oY1BT?=
 =?utf-8?B?NkcxemJGaWJNTTcwdDBkWkdMSDd6VVhNWSsyV3Vuem1DWWlaSDRwR015UTNh?=
 =?utf-8?B?NlBlMVZubWxUSWtVUXRxZnJ1d3R0OWFlK05RZFMvdENhOWtWWHM1ajV2MlA4?=
 =?utf-8?B?c1VFZVcwaG1PU0dRUDM0U2N4WjhyRnNVcnlkT0g3Rk5qMmEwZXFOK0VvZndv?=
 =?utf-8?B?TEhwREFGV2dOb0hGcHZBK1VRTTRvTlpobXZJWW9jZ3czVlFrdHFvYjRxWGxp?=
 =?utf-8?B?VEU5QWxCSXd0NDRKaHd2VXMzcWlKMTRBR3loTWZuNzlhUnJFVEtmRUxHWWdt?=
 =?utf-8?B?cnBwWFFQRzZDeWJqODVNRitUd1kyZEloQ3hRMFB6bkRCcVpPdnV3ZmF6TTlS?=
 =?utf-8?B?VHNvU0pKdHBOc3RWaEx3MzRVY2VLUU9ZUTBlUjlta1VRL3o1VWxhVVh5SnV0?=
 =?utf-8?B?VzZnNEwvNkxxYTRIQldOc1RJblBUTDFuU3NEbzBZQXNkSXBVUEw2QU9pRUdl?=
 =?utf-8?B?R04xblZHamZjR1cvcG9MWnRWaXpObi9CZTQvZThVbDVleFhtckR6L1hPR3dr?=
 =?utf-8?B?RG0vL1JEMSsvNzRFeU5LQkNhaTg3dGNGWHYvZ25xRjhCbzdjQjJ4K1lPMjVX?=
 =?utf-8?B?dG9WWHF2OFlyTDNZZCsvekN0aFF0TFFnc1U2emkrNWJnd2VvOG9XOHFSODlR?=
 =?utf-8?B?Z0JjSEREd0p1eExnV2huT1lKQjRqWEpxUUwySCtJeXBIU0tSdTNzQWRPMkMx?=
 =?utf-8?B?TWdWdTQyRVRKc2pVSGxrWFBsMTNuYjkwc1ZFVG9DODFhcDFHQmdOS25NZXhx?=
 =?utf-8?B?d2V6V1dBVFZWTWNUcFhKY0xJTmZ6M000bzFESjFJVVFVcnpnVnJaN1RaeVhZ?=
 =?utf-8?B?TnhMK2ZxckNIK01ZNGFrMHdBcVFWTkhFSndSUVNUWmdJYXZWOWxkMkt6TEVt?=
 =?utf-8?B?U3BYVVJyUFA1ditDOWJYeHRwdUxiRWFZOWxlL1ZHWW4waHJkNXd5MmI3eDUz?=
 =?utf-8?B?bGMrd1JtcDErSk9tRnkvd1lvTmRYcTM2SXY1SEwvNytBdTlqRnJEcnhybXJG?=
 =?utf-8?B?d2kyaVRaTXhJZEFDbmdXd2hFM1VIZnNrc1RQZkYvWFkycVpQTWt0dTRQb0ph?=
 =?utf-8?B?Y0FHTVo0YWFLZnBHbjFYV2xRVjNhbVZCMDFjZ0w2MkFJTTM4emJVaUlRMC8v?=
 =?utf-8?B?NW9BUnJLdVpSclh4RDRDUmE4WXFoMS9NblY0TkhuUnBQUEFBUjJXQmdPbE9y?=
 =?utf-8?B?VUhpUTZFS0lFMy9JYkVtOGdJZVFtOUh1bUdsQkF1RG9jQjA2R0x3Z2w4cUZm?=
 =?utf-8?B?Y0JmeGRuSTBHQjRCREhFN2NnMVRlQXZwRExPZlJPbTZLN0FXVjFRaVZ2WjF4?=
 =?utf-8?B?aG9KbVgyYW9PVng1eXRBVzlFOEpEZFJMdElKNTY4SGFkMVU1ZjBLR2hqLzRo?=
 =?utf-8?B?QzhRaXVKcllZTzBkaTNmWER1cTB3b25pRDRDdXJ4T0FFODNIV1c5L29VUU44?=
 =?utf-8?B?eThTcEpYbmF0K1lyVldWRjIvanQvTitQNjk5WXhNN3RaOUxqdWlxTXNtbjFz?=
 =?utf-8?B?TG16bjRCZDRGRWlNRmtaVGNnUGJJcUlxcU5Kc1h4ZmplczBjZEZuMWJBdVp6?=
 =?utf-8?B?YkxET1BuYkpzUlZwZ1BVbW1RTkJhRkQ5OFVFWjVJYmVzcU1GRUVuc1NIQjJH?=
 =?utf-8?B?NFBOZHk0Uk8wVUdEcnRjekpMWitqWlFsK2VMYldHS09qL1FZaytwYy9ldkJz?=
 =?utf-8?B?UVFaT0NSdTRlT1FGNjh3U2FlSFVvUldVTGx3b0J1Q3RlYkhqR2pUQjQzYXNG?=
 =?utf-8?B?MGFsUnFRYVVZenZ0M2F3ckY5bytNakZoNUNkSjlPaEdHZmswazVOT3JObU8x?=
 =?utf-8?B?a1Yrd0VSU0JYN3NXMWIvWlVFSDBMMTEwMVB5blZqdmt2NjRlSDhaY1p3VnVq?=
 =?utf-8?B?QTRvY3NzVVlPdjdjZ0U3dnJYdkxUeDdUdkJNRVYvTisxcDM1eTlycDg4MHQ3?=
 =?utf-8?B?UHdMd0MwR0lXR2tUVVMvRlJOUml2RUJWU0VqRnNMUTNjS3JCS0xoUGxYR1BC?=
 =?utf-8?B?WHdnbldhRXduU0hjVm96V3NEdExHaGYrbDlzTkZDOVQrb0k3NXBiQkE3MGh1?=
 =?utf-8?B?MS9STTRhRk5QVTdYYjZ6eklzUTJUZkVnWWtZKzhtTTlzZkNLN2phNHphTTJO?=
 =?utf-8?B?MWZBZlN0ckNQbW5TeVErV1JUYjJwYlp2ZFYyamFCWURRSlVxZG5JL3FFUEdJ?=
 =?utf-8?B?VE5kSFYzVEZYeFkzSUNpL3NOY1FrQjkyaUIvOXdweE1NUHE1UzhxRnhvbmRv?=
 =?utf-8?Q?6q1/Fdz1r7mpAOIA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2a6d80-1e22-4252-b6f8-08da3264192b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:04:33.0978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Jop9ESaE+riP/vKBoRpoz+LDCIcW0oifzxwL9k7n8JRV6MU/vNe6pKKALNM+/5PoQgrgamKSNNxG6DbYrFo8l66PQGvEroe5luE8ZixDJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3200
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
> index 8acdb08a8571..5d8744a7b62e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3121,16 +3121,16 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
>   	return ok;
>   }
>   
> -static int
> -drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
> -			const struct detailed_timing *timing)
> +static int drm_dmt_modes_for_range(struct drm_connector *connector,
> +				   const struct drm_edid *drm_edid,
> +				   const struct detailed_timing *timing)
>   {
>   	int i, modes = 0;
>   	struct drm_display_mode *newmode;
>   	struct drm_device *dev = connector->dev;
>   
>   	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
> -		if (mode_in_range(drm_dmt_modes + i, edid, timing) &&
> +		if (mode_in_range(drm_dmt_modes + i, drm_edid->edid, timing) &&
>   		    valid_inferred_mode(connector, drm_dmt_modes + i)) {
>   			newmode = drm_mode_duplicate(dev, &drm_dmt_modes[i]);
>   			if (newmode) {
> @@ -3226,7 +3226,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   		return;
>   
>   	closure->modes += drm_dmt_modes_for_range(closure->connector,
> -						  closure->drm_edid->edid,
> +						  closure->drm_edid,
>   						  timing);
>   
>   	if (!version_greater(closure->drm_edid->edid, 1, 1))
