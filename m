Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82271F402
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68EF10E5C9;
	Thu,  1 Jun 2023 20:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FED410E5C8;
 Thu,  1 Jun 2023 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685652016; x=1717188016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MmPM3EkOntcvY96COg1muhFlky91zZkyhd467mWHP4k=;
 b=Z+XDavj5V9OFODLdIgpDtj1HMzr4lWFQ8Prbrh91MHMLh6T8bQ6iNFi+
 a485+aYLk1wQwVpMW+eVG8xwcRXHlDqqq2D3WoKWEZHobVmGA6vmQm65K
 NlbOSooS6LLTj6qfOQ5ZQTRRpkUtCPTamVQd9GqqMYRaVQK0Dh2i+1T6h
 6oT8kw8JDrqOYWmPP5ZlQ21cDDy+w+f5lEMVaYX2yyVsHO9sAJlO8JRT5
 e3kZts+cbA1TMD4MEG+rNS3IGJQAq/Qx5o74VdKa3UvIil/zLyAaDRVvE
 kzHl6O/cf09kRujqWoRnuZsjlZvWZNCfnbO2PycGT9y4elYzIIsEbkQpY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358976632"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358976632"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831703081"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="831703081"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 01 Jun 2023 13:40:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:40:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:40:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 13:40:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 13:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enCavBknw+kg16ElFeSB3tmOT8I/DqVO30ggJ2bOz6ej56RmxM3d/HV7ByYGbdZMoPAFkFenZC9gb6cuVYy2ksJfKSECTJ9i6SBjCIih+I4a9jnX4AggGpo7ot4UG6ssF1RQcDsdGN83XGJQaRgPLETezu2hgGPyYhojn4EsI4T6aYrzJb2dqvonC+zZHv5z/h/H52CoVaSxZGWwaZMvx7u+NExSZgDXxfNG3caJSrCfP5IQIyyei1kL7WeabxKQIxR2qaIz3T2pTnocoLllO7oLuei1XhB2E3PPy+OO6lpLAY62J8f3YC1qcBSG1wNGfLt3EavmgGJ/YcUMbTnyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4qf/0vMYdpkkM+rtaxBAHM31EAuqBwmfvD/HaMr9Xg=;
 b=Z2vQXTsVtGkRj3i9dMcwtyxVsOs/IymSU9iQ2ktW9WMAvhoLPVbVgtBL5iZ8v3zCAGNjBI+3zB4EFS+pSY9cGuQQJ81GK39VPW6uFOWjJ6diL38H/zQ0rsRsQsvtajVPKaUqg9KBZTMjJ9LOI6MXtmly0tHBd7Q370wiKyQOiCtZcqS4snO4ZjmONKxL91YxCLU89eKJ8syv7jpPtgo4U5QRLEVImaIqRi02ddzJYM28RWq/eKHb0i+qOMLi5z5WeJEklI3gjsz0dgYB2iatnqSFMzvmRTAnZYAMxZIqG75mNAWxDoW+HRpSaS8wee29ImFz8QgaF5Jy4EhRDv+aNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Thu, 1 Jun 2023 20:40:09 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 20:40:09 +0000
Message-ID: <e8060a2d-2256-4e99-1e9e-28149d4430c7@intel.com>
Date: Thu, 1 Jun 2023 13:40:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v5 4/7] drm/i915/huc: differentiate the 2 steps of the MTL
 HuC auth flow
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
 <20230531235415.1467475-5-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230531235415.1467475-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e19973-99fb-47a0-85bf-08db62e06422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4ReiAqaTZVcfA85QVhkBkwcvfOiQ3nitI849n5wJHvy5S5BKcHvAozXBwGDUEm/xsSSeMpoGFIu6k7BBPNJxjzOVwL/9AmpfHNLqMKLxBKHsrIzDaaEnKHzW1d/ire2xhXg1l9rBSfb77myLAo7wf1hqecntvQlj2Y7DN2myCPrgErJFczNVQgk70FzEFMcMTd/mzS4eTiqtuThAI5JWxTBt88+NWqiNHlQY8e0WZRvAMpxoi/+HDpVSApSL7lw7QQhpYJncOat03Yd//WVLH5smk+Jv/6Rs5e1PUwMIZeoebF/jv1zxC33XItJvlgTqBBV2jANEwQeW4r4wga1bJ1NuQaFjcMmZn0jY6zo1QTqZHAx3zlChad8by99jSANzKs5gib/qEs8YcWcKjQNDi3zk60/73RzahZdk+wDOkDzeCyt0WFPdImjPzONh9ovXQOcMfu9TRFYamBDljPf77+DsVQpJPfEceFDlM3/eq3XCPlMZgFxAvXKnd6m0c9gcqDYyS5obxG7cDBa4MKaILWhgTKftjmj82a7qsyrcrFL8kQVUkosPOjirbJtSJ8j0wefEOOC8PMmI37mBrgE6a1phtoGsNzK6RyQEDrcQsgR+Q/BDQAg6bfoOf7W00GqxaKKFoXDpvF1sQs/lnXvBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(53546011)(86362001)(31696002)(5660300002)(8676002)(31686004)(8936002)(30864003)(2906002)(4326008)(38100700002)(82960400001)(66946007)(316002)(66556008)(66476007)(450100002)(478600001)(41300700001)(966005)(107886003)(26005)(6512007)(6506007)(186003)(2616005)(36756003)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBjK1RQQkZZMHNuZ1pkN2xVdUlxd2ZqZ2M4NW9seVBqMXkwb3laek8rT3ZB?=
 =?utf-8?B?dDRURG1vUUs3NjBnbGNlZ3gxOWhIRXRGY1psY2xoRnQyMmszOVRqeXprU24x?=
 =?utf-8?B?aWFuZDlwNlBuckFTR2RHT2RqdnZ6K0xYSmlHZTZLa1c3VFEwT3VKWDQyYzQ2?=
 =?utf-8?B?K1pEQzBMSW9WVEVZN3U4ajFLejdwSGVPUmlJclNGQytPUFFrZlgzMUYyK29S?=
 =?utf-8?B?YWdhclljY2RRSnlsK3F6U1dKV1NKRWNtbE5vOG1PRDF6NDJoYU5HcmlIb09Y?=
 =?utf-8?B?U2xUWGJIOG1DV3VIc2JhTiszd2Q3UTNyVGNyWjVNWGJFZ21TQmQvcktKNmlC?=
 =?utf-8?B?KzE3eHNOMjVaeUV4Z3lXZUNOTWNiSCtVRVFacUR0a0dSK2lLb2NmWnh1UEV4?=
 =?utf-8?B?d0g3Tm54aDRsMi9GWFQ5ejViaGRtczJQKzl3ZGF5aWlMbUR6OGJINERBMjRk?=
 =?utf-8?B?K2taclpFTGJCa3FnV1Z3Rk1HcGFWNTEzYkdualp1NGVSOWhnVjVSNm9iYWNq?=
 =?utf-8?B?UE93Q083d3FEWlZaSzA1ekVuTlIrUGUrQi9ycm80Q3FoT0s4RHAwV2YrQkFt?=
 =?utf-8?B?VzNtMFVyLzZxeTJFQVhYUTNyb29EakFOZ21mK3BzYitOUGxJMjBPcnl3M09E?=
 =?utf-8?B?ZmFKL2k5SkZOZ1dMZDVSM2ZwSnJIUGlOalJoNXVTVkwxd1YyS2Znc0lPbEV0?=
 =?utf-8?B?enY1MG8wcjBScmlINmdhcHIrZldEbFAzQi9FSmw4QzJjcGM1RHVqUXVTblpU?=
 =?utf-8?B?MWpVanhMWkprV2dFSG9HTmI4OUMzTXFTWldjRDBjQkhlY2NpQTFJb2txcjZ0?=
 =?utf-8?B?VmQ2cWtLVzJQRE9Gc1hJcDc0STIwV2x5WUZ6RGltL2dVVmpISmhVZ2phekpm?=
 =?utf-8?B?QTEzamVRdjZVNjI0QStza0lJOGxhRGt5RGtsL1VhY1oxbUsrekNya3lQc2xr?=
 =?utf-8?B?Rk05ZHZGSStBWkwvMG1WcEcxN0FVSzd1RUdxWFF1NlpaQ2VlcVpvQnJsOUVS?=
 =?utf-8?B?YjZ3MFFzaDhzemkrWmVJejBOUzAydWUvMXdka2lJcHdzbnA5RkI0VjdkOW50?=
 =?utf-8?B?Z3BRVEhqSzRtRGR4amxIeFdUdkpEYTlpYjhBa2kyTDNtd2RWWWo4UTNYSEQr?=
 =?utf-8?B?QkdqWjlSSk52c0kwdVlmbDVDN1BqQ0MwU0c2RHpvVjhHL2VFTVRobWFlT0hs?=
 =?utf-8?B?R0NBbjRlMDB1V1VmaFMwQjhiRzk2czFtQytLNUxncmZSVEsrNjZESU03MWR3?=
 =?utf-8?B?TzNxM1ZNam8rRzM4MzdtRkpiYk1OZmFzTk9INmJRalE1UjcrLzVhNmgveTND?=
 =?utf-8?B?Z3hIT1d3bDFNNUk3SmxtL0Q5cEs1WnQxTkhvZFdOSUcxV0NkM2kzQzliRjBE?=
 =?utf-8?B?M2FFNFFHeEQzeWZvbWMwYlVlN1B3K0UrVHpEdnp2bUwyOHZwZmVUTEgzRXVK?=
 =?utf-8?B?ZU5sVExjMHZtbmpmd1J3NlhYLzgwNDZqTFdVZXBLVjJnQU41MDBBUmFTSjE1?=
 =?utf-8?B?cFdnTlV4bmNWdDZvZ1loWURyaXpyNmhlVWlvcTR4ZkdzWURENzk5Si9FU3N3?=
 =?utf-8?B?QkNoVEp3bEljeVRZdFUxUWZTTFJhajlVWVdQTFFvR2o5UzNRZ3IxN3pNRTNU?=
 =?utf-8?B?aEk3TTI0S0V2aWZYampvVGdsWnVmVWF3WFphaUMwY1dJTlFFS1NxdElQWmlu?=
 =?utf-8?B?bHRoRkRCa1YrTnV1VnU4OTFzWnRJbUZ4YXlxNDBqWmpQSWt2R2Z4YTFISlRk?=
 =?utf-8?B?SlY0SWs2QjBsRnQxNHV5U1dUUGxsZmlKRGptem5oNkJjVGpIb09FMVYzakZo?=
 =?utf-8?B?N2dLVnQyY05lUE5vTk5pOXN1NHBpMDl4OFhqOTIzVkVMeFVEUGplSFV4WnBF?=
 =?utf-8?B?Tk1HQkZQWFdjODIvaFRVdFZRS21IYlp6UFkyQUV4RTRiSUdNeFU4d2NZYWtS?=
 =?utf-8?B?cUFua2FRMFZIaEgwSzJ2OVZQMUVTV05xS2crL2YxRHJiaThqbGMyRUltRFY4?=
 =?utf-8?B?SVExU1Fja3BpeHgzY3FQQmk4ZFBnV01UM3NjQWc1Z21pRWhNdFhZdWpPUEhu?=
 =?utf-8?B?MlM0VGpUbS9iZGRTaW8yWW9Ib2NZb0RENDRockVHa1M4UHFJVmEvTml0dG40?=
 =?utf-8?B?NTFFRDJQRDlSTCtQNGUvbGdLNnRkL2Jwb0lBL3RUeEJXWmtWY1BmUjRhQVVw?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e19973-99fb-47a0-85bf-08db62e06422
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:40:09.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J7NQIcb+vADXFuF67wFELGGSfcTPnRpKUkHU0GCfvqt9LN9lE4HxTb/e3K5ic+aiTGNt/R1B+/daCdzTdFbBV75NhbSMKowKi20KdOd27A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5703
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
> Before we add the second step of the MTL HuC auth (via GSC), we need to
> have the ability to differentiate between them. To do so, the huc
> authentication check is duplicated for GuC and GSC auth, with
> GSC-enabled binaries being considered fully authenticated only after
> the GSC auth step.
>
> To report the difference between the 2 auth steps, a new case is added
> to the HuC getparam. This way, the clear media driver can start
> submitting before full auth, as partial auth is enough for those
> workloads.
>
> v2: fix authentication status check for DG2
>
> v3: add a better comment at the top of the HuC file to explain the
>      different approaches to load and auth (John)
>
> v4: update call to intel_huc_is_authenticated in the pxp code to check
> for GSC authentication
>
> v5: drop references to meu and esclamation mark in huc_auth print (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c     | 111 ++++++++++++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h     |  16 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c  |   4 +-
>   drivers/gpu/drm/i915/i915_reg.h            |   3 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |   2 +-
>   include/uapi/drm/i915_drm.h                |   3 +-
>   6 files changed, 104 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 27c5e41fa84c..73efdb027082 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -10,6 +10,7 @@
>   #include "intel_huc.h"
>   #include "intel_huc_print.h"
>   #include "i915_drv.h"
> +#include "i915_reg.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
> @@ -22,15 +23,23 @@
>    * capabilities by adding HuC specific commands to batch buffers.
>    *
>    * The kernel driver is only responsible for loading the HuC firmware and
> - * triggering its security authentication, which is performed by the GuC on
> - * older platforms and by the GSC on newer ones. For the GuC to correctly
> - * perform the authentication, the HuC binary must be loaded before the GuC one.
> + * triggering its security authentication. This is done differently depending
> + * on the platform:
> + * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
> + *   and the authentication via GuC
> + * - DG2: load and authentication are both performed via GSC.
> + * - MTL and newer platforms: the load is performed via DMA (same as with
> + *   not-DG2 older platforms), while the authentication is done in 2-steps,
> + *   a first auth for clear-media workloads via GuC and a second one for all
> + *   workloads via GSC.
> + * On platforms where the GuC does the authentication, to correctly do so the
> + * HuC binary must be loaded before the GuC one.
>    * Loading the HuC is optional; however, not using the HuC might negatively
>    * impact power usage and/or performance of media workloads, depending on the
>    * use-cases.
>    * HuC must be reloaded on events that cause the WOPCM to lose its contents
> - * (S3/S4, FLR); GuC-authenticated HuC must also be reloaded on GuC/GT reset,
> - * while GSC-managed HuC will survive that.
> + * (S3/S4, FLR); on older platforms the HuC must also be reloaded on GuC/GT
> + * reset, while on newer ones it will survive that.
>    *
>    * See https://github.com/intel/media-driver for the latest details on HuC
>    * functionality.
> @@ -106,7 +115,7 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   {
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
> -	if (!intel_huc_is_authenticated(huc)) {
> +	if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>   			huc_notice(huc, "timed out waiting for MEI GSC\n");
>   		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> @@ -124,7 +133,7 @@ static void huc_delayed_load_start(struct intel_huc *huc)
>   {
>   	ktime_t delay;
>   
> -	GEM_BUG_ON(intel_huc_is_authenticated(huc));
> +	GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
>   
>   	/*
>   	 * On resume we don't have to wait for MEI-GSC to be re-probed, but we
> @@ -284,13 +293,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	}
>   
>   	if (GRAPHICS_VER(i915) >= 11) {
> -		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
> -		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> -		huc->status.value = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
>   	} else {
> -		huc->status.reg = HUC_STATUS2;
> -		huc->status.mask = HUC_FW_VERIFIED;
> -		huc->status.value = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
> +	}
> +
> +	if (IS_DG2(i915)) {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
> +	} else {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
>   	}
>   }
>   
> @@ -397,28 +416,38 @@ void intel_huc_suspend(struct intel_huc *huc)
>   	delayed_huc_load_complete(huc);
>   }
>   
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
> +static const char *auth_mode_string(struct intel_huc *huc,
> +				    enum intel_huc_authentication_type type)
> +{
> +	bool partial = huc->fw.has_gsc_headers && type == INTEL_HUC_AUTH_BY_GUC;
> +
> +	return partial ? "clear media" : "all workloads";
> +}
> +
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	int ret;
>   
>   	ret = __intel_wait_for_register(gt->uncore,
> -					huc->status.reg,
> -					huc->status.mask,
> -					huc->status.value,
> +					huc->status[type].reg,
> +					huc->status[type].mask,
> +					huc->status[type].value,
>   					2, 50, NULL);
>   
>   	/* mark the load process as complete even if the wait failed */
>   	delayed_huc_load_complete(huc);
>   
>   	if (ret) {
> -		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
> +		huc_err(huc, "firmware not verified for %s: %pe\n",
> +			auth_mode_string(huc, type), ERR_PTR(ret));
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   		return ret;
>   	}
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	huc_info(huc, "authenticated!\n");
> +	huc_info(huc, "authenticated for %s\n", auth_mode_string(huc, type));
>   	return 0;
>   }
>   
> @@ -458,7 +487,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	}
>   
>   	/* Check authentication status, it should be done by now */
> -	ret = intel_huc_wait_for_auth_complete(huc);
> +	ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
>   	if (ret)
>   		goto fail;
>   
> @@ -469,16 +498,29 @@ int intel_huc_auth(struct intel_huc *huc)
>   	return ret;
>   }
>   
> -bool intel_huc_is_authenticated(struct intel_huc *huc)
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	intel_wakeref_t wakeref;
>   	u32 status = 0;
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		status = intel_uncore_read(gt->uncore, huc->status.reg);
> +		status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>   
> -	return (status & huc->status.mask) == huc->status.value;
> +	return (status & huc->status[type].mask) == huc->status[type].value;
> +}
> +
> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
> +{
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	if (!huc_fw->has_gsc_headers)
> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
> +	else if (intel_huc_is_loaded_by_gsc(huc) || HAS_ENGINE(huc_to_gt(huc), GSC0))
> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
> +	else
> +		return false;
>   }
>   
>   /**
> @@ -493,7 +535,9 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
>    */
>   int intel_huc_check_status(struct intel_huc *huc)
>   {
> -	switch (__intel_uc_fw_status(&huc->fw)) {
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	switch (__intel_uc_fw_status(huc_fw)) {
>   	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>   		return -ENODEV;
>   	case INTEL_UC_FIRMWARE_DISABLED:
> @@ -510,7 +554,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>   		break;
>   	}
>   
> -	return intel_huc_is_authenticated(huc);
> +	/*
> +	 * GSC-enabled binaries loaded via DMA are first partially
> +	 * authenticated by GuC and then fully authenticated by GSC
> +	 */
> +	if (huc_is_fully_authenticated(huc))
> +		return 1; /* full auth */
> +	else if (huc_fw->has_gsc_headers && !intel_huc_is_loaded_by_gsc(huc) &&
> +		 intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
> +		return 2; /* clear media only */
> +	else
> +		return 0;
>   }
>   
>   static bool huc_has_delayed_load(struct intel_huc *huc)
> @@ -524,7 +578,10 @@ void intel_huc_update_auth_status(struct intel_huc *huc)
>   	if (!intel_uc_fw_is_loadable(&huc->fw))
>   		return;
>   
> -	if (intel_huc_is_authenticated(huc))
> +	if (!huc->fw.has_gsc_headers)
> +		return;
> +
> +	if (huc_is_fully_authenticated(huc))
>   		intel_uc_fw_change_status(&huc->fw,
>   					  INTEL_UC_FIRMWARE_RUNNING);
>   	else if (huc_has_delayed_load(huc))
> @@ -557,5 +614,5 @@ void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p)
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>   		drm_printf(p, "HuC status: 0x%08x\n",
> -			   intel_uncore_read(gt->uncore, huc->status.reg));
> +			   intel_uncore_read(gt->uncore, huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 112f0dce4702..3f6aa7c37abc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>   	INTEL_HUC_DELAYED_LOAD_ERROR,
>   };
>   
> +enum intel_huc_authentication_type {
> +	INTEL_HUC_AUTH_BY_GUC = 0,
> +	INTEL_HUC_AUTH_BY_GSC,
> +	INTEL_HUC_AUTH_MAX_MODES
> +};
> +
>   struct intel_huc {
>   	/* Generic uC firmware management */
>   	struct intel_uc_fw fw;
> @@ -31,7 +37,7 @@ struct intel_huc {
>   		i915_reg_t reg;
>   		u32 mask;
>   		u32 value;
> -	} status;
> +	} status[INTEL_HUC_AUTH_MAX_MODES];
>   
>   	struct {
>   		struct i915_sw_fence fence;
> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>   void intel_huc_fini(struct intel_huc *huc);
>   void intel_huc_suspend(struct intel_huc *huc);
>   int intel_huc_auth(struct intel_huc *huc);
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type);
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type);
>   int intel_huc_check_status(struct intel_huc *huc);
>   void intel_huc_update_auth_status(struct intel_huc *huc);
> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>   
>   void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
> @@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>   {
>   	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
> -	       !intel_huc_is_authenticated(huc);
> +	       !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 89a887d33b77..ac2ae5f5011e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -161,7 +161,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   	 * component gets re-bound and this function called again. If so, just
>   	 * mark the HuC as loaded.
>   	 */
> -	if (intel_huc_is_authenticated(huc)) {
> +	if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>   		return 0;
>   	}
> @@ -174,7 +174,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>   
> -	return intel_huc_wait_for_auth_complete(huc);
> +	return intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0523418129c5..8ed7c39c2b30 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -941,6 +941,9 @@
>   #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
>   #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
>   
> +#define HECI_FWSTS5(base)		_MMIO((base) + 0xc68)
> +#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
> +
>   #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
>   #define   GTT_CACHE_EN_ALL	0xF0007FFF
>   #define GEN7_WR_WATERMARK	_MMIO(0x4028)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 8dc41de3f6f7..016bd8fad89d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -196,7 +196,7 @@ bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
>   	 * gsc-proxy init flow (the last set of dependencies that
>   	 * are out of order) will suffice.
>   	 */
> -	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
> +	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, INTEL_HUC_AUTH_BY_GSC) &&
>   	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
>   		return true;
>   
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index f31dfacde601..a1848e806059 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -674,7 +674,8 @@ typedef struct drm_i915_irq_wait {
>    * If the IOCTL is successful, the returned parameter will be set to one of the
>    * following values:
>    *  * 0 if HuC firmware load is not complete,
> - *  * 1 if HuC firmware is authenticated and running.
> + *  * 1 if HuC firmware is loaded and fully authenticated,
> + *  * 2 if HuC firmware is loaded and authenticated for clear media only
>    */
>   #define I915_PARAM_HUC_STATUS		 42
>   

