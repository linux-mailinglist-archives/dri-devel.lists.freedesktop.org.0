Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6538C759CC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2393110E794;
	Thu, 20 Nov 2025 17:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DF8k5xlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9A10E793;
 Thu, 20 Nov 2025 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763659299; x=1795195299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q4sHhwGppcD75osQcTvXxmYRRVISObbzZWdosbmBcDM=;
 b=DF8k5xlVmNReAPeY2DOpS9yHlhnlltdUN6ONCp04ohjr37CTj4D3eaDX
 OlIpCCNj+i5cGQF7Dtnl8P7PhdxDhOaRNRpdhSVwku864FQnk9x+T6ZTE
 ivWqYMZ6O9au+ytV+4gTMFZEhKNfzM8XpoNEGGAcA/oaogdItfv6MCjCz
 Ivx035jengaRATprJbYfu5mBORULtkvdNPv0Chvy7b7Bz3554sbxCeGj/
 YKmHpq2XHBjhy9hZGg2U/z6lkR0McDHxJmit/Z83gcz1xsA4fxx5uKrVj
 mMX0KmSRrd7/RgdLMVRWyw0vAP0sk/RHDo2g0wdlpdkC7FaKn/cdvwSzq A==;
X-CSE-ConnectionGUID: BDntz/rlS7u2pyVEnJLjqw==
X-CSE-MsgGUID: nyl5PSaKR965gdsu18J8BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64747264"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64747264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:21:39 -0800
X-CSE-ConnectionGUID: 2Rj8KproRaihv/+tlcHSUA==
X-CSE-MsgGUID: nNhYGJ2kShSu7Ui3kmIy2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="192222522"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:21:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:21:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:21:38 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bctxskmGg+arhXLNRBgvYG9GmJtiJs/VB2su3uqSc/Ul6Tt17e9TPhLtIEUWaicRwdz66OE/jVfn3in3/N6n/nzVCu6Aj2ami6f9uaVYNrCOyEG0y8fm/1AXJBTxCc04grR4cv7zm1aGNs82SovxJpokEgqslH9x7QrS+n2DvDkRQKcez4gBiCXj8hjcSUziNoxxFldiziMRW6VocMw/HSaEu3rWIPXEKvfuL/S+v5UJrXyZIkPLUrHBQea2DzEjkU8HKhks/d8pNQIHPLfIBHTxsAu+aiaCxfaGFL/uXSYIKU6zyoxyViNaswg6+PWoERTHXNqFqg5ZU+UeuoSc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EODCjZVGqYCMt8P1ITSsAfMvz/GELWsRlaVBwBWK8mE=;
 b=g6FPf2vBGXrARb0OV1Dr8dT8TVvECchMD7/T8Q0jcrULWqwbDgXz5HLKtLYJj0rYmayIJ5Srp9r0vzicnk0Oer+sQalM6eSa3n79pwLM7qlypqJZeZYgrQGouz1PoYvnpoj+LEQ8KwDNbgIV2Np1kJVqmVdvl0WIpotfPqgp4OeuqLYvMjEQrKVF/HWE7JcJIM9kQLfb2JIaVYZcXUyDj+XgAOK254HgWrnXGc/HpwfZHUpCc/ufLak0oZ13OsMAf6Y9te7UKkJ4R0bLX0RRzEgpboj1LgV5uxPK/IAfSzix/bWQ8FIdNt8i/CTk+60xDEx4lyl+jJBXobPA68PFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 17:21:31 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:21:31 +0000
Date: Thu, 20 Nov 2025 09:21:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 2/8] drm/sched: Add pending job list iterator
Message-ID: <aR9OGL8nXNg_rVgm@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-3-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ea16ef-dfca-414f-171c-08de28593ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AuGQFaYY6RG4awuyoFK56z6Ea7EI6C4dPxxSE5y+woFNkLRpO7OANPXxn4LJ?=
 =?us-ascii?Q?kzD1Ahvgaw/M2di53PfjTs9cxTPbLf2Ayc+D0sACPC4jxh1GS+lAADKLZ3An?=
 =?us-ascii?Q?ynSSg5BGSBLmvZat8k/7jZaxHZBVvxWM8bnJlkF8U/PxP4/9s0VIN5c/20Ip?=
 =?us-ascii?Q?E0nFKPQNMjAmLy2i9zbNqMajjWtinYeON1m4mL8a/gJLhB9u4dj+lgZ6ZtHO?=
 =?us-ascii?Q?NR7WONHtV6Cv9lhU6+6lLeav0r2Y/0cI6dGLnpwX2uOsp1BdLx+wKTuIlS5C?=
 =?us-ascii?Q?/IBw5refsFQq4n0p7fJKcIWXGYFrWyIhOsGL/ZUOdg+NXnBt1yBpvzfVdRw7?=
 =?us-ascii?Q?qCfZYeEpwdte1gjW+TqsFGVoyEsANSBLvtP03Gwq+BTVREGbGgku3LOwria1?=
 =?us-ascii?Q?UzhZv4+xeHusx8yPmkYwADNYjaqd1fDS6a201N0ybIA6NtzCoW+jfByqdvWc?=
 =?us-ascii?Q?DJc16nlp40WNTqjd4fZX6LKAWR+rMgDnHkS60YI7WgUxbFSFhfK4lVk1jWQL?=
 =?us-ascii?Q?P2zcX5eeDrJj/VkQEl1LW1zKoCNUZN/eWSu3IeyAb52TXzMNJuLwwajWPb/x?=
 =?us-ascii?Q?nt79njNMMXjddhCt4k+Fr5X6nbHB4p/zDccSjR2EnfIk7XAcDUVb9H+WnabB?=
 =?us-ascii?Q?9ZMfSyQZ6NIFXE3JNHW5uJvF2aTW8an3gpEmACkzXYM4lqUWregoZLGIernv?=
 =?us-ascii?Q?X6V0gPS5BYvgdHECWmeW+b538kiMtaWSpJYh7PQP4+Ice2oRISdlL8gn4JqJ?=
 =?us-ascii?Q?MjFKWqLiH+TUOuW+QbWh5AHngeYf+Y7J4Pa9IpFykYe1VUjTd47p7QrP7euP?=
 =?us-ascii?Q?BakhBel62Wwc6o3uz87XHT6X8qYeYLgf/LGvln1sQDUvkcKMsc/kG626/CkB?=
 =?us-ascii?Q?8/32wrL2kEG3VSl2maCqWNKl7JmZ+nPDkVY0d7sGJ1V87XxVJQVIXOeBJh6D?=
 =?us-ascii?Q?kxDhZfJOJMappzrq90lj4QoBgvGyhin1vlQczn7oR4s7KSyXPdgxi83fPzeC?=
 =?us-ascii?Q?5eoo+GVVN19mPR5gg3Ca+vVVRpJffIqe0SnInNTxvyllHawFR/pQOcBgIR9j?=
 =?us-ascii?Q?ZozkYxrY8DicaxdIYz4g3jedhiivzE4LPLtSTYeecxAjNzIcya8cLEuDk2L8?=
 =?us-ascii?Q?l9ZRZN/1BHSOgV9bNwNZ8HYUmDfmDQfA0klUCMLoVBl6BFTEph44UiHfp9qn?=
 =?us-ascii?Q?oyJpO5P/byvyfZRuDqpfpH7RyoT5hqBZ605z32xpmd+6EFMUgeYeks6PIWeJ?=
 =?us-ascii?Q?vEtne/eNpHUd5xh8Wg4DH4ABVc6dQVcHSlEAd1+gotB47EdFb1PFW3S5yPCr?=
 =?us-ascii?Q?e74Ul9RsHPAw78QaisODJco+2jTN15GqAAupb3pghTXxikPmJUenM8hI/64/?=
 =?us-ascii?Q?NXtP5zIh1Mvxj9PN+h7fROQUuhP5JwaU8OjHjj3RNNEmxqYeUFbD1ju7Foo9?=
 =?us-ascii?Q?WeQZlGC/U5QgIcKS8DYbMd84dMiMem9d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bK3HM/vdnwQXC0wUs13D5CQ7W0CY5pBM5Z2z36YMoh3bOPEKeBKzhwfhLywL?=
 =?us-ascii?Q?8ZqoQU5VQ2MknD+ofvKGlKoKlQNI08lddonT9S783l+cCq7ShWWRVe7pfFys?=
 =?us-ascii?Q?R/nsivxs1RSTfCePNIhJV2phkIBXhBnhjh7skjDLh3MD2k8za7eTdg+XG4EY?=
 =?us-ascii?Q?Xr9DxnQEccCq6+0vbf0SoSnaUAV/9k6QPtOVNYiIXuduNxt6o4KkolNMlMgz?=
 =?us-ascii?Q?9C1xZB/DPCmx7tJAQgyLC77H/41+zg3vBcQJIpaK7VjB0P/gnL28wzSjB1Lf?=
 =?us-ascii?Q?Hyjti7zJ+yiEKkt6gwAzMyNCY69Ldvamx42ou+A54YKhmCIUIEGJYwnrNUSw?=
 =?us-ascii?Q?dMy5ezl0vf2CUGegGnaYf1hsqu3OTOg4X+v2GV6VB2Ei/my+kso43Ieo/Ja/?=
 =?us-ascii?Q?PDIymRj6T32tdHu5JuEMQrVoV+K1773txFR1AQ/BIX1rjtMCn1AvrYDAlPvf?=
 =?us-ascii?Q?14tMQWx6UXntckBh9l2+fhyNKosRHBUzinWiZLhPFTxifNzHHF9RjXKJOS3X?=
 =?us-ascii?Q?xK9f/9iUqlUBsJSkpMU16Npg4858EoUVMOHttqnlWfnpjA39vxTPM79SJnn4?=
 =?us-ascii?Q?fGZAWMylkWkIDxiXMyDWRliii/tA3nNa8zz1YJZbke/9tkq6kOba2D453Sqj?=
 =?us-ascii?Q?eB/LkbEeiIvFZfCzM2UHJrfHPRRupG7LAl7A2weSfW7/IRmWTKRTAhqxdgYo?=
 =?us-ascii?Q?FLLcAqmzcKxiLY+O/2qGL69LzsYF3jnXE4RsF55GnA/xAUxfmir2Vvizz1dY?=
 =?us-ascii?Q?RwjWSRGZugjTyVcy+dItA2XyDQ7Ag7n01uUB9HHuSnpxcCHM2AKmiu4muP2V?=
 =?us-ascii?Q?6mtDSChBkBUKSaLvkGO40RvTd7v220jFoiHJr14pmgl2U+sCEL1jL20hQH7Y?=
 =?us-ascii?Q?aPyfTdIvjL1diin45z107QO8h1RzFWR4NwctMx40nVhooFinEwyx9vaSyJ2T?=
 =?us-ascii?Q?U1+Q04fxcqmrC4a/w9/wjxZ1nm7uNKO2lp8CMQS7BXC+VbGcPpNuLDkhRbo2?=
 =?us-ascii?Q?gAHJlU7DIyrP3FxRi5fn9yeGv/W/5HBRo9fQipNbDHJmeP5YTliClN0vs3WO?=
 =?us-ascii?Q?NsbBaGk2MyKLeLpGEE8LrUwjguWOcxEcdrA/VNuMIhuuLEbdjbzvKqJL6+ej?=
 =?us-ascii?Q?QiO0lAqx2YJbDbho2uHlqw8rxknBAsp3ES5KOaOkOatRV/ojwbXxWK9cw0hU?=
 =?us-ascii?Q?ojn3gaLpynxP+V7Ti/mVESII/ooDHtjHJiAyuBORQbDBvrzu7KU3xj3VFPeU?=
 =?us-ascii?Q?1eSO0F8F1TLN/TpWTFSDKRkHr413g/MyRCNI02Enxmukkv7H0FI13qj/yCvO?=
 =?us-ascii?Q?2ZwcWjHXTi71uYuep7t4ZBR5thbBW0cjeB3ZLYaVTI+PQrRxatZEwM0pBeAV?=
 =?us-ascii?Q?AJ1RpjIj4Kab6x/igi1jkKKRna+gNmohKxCD7ToHz7zxr9jhO0YKpBQ//Mn1?=
 =?us-ascii?Q?uMDOMNIonLU83KyExBzNtJ1AqZ4gJbC3fn8tawfxFlZbOj/mnxhafk/WvpEc?=
 =?us-ascii?Q?53cEIzFdSBjVzAN/aLlRy84Zquw/kQUjuPFO8RuDJ2E5rv+GZZ9QRvsCe2mV?=
 =?us-ascii?Q?8/lHKXa6OfDPytlrjmPknk7/uWLbGehIDJxBmDkmByEHl4VVJEvqyg6jQkrR?=
 =?us-ascii?Q?jQJhhm/4p69899vaS1bdWAs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ea16ef-dfca-414f-171c-08de28593ef7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:21:31.0888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwSIymgPFQy0ufjda0hB7JGIF4ndnrlXDDe+gfgd9Xn38rrW0rQKNl8TZcgL9ZjxAqgMtLoTH0Z65Ec/UcbAQfZ8UXJRcnq6BR0Vw6ujyq70qGgkntHWJBQvq+k9Rkmj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

On Wed, Nov 19, 2025 at 02:41:00PM -0800, Matthew Brost wrote:
>Stop open coding pending job list in drivers. Add pending job list
>iterator which safely walks DRM scheduler list asserting DRM scheduler
>is stopped.
>
>v2:
> - Fix checkpatch (CI)
>v3:
> - Drop locked version (Christian)
>v4:
> - Reorder patch (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> include/drm/gpu_scheduler.h | 50 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>
>diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>index 385bf34e76fe..9d228513d06c 100644
>--- a/include/drm/gpu_scheduler.h
>+++ b/include/drm/gpu_scheduler.h
>@@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
> 		dma_fence_is_signaled(&s_fence->finished);
> }
>
>+/**
>+ * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
>+ * @sched: DRM scheduler associated with pending job iterator
>+ */
>+struct drm_sched_pending_job_iter {
>+	struct drm_gpu_scheduler *sched;
>+};
>+
>+/* Drivers should never call this directly */
>+static inline struct drm_sched_pending_job_iter
>+__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
>+{
>+	struct drm_sched_pending_job_iter iter = {
>+		.sched = sched,
>+	};
>+
>+	WARN_ON(!drm_sched_is_stopped(sched));
>+	return iter;
>+}
>+
>+/* Drivers should never call this directly */
>+static inline void
>+__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
>+{
>+	WARN_ON(!drm_sched_is_stopped(iter.sched));
>+}
>+
>+DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
>+	     __drm_sched_pending_job_iter_end(_T),
>+	     __drm_sched_pending_job_iter_begin(__sched),
>+	     struct drm_gpu_scheduler *__sched);
>+static inline void *
>+class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
>+{ return _T; }
>+#define class_drm_sched_pending_job_iter_is_conditional false
>+
>+/**
>+ * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
>+ * @__job: Current pending job being iterated over
>+ * @__sched: DRM scheduler to iterate over pending jobs
>+ * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
>+ *
>+ * Iterator for each pending job in scheduler, filtering on an entity, and
>+ * enforcing scheduler is fully stopped
>+ */
>+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
>+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
>+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
>+			for_each_if(!(__entity) || (__job)->entity == (__entity))
>+
> #endif
>-- 
>2.34.1
>
