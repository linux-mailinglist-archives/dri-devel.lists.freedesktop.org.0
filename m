Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD617C98D92
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE5A10E46C;
	Mon,  1 Dec 2025 19:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfhNt6hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8594510E46A;
 Mon,  1 Dec 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764617104; x=1796153104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1oY1XBS/8Q/zdWWDjE9vY7QXOXlNd2jiY8d/BagLLeM=;
 b=GfhNt6hubRADR2Kp8DWOYvwfR8O/nEN+IEMI8FMsv2Zu2BBakka5Q7vr
 C3a2Q7HtJrJwBusrD/tDRtVD+x0MaIIgerep5w8DqXqkj0Rcu8YeieQQO
 8/N5sUK+t51x6DN0899OPy60cPeqp8AJDjZeedFlbnohIoQBUj/uInkve
 SHq1Ct/TSglielC24SSr1k91yZGh4COuY31Tn2HxVdz45VsWfdE3ZonaJ
 tiEnIL4V/uSKHm/J18O5pbXGMsY2x+31C8Y7vJcQZeKXgH2UgnDAys7zF
 I/uAFELUIPMWp+2QevbVx93fIAlkXZFYYyN8HXlMtkDrA9sSnuSprXvVZ Q==;
X-CSE-ConnectionGUID: CwKUKRgyS7WTKAYOOy3iTg==
X-CSE-MsgGUID: RN++83QYSB62HszCcNCMpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66284529"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66284529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:25:04 -0800
X-CSE-ConnectionGUID: h9Vt+ZhJSM2LCqrz0WYLNA==
X-CSE-MsgGUID: VUs5RYVbSgup3kHntH4xAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193281775"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:25:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:25:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 11:25:03 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhHj35iEj2vjVTJkRzzTlmyYSv4H2gOPwD/Wi9G6O+fSkNASpfRdy9/HzgFGQd7Jmdk67cG6OmdXGcnkdWheEXWwNAE/fYMMVl0dDMOd41MqvWcoPZD/1ZH+dPZwLIK4QXhwMtywd4twESNWbGPYCE9r6Xxa0pEnVchDr+08UJIcSWxmgYgdvxMxWXBG+8mr/2n80fbmASJQWFWX6xOQVsPK1iDHBMYnOa+OrtZsAw8feoJ4lYV/uZ2pn4bo3is3pzdaFWMaBSNhI0MJejiGqDppOIdag7T7CMC/unrzynJGUn6CUe8WAF5NwYHk4Cj65M8itLq6ym7COhuhXQ2Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nczQkMIzUsBm0zcdvqjcZEqo5Q+XoX7uwrwJfWRdcF4=;
 b=r4qxvr57P6qBVShsqX8ouzq87ZJ64Bki5mRlRzSgk9X9U7xH+4OLTHFGIHhjtTvI915oM/9ndKYZxPZ8fOHBklApEwHqCTZ4H+JA14ETmAtNxC4BKkbmA7rCLH7cC9hWhl28vwboiKD02b5juiTIY5NOTw73hqvJ7gxJSEcyBYdvldua3eHbPPBz4dEMhniEJ2g0E7P3yQnZLILVyDRjcJoEXIUyXoQdxkncbbobhGg5WC+2+8AK84fWXonErh8+rQQc3hMbkaM/620pKCl1zXKgX+3XOvXnjh8UHD8/jCOq8YGHwyi7NsY0PRUox8yoekPnHpaV6f7vEGFEpLwWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Mon, 1 Dec
 2025 19:24:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:24:58 +0000
Date: Mon, 1 Dec 2025 11:24:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v27 4/4] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aS3rhoQPRdqG4huL@lstrano-desk.jf.intel.com>
References: <20251201174443.139151-6-jonathan.cavitt@intel.com>
 <20251201174443.139151-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201174443.139151-10-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a6c8f8-00c6-4779-bdb4-08de310f5095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3uIBI+uBpUzoc+jcp+eT/Coku1p8yQrmZ635ezHv//YrOhZs6PykZ3MUn4I8?=
 =?us-ascii?Q?CV1deOeTv7wR7JVuDP8hAhvESTC5JVAiCEiWCEX+7pjycDfpxUN1YCwPsHzD?=
 =?us-ascii?Q?jtDcQkWfw2BPa53TKTXJY/GUhXnGYVqZpBuMPbCk3cWjAvikmaxEU5AaX11U?=
 =?us-ascii?Q?hLfnPGa+Q9Ek98VB2iElLRTwA4TXM0aRVVQCbFTL4Iezz28dCmb+Pe3bdlhU?=
 =?us-ascii?Q?Lab/Btxaf7v5VOfJb4jM5AaZA8UpD6gmyKwx5FX8zu4Z9yGvt5nwZM0ukSO9?=
 =?us-ascii?Q?n3MZ8kOMV+yc2sjlStwFwoNwXc5d+E2k5K4yK5GxNXzHVy1Ery1afPorfpZa?=
 =?us-ascii?Q?qzs75WL6ATWsnmPPck3qgkVsEEhfy7k/ppd2aVwv1AjTylK8bWAkvFNhJXSC?=
 =?us-ascii?Q?sMSexSFV/jOuGjiXInXRaO7PnvWMNvdOP+BaRw5bjgIC1wOAFWY6QC4Q7xLI?=
 =?us-ascii?Q?VX7BCcE3iixO+yDm9TUOnf3Iunud2QG4Zg9z9mXSepe0r09bnAsJsGNustep?=
 =?us-ascii?Q?XYQwn8XsYHUd+yxkgBdM+aJfBTaob85yM0vVmKAe18SBjLUpj8fnFnVOUMDx?=
 =?us-ascii?Q?OmXE18deWhEosVLQrDCGQ0lXsQRlULjx4TyHhqBsmMwZMVyZdZ80qdZ4sy0i?=
 =?us-ascii?Q?INNsmpRNaJaCFe0CEtmcbHHPtFwnpEEQkeBOhOZYUYL56eNLb9FIz50f2doX?=
 =?us-ascii?Q?RN6Xrhg5AyJIcDNib8FMVNvooPPLo0qOItZgmg7EMJD733X9nDAh+bOBxCLD?=
 =?us-ascii?Q?66IhdfkTtpoO01q1F0keODnw5n88zVmQ4KjkC4Fh2qMi+8zdVaMDAMre1mL7?=
 =?us-ascii?Q?lpivxcbcMoeIlwTef4CWlgQAXpOI//jOSAODuj8n0hdOfVoX60iftZpcAvQI?=
 =?us-ascii?Q?HrOqcybbNXC4sZ99lRUoFfqHqbVNzcOeusn0I0j8n64Q7Q4vpVcsMwwhVxlb?=
 =?us-ascii?Q?YnVy9ZV43HCs/K9s7WBApz8i40QOKLTXYB8WANbhk0cjnEeNIwayzjEiJ8dG?=
 =?us-ascii?Q?FXo7YPpytILpqRdiNidREpYC2vXSZv5n441KsitUKA3pIb+JaaNUNAuqQm6Z?=
 =?us-ascii?Q?q0pUGCKKnxZm6w0iWY0Mh0HAh+rYj/ET1uMaUhc9jS028bpVgOeF6wMrbjgs?=
 =?us-ascii?Q?zcVDG/maomr12DD+Npo1ywk2ZvxOtQleIQX5HGQG2pXqRSdSJ672vP7eeKTA?=
 =?us-ascii?Q?60K2dzmffdarceX7IaLc0eXQX9zS4wkOqGlFKjISrEVk92WmJ8QPEb5AOyGe?=
 =?us-ascii?Q?MwYdnKaWept5sdUzjzHQeCfUbPAcAGbkTGaAD/HkmjNhxlx6dNmydUdrOtC1?=
 =?us-ascii?Q?sjc6mDkJLyMRf8GJa9RD2RGsJIG2tkotNsEbw9W2noK6JjBtWyOaIMz4RUz2?=
 =?us-ascii?Q?3tKcIuSdnxhj91aYAiYzDOaQC/Xox+bWSw++TkaDn/RcnmzI3uTOcfYm0+Q+?=
 =?us-ascii?Q?Wnk4ue13O1n6LAIqjc0HHkT2TZeL0e75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?76EYJIq6QpZs1VHT2/ZCUj/KrWESGFkypFGWvmOzNDXUT/HY0TnedT9EmSOU?=
 =?us-ascii?Q?BTrB6sJ2WbZ4CGxA3EZQkLv+m2dIKNBk1BIDWzLQyGRg+OxGQycrRizjQJhj?=
 =?us-ascii?Q?+rDqUHBh7KwkMqCKa4XNoYdjlhIkJg0TtxD2wUfu4AfGI6qjPD2QKbo1yHVP?=
 =?us-ascii?Q?JVCfLx1AHvBC20tgbw5Q5FV+BaNtl5lrzwuN2owig+6QC74Ykjv7MIJl82BP?=
 =?us-ascii?Q?BOLS9et4yklhHN5VEuiUKKCbyFZINdxEeIiRNRTZgBU0iMAPYxe0lOf7Popo?=
 =?us-ascii?Q?xUtwlFToOpnGvV2NOkroIE1U3SnHUmbrvN1WJDQ0N3g1sBq/B2YMXyYMY8Lp?=
 =?us-ascii?Q?g5aBhgzlA/mSkO6mdSAajVY4kDJM9XYE0he/EUdXYeid7p+wzaK4QzkfHghF?=
 =?us-ascii?Q?Q9d2k9xOFswpJusXWBQUYzcxEcVmYnsqtuDf52bA7HiX3y6YaZyvtIqqqvxN?=
 =?us-ascii?Q?eyy5fzITVlUYtSKnZ0wQ9MoTy2btKIBVObl2y0qNX/BaxnHSUGyQpvLRIo1l?=
 =?us-ascii?Q?kkRhyQPQW+uDN/31cGop0kSMkO8h/o+SGO2V7r38nZNEHgx4rvVubV/H5c2C?=
 =?us-ascii?Q?CfOpToNudxPuK3rTykzN66AsCA7ug7fHZd1tRdQwp4+afcHKmyx53eJJfOgT?=
 =?us-ascii?Q?ccANdqzOY8NHweEnIqIeZVrZ1J3YaxZr4Yh7OpEesLhZwPsImc0Yaci2gNez?=
 =?us-ascii?Q?X+v1RaOZKSzCO55lj70LbazDd4M7p2y1sUcQ3RJX1XynDNqjNWp7yU1gMoh0?=
 =?us-ascii?Q?FyCHqjTZcjAWATNvIabNF74Zd1n6wXaZ7NPmW9m+QyulfkL8zUVXqhp4badi?=
 =?us-ascii?Q?g/4Btpd530vmgmng/XqiW/c+5DC3NZFgLV5IB/95SIfuzrVwPQWPdbD2n1Dk?=
 =?us-ascii?Q?ydYmY6qawtPNr7OE0O/J56n6GPz3HC60wOupA0Ys2rbF+u2ycJ+2Ss0//OBr?=
 =?us-ascii?Q?0a8EyJPFBxRqG7cXaFsxR0m3RrZkuX1yeeAEM0mPMi1GZn9D3coyI2FYQEBW?=
 =?us-ascii?Q?pUG08sqZ0p9JqJ1jApbSGfpQocBeIgOPcoVYyfuoa3S0TF3wwPTxlGJ8ck20?=
 =?us-ascii?Q?ArFa+71eAkG/xmOHgo/doUJm/R+Jz0cCPhccb7yCyvqeCqxmT+oIoDAp0EP1?=
 =?us-ascii?Q?v0PjRJvnsecaNwuMbLU/sZualTQVGhIviqB9IfBZpmVy52oVYkYRffmCYDDr?=
 =?us-ascii?Q?TKQ1MHQkQsfYbZV5TUPu3O9BMrYN3Je8dWtUjHF3Zhm/BgzT56jE+hNxB+7b?=
 =?us-ascii?Q?JKeE6X0sItZcHHe8osC/20IxGRMdWRNaxgIsv9yeQtCIGnSMrf1dNgWXklXx?=
 =?us-ascii?Q?Arxc1ZAN7Z1z3kj1YZbKWoqY2PiZ2BF279cTlCGJM3Tg6Dfb/MxVZzZxyqlP?=
 =?us-ascii?Q?motZqpyLkjK1HxgGGKg/VjzYmhM+NmQAVHjRLcS9IrgzFgDATaxThIO+5GQ0?=
 =?us-ascii?Q?CzB8oBxR9TKAz91G4cDXKBRe2ZSudPR1419a0bY68i2HAK2rnXA+/a7RIe28?=
 =?us-ascii?Q?W1SmX/TC1iNmRuw2NOaFsI8EicpRkLgK7tTOmGU2uxZnpMdUEQztjYSSWkCB?=
 =?us-ascii?Q?nMBZt66UWISAyRvY49C56rqfvBqSUHett83/jOCcxG1pg57S9wD4MirzHVut?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6c8f8-00c6-4779-bdb4-08de310f5095
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:24:58.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwrhuDxC+JpiMfvstXwL7Y6U7IaVQoPlPIuSTZa+PxfPxHXGs956Pkn+qrQy9rWK3XQzQ3EpXMViQvn47O8KYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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

On Mon, Dec 01, 2025 at 05:44:48PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> v13:
> - Remove engine class and instance (Ivan)
> 
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v15:
> - Remove unnecessary size assertion (jcavitt)
> 
> v16:
> - Nit fixes (Matt Brost)
> 
> v17:
> - Rebase and refactor (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 108 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   3 +
>  3 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..69baf01f008a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e69e10233b00..9995b13bee72 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3871,6 +3871,114 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type)
> +{
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type)
> +{
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level)
> +{
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +
> +		store.access_type = xe_to_user_access_type(entry->access_type);
> +		store.fault_type = xe_to_user_fault_type(entry->fault_type);
> +		store.fault_level = xe_to_user_fault_level(entry->fault_level);
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);

I don't think you can do a copy_to_user under a spin lock as this can
fault which seems like it would be bad to service this under a spin
lock.

> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */

I think you need alignement check on args->size to ensure it aligned to
sizeof(struct xe_vm_fault).

Matt

> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
> +			     args->reserved[2]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index e9f2de4189e0..f2675ec9e8c4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -210,6 +210,9 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
>  int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
> +
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> -- 
> 2.43.0
> 
