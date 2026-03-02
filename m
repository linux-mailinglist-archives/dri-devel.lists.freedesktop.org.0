Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOcmFEcWpWmL2QUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 05:47:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D21D2FD7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 05:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDF610E42B;
	Mon,  2 Mar 2026 04:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XAtNI8gY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD710E42B;
 Mon,  2 Mar 2026 04:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0hi5NXChh+nXfYpBvHPzquC6B0wO9oNAsAB6yvGEMfn3NxOHaGgHD4T+wlbmAjjFh6EPysHH7isKXspJ3l60CC3+JszZkJdNr2cK1Ld4iKlE6xGod/c1I6v23m+7sU1qs1Ge8ARl8AmSpMUW5QyY6/L2GGnG1RR216JCnWlToKY0rqoJETzo6CTmviGMvU/We0N+0x3V6u/WqViSNRdBeV2cpGwXgDD3EyhyebJSyK3/kNvZJEqhxLGdUeF6JjCUszN9QbpsLRciiAyokUOEdXMpcv3GTY5d+6ZL+jX4Nj61k0MCD4tjuYAsdT62ARIRxZjYFAecNCoKkEf42lplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+0v5JZh9OgKgopU+dj3FxxwKqL+bjhyFOlE6Iod+Ro=;
 b=lnJ+WK0AjQToIIm2OT8otRZgqxdMazF7rVVZm+/5XC8UuvVlMNOuSEjJSyGQB/5Wu3tNkePRU68lBkCKtk2gSZKM73yopdVgBFGZe7RTvBeBYoPyUTXkZfSvV8fSfn/6/kreVqFqC3hsojluQHQ4hdhjQeY01fm09pttAg6f3XDuSFLTpeoGSVUn4OXAKmtqyD2QwqwVqOQ1UEyCesPcfOkF+D9Y+wCmyqHWpxFW2UrAW8X1gH9nmSOI5VlAmLidYjMQ9t+9t+y8V3C2QzFX9JicZUVfxRyTWp4odRAF6SbzJJMdM6gTgFfpgvVyo7LS82v+YQoxELkE9VJGrrL4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+0v5JZh9OgKgopU+dj3FxxwKqL+bjhyFOlE6Iod+Ro=;
 b=XAtNI8gYG8iAaCmwIGK7MUf6ufpBFrBkk/hj7X5aSzeA4NJuTxA+C/VnNxrGaYyTey9AumANoS6CE8di8XV0pWxNPoJ74sJAgb6fUMMV1jdZ5dHReABCgQXgI3JbH43HWxGL5ovRgP6fyVZok2J5KzmwITjJkXZ78SJdlI+KXihup3FtJQFCMY9i+/16HyMBJKMc1S+jAq94ebXDT/I345FgfDuE6MQbVcGf2cqvSbgnWeAmr0R9q0Uy+7DgO3lkK8GA4m2gpDyMfmzNT8PUg/WVxZeByt0/JQxb6PFK+E3WoSGMzbRGc0nO8jXP1OSCzsPmLrvMUAcrGOOiKNndQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 04:46:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 04:46:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:46:49 +0900
Message-Id: <DGS0V7CAEIGT.1T3K7PSC4XRTZ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-8-572ab9916766@nvidia.com>
 <DGPPJGV28ORE.153NNIZ75WY9P@nvidia.com>
In-Reply-To: <DGPPJGV28ORE.153NNIZ75WY9P@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be2e810-0b70-4965-e860-08de7816b94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: PgxcJpoTOqmVJ8DFgsb1wM9a5FUWfYJdzoYWe6snTSWHx5edGrM029zShssJWXD2VgfSQPWXHgibd/L2+Onye+DZBGqmB+bjl8sua2TnHZkGbDHe2hXnRmPoTITc2xDSMPKEs3o8pXFQ01JDlDxbOkTecCjsKFlpHyuwKozS47BjOVMH93tDvmbHXfhARwG64IypR5du8QFcr6gl5nADsGlM3g+wtWSNup4rvPTT7TSd7gM5OKIW9HYMnrYLbfkiOFekRaS6paXh+XWUMvIyQXcnoRcq40bBDeXuOLGquzdaBvaCvyePNrUvNlTdKPexpSyfUgfCbJi9mEHT1IxSwGtm8ItXNCj+aHiALg9twql/C0xrV1gNuXXhqy1hWHckfeQRLq39UA706hAWzwJIRNlZ1O81/51YaoKX25++OjA72prXiFu3W3+i+4UKhFijvXVDZL6cdDeKGHZG/3PpDBrah7X/2ozTFpJE8wnqfruf502UctcnsaDjh5mTb/MRbRci/FyfVRTdSrdeNNrdSkJOif+WpdJMlJ0RjRG82+6lD4KBYyN7/z4NOM0lFQ4glJrJZ+9cC9c0EUyBDDwyL15nHiIqxJMNtYfw3uMZTfAEVvTKb9IbkS9Pn/uOGJOqIUFSazoXwqnuuxF8v6MYKW06yIum2oQYJ7biqb5w+fZ5wIxJSe5GbtH9624MXqtRl/Gw3rWABvOA6+bezfTnl5Wzq3RjpAF03FSas/QhqHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hnR0NxeVJ4Tk5LN09XSmMyTTUzODhscTV3S2ZQVzZmeWYyeHBMMnRtNU0z?=
 =?utf-8?B?cVZSY3RmZThMV2FHRENkUEtiTzZacXRkK1Z1clR1TXB1bjNQeEc1enJjVFN6?=
 =?utf-8?B?ZFV1TmR1NXBEd2dLdS9wcWtXb05lMSsyZkJRU1QrYjJCRWZVZi94NlNOa0RM?=
 =?utf-8?B?dGV6RzZIZU03VHlyMkJYdGZ1WFZUTnNGTFFzVGtYYnF5cDhtVHJCOGZuU2FM?=
 =?utf-8?B?K2hZenZqRWo2eExpL2xXV3hjaTBDQlB4Um9JRUZTdGs1cU5KNmxKem9vSUR3?=
 =?utf-8?B?RmZiVG9TamMrQ0xFWlNFY25lVjZUaWJDd0R2emxoemlwcFgvNEZ1ZzNRSm5r?=
 =?utf-8?B?WmprU0dpclp1MFhFZTg1QXFZRUFtL1Npb3F1Y29LeWsxWkZpVkNhOE9La3gw?=
 =?utf-8?B?Ynp6V0ZiQzNRL0FDYjlYcFdyZ2o3RWVNSEc5WEltM3hjRzV3bzZmcGw1MUVa?=
 =?utf-8?B?VWVHbE1PMkJqVm5CYzlOU1IrRURTRklqazQ1Q2dnVHR2eVJoU21vb09jaDRW?=
 =?utf-8?B?QjVHUnd4VEkzbVdXSmZUa08vZmFaWElGQlJQNU5EQjR4enB1c0h2SjdJQWU0?=
 =?utf-8?B?TjdicFQwNVV2b0hWZ09lM201RjBBNUFUdUJra1g4K0Jja0JoUDNPaU9IREs4?=
 =?utf-8?B?Q0g1VWJVWnArb3NVdU44dW16RnRsVkZURHNnbW56VzkyMTZ2QTRleHpoZEg3?=
 =?utf-8?B?QnB2bWV4R0hjYmEwN1BwUU4zdEJHSDFNVkNmYy9qMG1ZdHJSeFo2OVkzMUph?=
 =?utf-8?B?TE1NUUVpeDlJUVRIc0hhQVFiVW41ZWI4RGk3RkRVYVBFVkVhSE1ML25jZERN?=
 =?utf-8?B?THpJQmFRWHdzZnRmNGE2MHFsQ3loLzZ0dWphRmhGQ3VwemlXRGxUZjRqUytl?=
 =?utf-8?B?Sm0zYnJCUjJNNzA2WTlNNWJmY0RJekx3Q25pZUdHLy9Cd0dzSmNjcldDckUz?=
 =?utf-8?B?aFd3UWN3YWpVV3ZERTRBZ3E1MlY1ODZ5ZHNGMHZzUm92VDMwSG9TU1gxWVJB?=
 =?utf-8?B?ZkRqeTNhQzhMYzNMU0l5dFlKem8wRzc4WWRiZXZXMWdnWkMzcUNhbHFSL3hv?=
 =?utf-8?B?WU1NTHdHQi93cEVRNHFsbnJSak9aVUhSUkRvSkprYWdERU9PQmx2WmRPcEFp?=
 =?utf-8?B?WkZqWko3WWlaNTFqU2RtUXB5R3VkK2tJN1JHMnJyV0l0c29WTWIxYmd1bUYr?=
 =?utf-8?B?L0x2c0kxNnNQK0RXY0RMTG5HUU1pLzduMCtFaXZKSnJqREY2dFZULzlNRGZm?=
 =?utf-8?B?LzZaZFJzbkVGSzJVSnVMMytPU2xGTWxMdnhtYVpTckRsM0FnR3RVMzFXZXZQ?=
 =?utf-8?B?MFkzV3ZHWkxXalJWVDZnSnlFU2pFSFY1ZVhGM3owVkFWa3hFLzN1Z0ZVUVdC?=
 =?utf-8?B?ZkI1d01lVVliYXk3UVBWYmVRL3pFY2g2VVhqKzR1RFNLVzllbUZRM0NYSWlB?=
 =?utf-8?B?WGtNWUNxNGw2Q1MwbjRnS0ZqZnZyOFZ6c3JkUzliYWg4UWx1WXNtRFhSZklD?=
 =?utf-8?B?bC8zYlQwOEdpU3J4SmRFSHN1U25kZGhCWHIxNVRmYy9MWVkwVkFMOUVva281?=
 =?utf-8?B?MWN0RjY2K0JUYm5EWDdRSmxmSzA2VUtkWW8zdUxtR1lwcHhlY1UvVTNKOE04?=
 =?utf-8?B?STRCTS9tY2F2WGIrbElOSXcybm5xOXZqQS9qam9XaDJPdUNITDZ5QUNQbWQy?=
 =?utf-8?B?Q3ZFdys2eDIrK3lmZ2N3aU1wSkIzNHVLVVNRYmxiT1BTdGxsMnltM3ZMRWlI?=
 =?utf-8?B?K2RLdUhRY1Z0RFVOZnpaMmlWclYvSkhZaHMwWTFmMFFuUUNFM3pNeXBCaUxN?=
 =?utf-8?B?b09NVmNiL3VUU2ZDcDMvTnV5bGZtWHVHVEQyZFZkKzduaDVBaXhnSGZhenY3?=
 =?utf-8?B?aWhzU0JzaG1LcGR3aFVlMkdBaFVoWW8xaHpXMUZXdk5xM1ZGdGJYVGM5cUlj?=
 =?utf-8?B?cnhDZDBtK0xmTDJoZ0Zib0pkd2VUZ3RrdWlJWlR2Z3pWWnFKaExlNjl0SzJp?=
 =?utf-8?B?NjVqeU1TeUl6ZFZCL0VZdEdiV2s1UE5sakNzcGFMSFE5dkVCZWw1aERYczJt?=
 =?utf-8?B?Q2xETjJXZGR2eHVCNEgxWUFJZG9kcllqNEowb0Uzd2FJV0kycHRzWFQ3aGln?=
 =?utf-8?B?dGtneFJvYkwrQkdNbDl1NFlqRFlQUmIvek1ySmM0MzdpZ0c1dGY3dWIxMXI3?=
 =?utf-8?B?YmQwZ2lLY3pCU0hQWmpocVJ2VVVUVjNsaUd3cmsyczZGbkc1b2QxRlUzRkVH?=
 =?utf-8?B?SERSRmZ5dm1ZaG9uV0pGWTNPRUU5L1Y4cEZ0ZXpkMU5BS2ZOSkw5SGkzdDZl?=
 =?utf-8?B?QUtMMmhLVGxNeVIrbWZXZWsvdG9mOEJQa0tHbDg0RG1sN0tEMEIvc1B4ZlNH?=
 =?utf-8?Q?VafiSJzdCLQBvFOBWwy1X+eY40rcqUkL4I0tKG0DYKS3P?=
X-MS-Exchange-AntiSpam-MessageData-1: a/7vGmtlUiNg1Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be2e810-0b70-4965-e860-08de7816b94b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 04:46:52.7694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIuJM2HNC3hToWT8agSTqTff8UtwTqD4szOCuFAYlQzkzO9ugpsFL3v1XidrY9T2qbrhJRjKrwiZDk9L6cSVPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AC9D21D2FD7
X-Rspamd-Action: no action

On Fri Feb 27, 2026 at 8:28 PM JST, Alexandre Courbot wrote:
>> +    /// Sends `command` to the GSP.
>> +    ///
>> +    /// The command may be split into multiple messages if it is large.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>> +    /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>> +    ///
>> +    /// Error codes returned by the command initializers are propagated=
 as-is.
>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) ->=
 Result
>> +    where
>> +        M: CommandToGsp,
>> +        Error: From<M::InitError>,
>> +    {
>> +        let mut state =3D SplitState::new(&command)?;
>> +
>> +        self.send_single_command(bar, state.command(command))?;
>
> As we discussed offline these two lines were bothering me a bit, because
> we pass `command` twice and there is a possibility (although purely
> hypothetical) of API misuse. I think I found a way around it: we turn
> `SplitState` into an enum with a `Single` variant, that contains the
> original command, and a `Split` one, which contains the truncated
> initial command and its continuation records.
>
> This simple change cascades into more simplifications in the new types
> introduced by this patch: `SplitCommand` is not an enum anymore, but the
> original command with a shorter payload. And the continuation records
> are their own self-contained type. This is achieved by allocating two
> `KVVec`s when we split, and taking advantage of the `SBuffer` we
> conveniently have at hand to fill them both.
>
> I have pushed a branch with this idea implemented on top of yours in [1]
> - please check it, but I think it brings a nice (if small) incremental
> improvement. It removes the API misuse potential, makes every type
> purely single-purpose, and doesn't need `PhantomData` or lifetimes,
> making it simpler overall IMHO.
>
> [1] https://github.com/Gnurou/linux/tree/review/continuations

Thank you for looking into this and I agree this new design is better.
We pay an extra allocation but it's rare that that path will be hit, so
I agree it's worth it.

Added and thanks for your work on improving this API.

>> +
>> +/// The `ContinuationRecord` command.
>> +pub(crate) struct ContinuationRecord<'a> {
>
> These new types are to be used by the command queue, and we don't want
> to use them elsewhere, so `pub(super)` seems more appropriate to me.
>
> And actually, since they are more command queue infrastructure than pure
> "commands" that fulfill a given purpose, I'd suggest moving them into
> their own sub-module of `gsp` (named `continuation` or `split` maybe?).
> That way they don't get in the way of readers who just want to learn
> about GSP commands.

Done.
