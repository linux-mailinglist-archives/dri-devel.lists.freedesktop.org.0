Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC04C8ED0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B004710E582;
	Tue,  1 Mar 2022 15:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B745B10E488;
 Tue,  1 Mar 2022 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646147961; x=1677683961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8hzu8SG1LqwL4FbcVEn77IXg9kmOnwypp/HCGqevz8w=;
 b=DLTlbYc9xMk9phDYtmAp4S+wEGAdpoFcEU0WW+dd4eyMUuGM97hBo/nF
 XyziquAnTlvKtIftYvtI8YE8s7/lZA6XDh1kDQmTU0IXiZAExCuBk9M5s
 1yvYXSBlQUKJSSeBRJDomlBHnBkxfA8rqR9dghS37Nt0ZBLhsTnfH4GwS
 +M73fkgRDWbA7WGzUqvQ/qny/rDQjvq298g1FwiUghRZ1PW2x+F6pypA7
 BaUh5ScpEFUV9ScAaDbMjMDg5xdtE2lM6VfTFAcrebnPXV/vHkxILZyKX
 +iJogNK4GfQ3yztATk7CmPNdc26j7LxJXg3QW7YeQRrJXaln+9QdUND9f w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339583930"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="339583930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 07:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709094386"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2022 07:19:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 07:19:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 07:19:19 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 07:19:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3CqqoBQGP4OYo9FbcnVtTrXgt/Am/3IetRLWNIb32Mx477M6bCOVv1q3gaW5UIVXEp1gDYhe5km9q4KcHUg9hNNYbWVOK94F4i35f7ijuiWrVYgZOn0zfH3T4WjIBMXOa8jwo/ltBpxyDGxJ+FRnI+oZ/a2EA7ynowVKRZU3IEDs5dbURS4R7Mkl2wgoP9GpUSyLQlqRYSNZeykNfGjovEmwTktMKqUYlV5Gvc15VEKxJn+54vtrWQrsHJ1BJxTEEE4j6z/hQmO871mp5qzhAyjdLGFO64Z5C65ENgn7AXVj2bizKNquJTs9JIEdO8Sip6HRahGulfDDRDzfbUFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hzu8SG1LqwL4FbcVEn77IXg9kmOnwypp/HCGqevz8w=;
 b=AXRfgOGHhubrXtvl4XBtlHJeVOAsrLBdzeiZsfvAQBmSibZE95gV7pnKix28ccuGx/A1ot9OcN98EesF0ZmpKNQFDrHD12qzQ7deN9DOWwo9r7xNMm0JrtBtuB8Qdx7mHUkzDNyPPtnl325oy+0Fo4fSx/OAsO7v0TgMDOHR8xE+xETShbyi1I93FwSHzMYe5dFvDt29K3Y5Q6GXm8w8z/LnJ4YjJUI6m0WtW5zETgb40nClLnaD0sK6swaWA/iy+cQz6ZuFa2niIN1Za4+DmLfmon2kC8GiZAPFVmkuXdHLb5k32cvAfavn/i/Su060GIaIqWGoCtdDXyNdT+JESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR1101MB2138.namprd11.prod.outlook.com (2603:10b6:4:57::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Tue, 1 Mar 2022 15:19:17 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Tue, 1 Mar 2022
 15:19:17 +0000
Message-ID: <0765349d-90b2-5fa7-941e-30b55fef310c@intel.com>
Date: Tue, 1 Mar 2022 16:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/7] drm/i915: Rename INTEL_REGION_LMEM with
 INTEL_REGION_LMEM_0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-2-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220217144158.21555-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2005ad96-dacc-42e9-3085-08d9fb96d9ec
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2138:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2138C6303517C9D4E7E68AD6EB029@DM5PR1101MB2138.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cr9kSu5cl1CBr9eG+TRCngWdULcGDPrKXdHgw9yhrm45LJSZWJA3aAxgUxhygpuJaFPz8tZXNMoF+CMF8OvuAOjR6/jN/Io9+73fwAgVIQUyOxSP/2+Dx0eeGWNrYfjiTEGKkxSjAdp95VxmV/LuvMCtd30j9zHQ1RdfunltC/j+mc/r7EKvrrPFIbFskRTrn2ztvr4XN8D1JWM36Cmt4Sc8wdSU6WXZVAXTSut31UThfi6hu9L9x9V9Mwkjn+nthcXKAyiCU7GHen82BrObmld+rxcTU8WYQjyL6RngLQLlCk+/iFuUPmqWjy17514+UvpRRBty+Z/aNV0gdAvLVRyNq0DSz9ED/actLI+jJvScVdq4aY+GcPkJCwRPtXYy292acXGDi3oLA/s4Yv5jyzkp9SK+0X7N0TxK9l/kKNl/70hnpoDJebfhbJ0tFjFpW+BQYHaXiueo7OlcSY5mfrWGcL2YZAOg+YR55YxD69CQplfAu5fHuJ/e2DwQCwiM+LBDmCK7RJKiHIldfq9Pgbp2nvPNiNm1ydpeGK2km74SlXrDLhVGLgn40WcDnV6aMgL5xrfFx9Gjbv7E9b5rkgAj1+8n3uLzZTTcXjbwZt/tZJPiR2cuObsz0Rp9R1WqzXzlym/Bj6GAIy1C3LRG0BfDqOqhrKlHGn6D4gQl42frpH4u27sJ1yY5JYmqwIy16+LTeWdb8XszIMr+g0TxB3Hyr3nBZzcBh03IFDfNR+ORgh1KWQ5CXB82aemu6XVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(4744005)(6512007)(4326008)(66476007)(66946007)(38100700002)(66556008)(2906002)(2616005)(31696002)(86362001)(26005)(5660300002)(31686004)(186003)(44832011)(6666004)(36756003)(8676002)(6486002)(508600001)(316002)(82960400001)(110136005)(54906003)(6506007)(53546011)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tyTldKcXlBMEFHRkNKOG0yb21Db09nRU1kY2h1S1dPZS9Lcm9lcWY3eUdZ?=
 =?utf-8?B?RElFL3dEYTBYcTYwcjVNaGlyaWowU2VqdlA3Y1pWU2hHbHhnaGVZamRWeWNn?=
 =?utf-8?B?RlRRMkZRSzh1MFRBT3dkY0NhSlMrVFRnaWhYVzlSbEtEeDNvMkhFVUE4Q201?=
 =?utf-8?B?WU5lM2N1djZaeGdGY1hsblJiRkQ2Z05OandEUld1a0IrZ0JDdStWREx2NFdq?=
 =?utf-8?B?cnZQS3dqaS9VTlQ4WndlUnBWdTVFM2JiZ21rYjVlS0JOVDdZbUR2aDlvM3dK?=
 =?utf-8?B?S2tPODhKL1hFeitFWk1pSUpQL2liWTJTOEJHZGY4aFp6SFdjcEE3N2lObVRE?=
 =?utf-8?B?R25Ua0UwMWs2VXVJek9YNk9wa2NLLzIvUUNoRkxaWFRMclJ1dkhjSmhOU2dV?=
 =?utf-8?B?Y3J0T1NrQWRvUDg1VGtzMVpYakJUNzI5WEh3T2FzYzEzNGdlVElhTkRHYUcx?=
 =?utf-8?B?NnBYeGNHcUQ0NWQvK1ZpVDgwc1JPcHpBMXRuVll6QlQydVhDME9xRms3R3hk?=
 =?utf-8?B?VVRtL2dDUnA5VnlsREszczhlWm9HSHdiK0JXZW1JWk1kVWtBVHZWZXJFb3FF?=
 =?utf-8?B?NDc0Yk00WFI1R05GdWQ1M2RXR3hMRG8weWk3alpsNlpCV2NFWHczOHJtOGhC?=
 =?utf-8?B?ZzJCZjRwa1doeDJDa2JCdTVEeDZxeitiSE81VjlaUk4yQytuekQzYW5odGM5?=
 =?utf-8?B?SzBtOGgwQlVsdXNmeTA1ZkF6ZjhvcUlDZm1oQ2J6WGRTVWV0aFVHaEdoemRw?=
 =?utf-8?B?bEh1SThJd3R3dzZpM3ZiTTR3ME1tU2xwMW1IaGRuQWw5d2RtcWdYWGRkNUEy?=
 =?utf-8?B?dHdSblNGWUp4MXVOdjN6VEo2TFRhUzFPbDREcDgwcC9mKzZVdm03ZklUL0kv?=
 =?utf-8?B?cnRFUHluTW1tb3JFUFNWS2VETHBkcXM4eC9GdnZNMnFiVlRjMDlSdVhtelgr?=
 =?utf-8?B?NTZtc0hsS1BkUzZOUDloQ2hPTTU2R1RuOHpncElQV296Z1hSUjIxbXJLbS9z?=
 =?utf-8?B?MVp3dFRPVnMzYitack0zRmtNL3pPblZEdnRtaU93bTQyeE56U3VsaWVyVWw3?=
 =?utf-8?B?WnlSbXIrWUllWTlrZEtoWnhHVEo2N1cxdWJqL2tWRjR5SC96elQwYi9maXhR?=
 =?utf-8?B?M2pveDV6SjA3RmN0LzRDdlJTS0VodlRScFU1Z3VUcjhldWJmNFVJWlFnZmxy?=
 =?utf-8?B?enFNUnlMZms0Um1WRm0vbGVmSEdXRWU4K0lPTkZWVExDNkVyQ01aMVRYSXdi?=
 =?utf-8?B?UHRNcEg1QU1SUElNZTBBNitpdEl6RGlsY1h5U0RWSFdaRVgxMDFJQmxiT2xa?=
 =?utf-8?B?MFZUNW9MQzREWlRXM0xzU3ZySnE5bnpWZkc0Vm52b0pwNVhKWFpRT1lnZzhu?=
 =?utf-8?B?RXV1YmxMZEdzbXRZRnRBNHZlemtQeE5xaUVkN3MzaXM4VUkra1FLc3U2dE1j?=
 =?utf-8?B?MU9pRk5WWUtkaDhadld0VGIwYjRkTkk1RDdDVXNHQ1h1QkY4cUx0VW01NlpD?=
 =?utf-8?B?dGNyQWplVyt6Yi9rOXdlbllhZ0R5Y001Wm4zNGs4dkFiRG4rVXVRVURMMmlK?=
 =?utf-8?B?QVVOMm9VS3RlZkQ3elhpc05sMzdVNDE2Z3c2SXNRcDJIT2Z0eit3a3dockF5?=
 =?utf-8?B?OFE5dEtkeWU3MVpnSnVFc0h0bFpobUI5Z3ZFSlRKSDNoZEp3bFNPSXBNRVZx?=
 =?utf-8?B?Z0dqTE1JY2MxaFJoUlQvTEZ1eURoMDAzclpTbXJ6VW9yanA3YVZ0blM1UUky?=
 =?utf-8?B?N3pCUVpOTGYyWldwTksvb3V1R2hwbXdna09TME43MytDWmVrNnl6TWtxaVMy?=
 =?utf-8?B?RTM3YmxHdE4wYjE0b3I3NHFJRVJobGs3dVBWWDAreHZFVGNWcFFaZDNwbysw?=
 =?utf-8?B?dkNiMUo1MGV1ZStYVHU3ODdIcnNwaVRmZVhURFp2Y0t0ZUpDMTRFL0JIc1VG?=
 =?utf-8?B?NG41YlRCaUlIL1Q0a1BYMUxvdEh4ZmNaMklkSXlweFJ4dnE3MWkrZjN6MEVR?=
 =?utf-8?B?bWsxWGVpZjhlcCtxbnR5NW1zcmRSdTR1cGxPd0FCVldyQnVQQ1o4WmtGYUJN?=
 =?utf-8?B?cXBZaFh2T3lCNC9hMy9JZUwvelBWZE9hSjA1YW9CZy9SeXBjcXB2RmFmK1hN?=
 =?utf-8?B?aDhsd2I2QVpYUWhBK1JIeFJkWU9jQnZCUUZvdU0zVDF3ekg1VSs2dDVhYlVQ?=
 =?utf-8?Q?dUM2bpklEWhGPYuLldEE7jw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2005ad96-dacc-42e9-3085-08d9fb96d9ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 15:19:17.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDZ2oa4Vgu4GcljnMKQ+wDPD/KYGNljMz7NTJ7jApPJ4s2k3E9FeHNpBDaOBXB+rwnUYAuzMe4kM4Kbf5Wx2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2138
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> With the upcoming multitile support each tile will have its own
> local memory. Mark the current LMEM with the suffix '0' to
> emphasise that it belongs to the root tile.
>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
