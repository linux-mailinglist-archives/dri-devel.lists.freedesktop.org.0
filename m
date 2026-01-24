Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLmhBowedGk32QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:21:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E57BEA7
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B33910E2F9;
	Sat, 24 Jan 2026 01:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cg/NIXzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012053.outbound.protection.outlook.com
 [40.107.200.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4035910E2F9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 01:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuWgFd8X2qp5+DFYpPYObPr570FE653Fca3B4xOZye4top7akxNcIPzwvXdsY2v7mYwC0LxWRe0MHypX6ucT+mr1zQX6aK3K9JeGq3D74hg6YdHJgalxH3c766eQget7AJD9GvHfX/bZbJBg3PbILp+zs87WaCJpcM+zp/uzq/sUWf1hmfLvOuWog+oFNtRcyb6KVWLGwRft91iT5+nHTpjuHbGMbZcXasOiOdYpE5PEWFoi7CWhw/6P6w5hJ7tPJPf+E+O8cp9+kGpDNKZjCIEI4oZOUrKmlM8mmwfD/rCkZOekblawsHyvNj+Ma+mRRzgqVJrqU7Ba9YZRsnCPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbEroxk3TESTQ19B/RMXcQ/Apk9mA/Dk2NEkzutTw9o=;
 b=imP4pSYDrNOJNfbmtYWevdurRd36d18J6VtkX4q95UgPSQaN+b0u89TptltrCfQzjLqPGnHZ1rxp/+JE5HlXRmTVFeovZ88tV3Oa2tsLGTEAHBRTZ9C639QO3+NcaFNOulRYIu5Ku/3tTJzBE5CfqoBUxjnSYxqg2Hpy5hPAMxhDbv3sVp5EB04sNVCq9di4e7qbU3gJZJcK1UpHIEZkJR0qKTww+UwNW+Q76+Ov/zw02SXmKeOD9lp4hJ15auK79ddD5Cf5YrBl3VLmSSBGOu9Wf3+MVaX7g34mkMqDUWHFemwosID4RuhZg3rswRzrWI9DRjhqmykuUqdfACjC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbEroxk3TESTQ19B/RMXcQ/Apk9mA/Dk2NEkzutTw9o=;
 b=Cg/NIXziYg45pm4jAs+kYfIYZ/+s0KvXYDM8yHwvESS9JfEk/8peQajOiq0/9A5X6MYW6BE3IG4/uUBmdQ456nwNkrMnu4KEIkE9j+Lj0Q7t0/1OArUuwpJDm8z95MaNGyWsBaJnIG1XbOMEZZ//yi83gJEJJjevBbnIizviEKqCOPbmujY3lSw913UlR7tYjlyTWawTyZvUHD9SheMnOcikD3q0IDdvGxNNCZt3h4dwgi/VnZVKAsrucNDXlarAEliCtnHcq54PdXJADZ4sVfcTQp7J30SJ17V00GJwX69hxQGjvdYKWklya9gzQHpXec3Nb2TLKMOycYVrRprqNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 01:21:06 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Sat, 24 Jan 2026
 01:21:06 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, airlied@gmail.com, thierry.reding@gmail.com,
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2] gpu: host1x: fix missing
 'host1x_context_device_bus_type'
Date: Sat, 24 Jan 2026 10:20:55 +0900
Message-ID: <49374358.fMDQidcC6G@senjougahara>
In-Reply-To: <20260123140512.609167-1-ben.dooks@codethink.co.uk>
References: <20260123140512.609167-1-ben.dooks@codethink.co.uk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: e95373f3-f37d-4646-ea30-08de5ae6d8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1hSNkR5THRIYUNhb21TSmJCN05lWEp5ZEtRdlNNT2JIcER3Wi9xQU1xNnF2?=
 =?utf-8?B?eFhIaC9PZWRIYVRkek5xbEVpZnFqbUxXdDFqdlBIa2xoSDM3azVSMnZzeGUy?=
 =?utf-8?B?bC9uV3hDa3hyZ1AzaW1nV0JhckllcFBOeTMwWHNVL3E0RGh1cG44MXZUSEVo?=
 =?utf-8?B?NjdoYVc3dm1PN2FKVnp2QmI1b1gwVytUeHRpVEF5SkdUMm05ZlpRTmhMQWpx?=
 =?utf-8?B?dzNTbUN1UTNuMjdCSWVWQStKaEoweHRYT3FCNFBqdFFEbmVoNU9LQjRhWnBE?=
 =?utf-8?B?S0U5WVc5U0lmZnJMdXBOakptZTFTU0pHT1ZaZHRJN1Z2L3Z4OC8yazUrU0xT?=
 =?utf-8?B?NVpWWUlvR29ONlFiaTQrcFdhb0JDbDF3UHJ6N1crSTJOaE9yc1BlZlNpZlBU?=
 =?utf-8?B?OHM4aFdJRllSeWNRajhrL2JnMmV1V0U5eVVHRFRMSG9oMTcwSnpKMlpQM1ox?=
 =?utf-8?B?TTFLS2ZBYTUxUjRtM0Z4ZnFGMkVRaXNLVm44V2NsQlYyajc3Z2ZwckpzK3F6?=
 =?utf-8?B?akJaL0d4aWgyRDlRMjBqRWMyT1Y5MFprOGg1ZW1oNmk2VzAvQ3RCeHJ1VW4v?=
 =?utf-8?B?T2Z3a3grNTVtd2pyc3JHd05ENDJjTWZkbXhaYWJMZWd1VTZtck0xUlczeE5o?=
 =?utf-8?B?dmlxTjhvZXJ6Z04wNWo0QS93WkpzaG4rL0hmOW5LTCtnUDhnZlhqOGhZQUV1?=
 =?utf-8?B?azg1VW42RjJxR21SWlRpdWhZeEl6RHNiaEYrYVNQOW5oWXU4MmhSQmprNm5T?=
 =?utf-8?B?MVcrZExtQTBOYmlUeTREZUtEQ3VQdHQrVm1LZmFmeElaOGJQd0FJYlBVWjly?=
 =?utf-8?B?emxzMDd3U2dkQzcvWFV5TE9NRVp1WjNtei92Z0s2S0RXWWM3L0xuNkVpcUdm?=
 =?utf-8?B?QTZBWXptS2xEc3lqM3FXSFFKdDJlVFBSSUY1Mk1BT29KSUp4blZ3Qk5EQjBl?=
 =?utf-8?B?NUUrSXJ3MXMweFI4eEk5TEsrUFBlaG5sZHVZOS9WeitlenMrMGxQUDZuaVZx?=
 =?utf-8?B?ZW41Z1FPRjF2L0p2WDI2Tml3emdGWUtkcTVsTURJQWVvWnE3TVJLUlJhcHdP?=
 =?utf-8?B?NzlWNUJlTTh1MHNWcmxka0xLNDFOZThuYnBNL1pHaDA2alVqVVE2Y1AvdDJX?=
 =?utf-8?B?YVRpTkRBNUpiRXF6Yi9paUdiSHBGR2MxditCMThmTStMMGxKb0Irc3BQQkQ5?=
 =?utf-8?B?RUkvMFJVbnZzNVZrR0FqY3NtK28vSXhjdDkrT3FzZDM4Nlp2ZDdpQ2JyUGl4?=
 =?utf-8?B?MDVzY0JnR28vU2ovNGtoREpIUWw2c085SHk1K3ZhN3RaTWhmTkNCaHZpYlNt?=
 =?utf-8?B?YUJUVldGNWZkYzh3NVhIQTRyK2VhbDZudkRSYTRLUHRmM1BVeUJldUhNRDR0?=
 =?utf-8?B?clRBMFpBb0xlS09CTC9IYnZKYkhNcWJaU05IQzhYcUM3VzF1b3UyVTRncC8r?=
 =?utf-8?B?aFRObjgwaUlIMlhIVFNtdWVHQVRzWS8vMlFsRFAwNEx3K0JjZDkwc0ZsaGZF?=
 =?utf-8?B?eGJTN0UreTRBMGxwUlhLUkd2blUwT3NNRGpHVnpFaDUwRXlFNER4Y0NzTFdH?=
 =?utf-8?B?eGVxY2VUZ3k4N2tQU2JYRmRXdXQvam5MUHJnbndWU3hHYU9tM2liNzB1TEZD?=
 =?utf-8?B?MC9nUGs1MnVmaUFUVVBqY29qTHpxTUpUbWxSdHJlWVRUZ25MNFFjaVg1dVBI?=
 =?utf-8?B?dW1XcWNqbUpVUEdSZTUveWJwQU52RzhSRENBMjVhbzJXYWtVOHFGVGptV0Na?=
 =?utf-8?B?THlxek9jSml6b0N3SndGcENJVTA1MGRlS2ZuWlkvTHZYNjRPNnRmMHdmZFlP?=
 =?utf-8?B?Q3Fqb1dXbFo0N0Z5eTVJM3FleE9IRVN0dGpGb0lDeThwNE9pSEJncUJNTXhh?=
 =?utf-8?B?TDZWSC9RTm5mSUNKRUNyaFpSSWNNWXlOUkdYbko5N2NVWmhWcHRNdGVqWXlY?=
 =?utf-8?B?YmJBaXE0b0VsZTZOL1lpM1hKczNxWWJXUHkrQ2IxUENwWnNOU0hOTVdpQm9Q?=
 =?utf-8?B?azIzNnMrVWNVQ1lkUTRYNWV3b08yRzB5MitpT0JMMHQwOFpmQXk3SVgwRlh1?=
 =?utf-8?B?QVZBcDNDbEpBNEIwczN0K0krZWgxeTk2VWUybDV6R3dNMnhEVlNhQmVINTNT?=
 =?utf-8?Q?0w1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VYUldFTGM3ME9sWjZhTUkyY1JuZ04wR1BYUUQ3dEQyY2YxbE02K1hoNXJQ?=
 =?utf-8?B?dDVrSHlzenp1SUxOd2hYV0hPWXFYWnFJQkJWOHY5MHF6Ly9BejhyWWFqQTBY?=
 =?utf-8?B?dTQvNUtpL3NOWG1COXJnRFFSbXd0bTU1Z3d2MlowdnkxUU43QysyVXVDK2U0?=
 =?utf-8?B?NTVBcEwzWEY2UVJKQWYreE1YUXQyOUtuYWZScHF6R1NjZ3UvU1dEbGZCMzhF?=
 =?utf-8?B?ZWNHK1pWYU9RaDRXcHoyUG0rd29IU01jaW9WVXVmUDY0V3RqVitrbHV1alZH?=
 =?utf-8?B?dk9yK3FITjk4WEFldTlQYnA5eFg3MlN2RHJYOGc2bHc3OXZzQzB6UTRsd3I5?=
 =?utf-8?B?Y0RMcERjUVNWclE4Z3dESEpob1habGpFL0YrMlpUMVdoTU1iQ3FIQTNTd243?=
 =?utf-8?B?c0F2Rlc5WWQvdjhYOHFPMFJBanRNU29KSTNjMmh2MkVwa2hDOEd0b1NUNE9W?=
 =?utf-8?B?VncyQnI5N3hodUR6a1IvbHBYVG92SHhPMDVad3g3UFpaSW9NbWtqNGhjV1N1?=
 =?utf-8?B?NnlUVXJnVGV2Wm83Y0w4TDRvdzEwSWpoVElLSnRxMStyanRtT2N2WXcwaWtB?=
 =?utf-8?B?WFI4OEJnVUJWUmlCMlRsdVFVWXpma3h4MHMvVUU5cGQzM3o1TGxqR0lHci9C?=
 =?utf-8?B?WEIvMkFmT1VoK1RTdFo3WXZMb2UzRys0OER5enlZL0dyZEJNaEM1VkVubWR6?=
 =?utf-8?B?dWRvNk5ScERyUlVQSU0yRzdOb3pPWGJaMGFGclFVRG5VQ0h1b0JLWGl2VlIy?=
 =?utf-8?B?T2dHeTY3ZHR0L2tjb0Y2QmduRnk3bzdKSGpoemt1SjVDdkdMNFRtSXBMQ2pn?=
 =?utf-8?B?S1R6Y0NsZXZXSVlmRVFHd2h2L2V2ZVQ1cFkvc1BXVHBZclBBR05wK201eDVr?=
 =?utf-8?B?bW55bisvbWtOSDk2cUY3WXVsU3dPbFhnYmZaaTcxSHhMUkY5UWF0T0FPQm5h?=
 =?utf-8?B?Qk5VMlNxNENha2JwMUVVVlppOWpnZUZxNXI2V0kxTXdCb2xmeXViSDZKWXE4?=
 =?utf-8?B?Y3psWkFGcU1xWkh6c1RlcU5KcUVTMjB4bnFtVGZWZEtZakpuanhISVRNNHA0?=
 =?utf-8?B?cGhuUUdqQUNxV1FMY1doN3A4SkcyK0ZDcEZQNlhNZlQyZ0k0TXhIUHdueGpB?=
 =?utf-8?B?Y09nbFlUUk5yUWo4Qlh2NEl1RVZya3V6eXlQM092R3pWaGhwT2E1bWZ2aWpC?=
 =?utf-8?B?N3o1WWZjZWxRMnlmNUl1KzEvTzE0dngrWFVmWmZENE80bXJNOTJ1RUtLRi9m?=
 =?utf-8?B?eFVtdC8yZHF1b1RtdHRVUXhpUXdHTm4zdzl6SFpqNGFjL0V2Y0dqTjFJR0RW?=
 =?utf-8?B?ZkxJejFYc0NMN2p5RjRZdVp6TWNpZk5tWnlrMHFFd2hoRkdJNnlVVlI3bXI1?=
 =?utf-8?B?NFJPMHRNNEUyN0hscjdwZkpWdVpabUVzWTljQmk4czA4cW03cnZLQmtyS0I2?=
 =?utf-8?B?MFNXQ1RzV3NyckZNMitKTHViQU9VYWpuZHFDQzFlTjl6Nlg5SjBsZFJtTTJp?=
 =?utf-8?B?Tk0rbit2U08ybE9kTUQzS1FabEtxbzVCVWFUT2o3TEptZ3ZuQnJNcEhHMVZG?=
 =?utf-8?B?U1FjUFFrUWRLeURTNVlhMkRCQnc4ZUhGY0gxUjZhOW9qQkNIUmZWY2NCb05q?=
 =?utf-8?B?VVB2NmdTdFMzNW9vR2xpL3NqSVppRHdXcFdHZ2k5Z2xITGJlVzNkaUhUUk5E?=
 =?utf-8?B?bk9GTmNFcExtaVcyWk1qSytyRlAwT05yRDdFTVdMZEw1ZWFqRjh2V1VHUXdx?=
 =?utf-8?B?elpKL0c0ZUV6bFFTcmdvWEFHcHpTa3M1V0x0OWx1NXFjWHhOWFFCTEwzVFM5?=
 =?utf-8?B?Vi9GUzRpWXo2eXk2elcxQ0VTbWVZQ3o0YnBtSWcxRWJEdjFzUldsYXFkVEZO?=
 =?utf-8?B?MU9KM0R3dVlSc3oxK2xOYUtBN2FVay9TaWw4RzNURjFjNmpvemczT3FsUU9j?=
 =?utf-8?B?NmpmMVZnblc3Q1piYTFDTDNETVVPR0FrODhMOFRQbysxcEEyVC9URkwrUGkv?=
 =?utf-8?B?dXQ2a2J4bDFQTm51UTFVU1g2bi9Od2FkOHNiNXNVSTBERVp4Nkd5UnArbXZt?=
 =?utf-8?B?MHhCQUdlWno5eFYyZGxBK3pRQWVnTFZ1NFRpajV5SVpCa2NDcWpDd1lqTjBP?=
 =?utf-8?B?T1J2eEZtMk1ncmh3NXNsRmpTa1RjY2QzajdEMm9LMytSUjNmMHVtMVB0d3dP?=
 =?utf-8?B?Rldwc0w4bHIxQjhpc3A2ZkZTOTQrT2tJdlNZMnB4amsyYXpZZ3dlNUJBdmRy?=
 =?utf-8?B?czhOZGVYTXRLQVJkWVRrY2ZSR09RMHFNTk1wNE9CYmUzNi9yR2J5N0c0M2lG?=
 =?utf-8?B?b1hzaFdqaXN4MXNRbDVyeHlIcUo0M0VtQ1hHMXFwUVBlRTlPZzByZWlsSmpl?=
 =?utf-8?Q?otuGNpcfkTrf+DIa6r4JNfbt7fbPGyS2tDkTJpTrkmxyj?=
X-MS-Exchange-AntiSpam-MessageData-1: tQh319tF04jlyA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95373f3-f37d-4646-ea30-08de5ae6d8b7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:21:05.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiO2Su1oQ/Pi22MVZCSG4sOzya8ccgts4fbDIcJ/cQB3hm1etTMGXtreDdJGtd1NEfC9qsfSs6rti/5jBg9jig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.freedesktop.org,ffwll.ch,gmail.com,codethink.co.uk];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-tegra@vger.kernel.org,m:simona@ffwll.ch,m:airlied@gmail.com,m:thierry.reding@gmail.com,m:ben.dooks@codethink.co.uk,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D6E57BEA7
X-Rspamd-Action: no action

On Friday, January 23, 2026 11:05=E2=80=AFPM Ben Dooks wrote:
> The drivers/gpu/host1x/context_bus.c does not include
> any declaration of host1x_context_device_bus_type, and
> after including "context.h" it also showed that there
> are two definitons in the kernel, so fix those two
>=20
> Fix by removing the definition in context.h and include
> <linux/host1x_context_bus.h> in context_bus.c
>=20
> Fixes the following sparse warning:
> drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_de=
vice_bus_type' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --
> v2:
>   - removed fixes line
>   - changed to include into the c files directly
> ---
>  drivers/gpu/host1x/context.c     | 1 +
>  drivers/gpu/host1x/context.h     | 2 --
>  drivers/gpu/host1x/context_bus.c | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
> index a6f6779662a3..476e8c5e1297 100644
> --- a/drivers/gpu/host1x/context.c
> +++ b/drivers/gpu/host1x/context.c
> @@ -12,6 +12,7 @@
> =20
>  #include "context.h"
>  #include "dev.h"
> +#include <linux/host1x_context_bus.h>

Both this and the #include below are sorted incorrectly (should be within t=
he linux/ block of includes and alphabetically sorted). Otherwise looks goo=
d.

Mikko

> =20
>  static void host1x_memory_context_release(struct device *dev)
>  {
> diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
> index 3e03bc1d3bac..78bcf08cc90a 100644
> --- a/drivers/gpu/host1x/context.h
> +++ b/drivers/gpu/host1x/context.h
> @@ -13,8 +13,6 @@
> =20
>  struct host1x;
> =20
> -extern struct bus_type host1x_context_device_bus_type;
> -
>  struct host1x_memory_context_list {
>  	struct mutex lock;
>  	struct host1x_memory_context *devs;
> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/contex=
t_bus.c
> index 7cd0e1a5edd1..c0ba0433c686 100644
> --- a/drivers/gpu/host1x/context_bus.c
> +++ b/drivers/gpu/host1x/context_bus.c
> @@ -5,6 +5,7 @@
> =20
>  #include <linux/device.h>
>  #include <linux/of.h>
> +#include <linux/host1x_context_bus.h>
> =20
>  const struct bus_type host1x_context_device_bus_type =3D {
>  	.name =3D "host1x-context",
>=20




