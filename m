Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C78A04A22
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 20:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502810E783;
	Tue,  7 Jan 2025 19:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehXISKwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3CD10E783;
 Tue,  7 Jan 2025 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736277873; x=1767813873;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=/IENf24jC0bFhTff3AD8CFSHMDE8BSfFLvexe+/hwYk=;
 b=ehXISKwmcEzhbeVf8SMJzFiivEqZC0jduh2k2Q6WT5t62gtQpJOL2/ni
 vZRvKB0zre0/nu5I3xBNCFNMM0MtrLi2lk6IRJv2bNd0mCqr69lt9EZoL
 Cl4ByUfzdrrGV1PQMPkQsldtiWmo8nC3aVXMQhXaNx7GrMLtXqxDMxSmj
 vXrqJUvp0O1Zg0YHn99hrvgflfyLq47zmp78NjswrLDA0Ww/9VGD95GNB
 qcFoNVaWIeAU7tviXwwH8fc0eNxGI8gQHQ3ZiZT/EN/R5ta4ueyr/8mZv
 rsqQxYd9bb3laXUdVlMnBkuaQVsgdtjkdxGW2aZ8Yy3iOEm9RcIUzLVCG w==;
X-CSE-ConnectionGUID: dBQXVqR1QSGPdn+BGGFqhQ==
X-CSE-MsgGUID: TWqGKwrYQPmMI7hfYeF4Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46978169"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="46978169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 11:24:33 -0800
X-CSE-ConnectionGUID: KDlp75bWQSOqo24BdAgeXA==
X-CSE-MsgGUID: fYjzvJiqRd2qAHPPykMZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103363494"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 11:24:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 11:24:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 11:24:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 11:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXFZrG/8ehJ/5JoKuvawOEFH7+pjLbRDsYKmiwOuqpRKnTdHQrNmwKW4FrD3WB/8dJ15aUV5PUWTSw4PB4HJmHwXtVcbsE//kAhV1/9wWmjuU40ynI/5jVFyqfzUiqdbO1QjnOr/+Th+NBY3VJD9y1jvFFsXmvOzRbR57tGIS0djWd9bnQ7UCFcmw6oyAcYr8R6zc4jHPXTPDDqWjKiPRed6Sfl4y+/+z6EqL8evx/VXv1FWvoCbMJeyxEGRvWwaNm0cw6P7yzTO0iMSom5hKkLjGmCQtBW604q35EnLHMYT1VyLPGQOkaOePDrJ1dYWTfyt1PPd0UTMe4lNg2ODkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb5iDrpWvrcGhm1HkUbP0ygha5x5KO7CFf5e82ud/WI=;
 b=ckIhfYVhZq1YHLWvJrWf/g0K9L0vtErRqwqbFwDXeYzZse3VlYxgxhfk5iUwumQQ1et2mzghM7GdF6BtO2qAx4uhB8WOvYAsIoT8HyUFORGmAO5/1ubsM/+OfqJfaWy6oAIg8tS+1CvL6eS+9cE8UqC/UqdSa9Ot5oPXuPJvZKH6psiHrzy9YkGwS/2wB+JwmjaM8qgj730K5uLqxuzfX6ZJ2kpK9GfbS6v+fzfSUAXE0zAKTUsOatnNwYlJCFFb4eKSFvQQWhSZw5M6pvDxR1HBfUZrQ68cLUDB0lNBni2rSL1HYM3iZogGYrAWrDyJCpnopbi0ZYZ2SX8JfEshpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 19:24:13 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 19:24:13 +0000
Date: Tue, 7 Jan 2025 14:24:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <Z31_WPbBoHkwgEA9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a77ef02-34bc-419d-b8c6-08dd2f50de52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wqI4Btx6+/8kPtGEM5HmClhF2HkqWmDTsrcrk5RIcBPY0elATZQjrTwfU6?=
 =?iso-8859-1?Q?F5L2vyTfHuu2Pw2Is1JiwBLXrO+X/H9w0eFizb9i9TmdeRCwDwhiVEoqfO?=
 =?iso-8859-1?Q?t7hffZBav38Im1vG+Mv9U5Ag6v08nP6TuTeugo23EBQ4qXIPbBf5QRNMqL?=
 =?iso-8859-1?Q?pAFxvbzGWQTQ8jpkYLbUe5AtQjFEKdchpucBRHxnUIY5MEuW+I/y8eowBL?=
 =?iso-8859-1?Q?rRZpIhWypQuMuMpwhkT3DHDP4MGDS6WSf4GdmjGde9ZKGL9R4XABl1Ndw/?=
 =?iso-8859-1?Q?+1knns0Wv7g8yeDaCSe0eqvf7sg76QFHflvPvQcIfW2rYvHk43eg/npWek?=
 =?iso-8859-1?Q?TYgAquv4qNYldOufv5bUgJlBwSpctARzK8H67Ae8F2qdoYjFOoqBDawN8E?=
 =?iso-8859-1?Q?N+DUJQhI9FAc9pWIBhDt68WmMfTgYjX/q1GWXyPRwlPEzNPQ/uunXFdq/5?=
 =?iso-8859-1?Q?lVjrPELKRZsgTl19OZF6nrJZ+m2BpwGR9ymuVPzNVeV8Xm6XqUo6/ayDV5?=
 =?iso-8859-1?Q?7BkeW9FgDyFU6sSYtBQEb/QpfH/f2CBZVYinmEmPhJpA39462a8H5j1ZRw?=
 =?iso-8859-1?Q?Gwo/Sb1tVOvBQZtKmZB3ZJiSrUL4AlFGbn9+DcnjncWIrlTlyERL5yiT8q?=
 =?iso-8859-1?Q?Dh+OnofzWGO/kK148tfxzldWdZDVUjXlfQUgF4GAUzKnry7zdboGMpK39Y?=
 =?iso-8859-1?Q?BvsHn1pqTdeXAE4NXI8Gm3wvBiTHjmppLk5LU2NQ3TepZH3osFdKauzO7L?=
 =?iso-8859-1?Q?6FLV4ilyD3lbei3D8pp41YiarijOTEdlESUPgg8n2ektbuYiDj0U+UIrd6?=
 =?iso-8859-1?Q?+8kv8k5qRw4MjNgZjKicsPJF2NZu7oHMGrIJy28buX6iZMV92u4DBM8uRs?=
 =?iso-8859-1?Q?4PAb277R5eKMp1pH94H7sduQer3TxqpOJ3sKuyho+cBQlCmnBYWHjQ29rV?=
 =?iso-8859-1?Q?6r2PyRorAbJB7Aj9R/uxLkMGrIfQCahjW72LPoIlF4AmJpvJuPoe0cytYv?=
 =?iso-8859-1?Q?yt+6q3qLJePVpQ0HP1++azMs24ZS+a8dd3luglw6lYQ1OvkXceP6G4x9k5?=
 =?iso-8859-1?Q?8V++IfLftqlg5X8nQBJetq7qgh13qE6+JyhIUPab2StC2woCc8OdFofUDa?=
 =?iso-8859-1?Q?rGsJBacnxkbDkyyNdeXUSMUPX6iZsrQcJXl9utpswT2JATuneOzrXT4ait?=
 =?iso-8859-1?Q?FUcklOUaGCSjUJWAXpmwUWQTJhyMhhqreT++vdQxxaR5L8y2+ZrLrxYJ6v?=
 =?iso-8859-1?Q?Bb6L5R9SNK6Au2MD9xX6DtvaJqs9VzSeghCPJuoJ5gDiDcUjlzCZ78pQlq?=
 =?iso-8859-1?Q?YOS4qUJUUSAJlxxLeXBPbIUoDh3hPanVPJ0mnDbjJkbKdSoBQWQzGP1qFp?=
 =?iso-8859-1?Q?729EeztLCFjmx2N/wXTDfr2nlYIpOYDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0WSICOl8A8qtR3v87zSZ6sld3Dh44sTHry1mBaIUVBgJcOH2nGq9RkPylY?=
 =?iso-8859-1?Q?6/zhibitl4zWk1vdTZU4AKGIfpNx2ut+vvP0fr03c7PEX8yllzyAYVHQpC?=
 =?iso-8859-1?Q?z4NT/KF699lYRh9L1TXeqpNFJtfCjgn/cibUgJRzJMEY/5p5hxtLUt8v+o?=
 =?iso-8859-1?Q?3FwuVAjc0F0ewhbxEZVEd1MwgtqAd+sVjE2dq3DFRMhCbCET+L4PXwbMrq?=
 =?iso-8859-1?Q?271hCptqAgpVUBhxpowcPMtAd4pKuGeb4x3ftAR0LkCkFjb6Wzcuorex6G?=
 =?iso-8859-1?Q?Guta6ScOfVXWEe3/yAjoo3KfK2azr047zGL4YmXmLtabOdRE+nRDG8Ks3R?=
 =?iso-8859-1?Q?L5K1hFyuUAUTehf9XxRgvaAv50YAgJn9fvlmfLYuZmcUuj+KlBSU5u2CBg?=
 =?iso-8859-1?Q?iEyopw7VLhHgQbqbM8lHtlhP9CeC/5VA1XLbhVTrQpA/Yr3WTuZgdzq+Wy?=
 =?iso-8859-1?Q?9h5xFSxEA67tDZb+PysERy1TU5URMakHMugeROjyoiymyc+bmhPvUh1oNb?=
 =?iso-8859-1?Q?Ff3fN6AVGvHYmCzGdUEZd4/vyZ6EKY7Zh76TlI3AuiQq8h8kgvcJgJZXH8?=
 =?iso-8859-1?Q?+3N9hekB8lC5J4/pk9CEbAUWLsbEvsZuEvK1xpEEbHkZi0BJOpWlLXQAax?=
 =?iso-8859-1?Q?OJ+PeRRVsM0QmYBEPPFhnBdTii7A0OFAJF9DthVRO8kAE4DB8g+Tn7+bfn?=
 =?iso-8859-1?Q?hexoZQksVbowJrZuon/LWrpHaSWpT/UCV/qAiAXBS3byvmSV3vDF5/r5kp?=
 =?iso-8859-1?Q?cbYzPii2AexRweV1HrNAGOs1vMHSHyfuG+kD+X9sD+DGWU1HqyVEXiolOt?=
 =?iso-8859-1?Q?pDVowSypAWUcxQ/IvC9ahGz8IIiU0SPoySJAw2r/JIm0vOVAniFXD5JLwf?=
 =?iso-8859-1?Q?5AieJan+XpPopBSu/MEvo8S00w/8EqQA+lKJ5FyuJIv5Nm3ucqYVro8+x5?=
 =?iso-8859-1?Q?9HCuQPl2bcQUu30MhkNrzLJDznb6X8HVXJ8mE4IWK/1GsWLuUI9vdUTpWQ?=
 =?iso-8859-1?Q?ftO8R1zg1nl3y+CJetMy1ex0xYit26qdRyh6eTQA5A7JHAaXVrkUZGIWAO?=
 =?iso-8859-1?Q?vWyfqnL7wG/LZ1t36ZX9pwmyulf+ped9K39MpK+HVqZijbtvPID1aA3hyL?=
 =?iso-8859-1?Q?DVb08ObVJWGyjhvEYbDzKbSjTfL5ESvwqVvg+vnFFHXDfOItPLNpMhD0Ak?=
 =?iso-8859-1?Q?CeS1W1RlUmMjmezWImqCsBQxBRyvnI2pRO4E403oj7d+gmGBJ7KDbF7THE?=
 =?iso-8859-1?Q?v7lrk/eGPDEeVWkfiVjzL52EqU8+9yVQvZkjZhXxQBY3niQ+HKYoNtHAeR?=
 =?iso-8859-1?Q?jW57JPutfojwlI9TJXvJn8qoSXtIbnRUwCONeB3gCJ+meGyI7DdXW2OO8S?=
 =?iso-8859-1?Q?9276N5fSibOcYtFDRPJehvf3HQg6wy7UGPX3zHC3ksz9exapOEKnG9fQqc?=
 =?iso-8859-1?Q?px3lGNYYzdQL/5JD1YWmHvWNMRDS26ZREAq2l62+q368EgLOUyuvj1EHNJ?=
 =?iso-8859-1?Q?K83eilRVggQdYbu7JXOHMsHTejRVt0ZYtwgozSwOXNw5wAyGOXCusFpZqD?=
 =?iso-8859-1?Q?u7mTe/vie/5kU51U71Mj5EhqyrfaQdUQ+LnLTZ119k4ob7XuukRHJzieyn?=
 =?iso-8859-1?Q?zaQ0gcc4NyMYqVgVQQdRpP7CXq8eZ0C6Ht1XseZ2lNB73nKlt9ngnRUg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a77ef02-34bc-419d-b8c6-08dd2f50de52
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 19:24:13.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGZzLKoMFJV3ZLo0RliR2iTZBrAgH/yZIekOlRTRJ8YZRJY5EhYWoc5TIU8LjcXglCPzP/IuXUbBqf0Bw+FEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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

Hi Sima and Dave,

Here goes the last i915 towards 6.14.

An active display round with some big series, but
nothing extraordinary.

Thanks,
Rodrigo.

drm-intel-next-2025-01-07:
Driver Changes:
 - Some DG2 refactor to fix DG2 bugs when operating with certain CPUs (Raag)
 - Use hw support for min/interim ddb allocation for async flip (Vinod)
 - More general code refactor to allow full display separation (Jani)
 - Expose dsc sink max slice count via debugfs (Swati)
 - Fix C10 pll programming sequence (Suraj)
 - Fix DG1 power gate sequence (Rodrigo)
 - Use preemption timeout on selftest cleanup (Janusz)
 - DP DSC related fixes (Ankit)
 - Fix HDCP compliance test (Suraj)
 - Clean and Optimise mtl_ddi_prepare_link_retrain (Suraj)
 - Adjust Added Wake Time with PKG_C_LATENCY (Animesh)
 - Enabling uncompressed 128b/132b UHBR SST (Jani)
 - Handle hdmi connector init failures, and no HDMI/DP cases (Jani)
The following changes since commit d678c63534ed0d0fe52ff95cea83808f6f0ae382:

  Merge tag 'drm-misc-next-2024-12-19' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-12-20 08:24:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-01-07

for you to fetch changes up to 15133582465fe19252eb1dd90c4570bb42e795ab:

  drm/i915/display: convert global state to struct intel_display (2025-01-07 19:31:39 +0200)

----------------------------------------------------------------
Driver Changes:
 - Some DG2 refactor to fix DG2 bugs when operating with certain CPUs (Raag)
 - Use hw support for min/interim ddb allocation for async flip (Vinod)
 - More general code refactor to allow full display separation (Jani)
 - Expose dsc sink max slice count via debugfs (Swati)
 - Fix C10 pll programming sequence (Suraj)
 - Fix DG1 power gate sequence (Rodrigo)
 - Use preemption timeout on selftest cleanup (Janusz)
 - DP DSC related fixes (Ankit)
 - Fix HDCP compliance test (Suraj)
 - Clean and Optimise mtl_ddi_prepare_link_retrain (Suraj)
 - Adjust Added Wake Time with PKG_C_LATENCY (Animesh)
 - Enabling uncompressed 128b/132b UHBR SST (Jani)
 - Handle hdmi connector init failures, and no HDMI/DP cases (Jani)

----------------------------------------------------------------
Animesh Manna (2):
      drm/i915/psr: Disable psr1 if setup_time > vblank
      drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY

Ankit Nautiyal (24):
      drm/i915/dp: Update Comment for Valid DSC Slices per Line
      drm/i915/display: Prepare for dsc 3 stream splitter
      drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
      drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
      drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
      drm/i915/dp: Ensure hactive is divisible by slice count
      drm/i915/dp: Enable 3 DSC engines for 12 slices
      drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC
      drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC
      drm/i915/dp: Refactor FEC support check in intel_dp_supports_dsc
      drm/i915/dp: Return early if DSC not supported
      drm/i915/dp: Separate out helper for compute fec_enable
      drm/i915/dp: Drop check for FEC in intel_dp_fec_compute_config
      drm/i915/dp: Remove HAS_DSC macro for intel_dp_dsc_max_src_input_bpc
      drm/i915/dp: Return int from dsc_max/min_src_input_bpc helpers
      drm/i915/dp_mst: Use helpers to get dsc min/max input bpc
      drm/i915/dp: Drop max_requested_bpc for dsc pipe_min/max bpp
      drm/i915/dp: Refactor pipe_bpp limits with dsc
      drm/i915/dp_mst: Use pipe_bpp->limits.{max/min}_bpp for dsc
      drm/i915/dp: Use clamp for pipe_bpp limits with DSC
      drm/i915/dp: Make dsc helpers accept const crtc_state pointers
      drm/i915/dp: Set the DSC link limits in intel_dp_compute_config_link_bpp_limits
      drm/i915/dp_mst: Use link.{min/max}_bpp_x16
      drm/i915/dp: Return early if dsc is required but not supported

Arun R Murthy (3):
      drm/i915/dp: use fsleep instead of usleep_range for LT
      drm/i915/dp: read Aux RD interval just before setting the FFE preset
      drm/i915/dp: Include the time taken by AUX Tx for timeout

Daniele Ceraolo Spurio (1):
      drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.

Eugene Kobyak (1):
      drm/i915: Fix NULL pointer dereference in capture_engine

Gustavo Sousa (18):
      drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
      drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
      drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
      drm/i915/dmc_wl: Check for non-zero refcount in release work
      drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
      drm/i915/dmc_wl: Use sentinel item for range tables
      drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
      drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
      drm/i915/dmc_wl: Track registers touched by the DMC
      drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
      drm/i915/dmc_wl: Deal with existing references when disabling
      drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
      drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
      drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
      drm/i915/xe3lpd: Use DMC wakelock by default
      drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
      drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
      drm/xe/display: Flush DMC wakelock release work on runtime suspend

Imre Deak (6):
      drm/i915/ptl/dp_mst: Fix slave transcoder enabling wrt. DDI function
      drm/i915/adlp+/dp_mst: Align slave transcoder enabling with spec wrt. DDI function
      drm/i915/dp_mst: Add a way to disable the DP2 config
      drm/i915/adlp+/dp_mst: Align slave transcoder sequences with spec wrt. DP2 config
      drm/i915/adlp+/dp_mst: Align master transcoder disabling with spec wrt. DP2 config
      drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()

Jani Nikula (113):
      drm/i915/sbi: add intel_sbi_{lock,unlock}()
      drm/i915/sbi: add a dedicated mutex for LPT/WPT IOSF sideband
      drm/i915: add a dedicated mutex for VLV/CHV IOSF sideband
      drm/i915: hide VLV PUNIT IOSF sideband qos handling better
      drm/i915/dp: demote source OUI read/write failure logging to debug
      drm/i915/psr: add LATENCY_REPORTING_REMOVED() register bit helper
      drm/i915/psr: stop using bitwise OR with booleans in wm_optimization_wa()
      drm/i915/display: identify discrete graphics
      drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
      drm/i915/display: convert HAS_4TILE() to struct intel_display
      drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
      drm/i915/display: convert HAS_DP20() to struct intel_display
      drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
      drm/i915/display: convert HAS_IPS() to struct intel_display
      drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
      drm/i915/display: convert HAS_SAGV() to struct intel_display
      drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
      drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
      drm/i915/display: rename i915 parameter to __display in feature helpers
      drm/i915/display: convert display device identification to struct intel_display
      drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
      drm/i915/display: add mobile platform group
      drm/i915/mst: pass primary encoder to primary encoder hooks
      drm/i915/mst: rename intel_encoder to encoder
      drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
      drm/i915/mst: use primary_encoder in fake mst encoder creation
      drm/i915/display: make CHICKEN_TRANS() display version aware
      drm/i915/mst: convert to struct intel_display
      drm/i915/mst: change naming from fake encoders to MST stream encoders
      drm/i915/dp: add comments about hooks called from MST stream encoders
      drm/i915/mst: pass intel_dp around in mst stream helpers
      drm/i915/mst: unify MST connector function naming to mst_connector_*
      drm/i915/mst: simplify mst_connector_get_hw_state()
      drm/i915/mst: unify MST topology callback naming to mst_topology_*
      drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
      drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
      drm/i915/dp: refactor clear/wait for act sent
      drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
      drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
      drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
      drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
      drm/i915/overlay: convert to struct intel_display
      drm/i915/overlay: add intel_overlay_available() and use it
      drm/i915/plane: convert initial plane setup to struct intel_display
      drm/i915/irq: hide display_irqs_enabled access
      drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV
      drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
      drm/i915/display: prefer DISPLAY_VER over GRAPHICS_VER in display s/r
      drm/i915/dislay: convert i9xx_display_sr.[ch] to struct intel_display
      drm/i915/dp: use seq buf for printing rates
      drm/i915/display: convert for_each_power_well() to struct intel_display
      drm/i915/display: convert for_each_power_domain_well() to struct intel_display
      drm/i915/display: convert power wells to struct intel_display
      drm/i915/display: convert power domain code internally to struct intel_display
      drm/i915/display: convert high level power interfaces to struct intel_display
      drm/i915/display: convert power map to struct intel_display
      drm/i915/display: replace dig_port->saved_port_bits with flags
      drm/i915/display: remove unused for_each_crtc()
      drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants
      drm/i915/display: convert intel_display_driver.[ch] to struct intel_display
      drm/i915/pps: debug log the remaining power cycle delay to wait
      drm/i915/pps: include panel power cycle delay in debugfs
      drm/i915/mst: add beginnings of DP MST documentation
      drm/print: add drm_print_hex_dump()
      drm/i915/display: use drm_print_hex_dump() for crtc state dump
      drm/i915/display: use drm_print_hex_dump() for buffer mismatch dumps
      drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
      drm/i915/dp: add g4x_dp_compute_config()
      drm/i915/dp: move g4x_dp_set_clock() call to g4x_dp_compute_config()
      drm/i915: split out i9xx_wm_regs.h
      drm/i915: relocate _VGA_MSR_WRITE register definition
      drm/i915: move DDI_CLK_VALFREQ next to other Cx0 PHY registers
      drm/i915/mst: use intel_dp_compute_config_limits() for DP MST
      drm/i915/dp: s/intel_encoder/encoder/
      drm/i915/dp: s/intel_connector/connector/
      drm/i915/dp: convert to struct intel_display
      drm/i915/dp: convert interfaces to struct intel_display
      drm/i915/dp: finish link training conversion to struct intel_display
      drm/i915/gvt: always pass struct intel_display * to register macros
      drm/i915: extract intel_uncore_trace.[ch]
      drm/i915/display: add intel_display_conversion.c to hide stuff better
      drm/i915/uncore: add to_intel_uncore() and use it
      drm/i915/display: add struct drm_device to struct intel_display conversion function
      drm/i915/display: drop i915_drv.h include from intel_display_trace.h
      drm/i915/display: drop unnecessary i915_drv.h includes
      drm/i915/dmc_wl: store register ranges in rodata
      drm/i915/ddi: change intel_ddi_init_{dp, hdmi}_connector() return type
      drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
      drm/i915/hdmi: add error handling in g4x_hdmi_init()
      drm/i915/ddi: gracefully handle errors from intel_ddi_init_hdmi_connector()
      drm/i915/display: add intel_encoder_is_hdmi()
      drm/i915/ddi: only call shutdown hooks for valid encoders
      Merge drm/drm-next into drm-intel-next
      drm/mst: remove mgr parameter and debug logging from drm_dp_get_vc_payload_bw()
      drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead()
      drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n()
      drm/i915/mst: change return value of mst_stream_find_vcpi_slots_for_bpp()
      drm/i915/mst: remove crtc_state->pbn
      drm/i915/mst: split out a helper for figuring out the TU
      drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SST
      drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
      drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
      drm/i915/ddi: write payload for 128b/132b SST
      drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
      drm/i915/ddi: enable ACT handling for 128b/132b SST
      drm/i915/ddi: start distinguishing 128b/132b SST and MST at state readout
      drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()
      drm/i915/ddi: disable trancoder port select for 128b/132b SST
      drm/i915/dp: compute config for 128b/132b SST w/o DSC
      drm/i915/pmdemand: convert to_intel_pmdemand_state() to a function
      drm/i915/pmdemand: make struct intel_pmdemand_state opaque
      drm/i915/pmdemand: convert to struct intel_display
      drm/i915/display: convert global state to struct intel_display

Janusz Krzysztofik (1):
      drm/i915/selftests: Use preemption timeout on cleanup

Jiasheng Jiang (1):
      drm/i915: Fix memory leak by correcting cache object name in error handler

Jouni Högander (1):
      drm/i915/psr: Disable Panel Replay as well if VRR is enabled

Raag Jadav (4):
      drm/intel/pciids: Refactor DG2 PCI IDs into segment ranges
      drm/i915/dg2: Introduce DG2_D subplatform
      drm/i915: Introduce intel_cpu_info.c for CPU IDs
      drm/i915/dg2: Implement Wa_14022698537

Rodrigo Vivi (9):
      drm/i915: Remove vga and gmbus seq out of i915_restore_display
      drm/i915/display: Convert i915_suspend into i9xx_display_sr
      drm/i915/display: Move regfile registers intel_display.restore
      drm/{i915, xe}/display: Move DP MST calls to display_driver
      drm/xe/display: Delay hpd_init resume
      drm/xe/display: Delay dsm handler registration
      drm/{i915, xe}: Move power_domains suspend/resume to display_power
      Merge drm/drm-next into drm-intel-next
      drm/i915/dg1: Fix power gate sequence.

Stanislav Lisovskiy (1):
      drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip

Suraj Kandpal (14):
      drm/i915/xe3lpd: Update HDCP rekeying bit
      drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
      drm/i915/hdcp: Fix when the first read and write are retried
      drm/i915/hdcp: Remove log for HDMI HDCP LIC check
      drm/i915/wm: Initialize max_latency variable to appropriate value
      drm/i915/wm: Refactor dpkgc value prepration
      drm/i915/wm: Use intel_display structure in DPKGC code
      drm/i915/display: Refactor DPKGC code to call it from atomic_commit_tail
      drm/i915/wm: Modify latency programmed into PKG_C_LATENCY
      drm/i915/wm: Club initialized variables of same type together
      drm/i915/cx0_phy: Fix C10 pll programming sequence
      Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"
      drm/i915/dp: Use intel_display instead of drm_i915_private
      drm/i915/ddi: Optimize mtl_port_buf_ctl_program

Swati Sharma (1):
      drm/i915/dsc: Expose dsc sink max slice count via debugfs

Ville Syrjälä (51):
      drm/i915: Relocate the SKL wm sanitation code
      drm/i915: Extract pipe_mbus_dbox_ctl()
      drm/i915: Extract pipe_mbus_dbox_ctl_update()
      drm/i915: Extract mbus_ctl_join_update()
      drm/i915: Sanitize MBUS joining
      drm/i915: Simplify xelpdp_is_only_pipe_per_dbuf_bank()
      drm/i915/dsi: Stop using pixel_format_from_register_bits() to parse VBT
      drm/i915: Introduce HAS_DOUBLE_WIDE()
      drm/i915/cdclk: Extract intel_cdclk_guardband() and intel_cdclk_ppc()
      drm/i915/cdclk: Extract hsw_ips_min_cdclk()
      drm/i915/cdclk: Extract intel_audio_min_cdclk()
      drm/i915/cdclk: Factor out has_audio check in intel_audio_min_cdclk()
      drm/i915/cdclk: Extract vlv_dsi_min_cdclk()
      drm/i915/cdclk: Factor out INTEL_OUTPUT_DSI check in vlv_dsi_min_cdclk()
      drm/i915/cdclk: Suck the compression_enable check into intel_vdsc_min_cdclk()
      drm/i915/cdclk: Drop pointles max_t() usage in intel_vdsc_min_cdclk()
      drm/i915/cdclk: Relocate intel_vdsc_min_cdclk()
      drm/i915/cdclk: Unify cdclk max() parameter order
      drm/i915: Grab intel_display from the encoder to avoid potential oopsies
      drm/i915/crt: Split long line
      drm/i915/crt: Drop the unused ADPA_DPMS bit definitions
      drm/i915/crt: Use REG_BIT() & co.
      drm/i915/crt: Clean up ADPA_HOTPLUG_BITS definitions
      drm/i915/crt: Extract intel_crt_regs.h
      drm/i915/crt: s/pipe_config/crtc_state/
      drm/i915/crt: Drop pointless drm_device variables
      drm/i915/crt: Rename some variables
      drm/i915/crt: Nuke unused crt->connector
      drm/i915/scaler: s/intel_crtc/crtc/ etc.
      drm/i915/scaler: Remove redudant junk from skl_scaler.h
      drm/i915/scaler: Pass the whole atomic state into intel_atomic_setup_scalers()
      drm/i915/scaler: Clean up intel_atomic_setup_scalers() a bit
      drm/i915/scaler: Convert the scaler code to intel_display
      drm/i915/scaler: Carve up intel_atomic_setup_scalers()
      drm/i915/scaler: Make scaler in_use a bool
      drm/i915/scaler: Extract intel_allocate_scaler()
      drm/i915: Don't reuse commit_work for the cleanup
      drm/i915: Intruduce display.wq.cleanup
      drm/i915/dpt: Evict all DPT VMAs on suspend
      Revert "drm/i915/dpt: Make DPT object unshrinkable"
      drm/i915/dsb: Don't use indexed register writes needlessly
      drm/i915/color: Stop using non-posted DSB writes for legacy LUT
      drm/i915/dsb: Nuke the MMIO->indexed register write logic
      drm/i915/pps: Store the power cycle delay without the +1
      drm/i915/pps: Decouple pps delays from VBT struct definition
      drm/i915/pps: Rename intel_pps_delay members
      drm/i915/lvds: Use struct intel_pps_delays for LVDS power sequencing
      drm/i915/pps: Spell out the eDP spec power sequencing delays a bit more clearly
      drm/i915/pps: Extract msecs_to_pps_units()
      drm/i915/pps: Extract pps_units_to_msecs()
      drm/i915/pps: Eliminate pointless get_delay() macro

Vinod Govindapillai (3):
      drm/i915/display: update to plane_wm register access function
      drm/i915/display: add a gelper to relative data rate handling
      drm/i915/xe3: do not configure auto min dbuf for cursor WMs

Zhang He (1):
      drm/i915: Fixed an typo in i915_gem_gtt.c

 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   10 +-
 drivers/gpu/drm/drm_print.c                        |   23 +
 drivers/gpu/drm/i915/Makefile                      |    5 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    1 -
 drivers/gpu/drm/i915/display/g4x_dp.c              |   26 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    6 -
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   36 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    5 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   20 +-
 drivers/gpu/drm/i915/display/hsw_ips.h             |    6 +-
 drivers/gpu/drm/i915/display/i9xx_display_sr.c     |   97 ++
 drivers/gpu/drm/i915/display/i9xx_display_sr.h     |   14 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    1 +
 drivers/gpu/drm/i915/display/i9xx_wm_regs.h        |  257 ++++
 drivers/gpu/drm/i915/display/icl_dsi.c             |    5 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   28 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   54 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |    1 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |    1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   15 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    8 -
 drivers/gpu/drm/i915/display/intel_bw.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  179 +--
 drivers/gpu/drm/i915/display/intel_color.c         |    1 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    1 +
 drivers/gpu/drm/i915/display/intel_crt.c           |  163 ++-
 drivers/gpu/drm/i915/display/intel_crt_regs.h      |   50 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |    1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   14 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   16 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    5 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  664 ++++++----
 drivers/gpu/drm/i915/display/intel_ddi.h           |   12 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   23 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   18 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  117 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    3 -
 .../drm/i915/display/intel_display_conversion.c    |   14 +
 .../drm/i915/display/intel_display_conversion.h    |   10 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   17 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   11 +-
 .../i915/display/intel_display_debugfs_params.c    |    3 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  278 +++--
 .../gpu/drm/i915/display/intel_display_device.h    |  155 +--
 .../gpu/drm/i915/display/intel_display_driver.c    |  301 ++---
 .../gpu/drm/i915/display/intel_display_driver.h    |   38 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   52 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   13 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  952 ++++++++-------
 drivers/gpu/drm/i915/display/intel_display_power.h |   29 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   62 +-
 .../drm/i915/display/intel_display_power_well.c    |  567 +++++----
 .../drm/i915/display/intel_display_power_well.h    |   35 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    4 +-
 .../gpu/drm/i915/display/intel_display_snapshot.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   51 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    4 -
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |  315 ++++-
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |   14 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 1265 +++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h            |   41 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    3 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    3 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   40 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  913 +++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    7 +
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    1 -
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |    3 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    8 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    1 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |    1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   58 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   20 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    1 +
 drivers/gpu/drm/i915/display/intel_global_state.c  |   42 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |    6 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   48 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   19 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    6 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_load_detect.c   |    2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   49 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   19 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  184 +--
 drivers/gpu/drm/i915/display/intel_overlay.h       |   19 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    7 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    2 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   27 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   56 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.h |    4 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |  195 +--
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |   51 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  174 +--
 drivers/gpu/drm/i915/display/intel_psr.c           |   88 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    8 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   80 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    1 +
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    3 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  287 ++---
 drivers/gpu/drm/i915/display/skl_scaler.h          |   11 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   51 +-
 .../drm/i915/display/skl_universal_plane_regs.h    |   15 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |  867 ++++++++------
 drivers/gpu/drm/i915/display/skl_watermark.h       |    5 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   28 +-
 drivers/gpu/drm/i915/display/vlv_dsi.h             |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   19 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    3 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   17 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   81 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   21 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   45 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  132 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   21 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c                |    2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   12 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  378 +-----
 drivers/gpu/drm/i915/i915_suspend.c                |  141 ---
 drivers/gpu/drm/i915/i915_suspend.h                |   14 -
 drivers/gpu/drm/i915/i915_trace.h                  |   28 -
 drivers/gpu/drm/i915/intel_cpu_info.c              |   44 +
 drivers/gpu/drm/i915/intel_cpu_info.h              |   13 +
 drivers/gpu/drm/i915/intel_device_info.c           |    9 +
 drivers/gpu/drm/i915/intel_device_info.h           |    5 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    2 +
 drivers/gpu/drm/i915/intel_sbi.c                   |   22 +-
 drivers/gpu/drm/i915/intel_sbi.h                   |    4 +
 drivers/gpu/drm/i915/intel_uncore.c                |    7 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    2 +
 drivers/gpu/drm/i915/intel_uncore_trace.c          |    7 +
 drivers/gpu/drm/i915/intel_uncore_trace.h          |   49 +
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |   12 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    2 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |   28 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |    3 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    3 +-
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |   17 +-
 drivers/gpu/drm/xe/Makefile                        |    1 +
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   16 +-
 .../{i915_trace.h => intel_uncore_trace.h}         |    0
 drivers/gpu/drm/xe/display/xe_display.c            |  116 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    2 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    8 +-
 drivers/gpu/drm/xe/xe_pm.c                         |    4 +-
 include/drm/display/drm_dp_mst_helper.h            |    3 +-
 include/drm/drm_print.h                            |    2 +
 include/drm/intel/pciids.h                         |   55 +-
 174 files changed, 6110 insertions(+), 4889 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.c
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.h
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_wm_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_crt_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_conversion.c
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.c
 delete mode 100644 drivers/gpu/drm/i915/i915_suspend.h
 create mode 100644 drivers/gpu/drm/i915/intel_cpu_info.c
 create mode 100644 drivers/gpu/drm/i915/intel_cpu_info.h
 create mode 100644 drivers/gpu/drm/i915/intel_uncore_trace.c
 create mode 100644 drivers/gpu/drm/i915/intel_uncore_trace.h
 rename drivers/gpu/drm/xe/compat-i915-headers/{i915_trace.h => intel_uncore_trace.h} (100%)
