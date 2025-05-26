Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D1AC44E9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A9610E40D;
	Mon, 26 May 2025 21:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fw3x4NIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866B10E3FA;
 Mon, 26 May 2025 21:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295885; x=1779831885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YXDETcVgWk0h5QQAnM8vblY2njLKS62kyLPcID4xASk=;
 b=Fw3x4NIVexEehQ0VeU3tibadU0W9hiXMVcj9AaLqa5667Fhm/URrc0DR
 ATzronyhyTeEGxJoIjHGaQP32YWA3WH4nNaLkBH0Z69ylz5Aly8llZd+M
 nv/RitU9F42sFVTWGrd2YUy51WirIpAs/Ci2uJAXIwDigncmyHywZuV16
 R8eriMlMEgOxbVB++v+wq9jbL+DJKbp7dUPByEQS7XMye/MROmqvbo4Fb
 yzZK14NWTdKFlaaBTQ7U+fJ7XFikb5JLMl7/Ftx9DhL3/3cSMtxwaI3IE
 ARR4TlVV5ALAMj511Hb2Th9noJBdKCtvxEUQxzm8DTPkOoVNklmUqyyC9 Q==;
X-CSE-ConnectionGUID: zp1RW42uRuSn3loGlEc6cg==
X-CSE-MsgGUID: UpwDdTf8SgGkumfg7CLM8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60928276"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60928276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:44 -0700
X-CSE-ConnectionGUID: 4GsC2oxuQjmYfP6ZRedx0g==
X-CSE-MsgGUID: nKUL3Ap+Tk+0Ans5CWOWKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="147766333"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGCgVh1GcTG9rSb66xa6/l5uWxdjVLM+epn6eNYPCbmz4crFPvNqb00vXI7/HdZtmMP1rurkhaQD6QhAscDbuqyLEV3U543nKclwyOMncKfxq9MhhMpgNXI06JyQvvm2awXduniDg0DCrZ+UgHVtxVKo5t26uaJdkQr9gBQX86vRrVqM0TIxAFcTA6foTrC665chniE8qKyRoFnzFcwnUbYcOzV1Cli+1kGWCiVX7zS3EFOo6PqbrdpVlzrc1RIsUfs51ASukXHLcNUHMWVIwR5G1K3zaL/jIRvgDArXOfQ17g0OALJkb3+kluXo8lcH3Z3psNr0TocSdUPMXtAV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtYXYWswNNFKOhXSo4+9nq05fTzHNnAkr+P1Q0clw9E=;
 b=aP7saijWJL5J61sXDnvwni8S+PuQ/SFamHGwNSEXxVO9+d0VsCIKKADpiRSqRS3T6ONMg0md50uDSFbPTlzhag9sEZ8oQ/hRQZ6aZXxw2R0Ly0OJk4ukr5q++h06c8/6FB1BoMvv5QWVe8gl6I5U8LkgU/TYPcYE7y3I7sRQGVjvDqs1946KNoBMxv920cN6pCZoPtyJ0bu28tTtvTNqUXXSCCc6RVNERicL+VS4HwDUK2BSMpTjoPrXExrkQGwLbWB+CcVzqdvBOpqwJ6TlwK7hBW3/FZUFaLonOd1bGW2dWeVfY41oFqVn9EZBlx9P/BfN8RafKSz/UB3pYREdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v8 5/6] PCI: Allow drivers to control VF BAR size
Date: Mon, 26 May 2025 23:42:56 +0200
Message-ID: <20250526214257.3481760-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526214257.3481760-1-michal.winiarski@intel.com>
References: <20250526214257.3481760-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: b145d4ad-fa2a-4003-4234-08dd9c9e7f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3I0RW1haVR6bmZ3VDJVVHFjS0s1akhWTUppTWcyQk85L1NGcUl4cEdlVUxm?=
 =?utf-8?B?UDZMZXN2Q3cwcDdiUi8yK3ZQdWd0WEhyQ0FxSXcyV3NTZmMyZmxFbmZ4eG9q?=
 =?utf-8?B?UjBPejcyMGNMby9yU2plSjdRUU9jVEg1VHR0TDNFTTNna21sWDl2U2tudXdO?=
 =?utf-8?B?WkFmZ3ZFL1dmb3BvY2h4Nmc2UDl4emhSOEgwbGRzTmFjSEFLaWVScnZmR0py?=
 =?utf-8?B?WVlCT1BVQzZram9JeHhDQUM4UHFicE1Jb3lacXZuVnNpcStlVm1pazNEK0g2?=
 =?utf-8?B?Y2JkMXd6czc2VkZCYzNINFNsQkdGdjNUYVJzdmplRElhWUYvRE15L2lETFdH?=
 =?utf-8?B?aG1ZTjlHQlRCblFrUm9SdE0wNzhwZ2xpMnBOdGJSWjR2ZEtSQ2cvOE0yZUth?=
 =?utf-8?B?UXpuQklSOTg3NXFjQ1VzaVJMNHVsUlNVbmxDeGdtQTZvSFFKeUVkY0RsSC9E?=
 =?utf-8?B?V1FEUlZ1U0RYdWVjL0dWRHV6bnVseUMydEd5cVRBZ1pGMVo5OWU4STJKWFZn?=
 =?utf-8?B?MkdEM2hISzFIbHJDcDNlWVk0blZ4V1lwbVNHOVVncmdhczlUTTBkdHZ0elZB?=
 =?utf-8?B?OVBGMTU3S0JXWjFmZ1FTRFVnbTlrQ1F1Wll2K2NyWFZnTmE0SGZaQStPR0RD?=
 =?utf-8?B?dnBGYzR1ZVhPTlc1d3RVYTVENGNZdzBSdFNqY1BCRGFXVHZqUnZXdTZHUEhy?=
 =?utf-8?B?eXl3eFViTHpzSVRzVEp1bXBRR1MxYlZsb0lSQTJYZjVRaVZTWVFlelJSZUZC?=
 =?utf-8?B?UkNsWndoU05JYmNsd0NxdzJGZk4rdU1pVG5iRWMvdmZHdmZLd0hXaUtSTGQz?=
 =?utf-8?B?T1A1WDdhQmtQZE0vUUtyMHlzaWphcGNXWjJkVC9aa3pWWi9mQzVxWWZwN2lL?=
 =?utf-8?B?M01BOGNvZFYrQllnWjU5YUdNNHcxa0NacFdxcjllSDl2Mm53OW5zYU9yd0J5?=
 =?utf-8?B?QkVXbWl3ZG03MmtiWm1zYlZiZGxhbSswR21FcGZESFg1V3M0ZVJFVXhOSy80?=
 =?utf-8?B?bnl4MUZLd1J1TGlZdm85RVROY0srRGRrTmtEQUxsN1FNUEpWRHkyV3c2RjV2?=
 =?utf-8?B?VlhDM3JPU2lGVm92N2k5WWFCeXJjejZUdzYrLzRVMGovZ21saVM4VUJuL1VQ?=
 =?utf-8?B?S2FvV3d4ZkJpcWlCWGRWeUREdEdIektxaUVkMmIwUWRSMW9pSWlzd3ZtSUZM?=
 =?utf-8?B?L0dBS05Ud0x2YjlTaExvb2RuRmpTSCtlWTFIdnZMRU8vd000UlNFd0VQWUsy?=
 =?utf-8?B?eHJTNkRhbW5rbVhLSU1zTFlpVElTNGxoK2tTK2pnemQ2WWhnNmtwenNjZStL?=
 =?utf-8?B?RGhONVdKbXo2ZndSTnJ2US9YUVI4ZXVuUEpJcnhVQVZaS3AxL1hmdnZrUllh?=
 =?utf-8?B?MHFSREFvTmNTL1ljS3draW1vRm5FeFh6alA3VEphcDE4aUxmNWpramVsclpu?=
 =?utf-8?B?dHBwMWpmSWI4NkpQY0VCcmhiNTFOT3BsUy9ySWowOXlydXZWTDZpVGw1Q1E3?=
 =?utf-8?B?dXE0RkhXdFpGWEI0bW04bU03WC90WThkeVpZeUF0TkMvektzMEN6ZWRmZncy?=
 =?utf-8?B?QithN21mYndzT2t5VytJZW9ZZzZqbTRsT1NvamozNzZaR1RQTU5HM2wyRzEz?=
 =?utf-8?B?U0VQNm9GQXIramh6NjExMGtVNVVJQUVSTk54N0Q0c0JUVDdSQ0dsc2J2MC85?=
 =?utf-8?B?SGt5Q2k3NGczTXR4L2E1ZVNIYkI0RzNqaENZV3l0UGRjQkZYOS9pTXdXejlE?=
 =?utf-8?B?THhLNG9RWm1KcFJKQzhnajlRTVR2TTBmY0RFYlQzZnNaQk1WZnJJNTNxb21B?=
 =?utf-8?B?dHdZd3hOUG9jVFFIWUZITEZ2N0UwUGNxUUlTeFg5d0NQR3RCZndCNHpZL2NI?=
 =?utf-8?B?UVV6c2RUcUhkTkRFWXRVL3VCOTVCY1VET09GQ0R3SUI5OERybGpyQmRQaDJ0?=
 =?utf-8?Q?E0qsiHB9Isk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGlPeS9DK1RkN3hXSDh5NjMyQjNFRmhBeEp0OFplSzBSODlYSnNFMW9GNjhP?=
 =?utf-8?B?UFBSMXpCR0dZcU9UYlJ0TW9WVlVSWC9UM3Z3MVFYb0ZBKzNtU0sxR1VSUFRY?=
 =?utf-8?B?NEdDVkZhRk13UDlIdk9mcElsZks2OUNUR3JLT1Q0VnRyMHpqVmNMWXRlSDhm?=
 =?utf-8?B?eG42UVp2blRlcFVyRXFOU0k3bEZKbWZSSFNMd2dmd2hkK0RrNVhxcVRkekZs?=
 =?utf-8?B?TDdPdDRHb3Y2RWJQV1p3NzUvNncxNE94ZUd6L2thUFhsWkFiZ2F4VVF1WGdV?=
 =?utf-8?B?b3A0Zys5ek8rRzNqL0F4YUNIQ045Y1NiTFI0eFNkRmNWOTluQzM1NTV4UG4r?=
 =?utf-8?B?amV4ZDBSQ3haMHZvOTZZRjh2WkJ2c1F4S28yMUFmUEdOMXFLbjhaSE51dm56?=
 =?utf-8?B?YnQ0dURrTjJidlJ6KytES2xGREwrWm5BL1YxVEl6TUV0ZEhXbXZqd3lRQ055?=
 =?utf-8?B?R2FXZUlDeHp1QUV2QjEyVnJmSnJsZm9NZnNuK1NWcjd5MXJHZXlxZVZsYXdF?=
 =?utf-8?B?MFhCQUtuR0dlZDVtRm84aDQvY1NBZjRmVU51K1N0ZDZMKzdNQksyZjMrbUk2?=
 =?utf-8?B?TEs3dEYycGJUWWJKK1V6YUU2RzFVVndLaTBiVEdqdU0vUDBhZlQvQm5HRW1E?=
 =?utf-8?B?blFNeW40TVNEVmRyOWRTZVA0a1lsWFpDbjNQaTZSbFhMcElpTnI1MTl2YlNi?=
 =?utf-8?B?UW9QbTRpODFHSmtQa1U4eHI0Qy90R1ZpT3lxRmxqSVVTWUNtZm1xVnJBcTJu?=
 =?utf-8?B?d0NJOE8xeXJyVmR0YTdvTXFXOGFRNFFnTmFpejdzL2RGbENMVFFXVEpuYmtt?=
 =?utf-8?B?ZmlYanh0ajVsUjRkbmJkKzlqaFgzQVYrTzEvZHlnek52Vml3SEhmNmZRcjd3?=
 =?utf-8?B?bTVESEZrODZGZS9CaG95S1g4V1ArS2gzb0tybjNHWDdCWHl4eUNmV2x6V2tR?=
 =?utf-8?B?TE0vVTg3Zk1aeVJSdzdnR3JXckxNb1ZSdUpHOUgveE05MTQ1bXRMcE1jaVhR?=
 =?utf-8?B?ek54bEtOaENhZFJRQTNGU3gzMFBiWmxyZTRDUXJXSEJiejBlQm85cS9VYStY?=
 =?utf-8?B?dllrR1QxcnBZSFl3WTNLUEhDZWw5eUZvZS9HNk1sbzMzbGRQTjh4SW0xcGUy?=
 =?utf-8?B?VXo5RjJrRlBPdCtsQktHa2dSWFNnRU10YnpqOSswa2RzREl4UnFEcVVQWnk0?=
 =?utf-8?B?ZkxSSjdnUE5zeFlxUzQ2YzU5NVRLYkVldDIyZFpNNXZHTExqY2E0aTJtemdy?=
 =?utf-8?B?TFlJbEZoVGlzektkeWVkclh3bC92cTVxbDBib25jbVhybXhnd095TXVJNkRX?=
 =?utf-8?B?dEJvaTNiT1NrT0g5cjd0TjB6L2ZnN3lXUW9wQUxCY0h1VnNVbTJabG91OHhH?=
 =?utf-8?B?andHU2JwNUZ2YWZTeUVMbTZnMzR6SndvM0s4bTZUNjk2dkdMdTFTMURJaDRP?=
 =?utf-8?B?ajZRejRzc3RwWEpSWXlZdXFKb3FNSm05RU52MG9KV2RRc1k0RGU2SFF2dWVs?=
 =?utf-8?B?eUVqK2szZG5NRHpBenlhYkJXVTJqSE81WG9tUThMOVdkS3B6QVNRT01hUEw5?=
 =?utf-8?B?OEs3VmhES1ltSFJLM0RJakJ1ZjE4aWhENWg4aDZ5OXJnczFOcGFaY0k2ZDdz?=
 =?utf-8?B?U0NlakFndjRYTXVMYmZ5VDBOTkgwODIyZUV2RnRuMnpLMDRQTjBVOE9PaGFS?=
 =?utf-8?B?aEU3Y28xY1EvOXM5V0xGOW5hNlladzM1d3p6cTBlNGcydUs1UldXMVRVKzBt?=
 =?utf-8?B?Z29iaFJGTUpVbC94YytQK0o2a1ZJOW5QSTFERThZRnl3U29UaHFrNXJ1T0VF?=
 =?utf-8?B?MXpGR3dlbi9HYnVkdGo1YTF0RlhmWnZ1cCtkRHFsK0ptRkJKb1p5YlRWRXRp?=
 =?utf-8?B?TE9qTXdFWGxLa0Z6TExuY0E4RTY5TzZFcmN2aXhVd1FzbkMzUVlhYlprZXNt?=
 =?utf-8?B?M2xkQzQzNWtXSzJXdFJNRjl6czAwSjd5OGd5blpOcTJGZ1VVM1J5emgyRVZL?=
 =?utf-8?B?YUhQNGFIUGFaRXZQdFlWT2VSOENUSzAxOG9HVGtCSTArWmdaS1RBRjR1RVky?=
 =?utf-8?B?TXVadGxyZUxWZndqUE9wRVZLVkdLOFlvNWhlT05jR0hBUmJKZG5NekFTc1Vy?=
 =?utf-8?B?NmlodTRJVWpCSHZjUWF5UnZXU1Jjd0E1bXV4UVF5eW82NGd3T0RpWExEekxW?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b145d4ad-fa2a-4003-4234-08dd9c9e7f15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:30.8705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZGLQwzf34LiQWb+TeEVUgvjbVWSHypPG6Dhm3VVS8gn/re60GWVT8XC+iEc1+lHOu5JBlwRhZNFKZf+pIyaC4LvPD9DF6NjDQiTLGvPo4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 73 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 2fafbd6a998f0..3e24d84a1ee10 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -8,11 +8,15 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/log2.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/string.h>
 #include <linux/delay.h>
+#include <asm/div64.h>
 #include "pci.h"
 
 #define VIRTFN_ID_LEN	17	/* "virtfn%u\0" for 2^32 - 1 */
@@ -1313,3 +1317,72 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Return: 0 on success, or negative on failure.
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	u32 sizes;
+	int ret;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can accommodate @num_vfs within
+ * the currently assigned size of the resource @resno.
+ *
+ * Return: A bitmask of sizes in format defined in the spec (bit 0=1MB,
+ * bit 31=128TB).
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	resource_size_t vf_len = pci_resource_len(dev, resno);
+	u32 sizes;
+
+	if (!num_vfs)
+		return 0;
+
+	do_div(vf_len, num_vfs);
+	sizes = (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);
+
+	return sizes & pci_rebar_get_possible_sizes(dev, resno);
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ab62bcb5f99c6..cc633b1a13d51 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2437,6 +2437,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2489,6 +2491,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.49.0

