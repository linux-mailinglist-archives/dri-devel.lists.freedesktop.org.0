Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB29C4D50
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 04:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2ED10E218;
	Tue, 12 Nov 2024 03:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRiOyreM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754D10E215;
 Tue, 12 Nov 2024 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731382160; x=1762918160;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=btr7W4VpzBSgUBnKyz5HMXWseA7BBSosMxaWnU+/z8s=;
 b=TRiOyreMSUPpiH8bUfCypg5u/xHzbdsJXLuZ7k3JyLmmTIqJQWFxqAh8
 F5j0QxYPns6dx52Z2TZ0flZ1Gcfagj/VesHDOZDfTw13XrwnoeV6j62xS
 Hruj9z0Dn+hPyD6hrg4fUFRihZFgI+qUx6qkvg5d2vmYONzbblCbDDINU
 xohMhtDEl3YWeduxT0vsmODZWHHrjBa+9PNLv/s1xlWQ1Q8LRcPCrCiPw
 kUfp+QtZ4LpEf064UTrc5hpEttDNjzu4WUaCUa4kiTrOL0zR8nvtccaAv
 T141OLskdlhkEWAuJvhhUV/p+O6KToVofmlK+1zUGcrkcwq2l7iJqmJwi A==;
X-CSE-ConnectionGUID: R4u5Ra8gTXKG8OoY0iQq+w==
X-CSE-MsgGUID: q1ajtqefTaGBit9RSJFMJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31161205"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31161205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 19:29:19 -0800
X-CSE-ConnectionGUID: gyutBFgLRIeYFHKCPm2uhQ==
X-CSE-MsgGUID: 1sRW6dNgQTmGSLcjRt99XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92174482"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 19:29:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 19:29:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 19:29:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 19:29:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGzSftU6r6lPxs2YcXjFlCuoEzTSHJeNdjWeKns2vsW38qlbhmhOtk6O7WNTw4OvTe17Pu726jm1YyTM4Yi/9pTsDN0coFgbfe1dsN/aP7Y3nXWv0PNXtlUYkpwzSejIlje6kCbaizIDvLUshgsFkXMT+3Lx++SbMMLDHlhnX415pyBJGQFhiuKUCV6YeeudtX1xRwemsM3nkjbpEjzBEjoPGdsHKTCoMvWEmxCApRpSkhmo6OVFrPEL+9Wlph+1Yj7XwYGZYHKtdoQBH7ChT39ngh0rIZTtuGGN3nEMSoojDs6t44SmxrsKd6cfHJq08K48Slr1hJG5BcqhhCWzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6KlFn3b8bRMYgw1m4HcERYSHh9De9qHGLweRyT+baE=;
 b=BrPKaPkDE0gWCQ+p5rvuKa713ccn6aezVND4UIWwln5Ho8RvYmWZYg7duj+DUjmkZnYyijLorf+vDECjLux/H4ccsIHW0/i4cJxCeimO/jP9bh/VnU70tW1Pdc5fYiTF8eWbtav+HJw7/jvNaoayn0ZR2Yv17AAv8oVyGwQT0n2vq/Q0P9zWPAPDGGraWjvFQ/bfqYIHj7/JUT4H/4HWgreklsmmMIBcT4VxQX3xeuOtmXU3nqKxwCSz6sPVdiFLqOZNI3EJPMGwdzZ5VJeXiG/K/Hc/JewYJTklQomCWI/DuQIwdqFK0bn7DSliqlrTMoiKOis0Xvgdttd5zrNTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 03:29:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8137.019; Tue, 12 Nov 2024
 03:29:15 +0000
Date: Mon, 11 Nov 2024 19:29:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <pstanner@redhat.com>, <boris.brezillon@collabora.com>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>, <dakr@kernel.org>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
Message-ID: <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
X-ClientProxiedBy: MW4PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:303:dd::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6330e684-2a16-4c74-6088-08dd02ca2ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cM9GzkM8qqrdW9A06oz4cb95Y8PbMx/6MhJ4VtCWVn2w6IBdAJn6t3g3zo?=
 =?iso-8859-1?Q?q6Ce20iXvC5OtOnit6AIVCnjpSzYkp7asDl7DL3bYCDP8NHtdEXdsUsp78?=
 =?iso-8859-1?Q?obLBN+JDUUiXlQZfjbFuq3SMUMLCZ7qoxJyoTc3L6D7Wmf6OvtUVB879mZ?=
 =?iso-8859-1?Q?kGypaXfozPJrCNdF07VP6XZu6cEZLpTNG/t9YjPWMN/8ZRYBH+hJgrumZb?=
 =?iso-8859-1?Q?15SlAvon0tPgFeuU5fmKW8vBhPJdD2X6bZKWC8Ih+Q7S8JIQRQhh6RI3jU?=
 =?iso-8859-1?Q?38N5Lh+lJJ3ISWyL2atEOl2H0WO6EPGbVV+MDT+xg3drNfHGxhkT9lFITP?=
 =?iso-8859-1?Q?avu2xLzFE+8ayHo87/RUAco9hNf9bj7c0KYueS4CEABtAdFPMsd9WbIDOP?=
 =?iso-8859-1?Q?SBSyJrxRRIVAxyWdwu+n/zZxkclpLGhqJcXyPaZuCnKUaMfM2WtTYMwfIT?=
 =?iso-8859-1?Q?uAneAY0QjkQ4GJlJ2ijDc454B/tj7LDRbTafKdXWpJQAWngX/6cshHaSEJ?=
 =?iso-8859-1?Q?psfbgADwo51ScVI4eBFMQdGS6gGKxnb7HarO70cO7Bo9aszBluCsIWXQnV?=
 =?iso-8859-1?Q?HsMjI8gZyt4ZnQU3e5QqTY+x82pRjN2ZgelU6L8SBk4jtJzjKLf3UqbzZS?=
 =?iso-8859-1?Q?IcBPgY/bvWQfwADDqq/bVnDgBH1FqUAMhHPZ+o1ZIjsuUMV+MOKGhMilPH?=
 =?iso-8859-1?Q?aKVDSdLerueGjChxQeh/kfMYfgQ+5KAegucH8Qk+FYcBUosH7bC1xUC0Rt?=
 =?iso-8859-1?Q?iQ4dsbhHWPpEugKTVRCMve5MNYiNow8uIHiFzMfaWUVgSlFQYhaf6nkRew?=
 =?iso-8859-1?Q?YuePnK+aBoODf7T5sJ2CFVJNjoJJ7LmWpXWLA0j+tJie6qy2j89nhmjfVk?=
 =?iso-8859-1?Q?+Q+bvhPrp4tNKlQrfATkM6G4HZ+YHS0bGBcUtQMDVD0oiibGATJJ+m5OSL?=
 =?iso-8859-1?Q?p3eQt3N9OYAuFb3mG0o/WyxS5kq7BacYJAv6db2L5CYox7Y3iSVzmIzmL+?=
 =?iso-8859-1?Q?Q++eCfyz3ZTFWOTicq05QNFXRv2kaVh8538wTe1EMgzklg7K7DjJw+EgPt?=
 =?iso-8859-1?Q?ze8SlKzHs9BGH+WQu6wfUKdF+mun1Y+3SHpVYsTa0qetpHd3GRdO177klu?=
 =?iso-8859-1?Q?H+KrDG3hi3wkfPTeZeo3Hq0g8mwpHc0kkDthlADX6m8vSuSxKfphU4cJZM?=
 =?iso-8859-1?Q?qv4RYRRm8zDj864on3zIJwhr4ygjj+g3qHSvWeQzRDOEk+y42URkvXsJoH?=
 =?iso-8859-1?Q?X0x6OWuC5C99fwiasCLRxEmCMNmp8Q6kqfdED0LRjlXrDkIfVBpObmiJh7?=
 =?iso-8859-1?Q?E8o+CGocPpzGw5I+HyiNuCrP/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yKxoqemhbUeYuu7XyFx//sgelIbWwhJq0Ec/FiLRMIRHB704gLWSM91wEF?=
 =?iso-8859-1?Q?ElvazNts+r7bopoM8c0P/vnw88fsCupggWtjT7yylk3o2vV1mbgz6qW37A?=
 =?iso-8859-1?Q?Zy8QN0VUppe4hRvlRr2QkN8eCh1cPHPGvkzF/N68oPdAangZXeTwvLYHvc?=
 =?iso-8859-1?Q?e4JlWtAHE+9HHZcbuXmvaMWz3ERKqCG14j4VSh6f+d8sFCWuyhVZqutEXk?=
 =?iso-8859-1?Q?F0hcpFcAdxNGHaCvinfBp114PBSIpvytfM8hhP7ZJvAteYUX+b+0aTFmqc?=
 =?iso-8859-1?Q?Pp3nGp2tfvRYzWT/CajoGqvFiDLPLO4erhflxFGJ2AmlP4sxJc91H15BHL?=
 =?iso-8859-1?Q?x2lNGBr60oZrLanDVQevtIHBNbI3fNSW1aXuJu7MQTkYWxW/V7pYbq+cbT?=
 =?iso-8859-1?Q?OjGjp+x7bH0Xe7YzyYK27dCVgMXNABn1JMeLw51kYHd9RrmE4/vv0ECpwW?=
 =?iso-8859-1?Q?008mgt4bVUV1lh8c43f9c6fEs+9ORgPlNM6yD72nuMjCsR0GJA941gkPkD?=
 =?iso-8859-1?Q?NlliCNzu9TEZfhQcL5IJ5ixUUGQ5R1BtY5hGoSekARfZivnBAivuYzf5kQ?=
 =?iso-8859-1?Q?1SmWuVvv8hXYoM3dZsi2S3Tu85wR2KUx9PwToG1/Hov04sSoXLrq+GCLXP?=
 =?iso-8859-1?Q?hZOImrjg1byKPp+WWe4Lc/xonggLC6KhbcJuMior+Dv3lKB2h3KM5V002+?=
 =?iso-8859-1?Q?fHH7XsaELyRMUXZ08Hc5Nq0O6+FIBkn+DOrxV2FbKYRxWfFWEPF4Rgf5Rm?=
 =?iso-8859-1?Q?MA1fKkLHISk1ecgjkVxFn5D3+FoZWptXGpXYPeaPICe1SGKMahKIZqFB2F?=
 =?iso-8859-1?Q?0998A03PN3bWkixeRWPHAo2sHT3qlTY1rbsWTvqxR2Sw+FQEyXtVw63Bgx?=
 =?iso-8859-1?Q?SNtoPRPIKCq7odjeU/39DzUKBFf/j3E/ZN6/h/cVivYiHq9xoo09Vhj/uN?=
 =?iso-8859-1?Q?r5iu+Pn355XpXiEEuFF5JHZWbExKBXdQPoTf7O9k/1649FfURcTOGeTzHb?=
 =?iso-8859-1?Q?xsWO+AEv8jFHP2ogClzyIX/avMhXBOtZhc+OvDBXEgf2NuHsiXj2qVMC26?=
 =?iso-8859-1?Q?rDlr0ZMBscYfpmMvTfU67d4ts7/XZMZygcsOJpRXISl4/bF2vScrOqlOao?=
 =?iso-8859-1?Q?NFkm2zTPxnhD/ijAJyt7KJ64JqwHMDjy2jBD6KpgkXTMofmzMzhlB2ou4i?=
 =?iso-8859-1?Q?ji5maghVW0TVvpxzafbcNj9cRrlV/K1l79djCUCHTd7ScaJRVliMO/QQnr?=
 =?iso-8859-1?Q?4iqcfDzjAFUgIMAmGqCNw13K6XlANglYc/LSO5ZSzGfzw1ExrjtC35gI8j?=
 =?iso-8859-1?Q?K53Qct7aH6ICk3oYHhSrntSS7fzGsvsNqX6n7CHgQQ+rbixlkGoxniD3hq?=
 =?iso-8859-1?Q?0o7ta2AkrYUCBLbAQzqOHq1i5WNW0zq1fDPHk2gQZ+/D5HCrH6ewS4p5ha?=
 =?iso-8859-1?Q?eOKFg4H/0X95Bju/996ErP6EcD/d0XRoaCU1K59+j/2Ky8fz3IAfCwy211?=
 =?iso-8859-1?Q?M4yYId0COZ2bGNFdQGYfjpt0VULFz3898kTm2XYnYpOjcHKK6i0Seakz03?=
 =?iso-8859-1?Q?JdcX7Jo+m5xyuNl3Zvj2rcdswvcH7khtmpVtCPa4a8uNEYdKjICiwJM6Ou?=
 =?iso-8859-1?Q?i8mM7VLpYXxwfL++dqrQY+QhjPQAHMdDObFZe/Q812QKM2EvGyi+nBoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6330e684-2a16-4c74-6088-08dd02ca2ee3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 03:29:15.1096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGop0NbGAiBWyLQ1Gatr2Mv6yc97ZVde1uPP6A6Rj2Ub66lBLUKZ1GBV2FTfoEWfanTn5JH5aDt+89/FtWy1pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Mon, Nov 11, 2024 at 02:42:02PM +0100, Christian König wrote:
> Am 09.11.24 um 18:29 schrieb Matthew Brost:
> > The motivation for this series comes from pending UMD submission work by
> > AMD [1], ARM [3], and the Xe team, who are also beginning to look at
> > this. Sima has suggested [4] some common driver preemptive fences and
> > semantics, which we all agree on. This is the first attempt to implement
> > them, based on Xe's existing long-running preemptive fences.
> > 
> > The semantics are fairly simple: preemptive fences attached to a
> > dma-resv must wait to enable signaling (and thus preempt device
> > execution) until all fences in other slots have been signaled. These
> > semantics are necessary to avoid deadlocks when preempting a device
> > while a user submission is pending, and resuming device execution
> > depends on the user submission completing. The semantics align with
> > Christian's view [5], which I also arrived at independently (with a
> > little help from Sima).
> 
> Ah! I was really wondering for a moment why you wanted to add a separate
> dma_resv usage for that. But I strongly think that this approach won't work.
> 
> The assumption that completion fences which depend on a preemption fence are
> always part of the same dma_resv object is most likely false in some cases.
> 
> At least for the AMD design what can easily happen is that we put a
> completion fence only into a drm_syncobj for explicit synchronization and
> then engines or different devices which still use kernel submissions depend
> on it. That can go boom really trivially.
> 
> What we do instead is to wait for the latest issued completion fence while
> holding a mutex to prevent creating new ones before stopping the threads and

wrt to a mutex...

A current code reference would be nice. I looked some of the code on
list and dma-fencing rules are broken...

e.g., This patch [1], takes 'uq_mgr->userq_mutex' in the dma fencing path.
This patch [2], takes 'uq_mgr->userq_mutex' and then dma-resv lock /
allocates memory. That is clearly not allowed.

Perhaps this is fixed in your current code base though.

[1] https://patchwork.freedesktop.org/patch/593210/?series=133345&rev=1
[2] https://patchwork.freedesktop.org/patch/593211/?series=133345&rev=1

> signaling the preemption fence.
>

Right, that works and is functionally equivalent to the intended purpose
here.

I left out a key detail: when a user fence is converted into a dma-fence
and exported in a syncobj or syncfile, it must also be installed in all
of the VM's dma-resv bookkeeping slots (i.e., in VM's dma-resv and all
extobj dma-resv mapped in the VM).

Before exporting a dma-fence, the VM must be validated + resumed, and
you must hold all dma-resv locks, so the above is trivial. If you're
using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
similarly simple call.

Now the ordering works inherently in dma-resv and the scheduler. e.g. No
need to track the last completion fences explictly in preempt fences.

I'm pretty sure if converted your code this solution it would work,
there are however a couple of bugs in this post which I have fixed.

This is a common solution based on existing components which I'd lean
towards rather than some new component.

Matt

> That code could of course be made some driver independent component.
> 
> Regards,
> Christian.
> 
> > 
> > Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
> > embedded base preemptive fence class with driver operations, and updates
> > to the scheduler to adhere to these semantics.
> > 
> > The current Xe long-running preemptive fences have been converted to the
> > new common code, and UMD submission is expected to follow (hopefully)
> > shortly thereafter in a subsequent series.
> > 
> > Not intended to be presented as the final solution, but rather to
> > kickstart serious discussions on this topic.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/113675/
> > [2] https://patchwork.freedesktop.org/series/114385/
> > [3] https://patchwork.freedesktop.org/series/137924/
> > [4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
> > [5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853
> > 
> > Matthew Brost (6):
> >    dma-resv: Add DMA_RESV_USAGE_PREEMPT
> >    drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
> >    dma-fence: Add dma_fence_preempt base class
> >    drm/sched: Teach scheduler about dma_fence_prempt type
> >    drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
> >    drm/xe: Use dma_fence_preempt base class
> > 
> >   drivers/dma-buf/Makefile                    |   2 +-
> >   drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
> >   drivers/dma-buf/dma-resv.c                  |  43 ++++++---
> >   drivers/dma-buf/st-dma-resv.c               |   2 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
> >   drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
> >   drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
> >   drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
> >   drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
> >   drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
> >   drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
> >   drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
> >   drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
> >   drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
> >   drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
> >   include/drm/gpu_scheduler.h                 |  15 +++
> >   include/linux/dma-fence-preempt.h           |  54 +++++++++++
> >   include/linux/dma-fence.h                   |   1 +
> >   include/linux/dma-resv.h                    |  24 +++--
> >   19 files changed, 326 insertions(+), 157 deletions(-)
> >   create mode 100644 drivers/dma-buf/dma-fence-preempt.c
> >   create mode 100644 include/linux/dma-fence-preempt.h
> > 
> 
