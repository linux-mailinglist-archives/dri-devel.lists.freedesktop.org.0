Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOWMFFVtfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D927CB86F6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3874C10E94D;
	Fri, 30 Jan 2026 08:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lvHdDNCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9F810E94D;
 Fri, 30 Jan 2026 08:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHxGSglXNLX6wGUuoa4l/w082whv8h7WY807E2Y6pviENIJRACzgduO+zSq48djL9Kpa7hp/LFBMcE+abBfS59DwmD31yz3ua28bXLaQP8sUb7uzI0I9WcLSbFxT2fvOjdcqSpwS6jylin3r+qnN6VlT52qmWNiMKZFWiGY4wcQynBsO+eAlew3YRRJtbxD4cPQXqRfd1hUxEhBvm/i3V07OdTYCz+CA3Re7aBExM91EALXLryNzUERk9zsecSI88P+yRUJjuO6ezBbDOfD5kTP95HVp3YT+plBoHqu8/fEDyRwfktRCuhhYpmGGXVcvoinQIir6pUpBZL2DcHQ4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLYd5R2uu/5K5wpPQ95VoiD/6ZsMFIcXy4LSPgxs7/A=;
 b=itbztRP6uurxh7KmIO2fJy05p1b7p6djOnzD3eJ4MW5nHct+GqR34JqQoeXymOLjE5u5tuwoQ5X9ESR2cQLbRHS4+PLqTn6N0vl/qAwMiJ3vg6+SclKupbYg3YQGWPtz4JgMOZ+5z9r7zBiYzjBiM2+AkCVViz7xQhkc8eUnvtiUriDj9GHLqUNVLCa6rrJ2EIbC+l6mkx1zU1ldkcYj2t0C6q05TAdtZnx3JAjeNWv4q9UqXayiRBLekN9G4U82HXpXTLxcqfvpqg6gjx1P6uONfbH9DoNyHfkh3rE8Y1yDQzFoiRu3zFHOsnvPCMBGCXnrYyNg7lXD/S0fEYs7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLYd5R2uu/5K5wpPQ95VoiD/6ZsMFIcXy4LSPgxs7/A=;
 b=lvHdDNCMU/6hanNXI0/nlrtRegjOzsyex8209LvB4BCEP1OX9pruEWXRWzCZIw30/Atu6Ih358QMGqpuJa+pngO0Z92EU8YfWBEdUzR55CJ/bz1FccmIohDVX2GVq4sQkFwIRljGXFo/ec6oGdhETwK2T8srjJq3KBehN5N4zMgPipCUp2/00aGKAK1og9ZFcYEmqOrdo84ej7Fl56RtR9zIvGuxHA7mz3jq7dNWPyXkI1OEB7ztW4px8gPLKRLf+aB2QuJMAn6eGv6VGIL3UArj/yvdgrbv8SSyjSvfptDo2A0CsQdjcd9kth3wZ5lFUUMs7lSVedJ5AWynWa5HaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:25 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:25 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Date: Fri, 30 Jan 2026 17:34:03 +0900
Message-Id: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche7ZJW4waXsVwKO0oe6DothIM4
 d3dyPGbZP6NCoRRqGs2EixceM4Kd2oojiE/YTipyVt/sc7fTJxHCHI1QSR8jW29w3D1bTpH0tN
 L8OD1H7z3hwXvj3brMdIQCrQyTVy7JgkvEKXAZKyV+n3/AUxem9GUAAAA
X-Change-ID: 20260128-coherent-array-0321eb723d4c
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BL1PR13CA0384.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::29) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f50b2d3-503f-411e-d0a8-08de5fda8384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0cyN2xYaFBwcEp0YkpmWnRHMlNOc1QvL3ZySHc0TmozZ2U1RnNmTndrQ0Jq?=
 =?utf-8?B?YWMzSjUxd1A0WnFBdVNNb3YzWXZjQW14WUUwVlBHWW1mRCs1dFJtTjk5TFNh?=
 =?utf-8?B?dkNHRnMzUm42NmhkNHFsWW9vT3RVMUMvWkZ0WkkrbzdSSUphYXEvS295U2Zo?=
 =?utf-8?B?Rm5yb0IvczBuQ3EvQXVXRmlLMVNPakd2YzM4aDhHQkUwVFJDdmpDOERDczJo?=
 =?utf-8?B?QlptSzdjYlFCSGw5YkhhZWZGTHkrV1kwM1FIUGVVeDI3TThVSWxJSHhBai9B?=
 =?utf-8?B?UUlnU3Y1ZWNRaVF2TFhqZEk2ckx3aEFSSW05VElNVXFsbEhyalNDREFwNkVp?=
 =?utf-8?B?YzFnL1d3czh2TUtvQkNyQmtZSlhRbTlpUWQ4WmpHTjBRQ0pqZHBSQ1FhbHRZ?=
 =?utf-8?B?ejEzdEd1OU05K3pFWUNuU1pxdzNlSWo4Mm9ubnNnVEV3U1MvaHBxRTV2RlJv?=
 =?utf-8?B?blJ1TWVGUTdHUXc5aDN3dlJQUjVxNE5zRU5FTEhSZk1tUFZEa29weWI3d1Ra?=
 =?utf-8?B?cGl4RDRVVW51K2szdlNhSFpPblh5aGI0YTR6YjNNeVJxa2JWT0VpbnY3SVFy?=
 =?utf-8?B?QlVOTEUxRVZFY0dzY0VtSjJlLy9lQjZITWxzS2NWSjd1d2Z4V05DRklyRlhZ?=
 =?utf-8?B?TG1CY0Nab095WExBclpqSUR1NXhVTjFXRHBWS1FFbnJGRzNpVWk5QjY5bmQz?=
 =?utf-8?B?Ny9SNksrRVZpb1FRTTVSZW1xNzg3dGxlSTE3Vk96UFAxcU1MYlIrbm9wOW5q?=
 =?utf-8?B?OXNqUGxNUE5PT1BrMnJEOW01OE03d1g4aUR1RWhUTXRQbWF4Ly96alZ4ekNj?=
 =?utf-8?B?cSswVmFyY29hWTRaYUtoT2JOeU15NHIxZEdTM001eTR6aENzWVRkQU11N2k4?=
 =?utf-8?B?WmkyM3I3cmxkRk1ubVhvY3hzNWVIcWxwSDlvWXl5Y0MyUVpyZmFqRkpCakdW?=
 =?utf-8?B?ZzdsTFFIQzNvMkt0bmlUMWFoNkpVN09SQi9qNUpRSTJDc201NEhLeEI0VHhJ?=
 =?utf-8?B?TFl0L2U0MmppeEUram8vMTZCYU5rKzc3eENIeGF4UlFRdEYydVlVeDRSWHp2?=
 =?utf-8?B?YlVWaDlrdUo0TEUyOVJHMVlmRHJ4aDYvUTNyK1BBY3pvZ2h6bWFlQ0NZQktz?=
 =?utf-8?B?a1ZQWWd6WUZ5V2UwT05WTklNRmJXYmFnSDUydVpOOVpFbkdTL2t5RFRGMURI?=
 =?utf-8?B?ZGdaQk5PaklaaVJMVEhnUm5uTXA3VWRwSXFiOS9qVlNhUW9DZGVBVUsya2o0?=
 =?utf-8?B?dTZCYm5HaS9XcU1XVW9RVDkydlgyWWlPNjhJWWJRYzZtcG5Qam5UQ2JKcmNu?=
 =?utf-8?B?ODdQU1FCT0lSWVJBNFJXQ1Q0Qm56MWNBZ2h4RlZiK1NOZG15M0Y0QlYzdElB?=
 =?utf-8?B?SWdsUWR2SEUwbmNJR24yYnlMZDZKejZ2WEpkQ2t1WGRzcmNkdTg4R2R4UVpO?=
 =?utf-8?B?ZE15cXpJako4aXZIUlc1RlhDQ1JJdmkyUnBSaE1SOGFQaUx3NjZuM3BXeExY?=
 =?utf-8?B?OE05eHpNZzRQNUFlOW1ROTVLM0o2UVdjU2luczYyOEtscTlObmpSaTgrcU1u?=
 =?utf-8?B?bmI4eFdCRGJJcDRCajJHeW9XWkZjRE4yZ1B6dEZXbGtwS2VZdlE3bEpuaVpL?=
 =?utf-8?B?NjZqNGtWbnlHRkNtN21OYWE3eXhheXpYdGVQbkdOVkZuWm5PeTh0N2d3YzBG?=
 =?utf-8?B?d2NPaUhqTmxPRUp5T3pOTzFxelorYXR3V0NpWHBmWmVubUhjL3VEMitHSDVO?=
 =?utf-8?B?NndPMUc4T1JucXVmbkVNSVBzV25QQjM4TVRNc1J0M0NBbHBTc3orRlVXVCtW?=
 =?utf-8?B?UmhnUC9GR0xhRTlCV0xpaUQzZ2pVVnNha0xkbURSK2o4c0dRVXcvRDE0OGZO?=
 =?utf-8?B?UDJtaUhXMitNSUNIK0JlSXFHeHdQK0gwUnZkZko5bUYrMDMrVGsvbnZsekt6?=
 =?utf-8?B?OC94SnBmUFNPZVo4NXdzbER3UFI2eWN6TkFrdnBtZ3l0Mzc3eHhEaFZFRG5W?=
 =?utf-8?B?RU8rdWpmZVNPSjFpUzVhQ1h2WnBSbiszWmh1L29DaU5vS29Da25BdFgxVVFY?=
 =?utf-8?B?UmRxcU1ycVF0a2EwRGRwTU0rdjZFaU1lellzNlg2ZjZob0t3TTAranptKzRL?=
 =?utf-8?B?ZTFLNVFnOGF0Ym9xN1RCZ0FkT21BTnZPQkRVYjBZdnp3bkY2ZVlGdXpZK2dC?=
 =?utf-8?B?SGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFldVdBbFJvRC9nUVZRNkV3cXByTDJ3T3NwSVdrLzZQMEgzZ0tEOW9JMHVi?=
 =?utf-8?B?d2lSVWpvZDJnODI4YzNyMUVRYVJlM1laYkZ1cDNWSGRJWkxMMWgyb2R6dUNv?=
 =?utf-8?B?dTJFczM2YlZsMndQRnBYY2h5K1Y1Z3pUdnhNMlg0ZVpYNUhSdmpDSW0yNE04?=
 =?utf-8?B?OGpiWUpVSjdMR3Fnc2xYN1pMNmM0UXJrWVpYQ0hwbWNKYUt5SGFnMnlJWW1h?=
 =?utf-8?B?aGdkMENBd0xQd3prVTRBaGZhdVYxYzYxU1Ztc3JHOGtyQUYzVGRnd20wcjVk?=
 =?utf-8?B?Nmk5L3dVR1NObDgrZGxRZlNaeUYrUG1pSENLU0hIQjJ4NEdKOFprLzE2ZjRN?=
 =?utf-8?B?WDhoWm8yZUdHajhTYVplQW1CK2hPZ0lFNkVCNDB3TWtEUjFiQytjNTl4MVBB?=
 =?utf-8?B?enJKcXZxTjJYY0VRVjRFK1Y1eEJWTlZUQlBSWW41N0JwWGlRM0FuQTFCcjhk?=
 =?utf-8?B?ZGFoY2srWXRaNndVQjgrR0tOaUErd3BOamc3bjdJMFRObjVyY3pxSUJibXFp?=
 =?utf-8?B?QmR6YmVTTU12ekZ0WUQ3TXVadTRSN1FNWlBkeDM0RmkzWllqaFVRZTM3UXJC?=
 =?utf-8?B?STlHbi9INUtSMDg0WkJGakttMC9BaEFnSlU5Z2JGRGw0SFl3MWE5QTJ3K0FS?=
 =?utf-8?B?a2dvL2VPQUp5NVFKQzlORytab1VoYjJCVnkraTlhVlU4ak5WMUJlVWY3RXNl?=
 =?utf-8?B?S21NNHpGcW5NNFhYWlBoQkNVbWEyMDU0Um1mWkNUVXZhWW5yeXV6TjNqZ29X?=
 =?utf-8?B?M1F5NXIyRFk2Mno2aUhGZFk4cEpXdUtUeWhQYmZDVGx3QkZjTmJhSGlyZHpy?=
 =?utf-8?B?QzBCeDZHL0VUdEIwdFNwYllBNmgrdzlBSitOeFpYMkwwcUFRdmNsM081N2hs?=
 =?utf-8?B?OHJ6UExQQmsrRWRYRzgyRjd1ak5rK1NtNDVsQms4LytXWjVUTWtRaHhrQU1p?=
 =?utf-8?B?VHdCNFRpejFVUXlXUXBSQW5DMTZ6TysrMVVOdWlKN0JOaFI5Q0t0R3VOS1N1?=
 =?utf-8?B?cFpKelNWYnN4SjdBS1JIbi9GeWRzdUpCMHY1ZEZqc3B4eWpnbS9JbFM1U1Rj?=
 =?utf-8?B?clVSSUdFRHZ6L1RrTzN4dzFKbXhYYjAyaUwzOGxUelY2V1N4am5kc2V6MUUy?=
 =?utf-8?B?QkVVRHhDcHRlY1RhN0hWaFlic2tsYURFbXdWUGIrcDU1d0V0VnZsZktnRGF3?=
 =?utf-8?B?bTQreEJ3cHJLYWRmd0l3K3RCSEU4SDdrRWZMOXhCQzBOaDc4OFZCZWJ2bmZr?=
 =?utf-8?B?YVhsckFJeXJrenlRNTRLNXpoa0RBMHBWUnlNcFRGYy9veklNZXRSaDVRSW1U?=
 =?utf-8?B?bjZqa1ZSQnpvczBsNkhkOFllNXhUQlZOL0V5UmJtOGQvMkxqS3Z5Qk9aQjV0?=
 =?utf-8?B?dVZyalJSNmJ3Vng4RzF5clJGVDZ4bm8yNnJkbWRlY3d4ai95MXVHQ1RGWWhN?=
 =?utf-8?B?ejJxNm5PL0xiZFc2Z2dKZXNtK2ZTOTZ1V3d6bE5PbmxHRnJlVWNZU092RzVN?=
 =?utf-8?B?YStIYi9PUWlyaWxrZkt0L0lkV2s5akE4K3pDaWwyaGN2c0JNTEF3am1ZRzVt?=
 =?utf-8?B?YjliOUxiOThDK0dwMWlWSERjS0pzU3NuMTBUczRFbXBLMEEwTmZ6OEtlOGow?=
 =?utf-8?B?YUFBR3RIYi9UV0pNd0YreHlmYUJzM05JSC94QStIMjh5TVhVeVFoS1ZlVnQw?=
 =?utf-8?B?SG94bTJIcU02SHh4U241d1R2KzRidHBFWFhSWm9LaE4zNXpYcUIvalJ2bnZM?=
 =?utf-8?B?VzE4NGw5anBGZEdVbzNpM1FLMld5OEtUM0NPMTA2Wm93RmFwM0Z6VFNNUjVh?=
 =?utf-8?B?ZUM0YVhLektrVUc2dXowWjBWZmRuUGNuNVRPRk4wNFJYdWlyKythQ0NvRjgw?=
 =?utf-8?B?QWd3cldzT1AyblE0QUFIMUR4U1JhdnRyUkpsZXZnYXJxb1dldWlGdW5YQVcx?=
 =?utf-8?B?L1Fyb200dVpRd0pEcU5IbWl5eVN0R011VE5hWUx3Z2czb2h3RkNzMTJGZW8w?=
 =?utf-8?B?L2Nzem93UGp6UVhlQnVUdXZtdVYxSG4rTWFtNnljUWRXZEVmcDBJMVUwK0Yr?=
 =?utf-8?B?cUN0ajRnY1dZWkJaWDBQdG5IanRJQ2VFY2NObGZQZEp5TEpLSmkzZXpGWk9k?=
 =?utf-8?B?dkkrTWoveUg0QjRKWUlyd1pLOVVmUngrZnBNVGRDd2JxeDAyN3YyaWNiRDM0?=
 =?utf-8?B?SUc4SkhITlpaeTJKNFhaYjRCQzduVFlhTGRvUWV3Q2IxQ2RPaVhZK2VpK3Jl?=
 =?utf-8?B?NG15SFVNNWMvaG41cTBJQnNIUXMwQ01OUmszdzhSc2wwMW5VNWJ1MXRkY0ZB?=
 =?utf-8?B?bTkyMGVkRmlSZVV3MnBoVGx1UmhjOWVadHpkd3JCWGVLNXdIRUw1VThhUXhD?=
 =?utf-8?Q?2RdoHIqUrrRzHdsxV8CdYvJbY27N7Zt3C80kbOcJnpb9a?=
X-MS-Exchange-AntiSpam-MessageData-1: xhIvjmXzVAwCHg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f50b2d3-503f-411e-d0a8-08de5fda8384
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:24.9488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42HzjtJeEt8hzK//2nyrYYWPFGWDrEbrWG+Kfp2Rk2EmyX3v7oP6OT7ev8shL8pvVdqsVJfUXKtlFW3XNSbc/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D927CB86F6
X-Rspamd-Action: no action

This series extends the DMA coherent allocation API to support compile-time
known sizes. This lets bounds checking to be moved from runtime to build
time, which is useful to avoid runtime panics from index typos. It also
removes the need for a Result return type in some places.

The compile time size is specified via a marker type: StaticSize<N>.
Statically sized allocations can decay to runtime sized ones via deref
coercion for code that doesn't need to know the size at compile time, or to
avoid having to carry around extra type parameters. The implementation
follows a similar pattern to Device/DeviceContext.

The series defines three type aliases: CoherentSlice<T> (for runtime size),
CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (for
single object allocations). It also adds infallible dma_read!/dma_write!
macros and methods to CoherentArray, while prefixing the existing fallible
methods and macros with `try_`.

The macros keep the same syntax (i.e.
coherent_allocation[index].optional_fields = expression) even for
CoherentObject, because the [] syntax is needed to know where to split the
actual CoherentAllocation object from the fields. This means that
CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
alternative is defining a separate macro for single object access, but it
still would need a way to delineate between the allocation and the fields,
perhaps by using commas (dma_read_obj!(object, fields),
dma_write_obj!(object, fields, value)). This would be inconsistent with the
array/slice syntax.

The last patch in the series may be useful as an example of what this
looks like to use. Also, there is probably a better name than
CoherentSlice. I found that specifying a default of RuntimeSize on
CoherentAllocation stopped the compiler from being able to resolve
which alloc_attrs to call in usages like e.g.
CoherentAllocation<u8>::alloc_attrs. Also, we probably want to encourage
people to use the statically sized one if possible, so it may be nice to
avoid defaulting CoherentAllocation to RuntimeSize.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (9):
      rust: dma: rename CoherentAllocation fallible methods
      rust: dma: parameterize CoherentAllocation with AllocationSize
      rust: dma: add CoherentArray for compile-time sized allocations
      rust: dma: simplify try_dma_read! and try_dma_write!
      rust: dma: rename try_item_from_index to try_ptr_at
      rust: dma: add dma_read! and dma_write! macros
      rust: dma: implement decay from CoherentArray to CoherentSlice
      rust: dma: add CoherentObject for single element allocations
      gpu: nova-core: migrate to CoherentArray and CoherentObject

 drivers/gpu/nova-core/dma.rs            |  10 +-
 drivers/gpu/nova-core/falcon.rs         |   2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs |   4 +-
 drivers/gpu/nova-core/gsp.rs            |  44 +--
 drivers/gpu/nova-core/gsp/boot.rs       |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs       |  20 +-
 drivers/gpu/nova-core/gsp/fw.rs         |  12 +-
 rust/kernel/dma.rs                      | 555 +++++++++++++++++++++++++-------
 samples/rust/rust_dma.rs                |  14 +-
 9 files changed, 489 insertions(+), 178 deletions(-)
---
base-commit: c71257394bc9c59ea727803f6e55e83fe63db74e
change-id: 20260128-coherent-array-0321eb723d4c

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

