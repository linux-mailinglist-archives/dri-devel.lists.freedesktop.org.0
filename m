Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6F71F3F0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A4610E5C5;
	Thu,  1 Jun 2023 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61E10E5C5;
 Thu,  1 Jun 2023 20:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651790; x=1717187790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PQwLKj7slHMlg6e3mzPBzNgMyb/mx9tbfwiBi6mt910=;
 b=nnzF06khrN20aFj1sHsFMwIi9ZRQHENFMxaskSZnzrIC760VoODhiOr5
 ePCht+CMC3ZQwunN1Dv4m2DsHfQM2s0tGBnVUe+YZ5Mz/PshYNp1eX8PT
 XO/yX0f5jbbo98FvYB16Cz8Nd0V+Pfg8I5E4p8fivyXN/Ky+JH53d+U0k
 ct46RbaqbnN8eYURIHRdxMaTpTJC/RIHUI+JH0ar7/tgM/UxW9rlP6r8B
 sfN/nGINDPB9uxG2GXGd4nV8KIUtLQmOlHRzl8rSF1dHU5paO45C9/xdE
 dNdtft8E44loa0zoLrKnBG6ObTTrhlKJQuygJOfOGhfeDg3rxNk49K4po w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354532965"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354532965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737237826"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="737237826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 13:36:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:36:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:36:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 13:36:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 13:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWFkNlimP8/Yk2s86BGanlYDCCfEuPcgtjUBClroR15q/Hw6Gjbgq0NoJX+4mFF1PQmiMvV58b+p3JDrvayv4CyyiUksM210Ag7WQRqv49iRIOjx+fFIm6rXazPa2bMvlBJ5blZd03y2kz5++02oP26v2JrrcmkaltAQb+S2m0StWQt4aBTbYrZ7Gkq38anc6Je5t3yLxEly4SZYNDsR1RRRNJVv2dY2WeTFX4eK7wuL7e1B+CyeT3Muszxzk6YLWYppD4wtPEWW6qr3Tp55WKbmVo20g0JwQS6tZGLFqxP9ENGuO860rzy2Ke8tYzYEYjehIErGZEtLMCpbdAXJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcT+9pPiMKwTBJfJXpWqSqTt8c6Cr/4cUfNFOiPOg1Q=;
 b=CD45UQFzzCjjdyWyll2dLlqxnlPt8csoI5QswAjAHt/tdIKa2e/VLvfF9as/+gm7CSmQYOguiBwhB0D1thU+GUcBaGlxnhHjpD7IArXC8k+1Fv9M9P2ZN9/TAaGR7oXchr+x+0CA0wee/L6Rj59p19mf332vI64JqT6U3Uc8O25W8veV19aeA2doMVMGuQQnzn07qcWqE351EoDiIzZpAROOF+fTUdd7KPH6Wt+VqfxxrlzQNYERSRdzG/BCShZtftRuCmVz9bqHsDId3OLed3/7HcmqeYGh92uFlBOgIfEgn7MRKY9LP/FVhkTzdKVLSas0YtM54sC4dmGXl8s4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 20:36:16 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 20:36:15 +0000
Message-ID: <7d49d499-5121-3a71-b790-badb30190ab9@intel.com>
Date: Thu, 1 Jun 2023 13:36:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v5 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if
 the fuse says so
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
 <20230531235415.1467475-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230531235415.1467475-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f1dcce-bb79-4552-0ac5-08db62dfd855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtMImO3mFp7iEMSwDqjGdsFBQ2uIQUuUgIl8My/hPrpaDc5xcQAVtopX7skXPIoWrlwyRfQ7AXjVfy0BvtXC8RlrJ37Fz2HjZH++Bu4G2HDvI/JJLhIjjBpQXFx0D86yYWCisXv83BmSCPJyAWTkyOP8GmaKlRO2T8xTsvS8EaaarLNSkoePWMv29GNn9/wh7df0hy9eUtcNMyVumAii3kjEzlzDUYyUjLGqodYCLCkbB3rvhWFu8lN3d7J0021UnDvPpqn/IgDjG2C3qdXn3inFuef2MCCDLLqE+b+KaPwi5DXqRmrNUU2rnmGmRmtW+4Pj/5HtCvWDq9RSA8r8scqSoFS7NZ7w3Om0Qnvs+1wG0bAgTqclGre9+BBUMYgnw8ZIZk7Spr0GC2GusKUWmUFT0ZLSBjq0aWBzZ0/HxaY9R0HNP1K7hVAKIxc4Aal0rALJHgzCJMDexdCNNpmUFZ7cxH+gddya43PYmL/N7iR82v8mAMhy+ooaqv28lX8BVFArkAgCkzJBe7h6wzxoYbQSGziEGWoBSd59KRvt47OMXA8EFGsbWiWMbm+BJD0qIIrcb832Wk/URYYDOlZWzys24jptzYUW2/eity19brsyX16uwrYlWigyMCiR9drSenG9gAFvpqb9sOP1PR7Nag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(6666004)(6486002)(478600001)(26005)(36756003)(83380400001)(53546011)(186003)(2616005)(31696002)(38100700002)(86362001)(107886003)(82960400001)(6506007)(6512007)(41300700001)(8936002)(4326008)(66556008)(31686004)(66946007)(66476007)(450100002)(5660300002)(2906002)(8676002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NklDeHZWcENxRk9GSmhFMWgyckdMVTFyRTdUdThTbVMxeHp1aHBjUllmam5x?=
 =?utf-8?B?RHdCMjlxN3VIRWdZSThVK2plNjEwUnRqakpGQXZJdHB3WEhiZUloWXlFckNV?=
 =?utf-8?B?U0lNRFhvVVNkUkx0UkUwbytkYUFKWlV3UHJIZGR2S3BabWxRVjNUTE1jNkFv?=
 =?utf-8?B?YWRQWHE1YTdSQUV3Ym5RNjlEVlp5MnUzSEl0NHp3Qk85bkR4NGlBNE5jbzhz?=
 =?utf-8?B?cG1wNEQrS1dtNzMydSttWmdSMHk2MDdqT3A4SlFRellhQXZjUSthd2JObjUy?=
 =?utf-8?B?VngzWVhkSld3YjZvby9FNWhpVUovV2s3N3BzaEJWZk4xNHNTeHRBeDJoSU9J?=
 =?utf-8?B?TGkwUzR1NW9YUXNEakM3cVA1T3E4VDBVMWN4N1IxL2tVWlkxZGNHRXFYT0J3?=
 =?utf-8?B?S3NkQmhnVTRETDVMTGUrUStSaFVKNFJ4QXBxR0JFdnZTOFRvdDBYd01XZzZM?=
 =?utf-8?B?V29KUmRvYURNcUZhNVhBMFM3bzMvdkxvOFBmdkpaOXEyZEtkME9JdE02TnZr?=
 =?utf-8?B?QXJxc09vNHlJV0VsbTFXeUtPL2swR2xIU05qR2o4S1k2UlZSNkZUNlc2dUNI?=
 =?utf-8?B?bHlCc0JsdHRDWFNUZVRpM2hKa21JL1g5a1VHU0x0NkV3NzFXRmgycXRFU01i?=
 =?utf-8?B?cnNXeDRldHpHWURvN3JRK1R3OFk2Uml4bUxyZmZMVStqWS9lMWF1U1pzOHU5?=
 =?utf-8?B?Z3dtZnRkWDl4TXROQ3BuenprNlhDZytDL3dMY2x5UmdQRWZYVy8ya3FlMG0y?=
 =?utf-8?B?TzlPbG45ekFUZXd0QUJ3QSswNGVHaFk3YXdvZnZPdndOZ2hFSVhEeUZOeUtO?=
 =?utf-8?B?RSttM3lHUEtkdHFnYkMyWnRkNlkybVg2QUtVNWxzczVyd1pXZHQyOUtqL3Yy?=
 =?utf-8?B?ZVdnbVFoTHI0N0RqSjFINTgwc2ZoV1NNNmRkMVBybTRZMzFRVlcrU3pkbVg1?=
 =?utf-8?B?SEVMdTdYWmhIb1dzaEc4Q2JuZ3VIWThaTWlvdGNORFVudkR4aWJCUU0wdUx6?=
 =?utf-8?B?aXdzZHozWlZLdmxLT0g3K21oUmNpLzRaUHdJbWdYenJIcVRCMVphUjZ2R2ox?=
 =?utf-8?B?ekNwTGlEK3M2a3NUcXU1K0xXNzB3OTlpSDZ6N3JXaDBSVE9jNjBvQXdVNXdM?=
 =?utf-8?B?TzBXTzdiSUFvUEZYVGJ3WFRPeXFaNFR2NnRlcFhlYWVwek5Kd0RZaFZiZFRk?=
 =?utf-8?B?M00xeTBjV3RzTlRFMS9QekRuZXl2NDhFQkRxMHJ3TTlzZVd3TmlZNUlWY3k4?=
 =?utf-8?B?WHp0UEl1UENFZ25GTlNCTDEwWkdrUFZ6U0RJSEMwdEtlbjltSHJmM2d1OTZ5?=
 =?utf-8?B?elpqYmh1OFpMaUw4d2F1YVRKV09wZzBoSnNlOFZjbnEzVk5FbGR5QjJxWW9u?=
 =?utf-8?B?Wk14SCs1VTVyTDljYi9qeDQ3RHRobVJQQkZHaldIaXUxb2JSaW11Rzk2TzhB?=
 =?utf-8?B?Ym5iVVQwcDFuUTluN3RFNEg1OWI2MWpUKzhEa1pDSWYzZDc4SFJrTDMxM1l0?=
 =?utf-8?B?em9xeGRZZmw5VnFPUk44SDZsQ3ZCVXdmZHp0dTlRQWwweHVqNytyU01iUFVP?=
 =?utf-8?B?L0czaTBWMHkzMXlWSnowQzhLb3JRbEZHejUyeG1jSVZUSklRdVRMcEt2SDBs?=
 =?utf-8?B?aENRb05RTGdUTnRqV2V0Yk1ZOUVlMXZxNXA5dXRuQmp5aXIyTU5RaEhaWjll?=
 =?utf-8?B?OVdFRFlsSFJ3N05mWmRLamxPSENDZmF3MDFZcnFHMDVoWGZoZzJKckFESlcr?=
 =?utf-8?B?Q0tpdHhRWVZpZW5IdGttTWZHTnh0d2FQQjdGVGJtNFRma0xHaXJETzdIV2pE?=
 =?utf-8?B?YXB4Y1lkemhMUkR2enNTSkRBYWVjV0MrbEVIVTE3VVVOdmp6WVdybXRBcnI1?=
 =?utf-8?B?QnVQamlqQVF3empOVG5seGR2R0dQckkrWHNnY0Y1MDhqN0FqelVHUUhZL01M?=
 =?utf-8?B?TG12akErdVllWVRMcVpoVGRadDRGcGZ5MlhNUElHYlZ0WDd1VjZ2WkI4YTJT?=
 =?utf-8?B?QkFacHJhR2g5bGZCUDNKOTRhSE9OWEZYRDBwR2l1bkNVMHFJei95a0FEVzl6?=
 =?utf-8?B?M1FFbXRIY3Mxc0svNHNOcFloVjl2aU1zOEdHZithcC9tcUhzMnNrZXpQSWwr?=
 =?utf-8?B?a3VLZGE5NGJDYjJIUGV2M25mNFFyeWlnUWw4OE9KSk95M1Q0YW96d1A1c2l5?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f1dcce-bb79-4552-0ac5-08db62dfd855
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:36:15.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5Dd08Kp+8LtsHVwpk5o0WHRRta9ZKoG8iXxl+rmEFgCK20Kj3clsjOKKKUW7MHzEkrAv+Gu4Mv3aOr6R0NQmcDTOJbbt/eDeWRtilGwaxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/31/2023 16:54, Daniele Ceraolo Spurio wrote:
> In the previous patch we extracted the offset of the legacy-style HuC
> binary located within the GSC-enabled blob, so now we can use that to
> load the HuC via DMA if the fuse is set that way.
> Note that we now need to differentiate between "GSC-enabled binary" and
> "loaded by GSC", so the former case has been renamed to "has GSC headers"
> for clarity, while the latter is now based on the fuse instead of the
> binary format. This way, all the legacy load paths are automatically
> taken (including the auth by GuC) without having to implement further
> code changes.
>
> v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)
>
> v3: split check for GSC access, better comments (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 49 +++++++++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>   5 files changed, 47 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 6d795438b3e4..27c5e41fa84c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -298,31 +298,54 @@ void intel_huc_init_early(struct intel_huc *huc)
>   static int check_huc_loading_mode(struct intel_huc *huc)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
> -	bool hw_uses_gsc = false;
> +	bool gsc_enabled = huc->fw.has_gsc_headers;
>   
>   	/*
>   	 * The fuse for HuC load via GSC is only valid on platforms that have
>   	 * GuC deprivilege.
>   	 */
>   	if (HAS_GUC_DEPRIVILEGE(gt->i915))
> -		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> -			      GSC_LOADS_HUC;
> +		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> +				      GSC_LOADS_HUC;
>   
> -	if (fw_needs_gsc != hw_uses_gsc) {
> -		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +	if (huc->loaded_via_gsc && !gsc_enabled) {
> +		huc_err(huc, "HW requires a GSC-enabled blob, but we found a legacy one\n");
>   		return -ENOEXEC;
>   	}
>   
> -	/* make sure we can access the GSC via the mei driver if we need it */
> -	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
> -	    fw_needs_gsc) {
> -		huc_info(huc, "can't load due to missing MEI modules\n");
> -		return -EIO;
> +	/*
> +	 * On newer platforms we have GSC-enabled binaries but we load the HuC
> +	 * via DMA. To do so we need to find the location of the legacy-style
> +	 * binary inside the GSC-enabled one, which we do at fetch time. Make
> +	 * sure that we were able to do so if the fuse says we need to load via
> +	 * DMA and the binary is GSC-enabled.
> +	 */
> +	if (!huc->loaded_via_gsc && gsc_enabled && !huc->fw.dma_start_offset) {
> +		huc_err(huc, "HW in DMA mode, but we have an incompatible GSC-enabled blob\n");
> +		return -ENOEXEC;
> +	}
> +
> +	/*
> +	 * If the HuC is loaded via GSC, we need to be able to access the GSC.
> +	 * On DG2 this is done via the mei components, while on newer platforms
> +	 * it is done via the GSCCS,
> +	 */
> +	if (huc->loaded_via_gsc) {
> +		if (IS_DG2(gt->i915)) {
> +			if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP) ||
> +			    !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> +				huc_info(huc, "can't load due to missing mei modules\n");
> +				return -EIO;
> +			}
> +		} else {
> +			if (!HAS_ENGINE(gt, GSC0)){
> +				huc_info(huc, "can't load due to missing GSCCS\n");
> +				return -EIO;
> +			}
> +		}
>   	}
>   
> -	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(huc->loaded_via_gsc));
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 0789184d81a2..112f0dce4702 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -39,6 +39,8 @@ struct intel_huc {
>   		struct notifier_block nb;
>   		enum intel_huc_delayed_load_status status;
>   	} delayed_load;
> +
> +	bool loaded_via_gsc;
>   };
>   
>   int intel_huc_sanitize(struct intel_huc *huc);
> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
>   
>   static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   {
> -	return huc->fw.loaded_via_gsc;
> +	return huc->loaded_via_gsc;
>   }
>   
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 3a9d81899a78..89a887d33b77 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
>   	size_t min_size = sizeof(*header);
>   	int i;
>   
> -	if (!huc_fw->loaded_via_gsc) {
> +	if (!huc_fw->has_gsc_headers) {
>   		huc_err(huc, "Invalid FW type for GSC header parsing!\n");
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index ec0b3d214af1..a1c8a982479f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
>   	u8 major;
>   	u8 minor;
>   	u8 patch;
> -	bool loaded_via_gsc;
> +	bool has_gsc_headers;
>   };
>   
>   #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
>   
>   #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> -	  .legacy = false, .loaded_via_gsc = gsc_ }
> +	  .legacy = false, .has_gsc_headers = gsc_ }
>   
>   #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.ver.major = blob->major;
>   		uc_fw->file_wanted.ver.minor = blob->minor;
>   		uc_fw->file_wanted.ver.patch = blob->patch;
> -		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
> +		uc_fw->has_gsc_headers = blob->has_gsc_headers;
>   		found = true;
>   		break;
>   	}
> @@ -737,7 +737,7 @@ static int check_fw_header(struct intel_gt *gt,
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>   		return 0;
>   
> -	if (uc_fw->loaded_via_gsc)
> +	if (uc_fw->has_gsc_headers)
>   		err = check_gsc_manifest(gt, fw, uc_fw);
>   	else
>   		err = check_ccs_header(gt, fw, uc_fw);
> @@ -999,7 +999,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   
>   	/* Set the source address for the uCode */
> -	offset = uc_fw->vma_res.start;
> +	offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
>   	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
> @@ -1238,7 +1238,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   {
>   	struct intel_memory_region *mr = uc_fw->obj->mm.region;
>   	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
> -	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
> +	u32 offset = uc_fw->dma_start_offset + sizeof(struct uc_css_header) + uc_fw->ucode_size;
>   	struct sgt_iter iter;
>   	size_t count = 0;
>   	int idx;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index b3daba9526eb..054f02811971 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -120,7 +120,7 @@ struct intel_uc_fw {
>   
>   	u32 dma_start_offset;
>   
> -	bool loaded_via_gsc;
> +	bool has_gsc_headers;
>   };
>   
>   /*

