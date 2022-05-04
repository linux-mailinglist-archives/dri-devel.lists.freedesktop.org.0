Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03F519322
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 03:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B04310F4F8;
	Wed,  4 May 2022 01:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1636010F4F3;
 Wed,  4 May 2022 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651626426; x=1683162426;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NMGhKprIGpF6FcZ0MN6+/ZQXbylGAjUU+OGOzsJfCLE=;
 b=hyNCCRDyA+3nz05I9Kqh02EIt3Z0P5pXNT3vaaDc2rfQSF76RsQp8976
 sfdGHM4ZAwlMnuFB7zSg++tKzaVQfVcQzHPJaN3ZtbhRirhV3IHdtTDNm
 aIizxvSC0KQz/Rq5I+tSIegCylOg8rViQqcjDtff+1eET/N19fNYXfeEY
 94E5mEucPnP7Woq5iDVixZO9trBP/XDSnyhbiJghyjP8bZMKZPkqznnmP
 1QrGXCY6mB40qKzffZ8ckkRgVTfVnJILdoGzTJBUZxUgTWXGQd870nVbM
 xFXRLmuW09IY+Oy5sFuEKfE0kZqqkbLMsXaDTgkjdUbb8ixFlIx7PHdpB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330619197"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="330619197"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 18:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="889515044"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 03 May 2022 18:06:59 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 3 May 2022 18:06:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 3 May 2022 18:06:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 3 May 2022 18:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwZ1qXAAVC/INhhW+C7laFuCvzk8Ii9w9i6DBB1G1rqB5rbNWyrgqgaKZlpeLVfm6xegqgo2tfwJ6m4FSDCpnsIkdnC5DyFu7BOE7Pno0OIeW0IhnEULoGUCCsypo6fz+2oTDtAgNdq6Bw0oWl/ZADIqFSIOxnro/hBlbiKAlUEGFuSB7bBqUDnrZYeKw0bdhS/6bBe9BmRHmrFHjNB+YXhszOM5ZKErPu4OSNcNqwqUH1YTmnUP+jIH+jWg58zFVGg7bWSMlHqzTwCJO6ulNYUuI8fDSGmDFKnmt/o+BqDw9X2s6BZnrH5Ztd4vlPh+iOOlM5r13U+hHNbtUSizOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExOoFKgWOojMavMYKJsQa0olvJ1e3rFDWqXkGhpYUWQ=;
 b=jo4JARI+XFQsc+RekFhU62+YEo2VEdsFXF75FQ+Xgu3/n3AbZAMrtdO0z2I5eNAemrFxDhDn/Zq/XckM2VqFg6FkpwxEMfPZJQfh91QhpEaeVL915tBcKrzg3P1XkhXTtZLxkr+G8wBM/2Z1IH3Svo5kNl5EazYnMobLem+iFVtBOg5XOPjc95DcDXpUf0Usp2ge+BfVkIrf7TlmBIhz3fmOLHq9pDkq8PcNCi36aPRcweS10VF5x8f7Rt8V2oRVWk6uzCPQ+Hxb5yOMrvjEnrqW6lYRbqAdybHYhrySGZew0QTf+l63bGmpP9jYwH5pkRvZDhQuyfxZVN4WulBWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Wed, 4 May 2022 01:06:56 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf%2]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 01:06:56 +0000
Message-ID: <9cccaf77-4711-d42c-8c7a-2cae79637dca@intel.com>
Date: Tue, 3 May 2022 18:06:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/i915/guc: Support programming the EU priority in the
 GuC descriptor
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
To: <intel-gfx@lists.freedesktop.org>
References: <20220504004446.2000540-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220504004446.2000540-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6566ff5f-2d50-44e0-4526-08da2d6a6229
X-MS-TrafficTypeDiagnostic: CO1PR11MB4786:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO1PR11MB47861C62C44D84054E4B3211F4C39@CO1PR11MB4786.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1nv3tFuZg7kTAuONMfyd3+wefIaxMRsQcE/0giFs5yFO133qaPBBtnFoKiSDEok7liERHyZkdnJ+ojnlJltoX0ZnyvmN+3FWI/57t5EKMZRncZ4B7LrVFtiK1jcE88Eb6TSml2HwnFwSQ++YG6ELE1r9WRq0RVgiFDb+WmVEs4zs3JeuvNiL2camP0MzOyNLwYP7cm5QiHDzN4R2TWI3Q7btVD0AY9e1HF9w1lGQuMlwA5T+e9Ioys20Y6AJP14dVcIZ/PXL2BLOO+Io0kou2dKySnQdvQcE1f3OSg4ujLUMdNAjg2Xw++63dfYshafxZei/STvlNOQ1HndIs/MMVaAMYCjxcdEAGyGCwzsf151kavtQslLZP31GKYA6hwW9/Yfk3OYW+FqEPPbJprpwhc0ZnVngZAXNDnjO1JQ0L1HTf+c7o4hPkNZ2Vrh3qUf8ZEuhzuQa9gB7Cf6sJj23Z47hydgh1g4OT1Xcly/UGBq0zyE4y7jDgQB7stpiyiqWiOZmvrLQKVCMPEzYmlKV9yR8I4+o0rsFq4PEs8to2H5TkDHB8OppD657F1tmJyHUb3DDuBIyKgfoZoruiRCXXQ185hNxqJXNldicyombrKudAITQGIeHPnX+iRr4kcpxCZHTi7fI3lTixc2QYHxDm+ol4anktZL9PWsoX3NA2aSXR3MfHsFQg9JWd6BlUuAyNESEtOaws2Jb8ApzZQePrMIR8PzHCVOXsMi+9yIRKHUAQU5mQRORUlwWQVo32LZK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(31696002)(8936002)(450100002)(66556008)(83380400001)(5660300002)(8676002)(508600001)(86362001)(6486002)(26005)(53546011)(186003)(6512007)(107886003)(2616005)(6506007)(4326008)(6666004)(2906002)(38100700002)(66476007)(82960400001)(31686004)(316002)(36756003)(54906003)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNzSXBZd3QrSERxWE10SjNRdEszQk00dHRFTW1lSHI5NmtCZTdKUTVGUGxN?=
 =?utf-8?B?aE9SQklweUdSOW9HeksvTG5XYnU5eE1vNGJ1TkFuRGNQSmJ1cVRSMWtCZE9l?=
 =?utf-8?B?MFhJLzRLaW13NTgrczVDTjVZeWp0bGwrK25PeFhQQ1UxUEFEeWNHRHRRWTM2?=
 =?utf-8?B?SGVmeGlVTkpsU0RidzU3WlBXQU5DTTlsQTgvTDVuQkFLbWRPd0ZjaTNNNzRr?=
 =?utf-8?B?NVdYY1NtU25uOUlpVGVtUjJIOExNemREK1VvNHJiZGU4Q0ZBcXUraTRWd2dq?=
 =?utf-8?B?WjljRHlZRWVlUlpsTGVuZ28weEpMRC92MjU4SmU3dmZZVkRmRElHU3VZR3lx?=
 =?utf-8?B?Y0hxOG9xRXlIQWExeEFqWmtSOFp4STNQRi9LVVpYeHN3TE5qK2pPY0NpOG5u?=
 =?utf-8?B?MG5pbE9WYURUQXphd1JSQldSam1OOVBkeWwvMGV5ZjVGek1pVWxtNVB2NFl5?=
 =?utf-8?B?a2MwdkNueVZqSm8zMWF6UzVIZVZ3OThYZDZDWWZaL3gwQWYyOFJvbloxWjFZ?=
 =?utf-8?B?M1lzZmN5Y01VYUlUMm1HWnhXMkV5QmRVY2dqUVNmbS9TV0RYbjVUSWw2WVZ2?=
 =?utf-8?B?Nk9tSXpvWHZuUDNPRC9KQlk3dE9PSWZlSHNoazlyVE9VUFJUL0Q1ckloNUla?=
 =?utf-8?B?VXJhVTNaSStWQnhDRDkxVEJnd2g5SFdXY0tHTENYZE5aZjdXWUZhejdlL2Y2?=
 =?utf-8?B?UGNiUnpsay9XQ0JWV0VvN21sOGVtcitMSmtWWWVrUjhuaEdhN2F4ZGlEbXB0?=
 =?utf-8?B?bnZXUll3MCthczBmd0R2Vlp4d2FCNHg4TmM0SHh6YzJzaWkvbE9KM1Q2cFhi?=
 =?utf-8?B?NU9hSG1udXR6UzJIMGk0WFcyaEpkVGtmOEFIbEQ5aWM5ZDFaNG01Y1h0OGcv?=
 =?utf-8?B?c1I5QjBYQzUwTFJGenNJaks3NzBMZ0FKd0hGcjhrK08yTEFQTldKU1F1TXgw?=
 =?utf-8?B?TFRaVTFyVVR3ZGtoLzR2cGhrcHE1dVZrN0FEWkh2NlBTNXNYeXJNWWs0dUpG?=
 =?utf-8?B?T1JzbnllalA0Sm9HeFZPNndYUHBpem1uYzF3djI5YkNIM0dFQ0lNN3ZQMGcz?=
 =?utf-8?B?N3p3Zi9GVGFHMTVEYXQ1TlFTS2ZYVHhBYjJtSStSYTVhVUhiVzJmQ2RjMGRF?=
 =?utf-8?B?QUs2Y3pSVzg4RE5TSU1kS3QvdXZObWZST25RZ0Y2cjZmS3dFTU0zN2JYVmVX?=
 =?utf-8?B?aFdyWGNsUlJJN0JyZW5uQmFYU1VPSEVWQ0s3dEtiKzJZQ1ZJYkl0U2VLMWVL?=
 =?utf-8?B?T0E5RHFIQklpKzNZOFZENkZxWFVPRTBWdjBSd1dLdnFENEFDVlFJQ3dPQTBu?=
 =?utf-8?B?bElDTGNMWmxrWkJHdElNUmVaUllROSs2RTMzSlp1MmJWMlhFRjZrRmx1UkhJ?=
 =?utf-8?B?SDR1clJJTmg1N3ZPMUU4S2Eyd1BuNkdKTDA4M3JQa0QvVi85SFI1TGFTMGxt?=
 =?utf-8?B?anVRbi9Jang4aGZvZ2dmR1NIakd2d29uaHZUVWxEQ0RJcHp4Y1VDMlVMbml0?=
 =?utf-8?B?SGJ0TEJiUWFPMXNUZVRxMlhWVWYrQnZzYy8zNjN4bzJXT3V2M2M5YUV6NlJP?=
 =?utf-8?B?b0FQMDNJT0dnL2d0R3VJVVJJNnFXQjlFa1BBcGlpaEorTzhNT0RkTFgrN2NP?=
 =?utf-8?B?cWtKWXVqY0Y4U0MyVlJLdHd0VjhSUGs1cWlkK1ZxeDhWWDFqcEsvYW0yNXZk?=
 =?utf-8?B?SjV6czlZVzBEZ0JTTWVUOFFJOHJiV3RSRGR3akJMdFVsU0R6MzRwcmFoaHRq?=
 =?utf-8?B?TVhKaEtJdVl6V25NeHYvRUNpSndSMDRBenlsb0UwUjVsZDZSTjRXNjFBK2Jh?=
 =?utf-8?B?TWVHWTU3RCtSWGVjZVlMc00zTWtvU282UkVOcGVST2FPTFlmS1hjV3UxY1hv?=
 =?utf-8?B?YXlENExhYnVoVmZ5UEpBQTJvUFRiRzZZa3JoMFRHSWdWUXNSVnBpYWdnamNV?=
 =?utf-8?B?RmxTaGNqZWxCTjIwVnduaFJ4cngrVjdyVXBkVHo4eXZCTXluREtYOWthT05p?=
 =?utf-8?B?NWFDVTRoUHd4bnpKd0tPczk1cS9YYytBOUhXLzdLZjFNWW95M2pMekpOanlu?=
 =?utf-8?B?Y1B5N1pHUVZzaDQrb1NCelRCNHYveEhqc3MvZHhPMllWK1lId1NZZFFES3hZ?=
 =?utf-8?B?c3loYVVVVjAzZW9vT3orbjFVSzBRUzFPbFhDVmxtNkd5cXhVOGlPNDljSSsr?=
 =?utf-8?B?R0RnME96YVJyUUJKbC96cEVqbGNYZ3MwQzBsaHFMTTFVaWh3Ynl3MDlhK29Y?=
 =?utf-8?B?Wk1xTUJkZktVV2s3amNRUmNBRGIvMkhUM2tCcTUxTHlMQmxaMnRuREVZVGJk?=
 =?utf-8?B?SlpXd2VnTmRGa0dZT3VPZCtreXl2K1k2RWw2WlF1UzVhY0tybldCTmEvQ2pC?=
 =?utf-8?Q?p/BJhBxYvo9JXSyZ7WxY1Usl8B+F9vmr2VVtv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6566ff5f-2d50-44e0-4526-08da2d6a6229
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 01:06:56.4720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jdH+c20fiy907kefgOsxusT2xf4nbDrDTkYPS9FKgOpmvuUMYgFIqDLaAEAmD93F4TmxWfU5NmmW+/VH/rn0WeN93VnYq+PoltOng6DcPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
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
Cc: Matthew Brost <matthew.brost@intel.com>, Aravind
 Iddamsetty <aravind.iddamsetty@intel.com>, dri-devel@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2022 5:44 PM, Daniele Ceraolo Spurio wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> The EU priority register must be updated by the GuC rather than the
> driver as it is context specific and only the GuC knows which context
> is currently executing.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 75291e9846c50..8f3ed60ff07d9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2420,6 +2420,8 @@ static void prepare_context_registration_info(struct intel_context *ce,
>   	 */
>   	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>   	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
> +	if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
> +		info->hwlrca_lo |= lrc_desc_priority(ce->guc_state.prio);

Just realized that I forgot to squash in a change when I moved branch 
(guc_state.prio is the GuC-side value while lrc_desc_priority expects 
the i915 one). Ignore this, will fix up and re-send later.

Daniele

>   	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   
>   	/*

