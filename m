Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693A5848DA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 02:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93911BD4A;
	Fri, 29 Jul 2022 00:00:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EE311BCFF;
 Fri, 29 Jul 2022 00:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659052851; x=1690588851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hmn4bZ0eyf7sJiDQ1PDw9EKl2VG01Wk5+SEiErGQUR8=;
 b=lIc+/1yBA0dcc6dJQE/APlF1ZscS8aOBwLy3IJs+PoOhQimdp8zVdBOY
 +bUCq2kfye+wW5MmXF7ngPPWmbw49FA7I9EwuW40WGbSJHymlUzYyk1zl
 oDS5ptw/UVa46FjvKOKemzVr1/7D1/siAIvZ1FEuRH9oIXv2QhTF/zLlU
 GpVXtRnHuzYhxOEGFk8Hm7m6iDdYiMjg1EK9VT0bIURsWD/x3xkTv+fGM
 a4frYGAj21Q1/qBSG5ww/NIAWLMLxWM1kxcT2bw7HNIT3K8A89WysL4qH
 7TtVn9kWFvWPcCIbEUyVatQK+QlfJSN4g017boAn6sWrWZnIgt+eGX7vy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="352653277"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="352653277"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 17:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="604788662"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2022 17:00:49 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 17:00:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 17:00:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 17:00:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 17:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gf4/FwdmywvAa0Vx3/AcYnRhiGLCq0tZarQhQS2d0ES5I8MXt4bKLDyZm5BpnlMBs5a00J85gFCj152sef9bvwO29kM3KYzu9Hdch/XAUW+Z5oFxReH1AFsKDvId41b2UMuMzDROpUodgW0yoCZOz7oPshfRQnHsTAaQWBeDa6L2smnnsKOjmULDCyzasX0HW8m+/uKGbde2JThgbjfLLLlXgEPSme5KQJnCAfVlrGOWGni2U8u+/F8q4Rf1G1KMdWKvz6uhGRpACd9YuOh+bhcrcPH16WCQNJf5UalS6EU8d+8/bdG53jPOEs1Lj2tpqxf1Cwjs4/ZFiC+ys82HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QlVUGihp1SvyuIcqLEUESYQPBdDkg8mnsZB3rzXk30=;
 b=Gw0Zrm3PEKXqqdjQ8rP7EKTBgXYMEv5CcIzrB/4AGEns/2/Ph5g7OjSviwGMKIbRU1kqXNMWYHYW7qjwew2Vx9HnGCkprlQTbylDw4Lusk6Ph4C6QGK7iAF9XuyTRKk7ANb/dNdtBbVi4nK55MdsTLF8QPiYhAbTcM/LMlWw/TVvOWzrpSFXktrItdyvdQL6w7GJ3mFy8fpGMj7w3xP92SuepN+k7xz7GQ3J/yEdchWbkRN7KRMRsmugWLLSzXuJbqc3jIP9p5vRxjcO48rc1lW7h7cJZSKdXqpkt8vxQWvpOOdns0s2g7ZYPrszOwgBHAnsZhH6ptkiyOBCv6TVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN8PR11MB3666.namprd11.prod.outlook.com (2603:10b6:408:8c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Fri, 29 Jul 2022 00:00:46 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300%7]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 00:00:46 +0000
Message-ID: <d0e94746-132d-061c-ef68-2016d50b09d9@intel.com>
Date: Thu, 28 Jul 2022 17:00:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-7-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220728024225.2363663-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e6b3f68-fed7-4b1d-ee37-08da70f56381
X-MS-TrafficTypeDiagnostic: BN8PR11MB3666:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKYwuXckyKB45ynipr/ZcPqF173QQ/cOv2XLh3k276y7uAewZOKYRU+1WK+yJZ4oJ5oJ1wJwxN1g8N02PnFj1wDQhlpo9w0RzaeMoJTfU6kV4N1lnecmGAeDSDVj8wKw9/6htip93QVpWoGXGxOK1zWs4jN8lj8d1Z/YQQ70Ds4IbEnXJCedIipv+ZipZOTWTnirJmXfioik97ew9HffNxk9Fpa5Q84yrqoUJ0qK2vUy0+MjC06hS77aChAbg2zojPR6JJbT8ddqtu0J28UjSWWKDFTtLmAGYVR+bINT7A94NIiANfYxeFgYZYm1LGLEEUOKMp+hxxwfQuahwLmU32y6hzT0lQiPSCAKB22yb0F9k1vnxJ0H12r/v75arsXhv7Hwp2YWlxKBCg+c0k8jFMxNNeu/Pf+1EbWcnZjIkaHZ4XxQ5mnyRI5QxgGNQL2+xqg/1JeC6ikAzDjK0/MOq5v8n5KzImFIu3KwZ/Gctx9Oo4kU7uGVzYMHyG7vjgR55RdVE43eFArU7zIpcyqCYdQVgxOLroHCpswfLKqbw7S4lM4CovZrQXK440kWeUAhdkSbuMj8WKmw6MeV+OeJT2BqBX2CYDF78kwcBp7O4ox1p0C63OBA6N8twdEiQ8FCKgyHBVcWLa1CZRbvYyGE1gpLNjaCg0UCFNqtHAtN6ytWvpYCj7u/3NiVkh1TYFhs9mCHqjWEwLv8DheKiS2d8DVEsSfERjU+jrW+xE0/OQjqvsAgFjRc8Bu7+Y1K9sq5auqWJHxVoVElRw1w8guDxpMyUMhMgR/740YfpfIafWDrASMUM7SUjiZphNrEjVbSlBQhv0vwJeDlShcTlyJFLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(396003)(376002)(136003)(2616005)(186003)(5660300002)(8936002)(83380400001)(6512007)(26005)(53546011)(86362001)(6666004)(41300700001)(2906002)(66476007)(8676002)(66946007)(36756003)(4326008)(450100002)(316002)(6506007)(31696002)(6486002)(82960400001)(38100700002)(31686004)(66556008)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHBuYWFGV2pQVXJTNXl0aWg1Nk5kRGUycEV3SkYyRDlEakdxY0FXUk5ieW8x?=
 =?utf-8?B?ckZkdmJnZldEYzVqME1GbUJrMVdaQlJ1Z2tjQjRUbHpSbXhJQ0JMS0hiQXUv?=
 =?utf-8?B?THV1WHVQUktyRFkwUEpid2dlV3lHTkJLUUFlSy9ld0VYc3pYWUZ3eElQV2NZ?=
 =?utf-8?B?WU1jSE1ITGp0dU8wbDlQT1lPSTFKOTFIK04xUUNBS2lCUWg5NUZ1SjVHZEY3?=
 =?utf-8?B?bEUwWEF4dEs5YWkrZFJVTTB3VHJGKzZrODB3b3VtdkJLcGRaSENFNi9NVDdh?=
 =?utf-8?B?RWZxMjlzZHlkbTluOTRnOTI5UXZBVXhlV3RHUXFOVURKYmU0aG1mNUtnK0N0?=
 =?utf-8?B?NVVHSUplV3R1UU9aUWppQVd3dGR3dURCZXc1Y0FKRDhvamNmTWhsbitZN3A1?=
 =?utf-8?B?K21nU3A4MndUQnhqbVBPbWh0MjNBT0VLdXZVV1hzVURyQWFTZmZiSUE3ajd5?=
 =?utf-8?B?WjNuYW1OKzkyRE4zZmwwTzZLeC9CM1JvbGsxSC93TlFGYlBhbkl3SXJBWG1J?=
 =?utf-8?B?WVJPSm1GSWVHVzd2QWFUTHhGMGpPV2lZU24ybzEwcnlVYWdJREIxeHJOekJR?=
 =?utf-8?B?MDY0RU44bzFWcXp0cHNyM2RUcWk2TFRyV1kvd2R1bGc3THhkYWJrZWhxNXZx?=
 =?utf-8?B?N0hZdlJkS2VXWGk1VS9CbHpnTlpBa1FQR29wbTR6UG1EWVFNanJ1NXVpTVhZ?=
 =?utf-8?B?WENIZmNkakordlgxSndqbkN1WjNja3NGQVNHS25WNjhYYlZrUFpJdERhTXQv?=
 =?utf-8?B?M2xLQ2d2N1JHbTVKQXZNREZzOTBHNzljaDlJRUxPMFplem5qa0VybEQrOXNo?=
 =?utf-8?B?WTFqZjVyRlBJTkhCd2JPR0J3OTNNSVVNbzcyV3RRMEphSVE1RW85UE9pSUVX?=
 =?utf-8?B?cUJmVkxJeFZuVng0SGs4aUZtajVuRUlJbThIZmY2aEwySGJXQXliN2RtVVpo?=
 =?utf-8?B?OTRqNm1TeHRKRDR5Mnlwb1QvS1RreTBGR2dhUFExdkdGb3dvMzNtZ2NhNE8r?=
 =?utf-8?B?djNaTExhT04rbUx6SDJWS1diVjBCWXBJRmltWEZOb2UyMEh0SmZPUTljQmkx?=
 =?utf-8?B?YmZRcnY1MWJKaXdSL085R2V4N1F5dEV4UjRvZW4vbm9FaWcwZ3lSZnJkZUV6?=
 =?utf-8?B?enJKN3JFOFdKM1VRazVraFkwUi82aDRxSWRoaVE1NlNaTWpjUjNROUUwQUhY?=
 =?utf-8?B?V2IweFB5TUorTS9wd3VsSXlQaFdTWGh2enJzK1RBaktSZzdXZGs2UG1wT3Np?=
 =?utf-8?B?R1NwcXlsSnZmZXRhT2pXa24rUXBQb3QrUEZ4K0JsaGU0TkdqZi9JNUNhSm0v?=
 =?utf-8?B?VkxYMFpWVm4xVG9NbkVSK3JaYkZIMDJrMGwrZHdVODZKbHhaVXdIdzdEQXls?=
 =?utf-8?B?aVVQVEZxdzZIOGRTRjhKNkUxUktaZ2dVVDg3TWVTVlphZ2E3Rkg0NnVvYzdi?=
 =?utf-8?B?ZnpQNGZ6aDZjbmdrK0R4UHgzOFBCUy9mQ3NRRE1USmFQZnFtMmZMWEh3a01q?=
 =?utf-8?B?RnpZcGJMbEZ5OW1sL1B6OUhtOTQxT0Z1bDl1SnNMcjhRQTg3Zytnd214L3oz?=
 =?utf-8?B?Ulc0MjRBL1dXS1hJWFVuTTFMeDZzaUI4WDA4bUVnNk56ZmJBRU8zZWZpM3A4?=
 =?utf-8?B?cmREaUkrNUk4Z1FzYVlYVHlhd0lKckU0NEhybkEvaVBFYmVvVDNKTkY4V2VN?=
 =?utf-8?B?U0FUQ3BxQnBIUHovMDlKY3FLMHREc0tuMzhhWW5vd3M0eXpEaXdIZXB2T1N3?=
 =?utf-8?B?UXhWa01tQlVZbDFhcG0yK3E3ZTJOa1Z2VmZKRUdyODk4OFdiZW9wVEU0VFU2?=
 =?utf-8?B?dUZTZUUzVWpENXVuUjdxZnJoWEVyeDA5eDBIcDhBUEFZWi84T0pkSERGck9i?=
 =?utf-8?B?L1UrY280bkFZdXhzckUvMFA0cHJkb3FNcE5hbXg3RGhSb1JkaUwySi9BNDBO?=
 =?utf-8?B?WkRvcndXRW81Vm1RRDdWMmJ4bFQ0WlprSWN0TDJzS1hjOTFPN2hSM3g4NlVR?=
 =?utf-8?B?Rm4xQ3MzOTg0RUpVb1FLeGRtZ1NFd0NQTWxZKzY1K2NQQ3BKU1VNc0FkdXVl?=
 =?utf-8?B?UWZMNmIwaFVqVHF6Z1hsdWhSenVySUtWSHQ4UzJIOEZLOG9iWlcybEdCSlhx?=
 =?utf-8?B?S1NmcTIzVXNveGxLR0RGQXhOaUhRT1hXamxVSHVZMlYyTXpOdWx1c2tZMmFO?=
 =?utf-8?Q?O8puEVnU7C5rr1Po0nVemZs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6b3f68-fed7-4b1d-ee37-08da70f56381
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 00:00:46.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/uMjd0MnFu6qckTQKdOuIG+gMdfWHX3+Lj3c7xFeXFUrKIyCRBAslOpTanakQy8roj9z+tDNnGMr8FyFImTt+D8aSB2MZWYw8yEl3PU8ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3666
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



On 7/27/2022 7:42 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When the KMD sends a CLIENT_RESET request to GuC (as part of the
> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the
> KMD then checked the CTB queue, it would see a non-zero status value
> and report the buffer as corrupted.
>
> Technically, no G2H messages should be received once the CLIENT_RESET
> has been sent. However, if a context was outstanding on an engine then
> it would get reset and a reset notification would be sent. So, don't
> actually treat UNUSED as a catastrophic error. Just flag it up as
> unexpected and keep going.

Given that we disable CTs right after sending the CLIENT_RESET, there is 
only a small window for the kernel to receive a G2H interrupt before we 
turn everything off. If we want to support catching unexpected G2Hs 
coming at that time, maybe we should instead make sure all CT messages 
(if any) have been processed before the disable. Not a blocker for this 
patch, can be done as a follow-up.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>   2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index df83c1cc7c7a6..28b8387f97b77 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -37,6 +37,7 @@
>    *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
>    *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
>    *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in use)         |
>    *  +---+-------+--------------------------------------------------------------+
>    *  |...|       | RESERVED = MBZ                                               |
>    *  +---+-------+--------------------------------------------------------------+
> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>   	u32 tail;
>   	u32 status;
>   #define GUC_CTB_STATUS_NO_ERROR				0
> -#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
> -#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
> -#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> +#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
> +#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
> +#define GUC_CTB_STATUS_MISMATCH				BIT(2)
> +#define GUC_CTB_STATUS_UNUSED				BIT(3)
>   	u32 reserved[13];
>   } __packed;
>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f01325cd1b625..11b5d4ddb19ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	if (unlikely(ctb->broken))
>   		return -EPIPE;
>   
> -	if (unlikely(desc->status))
> -		goto corrupted;
> +	if (unlikely(desc->status)) {
> +		u32 status = desc->status;
> +
> +		if (status & GUC_CTB_STATUS_UNUSED) {
> +			/*
> +			 * Potentially valid if a CLIENT_RESET request resulted in
> +			 * contexts/engines being reset. But should never happen as
> +			 * no contexts should be active when CLIENT_RESET is sent.
> +			 */
> +			CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
> +			status &= ~GUC_CTB_STATUS_UNUSED;
> +		}
> +
> +		if (status)
> +			goto corrupted;
> +	}
>   
>   	GEM_BUG_ON(head > size);
>   

