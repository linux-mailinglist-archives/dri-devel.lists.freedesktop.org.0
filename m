Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57837728716
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 20:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEB710E627;
	Thu,  8 Jun 2023 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA11510E604;
 Thu,  8 Jun 2023 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686248414; x=1717784414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uGVzU4N/+NR6HnGm0qG85xC+VgP4JXNhtpy3ptOMgWc=;
 b=iB8KRTCbiJe6+G+sPi2RsbdA1qOkRfPzdYXQ/ZQo6CNgUiXVe/TSXaHM
 HSubXNIx6kYgSAKFn8TbGgJsqlZrgAT7by6Jm3Ven/MJY4zHswhf1xUgK
 TMAD9XiBXy8EyH/pD5kDWKCX/FChOs14tKrPaG9Q1RVuerCRFEt/bCJ37
 NzbAywUWxEEWGGdrqzjoa4tkSqk9JNSbNwF1BZSzwhHWRYO7aJha08uUM
 /WPo8ADKsP28Eu2nkbZLRP/YEftxGgUWRzdVszLpo+J95ZGb9HBQGqFAa
 EdgHyNVAoa4XvtRb8ClzKztotat3KRUreseTHT7XUz7UX6dSr5987ll2i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="423269993"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="423269993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="834301870"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="834301870"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 08 Jun 2023 11:19:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 11:19:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 11:19:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 11:19:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 11:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7kLdZnACox6w8EMrykpOCYK/Ew07PiTsxBd0sqnG5T1hUTMeAD83AgmEftq/LiPMAsvkxvz/1SUxeXgwVDTHlPhK0QsWzEbcO4stw4hAp463imuAU3DwOFhLzlmzApfUtIN+jT2vzFM2nLFf0ItMIexzdoVXV/HsqCNYCkVJyKU/kqi7iJceE6oHnpdktN/a7/u51SBHg16egfcI7v/5LLiLai5tjRN4jVqTVqnQRcDD4YHp0k/XvibjSeUDz7qf9l0CGuchigwe5mhYBiQuuV3AvnDfEbhzX6js8kQTmUpj/TinFuo9uMnfnMRDDV6mMsQS2Os7jzoZk4H+opg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MewsNWVs+EAisHTbWOd5iUUTTw0651tn5vUeya01voA=;
 b=lAwmfb8U4vjIZv+dAtSGSk3Bh6dtnnN81tqNgcf4+zoDK0sn+mL1zlBE9Id0r8lYv3nGSCo/3D5ZmrsBTD6n+wKiGKBvB4dTlYmBqaJrr2sO6V4YZqGUoiz6q9esGNo3rRPE5B3mEbYBIU2XSRV2qoF7KBs0Z41z2x9BplaU7vqctQ+GkZQSygTaaBOeTYEmAqLmaakq83xisBh2xoSxSTz62fy+Fp2pgzhs5flYEk+WKW4gHsIrJHtafmy6fj8/bmt/Qm9kaAQNAT1/VoHxlVE7HLoNwtbzmH2pZaWkLpVH+UWNCW6lkrZEqc5JWtGXiGT8nXUxOfsgFddnAuNfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 18:19:52 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 18:19:49 +0000
Message-ID: <0c7cb50b-413d-c63a-985d-79e5b19bf016@intel.com>
Date: Thu, 8 Jun 2023 11:19:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/i915/gsc: take a wakeref for the
 proxy-init-completion check
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230608180405.3059026-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230608180405.3059026-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a71902-3855-40a7-5922-08db684cf24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ti77ioeMozFP9fyUVVz5Ncs2azSsRtf4+RVpa1nm42XH8EFdI5KqA03/DY/eVZhg9ui/Whsu3H6oMrvlXqNmJ6JR7P5G1qebkqwDTp3KPtAgHSZViCyXGegce9eyZQFh9Vfcsi0ko9Pyjj9UV8F4oUykPmdBaCZvePQlM5Dx5d6qN0KtnsvUBHAi00q1qumrZ050hWF6kBWc/xjY62bxB1xV8/DLAKUVe6fWeLXnVBP+qn5Xy8lRb00AEBkk3VgPBqFDBLZmVEDgkjIEUZ17I+N+USM1TsJKx17rp4jvEe7+9UBvI2kjBq7/qjAMZT71ifCLEAflYM1p2jMXWtDSP96tO2TLL7E8LL5z1MbpN8ippVw7zG5vpChGvEZvPyv+2MPH0bqJ2qZtQ4rQBcVyM7P3pszM/TieLOcwkzByhDxaLkSNqRclwo/F8BTpw14qX7AVTvOpW72apnqMziu7vzYeFmAIXPD3o40xL7VGCIDiXLjXC2PnlBESDSB402S3BAYdmHMZoAIETIMv4MoXdnPEK+7fRHWQRUVRmPi7rRd8uTY2Lwbu0pmjA64Ol7nDr+U5/du27voviBKcE/T0CRYb2kuZR1cnvBdwmoHB+xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(6506007)(53546011)(6512007)(82960400001)(36756003)(83380400001)(31696002)(86362001)(38100700002)(26005)(186003)(2616005)(41300700001)(478600001)(66476007)(450100002)(66946007)(8676002)(8936002)(4326008)(2906002)(66556008)(316002)(31686004)(5660300002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnNQdkxBdEMxS09zd3hIcjBPMm9xdEtvNWNpU25ZcHVDdzZzV0c1eFY3YzJh?=
 =?utf-8?B?UXRxbDJjdWpWaEpLVXBNcmY2SUhyNWVkd2VQblFpZXdkWXpBMVkwZXZzMkdN?=
 =?utf-8?B?cE8rUUhEbndwNXMweVMwVWlBZm9TSS81RElXR2oveXJieEU1TlNFc1RRMVBw?=
 =?utf-8?B?dW9YdVdQSUpuU3JmeWQza2dITUhQNExJd1lvazdMVUFoT0pHRGRMeWFIbFEw?=
 =?utf-8?B?aytTQTZUL2RyeXRVQkpxZ3BNQ2h0ZUUzZmcvTTJPN3dLREQ4YWxwaTd2ZUlV?=
 =?utf-8?B?V3dhOXF5WXZ2cEpIbGYwQXk5L05DcjdPSjVjaEZ1RGVTMlJRUEc5eVBZMisx?=
 =?utf-8?B?K2p3dWpneDRwZW56elU2TnhXcjNpR3FrbndsNlhob2hZakhiOE8yT3dGTG5J?=
 =?utf-8?B?MTZnTjIyVE5lbXE1REg3U2NWYi9qZXdGVXVRZ29laWl5RmEvN2Z4T2ptRlJh?=
 =?utf-8?B?cnFqQ1pJUUNNenFVbzYxck56dGZ2MVhhZjBQVHJmcW5HZk9CTzg5aFFNNC9K?=
 =?utf-8?B?V1RKeGV0S0Fpd1hmRXNmWEhHRjdlWnBYL0FpRXpPWkJaZ2xqZTdhN1ZSQVY1?=
 =?utf-8?B?cGdjVDgvRDBZbnpYdWwrTGx1RC8rOGJOMXpta1RFR3ZNd3BMaHFVK2NjT2JQ?=
 =?utf-8?B?c1JEQUxwaVJvZW54ajVsYXd3NnVBNzBPcVV1N0gweEsxcHZOR0FUejNaWkFj?=
 =?utf-8?B?V2RkTGR3cUQ5MjFRb3A0ZVNyZlRjS3JJNytlc1MrTlRramdCRzkvdUFZcFJT?=
 =?utf-8?B?Q20xeVlvODJlbWFSTUpCTXRlY0NRMzFUM1MvUFBVdnBzSkRaV25XdUo4RDZq?=
 =?utf-8?B?TzNKQ1ZoYjVDaFFOMEdaNk5yMXZWR21hQmdXR1pVa1hGcHF3Q0orWGRIV0M3?=
 =?utf-8?B?RzgwY2tXTHJ4azZtUVRRaE5IZ2NBTWlCamRjVER5d21ISmtNeXFiYXFRbUtP?=
 =?utf-8?B?a01jNWxzUVJqa3hYQVg5Z0l5N0VCQmhvRUZlUXFsK1F2RnFiZXlBakxGY1dK?=
 =?utf-8?B?NUxGRlZtODlvbHorUXd4ODJhSnZwNVpCdmkyYXVPbU1IZ2EzNW1kMW1CQzYx?=
 =?utf-8?B?Ny9GZ1l6V0R4ZW4ybTZoUTN6TkdxQ0VUdEkyKzJ1WERDRDFYL1ZqdERhTFlM?=
 =?utf-8?B?TGlCclBkR2krWG1pQmdNWnhvcHl4a1Q3Njl5SEk2S2dtUWdCcWtXbWMzMENT?=
 =?utf-8?B?eDdEMG9CbmVoSzFPaHJ2OURHNkFBM0NNR05GbGFpL3A3aEpNMFFMQS9DUHVH?=
 =?utf-8?B?VFE5ZmwyQm1EOUlHVFRHN1Bpbkpyeng2N2xEdHkrTG9TZHdjVStUazA1b28r?=
 =?utf-8?B?NTZaMm50MWp0S29EREdNZjIwR2lQSTIwSVdITU80UUJTRTdKay9RVVpNdFdU?=
 =?utf-8?B?dXZwaWpUbkFYMWFvZU9rUmRpUDZZUFpQNkt1cUdHeEpGbFNvZnV3R0V6VVIv?=
 =?utf-8?B?SXN3Q1lERW4rNTZJSGsxYjBuOUZ3ck5jOHRYZWcyM1RKdEZna3pzclQ1TnZX?=
 =?utf-8?B?Q1ZhOVBlR0VNMUd5OWg3ajFUS1JyOUVCSDN3M2RvNWkyVml6MXFOTzVaZnY3?=
 =?utf-8?B?a0huNjk4N0JzbnZyV0xZNlk4eUhGc2plSnZzRm5xSEFFSnBiVnFtMnlBR0Zy?=
 =?utf-8?B?dTdmNWxLTWlndk91a3J1eXhJOGZTQWZUTkp6VVJLeUdYbkMzbWo0Z21xWGty?=
 =?utf-8?B?Vk1OWVFwa2VwaE1waENPeU4rZjJQcngvT2YzTGRtNC94cmV4c2wrZVVyUERh?=
 =?utf-8?B?NkZDUEZYOUx2Tm4wc1EyeGhLYVNYZnMwMmJ0K3Z1d3VDQjBjL1hqMVNuOU5h?=
 =?utf-8?B?QmZXcHJMdDE0Rm9IcDhDMEErNjZMNElZVXR3UFdKVkh3OXNHM3A5eWNDK1Bo?=
 =?utf-8?B?NzNoTlpDS3A3ZlVuTDBJVCtIL3VjQ1dOTGdwYzc3VHE1azNNWnVBa0IzSnJ6?=
 =?utf-8?B?ZHJqTWJ6MEFWMmgrMjRDckpUU1pJejVucFBlODFTdUFSdGJGc1ZJZVR6Z2Qr?=
 =?utf-8?B?QlVKbTZ2RGlFWXZ0M0ZoVlZOd3VOaWVJSGROQ0JQZFlTNzlRWTZJdjdOVEkx?=
 =?utf-8?B?b3VjclFzeWUvRFZLbEE4REd0R3hEdEhwWnZMS1EzNzlKRFJUeVdiMElidDYr?=
 =?utf-8?B?MHFGQlBxenoyMzRiWkt4dWJqY1VidjVBTThRa1JYQ3FNSWxKaS9JZDA0NUd2?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a71902-3855-40a7-5922-08db684cf24f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 18:19:49.6532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++dktA3UJD16no7XAHac9wzR0yMi5s9V2QmplfJQaJTx868e6pW7cL//2Ne4BrYAS4cuyLhyNtVj61cZqQsO4I4QGOpXZj1HPEznaY9v628=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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



On 6/8/2023 11:04 AM, Alan Previn wrote:
> Ensure intel_gsc_uc_fw_init_done and intel_gsc_uc_fw_proxy_init
> takes a wakeref before reading GSC Shim registers.
>
> NOTE: another patch in review also adds a call from selftest to
> this same function. (https://patchwork.freedesktop.org/series/117713/)
> which is why i am adding the wakeref inside the callee, not the
> caller.
>
> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index f46eb17a7a98..1e5a8b2bdac9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -27,7 +27,11 @@ static bool gsc_is_in_reset(struct intel_uncore *uncore)
>   bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
>   {
>   	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
> -	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +	intel_wakeref_t wakeref;
> +	u32 fw_status;
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);

I think this could be moved to an helper (gsc_uc_get_fw_status?), so we 
don't have to re-do the wakeref in all the callers.

Daniele

>   
>   	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
>   	       GSC_FW_PROXY_STATE_NORMAL;
> @@ -36,7 +40,11 @@ bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   {
>   	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
> -	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
> +	intel_wakeref_t wakeref;
> +	u32 fw_status;
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
>   
>   	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
>   }
>
> base-commit: 27187d09511e1d47dbaaf91c7332319551a8edab

