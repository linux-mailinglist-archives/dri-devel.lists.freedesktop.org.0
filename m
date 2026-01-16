Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA61D3170B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9E010E894;
	Fri, 16 Jan 2026 13:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="xGLZ4xvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022072.outbound.protection.outlook.com [52.101.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521A10E891
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nckFl93U3xE1dnjJu6ANIu/WcVSndNy/WQdd/lPrg7FO+GvC2gZ/yUU32EMk3Tpey3/8V1Bj+lIut9DIOhBkvrFDqbPKfuPd31bvGgXi81PLBfc3UrvNVe/XZoq4Rfy8+C5/ZWgsgVFJG4QHRMMHV+uAEevV0zOmsdqiGtpb1uhZ8gor6+t4xs8L2VbJ0uhwKr45Wx6AJsfY1wJLX7Nw90jGknHDq2uboXFellGisKHUxwR8Pb7nMin5x3AOBSfBIRYdksy5acsLYJbtTMqeHygw7prWKGN33rJW1eOR3Y2kziZwUd3f5QajWUCwbVI2S9FRDnH74TwM/F0TkMRinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG99axf7/MA5lFnOSF3noM6SfMSzAQ0x8p7geFYYDxY=;
 b=yxMOLgrIfd/zQ2k5jQutB/p18VOfmBwKOWsPms4wDSBqbjfmQcMKRdcxJUEwa7Bs37++Bh07+Ir+A5QCQDuSpqER/Q3/a1Cqu093gNQnKmqqvkvfWT/DjW8jLMh2DpkImtSjZHHJT8YQ4oyrbBQOpAF3gdeX/NXwxcoI+k7qV+Kn71yF+Urft8YpxTlIgQWQR+bWTc0aqxwXeLnp+pLXrrqhwgYbdJSYLYFbTFwW9prlkyhalNCcq/ENqYzLxWKbd0VMdTxR2ZmXbS6Uv5Dp95xv5Wej/lLAMwr+BznsA9tJFCbJx+vDwUIyD+NNeHtOtWCpnvBTh6ghdZPSa4jZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG99axf7/MA5lFnOSF3noM6SfMSzAQ0x8p7geFYYDxY=;
 b=xGLZ4xviVob8PK45Ri2PPMw4Zgbu0kxO7YcBs1g+Do5QeKwi+KwlGuDfyYBEy/RUM+wgAbHWERTbiInGTfOE23gsD3xzDjmJmRE98VlDT3cYylUpSXI+R98oSMtcGZr7UnhykytSkbxQ2jzcB4S1geeenhWHjqmaLZuTs2axmTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6260.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 13:00:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 13:00:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 13:00:35 +0000
Message-Id: <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Steven Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
In-Reply-To: <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
X-ClientProxiedBy: LO4P123CA0693.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: b39338b0-84cd-4cce-e684-08de54ff3d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVp5ZUpmbUpFMDBLeU5ndWJnZFQ2dU9GbFBlYVlUcmREbWg0MXRMbEFVTkMz?=
 =?utf-8?B?MGRRUDRUaEpjNnlQQjV1VFlhVkZXVHhsVHBPcU5VODA3cFZCUUQzbElGYXIx?=
 =?utf-8?B?YVdnUU40a0JQUFlyL0lid1E4aFFSRXU2dEtsVlNvSHFRdTBoWXIvNHNiQ3ZB?=
 =?utf-8?B?bzZKTU9LeXNpUitHRWs4VkFCdytNa1BwQzE5ejY4Vm1UTWlEM0JTckwvTm1p?=
 =?utf-8?B?UXVVQU5EeUdYM2lWTit1d3hHU25GL3c0eWtkK1pDcytzdlZldXFwclAzQzB0?=
 =?utf-8?B?cllzTnZSSEpYV1plRDlqTjZ4SWUwbUpIT1g5RG1qYmFjWGVhSjFISGNSRGNP?=
 =?utf-8?B?djJGcXdnc1p2UFhjNE9LZmVBVmFaM2JSN3dIdVlzRmNIMmFKczMxUVlTWG52?=
 =?utf-8?B?UjRQSG1Zd3MwR0x1ajduaTl6VnZsR2lCUFBzWnMrQlFlNG5CRmlwNlEzNFND?=
 =?utf-8?B?ZytPQnk3a2tOcGVYQVJXWUdyMkVWYnlZOTBqTHdxQ1B5ZFJyWlBielAvK2tk?=
 =?utf-8?B?bGlLNkFIdEQxMlBaMmx2N0QyaWEyQnBWYk1EZEdSZVU1d0dqWGxPQklTVWtv?=
 =?utf-8?B?LzJ5d3ZEYzVGWDVCKzZpMFpqUlZJWlBqV2IyenMxWGdmdkhWWStoZWdqUEhE?=
 =?utf-8?B?Rm83ZHVEbGRkZnNOYkkvZEtJWVhzR1Q2RVUvNFdVSlU2cUlTVUxkdG9MWjFS?=
 =?utf-8?B?bTFVMDZnak1EVlMwOWlxWlptTENwLzBmTS9JbDZOTmttV2lzOVEyMUR6K1R3?=
 =?utf-8?B?OUZuL2orRUwwdkRuVEhNTUoyZGY2R2pmd0FnU21qRWtZb3d6T3VTNE9Pb2pv?=
 =?utf-8?B?QWlmSFp0TTBMK3I3U3pQdlcvMVBjcGtzQU5ESzJ4WlpqbVJPUGYzMXR3Q3h3?=
 =?utf-8?B?NjNTNUVsbE5odzJOWkx4VGRUcjNkV09EcG1BMGVqWllWTEhNQkZhQjhVY3hZ?=
 =?utf-8?B?UDdzWVZPTElBVVRFTmFoRGlhUDZDNU9oRkZFZC9PRDVuZ3R1ZDk0WTd3VkRL?=
 =?utf-8?B?WndUYXloUm9OaFBkdnJNUWpvZENicTlkWHArNGl1cXhPUXZINFhqNUFlWnha?=
 =?utf-8?B?OXg5WExXdXdhNVMwcTUwWnM2NzlVTk10NkxSRXhocDlKOTMybG5uS2RpSUxW?=
 =?utf-8?B?aXV2TFdIMVlxVE9WU3RyUEtBK3Y1YmVJTzQyaEpiaU01VjlCdlloSlNDWjdk?=
 =?utf-8?B?M2NRZllxczRteC84NnByWnY0clhvcjUyR2tuNm1rcDJpcENpYzVYZ0l2ZTJB?=
 =?utf-8?B?bzlIMWZUNnlLZ2hIYUJvTUtPUFJ5RTFNYy9aOVBYeWpMYTRDZzJFQk56MkdC?=
 =?utf-8?B?aW9OdUc1K3RoRUdvUnBMZmk3R1dJVlB4TmljNmhIdHo2MHFCVWZLYnF5WERG?=
 =?utf-8?B?NkF6Vm5LaSthZlRpWUgrKytqOCtLNDVDREVuVncydlY0UHNWclFDZFBsQWFz?=
 =?utf-8?B?NU9aZ1RSVmExMVFWVThFUVpBTzUvNkIwQzRCQllJOVJGK2NzOGEzT0wzVHVG?=
 =?utf-8?B?alQ1ZFI2SFQrVjRWNUsvUkVza2RsbnZnWHoyNUIxRlJaUVFlR290VHlwRXlT?=
 =?utf-8?B?Mzcxd0VkUVNMcGVIMnZFSzNlYnduQjYzZThRdTYvdEtaMU9rMXl4L2J2U2pR?=
 =?utf-8?B?UkFoSUlLWFQxTEZEZjlvazJnUDhETEhQdG1EeElNWml3TzhxbGZ1eVBOSUQ1?=
 =?utf-8?B?NlhTdThpMHMrTjFEcjFZZFp5MEozcW9Hc0pLenJiU21RZFh3dXA5aTdvYWdQ?=
 =?utf-8?B?YU5ZWktlMnZmZWlpWW1US2x3MmI4emJIRHRpTU5JZk92Nmx3dnd3cFh5bVVy?=
 =?utf-8?B?T0xOMmVjVGNqTXgvRXI5UHYrYTlyZG8xeTZHQ3RudkJrMTE0eEVyVnl2eVlG?=
 =?utf-8?B?aS9GaWJBNG5IZEVzVXQxSThlMGVLVzl1NFV5Q2M0aCs5N0FSdUNUOGM5QkRm?=
 =?utf-8?B?b1FqVXpuUGtLL2ZOODNSTHZlWndYc2lvK2ZRK1l5MmpRUW1NTVladW1FYTg1?=
 =?utf-8?B?MU03UlBUVUVCVk1WdkxPTGJRSlJ0M2lHQnZwM0VkeDFKTjRBQkpFRjVWaGtl?=
 =?utf-8?B?NlF3YVBkVTAvUlpNMEdleVcxSEdabFhIeFZJU3JkbnZuOS9vYzZNY0owdXlS?=
 =?utf-8?Q?VP2A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MS9QTEFHWTE3SkVtQnBJaWJDSkZ0K2pqYUJHSE93bGxLVGtlbmFHYlNJWFJ2?=
 =?utf-8?B?cXFVNGFDZllnT0NDbWN2VFVMVzJGL1Q0cXVqb1Y5K1kySmw1dmtRRzZwSGVK?=
 =?utf-8?B?eHliUnpNYm1RSW83c3ltQXRoQjBMMytYSTdwdC8ydS8zS3hOTmxuNU4xT2dJ?=
 =?utf-8?B?TitkcDZ0Z1Z0OU9IWWorNTNNMm5BbFdCbXNUVFF2VUdBLzZEaVZ0NURsN09B?=
 =?utf-8?B?VkVaV256UDdvQ2xrVzM1OWlUT3NCT0dnZkF6VzJYS0Z6c0dsc2dyMG9wdlh5?=
 =?utf-8?B?Mko0ckduUkxQY2FCVGhhdldqZm8xQkt3QW1kOGRKNDJXY3lsMFQ1N0gyUnBs?=
 =?utf-8?B?dm8wRWovM3JVSXA5b2lyOFpuWEV3a2ZaMzhOeUYrYjV1QlNOVXhGaXZCS2Fu?=
 =?utf-8?B?eGVVR3EzU3R5d2JNVFhrYi9jcHNCM29ZK2t1ZDVOZE5iZmtnSk5xYTR2dEp5?=
 =?utf-8?B?ZlpzblJjYVpKaGg2M24ydkRKSGQvZC9ZbGhkbFNvSFJEYmxhVnNsTTNDUlla?=
 =?utf-8?B?SEJFNnNZZzNsUU5sOWc0Yi9uc2E2OWgrSndQbVBxOTYreGEzbUgxKytiUmdy?=
 =?utf-8?B?MHVYL2pGRFpOYzlBQkt2MFpBKzNwbi92VEpFazdEZlRPSHhOTmFDc1YwMEtO?=
 =?utf-8?B?clBuL2lvbkYwNEl2TzBtK0NpSUl0cTFLRmxzbVFBM0EvTFNEYW9zVytjT1Zx?=
 =?utf-8?B?YlErRkhNemE4cTRJcEZrMXlJbFpLd1VPMXBsNTAzSVlqMEY4cW1UTFZ1bmxz?=
 =?utf-8?B?SkkzNUQ2TTZ2VHVvZ1hYL0JTbzJCbUtUSlJnRi9wK0h2Skx6Q0E2ZGdaZFl5?=
 =?utf-8?B?V0F1bDEvWlhuN0hJTWo1SWFiWExPOHc0ZlFHMUV4a2lWeXdMVEZXUE5kZjI5?=
 =?utf-8?B?TEJlS3pvMzlGYXd1N0x0UStRNHJIK1pEWXZhQjZpOVlBYnRmdkJ4b0Z2WXFV?=
 =?utf-8?B?Z1BFWmlsRUhmb0o5dm1SUnBCbWdwaXdiRmNwVFNzYm5ZSkNuT1g3TmdXZFlX?=
 =?utf-8?B?VjRBaG1UcmYxb0JTTFZ2VnAyOVhKRVJONFdKUU5IRzR1RkZDVTdVWUJ3UjRI?=
 =?utf-8?B?NUJMNmV4dnoxUiswamJocEpmT3puWDJwQ2FuaHFjSkZ2ZHNwdGQ3bFdQdjM2?=
 =?utf-8?B?RWdOZG96cHBRWFp6cStoUkIyMlUvbzRPL1dick45eWJrSWIyR0c5dHhEb1RX?=
 =?utf-8?B?eW1IeWlkT1BpWWkxMmluU3YxR1JPRGNsVVRieXdjOTNTVi9PdWd4NHBLdUNk?=
 =?utf-8?B?RWJOOSs4SEM3bWRMRTNsTXZ6cVdvUy9BVlNTUngxSXora25PejlNMWNvSW5L?=
 =?utf-8?B?VDE3VFo5S1NkNFdQTjlzaE1zUmprNzhLUWJTNGh4OFYyWXA0MHpJcnp1d1Az?=
 =?utf-8?B?Q2lncUlNcVMrYnppMGR6bHZ6a00xMmhoTnBwUEhNSlZOMnB3RjZyWWVjelFD?=
 =?utf-8?B?K2szY0VoWmZVb0JrNWRlckUxRWN2WW1vcElPYlpxREpHUXRWbjNLSW15WUxq?=
 =?utf-8?B?djBRZWhUNlRrZTZFeWhrMzhNZkVtRjAxTCtkSDFNNHdvMGNBT2NmcVh6UlMr?=
 =?utf-8?B?S3VvckdneUwvNFVWeURHWWNmVDdLS3dSRE92RFhKVkY4VHJlblJWU3ZPT2sr?=
 =?utf-8?B?S1pHdXFPeXBkTWQ1WXYvNy9tVmFlZWFSbDdhbXB2aTBlRGlLWXRzbmxyR0Rj?=
 =?utf-8?B?ZDc2ampnbzQyOUgyR2I1TXVya3MvLzdyclQ5TGlTMkQzVk5jVWtIMkZJQnpu?=
 =?utf-8?B?Zmo4dFRxMGpkdUxWTVB0R1llVEFETFQ2d1lzNENXTjAwRENnUVl0WWMwdm1p?=
 =?utf-8?B?OVdKTklWYU1qOFFrN0VYeGdBMm9EZFdyRDNXVzYwdXVUUkdWb0FLbEliMVlk?=
 =?utf-8?B?V1U0d1EyeTBJMEFuZ05ZdmVVWWZvYzVrd2x0R0FzU2hRVnkwUTJSbVQzRUR4?=
 =?utf-8?B?ZUVOa20vdUxjNllhU1RYVC8xVkpwVkhtR0RWdTBTMTBhcS81MmlvMlBJMzUz?=
 =?utf-8?B?aFJyYnJZelpCbmxVTnJEWG5uSWpMWjVCWU80VEQ1NmhNQ1c5OURYWTdrMU1E?=
 =?utf-8?B?L0VZQXlSRnNyQWVDeWlLV3NnQnZBMGFaVWJJWjQxdjNKdlp0Rk5JRlhuRWZV?=
 =?utf-8?B?SEJDS011RlhZWFVUWXZQdnM4REhsVWhlbEVXWGI1UmRaZmtlUktyVGdBdmlP?=
 =?utf-8?B?T3NuUDh4SytaUGoxcytwMTB3azk3MldSUE9Oemo3MitoTHE5aS9xOGxCQ3Fr?=
 =?utf-8?B?a20raTB1dnJrKytSSlRXMm9hYTAxZWRFL2NFMW5udlJiZXdqb1NzY0Fqc2xz?=
 =?utf-8?B?Rnp5aXFBeFp6Q1FsZkoyMHB6b1BNZU55K2RTemo3S0JkMU1KQnpqdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b39338b0-84cd-4cce-e684-08de54ff3d3a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:00:35.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4FNoiMjkeOf4jwoVlDg17IR1R5wkQy7zcvcYxJQ58vlsO4Te+OKqq8od7LZe6HmLi0SBEXDXLRDEoqEBFSYQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6260
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

On Fri Jan 16, 2026 at 12:23 PM GMT, Daniel Almeida wrote:
> Hi Dirk, thanks for the review!
>
>> On 15 Jan 2026, at 14:05, Dirk Behme <dirk.behme@gmail.com> wrote:
>>=20
>> Hi Daniel,
>>=20
>> On 14.01.26 23:53, Daniel Almeida wrote:
>>> Replace regs::Register with kernel::register. This allow us to more
>>> succinctly express the register set by introducing the ability to descr=
ibe
>>> fields and their documentation and to auto-generate the accessors. In
>>> particular, this is very helpful as it does away with a lot of manual m=
asks
>>> and shifts.
>>=20
>>=20
>> As mentioned somewhere else already I really like switching to
>> register!(). Thanks!
>>=20
>> Some coments below:
>>=20
>>=20
>>> A future commit will eliminate HI/LO pairs once there is support for 64=
bit
>>> reads and writes in kernel::register.
>>>=20
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>> Note that this patch depends on a rebased version of Joel's patch at [0=
].
>>>=20
>>> That version is stale, so I ended up rebasing it locally myself for the
>>> purpose of developing this patch and gathering some reviews on the list=
. In
>>> other words, the current patch does not apply for the time being, but w=
ill
>>> once a v7 for Joel's series is out.
>>>=20
>>> [0]: https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-jo=
elagnelf@nvidia.com/
>>> ---
>>> drivers/gpu/drm/tyr/driver.rs |  15 ++-
>>> drivers/gpu/drm/tyr/gpu.rs    |  55 ++++----
>>> drivers/gpu/drm/tyr/regs.rs   | 302 ++++++++++++++++++++++++++++++++---=
-------
>>> 3 files changed, 267 insertions(+), 105 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver=
.rs
>>> index 0389c558c036..8e06db5320bf 100644
>>> --- a/drivers/gpu/drm/tyr/driver.rs
>>> +++ b/drivers/gpu/drm/tyr/driver.rs
>>> @@ -66,19 +66,20 @@ unsafe impl Send for TyrData {}
>>> unsafe impl Sync for TyrData {}
>>>=20
>>> fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Resu=
lt {
>>> -    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
>>> +    let io =3D iomem.access(dev)?;
>>> +
>>> +    regs::GpuCommand::default()
>>> +        .set_command(regs::GPU_CMD_SOFT_RESET)
>>> +        .write(io);
>>>=20
>>>     // TODO: We cannot poll, as there is no support in Rust currently, =
so we
>>>     // sleep. Change this when read_poll_timeout() is implemented in Ru=
st.
>>>     kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>>=20
>>> -    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT=
_RESET_COMPLETED =3D=3D 0 {
>>> +    let rawstat =3D regs::GpuIrqRawstat::read(io);
>>> +    if !rawstat.reset_completed() {
>>>         dev_err!(dev, "GPU reset failed with errno\n");
>>> -        dev_err!(
>>> -            dev,
>>> -            "GPU_INT_RAWSTAT is {}\n",
>>> -            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>>> -        );
>>> +        dev_err!(dev, "GPU_INT_RAWSTAT is {}\n", u32::from(rawstat));
>>=20
>>=20
>> This is pre-existing, but printing `... INT ...` for `...IRQ...`
>> register looks confusing (wrong?).
>
> Yeah, this needs to change indeed.
>
>>=20
>>=20
>>>         return Err(EIO);
>>>     }
>>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>>> index 6c582910dd5d..7c698fb1e36a 100644
>>> --- a/drivers/gpu/drm/tyr/gpu.rs
>>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>>> @@ -44,34 +44,36 @@ pub(crate) struct GpuInfo {
>>>=20
>>> impl GpuInfo {
>>>     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Re=
sult<Self> {
>>> -        let gpu_id =3D regs::GPU_ID.read(dev, iomem)?;
>>> -        let csf_id =3D regs::GPU_CSF_ID.read(dev, iomem)?;
>>> -        let gpu_rev =3D regs::GPU_REVID.read(dev, iomem)?;
>>> -        let core_features =3D regs::GPU_CORE_FEATURES.read(dev, iomem)=
?;
>>> -        let l2_features =3D regs::GPU_L2_FEATURES.read(dev, iomem)?;
>>> -        let tiler_features =3D regs::GPU_TILER_FEATURES.read(dev, iome=
m)?;
>>> -        let mem_features =3D regs::GPU_MEM_FEATURES.read(dev, iomem)?;
>>> -        let mmu_features =3D regs::GPU_MMU_FEATURES.read(dev, iomem)?;
>>> -        let thread_features =3D regs::GPU_THREAD_FEATURES.read(dev, io=
mem)?;
>>> -        let max_threads =3D regs::GPU_THREAD_MAX_THREADS.read(dev, iom=
em)?;
>>> -        let thread_max_workgroup_size =3D regs::GPU_THREAD_MAX_WORKGRO=
UP_SIZE.read(dev, iomem)?;
>>> -        let thread_max_barrier_size =3D regs::GPU_THREAD_MAX_BARRIER_S=
IZE.read(dev, iomem)?;
>>> -        let coherency_features =3D regs::GPU_COHERENCY_FEATURES.read(d=
ev, iomem)?;
>>> -
>>> -        let texture_features =3D regs::GPU_TEXTURE_FEATURES0.read(dev,=
 iomem)?;
>>> -
>>> -        let as_present =3D regs::GPU_AS_PRESENT.read(dev, iomem)?;
>>> -
>>> -        let shader_present =3D u64::from(regs::GPU_SHADER_PRESENT_LO.r=
ead(dev, iomem)?);
>>> +        let io =3D (*iomem).access(dev)?;
>>> +
>>> +        let gpu_id =3D regs::GpuId::read(io).into();
>>> +        let csf_id =3D regs::CsfId::read(io).into();
>>> +        let gpu_rev =3D regs::RevIdr::read(io).into();
>>> +        let core_features =3D regs::CoreFeatures::read(io).into();
>>> +        let l2_features =3D regs::L2Features::read(io).into();
>>> +        let tiler_features =3D regs::TilerFeatures::read(io).into();
>>> +        let mem_features =3D regs::MemFeatures::read(io).into();
>>> +        let mmu_features =3D regs::MmuFeatures::read(io).into();
>>> +        let thread_features =3D regs::ThreadFeatures::read(io).into();
>>> +        let max_threads =3D regs::ThreadMaxThreads::read(io).into();
>>> +        let thread_max_workgroup_size =3D regs::ThreadMaxWorkgroupSize=
::read(io).into();
>>> +        let thread_max_barrier_size =3D regs::ThreadMaxBarrierSize::re=
ad(io).into();
>>> +        let coherency_features =3D regs::CoherencyFeatures::read(io).i=
nto();
>>=20
>>=20
>> Is there any reason why you replace the UPPERCASE register names with
>> CamelCase ones?
>>=20
>> I was under the impression that we want to use UPPERCASE for register
>> names. Like in nova
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/gpu/nova-core/regs.rs
>
> Not really. UPPERCASE for non-const items will trigger the linter. The No=
va
> people chose to #[allow] this to align with OpenRM and, IIRC from the LPC
> discussions, their registers are automatically generated from some intern=
al
> docs.
>
> We have only a few, we can simply convert them to CamelCase.

Frankly, register names do look nicer in UPPER_CASE, especially that they'r=
e in
many cases, packed with acronyms.

Best,
Gary

>>=20
>>=20
>>=20
>>> +        let texture_features =3D regs::TextureFeatures::read(io, 0).in=
to();
>>> +
>>> +        let as_present =3D regs::AsPresent::read(io).into();
>>> +
>>> +        let shader_present =3D u64::from(u32::from(regs::ShaderPresent=
Lo::read(io)));
>>>         let shader_present =3D
>>> -            shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.rea=
d(dev, iomem)?) << 32;
>>> +            shader_present | u64::from(u32::from(regs::ShaderPresentHi=
::read(io))) << 32;

