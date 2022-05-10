Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39770520DD7
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3610E80A;
	Tue, 10 May 2022 06:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9069510E681;
 Tue, 10 May 2022 06:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652163849; x=1683699849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XQOlZSLNur3s78tJTcXsHYOMssuea8qUQ4MnR1TzQ/I=;
 b=LBlAy38aj8OObN5Ps/LMK4i2dpvcWiKierTvhQk9NezC/wehbC7ceDHG
 quy+AfCJ4Rdzh4FI1pFMdEX8AfC6yUPUD3sZahmWr1yt5Wz5HyO6a37BQ
 DzqdtQNJ3UKLiN9wdt8G9hBAOKEow6+w+jDyNrsia99DmHPW8XQ0CHIOR
 JFpG0+yrho61aJebCGUgxHEv/4JtbdhQcEUVfeww/9RObcN1AHIh0UV3+
 ZowF9t+iMnc8hp+6jTjhU5Bjth1gEB55wrzipj/+M/AMqa/JqKILzQiNV
 Y3sbOMb6vPfdRuxTAnW6WPdTEDfMgRqXNpAYWNE55l864SuBCKJBj8j5R A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251324168"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="251324168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="602318427"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 09 May 2022 23:24:09 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:24:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:24:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbUOjrBt4JwUAXILqH2FQI+A1OX8N7aEWcNz+5V6ZYiUtNTgDCvgkOF14XMDQGXFA8oFvVVezvIN5spH7r0jYm/FR4k3MolZsq/QvLO2h3rjWuwWxBi7BlkwZqMXEbMNtljLFgGHR2tjUYs8qfHcLbfcuurSjFpW6FjLyZ/YSTBIFi7ZQS9niPFuzqR5LeQyFIgwOIGYcukCF+3WUXpruZSuMtcbRb0gqO8H2cTEYTHZSGxiT3ff/79Wrbq765zO6kIALw9TDbsl86RP3/qN++fQmUzbPu3neNCoDLRO/UH1fvDNORaWhQlJG8kt0V7Vfh2ftsb+qnwT1A1GqLqnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SHowz3H/VLCD6ICfHccCvNH3/DKUswD6nS6EyBrf/w=;
 b=Iosjb3biAxZGmv9h1/1ibcB/FZEmz/OCmlyoDEgz3bq45U6nzXhFd9qrtVBtKrFaHZvDZJD9DN1uoODE5NmufqIh3ixzviiUz4RX7+s1/M5ehEkkpcGOGcVV2F4tbVsIFyJSh4pKZnXmU3E1V3/420joHmAau7mYzeYDQjA0h8QXIGhMRYlHU3hG/YgO2dsijGa0Yi8eTuwdBeOP77FHeHNbzGOsuxTN9R/NhHbrKVWlkt8Wr4lDTCeDMrMZiW6TppvElY7dA4lo6boo4ssq/DSpDa+KsbhVu+XGiWCBM4LdkMH55UFuTT4YmeIE0ccFFkFP8zFyWHNZWxN39z6c9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM6PR11MB3339.namprd11.prod.outlook.com (2603:10b6:5:57::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 06:24:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:24:06 +0000
Message-ID: <d93ffcc2-1984-fdde-0434-1fbd87546733@intel.com>
Date: Tue, 10 May 2022 11:53:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 04/25] drm/edid: start propagating drm_edid
 to lower levels
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <000452fddedbaf7f473ac25d4dde2502e60b8e39.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <000452fddedbaf7f473ac25d4dde2502e60b8e39.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf861c2-69ed-4aeb-e0f5-08da324daf82
X-MS-TrafficTypeDiagnostic: DM6PR11MB3339:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3339B1B2A47662FC234B4F5CCEC99@DM6PR11MB3339.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /VbtpQeMTAw9ZFDASRgEt/no5eKUaSGeumoonls1tagR88yQ+qHYcTMiuCnXSd/YQ0XwJQ5TGr5LdHHjP0QqD3zm5JBbhS7OUR8pUMrxpRtK7cEixRFNGdeEdj0vQBWL0DeCZSq5D/cW7ceX4OCNS/mgQ/VwUfuxvBnXMGzJCmpHkN0ISYQ6bufysCiRo7Y2pEVzMUuJzJPLjwBvGDKd8h7X3QacFj/+lOdQ9r5r7pxEQKTSDfUj8MqDMtbFjL3Phf6EIiL3hNc1YO2TigWTDX2yQRtpC4H4Bqi5Pr5lMi6rsZlVetxRbD12MDS6dWe3gw9ZoAacZc5Qxrg19GpX3F37bXM3W4ddwq/MXm1zJz88u5/ZrqDb7BTM9VJC4xDQAfCpJTeq7KLtiqExa+SHeNHgfmurFv9QQIJfJNX727DDF0xgSTk5pki4kc6/rnavaL+WMZgeSMC2uaOcw4+GBHyoio92tB8J6vdOexNYmaHYCW5vMubmJsXS1qL2yzYhPaIX6ggzCY5ZYnNCsjTwFn3P5JGzIxfyzzsEKAoiUOZmgtCbMluSmj1oIaSfUQPyzeUSN9yZKAi2V7/Rgs5z8y1+xxT4+B/4ZbMWjJu03/A24MHL6bWXqCiOF07Az/4/9dDF7BgaHE5qdbC+HDvOhvknvRd0nMiju/tMGr79LW9gUyAhCbnuGgEHKozZPX+Xb9Cjx0A5zG2FdOMKFvpeqZh0Fe/51SKDop1epQgWYVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(450100002)(55236004)(53546011)(31696002)(66946007)(6486002)(8936002)(508600001)(31686004)(4326008)(6666004)(8676002)(66476007)(66556008)(36756003)(38100700002)(316002)(186003)(6512007)(6506007)(86362001)(5660300002)(26005)(2906002)(82960400001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHlxZzRiQmFiaTNKUzkwSkNwSXZFdjd1UDdDUmJHbzZOSXVFaWpFVDdhT1BD?=
 =?utf-8?B?M3NPeXE4Um0ra3BVbm91cUxjZ0wvZDlQM09NampJNlhjU3NUL09HT01NZHE0?=
 =?utf-8?B?V3VBbmpVZUV4Snp1SkI2enZORC90Wm9JcWtKNFpOalJVN0gybFp5SmJxS3E2?=
 =?utf-8?B?WWVRR2JHVHFnQlAxSDdLdzMxTVlMQXlMQzhZQTljZVVYcEVIQ3FyYVViVnNM?=
 =?utf-8?B?V2xNNkJhZDZrOUtPMjRZSlBMcEp2WGpiaGEvYU1IRlgvVnBMWUhhYTdIL3RU?=
 =?utf-8?B?OWF6ZkRvanJBUEFnQVVVeTdBUSszMmgwZnhTaWs5eE1SM1J6T09YakRkRWJ6?=
 =?utf-8?B?QmdCM1prR0tyTUlIQlU1STFxbDhXMzJ1OEVlNFNpbXpQT0d2Q3B2elV3Q3NS?=
 =?utf-8?B?UlhweXRYZnhSLy9aWS9EVXNlejczN1g0d0hrOHgxVHFhMEpsdnI5NG1INDU3?=
 =?utf-8?B?N0xnOG1SYkhGNG5pT0RGS1kzYlVtYmFUUHFlWGRKUGFTRUJMR3Q3KzlnTE9P?=
 =?utf-8?B?LzdGZzZUSlNZcUdncXdKN0xkcFVaQUFzc1h6YXk1ZFVRZlExbk9kUHdLenhV?=
 =?utf-8?B?KytCMjh0WDBidUpnM2Q4MGhKaitWdFZYcWZqekZUUExUT2c1L1Q5WkV2TERX?=
 =?utf-8?B?Z2l5Um1sMStIbTVISHExVG5UVVBxUVlpemJaMDF4Y280WnA2RnVoeVU0U2hN?=
 =?utf-8?B?UXhpZXFjcW5iZkpzNEtTT2tWMlcwRXdPU0tuU3ZlNC9hNFR1RTdvVUNrQ21T?=
 =?utf-8?B?bFIvWDlrQzJFUVZVbVRTV2RrbVN4YXYzbXNGZEYxU3hXVUxpWVBXek0xaUw2?=
 =?utf-8?B?Z3M3UEhPdEJubmZqYkIzOXNlc1FUSFF6S21hNkdFWUt0aE5RSWExNitMZ2Jz?=
 =?utf-8?B?R0hYNEtMZlRVTlRUZ1VQdWd6cFNKSUswQThLUnJpczJ2RHhNSmtRNU5XMXM3?=
 =?utf-8?B?eHpzUDQyRkd1QXpGc0hsc01LdVkrVVM1TG5MdWZvMXVEbTk3aFUyZFNYZmF3?=
 =?utf-8?B?a2J6d2pzNTMwUDFuVktwNVFUcjR5MTZyS20wR0FvcjZmVkIxZFEzMmwzUUVG?=
 =?utf-8?B?Ly8vekJlQVp3MWV6WWtmbnNyOWIxWG11Q0NxZ1d0UHd6WTY0dzBnVGk2V2NE?=
 =?utf-8?B?cm1ObFpWRTBqaENROEVUU3hnRVlhK2JkcFBPSmJ4cFpHYXMzQ1ZCejllVmZO?=
 =?utf-8?B?SDluR2cvaXhPZzAyb1lUUzhUVVlBelYxUkM4Lzg2c0lmNTNDRTlzbFlWRVRz?=
 =?utf-8?B?bmUzUWhnUmhXY2FNZldzZ3JPbW1DdVI1TUpYR3pYNnBaTE1sZFVoT2hqdTVJ?=
 =?utf-8?B?UmtJanFkdStxS0FaNE9NVmFyNjhqK05jVTIyYWRZYmo4Z1NiSzJRekRkTmhJ?=
 =?utf-8?B?OFQySElhc2kwY2Z1ZllTb3RscW51SDM2Q2c5ZHpYVzZFejlDamZUQlBDUS9I?=
 =?utf-8?B?OWpXUURGTUc4ZGlWUFBPaEZBcHV3NVFBdmtHM3BMUmtBdVlRZWt1ZEVZWU4r?=
 =?utf-8?B?ZGoxRk9VaXNNbzFNUk5FYnd2a0F3WGZ5YnBSYnYvVytqKzhzOU52S1hDejg4?=
 =?utf-8?B?Y2JEY3NMQnh6eEZUS3A3TTFLVWpUSithSi9sZVF5RDltR0UzN3hCb1krUTBy?=
 =?utf-8?B?dHhwY2ZUQVU0bUhGaEhxdVFCU1VqR09rUmRNdEVRL2EzQ0RqM0Z6cHpIcE5R?=
 =?utf-8?B?bDdJOFhrWDVKbUVQd3dlcUpnMDIranZWUVArQUZhVG82Z2xMalNWT1d4NEZ2?=
 =?utf-8?B?em9udnVNZFB2bDNaTU12QUwrZFg5aWR0b3BKcUtBdHBPQ2pwdE1pYnJKbVE1?=
 =?utf-8?B?dGttdWxvVndtVHBkVGRmYm1QbEF0VUI4S0JydWFDaVlvMUl4OVp4K0VoS00v?=
 =?utf-8?B?eURXbk5ITVg1Vm9PVUVnZ2t5SktjRjNjM0hOT2ZmN3IxSlcxRVp5UWFpQVRB?=
 =?utf-8?B?VDdKTUhGOGhSK29xdE1LVkpwU2d3WENEdWw3MTFJcnY0dXFoV1NjRDRJNXRY?=
 =?utf-8?B?QUN5MUJHaldHcGNhMTV5ZzF5UUJpN3JjdHdGWUpwTWhpYU8zUmdnZTNJYndv?=
 =?utf-8?B?NmJobFIxeEw2RzlHRW1paG5pZkRNRXlzOXl6YnlKNHBMbWtUN2VhTk9CNW5m?=
 =?utf-8?B?b3ZVakpzRHc1T1Y5a1YrWEw4WmwrSmpNQTVZU1llSEtSVTZvN0NwSDIyUXRL?=
 =?utf-8?B?VS9Da1g4REZOZ0szQ2JNd05EREd6SWVDd3MwQVZoTUdHUnY3VysxaVFOSmFk?=
 =?utf-8?B?TFl6Q0p3aFphaGF3NlhOU1RpcGJDWlJHVWR0KzRrNWxLMnVwOW9XQjZQY1Bo?=
 =?utf-8?B?Z2pZSFBsVnNQc2Fhc2ZUcFhhMkx4OCt0U0ljck5hbmFMNmNtV2VXc2JUVzdH?=
 =?utf-8?Q?Y2GEVPdWi0ZnYcwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf861c2-69ed-4aeb-e0f5-08da324daf82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:24:06.8244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPe6YjwglqaLltYd/bBeg+Po9+6j4/lEcqzVKAnSVLGgLn7qq2O9NyiQTZj0d21ND/h38owFIzuHfGStwAHOKbyOetA9l4MKl654/UMH+jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3339
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
> We'll need to propagate drm_edid everywhere. This is a clunky start, but
> a start nonetheless. We'll eventually convert all of the EDID parsing to
> struct drm_edid.
>
> Initially, we'll just create the struct drm_edid in stack. This will be
> the compat layer for legacy struct edid code. In the future, we'll have
> EDID read return drm_edid objects.
>
> v2: Add legacy init helper.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 480fd9fbe412..f48f1f1a1fa7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1608,6 +1608,24 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
>   	return edid_block_data(edid, index + 1);
>   }
>   
> +/*
> + * Initializer helper for legacy interfaces, where we have no choice but to
> + * trust edid size. Not for general purpose use.
> + */
> +static const struct drm_edid *drm_edid_legacy_init(struct drm_edid *drm_edid,
> +						   const struct edid *edid)
> +{
> +	if (!edid)
> +		return NULL;
> +
> +	memset(drm_edid, 0, sizeof(*drm_edid));
> +
> +	drm_edid->edid = edid;
> +	drm_edid->size = edid_size(edid);
> +
> +	return drm_edid;
> +}
> +
>   /*
>    * EDID base and extension block iterator.
>    *
> @@ -5814,17 +5832,20 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>   }
>   
>   static int drm_edid_connector_update(struct drm_connector *connector,
> -				     const struct edid *edid)
> +				     const struct drm_edid *drm_edid)
>   {
> +	const struct edid *edid;
>   	int num_modes = 0;
>   	u32 quirks;
>   
> -	if (edid == NULL) {
> +	if (!drm_edid) {
>   		drm_reset_display_info(connector);
>   		clear_eld(connector);
>   		return 0;
>   	}
>   
> +	edid = drm_edid->edid;
> +
>   	/*
>   	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
>   	 * To avoid multiple parsing of same block, lets parse that map
> @@ -5890,13 +5911,16 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>    */
>   int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>   {
> +	struct drm_edid drm_edid;
> +
>   	if (edid && !drm_edid_is_valid(edid)) {
>   		drm_warn(connector->dev, "%s: EDID invalid.\n",
>   			 connector->name);
>   		edid = NULL;
>   	}
>   
> -	return drm_edid_connector_update(connector, edid);
> +	return drm_edid_connector_update(connector,
> +					 drm_edid_legacy_init(&drm_edid, edid));
>   }
>   EXPORT_SYMBOL(drm_add_edid_modes);
>   
