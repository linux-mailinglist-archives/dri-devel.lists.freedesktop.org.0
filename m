Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E864AB8E5B
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBBA10E93C;
	Thu, 15 May 2025 18:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zM9dcQPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0D210E93B;
 Thu, 15 May 2025 17:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnuLwTTMje5QlnOYiY4oNvc4HIlY7K1SoX65jIV8dGDPGiNf/mlMbu36vwAM5K1fGnaeZ7uWlh+LcNpTUoQdpHLqnfnD7vTtngy/ECaVvTOFDgl4MuYthta8Sh2weO/Ke1FysSZbW7aKVWvvXU2rqrvCUM6XCEsJTwZQToQjZfm4ADPG/M9G3R/y31iK7gscRk9K8GVnfysWB7Me1Ir+DDaXtlUyoeskV3RG338nycOHXyMIBYmINEwbQMV+XNzndhV9xJgMNrCNSpZhYNKkitUnP9uXWtnf4rZL9ozSlcWgwGpqIKl5gvIln9lZh20QicP0LmhGZ1jG6+UL4W6wwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkAAfnNch71B1kHIIFhEbpN/rhHxKILQcKmAmmt3VcY=;
 b=caOZ3izogs6o3WG7Fuf2TWaw56EDgpsKPZqsuwdTMs+IiLiHQJnhg2XvqXS/xFtf6RALEVGBgwi2TL3glXAVrTsr1tnyF6RV+xnpQTGs/xpulgaZkIu78jdg59ZfOUywnTHvOcazp6rumS1jGVltn7nDeTcrug8WVltYr1U7a4cOgxRmVaf6DiKtgyL7aPrwY15OP1lwly1J+bv0yW8O6i2HL8mql9u9GkcFp8MV53YZuUfI5K0FSptx0lDaOlA4f+F2CvW5V2BmBoXXpDWpRhOpKYTrILQwPvJxXaYI9XMIwAw/8vov+qqDTuu2UQ9jVjyJwkZlPPb7oPqnQo6wyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkAAfnNch71B1kHIIFhEbpN/rhHxKILQcKmAmmt3VcY=;
 b=zM9dcQPD+tsz5xKuVZ6hl/V2jKQo5FNzuwyL/uIsGVHUhqfF/w6IwAveJNzPS8oMC8YxS2OUDEHQG6klvxapbV5Wti2cup0g2WAProYOmIhqorMZgfb9i5tNbeLVOdM9cBzuVrcuh3dlfEXE4cnKseJ268AIdSlILgbJ1YUd1bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Thu, 15 May 2025 17:59:58 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%6]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 17:59:57 +0000
Message-ID: <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
Date: Thu, 15 May 2025 13:59:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>, Steven J Abner <pheonix.sja@att.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
 <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0051.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 55302caf-96f2-43c7-dbfd-08dd93da4e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEYxQXI1TUlOTTZ4OWRmOEhGZ2ZZVDY4M0RVK0VvQVZkRkpKWURSdzkwYkxX?=
 =?utf-8?B?VjAyUmE2dVd6N1Z0bTJreURzbkN5MnF4Q2RlSlpwK1dpTE5VaW1keFlJa0Fy?=
 =?utf-8?B?OFV0dlVpQ1U4ZGFYY2dEQWQ5R2xSekFWZ1FPNDhYM3JXdS9Hblk4cldMbmE4?=
 =?utf-8?B?dUFKN2d4YUpaVzB6bUdXNmNoR0JPOEdBOUtHUDJyQ04wWVpHU1dud0xjeWtP?=
 =?utf-8?B?YXp4SUI2c3dlVlB5Q1RHMjlyUC8zOVFrMVFsc1IyQ1pldWNMdTlOSTNQWTFN?=
 =?utf-8?B?Y0lkMm9rdzFHVVpUNnZSc2ltK1dVTEFmNTloM3BlOGE5VFFTdnVaQWpCY2lR?=
 =?utf-8?B?M0JjMFdsNDE1VVVaSW9YS21IekdkRlBWOHJVblgxc0RJMG5ReGZPOElXWjdv?=
 =?utf-8?B?Y3ZoUjY1Mkk5NFB1OGI1dFZhcEZURkQwRHBPOVlJS3NGVFIzbGhLT002SUZV?=
 =?utf-8?B?U3gzR0RpZTZBUkQ5VWZsMGoyV2wxNkpvK2JmaXl0Y01WTnZZYkNzY3kyMFFJ?=
 =?utf-8?B?Uk92U3p5aCs3YnBmbWVwTTEyeGpTWHJPQ1h4TmJqVkZRZ2RSbFpPRmNXck9J?=
 =?utf-8?B?WUIrS0ZEelFmRmdJWHJXcnpwbmJtWXlSSHZMSmVSVHJJRjkzWG5tdjZUR3lZ?=
 =?utf-8?B?V0RNSjFpNWRRYmc0RTJzblpzQlovd1d4aGEyNmNCUnZTTTZQdUxZNW1nWDYr?=
 =?utf-8?B?SldDSllseGtnbmhlWTY4MnhWckN0M3NHWmNDK3JUYmFEQ2FVYkovVzN2RmlS?=
 =?utf-8?B?UnliR3MyQXoxSFJES0R4cEx0T01MS3FJckpzeGNVVjZ1U2Q0WnBWVXExeU5x?=
 =?utf-8?B?cys1V2FzU2hLR0dkcEo0T3Y2WXhlelVpR1NmdU1oVGJZN2kyTnJRQkxHRStV?=
 =?utf-8?B?VmVJKzYwK0dkdzFrWEQ3WXBmSEVMSXl0K1dweTRicTJJc2M2TCtXZ25YNURi?=
 =?utf-8?B?MHU3L05jSzZURzluaFBibGZsdndwNVgyRFFKKzNxMGFFWVhCTng5TU9KVlI5?=
 =?utf-8?B?QUxLY1RGdkEvVFRMZjkreDlzaVBZSjZ3NGdMNlp2TTEzOExCcmR0ZmtMZXV2?=
 =?utf-8?B?YnBVeElOOXJkemlLTTFMUXl1cTZqRVphUkJsb0IzaEYrSW10MTZOUHlMRTJy?=
 =?utf-8?B?QTBmbW85UHJHRU13UkkzZmtDcDB0ZWk1OW53YzlYS09jUmh4bDJneCt2a09w?=
 =?utf-8?B?Kzc0M25HWFh1VytCQ09FSzdlZ2d5KzFMbGplNzh0VldLbEhuRm1yTGR6amNS?=
 =?utf-8?B?a3pidVVYaWxER2dCZWJFUDlRbUNYaHlha0xCOXJaWkFTNW9ncHF5L3VPZnZH?=
 =?utf-8?B?bFNwUmJaa2pTTlFYdjFWbzVkUGF0QjRWV05tbTRWU0xMK29HQ2lsQ3g3MDZP?=
 =?utf-8?B?OThWWlU2UENVYlpIeUUwTEk2OE80VUlCeEt5Z1NDQWVFbmVzTTRRZm9SRVJk?=
 =?utf-8?B?TmVSUjA4VWdJeGdEdkp0RHFrK3Y0dU02L1UzS2VWaDk3aERQQWRRaEltMFh5?=
 =?utf-8?B?RkVSSkU3dWhsY0VyU0JnaVorcTQ5WUwxcHJaOVZQY2RaMU1yV1pLRm1KNGtB?=
 =?utf-8?B?TzE2Y2dHV0FHRnhzREcvSUNjQ1dhOG8yejVmcC9Fa0pGS3NtTjhNMHV1aWpy?=
 =?utf-8?B?SThNUjhFU0ROakFMcUdnMGZ2ZHVIVlZoR2RSRzE0elg0c0ZrSUJRaUgwY0h1?=
 =?utf-8?B?aXhhV1lkWVBZa0hUSW5mTEZMSjhlS1phRFZadmdIZzFPRUdscm5BN1FoSGVj?=
 =?utf-8?B?dXZpeXVwUGJFaHZJWjB3a2RFSU0yeE4vSnVJUENkS3Q2UVhlY0Y4MjQyajZ5?=
 =?utf-8?B?enBQTmJydC9yRUZHWGw4TzdtelU0ZDFIVDRnTnZRQzRNZXV3dlZTV0xUSFlL?=
 =?utf-8?B?U1hxQUpkR2FHbkluVTZDdk1rUUYrOVhWQVdOcTcwWHV2UWhFb2d6bFVZRVBI?=
 =?utf-8?Q?YLgzaU7XrlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVN3Y1MvVTBabDFoNEZ1djgxUlE5UExBOE5ZeXVOcFZUcG9MSTdsZzR3TXVn?=
 =?utf-8?B?V2g3a2Z3SHVkNythTzZDSnpEZjNjUWNCak4yWUg3VjdwTWlrdDVGeGVHYk53?=
 =?utf-8?B?QTFGRG1VS09aWXZRZTdaQlYxL0dWdkxRY3NQc1FxM084WTFFVjg4bUkzMHZW?=
 =?utf-8?B?d0lqaEdGcWRwaVFwenZDMUJzeWhKL0NnSVJOU2NFSFl2eXJCeHJPV043NEda?=
 =?utf-8?B?TkJwNExZQisrS0cwZC9XZ2lvV0I5MXhHRElDQlRibEFPZG5mV3VMbzdRUTdT?=
 =?utf-8?B?bGNsWkgraXZKTWl6N0QyT05aZ1JBMmxWRUw4NGo3Q3NkaUNidXJVc3NHNG05?=
 =?utf-8?B?b0J0ZFJDOVBYdU13TTlDK3lQdDAzTW1mTk9sdlJwbXN3WjZGTHQ4ZzdFMnU3?=
 =?utf-8?B?KzdDZDBmOVZIWk9Sb0sxNk1xR1BiWXB4NTBWL0hIMmdBbEpiNU9LMzZNaTAy?=
 =?utf-8?B?ditzWTM0WlB6UUJWbjRnL1ZYNVFzTWpaSXN6OTI5UVp0T2g1a1pyaytjcU5E?=
 =?utf-8?B?QlBrK20zUUxtVERZWlRLdWlMVHNuazdONnFSNjJqcFU4cHBDREZiWlVCc2dq?=
 =?utf-8?B?ZUZFVEZVOWxPVWwvVVhDdlRCcjV4dFYxSXQ2dHhTbXN2WWtIMitTMTFpYXFI?=
 =?utf-8?B?KzltY3d2QXFSajZhVlMwQUN3RDRSL2t4aDBKUkdvcjRsWGV3S21WRE9Nc0hr?=
 =?utf-8?B?amlqVndMcHNMem13NFoxSzQySHNIbzJ3cURqbi9QYU1vNVNtWXFZdVVMVTFw?=
 =?utf-8?B?RkxVTzlSQW45TThHVTB5VGFzQzhrY3JUSi9KZ1pVNmNwR1RkeExvZVNYM3NL?=
 =?utf-8?B?dGMxMWhuNFJkaFpUdUhHTlp3SVdSaFM1TGtRYkJ1VCtNQUpTZEdoVzhuWTNE?=
 =?utf-8?B?bE1zYVhyY2c3d3ZadDh4eGV3M095SkFwN2dza0pINVZpRU55L0g1cGtlVmRP?=
 =?utf-8?B?b1BNSE1sbGVDZUZNYklidUJwVVNGOHNvUzUrZGRvOTV6VUdxdWhnaWE0OXdx?=
 =?utf-8?B?S0xkL2hOQTdWTjNhYjJsLzM4TTJEaG5la0JndjZRVGRlZ0xXNXFGWExuaUx4?=
 =?utf-8?B?VHA0cEtNd2VNQXNGa0JTSllIc1A0TGwzSlIxMFlEejR4cHRoa3RvZU45aXpH?=
 =?utf-8?B?MkFsZG9IcUxDWUVqL1kxcHdNR1BvMkx3cWtrNWdOTWkzWWx3eUhDTkwvdmtk?=
 =?utf-8?B?bEVJazlka2tOdXFuTzExbEFaazRLb0ZBVDZXSGx1OXdiY2d1YU9mSXcwOGRE?=
 =?utf-8?B?ckxpWHRZWFAvTjRJVEpOb1gvU2VFeDc5MDVBdU02aHkwZmxEK204SWpMbCsw?=
 =?utf-8?B?OXhGd004cHZZdllBWTVZR3d5RGkxNHgvMTdUZlc0U0dYcGU0SVBUdUttcERx?=
 =?utf-8?B?WXlWQzI1d3RuUVhYMEFKUGpzUmRuNGhZWWF3T2VXNEc3SjN1UW9qSFh6K2dU?=
 =?utf-8?B?dVA4UGljeUZVMFZhdG4rV1FPRVg3WTRaWlJXTFVlaG9TNWtZQlBGUHZLckFC?=
 =?utf-8?B?S3VBSkRkK1Job0ZOWVRFUUhkSFhNZzZIMlVJZ25YcS9SdmFkcy9IZndCblBR?=
 =?utf-8?B?K2k5UXZMMm5menVaaGZ5WHFhRjRzM3FLL3ZoUDhkUVRWaExTY3RCL3FESDM5?=
 =?utf-8?B?dDJ6elREeHd3MUJZU3RmRVNDeEgzOXZsN0h1bGdSTHV5TUFPdmw5RVk3Vjd5?=
 =?utf-8?B?eUM2dlYvNjFiZnQrQytpQlo5TSsxOTZ6cnFDcXRFdWFiVW5jSU9nOHpuZDY0?=
 =?utf-8?B?VVI1RHpvNHFOaVpMV1U0SDV6SXdTQTVxVGcyeFlJL1RtTjhTMmNMZzQ1YUhL?=
 =?utf-8?B?bGpabUJsWnRldlBYdW9PU1FQOUQvc0FTRXhndTg2ZUZHelF0RDlwMDdHaDhs?=
 =?utf-8?B?YTJvZ1JJWGExblM4MjZMN3ZnR0Y4RmpUMGUwRGg5RUF5eDJLRzZxVklyL2lt?=
 =?utf-8?B?RjMxQmE5STZ5a0NJSEhTZXpTd0ZTSU5ub2xpNC9KbTJ2WFJrYy9Nd0tJMU5k?=
 =?utf-8?B?dTEvQVY4TGxJUElJcVpMQ2tOaFhXbHBJZjdUZGFhS1hhdi9ZVnlSeGdGRXRt?=
 =?utf-8?B?YjV2K082ampWdzlYQUtTbGV3SUZ2VmpPSWlVek5IRThESDhJbVZxK3FmT3Fl?=
 =?utf-8?Q?e/0JsAqrWijHIalhF3iFvtzrq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55302caf-96f2-43c7-dbfd-08dd93da4e05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 17:59:57.9194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i9vgqcBpAiefOnRdQTueEQJGp4WhcFyV0qRuWDTfjmoPnZUsdxi2mqY5pCSJsEgDiXue+WfJLTXtlgi7puUEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

Hi Steven,

thanks for the bisect.

In order to avoid display artifacts (especially for HDR) we had to
allow higher bit depth color output on the wire. The driver should
fallback to a lower resolution as needed but looks like there's a
bug with this particular TV. Are you able to share the specific
TV model? We haven't seen this bug in internal testing but if we
know which device shows the issue we might be able to find one
for testing.

It would probably be good if we had a module parameter to force
limit the output bpc in order to unblock users (like you) that see
issues.

Harry

On 2025-05-15 12:16, Alex Deucher wrote:
> + Harry
> 
> On Thu, May 15, 2025 at 12:11 PM Steven J Abner <pheonix.sja@att.net> wrote:
>>
>> On Mon, May 12 2025 at 08:10:40 PM +0000, Alex Deucher
>> <alexdeucher@gmail.com> wrote:
>>> See:
>>> https://docs.kernel.org/admin-guide/bug-bisect.html
>>> ... identify the exact commit which broke caused your issue.
>>
>>  One heck of a journey! But tested the solution on the first broken
>> kernel 6.3. Too chicken to force revert attempts of 6.12 and 6.6 since
>> I really didn't understand why revert spewed out 'nah-ah' for a one
>> liner. 6.3 passed simple test of no blackouts for 8 in a row boots.
>>  Firstly let me qualify the revert, cause it's how i got it to work:
>> git show c76e483cd9163138e8fc44d829c986819f072d4f | patch --fuzz=999
>> -p1 -R
>>  It seems simple enough of code which appears to set 8 bits of color
>> for rgb as maximum, but with struct changes and me having a
>> 'historical' processor :) didn't want to have a non-expert speak that
>> this is the full solution.
>>  Also note that I didn't 100% follow the bug-bisect guide as mine was
>> apparently a unique situation where it had to first learn to connect to
>> the internet and I don't use intrd images among other oddities. Also
>> did this from last working kernel (6.2.16) to verify it was the last.
>> PS had to patch amdgpu Makefile to allow the 6.2 series to compile with
>> new gcc (-Wno-error).
>>  If need other info or need me to test actual patched 'upstream'
>> kernel, I'm here.
>> Thank you!
>> Steve
>>
>>

