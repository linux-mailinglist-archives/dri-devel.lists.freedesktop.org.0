Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BB71F3E9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 22:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138B310E5C1;
	Thu,  1 Jun 2023 20:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174610E5C0;
 Thu,  1 Jun 2023 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651629; x=1717187629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1PCH/VKH9JuG2EXBFkZKlcbs9Q78NPzDNZpPpMBav3I=;
 b=jHlIHKrpDLgmqV3VGuEPAA1wktqx7mz+2ULGbOWQ1zJBOhoy5HrBd70d
 A3+ghC3tBuT6NpCW0rJB7etLXYdoSizIvE5+YMkrgDhpBcW3FZO7i5m+F
 R4kYen4Pdqr1ZLYOcZIE2W27l0+RUtMwMy1EtBLLVT8MFg0tMVAZx+TwR
 BjaUBOUNQEez3aTGh7W95ZQN38j+tuu2iH41UzfLWJA5ifh9fKQVReSj5
 PwY45016mfLwmVMyGotLD7w9Xb/Hdxp4Cc6ie3AX8/og4n+KT8ZfUj3HF
 9QAxykD1lgAQpcTXznvemWox//beaTv0uv31txykO/DD6C1RplIwsYsl9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354532247"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354532247"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737236569"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="737236569"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 13:33:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 13:33:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 13:33:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 13:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LirdXgeLn5CAf7sLiM7/DCExNJwbmK9BBLydBqxaT+Oyi3EhUzxvjEcE+nB3/ivrrnkkBAOUmbgZ8wskUcVjoKZltHxSSlsOJWtMz/n5RMiLuzP2A1tN4m04ZZdY6Ep4piiD3mCTlhtE6w9FESlJvgjf+cM39v83obxDUlPQA6DR4adUXI+xbNcmf0gDvqSybTDupAjwTqfImK/I5/q5buIS4EHdKskukTHLFMOCkkOA7cFzImIYlCRYpwIohl1ahUpPb8v4ClwBwI583Ct6mEo7s8miNsHEpE+Ydt1uDhQZTIYFmOzl8QhI9luvLj+LgHCnRTbc83qvtS6f3ZRhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/iat6sqr5zRJWQiKnnagqnJlPsdqLTGWkggXeSRM3c=;
 b=DsYgPjiXAi2UO0IViRKVZ64MSTTBKfdkW3poUbZAhnw/Z53yxNwQlSpVIzb6UGghOfWOpeFhFbqKr53eMXXWmM/H3tjIyZi/2LUxvAzXrlruhSj/Y6MTfMvs8WTeDX75EiG8U7y6iYcf8SbcqXimEFZkp3cL2AGH3dO0/gaVsK6C9mYHIooJY/KQpQP28vw3HHvcRm2cndqJmB+mfu1HRW83HimvFjd9Rd0PZvJb8/PSS7OT/82NQND5rcv/BRqzGbO8JFOmSLLJgQfi6VQaVUTE38F7uNlmpupAPAUCCAERUyfGeD+9Op638ycjTO9vK2ekEOFEM6W9aZ5f7zdEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB7120.namprd11.prod.outlook.com (2603:10b6:510:214::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 20:33:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 20:33:44 +0000
Message-ID: <14f9cc76-201a-bd4b-b7be-12e4fb17077c@intel.com>
Date: Thu, 1 Jun 2023 13:33:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/7] drm/i915/huc: Parse the GSC-enabled HuC binary
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
 <20230531235415.1467475-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230531235415.1467475-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:303:b5::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bec6023-5725-41d3-f896-08db62df7e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9ZKHgGfzcgHKX1VPbFJhA9GzN34XU3E9gqkkCsnJMsNFTNawILB0WwJyLHOedY+wrUj7ytgWp2lOwbIvZhIMiOiQ2NxBEOoWvL8Qdm8y6wW4jxKWWSAEpJpiRrKqowtBCPxrIY+UBxBKYMdbV5GogeqvMjEYTQUMS4wn7Nij9mZ6EyRnJu3/9++Tn4IHKk4Pj5W6mB518xjHHfaEwDnhxNCLor6Zf30/+lbTmDSaRluCRltg1/XuYxP/rWS68Ql/CxMCtg91HlnS/6z/yb7rl9tWKp1zK4/oeDbuU3O3V+CQ4YJWX2mU0q2eTSgNcsRw/j6lFOn2GH7TvT2upRiaDAlP/Z08hZtg0SzEInISGVc2BmnIp5VHMR6or9Pvll2PQjdOgl2CovX4ItYOCYbTLVNIwcWjDXcmy1wEXU+EfC9YkeOldc+GyrAO8R6kxSzPDJ1BnnSW1FV4qtpmp1od/ASonPZXWX5RDWYtZLlmDE/bpXiUliJWoi6tsaKrOfzmPG3YchPDLFpaPtrXiAbeNO9Q6zGgYvKfP4yPd9/yrD9wiCaqNDFXyJY6AYB7rO6Jk4rBZIoTcRPrR3pQe9EnzZHsKzGucOY6JwuiV+JjRDDSZqVWb2gQLSAg78/mb9z/yodQ4/5czkNKlhMhrRSlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(2616005)(450100002)(478600001)(86362001)(6486002)(83380400001)(41300700001)(36756003)(6506007)(8676002)(38100700002)(53546011)(186003)(4326008)(107886003)(8936002)(26005)(5660300002)(6512007)(31686004)(30864003)(31696002)(316002)(82960400001)(2906002)(66556008)(66476007)(6666004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndyZm9LdFF6dUdpV3UxTzdoY1FNc2hTdGZwenZlZ3VIZStLamRTM3htOTY2?=
 =?utf-8?B?dW83SVh4Qm4wanp2MjA4VURCRllYbCtka1RxVHgvNVZKQUIzVE1MTkFaT2NN?=
 =?utf-8?B?bnl0blpKUU9kQzF4MmpBcjNON1lsVFZHbTNZT25pOGdIMnFISWtlYnNPVGRJ?=
 =?utf-8?B?ZFRTUjgvQUFvVW15YmtGMjBSUHJwZy9Fa3E3dXB0bVJIYzB3UHNIYTluRUFL?=
 =?utf-8?B?cWF5NndhaERzbWhaZ1pZcHY1QmVZMGdnZ3QzMEduUTRlcWFyaE8xYmM0YVBZ?=
 =?utf-8?B?SUZscmRTWUJMWm9TYjh1dzFWZ3BJOGxpdER0dlIzRVcyOGZyZE51bFJoR2pS?=
 =?utf-8?B?amE2ZndSd2dpbS9lc2Rzd2xIRERjRS9hNmlBRnV4WnRJYkhmWnRoRVcvYTlV?=
 =?utf-8?B?ZnhIbHNUQUhPUVZYWkQwaEhvOWh5QlVuMGthTHUrT3R2SVpPckxQVVhRdUlF?=
 =?utf-8?B?MWl5YTVTVzcxdEVxbDM1YVBtSTZuMXVLUldrQkpVUTB6VklkZFhQaUxqMHRS?=
 =?utf-8?B?Z0dOQnYwQkVMTWVaNGRiUlBFNDNRRkhwYnRLV04yY2dQWWV0eTY1TkIwUEds?=
 =?utf-8?B?WXlXdXNwYTM4RC9BZENGNXlwQ0ZYZkRrdzFvOGZ5T3FFSFVMRml1VjUyVzBG?=
 =?utf-8?B?OFZjVmQ3b3BaOFlITkRRN0w2UTczL1JSNkhaVmx3TDQwckJsdnpFcWg3MnFU?=
 =?utf-8?B?ZzdWMFNEZmdrditUWWN2YmdJM20rVUc4Y2ZzZEhyZnNCNHlVV2cxeDZiaXZa?=
 =?utf-8?B?ZlJPSmwwMzR2MkpoR2tzdVBmSXIyNUU2OVg4OGxUd1ozMi9wSU9qb1JBUzI0?=
 =?utf-8?B?NmJsWmZzM1N1S1Zyb2ZiLzBwbmN3azV4MGRtejQwd3Y0Y21ldVNZeGxZU3pF?=
 =?utf-8?B?WHIzZm9nOWViN2RsVzlneTZ6dVZNdno4Ymc0SWhGSHpvamw1b3RBaWFkU1oz?=
 =?utf-8?B?UHZiYmJUdjVrY25aUG02MjVxYXE2ZFVZbE5RM3NzWUVsT2NNdVd5cWVySUdw?=
 =?utf-8?B?UnNrMUV1ZjFISGFMYTh4UkhBUks2aEdMRlQ4QlZQTWNQeTVoeWl5cmxGVCtP?=
 =?utf-8?B?RWU1ODJYYWIvc1pUWTQyVUZBdTV1MnZxZldTSHdaTzZNT0plNk1tZVhpaXdm?=
 =?utf-8?B?T1c5a0oxQ1NUWTVWM0cyTWJYdmVTNVQ4RTQ2VnFUcjRpSVlaNXI5UzBjOUxZ?=
 =?utf-8?B?TnJMSEhPVWh1REY4cVFSRVRpNndRUTAzQi9QbEg5OUVTUWNFZFdHWlIyWjV1?=
 =?utf-8?B?bGdEcUpLV1lLZHNhWjZXS1Q0dmcyYlB3emVmbDhJZ1NHdFRWVkU4MXRIOEdE?=
 =?utf-8?B?TlV5cEd3ZUZyUzB0NkdFYlFreXdEckhpZ21sdGJuNjZ6NWNkeVpZY1pyOURR?=
 =?utf-8?B?dE9yQzZ3N2tsd1poRjFtTmF6Y2QxNHFxRVVSdGZnT1c1ZERPMUxLVFBFKytH?=
 =?utf-8?B?L1FPTXI1MC9VRERMbE5ZSU5mTFZVejJ1L09KdldNMnpFUm10SjdOUEdxSFk0?=
 =?utf-8?B?aE9zSDR0VEgvYU5YTkduYjlSWUdWOUZtQ0wzdG9nekd6eEJHNUVWS3hEaWRx?=
 =?utf-8?B?bUVjUDUvbUNpMWxMWitYSE1pb0xJT2UxQllMRkxGTXYrOHNHTHM2Z2QwRExl?=
 =?utf-8?B?ZUZYQXA3ZUgzZTMvajJFOTRrcWRFODAzOEY5Y0x2OVl4bi9iMmlqYzFEdy94?=
 =?utf-8?B?aGwyeG8rTTc3QStzQ2xWRGhUTUFRRkZQWFVEVWpJMTBtMFh6eFgxK0dFTGxS?=
 =?utf-8?B?RVBsaFBjc1Y4T3gyU1NqSXR6dk5ZcEVnVVBPOGpxV2VZY2s4Zno3WllISzVB?=
 =?utf-8?B?V0F1QXVxL2wxV0htTXl6d2lZZEc0bCt2ekwwdjJDWXlBSDZSUitoRlI5YlZr?=
 =?utf-8?B?ZG43WlBiSkJ4RnNvMGxmSXNFUXQxdXRsR2ZqWUlOZGQ5MXM0NkVBdDdZMFJl?=
 =?utf-8?B?QnBZYi9mVkdSeDExUHh0bEFXUEZzaGthRldZOEE2dHIwSHYrdDNMSFp1VlU0?=
 =?utf-8?B?NUhJZmszaEpqeGZ1N1NzblJwRWFtOXB6SXJSRXh4R2F0N1VpS0QweGdGWjBR?=
 =?utf-8?B?azFZRktwOXEybnNoUDZpZGEzOEZJRkRTMkZmQ2J2V0xFTklFczhWN285alNP?=
 =?utf-8?B?OU5yUG1aZm9ydnl3cDZlcGZ3U2hHWDdTNDVlVWtrUWtidkVkdWNYSTFTamJX?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec6023-5725-41d3-f896-08db62df7e4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:33:44.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0P9khPM18wZU6fNwv7ZMtHWnFFHKi0WattHp/kHTeQVZn2cnLxF5Vf3RZe9UN4opxvGqrSq1r/cR8us5ESQdDR1Krku/w5Iaol7+EGxxjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7120
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/31/2023 16:54, Daniele Ceraolo Spurio wrote:
> The new binaries that support the 2-step authentication contain the
> legacy-style binary, which we can use for loading the HuC via DMA. To
> find out where this is located in the image, we need to parse the
> manifest of the GSC-enabled HuC binary. The manifest consist of a
> partition header followed by entries, one of which contains the offset
> we're looking for.
> Note that the DG2 GSC binary contains entries with the same names, but
> it doesn't contain a full legacy binary, so we need to skip assigning
> the dma offset in that case (which we can do by checking the ccs).
> Also, since we're now parsing the entries, we can extract the HuC
> version that way instead of using hardcoded offsets.
>
> Note that the GSC binary uses the same structures in its binary header,
> so they've been added in their own header file.
>
> v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
>      message, check ccs validity, drop old version location defines.
>
> v3: drop references to the MEU tool to reduce confusion, fix log (John)
>
> v4: fix log for real (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 136 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  72 +++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>   8 files changed, 274 insertions(+), 53 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
> new file mode 100644
> index 000000000000..714f0c256118
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_BINARY_HEADERS_H_
> +#define _INTEL_GSC_BINARY_HEADERS_H_
> +
> +#include <linux/types.h>
> +
> +/* Code partition directory (CPD) structures */
> +struct intel_gsc_cpd_header_v2 {
> +	u32 header_marker;
> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
> +
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u32 partition_name;
> +	u32 crc32;
> +} __packed;
> +
> +struct intel_gsc_cpd_entry {
> +	u8 name[12];
> +
> +	/*
> +	 * Bits 0-24: offset from the beginning of the code partition
> +	 * Bit 25: huffman compressed
> +	 * Bits 26-31: reserved
> +	 */
> +	u32 offset;
> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
> +
> +	/*
> +	 * Module/Item length, in bytes. For Huffman-compressed modules, this
> +	 * refers to the uncompressed size. For software-compressed modules,
> +	 * this refers to the compressed size.
> +	 */
> +	u32 length;
> +
> +	u8 reserved[4];
> +} __packed;
> +
> +struct intel_gsc_version {
> +	u16 major;
> +	u16 minor;
> +	u16 hotfix;
> +	u16 build;
> +} __packed;
> +
> +struct intel_gsc_manifest_header {
> +	u32 header_type; /* 0x4 for manifest type */
> +	u32 header_length; /* in dwords */
> +	u32 header_version;
> +	u32 flags;
> +	u32 vendor;
> +	u32 date;
> +	u32 size; /* In dwords, size of entire manifest (header + extensions) */
> +	u32 header_id;
> +	u32 internal_data;
> +	struct intel_gsc_version fw_version;
> +	u32 security_version;
> +	struct intel_gsc_version meu_kit_version;
> +	u32 meu_manifest_version;
> +	u8 general_data[4];
> +	u8 reserved3[56];
> +	u32 modulus_size; /* in dwords */
> +	u32 exponent_size; /* in dwords */
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 268e036f8f28..6d795438b3e4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,23 +6,14 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> -#include "gt/intel_gt_print.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
>   
> -#define huc_printk(_huc, _level, _fmt, ...) \
> -	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> -#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> -#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> -#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> -#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> -#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> -
>   /**
>    * DOC: HuC
>    *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 534b0aa43316..3a9d81899a78 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -5,11 +5,147 @@
>   
>   #include "gt/intel_gsc.h"
>   #include "gt/intel_gt.h"
> +#include "intel_gsc_binary_headers.h"
>   #include "intel_huc.h"
>   #include "intel_huc_fw.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   #include "pxp/intel_pxp_huc.h"
>   
> +static void get_version_from_gsc_manifest(struct intel_uc_fw_ver *ver, const void *data)
> +{
> +	const struct intel_gsc_manifest_header *manifest = data;
> +
> +	ver->major = manifest->fw_version.major;
> +	ver->minor = manifest->fw_version.minor;
> +	ver->patch = manifest->fw_version.hotfix;
> +}
> +
> +static bool css_valid(const void *data, size_t size)
> +{
> +	const struct uc_css_header *css = data;
> +
> +	if (unlikely(size < sizeof(struct uc_css_header)))
> +		return false;
> +
> +	if (css->module_type != 0x6)
> +		return false;
> +
> +	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
> +		return false;
> +
> +	return true;
> +}
> +
> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
> +{
> +	return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
> +}
> +
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size)
> +{
> +	struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
> +	const struct intel_gsc_cpd_header_v2 *header = data;
> +	const struct intel_gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	int i;
> +
> +	if (!huc_fw->loaded_via_gsc) {
> +		huc_err(huc, "Invalid FW type for GSC header parsing!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (size < sizeof(*header)) {
> +		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/*
> +	 * The GSC-enabled HuC binary starts with a directory header, followed
> +	 * by a series of entries. Each entry is identified by a name and
> +	 * points to a specific section of the binary containing the relevant
> +	 * data. The entries we're interested in are:
> +	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
> +	 *               contains the version info.
> +	 * - "huc_fw": points to the legacy-style binary that can be used for
> +	 *             load via the DMA. This entry only contains a valid CSS
> +	 *             on binaries for platforms that support 2-step HuC load
> +	 *             via dma and auth via GSC (like MTL).
> +	 *
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_header_v2                       ]
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_entry[]                         ]
> +	 * [      entry1                                    ]
> +	 * [      ...                                       ]
> +	 * [      entryX                                    ]
> +	 * [          "HUCP.man"                            ]
> +	 * [           ...                                  ]
> +	 * [           offset  >----------------------------]------o
> +	 * [      ...                                       ]      |
> +	 * [      entryY                                    ]      |
> +	 * [          "huc_fw"                              ]      |
> +	 * [           ...                                  ]      |
> +	 * [           offset  >----------------------------]----------o
> +	 * --------------------------------------------------      |   |
> +	 *                                                         |   |
> +	 * --------------------------------------------------      |   |
> +	 * [ intel_gsc_manifest_header                      ]<-----o   |
> +	 * [  ...                                           ]          |
> +	 * [  intel_gsc_version fw_version                  ]          |
> +	 * [  ...                                           ]          |
> +	 * --------------------------------------------------          |
> +	 *                                                             |
> +	 * --------------------------------------------------          |
> +	 * [ data[]                                         ]<---------o
> +	 * [  ...                                           ]
> +	 * [  ...                                           ]
> +	 * --------------------------------------------------
> +	 */
> +
> +	if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
> +		huc_err(huc, "invalid marker for CPD header: 0x%08x!\n",
> +			header->header_marker);
> +		return -EINVAL;
> +	}
> +
> +	/* we only have binaries with header v2 and entry v1 for now */
> +	if (header->header_version != 2 || header->entry_version != 1) {
> +		huc_err(huc, "invalid CPD header/entry version %u:%u!\n",
> +			header->header_version, header->entry_version);
> +		return -EINVAL;
> +	}
> +
> +	if (header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
> +		huc_err(huc, "invalid CPD header length %u!\n",
> +			header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	entry = data + header->header_length;
> +
> +	for (i = 0; i < header->num_of_entries; i++, entry++) {
> +		if (strcmp(entry->name, "HUCP.man") == 0)
> +			get_version_from_gsc_manifest(&huc_fw->file_selected.ver,
> +						      data + entry_offset(entry));
> +
> +		if (strcmp(entry->name, "huc_fw") == 0) {
> +			u32 offset = entry_offset(entry);
> +
> +			if (offset < size && css_valid(data + offset, size - offset))
> +				huc_fw->dma_start_offset = offset;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> index db42e238b45f..0999ffe6f962 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> @@ -7,8 +7,11 @@
>   #define _INTEL_HUC_FW_H_
>   
>   struct intel_huc;
> +struct intel_uc_fw;
> +
> +#include <linux/types.h>
>   
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>   int intel_huc_fw_upload(struct intel_huc *huc);
> -
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size);
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> new file mode 100644
> index 000000000000..915d310ee1df
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_HUC_PRINT__
> +#define __INTEL_HUC_PRINT__
> +
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
> +
> +#define huc_printk(_huc, _level, _fmt, ...) \
> +	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> +#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> +#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> +#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> +#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> +#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> +
> +#endif /* __INTEL_HUC_PRINT__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 31776c279f32..ec0b3d214af1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -548,33 +548,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
>   	}
>   }
>   
> -static int check_gsc_manifest(struct intel_gt *gt,
> -			      const struct firmware *fw,
> -			      struct intel_uc_fw *uc_fw)
> -{
> -	u32 *dw = (u32 *)fw->data;
> -	u32 version_hi, version_lo;
> -	size_t min_size;
> -
> -	/* Check the size of the blob before examining buffer contents */
> -	min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
> -	if (unlikely(fw->size < min_size)) {
> -		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
> -			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, min_size);
> -		return -ENODATA;
> -	}
> -
> -	version_hi = dw[HUC_GSC_VERSION_HI_DW];
> -	version_lo = dw[HUC_GSC_VERSION_LO_DW];
> -
> -	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
> -
> -	return 0;
> -}
> -
>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
>   {
>   	/* Get version numbers from the CSS header */
> @@ -631,22 +604,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
>   	uc_fw->private_data_size = css->private_data_size;
>   }
>   
> -static int check_ccs_header(struct intel_gt *gt,
> -			    const struct firmware *fw,
> -			    struct intel_uc_fw *uc_fw)
> +static int __check_ccs_header(struct intel_gt *gt,
> +			      const void *fw_data, size_t fw_size,
> +			      struct intel_uc_fw *uc_fw)
>   {
>   	struct uc_css_header *css;
>   	size_t size;
>   
>   	/* Check the size of the blob before examining buffer contents */
> -	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
> +	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -ENODATA;
>   	}
>   
> -	css = (struct uc_css_header *)fw->data;
> +	css = (struct uc_css_header *)fw_data;
>   
>   	/* Check integrity of size values inside CSS header */
>   	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
> @@ -654,7 +627,7 @@ static int check_ccs_header(struct intel_gt *gt,
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -EPROTO;
>   	}
>   
> @@ -666,10 +639,10 @@ static int check_ccs_header(struct intel_gt *gt,
>   
>   	/* At least, it should have header, uCode and RSA. Size of all three. */
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
> -	if (unlikely(fw->size < size)) {
> +	if (unlikely(fw_size < size)) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, size);
> +			fw_size, size);
>   		return -ENOEXEC;
>   	}
>   
> @@ -690,6 +663,33 @@ static int check_ccs_header(struct intel_gt *gt,
>   	return 0;
>   }
>   
> +static int check_gsc_manifest(struct intel_gt *gt,
> +			      const struct firmware *fw,
> +			      struct intel_uc_fw *uc_fw)
> +{
> +	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
> +		gt_err(gt, "trying to GSC-parse a non-HuC binary");
> +		return -EINVAL;
> +	}
> +
> +	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +
> +	if (uc_fw->dma_start_offset) {
> +		u32 delta = uc_fw->dma_start_offset;
> +
> +		__check_ccs_header(gt, fw->data + delta, fw->size - delta, uc_fw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int check_ccs_header(struct intel_gt *gt,
> +			    const struct firmware *fw,
> +			    struct intel_uc_fw *uc_fw)
> +{
> +	return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
> +}
> +
>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>   {
>   	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 2be9470eb712..b3daba9526eb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -118,6 +118,8 @@ struct intel_uc_fw {
>   	u32 ucode_size;
>   	u32 private_data_size;
>   
> +	u32 dma_start_offset;
> +
>   	bool loaded_via_gsc;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index 646fa8aa6cf1..7fe405126249 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -84,10 +84,4 @@ struct uc_css_header {
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   
> -#define HUC_GSC_VERSION_HI_DW		44
> -#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> -#define HUC_GSC_VERSION_LO_DW		45
> -#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
> -
>   #endif /* _INTEL_UC_FW_ABI_H */

