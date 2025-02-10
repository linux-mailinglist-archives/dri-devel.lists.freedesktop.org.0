Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6EA2F76D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9910E5F1;
	Mon, 10 Feb 2025 18:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioB+1I1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD810E5E9;
 Mon, 10 Feb 2025 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212887; x=1770748887;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tEy71QFxh29VSz4x9rxpO/YPz/QbDoeHEN8yYa1H5Uc=;
 b=ioB+1I1nmVwPN1GA6PZtXGnG5dGGh2cQfy4oCDomtARWqVqNfmp3nCoY
 qagacpE3Z/p04SyxzQSZ4DanwI8a2FsYjlkMPVu/GVnenOJPh1kRkB8MN
 SwT8Rgz4ybn1aPVsiyqiZ4T7/7MCR8gBhSx6eZoZBUXqTNlweDeVa8y5e
 9Ps+jlJNipZOFvwtN1EzPiiNhReCztsqpb3XI8TBfuCGbjTg5kN7C32JZ
 icDAu/57Qoz5aI4D9bTQr0UpRYC5qrqJSwjqBDt6iawIxGOdnsrMqVntJ
 hpYN1jH9b6FuXDaLUe5GwkMLhTdtJjC7LzIjS+vSS/qt3nxLdgTL57zIw w==;
X-CSE-ConnectionGUID: UJe7kib7TGejvidjpXgDBw==
X-CSE-MsgGUID: yVoa+IblQASaRaFaE1/xKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497691"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:41:26 -0800
X-CSE-ConnectionGUID: zCJ6BGSRTBS6/kPROB4KnQ==
X-CSE-MsgGUID: vgdG4+3RTM61MRpjLtFI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:41:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:41:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:41:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:41:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7QfCVVJVy1cmAappKhix6nriG40/PTp73M1vfjdScvK+wvZxdPrny8SOoKaxAHkH5tGoSH+R2o+kzOROqpIpXJeWDIANs6j7DGZix0OFVfk0ouMb/St8m5AvGOF4n/+hRsSSEs2hl2lk4jvOdsAgcQqCM9G4RiOtYJoyt1f//MGoJd4Zu7+BB+jMmdNFiU+SsT72JPg0hpO0v5U8Pzd+6VMyG6ObawFjgFROGJ1izZGhCWD8dKnHJLbC6Gw+Zse+HN41vg9gRzXhq3Uc0p0ifYffv99hZDaXHbjLz1ZMbnUYWHG2INkc6PC+p7KiE9MexJg867UFcxw4epO3gxvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mynkoTE55ZCbVEXDELFvkvbGAHBsdaMm2jhui9F+dzo=;
 b=eKV7+yXURxBux0KxpEVP6RtNF/jkyBPdpqqs1ACQSmocCKuzxeDvN0uYmfHyT/jq6+9BlC8qY/btcCFPuSk2MirdNRqZvIi0wO6Irbeq2PcFwlDTTLOJhSn2C8Wvl/D+amIsxxpcIwLt5UCmVLh9vQFUnpXacNzgfZCr988M2zRQldcRhx38HfH9VGN2Vhz1zB16F4KR81nvP5OTs6l2FlsP9+lYnImQM+zLDzbRYCgx9Y7y91qu/gqUE4VL3zBsuQKUQpqenILk09sXfwLQHpB+fqInvPmapBACbObff0h0NTFZdBw23xuJ0v3YYTGB/LiBie97D2mfgPfQM4rXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7418.namprd11.prod.outlook.com (2603:10b6:806:344::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:40:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:40:40 +0000
Date: Mon, 10 Feb 2025 10:41:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 04/33] drm/pagemap: Add DRM pagemap
Message-ID: <Z6pIY16rfPNDS0Xr@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-5-matthew.brost@intel.com>
 <1c642a05ec279837394864e1e99226ea3e22421e.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c642a05ec279837394864e1e99226ea3e22421e.camel@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e1b111-c26c-4eae-48a8-08dd4a026afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9/x5QjOgpG56+cMCCQlqfEFd07baEl0O2yn75fZyzt/+L2PbOIjsgtO42g?=
 =?iso-8859-1?Q?CWP940GwQSzLDGDu2eC6JBAxUMw45H+nZbr9ZhMBi9sBS8YryVly6UrI/C?=
 =?iso-8859-1?Q?ca6MaaEET3F0b6SEGN56Jl3ELUmH7w6Xy8SGZ0Nlduowy4hKZx/3jgIx0z?=
 =?iso-8859-1?Q?mPmlz80BYx/A9i92oYgkZNaJTBM9z1DD4yeOpdIatg2V9Z3r7j/W5lH/JL?=
 =?iso-8859-1?Q?gHXdH6776Nr1itwCBsk4eg0D8El0LEeymKfM3uTxpIYwi+tbIpbbQOJJvQ?=
 =?iso-8859-1?Q?zf2D6GLWdL4pMFLyonGLaFX0ah3ZZojlbV9tXXl0FbvCBLtld/P6e+6ikx?=
 =?iso-8859-1?Q?3pq07VLi+ZK//auYFI6Sv2HjRJnXtb80Gwx4p2NZZll/ND6ZLgxA0vt9Yd?=
 =?iso-8859-1?Q?O30AxKfVQVy2rP3phTFMMiXpcu2BUMUULIvQeQXrTP0SgLs11gvyDUHa0a?=
 =?iso-8859-1?Q?ikQDWI0BL35k13LZ2I7sNIEjZfERN359Yu1JT7aKtj1+QH+Ku8XcsJPSp9?=
 =?iso-8859-1?Q?h3A9ifZlHvv9wFMHfn8mD4DpIT1PVqa/BCF3kGP9qcyXbiF6W5WEVbhB1f?=
 =?iso-8859-1?Q?Taf6EhAf+e88R1EBKqKEp+ynJZJU4iK7MyZ2QibpPoHd/BGowIHfcz+8WQ?=
 =?iso-8859-1?Q?Sf/AQIbEfs3jSQupJGHr1g18MUiuVtEBorjRR43pC34nyAH+yQbChlGKjv?=
 =?iso-8859-1?Q?I5R22VFtenR/zSbvsbqUnPUY3dM/eV2gAB24FFISxXxyO6WVMg8GWm/38A?=
 =?iso-8859-1?Q?4H/EN76pAncyNqkeXLn3T6y+CfgevtQZy+q+kv4A7dng+LNut2AKKdcsmk?=
 =?iso-8859-1?Q?jbgpMwsp8tgIYAXZ9G8pGRagmzaSV4beZM2FMHvfbcjqXPZwF5llnPIn96?=
 =?iso-8859-1?Q?yhIPD/n8GvYeI72Id/fasuUr5IsdgUwCmD+8u7Wb/OxZf0EA3QvsrSB/rI?=
 =?iso-8859-1?Q?QvTo6IT4SIA9QKhXh6359Ms2Kpw7RwIkIHsfEzPYnPb3kmE9t9SjUxGAoN?=
 =?iso-8859-1?Q?WJUzPieLcfmyUiDoIx7LishN/8XXYHAVVv1EhDRt9Sm3BB4a0Zn6gKBLkC?=
 =?iso-8859-1?Q?ft9Rqf7fr69h3/paotIwPbY/ES+B3r3MeRXXWja6N11SLoc++8ttbXn2tK?=
 =?iso-8859-1?Q?R45hbKoumOK0uipZ2WnMFbMX5bJyhLUsy5yRotl1OPXDLb4+J73nDdf+ST?=
 =?iso-8859-1?Q?lwp2TLOsfdA9u49WGzFoLxzbs7fbf15TBiAlehwqJX9+fsvyjoeIaByynt?=
 =?iso-8859-1?Q?Ht1dxDfkjvm2XXBx5U5C35nSABq++olhgOqpAdi3Rd6jz8Jl3heQS+DvkC?=
 =?iso-8859-1?Q?D+emoL3yLuE0dEvVXDApSjj022oFZQVmHzVs4rMPJc1qZBgKXmv7BBUVyY?=
 =?iso-8859-1?Q?z4AizUmRoAZIgL3fgv819xJk6I3jO4opmOSCDZR1CJ6uQW5pgQJJul/ujk?=
 =?iso-8859-1?Q?dmL5sWhP/Kpp64eC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+bKC+74vZN7kW5XCu/VJkrBY0IxMtBUSpnqMFXHOLQ8kMt+DVlwIlpRBt0?=
 =?iso-8859-1?Q?XgEtIq0UKznjQg3kHMjD1xxIQ3OjbMbj9OvYWGpqNyZqUmdbBq2mBrqu9r?=
 =?iso-8859-1?Q?G0nkMq7jyNrDcYjX2sStkt/rt7HJhW2fy4Umnn+8Aa170db27HKIlttnBj?=
 =?iso-8859-1?Q?Y3pq4pTuI96/4B9vLd08YMGhSOIeZLTrWvARLLerbNWg3/rWAEd5HYK/ak?=
 =?iso-8859-1?Q?fdPIn0dBBMg5D9zwL1P5fH2eWw2H4TvRUc37D1cqlSOuAacENhl2MdDhOP?=
 =?iso-8859-1?Q?LAKKdQIOTRhHbPGXZPOaAm4XZnWCDb109J23rQUZgFwtjVZnSuFvOs+bR4?=
 =?iso-8859-1?Q?6eS12GNyGujpkeWpmUfP7VOu9bJGXuaF3gTJK0vr0h/zgUKU1ejso0r7Qf?=
 =?iso-8859-1?Q?ptZ4/OlhIo808Ux0dpaqaP9iq7BXt6bJipfdOawJpGIO4rULsn3va1AEL1?=
 =?iso-8859-1?Q?uR6tCJ17C1y8wWPt7LWItFOWi3SORxwiuAaNI+a3on63Hloljw3ZH4SWsu?=
 =?iso-8859-1?Q?Op7xzW1D/zfipuV9jDftX3cVz5nLnAc5ReiD1nXILUnwjCLm0Vj2mi+Ie+?=
 =?iso-8859-1?Q?Gf5zwpgn/xcH2FS/+OiDXg6fNUpeY2PL0/a5wkhu26NwYP+1/gGyh6P56w?=
 =?iso-8859-1?Q?nYb3Z5do8WRVwmms6bKDLGbmw6NHW61oCzyeN7NCqHxy9fnZ+5WWDjrdGc?=
 =?iso-8859-1?Q?z1G2Lq706U06u9Plco9TbzqYPce1K9BSpz9NTs9jyo802hVRKZLlUX8Y4o?=
 =?iso-8859-1?Q?XxsjjcdSqgJzXBipsVjfjiSXggeqFf1mtVKmwoUSFyq7KmegBeL7+GcatB?=
 =?iso-8859-1?Q?54DD0WRTtpWoZMv44ddm1ojepJJMzgcL4sjLCvXCsVcRit5Wej14PYpKch?=
 =?iso-8859-1?Q?tj+/yNSSqueyWb4Z0jVn2jZkrXDjtXEO687F2Rl+pUQ9yCInP7tkXgbPU6?=
 =?iso-8859-1?Q?HagZnVd3pl8RRfWt8XhTY0sp57zSa7WlTOQ/hZ7ybTPNzktwDIOXLIdXJy?=
 =?iso-8859-1?Q?idAYCZgNibClnAgRrgDIfi9t2dQDZgRvOJWTx5MZiSrONyn3lsDYG/uaR5?=
 =?iso-8859-1?Q?olyD7Nw4q71xdlev0T/XS47/kK3gpOg0Hq5yBNlpHgUHj7F7nUi1GxEilD?=
 =?iso-8859-1?Q?q3UUoFBv8zxW3fXG+cxdy1Q0cOKcoST00Bnuhe8xhlkg8QGKVpIqx8erE+?=
 =?iso-8859-1?Q?pegjt1zSltn+1m06CT8o373usiLa+u2ds9tPT8MCCeacSHQVjxxp6HThxL?=
 =?iso-8859-1?Q?8Aabcnc3YSnE22vLFuCkoxqeK6J6Ut4EJQNw1EbwbyWLI2CuTZV5f+jiWm?=
 =?iso-8859-1?Q?WsYuB8/Hp/kpl3HLebpIc0ymq9CFv1aRO70v9RQGDV9rk/E1cCY1MHhQH8?=
 =?iso-8859-1?Q?gIbok9CM/q1zm06RDqNDlude5QLUC/UzkEIjWHU/QnGL+IydfJ3PcfhtHd?=
 =?iso-8859-1?Q?/jDV/Sf9uZEfEVKvsBVed0nD6S9AS/NCfgj6J079n5LntpjSu0LEoykR2O?=
 =?iso-8859-1?Q?aFjAXTw0YHx/4VcBoJ5YAxQtkxprs2zYTTbXE0eVHoKqOUba1qmhgs6xf8?=
 =?iso-8859-1?Q?ADZSNyxRGCuzjRfuYfB2sUaERSI+6ZsJt7z+3tioJjOsrUgLY7JYz4VyY3?=
 =?iso-8859-1?Q?TtEnA8OA9d3gA2rtr33X/25yBSNmMee+QwYLSLrlVYoPCBfo3iqkNSOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e1b111-c26c-4eae-48a8-08dd4a026afc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:40:40.3150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyEXsUHwRLOGazyVca26W17IqSRTVwn7ANEnCYkug+TfqKCOyt1NE87MCzRmimdskbAgwLUGLu7EpULotZ+hfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7418
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

On Fri, Feb 07, 2025 at 09:34:00AM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In
> > the
> > local memory case it's a matter of merely providing an offset into
> > the
> > device's physical address. For future p2p the map and unmap functions
> > may
> > encode as needed.
> > 
> > Similar to how dma-buf works, let the memory provider (drm_pagemap)
> > provide
> > the mapping functionality.
> 

Trying to parse all of this. 

> It should be noted that the long term idea for dma mapping is to have
> that done by the client instead of by the memory provider, which Jason

- Client here is the device mapping the memory.
- Memory provider is the device where the memory is located?

Did I get this correct?

> reminded me of in a discussion on dri-devel. The dma-mapping here is
> modeled after how it's done for dma-buf, where the exporter maps dma.
> 
> So following that, it might be that we should move these dma-mapping
> ops to the drm_gpusvm().
> 

So we move ops to the local client (gpusvm) rather than remote device,
right?

> The situation I can think of, where this might be a problem is that if
> the device-private struct page to dma address mapping is not known to
> the client.
>

I'm not following this but I agree if dma mapping at the client we need
the remote device structure given how the dma mapping API works.

So to wrap it up - what, if anything, do you think we need to do to this
individual patch as part of this series?

Matt

> /Thomas
> 
> 
> 
> 
> 
> > 
> > v3:
> >  - Move to drm level include
> > v4:
> >  - Fix kernel doc (G.G.)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  include/drm/drm_pagemap.h | 105
> > ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 include/drm/drm_pagemap.h
> > 
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > new file mode 100644
> > index 000000000000..2b610ccf7e30
> > --- /dev/null
> > +++ b/include/drm/drm_pagemap.h
> > @@ -0,0 +1,105 @@
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
> > + * enum drm_interconnect_protocol - Used to identify an interconnect
> > protocol.
> > + */
> > +enum drm_interconnect_protocol {
> > +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
> > +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> > +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
> > +	/* A driver can add private values beyond
> > DRM_INTERCONNECT_DRIVER */
> > +};
> > +
> > +/**
> > + * struct drm_pagemap_dma_addr - DMA address representation.
> > + * @addr: The dma address or driver-defined address for driver
> > private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE <<
> > order).
> > + * @dir: The DMA direction.
> > + *
> > + * Note: There is room for improvement here. We should be able to
> > pack into
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
> > + * drm_pagemap_dma_addr_encode() - Encode a dma address with
> > metadata
> > + * @addr: The dma address or driver-defined address for driver
> > private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE <<
> > order).
> > + * @dir: The DMA direction.
> > + *
> > + * Return: A struct drm_pagemap_dma_addr encoding the above
> > information.
> > + */
> > +static inline struct drm_pagemap_dma_addr
> > +drm_pagemap_dma_addr_encode(dma_addr_t addr,
> > +			    enum drm_interconnect_protocol proto,
> > +			    unsigned int order,
> > +			    enum dma_data_direction dir)
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
> > +struct drm_pagemap_ops {
> > +	/**
> > +	 * @map_dma: Map for dma access or provide a virtual address
> > suitable for
> > +	 *
> > +	 * @dpagemap: The struct drm_pagemap for the page.
> > +	 * @dev: The dma mapper.
> > +	 * @page: The page to map.
> > +	 * @order: The page order of the dma mapping. (Size is
> > PAGE_SIZE << order).
> > +	 * @dir: The transfer direction.
> > +	 */
> > +	struct drm_pagemap_dma_addr (*map_dma)(struct drm_pagemap
> > *dpagemap,
> > +					       struct device *dev,
> > +					       struct page *page,
> > +					       unsigned int order,
> > +					       enum
> > dma_data_direction dir);
> > +
> > +	/**
> > +	 * @unmap_dma: Unmap a dma address previously obtained using
> > @map_dma.
> > +	 *
> > +	 * @dpagemap: The struct drm_pagemap for the mapping.
> > +	 * @dev: The dma unmapper.
> > +	 * @addr: The dma address obtained when mapping.
> > +	 */
> > +	void (*unmap_dma)(struct drm_pagemap *dpagemap,
> > +			  struct device *dev,
> > +			  struct drm_pagemap_dma_addr addr);
> > +
> > +};
> > +
> > +/**
> > + * struct drm_pagemap: Additional information for a struct
> > dev_pagemap
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
