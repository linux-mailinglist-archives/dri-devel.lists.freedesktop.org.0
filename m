Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAF96E6FDC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84210E2AE;
	Tue, 18 Apr 2023 23:14:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FFE10E2AE;
 Tue, 18 Apr 2023 23:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681859658; x=1713395658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l8qoYvDwwkS8W8mQf8p6BWG8L0lNNNOt1RvBYFFayjQ=;
 b=TCVCmxRJRzHwEhwkw5CgK9hURxUSSscJUTWdNdspPP9UJ1spX9bOL0Ly
 Cv0H2tWw97oF+p09pwzjjtY8RPNsikgwPi/DZf1Q/3IAXdzU8OiJEc7BE
 +aOq+eV1tjW/98oyOWdQav0svQtPcEs+VmR+suxUfM170qIuNXpLTy6V+
 C2GixK5VDXOowV+gSnmw7Y2hoEUt1PxRzhZBqd5KV/RDbAG8Cs7PbGFd+
 34wGptwr4iycualTeo+pD/bnlxOgF5NqesHB/AsfXllWvIJXaEtK2i1Qd
 31WS9GTqVvu+rrd5MddTbaQkyffmZyHrW2ihj80S3GfDQI8vVkjimeIEy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324924521"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="324924521"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 16:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="668731855"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="668731855"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 16:14:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:14:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:14:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 16:14:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 16:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO9PtpOK7Iv5KjyMko8UnUBHOysbM+qoHvnrvDPoT067tjP4jrnVdjdg4bMNLnRF2N+tJ77U92KItD6DXlbkO3e8bC46wrFI5x5WOLr9O94t6F6MQj+u4l7rW1OFs9CjRr9kvUq4As8/773oHNEXQeBm+BrYhC5xr6lVAzmj2cYREPYouQUzBkjs9Wh6asu6VU14wOhRkKmOZfc/PYwbl8VC8rJBdYEU18mGiCc/VwckItd7xXANa1KUZvMTAJPEK8s5ilPI0ib+mZxOXgNwgJ7D/VRx6eZaPEPCTvbCEWIW8P+dmLHaiN9XquagOKtRxUSHi1Tgj/dcIdMWUMNLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkAFHHIKIHbq/Q8Q4VRXJrjmR4FohehFP0pb/7KbwqA=;
 b=XO8mdYZKIjZw/EuJpLkDj1usHXDCdQzYcTRDS2AX8O16oRyEB7MSAO3rl3fMJl5W/nmmvbPp2nNIVOUIXnr1GNimSmHKg5HdoqUNOP30yR+mqGGiT9ieXgZ096lgEg7CGDqRtwcLiXHh2oJHhxC4/de4GqJ/DpETfYdTKKxrts/B/iTvvjUYYgxY3ktD8U2sXwPbO6d6lGgkpFXhrYVtz9x8J1fJqHqLI7stLwylhHLWmCR7zHXpnNjVgDVV27cQ4xZmMuE680ZaAHUkfdpybIvCpfeIq0C/EEciuej01P5snouv+DuJAw8GdmEr/10uz5sSy8HrhWLqACnKt61fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Tue, 18 Apr 2023 23:14:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 23:14:14 +0000
Message-ID: <3bcf3848-8e58-00d2-b170-0800668c724e@intel.com>
Date: Tue, 18 Apr 2023 16:14:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] drm/i915/uc: Split firmware table validation to a
 separate function
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230415005706.4135485-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: dfacaa28-bc27-4445-8830-08db4062a076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/sDUJ0rvFn5NmWL+aDjNxRf5cz7T74zHeRLneNZuReEC9gsOtho0B8js+pNcMmhZE6zJEQzkVGb7aE6yoLWa9Ivs0dsZOKAEUku4Rq5ht6iIVQcEvBnuKzWSwtUEyqTjKJ58ZASUFDXozUE8iRLMjt7A++0ETFbpgt+67gH/xja2eB8NjdiuOkRfTDQx5WsoUIfS1SPNv+HL1OfhT9Jp2ioOaF7/XybnuNrBnSRpOOTk5tz9NUSpk/mkm33cuFpg0N63hpNgvzOi6IUTIk4arjK0SToafi1FZ0AxQ0n1rEU/yRAc7MsX3SE0aCydrMlRi1VYj6Rd1e/hWRp1k7Bpmq5Pb9Sfh91IwROi2FrHfv3W2/7aLWiOvMX/BoKFverm+7Lio7rgAg9kgwu6E0rrn6GztlUMoKI3vgjmR5hqMfaB7G6yz19yd6R24tyKMCy6QsNh7QcgbuxvMqvzo2z+3ceFLj1juJS8CXSa2inGgoqCtRloxLvow6j7+dJjEa1uPwbVa0Mai9kMx/88LBKZ/2duFLub6IlVrJCOF/8laynBsb5oXvZ/qI/gul+qlXRmpjp8c48vOFQZGPDPWkDt+q5hlH0SYIgym2eRRbWsHqM0jYZbXmY+vpmoji8wXXzaNVGNdTjNe1jnql9CChLTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(2616005)(26005)(6506007)(6512007)(86362001)(31686004)(478600001)(66946007)(316002)(66476007)(66556008)(4326008)(83380400001)(186003)(6486002)(53546011)(450100002)(82960400001)(41300700001)(38100700002)(5660300002)(2906002)(8936002)(8676002)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czhZS0xtSW1LLzMvWk1ITStlVTdueHVWNDcyZzJGYWNRVEFGMHZabGZ4Nmx6?=
 =?utf-8?B?OU5LL1FTYzZPNXNDV1F4LzN2NVdZMWk0NzBmeEVXTzgxYVI3OE1peDRjK0wz?=
 =?utf-8?B?bEY3V0NBdXBEYmpFQ0NkMHl5NHdBRng3L0tEeFZzbEcrbTI3UlFicm9jSHVM?=
 =?utf-8?B?V0c3aUUzNTJ1WENFdnhIMXZBZ2JhQmVCeTRjYTVyQ09hVWNFT3J5UEluTDRW?=
 =?utf-8?B?UkRZS3FoWStNNUVPbC8wd2R3TFNib291Y2V6S2dRaTV4RmlYaTdWeW5VQmUx?=
 =?utf-8?B?a0Evc2RHb1ozVjJ6OFZ4ZS9HbXlZTUhCdG9kc1hBV0IvdEpMZWo1dk1Palp5?=
 =?utf-8?B?cnV5eFVNUlZkU0VxWGI1SURKSVRpT2ZrRFExLzRwTEhNUWliQ3JvVWpjS1B4?=
 =?utf-8?B?T3RVczN4U1YwQmhUenIzcWpIVE9rUkVZOGNnU2pST0VUU1QzUXZDT3J6TGVk?=
 =?utf-8?B?WHlnbGpKQTVSUDkrT2RzNkNyWjh5SFdjSlgrZyt4a0tRZmYwVThJSEppckhQ?=
 =?utf-8?B?alFzS0MxMFF5bnRnbkthZUZHczRLVHIwY1VwRHpNUDhtNGc3VUZhN3NUWlR1?=
 =?utf-8?B?YnNtbnBobTZoZ2lsdERzWW1FcG9jeGNFNjRkaXF3Z1hpaFk2VVplbGxVSXJG?=
 =?utf-8?B?VGlFWlphdWRqaWtTeU83dSt0cmtsVExjbTlmTnFhajRqMk1rcENITTBqU2dw?=
 =?utf-8?B?cUsrSTA4OS9sc1MwVGk1dTdoanBKdklVUTRMaFBzZUR6NjEvbkZ4T3V4RzZH?=
 =?utf-8?B?OE1sN2lISXcyaFpuK1FKaVcxN2FodG03WFZWT3N1TEJjYm5JQ3NySFhMVC9U?=
 =?utf-8?B?U05LMzRReHpIKzVLTHQwSVJOMU84bTlpUkQ5blJEbGg5VFl6eXJQSEhaUXJl?=
 =?utf-8?B?bG9hV2dqWkNkQWtXQUVIdlRZemRjSGlJTGtxZy85dlk1OEpqUlpLREx2MGJr?=
 =?utf-8?B?alJHRVp0Z1kyVmdPMEkwNXN1d0ZWRmpjOGZseGpzNXVadnErYnJYSWhVZmdB?=
 =?utf-8?B?bGFPb0tUTDZld0R0SU4raFJYNzgrWllJbkZaaExQOTJtYXpQNmpuTmpOSlk2?=
 =?utf-8?B?RldhOHVFNGQ0UDNiWTZscUpYN01oQjdrRjdWWmloSERwdkljSENFREdkOW5Z?=
 =?utf-8?B?ZkovS3RoOWRlZmxJYWVHNXEzdTQzVnVaSFFwYkFxMi9yYmZMOUw0NkRqa29u?=
 =?utf-8?B?ck5lSE1JRitCSGY0UzkwMTQranV1TGRKS0RHN1hJTzlUamt5WlBTbmZTTklo?=
 =?utf-8?B?eHk0V0dJVmZhN1RtaDQwOElod3hlWUV2ZU5TKzg3TVBPOEY1eThsTWxjSjI2?=
 =?utf-8?B?SVhRTkJscERzTnhINUxTWlVRWTNScVhPSGh6aUUzaUo2SDRYemZVSnhWRVB0?=
 =?utf-8?B?Z2g4Nm9mVU4wWkFuTDNlRHA5M1VESlZ3a1ZOUzFjOG4waGFMWTY2YVB5MUtK?=
 =?utf-8?B?WUcrbUwvMXRBakpkdHlUNENiSFlIVDVNbjlRY0NtSzFGOTkzWk9vQ3JIZGtQ?=
 =?utf-8?B?VXU0cFI4YWl6UW5BY1lzMGw3ZGcvNjJ6S1Z2bVI0RlVQTDk2eS9aUndHem1v?=
 =?utf-8?B?TGxMSzgzbm1sczJGbnE2U2VWejhCRTArdXdRL1YzZThqSWtJcXlCMktEYktD?=
 =?utf-8?B?Q2dCSlpIRTZJUzFjRFd4NUNIYlE2ampvRHB5cXl3YmVUM0RUMTJOQlYxbGFk?=
 =?utf-8?B?TjRJZ3ZJZ2pVZUFyQVEwdjdvRnBEQnJiWEtrMHhnRGliaER5c2NDK3o3T1V0?=
 =?utf-8?B?U1FYditrVkRoYkZWWDZsMUtFa3RmRVVjc1NzczFpNGtOQ25tNUFYaXVGZ2kx?=
 =?utf-8?B?WUhJTnBDc3hpbVlHeityeFh6OCsvaHBEc2J2bWgzMjJya3d0L1EzdWpVY2tR?=
 =?utf-8?B?TTdEUHZSOUFOaVI3V1kvcXhjaktCa2J4NGNHeG93ejlLS0RKWTRMMnVQK3oy?=
 =?utf-8?B?YjVGT241cHJhK3UyaEk1Um5jaGpQWFpQU1V3YktPM2NNZnEwY25LWHY3RWYy?=
 =?utf-8?B?NGQya2VOR0dmV0k0cWpnRTBlTExINEQ4Mk91YWR6K2xVd0NtdzJrZGJ6eVRt?=
 =?utf-8?B?OEZjMzRzeG5BMFVnTWVRcElQTlpsaGg4anNGVzZkRmVnTUlPUzZZL0o4Z1hh?=
 =?utf-8?B?anF4WXRQeHdZUnFBR1FVSmp1UDR4all3RWlkL3lpV2owYWtFUTA2THlKalcv?=
 =?utf-8?Q?XHjhufTb6uHfizq8jSBvRYg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfacaa28-bc27-4445-8830-08db4062a076
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 23:14:14.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbmQSuzQK1a7n6hv7VCBi+2p6wHWvO0ekqEiF5RaEgZZdF2xzEAxLEFepPkK4c3/EBw9QcjSQC/wu0O357FwrprpRmj+ErHpXAWJQTLsj1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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



On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The validation of the firmware table was being done inside the code
> for scanning the table for the next available firmware blob. Which is
> unnecessary. Potentially, it should be a selftest. But either way, the
> first step is pulling it out into a separate function that can be
> called just once rather than once per blob attempt per blob type.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 164 ++++++++++++++---------
>   1 file changed, 99 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 6bb45d6b8da5f..c589782467265 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>   	u32 count;
>   };
>   
> +static const struct uc_fw_platform_requirement blobs_guc[] = {
> +	INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> +};
> +
> +static const struct uc_fw_platform_requirement blobs_huc[] = {
> +	INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> +};
> +
> +static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> +	[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> +	[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> +};
> +
>   static void
>   __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   {
> -	static const struct uc_fw_platform_requirement blobs_guc[] = {
> -		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> -	};
> -	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> -	};
> -	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> -		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> -		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> -	};
> -	static bool verified[INTEL_UC_FW_NUM_TYPES];
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	enum intel_platform p = INTEL_INFO(i915)->platform;
>   	u32 fw_count;
> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   			continue;
>   
>   		if (uc_fw->file_selected.path) {
> +			/*
> +			 * Continuing an earlier search after a found blob failed to load.
> +			 * Once the previously chosen path has been found, clear it out
> +			 * and let the search continue from there.
> +			 */
>   			if (uc_fw->file_selected.path == blob->path)
>   				uc_fw->file_selected.path = NULL;
>   
> @@ -306,78 +313,103 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		/* Failed to find a match for the last attempt?! */
>   		uc_fw->file_selected.path = NULL;
>   	}
> +}
>   
> -	/* make sure the list is ordered as expected */
> -	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
> -		verified[uc_fw->type] = true;
> +static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_fw_type type)
> +{
> +	const struct uc_fw_platform_requirement *fw_blobs;
> +	u32 fw_count;
> +	int i;
>   
> -		for (i = 1; i < fw_count; i++) {
> -			/* Next platform is good: */
> -			if (fw_blobs[i].p < fw_blobs[i - 1].p)
> -				continue;
> +	if (type >= ARRAY_SIZE(blobs_all)) {
> +		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
> +		return;
> +	}
>   
> -			/* Next platform revision is good: */
> -			if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> -			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> -				continue;
> +	fw_blobs = blobs_all[type].blobs;
> +	fw_count = blobs_all[type].count;
>   
> -			/* Platform/revision must be in order: */
> -			if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> -			    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> -				goto bad;
> +	if (!fw_count)
> +		return;
>   
> -			/* Next major version is good: */
> -			if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> -				continue;
> +	/* make sure the list is ordered as expected */
> +	for (i = 1; i < fw_count; i++) {
> +		/* Next platform is good: */
> +		if (fw_blobs[i].p < fw_blobs[i - 1].p)
> +			continue;
>   
> -			/* New must be before legacy: */
> -			if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> -				goto bad;
> +		/* Next platform revision is good: */
> +		if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> +		    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> +			continue;
>   
> -			/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> -			if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> -				if (!fw_blobs[i - 1].blob.major)
> -					continue;
> +		/* Platform/revision must be in order: */
> +		if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> +		    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> +			goto bad;
>   
> -				if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
> -					continue;
> -			}
> +		/* Next major version is good: */
> +		if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> +			continue;
>   
> -			/* Major versions must be in order: */
> -			if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> -				goto bad;
> +		/* New must be before legacy: */
> +		if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> +			goto bad;
>   
> -			/* Next minor version is good: */
> -			if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +		/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> +		if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> +			if (!fw_blobs[i - 1].blob.major)
>   				continue;
>   
> -			/* Minor versions must be in order: */
> -			if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> -				goto bad;
> -
> -			/* Patch versions must be in order: */
> -			if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>   				continue;
> +		}
> +
> +		/* Major versions must be in order: */
> +		if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> +			goto bad;
> +
> +		/* Next minor version is good: */
> +		if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +			continue;
> +
> +		/* Minor versions must be in order: */
> +		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> +			goto bad;
> +
> +		/* Patch versions must be in order: */
> +		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			continue;
>   
>   bad:
> -			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> -				intel_uc_fw_type_repr(uc_fw->type),
> -				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> -				fw_blobs[i - 1].blob.legacy ? "L" : "v",
> -				fw_blobs[i - 1].blob.major,
> -				fw_blobs[i - 1].blob.minor,
> -				fw_blobs[i - 1].blob.patch,
> -				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> -				fw_blobs[i].blob.legacy ? "L" : "v",
> -				fw_blobs[i].blob.major,
> -				fw_blobs[i].blob.minor,
> -				fw_blobs[i].blob.patch);
> -
> -			uc_fw->file_selected.path = NULL;
> -		}
> +		drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			intel_uc_fw_type_repr(type),
> +			intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> +			fw_blobs[i - 1].blob.legacy ? "L" : "v",
> +			fw_blobs[i - 1].blob.major,
> +			fw_blobs[i - 1].blob.minor,
> +			fw_blobs[i - 1].blob.patch,
> +			intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> +			fw_blobs[i].blob.legacy ? "L" : "v",
> +			fw_blobs[i].blob.major,
> +			fw_blobs[i].blob.minor,
> +			fw_blobs[i].blob.patch);

Confirming that this big diff was just an indent change was painful :/

>   	}
>   }
>   
> +static void validate_fw_table(struct drm_i915_private *i915)
> +{
> +	enum intel_uc_fw_type type;
> +	static bool done;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST) || done)
> +		return;
> +	done = true;
> +
> +	for (type = 0; type < INTEL_UC_FW_NUM_TYPES; type++)
> +		validate_fw_table_type(i915, type);
> +}
> +
>   static const char *__override_guc_firmware_path(struct drm_i915_private *i915)
>   {
>   	if (i915->params.enable_guc & ENABLE_GUC_MASK)
> @@ -432,6 +464,8 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   {
>   	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
>   
> +	validate_fw_table(i915);

Personal preference: IMO since we're calling intel_uc_fw_init_early per 
FW type it would've been cleaner to restrict validate_fw_table() to a 
single blob type. This would have the negative side effect of having to 
track the "done" status per FW type, so I can see it's not a clean 
improvement. Not a blocker.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   	/*
>   	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>   	 * before we're looked at the HW caps to see if we have uc support

