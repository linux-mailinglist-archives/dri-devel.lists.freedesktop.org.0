Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dV24ESOnm2k34QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:02:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC071710BE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BA610E1DA;
	Mon, 23 Feb 2026 01:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nT5A7LCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CD210E1DA;
 Mon, 23 Feb 2026 01:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUIhq1Me0ZgBgWNAkLsmFrHxw3atSL9iXZ5VMGBMKl/JDSbcEnpOyVaGroahBTpIDjUU6RbA0ry7KY/scWuaZ43tuGJ4ewHB8TyX4NZ0TsrECXxjwo4ZklREKiTtYn07xLtHTcKmVHPNJXPI3rP4OIOHvGWhx43WlRF63Lkfl/iSfR3nBmj8l91FKYPoAxhT3h2F/x40A/iKm3IiO0k5rQV69kRWfumwGEuMLkjEJoMIBjeTnJ8X3O1MBySIuVhj1nzv8RONeG41VIi1tNR5R7Ij378UNfpuXZ+NQCwVEU0K2d9XTI76F9WnGlAwK72T3hEgqlGhsCuRpZcDJ53uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIX4lTlTidaI/fcVsH5TLjKvOe20o4o7GHIdcvnGDk4=;
 b=hz325YDgR29Tv5z2+vWianTCeViNubjjEJGFjneWEwOseIYJIm/S8gvn4asbgHq4dNv73jqZNcvFgIIc3x1R8aUn8ThJmF4sAAbfotgjxKN+/vmWGnts1XcwLn/YyhTnYaZ+5lWCNvaWImu1pxeD47iPlTRQN6TG9OcmB8d6lfhu/ybdSVr5mWAbQVA2ML309mULeNk7ueEdL/opwwIhmPWQUlB3M48VofEZh4/a5tvx2AqetpyX4DlwZPPq6OjqYPyZTXihbPSzJe5dH8+JLEqiQ6hnF4sYhgWuiorMKl1mOGYxiTT1tRhZvVB4BFEP8G6jzIgAOa42i4iFegx5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIX4lTlTidaI/fcVsH5TLjKvOe20o4o7GHIdcvnGDk4=;
 b=nT5A7LCp0bex2txCuOCYkMwHHz63d3XR8x5byL8tEB0vj0ZgR+gSWLA1bJCLkFVwwKaHqEEla/LvRVs+iBsG8A1yLtq0fNH0IMHwVAGkno00BWlPhamRAMhLx/EnLi9CIKVNIgjgxokooKRnW7bjprvy0RVJGSild861fE4Id/Evp2VMqjXWryPvc8RIzCRY47iktUEmcg8QHUUq9FJSRtjnD10tdls/4OfaqSBJS+BnwJkcOUM7VHDSSbpCs1yPXXUwhjZcavBPoc+MsNTZrzH6+VpP5eM1TQzYcqPh8EsHth4iBOOs3x7QmfNy9s+qiIe6AxeeBpm9t5d7iScfYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Mon, 23 Feb
 2026 01:02:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 01:02:18 +0000
Message-ID: <6fbd540a-d329-44b1-9986-67c64acb0605@nvidia.com>
Date: Sun, 22 Feb 2026 20:02:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <ab1bad5fd85cbe0a9fdfe89cb8e902bb@nvidia.com>
 <DGJEZQ9WB8GM.15TPJZKG3G5P4@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJEZQ9WB8GM.15TPJZKG3G5P4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0404.namprd03.prod.outlook.com
 (2603:10b6:408:111::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e767a-f527-431a-4cb5-08de727730ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGdzVWRzZzFHbG9uOU5NQVlGOHE1Uk5OTlJrK2Zod3JpLy9IbXFCeE1kbUFH?=
 =?utf-8?B?ZUo0YjhNS3VsWTJLZXhFUUdyaU9oOEZ4MFFaUUJKTnRJYXAvYUk3aXVqN2JY?=
 =?utf-8?B?cTJiVFRkMExLUlUyRGticTRCbWZaZkZsaVdvNitoTWwwcE5LQ3QvR0ltdmhr?=
 =?utf-8?B?MkYyQis1TGYwUUVhOU9oOEhIajFZWE5RZ2wzZmo2Smh5MUkzT2lrdWVkeVJk?=
 =?utf-8?B?R2UvL0lWRW1oZUNiVXF5aWpEeXM2bjVZTExSOGVyQ0l3NnhqWlFoSFhtU2Ur?=
 =?utf-8?B?ZVJ3bFhmME1NR2VrdnlvT0Y3VnV4NU42WVFNRDhJQ0JYak40M0dTMkU5eVZK?=
 =?utf-8?B?dE1xOGJaRFdRRGFSVWtpTmFTOUx1amlmeDFXNjVCT1J3YWJHNnNkVW1SRVFh?=
 =?utf-8?B?S1RCVFdJRmlDeFg2VWZIZU5QVWs2Wk9KT2tVTitaSnhxVDhOSDZxd3Z5SXpz?=
 =?utf-8?B?ald0NXRFNmpiWWFER1FRa2owTHRrNzArM3laNUxZd0FBeGFaRHkweWsxVThu?=
 =?utf-8?B?RXlHMDVPYkpQdzdoU05FMzdnK3RBZEM2SVdOeWRDVEdoYUZmM0cxSVN6QTNP?=
 =?utf-8?B?dVFDbE1ULzZsT2Y3M1lOWkUwR0RVNWZKaHFVWHJNSmdEL0haNEpwVlZSTnFU?=
 =?utf-8?B?UzRiRlZMWU1yM3ZpbjVZYWNQM3F5S1RpZHZVdElrSnJ5UVhJRGtMaHo5aUZl?=
 =?utf-8?B?R0FwVmxQc2lYSW1IQ1AzSTVxWGdiVU0xNG8wWjJlSkllT2h3b203eXhxdVFw?=
 =?utf-8?B?ZEJzdGp5RnpmMVNZZkFnVDBPNnh6NEZuYjZCWGwwcUFJWFM2YWN3U1RMMW9a?=
 =?utf-8?B?RGd3WHlTKzR3NFdkak1xaldzblIwdXhsK3BSWnhWandTVUx1M2cwMVJmM1Va?=
 =?utf-8?B?R3dQSnc3aVprcFBMc1BqUVRSeWo4cHFBQzNQc1BpNHBzdm9KcjVHanc1d3lI?=
 =?utf-8?B?VDduQW15Wm01T1dRRXBHTm5WejdYVGlvM2E5ZjJWVVNGbnRNZHArYVd6MC9J?=
 =?utf-8?B?SEpRdVVDMHlReWN1bXF4enpGWndUeDQ4QlkyRkNUWStzVTIyUEtyaklpRmJn?=
 =?utf-8?B?aG93ZkVPRVdFa2NDUmZMb1ZzUXZ4ZWxUaC9RdkJ4ekN4Q2RDR296M0VtcDg4?=
 =?utf-8?B?YmpHY2hwN1ZsUmVtYlNhRXVLRXRDOFJTakRBTk04M2FqakhWUVhDQ3Q1UnN1?=
 =?utf-8?B?cjJ2Q3l2V3IycHdIWk82YjhMeEVrZmFGMzV3d3BXTDRsaEp6eWNyOEFKenpY?=
 =?utf-8?B?WGkvQWhYV3Z1RklpVzJUUno2QWNPSUFpYUxVK0xnTDkxTFZseGQ4Q29qcEJv?=
 =?utf-8?B?elZCcHM4NTFDZDQxVHprK0grVXFEMEY5c1lGUytvR1U1M3BIdjVXZ3pUMGVV?=
 =?utf-8?B?V3IrZjc4a0hVUEtpM3ZIbm1NSzIxSElmSm5BZkt6Znp4aWpwZlpHMDFuNFlu?=
 =?utf-8?B?L3VWODY0YVRBTXB0TVFLemVUVGZvWC9ZMDVKNVYvRmhXaG1teHNYTit4R1lR?=
 =?utf-8?B?UnQvQ1NQOHpkRnA2djIwQUw4SStjNDJHN3U5YllEYmlvQW9uTGRYNHYwSmpN?=
 =?utf-8?B?OXJ2ZzltZEl3Wkh5d3JEeGVwL09uMVUzd1JZY0NTc2I2RFdFWUVRYkgxVmlD?=
 =?utf-8?B?VEpXR2lNSVhnOEtXUkM5Y0lHRDFMU1A5cnovVDVzOUY5Vi9KSTlzd2hBa1ow?=
 =?utf-8?B?TVgveG9UcDFGR3VkMnpjU3ZQRGhhQmhFK3dwOFhDaHQ2R1YyU2NjeU93M2dh?=
 =?utf-8?B?djVaK2N2TndPVytpMVRrSnlLTFBUcllMMVVGNGRLNEcycFMrK2JpQzhQdjM0?=
 =?utf-8?B?cXZhV0JOR1dFVHpZMEJBUE9LMGdhMmU5ZVNsM1A1SFdqZmlFZGYxMGpUSGRD?=
 =?utf-8?B?VmRUWmpDN3hqN3FrMEp0UFFydS9acXR6ak1wQkhKaXViUCtBV1hkT2swM3NO?=
 =?utf-8?B?SzhNcFpCZHJKeGNqODF3aGQyZEFqdmRLNEhXMUNTeTJ4TFJoNHNmLzJMc3Vx?=
 =?utf-8?B?MDZUQ0JremNycWJZd2Noem9YTFZYeXdiM0E5ZmRRZWM2M2Z2N1ZKQWV5ZXNW?=
 =?utf-8?B?bGRGaFR6WElLOVE4djR1cFNSV0dFcGMyWkJtaGx3Sjdabi9aenc0eWdYbTl6?=
 =?utf-8?Q?KuXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJyb1RVaUdJcmFSRjNEWkNEbVpjSE5STlFPaHlpMWJ4b0ZWMVJZMGx0Mzlm?=
 =?utf-8?B?WHF2Tm94TEx6NnJRVlV6NmJTTEFrVVF2ZkVLWldGSHVEcFZlQWt3UUhXeWJy?=
 =?utf-8?B?MmdEc2dxV3Vjb3FUZTkyeEcxaGt6WE8wOFRoUzdEQ1FHUmhNS3p1Mzh6WG9V?=
 =?utf-8?B?SmZCeUtrbHNLNlJEWHlJbHVDcVVxL3JhRm1FdThpWDF0bjBScFVHNFduQWVa?=
 =?utf-8?B?QlJtb1VGR3lFMzBSSHZLNVhyWEJPekNPNTR3Si9NSHBBNEE2VHRXSXFucmVm?=
 =?utf-8?B?NnVlaGdPcE02TDdqWFUrYmIzQVh5REhwOXlHeVFUOXBwSzIvT1VEdFRpZ1Nv?=
 =?utf-8?B?YUlnY2ZaK3N0Tmpra2tQV1dmblFqR1Q5ZkM1UnNsdUJBOUlmclFaSCt6cGVH?=
 =?utf-8?B?MmE3Z1hpRTdhRTFKWTdRWjQwb1hHNTQrT3R2RE92Y0hkVW4wdWxVZVBaVVAx?=
 =?utf-8?B?TVVjNW1CeXRKR3BkNXUzYVlUQlE0ZGZYTzJ0dFJzbFJnby9oanJKNGdCSVFK?=
 =?utf-8?B?SXJHU0xOSHlmYmt3TEJJMjh6QytUY1pnOVNvQzEvZXZQR0tYQUJoR1dkUkNi?=
 =?utf-8?B?eEorUVlIUUZ5ZnBBcUowUVl5WVRFRGFaN2pLOW85UzlqM2F4ZjdYVi8xMjFZ?=
 =?utf-8?B?WEhVTGFWblI2NXR5VDR1cVVBODZ0b3E5ODFKeFFIRFhmM1FXeEVFcEpMTk8w?=
 =?utf-8?B?MGQ0cldwbkpoTkZra1h2UjJPL1NGK2o0Nk1JbE9LQ3Nlb3VORjA2VlZKTFNO?=
 =?utf-8?B?UStmU0tJWDJtQlJLSU9Nckc5RkN0cHRscllTcFcvcitmRVVxTDdPZDRVL0kr?=
 =?utf-8?B?dnNjVUpHZ0JUczBhK0xhcy9ocFAxclJZQkxRcmYwamtHS3ZJbEozUmJyenUv?=
 =?utf-8?B?T1ViRFNxZ04zbWJvQ05DKzdCbENLNGpveTkrZEg0OWpES2dFc0lkRlF2TFF5?=
 =?utf-8?B?Q0k0T2xzZllWL2h4WUh5YkpOYjVBMTZuczJhRVNBWWprRlhUOFE4YytyejF2?=
 =?utf-8?B?allGUFlXTmFlVFdVM0ZTZkhrR2t4R1g2Y3NBUzR5b21TeHlRUWxLTFFmcXhP?=
 =?utf-8?B?K2liWTBUZ2J5b3ZxM2RJcFo2VVQ2b2lYcDN1Qkh2RHlFYWIzRzVlY0RlM3cw?=
 =?utf-8?B?cVJYM2lwRk55Y1JHdk9YMDhLdlBZTWtvazF1aHM5bjZMNStHN0paMExDQ0V5?=
 =?utf-8?B?SHJjRHl6MVJrZG5yMFhPckVyWXpxR2ZrU09ZVVYzZlQ1bVYxNER4bXp4Slla?=
 =?utf-8?B?akhTSzNQZ1dQWWZYZGdDR0RpM3hsOXZTT3AydVh1UlUvU1NEQW9aR2J5Yi9U?=
 =?utf-8?B?a0xwK09ud1ZjMEsxcVRwRGdQRzZVaXo4YnMwNy9CWTRIZEdrRHRDT0xxV3NI?=
 =?utf-8?B?a3FoVGxORFBBRVYvcWxOVXdrNDk2UFRFdldnRFRMU29MQ0dtK0dpUHMzenhi?=
 =?utf-8?B?ei9ZSGJNK0FNT05XV2lXRHpNczVwbXhvQlk3c1JIVmZLZ21YcHZZTXFlSmZU?=
 =?utf-8?B?VllTZUQ0NnN5cVZhV3ptUHdETXlqYzRKaTVMa0h3bjBRcnNZMWhQT21IM1ps?=
 =?utf-8?B?TkNHeXdIZ2ZTNzIvbDYxUmFaR1ZRcFYrdmZQNEVhWW83azhoM1gvY2liOVVl?=
 =?utf-8?B?Z1BTT0cvd3FCejRnRXN0anQzMkF0Nk95MkVYdEw3VmY4VDBpSVk3SmtmREky?=
 =?utf-8?B?VTVWOG9takJXUTY1TGxzdHphbFhxb0Jvb2ZPTVZ4UTVJY1lPeWhZQzI0MXZM?=
 =?utf-8?B?OFFnWHZUUEVTT3poMnJmYWR4N3hkMm9lMlg4Mk5mRHlMbDl4SFBmbndoeDR3?=
 =?utf-8?B?T0RkdFEyYmYrWlMwUnNwK1NKYTQrK3kzZmFoQ09XRlZaZU1SWFpsSkp5V24w?=
 =?utf-8?B?eFZueUMwcXpYMUM3UTRxVFdUZkN5dDcwWmVTelFFR041eS8ybGs5ekd1d2Qr?=
 =?utf-8?B?WmR0Y1VSM2dUamdEa0tjeit1NHhRd3RhTlZIVk5UakZ6TUpoelRGZC9SaUM2?=
 =?utf-8?B?N3daT0dMSXY4WnJ2eG91aXU3UGpHakJjbnRHeGt1ck9uK2RpaG96MEg2TVBs?=
 =?utf-8?B?V1RVM3BEa1lLMkgvQ3ZsQmMvekdpZVJiUVdrMXFpaXRXc0tuUXU4U3NtNzEy?=
 =?utf-8?B?b2FyTmo4Qk5jNU00aWNab2wyMjcyWFo5VDNzSFNOV3d6bWRNYmZDV2ZqaFEx?=
 =?utf-8?B?SlRmQWlHclBVdS9zMzF5K25Cc3VubjBaVmh4dCszV2NyemJudHhkZitzbGlK?=
 =?utf-8?B?TXpaNTQzUGtnYTVGencwQjJLaGtuakl0bFpHSXQ5SVJVb0EycVZ4Ymt3LytS?=
 =?utf-8?B?R2k1K2U3NEdCUWEwUlNYenhSYkVORm8yT1pmUjBJaTI2Y2MwNnljdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e767a-f527-431a-4cb5-08de727730ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 01:02:18.1966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhGeTo5+zy5sKLqLhdLaqgumzC3mQuB4KIw/3G4AyrB0+I6A7Dzvyz7TmKdkq3jX1s/4Ig0jWKePkHOnAO2k3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9BC071710BE
X-Rspamd-Action: no action



On 2/19/2026 8:56 PM, Alexandre Courbot wrote:
> On Fri Feb 20, 2026 at 12:31 AM JST, Joel Fernandes wrote:
>> On Thu, Feb 19, 2026 at 02:13:37PM +0900, Alexandre Courbot wrote:
>>>> +    types::Opaque,
>>>
>>> Need a `//` or `rustfmt` will reformat.
>>
>> Fixed, thanks.
>>
>>>> +// SAFETY: [`GpuBuddyInner`] can be sent between threads.
>>>
>>> No need to link on non-doccomments.
>>
>> Fixed. Removed the brackets from SAFETY comments for GpuBuddyInner
>> and GpuBuddyGuard.
>>
>>>> +/// - `buddy` references a valid [`GpuBuddyInner`].
>>>
>>> rustdoc complains that this links to a private item in a public doc - we
>>> should not mention `GpuBuddyInner` here.
>>
>> Per Miguel's reply, I've kept the mention but removed the square
>> brackets so it doesn't try to create a link. This way it's still
>> mentioned for practical reference without triggering the rustdoc
>> warning.
> 
> Won't it be confusing for readers of the public documentation? If a type
> is private, it shouldn't be needed to folks who read the HTML.
> 
> This sounds like we instead want a regular `//` comment somewhere to
> guide those who brave the code.

You are right about the audience of the docs perhaps not requiring this
information. I will remove it then.

thanks,

--
Joel Fernandes

