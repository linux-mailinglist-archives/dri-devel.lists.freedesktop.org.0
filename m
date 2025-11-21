Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE5C7B155
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252D310E8F2;
	Fri, 21 Nov 2025 17:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cr0uBVYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50610E8ED;
 Fri, 21 Nov 2025 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763746409; x=1795282409;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=vaj3GN/zxg/973+aQOS0y3wPZzlHKdaAA1dR8VKVFZQ=;
 b=cr0uBVYM/ENGp2ip+RSQMkJiA2rtB7pz56ja7Ulpj+2M0VERzwOUfyyO
 laRsers18i5Bkd6V0TFTqYF+cqNF0MAHUgsycuNWBHrQMH3YmKmVc96Hr
 xtwZhhTtNnArKUcakxFmr/1A7nAZ8F5sWDp+3b/591DN8k3sLstjLaX8b
 2xFtgq2wfRUGgXjkcjTEnK2b2zFKzIpki5Lo+JzIBmIktYtENdLKHN+Fe
 WOhEhibJqPKp1v/7T2Cuma29cCOoNyfB+8yw+SNrV/nvoGyuJLX0cJeuk
 XIioMsqLCmyxi19BJS8GoX6XzPmzURMmax0XZ+Gxxk9pdY1XsgjY0lunP A==;
X-CSE-ConnectionGUID: e1fSJzw9QnekeL0QRMCjNg==
X-CSE-MsgGUID: A9uQuRWkThWgQ83PnBfzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65737738"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65737738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 09:33:28 -0800
X-CSE-ConnectionGUID: 5eKB3VzvSk6xMjNCGg9IGA==
X-CSE-MsgGUID: Fpf9ntUmRwKrrAOKW4GRQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191527152"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 09:33:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 09:33:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 09:33:27 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 09:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnLRN7HDjU4pNFB+uEgaO/una0Jnj6sKg4vSWsBUxVZ3SqzItFqoclWkVFQPCPCAWQINcazAjrSpThejbNNCvimJebDtC9toIDF9sIa0L8T4aUBBlaXvTu/jlBpslOoMaZ7Fj/bmsz0prmHI1yA3cVhImHkaTQpNVyghWTwJML6b8v7uXg189S2XZTXjJNIbXw6PdsDczFaNzthJi4KdsP0hY6l78Oo9a0D6JR/h74JMbe2d9MMGQPmlhGsx7BXQiFX4IltP3GanGmp0WWbS6d28yFBrHVIZjR7pY+FEevHl4B87kUl31lQDDiZxDhLorhZ80qU9oHwiHgKcdngsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGsWPdGZzKHZE66Z6rrqYHjLKzoiJ2Y4WyjqcnEHqWk=;
 b=Bo2XAp9GhU15XbHv6rFmRkJgfF8AGw74ipV5EgK89R098H82GH+0wYCWPYWsQcmUP4Frgt9NNmrQ2riqOq+QfecOnCk7PQtXPQgab/B1DMVDjPLEaU7cu+gFHV9pwgt1eE7dnknBCojMtoSNN6lm+Bqb7c+IvEiDYXDycsfwsw4lYWDo0/49WOpWKy0TuFH3Gs54/G+0tSX8VcAS40Kh32AR7/tfaR5/nsplL5OlLtUPbSlhD+UkD4jbdD4EdFHmCn9R/SW7fpIA2dAEEHrl7ioaOA3GrKg1+NBsD2Suc48rwZbK6wjKiE1gykfolaJ5dEF1kGOl55+p6NQfLdDxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:33:25 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 17:33:25 +0000
Date: Fri, 21 Nov 2025 19:33:18 +0200
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>,
 <arun.r.murthy@intel.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2] drm/display/dp_mst: Add protection against 0 vcpi
Message-ID: <aSCiXk39fjYvDquI@ideak-desk>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <20251119094650.799135-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251119094650.799135-1-suraj.kandpal@intel.com>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 70eb7640-c0be-4dd1-c317-08de29241326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jwNsZyo/OqnGs8Cq035uJRFvfbS9ncUBPLEQ7lndQ+ni3nRplBc8CoXbxM/i?=
 =?us-ascii?Q?FYZ2rxD5Jf+g00V1EfCX3xknoNW5LAGo5Hpw6RiAdIYPE/hUVykW6NNoXoIl?=
 =?us-ascii?Q?5OetxJRpOobR5hH9Q7aMLbx8NlYoMGc1VKKK+H5nrnjb6eBV0a2R3rXiR2Br?=
 =?us-ascii?Q?c4fhTkaHpqw77j8bXZv5rZocYvzxLGivTBDc7WEbyvn9G3Xw2COBhEPimNm6?=
 =?us-ascii?Q?Jg1kbBK/2Zic5m4sGsiAys/k6no+xuTA0fDJrvKKJlcgote/FoFLw0Ikw2QJ?=
 =?us-ascii?Q?Fi/U3n1QC6CvYi+JDpFZJE2zCloMa/I9EANHrgnfQbfUhf9lWqATxflLRsu7?=
 =?us-ascii?Q?JMy+tGwbeLd4V2tAOfwMwoJPg/0Rwwj/7Yrb2vYkpwr6dgp1ccQfn2W1ksHz?=
 =?us-ascii?Q?eqAnUYV2Agpy/s8wxlRWT9buWalL8wpRBRmBFYnUpR52IeM5wL10dsZsVHo/?=
 =?us-ascii?Q?6OFs3hPtt3En7BDpv6rBJygW6IvsxhFgXElNE3H3GA9O0XFLhgam5aWDn3Uz?=
 =?us-ascii?Q?VjY5I0JrIgAPTn+PJVJJBVkIT5ri8g4kzQ7gEbIh6o120YOQQpSc/3N+E/EJ?=
 =?us-ascii?Q?vdAUwaEaHPFgMZ2JaUo8G/NIOmHOhkVVdZkGqyiP2VLU3dluJNEBOBFpx12W?=
 =?us-ascii?Q?YeSQbmaYOrKgJ1hjTcRn6LBk0yjXUvEWg80xirtVOhTIMmI7Ca27I24ggSHA?=
 =?us-ascii?Q?SJWatte6dOLU+jDeL4drCp1jLInrHuYiSUbXa/TI2IzbP1OAxXQlQol3QiMj?=
 =?us-ascii?Q?rhqF8C3ODz9AmG1E5PhfcPZlQ1Ha4nscnPplmNWoaZK37nW1/zRql/IqbcGv?=
 =?us-ascii?Q?kqUO5/JDgQefr6XzpX4/pQEdeBik2+ZsaEGr8m9ix1UyoYmUQ9AYbR5UEPp8?=
 =?us-ascii?Q?fDvTBYokf+C5u/hVWYfYq9iTYzgHJaBfoV/KISIbtgbHOP5MsebxLk8++3ik?=
 =?us-ascii?Q?srxtNeaJe3zpCym5TUgoMYWRAsn5MmaQlvGi2iVWYjj9vxQ6AIyMLJzI2SmX?=
 =?us-ascii?Q?uojrS/DvZ9VB8jlTCMtBk8H8CeFLHiG/zCn3mvGJI6pqpTmwNUziGwv34Gq3?=
 =?us-ascii?Q?VsqtXPHoBNsX5QsXaBPjTG+TwAxoElvOpNfMhkkcg/1/qjySSdvVLmFF1Hty?=
 =?us-ascii?Q?s+bzQxU3iBvKfMvTagrDy6nDNktmyYqIMzTEkRpXh6RtcuYr4x4+2UF8ye6Z?=
 =?us-ascii?Q?LsAPA+kMQPpy0UvSlfwcdFvV3mBGe14IMojULj6nYuuKOkYkTjcZap8m0dbV?=
 =?us-ascii?Q?IJ8CG74jxCPOE5RMETF+IJFRnKpEljsf0gXmcDj5NDUdminjl9Z/QFslMY1W?=
 =?us-ascii?Q?FAKXcbxGQyICdCMOkZ/XQFq1qzPPadHFW1qXTe98M6LSnyDXkcLzZvn2scKd?=
 =?us-ascii?Q?Jm1LqaZuwUc8nsRKJKeRk7A/THZiv04KHRcBasocLW8xSCM28A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JDuzfB/Be+0SYbfKOceLKAGer3SiH3Qu//krWxvNqsVc7hcSCIv0eRALWaBj?=
 =?us-ascii?Q?A86S/oE9zYE/7TSAAP3VGZjqY012MBKYOCu3PPfxoDM2bg5qkck4ZmbewNEN?=
 =?us-ascii?Q?o6eMdatfghLCQNcWz0H6T3GBZeyBieb6hrc0Sik6Msn/a8e8dIuIyLjBWmoA?=
 =?us-ascii?Q?Msk7K7UMN1Ue6fgdbIe7T9b3qI7vSs0oLlIajgT5Domylh5gg2kikWJh09mu?=
 =?us-ascii?Q?dNGJs8/+d17bkpzwZCbD6KIRTIoBXWt6yMuUobT/6MsZ6TTs8ZofWQ8V4W9u?=
 =?us-ascii?Q?7taFCjvs3IaJiel6V25GyznT96Z0TXi9xigXTG37K+hc/kn/pO2OrIVuQrjo?=
 =?us-ascii?Q?qonYyoYCR+A8NgWN0OhLzGK2rhDfZu6wyRrpLu9X/bmCcYrBx+hAYwLqYUjw?=
 =?us-ascii?Q?NCMVSil0Yzv3ue5hcgzfgeqN2NUmfR/hzSEFzk1oM3FR8QupC8Y4TB1SDbkp?=
 =?us-ascii?Q?x0el8qoZbdMUT9jVY2Bhnak2956dJH0RxZaXTrJOFHcVg8+NivOLud99mDnK?=
 =?us-ascii?Q?odBE2cWz4WI9lAeXpAH7xc+LyV+Zh2MiTufgTxYAHPEFtooX1J7WNPVbimeM?=
 =?us-ascii?Q?ro7vcOLpl+A4ND7JQbVVF/PhNcjiM7ZMNhgAEnsfFfdCkNWqjqruQb3Lwncn?=
 =?us-ascii?Q?UIiaEUDjyxGI5otc0DcY94K+T3GqK9Z9ikUJ5j/JQ4QA106pNKd51dj610YO?=
 =?us-ascii?Q?9tlhpRwVaF1uVFqZjPpWmyTGfq+CWwC88zquFYU2qLWZN8SR/Z4qroZfwyNy?=
 =?us-ascii?Q?YdOPhEd/8+nlx/X5mI2ooNO0cVABtArdbZLYug7C9ur65t1Nm2Jsl+JwRjhT?=
 =?us-ascii?Q?7e4GhCINWncm8Ke+EgMmnb3sH34Wdh/Pt61XcKHXOPIBZW9XPHg+XgHHzYaV?=
 =?us-ascii?Q?UvEZkQZhM42ryI0g4uUYtMrnJpeWNJyha2gm+Iv5fM/7ERWgVG0Tz5riJ18I?=
 =?us-ascii?Q?+MwUDTGuVpZnt3JKtcburbsWwii+3PMTwTL/a4xnNHPunnu42kYIcZ43QT8o?=
 =?us-ascii?Q?UnOarG7UqNq8N+D5Y0JQrcgoB66jrR+bG8RTrtXoaSDuqcnBCqX1Iw3gibGQ?=
 =?us-ascii?Q?b/6m+2JRf35IhfGOTKbgezcrrfYs4MhfLi2+SYTFf9DsbTGPkB7pKEkkWEEQ?=
 =?us-ascii?Q?mO+V/IGJIX4ETF6t+l3sVom1+k/t2Zeg4TC19/4wApOBi94aimD/ucOqueJ/?=
 =?us-ascii?Q?iLz7umkxDU9jSbrGToc8J9h6yVpvyck4vuSItuMEwu6e8jm0WBWHyd///6AC?=
 =?us-ascii?Q?ZEo7Ot+xdHP6/oNOwAGYQ72eKuDGdw/aBG8Y2RgrjLjTHJDryJaJNfVaPiX/?=
 =?us-ascii?Q?J8F4o8M3uLOjHPqxBo/Rav3NS3dbADpj4xXH7K1F0mUkJ+P7OgJ3qVzO/ny6?=
 =?us-ascii?Q?jGRFak/cpVw+Cj+Q2QrLaqVWE8NlNfOEOp6+fM83YkHUEZiRlDN7PQSxK/Dp?=
 =?us-ascii?Q?kAB85zgrR+RmGA80cLqcxQvo2ZMnF+URrpi7ixINYNgH5Vf5a9s7u0IjY18f?=
 =?us-ascii?Q?Tja45tB78Y3cxGiiBzpFgnxEYXRy2tqImloL27l/2zKZKmriIvFWoaEQZsiG?=
 =?us-ascii?Q?ZxTlYAsrvv5kZRZl44X3WPR8sOM1S6v27SMtFXwqlZrckM/3BSFhbe4N1pm5?=
 =?us-ascii?Q?LuS7IW/kczTEeMnFvVp1kcXKucv5VYf7buPc5GBvyJV/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70eb7640-c0be-4dd1-c317-08de29241326
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:33:25.2741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFMVxNTgDMCFoxwzE5UKTYaDmp4oagFiLgw2Ru5nYhKtWviQpphwWx0NjlYjIuRnZCyfx+Oeeg/kd/vcUAmU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 19, 2025 at 03:16:50PM +0530, Suraj Kandpal wrote:
> When releasing a timeslot there is a slight chance we may end up
> with the wrong payload mask due to overflow if the delayed_destroy_work
> ends up coming into play after a DP 2.1 monitor gets disconnected
> which causes vcpi to become 0 then we try to make the payload =
> ~BIT(vcpi - 1) which is a negative shift. VCPI id should never
> really be 0 hence skip changing the payload mask if VCPI is 0.
> 
> Otherwise it leads to
> <7> [515.287237] xe 0000:03:00.0: [drm:drm_dp_mst_get_port_malloc
> [drm_display_helper]] port ffff888126ce9000 (3)
> <4> [515.287267] -----------[ cut here ]-----------
> <3> [515.287268] UBSAN: shift-out-of-bounds in
> ../drivers/gpu/drm/display/drm_dp_mst_topology.c:4575:36
> <3> [515.287271] shift exponent -1 is negative
> <4> [515.287275] CPU: 7 UID: 0 PID: 3108 Comm: kworker/u64:33 Tainted: G
> S U 6.17.0-rc6-lgci-xe-xe-3795-3e79699fa1b216e92+ #1 PREEMPT(voluntary)
> <4> [515.287279] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> <4> [515.287279] Hardware name: ASUS System Product Name/PRIME Z790-P
> WIFI, BIOS 1645 03/15/2024
> <4> [515.287281] Workqueue: drm_dp_mst_wq drm_dp_delayed_destroy_work
> [drm_display_helper]
> <4> [515.287303] Call Trace:
> <4> [515.287304] <TASK>
> <4> [515.287306] dump_stack_lvl+0xc1/0xf0
> <4> [515.287313] dump_stack+0x10/0x20
> <4> [515.287316] __ubsan_handle_shift_out_of_bounds+0x133/0x2e0
> <4> [515.287324] ? drm_atomic_get_private_obj_state+0x186/0x1d0
> <4> [515.287333] drm_dp_atomic_release_time_slots.cold+0x17/0x3d
> [drm_display_helper]
> <4> [515.287355] mst_connector_atomic_check+0x159/0x180 [xe]
> <4> [515.287546] drm_atomic_helper_check_modeset+0x4d9/0xfa0
> <4> [515.287550] ? __ww_mutex_lock.constprop.0+0x6f/0x1a60
> <4> [515.287562] intel_atomic_check+0x119/0x2b80 [xe]
> <4> [515.287740] ? find_held_lock+0x31/0x90
> <4> [515.287747] ? lock_release+0xce/0x2a0
> <4> [515.287754] drm_atomic_check_only+0x6a2/0xb40
> <4> [515.287758] ? drm_atomic_add_affected_connectors+0x12b/0x140
> <4> [515.287765] drm_atomic_commit+0x6e/0xf0
> <4> [515.287766] ? _pfx__drm_printfn_info+0x10/0x10
> <4> [515.287774] drm_client_modeset_commit_atomic+0x25c/0x2b0
> <4> [515.287794] drm_client_modeset_commit_locked+0x60/0x1b0
> <4> [515.287795] ? mutex_lock_nested+0x1b/0x30
> <4> [515.287801] drm_client_modeset_commit+0x26/0x50
> <4> [515.287804] __drm_fb_helper_restore_fbdev_mode_unlocked+0xdc/0x110
> <4> [515.287810] drm_fb_helper_hotplug_event+0x120/0x140
> <4> [515.287814] drm_fbdev_client_hotplug+0x28/0xd0
> <4> [515.287819] drm_client_hotplug+0x6c/0xf0
> <4> [515.287824] drm_client_dev_hotplug+0x9e/0xd0
> <4> [515.287829] drm_kms_helper_hotplug_event+0x1a/0x30
> <4> [515.287834] drm_dp_delayed_destroy_work+0x3df/0x410
> [drm_display_helper]
> <4> [515.287861] process_one_work+0x22b/0x6f0
> <4> [515.287874] worker_thread+0x1e8/0x3d0
> <4> [515.287879] ? __pfx_worker_thread+0x10/0x10
> <4> [515.287882] kthread+0x11c/0x250
> <4> [515.287886] ? __pfx_kthread+0x10/0x10
> <4> [515.287890] ret_from_fork+0x2d7/0x310
> <4> [515.287894] ? __pfx_kthread+0x10/0x10
> <4> [515.287897] ret_from_fork_asm+0x1a/0x30
 
Cc: Lyude Paul <lyude@redhat.com>

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6303
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
> v1 -> v2:
> -Add the call trace and closes tag [Jani]
> -Change payload mask only is vcpi > 0 [Imre]
> 
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 64e5c176d5cc..be749dcad3b5 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4572,7 +4572,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  	if (!payload->delete) {
>  		payload->pbn = 0;
>  		payload->delete = true;
> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> +		if (payload->vcpi > 0)
> +			topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
