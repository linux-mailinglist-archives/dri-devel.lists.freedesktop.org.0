Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F490BAB9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810910E4CE;
	Mon, 17 Jun 2024 19:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up2d8pSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E7E10E4CC;
 Mon, 17 Jun 2024 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652005; x=1750188005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4bDity0RLJSjdDmAmbyAT5KuaLPkpiyyxCgTdIA1wWg=;
 b=Up2d8pSf+ltbW9/6WfSdylcRsWAZcZedWb2vVlOAD5k7uWkPkfsuIiFE
 hCdFlEb2b9iyiYz5xKpv0rTWi2CJOyb7x40MBspRxA9QB/SsBa3fka/Wq
 3gSNpxeg9owBE/1DDi0+7W3xVHKJ5/rpuwcgeuwDgQP8uaKTJg1bUQb4J
 k2pjN7HMemo9Gc4HE8265hdV87e2dcst0PjhzNyGznP2GLR0p61S+DFZi
 TDpA31goZaRevsyY6LWCokNGsLH/tl8ec942QcOWbyCluhohYnL4Ny6yA
 Yg35AvqpPFidDh5O8gs2etADMLopqdt7XF8m/iWaBeB9RgcFFPSJlODix w==;
X-CSE-ConnectionGUID: GEQUiWZ0RKahc8kbNJoqxg==
X-CSE-MsgGUID: qc54cJVUQk6XqEw9zMWXyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26074707"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26074707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:19:57 -0700
X-CSE-ConnectionGUID: dVWTt+xsQ526KwWsMvvURQ==
X-CSE-MsgGUID: 9UksqbhzRmOoDy7q90dG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41396746"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:19:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:19:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:19:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=invdV+Jft9mE0apW4oH/HSMJ2NfGYwsFBhgcpROzOfm4MclhbNB5JwEP9ahuP3t3NKmXtC/TXQbIKwmuHgmpnX9VAW5U8i+WSCxmW6VWiGanZau9aZt5wVKicax7gpTkmg29Yxpe2YHKXthtMeJNn3NXpFcXmHvllStM1KNJBsRowPrf9k1EUP3Z/idLnFV0slcV2DbXYyEq/3PwXswRxauU/nf3Gndw/7Vh6WZPtQgVrK6nk15kisxM4ie1DzcQHutQ+FSp8jSKjrfKXT1xXbAZcqV1soUFSGems0D40p7xRM8ac/RgBSdKsQrQ74I83ElH1UdIPCfTGvRr2jHyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I27KXtmabvjzzU9w0I/EtXcZRvXHDcb9m+0kMRGzBBA=;
 b=FfMkrjIUJIqnhBssVB4MBu4yyqKo5G73SgDUKejVT4irf4Des7gxyVqPyn3iV9Z+jGA7kge0yEmQU7V/+8FjKaNTEDnmGIkrJlKe5aGs4xYNlbu3NXDmfuTL5uBnihgk66A4cTh6XPHIxH/hUqIz95i2OYAAY7GkDx4DVNEQdv+Jpr/uAHGbkXwwUlbo/4Cnm/lGZeE6H9oyIiTL6R0ZT5Lg39KnmpTAxU/GCZD723qgV1gFqDueGQPEFXqdC8wfWeI54fCtkIAtmPZqTvU87WOWLJ+w9D5TYWeKrSzAmBNzk9SJNLTc7uukTj4nBBtZxELdWJoLGrxt2jnrzJj/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Mon, 17 Jun 2024 19:19:51 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:19:50 +0000
Date: Mon, 17 Jun 2024 15:19:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Message-ID: <ZnCMUEd9dQ6bLNet@intel.com>
References: <20240612141239.141ce8cc@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240612141239.141ce8cc@canb.auug.org.au>
X-ClientProxiedBy: BYAPR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::15) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0e719b-da94-4e96-d366-08dc8f027526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g2KJtqT2/UVyxgQrl1TiVwM9SFh3fJwJcx4/9aowjPcl39/L6ePfNDuR4HJU?=
 =?us-ascii?Q?eDt0CC/T/9jtgA6Erog+pnYL3H9HqgRyS6p9sRNxRWoRjBAjMqb1NL+t/vwk?=
 =?us-ascii?Q?F3dpTmlgcG15Xlc2gWbNXY+3fkfo1L32kn/vACY1tnmpk2BGYM2iKRRxOUuo?=
 =?us-ascii?Q?2oOuGiqJNtgMM1PRUjf9yT/9GDUHf9Zk6RQBLpitMGABNBi9Aa8zMsuMdKwV?=
 =?us-ascii?Q?9l4grY5tSjaAFA1pxLKi3N1ImZIisFw42CDTOCba9QyUCX32fXjmUT1hIf0/?=
 =?us-ascii?Q?jys7LPTtzye+YPbarxJRqM631tdWKY7eaNVtT58RsMQ80xV7RQSDbeZ+Ia9r?=
 =?us-ascii?Q?fWDNL9jaaun3xY8rCxaU5Ij+eEJZP0qThBztvQqKVIortCRnFnkazNk0I3Ko?=
 =?us-ascii?Q?igaMKcL+rDMx5r4D7C34i+E6fAi6I0eL9eD4+LdyC2dxfJF0ipAsLh522Lz5?=
 =?us-ascii?Q?Z4KztB6/rgUMdJQUdx+r50dv5pq1/MCKRfTghpfNS1I6aCGmYV8PCeXT/VeN?=
 =?us-ascii?Q?dzRP6G9tXEbYeCjuxISX7lzDRpylYZBiOxLwwWtw7GiBJjjigc9sbNLE7Rgn?=
 =?us-ascii?Q?SHHl1bFHsJAOM6efRVUR0IMxP+LpJXgNG3LBkVGRA96SRX9av4NmyCY0HyXf?=
 =?us-ascii?Q?0RsMO2BB7alAW1NQ6fJMAu8iZqfCGb+1QVW/xf3AhYBJM+9byNC+/HQncmyu?=
 =?us-ascii?Q?tH9/4YDsCdfnxpoSeG3THMcxs8aIaILc+Vn2awS+eN72QVQN9QOBmgQkjpPt?=
 =?us-ascii?Q?XkS4Gzt64nJ5C+rE+WdJ7lxBPyIIM3GyW8Hy5pHOxeSTJgJSiWdobIDLzze/?=
 =?us-ascii?Q?VXxmXT165gc2ZXWCmzY9XrnGDXy0In5aTySlyRqLmr8zdM0GG1kzXco2e8YL?=
 =?us-ascii?Q?wVyKTFrhKl/XCDfoer/iHkzFM70M8cc3X7QdP7ZNO/IzY+7yT2GblnMeOKOT?=
 =?us-ascii?Q?mKhKQUiX1egPYIZ9l5b6ENvgwPasmbyF5GCqw4Vj/BZQOns2Mhp/vufiQbtj?=
 =?us-ascii?Q?9HpMNrdmHP9EnIKsubSkEK5UAXJ11SJeWFBYmSITODrhUz1e5+Y7HJOUBU+Q?=
 =?us-ascii?Q?tP1Yzps77eKsoEckiFhRrp7ObP0PptRBtR/ZgRVEoqAJd77gbKMT5K3vXz8i?=
 =?us-ascii?Q?jjjlaUdPFJoUr6gsZspql8amXZRJ6ssG/bSgIngfADeObBWrcs4p5P3mS0HC?=
 =?us-ascii?Q?p2xscPVwboE5XhRcLXm3AnawL5p1wWUFAUZknccHcTReBJow78lqVR3dPOlW?=
 =?us-ascii?Q?+n4nHx85/tzfae5H7b0koFARx/OwKwlFa7GIolKITFwRdYSbRHMEw62SQhBQ?=
 =?us-ascii?Q?vzU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7+kYiBYfl20V8e5cY2J1aBWNZx+xkWk5NCUBgCxWh+pJrkLC145401PcnuP?=
 =?us-ascii?Q?+NzJtnGMBgKOWsEXzsEgc+pkqp6NAVXqNGYF8Dd9nC5CnLU+qC1LwVpKTaIq?=
 =?us-ascii?Q?O9shJn9HCvlBPHuI0KaUjpwRPnslvsonSGptAnv1aQ2JA2h1MzaGVPXDvtdd?=
 =?us-ascii?Q?46dl0VxLOKjiJXCjIGdEjoS3Cy4T8zkZi0y8pAgT/dvAhDA6rHjLx+Mv/t5C?=
 =?us-ascii?Q?L3h9LRK+WfDs5+OatInaaQffReYshNHVUIKAa0F/m2ng/gmhmef1KYrd+CgK?=
 =?us-ascii?Q?PI0+oYy2GAUMVK7aDHpn8E2HEqGoVOOSyh6EWM+kU4sUnJGml0eq4yZbIhNr?=
 =?us-ascii?Q?fJMU91F4a31DECmLxOeINuq3Mop9nTcRuLIMveu1Sb/lt8s6LHx/FiJ5CAsD?=
 =?us-ascii?Q?8EJF0MRudKCiE7GyzVZhDNyoVnkgWrL7hUE6a0L1kSK0yvwDiORR3ZjFv8OI?=
 =?us-ascii?Q?wxumGqcXiZzdomx0ul93VutaH/sItcVMeMqlhaC93b9F+TAP2tkGSyxnH+x7?=
 =?us-ascii?Q?ZTt3c2eInAfMFhMeWArS0iaLaUhXnKJqcvn8kddb3oK7dB/AM9zTw4u+CmpR?=
 =?us-ascii?Q?k3bU8fIPeHIpWmZ6Kj5GrWs2xlNCdDXswfFvtWdFd1c8UmqZprd4Lb3RrK2W?=
 =?us-ascii?Q?3C0F7AvZPa1bK0tNRWx7RncAgkXpMqhX3KA0u0WHQFNq2VWUKWqXLlfGdc90?=
 =?us-ascii?Q?PdH6RscAymstaeZLjs1BK0NpoHdnP3MUUxHKE/oAnWZyAloUwaMAL0DLvKYp?=
 =?us-ascii?Q?lGVkD/geOeOvVhIHAPv/piUcmNixgBN4IC41ctZlgOaNZcpskhBMwMQBDLrA?=
 =?us-ascii?Q?SL8N+2+UBhpDrpA1FZBn/ZagONcTqNvq4EoV/W+0ALTFRVZFxKYiRJjBj77V?=
 =?us-ascii?Q?lQk6HDRY8EHJVY8z0W96SrHnGV97j9LKaETnFRIaOK28C9r8Jq1e/KPfhcFN?=
 =?us-ascii?Q?0+Esq9OX1BpiaWc0sF6ScCAy0BgKvo8m2cGsXGnzcsGy1nzI/SoOKvTSCjvp?=
 =?us-ascii?Q?ybsq+Tc5L4omBnjrHg9FsGRQOo2SuUYkPKS11rWhnR4SRvvDDTeygTqySFIb?=
 =?us-ascii?Q?2xKUKlWM2gbnOyjZ30VMMCQG652iFVLg+lvl7JAQmUSCKaFHnL/xmeChHQse?=
 =?us-ascii?Q?l/eYHSDiMvgsxtU87z4Nj40/VL9dU21Qbrng3B1rYUMQa1Bhq4xlks+axySa?=
 =?us-ascii?Q?6crN5o2rXOC6g6VqCF/wu1F0hfcz0iBB70rKnyVgq454ABUXAtsjfWqMtwAf?=
 =?us-ascii?Q?oCtnadpIAmjRaPSct9Fi8RNJ+409xTux6QE2MuzYMry1qlvzGGtMFxqesATC?=
 =?us-ascii?Q?oCHMSe2zmy4E8TWQyIVdEtjD714JyMWZ4u5Zri60+DarMUJpYy7d8YNka5XX?=
 =?us-ascii?Q?VYapUgHrvV6PS395fnlnqvSMnvAmfbxzIx2Dt5G7tP6omOsD9NlIJpQ2TZMD?=
 =?us-ascii?Q?HPaFAJN2DIMZ/K/ClqMP7Jexzsf+8OdHQfQOREKpKKuO590A027r6IOWqo42?=
 =?us-ascii?Q?W5KlsmnAE1Bd4b9/FjyhEkzSChJpNqs/7JXPzkpAF+ru6X0LLbV/a8gF01YD?=
 =?us-ascii?Q?DZavNXaGmxmifITPx2DnQd0/riI/nfW1GdhOdMih?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0e719b-da94-4e96-d366-08dc8f027526
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:19:50.0331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTYTYMzbLmWEisopd9CalxdeyYk2/Y+yj2P/7pYv1y5i4/AVV6UGxLWJgvPRD1vZUTznaByrmR0xURr+u2lqOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

On Wed, Jun 12, 2024 at 02:12:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-intel tree, today's linux-next build (i386
> defconfig) failed like this:
> 
> x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `intel_vrr_compute_config':
> intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'
> 
> Caused by commit
> 
>   1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> 
> I have reverted that commit for today.

the fixes for that is available in drm-intel-next now. you should probably
remove the revert.

Thanks for the heads up on that.

> 
> -- 
> Cheers,
> Stephen Rothwell


