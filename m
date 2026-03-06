Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBUCGeYwqmnXMwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:41:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1E21A488
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6888E10E03D;
	Fri,  6 Mar 2026 01:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="POkNc9wU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010049.outbound.protection.outlook.com [52.101.85.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6410E03D;
 Fri,  6 Mar 2026 01:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi58e4fhZne8z4zLkLGkIEu07zW20ttc3sY1v40xp3RUGRWw996eR+OKwRfCqaBE3F24Tny2/2ABBbrFG0I2eMiyDupLaGBVVBY2BFN0e/ubh2EXqL1v/Q3ek4038n8wMkws6ycmDQ4+SkxwA9abMHVYumbahCEPyIdVEewjFtVVJDzg60lrjHIA60U5ahQiKDx1AE8U1hq+4rjtMsk43wHkM5g3AMpjNdgKje1sE4oznK5cWRcLnkSmwlBTBBoSgx36KQZCfPPiIJ4Mob7B6g6REJ2ZiQtXuXSVe4veqn3dbMn9PWyg3XO0AzQ7o33f51j1dRzuvYkNmw7L6nn/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCkE6htySzyXQQnyX9ej3afmqkEf2Nyz9F7gCutLeC8=;
 b=srCOoXcKXeMIf/lPjUT87B8FmOgDC3GEXD41Fq5LLpTzLwOyBkf3Fd1ZCllYuitrm7DL3vLwhps5Yz9Fj5Yf7l0eEI5J1e3nQKIIQOjEr6USX2gf1YRbjw9UOIqG7rb1JbVir3lJCALpoyXR3Di3PpAhWevc1O6akE1KYTZcG4zxv57xeYc6O944oeDARxsW23pooWjzmMuUwtBxYUvq0i7hj1MQJtKLu26f7O7pBiFkHlf6U8AJluQ/V6Rlu7wGln4uB803yiUo5uOnkYTtR4fEysGsSvsLGRPaOAVjvs8Os+Yv5jH7hBeqQb2HBLnpWS5fX3r0doDDYKr0ynyr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCkE6htySzyXQQnyX9ej3afmqkEf2Nyz9F7gCutLeC8=;
 b=POkNc9wUp3zocmUx+Ty2onObuIOoPk03fdwxdrMyin3HFI3oZmgP6Pebi8lEW9f0OLv3/0nhkDwyGeUnEY+WtuofVV9/0LLcfYl9S+gjISBKSohtQZE0sy5WexiWWmCIoY2HQmZRgp1FpTC4lx945KGan5C/QOkVkWSBmE/qxa10dtzLVwpVx9az0wk5STh7bwc8u1W0m5HG5ZrZsvpulcLTp994DgRK0cxo5nEuN7O17J96BVlIwxV9/PAyfwesYnJfcy14KdcxuQKTDaOFGTvkpxwpellqxnH0im+xZlarugxaeRKmJiaABc4zR3Lie5qgcVd602MTtGK7KqMetA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:41:47 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:41:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:41:44 +0900
Message-Id: <DGVBFO7P95IZ.24M3NHJ4N06DF@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 01/10] gpu: nova-core: create falcon firmware DMA
 objects lazily
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-1-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-1-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TY4P301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e04df59-1d65-467b-d6cc-08de7b2187a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: xl+cVogW25j0en1B7bG0m7Z1jUUVxrDP7fTZqun52AMYmzlC/Bt8ZK/et5uAYX+X4011dwvPczmrXYwtEv/R9KKrAA2x6usxZoQ6P5i81U4ulqpa45O1p4NxkENpTeKsPRXlkc30uk8apy8VBXdirU7+om5wRFzsSWg+w4l+ylRPcu67X2vKXEw/9N8bNsw8f14nshILG5tyVaG/UVBCiTZKCA9KhxGj6p1GBau1agmxOwYbmNHLAmSiiyxyawfn/KWPOZbAJkEukTUxifoqAwgWNZzwca/uhbLB+31yvekD03Ce2lzZAoSAO/TrfOKPp1g/mr/k1WD/I9azLg8oKIZQqTUbhry1yO452MUXY4ATfSWe8gDb8HlVq5ceyTMI0oCDQZW8On2wT0BMVPg/G8yR0kcoRvo6hRPBejPf4WVWePr28TG1GMqOiTRUxndRUv8SqYLTpd07HlqY087EX0olpEbT43+jplEeGY+A53VzSzOG2HXBBH0twDQ4rLzMMt1zlPJDz6bUIg3ILCRQ1AM5TaRoTbWhGFAOIkKtI9Tn2TTmjB67WpeEzaiMWjgtKX2xoE3ai3Gi4+JXR8czg5GPHvFgq9wsh81Eqwvc2tOqrZ1KYbybdAqGJpFkKNoZCBNfBps/sm05yZVKis5soqoltPtzqCC4xwwDznjeGjHzk+7o8xx0bM7EcLWnp5ZzoD/68I6we7NKPhEYF8XyUJ60xgMasSiFnrPLKN4iM1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDA5RDBnRTdYZkxPN2R1b2d0ditpTExZN3YrdkNZNWNlbGZ4SHlJUWNSWmpi?=
 =?utf-8?B?YVB2UzVEcUNmZ2lRRWZyVzFUYkJEMS9TczlrSC9CakhCeHNoSlZYTEZaTEZS?=
 =?utf-8?B?d1NaOEFtSGw5NUJIeE13WFJRQ2FwbFRhVU4wbEswTGlRaGxMNFA1cUJDU3BF?=
 =?utf-8?B?a0ZUMm1JVXpQdjBWTSt2NXVRcWxUSUpMY1Zlc3hKYjBYMitKR1hFTXNIekM3?=
 =?utf-8?B?YkRiRDlHMXhoQkZmREdUSTQrYXN4TGZGb0l4bEFabW5vTUNmVm0rUnl5SXZm?=
 =?utf-8?B?RVlGeTAzaEl0bHZYYnoxU0g4dHAvbUwyUnl3TDFUcVZKeUUxRDBnNFI4cnZI?=
 =?utf-8?B?c2NHNjNPdkpPMjhhY256ejgyaEFZUy9vUG94WXpJc0ZpSzErbW4vcjFndkI1?=
 =?utf-8?B?SWs5VjdzRE5GUjlFZGRSYkhYV0Z5MlgzM0ZjcTE4YnNDdExxMmF5dUNvNmY3?=
 =?utf-8?B?SFI0am5KZEVvNjB2YUYzdWk4V0s2c3BSei8yZjNpTjhvTTgzUlF3V0c3U3Fw?=
 =?utf-8?B?OHl5d2xMNUw1cTA4VXF4QkRZK09wTmF4b21INmMxSkZibXZHWUhlZVp5V2xY?=
 =?utf-8?B?aVorQlZmdWh1c2txYnVqNU9ncW1QakV6aG5URTBlcXFpTnlVNzRFclJtaGZj?=
 =?utf-8?B?TnhHcHNGN2FPUFBYRHNJTGxpYldwd3lOZGFYdG9iRER2M09ReE1YTWhaQjRE?=
 =?utf-8?B?SHVNaEtMZFpPMWdIaHpVenNDcEM5M2hvVm5DSTRNU0ZkRHkxa2hxd0NwdXpK?=
 =?utf-8?B?emd3T2lMWmxWaXRacFVUY1JXY3o1OE5KSzNmVVA4V1I0MkhIVlpDL2ZadzNR?=
 =?utf-8?B?NUdRT1g4WitDZm1TZWw0RGNhN1dDek45MlBWOGQ4b0JkZGpjZXd6WHdhVERv?=
 =?utf-8?B?ckZTQVdWdmZjYitOVmlJZi9OdVd2RXgyQW1YcklaSkc4QUlLbkpMS3RQZ0tH?=
 =?utf-8?B?V051cHY3TGVXeGs5dHZmNEY3OHZtT2Vnc0dFY0ZOaHR2cURrK1dDQ3NxWXdj?=
 =?utf-8?B?VElZQkpJSW1ibk5uNER4ekFzYnVNVVNHNU9LQ0ZhenRUeGhieTloMDBFRldS?=
 =?utf-8?B?bUt1U1AxWS9BT2VVQzhNVHNUWkJEdkFpWEgvdDhYNjhxYnhROVdpck83dWFy?=
 =?utf-8?B?QnZvZVhPRTVIZXNVYXBjTDAydkFnRlFhK01uRkVveCtEY05CUzdlMmFlbkdX?=
 =?utf-8?B?cWw5OFAyb1QxS3RkS3d5TjNrK0d0bEJwcDZsSVh2a05BTG1iNDE2bGRZOXhG?=
 =?utf-8?B?VDUvYWhFbmhxREVPSEJXaTJuZ2F3VFZYOG9qMlpsRlg4Skx3Y2k5cU00dnM1?=
 =?utf-8?B?eUNLUXZ2MURrL3dPaDdKTUdqWDBheStoMUgxR3ZZeW55M3cvWG9IZFRPcTdM?=
 =?utf-8?B?M3EzUEJBekNFQktJWUJadFJKTUpWL1NOQ3BmWFJza09iaWRNc1gzMCthYklG?=
 =?utf-8?B?ZTdTaUJHZitaUkdjUnZIR0lHc0I3UzE2ZndGZWxaRmlBaFQ4N1RRdDRQQ3pT?=
 =?utf-8?B?TFVRVkNVTHYxYmRYQkdLdU91VFVqa3hxVXJ6OTIwenc4a2ZRaUlYMS9Dem81?=
 =?utf-8?B?SElQK29ib0JPMXRiL0NLRzNsUURDMlhiNlRxWDBDS2hoWktRTGxuSWxjY2RY?=
 =?utf-8?B?Zk40ZkJJUndTc2dXUTdhRXV1TWtFeVo5ZzRYaVJHREtiLzFVb2RsT1IwRVJn?=
 =?utf-8?B?ZHFlWUFYQlVnMFE2bndjT1ZoNGo3dWx1SkxtcmtMTisyUjM1UjRZbytMdEsx?=
 =?utf-8?B?Z3VaVVQ1aldGWDdqQzRVY0pNbWFxN3VTRGFhaGlHb0RBQ2grelBVeExTRXFQ?=
 =?utf-8?B?VGNsYlE2c1NJbWRmSGMzRDlsSEg4UU95eWgrSnVVblFwYldTY28vMXVTTFpm?=
 =?utf-8?B?QW1WblVvZnNKZ1ZicWo3bUNSYThla25SaU1Qek9PRTc3UHJtNXpsMmZSTis3?=
 =?utf-8?B?Nlk2TnIwQVllZ1NaMmRxWkpGUjF5Z3kzMkxGdVV5RzZaRUg2MU52bEpQZG0x?=
 =?utf-8?B?cHo3Qjgrc1pJeU5SeHBpWm5MSFdXb0NGeEF1K2RGYk9aaFA3QW5YSFg4K2JP?=
 =?utf-8?B?Rm5KMk53Sm5hR1hUSUxYSm56YzZ4SXZOKzRwYmo1RFAySzRjM1NONEdpQUQ1?=
 =?utf-8?B?d2VFM1FMK0xJUG5mRkhWL3ZZNjQ2NnBsUkg2Njd4ZnpvN0tEbXNPSUpJY1h5?=
 =?utf-8?B?blZvSjNTc3IrZGRqWDFJQUE4VGxnL0lrRXBKd0JlUkZJTnRRVkxyMFk5VGQw?=
 =?utf-8?B?Z3lhMXB5WDRla0JVUWdQZ1A4Ni9LZG1maEhNWXVqUlVlT0NnNDJjK25GZzFl?=
 =?utf-8?B?TEIyVHhXRHY5bVhKbW1lRC8vcnNqc3pKZ3RoMzY5b1ljMXIrOE52RitwTnZ2?=
 =?utf-8?Q?Di1eyhdz+yPQzaR+BTZfQRKGfvrHLwVbc9FbjGb7a0FdF?=
X-MS-Exchange-AntiSpam-MessageData-1: aulqc+bnt5hFQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e04df59-1d65-467b-d6cc-08de7b2187a4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:41:47.6655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOFd1J9xHovJ/ar3lQbSywSu5V0FBwCWUyAxnhW1b1Wrx2zKZ1MP93MAkgArUI+6cZvSMLaCDSjOo6UpbpcYXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648
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
X-Rspamd-Queue-Id: B7E1E21A488
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> When DMA was the only loading option for falcon firmwares, we decided to
> store them in DMA objects as soon as they were loaded from disk and
> patch them in-place to avoid having to do an extra copy.
>
> This decision complicates the PIO loading patch considerably, and
> actually does not even stand on its own when put into perspective with
> the fact that it requires 8 unsafe statements in the code that wouldn't
> exist if we stored the firmware into a `KVVec` and copied it into a DMA
> object at the last minute.
>
> The cost of the copy is, as can be expected, imperceptible at runtime.
> Thus, switch to a lazy DMA object creation model and simplify our code
> a bit. This will also have the nice side-effect of being more fit for
> PIO loading.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 57 ++++++++++++-------
>  drivers/gpu/nova-core/firmware.rs        | 38 ++++++-------
>  drivers/gpu/nova-core/firmware/booter.rs | 33 +++++------
>  drivers/gpu/nova-core/firmware/fwsec.rs  | 96 ++++++++++----------------=
------
>  drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
>  5 files changed, 99 insertions(+), 127 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 37bfee1d0949..8d444cf9d55c 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -2,12 +2,13 @@
> =20
>  //! Falcon microprocessor base support
> =20
> -use core::ops::Deref;
> -
>  use hal::FalconHal;
> =20
>  use kernel::{
> -    device,
> +    device::{
> +        self,
> +        Device, //
> +    },
>      dma::{
>          DmaAddress,
>          DmaMask, //
> @@ -15,9 +16,7 @@
>      io::poll::read_poll_timeout,
>      prelude::*,
>      sync::aref::ARef,
> -    time::{
> -        Delta, //
> -    },
> +    time::Delta,

nit: Missing // guard here.

> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index df3d8de14ca1..9349c715a5a4 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -10,10 +10,7 @@
>  //! - The command to be run, as this firmware can perform several tasks =
;
>  //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
> =20
> -use core::{
> -    marker::PhantomData,
> -    ops::Deref, //
> -};
> +use core::marker::PhantomData;
> =20
>  use kernel::{
>      device::{
> @@ -28,7 +25,6 @@
>  };
> =20
>  use crate::{
> -    dma::DmaObject,
>      driver::Bar0,
>      falcon::{
>          gsp::Gsp,
> @@ -40,7 +36,7 @@
>      },
>      firmware::{
>          FalconUCodeDesc,
> -        FirmwareDmaObject,
> +        FirmwareObject,
>          FirmwareSignature,
>          Signed,
>          Unsigned, //
> @@ -174,52 +170,21 @@ fn as_ref(&self) -> &[u8] {
> =20
>  impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
> =20
> -/// Reinterpret the area starting from `offset` in `fw` as an instance o=
f `T` (which must implement
> -/// [`FromBytes`]) and return a reference to it.
> -///
> -/// # Safety
> -///
> -/// * Callers must ensure that the device does not read/write to/from me=
mory while the returned
> -///   reference is live.
> -/// * Callers must ensure that this call does not race with a write to t=
he same region while
> -///   the returned reference is live.
> -unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize)=
 -> Result<&T> {
> -    // SAFETY: The safety requirements of the function guarantee the dev=
ice won't read
> -    // or write to memory while the reference is alive and that this cal=
l won't race
> -    // with writes to the same memory region.
> -    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or=
(EINVAL)
> -}
> -
> -/// Reinterpret the area starting from `offset` in `fw` as a mutable ins=
tance of `T` (which must
> -/// implement [`FromBytes`]) and return a reference to it.
> -///
> -/// # Safety
> -///
> -/// * Callers must ensure that the device does not read/write to/from me=
mory while the returned
> -///   slice is live.
> -/// * Callers must ensure that this call does not race with a read or wr=
ite to the same region
> -///   while the returned slice is live.
> -unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
> -    fw: &mut DmaObject,
> -    offset: usize,
> -) -> Result<&mut T> {
> -    // SAFETY: The safety requirements of the function guarantee the dev=
ice won't read
> -    // or write to memory while the reference is alive and that this cal=
l won't race
> -    // with writes or reads to the same memory region.
> -    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? =
}).ok_or(EINVAL)
> -}
> -
>  /// The FWSEC microcode, extracted from the BIOS and to be run on the GS=
P falcon.
>  ///
>  /// It is responsible for e.g. carving out the WPR2 region as the first =
step of the GSP bootflow.
>  pub(crate) struct FwsecFirmware {
>      /// Descriptor of the firmware.
>      desc: FalconUCodeDesc,
> -    /// GPU-accessible DMA object containing the firmware.
> -    ucode: FirmwareDmaObject<Self, Signed>,
> +    /// Object containing the firmware binary.
> +    ucode: FirmwareObject<Self, Signed>,
>  }
> =20
>  impl FalconLoadParams for FwsecFirmware {
> +    fn as_slice(&self) -> &[u8] {
> +        self.ucode.0.as_slice()
> +    }
> +
>      fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          self.desc.imem_sec_load_params()
>      }
> @@ -245,23 +210,15 @@ fn boot_addr(&self) -> u32 {
>      }
>  }
> =20
> -impl Deref for FwsecFirmware {
> -    type Target =3D DmaObject;
> -
> -    fn deref(&self) -> &Self::Target {
> -        &self.ucode.0
> -    }
> -}
> -
>  impl FalconFirmware for FwsecFirmware {
>      type Target =3D Gsp;
>  }
> =20
> -impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
> -    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCo=
mmand) -> Result<Self> {
> +impl FirmwareObject<FwsecFirmware, Unsigned> {
> +    fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
>          let desc =3D bios.fwsec_image().header()?;
> -        let ucode =3D bios.fwsec_image().ucode(&desc)?;
> -        let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
> +        let mut ucode =3D KVVec::new();
> +        ucode.extend_from_slice(bios.fwsec_image().ucode(&desc)?, GFP_KE=
RNEL)?;
> =20
>          let hdr_offset =3D desc
>              .imem_load_size()
> @@ -269,8 +226,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbio=
s, cmd: FwsecCommand) -> Re
>              .map(usize::from_safe_cast)
>              .ok_or(EINVAL)?;
> =20
> -        // SAFETY: we have exclusive access to `dma_object`.
> -        let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(&dma_object, h=
dr_offset) }?;
> +        let hdr =3D FalconAppifHdrV1::from_bytes_prefix(&ucode[hdr_offse=
t..])
> +            .ok_or(EINVAL)?
> +            .0;

Is it worth adding // PANIC: comments like we have in some other areas
of the codebase for each of these indexes into ucode?

Other than those two optional nits,
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
