Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNj1C2Asl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:29:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825BC16027C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CAB10E6F4;
	Thu, 19 Feb 2026 15:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="avB+3uCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807210E6F4;
 Thu, 19 Feb 2026 15:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0fK1v3NdwQkoeTyjsgduEwAyROuWrhuBsZXypgXyPo/OmPGyHSNETFIQvWrqCFoFiiwshx6s9B7SMogIdJHBP/1kgii9BLdvJ43H2TBpokuVDrmjKYjRgqWQc4Sq3T7U9R3Db92HObU5OH11xcO+yfWwsxKM2QsKkGdrHFDtTQhSCcXTdRlgSPAeE8FMCWY8+QjDk7yAhYW079sICLKhPQSXDEQvMCFQsz2fg6cm0iLeMmHoQbTRWYR7mdFbJK+Zuwo/Erv0xfv9KNsXMIXJvVJ5d2E3Bl+DONXs2svXIc4qX2BtZ6reTO4etreplzIcGLXthkemOEk04LAKAxFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z05nc61zK1JhVl9xaJU2kH6xurxNvQbk6YODFg6rhrc=;
 b=ebP5je5tlOomjDr4UHJx9dRfZH6Ki6KxPfRaj9kw2I5IC3i93YwScOC8kbSRfD5pQs5TIK7YuoSBX7ggfxMQ8XHlyhHsIy85yVdbdWbDHfB2oRCovww+U2qsIIMIaarkpZGy9ppvsUODRe4M4DfZdVbqSDWCfiVyyPpaWIdrmolSGZZoMOB/Weofy0AttEFkWUCCgQdwn7XwV49A4Tmkt6wLk231EjzGw5tXzbOMYrspPLzyv3UTfu4f5MwW5+Vwc42ONIFZdqbmrRtSbPIKLwKkTU2zIFbLoE6DUtRwwpnREYGHcFlY52xrSd9m2NYB0vOUoYYZbgA/XwAdypKArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z05nc61zK1JhVl9xaJU2kH6xurxNvQbk6YODFg6rhrc=;
 b=avB+3uCTA5KAm2/KH+tu3HpzQ+8N5dMKSTXofox3DL7FcoHnssH++uDkH3tAl0Q9HqCnlsoZbKzMTX2b+ApIM9HkromzSjr5L0tDQ3YwNWbMUOBTOqn4NPqVcNtLQDU6QoiR9jGl+BulKjW69kG3n4yxDJVu5+WHksUzdJPQqjMVDvUOz5p2W+93IhwkmgnFM85MhX1bhdqVraJcvstOsDSImGbducYZUqcysjLtsLAesDqkIkPKVt3xd8ULZDpOgkB8ZJcE2OdqYBsAU5TQmE8r5sOWtmzd2JbvwWTxbfwtBbJwnW34xN7G9sDbtvtyQ09Et5gJju+BacCZVAXJsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 15:29:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:29:23 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with C
 linked lists
In-Reply-To: <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
References: <20260211-v9-nova-mm-v9-0-a8e261c2e734@nvidia.com>
 <20260211-v9-nova-mm-v9-1-a8e261c2e734@nvidia.com>
 <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
Message-ID: <ebd17ac8ab6d1e1ad6a8eb8defa49915@nvidia.com>
Date: Thu, 19 Feb 2026 10:29:21 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::28) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8e529b-696a-478e-0c04-08de6fcba89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2VMODRUclVTRXJ3K0g2RFZuMXRDdmt3OGxVNXdYZUxCam9weTFkNXZsdG51?=
 =?utf-8?B?STlDZzNMMllVUXY5c0cxS01ZclBTN05heFdhRW5lOGxXenArd3dNd3pLNU52?=
 =?utf-8?B?eDFuNGpYUXRGa2ZBck5zaGR5QVZHalZaNlZGOVNaMXJkdU5sVUxvV3Zuc21n?=
 =?utf-8?B?TnJTUVRWQ3VjTU8zK3NoVnQrMXNoeGMwQXZLeERmYmltYjVuRHVwVUJhUWtm?=
 =?utf-8?B?T3dkTzkrL1RVY2VWa2tYZHlIbFgxS1pQZHJTQzJsMFgrUXFtNWRidEp1UnYw?=
 =?utf-8?B?NGE2cDFwZXN3ZG4reDBmNXo3bjVyMHFwdkpiNG10RXNqVVdvbEp3WVNpeG9O?=
 =?utf-8?B?dWQ5eHhsL3NpUS91dW5zakQreXRMN0J4TU1DTythSGpiVmREakNTeVJvZS8r?=
 =?utf-8?B?d3M4cUNLM1pveVhKQVZtejJ4cTVQK0VnWlRNY2dDUE5lWGVTNC9YMXBKY1Vu?=
 =?utf-8?B?bUJzbU1mYm9mWCtjdjFDRC9nSzRYVFRrZTV3ZDZpU2cvbzNOYU01Tk1YOTcz?=
 =?utf-8?B?MzVicUlaTUUvZXJSK3FOLzFUNlR1d2Y4T1lLZ2xKQ2UwZG95QUhLL1BaYk1s?=
 =?utf-8?B?Nk9Sdk42cW5ObGlBcVlWNHRrS25QeExQeXhNOXhaNEEwZngyMVplN0FDakNu?=
 =?utf-8?B?cE1IVXVRZWpnUVZLcjc4NUtRSjV3bnpOZFZPS2dyUGY0VVIrZXd0YWMrbmND?=
 =?utf-8?B?ckg3VlZHVHd1dDc1ZkhaaTV0bEJKWXM2ZkY4aUI0OXI5N2M3VXRHL2RjUGsr?=
 =?utf-8?B?dzF4c1RxRzdUTEFJNjZLMHJCVU1sWTBqcDEvSHFvVDN2SkhPVURETjd2NDZU?=
 =?utf-8?B?QXdiejR3NEtMWlUvNitvdnp1VmM3NHBZWGpLdG4wc1FFWmN3Ui9IcXp5WEQ2?=
 =?utf-8?B?K0tGWXlKSHlXWG5sZ2c4ZSs4aWtJRzR1T0lILzBkVE1NSjgxd0NkdTFXVTk0?=
 =?utf-8?B?TmxUV2w3YmVHbDljNWFva0phTTUvN0xxMXQvdnBJRXdyQjRoay9aTzNBWXk2?=
 =?utf-8?B?Y3pVRndRb1hWWTY5N0E3bmdqM1phZEcxZGNSU1BLVlNVWjRlZjd2c0VScDVB?=
 =?utf-8?B?cmVwUk5YaFFjS0Q5c3h1UDJxNzJUMllUQU5kM1gwQ203UmlXaENtL29vdjc3?=
 =?utf-8?B?UG45RUFoWGJoYW9EcERudy9kK28zdmRhSFF0K0tjTHUvV05zR3ZOVlNXTFNa?=
 =?utf-8?B?UUdSK0RGSzFjdFRqWUR4ZnZoK2pvNFVGSExyYUlodjVFSFdLZ1phT1VCc3hT?=
 =?utf-8?B?dUo0NlZyVTl3RjU4REprRldLbFlPMUpJaDBxem5BNmVBRUkwS2MwNGhYL1cz?=
 =?utf-8?B?OXd4czVLQ1pMV3hBQ3llL1hJSm1pL0pNeXFKWjZWR1Job1hrbEVxV1gybDF2?=
 =?utf-8?B?UXBpWDNSMHpjMkhsYVE0eFk2cHNOdlp2TUxlNEV0cVl4ZXYyU0RiVExURVRw?=
 =?utf-8?B?K3J1U0IwTXRNeWJrdERKMWZvOVlTTDFodjJMQzRkNnlQdzNockI5bkNJU2Q0?=
 =?utf-8?B?YTExeXp5OWl3cVVncGtSem1aVTRmRWRIRVhOcXgvZzdwc1Q2THJ0WmJ3dVc0?=
 =?utf-8?B?T3plejhJYTFaMzZVV3F2YXFtUWI4dnNUUE50RGZhT2tIQm9JWG53RFRRZFlR?=
 =?utf-8?B?bFVXZ3hkNWZxcUp4b0oxMXI1QmRhNHB6VXdZWnV1VEM4OFRrV1hYajRJK2cy?=
 =?utf-8?B?M3pac0FwM0xuT3hQbFA5K2d4aE9WaXVLaDh1djJjRmpiRWxlVlJ2cG5Dc1Fi?=
 =?utf-8?B?bG5nTWJWQTlOdTlGOTNzRW5SY3M3MitlWkVYRG9jUFJDdlA2Q0NWKytKSGNt?=
 =?utf-8?B?Q1JGdmd4cDI5UE1GUll3eVI2ckVDNkdzVDdISm82dy8wNG5nU1owby82V0N3?=
 =?utf-8?B?aVpkRnVRMk8ybi90TW5sNDdiTVhzWG13emZKSE9ISzBVVWFhamtocHh2T1Zp?=
 =?utf-8?B?VnFWQjJzL09TRDRPbDRreitDcm01NXV4YXJHaHJoZEhTNmlTRW1vWWgzVDBV?=
 =?utf-8?B?ZEtCeWRNdUllMmtWMzhoa2JiUVAwbHNCK0V0c1E4MG5vQ2RRNTlaUERpT2xV?=
 =?utf-8?B?VWdlSlpiRUFFd2xCTnNjTEVMQUp3blRUTG5nenhESEM5a3orWHR5YTN0SHNV?=
 =?utf-8?Q?dMpM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxqYWEwYzZib0xVVFR3cm1mQ3ROdUYzMlFkU2pHZUVTWGV5RzAzLzQ4OWYz?=
 =?utf-8?B?bmJxQm02endjSGlvZ0p3YXNEOG1tcE1uUERQVU9raFJGbEQ5S25hMTVyQzdR?=
 =?utf-8?B?NlAyS09CNWVEblpOVG5vL3p6M0x0V0cxM2VuR0Qwd242Yi9qSkx6ZE11K1dU?=
 =?utf-8?B?RlVzTnNXSmVhVVoxOU5mYTdoN3dMdWJkOUJMUllESG5yaU5QenAycS81bmFY?=
 =?utf-8?B?WkhzeEg4ampkRGd4U2k3cE5BNndXZG1qQ2grQTBUV3lYS1BQM2RGb2RaenFt?=
 =?utf-8?B?WDVjMittYkNoU2VWaGhWZmd4c2Y1dkd6Y1ZWWFlwRkVwdmd1YW1uTkxVRE5v?=
 =?utf-8?B?YWV1Nys5a0I4NVUzMkloUmpsL3MwejJRaHZLMUUzWndIdXlqcDdMYmhhNzh4?=
 =?utf-8?B?U0tWV3d4SVNicWo1Wm5uSlJOSTltVmZVSTZ6OHQwSUhDSmhpRGEwbmd6dEFP?=
 =?utf-8?B?eWF6NWpxc2pOaGxaT3FSTXRFZDMxSXdjK0xQbDdjRTJtSC9NNkJxNUt1MUVq?=
 =?utf-8?B?MjNBbHNjVnU0QUoxZE1jZCtOUWRTQ2lrTkRTN3QvVTNSbW4yOURaMHN3c1pK?=
 =?utf-8?B?VVJlYWY1L1RmVjFRanZhWTJOSVVueUxMTXhWdEhuUGQrMnNDRlNUeEluNExq?=
 =?utf-8?B?ZGZGZExvT1duRnQycHplSHZjZE9rT3gzL2xIcnFjUUIrMmpJS1dNckNpU0dD?=
 =?utf-8?B?M2pTdW0rSWNlZS9UREZTa0ViamlGemJ2SU1VTkJsQ3JzS0hUZkhjemdRTjZ6?=
 =?utf-8?B?aG9nUFBuKzFmWHQ2enFobFZHOTV3U1RRdjE2aW9YQkZEbWZuODc5YzhHSU53?=
 =?utf-8?B?eEVjL2RKQVE0MTZSUnArek1wcUtmTk1IWVQveUVVeHJyNWxEeTNjTlB1WXdD?=
 =?utf-8?B?Q2RSbGtiNXd0a2tPejV0U2JkY3ZjYmJzL21xaDJhM2EyNDM1RWEvSlEwamJN?=
 =?utf-8?B?YWdhei9KMVZOamd1emdQd1ZEekdCSlhUQVN0dDBnQkIxZFNIbEttWUhiY29h?=
 =?utf-8?B?c1hSdkl4ZFNuU3dlTkdqU2Z0dU1aUHBsVHA4SjMxZDE2aGtCa2h5WEx1L3Jz?=
 =?utf-8?B?RCtKUmU5dFVKQi9iOUpHeURkVWFBNDFDQ0ZuRGJxRm00aUY4ZFVJZXVKS01G?=
 =?utf-8?B?Y1BpdGYzLzRGSHRCUWpsN1BESmwyMkVRcUZ4RkY1R3M0bjdBTWl6dktCdUo4?=
 =?utf-8?B?K3hrVS9ic0E2TzYwN3hNVjMwT0lDZkIrZldtRVJhY2JkN1NUYWhyNmlUOGpw?=
 =?utf-8?B?VlYvaGd5ZSsvNmp1VDFVYXFWa3huR1Q5b0VNMlNZSG92enNxWnZnZTFKSHAv?=
 =?utf-8?B?dlRGWkRKeEE2ZjR2bysrc0p5dlBrYTQwMCtsVzdISDQvMlJ1aXVTVkkra05L?=
 =?utf-8?B?bURQNk9SWFBpcWpuTGRjNGx6VjQxWUlyM01VT2gvY2s5K3MzQUFYSkluU3VS?=
 =?utf-8?B?RTVINjVuM1dlaFZKY0JYb1lGUlBvanhaVXNURDluWjMrUkdNS0FZczR2blQv?=
 =?utf-8?B?RjNHdDRxeWJQanloaDNVU242RGNmWDZzVzFjVExlcHU5NTBqSS96d3JnUU11?=
 =?utf-8?B?N2YxeWMweFJjRVpVZWJHRHU0RGpWMFBQZ240cXoxcmdSYUtXZlNQZko4cUl3?=
 =?utf-8?B?eEpwR3JSdVRPS2NjUDBUMVNTcjN3bGdEa2wzNnRVNzYvL2Y2NXdYMm1SQ2g0?=
 =?utf-8?B?K1daSEVlVm96UG1qb2txejlFbG5jczJ4N0xpWEMrOGdDd2xTVlBpalV5QUpi?=
 =?utf-8?B?SWZNZTh2eXZVL2hJWXRwcjdBaTNRQkhJZ003M0NqUmV5bndaMTgrd1ZKK1dl?=
 =?utf-8?B?TGsycTg2V2Nlb1dSWk1XUjVLU0I5cGF5SGErMGxmU0FyZmYxWnJKVHlyOGJu?=
 =?utf-8?B?YXZNN3hiQU9pSUFlelhUd2xhZm4xYVEyZjFnMlMvQXhYYzN4QWZUT0VWbGdW?=
 =?utf-8?B?VWZJc3BBY3pzK002VXNES2xQY09hWk9nWVNZS1MyNWxkd29QSVA1eUZTeFVl?=
 =?utf-8?B?MjNUbzlQemZNMGdyOVFNam5lV1I5QXc0R09MZGlmMnJCRGE1ZnNVbUJVYWtG?=
 =?utf-8?B?TmI3S25JQ1VYUmtIVno1MmhVdDJRUFR5b1laS09HOUc4dFMzYldQdnUwZVYz?=
 =?utf-8?B?bWFMME82UjF0L2dFY2Z5TFdHaTl2SXJSblRkanl1aDNpL2hMODN4TU9yZStH?=
 =?utf-8?B?VFo4bDVIV3JXZEhHd2Iva253Y0xUQzBNSmJUejMxbGRLbkwvTy9vUDMzVEdZ?=
 =?utf-8?B?WWp3RUR6eWw1em50VXpMQVpsbmk5T0RLVXJuSFJHL013d0hTdHJXVGxNdHFK?=
 =?utf-8?B?SHM5S1lnWmtPOG5hdksvN29nS0toMUVPNm4vV252a1MxQ2s2RXFXZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8e529b-696a-478e-0c04-08de6fcba89c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:29:23.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OF9k9nRnQTuqZ04oTVQheL/iaCVkgvghyobOMsxU28mlcZnFypNUgb89jgjc0RWwK/4kcrSRbzdL//i4wZZZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[device.rs:url,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,sampleitemc.link:url]
X-Rspamd-Queue-Id: 825BC16027C
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 09:35:31AM +0900, Alexandre Courbot wrote:
> I saw that v10 has been sent, but since the code is mostly identical
> this review should still apply (I was in the middle of writing it before
> going to sleep).

Thanks for the thorough review, Alex! All comments addressed below.

> > + * Helpers for C Circular doubly linked list implementation.
>
> nit: "Circular" doesn't need a capital "C".

Fixed.

> > +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
> > +//! #     unsafe {
> > +//! #         (*ptr).value = i as i32 * 10;
> > +//! #         // &raw mut computes address of link directly as link is uninitialized.
> > +//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
> > +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
>
> Is the `INIT_LIST_HEAD` line needed? `list_add_tail` will immediately
> overwrite the initial values of `ptr.link`.

Good point - list_add_tail does overwrite the link fields. However I'm
keeping the INIT_LIST_HEAD call because the doctest is meant to show
the full pattern of working with list_head from Rust, including proper
initialization. Also, skipping it would mean calling list_add_tail on
an uninitialized list_head, which while it works in practice (since
list_add_tail overwrites both fields), feels wrong to demonstrate in
an example.

> > +//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
>
> `head` appears in the documentation for the first time here - it would
> help to make at least its declaration visible, or add a comment
> specifying its type.

The head declaration is in the hidden doctest setup code (marked with
`# `). Since it's setup code that would be done by C in practice,
keeping it hidden seems right. The SAFETY comment on the clist_create!
call now documents what head is.

> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
> > +        // SAFETY:
> > +        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
> > +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
> > +        unsafe { &*ptr.cast() }
> > +    }
>
> IIUC you can call `CListHead::from_raw` here instead of repeating its
> code.

CListHead::from_raw returns &CListHead, but we need &CList<T, OFFSET>.
Since CList is repr(transparent) over CListHead, the direct ptr.cast()
is the correct approach - we'd need an additional cast after
CListHead::from_raw anyway, which would be more code, not less.

> > +    fn next(&mut self) -> Option<Self::Item> {
>
> This method is the only one not marked `#[inline]`.

Added #[inline], thanks for catching that.

> > +impl<'a> FusedIterator for CListHeadIter<'a> {}
>
> I asked this a couple of times ([1], [2]) but got no reply, so let me
> try again. :) Given that `list_head` is doubly-linked, can we also
> implement `DoubleEndedIterator`?

Apologies for the missed replies! Yes, DoubleEndedIterator makes sense
for doubly-linked lists. I'll add it as a follow-up patch since it
requires a prev() method and some additional iterator state tracking.

> > +// SAFETY: [`CListHead`] can be sent to any thread.
> > +unsafe impl Send for CListHead {}
>
> That safety comment is circular. I guess you mean to say that
> `list_head` can be sent to any thread?

Fixed. Updated to: "list_head contains no thread-bound state; it only
holds next/prev pointers."

> Since Rust macros let us be more creative, how about something like
> this:
>
>     let list = unsafe { clist_create!(head => Item, SampleItemC.link) };

Interesting idea! For now I've kept the current comma-separated syntax
but with the device.rs unsafe pattern:

    clist_create!(unsafe { head, Item, SampleItemC, link })

This keeps consistency with other kernel macros. The unsafe { } block
is the key improvement from Danilo's review. We can explore syntax
sugar in a follow-up if desired.

Thanks,
Joel
