Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QArPJ0i+oGkDmQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:42:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B43D1AFF41
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC47010E9DC;
	Thu, 26 Feb 2026 21:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GY+BN0JB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A310E9DC;
 Thu, 26 Feb 2026 21:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6qzhaVYSgk29phNT1luIfMTQgzi6zVaRbn1egf6HLWbH9/tOEv0dlZzNZnWJ6whvUc0ckIrCh9GbB/mhrFXuTGEzJR61YqxTU7ZUmrz/Kh/1jz3mq0WNv5WFmutwkO0jITaczNQtNt/+X1Dy9iBd9LERMZEEyV27HJFKvLwt5DOlCSn+r0b8aiorSaF+AN/70cdMzfdbbQvtaPGsM4ISzt6+dnMrnYG869sJ4bPZsWrOdsBrQE4mAG1Y7NAD3mDOw0urf+TX3M1gsfVlpVK1wnaw/+a/7LGpfFPs3SGLHbw1lyAtlMBTpCb513GP0lci7FjB86+yZYtYJLA6fXPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KYm4ebBoksMpM4lfq6kefecUbVPORV6wcmKADp3RqE=;
 b=RfLEwJXPbOxN3eDR4pLWa8AwfXjm/axcSAVCoSNdqnap9monprDeju8BWSqof6AXNNbkXoCvlFP9LBZTf6b2mdeBTLhBv0c6NDnckp+4uKlNGNfu2E8oDpyhZrXSU6LIAVkPXTc2WuJl8PtDjKjMgrgrmV+sfCjfQBt3RJsUr+cwXKplsMtHYYpAMvWG23iULEmZ+2eXMNNQxLsPEeNe7fTVVLRIDeTpFNiuRIEPTYOUDMU3ZEfRtyeCXhV1b+UGVkW2+OM8uQv1aslqHuKWDISOU8Az2hCz6t+4+w6IzSvHEBuajVR56ZuVFL06mYkCo+QvlXwN83h8RNK4jh8LyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KYm4ebBoksMpM4lfq6kefecUbVPORV6wcmKADp3RqE=;
 b=GY+BN0JBxX0y/OVaCAuqg3vwZ2bKxM4hPCAszWooQ5J8331jWXj9/pk750RTSJJ97k4GN0idLLvL6i3FgOZ2jQRzCx/+8oZCtU3tayDEICyv+LXucHVKmNVI3RVV5av3OL3RyexST/Bf5d0BErsFyXBvLFkQlle73J7QyK/fUj1HQHZ95TlowUXms/DDjTxRVnot2pTNi+Xeci+pNvsv4BX6pUnNKsVXO4my2AVCCjNq18yfBdWl5i98SKGRUyScZROUh8NgULYV8PTYcJ13pL7yeFDULxM+hP1T509SOsLDYb0wkn6UaCTjDqk9p52amN4QMIC9NvxqvP4JHgSVLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 21:42:15 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:42:15 +0000
Message-ID: <3161a017-a9f8-465c-b4dd-fef085d75b98@nvidia.com>
Date: Thu, 26 Feb 2026 16:42:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
 <eff888d1-2caa-45bd-a611-e5772ee94e1b@nvidia.com>
 <DGOJDXWDOJD0.2J6NENL44SQJJ@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGOJDXWDOJD0.2J6NENL44SQJJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:208:160::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f910d6-5a09-470a-cea3-08de757fe867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: NSTo+07b5mMuu7NPp5XLuJCbMQ+IHTsBJH6eebjyWFFkM2u7+jq8hocUCghOFZkgQ51hS7qrWxNyEUOyBgqfiSCAlbTJkLaT2+QtSc5ViV8hKEHdZytVQTo/3oL26wFPK64KWFtqo8BaiQguiGVqSrkzsHS1S6tzp6M/NN8XlfHGEywTzYZC8LMN1knO8+1ntNesQs8A9flkc92UpK3WQRlu1wpwLVUceH2UfiYORPK/dgQ2CpOUC+NnvOpRaP0Z7izEtp2Mkg37/XAv8q5UzVyNGM//QygZaRcAk3/mfDZQTpTCYCqaTTFvwH/35v+iRablSuAm+dZRtS51tn13pOtlmBr+vtjw8mMk/qhJ3NqMgVjhdg4xjuwmwBb+YDott8r0t7c4wr+ENLUG5FCEQ915yVkjcGhNJApRJGtBCUw0Pz3q08QWwAaQeXj0b2WzyQW3FtGOkow05pZc0XaowLK9N31cVjYJB5clkT8iM0w/dJ24f8cXcXnF++hw1W94x+NYsV4/DhBtpqoI3YLigedJ0Sd0iDYiYEcQSxlXXD2DNV534wAvfa7OtoEtTwOhRFiULJLorBx6EmbSY/0dYz4Oiq1rpK0XsEPW9MsRAynk9O9jRpv1YrMjDL9avk+m0fD86AU8Tr7qZifDG3NGyhGbHXtATUwZhhR0v+CO7Wq5RrDd+XhXh+0nT67hcWkBjplzhH3r4DssYeSKdwmES8PKBYGYjiN4coANYCagokw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lGR1Rkc01TYXpQVjhHbkJHaGR5ZE5tN29PT1BEUDBFTWFYZnNmeVlEN1NW?=
 =?utf-8?B?SWdQVjBuQVkxMWNCVTFkbVRnc0xtMGp4WWRYRGNrblZSenF4eVFaYjlYc1ln?=
 =?utf-8?B?TUQvQXhQK1cyTC85YnU1VXBIMzFKVGNmckZJRVo2bTNQY0hmY3NIeWU3Ui9p?=
 =?utf-8?B?d2kwU3FnQnVaRTNjSzB1NmREemVuOVEvdXBHTFg3UGowTDBubUtueklnWWFs?=
 =?utf-8?B?azdhbE5VZ1JnU0ZyNVFSWW96UHpMSjhCbWF2dnVHdllFbXE0OGk1cUlFNXE3?=
 =?utf-8?B?NlBrdGJoYndLbCtZcTZ6Qi9DdnlqRzJrUnE0MFovbDlaZVFRLzBuK1BaTVJl?=
 =?utf-8?B?Z1VwejBabmlPa1JVS1lnb0ZSR21aNWNWYUVtc043b05jclhqSmtWZnpLeEtw?=
 =?utf-8?B?emZoOHBhQmFtT2lGQXNZUlpjQWZDb0pyd3lVNmVhcEhPcy9keFFVM1BpNWhk?=
 =?utf-8?B?dnB3SUY4ck8wZjgwNTNKRVJmLzVCakVlWFZLekJrQzMvNVBLbWZIL1NUREwx?=
 =?utf-8?B?OHc3dTNEUHFWblBzdUNJbmJMbUY1b3ZydGtVOERac3k3RlB3VE55Q2JEOHlE?=
 =?utf-8?B?NTdmQnlLQ3V2SXo4cXhoeVdURnVaOFBHVm5tOEkrYm9pTkdDQ2JFbDRMV2x1?=
 =?utf-8?B?MXIrYjh5OXBlc21UR25VSEVyUjlSeURQQXQ4alVYUHp2aVE1MmZkUkdXV1R5?=
 =?utf-8?B?Snhod1FkUGxMYjcwSTIxMFF3a1BUci83NnZON2JmNVpRS201TlhlUWFtVVVY?=
 =?utf-8?B?L2ZTd211elJhNVdRRnorL2MzNmptcHhjSjdIZnZXSWFCZGc4WTR4MGYrcmN0?=
 =?utf-8?B?N0kxdk1pQ2xjL2J6dTJzZnA1eElPbzN4RTJxOFVWSXg5OEhGZ3B0MWxVSml1?=
 =?utf-8?B?QWVGVGw5L0p6SFlvaUcwZkRXK2NKcklCY1Z2Rk4zVW5mYk5YMHZ3Tk9JM0F1?=
 =?utf-8?B?NzcxVVR4c2tUbzYydUo0R1NiOENmZG94ajdmTjBPaFhNODdDVGl6dFZqK1VW?=
 =?utf-8?B?T29HaUhoblFQTER5YWh1cGtOYTRDR3NsMnl0b1hUTE1PMUYxbkFJQ0lkUTlJ?=
 =?utf-8?B?cnFrQ1JUVE5wd0xDN3Fkd2pNeEJFRGVmeGlvaDUyTjBKbGU3R3J3NW5oMGJa?=
 =?utf-8?B?aDZuMHlyOUt2NkQrQjltR3UzZERselNFbmJFZHAwMnJGdDI5T3E2VUh5Nlpi?=
 =?utf-8?B?SmpGaGtNV1M3SWZNNStTZmhOc0pTSGdwdm10OHcrbnVKcjg1dWt6RFRiVVZ6?=
 =?utf-8?B?Mmx3N3JoeWhSOFArU1cvSFlqc3FwUHJER0NPeGt6aXdWcGNGanJ6dWlDQW1t?=
 =?utf-8?B?aDZWQWx0VklaNGtUbW9JY3krQzh0VzRqSkZoNks5c2dpRmpXNWtkVk1jR3hM?=
 =?utf-8?B?ZUUwN1FQcG5qMG8yd3pETzR5Uk5hc0VJNFZlbWZ4NXBjbUtZc0ZaaUNaSFox?=
 =?utf-8?B?a25QTDM4UGdya0JKMmoyZllzSFBnRzhlTEVqOWNjSzNRUE1QSkhObDJ5Qk5i?=
 =?utf-8?B?bmRoU0dkUFJjYWZUVFhtM0U0Qlo1cGNmcWRVR0pMbnNYOWthTXlrTEtMakF5?=
 =?utf-8?B?Q2Q2TmE3V1pPaG9TdlVSUjBvTWFnWlF1QUNaUTF4S28xODVTM0hGSEp4K2ZH?=
 =?utf-8?B?dk5uQWtVb1YrNmM2U1BGZzM1bkU4eGZOczJ5MUYxbkNnVXNLOFc0b3k5QjRr?=
 =?utf-8?B?M0x0NjYvN3E4QllHUVRHVWZpdldlSTA1THhEdnlocnVLd2tNNWtXVXVVdVd6?=
 =?utf-8?B?RFhCaDY1dDhPZ1NrbDdJaFIxNXFFTm5hYjFjK1NEMDBkMTVKT2tzSFh0eWU5?=
 =?utf-8?B?N3kwSDkzTFJjSXo5WVNENUZjQVpiOGRzSmhjSEJDVGpTRHRQSEMzYzBrc2J1?=
 =?utf-8?B?dFd6OHNoRDZ1NFFwS3Z4dWJSckRJa2pRRThwb0k1ZElacTBDajhwZjdGdmRj?=
 =?utf-8?B?YWhmdUlDQ2xIYXZoTXBENXhUNnMvK1NLcHRkalAyRWtWVk1yV1lzZDVhMmgy?=
 =?utf-8?B?Z0NGVFhQVkhXRnpzRGtHeXlZMGNFc1dmS2ZrdTlUM2JpcTVSUzcrZ05qZVVl?=
 =?utf-8?B?Z0IrQmloRmlYb0piaENURXZqckRBUFFTdlZJSFh6dkRiVitRYk4rOGN0eExm?=
 =?utf-8?B?a1Azb0twMnhKQVB2TTRYZ1pzYndCTmRDekFvNDFrRzRXRk5PVm9CdUx0MXp5?=
 =?utf-8?B?bGdGSWw5ZUg3aXI5ZVN1a2l2b0pROXAwQXNiL2djTTVkS3JxQ09QaFFXREdX?=
 =?utf-8?B?MDVPQXArODNPQWZwMUcyMGt1VlhxZnZINzlxUXcybXJyQXN3QlpZQTVRQith?=
 =?utf-8?B?TmVnNmxhOHZrYW1xbFEzSjFQT0hNWXdyc2NQVE4vY3JGNVJOaFlLQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f910d6-5a09-470a-cea3-08de757fe867
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:42:15.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d//WIIiwhtd+ymjh+HfGbpZkB4Nhu+gRYxzOu5N1XErzcm20snRMkAEx65u9NGV6+Gh2/srpjLHqsMnpINIcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0B43D1AFF41
X-Rspamd-Action: no action



On 2/25/2026 9:26 PM, Alexandre Courbot wrote:
> On Thu Feb 26, 2026 at 5:41 AM JST, Joel Fernandes wrote:
>>> This structure doesn't seem to be useful. I would understand using one
>>> if `GpuBuddyParams` had lots of members, some of which have a sensible
>>> default value - then we could implement `Default` and let users fill in
>>> the parameters they need.
>>>
>>> But this structure has no constructor of any sort, requiring users to
>>> fill its 3 members manually - which is actually heavier than having 3
>>> parameters to `GpuBuddy::new`. It is even deconstructed in
>>> `GpuBuddyInner` to store its members as 3 different fields! So let's
>>> skip it.
>>
>> I'd prefer to keep the struct -- all three parameters are `u64`, so
>> positional arguments would be easy to silently misorder. The struct
>> also makes call sites more readable since Rust has no named function call
>> parameters.
> 
> Fair point about the 3 parameters being easily confused. If you keep it,
> can you also store it in `GpuBuddyInner` instead of deconstructing it
> into 3 members?

Done, good idea.

> 
>>
>>>> +pub struct GpuBuddyAllocParams {
>>>
>>> This one also feels like it could be rustified some more.
>>>
>>> By this I mean that it e.g. allows the user to specify a range even if
>>> `RANGE_ALLOCATION` is not set. A C API rejects invalid combinations at
>>> runtime. A Rust API should make it impossible to even express them.
>>>
>>> [...]
>>>
>>> That would turn `alloc_blocks` into something like:
>>>
>>>   `fn alloc_blocks(&self, alloc: AllocType, size: u64, min_block_size: Alignment, flags: AllocBlocksFlags)`
>>
>> The C API supports combining allocation modes with modifiers (e.g.
>> RANGE+CLEAR, TOPDOWN+CLEAR), so modeling the mode as a
>> mutually-exclusive enum would lose valid combinations. More importantly,
> 
> What I suggested does allow you to combine allocation modes with
> modifiers. I should have pasted a bit of code for clarity, so here goes:
> 
>     #[derive(Copy, Clone, Debug, PartialEq, Eq)]
>     pub enum GpuBuddyAllocMode {
>         Simple,
>         Range { start: u64, end: u64 },
>         TopDown,
>     }
> 
>     impl GpuBuddyAllocMode {
>         // Returns the flag corresponding to the allocation mode.
>         //
>         // Intentionally private - for internal use.
>         fn into_flags(self) -> usize {
>             match self {
>                 Self::Simple => 0,
>                 Self::Range { .. } => bindings::GPU_BUDDY_RANGE_ALLOCATION,
>                 Self::TopDown => bindings::GPU_BUDDY_TOPDOWN_ALLOCATION,
>             }
>         }
>     }

I took this bit from  yours(more comments below).
> 
>     impl_flags!(
>         #[derive(Copy, Clone, PartialEq, Eq, Default)]
>         pub struct GpuBuddyAllocFlags(u32);
> 
>         #[derive(Copy, Clone, PartialEq, Eq)]
>         pub enum GpuBuddyAllocFlag {
>             Contiguous = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION as u32,
>             Clear = bindings::GPU_BUDDY_CLEAR_ALLOCATION as u32,
>             TrimDisable = bindings::GPU_BUDDY_TRIM_DISABLE as u32,
>         }
>     );
> 
>     pub struct GpuBuddyAllocParams {
>         mode: GpuBuddyAllocMode,
>         size: u64,
>         min_block_size: u64,
>         flags: GpuBuddyAllocFlags,
>     }
> 
I took this bit from  yours(more comments below).

> Now instead of doing something like:
> 
>     let params = GpuBuddyAllocParams {
>         start_range_address: 0,
>         end_range_address: 0,
>         size: SZ_16M as u64,
>         min_block_size: SZ_16M as u64,
>         buddy_flags: BuddyFlag::TopdownAllocation.into(),
>     };
> 
> You would have:
> 
>     let params = GpuBuddyAllocParams {
>         // No unneeded `start_range` and `end_range`!
>         mode: GpuBuddyAllocMode::TopDown,
>         size: SZ_16M as u64,
>         min_block_size: SZ_16M as u64,
>         flags: Default::default(),
>     };
> 
I took this bit from  yours(more comments below).

> And for a cleared range allocation:
> 
>     let params = GpuBuddyAllocParams {
>         mode: GpuBuddyAllocMode::Range {
>             start: 0,
>             end: SZ_16M as u64,
>         },
>         size: SZ_16M as u64,
>         min_block_size: SZ_16M as u64,
>         flags: GpuBuddyAllocFlag::Clear,
>     };
> 
> Actually the parameters are now distinct enough that you don't need a
> type to prevent confusion. A block allocation now just reads like a nice
> sentence:
> 
>     buddy.alloc_blocks(
>         GpuBuddyAllocMode::Range {
>             start: 0,
>             end: SZ_16M,
>         },
>         SZ_16M,
>         // `min_block_size` should be an `Alignment`, the C API even
>         // returns an error if it is not a power of 2.
>         Alignment::new::<SZ_16M>(),
>         GpuBuddyAllocFlag::Clear,
>     )?;

Makes sense, this is indeed better, I'll do it this way.

> 
> And the job of `alloc_blocks` is also simplified:
> 
>     let (start, end) = match mode {
>         GpuBuddyAllocMode::Range { start, end } => (start, end),
>         _ => (0, 0),
>     };
>     let flags = mode.into_flags() | u32::from(flags) as usize;
>     // ... and just invoke the C API with these parameters.
> 
>> if the C allocator evolves its flag semantics (new combinations become
>> valid, or existing constraints change), an enum on the Rust side would
>> break. It's simpler and more maintainable to pass combinable flags and
>> let the C allocator validate -- which it already does. The switch to
>> `impl_flags!` will work for us without over-constraining.
> 
> The evolution you describe is speculative and unlikely to happen as it
> would break all C users just the same. And if the C API adds new flags
> or allocation modes, we will have to update the Rust abstraction either
> way.

How/why would it break C users? Currently top down + range is silently ignored,
implementing it is unlikely to break them.

I also wouldn't call it speculative: top-down within a range is a natural
feature the C allocator could add right? By modeling modes as a mutually
exclusive enum, we're disallowing a flag combination that could become
valid in the future. That's fine for now, but something to keep in mind as we
choose this design. We could add a new RangeTopDown mode variant in the future,
though. That said, I've made the switch to the enum as
you suggested since it is cleaner code! And is more Rust-like as you pointed.

> 
> Rust abstractions should model the C API correctly. By hardening the way
> the C API can be used and stripping out invalid uses, we save headaches
> to users of the API who don't need to worry about whether the flag they
> pass will result in an error or simply be ignored, and we also save
> maintainer time who don't have to explain the intricacies of their APIs
> to confused users. :)
> 

Sure, no argument on that one. ;-)

[...]
>>>> +    base_offset: u64,
>>>
>>> This does not appear to be used in the C API - does it belong here? It
>>> looks like an additional convenience, but I'm not convinced that's the
>>> role of this type to provide this. But if it really is needed by all
>>> users (guess I'll find out after looking the Nova code :)), then keeping
>>> it is fair I guess.
>>
>> Yes, `base_offset` is needed by nova-core. The GPU's usable VRAM
>> starts at `usable_vram_start` from the GSP firmware parameters:
>>
>>     GpuBuddyParams {
>>         base_offset: params.usable_vram_start,
>>         physical_memory_size: params.usable_vram_size,
>>         chunk_size: SZ_4K.into_safe_cast(),
>>     }
>>
>> `AllocatedBlock::offset()` then adds `base_offset` to return absolute
>> VRAM addresses, so callers don't need to track the offset themselves.
> 
> Sounds fair, I'll check how this is used in Nova.
> 
> Ah, another thing I've noticed while writing the example above:
> 
>> +#[pinned_drop]
>> +impl PinnedDrop for AllocatedBlocks {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        let guard = self.buddy.lock();
>> +
>> +        // SAFETY:
>> +        // - list is valid per the type's invariants.
>> +        // - guard provides exclusive access to the allocator.
>> +        // CAST: BuddyFlags were validated to fit in u32 at construction.
>> +        unsafe {
>> +            bindings::gpu_buddy_free_list(
>> +                guard.as_raw(),
>> +                self.list.as_raw(),
>> +                self.flags.as_raw() as u32,
> 
> `gpu_buddy_free_list` only expects the `CLEARED` flag - actually it
> silently masks other flags. So you probably want to just pass `0` here -
> adding a `Cleared` field to `GpuBuddyAllocFlag` would also do the trick,
> but it looks risky to me as it relies on the promise that the user has
> cleared the buffer, which is not something we can guarantee. So I don't
> think we can support this safely.
> 
> If you just pass `0`, then the `flags` member of `AllocatedBlocks`
> becomes unused and you can just drop it.

Good catch, done!

> 
> And another small one - some methods of `Block` are `pub(crate)` - I
> believe they should either be `pub` or kept private.

Changed to pub. thanks,

-- 
Joel Fernandes

