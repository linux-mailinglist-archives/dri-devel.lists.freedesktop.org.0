Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B3998086
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890510E89E;
	Thu, 10 Oct 2024 08:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6LtnLjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADAF10E2BF;
 Thu, 10 Oct 2024 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728550006; x=1760086006;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dvMYTWdAB4/PwMkD7uP/8SN2OWnjyzD6mQlSBIBT/Z0=;
 b=j6LtnLjRh+FfUTe/fH3d7RUV+B84BMeKibPupWM6Fv6P53B+Jlz5IB0B
 35uyDM4e62blq0+J/ohraqJn+dEOVW56LOwzc5W9flDNPDUTvUPwylyTm
 ROua9xW/JWhRldozY+yqW4HF8TFXDSLRnIlIHYRK901YAalTYswahE1SY
 SLWLXX6IAHwkcFb1BUjj1yQoZKlRBwLXFyWdjujMjldr4d8Fiaip4OqDd
 1HK++LRouDGco5x1iJgo7nmxK9D+QIZLheRls8TrSALJeYvcGbmHf/+vg
 S/OLZ+G5wcrTo8aD+W0Y+VQPTRdWfJyYWfbH0bJ7gcTff2ic+NWKEuQKX w==;
X-CSE-ConnectionGUID: /6vo7QbpRFm6s9WNa+HsNg==
X-CSE-MsgGUID: BN8KYwrkQkiRaH/Y9mOw9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45369718"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="45369718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:46:46 -0700
X-CSE-ConnectionGUID: ZSpYH4InRgWMNvuQg+8AkQ==
X-CSE-MsgGUID: mT35I+JZQxWGYHHm1sSlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76732954"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 01:46:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 01:46:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 01:46:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 01:46:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsOWxdgd6NxoJwx6Orw1nXQ+AHgC9O4cVllkBBOBnie7PG+/gF31uLkHt2lIHXRYFEl3Q607ZuBaMd0pBOadoU6kbc/iAsOAoHNErAsDReWz6ftHXXyh8FpssHwDTtYXV5bWhYyNMbmstsAN/xesLY0PMDUw7TaNVSt9imw+vU1mIGGGLJbDlizlqto8JS6FxJMMwQsKLZh3U6xXyQDE5vieMmQdYhOEcBBfm5BECDDXjzUf1thRG6gdQGr9N/kO4PAzPHI/8ArThES3ieEExw9N8LHik7DSrjscXa54JuoxNz+f+nXsycDWA4G6652eMi3mQBJPwjpoUqfI2uvCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8w6aw+uiiD9XBy6SkRhsCp8bmD8mdDiXhX8dbBa7f0=;
 b=jrppReFEJR9vyGfepJEJ6oSmsNUwOeCRL2VaYn9QfzdH1SflSnjrLDvdF+r+xsH0b7Sa3f5QBrjG/78GxnaA6DcKByI7wnNr8cNjBLXwEALoycgcJ5U3+Nmpm3l111P5AwGBu4vybVTIAPiFTWfnKKfCmi/zTphYps3rnuK5XjGA1dBT/uo0nlvXfP1s1FwIAsZJiHE2PszPlTlp01BuWl1mTuaRSZTGRUJ6Sh3+MQZJdMB5iGuIkfE6WmsQjx4/Hy5CdJKzXXEd9ohRVi3XWDcwGBHG+dC86OgYmNY01Nc96K2MbLZowa+wZUP0nK5V0ApGY69nov5sHePNM4Guew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:46:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 08:46:42 +0000
Date: Thu, 10 Oct 2024 10:46:39 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/3] PCI: Add support for VF Resizable Bar extended cap
Message-ID: <kdemxhuoan2elljcjqtqcuaet6vchbreu2r4jtdd223vgpfubi@wqrjrilb3eks>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-2-michal.winiarski@intel.com>
 <15a36075-2800-4274-a404-402ceafde5a0@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15a36075-2800-4274-a404-402ceafde5a0@amd.com>
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3b7380-5a39-4583-2f9b-08dce9081098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWZ3U0FIRldway8wQ2ZoRjREbXNBd09hRTZVWnZnKy9YU3BMSFl0L1dOczZG?=
 =?utf-8?B?SEMxR3Rpd2xNV0N3dWJvbmRBUjZoTVRuQlhSMTJDdjgxMXJFVHZtdTk0YUpi?=
 =?utf-8?B?ZEhTNUo1UTVCdmFIbTJCOUVqcVNYUUdCSTdhQ2VrSTBNUXM1ODVaNWY1N1V1?=
 =?utf-8?B?WGtKejdQMGdXby9jQnpCRGlyeUlZRGx3d0poZGhUeWJwY2hoeGphZDJpc3M1?=
 =?utf-8?B?eXoyTTRtbEdUL3dPZXY0MUZWdVhIRlFMbS9wM1ZlUEZNQ2ZkR2YrQ1phdmo1?=
 =?utf-8?B?dHZzOWFzZFJGVUVlN1hDdjhNdmdvRnVqUnMwRjBVbG9HQkhiZi9XK1M1VHRD?=
 =?utf-8?B?YW5XbDZUOUN4TDhOeEJtQ0FkZkRNZ2hwOHN0aXd4dzh2V2JPdDV5enl6K1Rn?=
 =?utf-8?B?UmU4djNpd0IrWHVqTDAxdWlkM2tVRFlVZlVicEViVDJIWHFCeFZVSU15RWM2?=
 =?utf-8?B?SDBPV1FQdHBmYzJuRzhDd3FRZTUrV2Y2OGFuTWtnMXYzS0wrbGpxQkNiMTlN?=
 =?utf-8?B?Njg4dlp0ZDgzUHpEbGlTZEhRdG9peXRFd1VCcU5YL1BQaHkzcUNjb1ZGek90?=
 =?utf-8?B?NXBsbzczZDJobW9sNVhzTW5reHRORGV4RllUUXZsWlBiMGVad2V5eFBzMU5l?=
 =?utf-8?B?YXNtV1ZHbWRFQmo5TTkzRFZHU0VWTUlMNWlPZVBOU1Bjem9QNS82WjM0WmhM?=
 =?utf-8?B?MEt6OFVROEJPSUs3ZW5CeUNEKzFuNW1vblZPcnB3YThzeHU5bGhVWEtMVXNG?=
 =?utf-8?B?SXV4ZzU4V0h6ZGZ0cmF3QVlKN3laQVd3bHF3Y2lRVStjVzlpOE1NYWdxQXVM?=
 =?utf-8?B?VFBNcDhyVzBwSTRqbnZ1eU44ak5hRjJtTUVIN2RjdCsyMFlpQjhEcWkyd0pP?=
 =?utf-8?B?bjVienVacHlVTS85eW5wZUZsaFUrTEVsS0NHT1pEVEc5dklNeUM0N3pwR0cw?=
 =?utf-8?B?RCtNelJFd2Fab0FaL21KZHJFV2t3d1RkU0lxQW13dXB6UWVGTlJBcm9sTGty?=
 =?utf-8?B?Tjh6UFhLUDl1dC80REZacVJjVUV1NE9jdyt4d3I3WmI3S2RBRWlSNmMrNWZT?=
 =?utf-8?B?Y3FrM0J0Um1GZTNzdThGbTBQdGhYbVhOQmxpZFVkKzlJSW1SSEpPaUM1Z0tY?=
 =?utf-8?B?bVFFbVFaek5nOFVDL3RzQnF5Q2ZFZzk1SkhpN1UwLzczWFF1dGFqUWFWdUFW?=
 =?utf-8?B?MXVMWnVnQTViblBkL2ZYYUNYRW9lckdUSEFINDdWdjR0ejBFR2ZSM2QyOE42?=
 =?utf-8?B?cHdTZzR6N3FpNktCeFB3K3VxNHVacFFwVzlNQ1ZiRC9UR2xBNEFJcVhYSlhs?=
 =?utf-8?B?WnR1eHBiMmZ6RFpDeEhmM3NEMGQ2Y28zUWdqQXE0ZjlGTGdHZm9MOHFBYkpP?=
 =?utf-8?B?eDBKRDljVnpIT2dhSTVZSDh1ZSswOEdnOC9uWnQ4SHJwQitpWElzUkNmblFM?=
 =?utf-8?B?S2YyOTM4OWswTXNNdWRWWTRjRW9DcHZNU3RGa1QyWjlZNVVrejA4K3laSU9s?=
 =?utf-8?B?SlovR2NzckRIVUtYRkdhOWJtYUVBSCtsY0huK25Pc1I0RHdLTlFOMjl1akRU?=
 =?utf-8?B?QlBJek1WZVRpSjNqZnh4b3RQMlFrUnFoQTAzaFFnQTJzQnJaSU1JNEJmQVph?=
 =?utf-8?B?TEJNT2w5aUhyRmlZekR4bXhYbUYrQXhZRXc1Sy94eW1EOHdtbXV2RzJ0WUxZ?=
 =?utf-8?B?MFJja25saFpPSXVPN1hmc1oyV3pRTlQwMWt5ZnVJa2RmSFgwSE9nSk1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZvNUhuQm9NcmVMR3RPRnNRNTBMT0FUWlI0djF0NitycVRQZk5zYmxsSkVy?=
 =?utf-8?B?eUtEWnFTVi9UWThjWHBVakhqWWVRZzJ4UkkzVitaMkRaSXRBdFJpMlorc1Y3?=
 =?utf-8?B?b2QxWHF6MERvaUNUa085Z1RjdldRYys5WW5WTFk2cTJleG1JaEpVVWtLMHJs?=
 =?utf-8?B?NGFJUWxhWHVlc01ZendvN05Wb1JGVkI0QnVXV1RVRVRLYkdMdkgyaldXaldn?=
 =?utf-8?B?WHFMd2l2WUtNRXo0Zk1JQlloY25PUEV6RDZkQU0rYjl2TmxXSmRoc0Njemg0?=
 =?utf-8?B?eGtoQzhpc0g0OW0yZlRVbFhRUHd0SSs3MnZOdXo4MEkyRDB2U0pXUTJXQjgr?=
 =?utf-8?B?NW1scXo0NmNaLzhNcksxbzV2c3JRUWFnN3V3MGNiWDF5R2ZLU3BkcnNMcVY5?=
 =?utf-8?B?QzRHUlUxT1ZjMnNia0hPUjFFTm9sQm93UzVJNnU4dXB2bzBJdzhZeGJCL0R1?=
 =?utf-8?B?eEI2U29qVWg3L2lNKzVFOTZHVjVLOWFkQk0yRCtVRlJBMDhpcHpWYlJ5ZVNL?=
 =?utf-8?B?Zjl2YUVmZ0dWL21zYWlsS0o2Q2NFc1VFQ2VaOEV6eldBQ3BKVy9QNHNQY04z?=
 =?utf-8?B?UWc1WTE3dUQwYnNWbWkwcGJUL2Y1VElDclFHK1NMY0EvVVJLNWI3NHBMUTdv?=
 =?utf-8?B?aDBjclpOallpNlFicmZkVTV0K1o1Sml5c0RWVUpGUm9JV09lNDd5b3BleWZh?=
 =?utf-8?B?aDFTS2JndnZEdGJxeFNvbFB2c2F5M3d5MFFjMm5oY3JmcnliZ05ZdndSaDRG?=
 =?utf-8?B?U1kzZXYxT0lVdjF3MXZDTU1JcHZFamRoalJYbDFFS3J5L0pTamp2ZGozd2t6?=
 =?utf-8?B?am9FaThBbnU3RjdPaDg3K3l2VHRaU05xbEExRnJhREloREpiaURpaXVLRFE3?=
 =?utf-8?B?b2dvNldnVFV0K0VFV3dSOXdJeUo1ZGkxQUYzc0xMNk1MRzBmUDBlOUdWNmxp?=
 =?utf-8?B?VUhtM3lsYTk0bDR3NVRDNVhETWFUZE5mWGp5bDZXc3VkSjgzaEZyWGpHd2M4?=
 =?utf-8?B?bVpmd1Z3d21yekxJUmxBL3dyN0NuSktoUmNvVUNKNGhJeWhyNVdYV2ErRTJz?=
 =?utf-8?B?QUYrNGx3OVVreGIxMk5zWm5uREl3aHB4V1MvUDZwa3ZJWkQ5N2NRemY4MVlW?=
 =?utf-8?B?OHhnN1RQaTZncVp1YzZvbWxpM2F3SGFOQmVSSlgzOVJHb3h3WXJnaEVHOUlK?=
 =?utf-8?B?YjgxR0pNUlcrM2RLVm1CdFUzMGFmUjdCMWRiWWIweHVmWkFGMmlndE1VZ1Na?=
 =?utf-8?B?bVVWR01sbWhIOVoyQ2ZJcmZydTg5WUVleWRnczdvOHk2SmdIR0VYWXhoZlhN?=
 =?utf-8?B?TWV2R1UvcVc3NlV3YVNVazhOVEZrNlB6aktHQjVBV1hQKytFUHRxajF4cDN5?=
 =?utf-8?B?eE84bFFaa1JSUmpsVmpxS2dtUUF1U1QraVp0QmxzMVg0MmhKNnJaUmNHMWFr?=
 =?utf-8?B?UlNDbnh0NDhXR1JKZDNYK0U5eTdLajdPRlRxbElULzhiNHVZMlZxMlo1bnZr?=
 =?utf-8?B?NTJwdVN3UDdrbmpVeWlpajJYZ2dTUU8zbHZqNTJFSHBBdXRRMk9UeTJnNGZz?=
 =?utf-8?B?U3RFRzF2VzZRNzYxcjkyckc3bGdkc1lHejIxREVXOTBNV0Nzb3p1dngwZE0x?=
 =?utf-8?B?NzNLcXNCdWZzZ1lSekRMV1BmY0dUOW9YblVQK1BTRUIwVVRjTFZTUVRvcUpo?=
 =?utf-8?B?eWRaWkNleGVacWFLSk9uRXBBbEo4R1Q3b0hrODIyQnN0RU1YYW9qekRTeDBL?=
 =?utf-8?B?d1hEWEgwVWtqRHFzSHNhcEtTeFJuaU56ZnYvcFRzMkdhUDVYT05nczlReEVQ?=
 =?utf-8?B?QjBUSjBrU0lpZjUrVncxcGo5a1RtVk8rK3I4MDY2YlNUTXE2TXB0enZReGdh?=
 =?utf-8?B?RjRHSEpjRGNjUGd3cWVITCsxUCtLQzRvcy9WV0F6Ynk1RTBNYWwwNWYydkgr?=
 =?utf-8?B?cTdIOU50MUhPcHM0MWkyb1E4WmJVaDllV1h1U3o0WWEwc0tLdjNRdDJyWEg3?=
 =?utf-8?B?TWFKU1NhaUI3YzAxOUxnaGN6VVlmUndmNytVendkWEZkV1p6VC9kWm1RNnE3?=
 =?utf-8?B?V2tZNTBqUTZIdEM5Yjd3WURqSWVISTE1RXNLZ2REd1pTQ3BBQkcrQ2ZDVG5G?=
 =?utf-8?B?R09BOXBSMWFrNFdqQTNESGtKbklCOUJFT0wvUGE3SlY5c2pIK3N5OW1hRTYx?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3b7380-5a39-4583-2f9b-08dce9081098
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:46:42.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JAmAWkqMZIzY9mNOpbu5GA4JQyAfxVl+xKweV05jgp/X43EjhsBd6oZ3W7E3HXVa26s76Ot0+XuKXqerzZ3cvQB4vMlILWs0wKYqtqRw2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

On Fri, Sep 20, 2024 at 11:57:34AM +0200, Christian König wrote:
> Am 20.09.24 um 00:35 schrieb Michał Winiarski:
> > Similar to regular resizable BAR, VF BAR can also be resized.
> > The structures are very similar, which means we can reuse most of the
> > implementation. See PCIe r4.0, sec 9.3.7.4.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >   drivers/pci/iov.c             | 28 ++++++++++++++++++++++
> >   drivers/pci/pci.c             | 40 ++++++++++++++++++++++++++++++-
> >   drivers/pci/pci.h             | 14 ++++++++++-
> >   drivers/pci/setup-res.c       | 44 ++++++++++++++++++++++++++++++-----
> >   include/uapi/linux/pci_regs.h |  1 +
> >   5 files changed, 119 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index aaa33e8dc4c97..e8ccd2ae0f024 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -153,6 +153,34 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >   	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> >   }
> > +bool pci_resource_is_iov(struct pci_dev *dev, int resno)
> > +{
> > +	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
> > +		return true;
> > +
> > +	return false;
> > +}
> 
> When you want to generalize that check you should probably but it in a
> header and change the existing checks in pci.h and setup-res.c as well.
> Otherwise I don't really see the value in having a separate function.

I'll split it into separate patch that's changing the existing checks.

> 
> Additional to that please code that something like "return resno >=...." the
> extra if just increases the number of lines without adding any value.

Ok.

> 
> > +
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size)
> > +{
> > +	if (!pci_resource_is_iov(dev, resno)) {
> > +		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> > +		return;
> > +	}
> > +
> > +	dev->sriov->barsz[resno - PCI_IOV_RESOURCES] = size;
> > +}
> > +
> > +bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	u16 cmd;
> > +
> > +	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> > +
> > +	return cmd & PCI_SRIOV_CTRL_MSE;
> > +}
> > +
> >   static void pci_read_vf_config_common(struct pci_dev *virtfn)
> >   {
> >   	struct pci_dev *physfn = virtfn->physfn;
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index ffaaca0978cbc..d4522e365e7ba 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -1901,6 +1901,35 @@ static void pci_restore_rebar_state(struct pci_dev *pdev)
> >   	}
> >   }
> > +static void pci_restore_vf_rebar_state(struct pci_dev *pdev)
> > +{
> > +	unsigned int pos, nbars, i;
> > +	u32 ctrl;
> > +
> > +	if (!pdev->is_physfn)
> > +		return;
> > +
> > +	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_VF_REBAR);
> > +	if (!pos)
> > +		return;
> > +
> > +	pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
> > +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> > +
> > +	for (i = 0; i < nbars; i++, pos += 8) {
> > +		struct resource *res;
> > +		int bar_idx, size;
> > +
> > +		pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
> > +		bar_idx = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> > +		res = pdev->resource + bar_idx;
> 
> The variable res seems to be unused.
> 
> In general I think you should split up the patch into restoring the VF rebar
> state on resume and implementing the new resize API.

I'll split it into separate patch.

> 
> > +		size = pci_rebar_bytes_to_size(pdev->sriov->barsz[bar_idx]);
> > +		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> > +		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> > +		pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
> > +	}
> > +}
> > +
> >   /**
> >    * pci_restore_state - Restore the saved state of a PCI device
> >    * @dev: PCI device that we're dealing with
> > @@ -1916,6 +1945,7 @@ void pci_restore_state(struct pci_dev *dev)
> >   	pci_restore_ats_state(dev);
> >   	pci_restore_vc_state(dev);
> >   	pci_restore_rebar_state(dev);
> > +	pci_restore_vf_rebar_state(dev);
> >   	pci_restore_dpc_state(dev);
> >   	pci_restore_ptm_state(dev);
> > @@ -3703,10 +3733,18 @@ void pci_acs_init(struct pci_dev *dev)
> >    */
> >   static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
> >   {
> > +	int cap = PCI_EXT_CAP_ID_REBAR;
> >   	unsigned int pos, nbars, i;
> >   	u32 ctrl;
> > -	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
> > +#ifdef CONFIG_PCI_IOV
> > +	if (pci_resource_is_iov(pdev, bar)) {
> > +		cap = PCI_EXT_CAP_ID_VF_REBAR;
> > +		bar -= PCI_IOV_RESOURCES;
> > +	}
> > +#endif
> > +
> > +	pos = pci_find_ext_capability(pdev, cap);
> >   	if (!pos)
> >   		return -ENOTSUPP;
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 79c8398f39384..e763b3fd4c7a2 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -556,6 +556,9 @@ void pci_restore_iov_state(struct pci_dev *dev);
> >   int pci_iov_bus_range(struct pci_bus *bus);
> >   extern const struct attribute_group sriov_pf_dev_attr_group;
> >   extern const struct attribute_group sriov_vf_dev_attr_group;
> > +bool pci_resource_is_iov(struct pci_dev *dev, int resno);
> > +bool pci_iov_memory_decoding_enabled(struct pci_dev *dev);
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);
> >   #else
> >   static inline int pci_iov_init(struct pci_dev *dev)
> >   {
> > @@ -568,7 +571,16 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
> >   {
> >   	return 0;
> >   }
> > -
> > +static inline bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	return false;
> > +}
> > +static inline bool pci_resource_is_iov(struct pci_dev *dev, int resno)
> > +{
> > +	return false;
> > +}
> > +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +					     resource_size_t size) { }
> >   #endif /* CONFIG_PCI_IOV */
> >   #ifdef CONFIG_PCIE_PTM
> > diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> > index c6d933ddfd464..87a952a114f38 100644
> > --- a/drivers/pci/setup-res.c
> > +++ b/drivers/pci/setup-res.c
> > @@ -427,13 +427,44 @@ void pci_release_resource(struct pci_dev *dev, int resno)
> >   }
> >   EXPORT_SYMBOL(pci_release_resource);
> > +static bool pci_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> 
> I don't really see the value in making it a separate function, just keep the
> check inside the only caller.

Ok.

> 
> > +	u16 cmd;
> > +
> > +	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > +
> > +	return cmd & PCI_COMMAND_MEMORY;
> > +}
> > +
> > +static int pci_resize_check_memory_decoding(struct pci_dev *dev, int resno)
> 
> Also doesn't look like much value in having that a separate function.
> 
> > +{
> > +	if (!pci_resource_is_iov(dev, resno) && pci_memory_decoding_enabled(dev))
> > +		return -EBUSY;
> > +	else if (pci_resource_is_iov(dev, resno) && pci_iov_memory_decoding_enabled(dev))
> > +		return -EBUSY;
> 
> Well that is coded as ugly as it could be.
> 
> I strongly suggest to not call pci_resource_is_iov() twice and to move the
> -EBUSY return code outside of the function (if you really want a separate
> function for that).
> 
> E.g. something like "bool pci_resize_is_decoding_enabled(...)" and then "if
> (pci_resize_is_decoding_enabled(...)) return -EBUSY;" in the caller.

Ok.

Thanks,
-Michał

> 
> Regards,
> Christian.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
> > +{
> > +	resource_size_t res_size = pci_rebar_size_to_bytes(size);
> > +	struct resource *res = dev->resource + resno;
> > +
> > +	if (!pci_resource_is_iov(dev, resno)) {
> > +		res->end = res->start + res_size - 1;
> > +	} else {
> > +		res->end = res->start + res_size * pci_sriov_get_totalvfs(dev) - 1;
> > +		pci_iov_resource_set_size(dev, resno, res_size);
> > +	}
> > +}
> > +
> >   int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >   {
> >   	struct resource *res = dev->resource + resno;
> >   	struct pci_host_bridge *host;
> >   	int old, ret;
> >   	u32 sizes;
> > -	u16 cmd;
> >   	/* Check if we must preserve the firmware's resource assignment */
> >   	host = pci_find_host_bridge(dev->bus);
> > @@ -444,9 +475,9 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >   	if (!(res->flags & IORESOURCE_UNSET))
> >   		return -EBUSY;
> > -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -	if (cmd & PCI_COMMAND_MEMORY)
> > -		return -EBUSY;
> > +	ret = pci_resize_check_memory_decoding(dev, resno);
> > +	if (ret)
> > +		return ret;
> >   	sizes = pci_rebar_get_possible_sizes(dev, resno);
> >   	if (!sizes)
> > @@ -463,7 +494,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >   	if (ret)
> >   		return ret;
> > -	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
> > +	pci_resize_resource_set_size(dev, resno, size);
> >   	/* Check if the new config works by trying to assign everything. */
> >   	if (dev->bus->self) {
> > @@ -475,7 +506,8 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >   error_resize:
> >   	pci_rebar_set_size(dev, resno, old);
> > -	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
> > +	pci_resize_resource_set_size(dev, resno, old);
> > +
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(pci_resize_resource);
> > diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> > index 94c00996e633e..cb010008c6bb3 100644
> > --- a/include/uapi/linux/pci_regs.h
> > +++ b/include/uapi/linux/pci_regs.h
> > @@ -738,6 +738,7 @@
> >   #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
> >   #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
> >   #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> > +#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
> >   #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
> >   #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> >   #define PCI_EXT_CAP_ID_PL_32GT  0x2A    /* Physical Layer 32.0 GT/s */
> 
