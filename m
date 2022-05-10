Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F122152110F
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B0910E3EF;
	Tue, 10 May 2022 09:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EF610E3EF;
 Tue, 10 May 2022 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652175378; x=1683711378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jxRbme0z0Q4bJhTNmG3fqlKhE9n+PKBuc2fMCgN4qZA=;
 b=nzYNh8AQbvZLgmj6r+EDYQ+0OSCuP5HyiW0If12UZYZP/ncEdYln+z4r
 P3u48jFCW09Yq46OzjGtHC7G5sQbQGt2S3DnvtJS7neyT6YfI5IjnQ7jJ
 1x5LgPtPS7SbI+1f1p1KW64h8e9VVaNocWLVGM8LwInFqXZMTP7rqhMUi
 6QBJ751plgx+JXEQkJ1K+KcuRb8fhR2RByafnb0hSTzMjKXgpt3fKGpBi
 0vwSxytzTC1HrVVdtTbNj7pI7IVR97VmC+lqu/7tu2g+pqRmUBYJ+eNji
 xQlstXTvltaClIuAYvv1cgyRgvSJnaNcS4Tm82Tnz6woP8j/jAl2StmI5 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249223202"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="249223202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="669802299"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 10 May 2022 02:36:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:36:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:36:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:36:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXgGtUXnT9IdnsAcjqUdAHUyihIVOTZ/7oPImPr1EhyXNglpJ66uo5NzIB582k2QjW1WKwhLvFC6cSLvfYbmBqVDgg0O9NZ0Y9qQAUDv0140C3xnW+hzh2slko4BbGewHEbHk+o+j2PibcI47wlLvhYgxgcW0R/N7UhXwQCvtG/vxP4u3BuuL30zAtT+bJPbczhemAIlP1qTYQ5MqtUJv0pO8HTzXHakqKP3y7MIoyqCd4J/e+NcRryhqiC/mup/cZgjX0/gOIIV8qPv5f4NpJIWomskz5TZjXQJ0jgHBEfmhUnb+oQw1maMCVzpm7BVVZpR2rGqh6aMDFekGBsKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdiggcEEde/ERNPrrPD+R30LdmnBpuMs2TXrCPlN6PA=;
 b=egeI+3O6Heszvg0r1mSP8q70AtLUPge0XiLvlyN1DNzLrMwZB5gL4aezlsU/XzuzSPnBVdUfPE/JtSZ5eSOPRo+SoV0GAyyI4rmAVbiXUvzg/eFhGg0u/nAt3iJrABjoFQPB2Sar2cDSOSILhHOcYb5fSrbM6urfRRScPGkafWX+JkpVfJk5kuBLz/+8+l9LA7P2JzLVnpH6AdflELarg8jblzZe7KHImerDLGHOx21Yhr+7yL5qgyxg9/IwpU7kq7yc1VuF0ZQNJXrIJVHTIhQxYDA1/2LqE6B3k6tT9jO1JzETzf2OuuksaWMr43fgqQzcAqGxlWvVcgJeKcZXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MWHPR1101MB2109.namprd11.prod.outlook.com (2603:10b6:301:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 09:36:14 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:36:13 +0000
Message-ID: <661e3a21-e538-0a77-e3ba-3bd1058187e7@intel.com>
Date: Tue, 10 May 2022 15:06:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 16/25] drm/edid: convert drm_for_each_detailed_block()
 to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <bfd06d64235393012b2f3626d5764350de5f5321.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <bfd06d64235393012b2f3626d5764350de5f5321.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c542541-1ad2-4dda-4cf2-08da3268862c
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2109:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR1101MB2109B5797867E51E98C86256CEC99@MWHPR1101MB2109.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZZj6fBZDYpUlo5bi7q5kFtWvVjzWsNJCXc3phjF89OA1wPaGQdkYFiVb6VJLPfMtI5MZobbK8uqOvJgC7isD1E0jVHq4pbj+EGO7JB3ylkMBeR2g9XHVzoDCs+MjI0D91ZHWzFswYQyxu+V7lTFGSuIxhsAqfl5/h+arJVby3PHicrIStO6o0ImPU/h86HUoWhzocNXmfb6evsEfCTBJmSnagMMdfIeEaxmAcVLyMZOJ7E5A58dVadLguGJQPGL9lsgM6UaZG3KGYk8pEiGE3Cm+KIIYCQPqVo+iZBwQOIjXH9Xmtc9Rd3ElpJeCE9viwB5z3EZfvFa3WtQBezCoeFmnXiQ4b7K2ho4du5pl7iFa0mKyppOpCwEjDOy4gc2glnQmlV3Bvpu0m64LtutUfWdS5hNHC4eGDT18hiLRWJnzo0mPm+wCuFpC+GeS+wOHhTmMDYGGULpo90mtQcxoc8bZSoQw8u5bz2OofV3eXkNBZAKfSohRjsYfCd2kD5XLQc/tpurJeaPcXSk9bW5siziU3Eyg2IFB1hDGsB0tsudnJXlVAL5T+tuMeAt8Hu9F798b7h0OKX4q9znF3kBN2Yw8rI8AkeLBmkdhiOcLiCJbZzPTIysTUvssf7mR2kYH/bsv2qiiTi36nSauHTFRp0g0yU12rSz9Avftc/aAe6Q4+TEEC5hxiHKsZVzxJrT/h9NgODaj1rBKlM30s8Iyoj+vOkr5uEYnoSQw7lmkfFy/gxM2Q4ZmaUS0opryYQ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2616005)(82960400001)(6486002)(508600001)(38100700002)(2906002)(31696002)(5660300002)(6666004)(86362001)(8936002)(450100002)(36756003)(186003)(316002)(55236004)(53546011)(4326008)(26005)(6506007)(66556008)(66476007)(8676002)(66946007)(31686004)(6512007)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFljajRtZlNLZVFZWUNNanRwdUFxWHdaWUxKbmdKV2VqalZDbUpMd24xR24v?=
 =?utf-8?B?WVROd1NwakRtZXlwL1pSVlJ2akRRNXFDdzZkUjJSbmNjZlVrNDBVSjRoR29S?=
 =?utf-8?B?ZzZ3Vm9DdjJraHFhcmd1TSsxWDN3cnhyM256Ry8wczU4anV2VEV1MGo4UWo5?=
 =?utf-8?B?dk9hSktLQTlWR3ZLd2FCWUpkUnBTbU9FaDdwbUo3d3NjZHNKdE5VRGlhQ0Rs?=
 =?utf-8?B?RVllWWlUVEtoOUdYQmREbVFreHZXZ29IMHYrcEJVRjlDbUp4UUlXNHRES3ZX?=
 =?utf-8?B?OXptR1J2N1NTVlRBRUVIcEZCSE9wT2R5MXpsbFVKMUZKaDdUTlJ2Q1BaeUxC?=
 =?utf-8?B?cXlRV2FuQ1pRQm9XQ0xGT0RvbnRGVDJ0Y2d3enQ0bTJ5UitsUnZBN3NLejFI?=
 =?utf-8?B?TVlKZHdkQzRVc3JoK0Q0bGE3ZnVqYW8wbno0eGFyYjJLOHFxejE3SVdrTnJk?=
 =?utf-8?B?ZE8yYzQ4bkExbTI2WEtzcEJXYVJXV2J5czlSQnlraGxHNjFhZTUyNVZkTnNC?=
 =?utf-8?B?bC9UQTJqL2RJRkcwZVRqSkRGKzhNZTBJeVY0V09Lc1ZDZGE3R3ExWVcvZU9n?=
 =?utf-8?B?S3A4cUpVUTFiVnA1bjgvSkFPTGorVTNSdk1GVE9YVHh0NTJiQzhMSFF2dVJm?=
 =?utf-8?B?ZjJlSFg4YnpBVkgyUGZpNnpMb3JNb25XU0V4NHcrSHdxeFE5VDZKVmRBeG92?=
 =?utf-8?B?ZkYwVHJXb1pqSlc2bytlU2dhVjgxT1BqeXBYYy8wZlJoNFA2UUdYdzZ4b1do?=
 =?utf-8?B?dFd0VHg1VkwyTkdIZjcyY1pwUHF2ZExGU1cwcGEzR3BZRytLK01OTUxYY2pi?=
 =?utf-8?B?OFlNeEExOHF6V0VpVUFOVzNEcjVnanMrUE01WVJoTnFwVnlmREl0Sm9zZG4z?=
 =?utf-8?B?ZGI1c3N5Mit1ekhaRWk0cGp1Ry9Ca3ptQzRPZjRnTWNmOE8zaitpMTVTSVA1?=
 =?utf-8?B?M0F5ekNkSUc5b0dLZFU1UWczanhZa01xK1h2N2I3MFBzYnNsOUc4ektwQU9P?=
 =?utf-8?B?dU5jQmErUlA3VysxaTlwY0p2dnZFTUtaS1dRQ1gwT1ExL3dFdEJqdmV0TmNt?=
 =?utf-8?B?Q3dWY2d1NVVXMlV2b2cxQWNtNEZHWGUyTU1Yb2RUd0N0V25GNEx4aDhsYnNa?=
 =?utf-8?B?Ny9uZ01yb21PZm5qSUYzTlh1OTh3ajlEVzlVOFNyODVUR2d3WmRrT3ptRGZh?=
 =?utf-8?B?Ylk5Z2ZVSUVCclNhUlhERjlacXNWK0Q4Y0hQU09Gejcxb2R6ak9yS3FkM0I4?=
 =?utf-8?B?ZkhsYW9PTTJZQ1VvSGxhV3dTY0FUNHZzVDRGMTVQTGJSbmwrK2tiYUxPcmJs?=
 =?utf-8?B?c08vQXBTeWFCRXRzUFduWlhHcFo4WEp3U3E4SmxlRDVoOEFxNjRVbjVjbGxy?=
 =?utf-8?B?Q09aNDVKYTk3SERWWXdqVHU5a3NtekFFY05OVUNIYnBoTnRTaUx1SUFYMGJX?=
 =?utf-8?B?WW81VUtMSkhCUVl2ZGo2UUExeWtxWG5jcFRKbXVad01aelQ3akJlNlFnVnBw?=
 =?utf-8?B?S29NYTRoMUJ5V3FWcmt0S3pxSkRyV2d0akVpYjhSb1IwUXhieTVteE4ycytt?=
 =?utf-8?B?R0N0bkE5NnRzNmRKamhrSnhBL0VmVlhJZ1EvcngrdCsvTW9MNmpiVXczV1Vl?=
 =?utf-8?B?R3hPTFU1RTQvaGhaQXVVVU4rSitLdkFGYmpaVUIwMElsSEZ4elpRVFFwYTBS?=
 =?utf-8?B?RnNwUVp4ZU5uNWZabU9SN21rT2JpSUZMcHJ6T2FWcHlCeWp0bS8zWEhkUmg3?=
 =?utf-8?B?NU0rMHlYM0YrQll4TlJoV3YzRzhjMWdvWTl5Sm5zRTN4akZrdlROdkdvUE01?=
 =?utf-8?B?Y0ZXdkgxeWNoQW1mbWpHUldFczM3dFowZ05NSHJiMnR4eGJuRGdMNTVoUXcv?=
 =?utf-8?B?VThkSHp6dlU1RUdNZlNGNlJMZVR5NERLN2t1d1Z0OEpiaHNvdDBuMDROM1o2?=
 =?utf-8?B?NW1iUHd1ZlBLWEVZcVdZSW5td1BYT0YxZUowZFFwbllsM3F1TVJaTGRKaWd1?=
 =?utf-8?B?ay9iUUJtMHBGK3hFSHU0MW1QTURFdjhBdjhOWU9JdjNRekh0WmRyNkZURVNR?=
 =?utf-8?B?NXoxQ2RmUUVHSHBqRWY3VVJlUE8zUFh2SGpWbk9Jb2V6L0c4Ty9DTzMyRHNm?=
 =?utf-8?B?SE1KOUZBRjFzbmJPQlpCNmwzTXFnTEtkSkVpUncxd1BWVXNIR2tuQ2gwaHVC?=
 =?utf-8?B?VkNIOVVaWGswdHVZZ2dWL3BIZ1kzWHAwakhNZG9LeXdVMnoydjdDOEZwVWJM?=
 =?utf-8?B?ZlM5S24zUzJoMW44dmhxSlJ2a01iY2owcWVNcmlPd0d2N2d6K1U2SmhpUys4?=
 =?utf-8?B?dlB6RWNOaXlYNXQ5NEg2VnB3WUdDUmh5MEo5Snd5YVJqTTYxRHNyQkd3bzlM?=
 =?utf-8?Q?l7LTXAoPXUIMC/qY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c542541-1ad2-4dda-4cf2-08da3268862c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:36:13.8821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcJm98gPmB4Qg80W9xrvVWd9CvBTKuZOVVi7ZFaXiTtKth2iugfriW8VQGF6GoUivFRzqUUjfTA+vHZEFLhYFIijExqGrgpdvb3MpuRduGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2109
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
> v2: Fix checkpatch warning on superfluous parens
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e3ff0f31a614..61551ce0db88 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2598,20 +2598,20 @@ vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
>   		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
>   }
>   
> -static void
> -drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
> +static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
> +					detailed_cb *cb, void *closure)
>   {
>   	struct drm_edid_iter edid_iter;
>   	const u8 *ext;
>   	int i;
>   
> -	if (edid == NULL)
> +	if (!drm_edid)
>   		return;
>   
>   	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
> -		cb(&(edid->detailed_timings[i]), closure);
> +		cb(&drm_edid->edid->detailed_timings[i], closure);
>   
> -	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
>   	drm_edid_iter_for_each(ext, &edid_iter) {
>   		switch (*ext) {
>   		case CEA_EXT:
> @@ -2650,7 +2650,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_edid)
>   	if (drm_edid->edid->revision >= 4) {
>   		bool ret = false;
>   
> -		drm_for_each_detailed_block(drm_edid->edid, is_rb, &ret);
> +		drm_for_each_detailed_block(drm_edid, is_rb, &ret);
>   		return ret;
>   	}
>   
> @@ -2677,7 +2677,7 @@ drm_gtf2_hbreak(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
>   
> @@ -2689,7 +2689,7 @@ drm_gtf2_2c(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
>   
> @@ -2701,7 +2701,7 @@ drm_gtf2_m(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
>   
> @@ -2713,7 +2713,7 @@ drm_gtf2_k(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
>   
> @@ -2725,7 +2725,7 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
>   {
>   	const struct detailed_timing *descriptor = NULL;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
> +	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
>   
>   	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
>   
> @@ -3265,7 +3265,7 @@ static int add_inferred_modes(struct drm_connector *connector,
>   	};
>   
>   	if (version_greater(drm_edid->edid, 1, 0))
> -		drm_for_each_detailed_block(drm_edid->edid, do_inferred_modes, &closure);
> +		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
>   
>   	return closure.modes;
>   }
> @@ -3342,7 +3342,7 @@ static int add_established_modes(struct drm_connector *connector,
>   	}
>   
>   	if (version_greater(edid, 1, 0))
> -		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
> +		drm_for_each_detailed_block(drm_edid, do_established_modes,
>   					    &closure);
>   
>   	return modes + closure.modes;
> @@ -3397,7 +3397,7 @@ static int add_standard_modes(struct drm_connector *connector,
>   	}
>   
>   	if (version_greater(drm_edid->edid, 1, 0))
> -		drm_for_each_detailed_block(drm_edid->edid, do_standard_modes,
> +		drm_for_each_detailed_block(drm_edid, do_standard_modes,
>   					    &closure);
>   
>   	/* XXX should also look for standard codes in VTB blocks */
> @@ -3477,7 +3477,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
>   	};
>   
>   	if (version_greater(drm_edid->edid, 1, 2))
> -		drm_for_each_detailed_block(drm_edid->edid, do_cvt_mode, &closure);
> +		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
>   
>   	/* XXX should also look for CVT codes in VTB blocks */
>   
> @@ -3536,7 +3536,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>   		closure.preferred =
>   		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
>   
> -	drm_for_each_detailed_block(drm_edid->edid, do_detailed_mode, &closure);
> +	drm_for_each_detailed_block(drm_edid, do_detailed_mode, &closure);
>   
>   	return closure.modes;
>   }
> @@ -4838,7 +4838,7 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
>   	if (!drm_edid || !name)
>   		return 0;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, monitor_name, &edid_name);
> +	drm_for_each_detailed_block(drm_edid, monitor_name, &edid_name);
>   	for (mnl = 0; edid_name && mnl < 13; mnl++) {
>   		if (edid_name[mnl] == 0x0a)
>   			break;
> @@ -5559,7 +5559,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>   	if (!version_greater(drm_edid->edid, 1, 1))
>   		return;
>   
> -	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
> +	drm_for_each_detailed_block(drm_edid, get_monitor_range,
>   				    &info->monitor_range);
>   
>   	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
