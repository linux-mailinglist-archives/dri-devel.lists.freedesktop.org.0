Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BD52137E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EC10F58D;
	Tue, 10 May 2022 11:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648B10F58D;
 Tue, 10 May 2022 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652181551; x=1683717551;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=g2S/KgPV0cKjLhSxPYXySL1uXn27JwfjupgQRZbqQmo=;
 b=fXQo6+BOKFVJVXKWbaahAEUbnhqv9ruIYbL4YOQFCVIwbZOAXdD1q7L7
 K40ll06e5p2MzdCzPBNX8KZJo4+q7e2+NDuuCs2AE6WPL+dOaoeJua7Rr
 PkijKJFDER77LaW0OEbJKOTobA3jaOhPkw0ZcATrp1Gg4+0VD4XlZNXNW
 ktBWSFOCFvR1vjPvpo4XWZbjN2sRHsm7fDRoWB7h8BNEa1lqggISvn9OT
 VEt8gF8+8UuNQSs+oH9tbUt4uJUJwNohfksdRENq49Yttgd2dkIWpGgY3
 Q/VbQUkusDYd1AU2E+nglfbdwsQKyso/kGqpE6M2Z5vGRzsaoPZoTsGBT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355768667"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="355768667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 04:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="570633455"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2022 04:19:10 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 04:19:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 04:19:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 04:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/zZ6jneTQjumks1umWzq/d1sIh5kN4x+mbQYzdBKQlUVLvEKjUss3p2OKthjPdzYAZ/Om1VvaGf5RZBE99+bK3wrrbccnCXTEA0YV/tw3jbE9dDsZJPWODFKzOa7EOK48FfCiEsd6ZjHIkza5hZehqRm4tYKPVs22mRj0XnQrqyt71B9VzU1pTzNxOb7Ko9xTVzhFaho1OSBeLXNkt2PsxgyVXVRxYqo9YFxmNokgJ82m9jYi23V2Q3xXPgcFadUYNrHFC8TpfqmzYPUSo+VDM9vVwJorQ0pYWImAvNk6UHaUe0StT6PiId724KIB1rbmJDQgURP6tXlIh/fpLTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9IZdbgkQseURzqFi9gds77COS7/vpLQoWvCdwEsMDk=;
 b=bl6ZVSvriob5vUuecZOLTUCz7QCLYqyDpRKaBUov84EvwilDt6L2uOg4q+4y3J4S79ueQI3bw4HbwQCIEDYZL5Oh6S9nXJuzzjBPfPagOo4V/M5DGpS/SxmJKpOek4Bhk++uZ1PPUzIEGUyBjUWzUeXh7tKd74ol0vxpeFOdZttW80upPTqIFEWBnckm3urhWa2GXp+MugfkE0cSrIC9kVe9XkRHqmB34mHTwBUfQqa8SWXS0Y+VxJ1WCgojb75phoCvIu9qMmHMZyHpnhNPOBzCKfi/QVup1TjdYa7qIypq3J2mXTPQ2DosLrO/tKXAtSJx4ryVU00oBwXiSA6wWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BN8PR11MB3649.namprd11.prod.outlook.com (2603:10b6:408:84::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Tue, 10 May 2022 11:19:06 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%9]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:19:06 +0000
Message-ID: <d29626ce-6835-867d-de36-465bd17f84fb@intel.com>
Date: Tue, 10 May 2022 16:48:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [V2 0/3] Expose max and current bpc via debugfs
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <ville.syrjala@linux.intel.com>, <harry.wentland@amd.com>,
 <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4f1e980-6aae-4929-3f30-08da3276e519
X-MS-TrafficTypeDiagnostic: BN8PR11MB3649:EE_
X-Microsoft-Antispam-PRVS: <BN8PR11MB364977602BFDF857DDD574118DC99@BN8PR11MB3649.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0lGvaPBEM7i2xfmVg8ZVwiwwgG+PLQ18pmdbScqDTJOfjkwx6YQaC8zc2A3jd8gMiJ6uZ9hhqVEHynAGADNekgYGVEtjQAZrUFMmhZhsps7FIt0Y63zjXseme8+SfqFgPQIxEo5eMwaoyyMFACsyReB2yFbWbIYRIoKMtXcH9CuirEVbU48UkjSCY4yRMw6U1Gy1nhSctuCX27Y18ZJW9/CnD0mTfye9pm9PIqmgjIOSyObs9nGeuJ4GQRcOs6xCZigvns31Mlbj76tl1pL/QeoJyY/ET5p6h6dGhA77Osb4v7sYOn5iLR2MQi+o/NDmVO/ZQQVL7AcDRAntX4okhcu5KdkAsuMNHw38c4/iSvsxAAX0dK28/d1BwCbdGUaQoM1+XJ3rioPt/VQZyjCbn2oW0bUZv6m/2dJb9cai7a/UOE/FsFH/8OE22I4gsWNjbNIHNxuVViwBdEWiRSfVRPXyfwcVwUaWZrUqihsnXqbaMmw8w69m/k1PqZgr4Rnd3fF8Y0xs7/MZSg2fd/xUO1lPkEEAcKI5FAT78lo1oUMq8B2L53FmCyhfRQTm1V98EeazTrNc2hyIzeWytYHD1puD5xckjajJVMlJFpsJS9PIUQhiU8+8fV+Zj0ExZjdowc4CVdMp2ooJsiMBdJa6vUsTggKZMviiDkpQUsAnpjI3GKY8Z2r47/6hJaGvL8NYPYuI2Xd6qSenO+axxGJTMRlsQFRYp457rw5bUuMnjlhrSdLpODV1lM/eTUpDjtvmTKTB25f6Y1sPoQL8QWKy3GWb6toFrwzXBRoqcJ8623EzoblGIhDduVLw9K1kJnLUI/1eyjgWMYFNh9icXplFg2M+aRAaEtXQ9QfslULIek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6666004)(316002)(66476007)(6486002)(66946007)(966005)(6512007)(66556008)(82960400001)(2906002)(186003)(86362001)(26005)(36916002)(8676002)(31696002)(6636002)(38100700002)(2616005)(8936002)(31686004)(6506007)(83380400001)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZQSC9YRGt3QTR4OS9NRklPWEhjWHROOG5SUTg3OTVoZDJLSGxCL2dER3FG?=
 =?utf-8?B?bEg1Z3FUL2RaWHRMTjJVMFRQZFJHRHFBSXpFZTBZZ044TnhMbmVidmhjd0ZW?=
 =?utf-8?B?RGVFZUMrRTVJK3dMRkRqOWJYait6Z2ZTck5aZjNlQisrd09ka3lhdnFseEdz?=
 =?utf-8?B?T0grdStPNDBUMjFPbFBOOStZWEl4NzRTNUdKU0VaejVzQ0M1RU1zeWVQRmxy?=
 =?utf-8?B?cUp3b2NPL0hvaXI2R1pjV3o4OFBvWE5tZzVNbm9mcDJSTlorWXFBZnZGYkdO?=
 =?utf-8?B?SG5tM01KMFloY2k4d1E3ZjNEMEpFYUh1TU1UaGxKU0pOT3ZqdVZodnlYS2Yv?=
 =?utf-8?B?d0I2cVlPZDc5dWxlYUV0dzZhWXRTRFIyMDBkMHAxckdPakpwTnNXcWFrOWlk?=
 =?utf-8?B?KzJkUXd6ZlJVYUFMSS9jTlRvZmJxeHlYaThDTHVMMGY0U01vYmU1QmM0dUZK?=
 =?utf-8?B?V1VPcmVPRnY2M1RSTDFsc0dSSVl5MzFTUHNlOVZWSlZCVWNoekEvL3lDUkRY?=
 =?utf-8?B?NDlIYytvbGhWNzFYbDhIZ3BTaHc2TGVINTM3VlBmbUwxa0FpdTJaTzRuZUZx?=
 =?utf-8?B?TFdSeTZvdlMyODkyTUM4RGJjY3ROWXEzMnRBeTBJeGRKeHozUUkvQ2dZak5N?=
 =?utf-8?B?aHN0Yjlxc3FyNUJEekVCTEJIZWtReXBFODZiSjI0eXJXK0lYOFJYQ1pUTWpD?=
 =?utf-8?B?c1plYTFIVFRZUDROSHdvK3BuU3FLay9oc0plUkJvS3JpdlVEL3ZrTUZucVAw?=
 =?utf-8?B?K3pFTlhFQmxhVTVSUFlvVDRtUmgvdWo1VjFkZFZvUFBLdjVoVEwxS2JoczF4?=
 =?utf-8?B?MUp0Ri9JUnFwelJwWnlXZEpQREFzUnpCK3Q3dGVMVzA5UVdCVGMweFc2bUtZ?=
 =?utf-8?B?VkowNjBxQllaYnBwK0FlSEx1QUxUYkJPLzRpZGMxU000WFNrbGhHVHRNeUFD?=
 =?utf-8?B?QnlqY05GZWRBZEQyZHEyZTJYeXNjZ0NrVHhTbnpZbmlhZkJQd2pqd1BGNGxT?=
 =?utf-8?B?OURES1BobjFKQXZKSkJjdS9RNUwwU3V2UC80UFZHYWxpS1VaU0ZEbXFYV2g1?=
 =?utf-8?B?dnhXVW1STmpLemUxQ1E5dWJJczgyYS95dUhFU3hENUo2TjUyZU91VTlaeGxU?=
 =?utf-8?B?SG1mS1dBMkw3dm51blF4ZVJFT0pOWW9CV2Ztb2VwQ2JPQm1DRmpjeSsxTmVh?=
 =?utf-8?B?ZGZHNm1wMTVMN3FWYUdXMmJydFhodWRmcU5UcUVjL2Z2dS9DcURCRXgvKzI0?=
 =?utf-8?B?Q1NHKzdjZSsrTEVpZmcxMUkzbEMvWE9TdnJxcXJCTy9MZFpTZ0g3NWNKd3U2?=
 =?utf-8?B?RUdXU1FRKzBTSW55TnFBcHJjanJvdGRGRDRDZUwyQ2lWdnlzai9wQ0NrbEMy?=
 =?utf-8?B?NTJublJBUGdxM21FNTltNlZJOC9udXJpZlBMekViWkQzSW1reVJhNVFsUHFW?=
 =?utf-8?B?T2JBd2RtY1N3WWZiN2NRNE43QnVSb1RIWnJoRDVRMlNDT1dsSmdoK0VFY0Jv?=
 =?utf-8?B?QXpwTlduWkx3YUdUclV6ZU5PaTNsTURxaThaMVhWQm80QWtnV0JrWXVmcFg3?=
 =?utf-8?B?TmNKZGtUN0ZjeVYvMUtMQTFlMFlxUDVQQUs1VkdnSUhjLzNLUTVlWDg2Z3Z3?=
 =?utf-8?B?QjljNmlzcGxNQkl3UjJsWjVkUkt6cCtxeHkzTUlwc0dYSzdYanNKZzBFUEVY?=
 =?utf-8?B?Yjh5eWxBTTRBa2loNnZqMml6MllFczM0cFpaTjVwYUprN2tUUVRVc3g3eGRP?=
 =?utf-8?B?WjhCOGF5MkcyNXZ1NnVhVjFDdXgxbkFDMHJ1aXd0bE9BK0dxYllzODV5aENP?=
 =?utf-8?B?dlNMdWxvcHR6N09DL1VvbkxhYmxwNVZCd2Y1amlhREJubmViMU5DOVJtZFkr?=
 =?utf-8?B?U0tWVk9FYUxCV1JUOHRtTG1ueEFJUlNkNml1OFpQVWdUaDJtS3BVTEtoUFN6?=
 =?utf-8?B?S0crTWdhYUZ3QTJaSWpzRXJKOUxLOU1QdTlBaWoxenI3ZzZRbWMzSmdzUmwv?=
 =?utf-8?B?eUxvNDJaUUIvcU5GelpnN043WnRuL2VRdEoyajZZdVVObnFtaldlOWRZc05X?=
 =?utf-8?B?MC9rTTJjNjZ4MjZUV1FiMjg5V0F6dXRjelBoekpZeUZqQmFjSU5OeC96TDY1?=
 =?utf-8?B?NkYwMmhTUHdTWEw0RGZtTEVqSS94UmFpMVkxQkxaRVFBS1I4QjFiYS9LcG1y?=
 =?utf-8?B?U2pUNUxwS1prNzFDaXRkTGszbysvbzVDRXN0VXVxNy9NV1Z5WUUwcjBsU21u?=
 =?utf-8?B?WklEZXdob1Z3RFJTMkRJM0IwYlNobXNoaVFFdFY4bjlVeVdjekE2QWpuR0xP?=
 =?utf-8?B?bExoeSt3ajhSS0k2K05OZlpMUElVV1NzTWR4b3BBZ2JqQ0xhVTJ2dXRYT1Vv?=
 =?utf-8?Q?YUMy4C5AufpNmxOw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f1e980-6aae-4929-3f30-08da3276e519
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:19:06.0793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvhp3rqj4KBsLi0MF776ylbFWNycdkWxqgxOpbvTqrj3VqcR7sg9X8mkavkDGTF6U1MuGhCnnELiZqtC0fSIONRKKLn3P+4uHYCTxrc5zPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3649
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Can you please help to push this series to drm-next?
CI result: 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102502v7/index.html?

I'll merge IGT changes [1] first, so that we won't break the CI.

[1]: https://patchwork.freedesktop.org/series/102387/

- Bhanu

On Mon-11-04-2022 03:21 pm, Bhanuprakash Modem wrote:
> This series will expose the Connector's max supported bpc via connector
> debugfs and Crtc's current bpc via crtc debugfs. Also move the existing
> vendor specific "output_bpc" logic to drm.
> 
> Test-with: 20220411094147.1650859-2-bhanuprakash.modem@intel.com
> 
> Bhanuprakash Modem (3):
>    drm/debug: Expose connector's max supported bpc via debugfs
>    drm/i915/display/debug: Expose crtc current bpc via debugfs
>    drm/amd/display: Move connector debugfs to drm
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
>   drivers/gpu/drm/drm_debugfs.c                 | 21 ++++++++++
>   .../drm/i915/display/intel_display_debugfs.c  | 28 ++++++++++++++
>   5 files changed, 62 insertions(+), 31 deletions(-)
> 
> --
> 2.35.1
> 

