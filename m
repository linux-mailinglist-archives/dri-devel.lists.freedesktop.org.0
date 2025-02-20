Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F83A3E1BB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 18:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7EF10E9B8;
	Thu, 20 Feb 2025 17:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiTIFThH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A721610E4CE;
 Thu, 20 Feb 2025 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740071037; x=1771607037;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=srrbmgEwcBAHBvEVMa8IiHo0T2scicwGc3XSrSLBkWc=;
 b=eiTIFThHVEqfvBNl8O6/W9cyQgonv4BzPbMgyASRLPvcrJeFMdKXjtHO
 JFzpp7MEF6jliPI6RXHgdYWAfp0RJRtaXfeTHYY68qJKKHFJ/RAu5rYqU
 cIp/BqLXNZn5+SPGaD4HJi9ieRDkpmuicBmagSKLGxKSTpB4UxUJoOx1u
 1iK2hcpoPHRjmlAtCSpOhci/n2dsnOTkhC2pD5u+Q/AUvmzBwnyNaZ3rc
 Ea6aFKpxpYpJULAR1/yFacDG89lpFMrAo1ktiwYk3XLhDeLXzcY1Y/I1I
 79VvtXKz/4GAViEABJLCchmFuBb6BnryZKwGeEZ5T+cQEN5xTmMAIK+qQ g==;
X-CSE-ConnectionGUID: m4s6JxicRr2qy27BJiVOqw==
X-CSE-MsgGUID: YY5BOsPoRSmzaVa9lfIQ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52269700"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="52269700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:03:57 -0800
X-CSE-ConnectionGUID: uCfNwl2tTXmZhJ17LRJTGg==
X-CSE-MsgGUID: /XMWkh/3S0CNV7eVUkUO6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="138316045"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:03:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 09:03:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 09:03:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 09:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGWWOZq/1M8s0hpNdVaEUVPflP6KfHy2SjKS02H9Q8GS0yEklQ92JQ9+9zWIYApa6fh8gEncWvcQXe0EL/PyCk5TobC5aRiDnIWdTU1LS16Zc2Qn2ybmf3oYkm6Ts//zzdTqzuoYQHnIGXPWAPbbi8bHeK5DQydru1J+a71RGqxPTM5aJngJvFJ2smFa2g6ZVmOS9l5Pv5bolOYVB1Y0TNIbya/eTnYHtZ12I/l43IbT8IJOU21WhnOU3hsEPzDws4JT8HRs8E16Z1n10H4hx4yZzdstJf4B88RMu3CjLThBCmPJztpGFTND51Kezt6H6Fb77dq6MZN5ur55YjoTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+Whe04FGCcva6lJfN+SKxXMsdT8nndkQFuaSrxLio4=;
 b=agPQeEfz/M2HNac6Z42KsFc72Bd62dWgQXtA/Yq460C2iw4KdJ7IKXEkEbr6cMLNe9M+41xA4UyE1i6Wh2J0NvdGgS727PBx8CP83sFwPrv2FA/s9T0LETBXVi8OTsS1hVHiTWsblaI1yAApra/K/1WKTmTBB7d8ANY2d3xW+tDCCyqXjz2agV3JtBPnTycwfpOp8mcTy0gAsZj007EmWH641+oFHptgqMLAreD0184ZFVOEodcWCCascVQ1F72naZ6YQB9JpV+UrWD167gThwtjL0NE+JAbhemLn6epYF/fMjAOq3kHzmlsc0OlYxW+DzfFB2P9UNTmOr4lTKyTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 17:03:51 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 17:03:51 +0000
Date: Thu, 20 Feb 2025 12:03:45 -0500
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
Subject: [PULL] drm-intel-fixes
Message-ID: <Z7dgcUG_hvityvHn@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1ca555-3fe7-4648-0c71-08dd51d08cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zCrSwbGQhEYnjC23IIMCD3wWPR5Qn2dvtEIFVwuXKHHm72v2y93xJjhsSN?=
 =?iso-8859-1?Q?wVZz+7mBlVgF6qDECvJ09AeMK/T0t4qOXapQ3mdDcz2PG4QlPuV4HsFXDT?=
 =?iso-8859-1?Q?aoY0kk50/S4WL1pU23iOeKinbh9RNqeQl052vvpGFapwRBaNVKWrwjtS3l?=
 =?iso-8859-1?Q?b0Rgltw7CffjJtXBiemLjAAFXn9lsS6A7ovv3LfzlxP9I9ezSNMv0aJahw?=
 =?iso-8859-1?Q?gRIhc0g97qc4AF0N/mNQATVPlwuUKBg6zXnje1R+F5/QCUSLUkg7d19xpQ?=
 =?iso-8859-1?Q?dqksQfBr1N7K5134M2PRNX8bX0PA9+SfoH66h8aPz97NfAVj5xciGUs5jm?=
 =?iso-8859-1?Q?kCFb/36WivTpMtyMKyigvRPpIlLujeLeF3J7F/ytrG6wDxONGVCHBepEk2?=
 =?iso-8859-1?Q?V9BAhMddoBeudHBnShJ7Mrj9NRJii/9obMHl98k9OC93BqDcskEwdHSPQB?=
 =?iso-8859-1?Q?or8OGEFPmA0N7VqvWSMbaKFPqklPN+lzrgJg/qZlI8ISDtyGw/xwIdd5gn?=
 =?iso-8859-1?Q?YPxa6bvVgPVlmXAObhi8dGUUh9KQTC10H2jY/HlFuL/YtlN0GZbr7q5iwM?=
 =?iso-8859-1?Q?nRU1FkJXA2EedTHTdlft/vaySBFvJxjAYSAdXyOvHsA7nuDQRZjyGeNl78?=
 =?iso-8859-1?Q?fqU7sFZSgWByr5P2nR4gCYhhFU6hW5Fnkz6BYGaqexpeSFHYbytIKe2gR8?=
 =?iso-8859-1?Q?jvTJEVH5HBV8+WGaKUyVVfhVJJmzsTvgfGv5e0iEcve7qg6u46XXJ1aYdS?=
 =?iso-8859-1?Q?oqXBlzkgRFTrDHMNWwvCiWOrT1j7iaaG/DQLeg0bOKUcRBGqK8E1KbkNVH?=
 =?iso-8859-1?Q?ICBYYBhi98js9JF2EGIb5Gja/3/vU6dPBRRGPaj3OpxNKRvTXGSIRwRRN9?=
 =?iso-8859-1?Q?bJu6KL6MesmQX32fDvW6+4DYvA49StQr9FSlANX9bJJRlv2+YFv3NYSECw?=
 =?iso-8859-1?Q?qg9aeN/hSUa67IQitD3FejIJUKRFjMv2MApwoqqoyytGcorMPo3Mxx64IZ?=
 =?iso-8859-1?Q?05vudjIcBqoDnm0pdFJIg8r3E4EhiiVEITVCoXCuHecuYtBI9e46l/+FvP?=
 =?iso-8859-1?Q?ocsoU/skPxveznrKLU3KEp+NCvsSB4MPchFhA/WnUyMBU07IvofksHSVKC?=
 =?iso-8859-1?Q?5ErsOCyGX3LjrWYMVUZxDwyU5RXvqlKylCoBol1kau69pRKu6lOMPTpNyx?=
 =?iso-8859-1?Q?VLW2K+pm8Xo5E+P6uKr+B+Q0nQKm82F3zWWoOwNFBRf+BDradpkGbKC0r7?=
 =?iso-8859-1?Q?32zRM61tXXGjSU/I0pmW2w+uMa03WqgP0E3U0mO+rGbthkfVPU+lyuSCv3?=
 =?iso-8859-1?Q?Fm5qBLvfnMxpBHOYb0qNDE9+jjge1tcmgi2ACxwZbVriunpz2tA62sO0jr?=
 =?iso-8859-1?Q?k8eK69g7sV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L8uehxZcvXDpSMTb7cfMS7KUQoqBrER+tBc7X1wBTAO4KxmwRg0FzPiHSp?=
 =?iso-8859-1?Q?s+FHLIBEBcbBJWd1L01VGuOUUulyr78cs5nKAwQP57mqpD5khIy9zoAtHy?=
 =?iso-8859-1?Q?NGHfjjXsN7Az71ZMsF2Zx4fftthy2P8avDaNdDkfa2E6PoNIFSia/rVaIA?=
 =?iso-8859-1?Q?yuZy5syw3nWTnz0K5EHOdVRr2KI/BQkglW7VFXf3vvLmhpe2Dr5ov+NFkJ?=
 =?iso-8859-1?Q?Mq6RIuwg1uIQ0W19QyOkZ7jWjbYbpip5vW35yIMr/LlxPDA4PM8c5hglkN?=
 =?iso-8859-1?Q?kpgOMQ4B8dI5KkdwT9xW8Hk4a2jdILO+5QlLa6FqjdNMQ/10S1t+BMRGzl?=
 =?iso-8859-1?Q?09a4LaP78WaRDcZiO8P2kHwhRXS/GEX9AUpjlKrzmkvfyZ0Cf+99GQ7CCA?=
 =?iso-8859-1?Q?AlgZ5t0nxPrglJUpFRvpZNgLwhIlSV8bFyWxhnG9X2fUipAKDqlqURZ+lz?=
 =?iso-8859-1?Q?JwwCcq7OSSLYuZ8dP4S+V8d39SW9v0GKkO1a7twLbg67pXVgKurkhFHAiE?=
 =?iso-8859-1?Q?Uu/0vJBYc7vcUKKe0ssm6lBiT0TtG0fAYYTJXcd8LEzjuFTEFzfxvuFsWs?=
 =?iso-8859-1?Q?vajbvxLr6uNAjUylBbVjAdtUna1mZmlmRlOehZWoW/coXFrBSkO8r8yHOq?=
 =?iso-8859-1?Q?0AO41fzYT+PClNumPCAvd80p/yWfi1kuUMnhucAB3neKCM16sxRp+mtEQ6?=
 =?iso-8859-1?Q?4P0LEFt5vQ9nCNcxymDLQ+Dumm5rxgX9Z77IeVvdUf2tJv3F0s+2GJL5XB?=
 =?iso-8859-1?Q?Katr9vlKD4aljIQRRSTLHojFs+RnjCRvpWsqCbxT9ZiV6Ox2WRyoTgTsvD?=
 =?iso-8859-1?Q?n99u4nxrf8V5t/ib8AVjEU8GItPUsM63PBf3Tkgoi/KVsPun85erl91N/C?=
 =?iso-8859-1?Q?C44y8hYD+YRPWOpizVFReO6t/LhTHWgKEIr2TsdaK56v3nffzJeK3WvGq0?=
 =?iso-8859-1?Q?29akm1qlVjIIJOkznwcDS0P+7BeaGEqkQxzoEqVt+UtqTo2tqovQleVtzR?=
 =?iso-8859-1?Q?4y3L/skohD3knHLfR9qfdC12PO2BwziN87cswmgoCzRjA2eKjCR6JX4AXX?=
 =?iso-8859-1?Q?44Kj4oSCQNhVTSvlCvav+v6P1MK0VIO37EQgVoqYEYnmKW4nEh96bNbm8I?=
 =?iso-8859-1?Q?sVm7vV33ZZpcBb4rIW0jl9tjIRQtyQEpUzcCPXi/jmb4I/F9TDKj4AH6kM?=
 =?iso-8859-1?Q?MB9Cf9jKEMA61L1RiBXv1y9W8QUIwLzepAAEi1pExWfTHaYo30zaPW9Qil?=
 =?iso-8859-1?Q?wQNF2aUwVGgg2ERGm1QsYTSxlCCTz6/FS0VfKtm7MmA/J+R4MSZLb8rnR3?=
 =?iso-8859-1?Q?p5ooPVV/OInXeNZJn3RnAeAk1qUpJDANnAhOJ5OWrKUm09UE6aE4qekHnF?=
 =?iso-8859-1?Q?KXcFCVE426KJ5NeixTY7vgAHk/bfYubrc+xopvbZzaeZ5OQ10EHzrPEmYp?=
 =?iso-8859-1?Q?uXKi4m8Td7ufSvA4lR8rTYWX/TVf4rauuVe6TpoUm9+fQYLfezQrN2PHTZ?=
 =?iso-8859-1?Q?YvommopqUz7di61d9dYrkXT49Xyy+so5U4X1FDhmLP/fC9PFNoyzMfKKUW?=
 =?iso-8859-1?Q?RCseh74YNkoqTQMzR+3ue7rQ2DkdVXOWT7xyPAMEZOJsCIyizGyHIUDViG?=
 =?iso-8859-1?Q?eqmrKSye/SbKR/RrKSi2m+I4ioEtBOubwWUIv24hRGX20AHEkW39UhGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1ca555-3fe7-4648-0c71-08dd51d08cab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 17:03:51.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q86SFpjIJjKFe91tqBuVSNbxGfzvIzvhERCGs+/J75MNZnRMJsRc4UxSkTQBop5NvkC2V2QN9kgnhJMdsuexLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

Here goes our i915 fixes for this round. Mostly display related,
with the exception of the spin_lock_irqsave conversion on guc submission.

Thanks,
Rodrigo.

drm-intel-fixes-2025-02-20:
- Use spin_lock_irqsave() in interruptible context on guc submission (Krzysztof)
- Fixes on DDI and TRANS programming (Imre)
- Make sure all planes in use by the joiner have their crtc included (Ville)
- Fix 128b/132b modeset issues (Imre)
The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-02-20

for you to fetch changes up to 8058b49bf6fff777bf3f47309c7b15dbef2191af:

  drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode (2025-02-19 14:42:31 -0500)

----------------------------------------------------------------
- Use spin_lock_irqsave() in interruptible context on guc submission (Krzysztof)
- Fixes on DDI and TRANS programming (Imre)
- Make sure all planes in use by the joiner have their crtc included (Ville)
- Fix 128b/132b modeset issues (Imre)

----------------------------------------------------------------
Imre Deak (4):
      drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
      drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
      drm/i915/dp: Fix error handling during 128b/132b link training
      drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode

Krzysztof Karas (1):
      drm/i915/gt: Use spin_lock_irqsave() in interruptible context

Ville Syrjälä (1):
      drm/i915: Make sure all planes in use by the joiner have their crtc included

 drivers/gpu/drm/i915/display/icl_dsi.c                |  4 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c              |  8 +++-----
 drivers/gpu/drm/i915/display/intel_display.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 15 ++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c     |  4 ++--
 drivers/gpu/drm/i915/i915_reg.h                       |  2 +-
 6 files changed, 40 insertions(+), 11 deletions(-)
