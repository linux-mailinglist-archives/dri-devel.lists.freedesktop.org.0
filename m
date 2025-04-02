Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAAA78C3E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4510E73E;
	Wed,  2 Apr 2025 10:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CON9PYPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86CC10E73E;
 Wed,  2 Apr 2025 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589576; x=1775125576;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p17FTe0w8ZHFP9yvyOf5Ax5Tq2v6+ymSjPbDJ7iela0=;
 b=CON9PYPVLConOU4kWTlN5rbth04g7HNGhzC6U/MfhHAKqN3/PaIRB4Wn
 UpBfSuFPvKvqgDMmW+y0QXiLkWfDS97CTtYsx6XqgawcV0/s+w81yp90c
 IH5nnMQ3cS9W+uOjnV5xz1YOf3eFqurXihiTvDl5y/MiQqd/ga0pp23qr
 j1Z+BRDlcxWp1Ny9OJARoqZS+ZgBuzYhMqX2v9091PULtlcnUlW+z5bCy
 /w4jONDB9O0IYn125STCzuzI2m9gCgyWG25VR5YZJzxN7PaWWLUhlCpxi
 DgRSShYsh/Op5QiZLzHQdZ8zSKkssQ9oCATL2UeDZBz6HaHd6j19M1lav A==;
X-CSE-ConnectionGUID: knE4ECmpRaGxhc/dtaTuRA==
X-CSE-MsgGUID: K2jFE6ICRHOFd6mqTqcaEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45115399"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="45115399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:26:15 -0700
X-CSE-ConnectionGUID: LcdTghH/T9yp5vDjqG1a0A==
X-CSE-MsgGUID: SwnC8Q1tSnSB3n4BUvgTeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="163880839"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 03:26:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 03:26:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 03:26:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxwVpUanfCXBc4RnaWz1F5tYPo2fp1+HjAOc67qJCDcauvpU63ysNU5NtJIlGwav1UohRAxBcvLFf0EjuyRfWRiH0p3/4eSgLhpZiHUFqKiBPeNbMz/L8XEORxACXrFhyKxaP+8/26Ll2Mk69teMPNl/emA+LXyjRRHUCRUcK01E1NImGwHOYP36M+tg61kPwDjiAlVI4OVKQEf7M6m1jgEnjUWxexcO9j8AP+uXlki+Bg70kVJBNlCsva/TzAgfkMa2dv0o4GByQ3+GbFYHZmi0sni7RbP+03oaOr/Fqyt81PbxkG9J3TBYCRx1Sy7bsjAS0Mftix3FCk7U+S6evA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/WttyrIaSgBVm814/1GP0c4f+75S0psTEffEgFPVkc=;
 b=c+7h+iH4DCRhuVu7o0K6Zzu/6s0kyU6WAEkYLqr2OlQt773AqoedZW1hYG1F25Y/VVeRavY/VC9x3g8DPNgWB1E2gorPWb2DGpqQBQ49PJfVH0Aj3e3A1pJP3xQzYFWEj+spcKii6Yw9HsVL1MdOiyAN/UyUHEYI5tStVvV8bpoIOvwaa6nzJwkZNlot/ub6h/pQ6NH/eimHAv4QuM/xIM1YSN7zt1D6gcq6hZKIfQuRUwq7NdQn5JPezPqJmlZUwLo7Mtt6YUgvYH4rcolK6tlPEHjd6ly83vDihWnFweWxkeK73d+RYn5wQRFTJcR70gqVy6R0s2hrjtX1vOi6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:25:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:25:45 +0000
Date: Wed, 2 Apr 2025 12:25:41 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Message-ID: <rnysuzhc4qrw5g5nx7q7xc3jtxsydmm5ck5vcdptxipetxn6f5@vqajach4lzv3>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-4-michal.winiarski@intel.com>
 <d79a7a63-af36-9852-bc65-876bb8a8c842@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d79a7a63-af36-9852-bc65-876bb8a8c842@linux.intel.com>
X-ClientProxiedBy: VE1PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:803:118::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bccf5e-a3ba-46c6-90ae-08dd71d0ba1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTE2TnZTNzlzWmVVU2gxTURvdEtydFNUS1hYTXZvemlKT1YweEs3MjB5dm1k?=
 =?utf-8?B?R3FSL0NhSUg3WldNbUV6b0l6Y0lrL2pnei9aVjBIQldPcGRQaW5iZk5jN1Fj?=
 =?utf-8?B?Z3JNNFNYRHN1N3ZXWkVjWlIxcy9xNzJQYlIvMElySUN3RGVMVHBPWVpjYmFE?=
 =?utf-8?B?WUNVRDlHSVlQUElBc2lFU1JycUlIdDd6cGdyUDYybjIrS1JCWVJ0ZjJPRjgw?=
 =?utf-8?B?NXJ5YksyUE5PaVFnL24rbklHS09NUUhxQjNKSEpWN2JsLzhHUkpNS3pVZzBx?=
 =?utf-8?B?Z1QyUjYxSWlhYVp1eHhCYkt0dmdSRDRTWEQzdjRUeDJHMFVoZTZhVW1WdkYy?=
 =?utf-8?B?T1NwVmRSUUtaOGNmSWxFS2lhU2FmU2dBREVuem9LTmhSN0dCbGdaNXBMaTVm?=
 =?utf-8?B?VHJudHVnZWhMTFNvWCsybU5tUGtOZm5WOWtuVEFSdUpsbzRpNitCdzY0NTlI?=
 =?utf-8?B?eHVWeXJ1YjArVStIbThDNExOSVJWcEY0WFh5bzJ1LzFaT3BVY1FwdGhUZDNH?=
 =?utf-8?B?dGJld2xxS0xQU1JoRDhZNUdyZFJJNE1tZWhTVWdOYlN3SzFxTTFCd2dYM0tS?=
 =?utf-8?B?U1VleFg5WjRJZnZDMEZVcGtRd2dBd2JRdjZ5RVNPY2w0eDhaWEkvSE9YK3Vj?=
 =?utf-8?B?RmxhYmI5cVhJTEFiMFdGQWI3NjdnaUhrc1o0UldIcG5zZXdZTHRiYWdXTk53?=
 =?utf-8?B?QTdVUjBJMjV3VlpnSzFuaXVrZXhJR1pnMUxHRmc2RC9uNzlUV01icEtvWENk?=
 =?utf-8?B?dlBwOE0vdkJVb2JvQUdvbndSSjhTalBNZTFnc3ovVGZBM1NHdmpTcGdrWENM?=
 =?utf-8?B?NVpWcWhvVDRhVmxJNmg2QTJ2WW5ZOWswazdJYlJRNHU0akpkSy9hMXBSL3pv?=
 =?utf-8?B?b0dUQjJUSVBKaFhyRkZSaTJ0aHhkOU1CVmszUzhENjkwcCs2cVBzMXlucW13?=
 =?utf-8?B?SmpYYUpSQzJVZXNaVUVLaGtBU05ZaGp6WWgvMjJwSFRtd2d3VWFhS21MZEtv?=
 =?utf-8?B?ZXFyNDhmOWdIYVMwd1NOdmxZWFo5Y2d6UmgrWlAvOUtLMUxIQWJoSVpValRM?=
 =?utf-8?B?TDNzV2dWbml0a3I5VmI2WGp3d1VpSDRjaTJGSUNTdENzY09RL2FvVVdKVlli?=
 =?utf-8?B?S09QVTdsZU5TSmVQK1JtUFk3YVJQQmdTQlBVZkxLR0Y4eFpqOUNqSTAvbDk5?=
 =?utf-8?B?UUxyaTA1MVYyT0QwMzg3NG5ZYmVWYmtKbmJyV3M1TlNSV0lRL1RTeDIwdG1F?=
 =?utf-8?B?SWt1bHBnNEVWSTF3cTNrTUs3ejZxZ0pmUjd0OVdoT1NEUUp2a3oxNDNDamR3?=
 =?utf-8?B?QXdleEFHNktLZktETTJ6UDl2YmRkS1VEUGJkQjA0Ni80czYyZDFQWFB1WW5y?=
 =?utf-8?B?bFhwcFY4SnlFMGZ2SERoNVpDL3h6bGhHVEtqYUU1WW8xdEthOHZBU3ZXU3Zr?=
 =?utf-8?B?Q09FVmU2M01uUHFoZWhqSHhMSWVjZ0ZCK0tYNFZCQXFHNmI4OWR5Tzhzejh0?=
 =?utf-8?B?WWRSd05FQmRuUVVBd2VUdVJyNzR4bU13WGExU3JuRkZsK3VoeC91VjQza3Vx?=
 =?utf-8?B?bHY2dzhqWjZoaGRlVE1RNFozRE1WSmhvSEoxUlhTVGpHWlZkZ3hmejZHSHZh?=
 =?utf-8?B?THM3a1JxVWhqSWlQcGlsclJERDArR2oyMk1ZZmJqUDl4cGw5ZnM2bDl3V0Vl?=
 =?utf-8?B?QnpvUFdxUjVBeWRqVmUrcnRtdWdlaDE4dnc0VG5xK3p3Z3FHTS9DSzUwL2ZO?=
 =?utf-8?B?RlRBSkF1N0gzT1NzU1Q2bVNaOE5DTENwN0YzeHI2YkRTUUt3VDc1QTZ4TjU2?=
 =?utf-8?B?ZFJmb0VwM0xER2RmU1dROVZhdlQrWk10TVBXZmlUSDZ6V0FxbDQwU1VnL0Nl?=
 =?utf-8?Q?Qz6vFLFdT3OxW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2l6NWhPWDhpb2M5cmI0bGM3OHJnUG0wTGJNVjUxK0V2ZU5hdGZuZEVhOERl?=
 =?utf-8?B?djZscVl4a3BLdEdSc2lEQklFVTJFUk9HVXNBekgzdGNWNVlGVTQzMFc0aDRE?=
 =?utf-8?B?b1FxVCtLK2gwR3FiWSsraG0xWmhvTXM5L25PNkVzRmtleXJlbEx6c2J0ckpR?=
 =?utf-8?B?ekQzNERQbFc3VzVWZUVLS093SEQrdmtZRzVDQ1JVZlU3MWc1Rk5UQ3JEeGx5?=
 =?utf-8?B?ZEpUaSswWmpxaEswU2VsaHYya3ZNYzErOFVraTRhNVdRQnlsUGdLSVNTUnpY?=
 =?utf-8?B?TzNKUzFObTVHLzJGQUF6anR1bFFtem4za2FjcWtVWDNnUmVhdlNmL1BZZ2da?=
 =?utf-8?B?ajFpYWgxQ2dvMFVnMVNmSmp4Uyt1NTFVNjhRLzVrVDFkUVZVY0VjaHpGa1VT?=
 =?utf-8?B?b3VCSkhaVGpib3UvSWI3cWFXaDltNVdjOUVPREtIeHhFd3luY3kzRUFRMlZI?=
 =?utf-8?B?WDZQdGRURnQ3eEdzSW9haE9qdUN2NUozTklkMCtyU2dWdk13aStuMVY0eVBD?=
 =?utf-8?B?cWVOMGNUQ01SNlYwcDEwZ2o3cStnZXhtcmNxZWhhZ2RqV0IxcmdxdmcvVVJl?=
 =?utf-8?B?SC95Um9wd3d3UHpsY1NybzI4NnUvdUUwWjVDVzBQR1FGeXpJZStvYk9aNnBM?=
 =?utf-8?B?VG5zY1hVSDU0ZUNpaUg3ZjVtR1hORmVPRG1YeUFHeDJmbE5WOXNGQWJTV2pR?=
 =?utf-8?B?aEIrbE5wWmZQajhPRUplYlJoNWpMeVk2ODNLeWdTc1NEQit0dVRpWHExZG1q?=
 =?utf-8?B?cUtERldIeThvdjVuazVjbW1SdmdrQWlDZ1Y5MGtyb2xPNE16ZVlmV05nM2Y1?=
 =?utf-8?B?dHloL3FIcXZrNzY2ZnczdFFaYkdwaENtSGlDbEw5bHV1b0NJMVVveEs4dkJw?=
 =?utf-8?B?R3ludklYNmtiMzlLdkNOT1kyS0lNV3JoOUNVSC9SeEYyRWp1WENvMjFtZlpO?=
 =?utf-8?B?ZXlNTjBJbWJNaGRWdk01RmFsV2crK1NSRkhVMHdZMlZieTdtMWlyWjR4dG01?=
 =?utf-8?B?eWJUVXNoWnMzTFgxOEp6TTBRRjJsMUJOR0kyOGVTYXdvbkF0Y3J4OWZ3S3p3?=
 =?utf-8?B?MUtGSUVEWXBsQ0c1d2NjbjRsenlqYnk2RDEyWkNIdG1vSERkUmV6QWp1aHRX?=
 =?utf-8?B?d3J6aDU1RklaMnlIUkZpRmFTODFkNHNiVnFHSjN4RnVPUjc0WkpDN0lmdloz?=
 =?utf-8?B?VmpHWmVVUUU0NEw1dGN0blVYbC9Rd3ZkYU9rSEl3eExPY0JVYkhpR0ZVSzRF?=
 =?utf-8?B?WGZEZlZIM3pMTzFIKzVBRy9aRURXZ2hyY3FTbXlKZXVhZDhsMWxFOXduQ3pv?=
 =?utf-8?B?a2FhS2hDUVhiNzRzZm5oMStIZzFxMldiaEVuVjM0YkNzYVg3TFpSQWRaTjhl?=
 =?utf-8?B?R3ViNDJEbnBkWXlZdWNKcmdYT3FCMXBSUkROUWZUdG9IajVpYTY5a05vSjU2?=
 =?utf-8?B?U0xuR0ltZXgzM0VZd2c5QjZHREN0Uyt4V0dSRlNXSENlNTJ3RlZaVDFwQ21C?=
 =?utf-8?B?OU5vQit3dGRSV1Q5YVFsR2FqL0QwK0tobnoxTFYzQmJMVFI1a1hFWG5tN0hS?=
 =?utf-8?B?N2x1TkpDanNYd1VsRm45NWtDeElZMTdoaWY1S0hhREFCRXV3MC83Vm15VFcz?=
 =?utf-8?B?NlE4K2o0QXMxRVNwNm8wL1ZYMmpvd3ZoRjBuOWxyS1BpZEJhNFFDVTBqRi9S?=
 =?utf-8?B?OTZUd2FCRUNRY1RrcXUyWXFkckdoSS9lOVF1akN2eExMcVQxS0dhNFpVTUQ4?=
 =?utf-8?B?aElxWVpJaDJXdFgxeWpNL1dlbHpFUElEQXZzaldMVk54engxTmdrMC9aYUMw?=
 =?utf-8?B?SDRqZnVRTTkwbWxHOFJwSCtmSVp5ZmRxc2QzNTMwc3VtOU9pMDBtaWlTNTJj?=
 =?utf-8?B?R1pGZlh0ejFnRldqc3lNVVNYdzhSanlBRGtxUTVhalZPYUYrcHprNG1IOUxG?=
 =?utf-8?B?NFp2UGk4NDR5UTRyNDJCSFhPZ0paU2lZNTFzRzY3NW1nYzZEeWc4VUwvSGh6?=
 =?utf-8?B?UlV0RjlKWkpockU0elNYaHVnSGZBaitEdlNQL1M5d2p3L1M0NjJqb1kyMG1E?=
 =?utf-8?B?MVpQN2t2VUF6YkZXMlJoZlNRZ2NaV21ZNUJJWGhFTHVNbURKOUdjVUdLUWhl?=
 =?utf-8?B?NExmZU96U01OdzR5b0lJeXBNaFp1ZFpKWkVzb2M5YTZ6S04rRC9XcS9BZWdY?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bccf5e-a3ba-46c6-90ae-08dd71d0ba1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:25:44.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJ+v9RVkgzGDHoG2Q8cR/HQc8MRFa+6QRFS6t2q5Bz6y1wLcXTTj0PfNQ52vA/WGoj/97NyGTtzjHui/AjA99cF1STAuReGXK9JLtzixEJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On Wed, Mar 26, 2025 at 04:58:14PM +0200, Ilpo Järvinen wrote:
> On Thu, 20 Mar 2025, Michał Winiarski wrote:
> 
> > Similar to regular resizable BAR, VF BAR can also be resized.
> > 
> > The structures are very similar, which means we can reuse most of the
> > implementation.
> 
> There are differences in resizing which should be described (size calc 
> and mem decode check).

I'll change it to:

"The capability layout is the same as PCI_EXT_CAP_ID_REBAR, which means
we can reuse most of the implementation, the only differences being
resource size calculation (which is multiplied by total VFs) and memory
decoding (which is controlled by a separate VF MSE field in SR-IOV
cap)."

> 
> > Extend the pci_resize_resource() function to accept IOV resources.
> 
> > See PCIe r4.0, sec 9.3.7.4.
> 
> Can you update this to r6* please.

Sure, r6.2, sec 7.8.7.

> 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c       | 21 +++++++++++++++++++++
> >  drivers/pci/pci.c       |  8 +++++++-
> >  drivers/pci/pci.h       |  9 +++++++++
> >  drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
> >  4 files changed, 67 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 985ea11339c45..cbf335725d4fb 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
> >  }
> >  
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +			       resource_size_t size)
> > +{
> > +	if (!pci_resource_is_iov(resno)) {
> > +		pci_warn(dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> > +		return;
> > +	}
> > +
> > +	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
> > +}
> > +
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	u16 cmd;
> > +
> > +	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> > +
> > +	return cmd & PCI_SRIOV_CTRL_MSE;
> > +}
> > +
> >  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> >  {
> >  	struct pci_dev *physfn = virtfn->physfn;
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index ff69f3d653ced..1fad9f4c54977 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -3745,7 +3745,13 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
> >  	unsigned int pos, nbars, i;
> >  	u32 ctrl;
> >  
> > -	pos = pdev->rebar_cap;
> > +	if (pci_resource_is_iov(bar)) {
> > +		pos = pdev->physfn ? pdev->sriov->vf_rebar_cap : 0;
> 
> I'd explicitly do:
> 
> 		if (!pdev->physfn)
> 			return -ENOTSUPP;
> 
> rather than relying pos = 0 triggering that return later on as the intent 
> is more obvious that way.

Ok.

Thanks,
-Michał

> 
> > +		bar = pci_resource_num_to_vf_bar(bar);
> > +	} else {
> > +		pos = pdev->rebar_cap;
> > +	}
> > +
> >  	if (!pos)
> >  		return -ENOTSUPP;
> >  
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index f44840ee3c327..643cd8c737f66 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -689,6 +689,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
> >  resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
> >  void pci_restore_iov_state(struct pci_dev *dev);
> >  int pci_iov_bus_range(struct pci_bus *bus);
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +			       resource_size_t size);
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
> >  static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> > @@ -722,6 +725,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
> >  {
> >  	return 0;
> >  }
> > +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +					     resource_size_t size) { }
> > +static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	return false;
> > +}
> >  static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return false;
> > diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> > index c6657cdd06f67..d2b3ed51e8804 100644
> > --- a/drivers/pci/setup-res.c
> > +++ b/drivers/pci/setup-res.c
> > @@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
> >  }
> >  EXPORT_SYMBOL(pci_release_resource);
> >  
> > +static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
> > +						  int resno)
> > +{
> > +	u16 cmd;
> > +
> > +	if (pci_resource_is_iov(resno))
> > +		return pci_iov_is_memory_decoding_enabled(dev);
> > +
> > +	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > +
> > +	return cmd & PCI_COMMAND_MEMORY;
> > +}
> > +
> > +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
> > +					 int size)
> > +{
> > +	resource_size_t res_size = pci_rebar_size_to_bytes(size);
> > +	struct resource *res = pci_resource_n(dev, resno);
> > +
> > +	if (!pci_resource_is_iov(resno)) {
> > +		resource_set_size(res, res_size);
> > +	} else {
> > +		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
> > +		pci_iov_resource_set_size(dev, resno, res_size);
> > +	}
> > +}
> > +
> >  int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  {
> >  	struct resource *res = pci_resource_n(dev, resno);
> >  	struct pci_host_bridge *host;
> >  	int old, ret;
> >  	u32 sizes;
> > -	u16 cmd;
> >  
> >  	/* Check if we must preserve the firmware's resource assignment */
> >  	host = pci_find_host_bridge(dev->bus);
> > @@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (!(res->flags & IORESOURCE_UNSET))
> >  		return -EBUSY;
> >  
> > -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -	if (cmd & PCI_COMMAND_MEMORY)
> > +	if (pci_resize_is_memory_decoding_enabled(dev, resno))
> >  		return -EBUSY;
> >  
> >  	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > @@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (ret)
> >  		return ret;
> >  
> > -	resource_set_size(res, pci_rebar_size_to_bytes(size));
> > +	pci_resize_resource_set_size(dev, resno, size);
> >  
> >  	/* Check if the new config works by trying to assign everything. */
> >  	if (dev->bus->self) {
> > @@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  
> >  error_resize:
> >  	pci_rebar_set_size(dev, resno, old);
> > -	resource_set_size(res, pci_rebar_size_to_bytes(old));
> > +	pci_resize_resource_set_size(dev, resno, old);
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(pci_resize_resource);
> > 
> 
> -- 
>  i.

