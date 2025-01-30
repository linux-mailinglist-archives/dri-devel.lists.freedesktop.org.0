Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AFA2321B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70A10E9B7;
	Thu, 30 Jan 2025 16:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOG3qzKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889F010E9B7;
 Thu, 30 Jan 2025 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738255290; x=1769791290;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yfzLp9uil4r9PZFRFAzz6G7Yyfp7F8F7u3alf2gdbWw=;
 b=eOG3qzKHNfwSnPhJGnupeSldDt0P7x3WeQ8HDA55UI9lnuubfrMH6fQ3
 +f7uP8Arh2PtFtnGbvXjdR5qJta/TTVgMgy87HMzuujDH++S50sEPjKt5
 8lXGzsOoFb31qDhwxR3WVbg28JSyQeXtjInysybP89hfi+ne90Rlyqtie
 +EzsGx0COOew03iQhgRXfZwRvtcBNRnzTusMoZWLlum6R3Qgr8axr65E2
 9jqtdGGj2ZZIR8zmlTYWri4vFlnGPRD65PBHPW6jm++z1tQdnbZpkuqUM
 ZNQJ4nqmAE5ozmy8ICtULmKbA5wzwblpR0vcB9Uk2WX1oTsUiwNVAfEAg w==;
X-CSE-ConnectionGUID: cu4ibQ0zSMCmrb8oNvmIOg==
X-CSE-MsgGUID: koKlk9c3TpyMxzbxxxa3Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38713959"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38713959"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:41:30 -0800
X-CSE-ConnectionGUID: cC31mKtMRQqHKnEhIgym7A==
X-CSE-MsgGUID: U9jc9TfyQ1mVnYz80HvSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109979919"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:41:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:41:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:41:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1nnUg3QkQ2maLhW9TnTq8Ha8bSB6lweFW7Z5JLidyCNk8KP9tDR8ykGKhhPv82tIDzj3W55F/sk67YJ8ZzHWK53IYiR+ht+1vKxST+tkK7jkwvEJ6eDHEoEaJDa/CKoKb+1pcqRR2Enve3O5wYDD+ac7ju8/eQM2fZOYUcSSGTyy3CDEhxAUbHC6JdWlMLqjeD6mQRmbLEbmXxiuc92TFRCLZwLGRIZOxiQSDxj37jhf55EuO25CR4HH01qZ+pGvhdz55XlszP1mQRLo1TY/ORj3hlkybK/PtR4xzIyoGGMatwKWU8F/zdXquoF1pgoaLZgenD7jebEoKIbSjvMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqYq+mbQ4mtdegGZz0qEwiXuC49l6VISwhWQyZfYFeM=;
 b=Nl3xsc2NYVqQwmMu7ySOq+tfTU6mXnMLRzhVeYvcO+ysqazVCrAWI1y8hpPcZ8+Kq3JrpyzkDDKj5Y4fFKN3nGa/ggCVvD7HSBNJ1eSPQC4vIJlu9sZ10hUAo2gEdOdRID42U4raFnhWQ9aHge+3WgpsA+3R2VgdHrBant44i/v0UcJxg3tT8tuKantF/ZU48bVqLMqGf80bORxmd76ROFM084ER6PCh/QZJW+XFTtpyWv5EiigWURVD5b3y0KA50mzRKMuCQfL/mgvpat+HqReSj/OhZZmoRx6+Nn44to0+LJTEQt9toETbljCrlBTsRx/nWJCAFobJpDZep+6RFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:41:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:41:27 +0000
Date: Thu, 30 Jan 2025 08:42:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 06/33] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Z5ur71WGSN4DFUI2@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-7-matthew.brost@intel.com>
 <4cdb6d9a-cf7b-4d2f-b214-c5c53f7b9714@intel.com>
 <e2cf8b22-b00b-4447-a4d8-1415388b5530@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2cf8b22-b00b-4447-a4d8-1415388b5530@intel.com>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e15aa0-0df6-4a48-bdc9-08dd414cf0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Thwl1v63FNfCUHn5UhUpkyRDXu/ospxPOWXC+cKeiL6FewEy/OMt3lICYd?=
 =?iso-8859-1?Q?B+RODpg/IxnPEmb8lDi64SPuCwU2wAdC+23iNxwjVEiR8U1Mud+Y+V9Ahi?=
 =?iso-8859-1?Q?xrSo7S08OmdfFDBpNLKskklKOJv4/p8fe831xErfCk9UlteU7yGyH2UDiq?=
 =?iso-8859-1?Q?iWGxhRhY+VFbthFRx7F57N2Ke4PrVmPwTg6G41bljx77Uzm3XRH4SXbKDP?=
 =?iso-8859-1?Q?+1Uq3agDQvz1Ue1hJMs9ic0BfxvpxuqQKL8y8CiemDZJugXrkx4/LT/jXp?=
 =?iso-8859-1?Q?WlUlnS7eJQsdUA8zQyvi4cbzNGkGwAqNYa4Nv16IkOR7ca6Gs1dTlDOa4D?=
 =?iso-8859-1?Q?f43HWLLXAQ9G7R4t6g3HSdE7vssugo8vRc1vPofLrTZeUWpTK2IZLZWVKL?=
 =?iso-8859-1?Q?NAesHdBvVd5JZXhk0MZQnEnVUimhGLOxGGkSMOQYk/JD1ZS0+4qbymN+Dp?=
 =?iso-8859-1?Q?cbP0MyiIRLz4iUoX+HguK0MY6RTWKx30Fq8DyZRJR/upJbQkT0d5VXgfsY?=
 =?iso-8859-1?Q?ay4UNQ50O4sZ6gRxLP3pdm4WAXudm9hIx4zaxsOG45aKvzudlm2N3gOElb?=
 =?iso-8859-1?Q?oKwbtCBNtNQCtbD0GZC1m9MUtOlPN93MPCN6o7M12uaH19yRP//mlpOdvZ?=
 =?iso-8859-1?Q?5NIisGAHWw4ZxrxHzrGWVpPVb4wm6vZg4HCsI9L0hCa83yBT1wBoVO7TOd?=
 =?iso-8859-1?Q?aVq7gv7e8wC7d7I0cgqq7ZyCInYMjNZ6EKEioaenzyqbhxyPC7dyiJ14PW?=
 =?iso-8859-1?Q?XH65gXo36IUchxVbn5zl329CkTuRpEKrNtogRBqtgPEVpZ5kZ/Mya79HC7?=
 =?iso-8859-1?Q?wv2g23eOuzlBwUtF/W8O6juTVaYxzJhjb0p0qfFdLjzs2FLZ9sf1lD+mDW?=
 =?iso-8859-1?Q?CmeyijEbOp6+/lBScOLY9zejfnG2TOLluhoJbZs/Jx4aTIFGTpSr2KWdZX?=
 =?iso-8859-1?Q?Ei8mVTSQMr57YxuX3jGapkITWPsRf9SGvJAvr2wVEF1EtL6xTCTcvrfpQJ?=
 =?iso-8859-1?Q?nfY1KpAaJitT5A8vH7mfwJYZpmQ+gLhLDa1L9DpID2MXVJPm7/dfdvKqgH?=
 =?iso-8859-1?Q?GY9E/KMOK8ffE3v8AjiU8e432HWIQ1SLd8u2Outb4DhWUG1IRdLbszg+SP?=
 =?iso-8859-1?Q?s3VZGuJ3E5GQj1syGGCuMR/LYyaF5z65ND4VBus5BjJB0/rckoGoPdgoVS?=
 =?iso-8859-1?Q?d8Qdz90JBwC+uPU4Gu+2BvviVpiwHUgiauTvSnVi3vqmFdVoJU0eBvEd/D?=
 =?iso-8859-1?Q?m6hBHOOvcam4lKyv3ewiMTe3udeczDU2WRhAYbPslu/XimExx5qkRRB/Fh?=
 =?iso-8859-1?Q?ua6ovQH634XXFNSEAlCGzaZIQeoOA9ZJTMB40/xeZDsAm2n81GMgGW8xYF?=
 =?iso-8859-1?Q?FWxA4XO6iWF9jGJtmBXuJ3xa4DGPbiP7Tfoipcuym0dIG3afq6aOLzja2r?=
 =?iso-8859-1?Q?o7Wj/0JtZDqnhr6u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GXgiueRA1MkypEKlI4R6DpM8JMM6QI8aN/7LN3zCUs4qztCMuf5SE8GdH0?=
 =?iso-8859-1?Q?MKKmsY1yPFFGQ/v+e14kxL2rZBBs7NILqiPEBhsWWIa/eVtF3G5+5/1uzW?=
 =?iso-8859-1?Q?st28kqz093jh5zDjxwcWYjah8X/eRi62SnIz7J0SCS4rLB3d313hEAiZIs?=
 =?iso-8859-1?Q?78SxQyDDsKoYF10kfIpaeqSY7ryll9SlMKgxef8TYHOgTb/6xhWnSA0It+?=
 =?iso-8859-1?Q?/1YEyi3kQFmm0/oVSJ0PVc4WkB8BkZjc57OoCLrNTVvh29P7n5l+WreIIf?=
 =?iso-8859-1?Q?K7cWU/XnA+EHeaD9s1Af1ixKRS11ZDLOzAKAT2pkuS7FijmQ1nyrf3UBbS?=
 =?iso-8859-1?Q?CfizfTxJgkcL0cla6vmojIebYEk9WMDCWTCf2ytaW4DiakSCPVcrijHv5+?=
 =?iso-8859-1?Q?7VsZU+zPMmHF1tV5dMIo3iSFXLYmpzRd/9CjcmdvQH8LIEj3isiYLIKe7j?=
 =?iso-8859-1?Q?gQ4yEztkjTkk2itXx90IRGPrHjYFq6fsxOr4jg6+Yt0EGeDaYNKMyGhRXG?=
 =?iso-8859-1?Q?a0VLnQ8iqXtK8/YuevvLtpFcZPyHhZjQ8cWCtUZSVSs0HTqDJVCYdYSgrX?=
 =?iso-8859-1?Q?Spcx5JseZDqah2yuYo7GR6OcUdGIahNZPlbUXbp78qD/CgZHGR5L5ihqTe?=
 =?iso-8859-1?Q?MBaUyT056pF8MmFN7O+OWKskFHvX5gI7BQp5KxnqB0mFMvW54bI9JvTU24?=
 =?iso-8859-1?Q?oGfET9BMlN9Q6NhFZLiuUbE4poAloCcMNXVJhlJf6612lrD/j1DjWMxxDG?=
 =?iso-8859-1?Q?czYA8bq4WBEKcKpZZTh3mihJAMnJUVNbgBMA5PooJ4OKeRFWZfeye1hioF?=
 =?iso-8859-1?Q?3lp5i1NPTYEJqd4d1nq+dL0dATW0NarTdvDPcwhiJPy219G9zo3gIqXPBU?=
 =?iso-8859-1?Q?X8QA0NfD5OYww2pBDCBSbNQf+nDGDpk9PGjvJ2fEhEKUqsIgcvev75QqMT?=
 =?iso-8859-1?Q?4FQdVOsKcoQe8K/R3MBjO4Qz/9zVPcDvk7llxyTFf5KwYJatl0cJGnwuxU?=
 =?iso-8859-1?Q?EPM5SMvpEYu/oEJgvFktil8XJkn83WkUEQCJ07QWS+45mRVS5W5E8Wzyg0?=
 =?iso-8859-1?Q?0oeFhehN2Ojq+yQH1U+RorxKekd6mIJ+1ZqGBsbx/uJCRrHxj5nBE1WqJ8?=
 =?iso-8859-1?Q?WxvOTzkwVmWRkusxEWvNmsqKAEghwntToSwKfMlhvpdfSyhFHDvVJ1CNt/?=
 =?iso-8859-1?Q?LkdFsWY9aoPw3cIHSxm4L0vUBRVW9wHpEBTgW/QKB045DiPybszF/WNVbd?=
 =?iso-8859-1?Q?4fjRDIl3nEZRzLYEsZ3S2RfceauTERPWpLyFFwpS9vj85XNYJX9Kxc7Z0w?=
 =?iso-8859-1?Q?MZgFiyqBaVVQ+K4P12+l8YpTOgMFlozGnzzH8WhZyRJloi24KJvWhVWuD5?=
 =?iso-8859-1?Q?25x3aYuTjmRZewywgxA+xUD5Mp3jMMLIxQL8uuKTnb2iPAcWcXxTEKsul3?=
 =?iso-8859-1?Q?JGPi+ff5rq+R95qd5FEKMkBbCbYAQsza7V4F8LR7yokkSfGNWhB73NNRNS?=
 =?iso-8859-1?Q?R+OYeNQ8ZovCOd7/WnY/YUvE8FE4L5rwhea1+/kxfVnacYzaju9KphtnBS?=
 =?iso-8859-1?Q?tLBHvikVaL+zqDx8uc0FDNXIOBNFEA4mKYqgXUJAE41cJH3cnw96PDjodt?=
 =?iso-8859-1?Q?WfDPgEfYaM3MOV/Fcx1OPNYF4Q1sATWALWgZEuNOxRxZH4Peeeb+TrLA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e15aa0-0df6-4a48-bdc9-08dd414cf0b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:41:26.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1Rh46lgpkacDfmHHRFqxLLoVH9VBvQf+Gmyzt3thhJvRg5KhVHmPZgp4s7+nchfmB8IG74p5v720zdN0SlRCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Thu, Jan 30, 2025 at 03:13:22PM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 1/30/25 1:17 PM, Matthew Auld wrote:
> > On 29/01/2025 19:51, Matthew Brost wrote:
> > > This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> > > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > > sharing of memory between the CPU and GPU, enhancing performance and
> > > flexibility in GPU computing tasks.
> > > 
> > > The patch adds the necessary infrastructure for SVM, including data
> > > structures and functions for managing SVM ranges and notifiers. It also
> > > provides mechanisms for allocating, deallocating, and migrating memory
> > > regions between system RAM and GPU VRAM.
> > > 
> > > This is largely inspired by GPUVM.
> > > 
> > > v2:
> > >   - Take order into account in check pages
> > >   - Clear range->pages in get pages error
> > >   - Drop setting dirty or accessed bit in get pages (Vetter)
> > >   - Remove mmap assert for cpu faults
> > >   - Drop mmap write lock abuse (Vetter, Christian)
> > >   - Decouple zdd from range (Vetter, Oak)
> > >   - Add drm_gpusvm_range_evict, make it work with coherent pages
> > >   - Export drm_gpusvm_evict_to_sram, only use in BO evict path (Vetter)
> > >   - mmget/put in drm_gpusvm_evict_to_sram
> > >   - Drop range->vram_alloation variable
> > >   - Don't return in drm_gpusvm_evict_to_sram until all pages detached
> > >   - Don't warn on mixing sram and device pages
> > >   - Update kernel doc
> > >   - Add coherent page support to get pages
> > >   - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
> > >   - Add struct drm_gpusvm_vram and ops (Thomas)
> > >   - Update the range's seqno if the range is valid (Thomas)
> > >   - Remove the is_unmapped check before hmm_range_fault (Thomas)
> > >   - Use drm_pagemap (Thomas)
> > >   - Drop kfree_mapping (Thomas)
> > >   - dma mapp pages under notifier lock (Thomas)
> > >   - Remove ctx.prefault
> > >   - Remove ctx.mmap_locked
> > >   - Add ctx.check_pages
> > >   - s/vram/devmem (Thomas)
> > > v3:
> > >   - Fix memory leak drm_gpusvm_range_get_pages
> > >   - Only migrate pages with same zdd on CPU fault
> > >   - Loop over al VMAs in drm_gpusvm_range_evict
> > >   - Make GPUSVM a drm level module
> > >   - GPL or MIT license
> > >   - Update main kernel doc (Thomas)
> > >   - Prefer foo() vs foo for functions in kernel doc (Thomas)
> > >   - Prefer functions over macros (Thomas)
> > >   - Use unsigned long vs u64 for addresses (Thomas)
> > >   - Use standard interval_tree (Thomas)
> > >   - s/drm_gpusvm_migration_put_page/
> > > drm_gpusvm_migration_unlock_put_page (Thomas)
> > >   - Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas)
> > >   - Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
> > >   - Newlines between functions defs in header file (Thomas)
> > >   - Drop shall language in driver vfunc kernel doc (Thomas)
> > >   - Move some static inlines from head to C file (Thomas)
> > >   - Don't allocate pages under page lock in
> > > drm_gpusvm_migrate_populate_ram_pfn (Thomas)
> > >   - Change check_pages to a threshold
> > > v4:
> > >   - Fix NULL ptr deref in drm_gpusvm_migrate_populate_ram_pfn
> > > (Thomas, Himal)
> > >   - Fix check pages threshold
> > >   - Check for range being unmapped under notifier lock in get pages
> > > (Testing)
> > >   - Fix characters per line
> > >   - Drop WRITE_ONCE for zdd->devmem_allocation assignment (Thomas)
> > >   - Use completion for devmem_allocation->detached (Thomas)
> > >   - Make GPU SVM depend on ZONE_DEVICE (CI)
> > >   - Use hmm_range_fault for eviction (Thomas)
> > >   - Drop zdd worker (Thomas)
> > > 
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > 
> > <snip>
> > 
> > > +/**
> > > + * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (internal)
> > > + * @vas: Pointer to the VM area structure
> > > + * @device_private_page_owner: Device private pages owner
> > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > + * @fault_addr: Fault address
> > > + * @size: Size of migration
> > > + *
> > > + * This internal function performs the migration of the specified
> > > GPU SVM range
> > > + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> > > + * invokes the driver-specific operations for migration to RAM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> > > +                       void *device_private_page_owner,
> > > +                       struct page *page,
> > > +                       unsigned long fault_addr,
> > > +                       unsigned long size)
> > > +{
> > > +    struct migrate_vma migrate = {
> > > +        .vma        = vas,
> > > +        .pgmap_owner    = device_private_page_owner,
> > > +        .flags        = MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > > +            MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > > +        .fault_page    = page,
> > > +    };
> > > +    struct drm_gpusvm_zdd *zdd;
> > > +    const struct drm_gpusvm_devmem_ops *ops;
> > > +    struct device *dev;
> > > +    unsigned long npages, mpages = 0;
> > > +    struct page **pages;
> > > +    dma_addr_t *dma_addr;
> > > +    unsigned long start, end;
> > > +    void *buf;
> > > +    int i, err = 0;
> > > +
> > > +    start = ALIGN_DOWN(fault_addr, size);
> > > +    end = ALIGN(fault_addr + 1, size);
> > > +
> > > +    /* Corner where VMA area struct has been partially unmapped */
> > > +    if (start < vas->vm_start)
> > > +        start = vas->vm_start;
> > > +    if (end > vas->vm_end)
> > > +        end = vas->vm_end;
> > > +
> > > +    migrate.start = start;
> > > +    migrate.end = end;
> > > +    npages = npages_in_range(start, end);
> > > +
> > > +    buf = kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +               sizeof(*pages), GFP_KERNEL);
> > > +    if (!buf) {
> > > +        err = -ENOMEM;
> > > +        goto err_out;
> > > +    }
> > > +    dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > +    pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) *
> > > npages;
> > > +
> > > +    migrate.vma = vas;
> > > +    migrate.src = buf;
> > > +    migrate.dst = migrate.src + npages;
> > > +
> > > +    err = migrate_vma_setup(&migrate);
> > > +    if (err)
> > > +        goto err_free;
> > > +
> > > +    /* Raced with another CPU fault, nothing to do */
> > > +    if (!migrate.cpages)
> > > +        goto err_free;
> > > +
> > > +    if (!page) {
> > > +        for (i = 0; i < npages; ++i) {
> > > +            if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> > > +                continue;
> > > +
> > > +            page = migrate_pfn_to_page(migrate.src[i]);
> > > +            break;
> > > +        }
> > > +
> > > +        if (!page)
> > > +            goto err_finalize;
> > > +    }
> > > +    zdd = page->zone_device_data;
> > > +    ops = zdd->devmem_allocation->ops;
> > > +    dev = zdd->devmem_allocation->dev;
> > > +
> > > +    err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages,
> > > &mpages,
> > > +                          migrate.src, migrate.dst,
> > > +                          start);
> > > +    if (err)
> > > +        goto err_finalize;
> > > +
> > > +    err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst,
> > > npages,
> > > +                       DMA_FROM_DEVICE);
> > > +    if (err)
> > > +        goto err_finalize;
> > > +
> > > +    for (i = 0; i < npages; ++i)
> > > +        pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > > +
> > > +    err = ops->copy_to_ram(pages, dma_addr, npages);
> > > +    if (err)
> > > +        goto err_finalize;
> > > +
> > > +err_finalize:
> > > +    if (err)
> > > +        drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> > > +    migrate_vma_pages(&migrate);
> > > +    migrate_vma_finalize(&migrate);
> > > +    drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> > > +                       DMA_FROM_DEVICE);
> > 
> > clang for me is throwing:
> > 
> > drivers/gpu/drm/drm_gpusvm.c:2017:7: error: variable 'dev' is used
> > uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-
> > uninitialized]
> >   2017 |                 if (!page)
> >        |                     ^~~~~
> > drivers/gpu/drm/drm_gpusvm.c:2047:33: note: uninitialized use occurs here
> >   2047 |         drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> >        |                                        ^~~
> > drivers/gpu/drm/drm_gpusvm.c:2017:3: note: remove the 'if' if its
> > condition is always false
> >   2017 |                 if (!page)
> >        |                 ^~~~~~~~~~
> >   2018 |                         goto err_finalize;
> >        |                         ~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_gpusvm.c:1966:20: note: initialize the variable
> > 'dev' to silence this warning
> >   1966 |         struct device *dev;
> >        |                           ^
> >        |                            = NULL
> > 1 error generated.
> 
> I also reported this issue in the v3 patch, but it doesn't seem to have been
> fixed in v4 yet.
> 
> https://lore.kernel.org/dri-devel/0416fa97-1734-4565-a352-f045a6c0a15a@intel.com/
> 

Yea. The uninitialization is in fact harmless as
drm_gpusvm_migrate_unmap_pages is a NOP in this path which I stated. I
was unware a tool was complaining about this. I think get this fixed
then.

Thanks,
Matt

> Br,
> 
> G.G.
> 
