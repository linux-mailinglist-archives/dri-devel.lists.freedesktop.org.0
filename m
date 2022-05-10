Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D6520DDD
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FB910F039;
	Tue, 10 May 2022 06:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AAE10F037;
 Tue, 10 May 2022 06:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652164014; x=1683700014;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XGtNeD/iDUxUKqj9mupiKK0aas8KsN7smuJAPZeyJmk=;
 b=kHgfjK6MlkkQo7jPq6HGo74TKl4KIZwfY9PixmQ27y5MxTDrWsD5LPow
 OXNvSNq7PloEF//9q0ddTw0bEvD5lT/IgGN44LXKdMpw8wvj8Jep5kqlI
 e15PmXfFfUSD9wJ7hwuE3eowLIQx4RbFeGzf+cUSSFItQwrq5PmISciMq
 Fawrnq5GGAM3P/nxyHvyfiyuC8DsYaoGGIHvt9xw0amTZB6jgiOQf1xAi
 Y7+OUiH8F+4+nQnDJoNDIGsdRAEWu5t+6Z0vy10IXbaFbtfK9///oMe/6
 oc31eDQVZTuXXSHROoN/kkiniFJqjykXmphJSWcMG8fdmzcxbH4u6Qwzb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332314362"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="332314362"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="738533161"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 23:26:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:26:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:26:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/LFqL+9OjuQkOQ60bNecG9NqfEvKt5eJsdHzhyRrouTG6vzreVgwwSlhWO8xEPIU0f7m3CgZCYG1UMTQYtYNblJf8GHR4rSSS3bEmorRjhSSgqxshxgWRyA+AzwLy+IJs95ErlMBcJD8oIzQgweN0x4rW9uUjOcTTpPfOhdiPUZedi4XQYe/sLB/qjbwqTASvZdPHrS5H/ysPbzeaGOexUYB/3+P4dX1HEN8lAbb06pJusezEj1Px5NHXgPK6JT/sM7i7rIzBKiSm4TweAl9H5LGpAsOia9L9/0vvrK/zwciIM/oDpzDXZQNip3YGmRtnHBf0YBoH1icXUMYy0M3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDcSjRybR5eHojTKSpBdy5+ty6N4GKbzz8KjAJ6o0JA=;
 b=NUN/jgLrsFBKSRrJphKsEG7Pvv5aG+ZHsSaqpGOmXt72/Ym2C0t1HCt+x8gmS+/RN/CArR0AZSj9SlU9F3XH+FgByUnk5lgH+LdbUXIyro+/hRESvGSWH+xpvUHKSzIi6IVAhOGmGgBjjmSOan+jtiwKc1lB5uH0HCoXXfJ2Dzn2GlsApJTnTNFYEvf4YoY21yABoWEDkIk6U9wfk1VOYycbdqgKQgjQfb6JAI8PVhqyf7JZjwP6uRUVT0snLkwfVduQ7E8Mri8kWrlGaMV6LpZ7W1VW0GDKXIfkuGI9Q0VjAXGH/m/9AIMpn21pJQxS5qqq85C/tO67asU4DdcGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM6PR11MB3339.namprd11.prod.outlook.com (2603:10b6:5:57::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 06:26:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:26:47 +0000
Message-ID: <0d36849d-fb09-c507-894a-f5c5e5340997@intel.com>
Date: Tue, 10 May 2022 11:56:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 03/25] drm/edid: add struct drm_edid
 container
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <f3ecabd8a219aea678ad00f7bcdecf77b27b3c78.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <f3ecabd8a219aea678ad00f7bcdecf77b27b3c78.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 334f470b-c0f6-49d6-be05-08da324e0f1e
X-MS-TrafficTypeDiagnostic: DM6PR11MB3339:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB333949863E7E50C78676180ECEC99@DM6PR11MB3339.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V830799ewyNd/dk+dFuJwYhiBwVcHJL/oFQAW3OFs+H/OXzJrXivW0vYfoPjxlRfzzjBre1iuXxM4t5vyzvivJJxRWhDL5esKrQeeC0b/4WG9o1J7/lge7JzcOJG4VSQBIe+3h8Aw5QhSJh069tXAz23BUvbq002NDJzh6vuWyVNmxEVwwNAtc5BEfUzXp2sZDHHW7gQRzTNlQmfpLYVpbBTuB9mVsXbzgQweQ7L2Fr0KCv9H8T8eMfFemM8FjhGr+2MOowGa27iptsSRXZbP68ee1I1JrZHpkhHp2j8JrRQJoDi/6wdMASorY9LXojBfuUgj2HRmVvmPg91doRP9PsFKKIHuz24pbK9K4iD0P2CuU+i/qQLQb2UTbuLV2L0c8NPBnCMPzrc5L7gZ0DTov8JOrJscD0O2FDW3rUiA5mh1/TIwdaW3GZOcCvIn1GFl5slEryl3Wpv1La2LYeEP3KdvVBslwSZvbhNlrnD9mLCPZgqnav4avFwdKbWSv1k+PtS7Lwb955EknkZTTuAcIfu5v8ePKz/HqdnttNGLGH3zSDy1je26pCpPtLwIXR3evNDeZobmYFRvE82RUPnINSi0OeT5CC2Y5KY3aZSgv1npDZGBEqinJQFtFCRC38o1ut2ikx5EsrxFLgLTiwo5CinpCtmRYLhCmgecePAuKerp6aZZZpVoYVOOTD0yHCGWWZWz8vOo5ckBvUicidmit6jShdPgPbpYEmDA67hDSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(450100002)(55236004)(53546011)(31696002)(66946007)(6486002)(8936002)(508600001)(31686004)(4326008)(6666004)(8676002)(66476007)(66556008)(36756003)(38100700002)(316002)(186003)(6512007)(6506007)(86362001)(5660300002)(26005)(2906002)(82960400001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJjWGh1OXBsa01IdGwrWitvZE9oRVJZNDRYSVgrY1NYdFlwTjRqanlxN0pz?=
 =?utf-8?B?QjVjbFJhMFBPazRSZXlkUjF5L2oyVjhlNlZlcHU1VWRoNTZTM3lVTDlqTlVY?=
 =?utf-8?B?UFNNVjdOY1Ird3U3UlhGeXovM0dRMnRIUGRWdVlBaEgrVmE5eTRZdEQwV05t?=
 =?utf-8?B?Tm9HcGNaNnFLTXdoRkk2akJtaFQ1OWI2ekpFcGFUcGJmYlVPdS9LU2VwVmtR?=
 =?utf-8?B?OVc4Rks0dE9ha1NheFE1K0grR2JnSmlSK1FsWDZZdEpMaGxHdzBHcUZOdE5r?=
 =?utf-8?B?SDNVU1ZjZ0FPanNsNGc1cDNxdkxCS2dHWnJnK3lQQ25nQ2hEdElzdzdBSnhF?=
 =?utf-8?B?bVhqMmY5Q1lvRENGd0hNUHdsZFZaMHBBNUcxZURiM1BIdXJuSytMTHUyV01B?=
 =?utf-8?B?cnBiUlN6cUJsMHJyNzNyL1JTNnYrcnVwL3hFa2dHZkhBL3BWTFNDU0xHOG9L?=
 =?utf-8?B?U0F4aVlSMmg5OEF3cm15cUd2WHZlUXlOV3pEREVUMm5FSWJLOEoxeW9ITTRD?=
 =?utf-8?B?WTMwWkkrNGdnZEF3NHBSbGJCMUkxT1l0bTR0YzhUS0xsdXppajVZbTNzdE8x?=
 =?utf-8?B?YlFJNXYyakl2aXVBaVdNVG83cGMyd2JtcjFpQTVnS2ZHbldGYmk1dFkrWGo1?=
 =?utf-8?B?OWV4cUtiUXBJT2dZT0hpN2owcEZCSHBrWHQ2b0hDTCtNS2hkQ3Y3SnRhRWN0?=
 =?utf-8?B?a3ZEY1p5NmdnaTZMUmE0ZUluZ2tXSHQ1dE9obFduRFRyZWpMWW9jams1N2ta?=
 =?utf-8?B?bFl4Zm1EeG1uWjRIekM0U2twY2RxNHpuWG5rLzhmbkh6RDVmRk5uUjFlUHFY?=
 =?utf-8?B?Rk9UeWlMb1FXRzlzeWlDT29GV2tYemdxUVNuL0l2V21GME5kQTRMa2Rzc2tN?=
 =?utf-8?B?SHVSL25PU2VreDZDU1lubTZLc3pHakZaS2dUeTUwMFNHb0t3VVFOeU1zeDVH?=
 =?utf-8?B?dlp2ajB0VzB0OWMvejViSExYblpsdUFWMWZKVW1ZbElFVXBhbTgwUnF5WHNE?=
 =?utf-8?B?S1ROOFBIM1lYRWh5VWRRRmI3WjBiRHFWWDlOYlZrK0xSSFhjY1JTK2V6VEZq?=
 =?utf-8?B?anZHeDBkV1EyTWpmR3V0aiszTXoxN1k3NEhreTZEakJSWHpDdTQwTDVJbXNU?=
 =?utf-8?B?UGtYLzhwYklhVy9oV1FDTmpRYnRPbGExdnN1alVWWW5VeE83d3FVQ0NmODRE?=
 =?utf-8?B?ekhPaVBqR2t1WEU0QmZURVVSQk43VmRDSUhONXFtdFQ5d21ReUdaZWJJdTlZ?=
 =?utf-8?B?NXNrZGc3RHJGQUFnR1pGYzltUzBDNFhaQS9vTTJtY2FiSjZpNWkrODArSVRw?=
 =?utf-8?B?UDNaK0lrbTJmTzhkQ1VSSHQ1czQvY2l1ZlpQZGUxb3lZVFgyT2N0NlIyWHhK?=
 =?utf-8?B?c2ZGV3BlNVVtQzR4R2NidXE2N3VLUDN2Q3pLMU1CT3RpcThSZXVuSzNZR2M2?=
 =?utf-8?B?K0JhejYvK28zK2ozYW9ibk1yeVI4bkI3OFRXWEozQjRPR0tZZXNrajB0b0w0?=
 =?utf-8?B?TXpOMkV6NTVFRmFlanlSK1VNZXhpSGZ3ZEw5dGxQLzFBUURuTkswZXpuUlh5?=
 =?utf-8?B?eTFseVFuU1lDdEZxQXFZcmplYXFnM2cyVDlKbWJ3RTBZakkybEJxcXpueGxN?=
 =?utf-8?B?cHlaQUs0b0RSOHZHWjZSbStqS2lRN0VMZjVtc2lTSzNhZGxWS1ovcVZCT2Vh?=
 =?utf-8?B?eVcyaitvejg3NXg1WWg3TEE2akZVRGR3TTV5MXpzOFdDbnRuM29jcWFQZ2k0?=
 =?utf-8?B?TWxvUksyTUxRZE9qWndJdE1pTWFsWnIyMkl3SnN2L3hnMHV4eVQ4UWJXS0VO?=
 =?utf-8?B?c050KzQrYlRCVDU2eUExSE44NUVMMFozSVBhVlhydmVDQ2tOZUd1dW9zd0hO?=
 =?utf-8?B?MmFCQi96TmtYWCt1eENiRXNkM2dCRVljcVRvV2d1KzhKYVc2YU0xL0tyMDBM?=
 =?utf-8?B?NHgwOWxCdklKMVZCU1pyR0J4SlpwbjRkSmo4ZW1yTkRLUXlZdEIwNmlseklN?=
 =?utf-8?B?OHRML1c5MWc5OHVZcHpGR3ppZCtSZ1FPZXBKMTIxeEVpZVdwc0pXK3dvUktM?=
 =?utf-8?B?Z3lyaUorbUExa1NVbUpmL0RvbXZtTUlZMGFXT1kvazBmZTBSdXR1Y2JtTWhU?=
 =?utf-8?B?RDdlMzV4QU5zcXMrbDJtV251dmxKRnhvTnFQRkdkRHY4RFd1Vk0vMksrRDVC?=
 =?utf-8?B?dGdvOFgzSVlyUVBQUXpnK0FiTWRXSlFPeVJWcmdDbVBmYjNuemtTOXpZZDdh?=
 =?utf-8?B?U29iZ3h1bm50TWk3SVQ3QzhMdGsremQyL0hJOGNqMkdRVTNYcmg0dFhmdXA3?=
 =?utf-8?B?R3NyQzNGZ2hHNWNKNkFFeEk2OGUvYW1aTVZNa2dMc0hQMW5NdkUvaFJzSFV1?=
 =?utf-8?Q?vwsZfh1kFKHglpc8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 334f470b-c0f6-49d6-be05-08da324e0f1e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:26:47.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVG/NYsW2vVda4pWx0yhBNg/APkebtNF9E5Yng7YvCoMLfu13zN+l5zezun1x3oxILfyGiDGj2peFNpCJbc3Tv+vXylAb6sLcTrX9eESySw=
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
> Introduce new opaque type struct drm_edid to encapsulate the EDID data
> and the size allocated for it. The contents will be private to
> drm_edid.c.
>
> There are a number of reasons for adding a container around struct edid:
>
> * struct edid is a raw blob pointer to data that usually originates
>    outside of the kernel. Its size is contained within the structure.
>
> * There's no way to attach meta information (such as allocated memory
>    size) to struct edid.
>
> * Validation of the EDID blob and its size become crucial, and it's
>    spread all over the subsystem, with varying levels of accuracy.
>
> * HDMI Forum has introduced an HF-EEODB extension that defines an
>    override EDID size within an EDID extension. The size allocated for an
>    EDID depends on whether the allocator understands the HF-EEODB
>    extension. Given a struct edid *, it's impossible to know how much
>    memory was actually allocated for it.
>
> There are also some reasons for making the container type struct
> drm_edid opaque and private to drm_edid.c:
>
> * Have only one place for creating and parsing the EDID, to avoid
>    duplicating bugs.
>
> * Prepare for reading a pure DisplayID 2.0 from its own DDC address, and
>    adding it within the same struct drm_edid container, transparently,
>    and for all drivers.
>
> * With the idea that the drm_edid objects are immutable during their
>    lifetimes, it will be possible to refcount them and reduce EDID
>    copying everywhere (this is left for future work).
>
> Initially, just add the type. In follow-up, we'll start converting the
> guts of drm_edid.c to use it, and finally add interfaces around it.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index dcef92c8887a..480fd9fbe412 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1567,6 +1567,15 @@ static const struct drm_display_mode edid_4k_modes[] = {
>   
>   /*** DDC fetch and block validation ***/
>   
> +/*
> + * The opaque EDID type, internal to drm_edid.c.
> + */
> +struct drm_edid {
> +	/* Size allocated for edid */
> +	size_t size;
> +	const struct edid *edid;
> +};
> +
>   static int edid_extension_block_count(const struct edid *edid)
>   {
>   	return edid->extensions;
