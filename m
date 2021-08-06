Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669D3E2F6A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275096EC10;
	Fri,  6 Aug 2021 18:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480906EC0E;
 Fri,  6 Aug 2021 18:44:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="214409926"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="214409926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="459450439"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2021 11:44:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:44:09 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:44:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Fri, 6 Aug 2021 11:44:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDEd8WPYMSCrw1W+DCSkBOaf+JKpTGGRhvT8CYR7tfEoEtvedQkNcuQzxdg6hDvgCZPXc0ocblVEwhtLC4xh14VVeiwn6ds7hpkZsQ7IV6/faJc9vV3bAp4IErYhsvCKURuKtIpSlPnJh89Q0VTWYC+FZiY8uDcfghifgaluyPe/aDDiF/UGPeDfpD7Qq85G8AEYtPJEbZNMTettV0NZ/Ro1nz05vlpOnJ4DUUUU+7pJY98GegbPSiP9BGhewIbWsKheAI+v+WavaG0m89mw1ah7mI3bcJXKikPQSeiYeSCQyg+bleEwt5v3fG4hNcU91kvpjh6c97c8aooV1kSPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXfAdJw+xsX0W5w5jMpg142bDON9jAFoL/CzvU7jjlQ=;
 b=WZUWlFW52Vyh9id8eaVWFMahlzGMaXwv2xBv6oT9VWnPnWEi8eEDU1ycoO1hTP1Kg9esWQirlFNlKEXy48AbM38J9sWCmhmcrwFXL4Hvm+XiKeCFb8uuEJm8lwZo/ST3bviKcbEzkxcbZsjWpjzYi4/LMptHh46aP9pGG9JyvSH9MTpAxrH1ToL4EPXIgwJPWPg6cjK98KB+lHUE+V+119X07/MxN415j2DgNImPyVqYwXx1bKMkuQ2TqPcWYPAfcKcdPsTeiTaAu8pl2bkt8lauLuoBKTqG6cJzwD4VB4UuYMAyTSK7FVeSObIWCSc0KNT67HkZHGC+sjjmHC2Tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXfAdJw+xsX0W5w5jMpg142bDON9jAFoL/CzvU7jjlQ=;
 b=mURiLB2I9GAuDF6/1s16Rxn53oH/KJhcWYRQ2DKsgNtyPQt27clYSNYPQ64iY857EPiCM4mn6cVhmb3cQ7MXuHlHhNxbZQbjmZkc5tq736UH5DkODIBLTUAt2MjqV8nFknn4uh323uEulH+h1ZZFXb6VRiQNmKiKAC19JDVGkCU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 18:44:07 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:44:07 +0000
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Add DG1 GuC / HuC firmware
 defs
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <20210803051121.72017-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <0a62a5f0-ef73-cc12-5bbc-80fdc1a68803@intel.com>
Date: Fri, 6 Aug 2021 11:43:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210803051121.72017-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BY3PR10CA0021.namprd10.prod.outlook.com (2603:10b6:a03:255::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Fri, 6 Aug 2021 18:44:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c53dcced-5f9b-49f9-01b1-08d9590a2c23
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB557750E51635E16DE54AADA1BDF39@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEeo3S2yi+wAIpshrLOLqkdpf0csClMJoMslQDxsqISsj1hrQfC2uHqRgBFn6O6QvWe7JsgFBRNDNUvsrfHTujEaVCM0F/CFBa+NVQN7ZDUIjcoLXJZXrLLBxv2xTSa89roaWwD1gYFxlFKoHHdNqQ4q960WZB9a32As6LG1HOgtsOURTwFeVpz4KIr1fz6Bhq3plChAG7RabMgdnvK6wU0fRT1Uc9CBy/LQdhMDQArv//Mq9tU6WJ4TCGiGR3wOoZxvRcN8PghaANXjioutX62fTbrVrVNJXKK5nhsACpuOtvoANNG04pzef6oukbnh6+43GrToEiCFvxRYzC4Fi0bXt/qya4TcU6p7xKF3OdL5zE3QfU1k4WkeRw3zQI9lbDMxS01Z1pRTGQfG89+SnkecMSB90fVzmvpRSP3wYgttDqHlGbRKzT71s7p6nZ/lWnnzzjziVYuVxM5nxKE+c7Gm+DSCRUrEMHwK55JEGey7uVY00roaRhWl3GSopxwlaYe3O0u3bmG+oVV2vDGWRh5OWf2APD+HDOKy+21TDIOe8QHsTVtszE5AxC+4cAFzmD1d6a6wii1gRHPqMHZVF+bdGmKJHML2Sp4/mGyLTtekddmclryHusM2WiFdztl+CVQqX4MQnJVCbYP6ZB17abYqWlEpg23eyWqTO3ky4s2X06Jhh/Zem8nArLWUBDPmNiSNCpnEBnoH51XaSw+t+VUxZYf7WhE8UJQp+IdBKuWcgG5p9P3eN+Fnkwwy7hGs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(31686004)(6486002)(31696002)(86362001)(36756003)(38100700002)(2906002)(956004)(316002)(2616005)(8936002)(186003)(53546011)(8676002)(16576012)(26005)(6666004)(5660300002)(66476007)(66946007)(478600001)(66556008)(450100002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNaKy9NRGpUTHYrT3BjSFdVTGFhaXJOZkRIMG1nbWwrZVMrVklsMnNJOU8w?=
 =?utf-8?B?cENWYnF2QTZPcmR2T28velNLQkhBa2tWMS85U2puY1FiUGFTeXJwUTBtc1Ay?=
 =?utf-8?B?cVlEWnBYdGNJWEphV1FWekJiN3l3N2RvbjdYTnNPajNBV3JmWUtlRDF0cWlN?=
 =?utf-8?B?RTZ4T0hMUWNqSFk1eCs2THlSRlRWTEF5MHJEYnoxaVRRL0MvTnZUWVgrUHlS?=
 =?utf-8?B?bU16WW9ORjUxN0RTb0ducGJUMGVoRVBnMnJiRjFFS2htZmdvcEgrenpyUTNW?=
 =?utf-8?B?cWpVYjRxbG9lWTNxMWpCcEtxL0ZXUUJ6OE44eVlEL0ZGT25MNFhtSFpUcGtZ?=
 =?utf-8?B?bWtFeHprTXIwaTZHY3RKWGV2VVJONEFpL21IeVBLR0JVZnpyRlcxS3MwODlL?=
 =?utf-8?B?cHdoUUhDM0lQMU1kRFFQVkNtenhUK2o3cDJjd2ZBcGpFNEJMbUIvNVhyQ3A4?=
 =?utf-8?B?WXNNYWtBOFAzSExlYkZrdEV1TTE4ZlovZnozYkcxTzJacDB6YjVhZDJCai9v?=
 =?utf-8?B?NXBBeWhFbVp2cUszSjhXSzFzN2dqcUhPaG1oNDJQUkl2MEJWbjFCZ1llbU80?=
 =?utf-8?B?c2RUQnl1NVRmR2NvT1pBOGU5dWR6a0R0UXBOUUIxQldEdzdLVC9sc0FNcGdn?=
 =?utf-8?B?enV0Wnd2ZDR3b3c2ZXovRzZFTFJOTVRTeVE2b2FOTWJVaXVqZkpzUlNmOUdt?=
 =?utf-8?B?S1FtK1FpT0g2Z1dPZVBiaHJ5ZWlqSk1ETDV0N05yVjBDL0JVZm9UTUxMeVV5?=
 =?utf-8?B?TkZCeEhNck9vWUhSN3RkUHgyTHAvMjBoVFVvUXNCNTM1cmlVTkxoTjRKelV2?=
 =?utf-8?B?NnNsMUNIU1BUVnA5aXlaanZ1RkhNQVRUVU1iMllTMk9IMENGZzJjVTdqWVV0?=
 =?utf-8?B?eUdaZTFwSyt3cER2VzdPeXdJRk53UU1wenczY0FiK1RxbWVQazA4S3pJb2VG?=
 =?utf-8?B?YnFleGRybDNKTEtvNmkvNzFNek9ueUUxM3U4OTFWUmdyYjVuZjJUM09pK2lS?=
 =?utf-8?B?ZVhZbG1BdVRncWFONjhZUXgxNzZZaUlzaU5xc1d0S3JKS2xDWUxRMmpsOUs0?=
 =?utf-8?B?YlFYTHVCdnY5RnFENEozcm5JNm9MSTIxaWlnVi84MmExSTVHN0F4Vi9RNUw1?=
 =?utf-8?B?djdwMXBwMk0wd0EySVFkcDBEbDJnTWZaeW9vd1ltaDR2c3RMSWVjL2FqM0xl?=
 =?utf-8?B?T05yY1E2NVhxaWl3NVJiamt6RFM3bEpIalNuMkJXanhFQVNjWFJ4d3R6b1pw?=
 =?utf-8?B?UEpKejRTWmdKTG1sZDRlRkFmZUFqZ29mejloalYvYjhTUU1YWSt4Y3lJam00?=
 =?utf-8?B?bmFwMEVYUGVrTnVFV2tUYS9PbnhzdnhGWWRSNmNHMmZjNkwxYzNNbHd5VCtB?=
 =?utf-8?B?QXNyWDhTMGJPanMxc0wrRXBRQzZlZjRManYzd3FlVVZOSTlENEhLaUV1L0Jv?=
 =?utf-8?B?WExzRlAwakVYTXBKaU5ENXJtOWFBaXROM1ZNand4VjR2OGJ3YWI0NXR6MVRX?=
 =?utf-8?B?VmpkaHc3NEhyamI5S21zenJoTkptOHUrWGRzSWg4ckw0clZwOExWaU1yTnBi?=
 =?utf-8?B?b2hWS3VvZTMvQkVaYUZVUjg3a2d3OEhlVlVpbzVWWmNCeUpaVFZpaGFsYWNZ?=
 =?utf-8?B?d3BmS1Y2ZEI5WlhDNEkxSEM2aU1ldU5aSWVWNEJMOG50U2t4TzYxeGxlQ1Mw?=
 =?utf-8?B?UDFQKytWWU42QlhOaEthNjBJMWhzV05ZN2NZd25OYnhkYjd4Q1pmRXJUS0Vs?=
 =?utf-8?Q?6xrJVOP8F8cm5okDB4ZO5mxn5c/NU4nNG13EGAU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c53dcced-5f9b-49f9-01b1-08d9590a2c23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:44:07.6882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLtzDWG48yGRzU8up6842LByUmE+2jVvx7KqKUM+DFEMW7DX0tCe6IQ5kcdrBLd6iR3xf8svi5JaesXArqpuokRp/FiVeJWRf97Qxso6HLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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

On 8/2/2021 22:11, Matthew Brost wrote:
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index f8cb00ffb506..a685d563df72 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -51,6 +51,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
>   	fw_def(ALDERLAKE_P, 0, guc_def(adlp, 62, 0, 3), huc_def(tgl, 7, 9, 3)) \
>   	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> +	fw_def(DG1,         0, guc_def(dg1, 62, 0, 0), huc_def(dg1,  7, 9, 3)) \
>   	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
>   	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
>   	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

