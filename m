Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF731A54290
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281CC10E8F4;
	Thu,  6 Mar 2025 06:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dw6bWNSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06EB10E8F1;
 Thu,  6 Mar 2025 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741241264; x=1772777264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fQ4SfzNo0z2W/4FeLHOYZPFusSbdJIE4vTbmwpdN4dE=;
 b=Dw6bWNSe2o0MZQ3JZk9XvRS1kOgrTvR3MVbDAHn4yid0BeaNbLfvRuWR
 vpweeW3sdZxsEeM7PeLSOfZ/UNvyBsK0GaTOvn9I5m11AzgjT9S+/ZUD4
 hIz+3sH1bFYv7mB/Zn6fZi8FSKG6UUnQqduMMjjCRL/IzOZNA3LbeTK0o
 nSKRoOOPfB+M/ID7KOxbjHQNaF+gRsaOgrsY3pMAPkcF8DCorYalD0UMq
 UMzySiGHlahZ1g5i6Jez6lNaYYBpVd/YTI0zChAd/JW3ekFfIwABxP/Vr
 T7w2tFuCNDM409KzYXlekjhh3RsQAUnfJfznmBmqf+uhlad3rn1UU63aB A==;
X-CSE-ConnectionGUID: gwHQmpuTSeC110a00ga1TQ==
X-CSE-MsgGUID: NG15eviIQmerL+HVahlVAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53635385"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53635385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 22:07:43 -0800
X-CSE-ConnectionGUID: eKTRozInQ6GNZdklyg+K8Q==
X-CSE-MsgGUID: OixyerG8TLCgt/cHmeberw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119612379"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 22:07:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 22:07:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 22:07:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 22:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0cnOzdSrV7ZeKrxzZ6CU6+T749nNf4s/no48bISnwOiPgGnDDUyl92h9XRdKsTMQ3oBSe5l+bHWyflqrzD+8PBojLBFBgdiyM8LJzpv2ZOZBLSF3O3AP62RYgZynlIONzcThj6lwnC2TYzwBWdvGpwYOzD0LbFnVO9DciimH/MzxQ6UhgGUPj90+QlkOsVs5h1IPCYU4DqnkTACMYg4f1eye7X2VBC+sNbVi6lXjJ6YO2r3c3mEGNeoV7r2sYDqqM0XNpjs7eTVpqWI4EebjRh52kXoRwW8lJ2pfNpnJtAEmlLTgx8+YOdUSfD8/qQMceEioH2mG0nyGgQmq8X2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkQj/e3DqAq8Mpn0ktdhM66oEEjlaPQ+pIDbzWOigv8=;
 b=A9ekPV5/fHer0v0umBpzM1b2UF/D8dkAE4tfjAFwjrXE4jNThHggkeR65fKX0KvY6ApB/Zn6T4XmwqJmSwO5Jauw6cupZYQIyzt00KQpatFh+Vzww9SHrJ+7m5r/kTYtz9oAyLylyt7eD2ggzYLbbBdaVmS8ZQrFBp4Hk/iCBaN4KeWbscF7GFBCLHkXyL8sx8SujOZc5Wc4RY28Qf6r/9MjVUpO4OIhL7hBNAWs+fQLRN79vpnqMEyk5rLSGkS8hWVowCya0zV51+2y9buSujwayqmvv93gacfwbYlJQqooq1bEWKpGW9Ok8fhDfFEhgU49zq4y1+yfxo5ts4rb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 06:07:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 06:07:32 +0000
Date: Wed, 5 Mar 2025 22:08:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v7 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <Z8k757kchJi3fWdG@lstrano-desk.jf.intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
 <20250306012657.3505757-33-matthew.brost@intel.com>
 <4vqsd4n7umeimw4gqwa6c5oeuvrpqxfxquzsaizfzuqcdfd7vs@bed32kv2hjom>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4vqsd4n7umeimw4gqwa6c5oeuvrpqxfxquzsaizfzuqcdfd7vs@bed32kv2hjom>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff9387b-b688-4b81-4e78-08dd5c752f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nSVsGII81lP6x9VbElVw7wUSGhVzEMCZoCkVl8pzcRuQoMH6Cg47V58d9I?=
 =?iso-8859-1?Q?NO7ODfoXsKxdtPd2sqzvxPRgPCb7Q68ezdqu9SqMUnrIw+VMLRWEKv0xYT?=
 =?iso-8859-1?Q?QSFN3M6md1BSLH+mvVdRc23KG65DEB6FWTka6an1vzhDrCLFTjs2Tq586b?=
 =?iso-8859-1?Q?V0J00lmabMp0XdwWTQQKaUg+Mk7Zqn+9v1bTr3Ms6KUHLyxBDshTN36uXM?=
 =?iso-8859-1?Q?z3dWo5jhjHxM7rNBTR3vFUfn6dWyG6/StjyHUdvVbVWE6NOrVQThPds2FJ?=
 =?iso-8859-1?Q?eB3A0DKU5j43BZeYA4J7S7hKqle6/kUgOeaY3a8V4Pcrh29BVevSh9C1wz?=
 =?iso-8859-1?Q?jGszXVHv6IfkIWDlPcJ8MzqRvntUfvKnzxVrPuVz0wcHliEqZz0llKg3ZA?=
 =?iso-8859-1?Q?FeEF4AZunRIYXgijwMuZHtop6TLVpPii/Yq1o37STKdf7NyRhmp/d2e4hZ?=
 =?iso-8859-1?Q?1z0vfksS24bXDjqnIchtxUl5qXzr0JSq0PFfB4CYl1YJ1JlzfYiRIXqQQS?=
 =?iso-8859-1?Q?Edxb1npm3gEvC5iK1WcvBvTo/z5oolZbY7xFToSRy8o4bQWsFU4M16I68t?=
 =?iso-8859-1?Q?dFuV9Lg2h5Jj4E3/QGPkiNevjCVEcansqIohZNIB5gyB1ePpXw4FIAMH8h?=
 =?iso-8859-1?Q?bq7+W/Cd1IqE5pzPdG1V+8EJrFjer4qfuTVTRAJRL96ReNI+1X2PZjYPnX?=
 =?iso-8859-1?Q?EaHksk3O9N4LZDwdsv/UzP42NtAOw1aQMbnLSjdcPM9/K75TnDad5zaEHc?=
 =?iso-8859-1?Q?kt77kDXL0S37cl47k8yTD3Xfem+i5zxcWA+8VFqEUltcMHMlp7fNnTpX4t?=
 =?iso-8859-1?Q?Cpk72cth04k33sYKGTplnftL2FJoviLO7QSwZTBuWQrpflFqoQb49RJHh9?=
 =?iso-8859-1?Q?88RsyL7/2tubRLQH7jyP8M9RQmlpK2BYTGvCCmmpPt3qiMQ6HvS8UgzXus?=
 =?iso-8859-1?Q?uwAd4G2TvzBp461ZBX6O1HP1wliE1rAf5zj+hztnl09B/DnGEPwO3ix/Iw?=
 =?iso-8859-1?Q?WREBVqcGF/34da/Mpbc4AmmkzapHCYWnTqh/0HQEnQmmVTLf/iPfQJXRyz?=
 =?iso-8859-1?Q?PbHuZF6JhP76DLvpLGcosEBs/itQpeeaIpTbdfWScTk+gLvDpikcFk15P2?=
 =?iso-8859-1?Q?x3s6qSZ3G2eUCNkyubdWGBCbNtq97Cb9MTq54mUEutvW+R8x9t3ftr71QM?=
 =?iso-8859-1?Q?KHiIorKhW82oZbQxv2Hb/qTfMyxz5f0IFa1pR4EcD0BmGRP250QqgRU9D+?=
 =?iso-8859-1?Q?Kfn5AswKbHG533EzvEWs68YtkbpTR/1GeDASp5FEvELrC+URiy5SAG8+vS?=
 =?iso-8859-1?Q?d/TKFbf1x8Fa8jt7NdZf3fFGI4gY/4B0wm7eG4ejTvrqRbof0j8yenTWfx?=
 =?iso-8859-1?Q?phLwt5Beygeq336BOJQOUD8BzlscxR+Eu21DXk+NKhU/bdpDI5edF+zot5?=
 =?iso-8859-1?Q?BIFpVPm6v/aWFuH1vKgg7VCIA+TZ0xiEEngecg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f9GLO33NzuoqaLkSKD6N14zlb65NAMfXQVkN/IDSZCnS5/MdK69TfhXTyW?=
 =?iso-8859-1?Q?8cA0+o+FbygOA7VReFKBnreP7SJUruunTtFV4TBuU6VvXW7uGMkFGP56vR?=
 =?iso-8859-1?Q?gEIWYpny91GbKNNaLT2+RMlvFhjQjF39p/QBRoKTTDuasmxDPmjgNGawOa?=
 =?iso-8859-1?Q?l8rgNOwYFVNdbpGR0d13kxrom1x6YnnvdwoHvyVUpaduNHAKhSAsDqoH7R?=
 =?iso-8859-1?Q?HUW9ZMlXJYIGA/aOA+XI1MqYm2Xb/OQq4sqj2hZ0WpvQKOzoBv3gLN/ZDQ?=
 =?iso-8859-1?Q?5MhkfdYopK0O6yAeplt/WdImtvtKvAetY6wqZyP5ryEKfmEh+j0Ka4keLr?=
 =?iso-8859-1?Q?V4+RfsLIDmMwgpD2QwTqPsMhqMoWHJeVk3AC5RAnPMNjCXz33VZl/hxI1X?=
 =?iso-8859-1?Q?VqaqO0mr7kk9LsMqJWzohPG1ICEm5wVhF1K7RaQQo0DDxh7P6nuEgjje2S?=
 =?iso-8859-1?Q?zQaDdYcxTN3hFhUGeHE49+kFVCgPimOQ3sBI7EMZg3Y39bJD4YX6nPPefz?=
 =?iso-8859-1?Q?0hB3PWW5EzFePb3U5oNgKi7sv0HI736KAh3dZmf17y2C0ZI7e9Zq2HdU6f?=
 =?iso-8859-1?Q?crOa/JgiRrPWRf+e+lyPm8SFwMb8JpHI7OmxuZwXZg4GHogZsDL+iSX32m?=
 =?iso-8859-1?Q?2fRSVcKPFjvUJULl/js3s79DUbZnx9UEiIXjn5k1dTxy2HrbHowUishQig?=
 =?iso-8859-1?Q?6OUA916e2/gw3XzsIPOju78uNjqY4GLdvnDaNE6pmYvmb+ciGfYr2Lds/0?=
 =?iso-8859-1?Q?+0b3P62YMLfFoDih0lZLcyw/6/mEdglVKy/wFQwy+KFXz9DUzSnczsYnRL?=
 =?iso-8859-1?Q?F/6omqvVjOO2hkkK+LoumNXAQ7A/agOHv8TH+YGgVSWKmHsA0YiRE/c41+?=
 =?iso-8859-1?Q?x6j4pX8znZu01oulUs8l3UTwaGlYIvpDeSDyzngAoBYHu087JhzBUGD9kd?=
 =?iso-8859-1?Q?kGygya4jFXuvpBihp0mfT7GkVCc5FFZ0ENU1z7ZYTF5Chz8Tq+vK4bx7en?=
 =?iso-8859-1?Q?NfvD37+CoGsJgcmalOkDJ/6xfTEkHZouwygDqSw9gjV4gJAshMgWrL+5C7?=
 =?iso-8859-1?Q?f3b8UfUHG9VDIySrr4OQWnQrQPb+hDHxCDAxB48J12YIbbuf5ze64VO1jt?=
 =?iso-8859-1?Q?LxH+mqyWTiKG/zhiq39QvTJPHV3/ABKXnRttdilLwLsVCD82/x4xwgpiQI?=
 =?iso-8859-1?Q?ybKNCZvBCCLijSLE+JZf9CMIqQwtd5GIRO6eFxbaDa9nIfTd3Es7YHhrpg?=
 =?iso-8859-1?Q?DVQJX3JGweOrG7Mf273SqHYvCRgTGJTza8+pKNiWwU7sEdTAKAhBwdQNv4?=
 =?iso-8859-1?Q?3d1eAehpCldrIoWE8DYHX51+Qd8pSWIi+A5tyYafbLGedwoTUfL1NEdN6L?=
 =?iso-8859-1?Q?G5k2IL65LLkFcrV9iR+WMGX3MJWhYUyGFDqgGAzOivPqMIt+f8SvyC3nBu?=
 =?iso-8859-1?Q?F2BaOfuo92K2i49IsITMkae/EXfDO14scnZ5k8Zj4hp1agOMQCob50yVoa?=
 =?iso-8859-1?Q?lXrXyqnj8sKvEhKuMfDz0w1Al9aY/syfnj0sIZDQNwKaLgYsR7lnb9qEjP?=
 =?iso-8859-1?Q?JY8uJQfBsKEV0xAaa4AA6HKYBKSg0ghMz2sj5zeRrIdfg0RZQwfbs5+GMS?=
 =?iso-8859-1?Q?QYgh/YGpci5dUN5FcBK0wt5BgXf9uzG28wvPkP6m12IVcpV5Yb3gy1lw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9387b-b688-4b81-4e78-08dd5c752f02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:07:32.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkvS5JWGNrgP8rw22dUOkc8Maw0M2plMCY0/3LGEbfoKIAxOvv+/gltRmMsN1ORFkA0iCTvKGxeQIBCpi8yEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7401
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

On Thu, Mar 06, 2025 at 04:45:31PM +1100, Alistair Popple wrote:
> On Wed, Mar 05, 2025 at 05:26:57PM -0800, Matthew Brost wrote:
> > Add documentation for agree upon GPU SVM design principles, current
> > status, and future plans.
> 
> One minor nit and a comment below, but feel free to add:
> 
> Acked-by: Alistair Popple <apopple@nvidia.com>
> 

Thanks!

> > v4:
> >  - Address Thomas's feedback
> > v5:
> >  - s/Current/Basline (Thomas)
> > v7:
> >  - Add license (CI)
> >  - Add examples for design guideline reasoning (Alistair)
> >  - Add snippet about possible livelock with concurrent GPU and and CPU
> >    access (Alistair)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  Documentation/gpu/rfc/gpusvm.rst | 106 +++++++++++++++++++++++++++++++
> >  Documentation/gpu/rfc/index.rst  |   4 ++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> > 
> > diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> > new file mode 100644
> > index 000000000000..87d9f9506155
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > @@ -0,0 +1,106 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +===============
> > +GPU SVM Section
> > +===============
> > +
> > +Agreed upon design principles
> > +=============================
> > +
> > +* migrate_to_ram path
> > +	* Rely only on core MM concepts (migration PTEs, page references, and
> > +	  page locking).
> > +	* No driver specific locks other than locks for hardware interaction in
> > +	  this path. These are not required and generally a bad idea to
> > +	  invent driver defined locks to seal core MM races.
> > +	* An example of a driver-specific lock causing issues occurred before
> > +	  fixing do_swap_page to lock the faulting page. A driver-exclusive lock
> > +	  in migrate_to_ram produced a stable livelock if enough threads read
> > +	  the faulting page.
> > +	* Partial migration is supported (i.e., a subset of pages attempting to
> > +	  migrate can actually migrate, with only the faulting page guaranteed
> > +	  to migrate).
> > +	* Driver handles mixed migrations via retry loops rather than locking.
> > +* Eviction
> > +	* Eviction is defined as migrating data from the GPU back to the
> > +	  CPU without a virtual address to free up GPU memory.
> > +	* Only looking at physical memory data structures and locks as opposed to
> > +	  looking at virtual memory data structures and locks.
> > +	* No looking at mm/vma structs or relying on those being locked.
> > +	* The rationale for the above two points is that CPU virtual addresses
> > +	  can change at any moment, while the physical pages remain stable.
> > +	* GPU page table invalidation, which requires a GPU virtual address, is
> > +	  handled via the notifier that has access to the GPU virtual address.
> > +* GPU fault side
> > +	* mmap_read only used around core MM functions which require this lock
> > +	  and should strive to take mmap_read lock only in GPU SVM layer.
> > +	* Big retry loop to handle all races with the mmu notifier under the gpu
> > +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> > +          those.
> > +	* Races (especially against concurrent eviction or migrate_to_ram)
> > +	  should not be handled on the fault side by trying to hold locks;
> > +	  rather, they should be handled using retry loops. One possible
> > +	  exception is holding a BO's dma-resv lock during the initial migration
> > +	  to VRAM, as this is a well-defined lock that can be taken underneath
> > +	  the mmap_read lock.
> > +	* One possible issue with the above approach is if a driver has a strict
> > +	  migration policy requiring GPU access to occur in GPU memory.
> > +	  Concurrent CPU access could cause a livelock due to endless retries.
> > +	  While no current user (Xe) of GPU SVM has such a policy, it is likely
> > +	  to be added in the future. Ideally, this should be resolved on the
> > +	  core-MM side rather than through a driver-side lock.
> > +* Physical memory to virtual backpointer
> > +	* This does not work, as no pointers from physical memory to virtual
> > +	  memory should exist. mremap() is an example of the core MM updating
> > +	  the virtual address without notifying the driver.
> 
> Pretty minor nit, but this could be read as core MM won't send a mmu notifier
> when calling mremap(). That's not the case, as it will get a notifier to
> invalidate the address but won't explicitly get notified of the new address.
> 
> Not worth sending an update just for that though.
> 

Yep, will fix up when merging.

> > +	* The physical memory backpointer (page->zone_device_data) should remain
> > +	  stable from allocation to page free. Safely updating this against a
> > +	  concurrent user would be very difficult unless the page is free.
> > +* GPU pagetable locking
> > +	* Notifier lock only protects range tree, pages valid state for a range
> > +	  (rather than seqno due to wider notifiers), pagetable entries, and
> > +	  mmu notifier seqno tracking, it is not a global lock to protect
> > +          against races.
> > +	* All races handled with big retry as mentioned above.
> > +
> > +Overview of baseline design
> > +===========================
> > +
> > +Baseline design is simple as possible to get a working basline in which can be
> > +built upon.
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> > +   :doc: Overview
> > +   :doc: Locking
> > +   :doc: Migrataion
> > +   :doc: Partial Unmapping of Ranges
> > +   :doc: Examples
> > +
> > +Possible future design features
> > +===============================
> > +
> > +* Concurrent GPU faults
> > +	* CPU faults are concurrent so makes sense to have concurrent GPU
> > +	  faults.
> > +	* Should be possible with fined grained locking in the driver GPU
> > +	  fault handler.
> > +	* No expected GPU SVM changes required.
> > +* Ranges with mixed system and device pages
> > +	* Can be added if required to drm_gpusvm_get_pages fairly easily.
> > +* Multi-GPU support
> > +	* Work in progress and patches expected after initially landing on GPU
> > +	  SVM.
> > +	* Ideally can be done with little to no changes to GPU SVM.
> > +* Drop ranges in favor of radix tree
> > +	* May be desirable for faster notifiers.
> > +* Compound device pages
> > +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> > +	  migrate device layer are a performance bottleneck, having compound
> > +	  device pages should help increase performance by reducing the number
> > +	  of these expensive calls.
> 
> Balbir has also just posted an initial RFC implementation of this here:
> 
> https://lore.kernel.org/linux-mm/20250306044239.3874247-1-balbirs@nvidia.com/
> 

Nice. Will take a look as we have time. I also want to pull in Leon's
series [1] too.

Matt

[1] https://lore.kernel.org/all/cover.1738765879.git.leonro@nvidia.com/

> > +* Higher order dma mapping for migration
> > +	* 4k dma mapping adversely affects migration performance on Intel
> > +	  hardware, higher order (2M) dma mapping should help here.
> > +* Build common userptr implementation on top of GPU SVM
> > +* Driver side madvise implementation and migration policies
> > +* Pull in pending dma-mapping API changes from Leon / Nvidia when these land
> > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > index 476719771eef..396e535377fb 100644
> > --- a/Documentation/gpu/rfc/index.rst
> > +++ b/Documentation/gpu/rfc/index.rst
> > @@ -16,6 +16,10 @@ host such documentation:
> >  * Once the code has landed move all the documentation to the right places in
> >    the main core, helper or driver sections.
> >  
> > +.. toctree::
> > +
> > +    gpusvm.rst
> > +
> >  .. toctree::
> >  
> >      i915_gem_lmem.rst
> > -- 
> > 2.34.1
> > 
