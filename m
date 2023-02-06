Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C268C661
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 20:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315310EA1C;
	Mon,  6 Feb 2023 19:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09E10E195;
 Mon,  6 Feb 2023 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675710214; x=1707246214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g47qkuK0uFUfguV8hUQKvMKVKCIfiHHDZ5uKgRiWa5Y=;
 b=h4+4woSh5pNwViPypH9YPOGkJtDwghtbUi7OQFGqPao6lfJeaT7TrVOm
 7Xoi/Sw3ZlA4yTINoc7qSBIdZjMSoXPBlsrrW5NDjvDSZozTN9gf/L8q+
 UPyoyO5bhah/gGg1CwXCk692wtW70PiIoVpOto3u/LI7vDTXbhGW1OWcD
 ogJBV34FGD1SoCGD8U2AZt01+yIsVbsVObkDrXPWLpHpY0V+9fDJYGg5g
 KAPSlI+FTsIbibbEOMvz+VqMFYL2h1ytKT81Buz8bUQ2jevG8zb1ZpBbU
 cBgf8H9Sx62Lsb8LvN7w/lvi7fV6tpBgolsMSM0IT61OVd1aPi8iI9SP3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="312942802"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="312942802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 11:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="755338795"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="755338795"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 11:03:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 11:03:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 11:03:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 11:03:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 11:03:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKT6vr7lF0AFmpV3FgOdZaxjbZ1LXJkcqT7QtGRSnDqCW8eOMP0QrHuTsqM0Vs0VZZo3db/DK121KRLLQvrRENI0raKz+4HnK1z40b1ZlUnin/knAAfRnOMzVsoLyufswUtMTkNfDLXcAensxqNjq6W494CFNvHZKqY11y2xjGEO6JEvefaeSAQWHJTr+km/HynJ9p5Nq2jqIiH9tsMtoCWqFCpsyQqd4ckCJRtmUtDXh+Q/NV9YUJn86tbkz5KyXwHtKXdAP3SaPjyqBZzbCk9XTfVWFg8ichCkxVSEig6H3UKU0EJnk0IrTuh+RaIKinL4Qp2XiW9oFphuM7g+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0XLwmR0/7bj+PwR4VCccVyWepeQGgnxuTIGZxRrgTM=;
 b=GsFQuxLSniKHEvcPkA5a7o2a4GMIYkEWTrbfrV7xr2QEBTLUxe3HHfUqKDTNyjDsXiIzGeIYYMQwaDrjkg/Tc69uqU85WPwOPLsDD9dix8FLIsSJKwd1B6jttk9OQ+0yjwjwrbUSkC/3SH99HbXkUEKSUKbmsojCG8tvZZadFLiLwA3x+0aWz0FowSMGeGXnjDfDjVljsHGQp54ertxZfnJY8vOdAn/gwoYouoa70wpw+zIBDLNiNdNT+MZMdUkBh3JT35qo+4NqzowqL1bOhZCWcqXfBt6joPpoFDc1IdONsbfZRqS503qyKVIilywirEwKUhaAJEt1pi+/TXv2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 19:03:29 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 19:03:29 +0000
Message-ID: <1ee2902c-dcfb-7f9a-75f1-4f912fead180@intel.com>
Date: Mon, 6 Feb 2023 11:03:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/i915/huc: Add and use HuC oriented print macros
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230203085912.1963-1-michal.wajdeczko@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230203085912.1963-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3c299e-c247-4666-a71c-08db0874d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UETNBD3/WHUjpyX3xqXmXcn7Za7PHFUi6vUmeAa9x6v5qOfUPg4/Iu0CS5BYD6x8MYTJRF1jJXL4yYlSOeLlEIiavHp30DoRDAGOqQaMLDNwE+CT5RACGkCQrneowguDIZEwNuxhRY86NVnk7e1WZb4oEDrVx+jk4ig3/wjHYTMrsfNgad65O5ypB89C92Tm4TAQMsHo6O5osIrnb97fIJSEcbHZqsWWaeKYhCJ597lVlVIRspEaAS3zKA+SZ+JLZ30zLznT8OuhBEyheO/iu1oP14ku5f5VPQ2rYnJZTsVP+4Njb4mt7r0yTp0cu93ZVxWVYQswOy1nD7jitjEuba6tIUKHsIujCeQ6N5yGmpN5/52dJE+MoWCQWjTJagMpYxNgLPi3XqBC1q8wwQj1gCsD1xx9hOYkfBrJ+wCaHYAXr17hu+tH1dycFpUrdHfukV/lT12scDDLu6/Fn4FKFeSuCGLSKTuYvCe9v1bIaXVkO/mUNs/VvwAcD38HAOfGDor9x7ygJDWINFFacVQ+/lMAc/N41Gq2P/MZ1SvBEHGGeHkngPn0B52pGm4m+CNkNaS7ztvfsy8ED4vDsu28YqaRSKbl7/SrCqahBjpJnNN8cYES0iRRaZrXeqqzCq2GQms5ntCoJUoXAVgGswF3slkUmKnm1nSLSX9+sWV1UlPJneSiQi3Jl4i+LsaRiUDsg8QEIQbbS5UFeUfQDehBSH/YNT5a8JO2YwZw1whI6jc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199018)(36756003)(6512007)(53546011)(6506007)(107886003)(478600001)(186003)(6486002)(26005)(6666004)(41300700001)(2906002)(5660300002)(8936002)(316002)(8676002)(66556008)(4326008)(450100002)(66476007)(38100700002)(86362001)(66946007)(31696002)(82960400001)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVIycUxXY3FDZ090NGpDOWhzR29iLzhJd2JGVWJvVklWcERYK1hxTU84cXpP?=
 =?utf-8?B?ckZPZUV2cnJEVCtFQVVqQVdaK0htQ2xoeHhSUXByV1Z0K2tzUy9wWDcwd0xs?=
 =?utf-8?B?MDR3dFFDdjh5aTIzL1JIUXhhUXp0YnphMmRJTDBlVWtRUFQ3UEVZYUoxTHlC?=
 =?utf-8?B?SWZFWlFFNEpBeDBrRnIwUFRveUltRFhrZ05mcy9EbkJ3VFJlbEVHYlpRZkIw?=
 =?utf-8?B?WDJwaEttYW45NHREVHBDbms5U2hPM0NNMDhFV1JQOUZOVzhDQlMwNXJ2NGVH?=
 =?utf-8?B?K3NOVzJjQWhyN2ZrSGFYSEY3S3VtWStYU1F6dVBIUEd4ZVZucDNqbG5KVjVF?=
 =?utf-8?B?MmdZMWtwcXh0RXBqZ25VWktPSmNjSHJObjF4dXlGaVVwZklxOUNmZ3dXdzBl?=
 =?utf-8?B?d0FnQlVuRUMrNVRQZFpsSHJmbHZXM2MxeDdCTkRqRnFhMG1yM0ZvSko0dHF5?=
 =?utf-8?B?TUlDdGplSGlveTF4YnVuRHozcURTelloRkpzK1JqNlBWYnE5aVh3QVl4VC9j?=
 =?utf-8?B?QllFbW1YOGE4aGwyQVZFSG96TDRoL1BibjlIcmo1emU1M0RaM1p2R0hIU0wz?=
 =?utf-8?B?dEJ1MUhNdDdCTmZTWjF5MWRkd0RWcUpULzZMb0g4Y3Iwa3FibC9sRXRpeW1J?=
 =?utf-8?B?RmlNVlU5WjdXUmUwTENGSTlhUHNVZzlEdmMzR2NlS0NaL210K0N0aXpOTjR5?=
 =?utf-8?B?MjI5czFMMlRrWFF5T21NL2h0OEMxSzFKUDhiMWpNWHo2SWRVUnFoTEpPb0I3?=
 =?utf-8?B?d1ZZNFU4OUFRR0JLMVhkOGIvNUp3TjMzYXNqKzBDT1VCaCs4aXl1QmMxV0hQ?=
 =?utf-8?B?OEpWb2N0Q1VmTFB6cER3cVRvMWdmd0R6SGpXamVibzhPMTlkTnc0d1Y5Tjhz?=
 =?utf-8?B?aFVibWJ0aWRYQXd4ZkorTTc5b21YQXRSSXQ4MU03Snp4SzJ1bW42aWpWQjk0?=
 =?utf-8?B?elgyZXFMRVg3WGZFeU8yT09QZU5Cb1hOMlFwYWVPaHBacGFGR2Q4aThCZFhn?=
 =?utf-8?B?cW91YldoZGZmR0Nka2I0dDVnbnVlMk5BTll1bmxTai90Qmd6ay9pY3g1QTR1?=
 =?utf-8?B?a1hIcm0zNUI0cEpzQU9KZGZQamRpczlDNHZhbTE3bllncGhRQmtSSEs5N05r?=
 =?utf-8?B?VHIzNzMxeHlSWjdCQ290Uk1oSUg2WEMzUHRIMEtZZy9qVjRzZWFHbU5WMjl5?=
 =?utf-8?B?d2FoN2tmR3IvbXRUdnA5RHdNZ3MwTUp2Z0NLSkFldDdSUnhxNW5tc0ljY3VR?=
 =?utf-8?B?SmlET1QxeWkzYXJkNWdvOWJhQWMvMWFRVEx6N3BQdkF6M1NXQ2NjUjNVU0hY?=
 =?utf-8?B?aDl6eFZBL1AxbkQ4ZTZVblphaHpaelFjTDhFamZrUDlYSjkrSXFLUkdNcjRO?=
 =?utf-8?B?ZXI3RmRHY1poWXR2cFVCaEIrRGd1RWl3QlBBbE9idCt3cXh2TWFCU2p2RGow?=
 =?utf-8?B?eWcrZ24yOVM5MHZMQTl4SWlmWG5ieFdEY2xteXFtY0xhN1JwbExRd0lMZ09J?=
 =?utf-8?B?RXBWR3BLek9JbC82cXlvMml1S29hdW5SZHZHcmd5REM0YXJScUZFTS85VEdF?=
 =?utf-8?B?bkJ2cWFIS21KUFkxUEZRRDFQRDRKMXdEQUNxOFBvV2ZMd2svN1VNb0F2K3lT?=
 =?utf-8?B?VGRyY0N2MlJGTXFYR0gvbXBvS1ZkbUlVMHY1K2RtSzZNc2pLZ1lidTFQS0tw?=
 =?utf-8?B?TVVXMStqOXpUSzFtKzAvci9iRUZmNlFlYUFOUVJoekdiZ1pWKzBSbHdoVG5G?=
 =?utf-8?B?TmtmOWFzVDllYnpkdVBya282clZHS1VnTmsrWlI5ODBZVWlGNk5XdHJHK3ZB?=
 =?utf-8?B?bzhaSlhJeTdVaGQvWnl0L3RqWkVNWDVIK3I4VjZ0NU5QU2h3anRUMFRJMjl4?=
 =?utf-8?B?WkJzSWN0cUgxS3UwR0wxLzV2U1NHMGtTTlE3UVBIcjZwTnhRTkQrYzd2M3BX?=
 =?utf-8?B?S3dQVktnYnJDSzJYaGwrNGdWRE1DdFlJTFBQNnZWR0Znc3ZvTlZ6cmdUU1FB?=
 =?utf-8?B?VStsbTI2bFhoRXdmUm5QN29scU42bGljVDIrTmd6REFOSk5QNWcwcUp3ZDls?=
 =?utf-8?B?bzZKUEVVQlErR1hFN1RESlVqV0lkNmtHMDNiaHE5UmtkZm5kaXdJUTB6U2Z0?=
 =?utf-8?B?dFNlQ2E1Z2RxWVZhcmNPaHo0VFFpSENlTWphZ0VQT1lJdktYNmMwQU9OM1h5?=
 =?utf-8?Q?TgQ0GhyPZphXzy84f/lUTAQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3c299e-c247-4666-a71c-08db0874d504
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:03:29.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiUvImUWbIfUSy0Ijp0jcwOqS78UexD7qxc4rGXU/QvWrU0l9ma6mKnp55ctD3dqF/eFFFetOu8xu1PkrZ7J4SFgE5dnRoZaq2MBX5PgdG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2023 12:59 AM, Michal Wajdeczko wrote:
> Like we did it for GuC, introduce some helper print macros for
> HuC to have unified format of messages that also include GT#.
>
> While around improve some messages and use %pe if possible.
>
> v2: update GSC/PXP timeout message
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 44 ++++++++++++++------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 410905da8e97..72884e21470b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,6 +6,7 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
>   #include "i915_drv.h"
> @@ -13,6 +14,15 @@
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
>   
> +#define huc_printk(_huc, _level, _fmt, ...) \
> +	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> +#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> +#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> +#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> +#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> +#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> +
>   /**
>    * DOC: HuC
>    *
> @@ -107,11 +117,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   
>   	if (!intel_huc_is_authenticated(huc)) {
>   		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI GSC init to load HuC\n");
> +			huc_notice(huc, "timed out waiting for MEI GSC\n");
>   		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI PXP init to load HuC\n");
> +			huc_notice(huc, "timed out waiting for MEI PXP\n");
>   		else
>   			MISSING_CASE(huc->delayed_load.status);
>   
> @@ -174,8 +182,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
>   
>   	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
>   	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
> -		drm_info(&huc_to_gt(huc)->i915->drm,
> -			 "mei driver not bound, disabling HuC load\n");
> +		huc_info(huc, "MEI driver not bound, disabling load\n");
>   		gsc_init_error(huc);
>   		break;
>   	}
> @@ -193,8 +200,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
>   	huc->delayed_load.nb.notifier_call = gsc_notifier;
>   	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
>   	if (ret) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"failed to register GSC notifier\n");
> +		huc_err(huc, "failed to register GSC notifier %pe\n", ERR_PTR(ret));
>   		huc->delayed_load.nb.notifier_call = NULL;
>   		gsc_init_error(huc);
>   	}
> @@ -306,29 +312,25 @@ static int check_huc_loading_mode(struct intel_huc *huc)
>   			      GSC_LOADS_HUC;
>   
>   	if (fw_needs_gsc != hw_uses_gsc) {
> -		drm_err(&gt->i915->drm,
> -			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc),
> -			HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> +			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
>   		return -ENOEXEC;
>   	}
>   
>   	/* make sure we can access the GSC via the mei driver if we need it */
>   	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>   	    fw_needs_gsc) {
> -		drm_info(&gt->i915->drm,
> -			 "Can't load HuC due to missing MEI modules\n");
> +		huc_info(huc, "can't load due to missing MEI modules\n");
>   		return -EIO;
>   	}
>   
> -	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>   
>   	return 0;
>   }
>   
>   int intel_huc_init(struct intel_huc *huc)
>   {
> -	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>   	int err;
>   
>   	err = check_huc_loading_mode(huc);
> @@ -345,7 +347,7 @@ int intel_huc_init(struct intel_huc *huc)
>   
>   out:
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
> -	drm_info(&i915->drm, "HuC init failed with %d\n", err);
> +	huc_info(huc, "initialization failed %pe\n", ERR_PTR(err));
>   	return err;
>   }
>   
> @@ -389,13 +391,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>   	delayed_huc_load_complete(huc);
>   
>   	if (ret) {
> -		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
> +		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   		return ret;
>   	}
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	drm_info(&gt->i915->drm, "HuC authenticated\n");
> +	huc_info(huc, "authenticated!\n");
>   	return 0;
>   }
>   
> @@ -430,7 +432,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   
>   	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
>   	if (ret) {
> -		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
> +		huc_err(huc, "authentication by GuC failed %pe\n", ERR_PTR(ret));
>   		goto fail;
>   	}
>   
> @@ -442,7 +444,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	return 0;
>   
>   fail:
> -	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
> +	huc_probe_error(huc, "authentication failed %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   

