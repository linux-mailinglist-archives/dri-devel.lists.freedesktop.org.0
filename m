Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC9A18023
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD8E10E5E0;
	Tue, 21 Jan 2025 14:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etaNUl1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58BD10E5E0;
 Tue, 21 Jan 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737470544; x=1769006544;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ojiVahdrxz2f327RQGvDqqydUE0kPwjoagHh1EW712o=;
 b=etaNUl1do+wOK7mwHXMbSW6EQwPypa3AeMHFGSDak8StfQFsD6SnyiPZ
 nSfydi6GSbWbZu5mmI4TIrFRKpF7Zt0qPpL4yFnH/b0w5kPHnY3u2jJDg
 /gulV4AehDvMakoxwJlrwlrqEYaUdsvt/y1w9LyL7B9bKQRt/6MCywXi5
 J0ihNJSP8wal7CzdAJtgZgyApYpVgT9tHgYMaIuvqYDOcqNlSXLNNFO9H
 evmP0Bp4dZzOP1YTfuu1HvF9hdTVFFhxSZWLE52TU/t8c1IzySOTPouwH
 4e5aVzq/zb187V18h0xjlOPUa/LPuvU/Eeb2wRcXFfhWI5du5LAfF2mEK A==;
X-CSE-ConnectionGUID: yzyOtERtTz+1lnZ0nZNxwA==
X-CSE-MsgGUID: Q7hc7dS5Te6aSuwRTiW9QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38037813"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="38037813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 06:42:24 -0800
X-CSE-ConnectionGUID: ywX/CyfrT3G8WJ5pvssxdA==
X-CSE-MsgGUID: vyQpWP04SFe/ZxZ4llzgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="107431873"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 06:42:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 06:42:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 06:42:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 06:42:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRS7yJEemUa/cg3pGIEfjtcGWkIfbI2JsZKxscaB5FHoQDjj4hH8TehEd88+48AHVnOks1OlRj5OWGcUfJjAjQUkso7u69+ZBoJTe/iq/PtOCG0c/50R5nHeO3vY7bHj7Dde+ouMGrWohh3dzZXUMd9bS54SkiB/UpX2vahXqZBTN0Xjb7eX2x9ZyzTBA9RNQElZVV1ysXJ5mMYnpFLYmxAHhXWvq6YD9AuzVnFCjMLelhSCEhOBQ70BSjet5g+n4vfAOrvoWr+a0rDfpBCo8JGWMMciI/2i5xPyqvemwpVtuOPSQqh1MAIOZdj/XCIALAaqWqnquoJKlsJCVo3ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zdzLHGqqg4xHBPFnZPOtMjGnV/0Revkp/LqtzRZqXo=;
 b=LUYNM+BjAI7HRbfEBhFfKm0xlJea9zJPInb4ZgLQTfaVfnV+y+bfaF0SnAiLEaDzFnw98jE+JrKXPXOrK/NeV8NXEVSdL6qDL4/dTgfDHq23yZpUNB5cHDuFZt1qewcqyo+frBl2h/la/GWPWxREzBtnNXuEkOGrdEuooy1Kwyrn8JHFnK3tYZtK8+wMyn/nYK3SNhcd+e74i6B/QeRROOGUzwsRtpn0XdSnYn9ZaWQcWS9VoS+9BOEjadNerrStuc2lsopNviLH+nKJqNt2eW9ZzlVz7ldim7F3IW+0ZJYLe4EStsBXe485hVDvAuOoFyLzrhX+A00zW6KB2fHG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 14:42:21 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 14:42:21 +0000
Date: Tue, 21 Jan 2025 09:42:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sushma
 Venkatesh Reddy" <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v4] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z4-ySdQ7sCymXRMx@intel.com>
References: <20250117215753.749906-1-vinay.belgaumkar@intel.com>
 <4f62fe21-2641-40ba-ace4-1429389068f5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f62fe21-2641-40ba-ace4-1429389068f5@intel.com>
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: be9a6c42-4103-4b63-fd04-08dd3a29cfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rkrGDkHSJePn3Cn7JNWwukq73V1NggrUNuKfGoj4S5JutEyxDt/zICv/7aEB?=
 =?us-ascii?Q?nflKNKzGtxhF1XLlK/cPLo7R1UIadpm46weMsoaybgD6WKElreKU53TRc5cu?=
 =?us-ascii?Q?Pbu1V8QRTiKMZVlpO4JJi8E0KX1HJUp9Pqjqy/ASQ3kbMw4BzC7a7RvyCtIv?=
 =?us-ascii?Q?tV6oHHcnTM3DR0TF7ldumMK13YdaFBKJVTlz5GIygnWmCEeyx33v9NJAwroW?=
 =?us-ascii?Q?sP7iXy4YjNVAmJCSi4B2yCDwLyyrwIwwwFg3sP5ZUQfFa4lL8L+7pO09AS1n?=
 =?us-ascii?Q?6uXn0AfbvVlZ++/9iar3KeKFEYFP7JmZ1YYsFqz0s9ar2l/dHFwNc8KrwLl4?=
 =?us-ascii?Q?AFe3Fz2gZ2RSh7/03hB7xiDyaITqKM+0RiPccFUKzm/ztY8MSKXCIc3/fKA1?=
 =?us-ascii?Q?71df1Avqx4In65pT0LZ1JVPrLZC9l9KJ+7M11X3mTnSqZy7/CXsvO4fQoTEG?=
 =?us-ascii?Q?z5iJEFlDntd56sjJ3sl1La0fNi6MGET5/TCKScxozpWaZNXe+MUpO9oJ3/BL?=
 =?us-ascii?Q?jd9/coOUQa5TFcUyI/HEkdxVjtZKovK044y2o7SYtDvnxqKc6rKTEiNx1vH9?=
 =?us-ascii?Q?QX/4sLlfeXcDnsR59bnD4zWeyWP9B9aBzsBuuInB+IS3INh2lRFYrs8qM8bj?=
 =?us-ascii?Q?tIwpkS4rQ5E0IMZNR20VHpWCQNtv69U5XZU4ob0flnUJFj84VX2WbaPvjMqW?=
 =?us-ascii?Q?fofhcGMY4SfqQ+p9YVbOj/aT9GB+cHTdL+HqB4BfExm3SmjLAnBdQ88neUCL?=
 =?us-ascii?Q?T2/843fFIUSp44YRR27fqvSG4lv7eZRC4UQRTHVgcAmYjsNWS46CUpbIZAkn?=
 =?us-ascii?Q?aWl1SzTDpiskfXq12kkY76BpB+c2+la+h3gYfy5QHeT40PEidn81b6z3n9Vh?=
 =?us-ascii?Q?7FqAhPVJtw01pvBIOBtGS+9ePojq6CpmXRThV/dI5wUELt8wzoGEF5PZtn3C?=
 =?us-ascii?Q?F0uJ3ormNO6jJpake4jcfQKgo0Ym3Q45EA3W5QY8YKAO3goMCpmoB3KYYjuS?=
 =?us-ascii?Q?a7UXa+3pf1IIW/9LsXMdGs6YRTGh6WprqzVueoc0s2PQ2WDzg4hULWkv4BSt?=
 =?us-ascii?Q?08TTHMv2Dk9ehn00FcLXnHA403x+fTBgpQqM72ku4lbZo9UUW8Rl0uyclWvD?=
 =?us-ascii?Q?MsY3fWiLtGn7TV7INE7BzmPecoawmjXqzbUzsW10o9Ekspj+jJRqMG9T5JPu?=
 =?us-ascii?Q?aiZP9fgvn7pfGWgDjHdoW7S+y4u5SxvuurBHzlvBhBkoIiWEWq/ESUnV4NvI?=
 =?us-ascii?Q?Nw++Ib3KHtF3bTQeCOpjMoLqB3SH6YpLNwpywd1TzGwixfjPc7kXgZIGWwjO?=
 =?us-ascii?Q?/k3WL1pmnStL0ltuCS0eJGYi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2cjOckYSqpA1TNAI+YWhGD/ZhYNllk/cNPYlpZ8WdDCJ/AVIqjrBlZIR/Xoy?=
 =?us-ascii?Q?NuDo51nRxj5/x4vDocvDuPkBL8pWHjwajLp13Ev2o90ySxaYC2aQlVOT5xs9?=
 =?us-ascii?Q?FG3xR0kY/4S7958EHVjjQ4fXPuRt+SDsHmpuUqyXb5qL5PNvpav97siZXwNN?=
 =?us-ascii?Q?ZGqJzjDdKG52eTLVcZQtbpiw6UTAueq6fuW8Cd9zlpR7mUO2MrldMVd22iVl?=
 =?us-ascii?Q?cssGC/3V9/4I07OWWu0zZoZhliZ2xR+OVdN29Z7eaL0tfSUHB8DHCAoy3eX7?=
 =?us-ascii?Q?rwsI3oHGJMubRwV9uHTNM238xz7Txm2D5GjwIfj7xKBJkUVUTR+icZdWpBnv?=
 =?us-ascii?Q?E+WbP10wuPmlbDVN04uBf9hW4zKbiGbNExyM5eXB/TnPXFaqvi2CZdL0TO2h?=
 =?us-ascii?Q?dF+CW485AZkODfCkbs4eHMt1yw6zqoXuZkn9wMbw1ESEk5ZWiuk1P/ULCbIr?=
 =?us-ascii?Q?AIeaHpXFMG9xTrAmmqnTVtvg/6sszENUJ+gFvRqvwPNk84MpRgHZ6wNNXFrr?=
 =?us-ascii?Q?eLwJks9tSHDvK72PJic0+2l4/p6Il0Yjb3aXi6IABdblWZ7q+F+CR8mdPFyD?=
 =?us-ascii?Q?0m+KiGrh0mWmQGShOAjvApCoe5ZM3UmfChubOG1xHXv0NZliacGAvAAHghmw?=
 =?us-ascii?Q?N9o7XltPOQRbxW6yN/n6m3xOYxSCNbi/htqRsoo5djaYid34iy4Vc/X9c9V/?=
 =?us-ascii?Q?0JT6gUDuNvpBEDCIdFR67bFIkxb5t8aBci9QJjhJ0Vigl/oAi41JocnIwTwf?=
 =?us-ascii?Q?D+1gmybR5KJ02cwun0kpVvl1L6Q3dkoDDUFJFJhqg5hrHCfe2URR6v5PvE6R?=
 =?us-ascii?Q?ffA5Itekx0tsPX7rs4sz8NBs5GVGZ5Y1XThjlsp0MJIx4QmQjIc2Qone1SXq?=
 =?us-ascii?Q?QJwefDQTx4A9eOsjOQABYULmfgQUI6slBZloVZpUBn9TPT9hOalVUqbcjUPp?=
 =?us-ascii?Q?qkdIGTOBRcmLk0MynWacVU6iCrtSWTl1SaAy6bqX/QeQaRLbq1lAFyXROCNQ?=
 =?us-ascii?Q?kdk5JEe15W038NyvpEMVSgo1H1rzIS6zD7FTPKDX1hi8TDg73FudJt+7y76r?=
 =?us-ascii?Q?AsAAafvPcLGL9Vn8vaZicYQJjta8J7DoRX6e11p7FzW6f1eZXGc3Zkn5RJ5w?=
 =?us-ascii?Q?RjXig384tz5mHTnwtgJFEY/qcLr8YjFwtvNWhMD5LVhuZrTvci+pjpUGc3wd?=
 =?us-ascii?Q?nmIX22iN4mdlBdILvQgjALNxQqlkS5IP2HXO5c4SQGkkX7npjy1cZILnD8/J?=
 =?us-ascii?Q?QCrdmBN3G/pttzji9fzr3IUbedXkNy4s2fDs3E5hVLAi4d7wnfbYG5DxfaGM?=
 =?us-ascii?Q?uqOnxcOxyXX69b4DN5vQS3gTyL/AM0JRRsFP6ACazWNqGn5N/a2fCtDblaWo?=
 =?us-ascii?Q?riwwKS/Rlg33371ZrXkVDQ6f1AurmTl6tzXm/kJBeqOIx9bFET02s97BEoye?=
 =?us-ascii?Q?QrRkmmbRJyU2wvHF1FK7p6vo39goCcfn3vspw5KNyTwGg6dnFB9WMWDTJ7OU?=
 =?us-ascii?Q?kztxl7DGrId8x570SN7tV6nKAxdfEfd2KM6ZC91sjpqmOfFG0JNVxA6TbZrp?=
 =?us-ascii?Q?7yaPmQBnV1JMAnPWF6CjIfVnZwo3Kt2uijNgQJv01zGz3te8HEsFV27U3DX+?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be9a6c42-4103-4b63-fd04-08dd3a29cfc2
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 14:42:21.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqCgEKS5/ArKMFrvIcq39Nl44r1ohEphplrX7yJPH1Eba/6QFR1yLIfE+SHdty/63ig0rfgVy3q6CJZk8PJGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

On Sat, Jan 18, 2025 at 06:47:27PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 17.01.2025 22:57, Vinay Belgaumkar wrote:
> > Default SLPC power profile is Base(0). Power Saving mode(1)
> > has conservative up/down thresholds and is suitable for use with
> > apps that typically need to be power efficient.
> > 
> > Selected power profile will be displayed in this format-
> > 
> > $ cat slpc_power_profile
> > 
> >   [base]    power_saving
> > 
> > $ echo power_saving > slpc_power_profile
> > $ cat slpc_power_profile
> > 
> >   base    [power_saving]
> > 
> 
> is that output aligned with the sysfs rules? from [1]

Please help me to understand why that is against the rule?

It is still ascii and it is one value per file.

How is this different from:

$ cat /sys/power/mem_sleep
[s2idle] shallow deep

?!

> 
> "Attributes should be ASCII text files, preferably with only one value
> per file. It is noted that it may not be efficient to contain only one
> value per file, so it is socially acceptable to express an array of
> values of the same type.
> 
> Mixing types, expressing multiple lines of data, and doing fancy
> formatting of data is heavily frowned upon. Doing these things may get
> you publicly humiliated and your code rewritten without not"
> 
> 
> [1] https://www.kernel.org/doc/html/latest/filesystems/sysfs.html#attributes
> 
