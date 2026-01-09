Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFFD0C8D8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 00:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA7510E29E;
	Fri,  9 Jan 2026 23:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hug8/qZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CE010E238;
 Fri,  9 Jan 2026 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768001644; x=1799537644;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E9wL+65Yntp5BZHgFtXK/qyo4BfGOstfAqg8RHHXcKM=;
 b=hug8/qZ+DqeaMgIwjnPqYwEAsfAX5TWpvIOOepfpO/WWOFBown3hsLQN
 6rd7tUHx78arAq7s/xMLjTXWZCHkIpCataatLfCgqUwrxLgN5ko5qZA3b
 liUnwNvBYAhYupNEJ4d3YD7J1qIydy4t2YUQqPyqvA17AHoU+naXld9+H
 R+80wxn+eOhj90XjhVBXB4hkretaF0jsuZP3LstIp94GaaLD/8cPgTewn
 bUE200BothN8Zx92zU3yNiNIOq2rKzvxmmPiGsFPYtIeGwPlgXGpoo9WI
 g5aTzHrXis2BcTCny+5XCGlmvzu7FMvfSZckMxARnLPyq5hE06cXzYJ0j w==;
X-CSE-ConnectionGUID: Pw0ZBinCRKOTtamEolKNcQ==
X-CSE-MsgGUID: vAIAwvcBSYqc5cDESvdeRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79679278"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="79679278"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 15:34:03 -0800
X-CSE-ConnectionGUID: VIeriz73QOGSI2r8p4J7Rw==
X-CSE-MsgGUID: LABgwkg6QvGDwYjt2Pqh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="202717351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 15:34:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 15:34:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 15:34:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 15:34:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGBVX/Cu2MZdxZuEraSc9pwm17u3kefrxkjOTPZHYg41v6hoVpJBwoP9zTgXHZMTnAuc8eTkmXsxNCBd//hYOtJVC/3I7+s9f5U7pWMsndE+E5tfz3zX/714wxVG65w3BBU5gEAtIi5cEtDJiki8coTING/MFGURXo5ETM4hrM2f7buCc3lpWbOry519fr5cb2nxM2+0z6VuE21tKv/pcLh4MfOyBEDOI28rGbiTsU+meH3hZeXEis7SdrRk9TrwWaaeJSPz45wUdICD+jbok3JR+ltdIc44gBZy84j0i0x8TCCdhywDbDCw+XiR2/Qd4dEQ9rmMIsuustnBhH6nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=or13OYiwAgwFCb7BRxPPHbxfC9zrVAUWNzktFj8un0g=;
 b=CDK0OjiN8NtzBuhcaibq6FfU1N7jh4s7Ch8olX4lz2dDPyhkfxlFLw48Z0fdizNc3owff33ZXkmDYIqRgF5Y6uPgw0uvOpXhJk0PxJnRnOvAW1+BpvSSa7Md1hxADcclUvt7biRQ9kfelXQjDJGqhdo1+AOMaN67zuTHUYqaxWPuI/9+XiTzx9Woo9U+K/Yy/KdS4ET6SVHxrrYEu3/zUEqvpkGaKISppeG4CEfKDfh2VDsYAOiA2noe9FsshiR/t6OwqpPphtnqLASaAKkxudaoO33ahL/wlq0Ruv8mzaONIQDL5JFfvBg2nyzDT3SNKzzsC8uZEpsENzVDj9TfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 23:33:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 23:33:59 +0000
Date: Fri, 9 Jan 2026 15:33:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH v3 7/7] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aWGQZcj1xLTX/QUJ@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109085605.443316-8-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: b78833c0-a056-4c96-ea2a-08de4fd7908e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rEz1F1mNDS4UWK0A6JPxTux9uVFv+uKBDpWVUssQKWwW9wbZmz7bP76fRr?=
 =?iso-8859-1?Q?3OmxufIZbvZDi8HqBbNnEF20/ywwYu7sPMjXBmT6EDlEO1dWPj4M86hV7U?=
 =?iso-8859-1?Q?QUiw3SYoA9YHsQGQtB6RsecWPRApvruIaG5y8l6GLEOGe65uxU5qO7gccw?=
 =?iso-8859-1?Q?5SSD2zqdVLa1uO1YWJr6aVD0Ez85lTF+rZ5tzUMW8IweG0IfZfSJPOGiDO?=
 =?iso-8859-1?Q?20LnAu9vFZ10lGuQcFS+KJZQWr+aVFOq0ouWL16exXhaVx+nPM7feCqeMl?=
 =?iso-8859-1?Q?rVZ18iivlQWucq/ZDQU0kMyJtQXbwEmA+tqJy98/BQBauc04cEuCiq3zn8?=
 =?iso-8859-1?Q?S6QQbs7TdvUOTG7tbAmS/DG57yw+hveXIPasmRVM/WeWWfPZOcX/I+pfv3?=
 =?iso-8859-1?Q?5TRH2MvQ+YwaoHV+16WVws2xoukuRsWRejKSpOeg9kcTt6EO12e8PVwlYM?=
 =?iso-8859-1?Q?GeZd9LYbcbTb2A73OCdMEKtzLk2Xaa8rGqGgffTu71qDowgtcrsPy0UNVm?=
 =?iso-8859-1?Q?Uns9CmpfEp9mggmUCAKai/kpPwyi0plLr48SlgNmFdvbnJUsn/W3HFUVOw?=
 =?iso-8859-1?Q?7d2AHXSNLEph0iGVmx+Z2WHgT4u1oyQ6OrmVJaYL74b4NSDL+blOuCpvKm?=
 =?iso-8859-1?Q?IYqpPEMXbNLE8S27UPFG+lVQJnebHb2/PieRZZHrX4orpvRy7ZfYRPU665?=
 =?iso-8859-1?Q?kxeYzQagi0Tpg9YIRZ/e0RHeWMSW/lVl/ESp5vjHk297CuaTmAaHa1rRV+?=
 =?iso-8859-1?Q?NcBkunnzPS+O4hXAHdsq6ouk1FNVeMC2WF8nWM28LcsAJX4/iT0VEriv3i?=
 =?iso-8859-1?Q?J4b5Qmm3wZJ5m7Bm2mms0/KjbvhaYnbSMAMdP5ltJVByjC1M8htQutw+Y5?=
 =?iso-8859-1?Q?yY8PeYDEyQNGH+ZhVyKU0oCOYEYepatxUdWW1l3+QCpx356db2UdYg6ey5?=
 =?iso-8859-1?Q?U6V2qf+C6NluvOxLGcxbsVe5skJfr2eQ5XRktRq1O6IAXGKU5ql8sYtilD?=
 =?iso-8859-1?Q?YhpOSS2z2PfCwM2T05xfhVv1IC8zJ600fyDwZjT5DFpHAZaJBEL2o+xQzj?=
 =?iso-8859-1?Q?hkve6aGG+7jOLU2Bnb6KSak/o0/R6yYHM9VHabfKt0P4VVoKz/HiB3EP2A?=
 =?iso-8859-1?Q?jS9E9vqYI/jE/nIHLqhyZti/09XrSMkT3Iriug3XdEuEOtf7h/cy0i54Lb?=
 =?iso-8859-1?Q?SkOpGf4IxRpU1FwetQ98TXXiflcNiB0eA6BfV70Ozq68aHcLqsO/Q0iuIf?=
 =?iso-8859-1?Q?VzRAXfjKLxwTx7juArRF6vlpxtn9X0ArKagtxFdXHAgHDbbCTaJOXG4l78?=
 =?iso-8859-1?Q?T+VppGRPA23VNtKkx3lgg/YcajoIKstVunyEFL8VpAQzYgOl8wjksvgs8a?=
 =?iso-8859-1?Q?+C9IRmerkihGWWYEKko1t1vGzbRqghs7Pj1GIFykeoCRN02KDdU3sz+TsP?=
 =?iso-8859-1?Q?I02AyopjwFxnceXl54+h2jViUqx8C/pzwOGlNQnOqClaQSDn4t9JmToWgJ?=
 =?iso-8859-1?Q?T6zlrk7THVnVGOcBnZxJAE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NYW6mI3B6yndXuTcvvWTz9Hkl6ZP7xWfWInyZUjCQ/I3Ax5dXw/UH2YMLo?=
 =?iso-8859-1?Q?+5dsXi0rEgThfzql3yDtlpQVXcvjJrXLzvsOOs27U+pE5IWfoY3+XXoYbI?=
 =?iso-8859-1?Q?RbpwFkBt25KYrEZQsch2AWZns15ehzUXPOoOSGIYqaaq/SUjPjUy/n4z5o?=
 =?iso-8859-1?Q?ivyUg5ESeTJ6P4SzuKbYa8/gQ94IKPLna1ju+2JbIiPTNv3IHXM7fP73CO?=
 =?iso-8859-1?Q?dqMMMc5plyuIUxnp+7kqPomcjIddfbsh3UZYLfmqdhj2Tlkh6/g7Oomt3n?=
 =?iso-8859-1?Q?jUNQ6i2DCFUl0gL1BthnxdH3mkmGumEXsngr6gL8TFoyFghFtqnh85S1Jj?=
 =?iso-8859-1?Q?6jZppWg6YQNlacLsh8Jl6IiFp0tOF2eFclKH2wMLYjHciLZkKASIVA3Ei5?=
 =?iso-8859-1?Q?ANezYIxdkhzprNypVD052I0a9HbTrRg2seaH09l034WUHPq9maXoOdkMhS?=
 =?iso-8859-1?Q?uj8RWvkH3+hB4vCg/GBEx3ZtfM9o2QIMFCjnU1H4sjKczMPOQRMkgqGrvS?=
 =?iso-8859-1?Q?62p9nwgY05XophjtogNd4vPKc/B1DyeujDI50eDCcbd4i4P1bQRsU/JtN0?=
 =?iso-8859-1?Q?4A72KttS/CiNBLGkgcFxWkUt4pGK00gmfjS5E3WRLabgnjjapQ9IV2190Z?=
 =?iso-8859-1?Q?XgwUHlvIR+fknRxiTvQeO3mV6bN9gMIlxH3hKT/zyrAw/SeXJ7FtPx0VVg?=
 =?iso-8859-1?Q?UfwwdzUZ6xw7Y8b7bxuoO4UXLJMJ8QIn8hejlhz2Vto+blq/ihcPfwyeBf?=
 =?iso-8859-1?Q?XYFenwQYQw+axtADeXyADiSCWCEwhqwh1/cmbFxwNNir5EHA30lcHOh+eK?=
 =?iso-8859-1?Q?/0OUJ9JgmjR1IIEt+96uSjQJUL25XWN67kYu8/nPgnh5BHeCyFCwmUpH/B?=
 =?iso-8859-1?Q?LNmQcZjAp663GhJBPNzNFW4zvizpilw+5s0gDbsbBnG99lETxUyu6CfL1H?=
 =?iso-8859-1?Q?G2PyE00beXgwDtKc2N7gkFcA2O/Z9sCNjYv5gOPUThNrnUqa3UhnG0EZ1g?=
 =?iso-8859-1?Q?7/6+Qjf5bws4Tv+t7UKJQQxnK9VN45A0O8u+x1MbDBs2hfmtXBmj31DhgO?=
 =?iso-8859-1?Q?GnyeAmiiXLUnZ82qZwVSlB+VRHq6LCoxJZMhN55CQ765TqpnmD34N2h+nH?=
 =?iso-8859-1?Q?IFlyoTCKfc8viwPkc5TZbZQDBnUcK70D5/GTHT4qRKU1PmQeGPTMjt4O2T?=
 =?iso-8859-1?Q?MbEdWjpXto3ctHAZK9SijSajQXejoiSXw/cPMj1T23h+O7QFoiDOUCxqKU?=
 =?iso-8859-1?Q?nMEfAjYx+AMW8bOIos4mtf9YibnCw8d10s9O401wejsQHYMeknUlK3aZh2?=
 =?iso-8859-1?Q?eetIuKZei3kkudjSyGMudVO8+mfrBPkDa/lVKBZohq3wEtFGkVA7pETXEj?=
 =?iso-8859-1?Q?rFY17GUPwKqk1hBQB7FcN9ELQToz+YR15VQZNeeX01rdIM3oB7nEWF1elp?=
 =?iso-8859-1?Q?/LpC8qxwhSlFer2xPxKFvOjhA9KBZhuPZhKF6KOYssmQnBLgz+/NrXGryy?=
 =?iso-8859-1?Q?0b06cEazn2upQM3DP5xceIlrQRUGLbWJzck4OXCzeZ8viLK14jUpXltSV/?=
 =?iso-8859-1?Q?mN9/ZYtt3XaDWribXjWoTqkyH5lpQ34oBzVsaq5X+x2qao4Bl8jss+8Bzx?=
 =?iso-8859-1?Q?yb+TcAlJCLa2TqbZakdV9DIf1GDlxgMBbJGdQCp0FBN1cKB8lVPVwglo0J?=
 =?iso-8859-1?Q?obHBTCE88gOQPKdsITsBa02p6Qx0TZ9jExz9c9Dax+gInC6ejcqNQxUb34?=
 =?iso-8859-1?Q?KX4n0dL2tbLhDqF7mhJEYtiP9C5TmIOBwMUush8kXuCd8hHu/s/mQzcWVQ?=
 =?iso-8859-1?Q?9pirX7anyRWkrJmTwCfnIssO0pa/8zw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78833c0-a056-4c96-ea2a-08de4fd7908e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 23:33:59.6127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZiNB5hkzz8IArjW1hWhl1pg4ZujL0Rhpj9Sgp6pS/h/MdtagKiRmnO3bwS2ihmrbjw0hLsWdFWRTvh/zDvZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On Fri, Jan 09, 2026 at 09:54:27AM +0100, Francois Dugast wrote:
> This enables support for Transparent Huge Pages (THP) for device pages by
> using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> split folios and loop multiple times over all pages to perform required
> operations at page level. Instead, we rely on newly introduced support for
> higher orders in drm_pagemap and folio-level API.
> 
> In Xe, this drastically improves performance when using SVM. The GT stats
> below collected after a 2MB page fault show overall servicing is more than
> 7 times faster, and thanks to reduced CPU overhead the time spent on the
> actual copy goes from 23% without THP to 80% with THP:
> 
> Without THP:
> 
>     svm_2M_pagefault_us: 966
>     svm_2M_migrate_us: 942
>     svm_2M_device_copy_us: 223
>     svm_2M_get_pages_us: 9
>     svm_2M_bind_us: 10
> 
> With THP:
> 
>     svm_2M_pagefault_us: 132
>     svm_2M_migrate_us: 128
>     svm_2M_device_copy_us: 106
>     svm_2M_get_pages_us: 1
>     svm_2M_bind_us: 2
> 
> v2:
> - Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)
> 
> v3:
> - Remove migrate_device_split_page() and folio_split_lock, instead rely on
>   free_zone_device_folio() to split folios before freeing (Matthew Brost)
> - Assert folio order is HPAGE_PMD_ORDER (Matthew Brost)
> - Always use folio_set_zone_device_data() in split (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 69 +++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 121234cef38c..5b89140edb8e 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> + * @order: Order
>   * @zdd: Pointer to the GPU SVM zone device data
>   *
>   * This function associates the given page with the specified GPU SVM zone
>   * device data and initializes it for zone device usage.
>   */
>  static void drm_pagemap_get_devmem_page(struct page *page,
> +					unsigned int order,
>  					struct drm_pagemap_zdd *zdd)
>  {
> -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	struct folio *folio = page_folio(page);
> +
> +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> +	zone_device_page_init(page, order);
>  }
>  
>  /**
> @@ -534,7 +538,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		 * rare and only occur when the madvise attributes of memory are
>  		 * changed or atomics are being used.
>  		 */
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> @@ -640,10 +645,12 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	own_pages = 0;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
> +		unsigned long j;
>  		struct page *page = pfn_to_page(migrate.dst[i]);
>  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
>  		cur.start = i;
> +		unsigned int order = 0;

Move 'cur.start = i;' after order variable.

How about this warning too? As we have agreed device folios should be
split in the core MM upon freeing.

drm_WARN_ONCE(dpagemap->drm, folio_order(page_folio(page)),
	      "Unexpected compound device page found\n");

>  
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
> @@ -670,7 +677,20 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			pages[i] = page;
>  		}
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);

You can't see this in this diff but above here has a 'continue'
statement. With increment being removed from the loop this could just
loop forever. So s/continue/goto next/ or increment 'i' before the
continue.

> -		drm_pagemap_get_devmem_page(page, zdd);
> +
> +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> +			drm_WARN_ONCE(dpagemap->drm, src_page &&
> +				      folio_order(page_folio(src_page)) != HPAGE_PMD_ORDER,
> +				      "Unexpected folio order\n");
> +
> +			order = HPAGE_PMD_ORDER;
> +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> +
> +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +				migrate.dst[i + j] = 0;
> +		}
> +
> +		drm_pagemap_get_devmem_page(page, order, zdd);
>  
>  		/* If we switched the migrating drm_pagemap, migrate previous pages now */
>  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -680,7 +700,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			npages = i + 1;
>  			goto err_finalize;
>  		}
> +

next:
> +		i += NR_PAGES(order);

Matt

>  	}
> +
>  	cur.start = npages;
>  	cur.ops = NULL; /* Force migration */
>  	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -789,6 +812,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
>  
> +		if (order)
> +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
>  next:
>  		if (page)
>  			addr += page_size(page);
> @@ -1044,8 +1069,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1098,7 +1130,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		.vma		= vas,
>  		.pgmap_owner	= page_pgmap(page)->owner,
>  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +				  MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  		.fault_page	= page,
>  	};
>  	struct drm_pagemap_migrate_details mdetails = {};
> @@ -1164,8 +1197,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1223,9 +1263,22 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	if (!new_folio)
> +		return;
> +
> +	new_folio->pgmap = orig_folio->pgmap;
> +	zdd = folio_zone_device_data(orig_folio);
> +	folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> +}
> +
>  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
>  	.folio_free = drm_pagemap_folio_free,
>  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +	.folio_split = drm_pagemap_folio_split,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
