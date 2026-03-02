Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPRWHe3JpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:33:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95671DDDB7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1B810E56E;
	Mon,  2 Mar 2026 17:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="sgsp/sHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021131.outbound.protection.outlook.com [52.101.100.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CEA10E56E;
 Mon,  2 Mar 2026 17:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ehc4egZLzXLXql+bqYuMnopFsa3xJqLLRTF9tOVWe1JiREVDIxObKQkxeD8Q7jJF36+FoEpV2STeFscghbYz4GMAQ91W6g4t2Pb53nAYlOEuka4pcfLXwxF+6wZv18JgKMA1o5Re64bqtHyE/341hMJzSfT0uiui+R/wzKv9mBAG7yXQgMMjB181d5EDyzgrYBGKFeiyi77oRbJ7g9doybcRqHMjnjUJq7aqCkf5k8fW+VlYjtUq1wefZyxcXIY+cQzNPyrmVKDQM4AXDlwHtYC6mtQLTvvXBwwctVlF0Whi2dLd/ozW66YUKlWA2F6ZQVewI9B1RsmaMaJLMAwnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qswjuDMll7Rji99mIcRIvMiD6clzxZeIoIquFmDN3VU=;
 b=R+GWT9z/S+G6Cvxr2FcqpgVtImXbqTO/b1rd85ctEEfajwHEVmaGx647nk9G+9GLmKl54knxH4q2jBXYBtFe1LYLf9AGJcm0phj2+CQMC1IH5mtdepx8WuGa1eq7/gb4t3nzVBST5ABDOSuZmAgR8hnFG6pWS3jUmf3QGI+FEvExBzLd2nZeBAitB+v5Ldja4lX57y8vIoUW/NkMJuIJqk4zqBMp0qQ0Z2fF4ZH1ia7XOO4Wv5CvMnj50TGjbiDOuP8hxNjrv8QdYNk4xjbZYYUYbkQljNXVvuHNsQQCxLuuHJREL2ectF5qbecMtFCb7jv2B3RLTbZtqBNNrJQsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qswjuDMll7Rji99mIcRIvMiD6clzxZeIoIquFmDN3VU=;
 b=sgsp/sHGy+WaNs5di6Xe4lNfgLapwa1UQ5uqBrd94cVkxoklAN7xaOiobSJWIz1zbaza3OiQJFkx9owCHxG1r+qge4htDaZAesLtUlbawnH3c48h1IpEsfPJsJGXVQ4nG5vprgwTA2mCzxGIaTbnIPQHqpLclA0E7O7ZwY0MWoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2830.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:33:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:33:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:33:24 +0000
Message-Id: <DGSH65EDC3IH.1F9WMMAOX5P5V@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v2 3/4] gpu: nova-core: gsp: make `Cmdq` a pinned type
X-Mailer: aerc 0.21.0
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-3-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-3-c7e16a6d5885@nvidia.com>
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c577789-c600-4634-18e6-08de7881cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: P54YQK1OVzBJaz6hkHh6E/29Hc6AY8m+3X9+bItDaY7kHGFlWxLXPRwb6T6MDTvy4CJF9SbKMRLyZBf/3PjQU9CvwLF3oJLE7T2nKXveVDuQo/fdn7afCjEbQUlsYFILjtXsu+rtL9Ec1y8gBvKQJoltNlj0VCs8L8FNKqN0/oqbzgSOuhjAIbNYF2/bxsxUNgqn41qHtiElp6SIobFVn+pjsQKE6SJTe9ccy7fvjrLYi2jx3CflqvleNdxZMV3nlPbVBstUstClQgay+Ke4hCGPfx4xv53T6rf+nXm+sfOLmx0F8iQYotyy7i1PbJlTHi66witz80XCrEu6RlmfySRhn98VdAhPf9sFoquSs7qnBtVJNFe+GOT0yR/RcSqdXujSdtQlWaUQ8TOkjRVJgN59LuD+/PgjbmacCv1DlJiKz7HxQ+oUWBeNjlIEGiQCE+Pq1cw5M3KCJd81eMnDpdMvVIaghsB9ybpMswI4eDcnJDWAMjGeF/FnazCzm30/akBI/9KAatD3DTdbqpq8cvaAMWkzmpzX/HVDsGj6/cU026lTUJd06jUia/t0e4nxMRbMTdehMG6otRtDJ2fRXOwpimPQPdufcCfBHVK7JClmUd+w09iVlTngQ81ZDla1P2o/anB2KjvmwqEfLUtszCIc7nJXMuwgJrEaD5j41L6y4UZdEphPXoEYys2L9xgzTodBuuEIGNlzBwBbD3JPZ0/n225PMy7/KsyCazxU0+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXRqZkxYb3JMN1R1NVdTRDdyYWxiMUd5Y2J3V2xvUklPZFF0N2dnTGFTNytD?=
 =?utf-8?B?NDBvVkp0a2d4Y2ZUMTBRTGFrQy9IcS9ybG5yMTc0T0FXZ2hqYzFZWnozdG5J?=
 =?utf-8?B?Y1pCRUVkOFVUTk1jeHlYd3llaGZwWHhkZnQ0MncreDdjWENLRWJhR0dJTG44?=
 =?utf-8?B?NmlCSVlqNXQ5dVJmOUF6RFd5QkNRVllnaGk2RlhkeWZ2Sm9sM3VIbzRwZTVl?=
 =?utf-8?B?YWZBbUhzR1N2Vzk1cFRjRG5Oc2lYV0NQSjBlK0tZWnI0akE0aTJRbXNnSHpl?=
 =?utf-8?B?blJ2K1pjMC9rVGhoUHJPMzQ2dTVGTmJPWEFScjFJMUYxNko1bGR2Rm9zZVRk?=
 =?utf-8?B?dzR2bXBLMUVOUkZCWVRwSDhyTStWcjIySW1QWSsrOXRZenB1WllrWHBCaGEz?=
 =?utf-8?B?UnM4RDVjSmZtcDBUVjF5Y1ZBSkVtNDJibjdOLzFYSnRDRHZmZ2w4TmZ2Zm9u?=
 =?utf-8?B?TWFscG5OSWlMdFYyTGF5WFR4S0dJbk16K3I0ZktUQ21NTVV4MG5mTFJzVTNm?=
 =?utf-8?B?dXlWeW9FZnd5eVJDSDB5RjRNUlZXcC9DbUQxdi9XN2dDZmNvZURxWjROZjh6?=
 =?utf-8?B?RUN0cTBVbTNiZ3JGQjd6YU8zK01ZaDVSVXh1QzRCSzA0MFptM3RjLzRKUjcw?=
 =?utf-8?B?VitVaU1TTk9wQUNjNmlwbGd5MW9OY01aYUhuQ08vSGQ2T0FWNWFVb25sUmpm?=
 =?utf-8?B?eEh2WlcycVplWUtaaU1IQS9mQXJnRmFZdWNueWRZekdQNWhoVlpzb1FHTUJL?=
 =?utf-8?B?OTdSbzNBTWhpR0VUUFdybGV1QUEyZ0hRUXZobFVYazB1K2RMek4wNFhOcTht?=
 =?utf-8?B?dEp2aWZYN0xqZlJQR0pCNzZEdm45SGg3TDZFY1ZxdVhReXZRK0U1ZkZpOVhX?=
 =?utf-8?B?Q21WZUJ4cG4xYTB6ck42ZTlER3VGMGxrdHdJa2JQSkVGVEExUk5EL3N2V1BX?=
 =?utf-8?B?TCt3bGtLSEQyclZyci9hT2N1Y0o2S2tyZGg0V2hhUDhCb0U4UzJnV3BkK0lt?=
 =?utf-8?B?Mk5kSnExRC80bUVkQWtYZ251TWsxYkwzMjZ1aXNUS1VyVytoazRwd1FSN3VU?=
 =?utf-8?B?VDJLREttRk5FTFdqL1VueWdpbE53MjN5RDNGU0dNdVdneFVKSFdpOWJ0QUNk?=
 =?utf-8?B?MDVGTzMwNEpBL3F4U0c1Y0RDMWZxQzdObSsxQlVlNDNvMWpncVZZK1l3bk1h?=
 =?utf-8?B?ZUxzekQ2Z2RDU1EybWNtc0sra2JxVTVycTR0Y0hMWERNZ1lNT1RyVTBXczB6?=
 =?utf-8?B?akRRQjdGTUVHWnFwQzh1ZGhab2IrL2VUYTJFd2VuYTUySis1YXNYbXRIRUVz?=
 =?utf-8?B?RENUL0Q3SU8zQlBDQVBOZ09wL1BZU2JOOEVXRGE1OWgxREVlalBYTTZ5Y3pl?=
 =?utf-8?B?NFZ2Z1E4dHhWa3BmZjRyZ1hDOFJrS0JqMU5RUHIrWUlJTkx6bXQ1YXpUU1ln?=
 =?utf-8?B?aVN5WllMYmEwS3RhNjFZSjBvdkd2SkF0cnRGLzBvZWprWTBYaWxoOWMvREV3?=
 =?utf-8?B?RUFnSDlpUWczUzdTakg2SzBnWlFXRlloL2EyTVJPelQrMGd4ZVhwVlc0Y2x2?=
 =?utf-8?B?elZLOUFEclNpSzQ1dC9seVViQ0NId3hBdkt1UDErT29RREhmcFZIUWZObW52?=
 =?utf-8?B?cnVoeFExVlBDakJGdEYzRVlNd08wUGJIRmN4ZUNTSUNFTUZFTkpyUWd5UkJ6?=
 =?utf-8?B?L2p5SHQrUG1jaTc0S1pGSUVHQjN6UlZHWlNsWnR6TlBNaHlSelpPNUFHVmJW?=
 =?utf-8?B?TzZYYVBucnZuME1KV1lKcWUzZGhoZkZNV2lNS1dDZHBxbXMydG40ek9DOGZt?=
 =?utf-8?B?RWhadTFRUjArdERBSGxTSFU2bVpEWHRBbTBNb2dpR2xwMTVXbERNZEVCRm5q?=
 =?utf-8?B?T0xTZ0UrNDlHU1VteVJldmpDeTFLdjM0NGhPOWdmUCswdVc4L2lDRldTck1Y?=
 =?utf-8?B?ZE11UVpzZTNtVzFueVIrNmp5c2pFTzkrKy80MlNpUWFUdm41VGFlcFVpM2Za?=
 =?utf-8?B?VDFFWTloeEdtU2lpM04rL1ptR3Q5NDBIZDdQVWlqNlhyc1pOR0sxTVI0bnlx?=
 =?utf-8?B?OTBVbGhabzJ3WitKTVZ6KzI0NkNpWXBHOFNFRzZZcVZjaDRQY1dNQnUvaWpY?=
 =?utf-8?B?M3MvcStNaTNKOGU4R0VYUjN5Y0JYVDBPeUNTN25GMDluVGZtbFQ4TXBKWHBX?=
 =?utf-8?B?MTlRQ2owWlduMmZtaTM0THQyWTNIdFUvYjh2dUIrSDlTT1IwUTh3cEpUL3g4?=
 =?utf-8?B?aWVYRGVZUG1SVDVxR2RlWWdVamdBaURXOEVCSDVmcUVOY205QmQ0K1pxSkZs?=
 =?utf-8?B?NjNzcnUvZyt1N08wSWcxSVc5TzRXbXd3WlA3VlI3VklSSnprVHhUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c577789-c600-4634-18e6-08de7881cee8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:33:25.1479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVBL4VsJCBn+SM6JRlKpO70z0ff0RvrdiimDgACPacJhTyK+yF+DPfVjNbyK54aJkozyls8E5bQmifkQor3J+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2830
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
X-Rspamd-Queue-Id: C95671DDDB7
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 2:50 PM GMT, Eliot Courtney wrote:
> Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
> to add locking to `Cmdq`.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs      | 5 +++--
>  drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 174feaca0a6b..a6f3918c20b1 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -112,6 +112,7 @@ pub(crate) struct Gsp {
>      /// RM log buffer.
>      logrm: LogBuffer,
>      /// Command queue.
> +    #[pin]
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
>      rmargs: CoherentAllocation<GspArgumentsPadded>,
> @@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>                  loginit: LogBuffer::new(dev)?,
>                  logintr: LogBuffer::new(dev)?,
>                  logrm: LogBuffer::new(dev)?,
> -                cmdq: Cmdq::new(dev)?,
> +                cmdq <- Cmdq::new(dev),
>                  rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_=
coherent(
>                      dev,
>                      1,
> @@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>                          libos[1] =3D LibosMemoryRegionInitArgument::new(=
"LOGINTR", &logintr.0)
>                      )?;
>                      dma_write!(libos[2] =3D LibosMemoryRegionInitArgumen=
t::new("LOGRM", &logrm.0))?;
> -                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCache=
d::new(cmdq))?;
> +                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCache=
d::new(&cmdq))?;

Hmm, I don't think the `&` here is needed?

Best,
Gary

>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs))?;
>                  },
>              }))
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index daf3e1d153d4..6bb1decd2af5 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -474,6 +474,7 @@ pub(crate) fn command_size<M>(command: &M) -> usize
>  ///
>  /// Provides the ability to send commands and receive messages from the =
GSP using a shared memory
>  /// area.
> +#[pin_data]
>  pub(crate) struct Cmdq {
>      /// Device this command queue belongs to.
>      dev: ARef<device::Device>,
> @@ -501,13 +502,11 @@ impl Cmdq {
>      pub(crate) const NUM_PTES: usize =3D size_of::<GspMem>() >> GSP_PAGE=
_SHIFT;
> =20
>      /// Creates a new command queue for `dev`.
> -    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmd=
q> {
> -        let gsp_mem =3D DmaGspMem::new(dev)?;
> -
> -        Ok(Cmdq {
> +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinIn=
it<Self, Error> + '_ {
> +        try_pin_init!(Self {
> +            gsp_mem: DmaGspMem::new(dev)?,
>              dev: dev.into(),
>              seq: 0,
> -            gsp_mem,
>          })
>      }
> =20

