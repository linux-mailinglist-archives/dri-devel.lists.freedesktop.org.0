Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809586E6F9A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 00:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8106710E193;
	Tue, 18 Apr 2023 22:46:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDB110E10B;
 Tue, 18 Apr 2023 22:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681857992; x=1713393992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZ/icWnFWykikJmDkny9+Gj8tFDJ4iIlIX/soKQ+aHo=;
 b=fOz2U7NXAa4ag5cj1ZKPEUrZUnWWu1dCEIAOfl/vRI4Gm+fAj5SQBaJd
 gQ9UlBjGbT+bMLujhHcPL2TqwbyCkeAyCwwKf00pTiL2k7ItHUckuOYsr
 VuCAC87jpnu/A25WqpUd6qmnGeG75mBDeAVJznZmw0F4jpLOnFOJdZ637
 WdyAUIVyB/RXK41+z8rmx4+Y3JtBLYAgtyqCnLqJzSGDa1VyuA9UNaECS
 UB122a9InSoQ17ep58sZ/DQqGDTokU3fKk8FfJuHigXFD9eDfqTzk2rXv
 73pVS7M62s1ILQZ5CCostlktaRX2QmMCkrz8933Xw3WJTOtDGeVU95c/C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344054029"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="344054029"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684773186"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="684773186"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 18 Apr 2023 15:46:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 15:46:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 15:46:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 15:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBMnh8FUVmIAOIzk4fHiIL2Xb87yUTSDfw3GygFfnvUgnJYEr0uBMouonNn6Vo4U30IqzCuxyAR3JqdmzX1RZ2DF8mVkQ+jyub27vv8N6bCrjtj4nbkPnwiA9l54WkWG0xiMrWQopi5r2zMaPqGy2Y17ruVYIzbLOMH7NGZzjRof1FhZa3rC8ST/0OTsiTYCZwybZnMyisk89X0QpMJpuyrkkKbiH4XKCAyotsNgm7KimlSSw9RSsMVSuJydKZRVcP2LvCiM6EPphhm/bTfRmwGwsjIyl266kj3O2RQgAKi8HLWXuwommkC5nRHnDhLfBxDkvWKMp6RDjW1uE0MiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNypGfKawD4WB6K96PzsqdmrdGcyZ+rUqEYb7RrF/JI=;
 b=OtWMvEBptXuge+HkcjupM/CQM7JLsphqrvHafZAnmtDCwEC3pj0Ln8dR2OkmmHzbW+H4TSCBQ0ePgWNPWEddyyBF1gM3tSzSwxbRt1l66JZaWugxKLD09qifE5K7qQPvV/jUMqvn2kx1aG5f+tDZ9deLu4mJYq/5mLql2RWjjR0pvcvSPbveOQWZBtZYyueXTzSHBc44HGp4jaxDR2Pg1U54r2dtzVGZWor8SFJ6b8G07gvJtRYyumYyfzeTKVnVCkd7NLcMC988iwMa8N6gQHFLt6JKYNd7t/6qkStGktI+3WYmOtVsJo6275F58/R90LcXCc3m1XQO5QPcJj3Mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 22:46:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 22:46:29 +0000
Message-ID: <23ca7d75-e96d-5536-25a1-a1c8a0167b48@intel.com>
Date: Tue, 18 Apr 2023 15:46:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/uc: Track patch level versions
 on reduced version firmware files
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230415005706.4135485-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1f7b52-cf7e-47b1-f9a5-08db405ebf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecMV0/38ES4Vb77oxs5plGZj1iBti3EbloqPuRX2pEc0WKN7bHvSoc1HbA3QPqqoK40XbscHpX/jCvyONq7fbB8vucR0+YDpIjx5QDbX7YJ89BL7RjYzZtMhHCglF3zCDMXkH89TnCdBat35P0u1qFXRFmHfs5WSV8VqpthC9f3B//JVBmufFC2Zf/axBduUoYbsDgop9xcb1gEGDOvhiTtHXLsPLS7RXBML6owUXEOSiDl0vEuU3uJGhWm0ur5MQA51aJpK7dInsH37+or3wZus91z6tTJmTtWzbtV9gDnz3tEqT4nOkB+HYzFyn5ngN2ouDLmXXYVP3ITaaH1zg5sIVHBDPPhWIjqA3YSvW841Vr5S3Guylxd8p3Kn6viy+L+kPZR0wuGld7Qu1vHIpjwKDZE8Oso7fWqagfweC6U9v1HVRAQrPObLnTyaXTLHriVMOkZuaSFU0PbxVpbDgzK9mGJPsk2OH/PqmEf94dX/6t/nPVfdskv/woqPH9Q2p83j27cScFaHbFcMtseMfsEmNBkdzAoSlaiIgbnhenzWjatoEHFm5xNmbSH7De7clnlUUOLkeBdPQq45lyDUvgUL3dKu8j0E9eEWmyYFHlpcsdCG1vNnDm/CHWx23UyBHP576lOt6Yp8Dk9ZU5q2vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(36756003)(4326008)(316002)(66476007)(66946007)(66556008)(450100002)(6666004)(478600001)(6486002)(41300700001)(5660300002)(8676002)(8936002)(2906002)(86362001)(31696002)(82960400001)(38100700002)(2616005)(6506007)(6512007)(53546011)(26005)(83380400001)(186003)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhBYUhCTEFEbkhnQk5kOEJpQVpyWGJ3YVZ0dGdsTGMwY1Frb1N2alpOU0lF?=
 =?utf-8?B?UUlnTkRuM081eU05aFJsV3lGd2dhOFhGR2JMcng2Si9xVHR1RWdIMUhsL0FR?=
 =?utf-8?B?OVhVYmo4SVBKU2lLaS9DUnlGeWF2dzJ2R2V5NklURU5zc0E5THRzRDdKbmxI?=
 =?utf-8?B?T3duZ0FYV2xXT21zbkJDMU55YmNTK2J5a3gzR2FOQ0JSaU8yRmt0T0svQzRN?=
 =?utf-8?B?T0l5bXVNZGlveXFUM08xdkQwUVpHR00vdUNzSmJpNUhVMitWL0huRE04aHR2?=
 =?utf-8?B?T1diR2tjcmxIaUUvMWxJMis2NVpMS2RZM0h6eG1LTFpuSzlKUE9mbUZSYkJv?=
 =?utf-8?B?cGtTU291QmxlNkp3Rk5YYlJFVkFNQUpNOTlIQ1Z1QTFhUmZWNEQ5K3I0Y3Fz?=
 =?utf-8?B?RGwyS2VweFJJVnBsaGRqS2JYLy9yOCt1ako2cEttWjhSUzBKanpKbWxhUE9F?=
 =?utf-8?B?WTNhdjRnMGlSN25xODdJQUd5dlZ0TFR0UGNiMWRjbHY1Qk5KYzdwL2xhelZF?=
 =?utf-8?B?NHNlZXpUZFh6alB0RklHSGs2NWxhYUZMQjBXYVNJL2F3bVhieHFIWGxSbW1w?=
 =?utf-8?B?VzZsb29wZWpDeWw5ekd3V0E0TWFsY2p4T2lZMmFEclVsb2tDTnE4Q1VFVFRH?=
 =?utf-8?B?K1VkbDhyQklmMVNaQk9QV2k0MGljWXhHd2VudzNCTi9JdWI5OERBdG5ycDlr?=
 =?utf-8?B?MXpHd2FyM0VnUTZ4K1RhMjkwMEJDZktQdXZOOHpGdFhRVk80Q0xwWHNUdEhT?=
 =?utf-8?B?V0FrQXBIUWhRS2ZuVUVWeU1uWEtJSFFYMnRlTTZSOE9CdDhEek1aWW1sSTg1?=
 =?utf-8?B?QVdXMXRWYURqTnFTK0RMZUdSUHlUblZoMXFWU1VxY1ZOcTF5RWVoUThpNjMv?=
 =?utf-8?B?U0lrMnNncUIwd3AzTVYrK05XR3hRSEd1K2QzYmpNMEV5bDQybFRtbEh4V2J6?=
 =?utf-8?B?bWNBVmVvSzBQUVdxZWhETEFwN2dURk44Y3djYnJrdTR3SG9uV2FLZG5zbUpB?=
 =?utf-8?B?OEJhM2NiQVhrK1NnL3ZUL21Yc2FxblZQa2tkOVdpbHlVL253V3cwTkFnZW5G?=
 =?utf-8?B?MEU5R1d4QzhSb2o3UHp0R2VjSWZ4a29ZN0FrcUxLeUhVMUdQRWVRZGJROWwy?=
 =?utf-8?B?clpvSjBSN1Q5dW8yc0FTbElEZnRHZjQrWmRFQy9jLy9aV0QrYzhuOHpGNTVx?=
 =?utf-8?B?NG1RR3VQRnV1ODFMdDBrL0tGVTJnUWRiVVUyWEMrZGFMU2NPRjdGcUhkbnhp?=
 =?utf-8?B?YmxhZmpSWXgrU1ZMUGpmTHpOaFFPbXEzcEVDK3JCRjVnWmY2KzJaRjFvNVR2?=
 =?utf-8?B?Vk5JUGZoZFhja0RjTGpoNnd4UXpCMUpJK1kyN2JsNWNqUjYzQ0hSWXpZekt5?=
 =?utf-8?B?WVQ1akRiMFJ6aUdHRkhkRkUyNDI1YkFKWEgyVHdaSWF0RnQ2TWRaV0FVQ2dJ?=
 =?utf-8?B?OXo1a3NkMmJDbE9NRWsyUVVtTjRZWDc5SE42R0pJRGx6VStUbmN5REs4bElZ?=
 =?utf-8?B?MXdSeWZJVWxnYURwZ3R1dnVUbmt2OXlYbnI2UUJIR2tqOGliUjI1ZVNpdlJ6?=
 =?utf-8?B?bmppMzVIOHJkYyt6QllSNnJJYm4zMkxtaFgvamRSS09DS2M4eHdHRzhWRXJJ?=
 =?utf-8?B?enI3OFBRUTFPcm4vbUxCL0hTNmErbmNHdjJBWkRhNVBidWlNTFZuRERVTDNK?=
 =?utf-8?B?V3o3VzMzRUJKQS9vSVRONk9HWUx5ZG1UR3dPZlhTNGhNTy9naW45Yk1MbFdr?=
 =?utf-8?B?YWhiM2ZlN2tIRXdDckFRQ2FRck14S3pVakoyL1o4ZUVYUTBLUGRjbFpFUTEy?=
 =?utf-8?B?NFVZcTBIVWl2TnZQb3R2MVdYUG12NHYyQWEwZ1hUN1NxQTVJc2ZYUlFUdnkz?=
 =?utf-8?B?UXVhZi9aakN2ZTE0ZDJ6RFNvaGhMNmJYL1BrMFgxS2N3OGt5aG03U0doVWdJ?=
 =?utf-8?B?cWhweU8vbVZVMzRLSms3Y3NWQTRaNHV3bU4zajUyYWg2MFM5eFlvR2FiS0hV?=
 =?utf-8?B?djFteGEwckFWbWdhK1ZNbVBQTmVJT2QzdVp0dTZXdUpZQUZRbTdVQzhZT0xX?=
 =?utf-8?B?VTZQSWlvZjl2WnI0dDdieEpxb2VjeTBiZW9CT3FsSnhhTmFLNjcvSTladUVD?=
 =?utf-8?B?Y2I4WjFWakEwdmFTQjd2cmVUR0RoT016Q09PQXR3R2tOU3ZSdEoxaVEzbVNt?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1f7b52-cf7e-47b1-f9a5-08db405ebf7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 22:46:29.0519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ma9hFQyWwQJ9ODNfudF3V8TMlMx+U+oGG+G0q8RME3DgZElo2itjMSQ6GpXk6SNFR7ZXEF6ncJc3ST1omuLFk17XWSX+e2sXtL7uPz2bppE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When reduced version firmware files were added (matching major
> component being the only strict requirement), the minor version was
> still tracked and a notification reported if it was older. However,
> the patch version should really be tracked as well for the same
> reasons. The KMD can work without the change but if the effort has
> been taken to release a new firmware with the change then there must
> be a valid reason for doing so - important bug fix, security fix, etc.
> And in that case it would be good to alert the user if they are
> missing out on that new fix.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 41 +++++++++++++++++-------
>   1 file changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index a82a53dbbc86d..6bb45d6b8da5f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -80,14 +80,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>   	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
> -	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
> -	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
> +	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 4)) \
> +	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 4)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> -	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
> +	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 4)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
> +	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 4)) \
>   	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \

AFAICS in linux-firmware we don't have any 70.5.4 binaries, the newest 
ones are 70.5.1.

> @@ -141,7 +141,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	__stringify(patch_) ".bin"
>   
>   /* Minor for internal driver use, not part of file name */
> -#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_) \
>   	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>   
>   #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
> @@ -197,9 +197,9 @@ struct __packed uc_fw_blob {
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>   	  .legacy = true }
>   
> -#define GUC_FW_BLOB(prefix_, major_, minor_) \
> -	UC_FW_BLOB_NEW(major_, minor_, 0, false, \
> -		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
> +#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
> +	UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
> +		       MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))
>   
>   #define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>   	UC_FW_BLOB_OLD(major_, minor_, patch_, \
> @@ -296,6 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.ver.major = blob->major;
>   		uc_fw->file_wanted.ver.minor = blob->minor;
> +		uc_fw->file_wanted.ver.patch = blob->patch;
>   		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>   		found = true;
>   		break;
> @@ -776,6 +777,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !guc_check_version_range(uc_fw))
>   		goto fail;
>   
> +	gt_info(gt, "%s firmware: wanted = %s / %d.%d.%d, got = %s / %d.%d.%d\n",
> +		intel_uc_fw_type_repr(uc_fw->type),
> +		uc_fw->file_wanted.path,
> +		uc_fw->file_wanted.ver.major,
> +		uc_fw->file_wanted.ver.minor,
> +		uc_fw->file_wanted.ver.patch,
> +		uc_fw->file_selected.path,
> +		uc_fw->file_selected.ver.major,
> +		uc_fw->file_selected.ver.minor,
> +		uc_fw->file_selected.ver.patch);

Some of the info here is redundant from print_fw_ver(). Can we have a 
single print with all the info we need?
Something like:

GuC firmware i915/mtl_guc_70.bin (v70.6.5, expected v70.6.4 or newer)

Otherwise, I'd suggest demoting this to gt_dbg to avoid printing the 
same thing twice at info verbosity

Daniele

> +
>   	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
>   		/* Check the file's major version was as it claimed */
>   		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
> @@ -790,6 +802,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   		} else {
>   			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
>   				old_ver = true;
> +			else if ((uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
> +				 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
> +				old_ver = true;
>   		}
>   	}
>   
> @@ -797,12 +812,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   		/* Preserve the version that was really wanted */
>   		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
>   
> -		gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
> +		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
>   			  intel_uc_fw_type_repr(uc_fw->type),
>   			  uc_fw->file_wanted.path,
> -			  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
> +			  uc_fw->file_wanted.ver.major,
> +			  uc_fw->file_wanted.ver.minor,
> +			  uc_fw->file_wanted.ver.patch,
>   			  uc_fw->file_selected.path,
> -			  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
> +			  uc_fw->file_selected.ver.major,
> +			  uc_fw->file_selected.ver.minor,
> +			  uc_fw->file_selected.ver.patch);
>   		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			INTEL_UC_FIRMWARE_URL);
>   	}

