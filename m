Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CFC5B1DDA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FEC10E9C2;
	Thu,  8 Sep 2022 13:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9A210E9C2;
 Thu,  8 Sep 2022 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662642265; x=1694178265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eXH47tmdnuSkNz6mAcJHok5i97RY8YKpMwJVxVqhQAM=;
 b=kb+zPDA29so/oy43UU8UaFFBhGQ6fDm4hZyF+Ff0cwSOzF7gni7Dz3Xw
 1HtYb0b1WU7yy1tO+JsDJsvxCAwq6bUnNqJKdJttIg+8GyRASGJyJgDdd
 aa+47Qn9VgNwc33MW2xds53aHDwSzyREDRcpLWj5IllZpBnY4PjSm7N1+
 gwvsMlljgT7MEPMF7uEbpg+oHxYmgcR1JKg3M630L9/7LzE0Eon4CSaXI
 N7kITUtuVTQGWXp6456J0CVMGk1eimutf6Z2AvAYxBoZaz0CF4V7upRpC
 2XAI2NniF8jYzqFCtizLJekVH4FOqnajEjVHvrHaJ77xTfNt2ms0b/x9r A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294742683"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294742683"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 06:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="683222798"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2022 06:04:25 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 06:04:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 06:04:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 06:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM5tbBmSv+CkRPZ0/Mbfrf93fkTMnVjO9t7mabWHiBEX4Jzshe4I1n2JMDipqdktbQvCRMjmAO/7pC69q/NUYlwK7q7Kl9DaOdOeIVTGZDUsN6JOcJZ21jRLPNdOyZ8Iav8e6MiMcyStD0y0DxkZJAfsiUMs77q9+T7TMLIipMwaK+OpVKblLH6DRGMkrONs23AmMvdRKiAU2N/qnLr+vyn7tn/cz1wK8ntRE8fCLEwGn3mJZpz83v3b7+nRXtKlrJgfNf8jEJOHVH8c6KQ8ubTpdPOfAUtX9LPSsksx/v1AmVUjtiCUoqM3cmzczGFgtdm9Y44/2w2vtrUWb7/HNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBCwe/Axdz/tPsYihzOR4NhpAKYmBp+JlynRMV+aL1g=;
 b=nVbVnUBvruk+u0goYWtEeY1ZULFAlAZwbyT7+sNMzTnXIrmLYIu9LzQuG0LwfSPznLCLgha8+RbUKnjR6Wl2+AQvUemN3nH8v4Syp9dhDSTBZox5otBHlYQWxFl08UECPJIgPZb1IfI2oifQAG0FDkE/QOoMNf09S2Olpm/GORkEp0tRXcUk3vY6XYh5Bgn35F8HX2FKnu2kHpuEzeuga20Lxj4alpqxf3mcXSTtCHgPxnX2hs6hiepYA/DEHjbcGmRH5LbflMO6erYAUzkFDakTribYTlGkhf8p95fYH0E8oMAJ3GXsu0GSznPk2Uedqjz977n9dZZVBHwrFF4a4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 BN7PR11MB2577.namprd11.prod.outlook.com (2603:10b6:406:b1::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.14; Thu, 8 Sep 2022 13:04:02 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:04:02 +0000
Date: Thu, 8 Sep 2022 18:33:46 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 05/11] drm/i915/mtl: Add gmbus and gpio
 support
Message-ID: <YxnoMhGMtj4uKV0U@bala-ubuntu>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
 <20220831214958.109753-6-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220831214958.109753-6-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: PN2PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::25) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15704a14-f5d3-4ec2-de6f-08da919a99f4
X-MS-TrafficTypeDiagnostic: BN7PR11MB2577:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYXY4eDYrR30gpafkkbRs140xTqcqABVDM+NRAX0ma/pre2x9KhA45VBHKIuJc4+se6iSkb8HPocMoGgzhxf9wfY0Fizw1WltfEiMEey44t6Q/+cl3wEguTVw8hd5Om1fRl8Ee9rzTdt2StBtPskGioHp2PzOY06DLY3+fsXQ+6AzxSpUhLdobggfG2J4kyavdT12GBhw9i/ggrn6hLGEsnJMQF7u7m9YpP828fCpXCdW0buq+wzKDPAkBKu6ebm7cqKFYuRTiByZwaOn/B6WGCYw89XigV8N0XBoK07qgEdcuNdpupmYd+UeJ0cgBUlm7H0G+cHQtOZyzPqgrZsR37occEW5k1Uya6iF0gr8xgm4pzSdD0v/cHvGe0Tv3t5PVPHwHG62U34UNFvkBwUWg0c21g5GYBolf2ZArMVXMER3fBiEmTvkNU4xrGbZNYlTzNwyibg7hKYoO6ZZtgradaT+7drS9sXtaGxx+Tr3HrkrXyBQtdYNfMS0G/KcMy/2MSI2qWRH2wd0GAQyvsfY5+9I6X3YXTDiDWTfKBrwH0pNKhpi8otxEtSMBTKQFATbQx/V49csxu1BnctSnaDG5BErY85Ha2emcMuUbNxpWGmY0eo2Rp0Y1uR2oKMlrWctQ1quieDhAXiilftGkPhFmIJ0xMt/tcZQXpnzHDBxY4WvQJOsCo5ls8pmCuh1U2hSFDcuNzn7gRBFWl0kG5UIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(396003)(366004)(39860400002)(346002)(376002)(86362001)(82960400001)(316002)(38100700002)(2906002)(5660300002)(8936002)(44832011)(66946007)(8676002)(66556008)(4326008)(450100002)(66476007)(26005)(6512007)(41300700001)(6666004)(9686003)(478600001)(6486002)(33716001)(6506007)(186003)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9JclJNWkQxeURYRmlCbEVLazNYLzZ3U1Z6ZDkvcHNackFidEFsSVVFa3Q4?=
 =?utf-8?B?Sm1Gd21zK3RUc3kyOGRKN0o3ajcyK1pURTg1U2IwYnRvdzFMS0V3VmdZaEg5?=
 =?utf-8?B?czFUTGVFcVVJN0J3bldLTmhQQnh0M1FCR3IwclZWcnJPak96Q2E5cTUxWlli?=
 =?utf-8?B?Y0RJc1d4WTdJL0drWmNuL3o0RnNxNUpFNG5yQjFrWHR4MHdwNkdOOTMrZFo4?=
 =?utf-8?B?R3hvU0NNSGtpaURVTEM3RXNXMEY5RjBHNFphNzhUbnRrYnlPU2RObTJhZW9h?=
 =?utf-8?B?aFVmMUxoalpuR1lDZnBsYXY1OW5pYktNTXBQVFhHU2Y2Q0htaG8yUDlFUXI3?=
 =?utf-8?B?bjMvY0s2KzVpSHNwRFFCSWwyVndYakE5Yzhxdi94V0ZCL29FSjE5TFVZT1ZI?=
 =?utf-8?B?aWZJOUI4Q2dZQVorcWJlZHpTREROdUw4MTFCU05uMGViVThySU5yWTlBb05C?=
 =?utf-8?B?eUlTU1dQTGpIcHpwUFQvM1pLUzhFdm13Zm1VcjBvbTVDY016TUZUV1c1d2JE?=
 =?utf-8?B?UjlMMjVUemErYytacllYWW0wTmNxeHFYd3dOVDZQTnRJY3cyZm1hNjdkMDF6?=
 =?utf-8?B?MFlvUGZwY3VLWFNaWHlMSUdaM2xGbjN3N0s2dFJ3eHJpM0w5ejBZNWhOYVFv?=
 =?utf-8?B?dklUSDJYaEdGc1F4SGZ3a3pRNjFGWGZzb1E2QjMrNllBRkMxVG1OcUNzVnE4?=
 =?utf-8?B?STVJRUVBUjRCQW82ZmdtRWpicU13bHViY0tkeE1ZRjNIdWwzRHJhZ1dRWW1l?=
 =?utf-8?B?NGpJV1N6S05WamtFVWNiU2M4VWdCaUpyUUNnNG5tYUFaNVJ1NXBLVW5yb1Jo?=
 =?utf-8?B?TmdSbi9FdFQ2cEIrWEhPbE9kWUFzNXhxMTBGUmpIUFhIb3VOYlg3SWdkUUNB?=
 =?utf-8?B?RlNGOW1iUkN4ZDhPaEp2aE5kbmM0ZGhoUXZ0eEtPNEoxMzBlZlhLaTAvR3RI?=
 =?utf-8?B?L3FFQUNrRDRPaXowc1hVek8wVmpZaitNbG5EbXBla0VxeHYzTGlobVhmVmJ1?=
 =?utf-8?B?eEhLTDhZRVkrcG9KR0JtZlpSV080NyttM3hXck9HN2pUejUraklWby83Kzk2?=
 =?utf-8?B?QldBazFsQUdxeGRVWjlCV0NsUEZnZHJINEp6UnEydXpqalBmdjVDMjVWaTBH?=
 =?utf-8?B?RG5WNkF6M0pLa21OUVR2d1dZVGRHVGpqNFl1c2JqelFaKzFZSEl2Y0d6U1Vm?=
 =?utf-8?B?V2RlTzdTOHZXTTBVS0NhNnFLck5pVUJyYmZFRjFYdzkzR2xKMnZlK3U3T1NX?=
 =?utf-8?B?RjdqTGhkajdITlpUTzJTNVB6eEM5VGVIdEUxdFM3cmMwLzJ0SS9ZNEZha09s?=
 =?utf-8?B?OUNtUGRhRmI0anJIWXNjWnI0WEtJUGx1V1pCOUlHeGtxOTVkL09RbGd4dkZp?=
 =?utf-8?B?R0FDajhlb1FKWmRzTi9idnh2WXRBS2ZNL3pSbHEzTW9mREkwcW9XZldCRnhp?=
 =?utf-8?B?SDdXbWRSdW00cnhWbWc1ZEliSHBqc2c2dDI5Z2ZQSDcwUWxLUFJDYVREYzE5?=
 =?utf-8?B?cTBuQ0dNMkxTdzBPSGR4OGNKOXJ1eU5CRTY5RWVxYmFVYTdlNjhxcFZYWm5M?=
 =?utf-8?B?VXZoL2hzbDhMdlkxOWF6MG01eUFLd1E1SU8wTUs5UjAvNmtFbGNlQS83eWsv?=
 =?utf-8?B?UUpLcFJwczZ0QUc0dk5oZGNiZGZPcHdLMnpFSVZYWlY0NWI0UmhCN1VMbDRT?=
 =?utf-8?B?YnZUSlRQYi9vb2pXZGlsRm5QdGJhbkY5V1NrZnJoekZjTGVkK2NmRUxwQ2g0?=
 =?utf-8?B?TUVaczNRd2RUdGZIdHV5dU1kNFRVRzJ2K253Ym50cE5HQkloU0FUdHlScXRa?=
 =?utf-8?B?bUEzb0pMUmlSNXk4Uzljb2dpbFVNZmVwdGhZMEJpdXExK1hkWFBuZzJWWDhP?=
 =?utf-8?B?K3NtOFVEM0kyemppS0RNcXdBeC85eUo2VlQ3ekRhTnc2MHhZenpmM29SNC9V?=
 =?utf-8?B?bmVueitWS25JSGtwa21adjNDZmZzeGlnYzFLc2JyN2RreTk3NFNnbytPZ3JT?=
 =?utf-8?B?UGhEWm9Cd0YvazgxanZCc29DcHhOMFl3MDZyQU5adk8weFpFMEp6NTdzdHFh?=
 =?utf-8?B?RHBGUkU5NUxlM01pbDFZc1BlRlJJbmdQbWVUVVNpUGVuK1NjbVNWNXFFYkk3?=
 =?utf-8?B?emZOK1VvRUlIY1RZdnREQU1OKzJ2aEFZTWtUSDBsTUt3NTJyUjgyZ2Z5M092?=
 =?utf-8?Q?XhehIbji+MTlMw1urZ6Xse8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15704a14-f5d3-4ec2-de6f-08da919a99f4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:04:02.4517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC0dUDuFPbcxUI+TIQuXFqk36j2x9hdDTr1fgzt6XlovP2T17VMdh/PkoTeczeXlB7E4JKYBVbJB5x/JpRj/OYJAvh44KG2Fuy/2QWYXOM63kGBwOsaPXK714D/eh84E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2577
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.08.2022 14:49, Radhakrishna Sripada wrote:
> Add tables to map the GMBUS pin pairs to GPIO registers and port to DDC.
> From spec we have registers GPIO_CTL[1-5] mapped to native display phys and
> GPIO_CTL[9-12] are mapped to TC ports.
> 
> v2:
>  - Drop unused GPIO pins(MattR)
> 
> BSpec: 49306
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Brian J Lovin
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gmbus.h |  1 +
>  2 files changed, 16 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 6f6cfccad477..74443f57f62d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -117,6 +117,18 @@ static const struct gmbus_pin gmbus_pins_dg2[] = {
>  	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
>  };
>  
