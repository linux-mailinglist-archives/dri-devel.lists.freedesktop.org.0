Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3FB587284
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F6113DEB;
	Mon,  1 Aug 2022 20:52:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C04A112564;
 Mon,  1 Aug 2022 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659387152; x=1690923152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S0CuN67Ccwr1GrO4wSXBbinBgnjy+jcz41kdeJ7gcJ0=;
 b=KeKQCNU84+4bA+4jW+Ge5kCP8MeXXrLI8lWVX48CMyyMHTh1JEEt6IE8
 ur6x+dN0ZrZtwljD8/+glfN5nFhwP2VlN/iOwAV/imKWQ0CwBUB5F+Oxy
 /oIjHFRv/Pr3z0zPfDAZALBbtoDTR9VjtoKM9oTW9qBFTIqY2fpgy8du/
 4En6MCCNnWf9+cA7OVZFAK1vHpnzTTRRUcKjhnc8uRTErlbtEYl9ySciR
 bQhK94wkWPU+pQOToODjwNKfNvV4yGZyzkIrccHlK55S5FgxD02GxDfUA
 HeAKx9CPvc6j7lc+xi+M7D9hfdWbu1PF7f+u/1M71wqTq4p55N2GgSEY5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="269628494"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; d="scan'208";a="269628494"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 13:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; d="scan'208";a="744405208"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2022 13:36:53 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:36:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 1 Aug 2022 13:36:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 1 Aug 2022 13:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLgXRIkUtWguSIO33Y6oC+Ov9S8Vu60Xl5zwcYHTvk6toeOYMYEnUz+7XSPQFumHXIUjEfxsmjR7gTol7WFP91PEE6/U3VM58k/L6pp2JqXKl7ai6rXzgrao0huemb08v0joIObdjCIRM47Oe9INLSKgThASbRcsAymPQ4UhIBeWjVlcKa5hubAMG1G4ERPp7YxY/rX5qFQdYgHh95L2na+uwa6vt+W7qsP6lqrZF3JFArAmRaZcesH7Mju9YtYw6HAtAWQ8HBF6fxqO1/cq5VyvrJ6bbNWI0mlQSQIjKZ8js5z0bDyn8beFq6uGDgrG2F6oWwArvQ1AHpeqUELSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4lCndr8OTjvvBBHg7GiP7qlRW/7KF74vut69OQEYCo=;
 b=Z4haC9BR2xTzE7gdT8BmAfsgZrchb/bLFsweSmXw4YdVT9HcFe/92X1b76QoH/hsaIg97fmHuZdu3rZSoIPcvkfYKqVJ1Bg+Rq0gE8nlBaq8Xn3FTaqeH+OqNypl001P5WpPJtmaUmBPp+orrhpMKvRFM3Gf3UXH+2gLvBcSmdFgSRWV0+r/ARLHZR1imsHYSOJSxKHJKvt2EYuQ/zMqgwji8oE57jX04YNzeE0SNNGyxCJfLhdOalXnCiHES/jAIsqj7xy/SETquuAZpE4V+ItjYI13LCoJtI2SK8Z3SvXnI0A6A5bHIjJd759HSKQtmo8VWxDyktheCTnvwLN2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB6557.namprd11.prod.outlook.com (2603:10b6:806:26f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.14; Mon, 1 Aug 2022 20:36:50 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c97:4423:7f0c:2300%7]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 20:36:50 +0000
Message-ID: <ae804ab9-b866-1608-af1f-84f8f5823f0b@intel.com>
Date: Mon, 1 Aug 2022 13:36:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] drm/i915/dg2: Update DG2 to GuC v70.4.1
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
 <20220728230722.2749701-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220728230722.2749701-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20d309ee-2019-4c56-5b00-08da73fd8fc6
X-MS-TrafficTypeDiagnostic: SN7PR11MB6557:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sx1/o/TNl/W7zxnJ+HApWdh0fPzLEm+qsQkDv8E+yo3mGTpw7CPwsjeXePUOwznosSIR/GZlfjhFvuw0QngSht9U3Ch1mF2gcapLOoeUGH6YFje7oIb9aKyV4eoxoY+vnUQ5fmVjA/6qihfyPsXGaCEEKsSCymQS7Rt2nYi8s24faKm+LqYZQToNSbcB9eqscvJqhQm1qDl4vesxN4aCUXIYrsRhU6zqpVCi6Q8EojwPoH5OTJGY/hoo3WEbPls4CgF/xvLaiAfiRpMTsXNQQbnN8i75fVjXbyfylYJFaw3Kc0Y2Xt3ZpJwb3d1mI+ME56U+w+gsMEJd+bSIVruVzackuRqFWOgkVzo2ag3TytmZzutkJhR1IsVaEDutX0dB499ffz69X36fHJxro55h1hZuKd/+2ppMlPE0i86tetRubQ8nlZ/N9rzA1rKr/zVfyENRuZG9/VpvFVNizFEikXhGa8h8c0OXzlJ1aIv2mQ1TjPGauOgjIbd6w5DZNY27bySpIDcPZdLRhkYhxH327KSu/zAYvNro3PdzNK2Dg+0+Rh0oi1mbpk3dJO9rn/b3gmbz4l6W9Yhfe6o1Gjk2p8FHAftNxaNW/uaP88dBNYG+ve6d56NfkJrMDGUGf4aVbuTHidn77whqZpF0Ko1Ty2vAZ6hXpVlUE0ha/9Bfj6LDfyQjpoz6QuHz/pPDSTqeIAudzJKHvqBqQitj6qkumShkGOGOycxSK3p2Da3FbDZ2NOUy2g+ULqAvgeikOqkSdchdmRrg00yMadqw/2bXGiDDoo4VywlX0k9HROAhy5bGhzZDiLzf+9OdRyXy+PqzasQwmSVx8mLpwkYW1nEZ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(396003)(136003)(366004)(82960400001)(4326008)(66946007)(316002)(450100002)(8676002)(41300700001)(2616005)(186003)(66476007)(38100700002)(31686004)(36756003)(5660300002)(6486002)(66556008)(8936002)(83380400001)(478600001)(2906002)(26005)(6506007)(6512007)(6666004)(31696002)(53546011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1keE9aV0hUU1JqSUYzVE9uM1dtaVNqTjJ3QzM3bmk0Z003Z2JWRTBDQy81?=
 =?utf-8?B?QkVLM08yUmNDQkdLdEtoNzllaTZ3ank3RnpSaHN4Z2hkTW5OQ21vM1g0eHAv?=
 =?utf-8?B?TFBGUmI1bmxqZUhDdmJBbzBHajFXc1ZGRVl2cHNWWmErUm1xWXJ5Z0Q4b3RU?=
 =?utf-8?B?R29YRXgzTVY0MkdrUG5hQkt4a3Nyc2ZHcUZKaEoxZjlyVUtEVUwrU3JUL2pk?=
 =?utf-8?B?MjdBM2ZxeXR0TytYbVBnQmExVVVLYkdmdkl1U0NOUzFlcHBiems5UG5Kdm9H?=
 =?utf-8?B?MjhjV0RFcVBhZ2o5c2k1eno4bFVUSmpzVjhZSUFEODZIWEJGc3JkeGUrZXlo?=
 =?utf-8?B?ZUxmWE16aThuL01zeG8zWGRBQVN6QmVQMkQ5MndaanJ5SWw1L2w5dGhVSjBE?=
 =?utf-8?B?OGxrR1dPTHhaVm0rSFFuamQwRWc4T2FLcy9DRmYzODdRejNPdzZtN2tBbFpo?=
 =?utf-8?B?QTZkd3JLQTJMNmdUTXQrQkhkMzNIbkV1eGlOYkRsQVJLeUhwSTY4a3dyUk9J?=
 =?utf-8?B?TjRqMUpIYnlmcHlwU2lVdGhULzFuSWZsOHZFaFlldmZMbTlPYXZlRUhVNWFl?=
 =?utf-8?B?YVFyRzVyWTFTNjlLMGJjejYyTEtwRzlGNmtBRUhIYkVWekk2NitFYkdjWG1J?=
 =?utf-8?B?dmVvcVpNV3U0YlZ0QXN2TDBTd1RKYllpTTBRNjg0ZkRaa0lZSHlOa2N5d1E5?=
 =?utf-8?B?UXh6R2JGZWlvSzZvbE9TYnpRYWZBT1RvTjh5eHhJZzRyT3pZK1BEd2FRUWxq?=
 =?utf-8?B?M3JadWNITVMwRlQrWlAxbzA5V3krRkFVaDdMblZvWWJmdGs5anBCVE00UEFB?=
 =?utf-8?B?QUF0TXdJMzEwYXRuK3ZYTFVsUldyZEt4Y09hZ053UGtXK3ZFK3YzamcxUWxi?=
 =?utf-8?B?amdnRlh5a0pLQlM5TThPenRFSzB1V3BNR2VPcW9FZlRva2pjeXRPbDlDaE1B?=
 =?utf-8?B?WE9NenIrWTlaMUNiQlRzUFNVQ0lZUjUwY2FMOGVUdGFTMnJKSlIwSzRRZWpQ?=
 =?utf-8?B?Y1VueWtvL2hnRVRPcHJEWEtaTWliSTRyUXVFcDQyM3UwQlhZWkJSL3M3MzFG?=
 =?utf-8?B?ZVJjK3p1ZEczNHJ5TXZNbmFyb3J0RjJaOWVEWldJWmhwV1JyZGtkOU9uNmdi?=
 =?utf-8?B?WlBxNWZoUkRCUzdwSi9zcGtsdlBMV0h3WXNmZkJFcGhvcEdLSmIyUlAwVU54?=
 =?utf-8?B?ZVF0cjU4STlJY0Z0Q2VWVmJvMDl0dHJNSk44T1V2T1hDQ1R5WHVCb2FoMXlO?=
 =?utf-8?B?WkprQXk1MkxvUjd2cVQxWG14S3R5TytTY2VyMFFId0s0dlNiNUtZdUl2eE1P?=
 =?utf-8?B?K1B2UlN4eVJqU2wzTi9GeVIzdXhxaTdCMmdESjgzdCtrazI2OU1SdXFFRytR?=
 =?utf-8?B?NXo2bldPUEc5ZW1mNGxTaVVCVnpmeXNGNkxBNlM1TzV6Rm9VbEx6cHJqcDUr?=
 =?utf-8?B?Z1NDQTlwTnI1WlFpR1M2WGFIVmFOV3dwcW44NEU2SVJWZXJyTkkyd2tkSlVW?=
 =?utf-8?B?aEREa053c1haWTRDY2lyM0ZkU1QwMVd2UGxnbWg2QjgrWGNwV1BNNythVHNQ?=
 =?utf-8?B?dWJjVU9BeTFaNG1XeHAreTdFN2V3WW53YlBzb1FFQzVqTi84aXBOZkxhNmMy?=
 =?utf-8?B?SklOZFBmSmdLVkpkZldsbGRVSFNheTVmSVlQc3puWFhTWmNSVlozTDlyVjhJ?=
 =?utf-8?B?UFZlc0J2TmF1Z1dDWW1uVkJMQ25MWVl3SmxxTEdGUUxRTGNVdTJiUlRXZW5I?=
 =?utf-8?B?K0IwVVdkdEFxeC9oWmVkeStYTmF5TjljRGJoOXFBbjFIM2ZTUHVKVDN2UkhZ?=
 =?utf-8?B?Tm1zTkpBc2g3ZFpzWmYxU2ovOHlRQVh1TWxtWFc0V05wSDNYL0RneSt3ZjlM?=
 =?utf-8?B?VHNVaUFCQTI2RlZOOG1JVkcwUmd1SWwwelJVZEc1Uzhta3FtTWozazI5V29Q?=
 =?utf-8?B?SEZ2Z2dFSTUwRG01NTJncmFKM3JCdTNDRjFoWGFRTHAyclFNMmZVRjB6b3lS?=
 =?utf-8?B?QjRzMUhhdm1QK09rM25XOE9JVTB1RG8wU3JrTVpFVlprL1Q5Q1BURTJYaW0r?=
 =?utf-8?B?SzBwODRwaWI0U3prUC9GZ0NPbUFaSHExZG9RWHJ4YXh4ejZwTHFpaXNYTmI1?=
 =?utf-8?B?VXhIMnp4NWdNenZEc3ZMakhPbjZ3UjdTNlhMQlI4N1JleEN2YmE0cXpGVFlJ?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d309ee-2019-4c56-5b00-08da73fd8fc6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 20:36:50.3501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1QTUiJ3kz625EHkVPJDbLD1/cYw2ONMqM0lT5aidqzVjGmGSIR2iQ33FxBvTtDr6drbQJi1BVD/rlFm06jfSM0It9m3seIOcQN+NW/Sxpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6557
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/2022 4:07 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> New release of GuC with a bunch of fixes specific to DG2. Some of
> these require follow up i915 changes to enable.

This needs a note to explain that we don't need to maintain 70.1 
compatibility because DG2 is still under force_probe. Don't need to 
re-send, just add it on when merging.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index d5fca1f68eff2..58547292efa0a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -53,7 +53,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> -	fw_def(DG2,          0, guc_def(dg2,  70, 1, 2)) \
> +	fw_def(DG2,          0, guc_def(dg2,  70, 4, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
>   	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \

