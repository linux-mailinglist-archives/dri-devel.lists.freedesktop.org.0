Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C07A10F7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38B410E12D;
	Thu, 14 Sep 2023 22:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398E510E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694730563; x=1726266563;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rRSy8ahWruHOTwjiGvIyB7F2IwZgFZAXxUf+RZsjCsY=;
 b=BXX78tGm2TeKpLgO3CylyYXNyE0ymmdqeJR1qI0y8jNo5bDLCSFddGAW
 nLqoxX6p8th08SG+4jgSyF/akbkmeTPZI3BL9ePja9ZFGVKzbGl/hAlmV
 vuGYUnnmDXOs48gMMW4bP96++iTj+8yfzUMklfjjNnmecuFX3ik7YsOxp
 yVojv4K6z++rlRykUm4nmHL+rWnZo4xrCU6yGqaSMMR0bpMitOo0eTJKi
 kdmDKEaQGynaVTm39nQjXL8wsfKYm3uOQbhcq1Ikb5LNQuMN2sfHsOzTt
 c0iuIrQIQe63801c0OpZmFEg6Rg8gg60/uKSB1Wqh0Lt+/vlFbjThUtwL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379015876"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="379015876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="834935698"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="834935698"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 15:28:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:28:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:28:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 15:28:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 15:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WElrbKCDYni9LOGWE/FY8bgaqm42Hgg/92P4QpUhkbXWnOjoSFtraI/oCadexq+rRe9OJ3kX4Yx6vEKJFLjV6AaNaEbEzxtin2CbvGZX6FAFrSfPMIu8EDHBeEPChOiTqcB6ClCBFofqEMVpkJ/9AKYbLliwEXfL6LSJMpCANexxZxmQcNvLsYJwsKd1lTMM8Sbdu+RcnOLO/zQeAXmeZi75q16HFKuh275DCuSGNLiZcYi5ncKHbE0VBg0wdxQwO1tv2SrJPqVxkcPMaY2OYCAzEfkzqmumbrdvpRrZ2qqcxIC9N7gAuFosx1ctrK6wMz6lmLYdPtmbaKSab566Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzFOgPb/MpdpNHSHWk0hxULWMBjOo6i21EuQ0KaGqAk=;
 b=NI0oGreO0zQrI7yQUU4rnDm+GKhFfsBD1voKzWNk28DKi8vxcQquAXV8zH26TnwWALF58DjJz2ljro5EkMA99pA5GNglUbV3kz4XOpEaOAT1ZkoUfThZuxRX8ObiS200M3OJW5vb3nSMCsD+qvzrVOO7yEH9PIuSwLmuRdcZKLV8J4+bWOmgXa04F4noEMuKnAJ64JpAG63cKU1cCBsTeX6n8Moi5/0T+VvlmXU44DJ+yAjV6VWY9W78L1CfkaCzzU8OwbqFu1l2ZkmKJjqC4f0B2sxiuZIsRUStupq5dUF1rOV0/EkHEOkyZRDBdBMWZ29d86s+pmOAfrmVnxgJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 22:28:53 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359%4]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 22:28:53 +0000
Message-ID: <3c729821-a96e-7d9c-9172-4c1ea8fb17ab@intel.com>
Date: Thu, 14 Sep 2023 15:28:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
 <20230907001549.81262-3-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230907001549.81262-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: f52b9019-12c5-4045-d1eb-08dbb571f9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OJJL9Dls/QnhZXBFQPL+ZyqxYX20+ab4clYkE0NfnvtSOEKhd9h7AUTPqZrWj1ii7f8ug7RDReqo0dC0rziKFBtjns0WBf8WNxFuyng6LxoZDKDuolp7HjC3oa0kiqib6gBNrAFX4FGlkCcAMyCsgBrqwyyaC7BaTueXeGPpdHKAIIqUfqjD1aXkeHBGZ3WnCQmotXRW3HvU5xmT9WwIMRknPKoUACBxEHY1X4aDbPKEEraWsYVa+tpDo6aoUJwIDTSzdwPRVataBLtBDkCYZ+O9mjhS+FkOTI3nfdXi6vnKLjBe+3kv6QfCpAVi1am8FnH0fuvYJclFugoI1ZfNXDCO5sweY2OQa/h+mIHCwI0QIYAxfsFn3nNTsiq45GFnsaww2TUGAzjYBqHkRzywDdJGf/zGEqVzOsz2lrXD5mPa4xRAQpvf2z7Twkxf+bATxOqSyro+KlRf8nQmWx/48o28oh/TEXEiusi3eKH7fyjSYGN829bGNxcpCgj/N7l387sDo0L3TDknWjNSEir8U7sJ0O5fXzD8aIXFmJCPg+kr1wqKvwR5hILeltYWN7tejmBlCP56ytN+vNl1U2CksqSqHy/ff7LRSthGnd4FX/lRnojIVDZ5+id1zSTzAgmHOmulxTuWMnQsZYsirhnLdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199024)(1800799009)(186009)(478600001)(31686004)(6486002)(6506007)(86362001)(2616005)(38100700002)(6512007)(82960400001)(26005)(53546011)(83380400001)(6916009)(316002)(41300700001)(66476007)(66556008)(66946007)(5660300002)(15650500001)(2906002)(36756003)(31696002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlCK0luT0VnNHhnZFlMeHhRcGFBOWV3dVYrRmYxVDNNNzJzVWNsczIrZ3Jo?=
 =?utf-8?B?ZVFEajA5QXZNVnh2dW1ycTh1Q2k3cHRMb1k3dkVFUU9Ec2IxaXhLSVAwZXZH?=
 =?utf-8?B?WlJ0VHhCNW9GNkhBNTgwTm55L3E4SlRKa0xMbS9UZXBFUVFwMlJrMHJoRjJm?=
 =?utf-8?B?dWRoQzJmb0NyLy9FS2JjbjBRZFJzaEZjR2lWUWtrcUFlOTNwQzIycGZmaUdD?=
 =?utf-8?B?ZmNlUGJ0Q29NNldCdm90dnhPT0p1cnZZaldmV0RGZTJUYk9adkgxQVJPSk1x?=
 =?utf-8?B?eGFUaEY4MzVzdTNpTFpOV0xpNVRZT29sY1JZQjdhK0NsMnFkOUlqODE0Wm1T?=
 =?utf-8?B?allOTEM2ck12a2JzTStYUE5kdTE4akFmM2hFVm9ZRVVQWVErcXpMcUxpTEVB?=
 =?utf-8?B?ZlVobEhndW14OUlhT0Y1WTQvaXo2U1hUN0Z4QXRsREhHbjQxYU94aUd4c0Z5?=
 =?utf-8?B?c1R4RXVPLzRXTWliUWVWVWp2SUZ1OEhFZWZlVkx5QWtDOW5HSGNLODAxMGpp?=
 =?utf-8?B?QUJYNWdlZUtHQnhGZjNtVHZ2dFpwSUdGK1R3UEIzaW5UY0I2S25SczJVZTRq?=
 =?utf-8?B?RlRFc1hULzRlQmp4M0xIdzFyVzMxZ0hKYXZYbUNGVXdSeUtpMkowbmdGaEhr?=
 =?utf-8?B?bFI5Q2R1QVNyL0NpTyt0WGpKSUdDU1NDM1libzBBMGcreGpoejJIdjJ2VDVp?=
 =?utf-8?B?ZXMrYUErZHpnam9ad1hwZ3V0M1JFZ0lJeFNBNE9pQ2lSc09IUndYS0cxbjFL?=
 =?utf-8?B?NXBzODUwQUVKSkpKZm4vVUhGZVdOVXE5RTZPUjRsNTZ0NzVKVXVwU1RCTUNo?=
 =?utf-8?B?N29MYnM4eHI3TkMxV1ZvQ0JJc2kwdUo0a2h1OGZyRG9PUWsyM2MvY1F2NFFD?=
 =?utf-8?B?YzF0NzFKUGgwcnVNejBhV240WGkxQ1hXMCtGMFI3SEZQNWZQSDBQNWpzNDZD?=
 =?utf-8?B?aE9KeWVEWThXaHQxRkRmNHJRVHU5WWNxZDN1d05ZV2xNNXgrUmptMmlCZFcy?=
 =?utf-8?B?dDN1M2FjUWY3dWNHcW1CQWVRQ2cwUEtybCtlK0pNb2lsMFRnRi9MZXh3anR2?=
 =?utf-8?B?Y0NGMzVpQ2RKenRCRUlPQkdtSkdVdlg5ZlgwWEtyb2ovVWhsWGhjQjlaemNm?=
 =?utf-8?B?bmY2TUFXRzFNVElOTkZFd0Q2UlVCVU8rRFA0ejFYajBQOXAzYTBaMjZtaXMx?=
 =?utf-8?B?VWtIRjluWjNWV25VN1MxQ0hiZzFWTThUeWhVN1p0YnU1RGhmL1gzVldzZndr?=
 =?utf-8?B?N2dVcG1rOVB3eUdSWTRxa0JndmVLbjhicTBDa2RCN0UxYmlaSnpYMnN1NW01?=
 =?utf-8?B?Y21wckpFNjIrT3Z5V29BVkg3V2UrbVp0K0phMy9OdTYrY1VtT0lZelNlTGdn?=
 =?utf-8?B?QURVSDNMalIrZCtQa0JWVVFGOEM1b2owc1kvYWRsODVZZTEzb3QyVjVIV1BZ?=
 =?utf-8?B?VDhGRnhKVTd4L28wM0RkZVRCK2Q3N0czVzhudnRaWWdOWXo4dzgyenJDQ3ZZ?=
 =?utf-8?B?RWsrL0dQVDN4eFBEOWw3Qkc1a0ZuMm9vekViQXN4dTB0NTM4aEtMU2RmRk9j?=
 =?utf-8?B?V0k1Nkp1U3dwUlJZNk1vMGJWQXJOSExvQmtOYjYvU3grVXQrbVVZVDVMME9U?=
 =?utf-8?B?TUN4Z1VXY3oxNHFLTlU3ekFPMGVjOThuVzZDMms3aUc3RElSQ2FIVUdqb0hQ?=
 =?utf-8?B?R2J2ajlySy9YMEgzMEJ5YkpSNU5FVTJwMithRHJIU05JclFzRFBWY3BwN3hY?=
 =?utf-8?B?R3VYT2Y5cGJhb042STZ0UVo1VTB4NVE3bU5zTWlLWDUxUG41OS85b1BUSFRM?=
 =?utf-8?B?V2VtemQwd3lGRU9PaVh0Z0tMN1ZJSGhKL2VZL1lKU3lOWk5ZYmdjSnBDQnBr?=
 =?utf-8?B?NWlBZ0l2R05qYmI2Y1NndGROTUZTeXhxMHZ4cDFuL0ZacFZ2YzM1eW1Dci9P?=
 =?utf-8?B?czV2RENDek96TUZ6OUQxVWlhcTh4eitEb3BxMkg4WFlQM01hZllkNU9MUTN3?=
 =?utf-8?B?aW5XQWlVMFBTdFdKSlh2bVJoK2ZydjFJeWRHNnhNK1pjNk1UcW1uZFVDdStL?=
 =?utf-8?B?b3BSUVVTdC9qUmRhQWM1Y0NpV0l3SEZId3UzS1k4ZHdwc2YydXkzL0FyUFJB?=
 =?utf-8?B?ZkFNWjVJVjhzZmoySG5KcmhjeE5PMUZ4aVdlTzAvQ1pFQVdqeEpxVHJxRjYr?=
 =?utf-8?Q?Wk22UxWpTet/5YmAbNw/94Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52b9019-12c5-4045-d1eb-08dbb571f9e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 22:28:53.4359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07BQJRS8lQbevNe7QoO/uw9IspvAeUOYtnBl9E/1ZdTyVSaG8naKa35kG1cuzogeqaNxuhSeKudoq4XjxXhD6Wu1Esn49iLxmmyQht1pTXQgV4LiF2UPl2bNq7AhfsGx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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

On 9/6/2023 5:15 PM, Alan Previn wrote:
> Update the GSC-fw input/output HECI packet size to match
> updated internal fw specs.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index 0165d38fbead..b2196b008f26 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -14,8 +14,8 @@
>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>   #define PXP43_CMDID_INIT_SESSION 0x00000036
>   
> -/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
> -#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
> +/* PXP-Packet sizes for MTL's GSCCS-HECI instruction is 65K*/
> +#define PXP43_MAX_HECI_INOUT_SIZE (SZ_64K + SZ_1K)
>   
>   /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
>   #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>

