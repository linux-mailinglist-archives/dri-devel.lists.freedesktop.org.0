Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83998A2233B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 18:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7893110E131;
	Wed, 29 Jan 2025 17:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNnhqokq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5C310E850;
 Wed, 29 Jan 2025 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738172520; x=1769708520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j8Ud8fFbdt6wWEwDVX+o+FuPodjm8+AL8/CHOOyq90w=;
 b=QNnhqokqF5txx/nqB27EMZULH4Bp36eb5iq991w/BX7JuLLAtSLAP6yx
 N3rPZ0V927YnuQdGKy+2FKOFHtugDlbW4Fz6eH5/o52zCC9tozZN2hcS4
 fatuzUdM/lsXdtcbZHC8+yRLeF/OThi4uxPBNum7qGesR8h3ZwXkFrNYV
 ZcjnYvUrCE7yH8zYY99iwfr3rWzujondJNSqBbo615bD8Ugm5W+sJ1xxc
 753HfIlTDHt64766/3sr42QxzEIDktrg3QR7+Fhs5DW8/ZqIzSaUQEBcf
 eej6QVFulBFv1buMtxVYa2ltZT4A2msnOFMrcCLVyoX5EK4s8vtBO9kPI w==;
X-CSE-ConnectionGUID: rYbCoWAqRCG9bnEISR29xg==
X-CSE-MsgGUID: MHlp4JBzQU6Zzdgr5kTV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="50085178"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="50085178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:41:59 -0800
X-CSE-ConnectionGUID: tJh2Ck4DRXu1rg3N6pG80A==
X-CSE-MsgGUID: wolZudeITw6DuPIwXJE5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132361602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 09:41:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 09:41:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 09:41:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 09:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP4Ka9LRMZicl2zB44o62GgArkAsFSHIFqB8xqBSkIjZ0bfXnppkXkFEvLpTRcn8GT/aUeKLFtbI1toCmcLDy7jVHDCoxox7vp/nJeB/sO7V51Zjopsm+HCJ29iT4GiOvX7GlBsju0ifEaTGRkHFmG2WXIUBxXTIOqX/pMIssTOIljshkjlSeDTr5Y+sZbDXkKnxJ1zE+ZKcE41LcJPyLb9QdcOXiLGoxz8VcNKJ5t11fCt7IaSGhqYNCx8vDQWgrP6hC3Qr8I4GRpWFQqJTu0XDmQlI/Molxq2Gr2Id4DZxgM8LU/KwWW7+X/tFnsfWqHzRrl9enSeY3v9gOsQ+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+9IjNOEg0tMO8uIVs4HsSUJCaxajMkkVu4ByXiDLIc=;
 b=ocBzHYVVuFRMqcHuiedaFfgfhDHdTAfs4VhxCQp6jmu7Kd0PCOGZi2pFU0kHLIpkOuEsx8mJSm/CGeSofmeuvpFCd4x1PYvIYkMOi78FYt293yZwampwlUsL6YD+CRuXsiS12DOfp7FO0wjeJjicxK7eqFfz2wDyvsqlFPgBeVGSvc+pUvzUwcLB3aRn0THAT6HFll7/W/ri5E9F37YEpUVlOYgkdtYvvZxCKyAXWHg30fqa7nUFZQ7E6f0Rl/dpnh7XC0f2iMZcX+C0p7528oFUAceUaK2u6QZclO7D2tpiPZy3NT6iqiS85iH/6rijv7qIVPiRpsixB8rAmq6SJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 17:41:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 17:41:52 +0000
Date: Wed, 29 Jan 2025 09:42:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 04/30] drm/pagemap: Add DRM pagemap
Message-ID: <Z5pomAkrOxRUMH+B@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-5-matthew.brost@intel.com>
 <65d526d9-0c9c-41e7-98b1-5e158dc5754e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d526d9-0c9c-41e7-98b1-5e158dc5754e@intel.com>
X-ClientProxiedBy: MW4PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:303:83::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8c1be8-91b8-4f75-2299-08dd408c3732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Au09KogYIpVzWnhbQkU7Pq5daqYANCEPjHs2HehkzI+A8AQHx43WgTXzOM?=
 =?iso-8859-1?Q?SRu4jqQwhT9zg5ZNOsONZcQjOyiZttcwcMrrC3J/GEuh3ckExKPx+NSzeU?=
 =?iso-8859-1?Q?2fs0mmbyMSGgR74fbuw/wYl0p1HKtPE3Bfk1K7nU6MJEJwwLWXhkGiatSr?=
 =?iso-8859-1?Q?HxoAyD7dVynOU46TGLEUn0fNCIzr/6qUnfkvEw0bW7idE+4U5mMHODIA/x?=
 =?iso-8859-1?Q?jHM+Qy+RDyRj126Ks9xvsSLvdj3HkwNy0bx21vKOEql/FKtJYAgQbZ/NZg?=
 =?iso-8859-1?Q?tnAH4s65ilMdNEqHZz71Oy86j/W2ymXWIqqurtJ2gmng0tdoaoDOCCjYlT?=
 =?iso-8859-1?Q?rHNxqhIqfLejeOAI2xV8V7x8Xdlz25sYywURhSCtPLtHTfnoy3EFmim9DG?=
 =?iso-8859-1?Q?8ouhQ4FKLDvLBCaZhplOwg3mB7bo+RIpi0rsuSzOcl4Zm2ZVotS9AzIEan?=
 =?iso-8859-1?Q?N1oIeZfXj57EQAVngA3/Fm+0N5C4iA7c7SM+Ehn0ghvnwyAceIHFpvWior?=
 =?iso-8859-1?Q?jNGhKvw3S3JnRo5ihSS3DyQ73CFNqszqKGPnjyTLiWWoACdOjttkeZ11as?=
 =?iso-8859-1?Q?WtSCNlywToWjHQ9Mz4ZEPabBhrK8yIhbxrJkoHEW/LpwQN5NtdVl2aIju7?=
 =?iso-8859-1?Q?AUPUVU36JFHgZPXfaQdazJJ+xcJ9cnNMMnXeCTeGqwFLcNBj3ySMUD5bAj?=
 =?iso-8859-1?Q?dWiCVf01SOAQ+jteQ7fD8tEb2i8HdCJ7kqOSSKydyfmrR4V/GiJG522gTg?=
 =?iso-8859-1?Q?C3bEwy0gJUPcZ9QJfcJ4vbbMsiyggsC202vx566/GQbFGMLII197/fdihe?=
 =?iso-8859-1?Q?iqy6LYErdbxd8f4mIwvBR3llwcW6le8Pg0znamSheTuqMrZH3b+jOBQYA5?=
 =?iso-8859-1?Q?bF5czmlmFJmUPbWdIzhEROXmS1yS0rhbvbcnBsErRw3abpgeNsnz3ZNT3p?=
 =?iso-8859-1?Q?1oo0S/pnIvHOSmftD2PY/wD0l0dpD3e0YXYWtUNhA/tXqvP4YNBFLgqjXf?=
 =?iso-8859-1?Q?Ayw2RtgAEZBCRBIw9FY4ezjy5OJS2GkdiG6Ryvv7tGY6871r2cAREyAnX+?=
 =?iso-8859-1?Q?f817FHHWDA45pvioA0E73WWUUaXzYSHTDN53HequaK4Ua5U2hz3FyK1lwQ?=
 =?iso-8859-1?Q?ekEfkhq4PDCdiyDTBY73sXLrVgZbaSBcxJ3bUFgxDXpCiJqKP9c4uXXvUC?=
 =?iso-8859-1?Q?ODNzX4hGThp9dt/3838TFn5KyGZ3dh3Z0j5pM7dsNN80OLfr7+2KCiSGfs?=
 =?iso-8859-1?Q?wA0U6c3Y7uM3vVGVWbG+9aDk7FOk+sabNCn8wvJ0mV97Wy8Zk6s9zdv03Q?=
 =?iso-8859-1?Q?7hgv1gGqxkDdUzz3WH8caOywXtz36ZcoGU4zi8acZIIV2DP2nZpkTD9pcE?=
 =?iso-8859-1?Q?Qqgw9s5pdyhJX2i6DPl7smcIepVFv6BKsXrzrgSj7YyMmnRZ4VizZiuRQr?=
 =?iso-8859-1?Q?EdiBxjg97mLdHmFs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/B9kqir+tWTzelDEr8MfBhFJH1npOxpfvfyw+N9Gao0lyVT3vLVuEuRzok?=
 =?iso-8859-1?Q?AxyaGeSRNRV5h4YuQbvd/fifZ5/+Ois+d0h1NFFSFSrwdN1w/KJ56SOGzc?=
 =?iso-8859-1?Q?GxeNYWH1zB0CYhix5HZ4JtdZ1DtMsOpS6qF8Gf9PksBU81Bu3iRs05I96j?=
 =?iso-8859-1?Q?xFgBVp2xDGf5h91LmJXulQBHPJJiOUqQjF226y80Iy4o5LX708VFZqwM42?=
 =?iso-8859-1?Q?o8S3hZuHMTrQz29X/dIbSmpHPddXGoRP1bZXqWvjJIKyf9Ng4oWUYxEe0Y?=
 =?iso-8859-1?Q?Kt4kOY+SN8cSbq5n7SxhlYD5oCr833nIvOt/+Xx2/zKYGxOMwIbqTml1nu?=
 =?iso-8859-1?Q?vjA+afkbNK9R5sW+3F98/w/aPoAUqOW01/+5ovshM9VHuTGv1E7PkQNKK9?=
 =?iso-8859-1?Q?0HDKGahA2jOH6FzaGdq/Kn/niOQyxthVzvaLZnMyqA34Dj6xiQybhIVrs9?=
 =?iso-8859-1?Q?qetkgvw5xto8J7j7m1YXOZTTvdZHes8sTvacuDHUXQz/A4vI/DhAZcQcs5?=
 =?iso-8859-1?Q?MhyNBLGZaAmbe3k4OkVrmWw1M7/QsVET/Zll0Tu2kWMHfNzF78xfexH5+m?=
 =?iso-8859-1?Q?nqSDrwaPp93C5w4Ir1IfV+DwEVx+w5D8Ig1vzD38I8HdREFNlu1HMHqICy?=
 =?iso-8859-1?Q?Ny7/vleeOP7PPMU8//zdqda5sjyuahRz/yeSvaF28PLmtFcY1Q39meQ2C0?=
 =?iso-8859-1?Q?ZqfnXyjdceQRdeISVTZAT+N2D8p7UEN+axxzaN1j40lRXNixwel9qvkn7m?=
 =?iso-8859-1?Q?UftaQDg60Al0zjB8Sw2SI7iGOJSWdHJIKnixs82iGIAnvgngeDg3o90bar?=
 =?iso-8859-1?Q?UixxmsqPv0ox4w/sNvf/H237m3nnF57v5B3m7EsRxHT53W5dy2VDe83Ybx?=
 =?iso-8859-1?Q?GckiCrxM15LkImkMfnpte/yVlAQ425NZly8iyhv1nv12OIVzGKlGCIIvDt?=
 =?iso-8859-1?Q?pmEelfENVmoyr8ejlt7kNnL0ftAAAViaOdPQC7/9S0m9NzRbkIa7lcrniM?=
 =?iso-8859-1?Q?3f92jaBng1RJOTOV0zaubt0xkOnuXiVGj1N7gnK4wEGIKWgocGz7shAJva?=
 =?iso-8859-1?Q?s2pXXBwnxZW1coaolS++8fZVdNxQ3d88pbAeyDFdu5fdim0W0sqXUX8kt9?=
 =?iso-8859-1?Q?XGWwCpumfiX8IskP8uUEHxG3YVOya9LVLOHEBghaotpZ911fs5mr3sUd9X?=
 =?iso-8859-1?Q?fcjqOzEYM+3gxx0u+b1VqTzPcrigGywtcx5XC6YgVlPvo3REYd6NKmdxeL?=
 =?iso-8859-1?Q?XpGiJ28K/2dxWZJyblwj8UKat1Q5bF2gjKlRp1GiAfTHKZrC8y7xupjI8q?=
 =?iso-8859-1?Q?PZMjMjk3+qoPpnoTixG0LRTn+yRpjPls6bFfmN+0lrgH6fn0lGXtH8YEze?=
 =?iso-8859-1?Q?KrEP9to5VzExMJnJ7nckySa43gMo4gh2UGmKSCs088JFG+4TmNPCwPrGVa?=
 =?iso-8859-1?Q?HoTAI6UkJs0apaqxZFHlL/kIOmJnVtLdd5+gDbMAdC+R9pz5gvt1tXbark?=
 =?iso-8859-1?Q?zcamBxnEk5bVSX+wz20xMn+hE6OEqHg++nDSLhSrd5oeklLwL9iwDLCyQy?=
 =?iso-8859-1?Q?/cfqgWv+u3sINkJfk+Cq1jBeQz4vO4Ffl7+92KUPhpLEZeLtKJCHXbC4kO?=
 =?iso-8859-1?Q?wnOhfI7TE+cUi20oi4leMoaTIRJ+305jwuLa2LWRNMjoQH8uGMQsQiGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8c1be8-91b8-4f75-2299-08dd408c3732
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 17:41:52.3946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YX7Aw8LTfRM0VMekv/6U9MvTssjrhcqjCH40fklLPLu3yergfkhS6mf+/gNGrLzIm9oLn94Li7H7683UF5hKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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

On Fri, Jan 24, 2025 at 09:19:41AM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 12/18/24 1:33 AM, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In the
> > local memory case it's a matter of merely providing an offset into the
> > device's physical address. For future p2p the map and unmap functions may
> > encode as needed.
> > 
> > Similar to how dma-buf works, let the memory provider (drm_pagemap) provide
> > the mapping functionality.
> > 
> > v3:
> >   - Move to drm level include
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   include/drm/drm_pagemap.h | 103 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 103 insertions(+)
> >   create mode 100644 include/drm/drm_pagemap.h
> > 
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > new file mode 100644
> > index 000000000000..b6b387b81479
> > --- /dev/null
> > +++ b/include/drm/drm_pagemap.h
> > @@ -0,0 +1,103 @@
> > +/* SPDX-License-Identifier: MIT */
> > +#ifndef _DRM_PAGEMAP_H_
> > +#define _DRM_PAGEMAP_H_
> > +
> > +#include <linux/dma-direction.h>
> > +#include <linux/hmm.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_pagemap;
> > +struct device;
> > +
> > +/**
> > + * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
> > + */
> > +enum drm_interconnect_protocol {
> > +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
> > +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> > +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
> > +	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
> > +};
> > +
> > +/**
> > + * struct drm_pagemap_dma_addr - DMA address representation.
> > + * @addr: The dma address or driver-defined address for driver private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> > + * @dir: The DMA direction.
> > + *
> > + * Note: There is room for improvement here. We should be able to pack into
> > + * 64 bits.
> > + */
> > +struct drm_pagemap_dma_addr {
> > +	dma_addr_t addr;
> > +	u64 proto : 54;
> > +	u64 order : 8;
> > +	u64 dir : 2;
> > +};
> > +
> > +/**
> > + * drm_pagemap_dma_addr_encode() - Encode a dma address with metadata
> > + * @addr: The dma address or driver-defined address for driver private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> > + * @dir: The DMA direction.
> > + *
> > + * Return: A struct drm_pagemap_dma_addr encoding the above information.
> > + */
> > +static inline struct drm_pagemap_dma_addr
> > +drm_pagemap_dma_addr_encode(dma_addr_t addr,
> > +			    enum drm_interconnect_protocol proto,
> > +			    unsigned int order,
> > +			    enum dma_data_direction dir)
> > +{
> > +	return (struct drm_pagemap_dma_addr) {
> > +		.addr = addr,
> > +		.proto = proto,
> > +		.order = order,
> > +		.dir = dir,
> > +	};
> > +}
> > +
> > +/**
> > + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> > + */
> Hi,
> In the following comment, the protocol should be removed and an explanation
> of order should be added.
> 

Thanks. There a couple of kernel doc errors here too. Will fix.

Matt

> Br,
> G.G.
> > +struct drm_pagemap_ops {
> > +	/**
> > +	 * @map_dma: Map for dma access or provide a virtual address suitable for
> > +	 * @dev.
> > +	 * @dpagemap: The struct drm_pagemap for the page.
> > +	 * @dev: The dma mapper.
> > +	 * @page: The page to map.
> > +	 * @dir: The transfer direction.
> > +	 * @protocol: The protocol to use.
> > +	 */
> > +	struct drm_pagemap_dma_addr (*map_dma)(struct drm_pagemap *dpagemap,
> > +					       struct device *dev,
> > +					       struct page *page,
> > +					       unsigned int order,
> > +					       enum dma_data_direction dir);
> > +
> > +	/**
> > +	 * @unmap_dma: Unmap a dma address previously obtained using  @map_dma.
> > +	 * @dev: The dma unmapper.
> > +	 * @addr: The dma address obtained when mapping.
> > +	 */
> > +	void (*unmap_dma)(struct drm_pagemap *dpagemap,
> > +			  struct device *dev,
> > +			  struct drm_pagemap_dma_addr addr);
> > +
> > +};
> > +
> > +/**
> > + * struct drm_pagemap: Additional information for a struct dev_pagemap
> > + * used for device p2p handshaking.
> > + * @ops: The struct drm_pagemap_ops.
> > + * @dev: The struct drevice owning the device-private memory.
> > + */
> > +struct drm_pagemap {
> > +	const struct drm_pagemap_ops *ops;
> > +	struct device *dev;
> > +};
> > +
> > +#endif
> 
