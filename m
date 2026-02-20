Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMPSHn2/l2nL7wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB041642BE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C43210E76A;
	Fri, 20 Feb 2026 01:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJcZBFeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716DE10E76A;
 Fri, 20 Feb 2026 01:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcoanIkbwo91mY+lScU/vV31U3b5/Tj2LaTlCa2qvAznMxgZ3YTJ5CHEIzVbXCtvmjIGerCIaUy8epSxkmFrTWw+jcUpLy4Qndp7rJbevyj5p8GX6OlHe+VSgFXZTr6+xDZgneJr3oDq6ZtSmkzOrlWdrZwj9giX44dqTAUM+ir92gz1NKFCenv4noSJ3iJJUU59D1RyRvk0EN/mUvHtQAwYYaT7K3ACDpYHrKjoXLysfpyh2ZvRjparkdHdVTXe4fPxV8OFqK0vduGi7tG5u5XOvhLS7HkaGBSCzScr5lI9Jpt3L++Nr5bDa3imh2UfkTmC8UTF/iDdN/3cj/+FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D8kX7I1u1FLerBYlUk+XJdD/4cKrZU2ocj8zqele0I=;
 b=J5tScuTpCV2yTEgwWFQs7rVo4tlimagQqTEKRkAORJR8LC54ARvad834PYbqiLCX9VUWSLmW5qOQ2xbG7iM8vdiVexl/QQPBUXJBfL8tHzuhwYJXSV+CZyqszApkMhWFCj49/U1fzlKJZ4/2LWe0OYn49JaChLZzTBiVKEE0HmGsn6NAhBZBO0vdQd5PQbwT4BKASJ20j49bLBsU8qmXQRdKzM9+/F3aUMWVj5JPLb3P/ZZ1BBgbJfrJs9cC8nD/RfEIkKWidqDsvUUOg+M5pnHqJV1P97isZ7OqOjBjhz/N7o/4K2vyiC6pRKaUcn3QhBQ5BQdzesbnufGzSJdrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D8kX7I1u1FLerBYlUk+XJdD/4cKrZU2ocj8zqele0I=;
 b=KJcZBFeHo+K2gl592QX8/05cZcUpuJT7IoenuCgJnz3BDIOQgUQ2bO74fVl8ETl2cU0c5mQigOp5/o77XuN7w4+SYifKWRu9aqY/S4u1vIZqPBP1LbwDDRmETGXWrI2l48YCRkiobJ5XrSMB2VE0wXjfly3Q4V/eMe6vNCgSLaBsoG8H3XZ39I5AhRS21Ph4ovyMr0z5s2YQHUVA9u8g4HfHInXg4J5+Lq4GN5YmCWaITiD/VoKmoqf/rA74bNy85qMLOjd/Wk0/fAk8mY8muKN3z1oW3vnO7WcY5AaZcUFm2wLCK8cG7auFYu7eq1o9VqBb1iVPDizL/LekLj62hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 01:57:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:57:08 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:56:59 +0900
Message-Id: <DGJEZQ9WB8GM.15TPJZKG3G5P4@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <ab1bad5fd85cbe0a9fdfe89cb8e902bb@nvidia.com>
In-Reply-To: <ab1bad5fd85cbe0a9fdfe89cb8e902bb@nvidia.com>
X-ClientProxiedBy: KUZPR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:d10:31::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: d504ec4a-6d5b-48ee-b070-08de70235a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmRQUU54NjI0VU1TWnBWSEdTaVQwMSt6Y0xEaU80OGV3a3hpQ0pveVdGL2Jj?=
 =?utf-8?B?MDZGeTlLc3FUM3V3YS9NTUVnSVVBRkpiREU4ZnJMTm04blRUelN3TFhpOE80?=
 =?utf-8?B?OVo1VEJmd2c3bG9RVG9FOStvSW1ad0d6Yk9aRVcvNkJXM0xINW41UFJycUlq?=
 =?utf-8?B?ZjJreEVHZlFNRTVZZWtDRzNiOEQ5QTd2U2lldldIK1ZndnFaS0x4MjYrd1Rz?=
 =?utf-8?B?bit1Y0VSWXA4c0QzMUlQNm5FcFFUcElDZ1psaE5ZSENhS1crdm5DL01reWZv?=
 =?utf-8?B?VzFFc3N6RndDMWVwQWtwdlNtdklKVnlBSC90SzMzUjRRY0tFUmV4ZnVMak81?=
 =?utf-8?B?QWVhQm9Kbkt0U0ZEWDE2QmYyVklkTEhRK2p0MXRWU1I5YlUxYllGR1N2YTFM?=
 =?utf-8?B?enh0ODdrNWJMYmZvSUlaYWVBeHdjSjRlK2xjQno5Z1d3eEFPTmRoNEgvOXFy?=
 =?utf-8?B?U1FmT0Y3VmF1cUtzLzE4azhzNXFYaU13MHlqR0RISGJGNjlQOWZSc2p0UzJE?=
 =?utf-8?B?KzllQXZOY0E4TnRMUVR6MFc2ZU1vekhCcDBYZEFsQ3VEZ1pUR1UwMUlWUDJh?=
 =?utf-8?B?ajBPY3AwbUU5NVF4dGlmbnJubUUzR2hvL1U1aWlKbFdUeFRZbEt1OU5vZVJ5?=
 =?utf-8?B?NUpnSndJaFR6WHlGVEQ4YXdrTFNEeTd5MUNBY3lSVE5RT1NuMVVRU0s1WWR0?=
 =?utf-8?B?T1BVakUvR2kvbHdiZW1TK2dGVzBoZkxPQ2lEUkY4QkxEbmg0VVVWM1BmbFVN?=
 =?utf-8?B?bWVvTy8vMlVHOGczZTVEMkdRaEVnRjRhOGdRMk90cnV1NzRCOHNVTEtUaEps?=
 =?utf-8?B?YlhqRXI0VXVHRmhWckxxenpKZ3RtTDRRR1F5L0d0N2V2eDlQeXZxVE4xZDVU?=
 =?utf-8?B?S2p0ZUNIWUxwQWxSLzdCa2RhZlVtSTkzWjlZc2lKZUlWYlVTdTZUemlWZUZx?=
 =?utf-8?B?dVhtSG1MZkR1ZXZqTVhTZGpGcm5CV01DczFQTVdKcmw3RmV1akhiMjFoakgv?=
 =?utf-8?B?VmpaanVOK2xIM1g5VEE1RlNRUzhoVGtIUy8yWkhaUGlHQ2J0R0ZaaytmYWFU?=
 =?utf-8?B?NmtMOVdEMnpoTnRPOGxydWt1WlFkV0tSbGFaRjhpYUsxM090N2VvekpOZmNW?=
 =?utf-8?B?bGVFSzltSUNHOFVKdEdKcFNVdFZpb0hpOXBWYnlhby9UR0c3NnB2TlJUSzM1?=
 =?utf-8?B?WHp0N2xwb0dLYlBQTEZJMFAyVGxiSXlvYTJmalFXR1JzQW1VWE5ScnRjbzhJ?=
 =?utf-8?B?SFljTVVtSitRQjVqcWlSRFBxdlA3ZXVGRmdXanppQTFLZUZpRldWOUZuUy9P?=
 =?utf-8?B?dzRJNUxHaG9TLzZRMVlDZVdFY2hiblloa3N1R1hGQlkrUEVPbk5NZ3lRZzJU?=
 =?utf-8?B?aGJxcnZ6a3VhODZ0QnlXdEN6ZFFtVHZqNWxsdjlNWVN4SnQ5S0dYL2RPUWxE?=
 =?utf-8?B?bDdtUkt1U2FibittMld5M0dwc3JVV0pEeFllQnFqMWV5RVd3YTlramQrVS9h?=
 =?utf-8?B?Y1RSREhWa2hrRWlWOHZFZktaVmJ1SFk4UkE5MUpXcS9TTyt5VUFZRXMrdTlR?=
 =?utf-8?B?RnU3aG50bDZoYlpteFNrWlRHRG9hS3JlTm9FU2d5cEpqa01IVk55NFFrVVZL?=
 =?utf-8?B?Q1FJMGxzaEZkSVhURzlnZHhLUUgxMjl5bzRKazltMkUxNGhwVk0ybEVmZnlI?=
 =?utf-8?B?N0xnSDlQM000QzBRcExsVmNyNlFraGNBQ0dIM0pvM24zWXZ5dm9sK1k4UGRO?=
 =?utf-8?B?b1JudXhvaUZHVjhEN0tTMGI2NVNONU5PRWhBQklRK0hhMzJkODM2R0kzN0ox?=
 =?utf-8?B?Vnhoc0Q2SCsyYWtWSzZ2L1ZJM09udGVTVG5sTWljdHZDNFFXTmxPU1lucjZ1?=
 =?utf-8?B?b3MxdXBDNzNNdDF5aE56L2pTZGIvN3lZTWQ5WlRNb1RMZVB6TjkwWXVDV0Nk?=
 =?utf-8?B?cEJpNUVjWmx0UnRxTUEyT0R6STd2cjZrVS9YQnlzNXhWV3RlZEYvODZFYkwy?=
 =?utf-8?B?ak5JSG1qYkxVRklERXk0c1RRSFBRVHNQY0pVejI3S0VRYVkreXBOTzBYSUEx?=
 =?utf-8?B?Q3l0RXZKNk0zbWdTSDNQb0s2YlhLNG1jZDRCeG9yTFRKTGx1L0hleWVaZUZB?=
 =?utf-8?Q?v7cQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlo4RVA3OGVnODllNWE2eWFKMHIvVjRMY1k4Y1JGTjNhNVp1SXdIS3Y3d0VB?=
 =?utf-8?B?ODVFMitaQjA5di8vdUtLYVY5NndBZU5ycVFuTGs5S0xwa3lEOXhtODkzS3J1?=
 =?utf-8?B?QzNFSWlXQ0ZJV2ptZFJFUjFNcjZlYjBMUzJ2dGtpL05pZ2hxZWNyeGh2V1pi?=
 =?utf-8?B?cTZlTzRUQVZTb2pVa1RpTjVxWHNURlFXRmU4ajNNR0N5V0x3VGExT0oxWEls?=
 =?utf-8?B?cU9McXdZSGdCdW5yQzlJUE9HTFBBVlVFcmxleHFUUCthZzhLN2kyaEVIbkUz?=
 =?utf-8?B?eWNuZ1BxWkI4blhHcnZVZm1qU1Yvb2pRcENZeHNTTk8zdlNUWmdLQ1dMWHVp?=
 =?utf-8?B?dTVscG9aT3Q4dDBLVVU5VHJ0M1g4UlZwUUhBMzJoK1pueEU0Y3Z1U0pKN0sr?=
 =?utf-8?B?K1ptZ1lYWWNIRlhrVGlFRTFic3MwWVEyWUVTajBpVFVlcU5sbUJpR2hNYWxU?=
 =?utf-8?B?c3dUOFlCK1RrLy9KaDZUaVhRU25MWFEvRDFBTi9jZWQ3cGsvam9CZjd4MkxN?=
 =?utf-8?B?Ry9YSEpUanNUS0ZIK09JWkVGaW1BV1JvYmw1REtSMVNIaUljUFpjeW5nRlU1?=
 =?utf-8?B?WUN5UWdCODdPZFJ2TVNyek1IWG1vSHFiRjlBanZtOXFjRC94QjE0NjI3L3dx?=
 =?utf-8?B?ZThDSnhyWTlmai9tNmI4NmtGZGFFM3FWc2VuOFN4Qjhtd2FaREV3RlYxR1Rz?=
 =?utf-8?B?VGZzN2ZXN09kVTFrTjB2SUVQc3ZTeXMzRlUyZktUM1ZTL3NEWjJwajI1WFlD?=
 =?utf-8?B?ZmlDOWhmU3BPdThPVDdpM01ZV0hMWGpZTHhGYnpXM3FSaENhcmJFQWs1bTNn?=
 =?utf-8?B?dkc3d1NlSTU0SXRGMmFSNGd3OHF2dVUzS1ZmZlJEQk95TVlucE5ibG9JeHVV?=
 =?utf-8?B?ck5yMGJEalpEeVhkcXdhSldnMXh1OXlqc2NRNG12T1k4S1pvVExDOGVRUEtW?=
 =?utf-8?B?anZCdkNlR3Nub1lxREUrczlSUXFZcHhwbVZwQ0JnRGVmRnBEZ0N0aDhzY1pj?=
 =?utf-8?B?TXV2WWNvN0UzZGNMSE1CS2xqMVZ0ZXdxb2hHd3RZSGFmZFF4ZmhHYW45b0Ew?=
 =?utf-8?B?WEc0Q0NMenNsK21JMzAyYUtFMmhFQ1d0RE5qaGZQMmt4QzVLWXM1YStBZHRQ?=
 =?utf-8?B?M2F4SThlaDhnSFhaRC9DZmgyR0ExTXpuYnN6R0Q1UWQ1bWxNTUdpKzJpR1hK?=
 =?utf-8?B?ajl2MmpkVWtLWWRRemVjSEJ6amN6ZVJBZkxFbHh1cklpd3BZY3hwb1FmbmhR?=
 =?utf-8?B?RFNRQkxSREtVSjFGbDE2MDFHczlORVJkbVNWaEtGNDVLSTlFMlJxcTIyV1lR?=
 =?utf-8?B?NVU2WS9MdVpnUXoyYml1L2dyakRUVldWeXNIU3RDR0tqay9vdi80R1pIRklV?=
 =?utf-8?B?N1l1WXZzZlQ3SXVNWC9GQVBUSldlTGpEMVhobHBqSGhxYW5aazdwT0VjdUc0?=
 =?utf-8?B?SC9kMHZWQXZzUWFOOTR0d1AzSmNzLzkxVkZlai9tL3d2UDNmSUhBek5HeDBw?=
 =?utf-8?B?c1N1VllhR1FSNkM5bnlqb3llaCtFNTVaVE83NVBaUTZ2MnRzUitZS3dYS212?=
 =?utf-8?B?a3FxNFpPZzVzV2tka3ZJS3QzVm9FbnFlNjNYdEttTTkyTUppcVRTS1MyTVVu?=
 =?utf-8?B?WlhEWDlIN0N5T3BtU3I4WGNONEhxRHErcTdsQmR2UlJoMFVXUnJBTWVaeGx1?=
 =?utf-8?B?di8xNi85Z1FJdXlHNFRueUtmSlZYdkNqSytvclRySHlDMTdCYXBRMnRyUGVo?=
 =?utf-8?B?eFB5NHN6cGpUUjhJd0dpczMxOVFNZlR0M1FvbUh4SFdGNkcrdHBqNDhaZnhX?=
 =?utf-8?B?T2RXNll2NjMybS93N3paeVBkczloK2tUd1ltL0hkTUlPenV5UGRRcFNTYlpL?=
 =?utf-8?B?NUUvSUhKbHJaU2IzdE5uQUZnQmc1UlJpMHRHTVhHZWhLYXQ4Um9ZNXkzUThw?=
 =?utf-8?B?Y0QzRXlDd3pRQlRScVNsZFNjZThyNWZUYzd3R0VRUTdNUHJhWHVzb2ZEUW0v?=
 =?utf-8?B?dEVLcmJuMk9qWFdmaWdXVkpkcHAzK0xBWllBQ3RUUTlZc2hpMGhnQnlJSFpL?=
 =?utf-8?B?S3FEeG5rTUk5ek10TUJhcXgvRU5pYmhrcGlGMzJsc09qRlNxOFVlSDIzZU8x?=
 =?utf-8?B?S0RvaUw1YWltN3hYWkdmTGJ2U1ZUcHEyQTdjV24zbHR5NXNFSTdGNEl3VXhT?=
 =?utf-8?B?bjJ6alBuZXBmT1hFc1RLNUdwcnFKUmFzd0o0WXJGY2ZGQmhXWnZ1RWIrYnV5?=
 =?utf-8?B?OEx0Yk82SWxzQUEweDhwUHVhMlBHTVdKMk9mc3BhKzlkTzJnWEZBdTJGRmFn?=
 =?utf-8?B?R3Yyc1lNc0JJMHl6NWg5eHJGdDEyN2wwUVMvNnFLdkdXTU5ZeG9Hdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d504ec4a-6d5b-48ee-b070-08de70235a7d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:57:08.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW511cBms3RAnO8xtTE/aZ9R0lfBIJxlnN7vN0btNxhUj+rnpzVIN7yF2RXA8MZ+auZZYRJusp/xUWbQ4ou6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: EEB041642BE
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 12:31 AM JST, Joel Fernandes wrote:
> On Thu, Feb 19, 2026 at 02:13:37PM +0900, Alexandre Courbot wrote:
>> > +    types::Opaque,
>>
>> Need a `//` or `rustfmt` will reformat.
>
> Fixed, thanks.
>
>> > +// SAFETY: [`GpuBuddyInner`] can be sent between threads.
>>
>> No need to link on non-doccomments.
>
> Fixed. Removed the brackets from SAFETY comments for GpuBuddyInner
> and GpuBuddyGuard.
>
>> > +/// - `buddy` references a valid [`GpuBuddyInner`].
>>
>> rustdoc complains that this links to a private item in a public doc - we
>> should not mention `GpuBuddyInner` here.
>
> Per Miguel's reply, I've kept the mention but removed the square
> brackets so it doesn't try to create a link. This way it's still
> mentioned for practical reference without triggering the rustdoc
> warning.

Won't it be confusing for readers of the public documentation? If a type
is private, it shouldn't be needed to folks who read the HTML.

This sounds like we instead want a regular `//` comment somewhere to
guide those who brave the code.
