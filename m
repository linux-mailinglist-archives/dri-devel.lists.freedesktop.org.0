Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAF7E05B7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 16:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207110E175;
	Fri,  3 Nov 2023 15:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FD210E175;
 Fri,  3 Nov 2023 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699026353; x=1730562353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MgJxNXhsn5DaacTzJLPmOKeiScWt/CSOIFVersZ8FgI=;
 b=SpM1rtG2nckylck1YFXp2WWElBYyaojtwADJKmq5ghHsDWCIUqjvCJmw
 E82e4SZtIcNBVAjyRsST5UM3Fo+nCHdQPYDLQ6rIBDrgzo1l5mBw2396L
 j9+0S+kTtyNLY3kk99IzaX6Zqk/iY4Ml9ukanrBcauAuxLYM33+pM6hou
 3SXFCi27qhDq1feHgJoEUvGSKfBl19DPWQkbuERKZXqWY4Q5PsszL8xVq
 mcJNB3LJ1mEBZfs+td4VVwnVoo7J23iGGl41OmQ0CFwEh02lFsxlc54zK
 yavmvbb1azfKA+t7HQibLC2I2oWZDLrHh19N5wnu989gs5HJE5QpjZ+lo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368311301"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="368311301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765276639"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765276639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:45:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:45:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:45:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAL34murqHs4OAbH4WIeH8ELESI3hNmuJcnZKHF15CqipGhzNsbiY7LUnN2l9U/8CtykybE3J6gOTDIfJ4qx72imgOZsUSEjPVcb8bxs9eqgnC9XY2tf1UCfCAyEtHnpywxyAHU2hkjoiu0UyobeEX3omVtCvwaFyszMAEALQ0dbpKCzPivwVL5V1YjEcvfcATeKcD9KPCWdH0ua/qwnWf2A60nGIu1xQZZAQ5sjEm7vv4tAvVNUaUT/DJ6lIFiWN7m4csd85hHEmygOK899XSCxXLJEHnxoEX9Dge8HL8MXwAHt5255O7hy6lL39xe2Q1JrUyfXioSrw2BBSdOOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhW5nOTGgKnaHNtZsjhfFR3CtBHRocf4J6trwGzR8mM=;
 b=dF+YKaWjKzOS0eDwqv2s+fSEJVYS4nvntwv+0io+g4EnHCAgIBTPK6hsONCBAHDFAqn8vcycfihsLbsce9n3Gzf+eOPnQSgKvGl0YtEiug5b2pFZ/6czYAe01g9S+txv4scXORxctS6r4Hn98gXjHekvhdrYsadmp/vHwj43XWy+xs7BSF3RFTqJuonu4fMUxmNUNkSNWI0zSVTMGS59zq33MQYnlw7ZsZZ/fi5+piPOLR1JJMC5khyvPiO0cSuKNo1dPw0vk5xtCvZ4xqRjqNzC21X+LXMeRi1IYuSRkNDhy46qrkCGC/XZJqCN9B5K57ziL0L3kRqpR7yBc4DCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.21; Fri, 3 Nov 2023 15:45:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:45:47 +0000
Date: Fri, 3 Nov 2023 11:45:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip pxp init if gt is wedged
Message-ID: <ZUUVqCh/By+whSYv@intel.com>
References: <20231101214446.600290-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231101214446.600290-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM3PR11MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: 74423b79-f916-4b59-1e4f-08dbdc83f295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiL442bmdpokNsM9V3IsNL2w8URzcRWefmN4umgW1DvwPfJqQJiVo0HS6JS62/Fe2N6xAfdoPOL9WZytSkBsINO5/08Wb0d6ukU+I734je7dYYY7AEanZN9gw4PX1CdDZ4x3WCfMTniFmTLV8x6xyOsj04IqJ1kZgdxu2+0feh7qCTuEA5B99ZLYHZ5XI47HuaqqYfu/vUS1vUDLh8lLp6ByhW2hcTW3QvDK547V4ZDuCLW8tjoY6F8W/Bp5tgzZEDz6XMkcFijnejfC+D9c85YMPnz9gjKUABya/A6m3sS/3usV0toKkNO9VdoWSeq6M1wlANrQxFk+UIPHxVeBAutWUHNoVo94Jdo1yOeFF6v+IfYFDEJkDjJG7aKGGFJw+6naAovWqbdDd4FhsT0FmRVuhseKVH7PMqEYFxeaWl6cIbnQRaUO8581raY4pUktzfJBT0v8WXwJXPyRJKOpOHSJ60qubQ9Mda+PZfEHV8pnYhFY08m5iZ+byck1PyT7bPpvZF8LHsY29p7GLQT1L8cyCGXIhtl7zT+QUF8E2CiZHxb+bQe4D7asqpOinV7g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(8676002)(26005)(44832011)(6862004)(8936002)(41300700001)(2906002)(6486002)(82960400001)(4326008)(5660300002)(450100002)(86362001)(66556008)(478600001)(316002)(37006003)(6636002)(66476007)(66946007)(36756003)(6666004)(6506007)(6512007)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0TWJLEFkdyj5pTbXZoOiUFCaxhOO2lZZeN7Nyc14EEHU6KjBBMQcGIC51J3D?=
 =?us-ascii?Q?RbPP4Jgb3aIhbuEKr+sSg1nBYH1R4wNzpxNFxc+9qeAyleuNskttuyk15YnC?=
 =?us-ascii?Q?aIfvQMKyV0xLBHbotZtx9Jr1J/o8RwdUIeI2NZp8rHOJrQHWtCGSfoDxTfP0?=
 =?us-ascii?Q?YNUc4sqrbesUNbE12J1fggG/VayO/XdZaFf0Jhh4j/Ez++u9PC4wO0KzM7ZQ?=
 =?us-ascii?Q?30EuJZ4Vs38169XleBFb9g/eXSxDbXI0fiQAtE3y43/9nDM5EACBuPwxWSXA?=
 =?us-ascii?Q?UZg5BpXu11PxBI7mv5FePfUPUPUYpT9Pi7d5jWrSuFW1DacbLEzjd5jpQ7vo?=
 =?us-ascii?Q?eCzmY/v+0oHZEQp2kXbv0SMhHWJj/RABG7OeaWYjx9v4jAz5sT8SODMJuvwn?=
 =?us-ascii?Q?tS+U0WXI6wNNyuSKPenYeJ+F0GV3fFcuc+RR16RomWZItHgTyjjWup/iU0db?=
 =?us-ascii?Q?+YRRI+Mb3is6UY3tTkVHvXLgUnuwrt1exwdbkKTCQQ1NnzeDXZqznSsIyJMl?=
 =?us-ascii?Q?EKLthOvBXSBrcvwI8CyKo7D76MK/wIE1lq1HnYfwslDF0gatecO2ISOwUjHy?=
 =?us-ascii?Q?osIU9Xy6NbiuxfahxrPToQlV/GjzDttiwa5HtE4ZrhNMd5eSAqGguoEw8QI6?=
 =?us-ascii?Q?J5Qb2kWHHlJIJcvcK554PTOuZ/RrBtCD1Kl/BCqNis2WVDmQzFyWhjS4xjGB?=
 =?us-ascii?Q?z3Wyn0J70OcrNz4wrXLD3Va6IcITkyF/UnFYyERR0HPe8wjtbPREhM4NnWof?=
 =?us-ascii?Q?oZr87/byy359ECv8ASIG7XubiPsmsVsVrfvC2dNuvvv73Cskhd7dNcuLNbzP?=
 =?us-ascii?Q?cRZNXyab5SMIDCLKtmp6zyGppPxTVrkdHfhETie0RHMLSARufFyPbTK5Gnxe?=
 =?us-ascii?Q?cM2PBdBrssisS5CdqphYHoFeCmYkqhtUu8rTPha9UAFxIEJfAjeg4rLMn2Lu?=
 =?us-ascii?Q?Mgllii59Akd0lqMAHZnu+qAAj/pF48NitDQj9m+EVV9YXBU/LgmURgLFemt7?=
 =?us-ascii?Q?FO3EExyRDgQYM1CgvJyqiU0iPenJ2JM3fZ1XubQSXEU3zf0PlbG6U/bf1ivD?=
 =?us-ascii?Q?ul8yiSCLRXHS1wSI6bg+h4rgvwz8iwgDnfr905J0OCVqhNE8oFN8mnlB2TGn?=
 =?us-ascii?Q?+jAWB+qnwWfTlEvO/GrbJ2NUtMjvjTCeEVo1PPYCKWq/g9TbSEEDp6JCOayM?=
 =?us-ascii?Q?QUTuBXbzHjdKCjAOf1/XwdhM/0mjJ6dtI4FDP8Pp/EWB88+h5pULVK6iIS59?=
 =?us-ascii?Q?uHnDwM08qS/dvTXEqQOxg9vVzHo05fZiy7S17WA3xKk+0CdY5j2iC0A07e6c?=
 =?us-ascii?Q?5vpDdkdF1ezRnfBJIPlG0mXYSRb6H6NKe0FDz/4k0ILk2RYuXCeF/6eow8fY?=
 =?us-ascii?Q?68CoSTaaf3TCaEQIJjJRNxO7V7aVcQZ/p1YtPU8SPzw9fCoy88S8HbcEUMKa?=
 =?us-ascii?Q?aA85Uy+uyC4KRy/qomGx3O9pYV3fp1vQNaECgG807CbvcTZrp/pJ/H87iu9E?=
 =?us-ascii?Q?44VknBqqmFhJLjNiqnxZMyjBUhdn34CY/xfqaZePY/1IhRwUHmJtIzzpOBrh?=
 =?us-ascii?Q?pnpU9P0h3ROglhmrIMAmtRMAK/FpBsIcbX25APGoiBHbAma3PDhwMMY073H3?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74423b79-f916-4b59-1e4f-08dbdc83f295
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:45:47.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itDFKYPJe6uQO2xvChkRb4HK7hI/JbykAVSQiK6W252sVUpgvSlHAIRvX1RDod66NdnBekkeAyKsok0XZFlY/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 02:44:46PM -0700, Zhanjun Dong wrote:
> The gt wedged could be triggered by missing guc firmware file, HW not
> working, etc. Once triggered, it means all gt usage is dead, therefore we
> can't enable pxp under this fatal error condition.
> 
> v2: Updated commit message.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index dc327cf40b5a..923f233c91e1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -212,6 +212,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
>  	if (!gt)
>  		return -ENODEV;
>  
> +	if (intel_gt_is_wedged(gt))
> +		return -ENODEV;

we need some error message.
also we need to fix the fact that these returns are entirely ignored.

or you convert this function to void and then add a message here before
return; on this case.

Or you return some different error and at probe if error but error different
then ENODEV you print a message saying pxp init failed.

but we need some log/error information. I honestly would prefer to convert to
void and print the msg here.

with some changes like this you can count with my rv-b

> +
>  	/*
>  	 * At this point, we will either enable full featured PXP capabilities
>  	 * including session and object management, or we will init the backend tee
> -- 
> 2.34.1
> 
