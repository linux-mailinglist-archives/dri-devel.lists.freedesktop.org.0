Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B3A151CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2110EB09;
	Fri, 17 Jan 2025 14:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EURfB6Fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B13C10EB08;
 Fri, 17 Jan 2025 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737124202; x=1768660202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7q7j/VhbF//NBytm9WimkxrL6YUTOVtC7V5E7jQ7cl8=;
 b=EURfB6FdPR/IWjRxC8PEdSck3iRL2i+dJyjF5cg4vYvEaPF35Ga7Eb+8
 hq7JNApNCUSqJbPVoIYDfuaYn5g7EI76PwvW+Ob15Kcn16TN9sOSdxBaF
 dYfHhc49/5L2hgkos6EGgitkLn2BryAXg4SJXUobTIEiARExQbXqviX/8
 vYZ86euV4xl4t/pyTRb4pjoeFDugKim6FfXTAxg2AQjgoDyiP4wz8YWbB
 iRiSTUCtQQCpdne85LuJ3hRj0UA6F4MTGCityZ6yNAXHx08fU1o08kVqO
 yIK2uzZ8aZ7pqb7aRICmOGXx7gmXVlKnnjNtOjgvUyRttlDxUKnDqY4GV g==;
X-CSE-ConnectionGUID: fsGuYOwZT5ui+wyKBmMlWA==
X-CSE-MsgGUID: 1JrmqCqqQXmZbxquhLCm+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37793439"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37793439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:30:01 -0800
X-CSE-ConnectionGUID: KXrEjpRmTnazGgglR19XQA==
X-CSE-MsgGUID: OGGKmQQ2TnyCmFx6ctUL9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="110806468"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 06:30:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 06:30:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 06:30:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 06:30:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2K/jdyJnXH5JeASAdIojbO72qn7Uh/kYZvScxbyaLyDIZ3Jf9efk42bwvoMpQJCDmfjnxgOvAw2eRSn7q/6AXWXnS2VwLq2+3w6M4ZDiAdSSOHCAsk3ckCKZGGVyf6RIJogCZCDsPClsnmV/1V27ryEx1bYkKMYvoTzbn4oqXLz3nczVi+jo+/eXlVLXFCH2WeIAoFaO0Rh7jxqO3Lp2FIe1zB/9FpwxsqQ1svl1l8xoowW9UEmyIzAkqgtwtGrSI03mRLMHNAaDDjVKQ2FX4wM/4T/aRkG8PvjH+/bDrld88TdPQDr37ZrJuymgYYTQ/sO0+HnX7RaiCHdfICIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW/rnkNQGk3xeL/xWcxXRMR0vbIOb2iXS1kbfvpgBv4=;
 b=b0xJGCp5KNz26L9vkYeR/E5WsXfnZ83K/4hjqK+3lS3qsRP2ovpiD8HgX7qR13GVgh2A7PgEBnrNvOfNif7BEJEeMjWefSFxO9+oLXPSsYnphZW9Rz90G89w5XxaRVSiCdRwl+iV9AbwHvjTBOkB8gFRQ54TfQx19V2b9tTEBSPcBv+0Qs1G27N2tnzAPBI+wDX6zkTDGhZAb9yTUpY8XFNV6U/+OCtvLrHaVtTqj647bT26+koQmKKkl9DUeeDOq+vef+I+cXuOLqqPiIA5thsbhY53KBbVsm7QSWrR9q7vSe6k3mfLb6HeleGef/KCd9+zmtUivcSL2S9AtDVbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 14:29:31 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 14:29:31 +0000
Date: Fri, 17 Jan 2025 09:29:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z4ppRx_hr713Ik1S@intel.com>
References: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
 <Z4mOwZz1tJCxLeP0@intel.com>
 <0a192f39-0361-4c2c-82c1-1bdc45edaf06@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a192f39-0361-4c2c-82c1-1bdc45edaf06@intel.com>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW4PR11MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9d8b12-b2e1-49bb-94ed-08dd37035b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJwW+cbusVL2VTO3yokoHwOWcSGgIEuNBWV4I4IwXC+/+vX6PGOHU1UwLvSo?=
 =?us-ascii?Q?9zcGiVWGlvo9XmIa+0NHFi/a8AvNmAty1tnpIiWsJdN/CiQWE64pFqHYPIN8?=
 =?us-ascii?Q?FU27NDviol+uEHw7KCOkwiIq7G8sF8mUSHEyruDmkfWK98URUl/3QmLUNPeL?=
 =?us-ascii?Q?W/uNhKi1m7viGgK4xQsj8RW7ZfXaJ0Gkjw843VMCTxLG6IURhL8YcoN0lSSi?=
 =?us-ascii?Q?wclqgKfBrAjqHaSY+nUVr1/ikkHOlhQXFTwU0qdUGHcjB5j5/6BzLC2MbbBP?=
 =?us-ascii?Q?4hv6xWdksV0KfK1E7BreYhjYTu5rhcpua69eebIQZpocPY39yPZ8itcVgB8n?=
 =?us-ascii?Q?/CLv674c/Dkc++1YSCAbaS43buR0S5ath4GYUIqrVlWoczij6OJVAfsWsoJv?=
 =?us-ascii?Q?HQqdifqtfxGlD2j0JB02h+eBuZNy690oQe59pXHMtuM3eT11UJXw0aZS6ouR?=
 =?us-ascii?Q?t6ld/ybvE/VGV7g3TubMjbUmKCZDnr6b7gbx4Oou6mfZyaXkDx338LkeWNKL?=
 =?us-ascii?Q?nMCSSef1SxOt9fhiUjH70+r6gGwSYH7hOUY4xN5sltLLDdzZmoF+8asa5C3e?=
 =?us-ascii?Q?ra7ABKDwHLrrVYGbWfNGcEgmT9O0t4eeWLIoMqSxpD15/xGoFcMvoi+DJdqu?=
 =?us-ascii?Q?/2sjHY9Va/gSRcuF6oDdosgZ0bv1YtQIR9SJ5kUlA7EWl2Ysr+L5Gi5ant3b?=
 =?us-ascii?Q?VRGOE7Uy79nJEVD69fNrJZZQn4zJcAeeCn8EhjaXH9p5/ig8v3VLNVprIUG6?=
 =?us-ascii?Q?TRo4myVnXuQrciR2G3eVtFE60KrUR1kxgdgDMjqQcClMM/oqR2IFkpkJurIS?=
 =?us-ascii?Q?+SFPx/taVY8dbh+ohZ9OLEbfi4qQ0jWDs1UPRgAvMwcbX2/U+vOBSRX6bBNE?=
 =?us-ascii?Q?XUv+1WOs1YsaWkZluqumjYHl8t60dzbAIZLhyTGaQ7XsCbK8gX3auK9bwSqb?=
 =?us-ascii?Q?H5aBpQ1TM8vYq8R6H35/ETnh+pE1b1dvzvPsfcXRbnyPPPejbf1yXtlAcVkH?=
 =?us-ascii?Q?w+fDiaY7wNgKiTVlBOpTJBaFQ5TyTNuG6MYnWVbzemqPP1xV2ayjrfjptYl8?=
 =?us-ascii?Q?wqQVcUc1AaVhFqGaa0yKxe71LJFPH2FY+jMMJe3x+jO3L+xEyYUIF4wZMdiN?=
 =?us-ascii?Q?2lSHLslYb6QodoFsmtLMswc2y2NNcYlbapP1n2XmlHgk1XPn9K5HDWVO3SCT?=
 =?us-ascii?Q?Gs36LGITNIlV9CcQyCepCPBFd4XmTdWnUsuCkdt9GD2ghJdZOmyLzqu/zC0+?=
 =?us-ascii?Q?j7EHeoYtlhLOsDPzRo6lZ8/BVHLXGAB2IfgItMa5wWRloJnjV2+Y3OUo6Us+?=
 =?us-ascii?Q?DAs7sGf/lQysbpHb+NgdPF7GdVyN19OxdMUsBTPLu07CuUPAdjS3qwJQ3+0t?=
 =?us-ascii?Q?pDZFrEcpH1DqM3AU6jJvQM8fbVNo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BNiJ4k/GRRA8YedTdfM9aZ5TzTX/V3/tCCfjJoUmYBjnGg3MZjghTtFu8xSS?=
 =?us-ascii?Q?9pQwipSK1OHAvp9yMb2mgS/V2uNopEO0y/SjMTAD4WGVSp1g0kj9dUxc6qm1?=
 =?us-ascii?Q?8s+oYwHt3E+y5TTqqiasBJvpscWNUnaN/c270pbIv8sqRt/Y4I/yzBd6vUX8?=
 =?us-ascii?Q?AtNCfSec3c4tsGUJ+rfv6yiiT4v4eL9y4CAJxna8AXRx/IBhECYicCVTaEyE?=
 =?us-ascii?Q?HQIdFGOpzq3DjSXHFql5+aXzK0vKZ+UvXlhuRXJ4Vert4F95ieULGLKPVii+?=
 =?us-ascii?Q?md91pwqhCRL+eHxadmJJoW01mqB0x35g53klLeKyu+vfv+FHbI8GdRYDl11V?=
 =?us-ascii?Q?cseQFgTUBLDYdysOGAPmJKT56GbuOFVMZFrd8HOs+xq5in7ksgV/5r7G4n51?=
 =?us-ascii?Q?y3zO/GFpX5zjtNHrECHiaCkjWJ2EOP1tmIqGsZn18/I5oj0JnheleOFJGLcP?=
 =?us-ascii?Q?ESPeeM2c+Ay2QRUE1isCz1DVN9QKGNdC+1VKdC/oPg9Jn8xWiCv7B+BW6+nl?=
 =?us-ascii?Q?Lsh44Pu93zZOnCupjpqOf8puwkzyfG+po0Uq0TB6GO5bB/41MNkMMPzLVJiZ?=
 =?us-ascii?Q?Pl4GKFjkOqJ5w/TwbhmBdUT/QMmspeuz1hWKHj3+0VPkdAqNAzKd9FMUeTqr?=
 =?us-ascii?Q?HVBAnlMSrzMD7K4tiUjMk9Rag7UrhzmTEEr1c/Z+6AtaO2lNKJIOm7Utuy30?=
 =?us-ascii?Q?imdfXrOWsAKOlrN/ZYof5wqVoz6YH7rNOOuC1unbExweTO1mhP4+Pxss8wjq?=
 =?us-ascii?Q?IAcdnXKufLFNaDushRWJ8wWqzC3MKPRB/bKeOowm39hU/0XY0TyisdjPZQJx?=
 =?us-ascii?Q?ovhZAIeBEPa7znIc/E3JFzv0vx4tVk3zu+/l0semF3mZsJhhMA/a4dL/QFFE?=
 =?us-ascii?Q?oHeixWjBEW+B+QWsEuwLz9Zzjb+OM/XE8qTn6zGiSI7jQxML7YHVy9Xsry1W?=
 =?us-ascii?Q?4DlVPvot6wIwYNJ+YH87Uz/4GseORzoebXorN1+TS5kuYGTDYUs6npUDxXxv?=
 =?us-ascii?Q?trPZ9SxKxx7EToDdC1EWVMlBrD49+fL1hce3n2WNIdbkRABpZichZ2ShNfGB?=
 =?us-ascii?Q?r13JQNHcb1I77+Kw61ujFhddjST3JbrP1PzMu0IZLAVdg++BI9x3gNSIBLOs?=
 =?us-ascii?Q?hD+Cv7jaubGhahgKaCgKV/QaQybCZxfX3SbQMNv19Xi7xxBQX0ylGBivhjP0?=
 =?us-ascii?Q?6Wgw/G+Zf/iODPesYA/Mdi1x0bnHSN/+qkO3uI5XQGtO+Cg0Fyi6V/rbIx9W?=
 =?us-ascii?Q?QEc/SgUzY2xYeld20RVHiR753XIODw73MdPG8H9ORq9t46Z5ObEXjJ9LZ/Ud?=
 =?us-ascii?Q?G8lV44JnEYeVlw0QTHKBHZaue6QAXg4tO3WzkC61BD3A+kz+wv54XysvjW7/?=
 =?us-ascii?Q?bD4s0LMZyubepDjE91mjmaZ1ZdOyeOF2GU9feMq/mKsycetfJAmyV/LDNxOO?=
 =?us-ascii?Q?v/3JkerZ7z/JfaaA6CxBBUk6Re1kSwzPePmrY2J4aK+hXjLI8K6u1FQe7luj?=
 =?us-ascii?Q?gh1pnnvrOUdREwY25wtt/1H1gJRgW3eTaPOROF2WdwnV2xsAIUZAbiINd31T?=
 =?us-ascii?Q?6esd1EKw3w7e7zA2PBHMOnjxATsQlJeyb82GWKx4370Ye0Dby7zyuC+Ov2dC?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9d8b12-b2e1-49bb-94ed-08dd37035b23
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 14:29:31.2244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSbhd3dp3oQr9PoCbugPExNMhugjQ6FXW6+2EUci4FirRUJT5u2+EV5bOlgUarDe2zEI9amJL3OTMH/SvzG1bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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

On Thu, Jan 16, 2025 at 03:51:03PM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/16/2025 2:57 PM, Rodrigo Vivi wrote:
> > On Fri, Jan 10, 2025 at 03:21:51PM -0800, Vinay Belgaumkar wrote:
> > > Default SLPC power profile is Base(0). Power Saving mode(1)
> > > has conservative up/down thresholds and is suitable for use with
> > > apps that typically need to be power efficient.
> > > 
> > > Selected power profile will be displayed in this format-
> > > 
> > > $ cat slpc_power_profile
> > > 
> > >    [base]    power_saving
> > > 
> > > $ echo power_saving > slpc_power_profile
> > > $ cat slpc_power_profile
> > > 
> > >    base    [power_saving]
> > > 
> > > v2: Disable waitboost in power saving profile and updated sysfs
> > > format and add some kernel doc for SLPC (Rodrigo)
> > > 
> > > Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
> > >   drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
> > >   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
> > >   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
> > >   6 files changed, 120 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > index d7784650e4d9..83a7cc7dfbc8 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> > > @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
> > >   	return err ?: count;
> > >   }
> > > +static ssize_t slpc_power_profile_show(struct kobject *kobj,
> > > +				       struct kobj_attribute *attr,
> > > +				       char *buff)
> > > +{
> > > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> > > +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> > > +
> > > +	switch (slpc->power_profile) {
> > > +	case SLPC_POWER_PROFILES_BASE:
> > > +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
> > > +	case SLPC_POWER_PROFILES_POWER_SAVING:
> > > +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
> > I had thought about something generic like kernel/power/main.c, but that is
> > indeed not needed since we do only have 2 options. This came out cleaner
> > than I though, although not generic...
> > 
> > > +	}
> > > +
> > > +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
> > > +}
> > > +
> > > +static ssize_t slpc_power_profile_store(struct kobject *kobj,
> > > +					struct kobj_attribute *attr,
> > > +					const char *buff, size_t count)
> > > +{
> > > +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> > > +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> > > +	char power_saving[] = "power_saving";
> > > +	char base[] = "base";
> > > +	int err;
> > > +	u32 val;
> > > +
> > > +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
> > > +		val = SLPC_POWER_PROFILES_POWER_SAVING;
> > > +	else if (!strncmp(buff, base, sizeof(base) - 1))
> > > +		val = SLPC_POWER_PROFILES_BASE;
> > > +	else
> > > +		return -EINVAL;
> > > +
> > > +	err = intel_guc_slpc_set_power_profile(slpc, val);
> > > +	return err ?: count;
> > > +}
> > > +
> > >   struct intel_gt_bool_throttle_attr {
> > >   	struct attribute attr;
> > >   	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> > > @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
> > >   INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
> > >   INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
> > > +INTEL_GT_ATTR_RW(slpc_power_profile);
> > >   static const struct attribute *media_perf_power_attrs[] = {
> > >   	&attr_media_freq_factor.attr,
> > > @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
> > >   			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
> > >   	}
> > > +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
> > > +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
> > > +		if (ret)
> > > +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
> > > +				    ERR_PTR(ret));
> > > +	}
> > > +
> > >   	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
> > >   		ret = sysfs_create_files(kobj, throttle_reason_attrs);
> > >   		if (ret)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > index fa304ea088e4..2cfaedb04876 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
> > >   		if (rps_uses_slpc(rps)) {
> > >   			slpc = rps_to_slpc(rps);
> > > +			/* Waitboost should not be done with power saving profile */
> > > +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
> > > +				return;
> > hmmm... I'm afraid this is not enough... Although I just noticed that we
> > still have a problem for the low context strategy.
> > 
> > Please notice the intel_display_rps_boost_after_vblank...
> boost_after_vblank() also ends up calling intel_rps_boost(), so it will skip
> correctly whenever the power saving profile is being used. The only extra
> thing is an additional work queue addition, I guess. We could avoid that.

hmm, that is better than I thought then... although it is probably good to
ensure we don't add an extra queue... 
But also, shouldn't we ensure that the boost counter goes immediatelly to zero
and that we really immediatelly stop request the boost freq when we set this
mode? or that is too fast that we shouldn't bother?

> > 
> > So we probably need something like these:
> > https://github.com/rodrigovivi/linux/commit/42e24a146239a1b950ed047f619f334f5205ae8a
> > 
> > other than that I believe this is good, thanks for adding this
> > 
> > > +
> > >   			if (slpc->min_freq_softlimit >= slpc->boost_freq)
> > >   				return;
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > index c34674e797c6..6de87ae5669e 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
> > >   #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> > > +enum slpc_power_profiles {
> > > +	SLPC_POWER_PROFILES_BASE = 0x0,
> > > +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> > > +};
> > > +
> > >   /**
> > >    * DOC: SLPC H2G MESSAGE FORMAT
> > >    *
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > index 706fffca698b..bee78467d4a3 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > @@ -15,6 +15,29 @@
> > >   #include "gt/intel_gt_regs.h"
> > >   #include "gt/intel_rps.h"
> > > +/**
> > > + * DOC: SLPC - Dynamic Frequency management
> > > + *
> > > + * Single Loop Power Control is a GuC based algorithm which manages
> > > + * GT frequency based on how KMD initializes its parameters. SLPC is
> > > + * almost completely in control after initialization except for the
> > > + * waitboost scenario.
> > > + *
> > > + * KMD uses concept of waitboost to ramp frequency up to RP0 when
> > > + * there are pending submissions. The addition of power profiles adds
> > > + * another level of control to these mechanisms. When we choose the power
> > > + * saving profile, SLPC will use conservative thresholds to ramp frequency,
> > > + * thus saving power. KMD will disable waitboosts when this happens to aid
> > > + * further power savings. The user has some level of control through sysfs
> > > + * where min/max frequencies can be altered and the use of efficient freq
> > > + * can be modified as well.
> > > + *
> > > + * Another form of frequency control happens through per context hints.
> > > + * A context can be marked as low latency during creation. That will ensure
> > > + * that SLPC uses an aggressive frequency ramp when that context is active.
> > > + *
> > Thanks for adding the doc!
> > but now I'm missing the documentation of these new profile strategies in here...
> 
> ok, will call it out specifically.
> 
> Thanks,
> 
> Vinay.
> 
> > 
> > > + */
> > > +
> > >   static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
> > >   {
> > >   	return container_of(slpc, struct intel_guc, slpc);
> > > @@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
> > >   	slpc->num_boosts = 0;
> > >   	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
> > > +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
> > > +
> > >   	mutex_init(&slpc->lock);
> > >   	INIT_WORK(&slpc->boost_work, slpc_boost_work);
> > > @@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
> > >   	return ret;
> > >   }
> > > +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
> > > +{
> > > +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > +	intel_wakeref_t wakeref;
> > > +	int ret = 0;
> > > +
> > > +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&slpc->lock);
> > > +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> > > +
> > > +	ret = slpc_set_param(slpc,
> > > +			     SLPC_PARAM_POWER_PROFILE,
> > > +			     val);
> > > +	if (ret)
> > > +		guc_err(slpc_to_guc(slpc),
> > > +			"Failed to set power profile to %d: %pe\n",
> > > +			 val, ERR_PTR(ret));
> > > +	else
> > > +		slpc->power_profile = val;
> > > +
> > > +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> > > +	mutex_unlock(&slpc->lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
> > >   {
> > >   	u32 pm_intrmsk_mbz = 0;
> > > @@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> > >   	/* Enable SLPC Optimized Strategy for compute */
> > >   	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > > +	/* Set cached value of power_profile */
> > > +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
> > > +	if (unlikely(ret)) {
> > > +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> > > +		return ret;
> > > +	}
> > > +
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > index 1cb5fd44f05c..fc9f761b4372 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
> > >   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
> > >   int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
> > >   int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> > > +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > index a88651331497..83673b10ac4e 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> > > @@ -33,6 +33,9 @@ struct intel_guc_slpc {
> > >   	u32 max_freq_softlimit;
> > >   	bool ignore_eff_freq;
> > > +	/* Base or power saving */
> > > +	u32 power_profile;
> > > +
> > >   	/* cached media ratio mode */
> > >   	u32 media_ratio_mode;
> > > -- 
> > > 2.38.1
> > > 
