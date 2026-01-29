Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NcuKtK3emmo9gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:28:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83AAAC10
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D5310E79A;
	Thu, 29 Jan 2026 01:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e+V+3TVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0727310E798;
 Thu, 29 Jan 2026 01:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTJjgiQIHRhWfCvEVT7/ZUnKeIAsjdCskUxyqr4rPiVTMuQ039bOgP9xT+vBSY1XPoTNlyyD7QbWjK08mqtp2Z9s+FdTUxTbpMc1MdvmBl50Ui27RxnGEgdxFCHRHS4PfbArjN4CeXn5Sd3U1/BW+tTLJHBhOMBNQ56o82b5DA/DKWbRUSNPZxRkoWSa3cXr7oUgFXTTgkoVFKTBpLL8xqPFzu/rTp1UPSh5ogMtU0uO9uob2iQ+MmC2I+RJSvpYaWiaRajKKYIp7ypkwICBFzAx13D9ucL0HqlZ5sT0ww5KTr0+ox6DsrHanLiNO/ogAFcwhfvfhIN70j71ooTuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7M2O6z5wuFJksKJjQ52l15hLCDr9+NWPSfrDDE6ddc4=;
 b=ApNWOKcyeJ7NvtwlmsxAutnaS5bKH7ldu5tbQyHRWYWmg8Zv/qLCg3bxpwnTkD3Qj1OCWePepw62690p87xgnVPLdXjiHj4+qQhY6U6jFb4J+Hs2qhXTqZQI03Sjl3eVAeeGQZtlr8A1To/6qpSW2dHQBHRyKeHUKyZoFeFNyjgAnmszcORRduJ92HLnwHAdq3J1sQ1U7cVADkcoBJGCslrTLlzCWEq+pQvo68BTMxfK0vNWAL1S2K9ErvJMQPfxDpKCEisRnFYFRqcB5m1Noup1SJRwcDoQF6KrCIaY//bADE6cPVSM18WRFBEeYXL1E7oiX0u/6PTTNEHymoRBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M2O6z5wuFJksKJjQ52l15hLCDr9+NWPSfrDDE6ddc4=;
 b=e+V+3TVvd84Fa1ntGB+prethWrDGzjng6/qsLyKhdYpw7ZrALdmgrDlWGXwR6YEOdL/Ujcsck9FyMMVUBD7Ac7lFuXNT+5THebTTS5fR6nVyPsmsS7fYCuk3qxJq7O71uFOrPBZ9iV9h82xxyN6Zbl6bnh4xffCnfKeChY/RObF30f0Symoj/50qqTaQmfEuxctZxnUbVno9u/vmz7aF0Fx5V1Ir5blH2I9OvzUfL5k8hq7iKMpTf/ife3WhaLoSUI0vMbmcFTsP1joVZFfHGecpkBJ4kTsQao+jjb2/J2b8ewLb2yrd91RjzbQFXu3HlsgLhvHiybgDyJ192abgmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 01:28:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 01:28:39 +0000
Message-ID: <b71cafcc-453a-4c77-afb2-30ee635a56a4@nvidia.com>
Date: Wed, 28 Jan 2026 20:28:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
 <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
 <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: b016db1a-5d51-4580-fc19-08de5ed5bb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pVMEQ2TnVNMVBaaXk5TXBQVnNFQXRxQllpN1J6c1hpNHZsQ0c4R1RCdkw2?=
 =?utf-8?B?R2xmc3BaRlJYbUJUcGxSRW42NVpZb2tZQ1lHSzNjaTdBY0h6UDY0M0tZanBt?=
 =?utf-8?B?YjFVVXBJRnpCay92RkwySU9tbW9ncG1jWGFIVFFXMmlDNHJheXArVVFHS2Zl?=
 =?utf-8?B?QTB4eFg3NExqUS9qeWY3VXdhUWxvTWJuVDBsUjRia2N0aml5VUNkWVFkbjh5?=
 =?utf-8?B?dk9KT0dKLzkyWW5lVURsY0FDWVgrcVkwVENxNGR3a2xURWxydjVjSGdKclpD?=
 =?utf-8?B?Z3F2a1ZjTEdiTWppRUkySWJ1U3VzN2MxbFNpYTdjUW9rcE0ydDNNSU9jbkZM?=
 =?utf-8?B?QVdPMWhlQnVWNTJkRE42US9WNDk5V3pQd28xMnJhamlEczFoNk04ODRWZlRK?=
 =?utf-8?B?R29xTVRJL3JtSjhMZWtvbDhwSld5eG5aVmpzenlCNW9uUmp0MUtWRDV6b055?=
 =?utf-8?B?My9UVlRVZlVRSk40VUdjd0JOd2lxOTIyb2tHdXE1SkJscWd1elovd2NSWkF1?=
 =?utf-8?B?ZjBqZ1JnQi9GU3hxUjgzbklYYm8rdmo1Z09wUCtSZ3BDcEljZE1pb3JaNEt4?=
 =?utf-8?B?M3VhL1M5OGtuT2xUWWFZaHB4RGE4empuUjV1UzVCemh5cDFHMDF1ajhFei9K?=
 =?utf-8?B?QU8zdlR1d0pEZWN1aVlINkZFNnBHQ1ZwVXdwcjJIS3lRNVNkQ2dPZm1xYlhS?=
 =?utf-8?B?VmJ3RitzRGJ5Nkw3WEd3SnFOL0JQbWlwakRaRHUrbk1mMWc2aFFQcXZlKzF5?=
 =?utf-8?B?Z203RVVvRjhvVWplcWd5SWhGWTdzbmJzMml6dkFRTk5vdm9mWG51MTEvQWIz?=
 =?utf-8?B?RDRxZHpVbE5yT2EwOHFWWk5WbjZueUc2cHNSL2JiWnVNV0IxUDdTaWFhWm1y?=
 =?utf-8?B?QklxeGFjZG9wRDgyY3VqNjdoZEN6NEhCZjlqc3hpcXA4ems0QzlzUnVjelI2?=
 =?utf-8?B?VmhmL085d2YrTy9OTENXSDJNWTV5dHJaRm5uNThUdVRidElIc1FwY3RUaDJX?=
 =?utf-8?B?cWFKTW8wMEorcHVHamxmSXZkRnNrRExjYkIzQVl0UkVRMDFkQnVha05Ec04x?=
 =?utf-8?B?b3J4Y3RDWjJ4U2V2Z3JVd09uQzZwblFyclBUZmNLNVJmS2s5WUhTSy9kK05a?=
 =?utf-8?B?WHl1SVZTSFEyYkp5ZEdMQWN3VUpOWkVKNG9vZktFa1FtaFhPZXZ0Ny9CWU1X?=
 =?utf-8?B?WDR4V1VmZTJEYVRrK2NlWEtUQXBpVVlaMDBrZ29BVnZrVjZ6RSt5ZzIreW8x?=
 =?utf-8?B?Tm8xUHBUcmtzc3NFNjB6d09mQlRpWXhHZkh0L0VpdHNGQysvM2VtME5UVERC?=
 =?utf-8?B?VGxqem9oaFJaNVB1V3R3NGhDM0h6ZFRyUVZQb093MHlsYlhRMVRLNnJ3bUhV?=
 =?utf-8?B?SHo3MTB5bStKSWliZ0grMnBIVHJrSXNEUGZHbFZRQmoyMG1XOHlOcHc3RFov?=
 =?utf-8?B?cm9raGpnQmJlUzRnYlcvMHhreFJxSVBLZ3gyTEI3eng0MzY1cjhZbUlTNERp?=
 =?utf-8?B?ak1GelVCckJDVnoxaGNsdzFYSERsK3lTYW10eGR4b1F6dmVWaVBoeEs5aVpB?=
 =?utf-8?B?SHg5RUlWOFFKV2F3dUY2TXU5akxvK0VDbGFXUi9Yd3ZzeXN3cWlEb3BMYk9I?=
 =?utf-8?B?RVlMRWR5QncwYm5aUWFrdVhvK1RqaU1DV3RDdEdvZ2ZUV0NwRFg1aklkN3B3?=
 =?utf-8?B?OFhsdkkxdVdncXRiQUswU2ZOdnJxVUVMenJJcXFtYTBIVk5jQUIzSkExUGtN?=
 =?utf-8?B?VCtSTlgzWmYzbldOMVkydEFidytTQ3hVa1k1Nm1yK0VNMS9pcUtycGJxckpX?=
 =?utf-8?B?VmpTUG01cHVPYzZSdjhyc0dhRVhSQ3R5RTdvVUxLMGk2bFRBdml0bllVVytZ?=
 =?utf-8?B?V09xWkdST0hidjR1Qk16NHBUcWh0Rk1BVmZmVVlPRmV3YWxpSElaeWZXK2tv?=
 =?utf-8?B?eW50NzR5UWxiSG9PemxhU3lsRVZwR0J4RDQyVFRGYm9NalY2MElrajE2c28y?=
 =?utf-8?B?THNCTmxBQ25tUElGUkx1dkZUakdqZldWWjNoTFNtajdpWUROdVBmTThQWEgz?=
 =?utf-8?B?U3NUNjFFK2hybWlSblE5K2RZbEtWQVhNUGVhVFZZcGI0dXBWc0UwMGwvbjFE?=
 =?utf-8?Q?jE/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em05UGZLYi8xNWtteHBNeDE2cmticlhUZkM0LzNLcTVzZCtCdzByRGVqbXdJ?=
 =?utf-8?B?UEtqZGZhZ2tIOFRvUjVscTNWcHdGWWNqYThwZ3BEYWd6eU50MnB1d1pCUjBa?=
 =?utf-8?B?TDNiUjBva2tjWDZxblhObU9ZeHZNa01OS2J4d1VBeFJueW93L3dYdmtxaGQ0?=
 =?utf-8?B?QUZudGQ1WDFXZ1VZRFVYYmFNbHFjeE5uOTlvb3cyVC9LVUp1dzVaMW5hOVFQ?=
 =?utf-8?B?R3dWWmVJbEtFQU5TU0pBcW91OVdsSGsvTHVLNUZEUDRGZWV2TmJsRU5BamZF?=
 =?utf-8?B?YzJRbjYwV1B0dGJWUUNVNTZZUFJFV0hEdm5NOS84K2kzQnhPR3dJYXRRa1Mx?=
 =?utf-8?B?TEx0QWdVR1BEZ3ZTcVk4eDJtMVdnVFdNUi9qWHQrZm9kRzBMeWpaRENwMHlr?=
 =?utf-8?B?WE44VVNqQVpuSlZzNDlNK0tncEtqeXcwNzV0ZFNlS0hGYVdhSlFxbXo2V1R0?=
 =?utf-8?B?TENMamZYenAvSGZ3em1idGQ5WUlQR1FPdkpaWFlMWUNvN09GVGs5anNWTnZL?=
 =?utf-8?B?d3E1ZFNnRHEwS1g5WGtYNS9rWUhzVkNZVjFyUlhVVnJtenRvSjNYdUpPNmFJ?=
 =?utf-8?B?UldDT0JCM0VVUHpUTkpjZGsrbVIwbnpxdHBkT3hpT3p3MStoaTQ5QzV3SDF6?=
 =?utf-8?B?dVlqVVEzdm5hbUluUzE2ckp3N1UzbU9qRVJTaG9PZGxpYmRNcVhyaG9nRTA4?=
 =?utf-8?B?M2VBZHdvWnlWMFdmRkZUd21OTWNveWVYb2JPQXFWbjlkNEQ2bkVjZVpSRmtk?=
 =?utf-8?B?cWpCTzByUm5kKzNoSzdsd2o5MnZXVVhKZlUzTGxTSUlHU2F5S0lKem5VNUNS?=
 =?utf-8?B?d3gydTlMU21Ba3FlblRXc2Fvdlh5c0FDbGhKTnpXV3ZPdHJ2eHV5aWhJa01Y?=
 =?utf-8?B?VUhoaU52ZTJ0MkIrNTZsT3ljUEJKYlBXbGVvUDY3Tjh0a3VTREdKTXd3VHBv?=
 =?utf-8?B?eURuNXg0a2pzOStXUEE2NmhVN0QrR2hQR0hkZ004R0ZJZDM5MjI5OU9NZGVo?=
 =?utf-8?B?OVBWS2lSREY0MGVhSVloNW04bEViOXZCNGZuTHBWd0RuOWZ0WTlBeTNaakp0?=
 =?utf-8?B?SHRmd1RoSkt4cGJEWmgzRjl4V25jT044UkdXNmxWOFNKalk3OEQvcWY3UDkx?=
 =?utf-8?B?UHdSL2d2WVFyc1Q2UjYwcnRVY0EwUEh5SU8zcGI0UjZMTVN6bkt5c0FpMUc1?=
 =?utf-8?B?Z25XdmJkUFZQN2FOSWZpOGxmZEJ2OWs0RTd3TjNvQWFWeXM2QkJnRUk0UHp6?=
 =?utf-8?B?MVQrcWRYNmRhck5aZVJsUFhSY0t4UWgwbzJCVGl3MkJmMEl6WkdNR0w5MmVL?=
 =?utf-8?B?UlQzcGNUZXlwQzFpL1pyYkVnd1RzRVVZRGZKYXIwaEJ4T25yRzFsdXo2bTdr?=
 =?utf-8?B?NHRMeTlyL0FyaU1TbmQ4NkMwMWV0T2daVWliVllhTG5hVEp1K25VcmpxT2Jh?=
 =?utf-8?B?NUhaV0VOeXZVNGFHcENpRktESEJUZWFZYTRheEcyTDZhSC9MSmhWYmZhY3JW?=
 =?utf-8?B?bXBDY0NyUEFMTElIZVkrdEt0Z0dnczFOYlg5Nmpjci9YdmgyZjZzc1UrK3JP?=
 =?utf-8?B?OTZKakt6OHFoTWlMd0VMMDVwcjlvbk9odnIrU1NPM08yc1RKOFFQQW96UlNR?=
 =?utf-8?B?b0JIa2NSVWVNVVBwYUZub0grbG16UTJFVVRQRC9qMTdnM0NDUXp0aDR4QUNP?=
 =?utf-8?B?WEhDNjdnK3pJbFczeHRBUmltS1JvaHlrWmNoNWUzUzBKNUxrcHBDODkrRUE5?=
 =?utf-8?B?blczN3hOVkNYZ0tlUE9tL1hOMnNkR1VybGlTdCtCRmppWXhLMUhzUGRuM3pT?=
 =?utf-8?B?dUVreVUrazNNYmZpR3NuOHROOGVwZEhPNGY3TDZ0V2ZONXlCU21VTnhCeHpI?=
 =?utf-8?B?YzNYTCtMS2d5SmVhMko4UmNMUzZ1Q01kYmRzSWNIRzBtL3BncXRJMWtyT0Fs?=
 =?utf-8?B?RXlBdDRzS1FLQ28vOTUyVHJZcnNkdEdDaS9mOGJwbnZSeUMvdm1oR0xKMHp4?=
 =?utf-8?B?bmNXU3pnUXVrZExRTXM1SVJNODhrVGNYeWlSMmptRTRnYmNFRHVIaXNERUsw?=
 =?utf-8?B?VGtZVWtOd3N1N05Tekx0ME8zN1FKYlNtVlpEV3ZQdXF4QU9CRi84MFEvc3pQ?=
 =?utf-8?B?R0c4RTBENmp0ZjFlOEFMaDRsandXOVlBVFVDYW44MGVpbzZ1Ly9IZU1PUklI?=
 =?utf-8?B?K3dUYlF3MVNqbUVSTnZnWUgvdnlQdnRJUmhzSkFYLy9Mb2ZuSDdibDlmOHN2?=
 =?utf-8?B?Y1Nmek5QYTB1T09SUEFPR3ZzaHVNckR6OVllbjBlV1F1NHNJOE5tVURSdVZu?=
 =?utf-8?B?Qm5FeWYzaHRmYTlQYUpEYStmK1EwQllWbXU2bEhKSWxFUVJGMTAyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b016db1a-5d51-4580-fc19-08de5ed5bb17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:28:39.6875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAgIdP5ET6egW4s+dZ8TxMNvDGXg1V2E7Iy/uVn5DGfdVdv9KiDE5413qWc23hdd1xt9zH0Grwm+NIB6UipL9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5B83AAAC10
X-Rspamd-Action: no action

Hi Danilo,

On 1/28/2026 7:09 PM, Danilo Krummrich wrote:
> On Wed Jan 28, 2026 at 4:27 PM CET, Joel Fernandes wrote:
>> I will go over these concerns, just to clarify - do you mean forbidding 
>> *any* lock or do you mean only forbidding non-atomic locks? I believe we 
>> can avoid non-atomic locks completely - actually I just wrote a patch 
>> before I read this email to do just. If we are to forbid any locking at 
>> all, that might require some careful redesign to handle the above race 
>> afaics.
> 
> It's not about the locks themselves, sleeping locks are fine too.
Ah, so in your last email when you meant "non-atomic", you mean an allocation
that cause memory reclamation etc, right? I got confused by "non-atomic" because
I thought you were referring to acquiring a sleeping lock in a non-atomic
context (I also work on CPU scheduling/RCU, so the word atomic sometimes means
different things to me - my fault not yours :P).

I believe we may have to use "try lock" on a mutex if have to use these in the
future, in a path that cannot wait (such as a page fault handler), but yes I
agree with you we can use mutexes for these, with a combination of try_lock +
bottom half deferrals. additional comment [1].

Coming to the dma-fence deadlocks you mention, this sounds very similar to my
experiences with reclaim-deadlocks when I worked on the Ashmem Android driver.
Deja-vu :-D. The issue there was the memory shrinker would take a lock in the
ashmem driver during reclaim, which is a disaster if the lock was already held
and a memory allocation request triggered reclaim. I believe the DMA fence
usecase is also similar based on your description.

It's about
> holding locks that are held elsewhere when doing memory allocations that can
> call back into MMU notifiers or the shrinker.
> 
> I.e. if in the fence signalling critical path you wait for a mutex that is held
> elsewhere while allocating memory and the memory allocation calls back into the
> shrinker, you may end up waiting for your own DMA fence to be signaled, which
> causes a deadlock.

Got it, I will send the next day or so studying the DMA fence architecture but I
mostly got the idea now. We need to be careful with reclaim locking as you
stressed. I will analyze all the requirements to properly address this. I will
reach out if I have any questions. Thanks for sharing your knowledge in this!

--
Joel Fernandes

[1]
I can confirm for completeness, that both Nouveau and OpenRM use mutexes for
PT/VMM related locking. In interrupt contexts, OpenRM does a "try lock" AFAICS
on its mutex. This is similar to how Linux kernel mm page fault handling
acquires mmap_sem (via try-locking).
The linux kernel does have per-PT spinlocks to handle the "2 paths try to
install a PDE/PTE race", but I don't think we need that at the moment for our
usecases as we can keep it simple and rely on the VMM mutex, we can perhaps add
that in later if needed (or use more finer grained block-level locking), but let
me know if anyone disagrees with that.

