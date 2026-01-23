Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPsCDKJwc2lNvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:59:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F177611D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1A310EACD;
	Fri, 23 Jan 2026 12:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fWAhVIzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013052.outbound.protection.outlook.com
 [40.93.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2936E10E27E;
 Fri, 23 Jan 2026 12:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx63ylS7lhg5ohjAMtJvl/NXi2J9qSli1gayouBXb5IPHIWKmi3A0XssXRHER0Y8Rv2rrBX8QCshQtWBwlLPmKr/VN2vkZ2EQO251k449eU2aZCw5c4K+LqzRTP/FXbdOub+TbBZ8l7n5Yo9fHr8132nTX41RcDZEoERM8LwhHvY/QP8/5gjqiHGXB4zOQBSHorvOwJPo/UpySMg4Qv/WssJ0uET1rVAa0AZhVF5xFn8QlRCYnFIo//vqWrKvGHQzza9Sk/tUFC5/2KG/znaG+RSU7yv2qJJO5zFk23gXV7qPQrFSGqkDxal2SUeSYDNBncKSf5tf2H7nR1zvu/tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJHN+IQ5IWfcCuuLhyeXkaHe7zqEMDGwHYL/MdYJbT0=;
 b=C34VyrzvhQ2cmHbQnI38ZbKhWwutQfYGAnWeRRoVEwvbG63No9Cq1s7Hrix+d4X7NZzojUWo0mf9nuIAjNU7AOPs0iPDAEOrjK1xCVYJS34tmw4nU6l64BhmE0zeRI9EFzQk0aVMmnViuhA6tPW2DPPJBhFj6bALGz9BzPZFnldUA4XW0JrI4UlPsaDDipTHs+G6+6uZmtJJL+fLxgo1L8d26cuzg/j9MpfT+aEuLNHPiS/NJNqKnXxZyc0FWcmm16kpeAHd+0XyFMZ4F6MeMxnEkPCPJwhA9GjfWg7CgkeFENEfOS4KQm9YqCs7TCVo/3Cc0Yb3O8gmIqL0Wm+WPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJHN+IQ5IWfcCuuLhyeXkaHe7zqEMDGwHYL/MdYJbT0=;
 b=fWAhVIzQ7C+uG/ZFTXXREPiNiQPB04aSNpDyXao63XZ8tFdiQEnTXqEejnU0J9fyKYeYk9VKfjLIQGVu+In/zs8h8Qd02+eaG8cgOo9EctcfsFeGsqeAIj1OlV3A+ts8h3DDPK7bcNk7QpbeLLxzytDRMcJgcI02wg5RjL5k5L93BmzZne4imIZz8AQxyjNZHuSOH9KCS8Xh8QWumvKJWHMecuOOo7iy5bOzmanXuLAH2NoEBoYti9nWsWiV5eJAAb5dbJEOra9tmKFqqCc5mF6az22MdjgfgDN4pXbiD7yVH+/c2La10alLCcY5xE3G7fal79bUoMEznApMOdpFpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 12:59:02 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:59:02 +0000
Date: Fri, 23 Jan 2026 07:59:01 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
In-Reply-To: <20260123121343.396bc4cd.zhiw@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <20260123121343.396bc4cd.zhiw@nvidia.com>
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: BL6PEPF00013E0D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Message-ID: <DS0PR12MB648644D902FAD272898AE22AA394A@DS0PR12MB6486.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6556f3-69ec-4fdc-ad67-08de5a7f2e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0Y0VVpYZVFHNGlUVE41MUt5eUZKS3ozZ3h2MTBvbW5zVDY1a0xQWUg5T3FK?=
 =?utf-8?B?Q1hZbmdYT0E2WjRrcEMvSXpjK2M3dC8xU25oKzZZbFZUYjNNYkk1QTdmYTBL?=
 =?utf-8?B?elFFV1VOb3ZGN1V4dnh4ZmpyOVovbm1GSXExVHRnYUhrbW1HS0FMa0tqeDU0?=
 =?utf-8?B?cEc2eUpLZ1lYdGZ2c0huUTBVSysrRlZUMHZQUXc3MXdQU2FhS0crR0pER1Ay?=
 =?utf-8?B?TFY2ZFFMR0tFU0Rta1ZwTDBWemZUMGltUWxTRFFZWmx6N1o3ZU96aEp4dFov?=
 =?utf-8?B?WXcrNkUvcHBWSFZiNnVBQWJ3RGRrcS9XUkNEVXZPWXJyaC9ZWVA2UVpwNHV0?=
 =?utf-8?B?bmpVVXNvKyswWUtKd2Z4QWpnUWR1QzNsQUc5Q2xXTXgxaEl6U2F0aERqNFp0?=
 =?utf-8?B?cnFDVW1sbWFaUHpjS3hELzNRS3E0cFlaK1A1T2ZKWGlrUTExaFhkNHA2c0lJ?=
 =?utf-8?B?L1RXTUxFSEcyTXQxS0xncDNGUkxldXlETXNwRFdoZ2F2VkxxK1lpUXdMakxa?=
 =?utf-8?B?cC94bnFCOENKK0pTRUNlTTQ5VTYvQisySUlPNFB4N29ZWjAvYnliSEdYZXNJ?=
 =?utf-8?B?TU4zdExGMFJ2bnZZbFA5SFZxcjNQSlFhQjR0MFlCREkzK1VBenlpNjkvVnFu?=
 =?utf-8?B?aml3YnhaWVphNTdOUjhUOFRNczgxRzNvaVBXK2VsLytWWWlsUFZRTXdPZzFl?=
 =?utf-8?B?aHNKUGovNzRnd05jZHRLc28vbjVhbFdnUUd6bFBZMEVWdWZ4TStQZzZhN2M4?=
 =?utf-8?B?S1BiMUp0OHBuWlQwTXV3MG53WE4yODRTLzNkMVBSbmJvdEIyQ2NOKzlSN01O?=
 =?utf-8?B?M0Y0cUFMQUNDb0h5RWN3R2NDeERWdTRMR1dPV3NqdFVIWU5id3ozNVNDcDky?=
 =?utf-8?B?UW9xQk9XbTZBRkx6K0FYVTRzL3NtMU1YMlFaYityUDFTMitTMHVtbWJxK3U3?=
 =?utf-8?B?VWV5c2huMWovck1qZ1RISkRYa3NUUktjSG05dUFXcFRqMEZKM3NkNlAyQitV?=
 =?utf-8?B?UU83Y1ZpVFB5Qnk5a0dkNzkxVXpHY1NvaHZvYVB1dmo4ZndIc3h5MXJkM2xE?=
 =?utf-8?B?ZkhabHlScXNVZExqRmZwRnVtK01pL3ZpZWd6RUZBNGtxb2NyelovUjVDZXgr?=
 =?utf-8?B?bmJacktER2QzY2I1cUhqaXo4VHNRdUU3MHlrZkNoNHZ2VXYva2czMi9Xcnd1?=
 =?utf-8?B?YlhYc3hhZCtrY3NIa1VFSjdiTTVpVytkWUt0aGo2bjg0NURxbzhqYkZFUkF2?=
 =?utf-8?B?RVFMb3FRUnhlU0VmbWxoZFRUVGdUM1UzREdscnphWExDWUpGVHptc0VhUDQ1?=
 =?utf-8?B?M3g0VEdIcm1jcWMwVnFOZU9ObDMzMGlZUnBDaG0wWXV0alFlVW1yYjl1b2Yw?=
 =?utf-8?B?cXVUaWl3ZytmZzhwZlE5M2orYlQwNEw0SzdBOGVCL1J2RlhqZXBMeDVSbk96?=
 =?utf-8?B?TlJwbXNLdWhMSDZTZFJWNDRyeG1NS3pmd1dhTUtoa2I0WXJRNUR0d2Q2SWdG?=
 =?utf-8?B?TFVSUzFWSGdvN1dOMHpEakNWUGQ1SlpMMHloMHZUcUhWWGJya2twcUF6L2ho?=
 =?utf-8?B?Y29nTW1DR3VYeGM2Z2x5cmZIWGhYK25iS0xXZWpkL0VBNlFwWHVBdzJUZFA3?=
 =?utf-8?B?S2REd0VOUDFkVzZockQwVkVSTWZLOXowYVZTSW84OFI5M1lPazUvb0U4Smgw?=
 =?utf-8?B?K3UzMy9RMkxBdlM1VUtxa21BN0w2blRFY0l6NjhldE91dTBURjNaOEdqcFdW?=
 =?utf-8?B?THJFaURwcEc5aG94UW8rSkIzTW0yL3NCNUFmQmdrUEZYK0lBN2NiaE5wZnY4?=
 =?utf-8?B?Yk0vbTBRclkwNVdwbXZITFM5dmdNT1VidXhlVUd3cys1bDR6VVNVV1YyMmFy?=
 =?utf-8?B?Lysrd01VcmphRzk5MmJ2clRVWCsrYkpLbjh6TUhFbTdFb0hsZnk5UmhMTUt1?=
 =?utf-8?B?RU9YUWNwVEFEN0FoNTRFZzduYXk0Q2x5MkFVdkpMQjVHM0ZtSTZGMEpvSlNL?=
 =?utf-8?B?ODNKdFNEcUc5UW5taUlHZWQ0RFFIb2xhR2Q4NHNFR2F0cXZpRUdjTzk2S1Zu?=
 =?utf-8?B?dS9ISDRRYkZhTDV2cHMzR0dXdWRiZ0hsWTV3NUVzcTRPaDBNeGczYVAvOGIx?=
 =?utf-8?Q?Fm20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDM1Um54VUtMODY5Ty9SQUo2cmxYVndBbFBndk1rSk4rcm9DeTUvNzd4SDdE?=
 =?utf-8?B?b3lDZVd3N09jV3d4MmZCZjNBMERkc0FiZHAyWkliZGRkS3JWNzZQVjF6aDhu?=
 =?utf-8?B?cnpHWFl3L0lXRk9ZcWZXNjBINitVVDFyQURlY0Z0OW9RN0pUUC91QVJDaUl5?=
 =?utf-8?B?YjVSVjJ2VEh6UTZlaEFhald5cnBBc2lCV1FDYUZ2TDU4OWJta1FEWU1HSXZz?=
 =?utf-8?B?V3NJbUZ0VXNDdEVuaVhsdDVOcHBkcUROWEZUOVFHYTJJb2Z6RHBZVVdoUlhY?=
 =?utf-8?B?ZnpvTllYSUFSL01qQ04vZ1FFanBVU2pwaG1XaTI4WEc5RlNwbFRjYVErVHZT?=
 =?utf-8?B?QzgveFNzaWhxcUFtUjVOWDA5b1hxcUxrMWRROTJ0dVF2VXNDa25KLzlveG5s?=
 =?utf-8?B?WjFXR0RyV0ZJdUszbk9PTnNjQ1VERVg0MzJSblRpa0ZzODZBbjVpZk5BMlFS?=
 =?utf-8?B?WFpheFFWMnpMTzdXN0tpUG96QmhJeGFsOXg2QUdZaFdkaklsL1lJTFBoM0Y3?=
 =?utf-8?B?ZHllWWZQNk1udURMdDlscHFBNmZxdnJSOGh6a2ZEU1NiT3FGbWpIRFhGdnBq?=
 =?utf-8?B?STRIRmVMSzdnd1FCcXplUmxUT2x5NGFPT1BhUHNuTVFyZktoZGdQUFZLQ3VX?=
 =?utf-8?B?bXQvUW93V2JTUlJ1T3V4emx0bVZaU3ZoWGdPaEQ5L0owOFN5SmpPUm94MDJH?=
 =?utf-8?B?NDdkK0YySng5VnJVYit2QjBSaG9hVStqQ2JSK2lwbFUzOGpTMVdldDM4bVpJ?=
 =?utf-8?B?STcrdzVVK0RLTHFHZHF1MGFmTlRxeDRSSXg3OHFyMmtLdVYxYVc3aVdzL1gw?=
 =?utf-8?B?Y04wenV2NC9XK2lCNDVqdjdQc3hTbTZaYzZyemtlYlZ0NkU3L3ZReDFCOVp1?=
 =?utf-8?B?M1pCTm9nbDhRZFlXb1QydmtIMXpmUkUreHVlZFBNVHVJRWhtUjBOU1ZvallS?=
 =?utf-8?B?QUpiR1Q1OHpFSm1mNXFzVGl5b1ljbElIZTlpemRtZ0J0MU9rcjQrTnV5QnhU?=
 =?utf-8?B?SDBVME1ybmJGSUJjUG1WWDZPTTVBdHFpZ3J4NzJvVk0zQS9FQ0wzcGdWdXQ2?=
 =?utf-8?B?bGVWVEFRbVdHVWp1RzY2cjRPWVM3S3pPcnluYjNiQ3JJSlZZSWQzWVNkNmxT?=
 =?utf-8?B?endzOWNGWis0V2NhM3dWb0p0TlJXWnF1eHhsalVyaUEzNGVBcXJ0bHpEQUh3?=
 =?utf-8?B?Z0RheUxGTU1oeWpyMm5CRUp1YWN4SXNGTm9laC9WQkI3MnA5Mld1WXFVWmJn?=
 =?utf-8?B?MDRSN2ZMaDV1V0RqRGw5R0VsUzdxUXVvTmNCZVBFVk5FZFVEZkdIeDJvM1Fp?=
 =?utf-8?B?dm0zUldtZmpEcWd5Mnh0M0tZMVpMQitFemdzLzI1M01PT1dJYmNFZWVhSVI5?=
 =?utf-8?B?NWRpZUN6UERXanU2ZnZHaXJwS1psc1hVSlljY0xtcXcrRGhsVWZmTVovaTZx?=
 =?utf-8?B?RlhJNlpBQ3NodXRFaDJTeUJmMk5sVEVHS041aEFlb1owdlEwdkx6WE92Z092?=
 =?utf-8?B?K3prc0gzMnZiMURjVDVkcjFxTDE3NE8yZHkxNlNtK2hyYWtmWXJoVlgwTTc0?=
 =?utf-8?B?RnFHbUFLMlAvbWtMSnlaNklLWHlQYWNIRElnTmdNTHNnYTZUQnhpajU1SXlB?=
 =?utf-8?B?c2pQUDEvMmdyWmhEVDl1TDNSKzV5MklDWkpzQjEyQ3F4NkU1emRYUFlSUjdL?=
 =?utf-8?B?NVpSUDIwN1A3Y1dBeXZ0U0tmdVBRdWowczRLb2ZPZ0l3c3JBTnBiM1IwY2xm?=
 =?utf-8?B?cWZLNHp3V1ROSzJ6eklGdktpQ2FQVWF5STd0aldmWHZoeTBLcUpkMzllKzlj?=
 =?utf-8?B?OFpKZVUyT1pQbEFnUEdDbGpRUGwyaUtKSnZyUlNaR1UzeTkwMkVPMjBaZWJW?=
 =?utf-8?B?TXpPMmtFcEJsN0NpQmFaY1R0RHVSM1NwYkROMzBQYkFCbjk0OXp0WGRPN00y?=
 =?utf-8?B?MmJveWE2VkhPaW5Vcm5rSkNKWVFsc3FNc0ZYdHdpR3JnSHJuUVpybTlQZ3ZS?=
 =?utf-8?B?dHNWbGF5THFEU0ZCTXQvVS9rSnZPVGlMMlk5Z0t3cjBZQUhDUmhRK0FxdFZO?=
 =?utf-8?B?MTBmQ1RUUWRSVWZzWnlab2F5ellKZm96cW1DdEl0eTFJZGlLSURMMXdiL2s4?=
 =?utf-8?B?V2RHM1FhelJIZFg1YjA0U3h1ZlR0bUdUWFRYT0RvQW1xa2JlTnZ2MmNQaHJR?=
 =?utf-8?B?WlBzSDJuNXJGcERpT1VPeDg1bURvQzFXVXFWcU9PMXRuMElON0tOU0JkRFov?=
 =?utf-8?B?a0ErQnAxZ2g1SWdjZ3pIU1JDNFRlbVplYUx5RkhOblpmOFMvK3JzaTFERlVI?=
 =?utf-8?B?MDJVM3MzQ0lJai8ySTN5RzBFMW90UEZYR3R6K0QrYytPL3JFcUlNZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6556f3-69ec-4fdc-ad67-08de5a7f2e71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:59:02.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ6GJ+PtPhaxmaZDJKKtOIDJqdVnr/zQzFTHi8QRzQIZQ4Suk1k18SMn0zJiYdvoIaRTXN9MVMMHYn4nzSpxNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D1F177611D
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 12:13:43 +0200, Zhi Wang wrote:
> Thanks so much for the work and the discussion. It is super important
> efforts for me to move on for the vGPU work. :)

Great!

> As we discussed, the concurrency matters most when booting multiple vGPUs.
> At that time, the concurrency happens at:
>
> 1) Allocating GPU memory chunks
> 2) Reserving GPU channels
> 3) Mapping GPU memory to BAR1 page table

Yes all these are already covered from a concurrency PoV by the v6.

> I can see you are thinking of fine-granularity locking scheme, which I
> think is the right direction to go. I agreed with the above two locks.

Cool!

> However for 3), We need to have one there as well beside the above two
> locks. Have you already had one in the GPU VA allocator?

Currently for mapping Bar pages, you need a mutable reference to BarUser.
For the future, when we have multiple channels sharing the same va space,
it will still be protected because the va space allocator (virt_buddy)
already has internal locking. And for each map_page, it is protected as
well. So I believe that should also be covered. Thanks for checking.

> If yes, the above two locks should be good enough so far. IMO.

Ok, thanks for checking.

--
Joel Fernandes
