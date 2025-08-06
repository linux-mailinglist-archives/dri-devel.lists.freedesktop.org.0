Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8BB1C6C5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440A610E779;
	Wed,  6 Aug 2025 13:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jatZdoQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0A010E3E1;
 Wed,  6 Aug 2025 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754486694; x=1786022694;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=17oPGEzI76FozuI3AhiBqN9iUZfPyc+PTwwMPqS+ty8=;
 b=jatZdoQIk3OcZaHV8/wzLa79SDiTE2tr5GmpjkrFg5SmYQAYXd4kc01I
 Y66pZ/w3aMwRhn0xyruSi3uIdkKox0YtqH7UhCowutAGcLwk/kpycKiLo
 sR++JFVAe/7lsVNhd6N/V0Uv6MBpMyVwPFgIB66NGmUeY5GdAv+Q8b+LX
 h1v/BEdlbaRzuoukf46iHBgtflpFavNwJV5vvNXMqxftYt2h3lQvzwnp2
 MdLSJ4MuYH8VKp8mg0OUVxhRGhmAARvLDBAnZ20MGFH6xdi3N6yUcy9nQ
 FYZ1OxEsQqO3YnGD1S2MSZiyP+yJ/o0hdYraYQBCoUGx3Zvp8e/BKMAxH Q==;
X-CSE-ConnectionGUID: WvMgYW32QtmHyTbR3DcUCw==
X-CSE-MsgGUID: HwDiyV7RTlWjt4n6b3EbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56698481"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56698481"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 06:24:54 -0700
X-CSE-ConnectionGUID: MgdI3u5wR32qRYQySFYd3w==
X-CSE-MsgGUID: byXKbSRdSUuxs3iezkyIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165144992"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 06:24:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 06:24:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 06:24:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 06:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhLuQ+LVfNR/ah4ahqqOEl7+v7KMcpPwT6MBER/QKPUlGRLyeSBg2wuiXndxG7WAJ/+2YEMvGNqBDCWZRBU7XIHNBRgBQfxTBlNDc6wa4X+Vonrkg5BBIBHN16Alq/+vIRA9V7hYdHTJ8pVumUJowMzYkoVijXbii6orUFeaXMDnAtK57sDU6uvNNgZGw6anegFeH4a7U926NeRSW+bb8U5GIcQxoTs9zgp3n04Dn2QMlrHdyHa+MoDE67SodZWFlEfdcWB6liiJCLXc4UFrMgDY16/2pKFWa4hJqD+fBstCefg3zK5yJnFpJHMLi7v0L8FZtKzulNWepJ+L5tJmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAyVC3k9C0Wt28Sv6UbkofJnkE8PYEfRBc4sj5BQvDA=;
 b=qEOJW/BjqcgnkUyYxCROlSh6TlEAFgGMXuELKQ1c+YRM4nKVd4kdyOcNFJyZmwtf6iJc6/E5U0A91GZf9HdCp+5zuQEIVioC7rSKUcKRgPle7ELVVGbr7NbO4eUGKiCQ03Rb3oAVGRr1AGsGFiRkAAQhWbCbnoE07cJMLvGx3FtGom8Z+Z96qa4oTQ5E1T0w3NujuG0buR23AUgsQfpkHkpNKe8iAC1VUN+xy0X+Cd9yiBTtFt2ysKTbSWILggLmjRNKFR1m7bUjJs2usRE0Qi2c5ioWrap5f9mDIm6qaLAd86Vt7XIP1HTLQ6bOyXlna++2bUAYR84u8o3/uRhBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 13:24:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 13:24:50 +0000
Date: Wed, 6 Aug 2025 09:24:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aJNXnIAp2Cq-2pZj@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8da8ae-c441-49f0-89a6-08ddd4ec9f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uA6WMWoPCqk4Za9n92YCGuh9zJb68R3g156IKnwstq8ERJkLJuKNPYN2ExG7?=
 =?us-ascii?Q?0XeihxzX6nKwKc1Qk3bt97FnC7wLM/HRUV23/0KJGjc2qHapf2HkZK7zlEMm?=
 =?us-ascii?Q?rTW4aYy6Zx9x0OY25gmma/15MWBk3+ctZI40omPeSh1MZSwnFPo7YkAeLJrD?=
 =?us-ascii?Q?GBO0KlMHDtw8dh18vYtCHSQTK/bz+5INBSjrdWmB72y0HdIeQEkxN4H0p5yu?=
 =?us-ascii?Q?ht9KIhDU9m1pvR28gdsY9NkmUpHjHv8mRKbCVaFXfQ/0V2WXqyh3GmHZdnaX?=
 =?us-ascii?Q?zoFqA/LtAgq6BfjKjym7HYQ3ASkPKoK8zBaIdbu599rNV21Zjhey9UtXeeLm?=
 =?us-ascii?Q?dYnLXgh41LCjbU+kTcTNNs1UN8JxY6rx2/jzDUsLwlZtpULea8WJpLxeFWhH?=
 =?us-ascii?Q?xdFmrJJxHsXjuecKm2KrTsGEMtlpaOXujFdk/cd2eZsh+7O930AH5Hq59+Oj?=
 =?us-ascii?Q?92QVICiGGEoa9ql9sZnBm89QDeWudi0CdjykFDwkGH+GbDNFhMMoU5SYGnmi?=
 =?us-ascii?Q?nk7BSCJ/ht9BvqIsQP8CIF6dBQywT5PJw3sIfvYKGxj/oGuhbFwdWl2aEfyd?=
 =?us-ascii?Q?eBGgkFgDGFky9qbMoJDJ65qrKsIa6AemnwfB3dXDE2imH56z7ZYEBSbFh2Ig?=
 =?us-ascii?Q?k6Lvcab7CmVTraYfotyCyKvaB6iIWnvllyCmWXTurKv4giIZV4GA6Dm2BYdH?=
 =?us-ascii?Q?B/i6/shDD+Wb1Mgm6xbahr4UqYLsQNcKfcinnV1AW9zW8hqF+uX9raLXCAFK?=
 =?us-ascii?Q?J9G0gvNEu16mcHDpvYxkHjX/n7LXRtPv56iDuNirmxQz8+uhELDk3Aez4Nc7?=
 =?us-ascii?Q?QPZkxVLNu+qnBWvMXKYe/3RyVsM6Jz9I9P1B6SGjW6uG8gq+lEfE4KTSq7F7?=
 =?us-ascii?Q?n75KwsnqN1QT1gEO2YoFdAJJ1IP1ul7ry96lUF4F/GVeIHG2CZotnCjqOx2E?=
 =?us-ascii?Q?M0SzdZPq1avL+oHbai/kKX9V0HRZFraAjETy8X2YJkZeQMBKkWVd/wPQc4Mn?=
 =?us-ascii?Q?30tPQlA1/cK376oqVtWSyEkW5ky7WGXjbBX1w60h7axOg0VCQA37UPSRH3Ug?=
 =?us-ascii?Q?Waq1o44oM7rw1/nYayn4nTos/TYGnJWCNejXqeo5U4RjD2Wfmnlt8dR/dn6g?=
 =?us-ascii?Q?zfUIj2rJEVsNxx0lzEDv8ICmIked9QsdJAI8CFpzuHDPKYSZCnWbY7iTal1S?=
 =?us-ascii?Q?HQHUFELaRHJ99OBC2mqheh1oh79DhsKApXpSAx9ENOeao64PYZ242PQUtmjR?=
 =?us-ascii?Q?504THf+/UrPzJMtysP3vr/CKgWfkKZG0Qxa8/K0WHo5znkbuvKVUSd+Kiiam?=
 =?us-ascii?Q?jPxcDuIf6zirnIiO2qPD3PYRuSDLKH8BaGQ4GWsE7I5SRl6VTdUjFeWEETwU?=
 =?us-ascii?Q?hl90Yo8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LUkf/GIPn0NhH1wz01a022e4MDKYycqdecrPCh411VtdYiiuBgp0Got76tO8?=
 =?us-ascii?Q?hdVmAvdtXnk59TFwTdprGLUfe4l1yrWAV3VhBSmRr4t+YKWfUayu3wDiZiTI?=
 =?us-ascii?Q?p3p3rncjRHPg4Dm/Rz/EZ4yzZ++O/4oSUjmTHTfqOiQNbn2ORJj3WBlSP0qE?=
 =?us-ascii?Q?F/oa4pM+7RawbX4hfSLHPgpFVoPS/ktH+YIop+EmEBuBv6hzgrhfftv0lwfK?=
 =?us-ascii?Q?L3h64Gag3o4jtuMQ2gQamXGUCcIKBHioNsPb+3exCavMsqNVCsokITdMXZ3C?=
 =?us-ascii?Q?7tq5TaixqfAx371r+aGzhWu1pfDxYKhZhmMGMjDc4X3WPM5ZetV/XktjDJvz?=
 =?us-ascii?Q?TWgofF0uHkhw2PqiEShtZQnnLNte3KM9NbHD/cwK1gE+SSum9gg7txu9Qb7p?=
 =?us-ascii?Q?2cnpXFTUU1svHNlCLW56D5AlUfCwt0LI1T9PG2VJMdpphFR+0llXg+mXM3Bz?=
 =?us-ascii?Q?3teRTwRQFYQqHDqQMjsYMC1INXLtn9dOc8if5DbRY96gtOWARPTJfi2eVs38?=
 =?us-ascii?Q?BBhGCSZeYYUndvYmLHQxe4SOZrec1vgLRZdDQeihe5XfwkL476IYMFQh3LwF?=
 =?us-ascii?Q?IYO9NcDOryi5y3tK3XgudNLKMMQX22y5yJwo0BU82M1cGh5JtGvAtoqPbLKH?=
 =?us-ascii?Q?B6SP8/P4iZnjzJKzqmhMjVL0i/DcuXScI6YDWfKMqkNK6UwrOjqVX6i9ZZiw?=
 =?us-ascii?Q?yIao/xRCFL5zmy5pQRSsYZ42FYWOmC/Oh/OtpfbR/0Y6ufR3g56vyX+c3Ahx?=
 =?us-ascii?Q?YekQvVRTVRwZf32PN8Lsllm6e9s/9Gq7Myup7wv4jbeoAkMWD4zm+Y6E7TW1?=
 =?us-ascii?Q?99KGWldpnfTaYqoFPj2MUWgsxP6ERUkyDo9ZxsSLISCdvJI4DddGjt+7Mlpw?=
 =?us-ascii?Q?TcLOkjRu+HaRjQ4xG97VEzyw7BWFDZULm/HNLHvzNbqyeUQXIQ8ArRmHczHD?=
 =?us-ascii?Q?jVDbbODCgEZsype2TOWCa/qV1SO6il516lkWBtUKoJFH0PQF6bcYIaV0kTRC?=
 =?us-ascii?Q?tjpSMIcE5tmhewJLvgsZ28lQXLQn+GxniFMC/FNb0mOzUjTlPtQq0KrTbU5F?=
 =?us-ascii?Q?Xl1ILebbCyjWDo6N2btQBJxyJzA8LjyOOKPPGVi9sQvqfnFEv/fGp472pSP0?=
 =?us-ascii?Q?fA7hkP2IjJcz0x52mGhYfMD5wKCkkaiQ/4+tH4siDWA9O5NMltfXdjxDgBnq?=
 =?us-ascii?Q?H1fFFhrFaToZfFwN3hXI6muxM1mIiBKEeZaezXZqa9SJC8mNINqCCPx6YIhH?=
 =?us-ascii?Q?KWpLiyvOzz/Nw6qOixd2H8iHMUvI1SU3t8jUMxvc1pySA7NIIner8Li6VfwN?=
 =?us-ascii?Q?17BX070VmP5WjKWu30d+gUn9ktBWDKZUFxQsznOIG2X/2LhftEscugaynBB6?=
 =?us-ascii?Q?EDaVB7VBkK0JBV16Pu8NeANlVYq2x1nmWCLjcGeajrjb6moEEwbzGQscrQk7?=
 =?us-ascii?Q?JSdVNYER3KRgJhv1VxNs3Ry1TlreUEx89kPe5OU8tmBuB17h/kn9yqk7bjcB?=
 =?us-ascii?Q?ShRuswuN9XCzapLfq67rmfy3pcmZFC9bhIxd/IEq29f8FtxIoJUyqCE9jRai?=
 =?us-ascii?Q?wzPYvTmS76vZWoLK1HRKcbns+YWScjPCeJrLz1kXR6vm8nr98+C0dcjM01Sk?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8da8ae-c441-49f0-89a6-08ddd4ec9f1b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 13:24:50.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfannm0TU6z6iL+mgr0BOSasvCL+Smzskx0ZdsOWV2clZV7k8prIY9zOPW9VMC5FPd/vw4uvhC1fWeNE4Vi8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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

Hi Dave and Sima,

Here goes our last xe-next-fixes pr towards 6.17-rc1.

It marks Xe driver as BROKEN if kernel page is not 4K, while
we don't fix this ARM support, but work is in progress there.

Also, mostly SRIOV fixes, but one patch that is more of a
convenience, removing the need of a kernel parameter to go
to a PF mode in virtualized environment. I hope it is okay
for this stage.

Thanks,
Rodrigo.

drm-xe-next-fixes-2025-08-06:
 - SRIOV: PF fixes and removal of need of module param (Michal)
 - Fix driver unbind around Devcoredump (Bala)
 - Mark xe driver as BROKEN if kernel page size is not 4kB (Simon)
The following changes since commit 6531a2cf07ef156956840853692755cc7e1621b7:

  Merge tag 'drm-xe-next-fixes-2025-07-31' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-08-01 07:09:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-08-06

for you to fetch changes up to 022906afdf90327bce33d52fb4fb41b6c7d618fb:

  Mark xe driver as BROKEN if kernel page size is not 4kB (2025-08-04 11:59:11 -0400)

----------------------------------------------------------------
 - SRIOV: PF fixes and removal of need of module param (Michal)
 - Fix driver unbind around Devcoredump (Bala)
 - Mark xe driver as BROKEN if kernel page size is not 4kB (Simon)

----------------------------------------------------------------
Balasubramani Vivekanandan (1):
      drm/xe/devcoredump: Defer devcoredump initialization during probe

Michal Wajdeczko (3):
      drm/xe/pf: Enable SR-IOV PF mode by default
      drm/xe/pf: Disable PF restart worker on device removal
      drm/xe/pf: Make sure PF is ready to configure VFs

Simon Richter (1):
      Mark xe driver as BROKEN if kernel page size is not 4kB

 drivers/gpu/drm/xe/Kconfig                  |  1 +
 drivers/gpu/drm/xe/xe_device.c              |  8 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 57 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 +-
 drivers/gpu/drm/xe/xe_guc_capture.c         |  6 +++
 drivers/gpu/drm/xe/xe_module.c              |  8 +++-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++-
 drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 ++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
 10 files changed, 112 insertions(+), 8 deletions(-)
