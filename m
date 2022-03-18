Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6134DDA1C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 14:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C38610E05C;
	Fri, 18 Mar 2022 13:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4DC88F9F;
 Fri, 18 Mar 2022 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647608656; x=1679144656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n5eds0nafHMWEYljsbbTlFUcjR9etSiVmRr1oZtN/iw=;
 b=Ggq4GFdNsFrpkp+aF1Sv6zWDQDXgzy5JdaKCHRMXtokOXUiv2WHApiwD
 WpMlXippJKbwEaLrbX5tDeLoskiFNxJ71RnwJlD60OPZksDyEXY45Z2Lg
 ZQfHp23/CbVFRAuPhdAcE8iLlxE2D0v4+SdAxKWThlt7fIZdcVRyry5i7
 7rXX7a4G+axxnHKXltM5kP5+r4TYT8WcqMtDovriVRLfev3HSR8HPKsLf
 kl6c9TSoQnS7XheHJaQv9VAVqFRbNBNtDKZj+fGbNkR2teZrxKe5sUY3g
 sUxHjyDrN/OhY4h4KskexkweJ7UvPAMKenmfSShRpq61XWGftuKlgoopr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257318896"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="257318896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 06:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="647454712"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 18 Mar 2022 06:04:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 06:04:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 06:04:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 06:04:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 06:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay6YU8VWgrg3OgYrAcKNC8/N8/uTrISWfdTbFHVtGze4ut0CWHvYNLnLtCKFolGpaaMHXNkYqTVgLhbDp4heuXuHr8MI6rX+PHay7IyZZhEYmD3S2kIwAr6lQrNKRU+60SxbQLlk5DwcJAXjk8nudCZ8sutzzdLtnGXhM33QZgovwMvRE5yQjQNdiwXFwqYJyNRbVXy8yDNpWX4Ep95b88Pu6u2JuWyvLFNx7mfM4WiD0ShKjHpcKMlodA5SRvRr48yiYHZ22ggm9Z/yK0xxERTnOLH1iAr8zZnNJn7O5Za1UE6R07yohjdgGlpjMDcN9YL0QF2usJsVTj5a1MWMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNIkvMRl8uMIYOFiKvTX8O9t3j3Pd2qj/nyi0VNs730=;
 b=evX4iiKQ/3toR9pLrukpvPOxTvup/ITeKZY38pQ3WZ4DmHwwOqsdbECtrOYyw3lRPcvXecpUtWA9nD0iHv4UR5/BTowKXZwKZrh3yNL37uqe4MOVZDXRXXokibzPlaqi2M4Osw3+t+lG3jNHaGqlZCtJO6Bymlt37vlLzoxVOf1jpFbbA+KmalvXPO2HKaED6oEX516TjiiDvqZpSTQDY/RsK8HQk3Wg6Q6jHwRfCqRKpyY6lGFyudyrCQ0GQdT6eoEipe0NqwA8vc9dUPQPh0Tkr8f8ZS7dsLyskvWDKqO3m1ttmN69q4ktQxmmrbtnS2MXlEVaWYOYx1BRcsXhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR1101MB2169.namprd11.prod.outlook.com (2603:10b6:4:51::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Fri, 18 Mar 2022 13:04:13 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 13:04:12 +0000
Message-ID: <787be3c3-cedb-9ee4-371f-aa01c69ad379@intel.com>
Date: Fri, 18 Mar 2022 14:04:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v6 3/7] drm/i915: Prepare for multiple GTs
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-4-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220318021046.40348-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::19) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ca4b621-ea4c-40b1-e1d6-08da08dfcbf0
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2169:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2169CD53CF71AAA36B66CB78EB139@DM5PR1101MB2169.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6csNPBvILRO1h2IpYFb7JeltCfTk+Nflz8mrwUmE/BKrQAH45lShSmMFv4onqYKX2kzUlkNyEAOLoHhYPLvry+eu+iCiuyzPqnu8oVYgOxvMpWbOfElkfFXQD5IvkTx0P8/FfGz4Dy31cVnj4IHiZYHDB+EVABx3Lbw1n3/FCbaoj31KRkZ1ITkIchPqbqnelK43XYon34QoiGMmL8MEHa/KrLap8UZ08QVfsPJsvgiQVbvJgP5FAVI0z2BOSYB6jCDxReLcrcGNilR0VMCACUTq0LQKcXDqu0IvrOuf+7OkMc0L6MTdLcDMQgZ8SHEskH/tyBY8fxhSanenWyoyf3nghoF5JO6Oxr9jrN8ibRl9Ahy6sn8BFYtUK9w7YiDFaolAemXZ8KyW2Ngt7gtJxyuwYgv3tume+JMaYCF7HBwFQt4w4oAfNcxjbQa1tRLPml/Lh3mEIgzSB68ISnJ1scRFYyZzP9d3pprEJ/XILum2+5I2ilR/swtDMv8vDp0lndq+B1DIBX6Oc3SAEOIxqxdOijevaDs2WBQ43p+8xgHym/bHzOJL2hTGPG7ZAOU7WI3yYSTO0mJlbi0C/r31HAhXdl24Bpj3aeYT790Nqcl36rVQvTcgpwbu8Ff/vSmUeJ5u1YEnQ1e54NpUnKXHz7d8vzgNnMPClqAWLA6Q9ob6Jl/P5DS/C23ikQ2GWpNvComDvxXlLy9cmU6NgnvlwS9QhYo5xkth6BFhMgzuDxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66556008)(66476007)(82960400001)(31696002)(26005)(186003)(8936002)(86362001)(6666004)(4326008)(8676002)(6486002)(508600001)(38100700002)(2906002)(83380400001)(31686004)(54906003)(110136005)(36916002)(44832011)(53546011)(6506007)(2616005)(316002)(6512007)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXRxZUYyU255Zmp5Z1c4MkwxTTlVYnFHMlk4YmdmaTRCQlEvZDRKelQ3S2E0?=
 =?utf-8?B?YWx3Tmw4TTlad0Zwb1dqaEZyUktwQnV1NWJiMHdxZEJYWE0xK3NSOXVXU1Mr?=
 =?utf-8?B?aHZaU1k4T21XMlpUeTEyYmFWUVdRUGc1S2FLRm0zZi9WZ092ajNoa1RzcjJ1?=
 =?utf-8?B?ZHYxYUxuRnlDN3cwN1k0alZ6T2M4eW96OGw1bzJUcEZ3c2FocWMxRzhaTXRq?=
 =?utf-8?B?VC8ycjdOQnBlZHRxMHE2NC9CanVHNUZWK1kraE4xaGhqT0NZUHdlMzRiZ0Vn?=
 =?utf-8?B?bVlJTmNXdi9oOUJ1c01LK3pGN3grWUFJWmNFOTBtVUp5cklQUHV4UWVTay9j?=
 =?utf-8?B?c09qVGFkNDZLTklMU3BQSXNJMlphNUJQTzYvQVVrS29EYTllV2NFWlRXVkVZ?=
 =?utf-8?B?ZVFZSUxCWFU4c3lBd1BqSFJnWm1NdjBVKzBGQms1VHA4Ym9ycHRVM1EwYmR1?=
 =?utf-8?B?RWVSbnJVeWxuMTZvdUxwSzc3d21zTm1PcDFrdGFqbktrOE5yeVhHUEI3bmFs?=
 =?utf-8?B?WXVpRmlVdkNEbFZMSnFHSkRMMDVvbjBDTThQOUFhMzRUd2dtcklicDRLNGNy?=
 =?utf-8?B?VEE2S0ZNOEtucEtpM2ZIbmNUWmlWTmlvaUo5NndQMGRDdFplcm9TWjZ6L2NL?=
 =?utf-8?B?eGxOZ0pRTDlDQUVyMFRaS2hHVnpLcHRVZzVVZmQ3NEhJM0NZd1Y1UUNNN25K?=
 =?utf-8?B?cDlYSDBiOFhvWUNKWDJtSFN6cE1XTHBuL0lGWnd1YmZLWit2TUFoT3VxU1Fk?=
 =?utf-8?B?SmQrNDNkRVZQTTZwNGhwRHYrSnEwclhHZ0pSemlCWUIvc1NzQmtsMUlxSzkr?=
 =?utf-8?B?L3JNOStSTHZFQkF3MnpHZ24yRTJoUTdGTVVIcWZMN3MzcEx0K1BjcUY5Y3Rz?=
 =?utf-8?B?T2IzRXRUL0IxTXdseHpiTEZMV01ZMjUxWmttdnBuZlJzb2swLzg0SmsrTEUv?=
 =?utf-8?B?cnhUWkhGTDdXMEZJdS9zSHJiZFdBYy9LWXVOcHJJTVJlK0d5My9PdndUOFZn?=
 =?utf-8?B?anJuaWo2TGQxcG9ZOWdwSkhSa041OGhpK09zYkg3SXJIaWFsVTJjSFcvbytX?=
 =?utf-8?B?d2NRWDNsZXUrSXlIL3h0Z2pDVmkybUFQTWVZVVRnN2R3TVorWG5PVGt5Z2tW?=
 =?utf-8?B?SkV6QlhzRjFaWWJvdkpqemhCSXdmZHYyWCtYVm52ME1wbGNWQVFMYitPTTZq?=
 =?utf-8?B?aS82dXNLN0dLMnZoTFc3NERtNENNNkczMWhGeWpoWXZVcVRvbHNVZGpxZzdm?=
 =?utf-8?B?dm5IQzhzK3pINnIvZ3Arb0NVVDdkSmd3dEVoaUNVZnBpaWFLMnBWUzdMUk5q?=
 =?utf-8?B?NUNRY2FVQXVxZ005NTBpYVBIREZVSGlYbmtkbk14a3FBQXZIeDQ0c2ZXOXdN?=
 =?utf-8?B?SEV6Zzh4K0s4T2hyZ24yOXJ0blBZYXhmNDIzY1RsN09PckZVTEoyYlUrY0Zw?=
 =?utf-8?B?R29PekNKSUVHYlRVZ0krRmRtM0JVc01mQU9KMGFpejAyOHNpczloQWdlQWF2?=
 =?utf-8?B?SWg3bWtPZ2toM0ZUL3VoY1AraThiN092QW5nRkZkTTlORXM0SklHU1htUGpn?=
 =?utf-8?B?WVh1MEl3RjMvYldqZWJFRTNxd0N3S0pQZ2Y0WTI5MzhWNm1kaGkzdVYxVHc5?=
 =?utf-8?B?UVFBSkIzRWk0OFc1UVFWTGJ1U08xblZPTmZ4YW9saUtVcHpheVRDamlMcTNY?=
 =?utf-8?B?bWpvQUFLNnl5QWJlekxmMUtYMnJBL1RzekRlR000U1o1YktFV0lDeE1hWStn?=
 =?utf-8?B?SE9FYWJZcVpUb2Y2cXV2SE9QeEdiWlNEakZubGw3OW1UVklOTzAxZUNmVWdu?=
 =?utf-8?B?eHRXY0RGaFlITTAyWHlCa2pOcWNLZXc0Und1SHRJVHJDU3ZUWmJ1Rk1QbVpr?=
 =?utf-8?B?SVlBZWJTWm1qWnltRXR2aWRkV2pKaXZrbnZSMW83T3pUSWk2SnJvK0F6WVZa?=
 =?utf-8?B?d3M2N05Odmp6MFlmMHpSVStlTlpYZFpGQ2tkRWhROVZiUVg0akNjams4cFNk?=
 =?utf-8?B?akEwUzlPdjZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca4b621-ea4c-40b1-e1d6-08da08dfcbf0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 13:04:12.0980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FT3u8rhEDqJp7NTfcBdfZ+vZtqzVu+fd1wOXqNHowbg5u0BbOCQLDA5WD576c5KWAoYxr+AOVtykIC6sPmYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2169
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.03.2022 03:10, Andi Shyti wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> On a multi-tile platform, each tile has its own registers + GGTT
> space, and BAR 0 is extended to cover all of them.
> 
> Up to four GTs are supported in i915->gt[], with slot zero
> shadowing the existing i915->gt0 to enable source compatibility
> with legacy driver paths. A for_each_gt macro is added to iterate
> over the GTs and will be used by upcoming patches that convert
> various parts of the driver to be multi-gt aware.
> 
> Only the primary/root tile is initialized for now; the other
> tiles will be detected and plugged in by future patches once the
> necessary infrastructure is in place to handle them.
> 
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
