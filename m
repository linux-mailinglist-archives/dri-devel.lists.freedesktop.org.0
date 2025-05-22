Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81608AC15C9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 23:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B0C10E02B;
	Thu, 22 May 2025 21:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wec3eDww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B18810E02B;
 Thu, 22 May 2025 21:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747947987; x=1779483987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AITzN4g5pISMB6FzNlQCim94Tv5vEv7Qzt7tV6pFZeM=;
 b=Wec3eDwwL0y8/75PVdiloCF7PGLVMbeYhis99UyEqEE8lRxFnEPGnDcX
 prZ3oYSvusJRlsbrd9Ig0EZ/W2qFRI2BdMcVpVevxc6Vmr1ROCGE8Gqt8
 K3bNYeQv64Qa5C8kDdBH+7V+eIULPWhOaSkZ88p7KezlO8L+yqELecXN8
 qb9nySujqMk/Tu72jieMEqrYrsdDpGAvipYvLRGUBMPpyDtWw9REQ6VJu
 Ir3mUnP30rwfCLky7/q5HiiCIkTdetW4hCr6Arp4VOSTa4cQZ2dUKfbyX
 2QihgF89KttcWuD0+GVLD8aJf1BVBioDom95/MQQXiZ4qTlu0UXN/AVdU A==;
X-CSE-ConnectionGUID: +siczIqrRkGvFWYyvIIPcg==
X-CSE-MsgGUID: uyjAdE3GSOqwLIZH0CANeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49110630"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49110630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 14:06:25 -0700
X-CSE-ConnectionGUID: Wj2otKoiRFiZxlcQ9eQYog==
X-CSE-MsgGUID: ExkPOeeRRw6mTSKRC7VYWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140640487"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 14:06:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 14:06:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 14:06:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.56)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 14:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH/BImOCVHx8syLTN4mXrF9dYwetJPyUMlp8HmqYItzBBWVMAVna88+R2rHXY4kitRBRvwPRMIuQ10cYTyuKKfaebpiL0elLfrfHvQlDJcYR1vwQoWywunPRDzuwc/2DyLjWBPQKC23wGlib/y38x+kBf8Sx8Dez5/q6Bpa2BiBQuDU/+kUZnYEJgeDt+eW3NcIM/M6PwUlyG4QltqqMFD18ycFmhjcze+MmZUZzGi6bISC/41QpZR3M+bfs7ZJAw6n9AR6sOwFC0KAgoa8ZzlRREvupqEAG/VipBQtstFndsF2FJX+Cn/r4Fvh+THOE6FYBKZvgc/3A/+obn6lwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCDI3s9/W+srN6qGXcqIqt8Liaf4gNE3HlhCuIqz9qc=;
 b=EmI8hyE7dHtJeZ/B00Uhhac/9w+SLg5Guj0rgAFFywI0isIxGBg2fCKlhUGTEb8wTZNWPJTirXR5rpFskMuJOS/jAbEogRkGUOlVW7D1GSnkztqNesH+i9iAfUV6mcivX9JkQdv4sXfSS4EKDYk+U0/CynamWzhJtGR89phh+lrWfGiMhDVlV+uiG3bkuFpvABvkh5LETLv86kIeLFWUqssz6tmQACsg5T7B9FfBMaTEF1hxhkcFEh3pyJg8Ss1BFJFvtVWGlhhZuOkTwSo179CiW5817Bupp5xXbeoerDADI8a8x4oprZHZU9DFabmlSQq38Ca+3kXwp832/EVP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 21:05:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 21:05:49 +0000
Date: Thu, 22 May 2025 16:05:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
Message-ID: <vsyxybzdei2tgybmhwbt7fc2rerphe5zmgbvgh4uj4sr3onsru@bcq72ctoli7q>
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
 <CAPM=9twLXMbaTNhr0y52aA90sytE2-zb_zC4eZ5xLC0CE1_1dg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPM=9twLXMbaTNhr0y52aA90sytE2-zb_zC4eZ5xLC0CE1_1dg@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd94c3f-1550-4b18-b404-08dd99746d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oL4A2X5bMWOPobY1R7+RPHcEdCUA4Mhg9nw5oalztbFJsXHkZCyDF2xWS+gW?=
 =?us-ascii?Q?IJUlfBQnh+rgdXQxfOb8msfHi1K4RM6xtF1E5sCg93ddiidSDe6EeJkE09P7?=
 =?us-ascii?Q?/8lS9QtCSiP9yeCNHroqz2rKzJAuyDcEL2LaFfKHB5gUzPzfv9mqhujsVjWN?=
 =?us-ascii?Q?YfbyZjGwBWAg98lUyS3pM11BRPJwvqXxxeCwJNZANrlOk7m6gQve7Iq1/W6L?=
 =?us-ascii?Q?baBc+6O06u5ScKkl/24I7L9pTY1qsR4wqmzLsE4Y7U7gOGcK9e2wVWleqMY1?=
 =?us-ascii?Q?5h2M8498ab2SPWciNvpItpV34wLi2QbmUR0dPJsUaZ+o/pVXDI9f1w8f7A/E?=
 =?us-ascii?Q?VfMJDdQxCba459kxyY8XCi21VkRPMcHQtTo7G/IXiPxL6Z3eWMf2b4SJuThL?=
 =?us-ascii?Q?F6ywFbyLhMZASJABrjpnnLEJww/PrvFv609MLbrqjVvho4lrz5qQ7ROutptd?=
 =?us-ascii?Q?Tv4+TSvwIjlkDNp0FgoVHZVPQtui0HK5uj84DEspR7N9DfHkzeDns7agrXR6?=
 =?us-ascii?Q?vJbw5tAZ/2r8D+qhC33V+pxfXctEznA19vzPiukPww7sklvePrx+ERoibhoG?=
 =?us-ascii?Q?9wmCWEOi+daoIRlrxAx7jaysCLxVLTpCD0mlU/u+CRySbZuymVJD2lT/XLMp?=
 =?us-ascii?Q?c7h5m7oGwtIrdS7mG9zOiABjm0csGVdaTPOVWOrXAnJTpk8ZroFvi1LppDxK?=
 =?us-ascii?Q?Ya22YwvMSZx+mvJTXs5otsK0CR6HiTwZJXb7Ahfc8UUvzle4tUvdA3YYp3of?=
 =?us-ascii?Q?PNxvqgASD5jsEKb01FzBcMLWYy+qy3Um92lY3vQ/CRoLo0CqOQYw6NhEEkql?=
 =?us-ascii?Q?jX1RNeghtwhgNSYE9IKbjFzg0lIZYZmVjw29tPZbeFMHCk+Jk1O4tZRt0HrC?=
 =?us-ascii?Q?y6/JJi6LqjGS86adVKV9M4v53lyGaOX80jJlQ4JTjaYCxjMlFVg9Uv1O/Dxn?=
 =?us-ascii?Q?AgykVtCmmW3YPukCq1+eNVhGYh0BeVnHE4v2duzMFKB4VopKSAu6J8B0iQgw?=
 =?us-ascii?Q?11DOMuheYj1cV5YirYDX4K8UzXNN5+YmurFGi8ZoIHxs8/MXekMhp4BonU7a?=
 =?us-ascii?Q?a2FNty/fj3FX62tTGPdM4XdrzxSvML1DCn31H1Z1uKuvRm0MHuLagawA+bbM?=
 =?us-ascii?Q?pgvYyoCrAZV/KybCkuSG9Svd1Usmxk2bfFTufh09dVgQLrpe9yAIPcs5upPK?=
 =?us-ascii?Q?pDiPKI1Wl9TRoiTM27gx1lBIziEJ2zXZsneEZRWTwXdEQ/a+XBKJNlEa+vyG?=
 =?us-ascii?Q?qlv7ag5k56nuQlh1f25QGpNfO+ds2v1hPT9uBWXJ9Oby1BDUrr+ny8D4Jzp3?=
 =?us-ascii?Q?zoCxgPAI1zMFTdeh0dXrUfqSsQWuuyTChLUas9DDvlvuWU1oGKL1idogHPg5?=
 =?us-ascii?Q?SjnZkFdrmAyZFXwqUgAyDd093NYDDOlcPLTRgXYUu1e0ghKkhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Ae13jQ51yDg558P0NiABznS0E5kTP0UBTxQOzIVe7/O5kO02M7As7nsnsqo?=
 =?us-ascii?Q?XwesgJvY/RsOsTt+ai31BRo639tD5gw9r+EOxfWRipfW8pHKJGTle0dXGhH2?=
 =?us-ascii?Q?OrQfkiZObYzkRdET2WpMXq877jCIDzDz0wlr7CER7miFuYilGrAyPxZW7H8u?=
 =?us-ascii?Q?ObUW/+AK9ceNuDsUm2Irj9Riw6cMnM1G+1sTpk/rNEuOSzZybQ4+jaANzB2s?=
 =?us-ascii?Q?dPtI3ffywfQa7ro2nplwZxbWSAErl6OA6hxLHd5v3AbG0JT3o+EeALT+Sahm?=
 =?us-ascii?Q?OpGY1xg5109YojBbcv84038b2GzBq5f78Y5nZcDF7CS1yG6wkv4vsUGzJsAe?=
 =?us-ascii?Q?e0lRSfr73nUmh0bx6OEY1qm9+s+Mm1pEalkSnCsxAFitAosNkiURsqAYMsTG?=
 =?us-ascii?Q?q1J6mhY6PHqWdQC13kAaOWz1lerkIL7aPC74c+y4MrnWqDlZNtETqS6dieLR?=
 =?us-ascii?Q?Dh1yWz7FBGnGyKm+3/Ep2DkBRAKnPnyuy2AFYY9hs8FfOp9Fzg0mKhrSJgKA?=
 =?us-ascii?Q?mCZfoFEJSoRPlOxULMsgk/vmXOSM+AyYCokGwCwHXBGQLvWXq8BsaNtDTZHC?=
 =?us-ascii?Q?0aADXkTFw6xfCtGcrE6q/KRcMYC6hX20VEmc+kkOfzwxmM7WNFkltv/l91dc?=
 =?us-ascii?Q?QSk3dgvtbccgszKvSFcJeBv4EJmORBwbs+S9x+GZWEceY75NDsqgQjjdpzYg?=
 =?us-ascii?Q?5gmtVKYWQxY6P8x2PMWGBoCerQgK1Y0J7LwjkZkxCklzPuvMtOTuyJ+5jfKd?=
 =?us-ascii?Q?DuWYdocOUEM2zGyAAI0chSFAcC8RQJuvVnQfE/5Pu9AgMAfCMV0vGI8YfHPO?=
 =?us-ascii?Q?rdjQHh9oBy3poztOWSHvVtbUaxD1dQT386iGnCQkOGGAUR1CyK451pF6mcYL?=
 =?us-ascii?Q?tHplMuces4IuHq5R/p2zvX09cveoq9q0xqbV8czM2RxFVf9OKOUEEMEhYfX8?=
 =?us-ascii?Q?jbpPd6S9mo9v3yhmJSvHLRWHOHSlzp7oUwuAggIi7NmyIg90Y0/Wif7ODaIw?=
 =?us-ascii?Q?fjcn0aHP4m7+22dREAbEqjXZst1w7RH4BRU9Kv3OT9HwLl8VER6lkYAhy7YZ?=
 =?us-ascii?Q?ArF3zmIu2ZaB3jiBM/uYo3SfNxkWc9X8bEswb1wlG6FNz3XQ3oVXLu7QxCE9?=
 =?us-ascii?Q?CHpmnR65wYfSXV8Ff8MwGle0qONCnhF0GYeUHxJUy2m5l5dr9++agA94xAOo?=
 =?us-ascii?Q?JZ2F84irUcX8I3RSTN0WxaQpvN9F5/eXqEyBiBrWrPOCQmfiBfnSXU8rH5W3?=
 =?us-ascii?Q?Ar/lMTEhoaWomHMgcUrXQvIiU1k/zK6KFqewrkPfu1EbPgTXXgQiFHYib1v1?=
 =?us-ascii?Q?A/RLBbBGd3d9+aR/SyQrGzTJhSQiE7boS19RDGv8LhTAENfgqCdtfHW98Phb?=
 =?us-ascii?Q?PrzamHW/Vnr1RBUkleOAOqWpBK1woE7YVN2qUC4i4ozbYBBv/CrS1FrzTJQ6?=
 =?us-ascii?Q?M9nW418C8Am/bv71hneg7aUyZJk5xYoQHBSi6nHrlX1wOMroO3g32na3E/8A?=
 =?us-ascii?Q?NlO9N2uJfciWatmyri9Wrd1F7xqnHalvOBUU6qC0yvvRpJWh192W3Ko/xgKZ?=
 =?us-ascii?Q?F+YMI0Cd3RRjeQ+Zq/M6GISrWpoiG5uYC+7EOldmbQQlsqXAH+3OGNKwOvjB?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd94c3f-1550-4b18-b404-08dd99746d6e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:05:49.0023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUlMDGwtmE1s26VDWFL3ldJA91WX4EkWMjNOU+Ch3nwjW4swoXit+E/1UlcLUYSQ6rdaqwsHx/U9NE+RARHe03YZzR7baLQ4lUD7RudozPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
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

On Fri, May 23, 2025 at 06:32:43AM +1000, Dave Airlie wrote:
>On Fri, 23 May 2025 at 01:10, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>> >From: Dave Airlie <airlied@redhat.com>
>> >
>> >This reduces this struct from 16 to 8 bytes, and it gets embedded
>> >into a lot of things.
>> >
>> >Signed-off-by: Dave Airlie <airlied@redhat.com>
>>
>> Replied too early on cover. Chatting with Michal Wajdeczko today, this
>> may break things as we then can't byte-address anymore. It seems
>> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
>> there's nothing preventing an unaligned address and we increment the map
>> with the sizeof() of a struct that could be __packed. Example: in
>> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
>> In this particular case it doesn't give unaligned address, but we should
>> probably then protect iosys_map from doing the wrong thing.
>>
>> So, if we are keeping this patch, we should probably protect
>> initially-unaligned addresses and the iosys_map_incr() call?
>
>oh interesting, my thoughts was of course nobody would want to use
>this for < 32-byte aligned ptrs :-)
>
>but I forgot about using the incr for stuff, I do wonder if the incr
>could be modelled on a base + offset, as I do think for a lot of stuff
>we'd want to retain the original vaddr for unmapping or other things,

for the parts of the code that want to update "inner blocks", the
approach is to copy the struct and operate on that. Example from
drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:guc_prep_golden_context:

	info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
					 offsetof(struct __guc_ads_blob, system_info));

then that function can manipulate its "local map" without affecting the
one used for really mapping the memory.

>
>I'll play around a bit more next week with at least protecting against bad uses.

thanks
Lucas De Marchi

>
>Dave.
