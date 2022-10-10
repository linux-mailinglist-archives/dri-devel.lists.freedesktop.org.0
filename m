Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CC5FA7D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 00:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7D810E731;
	Mon, 10 Oct 2022 22:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559C010E443;
 Mon, 10 Oct 2022 22:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665442215; x=1696978215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aQCZi9T1jGpNf2LdA6Y/k7o6PTolkUoQYsyJsfaOuNo=;
 b=T+JNbq5okTfggp1QDPQ0fH4BeRK8AQNwTPIdEL2+edADrAMK51JsX3JM
 q+4feXkOPbTtHRow34bHWuHizESDY2j5zB4zaJVcWQ5346uq9Uh5xRdhF
 NY0qKqblfgAx/0r3QEycEOvFjlRX0zC2Dg2/AzzV9yVavCbE4e934FsEL
 IiIhYIvioZiFfPB65dd9TOy5W+SE+6f0QoJfTda5KsaXUixK/yRXH0G9b
 6JjQF1OUwqebifN0KzsXWD5XDMtI4JNAE5JXkjJqkhSu0niQpGN1lnvXE
 ommeTsCA0XURgdqHikEFGzmIleR35zpxyDC6gnXIejxFHMr+34j2DSp5+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291665391"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291665391"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="603904762"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="603904762"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 10 Oct 2022 15:50:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 15:50:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 15:50:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 15:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAqoezN+eDc9tRTqUAqkFXg0d1nKtyVwUPC3YfRrafIrcK/glhx2Ah4/3I75LjNtJf83EM+KfUE77HIZnyUuMQsfXvgRc6uiWNMDd/0s50EZq9Iq/8akM9s8YDGN7SUzE7W40C9PeOQTi5z1tZW9qNmgXUjoYM4t+SJJe/HKAHU+EQRReRzkHpSg5hUdTE4wXJ5P60cvJ70tKRHhY+CBbzfZq1yV7WFJ+27uVxZrflAmhuPjhyud4ceFLK2Wjp9gKP06npWAmdwFotyW1Huh/N8dnL+Leobv2UF4RD3ZS30i0CFeeLQWf51TOhH0sTOBBcmtqWRRLqgnpAUCzM9+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln0tLRLD5FEU5bcFilR6RytneTLybzT6ZTe8rcV+YeQ=;
 b=V+EGl1vqIqqJDb4/IlfIaKdRnBAcOW7Hsi6w5nTqLrYzz1MVtT3pjHeV2WHTvd2Paurv4XihsFq22xHj142TMPSh3K5tmxW/rVTWsZKzd4bLeoPx/ljCX8IMESon96oKe9PzlC2dzuam1iEJ0PeuorzyHI2oDXLo2v+Vb0TL1XV4/xD3urccJ1vjG4ax8/gNDotNbgjMqwAS5t8HFWyei7gjFh0Jzx4wyj+OvJeRRBE+CgghVJB+HSHwNU/REtYN2Bgn0uy0Bk6rcyHTGF1cuj6wqz8h5hYbALxz3neeBhCqAGLRonDkg79MFSIVhvx3CsRxi/5LkNoWZqqt59vcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 22:50:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 22:50:10 +0000
Message-ID: <0a63f729-f2b8-4782-f21b-00f536145ab2@intel.com>
Date: Mon, 10 Oct 2022 15:50:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/i915/huc: bump timeout for delayed load and reduce
 print verbosity
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221010184812.1576601-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221010184812.1576601-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb94b95-56b7-46f2-b60b-08daab11c953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0Ykkl8jl5MDs//oybr8pVcfjwnU8/7VC7avDHjc1xnMDmf4Hnb5IbhbEb4jNuRuYuNrGgl5klZ/1YELqQectSHYaIKd28BzxAXsssP9MQ43heHArntdkcYc8+UQ7N8+HEol0uzQhsz3NvvoudD3ZWcBiEXmNToBUa6klR3WVWSrxpIp4cCGtzXf/YvkzCaFdn9RFldPwILn6tKBXEBzBLL6yKidJb60fYUKx2w+9NZLZ05bc/J27cOYC/sFpOefGWM96rgJzZlCxfqlU80/buTU4egPJv7Js4X97pJdlte++9iF5MY3ggxXXm+uL6CALvHMq7dDXWUxsU8vCUWe+jiape+eEGEinZnKzvpjrNX/d+iSKzPCC6/mHvOh9k73kH+NnfZZ64c6MIHv5fKp5iRgFoI2qC9O4Vv28GHoApFD12sy+GityePDJC3Un2pybMS8J3JiTbcdDQURV1xsnkwu1OYsVNfkUiZ+MKaUcUrasDuLYFtNzDG7lwfd5VcUpusnAsNxHEMu8qlcU9wMc6HYij9XjYYAzaqKOgDRpg7k8N6WbTmuFGHw6h3bYQIFKJK5O5KJFYq9zFbdtJdFZz9TtDzjNMrwnll9lg9ZC9ozZy36VC3GaxKNx/YDUqM/ga9jC2hU4II52kxyB1QX34ONMxf9bLiqHIJAYh9YwbcZAuw6MfQaKB63cNEwZuccMZT6ASUwF2Y5V5KxmOVkIh/9YVZzmWFGykUewgdnl895YvkhbylyPaQfdzHa5VgC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(316002)(38100700002)(82960400001)(66946007)(8676002)(66556008)(31696002)(66476007)(450100002)(4326008)(36756003)(86362001)(2906002)(41300700001)(8936002)(5660300002)(83380400001)(2616005)(186003)(966005)(6486002)(26005)(478600001)(6512007)(107886003)(53546011)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHFDYW5xTERzdHA2ZS9lcllzNmYrZ1FYQk5DTGNvdGowUmF6aWVIUFZOaUhH?=
 =?utf-8?B?dVNPdzdKYUFrcVUybFR5czJVTFF6eVR6SWk0WGhsL2o3bnA0UXFsV0pVWmU3?=
 =?utf-8?B?WG9KUzJNOVhnTHJBQkF3SHA3ZDBEaDhLdVlRdXdZeXFuQ08wMlZTV3RZdm9l?=
 =?utf-8?B?cE50eTFmaENodU1KSmUyZFpZM0FNYWsxa0Y4TGUyblFaTmxuVUJkMHpIOXdO?=
 =?utf-8?B?UG8vNkxnU2lQY3MvQjZyMmllLzROSHJJTDNTbzBvb3E2dlh5TGV4WHBnbWI0?=
 =?utf-8?B?Y3JJeWZKYkFsMGhOcXFQZTh4b0c3YXR3UlU4LzJ4TXJkaHQvQWo5VVZEbkth?=
 =?utf-8?B?U3B0TDNsdllQcnhGcjlaVzNiZGxxZTdNTVhDc1NhRWZKRWwwUEswNDd4K0M3?=
 =?utf-8?B?WkxnK2Z3U0Z3UUUwWklpK2sxaGZsbjIzOWlpS0lZM0VTcE5IQTZJVGpNeE9P?=
 =?utf-8?B?MXA4cXpwN0ZDamFHR0FhbzVWYmVxUkV1YXRtSkJRMlBXVEN3WWZoM2FESW95?=
 =?utf-8?B?U1pzN05tYUs4VnJCOGNZcWR0QWw2UzZadTFFM2Z1MjlqaGR6ZEFKa3A0bWpu?=
 =?utf-8?B?akJhR2FXM0xoODVOQ1lvVCtpK3hsZG9FYS80akJ4ZWdLOVYzRU92elFSNlU0?=
 =?utf-8?B?TGViU1E3bXhacjEvQ29uUVFMU3J2Yk5kZlduUGdXRHplODFvWmxQc3hnNHNE?=
 =?utf-8?B?MjRzS1czdG9KZWhGUllLZ0haVDZqZkoyRkE2RFJNRDVZZ3BIanBSQ2FNaXJF?=
 =?utf-8?B?a052MHdkaVpDSG9KUEVheEJ0c3lFMnBoTmMrTGJiK1hKLzV0QWJuekxyMTNv?=
 =?utf-8?B?MksrTWo5VjlsWHBhMzg5TGYzVzF0elJwaDFqUEp4KzZrcXpsa2xEcDY2a01Q?=
 =?utf-8?B?SGpRb1JqVk1tdjhDdjd6aml3TGVFa1pqRUxrdUtEKzM2U0NIN0lzK3ZuK1R5?=
 =?utf-8?B?a094S3N0MDIxQmJ5NSs4NjFNb04vUGlMdGZoZnp6RitZRGY4eVZSWWJoc0FW?=
 =?utf-8?B?c2NERWltbnRwZkhpQUQ5bmtGZlFPNUJxVTRQazRrOHZ0QU5oS1pDTis2cDJM?=
 =?utf-8?B?UWxNV3BOZmVGWW1rNmF3aEYvdVYzT2VVTjJTaVdHdUovekFzZjhpWm9kZTRF?=
 =?utf-8?B?OGU5aGpzeWhTR1hHSHdTM0FiS1FWc2M1cE05WURzcW9jRTFlSUZuWGFXYkRC?=
 =?utf-8?B?Z1NtVnBhRUhPSWw4QkFjejJvTmIzeGR1a2V0UjFWc3RORXBRL3J0VVhjS0tn?=
 =?utf-8?B?Yk1JQkNGeXRPNk5JZmVldERmVVpnOEV0OUwwNFVvdVVWR0ZNdUN1NCtZY2pC?=
 =?utf-8?B?QVV2K01IU1FtWUpPOEdaSzgxeVdjMWNRQkNoM080dEtBYjBncThTM25ObHoz?=
 =?utf-8?B?cEFTcWdXa29KRS9aSHYyOTlVdU5pQW5VQU9lOTl0U0FtNlNnTjMxUW1UVmZF?=
 =?utf-8?B?ZTB6REVVZ3ozVENMakJrQndQb0lYRmRzOXJER3ZsanRjL2dtU2pUSmY2UEpZ?=
 =?utf-8?B?Ukg2ZHdaeFRYMXQ4OXdWck9TY3hicUJhak9zMVRRY1BsUGlhNDBUa3EyWkhn?=
 =?utf-8?B?aXVlTHdkQ0xmaGtGVThHaUpxc0crTFVoRTJtUHJhcisrdmFqeFhIOElnWndV?=
 =?utf-8?B?cUloSDRkeEpCVzdGR3FMTC9uSkI3R1AzMTQwQTJPdHhzUWZROU91UWd4SjAr?=
 =?utf-8?B?U1dvdG9RSHZqa1pmZjdCRTluTHE1WVVSL3FzajZYWm5rdjVkSUN4OHpEUDFy?=
 =?utf-8?B?aEZ4UnhnOUpyR1hSVzlTTkcyaUQ4TEl5NUFScnE5UWVCTVZpSGF5LzBSZnNv?=
 =?utf-8?B?ckIvdERLMGdGb1J5L1c3Q1l6cWo4amFvUndDM2JnNnJwbTUxOXA0WFJxdVRL?=
 =?utf-8?B?Y3ZzNEhvL25ncWk1OEJya3lqcSswL2dCWHo2YTNIRjJ5L21QS2xYaU9OVGhu?=
 =?utf-8?B?NzE3VjNjaVVXbk1VbmtDVmRWcmc5TEJtaGpXaUJkemtEd3IrVmZnRHo5RnFQ?=
 =?utf-8?B?TCtWeS9VR1RTUEhlYi9PajNMRit5a0pUVWhtV25FQm1QUDdsZ3gydGgreGIv?=
 =?utf-8?B?WHphdklVK1JCUjZWL2RmTGMwS0J0c2F4cEdzL2dScG4wL0czczFqSnVKdjV4?=
 =?utf-8?B?TjRDR2NQZjRqakUzYUlLWFdnNmtBT0pwMGZHWUZNMWZjbzJQVXF2RzNLVU1L?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb94b95-56b7-46f2-b60b-08daab11c953
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 22:50:10.8096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nyksjsWbbj+wnze0ebItGMRzVB8MjloVOHd0L2slWGErrldsdKnWhA5Fq4KO5E8X9fodtYHtt5FW1ZIo0VwpVcRUwMk4f4NvrauUXkofn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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
Cc: Tony Ye <tony.ye@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 11:48, Daniele Ceraolo Spurio wrote:
> We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
> binding completing later than we expected. HuC is still loaded when the
> bind occurs, but in the meantime i915 has started allowing submission to
> the VCS engines even if HuC is not there.
> In most of the cases I've observed, the timeout was due to the
> init/resume of another driver between i915 and mei hitting errors and
> thus adding an extra delay, but HuC was still loaded before userspace
> could submit, because the whole resume process time was increased by the
> delays.
>
> Given that there is no upper bound to the delay that can be introduced
> by other drivers, I've reached the following compromise with the media
> team:
>
> 1) i915 is going to bump the timeout to 5s, to reduce the probability
> of reaching it. We still expect HuC to be loaded before userspace
> starts submitting, so increasing the timeout should have no impact on
> normal operations, but in case something weird happens we don't want to
> stall video submissions for too long.
>
> 2) The media driver will cope with the failing submissions that manage
> to go through between i915 init/resume complete and HuC loading, if any
> ever happen. This could cause a small corruption of video playback
> immediately after a resume (we should be safe on boot because the media
> driver polls the HUC_STATUS ioctl before starting submissions).
>
> Since we're accepting the timeout as a valid outcome, I'm also reducing
> the print verbosity from error to notice.
>
> v2: use separate prints for MEI GSC and MEI PXP init timeouts (John)
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 4d1cc383b681..41c032ab34b3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -52,10 +52,12 @@
>    * guaranteed for this to happen during boot, so the big timeout is a safety net
>    * that we never expect to need.
>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be resumed
> - * and/or reset, this can take longer.
> + * and/or reset, this can take longer. Note that the kernel might schedule
> + * other work between the i915 init/resume and the MEI one, which can add to
> + * the delay.
>    */
>   #define GSC_INIT_TIMEOUT_MS 10000
> -#define PXP_INIT_TIMEOUT_MS 2000
> +#define PXP_INIT_TIMEOUT_MS 5000
>   
>   static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>   				 enum i915_sw_fence_notify state)
> @@ -104,8 +106,12 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
>   	if (!intel_huc_is_authenticated(huc)) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"timed out waiting for GSC init to load HuC\n");
> +		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
> +			drm_notice(&huc_to_gt(huc)->i915->drm,
> +				   "timed out waiting for MEI GSC init to load HuC\n");
> +		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> +			drm_notice(&huc_to_gt(huc)->i915->drm,
> +				   "timed out waiting for MEI PXP init to load HuC\n");
Hmm. It feels wrong to assume that the status can only be GSC or PXP. 
Granted, it certainly should be one of those two values if we get here. 
But it just seems like bad practice to have a partial if/elsif ladder 
for an enum value instead of a switch with a default path. What I meant 
originally was just have a single print that says 'timed out waiting for 
MEI GSC/PXP to load...', maybe with the status value being printed. I 
don't think it is critically important to differentiate between the two, 
I just meant that it was wrong to explicitly state GSC when it might not be.

John.

>   
>   		__gsc_init_error(huc);
>   	}

