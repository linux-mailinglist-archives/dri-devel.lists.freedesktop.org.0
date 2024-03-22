Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C3886FD0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 16:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D60112575;
	Fri, 22 Mar 2024 15:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGBiKjsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE21122B4;
 Fri, 22 Mar 2024 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711121369; x=1742657369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I6yqTmlispY4Lim6SXOVOu60Cc5v2wth++1l6pNbO/s=;
 b=eGBiKjsJeG5v6Bh96C4kPn6pD8JkKeqgUTknxelE2+UNKa4X4xLEaJ3Q
 lAslONeC/XDk7vRfXSNj6O1Oe08BLX4Ujn8lJYkdk+ObN1biVuFmXJCTf
 aFaWr4yIPIPHCjZRq2kMGWMPM0TtqNs9uEA2xHCdnuj0tHfEqPjSUp1ox
 rZetkITKvSACK6nPhoJhyTDMHIcZtRz9EF6g71U27eZ+S0+wi+mP6JRGn
 lXkpFt2G9CR2+Y2MBLdfkfuXTjTHvsLBISWav5Ji5gNSg/A/8lvMUXk3n
 P7RUkrGIKUYya4bqhD3r12fZH1odgyguzUOx5xWMDsPHORnqTCWOHHZF5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16721833"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="16721833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 08:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14971518"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 08:29:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:29:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 08:29:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 08:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyAso9KWDuXOp4ZCWN3neryeFoLd6DTrOHOvnfL9XwalKM0Zxm20dh4H4SvwAT77VNdgkkN8xbD6yZ2YH0RQUeyqoeNggCIAv80JO7KJm0pK4iiLpRHCNX08cjkX4cJ0AcPGOvFQzque3Xj4Hzn7WmBhmHdL/O+avfncRwEfN5UgwFDflMXqmmfjHWYxx1fVxQw570ZEYTSG0xIjiGtlsEfxZgmBqNh3i8qnF46WhZ/cpJRuHDjlS8nGEVQgNIjMuPio80yjR8cvcYxgklKQmhYmwh2C2YBg9ToOWYt9BPoWHY92iQHWLEJqpFMeyDg5grtmKmkhkhGvYI0J9hXHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs57EiqXwUXVmqXS8JhKcz53Kt4MoUSIaPjz2eo9XIQ=;
 b=giiW74Hs16MzayNESRJG7S7+6SWZzJTLx5ZcNrLxRUNRTpWM9/zbz3A+ITlMge0vvry7F41IAjMZmDvPCW8tM176xsHqfvH8+uiJYXrCmN06avUbe5DiGbAV8juvL0r3or8hjKpnHhd+0unm5QgpdNd1d7F3h4PrUo3O1ER0il+QtCcYCGD4LPUMmXFtWoWXFRaY9r5OAEELxUJsJJN7+X+FIyavcYN0vtxD2jdJ6++SE1ysa/mC4/po+m1yVeSLz9WMJ3JE/uaUtx1duDrQaQiUfb9eZrF5WNt8pu+p+LaWGe/KT+1WVuDEcdhOrZQgckjlqQimrzpk6WtVMK0jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) by
 DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.24; Fri, 22 Mar 2024 15:29:25 +0000
Received: from DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::63e8:fe69:d457:851b]) by DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::63e8:fe69:d457:851b%7]) with mapi id 15.20.7409.010; Fri, 22 Mar 2024
 15:29:25 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "felix.kuehling@amd.com" <felix.kuehling@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, Joe Greathouse
 <joseph.greathouse@amd.com>
Subject: RE: [PATCH] drm/ttm: Implement strict NUMA pool allocations
Thread-Topic: [PATCH] drm/ttm: Implement strict NUMA pool allocations
Thread-Index: AQHafCfKARlTn+sjzU+zWWzAzP8eJbFD2U5w
Date: Fri, 22 Mar 2024 15:29:25 +0000
Message-ID: <DS0PR11MB6424E8F84BC34DD6EBB6279DC1312@DS0PR11MB6424.namprd11.prod.outlook.com>
References: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
In-Reply-To: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6424:EE_|DS0PR11MB8049:EE_
x-ms-office365-filtering-correlation-id: b209eba5-b88b-42cd-360d-08dc4a84db67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A1HZ2iYTZGu9LzckktCkjxgPlFB+qOMnk/h+D8AjhJrqOet/4PEE6Nsc/YfXVlu0LPIPX7cBI3I0TH06nfsUeJsAx4aTivjnTGnCq8iAIavJgv6Pm2QBL/ujYDxyIp8A5wJs4IKErX6nuMqersxX2cNjxK2SgAuhp3PzuRMpl0dFkLnmOj6nMXO7sBNDv+KaSTg/lU44GFgPDAJPMKMv9KWr/KueL5L5pS6n2U7mDgOxvmrZoSwo13n8qtvUuWsCOQv0hwfPYqYGaDL9ORz8ZoTL3iSyW7c1Iv6blIO3jCW/Z9mIdbxJ2khjZRNwXa748XmiKNZKAjMhP+GWPLQupEyP1u7ZSBe/42q6ZQFgCWu9h7cmp71gfZFKxENFmiaQ1H9SrZjRv2sjO3+aVQqScPOjyuIM6LwvqA7Sjtz13hIJ5fuAX84W/LOlAWAo7Gs2bmCwGeG71BL6d9rbY7vPGIzRul4q/kQWIDsdy34HrBjhmGvEw68Zvc+Xuj7w2ItHlpxhU0M8AzyiR0rKINWUL96kg92u4NiQa47YygbMW66tFaAtCL/6EidQ0BiNxDEbaHb1A8HzZZltl5Row2Jlx6rVzFTh06G5PjiT8SDijUCHFPWq4K7E+wJoMkZM7vHrbphq3VT2NF3jOgWXVKadKP8zUqbPIsxQnZk46H5qnHzd+E34sT0m0s9aXSgxw8DRFPa8H0I8r2Jvf6LvO5Mv2AkTW+jPuDej5WHtZlyXouM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1ezlAiAnpEZ6zMfMibYV9dGTxMZlYF9vbWvL3GR4Pz35IATYGgi5JasmgyUj?=
 =?us-ascii?Q?zipA7dq9ZAAd4udA/QhXveGkhINzYiFugtig1PdLnhF9d8DE+7DBfHX0WlF7?=
 =?us-ascii?Q?u0YkeJ3mA17EHLhYLxdJLvYupjPufeOfuIWIUhhI9YKi9v7HOMlANhuJWFFN?=
 =?us-ascii?Q?YW8K75E4c5bIaHTBuD3qe41D3UTmbBSKFoRWoMygRQCPg+mEamyBV5dYdSjX?=
 =?us-ascii?Q?nfh/QtbIxPO+r/gd3w5nl3DCf6EJSWfAtwIA45LmRcaBtkmc7lKf/lUdXgo+?=
 =?us-ascii?Q?N8cSiC2b+w65OoL5gVF+BromXLfcYG7O+R9xG3mtWdAzdRmqJPlvWxPw5LRi?=
 =?us-ascii?Q?unNPsg6EWbXdet6fdmpTdPGX34LYn/rfrp/XVZq3FAn80/gtsLCQ7AwPiucj?=
 =?us-ascii?Q?qxb5dAsPBBfZp4kJABwKyVEcCOUiB6M4JIq5La/VW+yPEMp/IO8O3F4zH6if?=
 =?us-ascii?Q?8xOo0eReYJzW9BXOWVxV2+7yByadI5h/2BX2eAGQTAATtm8mLCHAZ0OJ1nmv?=
 =?us-ascii?Q?ROjxRAGLfYiBBIru2xKEKzCJwGjDL84iDe4gELJY6owDx0nRqXEOPTam/+R3?=
 =?us-ascii?Q?WZ+McMmVq9j0PugHwWAxbjxixg4YbnPmxO4opcJKTi6OfyJ654ciHRxxmy4U?=
 =?us-ascii?Q?gtv+8lJlkfnCoSdYLUKDRp48DGFYrYmtWFzLCLMx8nxIJObt0O5dMSjG4kOY?=
 =?us-ascii?Q?kHjKK01EY70gjx3h1tQF79EEUijFQ4PtpTaiZZG+t6UOFz2moOqnMz5TfQBP?=
 =?us-ascii?Q?L/fBFgpG3H0Jvo23coWvBmCyGrkoFWh3qU0Nb3EAsfY33T1E7AtVUQ9xWZF6?=
 =?us-ascii?Q?mBJu9FGY/ezJdmActpkmdUq4+h9zNde76G51Nt9dqgYnmWiE9TdAsaZFf+ds?=
 =?us-ascii?Q?OGjT5DrMmiCr2hJfZk5jCWvliH8i3HFYBnx1tbXMN6KSOvetbqd4pHurMDq6?=
 =?us-ascii?Q?N49rC6zFIFeITAh8aodg/wU1fz1aVXlDNJBvnBHcPn/ZcKuT4UO4R/8ZjJMg?=
 =?us-ascii?Q?xoB39POgd0szPLrvOnKP2vVkKXmLKhyAQ9xUBHquM5UqJNeX1R9THCb0uCn+?=
 =?us-ascii?Q?poS0BNRIzQltSroWS0Y9hKKWH/kJLZam0cu/9X0qKHmULnwFzgS71a5lSmiX?=
 =?us-ascii?Q?/zmRbTaAWSIVArWS9PoPrPf0RBjoivsBEHkpFvLYyFgT/VZKg8Hw64tRFez7?=
 =?us-ascii?Q?l+pEt+zRxqCGB9xWl1QCEZDtipUkH6B+gJBX8D1cnBB/zRXNUkoAa25Y78hD?=
 =?us-ascii?Q?L4IfS5/kX6bhzw3s+wHBO0eZzkTvi1d83TiZhrj0B3xEIhkt9dxdUVsw+POr?=
 =?us-ascii?Q?1mAbNH6gMj5P8zK9H0+nRCdp3zgfe2XNNrYmeTCr9rqMy9xosaNJ8yDi+joi?=
 =?us-ascii?Q?/8DOqj+Ox8UoMUSTPySk+qA/A0asbqcohdJOmMPWfH6ONZ8D98r/Xu+ACBGo?=
 =?us-ascii?Q?2K3Tlbg08SUNiCIAVGstbhtld+Yo1pMA7Vb42xE0SqMmoidFVkBntXWamGQX?=
 =?us-ascii?Q?t0+jcveRevFQKrYQrstCNBRLaCTp4HzJLnx7rORV4wiEURM4j7VN6EbiZLJV?=
 =?us-ascii?Q?1yshmGdz1PXGrWLvk/CxDs7FeFCHInsX72bUjAO6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b209eba5-b88b-42cd-360d-08dc4a84db67
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 15:29:25.6654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvsxkVtZVU8Qn31NoSQjgiJJC/7Gx2eHsUHpBYMhULIPthKsiMfdgyUeTPnbIL748gDJ4C/pRV73FbpbFdOyy0XHNz/vNsm5x8vHJAlXdI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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


>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Rajneesh Bhardwaj
>Sent: Friday, March 22, 2024 3:08 AM
>To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>Cc: felix.kuehling@amd.com; alexander.deucher@amd.com;
>christian.koenig@amd.com; Rajneesh Bhardwaj
><rajneesh.bhardwaj@amd.com>; Joe Greathouse
><joseph.greathouse@amd.com>
>Subject: [PATCH] drm/ttm: Implement strict NUMA pool allocations
>
>This change allows TTM to be flexible to honor NUMA localized
>allocations which can result in significant performance improvement on a
>multi socket NUMA system. On GFXIP 9.4.3 based AMD APUs, we see
>manyfold benefits of this change resulting not only in ~10% performance
>improvement in certain benchmarks but also generating more consistent
>and less sporadic results specially when the NUMA balancing is not
>explecitely disabled. In certain scenarios, workloads show a run-to-run
>variability e.g. HPL would show a ~10x performance drop after running
>back to back 4-5 times and would recover later on a subsequent run. This
>is seen with memory intensive other workloads too. It was seen that when
>CPU caches were dropped e.g. sudo sysctl -w vm.drop_caches=3D1, the
>variability reduced but the performance was still well below a good run.
>
>Use of __GFP_THISNODE flag ensures that during memory allocation, kernel
>prioritizes memory allocations from the local or closest NUMA node
>thereby reducing memory access latency. When memory is allocated using
>__GFP_THISNODE flag, memory allocations will predominantly be done on
>the local node, consequency, the shrinkers may priotitize reclaiming
>memory from caches assocoated with local node to maintain memory
>locality and minimize latency, thereby provide better shinker targeting.
>
>Reduced memory pressure on remote nodes, can also indirectly influence
>shrinker behavior by potentially reducing the frequency and intensity of
>memory reclamation operation on remote nodes and could provide improved
>overall system performance.
>
>While this change could be more beneficial in general, i.e., without the
>use of a module parameter, but in absence of widespread testing, limit
>it to the AMD GFXIP 9.4.3 based ttm pool initializations only.
>
>
>Cc: Joe Greathouse <joseph.greathouse@amd.com>
>Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  8 ++++++++
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  7 ++++++-
> drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 10 +++++-----
> drivers/gpu/drm/ttm/ttm_device.c          |  2 +-
> drivers/gpu/drm/ttm/ttm_pool.c            |  7 ++++++-
> include/drm/ttm/ttm_pool.h                |  4 +++-
> 7 files changed, 30 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>index 9c62552bec34..96532cfc6230 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>@@ -253,6 +253,7 @@ extern int amdgpu_user_partt_mode;
> extern int amdgpu_agp;
>
> extern int amdgpu_wbrf;
>+extern bool strict_numa_alloc;
>
> #define AMDGPU_VM_MAX_NUM_CTX			4096
> #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>index 80b9642f2bc4..a183a6b4493d 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>@@ -781,6 +781,14 @@ int queue_preemption_timeout_ms =3D 9000;
> module_param(queue_preemption_timeout_ms, int, 0644);
> MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption
>timeout in ms (1 =3D Minimum, 9000 =3D default)");
>
>+/**
>+ * DOC: strict_numa_alloc(bool)
>+ * Policy to force NUMA allocation requests from the proximity NUMA domai=
n
>only.
>+ */
>+bool strict_numa_alloc;
>+module_param(strict_numa_alloc, bool, 0444);
>+MODULE_PARM_DESC(strict_numa_alloc, "Force NUMA allocation requests
>to be satisfied from the closest node only (false =3D default)");
>+
> /**
>  * DOC: debug_evictions(bool)
>  * Enable extra debug messages to help determine the cause of evictions
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>index b0ed10f4de60..a9f78f85e28c 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>@@ -1768,6 +1768,7 @@ static int amdgpu_ttm_reserve_tmr(struct
>amdgpu_device *adev)
>
> static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
> {
>+	bool policy =3D true;
> 	int i;
>
> 	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
>@@ -1779,11 +1780,15 @@ static int amdgpu_ttm_pools_init(struct
>amdgpu_device *adev)
> 	if (!adev->mman.ttm_pools)
> 		return -ENOMEM;
>
>+	/* Policy not only depends on the module param but also on the ASIC
>+	 * setting use_strict_numa_alloc as well.
>+	 */
> 	for (i =3D 0; i < adev->gmc.num_mem_partitions; i++) {
> 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
> 			      adev->gmc.mem_partitions[i].numa.node,
>-			      false, false);
>+			      false, false, policy && strict_numa_alloc);

why not just 'strict_numa_alloc'?

Is 'policy' used somewhere else?  Not sure this adds clarity...

> 	}
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>index 2d9cae8cd984..6ff47aac570a 100644
>--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>@@ -87,7 +87,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct
>kunit *test,
> 	pool =3D kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>
>-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);

Is this really an acceptable interface (three non-named Booleans in a row)?

I have no idea what "true, false, false" means.

Would having a "flags" parameter and then

USE_DMA_ALLOC 	BIT(0)
USE_DMA32		BIT(1)
USE_STRICT_NUMA	BIT(2)

Make this more readable?

Or define your Booleans:

USE_DMA_ALLOC 	true
USE_DMA32		true
USE_STRICT_NUMA	true

NO_DMA_ALLOC	false
NO_DMA32		false
NO_STRICT_NUMA	false

So at a minimum, we might know what these parameters are?

What is the relationship between this feature and the nid value?

Is this value used for the allocations?

If this is not NUMA_NO_NODE, would this do the same thing?
(or is the STRICT flag the only way?)

Just some thoughts,

Mike

>
> 	err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
> 	KUNIT_ASSERT_EQ(test, err, 0);
>@@ -152,7 +152,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>
> 	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params-
>>use_dma_alloc,
>-		      false);
>+		      false, false);
>
> 	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
> 	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>@@ -219,7 +219,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct
>kunit *test)
> 	pool =3D kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>
>-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>
> 	err =3D ttm_pool_alloc(pool, tt, &simple_ctx);
> 	KUNIT_ASSERT_EQ(test, err, 0);
>@@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit
>*test)
> 	pool =3D kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>
>-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
> 	ttm_pool_alloc(pool, tt, &simple_ctx);
>
> 	pt =3D &pool->caching[caching].orders[order];
>@@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit
>*test)
> 	pool =3D kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>
>-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
>+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false, false);
> 	ttm_pool_alloc(pool, tt, &simple_ctx);
>
> 	pt =3D &pool->caching[caching].orders[order];
>diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>b/drivers/gpu/drm/ttm/ttm_device.c
>index f5187b384ae9..540e8a44f015 100644
>--- a/drivers/gpu/drm/ttm/ttm_device.c
>+++ b/drivers/gpu/drm/ttm/ttm_device.c
>@@ -215,7 +215,7 @@ int ttm_device_init(struct ttm_device *bdev, const
>struct ttm_device_funcs *func
>
> 	ttm_sys_man_init(bdev);
>
>-	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc,
>use_dma32);
>+	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc,
>use_dma32, false);
>
> 	bdev->vma_manager =3D vma_manager;
> 	spin_lock_init(&bdev->lru_lock);
>diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>b/drivers/gpu/drm/ttm/ttm_pool.c
>index dbc96984d331..73aafd06c361 100644
>--- a/drivers/gpu/drm/ttm/ttm_pool.c
>+++ b/drivers/gpu/drm/ttm/ttm_pool.c
>@@ -447,6 +447,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct
>ttm_tt *tt,
> 	else
> 		gfp_flags |=3D GFP_HIGHUSER;
>
>+	if (pool->use_strict_numa_alloc)
>+		gfp_flags |=3D __GFP_THISNODE;
>+
> 	for (order =3D min_t(unsigned int, MAX_ORDER, __fls(num_pages));
> 	     num_pages;
> 	     order =3D min_t(unsigned int, order, __fls(num_pages))) {
>@@ -555,7 +558,8 @@ EXPORT_SYMBOL(ttm_pool_free);
>  * Initialize the pool and its pool types.
>  */
> void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>-		   int nid, bool use_dma_alloc, bool use_dma32)
>+		   int nid, bool use_dma_alloc, bool use_dma32,
>+		   bool use_strict_numa_alloc)
> {
> 	unsigned int i, j;
>
>@@ -565,6 +569,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct
>device *dev,
> 	pool->nid =3D nid;
> 	pool->use_dma_alloc =3D use_dma_alloc;
> 	pool->use_dma32 =3D use_dma32;
>+	pool->use_strict_numa_alloc =3D use_strict_numa_alloc;
>
> 	if (use_dma_alloc || nid !=3D NUMA_NO_NODE) {
> 		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
>diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>index 30a347e5aa11..6b7bdc952466 100644
>--- a/include/drm/ttm/ttm_pool.h
>+++ b/include/drm/ttm/ttm_pool.h
>@@ -72,6 +72,7 @@ struct ttm_pool {
>
> 	bool use_dma_alloc;
> 	bool use_dma32;
>+	bool use_strict_numa_alloc;
>
> 	struct {
> 		struct ttm_pool_type orders[MAX_ORDER + 1];
>@@ -83,7 +84,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt
>*tt,
> void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>
> void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>-		   int nid, bool use_dma_alloc, bool use_dma32);
>+		   int nid, bool use_dma_alloc, bool use_dma32,
>+		   bool use_strict_numa_alloc);
> void ttm_pool_fini(struct ttm_pool *pool);
>
> int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>--
>2.34.1

