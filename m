Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307315AE393
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EDC10E5EF;
	Tue,  6 Sep 2022 08:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6847210E5E4;
 Tue,  6 Sep 2022 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662454651; x=1693990651;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+6Snb51yWiSWVt+QLCmpYPAy9zFOqsn/wq8k65jIEzc=;
 b=B3HoeKfUGxJkBtaC57Dt+qsolIhb7qEkh4XvOKts2Kc8XlOUZK6Yp3Ns
 giXQFMTGl5x2tHQFeBuppaeTi3Ca1U7j12yjYwortddT/DZC6JOywQweD
 jTaEo/ymFzAnZiPs1+N+GYYQmwgs5iOXqk1IDnWxNqIf9yn09gOZcG2Hx
 m4A/pY7LKowXOGD+ybji9HRGHCa3vrffjFKxe/iVYajR5PxF55GgyE6sl
 +FHsV8Lugmc8y+sVwQ/mPDA4z8wr18NpACrhrmdpmBegTiHrjsF+GOm/g
 CKA/ae8KaYl/sS//M496YyxF+d3ocR56yvhr4Emnrn1WiqUf8ty1VrovX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296544243"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="296544243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 01:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="942376333"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2022 01:57:30 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 01:57:30 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 01:57:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 01:57:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 01:57:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUWwDKF6CqSHFmqylyYjusdomeQj3KJrN4P9cFU6LBfhfRPpDeBxPI8UTBsiVGDpAhqr7SL854JGHWDJDxwhOi14ImOen6pGNGFcV0dopBx53TF+YQfQzxjCdU9Rrt9qgdpQPQOtraaW3IVs+KIaXFVnDXsmHNvGA1uTbQWTu0xZE20dykGW+MVDzt4RiGGCK6anmGlqwhkbjBd2KkI+RLnUwpM5RwVllIRdxP8NfXG5C+tn8c6hHK+0yv1x8P1jovPblnHjeGqjk7maHG7kFPOlVm303EuSydCgAcA0LlS2QLS3QOCpzCL6Qi6ynz5s/h5gXITueYcVB1Ag0zxtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MdoTj7y+8/SQ55dHuEihAEFVwqr5ORk39Fa17mTXfA=;
 b=Z6oTgApjxZWaZ9N//3pqnTw05oKMj7wRcmAbUPh6P8e3/JjD4TQNT/NQcZ+NwXdejlVPLfx3J4azjN8R5CFT9kM5WpbnHsGeVytHiWDivYGmVUGLKzB0A2IhEGYGoB26tV3ay/xxzQOEr2nfVQtHU6IUd7ASv0V5VcChDm28I1gCP0GzOlXhc9gCBjwjkdIyvFvMJ55D6vHv5u7iekBpjuLkCBNmr0iWwwbaKRHSD2mi5IlEgAEwQCbCc1sAO75ECTwc+Q4TJ7GrQdDZXRhBCO0dkpXeUoyyCqOFQSrzYjRiJBTr1jaaDgckPeuiTfyUf8Ronk7+jFK2V3O/3bagZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by BY5PR11MB4290.namprd11.prod.outlook.com (2603:10b6:a03:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 08:57:27 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 08:57:27 +0000
Message-ID: <e222d825-ce9b-932d-7d7b-6e5151be4441@intel.com>
Date: Tue, 6 Sep 2022 14:27:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v2 10/12] drm/i915/xelpmp: Expose media as another GT
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-11-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220902233257.3088492-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731c5a10-3699-4401-cd49-08da8fe5d2d8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4290:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JejnDskG3J+TnQl0jlMqyFfidkpxUhAevKQZOmF1SoijuonodcK1v2WZWEH8QJmdVsKNcxdsTWenYExRLrqgMW8XWHir+Kdsrr0IyzbwLKJhc6JMqoteaI2+1XRZ8lRXHeEjfsV4uU3yOlmXA1od4GlDEwnT3CZEjXy42bXA39wtZ9w++ElKfzPCcnSyjTAO0ASzSZs5PlpkGCn1LLSO1ok1gIubF+AtIRnLkdIQsKbEZrxilP2SN3aAAuco0ODwEj2x5yUPPfmrNL/2gNGQO5+CCansNrdUvrEQs3F+nprX4p5YJlxh+CtU+X0zcA00aX1akQRJbgJ5reF9GMmY7m/2jEvnscDX9nXXdy2nOezAuQUkerUHEN23szVgr/nKCxF9khX20VFyUJ08UYsaVR7hHJUOqLjIbFvhrsz5dnjGloDWBMVEUUCKiu3YziJX+543JehlrAgBDWGtAnaXOczfmnPH8yxWpf8g8IE+vkDEt4AwSSh4emFEAL+KAyT83t5oj5LfLxlyXHs/SQ7N6lR1WDJTp9B93J5bndJfpWNGJWbN1d+W7T5Z7DQE3tGvan+s/UcFVM+IuBBlcL8EFV9mOaZbQiUzN3B8EF2NeG56rxhOS84/1EYrk22cNKPWta6FNdwRIpnVFm7CmSfyxLCFlDlAsklUjElEQSdnbMiUscZexeUdREw0N4wHFOyVSZwtw7alaAbhTHTSQGO5NUBnzMBITatkILCluU9uMYSdcewguUS/xPK3bX1v2nqRcHsXj4rwhAeNX/AXNLvrQsE4RERkzcTFoSF7fWM4NJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(396003)(39860400002)(346002)(107886003)(41300700001)(5660300002)(6666004)(26005)(2906002)(6506007)(86362001)(31696002)(53546011)(6512007)(316002)(6486002)(186003)(2616005)(66946007)(38100700002)(66476007)(66556008)(8676002)(82960400001)(450100002)(478600001)(4326008)(31686004)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVBiOS9ZeVMxZndCdTE3RjhSYlJMUFBrcGkxSHNGd1U5TXZVQlJ3eFRBWU5G?=
 =?utf-8?B?OUM5RVVzTk5LbG54bjdCZ3lTWlpRTGZMNEF2WVoxVHQzU2tMMjAxZzJ5a3V1?=
 =?utf-8?B?NURmdGsycmEvVk9ENGVjZEJXTTNpdzdKSnVzSWZzUW9sSDNKYzY2WGJMWW5y?=
 =?utf-8?B?NllRdE8xQWl0MjV1ME1pejhiaXFRZit2dzhSYkkvVWFScEZZeVdRQ2pZakFB?=
 =?utf-8?B?WUkyYXREYXRtTHdXV2Y1c2pzQVZzWWdKS3l2TmFFWkxtTDNJeWNJMTFmRnUr?=
 =?utf-8?B?SnlvL0tTekpseEEwb1BWVGZLeVpwdkNwUWpDRERFTEw2RmU0N0RmZTVIS2VK?=
 =?utf-8?B?WEVwUjRZaVpQeWthVDY4VmRCRVRsRzJJN0ZvYmVFbjV2T3VNc2IwaEZoRnRp?=
 =?utf-8?B?V0JobXJYYkRYdkRUazIydVNYWndTZCs5eDNpL1FVK3dXbEgzaE91S1NtTTdl?=
 =?utf-8?B?eWpGLzRnemVrd0pLdzlaVzk4dzhZcm5Ic3BTUDd5eWI0d05IdG5CdW1aNzBl?=
 =?utf-8?B?MEZFd24vemVWNzBvNGNSUVpDbytFZUdwRHN0WHo4ZytaNnJJYklhY011K2N1?=
 =?utf-8?B?QWRFZWFmekN1djkrL1NNdE9XNUxrM3A2QlZHbnNxNVVFU0NXTXhDN3JLTk82?=
 =?utf-8?B?SHArc2IrZGZQOFZIRk5DbkFlR1E1ZHlEbXlGMG1vVEJuWXNmNy9ZVnFWVFlp?=
 =?utf-8?B?clZsRHNiS1BlSHpNWmZ5REVoY09vcmdjRmZyaFNwTElEdVlrL3krSjVwOHRG?=
 =?utf-8?B?R1NkdVBYWWY3NkI4YTRLSWZYQmt5TkhJUUFBZWN2aGloMURpelNRaHhBWGlV?=
 =?utf-8?B?L1FjMFM1bCtuNERZa1dtaVFIU0dlZ3BJTTl2M1EyY0VncjJiREF0WlRwL0t6?=
 =?utf-8?B?ckFGY2dUanlCV3BVRGRCa01Od0FkR3ZPam5hbGxhWS9DSER2SzE2dm1iQXVh?=
 =?utf-8?B?UDFLc3BiR1p6dDZVcUl6RUYwaTBocnFqeU5wUGVRZ1JpSEJhUUJmTEVHdDA4?=
 =?utf-8?B?ZkxDZDZyTXE5QVNnejdyWEJ0ZktaYlpZNTkva2FaRWNqTFpqeWE0OGYzZjVx?=
 =?utf-8?B?ZGQxQlV1ZGpMUis1SDZkbCtGcWZWS1dFVkhzc1hiNmdyeEQwNFZJVlpHTTNq?=
 =?utf-8?B?dmJWQ0FvZ3pORWRTenBkR1RpRGZ0R1gvMXdmbEdxbEJqN2RzVmR2V3Y1RVdT?=
 =?utf-8?B?RVVNck5FZ1NZM2FPYjYrYTAybnhKZ0MzVGJ4M1JXUjlaVyt6d0NNSUY0Vmdx?=
 =?utf-8?B?K1NpUWpBWm1JOFJtZ3hEd1hhbHBnQzA3SkFhTHZPU1FVaEU2bnBoa1dTVDZx?=
 =?utf-8?B?Q21TOVlCYytPNTNTV3BFcFlnUDdJWXpGRDRNMmhxanlGa0g1R0FVN1ozbUtt?=
 =?utf-8?B?Z0hndHg0cTc1OWdaejRaK3pDRk1FVUlDbCs1ZTJJM3hsQnUvRHozTkNmUnVi?=
 =?utf-8?B?akFSY1VZK2ZpY0c3REd4U2VzWWR1cEsrdENIMXVUbTRqUS84VkdOOTZieUto?=
 =?utf-8?B?QkpiVFh5WkJ2cVV5emhtS3F3UjJYNlYvMWN5VS9MTzlNa2cwRlcyUkhzeEY4?=
 =?utf-8?B?OXV0YzhldTYrMHl0SkdEZHpJeGZ6MXE2eEZWdXRmWEtWeDJXR00ra1ljNkZB?=
 =?utf-8?B?REtHM3hXcWxDZk5MajhGemhpdHl2NDFFeXVtcnA4WGYxbGVvOWhwbXR4WHNI?=
 =?utf-8?B?VzFKa0hxUUlXdE1KeWZSWWFhMllWZ2xXcE83R0hhdnZZN29kK21CNVRxYVZy?=
 =?utf-8?B?YXhNTEg4VXIrTVlOUmFMOXZpc0RBdUkzbm8zd1QzYkpTL3o3MVo3TG1lbFVj?=
 =?utf-8?B?a0lDTm9vMm1tQzl6cnl6RzhPWE02dk9ZOEcydThwNmQwVmxOU2YzYmFySVhO?=
 =?utf-8?B?MjVXWHAwR3JwU0tNVFR1VUtyTSt1VG1wZHhhaFdJR2dGRkZpckRibGltTk5M?=
 =?utf-8?B?d1plNnJ6TlNxMkRia1B5SzVvMXZyeWh4bVJUM1NnTjRGRWVCNkpUeHZvdWNS?=
 =?utf-8?B?dThKMWtiY3VWTWtkTllLTUk0eU9ob2xveDJ2Q1BBYXZTTHpFR3JWbW05Nk8z?=
 =?utf-8?B?bzFXanR5MG5RcFRoRGkxTlB6ck1sQTRRcjIxbmgvcUZBdkNXeFFvRURobVZ2?=
 =?utf-8?B?NlR1c21qUjhEejZ1U3ZNMjAxSE02bFBqdHpYVmVZZVNVVVc1VHJxYkFOL0ZR?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 731c5a10-3699-4401-cd49-08da8fe5d2d8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:57:27.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihLnUQxx6tv12ySk+CChLSoKNrb/YpvOEGZL2gUjycy4TmSDypZ0KvUBDvchwci/SrhlBzzWnmcxHrDDH+jWoMF4NcZnro8DFZx20xY5nIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4290
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-09-2022 05:02, Matt Roper wrote:
> Xe_LPM+ platforms have "standalone media."  I.e., the media unit is
> designed as an additional GT with its own engine list, GuC, forcewake,
> etc.  Let's allow platforms to include media GTs in their device info.
> 
> v2:
>  - Simplify GSI register handling and split it out to a separate patch
>    for ease of review.  (Daniele)
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile            |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  8 +++++
>  drivers/gpu/drm/i915/gt/intel_sa_media.c | 39 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_sa_media.h | 15 +++++++++
>  drivers/gpu/drm/i915/i915_pci.c          | 15 +++++++++
>  drivers/gpu/drm/i915/intel_device_info.h |  1 +
>  drivers/gpu/drm/i915/intel_uncore.c      |  4 +++
>  7 files changed, 83 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 522ef9b4aff3..e83e4cd46968 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -123,6 +123,7 @@ gt-y += \
>  	gt/intel_ring.o \
>  	gt/intel_ring_submission.o \
>  	gt/intel_rps.o \
> +	gt/intel_sa_media.o \
>  	gt/intel_sseu.o \
>  	gt/intel_sseu_debugfs.o \
>  	gt/intel_timeline.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index d414785003cc..fb2c56777480 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1578,4 +1578,12 @@
>  
>  #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
>  
> +/*
> + * Standalone Media's non-engine GT registers are located at their regular GT
> + * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
> + * structure so that the existing code can be used for both GTs without
> + * modification.
> + */
> +#define MTL_MEDIA_GSI_BASE			0x380000
> +
>  #endif /* __INTEL_GT_REGS__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> new file mode 100644
> index 000000000000..8c5c519457cc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "i915_drv.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_sa_media.h"
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_uncore *uncore;
> +
> +	uncore = drmm_kzalloc(&i915->drm, sizeof(*uncore), GFP_KERNEL);
> +	if (!uncore)
> +		return -ENOMEM;
> +
> +	uncore->gsi_offset = gsi_offset;
> +
> +	intel_gt_common_init_early(gt);
> +	intel_uncore_init_early(uncore, gt);
> +
> +	/*
> +	 * Standalone media shares the general MMIO space with the primary
> +	 * GT.  We'll re-use the primary GT's mapping.
> +	 */
> +	uncore->regs = i915->uncore.regs;
> +	if (drm_WARN_ON(&i915->drm, uncore->regs == NULL))
> +		return -EIO;
> +
> +	gt->uncore = uncore;
> +	gt->phys_addr = phys_addr;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.h b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> new file mode 100644
> index 000000000000..3afb310de932
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef __INTEL_SA_MEDIA__
> +#define __INTEL_SA_MEDIA__
> +
> +#include <linux/types.h>
> +
> +struct intel_gt;
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset);
> +
> +#endif /* __INTEL_SA_MEDIA_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 26b25d9434d6..18d3722331e4 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -26,6 +26,9 @@
>  #include <drm/drm_drv.h>
>  #include <drm/i915_pciids.h>
>  
> +#include "gt/intel_gt_regs.h"
> +#include "gt/intel_sa_media.h"
> +
>  #include "i915_driver.h"
>  #include "i915_drv.h"
>  #include "i915_pci.h"
> @@ -1115,6 +1118,17 @@ static const struct intel_device_info pvc_info = {
>  	.display.has_cdclk_crawl = 1, \
>  	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>  
> +static const struct intel_gt_definition xelpmp_extra_gt[] = {
> +	{
> +		.type = GT_MEDIA,
> +		.name = "Standalone Media GT",
> +		.setup = intel_sa_mediagt_setup,
> +		.gsi_offset = MTL_MEDIA_GSI_BASE,
> +		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
> +	},
> +	{}
> +};
> +
>  __maybe_unused
>  static const struct intel_device_info mtl_info = {
>  	XE_HP_FEATURES,
> @@ -1128,6 +1142,7 @@ static const struct intel_device_info mtl_info = {
>  	.media.ver = 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.display.has_modular_fia = 1,
> +	.extra_gt_list = xelpmp_extra_gt,
>  	.has_flat_ccs = 0,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 85e0ef0e91b1..7b6d5341b34b 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -248,6 +248,7 @@ struct intel_runtime_info {
>  enum intel_gt_type {
>  	GT_PRIMARY,
>  	GT_TILE,
> +	GT_MEDIA,
>  };
>  
>  struct intel_gt_definition {
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index ecb02421502d..94fbc8cd986a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2271,6 +2271,10 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>  
>  void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
>  {
> +	/* The media GT re-uses the primary GT's register mapping */
> +	if (uncore->gt->type == GT_MEDIA)
> +		return;
> +
>  	iounmap(uncore->regs);
>  }
>  
LGTM.
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
