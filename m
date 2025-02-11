Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7ADA316E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 21:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D8E10E30F;
	Tue, 11 Feb 2025 20:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCohUpip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADE910E1AE;
 Tue, 11 Feb 2025 20:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739307053; x=1770843053;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tAw62lurI2uM0N5qNR5veCbXE2q2djLaemNND6MPACA=;
 b=dCohUpipXqDRwKh/QAUZkcrBrlTboIACshJXhCvTqi2pSQOAnr7THnLP
 IoNdJXgDzHU2ATUL8Hp3W/vn+8Rp1Kl0mlcb+JurUBBtc3uYZvFqXcw/y
 yjtdgviRlCax8OrJ6KHW/yv6TFcadMAsovTKWc+Guabc3cBmsMDAlBwn5
 mjyqRt1XMh6bLqtsmt2w9SF0Uu0GMjdxJHZpA4qZzmozxRMN6wC/F3x8X
 HoQF0nQowp/kxaYSfUQkrnde1w27QrnbIxA9XFfcH8Rf2R9ndC8yvCgZM
 lCT90BwWWu/M6rhfF+T2yVt0DVGL4y+tdo1NP/DQnvJaKe+iU+WIR0SKN A==;
X-CSE-ConnectionGUID: DbPjMSReRPG7kEZ8FihJvg==
X-CSE-MsgGUID: cTqC5S/jQIqSGVwt9JyylA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43708374"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="43708374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:50:53 -0800
X-CSE-ConnectionGUID: L8vr1aEcRK++Jwfzo+AQgw==
X-CSE-MsgGUID: aWQKZTQgT126peEYsecYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113511627"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:50:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:50:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:50:51 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:50:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWzIILQU/64dw7ykAlLzHO8sI1C9rvOou6WDFhMGNhCHkwPSoEVxI8F+KAAInX/mVN7VgssDGPqkRmLZ7sq7qz2vMwAtd/es2SNyHtdzoyyqv6kzfAgMQIpHThCFko5/XhvwbaiihTKBonRVFeYkIopAN3obA3VfIBzVHteGcl0xIvLtNADZbtAx3elCqgvqI75e0dvWYvjB9cRoOX/6XR+YKjbLasKY15p3wL2RidQiEt3caOPKHl1554+8IqsizawO8NsposrEPhleJd56ZTLnxlLz1/2nU00MQyX5hRNe77MZ5Ud10J+NnBAjYr0PaWgvOO/m7Mi5Zaz575WcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQBhlrjK7Le7oJpxiZ7CoSFcxvc3XEnXy+MCJxr34F8=;
 b=IH/b8OM7V21YNweX7xvwslIr6GsOgAMWBbRDaiWLNyr82/oRUZ/+ODdALCIaYoxqbkfHqKYuCguZeS1FwEZRewa6NG3JFA7nKAriytDh0NLL/uljufqeJ/27hrOlnK2ufNIP/DLzk6OkrdwfQxfBBkq3YuML3kK5Ou1wa7RdbaSEEkvmkks6YeqVAsdvjfcmvw3FizMWnBFSl1RQ6qxHGga4mHDCCH6IQjHezlMr5vQnw0kfjdr3NzO1b0qq1rozPSu1Sg9KeqzPxioNLEbJTcx5otKKOklw2GEebD78NlIGO2ZBTHyZcL1BZJPrIN5WlV34yM/XW5iRa3CamOSunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 20:50:07 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:50:07 +0000
Date: Tue, 11 Feb 2025 15:50:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <karol.wachowski@intel.com>,
 <tomasz.rusinowicz@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2] drm/i915: Add VM_DONTEXPAND to exported buffers
Message-ID: <Z6u3-gK8d5wJLU-3@intel.com>
References: <20250114082303.1319508-1-jacek.lawrynowicz@linux.intel.com>
 <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f35cdb-3085-4cf6-947b-08dd4addaaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B8onB/h8tucYKp3ZY1FgoJk/gNYRyvhQgjPijqx2R6xK5uwcHdoBCNdpgikg?=
 =?us-ascii?Q?ZNeSK6dKT0F7dUpl7PIjv8mNipCSHHMjcN0nfdTqVJwHF9jW+CS+DPLuNj1G?=
 =?us-ascii?Q?uN7jOqIHt9yhbdi8LzR2rNDF/Pu3FbYb0MUkPBWAKyXhv3cePgV4gNs8Xxp+?=
 =?us-ascii?Q?7F1oVGmSZWLasLdo1htjWs53SoT7+7XO6FEkNzCXq6JTXZnQGMZCpIUhCyat?=
 =?us-ascii?Q?5h7vQ0199hcoAO6L2JWj2KPsU4rGCHY4ifpNKiZ23o57hWNb14yIUEglniLh?=
 =?us-ascii?Q?vmPdWdrCmam6koG37cZpzWPXfObQ0pHskvWoF4k+vvkFfu35LtQMOb9ewdHg?=
 =?us-ascii?Q?sne5RrcauGx4S9qKIfcbf1MqAzu2IWS07xqsn8LysM8qOSZ/QFjMSlAAOSzI?=
 =?us-ascii?Q?+Epi+bGhHiJZLg4eyKi7eafP1XED77iMbf2WdYjUpu27e9EOW88DSqoltxyk?=
 =?us-ascii?Q?jiS9Wu94jYUUwxmRZslzF4/eUDvBMwAqHp0Z8CGXUhv8e4WQmS6O/OeS/xc1?=
 =?us-ascii?Q?ZBWZfvi5pZUylReIM3R8nuCchfH3vnAurxMyhh2T5fwEkU2VLCCP3hmioV/n?=
 =?us-ascii?Q?IXoL2zJyt6eO/nvtMnDTrCEhL1tu3pHLdDb/6PK/rMUg8rBSB55E8B73r+pJ?=
 =?us-ascii?Q?lmhOCfKbA1xQq4R7sJFhNaUaLM8CP0F0/h4aNNjTJlsL57WqosD7L61qYwVY?=
 =?us-ascii?Q?C5wdOjcHnnPqbfUmfk1p0veeWM+qAErdytvzkGjZfQA3xTjn0TphdL3slQAl?=
 =?us-ascii?Q?AUouc+QptUq6bHn22aXdotDgTGMEtOh1Pny7TDW5TZBg0iPQzzR2gw6Uj+cZ?=
 =?us-ascii?Q?NxgJkT3eOmPTjumfdU5+DDsgM/AK6FCZyUfq/xdsxEAoxDNfhsLy2hL+KDzE?=
 =?us-ascii?Q?Q6NJfvaZRwgp3+2ezLYXhaWIv7CERCzK4KYOlcLD5QpmgYv6XiVn5tzY35+f?=
 =?us-ascii?Q?pho6Piig7N6K6QxgkRa7LBeb+1D5IP6dnqvZucoYbtw2MiIY0a4SKfCCo3jO?=
 =?us-ascii?Q?JkXBW3ITvVmRm6MDOizHXeJxHuRD17Rxq/HnBgGkVqeOWtnyYbAq/5/8m6ZH?=
 =?us-ascii?Q?dVGQW3gRsm4dymHFJzjFxatN59Kein1ngr6Tj0l1DTNzyIVi6lGSWWFgFJCR?=
 =?us-ascii?Q?TXmLvCUDHZlZAxmgNxdXk0rwgnBzSHodAOxlFC1aCSSxONQ1S8h1irRw82L5?=
 =?us-ascii?Q?yVBMtDjOihArofRNXsh6DNAW89GyveWClayJQNoD/yrcjiV3C0D3IwrMlX9o?=
 =?us-ascii?Q?lWuOfQIBUQaxjFzjlRgGxMC5CltKTxnquTL6QRH9qiGhgicRyNtxr+agyufP?=
 =?us-ascii?Q?V0tGPfGBBYbMZbeFETf2XeTUbVmtwptCLtfUHKwewPVQCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDILVEmx1z2p6xsVhRuDeVhRALJwRRgURaCXaw229qJ5/7mj1BN+8b7YJWJC?=
 =?us-ascii?Q?+cVIJzeRZAvce1TunSNf8DCQWSoLuIK6r01EagJh0UYRh6dnLKJ0LIFoH4xw?=
 =?us-ascii?Q?WOy0BJ6AJXarNbZ+MGFYZfPcWP57JVUH97Jax1G4R7sb6YdP6vTrPg1hsZ9b?=
 =?us-ascii?Q?0yBaLpvUxe+dDnPgiwcaRf9mBBJolDzw4fkUoOvE6oLi3y8EkFh3gdNOasyA?=
 =?us-ascii?Q?RD8XPThPLQflV587CtBbD2BqaBqIK61yOVqAwLlBcaL5X4cdZ0Vd3Z+pvubT?=
 =?us-ascii?Q?vk6Z8SujUBi27xHu3jIzjX/JhcrdTyc6TtunRKCZdhrLiSp1DA869fW70ucz?=
 =?us-ascii?Q?kQq3HoTOQk3b7VKWrrmTwrtD7hN3B230NcKJ8CS8eDo6a0+1aktls9yUFKtm?=
 =?us-ascii?Q?dggx9yjczMgDhH1Z7qnBvnp7Zb9aBnpUZ+LM8qmhqv8Cwt24g/MHmtTjajjD?=
 =?us-ascii?Q?niTltqe2DXRnQb85yFVpd6FFj6wZBBKaSxtOXCrW79oMO0v+AKNza+ArRs5y?=
 =?us-ascii?Q?bibXHU/haJp34wcgEcnncUhuxDvZf98PPJoCUn1VCwsrh3D4Rs5ESx3ngbpU?=
 =?us-ascii?Q?e5LndFwWhOirVK73Hnfm4J88avXdtDmLc/C8OkEcYkQTAxPO2KhJ5r9X0N+w?=
 =?us-ascii?Q?4AfpHZUovgBIHJ25MUM16wIiUy+bOMtTyWYU4Qy5p8it6YCgbEpVoCBXir1A?=
 =?us-ascii?Q?eftrh4VyOgOVzlxmNL3NUlpkTK3DpMNtmPQJI8aIv+4QNor87wMcgRpYGCs3?=
 =?us-ascii?Q?IRjK+fvJzYrWEwO022xvYg37ApsGuokjsUuQpQY1YgFjJ9x+ZoubaZ0BVWjJ?=
 =?us-ascii?Q?u8WnFzBc+LzwqIiycwwLEWugQ/+UjseHYx3Er0jA0MfJoUj0E+SQistgJzuH?=
 =?us-ascii?Q?B5o3e70Wod6TWxo2yWB8H+gpjqTq+6/0Wm3kDtGBnC3aX0TF0V9qdQT87z1N?=
 =?us-ascii?Q?a5M4e3EWeOvKjtzGku5gsfe9CE0DdP9gA5Q3RxOUSoEhzQzjhyZmbWwsHzOc?=
 =?us-ascii?Q?0aXADadD7KhOQ7XX+bpqgwqXf1JXHZPmzr0kNh7+Qj520B8lCweZeALOk3Zq?=
 =?us-ascii?Q?qcfaWqg43G67vTKURzmFLE76AuGrK6N8l+XoRCt/3Hrr0Vz9QAtV5nk42pMw?=
 =?us-ascii?Q?ggBxqXFyZ6QlCfIwy2U86LgjbXC6m2ZZIdM0uR5EThbxlhrkb5StLvp2/ysx?=
 =?us-ascii?Q?FwMNaOzAK1OCexba61yKKqYDPyLt+cyccIoot0BuI9XbFIbwew10FKVjZVyD?=
 =?us-ascii?Q?+ateokFOHpIFLDYgSAFuY37GARKL9GS5iLu6Tq1st4zfO4HHLgXpOAsl67sR?=
 =?us-ascii?Q?7Y/2I3NSH+dPZMGW/OIdvMrgShx8xHRz+omB5WbI0euUJ5lD56sfPGekQTr/?=
 =?us-ascii?Q?xW9tUgEeef4HBUmSHj7EwsPVKEtxZKIJEgVx8xkGMkQ66mGSz4NW4FoixPF9?=
 =?us-ascii?Q?XnDQNyxc6BZHhVeMwo4BRzLORP9UCZW4o/jqogqNsY7yesZIJXxRogN77zVM?=
 =?us-ascii?Q?yQ1qJuj8vM4pmvIOOlXhwX7AMVxfMpB3liffD3oNrI4F8DdB1MiuJJUbqS60?=
 =?us-ascii?Q?ueDf8SMcez9UBjgoI0s8mnls/QA7B6b+UgPJH25IeFYONW+tk6mmc0cKF+lZ?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f35cdb-3085-4cf6-947b-08dd4addaaa7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:50:07.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zCCGeIorQLjEq+F9lf+Ex+immwHRnZHZCVnO3ft5Ht5tcath85fV7pVJyAxZ+Om8KdzNlnp9oexS6SddpLcUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
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

On Tue, Feb 11, 2025 at 04:57:03PM +0100, Jacek Lawrynowicz wrote:
> Hi, can I submit this to drm-misc or should someone commit this to drm-in=
tel?

This is drm-intel. More specifically drm-intel-gt-next.

Since Joonas had some concerns on the v1, let's wait for him to check if
the provided answers were enough and that we can go ahead and get this
merged in drm-intel-gt-next.

>=20
> On 1/14/2025 9:23 AM, Jacek Lawrynowicz wrote:
> > drm_gem_mmap_obj() expects VM_DONTEXPAND flag to be set after mmap
> > callback is executed. Set this flag at the end of i915_gem_dmabuf_mmap(=
)
> > to prevent WARN on mmap in buffers imported from i915 e.g.,
> >=20
> > [  283.623215] WARNING: CPU: 1 PID: 12693 at drivers/gpu/drm/drm_gem.c:=
1087 drm_gem_mmap_obj+0x196/0x1c0
> > [  283.623221] Modules linked in: intel_vpu(OE) cmac nls_utf8 cifs cifs=
_arc4 nls_ucs2_utils cifs_md4 netfs overlay nls_iso8859_1 binfmt_misc intel=
_uncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal intel_=
powerclamp intel_rapl_msr coretemp rapl intel_cstate kvm_intel wmi_bmof inp=
ut_leds kvm processor_thermal_device_pci processor_thermal_device processor=
_thermal_wt_hint processor_thermal_rfim processor_thermal_rapl intel_rapl_c=
ommon processor_thermal_wt_req intel_vsec processor_thermal_stc processor_t=
hermal_power_floor igen6_edac processor_thermal_mbox pac1934 industrialio i=
nt3403_thermal int340x_thermal_zone intel_pmc_core int3400_thermal pmt_tele=
metry intel_hid pmt_class acpi_thermal_rel sparse_keymap acpi_tad acpi_pad =
efi_pstore autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov a=
sync_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 =
xe drm_ttm_helper drm_suballoc_helper drm_gpuvm drm_exec hid_sensor_custom =
hid_sensor_hub intel_ishtp_hid hid_generic usbhid hid i915
> > [  283.623254]  crct10dif_pclmul i2c_algo_bit crc32_pclmul drm_buddy gh=
ash_clmulni_intel ttm sha512_ssse3 sha256_ssse3 e1000e drm_display_helper n=
vme sha1_ssse3 intel_lpss_pci thunderbolt intel_ish_ipc intel_lpss vmd inte=
l_ishtp idma64 nvme_core drm_kms_helper video wmi pinctrl_meteorlake backli=
ght pinctrl_intel aesni_intel crypto_simd cryptd [last unloaded: intel_vpu(=
OE)]
> > [  283.623267] CPU: 1 UID: 0 PID: 12693 Comm: npu-kmd-test Tainted: G  =
   U     OE      6.12.0-performance-20241122-11972534541 #1 f86ee8132c283cf=
158e9fd89cc84f4adeb3b79b7
> > [  283.623269] Tainted: [U]=3DUSER, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MO=
DULE
> > [  283.623270] Hardware name: Intel Corporation Meteor Lake Client Plat=
form/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317 08/28=
/2024
> > [  283.623271] RIP: 0010:drm_gem_mmap_obj+0x196/0x1c0
> > [  283.623273] Code: 49 8b 94 24 40 01 00 00 48 8b 12 48 85 d2 74 31 89=
 45 ec 4c 89 e7 ff d2 0f 1f 00 8b 45 ec e9 f8 fe ff ff 0f 0b e9 54 ff ff ff=
 <0f> 0b e9 ea fe ff ff b8 ea ff ff ff 31 d2 31 f6 31 ff c3 cc cc cc
> > [  283.623274] RSP: 0018:ffffc90004103b20 EFLAGS: 00010246
> > [  283.623275] RAX: 0000000000000000 RBX: ffff888313ebafd0 RCX: 0000000=
000000000
> > [  283.623276] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000=
000000000
> > [  283.623276] RBP: ffffc90004103b38 R08: 0000000000000000 R09: ffffc90=
004103bd8
> > [  283.623277] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888=
108b95400
> > [  283.623277] R13: ffff888108b95400 R14: ffff88815ee50000 R15: ffff888=
30133b000
> > [  283.623278] FS:  00007fcbf9063740(0000) GS:ffff88846fe40000(0000) kn=
lGS:0000000000000000
> > [  283.623279] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  283.623280] CR2: 00007fcbeb15d460 CR3: 00000001076a2002 CR4: 0000000=
000f72ef0
> > [  283.623280] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [  283.623281] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000=
000000400
> > [  283.623281] PKRU: 55555554
> > [  283.623282] Call Trace:
> > [  283.623283]  <TASK>
> > [  283.623285]  ? show_regs+0x75/0x90
> > [  283.623289]  ? __warn+0x91/0x150
> > [  283.623291]  ? drm_gem_mmap_obj+0x196/0x1c0
> > [  283.623292]  ? report_bug+0x1af/0x1c0
> > [  283.623295]  ? handle_bug+0x6e/0xb0
> > [  283.623297]  ? exc_invalid_op+0x1d/0x90
> > [  283.623298]  ? asm_exc_invalid_op+0x1f/0x30
> > [  283.623302]  ? drm_gem_mmap_obj+0x196/0x1c0
> > [  283.623304]  drm_gem_mmap+0x125/0x200
> > [  283.623305]  __mmap_region+0x7bc/0xc30
> > [  283.623310]  mmap_region+0x96/0xd0
> > [  283.623311]  do_mmap+0x526/0x650
> > [  283.623313]  vm_mmap_pgoff+0xec/0x1c0
> > [  283.623315]  ? __count_memcg_events+0x89/0x160
> > [  283.623317]  ksys_mmap_pgoff+0x175/0x230
> > [  283.623318]  __x64_sys_mmap+0x37/0x70
> > [  283.623320]  x64_sys_call+0x1c1d/0x2790
> > [  283.623322]  do_syscall_64+0x62/0x180
> > [  283.623324]  entry_SYSCALL_64_after_hwframe+0x71/0x79
> > [  283.623325] RIP: 0033:0x7fcbf8b1ea27
> > [  283.623327] Code: 00 00 00 89 ef e8 59 ae ff ff eb e4 e8 42 7b 01 00=
 66 90 f3 0f 1e fa 41 89 ca 41 f7 c1 ff 0f 00 00 75 10 b8 09 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 21 c3 48 8b 05 d9 b3 0f 00 64 c7 00 16 00 00
> > [  283.623328] RSP: 002b:00007fff157ded78 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000009
> > [  283.623329] RAX: ffffffffffffffda RBX: 00007fff157dedf0 RCX: 00007fc=
bf8b1ea27
> > [  283.623330] RDX: 0000000000000003 RSI: 0000000000002000 RDI: 0000000=
000000000
> > [  283.623330] RBP: 00007fff157def80 R08: 0000000000000004 R09: 0000000=
10418a000
> > [  283.623331] R10: 0000000000000001 R11: 0000000000000246 R12: 00007ff=
f157dee70
> > [  283.623331] R13: 0000644e2fb203f8 R14: 00007fff157deef0 R15: 00007ff=
f157deeb0
> > [  283.623333]  </TASK>
> > [  283.623333] ---[ end trace 0000000000000000 ]---
> >=20
> > Fixes: 2dbf0d90971a ("drm/i915: Use CPU mapping for userspace dma-buf m=
map()")
> > Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > ---
> > v2:
> >   - Added Fixes tag
> >=20
> > v1 link: https://lore.kernel.org/r/20250108105346.240103-1-jacek.lawryn=
owicz%40linux.intel.com
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_dmabuf.c
> > index 9473050ac8425..809018265e36f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma=
_buf, struct vm_area_struct *
> >  	if (ret)
> >  		return ret;
> >=20
> > +	vm_flags_set(vma, VM_DONTEXPAND);
> >  	vma_set_file(vma, obj->base.filp);
> >=20
> >  	return 0;
> > --
> > 2.45.1
>=20
