Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8E6A9FE7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 20:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB2A10E54F;
	Fri,  3 Mar 2023 19:09:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5B10E54F;
 Fri,  3 Mar 2023 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677870556; x=1709406556;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KrgBatweJ25+DKLtGcolLtQHBmJ5gGyJj8pFtUuuLYI=;
 b=cIxwbC3Vq8Jq+7df4yQDwW56k7sflvTHSuKN7zIVmXvTlqAp+/lb9a6A
 XjcESSWjNLfJolqyhWnew3ml/seKbxqXkDBACKavYtVLltdmiWKjTKX1i
 hR9nG66ss9kRC7lSuAlh1V+pPnQYkpfuR6XChj5ghNS6kGgZhoW7zXokU
 YGnkh3IkAqly29+syvidfNxQWAE5eJLQ/ofnL2gX2e62S0AktoNBQ5JiC
 y7jQqulFV8/BAKL2FLq6cEVUZ8yWLQRzO7Gk8aVKN+ES4Zycx3LhNr+Zn
 c9UVh3rUGjuCIyjOeYVC1/0LDf7SJ5NtecKz5Rd+WzUCpcTeDmNRiPQCJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="362730051"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="362730051"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 11:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="625450214"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="625450214"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 03 Mar 2023 11:09:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 11:09:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 11:09:09 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 11:09:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCbhxX9uUkbfqU5xNK5P/KgJsVUq5yGo17UGZS5+JZTQK0GFcDkZwLkdaxakhk4YCgCC7SzzV46QikZCcO7rXhiahfevilUhX4t8MmrvynHgOaT085upnsd86rZ2+3k20qgN9XzIrspCwK1ncth/5mxZ392XblmBhi2YqIl4cYENfdlyz0tpitVssx9IIZW46g9HQ3GE0SKGt8sqsRj1LcI3sAhyO0hFdfgXBFQ+F/LVnNeFNI30+1FuVxMU06M3E/7MUyrBkUkej3zIXjtScqgNjPZVPZlQi61aHQO40Xeh8Oh7fnLA6RU6wKW4bG3TNFvTAIJ2uYyaP83YPzU+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydFBwjYOcQniXcQS13/5MQVH2Px4sZdn3oPDsCidqn4=;
 b=WxETfUIItTPfCDwiVRJViOsPDgsyyIn1H/5SVTNjwTwdTjQLItxLeCAMMmMC6PVjoJwWCsO2DKNgIS26Z3HXTjIz1ytNQLDlfPW20YsLfOy0k5FgGEbEnN+39YKfRjWwrx7h3JN7lCP2NjUd7svfZEwKI2gEIROWnI34S3aPg18JIovo8JB6pUPZdjL5c2z3FJoSo+e7LiZ9qiMAjmydwwPSNJL6sGLX9xww6vG//RsO8l4guP8Cv2vtorPihtQyuCnn9naFuB7kupbIooW7dIfxMT7pBM7SoeUW77g1ERiESGRNRdwO6fsTTo0UT/YpjbBXexN85N6WYWMP4uECjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 19:09:07 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 19:09:07 +0000
Message-ID: <09269ecc-df3b-76c7-7e6f-be53f30a2460@intel.com>
Date: Fri, 3 Mar 2023 11:09:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/guc: Improve GuC load error
 reporting
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
 <20230217234715.3609670-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230217234715.3609670-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0d3365-0ef8-45b1-b567-08db1c1ac331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bG+7wuGDLf2066MkYVRwOM865h8Wx6RhV80I6GmtqXqL9g54lStoS1e28kyYjtrRnxSE2Co7460ZzviG4T6osLE6eIMfm9CDBonXvLqVIb4+UyyHTFNQvjHGDB6OUVSWUV75PVz41wsRCdm5KkrF+QnI5Sc2p2zykt4SE9QBv9vNaE12R91xTGu8l9tHIOXmdhyvldMeKQ6yAssrKHGQionI3uABJEB/++ASg6mq8kntzGHBgGtW0mQGDEqSo5hTSVd70uHyxCKwEu/owGE3D3wV/KuMHKx4pbdhdo3suSTqz6jgLkBBtsdDkua5iZXsTEGp1AGQ0Ghfa838WSgvhN3MXh6KlVMi3dEks3mTRcel1B5JKcVRazNyFcpYFWcKZMONfToGll+hd/n0KggJcolHa9PP+QUlvf4EJQIqPiD4lxTyP+1aFOyHjzrK9PCnvYJqTO5uXNJsjuuwahpOOz12YHWMqSk8EUL02VQbaCQXuLyRjYGhz7J2uMAwEa6Oip7MXme1ZXj23+BAEXPYfK97SxxZl36SROkcOAMfvhQHjcTYebeKFKPUrhZW/QWXvkQmbxroWERbB1Zs4qdxGBJWQ6mi/CRBZSB1VpeXTzbZlqhqzDXUXlKtO8o4pddu6+rCr7HOw0pV47REZm+7vEo5l3EpndWLcoafMyikSByrcykM+TgqlQdpUvJyt0qCmuE4ZbnlJ8TaEC+BBlGyvLTrVmsJl/Yx1VDuq65BcEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(36756003)(31696002)(6506007)(6512007)(6486002)(26005)(2616005)(41300700001)(186003)(316002)(4326008)(450100002)(66556008)(66946007)(66476007)(8676002)(2906002)(5660300002)(82960400001)(478600001)(86362001)(53546011)(38100700002)(83380400001)(31686004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFB1NytkakZGSlVhbkE4S2lLc2xpdkdNY1BRK1FoT1RMUVhGSEluQ3hYQVJm?=
 =?utf-8?B?aGZCeXJ6UG43UHdvTk1rd2RjR09uclc2VzQvR0NQdjd2V0xRS2dCYXdxVUI5?=
 =?utf-8?B?S0kzL2FBaHhpY0libkpBdDBNbk1qMDkwUkNucXdEdUJMWCtpSzNpYThibXIw?=
 =?utf-8?B?TWkwQUpJakluZWZFbENDVXluN0QrcXNTcFIrMlZoUFl2SHZqelJzUTRndDRQ?=
 =?utf-8?B?TVE5S3BMTXlhOE9zc1dMaFgrNi81U3lXb3RFUnI0T21yKzlaaXRodGdQdVI5?=
 =?utf-8?B?cmRUNkJ5RHB4NkFjcEZ3VFhzeGRQZlBOTWhoNTlwMWlqb1FRMWxlTnAxYUI1?=
 =?utf-8?B?UnZ0dG9qcWlGeFdCVDg5c1BOYStXOERVMk5XNDI5TmN6UE9qUEh0U2wwNmFB?=
 =?utf-8?B?b0hFdUpDbmF6YzlqZFY3RkJPRTYwZXdUMFh5NG94T3lFT1NPZFVITXJHZnV0?=
 =?utf-8?B?ZEd4RjQvbkpWUzJJTDZkM1VZM0p4Qi9XZFNCWmZlRVhWdkxWQ3RGekFRUG95?=
 =?utf-8?B?OFYvNDJ0cGx2SmV6ZCtBck84QWlXOFQ3bFlPa0VocXgyYzJTMURqdHFBNzRj?=
 =?utf-8?B?c09qK1VvbzhhbDE2S1h3V0ZkeXZCd1dSc1MrcFpRcDVUaFBiM0JFWkEzcHkw?=
 =?utf-8?B?ekUydlFrTW9LY0diYTByNGFZOWNrbkQwMk1TZW1TY2hLZTVuc0FoL0ZCWUF4?=
 =?utf-8?B?K1NETTd4MEh6eEdTODNtdkpqNERHTzRNTU9qZU9UbFpZZHFpTUd6Mkc0aGlx?=
 =?utf-8?B?VWlKblViQXdTOENpRFBSMUVIYU1OMEwya0dqSys4K0h3emxkT2krSnVIUjVE?=
 =?utf-8?B?Vng4Z2dWYkFReUc0TFhPV01sRENoOEFUUHNmSVZGZ0dUcis5amxyNlRaVk1w?=
 =?utf-8?B?TWsrd000T1ZQQmNzMnY0TFQwcC8wakVJQ3IxbmN0dExZYTByRi9Fd2ZrMWJh?=
 =?utf-8?B?Qk54c2hRUm5qaWJaQ0x0Q050TnlGZjVSMUwzaG55YlJNRW85a1lVV2dZUFNt?=
 =?utf-8?B?MWNYd1pRbkVCekw1NGdxVWVKUWFpVlN1R3Q3ZXJhNzA0ZTVUaXpaLytKaG1n?=
 =?utf-8?B?TGYxZ3ZsTkJWNUVCYmVleml4d1lFQzNPWFVtdDlFdFNPREdsaE5OaGpKc3pw?=
 =?utf-8?B?MWhuK1VMcUJoN0FibXBHb0FxTCtDaUZWYjA0N0psb2NZblBKaTR5SlFYS0xL?=
 =?utf-8?B?eGpQVzRBd01MeXZOMklyblgzU25yWGpESmNBVjMzOXh5THdoc1UvdnkxZitk?=
 =?utf-8?B?TjM2aXVIdk5vcEVKOHVQRUczOEF1L3VTV0xPWjAzOE91MExpdkkrbVVmS2h0?=
 =?utf-8?B?azlFS0h4YXdkbXFJdldXc1c2cEdHQ3V2dnBPbm44Y25tOGdYUk40RWdndjc1?=
 =?utf-8?B?TEpFWW9FdG9mL25WanlkcHFBV1VMK29rbHVNUTFBVWErU2tWcndwQzlFZGk1?=
 =?utf-8?B?b2lJcHdZMGZYdEdOa09ZZG9tSG9qYURuL1Z0bDdOd2plV3RScEJNTlRDY29O?=
 =?utf-8?B?YVhzYjBTVkFlVUV6MGNEYVo2djljbkhMU2VuVjBWL2R4ZXpVT2xIc01NL1hi?=
 =?utf-8?B?R0R4TEp3R0hKYjNUMU83MUNtUkl0MGJiT1BhNGpPSnUyV2xHamtVY2l2c3NZ?=
 =?utf-8?B?WlEwdGVDSjE2QmRsYmdzby9NRk03YWRIN2FucGM5MUxhOUhhd0J4MFlYdDdk?=
 =?utf-8?B?RkswRnhTWU1BdDJRUEtYZVZweExtWFhXNXdkdGI1L3A4L09qeG0rNWt1Q0VG?=
 =?utf-8?B?TTdZcW02L0tzMzJhZkQrdWJBUlUraklBVmJTY2xSdFFGOXlFVS91VC9ycDdZ?=
 =?utf-8?B?QWwrWE0reGdPTnB6cHVETDU0YjdvSXIyUmRRTkRQNjlBMnloVXM5TGJiVWcv?=
 =?utf-8?B?Mit1bmFsTEJvRFFSRkpOSHdMbVY5anFWdmNEc3VRWmVvMm1Vb0V5WDBzSEo3?=
 =?utf-8?B?VFhzZFMyTk14Zmh3ZG8zZTVzcWNQMCt1Y2RPLzYwem9DSm9kZ3BOcVUxTDFP?=
 =?utf-8?B?NFh3SjhBR1p5aThQbFhia1RmNTVLa3EzNTBwaW85Z0kxL29jdUVDaHN2SGhk?=
 =?utf-8?B?cVFnTGo4S2Y1dUxxMGdBdVVFdUlqRnFvbGdpS0d0QWZ5QXdRUkRKNGwzN2Fh?=
 =?utf-8?B?YkVKRk9tSEgzTE8vck5CdVJUVm1yb0xhTi9FQStxVHVPSVpmN1FrdFZCV2JZ?=
 =?utf-8?Q?prbYWxmc68AWF+5DSaqiPBI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0d3365-0ef8-45b1-b567-08db1c1ac331
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 19:09:07.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wysbS6pYgdEpnUF0up68GbrhdDO5FRskav7NUjc+p4Ot+NJd+sI9dM3nFzxb45TH+fdMQxwuMP6iqUxKSDMIuVJczDe3dFlxk132iLYNcQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
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



On 2/17/2023 3:47 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There are multiple ways in which the GuC load can fail. The driver was
> reporting the status register as is, but not everyone can read the
> matrix unfiltered. So add decoding of the common error cases.
>
> Also, remove the comment about interrupt based load completion
> checking being not recommended. The interrupt was removed from the GuC
> firmware some time ago so it is no longer an option anyway. While at
> it, also abort the timeout if a known error code is reported. No need
> to keep waiting if the GuC has already given up the load.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   | 17 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 95 +++++++++++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |  4 +-
>   3 files changed, 95 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index 8085fb1812748..750fe0c6d8529 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -21,6 +21,9 @@ enum intel_guc_load_status {
>   	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>   	INTEL_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>   	INTEL_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
> +	INTEL_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
> +	INTEL_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
> +	INTEL_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>   	INTEL_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>   	INTEL_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>   	INTEL_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
> @@ -38,4 +41,18 @@ enum intel_guc_load_status {
>   	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
>   };
>   
> +enum intel_bootrom_load_status {
> +	INTEL_BOOTROM_STATUS_NO_KEY_FOUND                 = 0x13,
> +	INTEL_BOOTROM_STATUS_AES_PROD_KEY_FOUND           = 0x1A,
> +	INTEL_BOOTROM_STATUS_RSA_FAILED                   = 0x50,
> +	INTEL_BOOTROM_STATUS_PAVPC_FAILED                 = 0x73,
> +	INTEL_BOOTROM_STATUS_WOPCM_FAILED                 = 0x74,
> +	INTEL_BOOTROM_STATUS_LOADLOC_FAILED               = 0x75,
> +	INTEL_BOOTROM_STATUS_JUMP_PASSED                  = 0x76,
> +	INTEL_BOOTROM_STATUS_JUMP_FAILED                  = 0x77,
> +	INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED          = 0x79,
> +	INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT             = 0x7a,

nit: you've used uppercase for the other hex characters, while only this 
one has a lowercase "a"

> +	INTEL_BOOTROM_STATUS_EXCEPTION                    = 0x7E,
> +};

I've double checked the defines against the specs and they all match.

> +
>   #endif /* _ABI_GUC_ERRORS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 69133420c78b2..2f5942606913d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -88,31 +88,64 @@ static int guc_xfer_rsa(struct intel_uc_fw *guc_fw,
>   /*
>    * Read the GuC status register (GUC_STATUS) and store it in the
>    * specified location; then return a boolean indicating whether
> - * the value matches either of two values representing completion
> - * of the GuC boot process.
> + * the value matches either completion or a known failure code.
>    *
>    * This is used for polling the GuC status in a wait_for()
>    * loop below.
>    */
> -static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
> +static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool *success)
>   {
>   	u32 val = intel_uncore_read(uncore, GUC_STATUS);
>   	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
> +	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>   
>   	*status = val;
> -	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
> +	*success = true;

It feels a bit weird to default this to true. If we don't return true 
from one of the switches below, we can end up returning false from the 
wait but leaving success to true. I understand that this is used more as 
a "not failed" flag rather than a success one, so it is functionally 
correct, but maybe rename it? not a blocker.

Apart from the nits, the patch LGTM:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	switch (uk_val) {
> +	case INTEL_GUC_LOAD_STATUS_READY:
> +		return true;
> +
> +	case INTEL_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
> +	case INTEL_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
> +	case INTEL_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
> +	case INTEL_GUC_LOAD_STATUS_HWCONFIG_ERROR:
> +	case INTEL_GUC_LOAD_STATUS_DPC_ERROR:
> +	case INTEL_GUC_LOAD_STATUS_EXCEPTION:
> +	case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> +	case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
> +	case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +		*success = false;
> +		return true;
> +	}
> +
> +	switch (br_val) {
> +	case INTEL_BOOTROM_STATUS_NO_KEY_FOUND:
> +	case INTEL_BOOTROM_STATUS_RSA_FAILED:
> +	case INTEL_BOOTROM_STATUS_PAVPC_FAILED:
> +	case INTEL_BOOTROM_STATUS_WOPCM_FAILED:
> +	case INTEL_BOOTROM_STATUS_LOADLOC_FAILED:
> +	case INTEL_BOOTROM_STATUS_JUMP_FAILED:
> +	case INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
> +	case INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT:
> +	case INTEL_BOOTROM_STATUS_EXCEPTION:
> +		*success = false;
> +		return true;
> +	}
> +
> +	return false;
>   }
>   
>   static int guc_wait_ucode(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_uncore *uncore = gt->uncore;
> +	bool success;
>   	u32 status;
>   	int ret;
>   
>   	/*
>   	 * Wait for the GuC to start up.
> -	 * NB: Docs recommend not using the interrupt for completion.
> +	 *
>   	 * Measurements indicate this should take no more than 20ms
>   	 * (assuming the GT clock is at maximum frequency). So, a
>   	 * timeout here indicates that the GuC has failed and is unusable.
> @@ -127,28 +160,52 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   	 * 200ms. Even at slowest clock, this should be sufficient. And
>   	 * in the working case, a larger timeout makes no difference.
>   	 */
> -	ret = wait_for(guc_ready(uncore, &status), 200);
> -	if (ret) {
> -		guc_info(guc, "load failed: status = 0x%08X\n", status);
> -		guc_info(guc, "load failed: status: Reset = %d, "
> -			"BootROM = 0x%02X, UKernel = 0x%02X, "
> -			"MIA = 0x%02X, Auth = 0x%02X\n",
> -			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			REG_FIELD_GET(GS_MIA_MASK, status),
> -			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> +	ret = wait_for(guc_load_done(uncore, &status, &success), 200);
> +	if (ret || !success) {
> +		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
> +		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
> +
> +		guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", status, ret);
> +		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			 bootrom, ukernel,
> +			 REG_FIELD_GET(GS_MIA_MASK, status),
> +			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		switch (bootrom) {
> +		case INTEL_BOOTROM_STATUS_NO_KEY_FOUND:
> +			guc_info(guc, "invalid key requested, header = 0x%08X\n",
> +				 intel_uncore_read(uncore, GUC_HEADER_INFO));
> +			ret = -ENOEXEC;
> +			break;
> +
> +		case INTEL_BOOTROM_STATUS_RSA_FAILED:
>   			guc_info(guc, "firmware signature verification failed\n");
>   			ret = -ENOEXEC;
> +			break;
>   		}
>   
> -		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
> +		switch (ukernel) {
> +		case INTEL_GUC_LOAD_STATUS_EXCEPTION:
>   			guc_info(guc, "firmware exception. EIP: %#x\n",
>   				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
>   			ret = -ENXIO;
> +			break;
> +
> +		case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +			guc_info(guc, "illegal register in save/restore workaround list\n");
> +			ret = -EPERM;
> +			break;
> +
> +		case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
> +			guc_info(guc, "still extracting hwconfig table.\n");
> +			ret = -ETIMEDOUT;
> +			break;
>   		}
> +
> +		/* Uncommon/unexpected error, see earlier status code print for details */
> +		if (ret == 0)
> +			ret = -ENXIO;
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index 9915de32e894e..3fd7988375020 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -18,8 +18,6 @@
>   #define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
>   #define   GS_BOOTROM_SHIFT		1
>   #define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
> -#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
> -#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
>   #define   GS_UKERNEL_SHIFT		8
>   #define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
>   #define   GS_MIA_SHIFT			16
> @@ -32,6 +30,8 @@
>   #define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
>   #define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
>   
> +#define GUC_HEADER_INFO			_MMIO(0xc014)
> +
>   #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
>   #define SOFT_SCRATCH_COUNT		16
>   

