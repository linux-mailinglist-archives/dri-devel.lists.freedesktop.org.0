Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMzxGRWdpWkeGgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:22:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13C1DAAD1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873D910E514;
	Mon,  2 Mar 2026 14:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="FjQt8473";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021141.outbound.protection.outlook.com [52.101.100.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A87E10E514;
 Mon,  2 Mar 2026 14:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz5DLkFX1XACc44yn3qsQvVwSM9R0o5p+QaYIoqBIeZBgJmbihseeLwdRBw7LnTJoDkrm1d7qHDrqDUp2sdDpLiV8N1F7cTUgB17+FasYw3e6WqQE2HxE084F431jTzcRbHhCs5J4Uu6G30durReeEnOrPJSP5MBosMfJJJhcvDAOVqEvCYQH3v0tFp6nEL+N/MU6n8dDEzamAWxTSToXsGCjUuCaRYzgbq2VGNg8nST1BVpth4eZG50yTyyAEnzyYOico+P3mO/diQxrTXI9Cu8fETZj+Xxq4ASmsoGXNiLTr01D+lRfumsxZ5RCsYnihKTM9Ul6ORTqo+czIuSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH37/dX7fC7t2dcYlnv48tx6YtJyd1anLiqGF0o46SQ=;
 b=Ymy9tvAlZikjLGPhAAf9xQWX9tLVekfxet2ThiuycS75ttWoGQ0n5/N2LLCklffkWFtrgNwDpB3x7yS64SKrmjLIcscFPNB5cReJVWnwRCDDfs3J81kG2cKoYc4MvCIoCsdNqfrWtJIhaUsA6wuwHjnS3aR/XIOU9HLl+kqEnMtDRSODRbSN9fLIC0cUpJehWL1+xorvlORXJXXHA/7ORGw+/7+OtomtSKilPQjBxR7edsvox1vGs2bF80n2QSTvKRPp/Yn4+5f9fg4wGHh/PETZoAnnitTO5AzqCA1yGxoU3BvP5DCV8gK5gjaSF8vgPH5YtTZ6WoOuZdKHD+Ov/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH37/dX7fC7t2dcYlnv48tx6YtJyd1anLiqGF0o46SQ=;
 b=FjQt84737nz15h0wk1lZmhIGYVZlTkEK6eMsjx+oTJPYecp+Nhk1Jj/ElevgXBxkvHMgYBaIG1bYc5ifRfNQVqBSeMUdZgSVzqQlN8BqzD104aleUjvBRwBjBjwQKizoMRJYWjkDntzdmCyOw5tnkCCUri74cK2e2ltwL+ttYfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6727.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:22:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:22:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:22:04 +0000
Message-Id: <DGSD3NICC14Q.9NRO7N4YCRAH@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 7/9] gpu: nova-core: gsp: add command_size helper
X-Mailer: aerc 0.21.0
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: dba252db-7eef-4b30-58b7-08de78671446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: i+X26pcz7EQjBAtAJaxyEeNwZEBKGJADExefvUUNMzSiqzOrlJdzse0xUhbBw/hlb8KgV+77DPppH+GtngAPSUCLL6gx0NKH2f8vQBBApnN6An81vXz63wdXvr6ILW517Obf668RIaRnzR14XS2dhsv4zpgz9UqE7zQXnMQmVxIm/T1w7oAjubZ9Mx/HrnzAL7LZF4UG793EMOTw9gIKJJpTfANC5a3wONTys6veyB33yPtluhfsQNXPr3DN3FKLHguodI7D9X4NEHFsy4pgboX5aKbkZuJRJE045p8Yr302pG8sq9kq+LjV4QDX/fL/5yMOuB1Oa5wOkTYkwzwyE85Gd3qklFIP3XhBJv3b5lN/g6GGzUKbxDFposb5UE5QZ/NNLj8Q7yYF3E0FHfhQzXtYgyr/WNCTIyfZ3uy5U7L6+lBv8YZEIE9YZk5lCqYA+E5znuYhLYCDAyyF+MLhYRJ0CHvtowVLjUS7Gy5G9+NU+M0/h6vntZeEIXCUCT/1lfmDMGF0pevpPnhM/iQFCw1F7wCRL9tN9+fchHb3Wa2pUafF/TvGG2G5blUaUhGgcMQdFr1qtNZKZvcILWFVmT0oFmNzbkMfCWwAq6FRC4Nr36uIfOE9Tsa21SkdBUAbh6RYulgEof+IEz1eVP0cJGDh98DHlg+7STW8e485ch1MQtvlQaogG71XkJZR98WQxHUO1W6crIj0M1ePtLZkf2x4zwdmPzr15SGAku616eMZKCw7POG1/ox65YnEIZXpfAOVaUgsA6e3C6aLUf0Bfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRLS2c0UWhrc3B1aVptb2VrRGVyalFIOFpURVl4TVBGeG8waVYrL09vc2RV?=
 =?utf-8?B?NFI0Y3FsWmtkYTBiTG9iVmY4R0svbjRmUUlLTEFuaE1OdkZBY3lXNFNlczQw?=
 =?utf-8?B?dGZ5NjQ0MTB5YXdkRU9MNC9WN2V1Vlo4RUVndmVyeFZyanJkQjdhdXJOMytu?=
 =?utf-8?B?WktZQk1MRnd6OG9aaTBVb2JsNnBvcEpjS2RISVpnaU9NejFuemZlbm54Snlq?=
 =?utf-8?B?T092OWJkdkg4VFVnT3BoZFdOc3Q3VkNNQlpvTG1oalM4amM2U2xkL2Jzb3ls?=
 =?utf-8?B?MlNpTUFsU1dZWmVHQ3ZmdUJ2bFFrUTVnOG1kMmRQbU9ZcVBkcllaRXVaWDRT?=
 =?utf-8?B?OE10bk1ZdGxkZ1UyaEV6Sk52L25rOTJ3UHJzV0FSa2wwTWVtVnRRZTlkb3d3?=
 =?utf-8?B?OFdUYTZKd0FoSi9IUVkwZEFpaWYwZGYrSGVFam5QaFlIYzd2U1ZkQ2JubFBO?=
 =?utf-8?B?S3BlVkdvRTlDSTNxdVFwaVVoRTRKNDFyaGQ1OUpaQTZPTE5naThNY0dCSHc5?=
 =?utf-8?B?dUx4c3h0dDFRL1FhOG1pREgrNUZ2WTJtSWRWZ1Evd2lVdFNVLzFKbWxCS3Jz?=
 =?utf-8?B?MUozcUlzVnozM1lCUU1BQ2Q0YUFnWlg5aDBlQUZXdmR6Q3phc2tlMWZCUk1X?=
 =?utf-8?B?OUFYeVl2TlFFdGtOWjVHeGZKTVRPeGt4djQrdlFFcXJLSmkwZVRFbXFkdkgy?=
 =?utf-8?B?SGViVi9NaXB4U0J4UnM0SnRzTmUyaXFYV0dnWW5pU0Z6ZnR1cnc3VlpCTGRF?=
 =?utf-8?B?T0NyenZncGhLZmpuWlQ4N1B6OG8xcVJPQVRjMXFmTXc2cmRGY28zNUdBY0NW?=
 =?utf-8?B?MVU0QzY3N1pEOC9zRXFIdEM3MHBFM2NwdEFZSXl2elYvaFRyY2M1SGtXdHdu?=
 =?utf-8?B?c1Z5TUZ6VmxMUU1SbkF1V3N1eHB2Tm1NVWdVdVZFb1czZk15YmtDTTdQcE5p?=
 =?utf-8?B?MjBRRkRiV0k4bVRoWThCeFplbmV4WVdHREJSQ05KTTBMTGllcWh1MXloV3d2?=
 =?utf-8?B?NlNud2dFWEZFbHpQQ0NBWEcrb0QzbmlkMkQrM1FpSXNlSEVhV3JaWHNURGNZ?=
 =?utf-8?B?ZStTUHRySmR5WkNQbVExZC9JbXdwRmNJUnAvMHJLdHA1YWRldlVIYVJkenlM?=
 =?utf-8?B?UVQ3MnRjdzJQSEFGTGhRbzYvYjlRdFVDaXhMT1pTMFgyek9sKzZWd3BnVmpm?=
 =?utf-8?B?QmFFdFE4YXVCYW9zREhzeExGRVZpcGVnSDNDcndwdWM0SWRTVzE0U0tyM3JB?=
 =?utf-8?B?UGluTHNOaUdRdDhyUmcvbTAvTXRnZExaK2FJZ2hVU1pRMjhqSlJNYW9nRHpM?=
 =?utf-8?B?UlJQM3NtdThtd0s4M1FVSWp1azRFS2RhTmZJUkU3ZWlXdTJGR2JaS296bVEr?=
 =?utf-8?B?ck1ObFlyMDVoVVhkZnNwSXI4TVVLZCszS1RWV2UvcDFxalFRc2l5MTRLNU01?=
 =?utf-8?B?V3RueS9VUVlEMHJjNlEzSmI0SmtNd3ptaDhDSWlaZzlCMjB0U0xFRG5Ia09Z?=
 =?utf-8?B?aDIvVVZ3a2pZbU9CU0oydXNrR3hhUjhpVzg4Tm0yVkNkVFJvNll1RWtpbjVL?=
 =?utf-8?B?RlFtT3dJV1RieVZDeFFuRWNvL1RRRDRxZXhmMkFrdVRxTHZ5ejBrRWUrRFly?=
 =?utf-8?B?ZzdLU0owT2J4WCtnb0ZhdnNTNGVhU08rSVVHYWlhSzZ3UW4zOEhxbXhkaFR3?=
 =?utf-8?B?ZVJpbGV2Vk5jbkRQWkx6d21TUU81VmZKQmx5Y25FVFJBVDNqYStPOU1MRXl6?=
 =?utf-8?B?OFhXdkdpNjZZdW9WdklNTXIxeDNpek0yczJHTWZJYytGV1kxTDF4Y2pEYmQx?=
 =?utf-8?B?ZGNacUVJS3ZzUG41cTM2SjVHUVE3Mmk5R2Nvc0tkbG5FOUZDS01ZblRQeFdI?=
 =?utf-8?B?Tnh6a09DalkySzdxMkZVcFNURU1aejNYeSsvUlhuOStmK2k2bmFpaUtPMVh6?=
 =?utf-8?B?cVZSWndlS0VOcDZrdjRxdlhJZk41b1VjS1VTSFM2eWNqbStobHFkN3p5OEN3?=
 =?utf-8?B?blNlSUltbUcrdmhjaHQzMXFwYURqZGpQSTBMRmUydzVGMHdrUE90YVc0QXd2?=
 =?utf-8?B?OG5xMEY1UDBsRjlwcHlnWEc2R2lVUG9wTGJzdnJiaHJiQUlKY0RkdjI0Q0JC?=
 =?utf-8?B?ZEVFYThOT0ZKcGd3NGthMFY4RUQ0L1MrM2Q0TW9hbkttbTUvTzY1R1g3bWpT?=
 =?utf-8?B?ZXllU2w3NGg2enRFNDdBV0loRVY2WGFSUW1COENSUFJqQXFNV3RvdmVhYWFz?=
 =?utf-8?B?aTgzdVU2TCt5elJvbjlpdDdsdlFMNW1YUGpoQXozTlo2TnVnWVBueElCZE81?=
 =?utf-8?B?S3NGM1R1cE56aDRmZEZlVDIrb2x1eC9ESm8raGFuOEgyOUN1WFhJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dba252db-7eef-4b30-58b7-08de78671446
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:22:05.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQDSAs+NK13sFlnUm3jAkUQlZfuTuapzQoRkZa0SPri77mcH0R+jPD/hvxajKgl6Afjr7xpZLfLhAymeH24KlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6727
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: DF13C1DAAD1
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
> Add a helper function which computes the size of a command.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 9f74f0898d90..4a663a5b3437 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -450,6 +450,15 @@ struct GspMessage<'a> {
>      contents: (&'a [u8], &'a [u8]),
>  }
> =20
> +/// Computes the total size of the command (including its variable-lengt=
h payload) without the
> +/// [`GspMsgElement`] header.
> +fn command_size<M>(command: &M) -> usize
> +where
> +    M: CommandToGsp,
> +{
> +    size_of::<M::Command>() + command.variable_payload_len()
> +}
> +

This could just a provided method on `CommandToGsp`?

Best,
Gary

>  /// GSP command queue.
>  ///
>  /// Provides the ability to send commands and receive messages from the =
GSP using a shared memory
> @@ -526,7 +535,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, =
command: M) -> Result
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        let command_size =3D size_of::<M::Command>() + command.variable_=
payload_len();
> +        let command_size =3D command_size(&command);
>          let dst =3D self
>              .gsp_mem
>              .allocate_command(command_size, Delta::from_secs(1))?;

