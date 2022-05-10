Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FF521216
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850210F6CE;
	Tue, 10 May 2022 10:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2343A10F6D5;
 Tue, 10 May 2022 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652178087; x=1683714087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LAYZpD1Gb5OGbrPLjqtB5Etvm5CDLIxhMg/SyWB6M5E=;
 b=T2W4LrofdDfZSPbquEfABAEWXi8Njnj5GMK4BH8bTik/r+q620+zwkai
 3HFD6F7c68aEtrGcJqJBkEsKITR3s6qS1467IO3k7QFjO+xIrVUTqH1+l
 6Y8bxuy5TEr+z2lqmkuIcEtl2DV3tx805/WOtKH8wTXAXD+Af/9oKkx/4
 /sYqQaOMVX6b5NOaFDkuMxS0f9QMaPNXSmVpdx9JorGy5R1DbaFRz/8LL
 H0qp/oImOIOoGRXRgaHEzhs1Cjt+dIJC/9uqFPIndU4Hh+CXuSgW5HlCU
 l3CRZuCJTs9aAKsHmtNWhRkOD2+yiBjtH4lyc/ObT4zU5zQYeZk2IetEa Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294561066"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="294561066"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="565581585"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2022 03:21:26 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:21:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:21:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:21:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1cDm5I0SvQz+spO6QYL1lEmUq3vaZQhJcgZh4MrkyULA4LL2HG8b52W4v6xGhvbRxfJqqeTKfQ7UtUFpKKvwd4nsbhiwoSTr4Ck/5MLh6OhzUW34tE0UEppqqwJkrvUAZTYw0QuWxLT00A2C4ZsXIUsZx5XvRHi5BjpdwLVhFbqFP3McGIt6DZp6N7rwjMWG9enp9GTj5f9xlzWyQA5X8R8qA1G9W6YHIOrlKnBiO0JIfn0I2LgwFEw8fK0Nbbs3qZt/LpU9CQUkVWunIJ5TnCxSRxhDqY4Ou2UX/RKIeO6BSPFY+SjqgtnNb0/BqHnFRhrj0Y4o26jcRmA1QTuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tWcPtm6KtCDvI0YevBCsdR19jvKGT/NtTe6/81gsyk=;
 b=Z2CtQq81tjynGWLFctO8DWaJODQksePL4TP/cWOHs71JVlVmqVU6fkTa0wOxspam/M/1sTs/JQuYOsHssFK/MLH3IcrhgRlA+62Y7bbO6+h0e2v78Z4t1gTnpVX0xnarzmWkN3z3Nup2ctDFwpq4EgE+RhzKlWTRnvXI9OyTPGNd1cbe3FzSYqXvosdc6aizLNxQz9ZbdL/9bSoq5F82KcxVjctYnMpUUsX0ZKZ+IvbiaeaEGT286l0b38qN4b3mIr6LbaQx4ewH2t6aP20bTqISQFvjb2CMREjxBS6qVHOYDamfywsCGPkCRchzSwhUyaKHolbEu6i7Nt6GnEzoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5737.namprd11.prod.outlook.com (2603:10b6:610:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 10:21:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:21:24 +0000
Message-ID: <dc8beae7-ca5c-6442-944d-b31fedd5af68@intel.com>
Date: Tue, 10 May 2022 15:51:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 21/25] drm/edid: convert cea_db_iter_edid_begin() to
 drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <7d9f060815086e1e4ea037dbfb9fd8ad54d1f25e.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <7d9f060815086e1e4ea037dbfb9fd8ad54d1f25e.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7836ca5-46ab-4879-7bea-08da326ed59e
X-MS-TrafficTypeDiagnostic: CH0PR11MB5737:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH0PR11MB5737456791F5AFF6593FF2B8CEC99@CH0PR11MB5737.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj2o89vlneK3h1uvOKwuVyY9WjkU85Z2vfdj1qBCFGAfmuPm8ih8RpUh5wUq9A1w2m1BZiTTfAHylJ62XKVTRFfFE/fMK4032RTZ6Sz+b7/ctrO7NTE2k+6x4f9PZKt5aA2fMDBDoLcpYSbb3/IyBi6kQCeKvSohT3h1Ogz23lP4WzC7hcZYyhe/9TFOg278TAaD17H7n9bADPwIPK4pvcB/w2d9HopswV0c+T8/Bx6xQwaAcz13DSm1eRl+zJ/fgEbptlB/xDbMOR94FTBLVOVdPonMRqaWihnxVPwNwJxd8B+5scDI/wmwEL9epg568ta6PvrWnMDNQziqb1FSptwqe23oodzoMszp/En7sF+lBC+aYHWblFGnov4oFBhp8mNY1Y/p3hc2FoJvJuxOYi3o5xvhqcEFzMsbwDv+kcUEW51vZd2/rksS7B/REARd7YsDSr1u9H2iilWZ5O/vLpbMVZOeohOiY9g9IsJVYEjaU/f8WdWtewxpW2eQw77KMqiUEg7JonluGYypbmGUh44sQ1YpZ4C7hGiaf8J1nlSRfcVT8mp5ECPYc1W+gybLzQWAqJPoTLMIdPDGF7ermvP/0omCKFFqLbh4BWIGhDOOdrQg70/qDyCzwOrQAoR8vKxjb4x1ImQCe0TwuTFwYjmLYNR0jex/B9ko3t3G/kvhOVaJFC/BkU7SxDRZhTrlNcZvnE6Pmw2Z4xaPsf7tlGDmS5oUvP6DLB2apoWccY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(8676002)(4326008)(6512007)(31696002)(2616005)(82960400001)(26005)(55236004)(6506007)(53546011)(6666004)(2906002)(6486002)(83380400001)(316002)(5660300002)(8936002)(38100700002)(508600001)(186003)(31686004)(36756003)(66946007)(66476007)(450100002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZ5ek1pa0tMdXZMNFpJTDExR1R2ZGtWdUZZcExVQndXTy9kTkJ3VHMzTk9M?=
 =?utf-8?B?eHVURVNVaHA0VEtaZWlDMWttcmp3ZXN1TC9tTXl5azlFb1Zpa3V1a0FZaDhJ?=
 =?utf-8?B?SE1LZXZ0YkFxVWsrL1BDNDRwQUFSZVl2Y3UxRzc1dENiRE9sMjcyRmlhYkZr?=
 =?utf-8?B?cXIrYnJlSEpzaHVPQTU4Z2k2RkFBQXRCb3lFeWszMDRYTnRpdDBGYWJaVTFU?=
 =?utf-8?B?eTBYV3hvaGxjTjZHa0ZwMnc5YjQwQzlQb1pyRlNtNkVrMDFRVW4zZVVkNlVs?=
 =?utf-8?B?QXE4N3pWYjFFbE0yb3BhVkRPTTE2cTlDcVQwMzRlWFc0cTE2bVcxakdyVTNG?=
 =?utf-8?B?SnZ6Y0ZNaXRyWTRNZjFZRVd3Z2NIc0Y2b1RtTVV3SUY5UUwxWXl3TXRkQ2ds?=
 =?utf-8?B?aWRVS1pJSkxuMEw2dTM3L3RwOGpWbzhDelJsMzhEbzRmTGtycDBxa0lwMzVq?=
 =?utf-8?B?NkhxR21jai9mcEp5Q2hWbmY4YTdRK0xPSkNtNy9RVHdRQ1ZXSEM4UzZTRVIz?=
 =?utf-8?B?RzhtVFhLck1aNFZGWEdWcFp6cCtzQUtSWlRqbytuNnl2UzFNd2s5azQyTU83?=
 =?utf-8?B?Tk96SWVkcmRHclB5dytHRDFMOFZwWlBnSERvRE5tTTBiSHNPS3YvQzFUQ0dx?=
 =?utf-8?B?Q1RibXZ3Sm1ZdTBGOGc5cVdrM3p4OXUxMmlQRE96dStYb2grS29PaTB5dDE0?=
 =?utf-8?B?dWhoWUdhZjJhc2JJYldLSU16QU1ZVHp3UkVTYjl0K0FmNEtrdEtpTGY4eTBo?=
 =?utf-8?B?aEFKRklMRStmUFhDeTlrVzBabGttc0xMS0grTy9SY0ZFWDZmVnZFSlVRQmN0?=
 =?utf-8?B?RDhldlJEcTRlZEp4RElwbmhwczhnKzVndlk5WTN3bnpQTXp6NThHRlNJb1pq?=
 =?utf-8?B?dXRaQ0p3NlVNc1JoRUIvSWF2Y1BkSzlIeElKQm1BUVFKM05RTTN0Tk5uMEJG?=
 =?utf-8?B?YWVlWGZMR3Bkd25qRi9hR0I1QWVIajlYODRxYjFUMEVPTVl4REk0UjUwNEZU?=
 =?utf-8?B?eTVFR3E0ZUNaTjFQb1RHTFoyaTlGZ3RNN2lCUVM1VVplSlVaQ04yL2I5bFpM?=
 =?utf-8?B?SE1FR0xQeGtKUHFYYVJQbUx4TUZodm4vMyt4dmQ1cDkvOWJlNzQ3V0R6S1Vr?=
 =?utf-8?B?a3pyOGFUaHRVQ2pvOXJRNHg5RGJtalJVb3d1NjlnMVlWeWpKdUlJc2VVL3Iv?=
 =?utf-8?B?NkVoSkRPcGdqL3NqT2pUcy9IRDd3OEpBM1ZUMGhleTgydmFsTXk4TEhtTEN0?=
 =?utf-8?B?Y1ErQzZFR1F3cXROMFlLR050LzRoY2tQc1RmRmF3ZFIrSHFmcCtZci9UcnFH?=
 =?utf-8?B?cHNJWjVIODRnb3FKOHMwcE4zM1Ywd0UvWW5aeGZDT3QvVWxETE01NHdVZEhH?=
 =?utf-8?B?YS9LU3dSMFVNWkhMT0lGWW5wU0kzbENLMGVJMTB4aXFCZDMrQTVHNzRDZ2tu?=
 =?utf-8?B?UzN3T0RNL2FibExXZHdzL2tPRFViZ1Ywc2JTemdKcGNtQ0hldkovTGtlTCtK?=
 =?utf-8?B?WFZibFJrMi8rdGJJL1pndUpzZXd1ckNKVVJVYjFodFd2QUI3eEVWOUlkUEZH?=
 =?utf-8?B?aWpiMFFkUE5ZNklOZmZHeEJwOUFoaHhZRmdTSGFWUkROWGd1K3JTWEh1SGI5?=
 =?utf-8?B?RngvVGk3WDFqdE9XZGQyMjNDTUxOWnYzR3ltTkJJVEM1aDZYV0RoTmZ6UXlG?=
 =?utf-8?B?Yng3ZStBeHRGVnZQVHowSHFWUTJzWmVSQzZtZHpETVovNTIrUDk4OTdFYm9Q?=
 =?utf-8?B?TGROWTBzbkkyWno0bko5aEVrdlByM3NMWDJYT1NDRWxaNHBJdll1bnJQS3FV?=
 =?utf-8?B?ZzBxNWF1TURzREQrOHByOG5KYkhBL0l4NThYd3FEQm1YYjd2dmp5aWExcEVE?=
 =?utf-8?B?TEZYWGpYWVZQSVNxeUc0WG1vVDZvRjFDWUkrQjFjYklaZCtUbjRnTzU5RExU?=
 =?utf-8?B?VjNHdjVqNVFEcWRlUEFyWno2QWZzbmJyZjlHQjk5MG5nTGVWTzQrWldxOU5F?=
 =?utf-8?B?MEJJZGZXVENSWkRGZVdGUDZFWkg2YkNUanZJNjc0dS9GSEtUcStRVWhNSk1H?=
 =?utf-8?B?M3BEOGFOR1V1UTdKNjVTVXphUG9DMStjZk5USmpleS9EbTNwVVZnblMwTFZk?=
 =?utf-8?B?OFp2YnBLSWN6WnZVeUJOejN2Y0NBUktaWkdFaEV4NGNpdlprOGhiZmVKYk12?=
 =?utf-8?B?R1R6eGRCN3k5b1RQVExTZlhiWm80cU9RRUxJTGlucDE2OFdNL1ZsYTlCVEVG?=
 =?utf-8?B?K1RzekNaUzJjN1g5VEV3UFBTYkFxbzl0R2RIVVlSOUIwZmU2Z0VLWWIzdWoz?=
 =?utf-8?B?YjdWc3JIKzhHWmdQNmRMUnhxR1IzZTREVlZxa0tzVHVoNTI1bXhBUjgxb01L?=
 =?utf-8?Q?jrPk+85l4XMgF0oQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7836ca5-46ab-4879-7bea-08da326ed59e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:21:24.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNkXeqPaGE8UMx12iHthg4Ot9GcI3zdAaSACSbeKtm1R+XZnZ/r/bDn1OjOHjXS9uSNHsiS5O4wWLnwVNvVoNW1W9zvXCevjQSb7+RZAyAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5737
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
> v2: Handle NULL drm_edid
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f072cfba9dd9..bd14010ed1c5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4448,12 +4448,13 @@ static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
>   		oui(data[2], data[1], data[0]) == vendor_oui;
>   }
>   
> -static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
> +static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
> +				   struct cea_db_iter *iter)
>   {
>   	memset(iter, 0, sizeof(*iter));
>   
> -	drm_edid_iter_begin(edid, &iter->edid_iter);
> -	displayid_iter_edid_begin(edid, &iter->displayid_iter);
> +	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &iter->edid_iter);
> +	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
>   }
>   
>   static const struct cea_db *
> @@ -4675,7 +4676,7 @@ static int add_cea_modes(struct drm_connector *connector,
>   	struct cea_db_iter iter;
>   	int modes = 0;
>   
> -	cea_db_iter_edid_begin(drm_edid->edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		const u8 *hdmi = NULL, *video = NULL;
>   		u8 hdmi_len = 0, video_len = 0;
> @@ -4926,7 +4927,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>   	eld[DRM_ELD_PRODUCT_CODE0] = drm_edid->edid->prod_code[0];
>   	eld[DRM_ELD_PRODUCT_CODE1] = drm_edid->edid->prod_code[1];
>   
> -	cea_db_iter_edid_begin(drm_edid->edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		const u8 *data = cea_db_data(db);
>   		int len = cea_db_payload_len(db);
> @@ -4979,7 +4980,7 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
>   	struct cea_db_iter iter;
>   	int count = 0;
>   
> -	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_AUDIO) {
>   			int j;
> @@ -5032,7 +5033,7 @@ static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
>   	struct cea_db_iter iter;
>   	int count = 0;
>   
> -	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
>   		    cea_db_payload_len(db) == 3) {
> @@ -5123,7 +5124,7 @@ static bool _drm_detect_hdmi_monitor(const struct drm_edid *drm_edid)
>   	 * Because HDMI identifier is in Vendor Specific Block,
>   	 * search it from all data blocks of CEA extension.
>   	 */
> -	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_is_hdmi_vsdb(db)) {
>   			hdmi = true;
> @@ -5177,7 +5178,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
>   		goto end;
>   	}
>   
> -	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_AUDIO) {
>   			const u8 *data = cea_db_data(db);
> @@ -5536,7 +5537,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>   	}
>   	drm_edid_iter_end(&edid_iter);
>   
> -	cea_db_iter_edid_begin(drm_edid->edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		/* FIXME: convert parsers to use struct cea_db */
>   		const u8 *data = (const u8 *)db;
