Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978C521237
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B4510E06D;
	Tue, 10 May 2022 10:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C816910E06D;
 Tue, 10 May 2022 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652178514; x=1683714514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cPszRLaSj1vJMUxIHw/ovmchCXYt5uzdjLRIRpKak+I=;
 b=B8GbzrQBmdOOkDIyPHYH98cBzBUMbL6FZo2o3lD6mb7uj/RTe+v0yNf+
 9ubWm7VAc2GOC0BB4+gz5PRVCDcuS2u4/kIpMapYC28sw4M6JpwDnAcop
 s/1FgvC0jp4DRR6GCWDDu2+DtL0T137klnONXrxurqd/1PKQs1dZxUQwn
 Tj+o9Oa/IdjfZzmdk+0rALp099YijO+1iP35Qv+CWdfxkH20NK4UjOyou
 LwWj4pQlMxRAczKVFZj4PwIJf+qWS8HvTsrPCZ2TR1raXsnwkmi8R+SLv
 wsd6Gy1mvCCNpBTPfIh7W4wsRWmkGnOKncYx7VAWlz7twhIz0ZBEMZ7Lb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251376258"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="251376258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593430218"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2022 03:28:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:28:33 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:28:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:28:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8IUkvdHiHWjYEKH/1grcLmIBF6AU4usyhygMXKl9wmJ8vILJH3cZY7J76kuxeRJqeHWFxGKZ3L6abo8WQglrHJWdeXkkhFx62ny17lKN55p59EPLkgEXSRKo1b8Fme8ptlhqGL/mke3T3xawpb2lE1ZQxc+uZn+df74iKSPRgJkhXizAwVYkz0wT9YQuDAGu3BlRQjGwM0zel3VfHL7aSmHH5b1OPUnfHXU4qZlZ/k5J04oC281ckSRMcnyKiviNuyRzrc7jceyAqSZYuHGqY7iL29CVf35HTtybleHZAcDD74s9taVFrUvsq68dLN89E0OFraHXouPPRh18ykV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/KjraZqHk8lXP2s58KVVJAWchRZu8SfVJe0VtPMERQ=;
 b=AuMfOz9fBRLkhaOWlyIXSiVme1+jBrCdU3GpEZ/fkSGvE4fPFrLf1rKQHOEiCyBirqKMeld9ozelflU5H6YBL1Ive4uw7bn2DFvXEooPN6rCwMRXjC/2Scq1ojo4IcGme/QpjtPZwHjVlg4NmJVvcFfcP7Arr8oPTESZ4dlOL1fO2U3gIA6kLm/VWG+2RXHf0UkhHy827YTR0PGzFrzRuPFa+IGwMs3BgzQkrWrSjOwy4YCdhMdC4FySGAhr226ckLPfW4g6xTpGMDp4tPpXWGb0B9q6OHIk7LiZZKIVM8utZAq34xaKZKxDpQXIv6VrVkzXFyBhvilrsFE/836YIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BY5PR11MB4321.namprd11.prod.outlook.com (2603:10b6:a03:1bf::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 10:28:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:28:31 +0000
Message-ID: <0aa1efee-17b6-8a54-1533-39f09f8cd1d3@intel.com>
Date: Tue, 10 May 2022 15:58:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 23/25] drm/edid: add drm_edid helper for
 drm_update_tile_info()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <5b36683b656446a4d9a172d4dca1cf9aca08a48b.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <5b36683b656446a4d9a172d4dca1cf9aca08a48b.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc8d14df-7bbf-4bde-4391-08da326fd46f
X-MS-TrafficTypeDiagnostic: BY5PR11MB4321:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB432173D156348D62701E3C71CEC99@BY5PR11MB4321.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7KzFx7AamBtInBoLDe3kQL7BRg5qllOQYPoz5yNhEKIDT4rZza5RG++E6Pv/GAc3Wp5K/VcD5V+rHvAVrSPwPSdv0WvWFRcVD3rUtKg1pKgJ3z81A6DVVzdK/6RG9Gu23mibRc31jdtoFwa5YPQzI8xSC98KB4hj2rbXkbGjut0waSkFN0PFyG3hndVRJ/rj/60ndt9ZPXThsm+07o2jx4rusTcEuqmwTVJiEfywKt/CcCzgYv/fDgZWbuJlo9jZBL7EzcWBlnuSHR/8Pm3iKMRvNdEp9MvFdRvKxoQ4lKxxeDSMHfzCM3UgRFAYQ9WH7KFBKEl+BweUZGku+7kwp3s+oGOaTrPNkcs7GgG3lfzdGrZz3d+dHNlo53q02i+0KKhGRjHxVzSeGWjcGAhUKt6wpKuTX3gv9gYKutzOKPdcj9AJuq8I9b0PgX3K2Euaa8DNVX/5ruuT6veaNplqMvMCveTj05RkDpEUGwu9twvfWfRuricc5wjhycl5kbZQ5AqeGxc5V/o+CIwWcgBoY7k6reQ3anNnyVhZSk0qkfBIrGdC/rEH3PhxmnBWvhDqdAS1/USMS/IkkhT7/C9BHQfQup8H52THRUe64dyulQf0rTJQo9jSBImiKxTUcw1AYDpE1+Qf5LtOmIJcOMG3XZG85BTV2yweUEv9ap6TU8uLdoTDi0r9GQtBWeHI2cO33bn9dkeoA0jYYKCzkBSwc7oJgf1tQ5Os47vi93J2cE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(26005)(186003)(2616005)(66476007)(66556008)(66946007)(8676002)(450100002)(31686004)(4326008)(36756003)(5660300002)(2906002)(316002)(8936002)(82960400001)(31696002)(38100700002)(6666004)(508600001)(6486002)(6506007)(55236004)(53546011)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFaU3NFMlRXdllJTG5mRzNMWTJQYjN0UTVucERkemFPNlhOaW9yTFNhYVBa?=
 =?utf-8?B?dldjNEVaWW5nY24zZWljNnZ6Q0ZMN1IxbjVsN05nb0FOcm1NVHcyNStGQ1I5?=
 =?utf-8?B?dlRiSUE4dkpsU1FnMnJ6UC9rY3ErY1lxdk1SdS9RRzdYelRYaUQ1N1Z6d2tq?=
 =?utf-8?B?UHoxYml4Mjg0WWlDeHJzYXdhNzZUVVNBSzNmUFVWbkZ6NzhzMjhpeGF1d2dU?=
 =?utf-8?B?TjNmRjVwOGZNbjl1dEpVK0owZVNaQ21nUjhycVpVMlBNaXBXL0VWUW13bEFV?=
 =?utf-8?B?a1pISk1YdjNPRDNPMWJ1U3ZXU2hNR245TVU5ckJ1TE9KeVYvNlViQUtzUUk0?=
 =?utf-8?B?MjRHOEpKSjA3dmd2RFRtQllEcUFycFVNclIvZnNUWDJzakdiMVpTQnk4TGFE?=
 =?utf-8?B?SDU4d3RDSXVDNkJrZlhwR0dSYkU1N0ZySjhBTVd0YlJhY0NMVGVoWWw5ZnBG?=
 =?utf-8?B?NVN4QWVYdWpXMmZSSmdSZ2p1Zkc4M0VOV0puMVIzWEkxcFdjc092WmRKbnd3?=
 =?utf-8?B?dTlkOEd3a0trRXpMamtUYzM3T2hSNGhMQ1NISWwvQmUyRnljakgybU1LYUZy?=
 =?utf-8?B?bVhiR3RYY21hNzVrVWtTYXErRXZpSnlFVytQeHI5ci9XQk9tL1Uya1RsYzND?=
 =?utf-8?B?RDlTdjR5Z2NPM1lKQkhMeW9JVWhKODVtaG1WdFcxeFFkS29tcUhnZElwM2JK?=
 =?utf-8?B?U3JKeFJPOUZEeWN1V3pFQlNxSFRtWUZwTjhEMkVCU2lXbXhUTEYzSDc1dzNT?=
 =?utf-8?B?M0FYTmRYalRXQ20zZEF0UUwzMEl4UjRwMmVsZjVob1ZDYWNZSHJuUjZOQTdn?=
 =?utf-8?B?YVp2UjBsdFBwWnljYTA0UDNkVEFwKzYzbVZJQktiMlVUZjh5M1dFYVJ4OFVk?=
 =?utf-8?B?VzdBTjNtbVBCSWl2b25ZMkNicE9UMitnM3pmY3QwdFZIby9rUHZEWGZXL1hB?=
 =?utf-8?B?WU81T1ZVN3JwZUJ2aEFSSzdRd0VaNUQ3Zkp6WnYwbXA3aWR1a3VTaHpLN2wr?=
 =?utf-8?B?TDk2a0FhM1JBdVpHZllPUjlxQ05hWU1MWFJPak5NSkdHVzU4MDRxTTd0VjFB?=
 =?utf-8?B?ZlZDM09wcjNEazJtTjNpMG4xdXBwMjdQWE5LZU45ditrMXRHUlBxVllBRGdD?=
 =?utf-8?B?MHZETDRaSHdrZzBURTlxbW9tc2lTL3dWMUF5YWZzY213Qm9pL1pPSWZaMTR6?=
 =?utf-8?B?QXNHdmpTQ21WZVpnY0ZySGtoS01Bd3hzSjlsV2lFamxmS1RzR09WSG9XK1FH?=
 =?utf-8?B?eWZ5aWliQ0Z1Rno2N0dBeUZ1WFF2cmp6NlMzMHJlYXN2VE01VzZoMWdIOXkr?=
 =?utf-8?B?OFZOWkk3SDJjS3JwczRydEJNcmtNQzFXVDFWS0o0QUdMKzVwVlUvbVZjNUtL?=
 =?utf-8?B?NCs1UkpxQmhuaWhDZ0VodExYaU4vZnY1TUhvOFVKVkVjWE0yVTEwcFEwcFV6?=
 =?utf-8?B?Nzd3c2llSXplZGVKRlJGRjZ4V0U1eXhKczVjVkoweU5lL3lsQXp0c09yMTJ6?=
 =?utf-8?B?d2hVOUx4eVJKU3ZHb0VDWjhBOHlvR0l5UW4rdWEyZzNiRUlPVldJekh0dDRa?=
 =?utf-8?B?cnlWSkttZ1JXd3lKcFlxVmI0b3lXVGRXOFNVR1cvckllOVlTYXdDbnAvNjRG?=
 =?utf-8?B?TGdVQ2pseDlLanc0a0p5UElIMHhzeWYySVpody9LTVN2OHZ3V1R0QUNQVDZX?=
 =?utf-8?B?aUFEQ2h5SkRVNGVaMW5nTWhJMnlWSy8zelBmdDVIbWs3dkcvR3ZkNi9rUk9y?=
 =?utf-8?B?Tk1OV2RtYmhuSHdiellPQU41QjZQL2FmblhQa2hUcmxoMXdDcGZKTXBvMTZs?=
 =?utf-8?B?aE55c3UrcmlUb2VtZkxBWnhyRzA1WW5sMHc5b3NmdmF3NlBOb3dNTDdjM3VR?=
 =?utf-8?B?YlRqalh1ZGRtYUdmcDc4Ny9nOXVuREUxenZ3Z3dKSnlxNVFkdFBud2o2bVA0?=
 =?utf-8?B?ZmV2Y2hKelNQKzlyN0VYcG9TdUhNSlpCazFMSVIvOEQ3aGJiVkpqd2x6V0dz?=
 =?utf-8?B?b04zVmpveVg3WkZrU3F0WXNxVTFSTHA4L2VmaHQ4OHY2b29SLzMzdEpTRXlP?=
 =?utf-8?B?TE9RdEhnZW9oNXQ0K1RXYndldEVaV1B5WGVBQytneUVpUHBqWGVRcDFUWVJa?=
 =?utf-8?B?cjVVSmVrNU9zYWtML050Z090VTZyY1c2M0FZTVhFUThIekdEVERKSHU3Qkhw?=
 =?utf-8?B?RUdocm10bzBRVTRWVU1WaVVNeE9hc2QxMVFYeXRsSStRUC82amVXRFFlUDNp?=
 =?utf-8?B?SEpOTHR5YllrTGw2SmpCY3o0eVFFdmNHMXlxVkN3YmZyNXRQdTZ3NTA3VmNM?=
 =?utf-8?B?Zm04eG02NSswSkUza2tBYmlqcnZNdHFiRW9zcWwzT1dSWFkvYVJrRVlSOFZB?=
 =?utf-8?Q?6A5y9akVs8FRtRVo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8d14df-7bbf-4bde-4391-08da326fd46f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:28:31.6134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gnqw4dWl+bhDQOti9WEIO8jlEvK95OAbo2Fmx080HY8AtOdD6TDJJXYt4PfFfOCIi/B/J1bWStpe90KFCr0PZaYODlm2xxKOtSN3CRghnN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4321
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
>   drivers/gpu/drm/drm_edid.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d857d1d74c82..26ac4d262e31 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6364,15 +6364,15 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
>   	}
>   }
>   
> -void drm_update_tile_info(struct drm_connector *connector,
> -			  const struct edid *edid)
> +static void _drm_update_tile_info(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid)
>   {
>   	const struct displayid_block *block;
>   	struct displayid_iter iter;
>   
>   	connector->has_tile = false;
>   
> -	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
>   			drm_parse_tiled_block(connector, block);
> @@ -6384,3 +6384,11 @@ void drm_update_tile_info(struct drm_connector *connector,
>   		connector->tile_group = NULL;
>   	}
>   }
> +
> +void drm_update_tile_info(struct drm_connector *connector,
> +			  const struct edid *edid)
> +{
> +	struct drm_edid drm_edid;
> +
> +	_drm_update_tile_info(connector, drm_edid_legacy_init(&drm_edid, edid));
> +}
