Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA8AC714C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 21:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5996F10E2C0;
	Wed, 28 May 2025 19:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6hDhLOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262C010E2C0;
 Wed, 28 May 2025 19:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748459266; x=1779995266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O5XWh+gJMUd7tA88qYJNDWtvGCD86ewIesBcFWu7zc8=;
 b=Y6hDhLOv5rUqLH1IQv2Y49+iXyKN9p5HAIhYyrhwjqjxHOWRw1p2OFmj
 NU8K51AUXcmVJEDBMD0sHuHVXRZpB4hnz956A/2JoJ4XtVNFFEnCJB8bx
 eLINm3X0+oAE3OHSX9QCYlI0oJta02dIK1EOOM7eLG9K4duP1AOvMhafu
 IjuQyYA25EPu4upFZPSkFnT5oV6ua/cmzAiWAVQiKbwttVScAYYZnmzn4
 Jh6du8z/yH2W1D9NaYASw/GiFwd0nvSYqugFssXnWCM+6PjEDcgB8vg5O
 AZKrJvgz0o5dkjyYiy50oMwPY/Ehf6Ux8MNj+3OUPYiLvWjAfgC1zcjVj Q==;
X-CSE-ConnectionGUID: 4MWsZqbgStCWH+45gmv5Uw==
X-CSE-MsgGUID: W7wj4mf0TIWICGLIFB4VSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61556991"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61556991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 12:07:44 -0700
X-CSE-ConnectionGUID: klS8+gx7R/mZcLU9XfuvTw==
X-CSE-MsgGUID: QN2bxNgBRv64Tvn5MFqZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148190915"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 12:07:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 12:07:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 12:07:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 12:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF2IR6e42epCDRKbysno2ZlfqA68NnWyJNPxYXuJHsZuCftpD987qUgexz0bi3GYKmKKt7BWcWo6W/qd4ceqcLW8wgVhqkb4ujC27GurfF9tnwjqNfG28vwCuI3Ih2iVa86ktzNHy/Fo7JxXMqpwnlANtkDHBR6Ok6sqkjxe23lbQvP+5cfshoUueX1Og2BSaa6FN01wQjZHZr0qg0ioXUe5RUOtUsK46kHhgij2HBcttSlqK/Q23p8mQbtARay0384VPgJKNs00PetcE9t/59a+H2c4P4Me9W00PutPCWCATfIBZcnzE0rNeRLXhXUVYfDHVx1iQ4GFqgAJasHPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cks2IbmT19oybuvLMq6OrsyC5QlmBX3OrlIf3Zoh3Kw=;
 b=iGpLSJ3jtLA++W0dFS+0dpJ7KOEds29jpE8vfaqz5jQiNMt2/gAE9WcT8fmy4eKc+cayd20afRFLIEqRO6gUpFdMuipV5stcnksL1OVRWtNtSGkfaxtxZoU38UOiqR8TjSIpCcTSOTsHlwF3zPPzLX+Ln+OUiXt2XvvXJDOpMwoNth0bky5IcBA8qAllrMKRTJ3uiLZg4Zxf/+YbB2ioQ4k9ANbP3mAdD+UineQxQU4m8yZFPMVGBjIkxFiAcC8wFXpYlHu/z9O1mlr3ceU9VzfCjrXsjTa+qego0PINt4W/Ei5mvmavhUGJGERgPjHK/BKeUA9u/HjkGc7Cv0hz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 19:07:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 19:07:39 +0000
Date: Wed, 28 May 2025 14:07:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
CC: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, "Rob
 Clark" <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, Melissa Wen
 <mwen@igalia.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Christian =?utf-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <lima@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v11 02/10] drm/sched: Store the drm client_id in
 drm_sched_fence
Message-ID: <5jnpsmjef5ibegbsbelkfmudv4wagpcfb25nptqs5z4ccitq4c@3bdtrbrrmtil>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
 <20250526125505.2360-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250526125505.2360-3-pierre-eric.pelloux-prayer@amd.com>
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 0267c96c-eb01-4127-2eaa-08dd9e1aea7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IVLfLNw7R6hG7kLM+X+tTxzxs7C1YYlLkHxLLEnbWNwIkL2IDLZ7ki8oIPUN?=
 =?us-ascii?Q?dlDbeDkfepS6yPAQWELfZNJh0YNq0AVXvNW+CmMluki2sIOG8kCA0Df3qRwm?=
 =?us-ascii?Q?eIUWMUnrQc/VEjAy1vSKcQUTGIXGvkS8tKv33FjyXzfGOeYSzQGf3FBkXLoJ?=
 =?us-ascii?Q?BXXT0CQ3TRs7ax3hpIGnH/eMIDQCcjByM1zEvUeWm0mOH3mcwD1IsmFH1G2Y?=
 =?us-ascii?Q?kdOCkct9JLsuckHm7KNsztCCB82a88XSbMFD5em7xX8rOoLQEzA2f/fekLN2?=
 =?us-ascii?Q?VUfmhoHDA+L659jePLXKuUV4bVh8zaFVMCivt060xRk4ItIPJgmZidjjDsvq?=
 =?us-ascii?Q?zRXTVzrR70oEvaC+Ni11ccreBWKRt5F0tqBXz+NG79VPAsKsSnSnwIrYF6hZ?=
 =?us-ascii?Q?qiCXuuIwFA0NlWlQUgAVu+t/U64vMWjWABudMgWcxwuxHG8JLjJRcbI/Eo1p?=
 =?us-ascii?Q?Gp1f08tuJrEotvwNAZRHkAC9i+eGQSJRjK0Ga2blk3gtQDWhZui40F0WoRFc?=
 =?us-ascii?Q?8REPlWw9t9kijhPS5OiYGx/maFRrcxPNsCxy9W+lq17rxJEdZNlzwt3Bw37M?=
 =?us-ascii?Q?DtSW6xR41KOhwOp0Xt4N+Epwp9iKGmuimjeqY177K/S1/LicGZ4b+gs4ixhA?=
 =?us-ascii?Q?4vqHsxAlFOg/z0VTEeV3LNLv/A8sKygCtLZsUP8cIHiy25C9nVRoAWxrnOM6?=
 =?us-ascii?Q?No6whhDOmaWcep59bd0NzJxZcAalIP3cNLbflp1Czf+xF7Dx2vggKcV9kOFc?=
 =?us-ascii?Q?NEdwRoZvNYQ1X54IKgzQVEngJIHOtSJD+pVwFYmYjE+Hh3FrrtF2YOXo51p+?=
 =?us-ascii?Q?S8JYFH0tPfCvP2gvIjI7l0viGMq25HvJALbzfBZHRZqoq9Bj5K7O/QMSfEyO?=
 =?us-ascii?Q?drno72X5lpYGWYcuGzqp0YbIdDF9QnrI9U8vbZDOQGYUC4C6GRLN8k9wyKK8?=
 =?us-ascii?Q?SwbdcLWUvaLgd0KVNcZ6zYxmcqhpleBYGGak45JU30kYyGuc5rh6FFrdBo+G?=
 =?us-ascii?Q?2Vv6JPnP72pn0wJDPg/2BThvM9JQGpZpUkIbRYefTx9PHOQALTCC8OHsTYL2?=
 =?us-ascii?Q?sABU7/S/s05dw0o0HP+7FE31fkbuLY8iWhgpaORSx+gVnfj7yqIAjHb5cvT1?=
 =?us-ascii?Q?vUCPxHO6ADIuLIy3i3b6lQ+srCnmg74QKYpWCp62W86xpQJG30GUb8lEjbK+?=
 =?us-ascii?Q?OuHS2YQpy7GTauQoiZqKlihMdvRlVI2CaetabXXa9eL3sLlUGKfVqH5N9NW+?=
 =?us-ascii?Q?/mfh7lQWpA3d02q7CIagLxYcWiKntbYKKuxoNlUKv0ofO9aSvJvaZZ3pDGw6?=
 =?us-ascii?Q?GKToFVXBPbI8dhHoZDZbuatqJg2aoctReLKxbXhRPYi6Wx8I8vKFe/xJHZY2?=
 =?us-ascii?Q?bHCIg5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wa+0Rvn0Qr/bjKWly5oDUFUzXhAHLrVnjETPfqyl33C7ulTZzs4ByRJUIS/J?=
 =?us-ascii?Q?5eLuN5FbEjJqhE4x8hZj9zMSYA1ARdG3LatOzLgMszuNwv43FcgjPyzq+e1T?=
 =?us-ascii?Q?XamqJnyjpzIsuG9NqEiXApjR8GcMeJDubUroeyqSJU6vpXPCXvpoYyQiqYAq?=
 =?us-ascii?Q?CR2pJcMHWO1GpkqF7GJ6AH4pxSUNtdW4Kvjzj9dpUjhWwnyONrgdXafgG4yu?=
 =?us-ascii?Q?PAPBURKL6Vfo0sTwqRdgTSGkX2pgJiuGmbMqsmNjlBdG8S2pLub2+du1N4lF?=
 =?us-ascii?Q?m7Fw7TBJ/+jwiVvvY6Zsr+NrcTQ/vo2t9sqD3HECQxoF0TIEuv0tleY+xfjk?=
 =?us-ascii?Q?SnsIXrW7piZJqVi/5EvyhAiL9+Rdbh4BBRzcfWLxlRXfdnNA+lT24H639rWn?=
 =?us-ascii?Q?08ewE5PVGC12+vP8ZUrwLAQdmjqRptCILYvnO7wPvDqtewP0ZkYCuO0QS/HQ?=
 =?us-ascii?Q?SK/353+Kph9R/sf/a0GZA0xGCdSAbbVM1BJJd+IjdfBGCI1kao9p4STg21rc?=
 =?us-ascii?Q?x9Mt/O/5s7yaV7+n71OEYdJm8WChocM17xhHl4U8PDCckXlfOqufbp908GIP?=
 =?us-ascii?Q?Ox4E5GncbqRBJd2pEZLUACBSg+oyKPVRmDRGdlzG/6/t+nN8k8HCAf+H59FO?=
 =?us-ascii?Q?jXmBUfaA1D/Ue/SqCRsxksau7RadWFfAvllP4f0jZxZIO3oDgXruH3VC8NgG?=
 =?us-ascii?Q?RYOQNOq8wWBQmvKoNLt9cCyyDfcy0IzicRkm+jhgT5yboUcKSstJ6i++dxcA?=
 =?us-ascii?Q?j3xZczhQVQywausdNcWoUuU4y4k2G81oSlabU8FSXdsLoIvkrE3bkI5WZfWz?=
 =?us-ascii?Q?bt8tNrez56Jxu8dOcOtUEU6/ZLO8i8Y0QVYhiDtAEtHDjpWS2B5fp3xqMnLc?=
 =?us-ascii?Q?JZfNkLFreiPlzXpt4LfppiyjnSWDL3xvGxDqPYqxtndFnb2EvYM/OiyTL7Tt?=
 =?us-ascii?Q?tFmX+B0ogPIrSAgHdbHWP/LoGwEUNNZrmAKfzcBFCEYAkNyuTgm34l0RL2sL?=
 =?us-ascii?Q?5VUUYyLLxq+deBlfvS0GyKTOpL8Bku8L42IZd1YyYShAN62P05I4aE2sAQ2r?=
 =?us-ascii?Q?kc7/Pl9CPXBlKxM4UhYyY1PaSTtMrskRDirFxUsSSlysS1M4Fplji2ZA5v/n?=
 =?us-ascii?Q?a88Y/4H33TN5tP87h26+QgVJYkMz3Au/hHB/RrB5/8Tah/d9KHgWw134vtI9?=
 =?us-ascii?Q?0K/LnCsDoxs9I3dDf8RuR8wymP6He232cpTMMF30r78RC3T1Fwccz4R219Aj?=
 =?us-ascii?Q?GK9qS1VouVm1dyRHLE7V3vuTgswomMOVDazUwYEnT8s8X7mWY9OgDzB9eAm4?=
 =?us-ascii?Q?3/496RZ2kg7bWxBbQL17OMZA9VSta6VPe4k0HusLRhB2K8tW5Z9AYuRVN+3i?=
 =?us-ascii?Q?KXfCd8B5HwSO5qfzb5eBF/3anbvysPCiQOOSDDRCValaMnvicqIQjPEhfHw+?=
 =?us-ascii?Q?2CbZ3muUP97gV2bPIGuGJXL6pN8wLvwNgkkdh2giQ+WQdQ207h/VZxVto2UJ?=
 =?us-ascii?Q?MwneqK9tkYYCaxJthRcwJno3UVL2RbSodfW0q0mag5NV/lCiiYVcHIa+tbWs?=
 =?us-ascii?Q?kRvQ0xuMp1KPDYCsjVopvkGIWO2E+M8lbX4aUiucwyy41IKpmFIctSTEiUFa?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0267c96c-eb01-4127-2eaa-08dd9e1aea7a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 19:07:39.8918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWGsR+lKXTHnXAuZ+Dq6j4ZKKVeAZqz409DS8n73+vReT5YA8Gnc5iRDOuRieWY0T928ACwAN0vOIMvrgmbkL7+8zodA1wtWBLNf9T6J9Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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

On Mon, May 26, 2025 at 02:54:44PM +0200, Pierre-Eric Pelloux-Prayer wrote:
> drivers/gpu/drm/xe/xe_sched_job.c                |  3 ++-
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>index f0a6ce610948..5921293b25db 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>@@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> 	kref_init(&job->refcount);
> 	xe_exec_queue_get(job->q);
>
>-	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
>+	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
>+				 q->xef->drm->client_id);

you can't do this here. xef is only !NULL if it's a job from userspace.
For in-kernel jobs, xef is NULL and this explodes. Right now this
completely breaks xe since one of the very first things we do is
to submit a job to save the default context. Example:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3/bat-bmg-1/igt@xe_module_load@load.html

	<4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
	<4> [] Code: c1 43 18 85 c0 0f 84 6f 02 00 00 8d 50 01 09 c2 0f 88 3e 02 00 00 48 8b 03 48 8b b3 d8 00 00 00 31 c9 4c 89 ef ba 01 00 00 00 <48> 8b 40 08 4c 8b 40 60 e8 86 64 7c ff 41 89 c4 85 c0 0f 85 9b 01
	<4> [] RSP: 0018:ffffc900031972d8 EFLAGS: 00010246
	<4> [] RAX: 0000000000000000 RBX: ffff88815fc40d00 RCX: 0000000000000000
	<4> [] RDX: 0000000000000001 RSI: ffff88812e6552a8 RDI: ffff88815f939c40
	<4> [] RBP: ffffc90003197318 R08: 0000000000000000 R09: 0000000000000000
	<4> [] R10: 0000000000000000 R11: 0000000000000000 R12: ffffc90003197428
	<4> [] R13: ffff88815f939c40 R14: ffff88811f054000 R15: ffff88815fc40d00
	<4> [] FS:  00007681f2948940(0000) GS:ffff8888daf14000(0000) knlGS:0000000000000000
	<4> [] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	<4> [] CR2: 0000000000000008 CR3: 0000000118315004 CR4: 0000000000f72ef0
	<4> [] PKRU: 55555554
	<4> [] Call Trace:
	<4> []  <TASK>
	<4> []  __xe_bb_create_job+0xa2/0x240 [xe]
	<4> []  ? find_held_lock+0x31/0x90
	<4> []  ? xa_find_after+0x12c/0x250
	<4> []  xe_bb_create_job+0x6e/0x380 [xe]
	<4> []  ? xa_find_after+0x136/0x250
	<4> []  ? __drm_dev_dbg+0x7d/0xb0
	<4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]

Can we use 0 for in-kernel client since drm_file starts them from 1?
Like this:

| diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
| index 5921293b25db3..d21bf8f269640 100644
| --- a/drivers/gpu/drm/xe/xe_sched_job.c
| +++ b/drivers/gpu/drm/xe/xe_sched_job.c
| @@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
|         xe_exec_queue_get(job->q);
|  
|         err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
| -                                q->xef->drm->client_id);
| +                                q->xef ? q->xef->drm->client_id : 0);
|         if (err)
|                 goto err_free;

I tested with the above diff and it at least loads...

Also, I see this in intel-xe mailing list, but I'm not sure why we
didn't have any CI results... I will check that.

Lucas De Marchi
