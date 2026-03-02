Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDdmL3KLpWk4DgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:06:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4141D975D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801C10E284;
	Mon,  2 Mar 2026 13:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OcwldoYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA49F10E284;
 Mon,  2 Mar 2026 13:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwxsDKtkzqVIkZdJUHa58ayz9qfdMnWFdKsUFVFzFXBKhUe4XB+VBMR7J1v2/ewqyeKkMRDfkak5pIyxTTxXLO8YPrChzjt7/DoPcURo/rj4N/rDTyTMoLs84/7GyXeEH6zQMEO5gVUcghEpv1JOioB33DuM90cqd3hv1yCfyaTAiVo4O2uThx7qTQHLMe0iLBA8GgQFYnrHlxZc9xKMQUoa6/Iv5AWQU5C2mFEnf1CZL5nwaUtJ8V3HxTLvDTfxZiUJsPlSLDsAv+LBRdXoafHwdu/ccWjFSrxVk24+RlMqJXGOOk/fa0WkHMhhwE11NMQIoUGEYx3WmhwhHfli/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukj7xoUgiRyquhN8E8I9t8EiEPPLUmzmb/yqJbrl/DE=;
 b=bCHqe6Cfx4uxn54LpQZV1B/Em20IhtvWAOciCmmubUwMYSyLaIPZhC4DG88j77bYMJag+CWRqZOPuwFkgQJ9ZLu3z6zH6L0uJ7OOZNOX5CMC804E4AfXagypnjK/X2V8UxtXGMaGmIscG8H1WbH+SKwdqyrn631Tj4wIhnC1NdEi4IMxiQQYbMRRLKYMglHyZBir8uPgxvn7S6Oc2KK0YU4brT5xoX2OoQBhTtXK3iJrHDLwZ61fj1JQeEpA1ciTAnlgupDtbIFLAQ70MkIC7EGMO149bKntXn1B9jTAbD+e2piMY7v5dCQ7TjZOG3FpukgAv7ECtXruZiQvdijbkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukj7xoUgiRyquhN8E8I9t8EiEPPLUmzmb/yqJbrl/DE=;
 b=OcwldoYVZL8qbld/cOTQnSXQKefM8aGU8Tfw49zzgHiOvi2l+eBv5+6BRE+ldgzFUYBC41FjoK3pVMW3n4c3cuuJXyY3YohAAefJdt5UWzJzkF5auN8gzkQq4mGJ6QHI0UEFRySZe8qsGMxTKmqew3Sbt5reOWnjuu88FRH39ReGBsdgfmSE+5ySWaLB17vKipFExl7r7FwAbVjMHeOTcOd33IhT0OKTVmDOG1sxxv9iJHvYx8XY/slPcAt/oQW0y+QnQAoztOTgsjejt+Q6z6o3yXPKPf2KxVCIZrJrgdPMT1bLBpkLyNnxUvrG0g0lrseniCyCldVE5DUlSwRteA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:06:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:06:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 22:06:41 +0900
Message-Id: <DGSBHXT0W3VH.3S2OI2EAG2BP0@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-8-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-8-c011f15aad58@nvidia.com>
X-ClientProxiedBy: TY4P301CA0123.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b8f112-ff35-48c8-4419-08de785c8f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: bZjNiH22hrRrvcyGtRF0dyQUNoQBHDMEJ+ObwKQGYIiVkNM6flI/EpfdtEPBRPXog8+VhP1vilFnpWJ0AZeoh0NCX1f8l1JMxvw85uhB2/HTlrENOOTbnCSXMiOpRtQez8Y3F2ok7S8WM2mdlD6E6S4lC3aTIqHGgwERqgyDw8El/pt7SS1kyIe7FE5Etv+RXSu1P9vU3sWYFWRBB0K2GeydMtHsR7gp39SEW2HglGSpDe9xHHVwjmPL/thmspJ/LhTwSBCyPze0Lp31jm5HaGVGNs8X8ovowp+3Tykyr77hPrRgL0ghasjuRjjzqty5bT62Gxcakx801nBnhl3fgStQKCpw+2cp8NGHAJtcksDYOTeZcYrtGNQDwcd3cDpmbNNF9JtifanwW8pvf0G3uD8k3b/kHRK1HwvnF7oufXsZuWaqZbhgk2vqZFoZpi5wglLTpCcLmTHvc72t9VW8nnTDjlZKtgyNfqEWYTU+e6BPv7WoK7KoQ2ZruXfPPQQpSf9F0meXVBKLa5xVrfkDAVZnms0wEZ0VYZNcMVss2yFzJUG+xmXqcaw+/2tvIotl6vsQjfx8GGnsBHup2+Ov25M1GzZl48YssTCwuCUMifE9z9aWK5d75K41Ue26tJqesoNBCJ93SHljpOVEdVV/o2PlnrqJAWiw3oGh2KGixrnRtiVr8+logeGUW/YAiaphB/hBD4MBjS6ICHVlG7bxdrOOciS1+yKMvz81RS2mIUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtvc3pGM0lSRzFWZThtdXRyU082TTlvU2w0UTdja1lCb0dIVU0zMVpURG0w?=
 =?utf-8?B?Mm5RaGhkTTQrdXBwZWlDK3hLaVVtL3Y2LzgybWgwK29Vb0ZBbHM1YmVwZll1?=
 =?utf-8?B?UHlUVTVib3h6QW5YSi93ZEhmeHNaazFsS0lidkkvWkdzdytkd1hjeUNLTDJ0?=
 =?utf-8?B?aldNUFl6cTdYSHA3S3RhTDhReWN3VWsxQi9Tc2pzUXBFM1NGd2VHT21RK3pR?=
 =?utf-8?B?UHZKRlFlbXlvREJzL0x0dWtDUnNieDQxQ01iMktMN3VEZUhMSlJTanErVk1r?=
 =?utf-8?B?N0haeloxUXdVcVZ5NTF0YkxHZDlCekJxMi9RMlI0aUVhRk9mZldoTC9HMUhY?=
 =?utf-8?B?MC85Y3pQc21UN1ErY3lMM1UvTFJNYVNMY2JNMy9GWmVLODdMbkRzRzRKN0pu?=
 =?utf-8?B?eUVSb3lFZWgyWFhlbVpTZEJhanpKa3gyVERpazM1VUFDZmNlOUcvTE0xRXdp?=
 =?utf-8?B?Y2NmT053ZHFIV2Z4QXJUUnpPcytKaEVaUHVjbXBRYzgwUXE0eWhqdXV1c1Rt?=
 =?utf-8?B?a2Y2SjZvcHJMS3RpY3hHeXY1aDZWQkptYk0wRWF2QkgxeW1hbVlwUTYzam9j?=
 =?utf-8?B?NWJrb3dOU28xZWF0QlFLbDVJZzhDWUpEZFpEMnI5TVVqdkkyOGdzQUQ1em9v?=
 =?utf-8?B?ekRnTWVHaWFjZm1DUkdTd21ETUZvZ0YybUtMK0VNbFZ0dERHQ1pwR0RwQy8v?=
 =?utf-8?B?ZEk4SHFvRVJhRS9wSzRibDFQbldJKzlya0JXMEU2MmllZFAwdEM1M04zQ01s?=
 =?utf-8?B?OTdVWGpySlBYOXU2N2QyZllnOG10U0ZtZEZMSGF1WjhQK3ZFU0VtNFV4a0pk?=
 =?utf-8?B?TmZNcC91ckwzYis4YUt2OVdKV2pod3EzTWJlSmc4ZXIwYzB4V1V4MUhrWEU5?=
 =?utf-8?B?MkF2aERBTGJVbEFWVzhaTzZodTcybEZxNk4ydW1Nemw1UndzMC80TmJwd0Q3?=
 =?utf-8?B?bHZPWUlSSWNHNkx0dEF3QkJ5TEt0bEpUTGZCeFNEd2ZOMWtPdnpFT3Myaiti?=
 =?utf-8?B?bmhOTC8rU0lZNXhsVTdZYzBxMzl0U3UrV0xLTTNzQkdVQ1hFUE1lTzNwQk9H?=
 =?utf-8?B?d0ZKSGsvUUNscTlacElVcWQxcUp0U3lKQ2wxL0xPem96a0w5alRvM3BiQUxu?=
 =?utf-8?B?NkZpdnJpWFA2ZDlzYUNLTWEvWHJGZUlDVVIvY01UTDJ6YUwzOVhuUE4zNTZS?=
 =?utf-8?B?Wko2MWlpRHZSMXk2eTJScjhXNFUyM0FMaExONndzNUhOV0RJV3VIZWRBOTJn?=
 =?utf-8?B?YUJQY1pMblJabHFYdFRWOFdFVG5sZS9la2Z2SkhsZEUyOWh4M05iVXNBZ1VP?=
 =?utf-8?B?TjZuaFJsSnVQTCtuSkR2UTluUGpwalM5Q1RrOXMxMWkvTkJGOU1CODJBNU9J?=
 =?utf-8?B?ZWdENXFqQ1RPL2o3TjJpS05XaWwzNU9Qa0xSV3pONUFEakRodlkyQzl2QVBq?=
 =?utf-8?B?aGVFd25Ma2NDMU9xakdmbVAvWXFnWXI4MXhRclQ5T3FmMTRQZVlVRWVPb2kz?=
 =?utf-8?B?THNFN0ExM0FuT3FrVVpDZHRBYlVkUWFZRDA3eVpUbFJiT0hmaXZLUEJjVVJU?=
 =?utf-8?B?OXlxMTVCRG1jSmtGK3lOSlptZmtzZHZwV0EvZXlBM2ljMmZoZVFRQWg3VlJi?=
 =?utf-8?B?SE1sK3dvdHlTbWFqYk0yNXBtbWxPWE9sdWoya1hienlnb0o3Sko5S2U3a09i?=
 =?utf-8?B?TlhYZzFtNjEyZFVoNDMxQzZqQlMyS3dYYzFpOElmTk1VYXJMYmJIN3Q1ZTJp?=
 =?utf-8?B?Znh5dEJjeC9RNEU0MXFnRjFNajVCS0V0U1FlTEF5UWV1RTZmSTZycnhXSkNh?=
 =?utf-8?B?ZStNemdIclV4VzJ5VEJyQmhiS2NBRitJMXRyMnhCcSs3MjVmTk5LRE1FR0JY?=
 =?utf-8?B?UnRVb1lydnhMbUZ6djZzWThtd0U2b0ZGVU1sRlpOQk9ScWhVMkNWYzRIQjFL?=
 =?utf-8?B?Ry9jS2xsaUd2VWJLbVV1WFpPVlNaUzVudnFrQlZxYWU3a096VWE5UGhRYWdG?=
 =?utf-8?B?azh5dkZWNFAzWmVSNkFMZmFJbUdHa0ljamxPM0hKOXJkd2dLR0VuNi9mSG9J?=
 =?utf-8?B?TnZrZ3B2cFFxTjg3S1g0a0RSOENtdWp3MlU2NTBaWmJ5bXNsK3FMdGthUTZo?=
 =?utf-8?B?amRpRE52b0h0MHk0VzYzek5hOHo2eUhhUGVYRXk3Wm5tRWcwS0hub2VlUDFX?=
 =?utf-8?B?NWkweTBvRk5jakJLb0MyTHI5N1Y0TXB2dXA0VXo0TnBXQXg1T2RKL0xuWm4y?=
 =?utf-8?B?OWQya2FmZEFqYXpibVhva3VIbmZXLzZHL3htZGNEcEZZRkVOUjdQVFA5VG9Z?=
 =?utf-8?B?Y3I4NDZvYmtnZllDWWVCSWh5cWFjV2Q2VmxhU3NDN1JUSmpLKzVSc1pmSkRN?=
 =?utf-8?Q?IROuXrzk9tGNCotcBypTxAFlUf3zhvotBLN7WTVjvYwXe?=
X-MS-Exchange-AntiSpam-MessageData-1: HKqmPpDz17uXgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b8f112-ff35-48c8-4419-08de785c8f90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:06:47.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK817iog46QS+t18rCuQBsrDXAS+a2XGPAIWWXeF4vYM/tj+4+B8WzNzhm5WDASUNxS/8urcJOnATbVEcwGW1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2A4141D975D
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 8:42 PM JST, Eliot Courtney wrote:
> Splits large RPCs if necessary and sends the remaining parts using
> continuation records. RPCs that do not need continuation records
> continue to write directly into the command buffer. Ones that do write
> into a staging buffer first, so there is one copy.
>
> Continuation record for receive is not necessary to support at the
> moment because those replies do not need to be read and are currently
> drained by retrying `receive_msg` on ERANGE.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs              |   1 +
>  drivers/gpu/nova-core/gsp/cmdq.rs         |  41 +++++++-
>  drivers/gpu/nova-core/gsp/continuation.rs | 167 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/nova-core/gsp/fw.rs           |   4 +
>  4 files changed, 210 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 174feaca0a6b..ccf56f1ad246 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -16,6 +16,7 @@
> =20
>  pub(crate) mod cmdq;
>  pub(crate) mod commands;
> +mod continuation;

Looking at this series it seems more logical to have `continuation`
under `cmdq` than just `gsp`.

Nothing in `gsp` makes use of it, as it is an implementation detail of
the command queue. And that way the `pub(super)` exports would be
perfectly scoped to their user.

Re-reading my review of v3, I am the one who suggested to put it under
`gsp` - so this is my mistake.

No need to resend just for that, I can fix when applying and this should
have no impact on the patches that come above it.

Giving it a few days to gather reviews, but after a first skim this
looks ready to me.
