Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0240B68B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57889B69;
	Tue, 14 Sep 2021 18:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72D89B49;
 Tue, 14 Sep 2021 18:11:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="244438194"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="244438194"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="650872948"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2021 11:08:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 11:08:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 11:08:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 14 Sep 2021 11:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfqTWkWNxcw9ja1dwhKxjClxZjg82X7lHPAJi80Ja/9Pgc1dxMw0C98m83xmeXg0wrPXE6ph9SxIB8BaNbIkYC08l1Vo7cDkuenCErf/fVHDFNAW0Z69I5G7HS6+7eRluHLLRSHLExVjAGUY2ucIyyoXfQpeDiFAa8goXpY+WHsWsmnF21RZBOWGOIEITJr16EQcMXx4wpONHdAd0E3lS1VAPx9wUmCGL7Zd6ctp58y0hVQFjS3xdh1NdZm9w8H3yZA/W3ZMBi6wIYyM2ftxi644r9T172Fjk9r9+0KTrxCYXXEKLtk8l0seNXgZqxwYx9v/CdPc+arvHkWThEh3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9hm6jvawLo+VGIOkHdVO1t6Mf7+iGftwO0MON3D7nrs=;
 b=HIyw10R75GM5g9jMt4xmpavi+wdy4Qj42TcaeR3uwd4Fl9f0RXq2O47XbnGzI0eE0ocBQF9YB2TE0JxOlKCy7ZIJU+x2AKEArPDnQuia2vO/eNlTrM6tpxdeFblZJO1jMrELv+q95hTSGLLPnXv8AldNhYG0BrtUSw1vHgQcD52oeI9lJsbg6hCBOLFk8p1cdBOedRY/y84hE/hRKJsWQxg3ssZtfCvxsT+MJ2l3xJ+K7Lp1NZV6bCn6Dk5t5vuCv7FLfaJ5Je0HiSnwlFg2Di6lyipogWQTnyxC7iAZRR/1wOLI+jr4PkKqwESHll6eVmRen41xm/XtRSv056laJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hm6jvawLo+VGIOkHdVO1t6Mf7+iGftwO0MON3D7nrs=;
 b=sQKMDWJ9w3RuSSpcJKD5mjmh6ld4ZdZjbfZSD4mZWDz7M+R8IBqdywso466wwK0umWkihsM3ARHUjvJspBU6ySuWniPapneWA2anFHrCF1yshEn+p2BwjtbXwIQ6sIfr4GO6UF+oWoV4/ALco7u5VrR5Mm/vMGmFhWzJMLsYqHw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN6PR1101MB2148.namprd11.prod.outlook.com (2603:10b6:405:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 18:08:03 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::54bd:ec7f:5a52:a0e1]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::54bd:ec7f:5a52:a0e1%7]) with mapi id 15.20.4523.014; Tue, 14 Sep 2021
 18:08:02 +0000
Subject: Re: [PATCH 1/2] drm/i915/xehpsdv: Define MOCS table for XeHP SDV
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20210904003544.2422282-1-matthew.d.roper@intel.com>
 <20210904003544.2422282-2-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <b79540e3-bacd-1fff-0374-827d910b2a1f@intel.com>
Date: Tue, 14 Sep 2021 11:07:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210904003544.2422282-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0311.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::16) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.213.176.24] (192.55.52.201) by
 SJ0PR03CA0311.namprd03.prod.outlook.com (2603:10b6:a03:39d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Tue, 14 Sep 2021 18:08:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33c23a4e-9c30-4c0d-7324-08d977aa97db
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2148:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR1101MB21485CCD934861B4F96D1CBBCEDA9@BN6PR1101MB2148.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofqf7dGHqCZEvm3Gd5+UFVVHh25JPaRhbjY3iyIfwRomYbyB2/UP1bmw5QCqIU21khyoJDYbVaQ1rayPDWNPFCOSmlkiqbvahhGe8UjvnM2VraV9gWRxejfXCnyM2q/k4nzHuZKAKARIkna5AS+2c3ylOg3U/Iw2mTW/5H8A2ptdTEp5EAjTo1unjOKNkRZhzcWZHNSSI8wkaxcrBRWr3SjIM+0NMoA0tsGarvEYxU6TVsK971RlWObviQLeNHz/LT3cJbTbV5SyzOK7qqo9Hy6IhgJqDmBTv7Xh6jIBzpJMkoVIREk6Nc5ZnMKyN3MJ6rNQmjnkjkbESyH6dpyP0Y3f+7o1u6MPWAJ7XpV7mbe2O2Fk8+ea5nmGWcbvNz0bC49i8oGDTkPfKMaEe46FmdZVOnuZcFOFtSJNtILdAjpFYKUYN0hkzAz2KP/2g0uYIbPc9aawXhv/XaOH32a1QZY4ddohh/YQelQJ4GI05E8kcxBancRPHru44ZftR0zg0VS3bdhnuYCSEaLRIEgRl6GCPe3gFAjVdqtJOUy4kGoJF6UhQB0igShA4nV5XGdA35gV0XwP+OOajPvfgxKZ/Kqe8yfUEFvu7JpYBT2a/ocu1o/y6kLzmlQ2y3GjKkrlhrIdVc7XOmiyLuLKJvokex5utX65P8xs0DgBfat3pTcLuCDwBdo5Zj5IFBfNRkWwx/zC86Dj4JTsBSoGigHHRRCkCcsK0WRveICqbIXF5B4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(66946007)(186003)(16576012)(107886003)(26005)(8936002)(8676002)(53546011)(316002)(38100700002)(2616005)(4326008)(450100002)(6486002)(54906003)(36756003)(66556008)(66476007)(2906002)(31686004)(83380400001)(5660300002)(31696002)(86362001)(478600001)(6666004)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzMrTndoZTJPcUZ3VFBpak9RYk5aRmNLbWU0U2V6emd1QmE5R1JWWExVMTF4?=
 =?utf-8?B?UEdBOHdFR04rOUNRV01jUmt0alg4NEZGN3lLR0dHWWphcmwzWmxvd1Nqektv?=
 =?utf-8?B?ZFBXYlcydWdSWlpXVTlxY2tNYm5jdG1QMkVjclpoUWxSVXRWZ1BKZ2M4UTJP?=
 =?utf-8?B?WVJENVc3c0hEaUFVRk9veDRJNy82VUdpaDFFc2QwOWpodlBSWUU5RE1ST1dX?=
 =?utf-8?B?ZCt4SXZtMDQwUkRQb1JhZERtMG1WMmhvUnR0Q1dmazErYkRvOTJhdXFiMk1R?=
 =?utf-8?B?M0VQWDZPQS9EZGdUT3pFb0VGMHhENW81aU9YN3dMN01zWjdOcjJwb25lT3gw?=
 =?utf-8?B?Q3NwSGRpa011cmtsdS8xcUF6akVtM3p6ZjloWldRVHhkZWRjbGJiZUE2YmdC?=
 =?utf-8?B?ZVByWVNTaHc3MWZvcjRvanZIdi9KeXBIRUo2bG5jRzNsLzA4eEk4bW1OSm0y?=
 =?utf-8?B?bGYxTzNvOW5DekR5N28veHUxdVlkaFA3SURKaWpQZTFnYzVhZWM1OXg1cUVL?=
 =?utf-8?B?Q1NJdUVKOHB0VmdxNFFuR1g0UGVJUWVqcTVYbUpwUk5LeW83R0dmZ2J0TUxU?=
 =?utf-8?B?RFhCMGZvaDYyKzdUZ0xHZE15SGlNeENyNWgraG9rUHNZemVsZGJUUGUvTlpV?=
 =?utf-8?B?Z25YSzhQNjR3bmRyYVlQZDZlOVFxSU9uV2tIRWNIVFBOd0pZYWhicEVvREdZ?=
 =?utf-8?B?YytNcGVQM1FlRXdzMHFERTN4NytHL0RzWXk5YnVVa3Z6ejRDUC9SQjJLRnZk?=
 =?utf-8?B?eThJRTA4YzdFWFNCeVFlSVdrWGt6aFhUL05UME5mb0p1MWFrbzVUVk9aam1B?=
 =?utf-8?B?M3pKallicFlyVm5SdXJ6MXZsektPM0o5WXhuRkJhQmZZRGZ0UzNkdmd3VmIw?=
 =?utf-8?B?THJiK1NKQTMzSjBEM2syamNXMTFWeStqSndaTWtOVzZuMW5vZkNFREh1anhJ?=
 =?utf-8?B?bUs5aHJ5MmEwc25nY3FhOWxLOEtuaFZNbzJZalEvQ1pmR0JxUjI3ZUJKSlEz?=
 =?utf-8?B?dEp6eFhibzlFbVgzL1k0N056TXRZb2w2a3pBK3IwbmZub3lpN3ppU3A4ZG1a?=
 =?utf-8?B?dEZQdnBKSWZIQSt0Tm8vbXBaMllzSC90eGZkZU5IUDdKdnhTLzZkY0NYZUps?=
 =?utf-8?B?SGtWci93MnM2V2JVQnIzVlU0czBmV3BwRFRkYmhPMnJlQXlkbEkrM1RUUWF0?=
 =?utf-8?B?UnlRTHNpMUhENmJPTXJXL3JpUGtSdUNoMlk4enhScjhMaG5EcmhlUW9mU1ow?=
 =?utf-8?B?ZzBFakZ1RUQrOHdJcE1SbTZ0UjI2MHhwdDZvRkxIVEdMZC9xSTlwczBIQy9U?=
 =?utf-8?B?d0NOTG9ZeEhHTVdLZC81VE9qOUhiODZLVEx1bHdhOFZsVENGMnhZbnF0a3RM?=
 =?utf-8?B?MDh4QXBpMDd5Uk5TaUNYOThqNVduSFg3VVZSTHVVclpCNTlJNGNuemU2Ulov?=
 =?utf-8?B?L0N3RTArRFFGQUluNzFhZWNTcFAxVld4SzJEbHpjbzNIbWlONklPcitaUW04?=
 =?utf-8?B?MngwejU1eGFNWllzS0pNQWpkVVRTQkE1RTNFVGxJbVJxRWxJSCt5bC90Y25v?=
 =?utf-8?B?T1FGRVJlYzJuZkRkVmQ4T2dGdEFJZ0JTeHJKTmpYaUtMbXdWNm0xN1V5ME9Z?=
 =?utf-8?B?aklwOEhYSVdlN3hwOVhLQWVLSlFOTVpCakhEakcvVnlkYzdEZXg2ZURyYmZh?=
 =?utf-8?B?bHVQTDBqK0dOV2dBSTRpYlcrUlh6UHYyZ290ME9OU1ozRVZjNEp1amRoL0Rh?=
 =?utf-8?Q?xDVYtiRUM1RYAei9z1b/mwLVjYXkvIh/+3+BXrX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c23a4e-9c30-4c0d-7324-08d977aa97db
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 18:08:02.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLa2pN5VU0y5ByqLL/nLV+5bm7JftIpFW88VvIrfhgPjIhFDUEE8XAfvK1yoYvsVJUj9O+kyTUoQeY9dbQw/R/80S2nIRwzBFMH9T+alenE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2148
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

Appears to match latest BSPEC

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint


On 9/3/21 5:35 PM, Matt Roper wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Like DG1, XeHP SDV doesn't have LLC/eDRAM control values due to being a
> dgfx card. XeHP SDV adds 2 more bits: L3_GLBGO to "push the Go point to
> memory for L3 destined transaction" and L3_LKP to "enable Lookup for
> uncacheable accesses".
>
> Bspec: 45101
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_mocs.c | 35 +++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index e96afd7beb49..133cfe07cb9f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -42,6 +42,8 @@ struct drm_i915_mocs_table {
>   #define L3_ESC(value)		((value) << 0)
>   #define L3_SCC(value)		((value) << 1)
>   #define _L3_CACHEABILITY(value)	((value) << 4)
> +#define L3_GLBGO(value)		((value) << 6)
> +#define L3_LKUP(value)		((value) << 7)
>   
>   /* Helper defines */
>   #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> @@ -315,6 +317,31 @@ static const struct drm_i915_mocs_entry dg1_mocs_table[] = {
>   	MOCS_ENTRY(63, 0, L3_1_UC),
>   };
>   
> +static const struct drm_i915_mocs_entry xehpsdv_mocs_table[] = {
> +	/* wa_1608975824 */
> +	MOCS_ENTRY(0, 0, L3_3_WB | L3_LKUP(1)),
> +
> +	/* UC - Coherent; GO:L3 */
> +	MOCS_ENTRY(1, 0, L3_1_UC | L3_LKUP(1)),
> +	/* UC - Coherent; GO:Memory */
> +	MOCS_ENTRY(2, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
> +	/* UC - Non-Coherent; GO:Memory */
> +	MOCS_ENTRY(3, 0, L3_1_UC | L3_GLBGO(1)),
> +	/* UC - Non-Coherent; GO:L3 */
> +	MOCS_ENTRY(4, 0, L3_1_UC),
> +
> +	/* WB */
> +	MOCS_ENTRY(5, 0, L3_3_WB | L3_LKUP(1)),
> +
> +	/* HW Reserved - SW program but never use. */
> +	MOCS_ENTRY(48, 0, L3_3_WB | L3_LKUP(1)),
> +	MOCS_ENTRY(49, 0, L3_1_UC | L3_LKUP(1)),
> +	MOCS_ENTRY(60, 0, L3_1_UC),
> +	MOCS_ENTRY(61, 0, L3_1_UC),
> +	MOCS_ENTRY(62, 0, L3_1_UC),
> +	MOCS_ENTRY(63, 0, L3_1_UC),
> +};
> +
>   enum {
>   	HAS_GLOBAL_MOCS = BIT(0),
>   	HAS_ENGINE_MOCS = BIT(1),
> @@ -344,7 +371,13 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>   	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>   
>   	table->unused_entries_index = I915_MOCS_PTE;
> -	if (IS_DG1(i915)) {
> +	if (IS_XEHPSDV(i915)) {
> +		table->size = ARRAY_SIZE(xehpsdv_mocs_table);
> +		table->table = xehpsdv_mocs_table;
> +		table->uc_index = 2;
> +		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
> +		table->unused_entries_index = 5;
> +	} else if (IS_DG1(i915)) {
>   		table->size = ARRAY_SIZE(dg1_mocs_table);
>   		table->table = dg1_mocs_table;
>   		table->uc_index = 1;
