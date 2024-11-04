Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE09BBC0F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 18:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F51F10E49A;
	Mon,  4 Nov 2024 17:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAJFKDgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C810910E49A;
 Mon,  4 Nov 2024 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730741685; x=1762277685;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k/yJoCj21gl6veUpSRHLK5ORcTZn6+/ZypNEN7ho+ts=;
 b=nAJFKDgC7tTxizQUkrJ0hT3mPdKBn9TMgXs6sGKqPhm/v/tJZ13JBJqb
 NOkcUmD7l5c9mpIq9SIqtznhxRFajPO0oqFEHJuWtNfd2fFR3alLBVtLF
 AB4/Q81DWETCc+4YQkkp/mpqgxEDlcvJ+zKSbx0xJnDfnWz9Lyp62vvHx
 4rEUGA+0wxvpN9jJGtTwRvgBqXPhCSVAF3t3DaHqmBSGZh/m8IbIgs5AG
 tnwgCbWYq4TPA0I0M6CQFMpxjPCL7JESZjjpynxrB/8egcFieoWU0JgbF
 gXpq4VZrjR7iXU5bJh3DoEsg2INAztv4HVBY1QxoYIFMuskx7QrQXZNhz g==;
X-CSE-ConnectionGUID: /hG7G639SYC8BEytbZhYqA==
X-CSE-MsgGUID: Fzbvx9gWRKe5Be/QAKYx6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30566789"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30566789"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 09:34:44 -0800
X-CSE-ConnectionGUID: odkjFjOUQ3K8pbxD6Rz/NA==
X-CSE-MsgGUID: KakLxiOdSgqHDXKl4sA78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88236976"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 09:34:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 09:34:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 09:34:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 09:34:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDLUiO0qBH2dfrVC5RiakdXSdeXUggU4j9l2Yev2B3dKOZGeDW3JV7YoWZ/mdK9svNffMuHDh7kt94XGJsGRphBjiAHwheWPO4vBhuf0tGxJeoZwQFOiARcQ91eTT2sNkggMClXRa9uPfCC+Mg8Mt8/C6NswCl8QM2unHYoAMY+JTdqHqReGJ+Cx8hxbZLnalC6KqOHkyPnYsujiU0XBLVbYKDAjW9c0uX/H90zHg/3B5V8WDctma3A02I9jV667BKcYM4zs/wrCalx6cABoR/QmH1SkcpLX8lXxPUxhW2kNSs7kOa9FZW9LU04AkET7Kmq0iKGwuMJSxFzbvPAJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iukFrotRXPS60mzhiXFbJuJLNquR5EV71yB/f/8Iay4=;
 b=SoMXkJDyLzq0gfDg7UwpsdK5LJ+odh16c5EXXyPrxGMOJ9bojdXMphClhuKyIWS8TvRwtaYe4ONf6ljcGxbmq+BrN7bNrJSwBXp8WXnn2KBiuWgBP8I3D67/P+AncRAzKHCMLf+VEVTY1KAcV9PgkvGT5BR2pLYlXczPg52qCnrRqxekimJjZ/rAq10nLtam7v2pjCwJiJ9jggtp5BX5bkxzyPhWZ1MLS3WggIsXUxWdgsTm4PT33/OcJR66cdnjC3gJkfFzLfTc4cURsaXYFSpUSkawy/Eu2DEorZPEgsbEXeRnUPH1U/kKyo7fPQ6xxGP/3jWMFPcgfHxXNXaQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.37; Mon, 4 Nov
 2024 17:34:40 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 17:34:40 +0000
Date: Mon, 4 Nov 2024 12:34:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZykFrJIx9M204Weg@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:303:2a::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9801f9-e181-4cdd-e15e-08dcfcf6f636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U3vpUyRoaKPGFCbtTymbfyCzLppuwCJPAGP6uGeOfdqtVrYureWV+8BEGX?=
 =?iso-8859-1?Q?Mfu/9TdYHsKgadCcXe7cIbL75P7mtxs8ejYbQ/c3fKz8ca5qqETVi6WZmB?=
 =?iso-8859-1?Q?APc2ol/msDmkS4YdLkWgqQyNsm5IJ7NNyeCz/IQKAWvZlU0Yg7QIKMg/OE?=
 =?iso-8859-1?Q?TD10a5FBxb0yheXjVPqjfsVi2U74JqOznCp/KJvDoldJvs3wpYcSJEkqYt?=
 =?iso-8859-1?Q?recPK1uMcqsp3aT4obEb63VsCk0euxiEF1a142CzvHi+AeksSXxJmlO8YX?=
 =?iso-8859-1?Q?JmZomw9itCxc87MxlHst4UEPWuBCSJmxQoaAayp5QdZyN3lvbr/YHHwQwU?=
 =?iso-8859-1?Q?zl1Uz9IQY1d7P0K2HtilavXqsvOSISAIHgif0UlQQjbTwoP+phNEvXXa76?=
 =?iso-8859-1?Q?wnXgI8nqz+6l2HOENKzEAB6RLEKSKHeqib4KB6pbm/PYRVzqydBjjWDrGA?=
 =?iso-8859-1?Q?YASTI/qUs9IngvPGaDVIYjG9ZxDGRioG8waugXNwf2mLm5xRslmNUfmdOs?=
 =?iso-8859-1?Q?AiQWh0JBUYXCSJ7qvPsWhl67bpgykKMFRCk467AVZ4w3kf4bB9YrbNmbcX?=
 =?iso-8859-1?Q?fiFrrxSUP8FcCFL/8eUlWx6qKiiI0txgdokHeNrFKA8YY1iBIXyzGoO1AB?=
 =?iso-8859-1?Q?67YotPXIEy2ul46UtEdOIz8Cb3reXCPO7vTF5w5jniev9Dkb8sEwPiZEZT?=
 =?iso-8859-1?Q?BfL4XyJ1UzOid1aigMRzaApBhK3CNOyTKepb1xrpbQuI8mSKN1j92qB9Nx?=
 =?iso-8859-1?Q?WUwK5jCd8oC1/yEUEbM6MPwvCgvSLVP5VVj+f0c/V3otKDeUmzcEXv1V9+?=
 =?iso-8859-1?Q?ngQCq1xAwLCsl17vRiYea6RcWAquTN4jmgZO5y1UPnJ4MDlM1RurC4Ycgz?=
 =?iso-8859-1?Q?+SejkqODBXEwaApRPD+qNxnAJt3iy3Ax4/3bsnF5re/nUsulAt04OjuPHO?=
 =?iso-8859-1?Q?5Ku9N0gYT7MqiPuU39w99MFSSNgKE0oIDGH6kYRFMl73zqjDRaWZZcseeZ?=
 =?iso-8859-1?Q?rK4QjI5q8OkUOlmolVLqDawTVR6Wa/5+gRzLxQ0qrG2p01uflaL0zSRFTa?=
 =?iso-8859-1?Q?jYTq8Xe8ZusJa+cWW66wTgEUnNwZBdLuENf1B5W5YYfAGHAaUyufBsZUka?=
 =?iso-8859-1?Q?2/kWSgt/NHIDVyGIQuiBglrhhcntpf3OEYRjTpRR1Jm31HXurjMsLSCy50?=
 =?iso-8859-1?Q?X2Gbhi1cYqR8gsS6w2UWZiGS/61BMIov00773kEEJQNBgtCb+kEPOPVch8?=
 =?iso-8859-1?Q?iAKBGY4YLJlkyoxzRye+tKOyO8sRe1s9bJ44xozZkK7P5yD/7liD//97WS?=
 =?iso-8859-1?Q?Y/zR+7gAHxuljj/hDgFZl9BhG6THgup1Z/HGDu6ko0kNgGsRz/k2JBJOfw?=
 =?iso-8859-1?Q?2WXDlrtGXF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SGN0shiraOUGUMIJGMSzigh3zWXwOE2GozYid0QYRguKiMWJO7ydRvUHYc?=
 =?iso-8859-1?Q?7Cau5l8KV1EmSmHD/SiEaLqm3y3GXyDdD6slcBADCuVo/UYwScbdrRk8Rj?=
 =?iso-8859-1?Q?iLcb8zqV8EY2szNyVIg63WFUMO7fwIRWV3oHCDrsvklnKtMJV8apaLLAqf?=
 =?iso-8859-1?Q?LcX/yIkYWagGH2nqGG153eVxm4/5bd30EJVGBdER9nYNM98vEhx1Kqhk5H?=
 =?iso-8859-1?Q?wkRUHaui6vVIjvIayn4tCe3OoW8lgV0q00ZMEul3QrFu4bVgcRwHX5syNI?=
 =?iso-8859-1?Q?jxdfzVU0JVcEvwtc6w/8u98xadPkHnwlyp6GT4fDAj1QNCsNGjV4uFohxY?=
 =?iso-8859-1?Q?tpahkcyBbz+hs4arGb3ejZJpgT/RrVCxSdxxU1osCEzaNPWsFNhSfRBwA2?=
 =?iso-8859-1?Q?FoBHnGzCQEm/APh2ptKCSc0vAhJ4KzwMwB1Y0r/uAG2eh9u3PvSmaImB+7?=
 =?iso-8859-1?Q?6QTod0/5x8JsYp9LhdZ7LjbZyv4m3QtfB+RuD2hh1Tqubc27tA9LbwZXH4?=
 =?iso-8859-1?Q?HerAJt37wqgwO7mPqBzGqbbOEly3rc2Bnh/+OW1wD476sfjTPGWyhSTqM/?=
 =?iso-8859-1?Q?n8Zvu8o0VlrxGt7v7U8p5Bzd3tbQNbAaos+mCQxLK28bJQw+Bxu4D+ZmIG?=
 =?iso-8859-1?Q?qCOIl9N0MFjzihvL2pMuxzu4HUOLsu9gocMl6w9/P3N+1zU/Rhtt1lHeYh?=
 =?iso-8859-1?Q?SNQxp1FVf+0NNsXgXj1zakfUD3zT9S61+7peK+ychn3PZaU41U2WhGpQcw?=
 =?iso-8859-1?Q?WZ7fKqyMN0XMBlpofCRfSTt4wA/nRwxllJVKNroqSSvGpsvWoqAgBX8Isj?=
 =?iso-8859-1?Q?VPT6dYqwLxlmuhBv0HeWJ7dgUdqnu/uhWDUosQiecR2DynV/SSsPr/+DgU?=
 =?iso-8859-1?Q?3I86utG0q/08FUcXOx5BtFA+MU2hOCvqVLLsIYOHNaCqiUbHOKwFLXiijT?=
 =?iso-8859-1?Q?Ixwm2dcW6iWEDZxyniZkp0xjQQuFRNMvU4qJ9J82oimcJLu0eJvcIyPt7N?=
 =?iso-8859-1?Q?hE08XhF2w+ieLk1p9fRLLxcswjHLa+4fGAMWmogV743G3UvbnfBiCWH7c7?=
 =?iso-8859-1?Q?/Oh0Fe7Xv8llSR95lkZ8tRf82UF4yqnzCSA/WJ9E4JwL/gGJ/PsJHewoVU?=
 =?iso-8859-1?Q?G6eXLi2f9yB4MAGVMoovxQvfvVp8kuw5kc7Re3w0NaodS6horVu5Y47oDj?=
 =?iso-8859-1?Q?h071hO3KHoPdrikoi+LbO+Kwz8onYcQ3kZZJESq1Vt8eAaYv2Mi+BKjp05?=
 =?iso-8859-1?Q?MYCJ83S+c5rFlKygl0SoqT0l+NSTuY7HrKOjZTM1w3mvWW++IZ/o/ZAjvJ?=
 =?iso-8859-1?Q?tc2I2eL6btRKKzYTSEjfq8GUAPc+Wgut3yl/z7/HeSIqYQx1EIn6y6Z50M?=
 =?iso-8859-1?Q?C/T4gU+Rf4maq7QQehufo+cNNFDQDnlnRg4Snylzp4UtshzBo/T1Jeu1t8?=
 =?iso-8859-1?Q?lLTi5jU2C5wxO8Z8UE8NBlqaUOcYEpQOZ2+EJUT/xdl0AAPZDjQ3Dc5X9e?=
 =?iso-8859-1?Q?9a+bcYGtDAvJc7DmMnHzaR8u206Dm3MS0OyPNYuox/sOP1qUJBgrO9Twiw?=
 =?iso-8859-1?Q?P3nJzGC3gWistLZ70cC5jJqR5UhAkhY2inqDElK5DcXllk+C0pkrbERl9F?=
 =?iso-8859-1?Q?CitMetG4hZ4pPDjozW2v2fTtmnnbQ1qP/SnNfsQhCzw++GfJy+D0eetQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9801f9-e181-4cdd-e15e-08dcfcf6f636
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 17:34:40.6693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izLeNQ3iLXoFZT6v7/VlX1ibXYXTuFwy9XAvaA14YzNPrv4uughLDdryf0a49f5yecvo6rTySfYwMnq7VmwgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
> On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > ttm_bo_vm_access, to access such memory.
> > 
> > v4:
> >  - Fix checkpatch warnings (CI)
> > v5:
> >  - Fix checkpatch warnings (CI)
> > v6:
> >  - Fix kernel doc (Auld)
> > 
> 
> Christian - Do you mind if I merge patch along with the rest of the
> series to drm-xe-next?

Ray, Christian,

ack on getting this patch to drm-xe-next?

> 
> Matt
> 
> > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> >  include/drm/ttm/ttm_bo.h          |  2 +
> >  3 files changed, 89 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index d939925efa81..77e760ea7193 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> >  
> >  	return progress;
> >  }
> > +
> > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > +			      unsigned long offset,
> > +			      void *buf, int len, int write)
> > +{
> > +	unsigned long page = offset >> PAGE_SHIFT;
> > +	unsigned long bytes_left = len;
> > +	int ret;
> > +
> > +	/* Copy a page at a time, that way no extra virtual address
> > +	 * mapping is needed
> > +	 */
> > +	offset -= page << PAGE_SHIFT;
> > +	do {
> > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > +		struct ttm_bo_kmap_obj map;
> > +		void *ptr;
> > +		bool is_iomem;
> > +
> > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > +		WARN_ON_ONCE(is_iomem);
> > +		if (write)
> > +			memcpy(ptr, buf, bytes);
> > +		else
> > +			memcpy(buf, ptr, bytes);
> > +		ttm_bo_kunmap(&map);
> > +
> > +		page++;
> > +		buf += bytes;
> > +		bytes_left -= bytes;
> > +		offset = 0;
> > +	} while (bytes_left);
> > +
> > +	return len;
> > +}
> > +
> > +/**
> > + * ttm_bo_access - Helper to access a buffer object
> > + *
> > + * @bo: ttm buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Utility function to access a buffer object. Useful when buffer object cannot
> > + * be easily mapped (non-contiguous, non-visible, etc...).
> > + *
> > + * Returns:
> > + * @len if successful, negative error code on failure.
> > + */
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write)
> > +{
> > +	int ret;
> > +
> > +	if (len < 1 || (offset + len) > bo->base.size)
> > +		return -EIO;
> > +
> > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (bo->resource->mem_type) {
> > +	case TTM_PL_SYSTEM:
> > +		fallthrough;
> > +	case TTM_PL_TT:
> > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > +		break;
> > +	default:
> > +		if (bo->bdev->funcs->access_memory)
> > +			ret = bo->bdev->funcs->access_memory
> > +				(bo, offset, buf, len, write);
> > +		else
> > +			ret = -EIO;
> > +	}
> > +
> > +	ttm_bo_unreserve(bo);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_access);
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 2c699ed1963a..20b1e5f78684 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> >  }
> >  EXPORT_SYMBOL(ttm_bo_vm_close);
> >  
> > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > -				 unsigned long offset,
> > -				 uint8_t *buf, int len, int write)
> > -{
> > -	unsigned long page = offset >> PAGE_SHIFT;
> > -	unsigned long bytes_left = len;
> > -	int ret;
> > -
> > -	/* Copy a page at a time, that way no extra virtual address
> > -	 * mapping is needed
> > -	 */
> > -	offset -= page << PAGE_SHIFT;
> > -	do {
> > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > -		struct ttm_bo_kmap_obj map;
> > -		void *ptr;
> > -		bool is_iomem;
> > -
> > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > -		if (ret)
> > -			return ret;
> > -
> > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > -		WARN_ON_ONCE(is_iomem);
> > -		if (write)
> > -			memcpy(ptr, buf, bytes);
> > -		else
> > -			memcpy(buf, ptr, bytes);
> > -		ttm_bo_kunmap(&map);
> > -
> > -		page++;
> > -		buf += bytes;
> > -		bytes_left -= bytes;
> > -		offset = 0;
> > -	} while (bytes_left);
> > -
> > -	return len;
> > -}
> > -
> >  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  		     void *buf, int len, int write)
> >  {
> > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  	unsigned long offset = (addr) - vma->vm_start +
> >  		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> >  		 << PAGE_SHIFT);
> > -	int ret;
> > -
> > -	if (len < 1 || (offset + len) > bo->base.size)
> > -		return -EIO;
> >  
> > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > -	if (ret)
> > -		return ret;
> > -
> > -	switch (bo->resource->mem_type) {
> > -	case TTM_PL_SYSTEM:
> > -		fallthrough;
> > -	case TTM_PL_TT:
> > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > -		break;
> > -	default:
> > -		if (bo->bdev->funcs->access_memory)
> > -			ret = bo->bdev->funcs->access_memory(
> > -				bo, offset, buf, len, write);
> > -		else
> > -			ret = -EIO;
> > -	}
> > -
> > -	ttm_bo_unreserve(bo);
> > -
> > -	return ret;
> > +	return ttm_bo_access(bo, offset, buf, len, write);
> >  }
> >  EXPORT_SYMBOL(ttm_bo_vm_access);
> >  
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..8ea11cd8df39 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> >  int ttm_bo_evict_first(struct ttm_device *bdev,
> >  		       struct ttm_resource_manager *man,
> >  		       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write);
> >  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> >  			     struct vm_fault *vmf);
> >  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > -- 
> > 2.34.1
> > 
