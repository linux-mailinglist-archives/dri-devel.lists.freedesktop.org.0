Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5154FCADC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936410FB3B;
	Tue, 12 Apr 2022 00:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9C510E0A4;
 Tue, 12 Apr 2022 00:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649725081; x=1681261081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U7imTKCdymQJOTExUz7UZ2SWQQaf2fFHk8IcEclUG4k=;
 b=LrO1TAsIIf3hIVB8m6vfm/WOvv6jg6e6fHCNMZj7KCQVDqpjnVrTr3EC
 yk5IIcHPb6N2VKywtni7EhR6MsJdVPfqbItnMUftkmOOate6vMbVT7TAU
 UwcNyN94pWkoGcCoeMhCmoVQLvROI65ANHME9mqEwqAkX9R+V5GVlnnYL
 CJAmna1FtsH8cbDFl22UKjV+QpVj2GXPPyIkcZT+ePNlZi8rvl29mqkcg
 ZSMEi8ezBhMxKW9oUimTjOqJRBmNx5NHTcdvhObvXqt5JyWhidJgin1G4
 LDopCWABKmzGTy5wUPeWBOJEoL9sKixr2AAaUMhh2wVkBTxAoZUO4DFlu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244132554"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244132554"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="724218787"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 11 Apr 2022 17:57:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:57:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:57:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 17:57:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 17:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf7KED2FPN00bf4c8bkGNiAGds5s/lYlSzYtQuIwqlBvfrjA9t1BPJoxFsIeEuA+5wyRLuptIY97KKevm/6AK4wKsovhqzUUoNC5v31Gc//MHEKHvFC/gXSuBgURSVjjs94Q0bFVZzoLkAvB8WmTNFfDRFBQnZdJ3zcdA5imXxrL22K3wIsDQxEW8pIPkjZcle6I1/6b91DDnb6+5X4T6Xt2+d1aRBawgVgx2lYw+i20tA2ZJjRkW77vZWWJxbeyXyrZiUlMQ0lNqlLMEgzG4R+HWhpnRkw2ZNmb6Aamg61uFU2X7F4WUj7RLdmJNbxitaRPwPpV9aGIVMLMNNi+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZBBsewXxn6awT1bePXLmyGtvLJnrg1D1gun01Q6LlQ=;
 b=HjE8wOwETNPWghM4tSAu3OIrnX/nmYxQaRnjXpkNlQBsQ/IpAVqqmFpovcPM9+ux6b4LM7sa8KA4VNeKjO7YDomnV4ITfgpwAweZ8BHv1dV8Y9vKy0DdcIzXiV0JDaULWeXrwyNOnKxs+DkOmpk9psmiH2H3AJa9v+JzVd/0tQS5WhM6eQ5dYPdutZykh9L4+IEMvr/2VixT3gy88SFx5lWZFb2EghLRayqsFuU+PMhhax6QzkVmuPMMp2Hw5Pv1IgUCbRHuk7Hl3AwR74qUbfITciS7Rj2cvmwsTh8eEgb8c8anShfJWWXHm/pY8VAgiI65+gMUfdNld8sziNRIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Tue, 12 Apr 2022 00:57:53 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f%7]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 00:57:53 +0000
Message-ID: <8b00cd3b-5c63-de62-6bb1-6f4372048489@intel.com>
Date: Mon, 11 Apr 2022 17:57:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v2 4/7] drm/i915/guc: use the memcpy_from_wc
 call from the drm
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
 <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:74::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 272c0018-a67b-4dc1-bef7-08da1c1f794e
X-MS-TrafficTypeDiagnostic: CH0PR11MB5283:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH0PR11MB52836CBED1DC973DAF457671F4ED9@CH0PR11MB5283.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYIfeE78W2Z7k/rEl0Zl3HW11z3diBedMP2RBCxevq2LVPiCwmzdp9COwZb6x/lqU4dvhKgcU7q8kcY1MncPrqDP6c/ddv04xMHzYbyUYgbr41Q0O6jrYjSzOBqFtjjX9PszOu3NG2hzbLI5xwErxhMbnEPTerh1OBLZiHc76m3G1IzJk4MUO6swsfNgnE0QN0Xx4ic9fM35ywaeEY1gr419TOksZmWow9ar7Xg9gNtCIZ09n+H8jNE7hcHoyx7jeqGRuJsDSsJk/tD7K++Qe0DfA+lWV4jR+/3tf6o+BV1wf/+Jxn7uSsmRruq3vIVi67GcAX0uj9v9UBr2F1NBOdlGmEQ64LL7vYUC+UgHi9Ef+1FQJWo1BjOU8FTxd5CuAAgrTdlFZCMXDWEZZuJqF/GSGvSj3dP/vcZazOJErrG9LmMtuCbClzYEFv9UgCGCYGc+0GG1jGHV4TkoPZo4GuNarlaiSk9IV0pQwmPZHN3gTOrl1q8bKeN611QkgDJiMAROuw939Zt21xzI7m5bGu6ON7qhxCXy/UJWX0Wp5VCCUpdCq3kDuXN4G3wdAL4ZCAfngOmi4H6ypXhJkixwKIkM9SPXo2cqtsTRVRZ6ny0YLcPhLZwXiiJrYt9B3DdRR5ZdlQimZKXrU0RncHQiKL2/1DqI84piu5Xrs1trejBTO/m0awajdMAqx12SSqHw4jvX/Y+p94O5q729wqUKPQ2QPKJkQ72FtuO2LS5NZFCZBKB2TBwFZnHlMhqiFBLc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(5660300002)(6636002)(82960400001)(2906002)(2616005)(26005)(8676002)(8936002)(86362001)(4326008)(66946007)(38100700002)(6512007)(83380400001)(53546011)(6506007)(450100002)(6486002)(66476007)(66556008)(316002)(107886003)(110136005)(508600001)(31686004)(36756003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDBkbTlhVnh2LzJSODRkVFlQWXVENnhnNElqY1JhVXJWd1pyTDZkQ01hSThu?=
 =?utf-8?B?UHlNN2tLR3FyM3owSEJTbm1hRHQ5ZFc2Q3EzbTdoTWc1T1JnckNna0RGZFZi?=
 =?utf-8?B?Q3hJSXg2UFdaVG1JN2JBZ0hSZjRBTG5JYmVwZjlXbnRQYnVYTEZERld0bW5G?=
 =?utf-8?B?TlBjdUtkbUc3bjJTSkxlSEt3VHZBMyt0V1BLRkVydzBNaG5ZK05TOWRQWjNW?=
 =?utf-8?B?OHZZK3RacFR5b210OGRtMUdJSDM1SUtua2k1b0pPenllaVp1eGZxNDhncHV1?=
 =?utf-8?B?YzF2YnVBdG9ZQW51MGpiTjJ0VU5yTHdZSGJERG42eXZEalBsa3lEYSsvRVMw?=
 =?utf-8?B?OEt4VGNLMDZqQXZqTHJyWWlqdHdCWk5VOXhnc3ZPdHRTZmhTMzl0bzdZeHd0?=
 =?utf-8?B?Ylk1TStOdkxXK2RuVmRjU25hckRjVlV2R2FWbmtmWURvbXpld29DQzRMRHNj?=
 =?utf-8?B?UFduU1BPYkxLNTJyU3pxbWhCUDl4dkZiNXR5dGlsVWdZY1c5VDlwK3E3MDAr?=
 =?utf-8?B?eUkrcWlQeW9xUUpFSGYyV0xyQzJVTE9wZkNTR25MOUlydEViTDdtclBKNE11?=
 =?utf-8?B?YkR2NklEQUk3b2F3M3c3b0FkcGZrVWYrdkt3NjliZXZiSmlES3ZLUUhmaDg0?=
 =?utf-8?B?QlA5ajQvMHhVbHJVRy9qZjVtbEd2bmlXMXBkSU9HSW9aR0xZbmJCWjdhMCsv?=
 =?utf-8?B?elJHK2J5cW1PcEZvdGluV1V0dTdLZnpOUVV4blhyMHdFTjFBM2RUY1VWZ0ZG?=
 =?utf-8?B?YytaVms1TzMzRmZrTWJTRHFkamxXTDJxR1YzY0FycWd4NTBMOGVRQ2ZnblQr?=
 =?utf-8?B?YXBHTElYVEhGdGxRd3pxTHJOOThCU0cxUGpsWTFFNzhXSFY2UUdUYVU2aGZF?=
 =?utf-8?B?bHZRbFZsU1BRUC9yZktnZkN0c1N1eTZFU3BkOWIvcXRPR3hQdHY5aHQyWTM0?=
 =?utf-8?B?cXo5Um5NYnUzcUIzMmJ3c0FucjV2M3Jjcms0N0VoZG1JLzlDemlER3AvRnVD?=
 =?utf-8?B?eUtmVXpwR3BrZ1ArNWRBLzFmZWpOWmE5WHBIOWdUaTdlbjBzTW9NQXdDanR6?=
 =?utf-8?B?T1U0TXZ0RGlDQjRYZDdtY28rcENWa2lBeXZGcVMrN1BWNUh6TDBSbzVyMCtS?=
 =?utf-8?B?TEdwd1lOU1BKWGVseG1KNDFPZFV0TG9jemZBb1VJQkZ1L2lJUjZpeUVOaHV1?=
 =?utf-8?B?WnJETTBwN1I1bUZJVTl6VDNSRzBmd1NuVHF4OGpIbVRkSGl1UTQwRWV4dW1I?=
 =?utf-8?B?blIwRzFZdGNncUh4MFFEcmtEZEJHT09qSTdIdE9FYllSendkK2dzQlBuZXZI?=
 =?utf-8?B?YndLdkIvMDU0cDZxTXZEQVdKOEVoUWw2NzNmaWFIMlkyMjhlU0MvQjFBYm5W?=
 =?utf-8?B?dnJOS0RSWC9OdDNocFJuRnQwMWhJcGRLNGpEV29vUm1YaUVvQXl1aTBQU2M5?=
 =?utf-8?B?WlJzVVE3cDZQUlppSEhkQW5uMnhOMlV0YjV4aG9TYXMzZEI3ODdEQmZieEs5?=
 =?utf-8?B?OFd3RVZwNEtxb0l3elZkOGF3bUIxT3ZsZW8wZk1HRkNrSjBacjV6Y0VZMllK?=
 =?utf-8?B?a2gyRm94K3hVT1BleTRib1U3dVNMWG1TLzFiOWd4cTBidzYzdTlHUGxiUEFF?=
 =?utf-8?B?dFVNb3YzdjZhUTlOMFhLQjFmRXVwNzBGUnhrSk1tN0hERG9vcGlTTWswRFA1?=
 =?utf-8?B?RnVCVWVlc1pETCtoekRUUzhFUTFKN0lpaDFFRUdzbzI2elpmUzZaenJUcWhB?=
 =?utf-8?B?NzdpbThueWxmMHNKbG45SFk0aVRac2JlUVZaa3IwUVlPWVRqOHQ5cEtkREhK?=
 =?utf-8?B?NENuem9tNUE1aGQvZmgzTEFjSXlzb3JhU24vd2hOM2drVlVBL0ZyaHYyazQw?=
 =?utf-8?B?N1phVVFrUFl4TnZlUHBHeFhmL3A3cmZvWmgrcGl4S09sb0hXVThKYVlSMk5k?=
 =?utf-8?B?cEpvd3BWTnRrUzdLYnozbWNsMFBjT2xXNFAvTWRBZjNJcnovdWhoR09EeXNR?=
 =?utf-8?B?dnQ5Qi9NR0NaNVlqZXlGWUpHV2gwQXJIYmxBM0JwUFAvVG13YjVDd2RvWjhU?=
 =?utf-8?B?c0ZPSEwrM3E1YlhCSzBjZWxMS3J4MC8wdEZ2OE9qMVpsZENMRi9OTlUwam81?=
 =?utf-8?B?VHZRUnk0ampIa1RzVzJMaWxUcitQZUp3Qk9QdjFLak5UVlVZQ0xJazY1UDBa?=
 =?utf-8?B?WVNYb3B0RW05bzkyN0czQlFaaWFZa3pmUlBPaUdMbFR0QXFseGlwVXd3MUJB?=
 =?utf-8?B?bjZOalllY0hRRWFGeVB2R1hqUGdlK2wrSWcxNXp0NmYwN3RSZ3J6bUVMekl0?=
 =?utf-8?B?V1RYNnc4MlVZdWsyVVlJbE1BV0VacmRaL2lYNWFlR09kTGYrTmk2M2xKQlB3?=
 =?utf-8?Q?eyUMZPGEh1x5uJWR+VuVONn8pWuvBsTd612ss?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 272c0018-a67b-4dc1-bef7-08da1c1f794e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 00:57:53.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fb7MSIVgD9VX1JPYG6x7kDciNOYM9xK+b8nEJKgPecZU9xTnQuewEqrETd1b6LHPtRk3IRrsH+JSWxhX10VwDEh7WpXjWqX+iUmCbVY6X9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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
Cc: siva.mullati@intel.com, intel-gfx@lists.freedesktop.org,
 michael.cheng@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/21/2022 2:14 PM, Lucas De Marchi wrote:
> On Thu, Mar 03, 2022 at 11:30:10PM +0530, Balasubramani Vivekanandan 
> wrote:
>> memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>> by the implementation in drm_cache.c.
>> Updated to use the functions provided by drm_cache.c.
>>
>> v2: Check if the log object allocated from local memory or system memory
>>    and according setup the iosys_map (Lucas)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Signed-off-by: Balasubramani Vivekanandan 
>> <balasubramani.vivekanandan@intel.com>
>> ---
>> drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 15 ++++++++++++---
>> 1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index a24dc6441872..b9db765627ea 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -3,6 +3,7 @@
>>  * Copyright © 2014-2019 Intel Corporation
>>  */
>>
>> +#include <drm/drm_cache.h>
>> #include <linux/debugfs.h>
>> #include <linux/string_helpers.h>
>>
>> @@ -206,6 +207,7 @@ static void guc_read_update_log_buffer(struct 
>> intel_guc_log *log)
>>     enum guc_log_buffer_type type;
>>     void *src_data, *dst_data;
>>     bool new_overflow;
>> +    struct iosys_map src_map;
>>
>>     mutex_lock(&log->relay.lock);
>>
>> @@ -282,14 +284,21 @@ static void guc_read_update_log_buffer(struct 
>> intel_guc_log *log)
>>         }
>>
>>         /* Just copy the newly written data */
>> +        if (i915_gem_object_is_lmem(log->vma->obj))
>> +            iosys_map_set_vaddr_iomem(&src_map, (void __iomem 
>> *)src_data);
>> +        else
>> +            iosys_map_set_vaddr(&src_map, src_data);
>
> It would be better to keep this outside of the loop. So inside the loop
> we can use only iosys_map_incr(&src_map, buffer_size). However you'd
> also have to handle the read_offset. The iosys_map_ API has both a
> src_offset and dst_offset due to situations like that. Maybe this is
> missing in the new drm_memcpy_* function you're adding?
>
> This function was not correct wrt to IO memory access with the other
> 2 places in this function doing plain memcpy(). Since we are starting to
> use iosys_map here, we probably should handle this commit as "migrate to
> iosys_map", and convert those. In your current final state
> we have 3 variables aliasing the same memory location. IMO it will be
> error prone to keep it like that
>
> +Michal, some questions:
>
> - I'm not very familiar with the relayfs API. Is the `dst_data += 
> PAGE_SIZE;`
> really correct?

This is a bit weird due to how i915 uses the relay for the GuC logs, but 
it should be functionally correct. Each relay buffer is the same size of 
the GuC log buffer in i915 (which is guaranteed to be greater than 
PAGE_SIZE) and we always switch to a new relay buffer each time we dump 
new data, so we're guaranteed to have the space we need. We do some 
pointer magic because instead of just blindly copying the whole local 
log buffer to the relay buffer, we copy the header (which is in the 
first page) first, then we copy the rest of the logs (2nd page and 
onwards) based on what the header tells us has been filled out.

>
> - Could you double check this patch and ack if ok?

The approach looks good to me, but I agree that at this point we might 
as well do a full conversion to iosys map. As you already mentioned, the 
memcpy that copies the header would also need to be updated for that, 
because it accesses the same memory as src_data, while the other memcpy 
is from the local copy of the header to the relay, so it should be safe 
to not convert.

Daniele

>
> Heads up that since the log buffer is potentially in lmem, we will need
> to convert this function to take that into account. All those accesses
> to log_buf_state need to use the proper kernel abstraction for system vs
> I/O memory.
>
> thanks
> Lucas De Marchi
>
>> +
>>         if (read_offset > write_offset) {
>> -            i915_memcpy_from_wc(dst_data, src_data, write_offset);
>> +            drm_memcpy_from_wc_vaddr(dst_data, &src_map,
>> +                         write_offset);
>>             bytes_to_copy = buffer_size - read_offset;
>>         } else {
>>             bytes_to_copy = write_offset - read_offset;
>>         }
>> -        i915_memcpy_from_wc(dst_data + read_offset,
>> -                    src_data + read_offset, bytes_to_copy);
>> +        iosys_map_incr(&src_map, read_offset);
>> +        drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_map,
>> +                     bytes_to_copy);
>>
>>         src_data += buffer_size;
>>         dst_data += buffer_size;
>> -- 
>> 2.25.1
>>

