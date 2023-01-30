Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4D6817DF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 18:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832F810E012;
	Mon, 30 Jan 2023 17:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05E10E012;
 Mon, 30 Jan 2023 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675100574; x=1706636574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PFGqXu+kkgEfCVyYsUHMXQmCXVrXjO2NrpyMIDHgbg0=;
 b=lTi6zLk4rjFTa2NUDtpFPiV/T4lyIbofm3k9hl7SzTzo5tt6wqTaPmv8
 G14zEMVrE85FVm4tVol5lOuxNyURmSQZ/38xt6CCyDIPnjMMK3Kd7+vHS
 TP15Pt5ZVn6uuU0l+xzk4W3/vZi+Sn16907mDQUDuKPqa8jGo34FCiheL
 NeL3ff8GlSKDsIATFJr35kjqtyXR4gbpyQB5wAosMTs+GfPMKZD5txsiS
 REJtpmuogZQ/8bQa720rPLmOoUGAqVz3ApL6ln4dFKY65bpdJVDsyCwsF
 a4X+rMSHpAjq+MOSMIC3MLkEUtEOUthka/+DHHgJm2LVHLoZ04Y3Da7C3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="389990255"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="389990255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 09:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806764456"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="806764456"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 09:42:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:42:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 09:42:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 09:42:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZvrbGLSTxliKNWKtuqqmLVBJZ+U4fvbp2+LVlIGs/wka83/peRs/5m3V8F4JzgpLmEBFQ7f0xwYWF9iylUlELGZJE5uUh3otKvEhMGvlo/pnxJQJJGcIDH/q/WI2uzZn9YYELmG4zvRa8yRCOL21PlqLxECqGvPcjg9NHxQ7MFSH7FwOiOFS5VpkvqFgspIi7N+2ySYrmwW67j4zKqJalfl1zROSLu1Y7yy2++urzX3F0idNInwYLuGE6Gwim/NFvx2TmAx37AeFeEtGjLV4PbIdNxLEU0gV/g8eagUJ7e4Naiv/+6jD2ZEKMowYrQhSurVsTxnEP6P47WlPqTdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m/DIcW6g+6/90lzTiwatK23pFnwHB1pRZXQhKTUmdE=;
 b=ZJ+dMiNBfGA/64WU0TmwmFiukz4Z1JiGio2nC+PNarRGSB8b1aScObHD/JdF1M9eUgkufWwX9VIoe4Mtu28III3TvVz7sJfFs+NOtgVN1lN/7foKkWl669wUt6MUMmZEU1i+tr9Yzl/xgM719AxyS1rR5jbPo9J9COYptL7Doap8UBqrqDL/tullfGOLAkr+3pxfxdu8pXf5puB92MLpo3ZXEePhDQys4AMISQkTXo8M6ws8tdYVnEfuA80owNxuuNqhaBOXkKF0ESuCHBGIvFKFT66NtqyDBpm3BaljP22z1T0oSU7EvmL6Ewrne8lL7evWodOtw++rkRFE8u+8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 17:42:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 17:42:48 +0000
Message-ID: <db068929-78f4-539b-2ea9-0e55bcf2d2f0@intel.com>
Date: Mon, 30 Jan 2023 09:42:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/8] drm/i915/guc: Update GuC messages in
 intel_guc_log.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
 <20230128195907.1837-7-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230128195907.1837-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cab25a0-aa0b-460f-741d-08db02e966f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3hYbWGGQrv7F3UmKUXWqH+sdkDedCO+Ymx1mltBcUoOOPOks0jx4JfbHvMIyQr1wHsWq67LqnD2dobQWwLfuqV9V0WN4vJH2iYyqQ9oiHyGd5GFEIyoRRM0r5qxkytLKQFh0HPTUtoF7/camV+81XH4ZWGomEThk5jQT0JTE6l1btjNb9Ds+QMbDStr+vjVFsUaXty6O6ytApo8+jfamcpx23Z0EivecH2TFAbht/4UlI6RkeajK2lM8Q+7lKGdZHAFZ06gJ+YL6oYwq/j8uARWYNNX0ikInbCe3cTDhkpmyRWiQAU9g9IKRmB5mq2NRgKgBfo2QKBo6voWZzA7I94EhqJCqu9WkwQE38cBiu1IEDHA2HwwLZU197l8MGxe1Klq0JTx8vPClT12sps67KPHyaC8gnp+UB5kFbAYHn5ebjIajZ1Gpe7gWespC1h9ht1kGAgyvPjDZCNK88IoUdPWxMcugOQaVsLBjna7r9vdXdI4cv/AIcvRCigC7h2d5BQkWEIl7S7zrZTzyMtZcjXCFoYVJF5O1+1QsmgE+3pE193X9Tjxq2OeHwp6UmrNzj3clQ9Fty6OnwOJBWxM7Gqte+p6FSSKaEAy59gzrI9RbLk2rg13rFKwmvVzEFUBwE7yOreT05OWYmP5ZgSH8BfKySrS5tHHU8TXOzWw5o8WYoKpeUzvSmDOq2eaJKnzMcC1FTFL/+THfwaMnbT3dhiD26c0SBmsVozElwujsJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(82960400001)(31696002)(86362001)(38100700002)(36756003)(450100002)(8676002)(4326008)(66556008)(66946007)(66476007)(316002)(5660300002)(8936002)(15650500001)(2906002)(6486002)(41300700001)(53546011)(6506007)(6512007)(26005)(186003)(478600001)(83380400001)(6666004)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0puQUMwNCtPYTBDT1pvYStSYzRaVlh5Q1dsM2x0dmtxYXU3d3NLWGsxYi9Y?=
 =?utf-8?B?L0RNMEFtY1ZFL0NUZGpjMDgwMXM0RndiOGoyOHVMUTlxMy9mYXpFTEwvTWZw?=
 =?utf-8?B?SmVJOFBVTzI0R2dOZE5WbDduWkJZZmZMQWtyNDF6cFlwVUpBdUFWWFRGay9V?=
 =?utf-8?B?ZEFTc0E3ZVluZTVIbEN5ZGprUkl6eThSSEsyT3pQU0lESGRyZ1VERmlUeUVN?=
 =?utf-8?B?Y2loWGVoMzE2Z0VaYUMrOTlzUm4vNlMxaXAyNG9ZOCtkR0JHUjBRT0dhdVNF?=
 =?utf-8?B?M0NTVXl2aGU0RjluY2pKdlp3d2I4SE90RFI3SFMxWG5MWENqMG4xcG0xdTc0?=
 =?utf-8?B?NkdkNlVLelpoYkxBL0FCUmVxTjZBU2tMZk5FbTBnZ1RNWGhSTnN0V04rRUcr?=
 =?utf-8?B?dEU5Z0NPMWxMVzBiTStsSWxoUTZkRGlzMnc2V3BLVFNHYit3SWtPMGVQRjY5?=
 =?utf-8?B?OE5iNi9KRTkyckxxYzNrZ01iUzc4TnBzR0dIV041akxlSkpQRUJ0MWVFd1dJ?=
 =?utf-8?B?M00zUC9GNVZPcFhSb3JEU2dMOUZ2SFpmZUFwMVZIQTgyNGZiOWpGbnFRNkFl?=
 =?utf-8?B?d09GUGtFckhyOVJmUXgxdU1EQnp1RGw2bzZIb3VJdEdDQkdmdXI2dkFmQ2x4?=
 =?utf-8?B?cm02VlVaZ1RaK3FHQmJVMjFJWmM3SUQ1SUxkeTJYUHN4L1hGcEtXVE9SaTBq?=
 =?utf-8?B?M0MrZXdta0tOMWl4SUhuU21sYVo2azVHb3haVGJQSDZBalpCWVFPR3NmUjZS?=
 =?utf-8?B?N3VXQVBHMVVSVEtTOVAwWTdXb2tYeFBmMUdnSmhtUU8vM2RLbGRjK2lsZkEr?=
 =?utf-8?B?UmJ1S3BqeXVVYm1zRGgxa2g1WmVnazJVV1FLWGtqTlplZ2pXa2ZoTEhWMDEz?=
 =?utf-8?B?WTQ3R09yaWREUkJqY3hLcnppVjA3UlZmNXRaL0d4UnlubVBmeEFYbVVITVhT?=
 =?utf-8?B?REdvN1FZczlXQUJ5dlppNzRBaUwrNHlhZGZKbWxoUHJMcTQrbnlOZDE4eUxG?=
 =?utf-8?B?TE04VUZWZVFDbnNmN1EzU3dnS21LcWFUMU1rbGpLRWxpdE96cm9McDBINTg3?=
 =?utf-8?B?MzgvRXEvcHFBZjRNVVZvMVBNOWprYnBSSkV3UGVacUVqZ1ZTL1QvZVFtc3F4?=
 =?utf-8?B?bnJVMzkvU1BSamZaSzZrTm9yaWNwRUFURzY0K0tZYXBIMDZvUEFyY1RNc3Ji?=
 =?utf-8?B?Z1dQOCtvSlg4aFlQZlRPV3JQd0dOb01rQjUrSjZQOGdlbjUrYndjS3dwcmpH?=
 =?utf-8?B?N3hLSExpM2psSnJVVDVQdlNYNHdaZGhhQ2REM3hoL2tHaWhOa2tPVnF5cW5h?=
 =?utf-8?B?YW9uK2x3bitjL2M1RExVRVZ6ZE9aTzlLWnQwQUU3bktQQndsUlRwR3RLeTZP?=
 =?utf-8?B?V2JiTXdJT05keTlHalRGczQ1dnQ3MzZoSC94L25EdC95SnFWaHhJU3FKL0RI?=
 =?utf-8?B?bk1QODdzVitrb1ZBcTRJdGZXVW0zVTExd2JyYi9HekxPM2VVV1J6NkVlUU5D?=
 =?utf-8?B?TGRYUVdRakNmZVRvKzJrVE5yRWxVRVdnQXNhZm4vTHlYQ1pMUlhSMGtJeGYy?=
 =?utf-8?B?d2MyUGd6ZGRsc0lKYkVsWThlZmZsZUd3SGk0UnYrNWt1cU1tU2cyNStFWlBX?=
 =?utf-8?B?ZTBWKzM4YjhGUi9oSTZSM0plNDRiL1VZV3dFaXJqMnUycjgzYjBqcXNPUWxw?=
 =?utf-8?B?d2Q4YitNZXBzd2xyYStJOFB0M2hWU3pRejJUVkd2Mk1NV0FJUlJGUlpwTVI3?=
 =?utf-8?B?ckVodEI2R1FYZmpMakhSUE5CcnVHSWU4YVk4cmQ0MHlvSVFuZFRLVDAxZ2JZ?=
 =?utf-8?B?d3VTbENJVUZweHIzeFhyODlRVm5mWGkrUmw2L0RXM3BLd1IvMktWN2pEbktr?=
 =?utf-8?B?akFYN3pSZUxsTXdIdEpPdzE3Wm0rTHZvSXZUQlFjRWM3UE11eE42amNkL3hG?=
 =?utf-8?B?b0RFb2xKaXVoeDBseUhWeXI3VEVDQWNTaHY1WGpVMWlpY2tLZ05VUXJKTWg2?=
 =?utf-8?B?cU5waUxndm5GSVFLSmFPSDJUcVFGUGl5Z3BkcmM5ZHlMdTlBS0g2SzNQdElj?=
 =?utf-8?B?TS9pclM4Nld2NWoxRis4QnlpNVluK0lvWlZ1d0xhb2k2TjhxTXY3Y3JCVGRJ?=
 =?utf-8?B?eWdiTkpsN3lMc3lXWWlHMnJ3dTZkcHBqekpyNFJGNG9Ebk8yN2M1bjlCbndC?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cab25a0-aa0b-460f-741d-08db02e966f5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 17:42:48.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUTXs3DLxm4K/D1TrbNeuxNGtkzvfh6jmWfgBNkJvqM0kpStTQY1Vqp3h04TTO8oo4A7srIf+sQkUWf1ONLBJ7+gk8hyQRg1Ocj5+d6B4WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

On 1/28/2023 11:59, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> v2: drop redundant GuC strings, minor improvements
> v3: more message improvements
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 68331c538b0a..c3792ddeec80 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -12,6 +12,7 @@
>   #include "i915_memcpy.h"
>   #include "intel_guc_capture.h"
>   #include "intel_guc_log.h"
> +#include "intel_guc_print.h"
>   
>   #if defined(CONFIG_DRM_I915_DEBUG_GUC)
>   #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	SZ_2M
> @@ -39,7 +40,6 @@ struct guc_log_section {
>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>   		{
>   			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
> @@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   		}
>   
>   		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
> -			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
> +			guc_err(guc, "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
>   				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>   		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>   
>   		if (!log->sizes[i].count) {
> -			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
> +			guc_err(guc, "Zero log %s size!\n", sections[i].name);
>   		} else {
>   			/* Size is +1 unit */
>   			log->sizes[i].count--;
> @@ -95,14 +95,14 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   
>   		/* Clip to field size */
>   		if (log->sizes[i].count > sections[i].max) {
> -			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
> +			guc_err(guc, "log %s size too large: %d vs %d!\n",
>   				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>   			log->sizes[i].count = sections[i].max;
>   		}
>   	}
>   
>   	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
> -		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
> +		guc_err(guc, "Unit mismatch for crash and debug sections: %d vs %d!\n",
>   			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>   			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>   		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
> @@ -374,6 +374,7 @@ size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log,
>   
>   static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   {
> +	struct intel_guc *guc = log_to_guc(log);
>   	unsigned int buffer_size, read_offset, write_offset, bytes_to_copy, full_cnt;
>   	struct guc_log_buffer_state *log_buf_state, *log_buf_snapshot_state;
>   	struct guc_log_buffer_state log_buf_state_local;
> @@ -383,7 +384,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   
>   	mutex_lock(&log->relay.lock);
>   
> -	if (WARN_ON(!intel_guc_log_relay_created(log)))
> +	if (guc_WARN_ON(guc, !intel_guc_log_relay_created(log)))
>   		goto out_unlock;
>   
>   	/* Get the pointer to shared GuC log buffer */
> @@ -398,7 +399,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   		 * Used rate limited to avoid deluge of messages, logs might be
>   		 * getting consumed by User at a slow rate.
>   		 */
> -		DRM_ERROR_RATELIMITED("no sub-buffer to copy general logs\n");
> +		guc_err_ratelimited(guc, "no sub-buffer to copy general logs\n");
>   		log->relay.full_count++;
>   
>   		goto out_unlock;
> @@ -451,7 +452,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   			write_offset = buffer_size;
>   		} else if (unlikely((read_offset > buffer_size) ||
>   				    (write_offset > buffer_size))) {
> -			DRM_ERROR("invalid log buffer state\n");
> +			guc_err(guc, "invalid log buffer state\n");
>   			/* copy whole buffer as offsets are unreliable */
>   			read_offset = 0;
>   			write_offset = buffer_size;
> @@ -547,7 +548,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
>   					subbuf_size, n_subbufs,
>   					&relay_callbacks, dev_priv);
>   	if (!guc_log_relay_chan) {
> -		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
> +		guc_err(guc, "Couldn't create relay channel for logging\n");
>   
>   		ret = -ENOMEM;
>   		return ret;
> @@ -596,9 +597,8 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
>   	}
>   
>   	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
> -		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
> -			 "guc_log_level", i915->params.guc_log_level,
> -			 "verbosity too high");
> +		guc_warn(guc, "Log verbosity param out of range: %d > %d!\n",
> +			 i915->params.guc_log_level, GUC_LOG_LEVEL_MAX);
>   		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
>   			IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) ?
>   			GUC_LOG_LEVEL_MAX : GUC_LOG_LEVEL_DISABLED;
> @@ -641,15 +641,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
>   	log->buf_addr = vaddr;
>   
>   	log->level = __get_default_log_level(log);
> -	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> -			 log->level, str_enabled_disabled(log->level),
> -			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> -			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
> +	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> +		log->level, str_enabled_disabled(log->level),
> +		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> +		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>   
>   	return 0;
>   
>   err:
> -	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
> +	guc_err(guc, "Failed to allocate or map log buffer %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   
> @@ -687,7 +687,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>   					     GUC_LOG_LEVEL_IS_ENABLED(level),
>   					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
>   	if (ret) {
> -		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
> +		guc_dbg(guc, "guc_log_control action failed %pe\n", ERR_PTR(ret));
>   		goto out_unlock;
>   	}
>   
> @@ -905,7 +905,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>   
>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>   	if (IS_ERR(map)) {
> -		DRM_DEBUG("Failed to pin object\n");
> +		guc_dbg(guc, "Failed to pin log object: %pe\n", map);
>   		drm_puts(p, "(log data unaccessible)\n");
>   		free_page((unsigned long)page);
>   		return PTR_ERR(map);

