Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65BA521200
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9553010F6A6;
	Tue, 10 May 2022 10:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D9210F6A6;
 Tue, 10 May 2022 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652177878; x=1683713878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IvF4fJ4Z5GRoss9Qm3yFsIx50GEaltIhGescmpoY6xU=;
 b=RFuEs/dnxbca8Yj+k4zqGwDJN2BMJvAUzwTN0xfpL76y+vSv0lqS0IhX
 L8LcVAmrZ4v6bYxQUtdFbOF0ad7iXNOQVfvPhhuCSMmOoPFa5+n4GP7zI
 G4KLJObwgy1KKLp/PnoBoMMx+VIO/go3Gtsvu1powx3JeCOhpLAI8Z7Ta
 0PN6F3DMMRzZ82oxMO/TGsqRJP5VeOd+D6lER9QVR4IoVeWT8uYmIWKur
 utrDqSD/bIPG7AosPkzIGk/3qmFZ83lHWo29BRt4VF2mB2IfOokvQ3tJf
 3W4k+Jv3XTAayCzDMDP2kbTuzMa+1Men23IJIqFlF0plWRXgbFJ5DlYBn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256866059"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="256866059"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="602392075"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2022 03:17:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 03:17:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 03:17:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 03:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghBls57rudY+L29IZOKRda9W5pSNbrD/LDQuho9f5cC1YgSY8OTZEXd+y2Yg+cn0AxEma1el0pzAxzd/oc2D/QsDWJKrkXt7fBtiUyC1aX/8j/W1B/UvcG1GH/u+4gQUI5O9kB7XvVpSwRB3uKsiwkWw5sQf/34KiQn3dNuu2N9RPEggBVSJcGs27AauXwY4+HW803zRQadZsAhBRGAJUUZ2brKw+7KXtgh2T8CZPyQY4DaCoaWtKoWEx0ioX/y0O0WCy/xhKLWgGM1veooUaigoYp0g9WXqFBfZUNm3qijMc/rpplAQtu2d4oEOwpyU4oTEoMMg4O2QJgC73HL4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gnpb17i1udG9XeeEOZQ0EKv2ZQk2Cs7tVDRIZHD2axY=;
 b=k1Lpx/Pc95Yi/Hs6o/efveJI9M4zAR0fhmd1z4SSPKMNhl48W8pukNmJ+AFSYjdISfqucdyTc7HwI2Q3UvZKbCK4qVy+kxo73E6Yh10j3UDQB9gU21xo59xBAPjesNjf1QwIKdoAmIjt27wmtQxaGnO/HeIqTrfpibjZ3irqCzDs/uU2dF4vSqLzqENbjUkgU1HghzdboxugGNs+G+VFrSs//k4T0sPpv+qR1QQ80SVewrgVksVMZR+9N24H9g1xAiZz97ehYBPFcMN93x2mheTuMjzUkrEamOk8V9UQ05vRCAmUpBYjPDVMXy1/s5/7vyoKrEdZcEgNU8Km1RQfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY4PR11MB1768.namprd11.prod.outlook.com (2603:10b6:903:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 10:17:55 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:17:55 +0000
Message-ID: <8c215ce5-cb96-c4cb-f4b7-b9f514f4a5f7@intel.com>
Date: Tue, 10 May 2022 15:47:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 20/25] drm/edid: add drm_edid helper for
 drm_detect_monitor_audio()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <ea33244c473ace1bc72a7e87f97580f00705a683.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ea33244c473ace1bc72a7e87f97580f00705a683.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7651c551-2b5d-47e5-30b1-08da326e5977
X-MS-TrafficTypeDiagnostic: CY4PR11MB1768:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB1768A938801AB75145A755EECEC99@CY4PR11MB1768.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lc0884Lr9w0lL3XvBPgjLUTr87QyFIFDFFaE465UWjCWEgsfdJzvVIC9Bwgso4vQiHevKq2QkSEa5BPJCi+e2Y/aA8IXCaI5L1L6Yr4v0doAQyVlUSgEiBqAgrcWhYiWBB1XRxGdWqJVrNPaBHpFxhIDEGOYj4Sp7QaukiQi5xrrpIFQGWI6MJgfRVwkc0sqi94AXSi+YteVSiqtFgZ8P45OP/sgDHt195oIuqcsxUNtrFhoFPStxyFv31knkezBgGqnj3BaqdQsFQSVFKSQ/W/SUErj33hVPZaVQDqGuaQjHWe2koGwOnPs+ESG8mAZGBbjBVyHGtBZF0wuzJn/tK+Y+ZRlaBEr68+Tn3SD/0Tfs/cnJo5M6aDICQQLQQj4pUP8GMzeJI/TTnicauMuq6AfqBFPI+5vlPUSJvjEyWrGnIJJumNNoEJYZHN5IMdioPNB2u2BHkW7a0V68JISLQMD7h2wwgOe79mEfdnUnCq0VH1AHh4uRi9gTf4ecU5ML1w12ZKp9R2a048DIi0kgjAPegHb+ISD152QxpY/8nz2GsqlO7C950Hfk0JLT2AcmEfbvV4BccnMENqL8RR+dWLhTA1eVUWGbME7pOiYilYUX/+RgF9LUuMFqtPsUSbp7b5vvUwcMZiokPjJsGOD+muuyji/eJvmKRLXcWLKS5DqBL+cTbWhTSGI9WAeGNAvecIqSYl4Ri8Jj27MVrYPaguz3uPfLkVane5c05dsD5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(508600001)(66946007)(8676002)(82960400001)(31696002)(66476007)(66556008)(86362001)(4326008)(450100002)(316002)(2616005)(6512007)(38100700002)(6666004)(31686004)(5660300002)(26005)(6506007)(55236004)(53546011)(186003)(2906002)(83380400001)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVJqQkdKcVh2Rm04VnlUajkrTTR3NUdKMTFXOUgvMkowTDRGUTU4VzNpbUFE?=
 =?utf-8?B?OURvcjF3NkRDSWlJbXJMN1YxRENhUFpONW1JUkRLQTZsOWpvZWp3WkUrWTMv?=
 =?utf-8?B?YjdMSmpsVE10UjJYeVlRMGpmd210QzFqSHM5ZGZnSEN0Z2grSWZEcUJ1ZUll?=
 =?utf-8?B?MVc5aVNIMVRBb1VpUHcxYy9ERzhCVm9PTGRmdllvWHZtZnJ6dHE4OU1CbzRD?=
 =?utf-8?B?dUNiZXoyaGc0YkZmOEVoOFdtZFB6eG5RQUluTUE3NkdXbGFhUHFuMU9SenBn?=
 =?utf-8?B?MFZEYUkxbkdFdHdXU2JHejBFZmNLVkczemhvMlM3T0o4NjR6TGZ2eVUveGZX?=
 =?utf-8?B?WGxkemxsdmlzbnlIZ0JZMkxGWXAzWWxIQkliRG4wWGQ5ck1GbHBod0czcnZG?=
 =?utf-8?B?VW9VdDEwaS9EcXZjQlpmczB2bVlEUytqL3ZBcGVaNWl6TUtWaExRYzBrN2lH?=
 =?utf-8?B?SzNJUWF1TDlrUWU0MU1LdHpBYUowWFlXOTF4YjVVVVFOdlFKUkJKM1NzL2Ja?=
 =?utf-8?B?ZVdnSHJZdkxxZkF3dUFHNmZ5QTJIck8yczBVdTdOTG9OMk10T1EzS1B1VlJX?=
 =?utf-8?B?bStwNHJQWndaQ0ZSUy9ZRGROSjBKcUpCOHBqK00yVWFZZytaWFBycjFUWits?=
 =?utf-8?B?ejZNSzdHZkxXWmx1cHlWdlozNFhZOGc0eDkwbTF3YmljQktGSEQzZm5MMVB6?=
 =?utf-8?B?R215SkNES3l5ZURRaFRLczRkYlpWU0FsN24rNnBoZXkySlFEK0NFbk9Bd0Fn?=
 =?utf-8?B?dE9mV1QwZFRjNUZnTElWemRnZWtqU2pQaHZaK3pXbUtwSmhFMFp5NzV6UWc3?=
 =?utf-8?B?RHVSdXhNZENETk03a3hrL2RSQmcxODdEd0RtV3BPaTgwYWFxc3l3MjRNdW5Z?=
 =?utf-8?B?eTlJVUtXUi9HSDNvWXpseXorOVFNTjVOUWJqQzRvMUdyVmoxVm82NnZNUTAx?=
 =?utf-8?B?Rml0MnRxZDBwZE1wMTVIODVqVU9UVCtWYVdqcnIvSldZRWxlekJtU1JHaDF1?=
 =?utf-8?B?NUNhdnZIQ1pQVDBTSjVuYWhqemQzWDJlNFNqRzlXTzR4NWlocU1NNnFDaU51?=
 =?utf-8?B?VUtrcnBteUVoUXJ5VGpacnN1RldnNkFtMjBERE1Xd1F4SGNOaXBWU0NHdmZX?=
 =?utf-8?B?U1lZekFsTWNsaWVGbEVYU2xhVTNCbXZSem01VnRaOU1EU3JVcnBaV29KZFNJ?=
 =?utf-8?B?T1ZMVFJkZFJjOHhlRWExblMxNHV4dmVnQXN5S1NCQjRZQXVxOXFvN3lzR1di?=
 =?utf-8?B?YkN1STFjOHFadytCRXBkQ05EeFdFNS9wdEVUclNzYVVEY0NpOW0zOWpXYkcy?=
 =?utf-8?B?b1I1eTB0MlZjcWtORHhTVTFMamtRaEk0RFk1RXRidE95ZTVUZU5HTDdLYzV6?=
 =?utf-8?B?ald1akpHelRPOHhVM1hVeVg4OGZuUDVhamloM0tKWlJWRDJheVQvTTlKRENL?=
 =?utf-8?B?aCt1Ti9OTkhwWnRlajN6STBDNVBjbGYyRnhmUjBhTE1CQVVxWnovZVRXSXRG?=
 =?utf-8?B?czBDTjIxZWcxRllsclpYcUNneTBHWGRZdE9nRmtGMzZXTlJGVm5DbWlvamhp?=
 =?utf-8?B?UkdCbnJRVHVGUGpaWVkwbjVsMm5PWnlsc3ZzR3ZrTzZMUXBhdVdpUFFqTk5Z?=
 =?utf-8?B?YXpiL3Q2SWVtMEtpUVFkT3NvN1BlRWpYSXFkQnMxNVhib01ZOWpzOGVJT1Vr?=
 =?utf-8?B?ZXUrbFlmbGdtMTZ2R0lnSDFzYStvcW52aGJMaWNERmZRZWZwNE9xM0xZTVJJ?=
 =?utf-8?B?S0lOejdxeVVocTAzNWhGQlpHQ2VxVXFiaUlXV0wvK2VsWHlsZzZRdjBtQzh2?=
 =?utf-8?B?S2FZd1VhdVdySUlwR29iZEJraERiU0hyQUx3V0hGbFpqeUN2SDUvZXhULzRH?=
 =?utf-8?B?cjBGcGcyYklPbWFrNDg1Z3ZzclVscVZMWFJteHViRFNFZXE0VldvaWYzMklJ?=
 =?utf-8?B?MHk4R0FzSUp6bGpkaE9KSjdXTytqQnVlTEtXdklaWmQ0UnRkK0N4WTRDWTla?=
 =?utf-8?B?Ri85V1VzaXdWVXUyZmZDNFRsTUwvV2NhanNHd0FQQ2FReEprYWtUN1BvU1BN?=
 =?utf-8?B?MVR2Q1JrQlZIWkRwQjFIMUxFdW9lT3kwSmh0VG9Nd0lyT2JYb3NiTmUvYjZU?=
 =?utf-8?B?cDdFTlJWRHZsenJOUDl3UDlYbStRZ2JXWHNRR0VYa2xOVHNDVHNhb2NlbXc2?=
 =?utf-8?B?UlIrOEpxQmtpNnpqNlhGdVMvaC9wcXRRN0V2S3FpMFZFM2gwc2FRdk83Tkt1?=
 =?utf-8?B?eEEwcEp6MmZGM1ZMQjhqTi9HcnFOSXNZb2h0MUwzN3hVV0xMeS9qZG52R2pE?=
 =?utf-8?B?MjZ1K1dlSlI0QmZVenk1UXR6NzlYV3VpZEViL0lrMnZmN0R6V2xkcndsWUtl?=
 =?utf-8?Q?nIV0rbelNZ5s0h8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7651c551-2b5d-47e5-30b1-08da326e5977
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:17:55.8089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o127dkrMOLtTc4wGlhibq9zcHeeRHVbzXQqLDItEZQqAvG3XpM9ow7qqYlPRQYh6XILdLkPSZaqos4/ISEA2NlUbBc6fzRSkcuj6kbJ1XHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1768
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> v2: Handle NULL EDID pointer (Ville, CI)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 37 ++++++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fc74159cd426..f072cfba9dd9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5154,19 +5154,7 @@ bool drm_detect_hdmi_monitor(const struct edid *edid)
>   }
>   EXPORT_SYMBOL(drm_detect_hdmi_monitor);
>   
> -/**
> - * drm_detect_monitor_audio - check monitor audio capability
> - * @edid: EDID block to scan
> - *
> - * Monitor should have CEA extension block.
> - * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
> - * audio' only. If there is any audio extension block and supported
> - * audio format, assume at least 'basic audio' support, even if 'basic
> - * audio' is not defined in EDID.
> - *
> - * Return: True if the monitor supports audio, false otherwise.
> - */
> -bool drm_detect_monitor_audio(const struct edid *edid)
> +static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
>   {
>   	struct drm_edid_iter edid_iter;
>   	const struct cea_db *db;
> @@ -5174,7 +5162,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
>   	const u8 *edid_ext;
>   	bool has_audio = false;
>   
> -	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &edid_iter);
>   	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>   		if (edid_ext[0] == CEA_EXT) {
>   			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
> @@ -5189,7 +5177,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
>   		goto end;
>   	}
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		if (cea_db_tag(db) == CTA_DB_AUDIO) {
>   			const u8 *data = cea_db_data(db);
> @@ -5207,6 +5195,25 @@ bool drm_detect_monitor_audio(const struct edid *edid)
>   end:
>   	return has_audio;
>   }
> +
> +/**
> + * drm_detect_monitor_audio - check monitor audio capability
> + * @edid: EDID block to scan
> + *
> + * Monitor should have CEA extension block.
> + * If monitor has 'basic audio', but no CEA audio blocks, it's 'basic
> + * audio' only. If there is any audio extension block and supported
> + * audio format, assume at least 'basic audio' support, even if 'basic
> + * audio' is not defined in EDID.
> + *
> + * Return: True if the monitor supports audio, false otherwise.
> + */
> +bool drm_detect_monitor_audio(const struct edid *edid)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return _drm_detect_monitor_audio(drm_edid_legacy_init(&drm_edid, edid));
> +}
>   EXPORT_SYMBOL(drm_detect_monitor_audio);
>   
>   
