Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4589B7CEB7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9110E04C;
	Wed, 17 Sep 2025 02:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvrmQQsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37CF10E04C;
 Wed, 17 Sep 2025 02:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758077150; x=1789613150;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eofw+dzUKRZ9hbKXpggGNe7ljisVA+7izPKksun7axY=;
 b=DvrmQQsmCzuGu9C9j/31IvhF44Gd2uwyen8YIuzAZUR7GpkQnPtSMkJY
 LYH+MvzLiE6Gbh/H5RThsqgQ8DxfwEzzr8ZG2E5t2fgeClptxSIEAqIs0
 xlNGuBYXG7CDikuRHmhZjN8cKMSRWWLc7Tfhi4nS80QomtDuQcfwV7sgy
 mEcNP7cU861D7g26TJLgn3xc74N5nY6znTYcCPKJeDw9fNd9EeHxnO2ih
 QGP9aBFrcIqlG+yE3O+/Ixbayfcr+kXoTy6izqnVl9ziGSup9e9Oyb+oP
 Ch+iLuQQlVJqIC2m4qIgv5hafUH7NAcjRRvjM59kHe6+PXvx2Ims26omY w==;
X-CSE-ConnectionGUID: EwzWfah6SFuO9mVTF6IK8w==
X-CSE-MsgGUID: 4URV2eqYRd63UaJxLeKjNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60429371"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60429371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 19:45:50 -0700
X-CSE-ConnectionGUID: JL0zzxFHQBC7DCK0+zmUcQ==
X-CSE-MsgGUID: Hob7enclQ7+LGL2BKhhQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="205893520"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 19:45:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 19:45:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 19:45:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 19:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkeSXVDIQcSZ0PVc9/aW/dWpUemEs63wBNZLfXJ6ooLPkAbWzvo8DSeVYufXjlhy8RKA1eLYy2hq6GhpQg4BtQy8EnS/sI8WcP9R4nm5NGvXRSUM+TEQYCv1Sb2FPblk50/uuoDao7MZBa+XGpZ65jngwU8+oAzPpKtSAc3nRvFMvN3+dyJQ652P31u6DndWtdQUOc34lbQe3XsqTJFsZsvYPRzTmMMh+EdlAFrswG8X2SvUim2ST45987ly35eVbJUj0aRIGm0Zn5a4HRcmJkVeKSUhrDwDj1oPUcuPqOvykspEIfQlGa25LHgqi+mr2mq5mGswIqjxHgrnB0najQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmoe/QBpVjkbbWU1qu6rv9IWUvZScsXrDlbctrT6T9Q=;
 b=f+feN8DOGgdjLAMOjXVsw+PqsNIp+RDSbfvEkcznfU6Qs24uH2Z6KQK8Iv4S+rxVRxpN3gYHcw/9FLD4oVmwFn62zqIkI2E78B12GfCtZCrXQw6raIYa8E8qZHHZX95pHdfZO5DwvV0hgqDHjsCRtv6rVvhj1IvI4E5n/VsFx7XBP9tBrA8tL5XqfypNfcmis2v/bP5+N41XnvYhEGsJ60Q4ivt76V+mf5kC6wzXXPlisAfRTgTeBYlZZlxPP1npPqAmt1yEM161xkI1MSkMEcImLBgVSHFEpYUIBhRtjNivD5KugNAePbxqdeSmBpVT/Bx1Ba5pkkVMxgjeQIFGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 02:45:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 02:45:47 +0000
Date: Tue, 16 Sep 2025 19:45:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
Message-ID: <aMog2cEGWlekPTdC@lstrano-desk.jf.intel.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
 <20250903223403.1261824-5-vivek.kasireddy@intel.com>
 <59cf1b78607dddd6b394f023d786d0123f9195b0.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59cf1b78607dddd6b394f023d786d0123f9195b0.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9a684e-b308-4bd8-4202-08ddf5944e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JndZ4Q6C8OHHnk5io5/epkH6uicxjiQw7I9DVco1LYkBhujPirko5JzDxr?=
 =?iso-8859-1?Q?/mRUWxZTXCd0F+Fe1aGoa0gsHr1jUJqU0tX5rafoDr7H/cwep4Yyc2OS5+?=
 =?iso-8859-1?Q?Iqe9y0x5MvvfwfuC1G3iV0WBqynaPTM4Yf12plX12yCz7l+e9KpPbLoeBl?=
 =?iso-8859-1?Q?gwtZE8RItEffI05cjs233SaDyHKc/61JsOwEJQFW2TJ1PnAWdR+cZiyEL0?=
 =?iso-8859-1?Q?XPkov/O5O4fs+w5XUrzYydOgx7/5NwbRDdIxa0q/fzdJsLrA6Avat4jFto?=
 =?iso-8859-1?Q?H1rIMlZ8IMV/mlbTiHLxtCB2iaqPH4ec+QgcznXa1Vh0EWiL1jCxXmueBB?=
 =?iso-8859-1?Q?8W+heqArVf5XqnphloFAZ59YRpTHDUTSmnO/FnU8tB4eP3dhY3tIUcNEUV?=
 =?iso-8859-1?Q?MX8YnpoHEbgKkHobHVHijrFxJi1tJQ4OLwgwFwp+QFW5qMZ+yo/bQs7WhQ?=
 =?iso-8859-1?Q?1UxwyzjgOAzASAuTH6ild4A8lGm3UjhsaCJZAUS2evRrPHtUW7JOD7oLuT?=
 =?iso-8859-1?Q?fMl8P0lR33bHXIqHpSW97D9Chpl+Himh52fipo/YidmWvS9pvgUE96xjVu?=
 =?iso-8859-1?Q?1U6omklFV7+g8ZoXk8tjpfXxDVPUwuICkt89QAfsvWu+zrjcOAvdnyaSWk?=
 =?iso-8859-1?Q?mAPS/pEl6S9AEJe/gq8l89nIffDYkWDjO55x5kAlzfPjwW8DAPYGX56NBr?=
 =?iso-8859-1?Q?LV4d6aOdZSX4yhS52gXTKcwCbiBF3LNdKcYpe/0aLrAlX+EOy+hID3zeji?=
 =?iso-8859-1?Q?CChOZ6Yy0pPvXBP0stOg3KP5ewSupofUS7/X7u3ZQfj3e2vtgMXIsEB5wv?=
 =?iso-8859-1?Q?45fxXhKaZVTXxCYlwViOjqyjd70QEZANaY3NrPoBU/lqdZmgzErJJK3SWp?=
 =?iso-8859-1?Q?akW40nNQW5fH92L10HIVdU+XT82TJpFMWCfTATTBWWwDJOxlFvaIOcgC9N?=
 =?iso-8859-1?Q?QIFjVOPcKqHxjO7fkuF50a8UCW0yxbpiP8qNBN2Q+QkQ5enu+uJjzbmqu4?=
 =?iso-8859-1?Q?FEv6TbYLPO5WI/R0HqXxsPQVgL8iBNeTafvzkyvHMn9R0lKKrReuOy7uu3?=
 =?iso-8859-1?Q?btX7zPsDKmxj7+GqU995AMmfW+Iyymxs0tls7/3yHaytk5AtFE/u6Mgq/Q?=
 =?iso-8859-1?Q?Bz0G3iwYlhepOArGSudo/tAYIm6eSi9fu74Uz9Qf7/yYdiamCtkUjKQvHG?=
 =?iso-8859-1?Q?gvtTK28zSSZfvIrnEHDRilZRcMWNhLID/HIOFGoYoECf/wpnx1o/19DrH4?=
 =?iso-8859-1?Q?C84ujR/hFGPnXWnHibZUemM64z1FX44ywMWOAyzJirr503Cw+bDJvwxj41?=
 =?iso-8859-1?Q?TPFpfAB+rVH8Hsuaz6CtniNsNXX0vXZ/KX6X3Jk3tD0v+8rA635KTeYlyZ?=
 =?iso-8859-1?Q?UkHACYDELgNN1MbMnMD1IcFMwssgfGkTrW0M/KcMJnknpCwo7+HVcwkUzP?=
 =?iso-8859-1?Q?arW2faTLbUqmEYaHAiVqQoMMod+N22nSuvab7y4nlyEotQCElbdSYelqsO?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P6C4Np+maWQHxQtVDRf9KiBhzYlapEeevKJIPkHYhiW3EubRy0q2iGaohN?=
 =?iso-8859-1?Q?eCG4WA0mrBUxmbd8MOo07Gx6p6DqF0pFb6xPcbHlRi3Rd2FGgsFI7uUHHu?=
 =?iso-8859-1?Q?jepobXUfx42KlmVOBc5P5PFnk99Jne8YRfCBZRkz/SeKzxPCiKou2z3rZT?=
 =?iso-8859-1?Q?7ywcqZXXo2QRTS0E0Ii3gK8OgKLQnJsJC7RAFWO3SASOKKK+LPeAI0DdJr?=
 =?iso-8859-1?Q?ooU9PLY3HzaTWcb4jzWly8cKr061dN55qD7MbhVixjmcxI5vnDnlO9RX1P?=
 =?iso-8859-1?Q?FWp1BaZGH89zX6Jr10YHcAuI15uCTk7BKGcrhZ1tFz+QaLybt0eNyEw+Ro?=
 =?iso-8859-1?Q?xZKNZRByrej9AW66y5W+HPtICII7vp+ljp2vo7YGzbWl6UUyc63V7WYfA9?=
 =?iso-8859-1?Q?BHWGHWGUIWYzS9/UAcNwjlDjKW7EyPcA/lO/MwnWojT+mKhTXxboC9QwJC?=
 =?iso-8859-1?Q?bJz+IrujTVXcDrYbFxDObtzZUqRXVvOAHyXylrOyWRRl30ZSgA3O3HxmO+?=
 =?iso-8859-1?Q?2kQZvsiKYnVOA7O23GWWKrIbsCy2ikhqQVRaOuI6wykG8ps7et9ZjNikyJ?=
 =?iso-8859-1?Q?UyKyEov/Mnck48xDOYPmICACOxOYbjrGHTZ88JrnDoRq76bEix1VI+jaP2?=
 =?iso-8859-1?Q?yDDDQavrwfuMvQ7uC74KVPJJ9o+CdBciD+mQFSoqYX2EO2R8q6I1r1Y90t?=
 =?iso-8859-1?Q?JL9iUw8jxFJV8M4RYmFP0Co7O6FIHvwKkdIuJQjhZmF5BqY5apeeCPLN6O?=
 =?iso-8859-1?Q?m9dZnZE53JRHEIzD9dq0DeVhrrtNtSfB26lTzqiYJSvtlufvTrLfB2cQIB?=
 =?iso-8859-1?Q?0KhmT+GRiufioHb0oipPCELeSaDW1orN8Y7Y9mhmAZ6aw7O451Lupu63A7?=
 =?iso-8859-1?Q?p4fxHJ5Tib5YArUAUsH8IZSLHRTI+apgahHig96StDW1fXE2vGag7ICoNQ?=
 =?iso-8859-1?Q?wqlpIYR0RI7QKO82tUO8+YswvHQXF7QDr3u2WGyddcGAc/nvd1znWRk/Bd?=
 =?iso-8859-1?Q?xJzSyeY6EJQjQm2FOdUT+u97ba8PFGMlrukdHO8aXj3IsRJ5GBCuql5uBU?=
 =?iso-8859-1?Q?Wfdg556i2oDiSGalOuPYBdkNP3F2vZx2BaQVTSmum8rGBYeHRC8AhkmC27?=
 =?iso-8859-1?Q?0Zk+yjVM2bif++k3y7VagSlF6xROpJu3kRpiNfI8SWr+hEIUIQHmsQHUY9?=
 =?iso-8859-1?Q?zfpRtAhn37x5GJfkjVkKfwfEKz/UFsYIWxqkHf1zQPXIJGwqDZaH78mjfj?=
 =?iso-8859-1?Q?25pAYW9aG/wnS25AfllRv5WtactFzy17xa7jXCRrXLFrwlcqUQVsYKP5+P?=
 =?iso-8859-1?Q?MIJYxmJ3/vYXZnUmkk9QOdKSi4+0e2fCJ3sidLHWqIPLN6NXBA1wdp7tOE?=
 =?iso-8859-1?Q?QUPj5kKAI17w1AQEXi3npgPSDmYz2QeDcBMFR0//gGXnTgZb3pO7MVyQiO?=
 =?iso-8859-1?Q?q55xOAueA19HDXdyeA3JtFVU2yDMROzVJJI8CYjhnzSKzSH8RVIJnz0DJ+?=
 =?iso-8859-1?Q?bw0ozCTc4iquJMgom0yMuSdyou/zQt5zI0i4ZGr13aKQVA3H8i9o8D6CT8?=
 =?iso-8859-1?Q?pyw1lguIbOgdi/yjJHSYY72bp+XcISuS4BWOMxlHG/isiI+NqjMXSAigXl?=
 =?iso-8859-1?Q?mI1Wz04kQQ3ndPko0A9uvvJjjMIa/0ytjASKU0zJKNIPdle9ZsfAyugg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9a684e-b308-4bd8-4202-08ddf5944e7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 02:45:47.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fG7qK61vUJbIUR4adbWZLLbZ6vqxoHzWSnzL8fSqjyVfP2KkzhgLZ0pV7Kr3/X3qRfnOztOLOrte0q4n3TvLRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

On Tue, Sep 16, 2025 at 10:25:29PM +0200, Thomas Hellström wrote:
> On Wed, 2025-09-03 at 15:30 -0700, Vivek Kasireddy wrote:
> > For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> > associated with a VF, we need to adjust and translate these addresses
> > to LMEM addresses to make the BOs usable by the PF. Otherwise, the
> > BOs (i.e, PCI BAR addresses) are only accessible by the CPU and not
> > by the GPU.
> > 
> > In order to do the above, we first need to identify if the addresses
> > associated with an imported BO (type ttm_bo_type_sg) belong to System
> > RAM or a VF or other PCI devices. After we confirm that they belong
> > to
> > a VF, we convert the BAR addresses to DPAs and create a new dma_addr
> > array (of type drm_pagemap_dma_addr) and populate it with the new
> > addresses along with the segment sizes.
> > 
> > v2:
> > - Use dma_addr array instead of sg table to store translated
> > addresses
> >   (Matt)
> > 
> > v3:
> > - Remove the usage of iommu_iova_to_phys() as the imported BO would
> > no
> >   longer contain IOVAs and would instead have BAR addresses.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 98
> > +++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_bo_types.h | 12 ++++
> >  2 files changed, 109 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4faf15d5fa6d..6987bffb7aa7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -21,11 +21,13 @@
> >  
> >  #include <trace/events/gpu_mem.h>
> >  
> > +#include "regs/xe_bars.h"
> >  #include "xe_device.h"
> >  #include "xe_dma_buf.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_sriov_pf_config.h"
> >  #include "xe_map.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pm.h"
> > @@ -33,6 +35,7 @@
> >  #include "xe_pxp.h"
> >  #include "xe_res_cursor.h"
> >  #include "xe_shrinker.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_vf_ccs.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> > @@ -677,6 +680,88 @@ static int xe_bo_trigger_rebind(struct xe_device
> > *xe, struct xe_bo *bo,
> >  	return ret;
> >  }
> >  
> > +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> > +				      phys_addr_t phys)
> > +{
> > +	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
> > +	resource_size_t io_start, io_size;
> > +
> > +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list)
> > {
> > +		if (pdev->is_physfn)
> > +			continue;
> > +
> > +		io_start = pci_resource_start(pdev, LMEM_BAR);
> > +		io_size = pci_resource_len(pdev, LMEM_BAR);
> > +
> > +		if (phys >= io_start &&
> > +		    phys < (io_start + io_size - PAGE_SIZE))
> > +			return pdev;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +
> > +static void xe_bo_translate_io_to_dpa(struct xe_bo *bo, struct
> > sg_table *sg,
> > +				      resource_size_t io_start, int
> > vfid)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct scatterlist *sgl;
> > +	struct xe_bo *lmem_bo;
> > +	phys_addr_t phys;
> > +	dma_addr_t addr;
> > +	u64 offset, i;
> > +
> > +	lmem_bo = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
> > +
> > +	for_each_sgtable_dma_sg(sg, sgl, i) {
> > +		phys = sg_dma_address(sgl);
> > +		offset = phys - io_start;
> > +		addr = xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));
> 
> Umm, isn't this O(npages²) complexity? Should be using a resource
> cursor for this rather than xe_bo_addr().
> 

Yea, the coplexity isn't great but the cursor as is won't work. The
cursor assumes continous walk in increasing values and sg list could be
out of order. We could find a happy medium are try to use the cursor of
if entires show up in increasing order, reinit it if out of order.

Matt

> Also as mentioned separately for malicious guest KMDs, the resulting
> address must be sanity checked?
> 
> > +
> > +		bo->dma_addr[i] = drm_pagemap_addr_encode(addr,
> > +						DRM_INTERCONNECT_DRI
> > VER,
> 
> Please use the XE variant here, XE_INTERCONNECT_VRAM, The DRM define
> just says that it's the first free enum that drivers can use for their
> private interconnects.
> 
> > +						get_order(sg_dma_len
> > (sgl)),
> > +						DMA_BIDIRECTIONAL);
> > +	}
> > +}
> > +
> > +static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct
> > xe_bo *bo)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	resource_size_t io_start;
> > +	struct pci_dev *pdev;
> > +	phys_addr_t phys;
> > +	int vfid;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return 0;
> > +
> > +	phys = sg_dma_address(sg->sgl);
> > +	if (page_is_ram(PFN_DOWN(phys)))
> > +		return 0;
> > +
> > +	pdev = xe_find_vf_dev(xe, phys);
> > +	if (!pdev)
> > +		return 0;
> > +
> > +	vfid = pci_iov_vf_id(pdev);
> > +	if (vfid < 0)
> > +		return 0;
> > +
> > +	bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo-
> > >dma_addr),
> > +				     GFP_KERNEL);
> > +	if (!bo->dma_addr)
> > +		return -ENOMEM;
> > +
> > +	bo->is_devmem_external = true;
> > +	io_start = pci_resource_start(pdev, LMEM_BAR);
> > +	xe_bo_translate_io_to_dpa(bo, sg, io_start, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * The dma-buf map_attachment() / unmap_attachment() is hooked up
> > here.
> >   * Note that unmapping the attachment is deferred to the next
> > @@ -695,6 +780,7 @@ static int xe_bo_move_dmabuf(struct
> > ttm_buffer_object *ttm_bo,
> >  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> >  	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
> >  	struct sg_table *sg;
> > +	int ret = 0;
> >  
> >  	xe_assert(xe, attach);
> >  	xe_assert(xe, ttm_bo->ttm);
> > @@ -719,13 +805,19 @@ static int xe_bo_move_dmabuf(struct
> > ttm_buffer_object *ttm_bo,
> >  	if (IS_ERR(sg))
> >  		return PTR_ERR(sg);
> >  
> > +	ret = xe_bo_sg_to_dma_addr_array(sg, ttm_to_xe_bo(ttm_bo));
> 
> It looks like this is called for *all* imported dma-bufs, 
> Shouldn't this be checked for is_devmem_external?
> 
> > +	if (ret < 0) {
> > +		dma_buf_unmap_attachment(attach, sg,
> > DMA_BIDIRECTIONAL);
> > +		return ret;
> > +	}
> > +
> >  	ttm_bo->sg = sg;
> >  	xe_tt->sg = sg;
> >  
> >  out:
> >  	ttm_bo_move_null(ttm_bo, new_res);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  /**
> > @@ -1540,6 +1632,10 @@ static void xe_ttm_bo_delete_mem_notify(struct
> > ttm_buffer_object *ttm_bo)
> >  
> >  		dma_buf_unmap_attachment(ttm_bo->base.import_attach,
> > ttm_bo->sg,
> >  					 DMA_BIDIRECTIONAL);
> > +
> > +		if (bo->is_devmem_external) {
> > +			kfree(bo->dma_addr);
> > +		}
> >  		ttm_bo->sg = NULL;
> >  		xe_tt->sg = NULL;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 314652afdca7..371eee3f975f 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -88,6 +88,18 @@ struct xe_bo {
> >  	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid
> > only for VF */
> >  	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> >  
> > +	/**
> > +	 * @is_devmem_external: Whether this BO is an imported dma-
> > buf that
> > +	 * is LMEM based.
> > +	 */
> > +	bool is_devmem_external;
> > +
> > +	/**
> > +	 * @dma_addr: An array to store DMA addresses (DPAs) for
> > imported
> > +	 * dmabuf BOs that are LMEM based.
> > +	 */
> > +	struct drm_pagemap_addr *dma_addr;
> > +
> >  	/**
> >  	 * @cpu_caching: CPU caching mode. Currently only used for
> > userspace
> >  	 * objects. Exceptions are system memory on DGFX, which is
> > always
> 
