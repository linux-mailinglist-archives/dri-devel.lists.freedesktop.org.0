Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701EC4DDC55
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 16:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3C10EA3E;
	Fri, 18 Mar 2022 15:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DDB10EA3C;
 Fri, 18 Mar 2022 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647615652; x=1679151652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mB3MKWwM2fGmlpPDRCK3kd6fmW1nHOMB6/lW2O5tEzs=;
 b=KSq+1XfHpK1FevvLH5d/7Gx9mmkQl5jofENTq+CRnAmzJjjBD8pNdm8K
 xtr7rhOiuIMHTyFJvZ3C02PrujjNARjF4MB+u7C3K2NH+WdPevIFfVSJk
 cWfuOYs+OSURTKsT7ji4X3NBlC9rY3vPoId5aCtw8q7ZbJjiJtZcyBHfb
 fBUPOz/q4kG9FgV07cKnviknYwRZHz5KkcczdIF32bsTAg/f+DIxoA2ot
 moZQV5z6ZB80jsTt3FX6SzAEYP8AntcFU8U2tzAf3xomw5DhirYZvLBhW
 t/tqkq4y9UNCgQAeGHtdUWM3Ch7aL2DxQ1Pue1Gc8qQPrMEJVmBgGKdLd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="239310338"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="239310338"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 08:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558478772"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 18 Mar 2022 08:00:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 08:00:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 08:00:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 08:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY+I1wGT+v0gCW8D8gX+Bh4l6S8MRxIyVNXHjrVOIduqpOTzm5h5HH/TLUxCC/4jU8b0vRCYQkDdj8IX8s+W11gwRUqu62fIkTpmJJ3O4msXFUT4u6MsqOsts7UOStySjzSRyVozfu+/88ygWXkTiRc18Gx7q1JNOQPvKzj885ecu1ujXcdA/KoAjimoeF7AFyKy99H5m9JqPMsSSTziTpSEPrRME4s+K4zCyos5TdEFS59gbB1thkzwf629xbZ/nj9wScd7kYtd2/rzL/vYy4618Jo3OUFeq8XdDS8iAdIzXFT1N4Mxsg3kR00pCoIqH3AS22/IzJkh0invAm6yHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqjhS5JuMfpURC4xkVG6NZpQDWd8kerl1LA3EunanlU=;
 b=LQIG2dWb2fc8mYfmr7NEg6/wMP/BuNcsj82Bp2rWnW3/tMrfm3YYRuHEbfll3Y+TZ/t2e1E4LxDzL+RZmc7ixeDImSX5uLvuO6EmnNqtaCfw1ixFfpsQmQQSqpzsgI0N932fzL2GHVjEwlrnC4rz+bqDaAxj9QQDqgR4Kg6/K2Jv961ccOc5Ghq66VnMwGe6J0mreWnE7SadOhJuS683GCSutP73CXnSBD0qq6GReW/LjPzol1E3tLThkBsnaWfQIHUHYNOxRFSYohLQCoc1Kc7wkzrbR0HMbn5ih8Sj2Zaugl4SFaHX8FxQYEj2XZ1VcYVT3nIhJbU9o1yN+dfeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Fri, 18 Mar 2022 15:00:41 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 15:00:41 +0000
Message-ID: <7eceab36-9ace-c412-8aca-0fbb4fc16a52@intel.com>
Date: Fri, 18 Mar 2022 16:00:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v6 4/7] drm/i915/gt: create per-tile sysfs
 interface
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
 <20220318021046.40348-5-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220318021046.40348-5-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::18) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bbd4888-38a7-4ef0-a385-08da08f01202
X-MS-TrafficTypeDiagnostic: PH0PR11MB5030:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5030020B0B628E2ACE173F49EB139@PH0PR11MB5030.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b746peU7D2AzYpXqKA+mvQ/FgQdVntptFbFWJgw/DHUjmPajo/LlDeLxdv6bggiu7TeGX79x8QxxzcGJPRLHUCYRvz2z91xOnbQAMIPgv5JdK7P90sRkC76AiKctcUL0D1ZaS+zKCpZU57ZV9Z1E1iVtW9j5cCiRA7qdjLqf0trwbYNIuieCrtfYLG2I76sfCSg1zjxwkWUHuMDaA+yoPj/pdGPEy1PPJ82LiYohYd+dQ7j9TDwD6wwkQb2HsFJnVWIx2dS2/CyhpJkIYD3JH44OXihJwU1vvK0eM+WbRRnxV1S1vaXgZnh+XRQSVUYOPANBIsKsoDSgazYuDAzFaQxGlTJvUi1JzeC01uPB9h91rzGg/qDqCOvTNjKpz4Kt9ZRpDeZ2ntAc/ZPhC4QMW9o2/cTkpxbfgLurj4qAQPG4TFbQMG8mxkQhIrPbuddczkB0jBxyjyV+H8rhtdVnF9iF2/A+OtZAAq0IwnYrBEB2iDUb/KzN78Y5hLO9vN0nTu2ze7P5Mxf5YaVeHQUW0ne8YMEpjxyRlZHl3y08M+ArVLnGCn2sv9wJnFVW+uEbhN3qNVZpEUrhmsL9ciEy3ny1E5zuza3J3fOsb229rDN4BCDDIB1DpazCcx4mdoAnMAMYj8vTJ/lSiDBPRJTt5toTrczmB6QA6toY1dV7HmtYP4jNdIPQ0QtHakTP0PljB8UauLXYT7O56Le4zn/6k0+33PiWQKD7/dkirhnM6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(44832011)(83380400001)(8936002)(4326008)(186003)(26005)(66556008)(66476007)(66946007)(6666004)(2906002)(6506007)(36916002)(38100700002)(110136005)(508600001)(36756003)(53546011)(316002)(82960400001)(54906003)(6512007)(8676002)(86362001)(6486002)(5660300002)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjlud3hGYTc5QjVWc1ZlanNBOStPRUZpYnpJckpYL2NJZzU4cU1EanZSVG5Z?=
 =?utf-8?B?S1p5R2dESWNqQXlkNzN2Q28yaWNXTTZRZ2pybjgwcU5Qd3hsTytEbXkxelU1?=
 =?utf-8?B?V3RvZUY0OVhKMGp4N3pDcllPeEMwbEkySDYwMFVVY011UWZVRlFmUURxSnNk?=
 =?utf-8?B?b1ZYeElBM1dSREZsR2h6YXp5MU5aODNUR2VQQlZEQS9HK0E2MVNqaDFKR2V3?=
 =?utf-8?B?NkhzeGR4NDk3Wi9QOWxIcVpicGxwTXB2VFgveElkbk5GeW1wMDBVZWUrczlI?=
 =?utf-8?B?TW5hMmhKYTJCVnVsdktsbU9DVkdpWkRGRXF1eGlUYmJzOTk2UEFxT3NuRHlV?=
 =?utf-8?B?U3lLZG5ZMnB0SGxMa1lDTGtFMGhjUk1Mb2Y5M0ttYzBYU0ZJMW0wRGViYkE5?=
 =?utf-8?B?dGwyZmlubGRoU0VOcm54QUJ5OGVpWEVVZmhoVmdkTlp4YUtBczd6a2ZqbHVM?=
 =?utf-8?B?S1lrOHR4bk9WT1FWSDhXc1NHVjFPWTBsSlplR0QwdGtTWkVLY3NXSkorWUdF?=
 =?utf-8?B?OUt0UTFaQitaSUtYTjg2Y1VoUmN1aHRPVjRkanpPTStsYXVoSlowdm1BeE5m?=
 =?utf-8?B?SE9oZVZoNnhVWk9TaUpuNmxQWWhtYUFqQnVCZTR0OGJLVXNhdHhOVEZ0cHVF?=
 =?utf-8?B?OXVNOEh3Rjg5a0FrMTZVakV6YXFoSllZR0ZNanRRWVp5U2g4TWFlL0FFLzVZ?=
 =?utf-8?B?MzZGNEpPZkNzNURhdkhmS3c1c2V0L2picUdBbG9vTlg0d2hDaVZmWEQvaExR?=
 =?utf-8?B?ZGFrMkJQWGcrcExodjJJb1pMb204dXFUb2N2QVJvMk9aa0dmYVQ4bFlVRW1h?=
 =?utf-8?B?SGpnc1lLdnRFUjRhZGVRZDVpczZIYlRjZkVSbDkzM3J2NTV0dU1YY1ZTNDBm?=
 =?utf-8?B?VDBKQkliSG1EZlJpRVAxVjNvNlZ6TldoMUZkcE9EYjl6RkpoNERBK2NmRVor?=
 =?utf-8?B?L3UyQTY3YW83OElXR25GVEJpOWtESGRIVURoekpBSVZVTkxadHdFRHorMkxx?=
 =?utf-8?B?VWZqb1RzTGprTkEyRmRvaTlvb3JrZWtCSDg1cnJnN054TDMyZXFodFRTbnBT?=
 =?utf-8?B?MVBaUWNEQ0NNNEpZaUdHSjZmNGdaendTV3lyVEtUY1ZSLzZhQlEzM0JpTTBM?=
 =?utf-8?B?ckZTQjJ2ZHYrTmJ2MlE0YXpBSnRJZUVKM0R3YURCMkw0d0ZyS3NSKzdtMHo5?=
 =?utf-8?B?ZitxNSs5c3FjNFNOWjdzWkpEaDFwM3lQVTFpL0h2bEJwUmlDK2J6SlNqMDl2?=
 =?utf-8?B?RXBJem9mRmRXbG00Ni9LWjNYMnp4MnNLNUpVZ2ljeGlsK1d1OTN1OVcybGVn?=
 =?utf-8?B?QzZYbUZJNEhzeS80N2NOVlIyclZ4enJwcWtXMkpLclhYTTRRYlFsaklseTNF?=
 =?utf-8?B?QlJFQnpWNE8zZnNGS2MwUVFGWVh4NDJQMXZwUVp0emhtaWdGTC82RVVTWmxk?=
 =?utf-8?B?WGVhRUZ3ZDRUUnBmVHM1MUt0QjFDUnNzSWNJZ0tkcFUrL1ZoUXp5YmRjVk5T?=
 =?utf-8?B?RWFBMmcySVFHblR5YVNMRFhmYnpFbUtHYjZFVDlWQVJOakluQjZqb3pNU3hH?=
 =?utf-8?B?eFJ5ZjVLS2JpM1JiLzB0bVpMejNzUSt2NExGdTBjMGtjQytnVmFad3pDMUh6?=
 =?utf-8?B?N29oUkhIRTJ5UWdzSGJUVmNPZmFycEZ6K1poSU9IV1hHdnVtODdRMkpjcGRU?=
 =?utf-8?B?VEV6Ty9nSThISURLRmRBcVpqQzZVRm51K0VkcytpZTVhV3VHSlBFRWFBR3Zi?=
 =?utf-8?B?ZjNNWUNVcHRQcGlHUVZPSzBNVEF6L1YwNk1VYm9EeGpHSEdYdG91Qmllb2ZS?=
 =?utf-8?B?dW9kNjRCK09oNzUrRE5VUzVLeVVLSisyQ0xoOG9tRmZxY0pJZjkwMzRuTFp3?=
 =?utf-8?B?VGRnVE15Zi92TXVRK1hPTE92MHd0OXVwZ2h2MFV2UVJoS0ZGNVozaTRwdTQ4?=
 =?utf-8?B?aWxiVmw5RDNZVWpwVjZidEgzczJpN0gzakR2U2xsSkhldlEvZ1ZqYUdtSUhD?=
 =?utf-8?B?eHMvVVBaREtRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbd4888-38a7-4ef0-a385-08da08f01202
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:00:41.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wz0ZID3oPebRGZFvzL8XgNO0d9R+oLNrLvMb0+rCc/x+ftfyCnStF4mshfVHCeeZmPuyAmSvBdv1Jify++jw2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
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
> Now that we have tiles we want each of them to have its own
> interface. A directory "gt/" is created under "cardN/" that will
> contain as many diroctories as the tiles.
> 
> In the coming patches tile related interfaces will be added. For
> now the sysfs gt structure simply has an id interface related
> to the current tile count.
> 
> The directory structure will follow this scheme:
> 
>      /sys/.../card0
>               └── gt
>                   ├── gt0
>                   │   └── id
>                   :
> 		 :
> 		 └─- gtN
>                       └── id
> 
> This new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile            |   1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 103 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 ++++++++
>   drivers/gpu/drm/i915/i915_drv.h          |   2 +
>   drivers/gpu/drm/i915/i915_sysfs.c        |   7 +-
>   drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
>   scripts/extract-cert                     | Bin 0 -> 17952 bytes


With above removed.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

