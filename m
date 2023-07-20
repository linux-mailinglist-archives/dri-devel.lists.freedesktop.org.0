Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983675BAA3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 00:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFB510E1C2;
	Thu, 20 Jul 2023 22:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04910E1C2;
 Thu, 20 Jul 2023 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689892234; x=1721428234;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+PrKc62zhth3SWHCBquvIuDYJqgOK7FttEi+eQQfrVw=;
 b=cmeG+LMPnpAtCy5auyfQZeTEbA3yi1+c5ddcjufHmNJ9+vIIS/g/5sph
 EcKQp/71Jt4lNSjstjLzzmHHkID6agygA6GTCOYfVAYCwY7TY+DeSbxLI
 mx7vmdTXhjji6Pkw+gg3YxI+XtzguOlnwbC68Qqjk4aPfTGOTpKtZdQnl
 CUExs/u3nJbXmqbUZ0Hcpp1clODbL0ijbrcwqGwezSEKmwjeWt/nZTBz7
 ahmnzHJWmPo65xsD/vr3v125iCje0+No6xH3N8Btc3uLDNkechGYB5Qc4
 E3cVzWVYUDPQRj4qGkZSduFuM3cwKTvgJykXmsFuQUcYeckZD9YjSd5bK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365776881"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="365776881"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 15:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="674832403"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="674832403"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2023 15:30:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 15:30:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 15:30:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 15:30:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 15:30:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnfcZ7ya2mqWgiOuL/2Vp+NflkqWoYUqI9dW34AGXAaZq3QFFUBHrfpi/JjOI7g0D6aRqv+nHKg3OtjqZ5xsa6hNWaAsxkKK+U/MudegcvpdUyBBVtsqOKMGsc298KbrW4povEXrRcnEKv/8m3dY4bfb2VPzPWpmYuOBzjY4/a8aq1Dh2sB2tSROh4VJSuwOS1rzoLz+tujCoU6v04VV8bdX8Ar2Dq+qnnVuhluJrAwy0FOH6kXlWK8PLNCdkk8kKHURtt0JpP/bVY5garmLCRis3PpMbglbZTmr37RjEYhCu4YyacL/MT+JWWkNdVxKuw6ktnskzKdFDgO2aZe5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZxANwIrcUjYDGR+Qvr3qTe6hfGF6vp2wvdKCEODFoQ=;
 b=fg+0GbtblW1vYVi+9PRzSxHVXo/Z0doEuPMSV6fc1j7cgcQsDpL+A199yk3f5VexdJSTjyMQz8oMH5LbTKaXaT8NC8HrOJ6pLNt1HOaNmo/NOwZ/BWNBLJ+uzNac/dWAZoQzOamCxwI+3XetZDg5RS7SCOBYrrmTZddgNMQQm92zDj2jzweG5qMw42wOy+Vem7cptItWt+XlNtVMAw41uVdcSQUO8A4lqPTZsNBgdzDSzwHiG8Jb5XmMkMX9aysffLp1DA5W4kLQeZidyi7PRoFZMzUqD6jZ33KeFtxhZQk950nqKbP/1WLA4mkG6DCJIZ6ufbSqi3MZwVpYVvXpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 22:30:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 22:30:29 +0000
Message-ID: <500aa7ab-f272-aa1d-7006-8f4d0d25b741@intel.com>
Date: Thu, 20 Jul 2023 15:30:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230630014412.1360180-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230630014412.1360180-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d3561e-6800-485b-fb86-08db8970eb97
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOCtZPWylGc2nfNgLa0agNLY8RMIXsn19YeBVdNztoH4Zz9FY2s0GnQzbSAG03oxjjz69raL2lod4MQxdrjN3YFxTLzW/su0FSIXsBHHQNdKlxPRk0mFXqJ3acDb8+Gg6hdvJd2PIxwyIldygzOz0mKaETjFmGCxyWg8lzhVxjRaHehq/g/MExVHLhbgu2ljY4hgReTwGlKTxvZWRKQd+3NjqUKU7HTWuKq3CZE10qLEpPKk1AHA7KkmqhCKqeH24r7JtfyFFtsJmQycRacHezIQmYj/MmppMmxp75xdPblEWGKgbdhD0Oy3LP0xmEiNgA2MpgJwvISQIAkeVYgfWhoAHCwX3tJGuWXh/MnLPdgO1hIkbDLZt4UwKtVwhXqxE4TwEQQA/EqWfBhnHY5w/2xqbAXhZcqqPxQjB96k2/clmlqDVfzGGGGLsYzIAY+S2VsZKPUPnvuEEMKJy0qmmZhPwu+jE+dIyujB2YxQQYeXvuxBFtushSues3+DwRJulQSE6UMJLSW1MJNgIXC93kLsmaE0nYtsrCPc2b7E5c9LA79UidV+yG7bE9wQjnmASLOUNjPs+Ba+9TGw0g3dgjSaOfzU1e7PwxXFrwvA4M9i8PxksYA644neAf3FnV0ohzDvhoYNsA6gVQVcLwMKvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(6666004)(478600001)(6486002)(450100002)(6512007)(54906003)(53546011)(6506007)(186003)(107886003)(26005)(2906002)(30864003)(41300700001)(66946007)(4326008)(316002)(66556008)(5660300002)(66476007)(8676002)(2616005)(8936002)(38100700002)(82960400001)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitiN055aTJKR2lkRGcrbzdkNkVDelprMmRJbWI4Y0xDNmRjbncxbjB5aVFI?=
 =?utf-8?B?Y0piUjZQeU9UUkE4eGpyUjBZbktEbVVtTk5hSEJwaXlqZVdaNlhNOVpqcC84?=
 =?utf-8?B?Y2V3QWU4ZGdDcXNGNTN3aUhrcFFBRHNmaTJsbWlwTUNhaDdUbnM2V3RUbWds?=
 =?utf-8?B?YWRDWjZZQ21Oc0VLTVNjWkhSeHpQMVdEYWxOd0VJZDlCOVk2K1g2bFNQSlI5?=
 =?utf-8?B?RHpLQmZJSlF4U2w3QTFSNk5KK2NNaW04cmpBemhxbWVDVHZXS1IvMUVXRSs2?=
 =?utf-8?B?M0ttd3lsOEEzZzhmVVN3aDlQSDFtbE5kTzRtNkpvSlYxRVprNnVqQU4yNkZK?=
 =?utf-8?B?bERMQnE2RDk5bXRGUy9aU1pLZFhzK3VvdjZ6LzErbDRFSGFma3paaXhsZGEz?=
 =?utf-8?B?cEVJMUNyblFvRnBMYWM2emJCdmE5ZkV3dTVsSDNKUjZqS0dDbzRjWWxVZkhH?=
 =?utf-8?B?d1BOakRDVkdJbVk1RW9BakpRRXdnaml2c0czVjBXRjB5SDJBRGg2V3pJTTRN?=
 =?utf-8?B?Q3RndU01NG5QK3lQMFZWay9PYndLUzAzdFhESmlsMkxsMmpIRWFyQkFoSnZ0?=
 =?utf-8?B?V1dYYXA2Nno0QysrTzJUUnZkSDZRNlB6U0dhRklOb0xhMGVBK09oUlhNSDhD?=
 =?utf-8?B?V2VxQUZVQVkwQlIvT1dQb1gwUmtuZjR5WHJaN2x6dnJBZTUrMzlHU3ZmQjZl?=
 =?utf-8?B?TkhJWXhzOENEMytvb25xTVpMMFU3ZTZ6TUVyalJJVUxmTzNnZ3lEbmMxQVAy?=
 =?utf-8?B?UHRuR1ovT2tKUnk1Unh6bEUzejBmMGtnVE9FMzU2N2MrRXJpSi9QZk5ERVhs?=
 =?utf-8?B?QTlUZURqeEc0aTkxVzQ2ajVpaDAwYlBaRXI3YWtSV1E4MWJFYkV1aHZPME9z?=
 =?utf-8?B?L1VMcmV1U0xBRVE4Yjl3SDRPWDdPdzhnTzRJY0kzZ2pZSWx0UXVtNXFKYzEx?=
 =?utf-8?B?YjhWSEFSSFNKeFhZdVhSNllGZEZwVVYzK3M5RmhFVjZwcXliRyszMmcxK3ZG?=
 =?utf-8?B?SmZXdW9KTmdCU1QyMXI5VmF4M2ZYa29ZV3RvREF4eGNLbmNEaW1GQnNTRUFT?=
 =?utf-8?B?RkQrZXJoRGZJU3pTTXRkZHlHMStRa3ptbUNaT21lLytPaDgySk5DbHRKZGtn?=
 =?utf-8?B?WVJWd0NudjJ6MktuQm54MmViMVExTjdOaWVaMEdzWlAwWW1paWZKaEFhUGdw?=
 =?utf-8?B?Tk00aWVRK1YvQWxNQWEwWFQwbzd3Wi8zZ1dmUjlOWmZaQ1VtRTN4YkpkVGNU?=
 =?utf-8?B?RFBTZitxWGdXSjl6M25adE84dTBXVmlQNTZlWXhCZGF1OXVUMGVSMVAxUms5?=
 =?utf-8?B?SDdBcTEwanBtSVlhdXl4SHNPSGgrcWc2eEp6Kzd4N00xLzIzYmFyaGpDbmU5?=
 =?utf-8?B?WXRLb1FUZXVQU1ljNTQ0RGVpOW9DbHpNYXpma2QvdlpaOXB1L1pVN1d5M1Zr?=
 =?utf-8?B?QWExa29TQUtsRjYxSDh1RWNYbnllRXdRMUVISkl3eE5RU3Fnc05HL2tXdnl3?=
 =?utf-8?B?TUtsTnRkUjhzaDVEeW5meVkvL21TN29ZKzdUVkR2YnVHdkM4elFEWjc2UGRn?=
 =?utf-8?B?VHd5L3BhZmlPS0J3TzlZY1BCbTh4SzJibE9CVEtHNXBhV3VKdzVNNXB6RDA2?=
 =?utf-8?B?QVlWZGtkbW40MUNlME5Cclg5cFFKMzNNM1ZtWmtQSWRGMHI3MXR0ZE9qQjkx?=
 =?utf-8?B?Uk9LcGVCc21GT3pKMG5Nbmptbk5ZN1FNWm5abnhJQ25GejhxRVRWa2VSK3Jz?=
 =?utf-8?B?WkpnVGVoVWw0bjVRQmFkbkFoMjdHdjBUTGlpdHFHLytQblRWQ2FCZFRCZjlI?=
 =?utf-8?B?RmxnYUVqZUl1ZkdrTDBMOHVuVkpCTmQ4TnNqK0dhc3lMRi9wbzZMZk1mdWNF?=
 =?utf-8?B?VWhtYnpObjhSY0F2RGZMU3kzQmJLc290RzlMN0JmTUhYK0MvOFdIMjYzaWxy?=
 =?utf-8?B?MmlMVmZaSnRZRitKd3BUSWxLSFlYOWJ4ckZpekhGTW1vdDg2VFpLeGNYMm9s?=
 =?utf-8?B?YlZiNEF0Y21SUzRLUXlOZVJvVHFYOTNLbEFvVXBVTnN2ang4VHpTcUNkNG9B?=
 =?utf-8?B?YUdXNWplTzROM2grWlhTUnllRDNPbU5lZWJ0ZzlOZDRzZDdJVlpoWEp0RTRC?=
 =?utf-8?B?aTNoS3I0amxxbFFzTm93U1dnMUFYdHJwWXNBaVBaNzlFUm10Z1RTUXdWSHBW?=
 =?utf-8?Q?/Gq8xVHZ3Tpph1xvNEA9LTA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d3561e-6800-485b-fb86-08db8970eb97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 22:30:28.8562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPRvRlXtGCjSi8tq5wTiw45/BFxC99LJ8FfQPjy6hg1gvZInHMZ/7Klyr/2NJjadqxkzL8Z12U6xQ1aaaV1mZWcn36Cp9+W61PZcE3r0xrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 6:44 PM, Alan Previn wrote:
> After recent discussions with Mesa folks, it was requested
> that we optimize i915's GET_PARAM for the PXP_STATUS without
> changing the UAPI spec.
>
> Add these additional optimizations:
>     - If any PXP initializatoin flow failed, then ensure that
>       we catch it so that we can change the returned PXP_STATUS
>       from "2" (i.e. 'PXP is supported but not yet ready')
>       to "-ENODEV". This typically should not happen and if it
>       does, we have a platform configuration issue.
>     - If a PXP arbitration session creation event failed
>       due to incorrect firmware version or blocking SOC fusing
>       or blocking BIOS configuration (platform reasons that won't
>       change if we retry), then reflect that blockage by also
>       returning -ENODEV in the GET_PARAM:PXP_STATUS.
>     - GET_PARAM:PXP_STATUS should not wait at all if PXP is
>       supported but non-i915 dependencies (component-driver /
>       firmware) we are still pending to complete the init flows.
>       In this case, just return "2" immediately (i.e. 'PXP is
>       supported but not yet ready').
>
> Difference from prio revs:
>    v2: - Use a #define for the default readiness timeout (Vivaik).
>        - Improve comments around the failing of proxy-init.
>    v1: - Change the commit msg style to be imperative. (Jani)
>        - Rename timeout to timeout_ms. (Jani)
>        - Fix is_fw_err_platform_config to use higher order
>          param (pxp) first. (Jani)
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  | 10 +++++-
>   drivers/gpu/drm/i915/i915_getparam.c       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 40 ++++++++++++++++++----
>   drivers/gpu/drm/i915/pxp/intel_pxp.h       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  7 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  7 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  9 +++++
>   7 files changed, 61 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index 034b53a71541..21c2b7cce335 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -62,8 +62,16 @@ static void gsc_work(struct work_struct *work)
>   		}
>   
>   		ret = intel_gsc_proxy_request_handler(gsc);
> -		if (ret)
> +		if (ret) {
> +			if (actions & GSC_ACTION_FW_LOAD) {
> +				/*
> +				 * A failure right after firmware load means the proxy-init
> +				 * step has failed so mark GSC as not usable after this
> +				 */
> +				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);

Note that proxy init can also fail below if the init_done check returns 
false, so the status needs to be changed in both cases.

Daniele

> +			}
>   			goto out_put;
> +		}
>   
>   		/* mark the GSC FW init as done the first time we run this */
>   		if (actions & GSC_ACTION_FW_LOAD) {
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 890f2b382bee..5c3fec63cb4c 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -109,7 +109,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   			return value;
>   		break;
>   	case I915_PARAM_PXP_STATUS:
> -		value = intel_pxp_get_readiness_status(i915->pxp);
> +		value = intel_pxp_get_readiness_status(i915->pxp, 0);
>   		if (value < 0)
>   			return value;
>   		break;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index bb2e15329f34..e3b47525dc60 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -359,22 +359,46 @@ void intel_pxp_end(struct intel_pxp *pxp)
>   	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>   }
>   
> +static bool pxp_required_fw_failed(struct intel_pxp *pxp)
> +{
> +	if (__intel_uc_fw_status(&pxp->ctrl_gt->uc.huc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0) &&
> +	    __intel_uc_fw_status(&pxp->ctrl_gt->uc.gsc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool pxp_fw_dependencies_completed(struct intel_pxp *pxp)
> +{
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		return intel_pxp_gsccs_is_ready_for_sessions(pxp);
> +
> +	return pxp_component_bound(pxp);
> +}
> +
>   /*
>    * this helper is used by both intel_pxp_start and by
>    * the GET_PARAM IOCTL that user space calls. Thus, the
>    * return values here should match the UAPI spec.
>    */
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms)
>   {
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> -	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> -		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
> -			return 2;
> -	} else {
> -		if (wait_for(pxp_component_bound(pxp), 250))
> +	if (pxp_required_fw_failed(pxp))
> +		return -ENODEV;
> +
> +	if (pxp->platform_cfg_is_bad)
> +		return -ENODEV;
> +
> +	if (timeout_ms) {
> +		if (wait_for(pxp_fw_dependencies_completed(pxp), timeout_ms))
>   			return 2;
> +	} else if (!pxp_fw_dependencies_completed(pxp)) {
> +		return 2;
>   	}
>   	return 1;
>   }
> @@ -383,11 +407,13 @@ int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
>    * the arb session is restarted from the irq work when we receive the
>    * termination completion interrupt
>    */
> +#define PXP_READINESS_TIMEOUT 250
> +
>   int intel_pxp_start(struct intel_pxp *pxp)
>   {
>   	int ret = 0;
>   
> -	ret = intel_pxp_get_readiness_status(pxp);
> +	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
>   	if (ret < 0)
>   		return ret;
>   	else if (ret > 1)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 17254c3f1267..d9372f6f7797 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -26,7 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>   void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>   
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms);
>   int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
>   int intel_pxp_start(struct intel_pxp *pxp);
>   void intel_pxp_end(struct intel_pxp *pxp);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index c7df47364013..97ad58d6aff1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -17,12 +17,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -225,7 +226,7 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -268,7 +269,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 1ce07d7e8769..1de054126c6d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -20,12 +20,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -339,7 +340,7 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -387,7 +388,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 1a8765866b8b..7e11fa8034b2 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,15 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @platform_cfg_is_bad: used to track if any prior arb session creation resulted
> +	 * in a failure that was caused by a platform configuration issue, meaning that
> +	 * failure will not get resolved without a change to the platform (not kernel)
> +	 * such as BIOS configuration, firwmware update, etc. This bool gets reflected when
> +	 * GET_PARAM:I915_PARAM_PXP_STATUS is called.
> +	 */
> +	bool platform_cfg_is_bad;
> +
>   	/**
>   	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
>   	 * vs newer platforms where the KCR is inside the media-tile.
>
> base-commit: 6f8963ce33be65c67e53b16fa18325e12ab76861

