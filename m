Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812135211C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275D210F651;
	Tue, 10 May 2022 10:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA6B10F657;
 Tue, 10 May 2022 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652177298; x=1683713298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j/5JUxLKG0ED2xlS+NB6wOqe9Onb1OyiWfGnWncbJ4I=;
 b=LMkoeknuDAsSLgoFquBg29DcHX+/z6orDA6bXLFn9pv0l8qx+udYEsWU
 R7k0TgigEINNkE8u3J0YvL5MpikOZB1Q9TBZzJIixvqU8LGuK+xfK7AZ2
 riBjPkjv9+ziqZWK0VUS/PQ9tz7fWmXzKzFd5XKto4Exgd8O1ADEn3kKD
 9AEMyi65Pm2/YW4vnFP6QAnVLl3SQn6x+8HIBoJ3il/mLUqAbdgP7XWcG
 3GwoOHY+y9A6KR+Wcgd5wGGFeOhKDv4CujK/btVykq6lh4MV9kprUQdd/
 uVEzmGv5GxEWl4HaamvKmxom5hzWoqyzdGF45IlvnrUw/HoJHaojNhi3Z A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269464818"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="269464818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="602388804"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2022 03:08:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:08:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:08:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgLxZGfcRMYWwurgD+VJjxr08BWqrSB8lgtxhnWiXQu10vo6RaErVEbCkBLHM6ehrFBvNcD44BGV1Zlp36bQzOPNjcRahLi2xfsgvFDF7vRaLL/5UKk2F9270pVpf0skuhp97PyB46IyVFmqqbj0lU1l8fo+ACmvqKu6ZgSJ/mxP56nsutOKuGSIUp5S+VjQ2S0XORRRIWcK+VI4AruA03TkKyjYan1h7VaOgEvtkJbGPjImzwHFvm0jJBS9c6mKL49/zWpZJNynKD8+rbY0Oi7nqp83SqOZtdACUi/1sohOuLApFNQaZk1OtmSqQuv9O4AwEvutY8TFCtVWXqiXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeQbe+80YS+0Iywd5RpucmnPyJLXq5fIwTdfR++gNCY=;
 b=EpyrNlJvV+iFtq9NhokxDp85qVPeBgHZBGbLrivHcF3mGJr5v3VGZTNRBIbBLHqZvfPPxs8IXZYKL6yZ6dYwziCVTxHds9wAr5JJ1Uyrk/k291VpINZjABtydMyY3KL448IM6EjmtsfT/9nAjvkdb2E/JMO0aTEwq3xC8xg7jjPWvilf8I4Adxm9ZGD8pWhwvbGlDiIT74S+LmZf31YxLy3VeVgTMu1+NrIsOeqBmldgbZ/uSpbjCFPQHnmBqevTXafA4Y6iewr37hpxk6eHquFYY6lmL7v6w4GjYV9yphkZxceR9ePeSD6UBzdmmjJv7xA7kZMnZxaeTlKqF1zg3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY4PR11MB1768.namprd11.prod.outlook.com (2603:10b6:903:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 10:08:14 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:08:14 +0000
Message-ID: <6d42a5f9-c813-088d-1748-127e1b92a290@intel.com>
Date: Tue, 10 May 2022 15:38:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 18/25] drm/edid: add drm_edid helper for
 drm_edid_to_speaker_allocation()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <770d095c93274969c4b86480e07044e16a7b5760.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <770d095c93274969c4b86480e07044e16a7b5760.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa296438-0687-4d24-f4bd-08da326cfece
X-MS-TrafficTypeDiagnostic: CY4PR11MB1768:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB17684F0661F2060AB3C4F443CEC99@CY4PR11MB1768.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhEzZXkq0Wwk5PZfLzJy9s81Z9f4G4yB/eJWsCzquFfWRmyI5Z15JvUIwlm3kYmIMfzZRzKkrHrEpMKxpWAyx42agGxcbPVnXLtCrhSmddGRpkLBK0V6dmpUJoaxsJcZ7ahJJEVVgVQZTQxnSseXQ56DA+z2BogPwiys6IfARsNrEfAjE3RD0iqI2Kjx7bS/YyyK/2JjF87p1OfZeheiKMQKmdQgXZKUxBjDdoYzWDljhC1q95wqYVaclhvevKlkxwhKVtq3p3nZHCzi/wJg2ULczLeoAl9FzELmTZVeR2dDozqBllWRjSfK64xYeLO16JJGbTPA7sviAL6SKvuerssaPHRwSJy1MWfYGznAAvOENax8iX5qdpN8W9poaC/AJggkCi76bxenICNjO9Eyoch98tJaMUk7BzhqjK5KV+zG/3I7ySZlZkwJhG9vB8L9IQlSbhD0U35+VWsK40zzD/bYxwZ0FRhfxcaZaePodWOh+tyV77JXhq8mS5BADnxgWKhVF4s/WrWzvBh+mlBvvbSk0PP+7wuM2eIxNuPMS3yQUzEqvGnAHBW5P7s3VpoSfrwwFvfiNbZRT4DavqMlN5BoglKhw7zyN53tfD9Z9foy6n3WceDLHEaBDfcXhYVTQxG824ad40kxLKfCJoXBZYd3wAT56jk+n+3fSMajaCNdxg4yO+xlsQvOIhMdQVyrjfHQlwptujST8NmyM8oqpgM+deLA+fZnoJKy5Sgi45U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(508600001)(66946007)(8676002)(82960400001)(31696002)(66476007)(66556008)(86362001)(4326008)(450100002)(316002)(2616005)(6512007)(38100700002)(6666004)(31686004)(5660300002)(26005)(6506007)(55236004)(53546011)(186003)(2906002)(83380400001)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Myd2RKMjYxUEEySGNZMmYvMlE3TnI2NTRRVWpqUW9Ha1pmaE9IWTVRVVp1?=
 =?utf-8?B?cnBiaHYxQmtEN3FMbGUvb2txUEFBdStEaXV1M2NLalpLVnp1WVQvN3JOYS83?=
 =?utf-8?B?TWpuLzNJby83M0cxMldSZWUvcVExcnhsd3hMLzZWM1lsdWlQRmNKSkwzOFJF?=
 =?utf-8?B?WmxGTUpXNWROZnpDTVdIUGJGeEF0emhmV1g2Z2E5eGpJT1YzMWQyM0MrK2hv?=
 =?utf-8?B?cnc2YmkyU3pKZExUK09JcDBJWXFyNktkbDFhZ3ZHQU5jV0l5SjFUQXZlRFRX?=
 =?utf-8?B?NHhETlR5UmFZa2dVd0ZBUXVQenU3QVp5RDlUZ0U4Sm13UURhdmtyR0FEQzE5?=
 =?utf-8?B?ejhLWEpiVE9Ic0o4dVorREZ6RlU0TUNxQXNvcnUyTDVQVUZUVFhhdnVHL3ZY?=
 =?utf-8?B?L2VZUDlaWkRxdlcyaU1aYTRrRUllbVU2a3dtaTdwT1poU09RKzRYL3FYVXNm?=
 =?utf-8?B?SWtDTTJXcCtzbXRxbFhpTzk0WS9CSVdIMU5PQkdObHBXSjNhSG9QSTBpbzBI?=
 =?utf-8?B?TVc5b1VvS3ZEMUp2bnR1ODhKTWc1ZHNBWnl6L3NCUEdXNmNXWXFncWhzUERZ?=
 =?utf-8?B?NTJjNTF0Y2RlSXhaNkhsY1prN081UXVnOUdFZTF5VEVZaUZUaEgwQkEwUCty?=
 =?utf-8?B?dHoydlRvSk5oaGdZUlJ3OTNESXk0M2xuL3pVUkFDQmx0clB4UnlsUHpDcmJM?=
 =?utf-8?B?cDNLN0ZNTUVMVTh6SnE0Z2FvZDBnZ0tacXRTY0NDdnJCcmlEcmgraDZ4QXJ5?=
 =?utf-8?B?SjBmNll0bmRkU0dxdkM1d2tpR0tYOW9XcjVPZkk4QVlraDd1M2xLZFF4djFM?=
 =?utf-8?B?a05GM0NKVERlM2JMSlpoaUZrTmV0SzhYUmg4S0xpc1ErZDVVZ2FQVktZMERn?=
 =?utf-8?B?NmROSVZ0VDhLLzZKKytWWlZYZkxxcGtsL0FoQ1dyWmgyUDV4dDFpK0NndXhl?=
 =?utf-8?B?WUlIM0tIczNNOEs2SXljenl0ZE5CMnM1UzV6QUFyMTdYd1BLeGZzVG5MQzZL?=
 =?utf-8?B?eHorR0VmRFAwT3RkL3FpMDd0cmJ4WDFFZVlkM3Q3TUNaZFcvdytHbEVaT00x?=
 =?utf-8?B?WENkbUFZUkxwYWp6cFhLR1l0RlFHN2dJMkQrdjZuYlBPbnJLUzRlY29ORU9n?=
 =?utf-8?B?bEk3c2lrMHBkNHViaWp2WmJybmZjR2ZHdWZVd1pQSVpTVVhVVHVvSWtUekUx?=
 =?utf-8?B?bFdLUE5KOUIvSWRWWHpINTBoTTZRNGt6NUpxRnFWeXpoMGpQQnhWcDM5Smxn?=
 =?utf-8?B?NG5Wb1hlUUI2b3JvTm1aTXRUMVAzNUZydUlCQmNyZU9Jc29MQnNDRklUMkdv?=
 =?utf-8?B?YkwyMllpZXRCS0lkd3ZkOUJJS0hhOU52UHRBRzF1TlpGUmdiZzBmTHRxR0Q2?=
 =?utf-8?B?L0d3aWRqMUpTSG9rS2FPc3ZwMDlPc1BObGMySGE3UlhTVitPT2ZTWWxIV0Mx?=
 =?utf-8?B?em9GN3RHLzA1V0RUM2NmYmI3VlNZRzdNQzhxTDVPc0VpWFdaZCs2NCt5b0Vh?=
 =?utf-8?B?cHVveFlFU2hOVUppd0tka1d5U3FuZlJsL2svVEp1NWRmblVOOENyZTdtT0tQ?=
 =?utf-8?B?eTdPYmFpajg1VEZqRnVGTVArTk40Ly8zdUdNL2ZoVHRmejZyUHB0MDIydEJj?=
 =?utf-8?B?QUgxMzRDd20rKy9xaWM4T0JRZFd0RXNYMlA4WXZWWjM1RndyYUFZL2JqQXVL?=
 =?utf-8?B?MjR0M216THdDSW85K2VaaWlUalV6ekNMMEF5cjE0ODdzMUVxVkpFbkxvb09C?=
 =?utf-8?B?OG4rNWVwVVFDbmRmZGlCM09ZSG9pYjBabXk4RW1FSi9tV3A3L2pqWFJwZktm?=
 =?utf-8?B?Vlc0MVpaeUJvUXFoZUtxbjRsRC9wNEs3YTBwOGhVN2lJNGVUWmZWWXdVMlpv?=
 =?utf-8?B?bjI5T25DK2F1eGllSmNzNitFVENWLzk1QVNnNUc5ZGxYdDlBMDJ4OUlFSFlI?=
 =?utf-8?B?Q2xoMTFTUmlQOG5IT0xWVFNvczcrVkExVEpXQnhJWGtEVlgxeXorWWYvMk9H?=
 =?utf-8?B?aWEyK2U4MVUzZEhHTVo3U2lZcW44L2xibFFpVDRHUVN4dkNsbnlKT0FOWWwx?=
 =?utf-8?B?WGJsalhpaU4vcmRIaERpN2tQRFkyQXlTai92b1dlaUZmZVgzN0dmclRrcG9V?=
 =?utf-8?B?UXpISU04Q1RNdUMwN3FJcHNFK0NBRHE0ZGNPNVZtNmtTR2dDMkJaZmd6U3U0?=
 =?utf-8?B?b1c4dmhpZnNFd0JhT2N1Zys5eVpyZ2VPYkplTlhTZHJnWFZQOEtadXpkRFcr?=
 =?utf-8?B?RGI0ejlIWkRZb1hOWFQ2UkQrT3Qwa0pvMEVhaXpJdXFKTlBadkRFWlJwd21S?=
 =?utf-8?B?cVB4Y1JVMUdxbFhsdWk4OExXR25LLytUWlZTdlpEdldCczNvU2s2REVtR2Q0?=
 =?utf-8?Q?Nza2Vptdh7uBo7n8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa296438-0687-4d24-f4bd-08da326cfece
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:08:14.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkl0v2D9iwXhkp5YCTuDHvoof6ZOOorOR/3T0igG/xKCfra8Yb1IkKyZWHczI3xYA9E7SNPbg0Jk+2w+D3rMoK8Ed1n7Vi8ZpTe887pZ3SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1768
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

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.'
>
> v2: Handle NULL EDID pointer (Ville, CI)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index dee09359bbc3..5cc851f6d3b3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5025,25 +5025,14 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
>   }
>   EXPORT_SYMBOL(drm_edid_to_sad);
>   
> -/**
> - * drm_edid_to_speaker_allocation - extracts Speaker Allocation Data Blocks from EDID
> - * @edid: EDID to parse
> - * @sadb: pointer to the speaker block
> - *
> - * Looks for CEA EDID block and extracts the Speaker Allocation Data Block from it.
> - *
> - * Note: The returned pointer needs to be freed using kfree().
> - *
> - * Return: The number of found Speaker Allocation Blocks or negative number on
> - * error.
> - */
> -int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
> +static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
> +					   u8 **sadb)
>   {
>   	const struct cea_db *db;
>   	struct cea_db_iter iter;
>   	int count = 0;
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
>   		    cea_db_payload_len(db) == 3) {
> @@ -5061,6 +5050,26 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
>   
>   	return count;
>   }
> +
> +/**
> + * drm_edid_to_speaker_allocation - extracts Speaker Allocation Data Blocks from EDID
> + * @edid: EDID to parse
> + * @sadb: pointer to the speaker block
> + *
> + * Looks for CEA EDID block and extracts the Speaker Allocation Data Block from it.
> + *
> + * Note: The returned pointer needs to be freed using kfree().
> + *
> + * Return: The number of found Speaker Allocation Blocks or negative number on
> + * error.
> + */
> +int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return _drm_edid_to_speaker_allocation(drm_edid_legacy_init(&drm_edid, edid),
> +					       sadb);
> +}
>   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
>   
>   /**
