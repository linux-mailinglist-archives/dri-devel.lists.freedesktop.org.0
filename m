Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C95CB216B5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 22:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175B610E530;
	Mon, 11 Aug 2025 20:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BU8Yr/ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972510E30F;
 Mon, 11 Aug 2025 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754945177; x=1786481177;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X8Nm2VjvkfUb8ZsPb8AmvfRHGBwnT/V0mAN2jO0AQ6s=;
 b=BU8Yr/ulAr6d9LtLGlADA+hM6Qa7GERUHG164fiayfBkrmPoarUojiCo
 7JMi9jMQ9tIXw2mLTtHGPNV5wa9iLKsNRLZJz9NLmFDJ+6lVy37+EW0Cu
 j660pJLioiQzdMnZoXboLGpAdizSHH/Zd/aQ83dDxeCZTtWHf4Y3snULy
 +fEUsDqzWqKjFdifQOK+FSoFLuBJS706QSQnB3WLBRJV1ldp9B3OKVeNo
 wKt/nT3MH0BsWHBpIVAoYxb/fICQPtu37DD+dmHZpBYfeaJ6Q87BINwll
 l6t3LcBjYlYN5D6VCO6fCHWKg9NEOKPnZOdPolFuJkokzfna0pY4R9KVU g==;
X-CSE-ConnectionGUID: fpSczcukTAeGJTnzqf9CcA==
X-CSE-MsgGUID: NFTl/DALTSCCVAvg0KXW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57164119"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57164119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:46:17 -0700
X-CSE-ConnectionGUID: 9aoY/XYsRTCD0T4kbjLDMA==
X-CSE-MsgGUID: kKY3mQs3R32E0quErdLFWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170150040"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:46:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:46:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 13:46:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9RwZrZinmyz7hCPOLN7n2ODR8Ptxj4VQZDLTuy0W/wyyhUKxDIutVwF/dbfRL9J9FeT5WHkC7i4YN87iAuaoSJTz3398BieNLPN8XLM7ucuOJnN3RYmpW/SpY2EL+2s4mZ3Zgweg02nr1jDFD4JTf//phydQLX1q48ubSmZYUpkrCXyjCzz77E6N3UUHIOgQKDzs4c9yQB3Q9BkeYM7raw4Hu7bNTL8wCQtOEvZjNrdBfvbneaDwJRHDg6iYJE4AXioguC6kKtCakyvQlcyYuMc81GcfXGd2o0v2o8fbjdC0hJl0MQiwSU04SGZhM9zc1hrY7w6MtWQFdD+O442XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkvODX0/fGRp//S1mK9tdj0PGyZOATXwxMvXFvpTtIo=;
 b=navfDPOhobR3jxZ3y7cOmfgqJmc2za0Cs11aaWnzMzuihYGyF3QhzX8lmA4tG+cb97L40n/Xv8Bz4WGcfv1/gFJh1+fkB5HurnKrRL8lr1ofc8OXf3nMfF2/vBggxNGZiTCrDvmWZG7gDGfMzFydEbsEk2VmUO4Wt831e+2G/MzkGmEzjWIvLksZSHZC6S/fVbu+x6zNibvF+hyyKSZN/xy5VAcD9W/v7WSIwnejEEaE+Hw8OjlVY50CI2tS+kFkCabZXSieGWlHxVesI5QL8Sw64unWeQWLeqlqF9Hm18EAWhl5/iBbJDpvC9pJEr1VZOsjtoG52YVyaqPTSh1Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:46:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 20:46:13 +0000
Date: Mon, 11 Aug 2025 13:46:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 6/6] drm/xe: Implement two pass MMU notifiers for SVM
Message-ID: <aJpWkig5z8tbeQDo@lstrano-desk.jf.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250809135137.259427-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7436973d-89a5-49f7-b689-08ddd9181c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RBB2UWfA2Ubf+Ra9uZb4pW7o+z4aIZRpAER/tORnDPHYMY6aJNzPx1RPkV?=
 =?iso-8859-1?Q?iSEJJhH/ptXyKqnFbEz5pqXH+j/mTNVMukGcEELk9IMCsCGinOJOIEeIQa?=
 =?iso-8859-1?Q?MigHbm4h+96II0FbEecKASAkg5ToYRAGWya1Y4DZB6ELCxcJontep1SFYH?=
 =?iso-8859-1?Q?x4xbJD7ukZqKMShncdBxcSGrS8fn0reVw0lsD902f5mW3zj3RnbGagYg/u?=
 =?iso-8859-1?Q?YHHKKbNgzij33ulmKG52R+laGf8LUouqOH0nJrRRwiH/i9uHLJPFd9t48d?=
 =?iso-8859-1?Q?wgQgiq1oQf/jFMzTkuLywv6rLky5kiS4xelaRcOaFyjQVAgR2NPQfb5oem?=
 =?iso-8859-1?Q?Pltd86RRgMbYGrWwn5POZfXPUI7MGtLJTraChXRmzr0KRManGSRORFIukO?=
 =?iso-8859-1?Q?ACANC+tFwFVscasqzItyiXsZh66gsnajzK2dxc78JMGVoTwCQ0PT2sUKl+?=
 =?iso-8859-1?Q?FfG8fvOUEE7ZhZQ5wCd452QeiwEWfrw/6f5/bozV+EDQh10O3R7WOp/54T?=
 =?iso-8859-1?Q?F8jO2XwTSDNHj0KfRR478H74L1lzm2h+iZp88BsgWVSiqmoMTrUGxG647i?=
 =?iso-8859-1?Q?FR3WXLeMWRHnlsG/pVwhbcjEZBDFiN3GmrvjamNqqyfiGpDx6siCEfCSJ/?=
 =?iso-8859-1?Q?6X1hbcUdSHgIq5VKX0KCUd7rUAlV2BHJK0zVypfMKIu5Y+DW/gZXyo6PiY?=
 =?iso-8859-1?Q?c4gEy4dJoP8Ndy4Go6QSMB/iX0Bxa6A4RVo24WVXPBVTt8R0mjswjH7TRt?=
 =?iso-8859-1?Q?DoFK3EPVEddq3xsFYep9GQ/QwjR2BfoI0eDVd8YYcLZkPYTZ7kXKgTUOFy?=
 =?iso-8859-1?Q?K0IbxFg6cT8nU9YOWhzjrdtPMQBEsQRT5E/0zaFArNdjdOYZXS0k1LZ5Z8?=
 =?iso-8859-1?Q?4FUuvJGxWNLP6cpPHz/iMxQAL2K01yQ/1julND4b+e4L3iFuyBNaR0bVQ+?=
 =?iso-8859-1?Q?mp5W8p4Au+u+35J/0Ah/QXGn/eFJAUPQkYBLk5G/WtC9eDbBefJuxyAsbK?=
 =?iso-8859-1?Q?Nip6ckQ4t2ApPQOVeW5VcwlvqDFcaHBZI/NNKzPqZnuXL5SX29dtPfwGFE?=
 =?iso-8859-1?Q?TGodeJfecr1AMW0p1DNNdYBbT/wBAte6jq+K2NIr2gpjzCAOlXXTG6ysgM?=
 =?iso-8859-1?Q?QHwE8WDPFOKIowj03Zq6/6DHtRMZOlM1dhpv43zwP1K0bxwjIbojIGYHaR?=
 =?iso-8859-1?Q?y5/a6THAVPDGkeTekaP3YW1zBK6A9LtkoSQtvFYYaTL9UmNHEi24V78arV?=
 =?iso-8859-1?Q?/4XgEDjekVvWpBpRAGXYnBPNaF1AvLkNNrKmnuouaswQdPGc3HzuaUjxa9?=
 =?iso-8859-1?Q?e9Bza6IfO+jAsPuqBXyqFIlmgBb/r/bqlmefJzenbtv425H7hPLvLnTb5M?=
 =?iso-8859-1?Q?8OqW8GRepKVLay1ncfTh0m8ejA1FZ+ZVfqnMnUg2tpFtkXXiQwYAZYTDqF?=
 =?iso-8859-1?Q?NEVC7yV5boM6U4qRWBOGDcQ2wcoAAsNlJTGpdaXS54eGEL4nHe4zG5as3w?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gM66sH8FaqWm58qQ2Oe5el46KASYbeBjQkjSxpivcqN1elo6wfn3wLi+aa?=
 =?iso-8859-1?Q?O3vaCb67lITctbD626FF0e4jnkHlXtYBfzF+N0oYatuMK8bJrI34f7a6XX?=
 =?iso-8859-1?Q?/N6Jo7zoRKDDcVMjgCDBy5RYl1AtZKqfPtuWhkESF4leRaoz0/6TAqJMQc?=
 =?iso-8859-1?Q?etbAJ269838qFhsAiMey+3kuPxHaRPpBucObWZ6kpNDIUgjGAo3UACva9U?=
 =?iso-8859-1?Q?33Ck4H8tjDEs/jh0mL8lmoYzNi+oucJdg5EzS9PDaR3ClysV3HBNIjCJn9?=
 =?iso-8859-1?Q?SlYDXemq9zwrY/4ZP/RbJg77mw1Jsw/d9plIBwDp9Vlodj9Juyx0lklcKb?=
 =?iso-8859-1?Q?LjJE2b+Bd/TykWcKtnj6IPacioYcNXCoQZwN55FdpB5PHEuMOgJuVr8cpe?=
 =?iso-8859-1?Q?I+gO6/CvOUSYc6pfr62+zdS5ASRrO9p1XfOd6XUA4sNLWEYHhnp5/Y9iUo?=
 =?iso-8859-1?Q?qz2w6Jd+CtJwPfPDJprtjpIilUrmW4rTnECMomXgE6nNoNF0TA2f0BJ6Cm?=
 =?iso-8859-1?Q?kjHGVpUodaVTOSUSOsu/QWFU5Jg35JYX2SrFWzcEiL2TinwHZ0BSA52zpc?=
 =?iso-8859-1?Q?oU3rBzv/0x2bTpCeKQ/pH1dnSlHn4eTNL4Jw5WBbiIxZ96B4/FEk5pWFEB?=
 =?iso-8859-1?Q?tmRtA1NAC2uDMHFIo/pVkNmqJF87iuHUjHLInAOoNVG8fQzlECATL448f9?=
 =?iso-8859-1?Q?cLWF6OiK9M3UwbXYmSdzLxlRYvHlTmTMlU4MTLhy1bY95q0Qh5RI4VoT9/?=
 =?iso-8859-1?Q?Vl9Ez6/ezPJwcx6N99eY3Kxww9K0JrjEKVuOxK3Wj/yJLzWV/NqKyHZmI6?=
 =?iso-8859-1?Q?8EzGCNJQ7ir4/uc3zxJxw6Dv9KMX3/o2ZhuhrPInl+asTtraV6hRgrbhhv?=
 =?iso-8859-1?Q?lAvBKAINC21y4rg3jA0qXu0/5Q4e9CWAloz6nwzDhj4pbZ4ERMfrjIujDn?=
 =?iso-8859-1?Q?CAY7mk/YUKV9+QSmKbdvAYF+yohzwBePD/g6ZRvMdZNLvbP9c4XJQ3PWIG?=
 =?iso-8859-1?Q?/6Qucg/2g6A7NYTxeYSyUKMHprtKQFtEmmylqryFkulf+pUuXYcI/EFbYX?=
 =?iso-8859-1?Q?ni5dF6v6ZIGoRxLdygKSVFUthClFa2aPDpMgK6z+DAhqX2O7wJPUwW5ShX?=
 =?iso-8859-1?Q?/mTwfJToneSc+VXQvm3aJ8Qb1tyk9VAQKTxIJPgWDN1AEzfk4IYAFPMejG?=
 =?iso-8859-1?Q?tqmQ7VkjbUiLr51QqAneaZkcLTHmD0hhXYQpmBRKS4e/8R6NaMwizA1KMT?=
 =?iso-8859-1?Q?DCtRReScP2byxcao/aNaHntKYFrSSCRzgOWS2Cf7LFMrTuOSKWujUrHUfb?=
 =?iso-8859-1?Q?bAKEqsk5gFN+RsQaeGTAvfsI37cQe48BLmk9ykf7aJjX6gIwdU/1WQpzwM?=
 =?iso-8859-1?Q?tdm6HUjGW2HB+ovq2q1ElBxiSAv02VbCrv0gZSHl0mhpzg9Yt0QwwbA1e0?=
 =?iso-8859-1?Q?vsIohb3K5a2dRnA6ebUrsjDoPlDIgoe7OWeqbTThUbIvquPNkeqB7TgCQL?=
 =?iso-8859-1?Q?WET5UPbDwIY96X1oR2WmElcp33djA9UxuwS/XnBziigyX+ulI2l8Go29xR?=
 =?iso-8859-1?Q?DLlVrfpB9z0qlPmyWPE9Ksn6YjTbyZUWDiV6/XY2hsAtcYy5ekuU8VOWT8?=
 =?iso-8859-1?Q?qAlr4eopzwL72ZPQ4yMYADNZlxbFcn2qBNncJr/rzTKepARv62iKPmCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7436973d-89a5-49f7-b689-08ddd9181c55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:46:13.5941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oevlwj2R+B3FFAnvYLTCZ8CJXQtXHaIZprKVe5KPESxyvrae7RoO5ERi7AtW88meG8KuM/0BoKaZdwLExzLoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Sat, Aug 09, 2025 at 03:51:37PM +0200, Thomas Hellström wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Implement two-pass MMU notifiers for SVM, enabling multiple VMs or
> devices with GPU mappings to pipeline costly TLB invalidations by
> issuing them in the first pass and waiting for completion in the second.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c  | 74 ++++++++++++++++++++++++++++++------
>  2 files changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 92dc7d2bd6cf..f153df1bc862 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -413,7 +413,7 @@ drm_gpusvm_notifier_invalidate_twopass(struct mmu_interval_notifier *mni,
>   * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
>   */
>  static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> -	.invalidate_twopass = drm_gpusvm_notifier_invalidate_twopass,
> +	.invalidate_multipass = drm_gpusvm_notifier_invalidate_twopass,

This should be in patch #2.

Matt

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 82a598c8d56e..5728394806ca 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -144,15 +144,8 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	 * invalidations spanning multiple ranges.
>  	 */
>  	for_each_tile(tile, xe, id)
> -		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +		if (xe_pt_zap_ptes_range(tile, vm, range))
>  			tile_mask |= BIT(id);
> -			/*
> -			 * WRITE_ONCE pairs with READ_ONCE in
> -			 * xe_vm_has_valid_gpu_mapping()
> -			 */
> -			WRITE_ONCE(range->tile_invalidated,
> -				   range->tile_invalidated | BIT(id));
> -		}
>  
>  	return tile_mask;
>  }
> @@ -161,16 +154,60 @@ static void
>  xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  				const struct mmu_notifier_range *mmu_range)
>  {
> +	struct xe_svm_range *range = to_xe_range(r);
>  	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
>  
>  	xe_svm_assert_in_notifier(vm);
>  
> +	/*
> +	 * WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping()
> +	 */
> +	WRITE_ONCE(range->tile_invalidated, range->tile_present);
> +
>  	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
>  	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
>  		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
>  						   mmu_range);
>  }
>  
> +struct xe_svm_invalidate_pass {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +#define XE_SVM_INVALIDATE_FENCE_COUNT	\
> +	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE)
> +	struct xe_gt_tlb_invalidation_fence fences[XE_SVM_INVALIDATE_FENCE_COUNT];
> +	struct mmu_interval_notifier_pass p;
> +};
> +
> +static struct mmu_interval_notifier_pass *
> +xe_svm_invalidate_second(struct mmu_interval_notifier_pass *p,
> +			 const struct mmu_notifier_range *mmu_range,
> +			 unsigned long cur_seq)
> +{
> +	struct xe_svm_invalidate_pass *pass = container_of(p, typeof(*pass), p);
> +	struct drm_gpusvm *gpusvm = pass->gpusvm;
> +	struct drm_gpusvm_notifier *notifier = pass->notifier;
> +	struct drm_gpusvm_range *r = NULL;
> +	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> +	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> +	int id;
> +
> +	/* Adjust invalidation to notifier boundaries */
> +	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
> +	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
> +
> +	for (id = 0; id < XE_SVM_INVALIDATE_FENCE_COUNT; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&pass->fences[id]);
> +
> +	drm_gpusvm_in_notifier_lock(gpusvm);
> +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> +	drm_gpusvm_in_notifier_unlock(gpusvm);
> +
> +	kfree(pass);
> +	return NULL;
> +}
> +
>  static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
>  				      struct drm_gpusvm_notifier *notifier,
>  				      const struct mmu_notifier_range *mmu_range,
> @@ -179,6 +216,8 @@ static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_range *r, *first;
> +	struct xe_svm_invalidate_pass *pass = NULL;
> +	struct xe_gt_tlb_invalidation_fence *fences = NULL;
>  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
>  	u8 tile_mask = 0;
>  	long err;
> @@ -226,14 +265,25 @@ static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
>  
>  	xe_device_wmb(xe);
>  
> -	err = xe_vm_range_tilemask_tlb_invalidation(vm, NULL, adj_start,
> +	pass = kzalloc(sizeof(*pass), GFP_NOWAIT);
> +	if (pass) {
> +		pass->gpusvm = gpusvm;
> +		pass->notifier = notifier;
> +		pass->p.pass = xe_svm_invalidate_second;
> +		fences = pass->fences;
> +		*p = &pass->p;
> +	}
> +
> +	err = xe_vm_range_tilemask_tlb_invalidation(vm, fences, adj_start,
>  						    adj_end, tile_mask);
>  	WARN_ON_ONCE(err);
>  
>  range_notifier_event_end:
> -	r = first;
> -	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> -		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> +	if (!pass) {
> +		r = first;
> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +			xe_svm_range_notifier_event_end(vm, r, mmu_range);
> +	}
>  }
>  
>  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> -- 
> 2.50.1
> 
