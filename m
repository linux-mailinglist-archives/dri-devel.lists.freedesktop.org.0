Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A107C8B1061
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182C10F9D8;
	Wed, 24 Apr 2024 16:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrXay01Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AE7113C8C;
 Wed, 24 Apr 2024 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713977835; x=1745513835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zHZVjYT+FkfNp5z/o7eE6WBBFJiq8xGEkAVeifE2M3A=;
 b=TrXay01Y23r1h4TRbq9XYJjNp1d7RF5LAtn3/DudALw5A84/OpeNMVx7
 aIcDxbKF4XJ+iDZoDhnuaIS388i6JqXyJ89dgYKxwQzBs9KPaQN2AG8Ym
 e4PHrtpgSjExfo14nQewuApiVl3aL3lmD5/tVy8LDnpk38Yo0ITBY47jq
 /tbamuBqWbQrzsrUbjZqLCa5rAPkYhKCWHjnff+1veta1Mve8jsOPptHE
 DQm0NJFh2npVyGZwgurZd9cMdU3IxJWvlMqhyGfcU9V1IpGeOv+NMaInN
 ZS/7O6qNdACkp89ZyeE6NtdsQB5n4RvkOKrFMZrlxHsoXVK3aBq053gLS w==;
X-CSE-ConnectionGUID: 9Aptrf3ySaO+OaNWyA9vwA==
X-CSE-MsgGUID: 4O5g/usHQROTVPxs7wLjeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12558085"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12558085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:57:08 -0700
X-CSE-ConnectionGUID: HDudIGfGT4q8+Aaodqy/Ig==
X-CSE-MsgGUID: OQyGW8j/SbWEcMWhP5azsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29568946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 09:57:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 09:57:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 09:57:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 09:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGdDGP0uBeSoURMr0anB1FTQ6J7NXafCMZ6SN0A2XruDoj+AXtFsrsE89hs3Ef21yCrgY1rBsKMf+jqTmAk6I1hkRl8R8PpI+meRx7sI5r419fv8t+oTg97o0mx5EHtIEMKVhIl30dzDS3al80t08Mj7gFKmvF+HTXEWVBLA+gEM6stBPaWfAAoL74tZqhYr8v3qejsrO4nL59iCqp3PLF4C9ropoIaWPhAMHSDhcTyfr8AKALj9ytWTAGqsXHpBAjnSJp30579e/RRRcTI8qWzuvgl9OLZG1+PIxBepyLk2h3GoOR1KouHraWP9pbfp17c0FEZdni+w1US9SoaMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx1lXZtY9y0h8UVXh5UiqLUkYbCYCQrGhpSLNVYFRvw=;
 b=I093ZpEo1vsfQobKk2cmSMeTFx37Ix6K6fntClyD5QnL8OzewZRmW9t4OE+6KNwoTDssz03sOuky2L1KeDU0EP6q+y94JhKWrqnaR7wTIG0AnQDHtpETiVJxeiN49H7ajv6XW735jpI80gKDjpVVAYgEukZyTaWBW8zPbAICU0CkZtAHjv9b8ZsuF52Hx6INJggYG/YkilGvprgAnOp0rKTdwy0F6TYRfZ3MHVh/6J0QgaHtt7Ko/knDgaSbmimgkzrdYK2lsR6LkjKBNMeCrxT5psv4TVId70l4DpmTZZTYq+UygRETLmkYh277IjjGhy5rVB/L+vYTX8gdSMuTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 16:57:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 16:57:04 +0000
Date: Wed, 24 Apr 2024 16:56:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Zeng, Oak" <oak.zeng@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <Zik52U0wpajDGF1F@DUT025-TGLU.fm.intel.com>
References: <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
 <20240424135754.GK941030@nvidia.com>
 <Zik0xY55VBXbgJxs@DUT025-TGLU.fm.intel.com>
 <20240424164411.GR941030@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424164411.GR941030@nvidia.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a1fb99-318b-4d0d-61db-08dc647f916d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OFk9Bth8Ttpy3W0OjEp8ZuksrpvYLJWAoE3CIQZmIX25Ghbvq5H61FS+9sJt?=
 =?us-ascii?Q?zNH8FavNonL5gJ+ztD9AOyxSelXuwlnuNIoPA5VTs98u4eKAEw61mhLGzxUf?=
 =?us-ascii?Q?QPHVSL0BVzt9i/up6U1YqnjRN+aKQSKquhqCBZzww3B7FQxqQ32GMWqXIKx1?=
 =?us-ascii?Q?JlK6HiYDSPtTTRjGqpg8QollCUeilzwmLXNv9alO1x00kcU5eJDWRGEyRxj9?=
 =?us-ascii?Q?r/SSja6pzF88n7E0R0LeD8HAZW4i4jkdsP+WudbI9pNfQ0RMoMu6tJbCK+2L?=
 =?us-ascii?Q?Kdqp2akcn/9u/e+GBFSaUhmajDbTEzvsvJFARZuuplBo1Dudc/KfdVpa6Q1L?=
 =?us-ascii?Q?9QQ9gGTE6ECc1iyl6mdfKcaeR0XaBe7Qm+HsOn9WeESMvXpKbuOX7IxaFETB?=
 =?us-ascii?Q?trAbSDX5VrO+9a+CFDAqXd2/58Q5F0djVpBnRpzNIi9XDcl+9Ht1FQ0X9PVC?=
 =?us-ascii?Q?ar9h7l1oubDpLgNvjI+2/eG3976N8FwGtwC+l0kN1RwkZPK7bTfpgGQkVzmY?=
 =?us-ascii?Q?BSrudDO11/ayEdI+H2RcLzTAuSw9kU1UwCFC19+YybJbe18fUn24oLxXQPa0?=
 =?us-ascii?Q?CNFcLfazwSlk+9fc8MkjYMV3Hne4GT9hcH4siTD8D6YGjN8JAAwDAa6fWFja?=
 =?us-ascii?Q?4SuwOdU4PCeJl6Bsv1ikAtrn4tnK3VHsgd5ndVxpjk5Ok4XzVdKmUzrIJCyj?=
 =?us-ascii?Q?rwltKZS75iGZTCfamFNCABPavQDd85CbWY5JS8XdNuR2OLTu35o8NOlMUUIm?=
 =?us-ascii?Q?vXibcC0VP+rueNcAOvC8iOR9K3pqXLvyDQo5z7/ZLKaQKS6EAMn5eUEKM0di?=
 =?us-ascii?Q?uDXPMsL4WJDJxxcSMIoGFge2w4vU0XhhOroYGHZbjisIBpbVXQzeHPjQN6Fy?=
 =?us-ascii?Q?7yRZmj8W3UQckxnd2Vw1VugbEt4ZD7Tk8HrZDHCbU2TptRZSPjqWjVtN4v4H?=
 =?us-ascii?Q?AzAQ44oS6wkkYNI4h1CuoCqgZBRnlsqLznbmsby2lP+zyWBb9i0DL8pNYqdv?=
 =?us-ascii?Q?iAcpeNnAnIn8QG5QdM7kyT0WpI7th2ZkHF7t0rnQwD0VvdSgVsiA4G6cKz0u?=
 =?us-ascii?Q?iuCCxkpzl/mIOscTKhwnepdoAW3Gx6UJfHZDkLGffqY5lCta/ZNGtJDdCf+t?=
 =?us-ascii?Q?doUEM/I94QNU+WH2lMuzW6Ajb7VntHZaAo/AUTxTzPaxqDU2bg9vpkJ95cbn?=
 =?us-ascii?Q?BKf7jzWGuWRBDf5xe+XyokoMMqdut0AFonM5Lk4eZv5HgP3HdUsAJShX/kTj?=
 =?us-ascii?Q?WBTC1qKEeLMbue9IoNU4juGBTBZW2Fw1qgWVNrCzsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9eAowGaP+zqyYj57NTKAa3bef1UCBIPA/kwYSGhBq5CGvK33C/2oReVDxCxH?=
 =?us-ascii?Q?xsy5XhWF+toujKECfzMEKnAQarAF31P+UZ0KqaM2tt+4n7UJcB+nEWDgLU6D?=
 =?us-ascii?Q?UxwdKDVXUK5/aD+2Z0nlCFMuirSoJ+nfe2FMlZYxSTRyJRmfPwM2IUmQAleB?=
 =?us-ascii?Q?sRBW4EKmMbnVOUICvVSgGaQuax70iaFbtWpJGeOPc4ebo86XEHq1Lxwf35r6?=
 =?us-ascii?Q?KWn43nMZ3zsjSgqWrfaI+4T56IHBhaX0XE4sTuTAfqC1sexyznNcjYHQ4tnK?=
 =?us-ascii?Q?ZMslah81+kmuw1nprFA4WqwD3uAtDLq6/NjWnTrjlQdgCuF29gdL0DcIlWr5?=
 =?us-ascii?Q?4ZDbdlapCvi6PggeiPgjADo+IFyjqtkLnTthvC3pnHFVdlqJWnIqdvmzzeL7?=
 =?us-ascii?Q?ps//29Z/rpLFu4IDzh7fHksMty//c7/OxayKEzyDannyHas38FVkLhl3pXfj?=
 =?us-ascii?Q?PqwNLAgeUVFH0mtbiNcyrFgiocktihmwpqT5BRoKHBbBJR/TWYoOihro5+AI?=
 =?us-ascii?Q?eR8YQL2jvVGP4B+Tg3cGsuppSIDbzfvXOUdgTA5on4TIwsliAXld3bmkb+uS?=
 =?us-ascii?Q?s0b+28VNlLJ2YtpZtLFjKssY19dnmM+owICHDxZT8zlwLY8yZr/Lqx0nW1lN?=
 =?us-ascii?Q?fz4HiYCAaOPNsRtoBtHnrwetxDuBAjgocjRmf0DTT6Hr+dhhYs92yade0BU1?=
 =?us-ascii?Q?+NktIiX5m4QY4/c7XemGNPBfbRCgdTWtDEnjpi1df/zZyl+lCBxrm+tzuGWz?=
 =?us-ascii?Q?xQOPCRAABe7jMYcC0J+XUBNKKueE/+h1MUbjCDRfTvSaUVfV3h6+1hhdOdFl?=
 =?us-ascii?Q?7lpSS2V/kpDfCpWFsiXfsayFPNRdrllbR4yrVaDzx0rSyUAczctcwQ9wlvbH?=
 =?us-ascii?Q?THrwWQzh07va+1J5yTqYPiiKDIpST36SDKnn35ejdw3ga+MP5ZXZRKvBpNSb?=
 =?us-ascii?Q?+rCKM17ufCTMUiqaGcZ9vLMztTZ5FRaK/1Bqmb7gJUXTudmTlTfhBA31u1CS?=
 =?us-ascii?Q?0PfiV3Kpah4wY6tgKBqh4jHXBWbBBZ8PixEYiBSKsEw249mool9epWTy1rYb?=
 =?us-ascii?Q?HkRUIuBG9oxBhcZhI0BYXxRUiXijsgUigqu9MUtI9jtGx2nhPt1dc+stTw9a?=
 =?us-ascii?Q?uGYfmTiS0E0SfuxwTeak54f1Lrow4E236bjHfhYBK0g6zdxdEeD1XuezrJKm?=
 =?us-ascii?Q?jeNTFGNEMMzWx6LTYbqeBrZX9wuQN7lxowXadayjTo47Q+b+kkO2F01OS5A9?=
 =?us-ascii?Q?lbw6VPn30LRp/4DjH7m2aZPta/AccIikOTFYUgAv/eGD7TwTFQi0xZAo1ZeB?=
 =?us-ascii?Q?UBDuIHDxP1OrTCIwg0UzS21YUfvJ3y8MmiCbB/LFUMs6FvmwiWwZQSvEhPdl?=
 =?us-ascii?Q?LHpeGISFkKnTmQUxmG31kTgWCXZwASfDT0npxk8CwgJt0TqbQdZ9EhvyUrme?=
 =?us-ascii?Q?S4elr/r8Te4UTupHmS73DsYDhENLtTQmUhxdAf+2KA2hKt7BeR5NFP+Txrz3?=
 =?us-ascii?Q?+12QCZD2U/zdL8lDpuVqfBip3YZNQWMgQlccNnUvamimzUGEe8rRN3NpX4R8?=
 =?us-ascii?Q?l5KUiAnFNElbEnYLHii0ps8SBz4Y3N8s++DuSdk0injADmPIDfBXHdjrl/Ct?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a1fb99-318b-4d0d-61db-08dc647f916d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:57:04.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNmS9RgHETnL1MVCIRpdwgroC7n3CaJsuy+y16SJGAPZE8kWz60RBDFdaenOWK8UeXufxv+M3hgmKI6eP2cnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

On Wed, Apr 24, 2024 at 01:44:11PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 24, 2024 at 04:35:17PM +0000, Matthew Brost wrote:
> > On Wed, Apr 24, 2024 at 10:57:54AM -0300, Jason Gunthorpe wrote:
> > > On Wed, Apr 24, 2024 at 02:31:36AM +0000, Matthew Brost wrote:
> > > 
> > > > AMD seems to register notifiers on demand for parts of the address space
> > > > [1], I think Nvidia's open source driver does this too (can look this up
> > > > if needed). We (Intel) also do this in Xe and the i915 for userptrs
> > > > (explictly binding a user address via IOCTL) too and it seems to work
> > > > quite well.
> > > 
> > > I always thought AMD's implementation of this stuff was bad..
> > 
> > No comment on the quality of AMD's implementaion.
> > 
> > But in general the view among my team members that registering notifiers
> > on demand for sub ranges is an accepted practice.
> 
> Yes, but not on a 2M granual, and not without sparsity. Do it on
> something like an aligned 512M and it would be fairly reasonable.
> 
> > You do not *need* some other data structure as you could always just
> > walk the page tables but in practice a data structure exists in a tree
> > of shorts with the key being a VA range. The data structure has meta
> > data about the mapping, all GPU drivers seem to have this. 
> 
> What "meta data" is there for a SVA mapping? The entire page table is
> an SVA.
> 

If we have allocated memory for GPU page tables in the range, if range
has been invalidated, notifier seqno, what type of mapping this is (SVA,
BO, userptr, NULL)...

The "meta data" covers all types of mappings, not just SVA. SVA is a
specific class of the "meta data".

> > structure, along with pages returned from hmm_range_fault, are used to
> > program the GPU PTEs.
> 
> Most likely pages returned from hmm_range_fault() can just be stored
> directly in the page table's PTEs. I'd be surprised if you actually
> need seperate storage. (ignoring some of the current issues with the
> DMA API)
> 

In theory that could work but again practice this not how it is done.
The "meta data" cover all the classes mapping mentioned above. Our PTE
programming code needs to be handle all the different requirements of
these specific classes in a single code path.

> > Again the allocation of this data structure happens *before* calling
> > hmm_range_fault on first GPU fault within unmapped range.
> 
> The SVA page table and hmm_range_fault are tightly connected together,
> if a vma is needed to make it work then it is not "before", it is
> part of.
>

It is companion data for the GPU page table walk. See above
explaination.

Matt
 
> Jason
