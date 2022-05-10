Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5FB5210E7
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656510E04F;
	Tue, 10 May 2022 09:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7B10E04F;
 Tue, 10 May 2022 09:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652175001; x=1683711001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4BFCPmUDniFtr5c3Fkh0+Zo2oHKn1te3OPflb2dEKLU=;
 b=ni7GaxjDGYwKmCyXFuC2/5yQNdrrBATdvkM8Zyt1mYhlZu2jdo/eccgM
 Ids95nUG6d+IR7gfL3QyUSmQslKGjohJNk9sHbgWkNJ8aPAO69PWWxtfE
 n4jU9J+lDpKQwoA7vCDDJhs0DodhnBKCZhdv1vEsgU/WTY5fgHFYMvKgm
 piEmql+RU4rWqJTt+nxIEoX0zXaNbHIe9wFce8l8jmgjJX8BzFuOWzyFn
 /tMrbyqIQKtqZeaKHb4ZBo7V4F0+XuTjI5m7x9inHLnhXkXniE7qey2nE
 RBpfjqWHbUelJNZ72QwWFancDXwO0SGsyh0gL7iTowbg25n4o/isGsvo8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256856754"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="256856754"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593408783"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2022 02:29:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:29:59 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:29:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:29:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=di6mda+A/QAO3l7uTgQAmb3LHUSZKZcvqGg1QO7mycIBc+rBH/ZN/X2U5ygnRArAnuwZJdRzg1/8rGb2Fl/8FpNXJ15yqKOGXvQB/FcFgCEGDW60SRWRMFr4kgxK20/QmxRVaOsAafqAnWG2hZRKc2947siwPtJRpVmS7PQUHftZg5EMJyK/gRnRB4+2sc/Irb7Oqvo55Ca+9WJIUdEq+bQ4NP+iMDnHpHBv2APcTNEIAI+/YBbVYLlSi4xr2X6vFci6mkxBoWSRonalRasPJa6xjjkXTtQMlV76LCBtAfjYuvqCwe6FbbqLFJFEAS8yWS/WY75gGPiIK3m25tuMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm9lltUQTERc0b4ya8x6PgJmfGyHJldnZ3n3PCmstlo=;
 b=GB3G8GtlYJm6zJVXioG29K6aqzBPGznqIK8Vw1sQYijA8racFvhs5wefymYGeSZwGn8A9ydHX0dyYSXO+stU9aZLwJ8fmx3ad9RF9lJ6tu3pZERxaap4XmsQjplaCP3wtlaWdmIhZKqC50ILP067hS7wyEAjS+4QXhCma/3arB0+Mlh5Qe9IbWLbh4ldPCwWt+L72QmwdI573j6MczBTpXJuUwJOHTxKIuDyMkxAYQgtfAGU+Nf63EcT0Jp9JRjaSNzeZ32fjblbq2VLGHzrAQhevOutPuY5g/PXPmD82Sb3CCote3krigztrvKRfXAIiDLN+BccYd15XUxuh4abWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN2PR11MB4287.namprd11.prod.outlook.com (2603:10b6:208:189::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 09:29:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:29:56 +0000
Message-ID: <98e1ca60-f66d-ac07-957e-21d62bd86e72@intel.com>
Date: Tue, 10 May 2022 14:59:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 15/25] drm/edid: convert get_monitor_name() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <c940aad14f323ef3a7907a0fb534011deb1589a9.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <c940aad14f323ef3a7907a0fb534011deb1589a9.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a83f8be3-f87a-4630-9aa7-08da3267a555
X-MS-TrafficTypeDiagnostic: MN2PR11MB4287:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4287AD2A948BA90D0FC37B55CEC99@MN2PR11MB4287.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwbEJlq6QRunfNUSwSfST1CNtCjYTxo4klESgpj5obAx3kZFcG7+m6F6s8eyDbcs47Sg4guEpQsXQQ3AWq7f+F6PmVopgCdyRSs9VXacw2rH5rU4W9lLAsnYe6xoP3XZdJs/K9G6V3FvcBPkjdIndZOB3MSQhl9HSmeSwSxJWEwFaWWA0A077xudMsPy+OCWV3U5q8PJDwB+ZYdmD4jz5kkZg6DVV7Ly3Shxk7p1Fa/JwEM3LRzgFT/RlCSKJ9wgSgGJBcOG8ye3jZchN/Act3PLVDO8F73TaforMTc6baUY9Gw43LPbqulwhCytJW82cLMBQFeioMzYs8LG5iL4KF3ES5Dx075xrXaOU9MUpYgd26q7AHA3Q8MNqUrylweZavClGlkb9Jn6o3amtLk+qazquT6gG8pYF/OC9WzC2VZiTE78bmdvj36ggIfZbuSSySK/MX/cXjqwDgzvUaDg8jONDGLNh47IcqmxJvYmJ+sUJsgD+iF28oRveFWDrpDtW7ec4mNiFHPUuvIcD1u3bubWWknXINSUIyxB6Q8c8JBTW3KgzrHSM5owyEyN/PHTJFFc1m8CNe/DAJf5PoRMJ9tz5E2bc8++M5jAtEKrYWBpakQ203Qc8DKgItC9+DoRrwZul+ImNsfM1SRywgSLuhzZRRHQEC6HgpGAaQD0kQWh73CAWta+8rgOlAhlhZpzF8zv0O7p9xlJanFTyOdf2RiywgnYsgpWXrbUBDeENBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(8936002)(38100700002)(5660300002)(316002)(66476007)(450100002)(66556008)(31686004)(36756003)(186003)(66946007)(6512007)(26005)(2616005)(82960400001)(31696002)(86362001)(4326008)(8676002)(2906002)(6666004)(83380400001)(6486002)(6506007)(53546011)(55236004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRlb0MwZ0FtK1k4R09WT2VGQ3lhV0toeCtVc1NFRFI3ODZMa0ZsRHVnU0JE?=
 =?utf-8?B?YktjMjJQMjRWOE5vYVV1UEVLWUhWdVBFOFQrUFZNcDUyQjdTclZmbG1vQUI1?=
 =?utf-8?B?OVRkdFdSWElpRXhYRGZPcE5ONGZ6bEdmaGxOM2Vzb0RENUJYR0d5MEozM01n?=
 =?utf-8?B?cW9iWC91bDJCeUloeWtqdjF6TXc3eWQ3QVdjUnpRK0wrcGI1dkZQODd1aFBG?=
 =?utf-8?B?WjRLekdPbURTRUhlMW9TMFhPUUJoU1pZdk1zaHdUV2NrNHJDSm5zNUpzZjgr?=
 =?utf-8?B?cEFIKzlJYm1PQ3ZTWnMwQmd1NnoxTUU2RTNIb1A0TVlrUlZWVElOL21CVUky?=
 =?utf-8?B?VkZOdjFLUEdYTU8vSGNNQnIwaW5WbTAyMGVtYU8zclE5aS9tNXVtS1RrbjRv?=
 =?utf-8?B?a2d3SHB0eTluUTcyaVlxWFVycHF6VGFYOTI0amxKVmNhcGZzZHo4UjR3Q3Nx?=
 =?utf-8?B?L1lSUzcwVDNKYWUyZzdrTVdCNGovYmc2KzBiYXVSODZKUlRrQ2pZVHk5Q1pV?=
 =?utf-8?B?Z1VJOTlxRWhaWGc3OUIyb2dEWHFQdllhMytXRWFya0Nad3VhUlgyUkR2dFQr?=
 =?utf-8?B?bVhzdW5nRTZCODNBWkwxOGtZeEVGWW45N2k0NnF6WUE2UzM5TWNsQ250a2Q4?=
 =?utf-8?B?Y0NwdlZlTXRNeDJYVUpxdWtQVXNrMFBvcFBvdWo3QStBSHNRVjA0TUdhRmFJ?=
 =?utf-8?B?aFhkMDRCNSsySlJSS1gwZVdqRUlZZ29jZVNXRDQzUDQzd0E4QjJsYmZXYU5J?=
 =?utf-8?B?T3dnV3dMd2o3eUhKanVyV2F3N0NLeGJLNndUR1ZHYnNlczZGaVRmRzVUOExv?=
 =?utf-8?B?WlJ2YS9qUEQ2ZnRPWHlmejU2VTllVzFBbXBZS1Z2WUJTQURiTUcrRlQxNTd3?=
 =?utf-8?B?YldoVmt2V25wOTRDQTZvWTdmUzlLUEt1MWt6QzVlcHF0YVJlU0R6RFVwYXl4?=
 =?utf-8?B?MjdTaWttS0RYL0Z6MENCYXFyczdxNk0rRWhkNmsrT2srdzFoeFNTV1dpUkF4?=
 =?utf-8?B?bHZaN2tHRzZ2cXl5TTgvOXQwQXYwN1hSTENrREMrT01jNVNiUzZxY0RyTmZK?=
 =?utf-8?B?WTJGNUNhTm9xMmp4UDdjU2xqR3RwOVJ0dmhiSHQ1L2RXQUhOSldNckFQTml5?=
 =?utf-8?B?RERTZ1ZycHBXaVBORkg0aGtkRU5ZMlQzalpJSmJydkprRU1zV2ZjM0x6UTBl?=
 =?utf-8?B?Z3k3eGxrVGd2UFA3SGZEMVdoSE9FUW5sVDZVN2xhQWw1clNOVmV4clZ5cVZo?=
 =?utf-8?B?UzE4cTRuYnVBSUY4OHc2SVJHdnBCT202a1FBSzk5cXZtZ3ZMNlZnbFBEWFll?=
 =?utf-8?B?WlpmOWI1bE1QbWVFWlZEdlErcklSZEtkOWQzcnowazJrbk5FU2NzM2tnNk83?=
 =?utf-8?B?VWN2K3hac2UzTW9lTHQrNmFFai9lZWxWeDk1VHVIN0gwaFFlSGxFQzViQmJM?=
 =?utf-8?B?Vk5kaEwwcUp5V2xhNWZhQVNSalNZRkNveUpGMlR5dllyVFlvbG9kZ09lSE9K?=
 =?utf-8?B?cU9iTyt4ZDYrVDJneVRuQWpnTTY1dmx3K0JHTnkyckVUaWpvSk42cXMrTTRu?=
 =?utf-8?B?bmhxd2pOOVF1Z0dPQTNKb092aTlmN3JkQ0tNSzhjOGFENHkxMElMTlVMMWR4?=
 =?utf-8?B?U3ovVkNOcTBTbm1Ya2daMUJ5NVd0TklBT2trUUZTSlh1d0pFeG85RkEveFdu?=
 =?utf-8?B?Zk9VRFdYYTZ4Q05OS1dpL3FvaTc4d2pscTdpZ2RlNzlxeHpIcytoeC9nenFp?=
 =?utf-8?B?RllLL2pIQjRMRVVNcSt3NnhwSE8zQ0xxNVduYzBJWFFEY1dwS2t1TFBzY2Qz?=
 =?utf-8?B?VmRBS2k4cE51VnF6eGtRVG9KMi9hQkx6RUVENGpVWDl0K3FmcDkwTnNZTWs4?=
 =?utf-8?B?c2FGamNXQ2Z6WUwzeXhMWnJYbzR2N3hSdFhNSFZXanQ3cUQ3U0VOdDMvWU94?=
 =?utf-8?B?N2xhQTZvOHdWY1RqY1JoYU5UOTlLejFpZlIvMi9ENHhxdEdTSlpSV1E2RWQv?=
 =?utf-8?B?bXpjaFBvbEJrOGxpTmN1V1YzeWYwVmkrZFZ6ZTNXakxJSTlraE50MTBITk5o?=
 =?utf-8?B?SU1IUHNmZXRTcmFaU09PZ1p4WTJYS3JDcGdEUzZnZDJndGJ4RXUxbWRvZGdt?=
 =?utf-8?B?M0hmdXJ4YThBVS9ZY3VGVFNndlova1lDTDh4b2F1UWR1MUtWbmJCNWR1OFRn?=
 =?utf-8?B?bzRpTU5zbFkrM2hRdWxQY3ZJU3BPRGpDQnNXcGUreVBzN2pTMlgrRENoODZY?=
 =?utf-8?B?cmR4RVFHbExuc0ZzTE5SUmIrNlUwM0YrdUpvbHFOWk5NWTJTdXVpZWFyOE9F?=
 =?utf-8?B?VllQZ3k3NnVwWXJYRWdoSFF0ZzFnUmVkdGFtS1BxOTZuVHQzSURjZjBsMDBK?=
 =?utf-8?Q?HotJ6gKYFFPKbWOM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a83f8be3-f87a-4630-9aa7-08da3267a555
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:29:56.6655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6Hlc/GSmva5UFxg4IfsoosOoRJ4ydTghNFuoIhcTJg/Dql5YWbgl+Nee16Gfwg8+2jjEZ151dGM6JvijkgBm3GgyGJ2+AI2Dafw6xYLWxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4287
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
> v2: Drop incorrect NULL name check (Dan Carpenter)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 364949e146a9..e3ff0f31a614 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4830,15 +4830,15 @@ monitor_name(const struct detailed_timing *timing, void *data)
>   	*res = timing->data.other_data.data.str.str;
>   }
>   
> -static int get_monitor_name(const struct edid *edid, char name[13])
> +static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
>   {
>   	const char *edid_name = NULL;
>   	int mnl;
>   
> -	if (!edid || !name)
> +	if (!drm_edid || !name)
>   		return 0;
>   
> -	drm_for_each_detailed_block(edid, monitor_name, &edid_name);
> +	drm_for_each_detailed_block(drm_edid->edid, monitor_name, &edid_name);
>   	for (mnl = 0; edid_name && mnl < 13; mnl++) {
>   		if (edid_name[mnl] == 0x0a)
>   			break;
> @@ -4858,14 +4858,22 @@ static int get_monitor_name(const struct edid *edid, char name[13])
>    */
>   void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
>   {
> -	int name_length;
> -	char buf[13];
> +	int name_length = 0;
>   
>   	if (bufsize <= 0)
>   		return;
>   
> -	name_length = min(get_monitor_name(edid, buf), bufsize - 1);
> -	memcpy(name, buf, name_length);
> +	if (edid) {
> +		char buf[13];
> +		struct drm_edid drm_edid = {
> +			.edid = edid,
> +			.size = edid_size(edid),
> +		};
> +
> +		name_length = min(get_monitor_name(&drm_edid, buf), bufsize - 1);
> +		memcpy(name, buf, name_length);
> +	}
> +
>   	name[name_length] = '\0';
>   }
>   EXPORT_SYMBOL(drm_edid_get_monitor_name);
> @@ -4905,7 +4913,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>   	if (!drm_edid)
>   		return;
>   
> -	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
> +	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
>   	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
>   
>   	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
