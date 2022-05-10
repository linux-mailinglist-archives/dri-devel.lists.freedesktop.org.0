Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F56520DA3
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240AF10F120;
	Tue, 10 May 2022 06:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FA210F11B;
 Tue, 10 May 2022 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652163048; x=1683699048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=05Zf7SM1ZsN6UvYN6QyBrRc+373bsSvMNjRUtWoLtZo=;
 b=Uu1bahOhRVTyEY8Jml9B1VbaPaUZMtU8bomCSLGKAWy9dpMCFESRU4TM
 uMo/cAy+/GcPsA8R/BDZbkDIGAHHGPbLiq6NjFGf7ZmmNo7o3J7OJ2wES
 lGeZ1jZULluL2BCD8Q85DI6uqNNkIs1bNX4cRlOezdLrUSutdNSWnLnqV
 +p93ZGEOdwtzoMcE/lCZCvwXSReSms1nD+BctodMrX8myDrIjQeXNiuWG
 ica1suttdMh5iOnbcJvamenEOE7Tu8pWbun7hQe3bbNosQCK4UgW724Nv
 KQKX//F8zwcCVfNSirVg3Cxks1CRd+pp4UzGcP52QaZyZ8f41JT8a/d55 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251320196"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="251320196"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="593318140"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2022 23:10:47 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:10:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:10:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYPy+UaeDeQneWH/RQT0gVuuTXxlQmPWsdlsQyXoGFSm3k6hQADLYRG/0rL21ZkkadA0bUZgwM8DffpJavoI2KBZCG384arS8ZFqyqwUp7YziI7N1Kh0ElndLEQvFowkgxb965+2TSjadO3l4xBdplMpAfZfwvAvk9l8zTo7UK0sAO4EuLTMm9F7rf5Ff/cKg52PAQ8XZRlz+4peSi+f3WvlrNpvRV5bmMLDscLbvajgQh2AGdOuNXGVh4K6AlRg0zUKdDNWwI2469gvLDhK9omuCND37kEHpwxXAk3JvPmKd4dMxbN1SvmuBVq/kY7Ewmgbp3bQxyJkC25pnhDkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/ZxuTrrbOupogN2/XEpTclM1ZK/gW8+9oM/ksFej6o=;
 b=EVnlVH/nwniNwphbbHyQWFD5BvKsLKQ0rrxazd4HUeYQa3EdYRCWZYVIZPYhcfo+O/+l7QDHDJoLDCsS1FHR+qVu3KIO+YAnCHueoXoj6vsTM3F3RSntYS3+rQd/yaNBL/dZBEc49A2UFNabM688fMJ66WEYd4ZgS2n1zKZ5Yi/E1fUVikOszkwh4cBWqwcTackXG5UlIUdCviHRq45TgEDsFqfXCGWeQpbHAUzAzabMDY2sd3110vX5reXqakNAz5JSCEjW9n9lZ8AM9Q3mFhm5ne3zMIue7iNb3UsuYa8Iyo2fJhmwKtam60pNdhdX4U1CYMLnDq21AMsyshB4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MWHPR11MB1519.namprd11.prod.outlook.com (2603:10b6:301:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 06:10:45 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:10:45 +0000
Message-ID: <cd7d30ac-c833-263a-72b4-7eac3f8f0026@intel.com>
Date: Tue, 10 May 2022 11:40:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 03/25] drm/edid: add struct drm_edid container
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1651830938.git.jani.nikula@intel.com>
 <263c5eea832947e740cc73b8bb187b91a3f1b79e.1651830938.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <263c5eea832947e740cc73b8bb187b91a3f1b79e.1651830938.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c248df8-06a8-4dd4-d714-08da324bd1a9
X-MS-TrafficTypeDiagnostic: MWHPR11MB1519:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB1519576D968E060B871BF48FCEC99@MWHPR11MB1519.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4a2ryL8PvbEJ5ysO04Ab6Oz+qpw71rGxTKVvzKGQwZ9Dk4PyYrdvtGKsP4DtEPf8g0QCrCKVC+FK/aVtwr3/wBW+hIXtS7QubcxKcQH6i6e8L9iqzZsy2uZ+iPcFr7zdfvyPnyMzr4fM7lkYI6celFXSJBHRUq8O0HMyGxZx+EPgQVqIYyNFlCrE1/I3ZY5toL9AEFY5CssfYinBQ9eNMSCGp8GraM4sQNTmCrMWkB1lERo4x8jyt6U1dF+2JqBohFLYQdLJjd7I2o6cHzG6/Ff4AeaQzC+eoEa84KRXwyQBdnbzfxZdAXW1O/xwz9IQ7Hpuj5h1/jiA8SvqJ038qE4jWCBe9Obo61cbibU15nupuMPpbNec0Cj5vLK+RficLzpqaFXuTvSMcOGP155gff4p1UVZqpqtB/W2yuQZAsKHE1vxhjefirezo11PWKA7RDQvtdi4RNjwpMSwp6MwXTaeicKWyLKCwPHbNpM9Rlj86M7fkAyVc63J4zVu3LLqK0n8L+FHunwyNf50ZoMBmCb7oGBdQcqAFZvpwcZ4LO0i9sf+H7yHknhwWCUUdskHpdqy+iz6rVcbutju1YKN7I+Bgyn9K3hs5o1ZkJKkxi7qATeLvdwAeHbbzIih+bF2SGwhmHTK9Dcjj7Plv3dAE4tgxpjEUxNyRHUaHa0rXJxNqIH6crGSPqJOiyE1xjdEIe2ENObsxXDCEeXHGF6ackmatzM+46XlJ7ubAoMGFJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(66556008)(4326008)(2906002)(55236004)(53546011)(38100700002)(31686004)(8676002)(6506007)(186003)(450100002)(31696002)(2616005)(6486002)(82960400001)(83380400001)(36756003)(6666004)(8936002)(316002)(26005)(508600001)(5660300002)(6512007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1EM0U1M21qem1MRmR3ak9UemN2Z25HS3ZCQ2RKVGNpeXdUWnNYck55M1Vk?=
 =?utf-8?B?ZmJ0UGFBUU5jVGlxY0o5a1h0NFJPNitWTkFYbkdEaXZKVmpXTUNqTFFUWit0?=
 =?utf-8?B?eEpsSWVQdFRzejlYMkZJMUYxckdiYjdSVjlYd1h3bGs1WHQxSEJxd1hNYmlo?=
 =?utf-8?B?ZzNIdS9seDlxM3hBaGo1cmVvUmdlVXh1NUpDUGlGMFlwREhBa3NDZ01BM3ky?=
 =?utf-8?B?Q1l0aTZNN0Z1NXZRaTh2cU1xM1NKRE1sNXhYNzZwWkZzYVBYSjhkL3ZBVldz?=
 =?utf-8?B?UVhlRU5DQXZMdkpUUEhhL1hQUGVlczMrU1k0cVdOMERIWVBsa25jdlB3eit1?=
 =?utf-8?B?SXMwRU5wMVRlcURIT3VjRDhHd0ZHOC85UHVFRVBxdzM5cGlpMk5uc0ZBeU44?=
 =?utf-8?B?OHNpT05sS21hbkJYNW9QUndqRWNRUTlrMXU2Nlk1RDRlOTdtNUhxM1J2ZnRp?=
 =?utf-8?B?ZUI5R0xwbjI2N05XcDJHYjh0U3E3QzZWWkZkcU5sY0VKbS9NdW9oUzM1L1Y2?=
 =?utf-8?B?cmdBb0Rqbm9CQWgyNnEvaWFVODVnU3Y1cEswQjFrU0szWC9XQlliaUhrUnVa?=
 =?utf-8?B?Y1BGRTlaWGoyQThvUFpnSVRxcytOMXNZTFU0QzdMWVlxNmVHUGZIQzNtdW1p?=
 =?utf-8?B?UStYaC9zSGROTXBnQWJQdGI2UUdUblRtR3p2N0FDQlUyQ1dqMjZEV1RlU2pW?=
 =?utf-8?B?TC9IRE5kNDBTTU5SNm8zdnpiWUJjbmJ6OC9KU0doc3pYdnhsQWRyL0Nzc2pW?=
 =?utf-8?B?ditzKzJ4WU5pVEpGVm9IbTBSUjBvMnRDOGJJVnlieW8yV21Bc3pDck4zWWJp?=
 =?utf-8?B?eVN6bXlUWkZmVDJwd1duWENDZ0ZEaCt1cjVrcDFBQ1pIdWYzemJJSjlZN2lN?=
 =?utf-8?B?RVJJLzA5N04wZWdTdXg1eWRXWEtUbm9ma1ArMmhCUkZKQU5qMGxLU1R1Q0dy?=
 =?utf-8?B?Tm5xc2xYeWpoUXJKVjJsM3ZPTWx2RjB1VldOZ2x1YVJYdHdyZ1IzYStGektp?=
 =?utf-8?B?UU1vYVNvNVNPY3hlUFBsbDdDREIvZFhFOU05YVhiVS9ETElWZUg0dnJHYzlt?=
 =?utf-8?B?ODZVQ28yaUh5MGtlcnZaeFFzZ1c3V2dTWHN6N3QvdkdYUzNnMU5ESFQvTjNl?=
 =?utf-8?B?VU5UZHd1SFhIaWJaZHovd2dZUVZsNkQxd2p2K1UyeUhkdnpCT0U1N1hLTzNK?=
 =?utf-8?B?T2wvWVkxWEx6eUdBdzJWZGs2SGRZYzVsZ1RPcXNTcHhocWNjQUN4VGMxTmd6?=
 =?utf-8?B?MkpLVU5iV1UzdGJsZmJBeWY2S3B4VG9qbmUveDh3T3FyTThrcTJ4bldkTzRS?=
 =?utf-8?B?NUtMWFpjeHMrNGFQb1VwaEg4SThhRndVWWRNOXQ0dmpGeUhjQnBHN3hJeVRX?=
 =?utf-8?B?WkFDRUtSVGVpOUNWMW1QbGQ3OEF5Mm54cDZseGhJdkJtOE9KRXJqemxaZEh5?=
 =?utf-8?B?UFBWcFNoQTFUTzkwUXBEaVg3aGZLT3haY2pRN1pRd0NMUUxOblpUZWZ0aVIv?=
 =?utf-8?B?VEZ0Q1lZaW9JWHNSUllWR1YraUtLSFdudVlwaktmV04vdE0xVThQWHNBRDZi?=
 =?utf-8?B?eFcxREphYi9ZYmNDNzB2UzVWQTY2SXM4Y1N2dWs5QkRoQlRldDRPZ2NUcXgr?=
 =?utf-8?B?MHVOOGo2eEM2ZGxwOWxQUkxVNnJCUjRlOFhzdXllZjZlQi9mSC9PM2xKd092?=
 =?utf-8?B?WG92b2pQaGRpRzJsV0pZM3VaVzA2M0srOUREZXI3SkVobElmV0pNcm9DS0dt?=
 =?utf-8?B?UWR0ckNzQjFTNVJCcmVEVXB2UWwxS3N0ZmJBMjV2djB0UkI0UUdTV2E2dDl5?=
 =?utf-8?B?V1lYNzBBS01BdFBtQnh2WXZaNzlVZ0ZHR0dWeTc1eEtmSWt4VFlvOEZxK1A4?=
 =?utf-8?B?ZVptdWJQTkhuZTBLVW9rYTl0M3g0ME5NUzFWcDhpZkFRakp3UUhXY1Vxem9m?=
 =?utf-8?B?ZWRsb0E4UHY5S2htQjIraXR3SW90M2NCZHZNOVBicEhIUXFTR21FcmlkMG5H?=
 =?utf-8?B?V1VSWTNCSjNreVdkdUZhb3BvaFFKRkFCdW5reFVhK244QktMS2tBUSs0Nnk2?=
 =?utf-8?B?dEpYaVBBZTNWQ2c5d1FkTldybkZEQWFKWFJxdUFLbHhQTE5YaW5pK0ZPT2pZ?=
 =?utf-8?B?RGdBdTNFcWhkOWpITVNTY1VpUCttK1J6cDNreGdYbmV5aEUrdXRQQThBL0xS?=
 =?utf-8?B?clBJU3V5YVpOakhnUHNGNUdzMzhjT0VaVG5jeE5oVERuVUdWc0F3VUV4cUZy?=
 =?utf-8?B?MTQzcCtTY2F3T1diWnltYldIbE5oV2VvamlCRWxIb3piQjNWbnhzR1BoMXcv?=
 =?utf-8?B?MXVxWjJJdzFTaHVjS25OcXRVcG9kOEY0dmRqWVdMbmN3LzVKdVA5TFJzRHI3?=
 =?utf-8?Q?iZoRjl/CWZn4bO+E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c248df8-06a8-4dd4-d714-08da324bd1a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:10:45.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu+Envehy611bsTsS1hjMTC78EcN/qjw4dBHtqjA5xUpFMDq3GxX8NeKEPbhHNn8uqV/+geQQGoa9E3r1mI355zRUchodkN1FMUC5Ar9NAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1519
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

On 5/6/2022 3:40 PM, Jani Nikula wrote:
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
