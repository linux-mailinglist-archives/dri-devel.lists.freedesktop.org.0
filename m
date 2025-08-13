Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40200B25477
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 22:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEA010E1EE;
	Wed, 13 Aug 2025 20:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMID1aJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815BC10E0A7;
 Wed, 13 Aug 2025 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755116484; x=1786652484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=45a8MxzWjs6iQKAt2Yyjrxxo81Pk7Enl/nzAsh6Rhuk=;
 b=SMID1aJaV91Bf7MfyWrtgGnW1YcWw7YD1aP6yRA9oYxdhH7TdxOGYMDV
 GT6Mol4g382BwwB9BmK9l/n8WF+WcZSxuke8slg2PrQGeMMkD6gamBUFX
 SeCRVykOpW/6kSs6CKLQcNiSQfJet3JEch7Z4Yev9o8Ph+YnbEV4Icu5d
 mMsM+xvaqbcEmDacJR+7VW+NgyzWoJKFCy/J+rbc1FrnaKGSBR+ahMPYH
 gVhVEOOEFF2kAGKoBxEM1d5u0TfKI7038XLw42YA4J2Ra9mWoroYpMy7s
 fDGrR2+ZLA6ctCYRn3mJiPkVlSqanaXhq5Si+VBwIOB5J+BumTAVK1ZfJ A==;
X-CSE-ConnectionGUID: jC+0IKgaR/u2wHX+V2YqPw==
X-CSE-MsgGUID: sVAiUfvERGWNZtSqbQDhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="80000004"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="80000004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 13:21:22 -0700
X-CSE-ConnectionGUID: X7CSQs11Tl+tu/N7XftzQw==
X-CSE-MsgGUID: WylWyvkqToS9RC2Outo1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166931457"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 13:21:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 13:21:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 13:21:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 13:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDHxALuMqy3XDARppqHkru5kkLzkXAYyhLF+yUsOUfQ2c+PJdKOzKaYeRNryJUIEriO4lRaorKyffVWKWWfNTcQn0hjuQaCG9jhtdbt55Z8dLKJh+lq1UZ2RcPTEMM8bhPasc0uN6zY9tK1eTR4/AcDDgbz+WbQatDvQMxiSL3OAQbNj9iq8LFgKBQdS/MA/SDGuYke/0+9knHJZx/4I7U8eyJo0vQzSKDhWyP7ZtNsOku5QBRAjOatRTq68DBmY/+vVMhi8x9AVUly/UYECpfdnYlslxgPLhSedJ1FbhRyC7lKR4r+Bx3W+my1+bmYIe2k225jipDwaGRwbN+3Lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLtdriuRAs9jETY1eWCDpIyYQDYYlgxyhWKmk0mgjOI=;
 b=CQBrze7+vxxw0BNqj4lZVPw0KzIF5vFw2jrN9AKUAobdZVnCnBf+tPAlJf90jwD2AK5/GUPIMyDZ3boXsqGbpOGEefgVlG+vV15lIxfuj4EMySBJhOCDmYe491Hs+1US/sObhx5CZsAJHttLPT6u9vRNia/lISX4mpx4KxJ0xzVgMWzszVsfL4DUjZsW0TcW4ggBYHK+kug0mw2/qnfSZ6mak3rzUu3klZP7/NjZ5t9yzw4Fh9eMLbSlHRPAlwCuR+jNEsCHkhFTAKR3t0+YSYsWH41Ai9wPv12rnxf78G7W65qlOG9rLiiIhJTa0ADyVqCjKALsRSpYvvbPbd67FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 20:21:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 20:21:11 +0000
Date: Wed, 13 Aug 2025 16:21:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry
 across drm subsystem
Message-ID: <aJzzr-ZuJCrd8r7x@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: c1663c7c-bf4f-4816-650a-08dddaa6f172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|3613699012; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N8pHeVP7w1UKQhNPcWLwZ/g5b9c1TPO9L8AvwH12gN3rDvxwy66W9e9gocJG?=
 =?us-ascii?Q?FVuqDpucTOker7OjN0ENYva5xIyeEwBK3cdkzod0Vj4KxWZgt2R/lwUolxa9?=
 =?us-ascii?Q?nE4KY0BaxDSYdRfzyyWJRgIzN2NAcLAKJAnmkXZkf3zzNDHvwYJuxNM4ZA+U?=
 =?us-ascii?Q?lRRgSrExgZwZMx8zsuVp+ifnAQBcvA+5IC/2+2DfgQGwM1KaXstgkSEHCT7w?=
 =?us-ascii?Q?oYn3V95dZWwx91BIXOl8qqvrjGR+AN+dapFeW2v58wWlJCvMSrVl31EatlOy?=
 =?us-ascii?Q?iygTOJxNPFsJxvuKkhUlgCSLJwIdpLsS2CFNNR7RnouGCkbmOn4+bCwZSeXl?=
 =?us-ascii?Q?4XqBPv0n0Y4PnVXhw036uQElWg64rOR7un7Y61PF3s5xkwlnTgYrn/E8qM1t?=
 =?us-ascii?Q?O+LJqN0/dwxA6BRR0sd53tuTN/heqXnV+euTd8RqDOXhoj3+rMtJ1nYLMK1N?=
 =?us-ascii?Q?kFYidDgWsvhlSqLXLpw9/URLIvAF8b4OS3cTFCHRg0jMriPuaOuHjNj0/1b4?=
 =?us-ascii?Q?DfH/nMoxr4ED71k8ijuaqWD/maV6balWuCitAFz4bvBxnFSujmzz66HaySmU?=
 =?us-ascii?Q?lHQn4OVoDLbCWiA4Wh5KcsRreT/uH70iTzrLocMrosqP/WAsLB7wCCHKK3O9?=
 =?us-ascii?Q?JKjZk/QExmQ9Ubxbuteuy05NHTv1LnqRtlfqmCDXLQkJ8bZJQP0rLR7MNgB7?=
 =?us-ascii?Q?q7JeU9RLEf6WHH2iZe5N/WOZWJ7z9pgeKfYebNKgQSiOVSdJvbYJYY6/UbYP?=
 =?us-ascii?Q?VF9xxiGS7LuTGhCYtrtZb4e7AC5burv8Ki4srvDH65kbx8DLvQ60RL5x1kOX?=
 =?us-ascii?Q?0a4ajmDz3dLrBUsB01eyIeY871QSEJf9UWwoWRC3TEpN6F4hQaQGrxf4pPiO?=
 =?us-ascii?Q?FWzTxH+p0D3p9e5QtBnKDOK1XwCcE8mtKKunQQ62QPbs26ItPvtGg851gUcL?=
 =?us-ascii?Q?jaFRe1pUIQ29rcopSCzAsGg4fWYkrdZplsDLVx2uwVHmAJ44SOjM86rjKcGo?=
 =?us-ascii?Q?QcrTnIh/lJ4h6hdK3MvI6L34DHiU2k9rPE/l4dDjSCYEQJUZ3IvmSXlv0S5z?=
 =?us-ascii?Q?KLMqNkbyflxtbM0fetpfkNeswK4DGZ4rHjmyD/VJ2rSj6Bdq40MEo2ZIEUVg?=
 =?us-ascii?Q?LU35TTBUV2i8CZdu56XDEjQgTsqpwiAg+R0xbcwOS5GGEhsGtAJ6v8+c82AU?=
 =?us-ascii?Q?BqZTRjZRqxBbNTu5QDXJWJ6JriU2NiAWT2UxtGMHLQr5ofLD+9Oa7WoR6iyn?=
 =?us-ascii?Q?ns54VaMwMClaVtsflnjNZYhCQg3FFRFmj9kVtg8I0EN2woPC7o9yRfMLpBe7?=
 =?us-ascii?Q?x/5ElSFhQMW0Xc/w/ukMJ+N2w2bZp7rmcpU/5ZmTtPseMUvkGpDyTUVqY0C4?=
 =?us-ascii?Q?Xve8CQD711hJ2eHflGV4opJMd5mra7EFTbT4HMoxH7Nrm56ko2V3bS4Yh1Cq?=
 =?us-ascii?Q?rrL+LL6CtLRvZ7n3sLKihnX2RmXQifrX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(3613699012); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8sDarTADF74dyCX8V+bvBA/si5+PGWN0TCqfa7UcSI3zHRzf1402qlMGddPI?=
 =?us-ascii?Q?b17g9m//fjnISZ+KxD3WpfStnaf6i7KViL8LYWegGGE8YgESPLF7Iv559QH0?=
 =?us-ascii?Q?L8MthrU5bj6I3VQocDx6hZXrL7O/c3vFIEifPiD0wYg9pcbAPXS8+CQcuoMZ?=
 =?us-ascii?Q?qGrGELP6UI6OZXEG6kfnXs8vc6OQMvN3sU2R3TzUokjZ4cPmmq/gUnVHqHts?=
 =?us-ascii?Q?hsU1QRXsq5JUqdH4pmuz8u2ofHnHA+JftfWopfj2gnsMAHxdwAqQzJ64uWI1?=
 =?us-ascii?Q?dcfC7569+ltY59SgS0D8cLBJpsn4tEntvYNhlJiQz15uWZ/C36aias5PAM1o?=
 =?us-ascii?Q?PUYHxHS87ubmq+RRVBEvjPkyqkg6B5mv+340U1sx+UUgefY3jr2pNrtN+TuA?=
 =?us-ascii?Q?31NVym/Oz1tEpt84cdYdnpFKvpCcoV1sRz010UYNRsXZvnrqERKT/GB3DumO?=
 =?us-ascii?Q?/u3L0VfCnIEy30Da0bEyWnxj80Om81fo+podBID0crB8TroFlQr9sxpRMexM?=
 =?us-ascii?Q?EZN+M6f7ltVpz0UjZQtrcST163UiNCB0orkJI1A2qhK/9u4RMunOyY6f/S0X?=
 =?us-ascii?Q?zAmKXbpjQ6FV3MZhP98mqw8ZM4h4rmHnAmydAkhTVSSSRtO6PRrLLSkvGD1B?=
 =?us-ascii?Q?fKx574ju+vvKk6mZXyBrWp1Huaqv3mIKmFPLP76fQb9+ce3qUYxsFWL0/Rh0?=
 =?us-ascii?Q?riArSbf+OjM3UpR9EcMPg1w32SyU8Zr7baAYWY2hcbOAN6wUUpgcGXErIhoF?=
 =?us-ascii?Q?nPPl856VL5Bbh98E9HxQEv3T5wjaAxD7T12lThh5T8aUaP9tw1B1oyTgR66n?=
 =?us-ascii?Q?OgHLv80oHkNZTgvxbnlHzGoifKwGzKc1bv7Be436dAn/iOc4VE1rvNRDgTIq?=
 =?us-ascii?Q?i7OWoF6cwJMG1u3kKp1o2jmhSmByOEdwuD+zPNwcwjn08v5n74nZxaui5GQy?=
 =?us-ascii?Q?KNZQFK932CmfULI9sWtzvWixorH4Xi6TyKECqXH3BsqOzpi+BzKsXavfHZ66?=
 =?us-ascii?Q?VUiyn7J301xxiEEmO/wwwNoWyLSiQVQ4qMSOWqeGgWpoFG5BY2nr6/Mc4V1m?=
 =?us-ascii?Q?pfOrAaHMobpTcZKO7IjiYZxP/sOnSpXqoWJvECapsonFIoNy0xYXzRCLrwvX?=
 =?us-ascii?Q?J3IPJyz5Rn+SiYli4s2QTWBVTO58kV/tCec8I/Da4jlDlJA1IisSy2D3Kkdt?=
 =?us-ascii?Q?0lUyJhRQ6h32YBy31Uxja9JjXH358G/gL4w0M7O9jmYsd2sZeML4wBdx0NNn?=
 =?us-ascii?Q?cbgSbNpGuw2NW3Bt/RLeaQsJVvHXZCtv6QzfafJyA6dP7liKFKr4JUQImLk1?=
 =?us-ascii?Q?YcxD4AvJX3XamjNebvJrkZKIDJhLlcFdAqqTpYWsSB0klvp5V+j4JafPtmfb?=
 =?us-ascii?Q?L4R/emQ7T2bwnRm0v3vcrXfouvgzw1j/itSjeSTFazx5ylerZG/jnCugbgFB?=
 =?us-ascii?Q?FMHjFzzZGuPB+wm7Z+5wmMFlrQGY8+Knaq1Bvqpbu5RpuxS+KCfPAGUvDCs3?=
 =?us-ascii?Q?2WCCXvpEiyDFBhfB+Mmx+8ecAz76QDzLB21Bm4Xs1BBC/qB1uwUVIWOXMH4e?=
 =?us-ascii?Q?9tN1NHjoIT1BdNBujorXElPlGNScDxHZZq2F2poa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1663c7c-bf4f-4816-650a-08dddaa6f172
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 20:21:11.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D7eXK98CAOPZnIdIY8RRUql8HTMBaLQP//4XGt/Q3EjF72iJbRvc0HT/q/nwGq+/x2CrMOKQcSz0LUx0Uf7iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
> Revisiting this patch series to address pending feedback and help move
> the discussion towards a conclusion. This revision includes updates
> based on previous comments[1] and aims to clarify outstanding concerns.
> Specifically added command to facility reporting errors from IP blocks
> to support AMDGPU driver model of RAS.
> [1]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
> 
> I sincerely appreciate everyones patience and thoughtful reviews so
> far, and I hope this refreshed series facilitates the final evaluation
> and acceptance.
> 
> Please feel free to share any further suggestions or questions.
> 
> Thank you for your continued consideration.
> ----------------------------------------------------------------------
> 
> Our hardware supports RAS(Reliability, Availability, Serviceability) by
> reporting the errors to the host, which the KMD processes and exposes a
> set of error counters which can be used by observability tools to take 
> corrective actions or repairs. Traditionally there were being exposed 
> via PMU (for relative counters) and sysfs interface (for absolute 
> value) in our internal branch. But, due to the limitations in this 
> approach to use two interfaces and also not able to have an event based 
> reporting or configurability, an alternative approach to try netlink 
> was suggested by community for drm subsystem wide UAPI for RAS and 
> telemetry as discussed in [2]. 
> 
> This [2] is the inspiration to this series. It uses the generic
> netlink(genl) family subsystem and exposes a set of commands that can
> be used by every drm driver, the framework provides a means to have
> custom commands too. Each drm driver instance in this example xe driver
> instance registers a family and operations to the genl subsystem through
> which it enumerates and reports the error counters. An event based
> notification is also supported to which userpace can subscribe to and
> be notified when any error occurs and read the error counter this avoids
> continuous polling on error counter. This can also be extended to
> threshold based notification.
> 
> [2]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

I'm bringing some thoughts below and I'd like to get inputs from folks involved
in the original discussions here please.
Any thought is welcomed so we can move faster towards a real GPU standard RAS
solution.

> 
> This series is on top [3] series which introduces error counting infra in Xe
> driver.
> [3]: https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/
> 
> V5:
> Add support to read error corresponding to an IP BLOCK

I honestly don't believe that this version solves all the concerns raised by
AMD folks in the previous reviews. It is true that this is bringing ways of
reading errors per IP block, but if I understood them correctly, they would
like better (and separate) ways to declare and handle the errors coming from
different IP block, rather than simply reading/querying for them filtered out.

So, I have som grouping ideas below.

> 
> v4:
> 1. Rebase
> 2. rename drm_genl_send to drm_genl_reply

But before going to the ideas below I'd like to also raise the naming issue
that I see with this proposal.

I was recently running some experiments to devlink with this and similar
cases. I don't believe that devlink is a good fit for our drm-ras. It is
way too much centric on network devices and any addition there to our
GPU RAS would be a heavy lift. But, there are some good things from there
that we could perhaps get inspiration from.

Starting from the name. devlink is the name of the tool and the name
of the framework. It uses netlink on the back, but totally abstracting
that. Here in this version we can see:
drm_ras: the tool
drm_netlink: the abstraction
drm_genl_*: the wrapper?

So, I believe that as devlink we should have a single name for everything
and avoid wrappers but providing the real module registration, with
groups, and functions. Entirely abstracting the netlink and focusing
on the RAS functionalities.

I'm terrible with naming, but playing a bit with AI for some suggestions,
I'd say that my favorites are:
drmras - no '_' like most of the tools, but not only for the tool, but also for
the files and functions.
drmlink - more link, but less ras :/
grill - GPU RAS Interface Link Layer

For the rest of the examples below I'm going with grill, but let me know your
preferences.

> 3. catch error from xa_store and handle appropriately
> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
> having an early check of IS_DGFX (Michael J. Ruhl)
> 
> v3:
> 1. Rebase on latest RAS series for XE
> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
> register to netlink subsystem
> 
> v2: define common interfaces to genl netlink subsystem that all drm drivers
> can leverage.
> 
> Below is an example tool drm_ras which demonstrates the use of the
> supported commands. The tool will be sent to ML with the subject
> "[RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
> https://lore.kernel.org/all/20250730061342.1380217-2-aravind.iddamsetty@linux.intel.com/
> 
> read single error counter:
> 
> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
> counter value 0

no need for --device, that should be mandatory argument.
And we could accept BDF or card identification

$ grill list
00:03:00.0 - card0 - xe

$ grill 00:03:00.0 list # Querying available modules.
monitor - global
erros - gt
erros - soc

Yes, my idea is that driver should be able to register modules and group per module

GRILL would be designed to accommodate multiple kinds of RAS modules, each module,
with groups, categories and operations.

Modules: monitor, error, flash?!, etc?!
Groups: Global or per IP block depending on the HW underneath
Categories: Sub-groups like correctable-error vs uncorrectable-error for instance if/where
	    it makes sense.
Operations: Monitor: set-threshold / listen (listen is just a tool operation, but every monitor
	    needs to provide events over netlink)
	    Error: read, clear, logs


$ grill 00:03:00.0 error global counter list
# List all available counters in this gpu

$ grill 00:03:00.0 error global counter show soc_fatal_hbm2_chnl0
# Show a specific counter.

$ grill 00:03:00.0 error global log
# Print all the stashed CPER logs (stash can be hw/fw/sw or a combination -
  	    		     	   in AMD case it is a dump of their debugfs ring)


So, I'm sure the next question is what if the log is global, but the counters
are not? Well, perhaps we should have different Modules for error-counter
split from error-logging ?!

So yes, my thoughts still have some opens, but I'd like to hear your thoughts
and opinions on the overall idea here.

Thanks in advance,
Rodrigo.

> 
> read all error counters:
> 
> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
> name                                                    config-id               counter
> 
> error-gt0-correctable-guc                               0x0000000000000001      0
> error-gt0-correctable-slm                               0x0000000000000003      0
> error-gt0-correctable-eu-ic                             0x0000000000000004      0
> error-gt0-correctable-eu-grf                            0x0000000000000005      0
> error-gt0-fatal-guc                                     0x0000000000000009      0
> error-gt0-fatal-slm                                     0x000000000000000d      0
> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
> error-gt0-fatal-fpu                                     0x0000000000000010      0
> error-gt0-fatal-tlb                                     0x0000000000000011      0
> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
> error-gt0-correctable-subslice                          0x0000000000000013      0
> error-gt0-correctable-l3bank                            0x0000000000000014      0
> error-gt0-fatal-subslice                                0x0000000000000015      0
> error-gt0-fatal-l3bank                                  0x0000000000000016      0
> error-gt0-sgunit-correctable                            0x0000000000000017      0
> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
> error-gt0-sgunit-fatal                                  0x0000000000000019      0
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
> error-gt0-soc-fatal-punit                               0x000000000000001d      0
> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
> error-gt1-correctable-guc                               0x1000000000000001      0
> error-gt1-correctable-slm                               0x1000000000000003      0
> error-gt1-correctable-eu-ic                             0x1000000000000004      0
> error-gt1-correctable-eu-grf                            0x1000000000000005      0
> error-gt1-fatal-guc                                     0x1000000000000009      0
> error-gt1-fatal-slm                                     0x100000000000000d      0
> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
> error-gt1-fatal-fpu                                     0x1000000000000010      0
> error-gt1-fatal-tlb                                     0x1000000000000011      0
> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
> error-gt1-correctable-subslice                          0x1000000000000013      0
> error-gt1-correctable-l3bank                            0x1000000000000014      0
> error-gt1-fatal-subslice                                0x1000000000000015      0
> error-gt1-fatal-l3bank                                  0x1000000000000016      0
> error-gt1-sgunit-correctable                            0x1000000000000017      0
> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
> error-gt1-sgunit-fatal                                  0x1000000000000019      0
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
> error-gt1-soc-fatal-punit                               0x100000000000001d      0
> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
> 
> wait on a error event:
> 
> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
> waiting for error event
> error event received
> counter value 0
> 
> list all errors:
> 
> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
> name                                                    config-id
> 
> error-gt0-correctable-guc                               0x0000000000000001
> error-gt0-correctable-slm                               0x0000000000000003
> error-gt0-correctable-eu-ic                             0x0000000000000004
> error-gt0-correctable-eu-grf                            0x0000000000000005
> error-gt0-fatal-guc                                     0x0000000000000009
> error-gt0-fatal-slm                                     0x000000000000000d
> error-gt0-fatal-eu-grf                                  0x000000000000000f
> error-gt0-fatal-fpu                                     0x0000000000000010
> error-gt0-fatal-tlb                                     0x0000000000000011
> error-gt0-fatal-l3-fabric                               0x0000000000000012
> error-gt0-correctable-subslice                          0x0000000000000013
> error-gt0-correctable-l3bank                            0x0000000000000014
> error-gt0-fatal-subslice                                0x0000000000000015
> error-gt0-fatal-l3bank                                  0x0000000000000016
> error-gt0-sgunit-correctable                            0x0000000000000017
> error-gt0-sgunit-nonfatal                               0x0000000000000018
> error-gt0-sgunit-fatal                                  0x0000000000000019
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
> error-gt0-soc-fatal-punit                               0x000000000000001d
> error-gt0-soc-fatal-psf-0                               0x000000000000001e
> error-gt0-soc-fatal-psf-1                               0x000000000000001f
> error-gt0-soc-fatal-psf-2                               0x0000000000000020
> error-gt0-soc-fatal-cd0                                 0x0000000000000021
> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
> error-gt1-correctable-guc                               0x1000000000000001
> error-gt1-correctable-slm                               0x1000000000000003
> error-gt1-correctable-eu-ic                             0x1000000000000004
> error-gt1-correctable-eu-grf                            0x1000000000000005
> error-gt1-fatal-guc                                     0x1000000000000009
> error-gt1-fatal-slm                                     0x100000000000000d
> error-gt1-fatal-eu-grf                                  0x100000000000000f
> error-gt1-fatal-fpu                                     0x1000000000000010
> error-gt1-fatal-tlb                                     0x1000000000000011
> error-gt1-fatal-l3-fabric                               0x1000000000000012
> error-gt1-correctable-subslice                          0x1000000000000013
> error-gt1-correctable-l3bank                            0x1000000000000014
> error-gt1-fatal-subslice                                0x1000000000000015
> error-gt1-fatal-l3bank                                  0x1000000000000016
> error-gt1-sgunit-correctable                            0x1000000000000017
> error-gt1-sgunit-nonfatal                               0x1000000000000018
> error-gt1-sgunit-fatal                                  0x1000000000000019
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
> error-gt1-soc-fatal-punit                               0x100000000000001d
> error-gt1-soc-fatal-psf-0                               0x100000000000001e
> error-gt1-soc-fatal-psf-1                               0x100000000000001f
> error-gt1-soc-fatal-psf-2                               0x1000000000000020
> error-gt1-soc-fatal-cd0                                 0x1000000000000021
> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> 
> Aravind Iddamsetty (5):
>   drm/netlink: Add netlink infrastructure
>   drm/xe/RAS: Register netlink capability
>   drm/xe/RAS: Expose the error counters
>   drm/netlink: Define multicast groups
>   drm/xe/RAS: send multicast event on occurrence of an error
> 
>  drivers/gpu/drm/Makefile             |   1 +
>  drivers/gpu/drm/drm_drv.c            |   7 +
>  drivers/gpu/drm/drm_netlink.c        | 219 +++++++++++
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>  drivers/gpu/drm/xe/xe_device_types.h |   1 +
>  drivers/gpu/drm/xe/xe_hw_error.c     |  56 ++-
>  drivers/gpu/drm/xe/xe_netlink.c      | 531 +++++++++++++++++++++++++++
>  include/drm/drm_device.h             |  10 +
>  include/drm/drm_drv.h                |   7 +
>  include/drm/drm_netlink.h            |  46 +++
>  include/uapi/drm/drm_netlink.h       | 105 ++++++
>  include/uapi/drm/xe_drm.h            |  85 +++++
>  13 files changed, 1071 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_netlink.c
>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>  create mode 100644 include/drm/drm_netlink.h
>  create mode 100644 include/uapi/drm/drm_netlink.h
> 
> -- 
> 2.25.1
> 
