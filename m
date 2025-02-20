Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04130A3E583
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4610E0F6;
	Thu, 20 Feb 2025 20:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJpuhh40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986DF10E0F6;
 Thu, 20 Feb 2025 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740081787; x=1771617787;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NqN59lj7nxO110JQFxVnQhVuDsFLGsUVpBc3WEyAmAc=;
 b=cJpuhh40kXQ/2fHCgSWwmqYPSUF/wg47SrkTtduNY11VV5cGLXA0HAMw
 UaJR5aK3cAPV/3ri1yc7uQIdMYSNG1O2XliL27lVwVxfCVRRQR32+3r0C
 ydpnndYeh4g0CpTFiKKxRVQYh2O5dZmJbDdzBC08g/6asLM8nrke2Ntno
 Pl7rIzuhSa9GC1oNtC0r+1hpCmIdweeRGVRmO7zmK1rF0a7xalAG69fbb
 gbdJqqp+1ggEMqylfyONk2EKN1z0vKQsF0nqb1P95Iir7hBCa1Kfx+jVZ
 65IhossrS7vV8yLTuTqzSE1vsMYNPhC6AeF3B1bf5k6G5HPE5poQULRUz g==;
X-CSE-ConnectionGUID: zD5K8d20SaixojWt12VNVg==
X-CSE-MsgGUID: EkEMAVstRTKiq+An73BYXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51525078"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="51525078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:02:51 -0800
X-CSE-ConnectionGUID: b/EdggOyQtylkGqB7ixIpw==
X-CSE-MsgGUID: V7mP5kY0S6iBlAbxn4ZFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="120261260"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 12:02:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 12:02:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 12:02:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 12:02:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmHU3QRYDAR0KIpHunB1E7g5ZNGgIv0/6SVJTvfzFEjjEXUeHekh08gcmCoQFMTzhAXuk79pD5HlHyLZEGEmS4n8X9dJ3OgDE6hJUyRocabCHEfvKZi9gGAyLSBEV5nk6qFd1jmAygXjUrk44OJRwl3PEC+zAjVOW6Y9ckh3aUgYGLjeiAzBgx1dMe/pxPbv8YE6cVMHj6RNZENt0JF2UGxbdJdhWZB5tGTbcEnMGZ9D37gItcnL09kUu4r+WEHXk8tE3TmTY6l5RjtcrnMK/1JBU1WryQ3vciH7se62RVuM1+/z4qB2Hc89O5J3S8aefrJFNO8WAu6MGzQivHIJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChjOcGTQgsgBexFM20Feqvivah3iN39aUF2eDFXdhh4=;
 b=t3yc2ZcC4Pee4+mdHRRpOSlugpYmBTD/+QvPmfih+bbzdKwFXmaRYnroc3DJruINUFsbUMhqjACKTxjcSfgZjLBZlihPviC1y7GvFVMwoSsCyBNGAKCZbPm3rXdJ5NlWz04Qf3/UxscDYAFr6vsolc5iKWxB0QXfQPwN89KCxykoeKrWj7gmZQBJNQP1HqgbnMaxsvmPthBmFDceYRwrXgGLzhb00hEXzzbMMMf1Hpl+j4WTOnJORNut9ksVmmF4xOjQpLCoDM0Jbkk865DVtnizj9StK5l542zXlYXwnoQL1YZ/P4idW+FzOQFtV7nFfx9a3upmJutYF9DIVIKM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 20:02:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 20:02:43 +0000
Date: Thu, 20 Feb 2025 12:03:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>, "Harry (Hyeonggon) Yoo"
 <42.hyeyoo@gmail.com>, Byungchul Park <byungchul@sk.com>
Subject: Re: [PATCH v5 03/32] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Z7eKohyglFCIxSio@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-4-matthew.brost@intel.com>
 <2dcef9ea-f204-437c-bd28-c84a8ab5b2fa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dcef9ea-f204-437c-bd28-c84a8ab5b2fa@intel.com>
X-ClientProxiedBy: MW2PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:907:1::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 83aee038-cce4-4815-392f-08dd51e989b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GOMzg41Vkxp7XImdnZZOXmKSbSo5woJgTJDELB3dkuHKB6/13hXVpxKqEJ?=
 =?iso-8859-1?Q?pe+8TSdpuPe3UlVaZOEEeYH2C/HrTkO1osSOsvjZpYKwm2bNC63cLmA+bD?=
 =?iso-8859-1?Q?Pi9n7olu78snXK6aDvnpO5Ne/OZeySAt/itavW6Je5XXg5rb/dazKCcyNp?=
 =?iso-8859-1?Q?xtgiYHTKRrDA19nJ1GkD6V1z1lBkuKYjxFRerPscSGnzGiiJV8XVSU0qUA?=
 =?iso-8859-1?Q?R2V9KZ9rmRmLDb0XRsqlKJc6Etqb/vhG+eiYkFWTNJ7jLZPNHpAYkcWNFw?=
 =?iso-8859-1?Q?GI88C1PdDPvcZaOROu+37SBOHZ38wJNlhAVsOrKDIMhRyvx9CZ8c4akKiQ?=
 =?iso-8859-1?Q?txU3yME0ztmsXe6vLr16ovFTDN/lfmzmeI3od48co963d05nRFXsfRK6rv?=
 =?iso-8859-1?Q?RE5y3T28Bs+l3WVVT1NTpSbhho5qs+pjqAePrQJM1df1jl6gGwv/skd/iH?=
 =?iso-8859-1?Q?F2vDsjr2xvCOOsPR404KO7yfboIGMm5vXYY5RIoDxl0eVxAwimvWkxtShn?=
 =?iso-8859-1?Q?KXuad9AMJRvzHwDQfIvYUeVuKCpuh8hnSUVKPKLnpQwFq+AuZmP33sIKxI?=
 =?iso-8859-1?Q?U6X0mU22nlukySyhQA0Yn7s0PYth9D8VFcuSZ1WWT3mHeR5Db57Bm26Xu8?=
 =?iso-8859-1?Q?LYEPpeELaR1rJIE/I4tv2UiWjQaWcfBj8kLhcZGmG87I0z3N4b8wK18b1L?=
 =?iso-8859-1?Q?KkyWAva2++lfLRM6wSOhwMfM9977HUL1oLTBQY1qaCIbf5umFuDqL6bwCn?=
 =?iso-8859-1?Q?Om8NO12Gj/R8STsPw+MzHzLGVRqYxAhQzNCEbnnA5757fPjo7/Qzq9n+pH?=
 =?iso-8859-1?Q?0JnzsCNOfixNp1RQ6ATbq2dZiD7FGrtDUAaYqeLQUwADy9P7J/5n8U/aJ/?=
 =?iso-8859-1?Q?1ZBcVls7WjuW+2ul/gexPeK8WRuJzDQxAt0BPrwD4BBno9QLqU3FKqChcw?=
 =?iso-8859-1?Q?3s7lyfW4tD1m6D/6hNZWa7jO+RXYOWY51H27oEKmH+0CWB/gDzHWn1SOq+?=
 =?iso-8859-1?Q?AofNP9Gx33mBe7UmhuF8QMAL8JLbNLO+1RM/jVbwewC8Qtu+YHgQ1nEqrS?=
 =?iso-8859-1?Q?vt9psCBtzSnfbUXk/U0n05VivVeaOShKo6Dq4dxqwL3x8oo2hdHttBarel?=
 =?iso-8859-1?Q?u7sgjniWTNnf+RbSfCzh9mxGhH7qJdsSf+21+C95VjTm423Hbdw6YH8mYD?=
 =?iso-8859-1?Q?AFw1YAsnOuoixwQk5XULO1eAG41svXRnYEfSM2f2UiWm0X7yA2Vgcb4BV5?=
 =?iso-8859-1?Q?K6ZASISftq3pQseUNAcT7VztyXoznnJXAlnJtgBlhI+B9sGEKYUezUm/eI?=
 =?iso-8859-1?Q?D0FTeyd/oe879/q7UPHcSC/PsMVLqRsGFnIeM5z7ytU/zFeHnQuE1jdFyK?=
 =?iso-8859-1?Q?oHZmRXZXeXO2ZXgFzWvYkc2ICfBIX9pS2rw+GUGPM4CmxpqFrye3kI0Qpe?=
 =?iso-8859-1?Q?4gSz7iSjRdFLkZAU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BS1JWdlnVTFD6FBJpdkWp9beFu9u2gcDZYM8Ewo9yYZhxRP+4XqVnfx4W2?=
 =?iso-8859-1?Q?X54lxZh4D0zhnaEBc1uVBVBs3PVoa2kMzOAFTBB9z7iVeBR4dcrUzNkJOn?=
 =?iso-8859-1?Q?RSnN417+ORYk+ZdTGqlyI4rD0HiNuIfgie7ITKurQUC0JU6K6HcGCyedtS?=
 =?iso-8859-1?Q?HhAyh3TAmGSOoiFlkDBCGRvxSkLovMM/ShkXyyNidbRFshSPKsGgQ4e5A+?=
 =?iso-8859-1?Q?9KGBxdp5gBTjJwQkU/8Tpddfbl27SRiYXeU3lwewL5s9IBbIQqPNufgGgH?=
 =?iso-8859-1?Q?rIqM5ZvVGugdk53gB1/df7VPDeC5lcGb0gTMpCispFT1HK2s600RCvbdBG?=
 =?iso-8859-1?Q?+7O+c6DF2QyYnUM1atZ8olbNcHfgy80SiRUyJL6mNGWClTTHnmwE01KApa?=
 =?iso-8859-1?Q?noSKjTfqjilzpmtiil3WQUODMEZ4N3Qkd9HMvWNBfn1eCtkf/bqefrF1uV?=
 =?iso-8859-1?Q?0oHXXtX31dnvg8gSQTsWHgHIFj/p+mjwr7WjI2Lia253S+iPLdnHOkPWwi?=
 =?iso-8859-1?Q?G/9Z7mm6eL0g+NsRLtPzyCG31PA74VpIHKKb/Go2Jnr7VyU/qOmjQRqhTd?=
 =?iso-8859-1?Q?n0fG0KXYbbhoWBhglTS6TGpgbEiANp1gUcWdKSvifRjACIejan+sHSdjkR?=
 =?iso-8859-1?Q?p3EAjIddErQf9Sxnpm5tmgGJUYJargBVF9Zomj8SMc458eIc0XXwPbndIA?=
 =?iso-8859-1?Q?d4bnVW3usyt3BdpYOOWwDf9xBBULo48eHYylj1vVbfKwB92tDv2tOxmMBL?=
 =?iso-8859-1?Q?CyGl2YjI/S+7pn+Wcht551e0QdcJ2nBb4BMcjcoSJ925DMQswEw9ts4L8B?=
 =?iso-8859-1?Q?DMo7xERDr7QC+izTITh+hBYFaB96nl9Hw8KtPtjHhVaz0E+qAU6RFuUI+E?=
 =?iso-8859-1?Q?MeFNP6+zpI0/iDMXLikMmMxvVKAJx0ql0/r84vi+tdjxvnknMH65A9UGwF?=
 =?iso-8859-1?Q?831vBapf2lDAAf2dfjFiX7ewbKehcNijmXI1+O4XSfHJol0KOrSnLeBH/h?=
 =?iso-8859-1?Q?VgR6pf4d5DLsTa9HYNPrqx8oPoq44Tp01Bc5LuCvPJ/5RZj1Kqb6PjE0LH?=
 =?iso-8859-1?Q?mtWIyKsPO7te2xQwfQVq0NqsFcjDYgXozaq+3SxNHXzCG6mnBJSDICbILH?=
 =?iso-8859-1?Q?1s0i5z0yG3l2Jd7nxYeiqUyLtaAGcY5U1zvPBeUBhmuKzATSADbzbyZfv2?=
 =?iso-8859-1?Q?JnIsDBRRQ5q0+geKIbG9H7bN6gWO8S4Z59zjagStxVNqR7CLesCqfHXdFf?=
 =?iso-8859-1?Q?rp4Uszps5+wVcAvyxQv4eyh2eFkkTIx2fgXyH3g38AR9MeZfKLpjBvJ9b2?=
 =?iso-8859-1?Q?hr0BVBUhMWdu9/n7FJtgNA60OMqb97DiTpxQnKniYGjgJtkNJI0oKvRX4A?=
 =?iso-8859-1?Q?iTdkOKakNQKOKwlToxHy55LL2mcUBoo1ivU+1m73pydfPXH194ytkHD82j?=
 =?iso-8859-1?Q?+bGwuBpXgZlEMbhFMynexH8SiuhUm7FfN2CX6u5hkQL5+vzztrJAbMh+ly?=
 =?iso-8859-1?Q?cuR4H8a0pWfnQLgqmvgY2qM0sIxAxGiOrckrGtN+Io8a95qdzn1OszGT5l?=
 =?iso-8859-1?Q?QJmGeKcTIiIGX7NlTocLENohzDVKsNQXJRJ9lrU7t/1nt+KiTxQ89JS6eK?=
 =?iso-8859-1?Q?xrLEP1b22uo2b0rJ8ypzSS0QkqwOCcUQurWGLz3W6M59N+2JZdQl+OZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83aee038-cce4-4815-392f-08dd51e989b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 20:02:43.7562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdgxiwHbAgKYwPMCiBS6soaHeClu6VMia0A+Cmv0E0YDjII/9kX5VAHGBTMKjQWFeLkFcEdRUSa9Ca7wqpORuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Thu, Feb 20, 2025 at 03:28:23PM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 2/13/25 4:10 AM, Matthew Brost wrote:
> > Avoid multiple CPU page faults to the same device page racing by trying
> > to lock the page in do_swap_page before taking an extra reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page being locked in
> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > locking the fault_page argument.
> > 
> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> > 
> > v3:
> >   - Put page after unlocking page (Alistair)
> >   - Warn on spliting a TPH which is fault page (Alistair)
> >   - Warn on dst page == fault page (Alistair)
> > 
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   mm/memory.c         | 13 ++++++---
> >   mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
> >   2 files changed, 55 insertions(+), 22 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 539c0f7c6d54..1e010c5d67bc 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4337,10 +4337,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >   			 * Get a page reference while we know the page can't be
> >   			 * freed.
> >   			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> As a minor point, mm core suggests using folio rather than page and
> folio_trylock() rather than trylock_page(). Is there a reason why page is
> preferred over folio here?

Device pages are currently never compound so page lock == folio lock. If
/ when this eventually change, then yea we'd need the folio lock. Given
this existing code operates on pages, I went with that. Ofc we could
change this to folio opertaions to future proof this.

> > +				get_page(vmf->page);
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> This makes the internal locks that migrate_to_ram() can hold depend on page

Yes is / was a concern. I think the trylock here avoids any possible
locking inversions. Another concern is migrate_to_ram certainly
allocates memory under this page lock but since device pages cannot be
reclaimed this also is a non-issue, at least that is what Thomas and I
reasoned.

> lock. Would it be better to do fine-grained page lock when necessary to
> prepare for locking issues that may arise later?
> What are the advantages of using a holding large-scale lock  here rather
> than worrying about lock dependencies?
> 

I'm not following most of the rest of the comments here, wrt to
fine-grained / large-scale locking.

Matt

> Br,
> 
> G.G.
> > +				unlock_page(vmf->page);
> > +				put_page(vmf->page);
> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >   		} else if (is_hwpoison_entry(entry)) {
> >   			ret = VM_FAULT_HWPOISON;
> >   		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 19960743f927..3470357d9bae 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   				   struct mm_walk *walk)
> >   {
> >   	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >   	struct vm_area_struct *vma = walk->vma;
> >   	struct mm_struct *mm = vma->vm_mm;
> >   	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   			folio_get(folio);
> >   			spin_unlock(ptl);
> > +			/* FIXME support THP */
> > +			if (WARN_ON_ONCE(fault_folio == folio))
> > +				return migrate_vma_collect_skip(start, end,
> > +								walk);
> >   			if (unlikely(!folio_trylock(folio)))
> >   				return migrate_vma_collect_skip(start, end,
> >   								walk);
> >   			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >   			folio_put(folio);
> >   			if (ret)
> >   				return migrate_vma_collect_skip(start, end,
> > @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   		 * optimisation to avoid walking the rmap later with
> >   		 * try_to_migrate().
> >   		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >   			bool anon_exclusive;
> >   			pte_t swp_pte;
> > @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >   				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >   					set_pte_at(mm, addr, ptep, pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >   					folio_put(folio);
> >   					mpfn = 0;
> >   					goto next;
> > @@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >   					  unsigned long npages,
> >   					  struct page *fault_page)
> >   {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >   	unsigned long i, restore = 0;
> >   	bool allow_drain = true;
> >   	unsigned long unmapped = 0;
> > @@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >   		remove_migration_ptes(folio, folio, 0);
> >   		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >   		folio_put(folio);
> >   		restore--;
> >   	}
> > @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >   		return -EINVAL;
> >   	if (args->fault_page && !is_device_private_page(args->fault_page))
> >   		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >   	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >   	args->cpages = 0;
> > @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >   }
> >   EXPORT_SYMBOL(migrate_vma_pages);
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration entries.
> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >   {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >   	unsigned long i;
> >   	for (i = 0; i < npages; i++) {
> > @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >   		if (!page) {
> >   			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >   				folio_unlock(dst);
> >   				folio_put(dst);
> >   			}
> > @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >   		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >   			if (dst) {
> > +				WARN_ON_ONCE(fault_folio == dst);
> >   				folio_unlock(dst);
> >   				folio_put(dst);
> >   			}
> > @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >   		}
> >   		remove_migration_ptes(src, dst, 0);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >   		if (folio_is_zone_device(src))
> >   			folio_put(src);
> > @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >   			folio_putback_lru(src);
> >   		if (dst != src) {
> > +			WARN_ON_ONCE(fault_folio == dst);
> >   			folio_unlock(dst);
> >   			if (folio_is_zone_device(dst))
> >   				folio_put(dst);
> > @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >   		}
> >   	}
> >   }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration entries.
> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > +}
> >   EXPORT_SYMBOL(migrate_device_finalize);
> >   /**
> > @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >    */
> >   void migrate_vma_finalize(struct migrate_vma *migrate)
> >   {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >   }
> >   EXPORT_SYMBOL(migrate_vma_finalize);
> 
