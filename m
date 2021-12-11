Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43643470FF5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45EF10E35B;
	Sat, 11 Dec 2021 01:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AD010E35B;
 Sat, 11 Dec 2021 01:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639187012; x=1670723012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y1Kpp7mYGHSalozcgGRnzhMgwVmsxlStesOf5owPjL0=;
 b=koCVo7EkRx+E3v2PLSyB9TOYy8SBkffcczayyqVPELoVAFigd4Mv9mou
 +3Eb1loWfOHYnilg8y5AllJhP3SmcrvkxZdGeb691P/DCro41uzQXcMYY
 fbOJmHVScwZy+QlK+pQPPCl7LUtQh7bYdE9pxlSWB3a1eYwBbCXsNXaJb
 E9peGU6Y87AOilH1Es0Oe0jOyAa7RkGPWbATECVvYhQdYSM2a5VMgM7H9
 jwm2vVrgF86C0jx1A5xdGca9QDlOXGaGqCAEP2eSkpT6mO6EbKXzwVm68
 BUefeHVMFBpBGb8rqiWKP9RstLEB2feMDgg25KKDPvBxzxXcHOCouyhOS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="299282772"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="299282772"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="751009225"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 10 Dec 2021 17:43:31 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:43:31 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:43:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 17:43:30 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 17:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of9k9sag7P2gghknI3fHJ1a+y2ZwlKt/J2GEligttHLyy6LvnqFMcFhlPpGlqcLHpaXwtF4pquqt8TOmz4RP/eeGxZVdJV6DjZrdrEaZZMHtN2KILEs+RnAIA66m713gAsCTGvw5IdH3h4SKyhp20FdkxVbsGA2oFHWMjvNQevsc70OIdbMCILH576mtRCG8AhTY61XjeTF5kTjzAaynieBWZQlweOIE3VhMvTeKxOdU6QIJCzwHJpz0U6TYasKthJldqYqNkUGczc+LmeEfbqZBgirzpw/4UFNXyMRVAowOacy7HCVPuTvOMtHGgRedGs7uHRuJFGLa4SdAMxfC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xxGNXkEj4ml0ZH/DZj9b80I7sm8N1oSNPbnjf4e0oo=;
 b=S3wtfY7gCwZGrkK4pInOXbXW7AQVdFjR5XR8VC/okJ0mwKXSdEAW7mj9rgxWkJoQgJq+ZQ476rBY0Txp7sJhwcgHR1ZtKP5CtDb12oAuRRsYGz+csTSLXGH7/QSwYdEX6/BZ+KR3FtTPDpQCsOfEGzOXMm71FlxeHwbwAUb05S0gyeaIkc2+3qrzwdkEbADQh9gdlSDnBNtH3XV6U4JAQxq/GfGiUozNc/3IZYsdDhZ6Xc5VhNITEQsdNH7W6+gAIZaCS2gHxQTdb2bjSbXQdNDdcMcE4H5P4N++D+BSQEn1PjR2TaUjvFMAIB64GtkfuciaISa/dRB31V/uKQrphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xxGNXkEj4ml0ZH/DZj9b80I7sm8N1oSNPbnjf4e0oo=;
 b=wOfhwK6mTb5WVctK0ahlMtdlxVPbT5WZ23MvJcB84n0c46GZAXGknt4vAomzJbZK4aqZE2AOCXqUeJNkzoPeTSiMDtsh8sTVMg4u0nmQ8kcEn1/A9f2eUhBT2teuKkKszHvmozWZkTeEIGaVeQJhoO12uikS80H8P02A+Zi2m/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BN6PR11MB2034.namprd11.prod.outlook.com (2603:10b6:404:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Sat, 11 Dec
 2021 01:43:28 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754%5]) with mapi id 15.20.4755.022; Sat, 11 Dec 2021
 01:43:28 +0000
Message-ID: <57f7200d-1ebc-2a20-513e-3822e5bb5963@intel.com>
Date: Fri, 10 Dec 2021 17:43:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 5/7] drm/i915/guc: Add extra debug on CT deadlock
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-6-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211005612.8575-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR21CA0047.namprd21.prod.outlook.com
 (2603:10b6:300:129::33) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR21CA0047.namprd21.prod.outlook.com (2603:10b6:300:129::33) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 11 Dec 2021 01:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d3c962-138f-431c-6a4f-08d9bc47a0b0
X-MS-TrafficTypeDiagnostic: BN6PR11MB2034:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB2034BB5608D10FF8D90BC055BD729@BN6PR11MB2034.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdL6/0XHpltlLOcPIgv3l+ak2smHfEdTO9sfb9E2+ALMbCSTI8lxzF+BrRujOMcU8Fo94dMoOxLA8B331ij/57BBLnXMTzdeQE+dnnpowrkVwUfSgg6gFRKPcXBR8NhKVjNw/3godYBcDi6hhuUwpFA7ptboWc9dbnevw8JhH+YRAa9rgOB1umeWoYnR4Au3sPXm+uh/PvNojLs/PAr/jLANRHXyOsYWNoE4IdHOIDqK++4ZY2yvIe2/3DHdnPoDF3x5MCvLXVCEsCpCzeQCJdOVXrjkM8k6B8r9iLlVtSYBgsubrSDbjbz3GCZoKa6BjfdaZY3x/x8JCHWVdvd4Qwoq4eQXTghJQbKTCtUT6o2r+FJ/HWIPzwGKeXR2Y9DMnSZDdqh11O2OGIAA1+mpAptLQwGwvK7pEbbzdLG5d1mc7RRGWeDt6l9K3Wqi6Ryi++Lz7KR8EDo8xKOTRHOILupfNVc1T0Yk/9vP52WGXlco6zOry/ZMgCLxYn/2pYY+TqZP9haqymSi9wiBMusY90tkATT0qGqrpLmxVWggIoIjHoKdrTjMowMxp583i33kFRIyg0MMKTnDV1WMDG5ZoKArqs7TNe4ZXbXkfsivwX3keQwqKE43MHokLgmFYusVWJN4QUUowghgfx9X9a8L4rb/K0tEaPVP6DqzOJshDViFkt2L5gSDRow81wjy0EYnwihy8El+ewAUAB5NAavkUynxQDgvZ9mr0mfYZCdvjwgD3kgksWTw/eCfgoTY8znL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(36756003)(6666004)(8936002)(8676002)(82960400001)(2906002)(316002)(5660300002)(16576012)(450100002)(4326008)(53546011)(31696002)(66556008)(86362001)(6486002)(107886003)(956004)(508600001)(26005)(2616005)(186003)(31686004)(83380400001)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ZpMzRIaTNVK0JOcUFpdzh1Q2pWUVBXVmp1RmdNL0FEZi85MjNBVS8zSkdu?=
 =?utf-8?B?MjBSdEMxYXBocmVaTk8xVVhodHBHM2VQMExtV1JyajkwS2xXR2lLbElZdkpN?=
 =?utf-8?B?WHkvNTRTTEMvOGNpN1VXTEkvTnZyM2VnNUtPeElpcWwvZjdEVWVGdDl6MzF3?=
 =?utf-8?B?K1d1Y2JNL2QyRGRUQlpvMnhLN1pjbjE1RUMwUVN6NzZLY1Rrb3c0K3h0Mmc3?=
 =?utf-8?B?aWFWOEl5UU9DTVQyMVpKb0NRUVFyaW55bTN5bVRTVFNQZFNvdE9ZN1RQaUtv?=
 =?utf-8?B?bW1GY1Q4OTZVMkZNWXdpUTVuMzNWUlhlWmlERTV2RTE4Z1loTXVyYmZMbjli?=
 =?utf-8?B?Z1RCZ1pOVGVIV2pIak5CclRpWWhNc0JKV0owMkpUV2VOaWxUeS9PUVVMRnFw?=
 =?utf-8?B?MEZMZUhFZEczY0ViSlBkbHBlaW44ekJqZ2VCam5DeGNhY0RjYWRqRHB0SzdR?=
 =?utf-8?B?aU9UWkJtbTN4Y00xM1ZjbmgxeGNvRURqbjF3NjhKT0lpaXphMFlTbXgwakRB?=
 =?utf-8?B?Z1V3ekMrTitZRjUrajZxVE8xR2ZQYVliME1sMXhZTnBBTW5aS09VSjEyZUE2?=
 =?utf-8?B?MW9KUzZpbFduR1AwY0VOa2MwaW45bUEyKzhYTWMvcTE2TVgzaUxqV1ZDSlNQ?=
 =?utf-8?B?OVU0dFk1MGVVVE9obGRvL05iZUN5ZmpzVGhJUVU0V0gvOXN3bjRyd1RscTk4?=
 =?utf-8?B?cDF1L3RFeDZZdUJ6a0UxSXc1ejdOUWVISExnZHU3QXFuMmdMTDhRUU5ON0h1?=
 =?utf-8?B?WXc5dHljSnhyN2VCWmNBUDVtejJ3bS84SktXY1NEbVhpYkN5NUVTUUlHUnpj?=
 =?utf-8?B?SXVTWS9rWHBZVVQzd2UyOWg4Y2FvWFgvTUt1NjRUR3MyMVJzTHowY3FWVUpB?=
 =?utf-8?B?WG13VUxjR2p2TVZETVZPcERSckxPUGVoQ2x2ckZFMmxmdXl2K0RFVFdPRlJY?=
 =?utf-8?B?eUdkWHMxNlZKb3F1SWlSL0FLMEJ0WHFjSTdsOGQxam0zMWptWTFLRGZYaWQ3?=
 =?utf-8?B?bmk5dHl6YWg3RmxCRStZVEQydEdWNGlQZ3o1R1RsSnhLRndTME0zWDdBMkNn?=
 =?utf-8?B?eDJhb0dRZTdFMCs2Z3VMNE5WSEw5amVucUZVMm9Za1pzdFp2eTZodEtLRW1r?=
 =?utf-8?B?TDBTeWJJUjVsSUs2ZlBQWmowdVJUVjZ2QllncFNjKy9lNjJudGF0S3o5b25q?=
 =?utf-8?B?WUIwZ2R0Y0dMQXQ2Zk02MzVHRDl3ZlBKcmpObld1RXg5eEFQZ1JoTjFza1Ju?=
 =?utf-8?B?K0lHZnhXZTJMSUI2aHdleWJsUkY5a00xRzdPUWpDcGRqRTRaOEdRS1dic0E3?=
 =?utf-8?B?ODIyblR5VklabmUrNTRRZ3ZBV1RXcDRPL0p2Q0Z0NTYzWUdYSzh2amNrbjZ6?=
 =?utf-8?B?QW5uKy83SncwblpOTEI1YXlUeTlZY25yQ1ZmYVExV25FdWJkeGlEMVJDaFg4?=
 =?utf-8?B?WGVoaXg4QzFtZWk3UXRSNkV4c3hpNzBaOE5lc1l5cDhFSFdVR3diVjJ2amxY?=
 =?utf-8?B?bzNEYXFiVnhMd09QbXo2Zm1vd0Z0RGk1aWVKeStaUFpzVno0MTdPNk93RElk?=
 =?utf-8?B?cTUxRTg0Y1ovQzhDK0ZuazZRQ0cySjlBWk5uRSsza1VIay85OXVYQmIwRGl3?=
 =?utf-8?B?WVJrdGtKMVVIU0xWNlFwTkt4cGtMQ2ZBSFhDK2NUanhmTW9GOWdBWW1VV3l5?=
 =?utf-8?B?QU4vZElmSC9aYjNIdzFRR2lLSUdwZGRpcUF6UGw4czRoMEl3OUpGMGMvN2lp?=
 =?utf-8?B?QkpZRFVrS3FwSm1MTWNNN2o2ODcrZlBQNW1pRGx2R0dvZjBCajZNOTRpWVhj?=
 =?utf-8?B?dFNabnhwTUQrZ1BDMHZsYjBUaGxBUUcyVkhTcXRVSFBibkU4NjlFWGdKN1F2?=
 =?utf-8?B?UEVlYkY0aE5OR3pHa0grLzI4b3BBSzEwT2FRaWJmdE9Ga2xNVkQ5RlY4MHJB?=
 =?utf-8?B?N0FTbXNtTUNkd1QrZmJuTDdFalFvWUFhV3dxclBsVU1vSnlHSzZiOG91RjVS?=
 =?utf-8?B?bFZjRTVySVFPWEU5Vkc0RVhTQ1JVOEUvcGlrVzR0RW5ONHgvdVZYL1gxWmhD?=
 =?utf-8?B?TE9lU3ZtRDR0TkJzT1hrN3AwSElTOHh4RnVkQXNCaXJzdkNhcTAzRDNHaDlV?=
 =?utf-8?B?N0lNbVJxUXA0aWJaNjF0dXdFTi9QTVNNQm9VTlhkZFdyaWIvTHFFTUhvaWg0?=
 =?utf-8?B?aVk3a2d0aEJyS1pNM01tYUVDcVh4QVdjNlBXYWNiSWxEa0YvZHNaelVyZmkw?=
 =?utf-8?Q?woRzymJxeHvldeJH6WyNE9gpi4biQOGlkLAfG3Ljqk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d3c962-138f-431c-6a4f-08d9bc47a0b0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 01:43:28.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBlXkcnoCKeRsAsPmoHxlnnc8lYK2ekRhD7tN/OsCRwshtA3FUaOHTFrmSNpn3srVoS08HYVNLkO2qh432PFpKb4Ti3FkLmLsTWDzLvoCHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2034
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/2021 16:56, Matthew Brost wrote:
> Print CT state (H2G + G2H head / tail pointers, credits) on CT
> deadlock.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a0cc34be7b56..ee5525c6f79b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -523,6 +523,15 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
>   		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
>   			 ktime_ms_delta(ktime_get(), ct->stall_time),
>   			 send->status, recv->status);
> +		CT_ERROR(ct, "H2G Space: %u\n",
> +			 atomic_read(&ct->ctbs.send.space) * 4);
> +		CT_ERROR(ct, "Head: %u\n", ct->ctbs.send.desc->head);
> +		CT_ERROR(ct, "Tail: %u\n", ct->ctbs.send.desc->tail);
> +		CT_ERROR(ct, "G2H Space: %u\n",
> +			 atomic_read(&ct->ctbs.recv.space) * 4);
> +		CT_ERROR(ct, "Head: %u\n", ct->ctbs.recv.desc->head);
> +		CT_ERROR(ct, "Tail: %u\n", ct->ctbs.recv.desc->tail);
> +
>   		ct->ctbs.send.broken = true;
>   	}
>   

