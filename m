Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FC34E3D40
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 12:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA04910E09D;
	Tue, 22 Mar 2022 11:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43AD10E09D;
 Tue, 22 Mar 2022 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647947462; x=1679483462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+csVLsNvAGMMkX+EO967Ns2Bq0YTd16hXxWuWzaAGM=;
 b=HtWI3Hmahiz1qR13Z9Z/jI799rAcDmauQlS4ZuhxKW9nSB0v9ahM6isi
 08gbFHH7dIg6Wt6oArdxEInQRJZxr9l5QHqYonOK6pGH9lRG1Ga/XUyqy
 49rjAq9V+OHg9kQ+4pXOPoPF9latR3WpRcI0Wi1QjjQN2dX3cM73Dyhtv
 3sEjcv5Y0aYXUiyXTQ45wVNzPhDiKP/rBJO+uo3SsDfPKzXbB1+124dil
 V4ovTSB6qtxx0LJTFI3zYXq11uD5+gIclncBSbPasrBh7F92l4CQl4blv
 8LoybnyHE92jE0YVYedPyH8n8W1MbRo41gV+g+h6Uto6jQodEL03AJN7h A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="320990953"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="320990953"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 04:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="552060555"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2022 04:10:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 04:10:58 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 04:10:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Mar 2022 04:10:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 22 Mar 2022 04:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Klw3Ydu4BATBsJp96NZ6TH6v2hPsyeu8f1DbKDztBPj1qB31CDeaMC0qgQ/3bY65XamS4u0HivVHRFrYCBAtPHXMb7RSPXSd8yMt6pxRoAIm+LJQbMxfLXs73JqEjhWMFaoTSqK88Ye3AM5g2dPcXZOis7x3xvV6OECuypnZHjSF2epCdx5xZAZxVAeT3WnAH9qufzbr2GslUAYJuTWJDXEcoH6Y04KzmVsb4GqMnR6usqXev1xvl40Rz4fuNIpM3bNaDPPJIqRTcSU5jihe1CLQlbZIELkDtqik0TX2HmrsSC3LS5rBXRF+SDjX/4tkkk1uIDk9uXY/3aBPzkcB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQw1l/sfOVIrKjRf2itCWUOD+tKPRWXcwlRqfvzols8=;
 b=WSZ+ijfAN8FlDq0HMp+nQporIQvdypaw/l9AegaxHgLoLTXMucZrRnYZuUbjZLk76R9ujGkyk/lcDN+SOH5ruUIwBdhiNZ/DJtPrnFOygkw5nwNPhQY0hHnR2UHQaAtg0hxEKjxrGCD2PM8s1T65oDnfPoeOVZj/BHbgaf9tDQDUVTX2dJzpInQNcY2OhrIoA92bR6U8QQ23WtpHVjqubJZpx4HuiRcxiQ2+448GHsWBvJRQnN1FDnhXprM7bOarBXnvMYLy1JOoKzG+vDaI3682ZlPYMrOiy69yxzW0pVYCQLCD4ucwIU+aSIxwXkJ1CCrLVJc2La0eMLPbnqusfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Tue, 22 Mar 2022 11:10:52 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 11:10:52 +0000
Message-ID: <486fbb85-d2c6-ea86-4c3b-2f9c825c5f77@intel.com>
Date: Tue, 22 Mar 2022 12:10:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 21/22] drm: Use drm_mode_init() for on-stack modes
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-22-ville.syrjala@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220218100403.7028-22-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85e1040c-4f25-4a80-c620-08da0bf4a029
X-MS-TrafficTypeDiagnostic: MW3PR11MB4732:EE_
X-Microsoft-Antispam-PRVS: <MW3PR11MB4732DBE02FB2DFCFA31AFAF0EB179@MW3PR11MB4732.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWM916wMkSJBvjImEGaDlp+ONFnOgeS8wR3oT9FEkMZFlhaU+7yrS5bjK5wwR5vcSypsCbR04oCys2XDEK2BQWxcppsTWfPM6yOF/5LcTn9QR6iNUlrET4sFiUbDoe83rQtzzX2qa7OJmWRIsoD4b1J6w49oo49l/IXdU99YeMZlPt1QMNzij42GsBe+ZQ9uS+pKChcMHnz0eUvl74i17CVZI4mrwDbexn59vNGdbe2YmtckPHRnHXLXtlUvmDHMr8u4A8Lvpmx1swDjAy2+xqmzQgiEdk6mJBWuRXFoYNOOgvJ4078uqSWGUwwJpW6ZLGQ5+L/QWRzS9WRjlkFSR8D7O2/S3R9962eP6QtK1r1uTut+uQohn+U6IyOkZyKBVMCw4uxhDn6g5PI1DgyA2x2UQ7SnfCbbLRH30pL84w3Bvp1pGaCA9z3quxq7v3hTQtJYhFLLsD9RGtRkAMsMa61gZoL4F8Gsf1QfPFaL8S8jmhMhD79+tLoH1GuRFwV9cI98vZ0mSP6O8izhKZm1JN+vBril7rbofyAv1HD2Y3B2aSZ/4fyASP8VJ2DCS/w2bdQqhe1OVuUjiEMQpGLv/fzwTh+BkJSpVpjYJ/7QeNY8ZRdm/UeJh9MLiKeUQxVjkQ5QAfiWHQ8wxaMtoWMFQu8CdccMxgUTJ0nKFXeG3t3kPaY2BJ0S59nRFbP0pvGB146v/YTmWTqtdo+P+iqXcJWU+Bg6JLA4ce3Rb06oOJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(38100700002)(2906002)(86362001)(82960400001)(508600001)(6486002)(4744005)(8936002)(5660300002)(31686004)(186003)(316002)(26005)(2616005)(4326008)(36756003)(66556008)(66476007)(66946007)(31696002)(53546011)(6506007)(6512007)(6666004)(36916002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWx1TE4xMW1XY002OTFaZlltQlFiR0J5U1lqOE9ZWHRaL0FzNTJFRDhVRkFO?=
 =?utf-8?B?VnhnOWI0QjNFbjd3MzBieW44VkJPZElXWUtMM0t6dkthVjZoNWp2Tnl6anQ2?=
 =?utf-8?B?cGQrZnptTzlCeGNaOWxKNldVM1VMcXd3cTF3UFEzVmo5SDdZNjVWZEtudzQ0?=
 =?utf-8?B?UjlmM2pMKzRuaC90L3JGWEdmRldXSVlEelFCSVd6ZVJoTUhmVkxHSjhWcGw0?=
 =?utf-8?B?ei9ibWFzQUVoTGNNVWFDVVBaWUtrS0k3N0laTktzQ2ZjUWNuWjlGSXh3cXBM?=
 =?utf-8?B?VUk5SW9DUFFpNEdrTUIrUkhrWXhVMmZEK2lZcmJra1JJZ09vOExibHVIVmFN?=
 =?utf-8?B?R0lIVENWd1Q5RGI5RS9rSWFDVm5STUo3aG9aVTY0UXhSVDBmNGp5SDMxNTNt?=
 =?utf-8?B?NXF1WWNUNXhybmhaRDFXcitnV2d0c09YZjdyL1FOZFlYLzJJTWdoUlF2SlJh?=
 =?utf-8?B?OG8wWnJINk0wQjQ0RnFpalYvWnNlRmFBNlpVbkFKcndmUUdseUJnM1pQOGVI?=
 =?utf-8?B?YlFBZnhSZFlxMjFOOFdSNmljbHFQTDJtcXZuWWVMT0tmMzBieWNNUm10VUNZ?=
 =?utf-8?B?VEtlZTRPZ01kcjl3ZHg5YXVFQmhSaGFNbVhNWm9pKzV0c1BJQTJQbUpUaE9p?=
 =?utf-8?B?aWlDd2pmUzVpYUd3RjF3STRULzRFcjNuWTRQNTBhRjJIOUhUWmdYSmMwZUtB?=
 =?utf-8?B?bUFWMlZDN3pzMzU3Rm9qT09WR2p1T2U5MjRMUzVrTjZtanN5Qk5Bd1Z5S0I4?=
 =?utf-8?B?Q3drSG0rYlZnb3psSEJkeUZ4TEFqWEpRa2pWN3ZHaVpraklacmhFTndyOVVv?=
 =?utf-8?B?SUVRUDdJd1BmRVBLeVZtOHZKL2tuYWgxN1dUSjFJSG13a29FRjBDL2M3UDhP?=
 =?utf-8?B?ckFXWHhZOWprbmJCV0krYi96WFNnbFd2aEo4K2ZXc25PZytYMVBxbHBJZWxP?=
 =?utf-8?B?LzZuVUgvQWhrTmdDODkxYmY4MTcyT1p5SU9sTzdRRW92QWhYS01OeENCbFBM?=
 =?utf-8?B?R1AyaFBleVBraWpXVEcwYWFlR1BnWWtieGR0RjdwMUxBaDFCKzROZldhaThm?=
 =?utf-8?B?UFFyNmtidXUxYVJva2hNMnNFRklSMEZ2N1lKWGVWenVaNkdOSVhhY1pPSnN3?=
 =?utf-8?B?VHBuVVIwVGNUdlZoK2RFUzMrZVUyWkk3dmZyNDhsR2h1LzhTRWdaMlJRZlV3?=
 =?utf-8?B?bzVwUndkazRMWDlrYUVlMEZSNlE2U1J1YnBVcGRkZHk5VVY4eStLbjhuVjhr?=
 =?utf-8?B?Nyt5OEpvOHo2L2YwNENUUjZTZXhnSE85QUtzMWZ5dlR3cnlPVlhsVUhtajQ1?=
 =?utf-8?B?eXJTNEs2RnlkTU5pbHRJMDlrbW9IM1R2Rm9xSDBtMlRBbG94RERqQ09YTUJ6?=
 =?utf-8?B?OWxaa3VLOGk3eUY5bnJFS1A0Ung1dkk4Y2tkdlNYYk1jTHZPZWZsRGhJY2tF?=
 =?utf-8?B?UVFIY3V3NEtxTUNaazh5RkI2bHJ4Y0hIYlJVYXZxTGRmVVVLMmhRTmdiZTRj?=
 =?utf-8?B?c0xhdVBQN0tQeEtQUittSTJRWDlpVnpDRlQxMU0zUmRDNGxoZEl6c3FYY2xl?=
 =?utf-8?B?ZFpEQldiUm96Zml1VDhmVHlLR3lJWXkwazQvR1MrRGJBbzM3L3MzTThFTmFi?=
 =?utf-8?B?VWhhQmxqVjNCQk9EMnZoQ3BGd0U0M0h6NzBYS01aK3p2S3F1TEpTWUNkWitt?=
 =?utf-8?B?dGRyaVlsQVQxK0xCZ1ZScjlGNkNpYm9HWm91MGJyNnBHR29JSW9sWWV6L1l4?=
 =?utf-8?B?T2pUQlNFVlZXcmdCaG1TOGltaHpyakxKRHREcnhBS2tYUDBHNUNvWlFidHRL?=
 =?utf-8?B?K0J0YTNLdml2dXFrS04ycC9lOE5OSVlyckI4aU4rS0tHdWh2SFd1dVRhVVRY?=
 =?utf-8?B?b1dmSU50dTdDNDZWcmhBUWh4cDRRcUxiZDNSTE5Yb1FLSUVpY3lmZEp1M1FM?=
 =?utf-8?B?YXQzWkRSTWQ5YWFHcldaT015Q3diQ3NldUc4ODB6SG5yUkFnZHBhd0E2c05a?=
 =?utf-8?B?VncvQlVXTzJ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e1040c-4f25-4a80-c620-08da0bf4a029
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 11:10:51.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rssxReCyerc+xc3qXN4fxUZ0B4jNpNrQNdUswi2yLXM2j/C+oPd8wmBMClMUa+BI39WO/KkYB8tb0DagfG+y0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.02.2022 11:04, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
> 
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M = E;
> + struct drm_display_mode M;
> 
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when != S
> + drm_mode_init(&M, &E);
> +
> S1
> 
> @@
> expression decl.E;
> @@
> - &*E
> + E
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
