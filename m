Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPgFCLcyqmmNNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:49:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C421F21A598
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09BD10E273;
	Fri,  6 Mar 2026 01:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QJAVHdVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB5210E2AC;
 Fri,  6 Mar 2026 01:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaIjKzJJvKehx24aMgnXIM0k9BHkirWpeabbhuSXTuJ+Z6F3Jba3EZliwsmNuTbBytKcTaxRf3lFVUV21YoGP22Y0qOwNa7M4kN/bwQcAQyAFX5NPpdZUK9N+W/+8V9MdkrzBzvPyq2kxG8GRgl2y/Dsy/JOcoQIue6329okagK82IfJfYi1tqlp9mH6s63kFKMPVgIpmNuo48nVJOE6/vNuCLWsTSggposELC8J9KD8/wHfUhtpuj0kP5kLfdS46PQI2i517cn+pBQNR90ige8SbQFSWTOP/yBarhd0dMgAbsGJGDY3K6Vg2MXi12Vfx5svKK+ciiKP+E7Rcd8RTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXtlyfNYAc4LIv8fmO3+qS6vigTbgCnjUibhjEecS0s=;
 b=b9ymdYBRq17uDy8eQKDLZsAhJrTj2umW+b62cbDN1f1kxxGdZN+Md+6LeA8Hmipr/xSi0d5WL6IYPEk7r5ldt08CCPKsKk7UM35uaJ6IEX3sMjefKFQA5/fM64d4xoUi6mIU+PQfZzNzzubGj0IyFSjaas3OUKb5XALRThKWthz6OjEi1qk8Pp1ciILPtBu64NiJgOqwdS/MFo3Uv9YuSkabR7zDo67mjacXqUli07/YlrxBs0WP5wif4QT786WP8+sC4Kpv4sJTh+S+cDEs7M8X10BUn7rQcXpxddzjMBxcx2UrWYEPCbfjnhbIaIBcoLiBGm2IO3+VgLJLfKLVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXtlyfNYAc4LIv8fmO3+qS6vigTbgCnjUibhjEecS0s=;
 b=QJAVHdVfWxricdD+2yAIQSPcBbHmIE4S9piua3KqEN2WaQFycvky9nZ/XlCfsKy3t5zoeH3RHw8+qZergV4FWWffk0fwiQiC2Yrd283CA5Jp89w/zR+dUZN7dy89OPVmMN839svrlQAn4Ru8UUMP7hSlauDw6GKBdsxdRciw3qCjwqLWLUxJrnegqj/BF3/LC1sCDNADS5mO5a0at5/1wKRsH4m6bAlMiPwS6P07e4XOXLvA38sH5GxCrIA3GoPblcs8wlKUVV8XTktHWOIXflmfr2pNW094Tc8AnZXHz7kOeVkOF8aeJfMbKXjQ/6AC2UZLVf/eHCMYBrLlWwAm7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:49:33 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:49:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:49:29 +0900
Message-Id: <DGVBLM45E8RY.1TQIDWC1ZNBQJ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 09/10] gpu: nova-core: make Chipset::arch() const
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-9-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-9-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7aecd5-6ca7-4f3a-c47d-08de7b229d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: Mjr6LyMpEYasHGg+npKI5U7pJsGpUIxvC05Sjtmm9ABzOX9BRNJXSgB2LophXNNxOsSoji82DnQm59lMQ/MxXaI+dQng2DPv+HoPLNdtyQlpYndpnVwyklfi/S3ZOjb2obTf2bDvhDx9pIwQbdb14obD1hFnbYiFB1qv7UqMaw+8D+06g8jnUdGCYzoVkTa06VXX5Na9i4LNF2ld5koe4I2T7TPyTqYv4jdKUdQBx+T1sz636Zl0T9LEtPe70hxOYa3bySH4K7rZaLSwHAd3HC1Zb/tcyKNj8PKs6k5O3stAEk8TyTbo4T7EFBzW7Onze+VYZFsZ3tv0fBLEwgDP7g/J++nEywBukNAaTyzNV7U6HKYg8WEg8t5fi3F0Sc6IaRoEUH4K1ZLp77h7afG5w4MJBZY43N247hQOnJPHUvYRcWL6moOCOPPGsjfqyA5Ka8ChNhTddlwkUm5r7P76Dw21bSTZHcZ3+S0KtLzIcpO0zemSbymeyEcZDxGvQ2MJPZzb4qyJ48wWz1Anh/eiqiZGt2zuefLU4MFvxJ5iJxuNf8786W3dAWkKwsaTnnwD/odqKWn1ZB8paolFUz6e73vKohjA+vkWZVvGrRENybIcdrM+OZo3/NHxIQrP3iiDzgyvK6JZq6AguTgqymRWm1sj/+sJj/VI97xjblgxDv8Z1t7EvRvUDsnh2JddalgnvUWDXpwP/R2B4vWonYvB0MTvx4riOE5VXWBljxF/gig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhMaHdLcGJXbmp6Zi9qTW16MlZqejUrVmV4czVHWU92dUhERUxRekpuNjk0?=
 =?utf-8?B?TDFKTkpMQjdsS1c1R0hwMGo2bldZeFRwSjVTQXh4eW0rOEFXMjF0dFlDVzc5?=
 =?utf-8?B?OHQxVysrT1Z5dmpLeVpFZUpyc3B6RE1QNm44Q3FDUjU0ZE5uckVPY3ZFVnRI?=
 =?utf-8?B?SnMxWWVlSm1VbmNwdjVpWjJzL1Jpd3lFZkhOWlBVdUw5MmRjSkNqL0h6Y0hG?=
 =?utf-8?B?cTVLTnorbnNlMVNTY0xJYkhtZTN3MFBoSmFNZ0h0dkRTY2xGOEZtenpqQUgz?=
 =?utf-8?B?RGFtU1lTVCt5YVJXelpNODNBbDNjK3N1MS82R0lIbXprWlI4RlVHWWkwTGVR?=
 =?utf-8?B?TlhGVXh6bEVVdTVscVh3aWlYS1h3RDUvMTBFZWdwZnIzZWtHcWc3MmlpYnc0?=
 =?utf-8?B?blplM2sxb0R6ckllZjRBNStqdzIyUFY3a1o4TlFwWXg3Z1l0eFpKVjNDa2NB?=
 =?utf-8?B?TjVmR09qTVJka2tGMWJjbUFUcmFzU05adEdmUDdtVUVIWTE3cXA1bUlFNEgy?=
 =?utf-8?B?dEJkMUZOdUpzOUJrYUFuUVg3S3ZzNnBJSWkrRXNJdmt3Vm8yU0JMNUtIQTZi?=
 =?utf-8?B?clNRampnY1V5WEJWZExUMGJQWk5XM014RWtDMEpOYzIzb3EwZkx1L2hDU0NE?=
 =?utf-8?B?SEtMei9jQnJ1cERrbWpmcEdrTXFnVEp4dlFhZ1ZYekZod0JTbWVDR21IUThL?=
 =?utf-8?B?WWhRenIwMll2TmNPSFhoSWZGemprT0dmai9GaVplQ1VUaXp0bkNXK3lxOUlL?=
 =?utf-8?B?Vmg0V3JCUzBIK2ZGQy9UZGczRmhrempxVWZjRHdEdHl4YXJRL0xFdWlpNDhz?=
 =?utf-8?B?L3o0YjA5MjZQbi9XK2tFZFcwZGxsakVjd1pRZFo3REhnMC82MWFQTXpKTGlS?=
 =?utf-8?B?SjdxOHpibm1wdGVJcGVTZTVROWJlSm9nQmVIcDlCUUppUXhmRm1wTzFSd29Y?=
 =?utf-8?B?NjA1YVVTeG4yNVpQNnA3SzY1OCtWNjl6ZXhob1VBUTdkUTEvT1JiRzJ1K3BW?=
 =?utf-8?B?QWNCbDhRcitVT3pyenJOWHJHOE9DR0FOWDVXa044V1dTRDF4M1F5K2wxNjFh?=
 =?utf-8?B?R1laaGJCdjNDQisycVA5QTVycDJaRUUvSDFBQVlzU1k4UEhjUVNNQy9SMjB6?=
 =?utf-8?B?TWVzZzlIeTAyVlloMnpwTmRsRktQaXgra3dqTTNpYjB3LzNwaS9IREhuS3kx?=
 =?utf-8?B?UDU5NFR4V01uZ2owanhLU2dEanlibFQvdTZlOS9RV3pTcytXRWkzdllEMFRF?=
 =?utf-8?B?cERXeFRiL1E2SEF0WnFXbDYzcnJnNFA0L1NnWWtBT20zaTlrVUNHTzBmUWdl?=
 =?utf-8?B?SWxlelFHejlXVEdBdjZBZmMvV2xPZXpaeDBnRzFQdXY3VEd6SFlSODVKeGFG?=
 =?utf-8?B?R0ltMXlFUGRETDYvLzBidFVySEt2eXc2L1lBZ1ViMVY4djFNRnYwK01HcHV0?=
 =?utf-8?B?TTdocDNjYXNnblBvWkh4MzR6ajZPWnhZNjgxdzFtUnF4L2pYZThyMTBRL2RF?=
 =?utf-8?B?K2xGcm1Wd0ZUOXNkS1dDeEUvbTFOM05wbGN1MmtCSUVYaUtIcWFGT2pLeUlp?=
 =?utf-8?B?OVpMWU01SWliaFdwZnowZ1Y3ZWxCOWVNU25lcmY0RWgwdTU1NmtZMElHNEJ1?=
 =?utf-8?B?TElYdU1BZ0F1VjlXcmJvdlV5OUFQTWp3L0xwc05CS2F0Y0F0QjdMMjBQOTlR?=
 =?utf-8?B?anMrSGtiSDhwcWV3alNlRm9OOElHNkQ3Y01QcXc2R1N5RTNZaDRpRzBaWGZp?=
 =?utf-8?B?RUxmRVZ0VnhNcSszMTFqRzM4dzA1bzJuaElwSVNRdkhpQzJWOC85aldFVDdF?=
 =?utf-8?B?VlNXMFQyM2haemhCT0ZBcFZrdnBCWnZPc0w1Wi96SXljTzhQd0E3cGtkT0Fy?=
 =?utf-8?B?SXJsaXRlWWJRTnJTekdRcEdmN2Ira3FHN2c5c2laaUhEampTek5IZlA0enRQ?=
 =?utf-8?B?dnc4UkdOZUxHYjdZZmE4OGdnOWNZMVFacXV4WE9OZU1ET1oyZnlHNE9PWVRr?=
 =?utf-8?B?NFd2bVVNM1FVcUFHd1VYMGRISmdvbHEzYzB2U2RHTE02alNuYXBpdC9EUjJh?=
 =?utf-8?B?Zks3bGtVOEsrUGZodTBDaXFaVWplN3hLdTVUbk15WFB3ck1rU0xpWHgrWit1?=
 =?utf-8?B?YU5jMDNmcW53YUkrd0QwM1dVN0NMbTNacHdYNC9LMUNjbUJ0cmFCQ2VoWmRT?=
 =?utf-8?B?ZzJIKzdPRmkzU3BvUzd3Z3gya001R0RNUFluZ1NXWThOdVd0WUVGbzlnNnRE?=
 =?utf-8?B?K0ZxM2c4YXI3WDBCZ1FCYWtKNXRTc01pUER0amRiN3pFaWgyWW5Lb0FaajJp?=
 =?utf-8?B?YUJnUHFEdGlZejJnQmU2YjhkcW9RRFdiajRjSmNURlgrQVRRSUxnTFZrYjZC?=
 =?utf-8?Q?/T+bkECygJV992FgF+QCR7gDJ0+MUNkWJ/UFGXC0z+opt?=
X-MS-Exchange-AntiSpam-MessageData-1: gtR/n5qNR84mWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7aecd5-6ca7-4f3a-c47d-08de7b229d41
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:49:33.2057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Esyt/lBYH+BqqY5pUzbDMaq6E8HdEx3ysc2x4IG/ejOv793550qysa9nJvrOgFhZH50WkagYXU6PU2ykEtS9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
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
X-Rspamd-Queue-Id: C421F21A598
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> We will use this method from const context.
>
> Also take `self` by value since it is the size of a primitive type and
> implements `Copy`.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 60c85fffaeaf..c14d411c6759 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -92,7 +92,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>  });
> =20
>  impl Chipset {
> -    pub(crate) fn arch(&self) -> Architecture {
> +    pub(crate) const fn arch(self) -> Architecture {
>          match self {
>              Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
>                  Architecture::Turing

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

