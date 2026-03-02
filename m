Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E/kIrE6pWnt5wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:22:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F001B1D3D46
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E8E10E448;
	Mon,  2 Mar 2026 07:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g8yLRRah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010007.outbound.protection.outlook.com
 [40.93.198.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FEE10E448;
 Mon,  2 Mar 2026 07:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9qgV0DYULHCUJArymdbD1BsOExQ+Qg+r/b8Ov/YpjaxAPMg9YLloIu1eEBKelaJF8MsUDpSiAAarndyKrF5K8ddZguPFJ6ZtfDaRu9RxZXwI7xWZdpmBrP68M90rnCuXmb2y/PAJ3y5cP5bzTGMe/U2Nc/dvGmamsh9uryU+lK7jQMjVSMQkV3JqCyfE1GaWiFI//9asaeF1o7v2MqYMeghqfAukv73yAg8qbS1bDFCRsArFqDzrNx2EcCSGUa0yTzE8zn6dP1t/JESQgNYVghAshujSNXXnF2J6IBV09XQV0ak1eH2xpVRtnTflVHjcoMCVuvSdvsMTq5pJzhbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi3R2un5SRNIYwkOaYhE+AuEGTU1fwhJz9aRJfKC4gI=;
 b=f0F87FECk1DwO3a2RPOCduuug+LUPVpcl31ua4Z7uHLBGLNoVNe/Z/GSsaQ+mK2Vuy9OuBQw0dsV7duYqFjXNOjoNYCaxA0mF+JVa/Bl/TNrhQQXedZXfDmlyZdLdxUvmIcXfEBi6VubrffKdUcyLkgC2Hy4GJd8HEYhqLyvBKf7dp3UyD35M07RTcMfoRwnf/G+tjiSrdOf5LlqGGeZcmIT7DxTAwXJ80G7Od2AA+gdaAC+zt1NQgWtpDnBE6JnIu2h5lcX45gIDDm2KZxvGj+jDYTsUjtBLq3sX9J9dBMV56+MKvaWDWWV7mjMYXbqgxusoTJj4y+wT36Iad3pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi3R2un5SRNIYwkOaYhE+AuEGTU1fwhJz9aRJfKC4gI=;
 b=g8yLRRahsKQb8mFcKTuF2med/GkhU1fPjjK7H9j/tW8FFTSoNZqeyg+Ngkc2RFGXoJTqNJ0t514U0k4UUQ0cSnaKjPqFI4y9pN/2N6NLgT+0C5IqYT+IRnHMe6hEKuKR+9QeR3kBX6RpQXSrVHQEfZkuAqbjF1wviRgur7p1u6FyBwWRWu5/xJ84IlX5Q/4bnlQVf/kPCocRbZ0peG7IN1orMS5V87vsdo0FsjddhrFnEoFa6x5ygm7HefjX//ZqpGkQbsaTdECDM6USgRDoFbIboSEABY/ev909RYqCe0dJwZRMGnbPMJqWyhXySo/BinmTqz9wEcY7WuitgI+WmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 07:22:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 07:22:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 16:22:10 +0900
Message-Id: <DGS465GNPO0G.1WKMAHMPTXLNN@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/10] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-8-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-8-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:405:379::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f73f8e-59d6-40be-cfae-08de782c6dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: rzX6gRw/xR3vqRuvejNp0bLlO5vmnu+6d/9do4mwmGNq6RgiWShh2RdpHKM3ZVithtqVpDG1zesQ6jS3iMAktMSos1ET3Si1B2ZjMCTD1QVC/NeYO8V9UxSb8S6ztv1S0uqM7B4WP0NUxKhsZFFUlZaZXp80UZeR0bLHx4tD1lJsqP5MrI1apq9lENZK9u+OmwnxhTSrZnRRS/JtTUROVVkQV5+Snq5UGtn4ovXddQw7j8PRRmMtGv/BKMploz0tmFP257Cog4Aa0S5tklBGKddtticGR4HUdxn404lNdMVYZ6qnsWmAWwDQfOcrWY1jF0WN/Mou4lOGzfh5BLqz69QUmranUsq6znWPI8Q5YsZC/5uBH83fqQf/PC6fcZnJETQw3hBF7b/vlC7NZt0jYV0t8Oq9tyPC7mLEROi5JjC2lg3Dg+rmttH9Yl8NzYyFt9ug+VHYIleKYIPbSskub18XyLfDbiWVyRBfWo6/8w/KLeZDZ7MiaYuXiK7i4OJNSFIj7u3CqktEEIDk5uEoZOSRmr/vtYPzDXw4UEDGcZeO2iVMpcmac/MebdkJFXHkP18XxhCxKqhLCo5EQWu2dMyBsAzTElhcy1eurMnsUDFCC2ksU8blsfXhBJ7RkI/B2VWUo9Myg6dpNBo96X/+F209hAWd4vX47upkLy5EMBOJ4cjZZQkEdKnN91PnEd7btNuNQ2KRTha12EIEaHEywK/j40fwJhZROSxrAiot724=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umg4Qk14blpISm10K2Y0eC9xNEVkNlNJdmVqTmtVMDlkL0NkUmxLcGxreGto?=
 =?utf-8?B?VURiZlN2eWNjRzE0MWxRSE5BaVlvcnZNR3hPejZXRUZNWjBMRlIvcEV5aFNM?=
 =?utf-8?B?WXhtVzFxVURyNWhUU1pOTHhRVWhockRLeUlXa0JyLy9lOFFHd0MxYnplUDdr?=
 =?utf-8?B?a0RTYzZ2aGU3a0ZxSE80TURlM1V2eXRCcHBhck5SanNKQVJaYldSclNOZzhD?=
 =?utf-8?B?UDY5ZFU0NEl6Y0pmWUtQazNUemVneXlIRm0wZzNLdmd2a1RkbE0zanVRNWhu?=
 =?utf-8?B?UXNBSDRCcjhVOHBockJqekZWZXZ3NGYwVnpaMUZ4YmhHZDZrMXltSnlCR0lj?=
 =?utf-8?B?dkxVS1JYVkxEMVFpd0hkcmI5RTB0RG9XYTE0cnVJcExiczNEM2Y2SG9qOGhy?=
 =?utf-8?B?ZjV5UVZGQ09rK29STUNySmxyME5CQVAzRUIwUnZGbzVCY0xjRlFET3Z5dGYy?=
 =?utf-8?B?NmpSK0QyVHdtSTZLazlNNFJ0QnpEa2YvNi8yaDFEU2lGSEtSa2RLbHRVMXg1?=
 =?utf-8?B?SzdvMVprWmg0dC9kYlpEanN1SWloVm40NVJMOFkwUW1UUEx2Ykh4cFNFSGdW?=
 =?utf-8?B?KzQ2THZ0TFVOajRoYXZ2OHBabmkxdUdiVTJVZ1VQVmRlaUZjVmN2V0pxMGJU?=
 =?utf-8?B?ZGpRR29Wc1RoK2twR25ZNmtOLzFxUmM4SnBISlRBTGtBajZqQTVkWXYzUCsr?=
 =?utf-8?B?SjRENFNCS1g3ZDlZTmxXWUcveDNKT2JnYXZVa0FzR2RaT2lpSFFjMXE3OU5u?=
 =?utf-8?B?T09EcERaVGNLaTZObEZwUGwvWTBLMHlJanUzK0ZKTmRGSFJSMkJWcHZFRjhp?=
 =?utf-8?B?aFdRbEE4YytjcUU0OTVibUdWSE9mY292UEJpNlRVRVpnTnpScUlKVTZZbkl5?=
 =?utf-8?B?M2Q5TlFxK2tSL0ZUT3VUM09ISTh5NStmenhFbnFBNzczeUIwVkViRVNMMlAy?=
 =?utf-8?B?ckVHRXJRQlAwMmxrVGpHQXJVZngvYTFhT2pOU2RzOTR6bHZjbUxldXM3Wm9M?=
 =?utf-8?B?MEUwWElpdDFMUE56NzNPN3FsQktMWDJ4eHlLdTltck9ueHV6aFh5TmczblhV?=
 =?utf-8?B?a24vcFVUUHlmaWtDZGx0eC9uSWY0Yk5XYjZQcHQxOVVsVDc5NFhiL21xNE10?=
 =?utf-8?B?eE44dzBQd2UzZHZJejFvdXp2emE0RjlPUGtOOXFDN0JUd0h5cGN6NGxDYWZR?=
 =?utf-8?B?eFFZSUI0cFFTV0ttNzZlVTB2aDRESkpJYmVaeElWTFpGNCtEY21DVW56SGlD?=
 =?utf-8?B?dTVRbWp2cElpSEgyMEgza1RXSzhNVm5KaW1qYWxiMDFTOEYyaVM5Vlp5RXV1?=
 =?utf-8?B?R2RxNzRlSVhQekRLQXJoSzZqcWVZTmU1MUVXRU11LzF3RUtZYVpTNENvVko2?=
 =?utf-8?B?MWNHT1RNNGlzaU03QVVPemN1QTRjOGo4d2tZcEdseTMvS0JXZ3UydVBlOWJo?=
 =?utf-8?B?UlFiQi9JWU1GWFIxdUZGaUhVZ2swUVhRMWYxNlJ2UFhkNlNlRFFURnprZEI0?=
 =?utf-8?B?RStUY2M3eXIwTGNRaDVTbUgzcitMU3V6UlFOSUF3NytZWExlTVdUUU5GZzJL?=
 =?utf-8?B?TDhDVU50Q0pzQlZNSE9MTVM0YXFLMVNSUzdBeG15bTBrTG5vQ2FmaE1SMW5R?=
 =?utf-8?B?anluc1dPc0VHUGRtcGpjL3orclBwdzZ6TythVk5lR05oYjZDVzl6RGFBenZV?=
 =?utf-8?B?ckFXdTVXaldWTlhtZk1Gc0ZGVEhMVzlxRVQrMEpvQUpMQlYwVFJHcUJYZGJO?=
 =?utf-8?B?N2FCVldDTVcrNFhFQW92K2dQOFhIMTVzeGpUQmVGYzh4TVBaVys1QUJUdFQ4?=
 =?utf-8?B?TVozWE4ySmxIYXNhOW5WK3BOUFJoai9zSHp4T3hZQVNMMGY2c0pjUDIyOVpk?=
 =?utf-8?B?THM5a0Z0d0ttZGhPTm5sVGk0elZ2Z0gvT1dQZ1NMWDF4RDZJUkYyeGtGR2xZ?=
 =?utf-8?B?UEphN2ZJM2YzNk1UQ0cwVk5HN3g4cFZBMkJzUm4vMHhobWducCsrRTJWZTJH?=
 =?utf-8?B?NWVqNTlCVFRXN3J5NVd3TzZUSE9GYTZUbjNDTFdVZTRFWG9oV0hFeWJLUWxr?=
 =?utf-8?B?Mm05eGYzcnZiNU54ODhyMEdrUENjZ2Y4MWtTRVdNYldybzVINWw4YUFmTnN0?=
 =?utf-8?B?MU4xRGdEbWNHL2xaTDk0QTdlYUszeWR4ZFhPeTY0ejhpT1lNcHNVbVJsQkJi?=
 =?utf-8?B?VnlrUEVvMTdLdEdENjRTTmt5QUljblU3Skt1Y0l6Zmo2TUlPNHprREdyMjlI?=
 =?utf-8?B?NVNYSDM3eEtwNlZJMkhCTjB3ejh6cDlZNmdzRDlTTTU4SFRTME8xZjJvQ2ZZ?=
 =?utf-8?B?WlBNajlsNHVQU3B0Y0pWTi9MZVlwNVVtUlZWZ0s2em4zcjhZdG1VWSt0VUpE?=
 =?utf-8?Q?8BPJHeuYU56HsU2+INvXLbvsPL8v/l8nS1LotQ4Z69nLN?=
X-MS-Exchange-AntiSpam-MessageData-1: tyO9KkHGz8ONFA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f73f8e-59d6-40be-cfae-08de782c6dae
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:22:14.8950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsPTe+yHoI2VuatTuuhK/e2/WnbQXgC0egjuG103sla7fwql+N7GF47cJJ44wJUUmu7BmzBNYVV8h3GYyAfdNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F001B1D3D46
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> From: Timur Tabi <ttabi@nvidia.com>
> +impl FwsecFirmwareWithBl {
> +    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap =
`firmware` so it can be
> +    /// loaded using it.
> +    pub(crate) fn new(
> +        firmware: FwsecFirmware,
> +        dev: &Device<device::Bound>,
> +        chipset: Chipset,
> +    ) -> Result<Self> {
> +        let fw =3D request_firmware(dev, chipset, "gen_bootloader", FIRM=
WARE_VERSION)?;
> +        let hdr =3D fw
> +            .data()
> +            .get(0..size_of::<BinHdr>())
> +            .and_then(BinHdr::from_bytes_copy)
> +            .ok_or(EINVAL)?;
> +
> +        let desc =3D {
> +            let desc_offset =3D usize::from_safe_cast(hdr.header_offset)=
;
> +
> +            fw.data()
> +                .get(desc_offset..)
> +                .and_then(BootloaderDesc::from_bytes_copy_prefix)
> +                .ok_or(EINVAL)?
> +                .0
> +        };
> +
> +        let ucode =3D {
> +            let ucode_start =3D usize::from_safe_cast(hdr.data_offset);
> +            let code_size =3D usize::from_safe_cast(desc.code_size);
> +            // Align to falcon block size (256 bytes).
> +            let aligned_code_size =3D code_size
> +                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT=
 }>())
> +                .ok_or(EINVAL)?;
> +
> +            let mut ucode =3D KVec::with_capacity(aligned_code_size, GFP=
_KERNEL)?;
> +            ucode.extend_from_slice(
> +                fw.data()
> +                    .get(ucode_start..ucode_start + code_size)
> +                    .ok_or(EINVAL)?,
> +                GFP_KERNEL,
> +            )?;
> +            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
> +
> +            ucode
> +        };
> +
> +        let firmware_dma =3D DmaObject::from_data(dev, &firmware.ucode.0=
)?;
> +
> +        let dmem_desc =3D {
> +            let imem_sec =3D FalconDmaLoadable::imem_sec_load_params(&fi=
rmware);
> +            let imem_ns =3D FalconDmaLoadable::imem_ns_load_params(&firm=
ware).ok_or(EINVAL)?;
> +            let dmem =3D FalconDmaLoadable::dmem_load_params(&firmware);
> +
> +            BootloaderDmemDescV2 {
> +                reserved: [0; 4],
> +                signature: [0; 4],
> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
> +                code_dma_base: firmware_dma.dma_handle(),
> +                non_sec_code_off: imem_ns.dst_start,
> +                non_sec_code_size: imem_ns.len,
> +                sec_code_off: imem_sec.dst_start,

Is it correct here to use `dst_start` for `non_sec_code_off` and `sec_code_=
off`?
AFAICT, these are meant to be offsets from the base of the DMA memory and
it's meant to copy into the falcon. But the documentation on `dst_start`
says `Offset from the start of the destination memory to copy into.`

Also `ucode_start` is defined as `hdr.data_offset`
but doesn't add `code_off` from `BootloaderDesc` and `code_off` appears
unused. So does `data_off` and `dmem_load_off` for that matter.
I find it hard to follow what's actually required but it seems odd that
none of these are used.

At least for `code_off` should it not be part of the computation of `ucode_=
start`?
`let ucode_start =3D usize::from_safe_cast(hdr.data_offset);`

Overall I find the dst/srcs here confusing cos it feels hard to keep
track of which set of memory things are in. So, sorry if these comments
are nonsense.

> +
> +        Ok(Self {
> +            _firmware_dma: firmware_dma,
> +            ucode,
> +            dmem_desc,
> +            brom_params: firmware.brom_params(),
> +            imem_dst_start: u16::try_from(imem_dst_start)?,
> +            start_tag: u16::try_from(desc.start_tag)?,
> +        })
> +    }
> +
> +    /// Loads the bootloader into `falcon` and execute it.
> +    ///
> +    /// The bootloader will load the FWSEC firmware and then execute it.=
 This function returns
> +    /// after FWSEC has reached completion.
> +    pub(crate) fn run(
> +        &self,
> +        dev: &Device<device::Bound>,
> +        falcon: &Falcon<Gsp>,
> +        bar: &Bar0,
> +    ) -> Result<()> {
> +        // Reset falcon, load the firmware, and run it.
> +        falcon
> +            .reset(bar)
> +            .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: =
{:?}\n", e))?;
> +        falcon
> +            .pio_load(bar, self)
> +            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmwar=
e: {:?}\n", e))?;
> +
> +        // Configure DMA index for the bootloader to fetch the FWSEC fir=
mware from system memory.
> +        regs::NV_PFALCON_FBIF_TRANSCFG::try_update(
> +            bar,
> +            &Gsp::ID,
> +            usize::from_safe_cast(self.dmem_desc.ctx_dma),
> +            |v| {
> +                v.set_target(FalconFbifTarget::CoherentSysmem)
> +                    .set_mem_type(FalconFbifMemType::Physical)
> +            },
> +        )?;
> +
> +        let (mbox0, _) =3D falcon
> +            .boot(bar, Some(0), None)
> +            .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmwar=
e: {:?}\n", e))?;
> +        if mbox0 !=3D 0 {
> +            dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
> +            Err(EIO)
> +        } else {
> +            Ok(())
> +        }
> +    }
> +}
> +
> +impl FalconFirmware for FwsecFirmwareWithBl {
> +    type Target =3D Gsp;
> +
> +    fn brom_params(&self) -> FalconBromParams {
> +        self.brom_params.clone()
> +    }
> +
> +    fn boot_addr(&self) -> u32 {
> +        // On V2 platforms, the boot address is extracted from the gener=
ic bootloader, because the
> +        // gbl is what actually copies FWSEC into memory, so that is wha=
t needs to be booted.
> +        u32::from(self.start_tag) << 8
> +    }
> +}
> +
> +impl FalconPioLoadable for FwsecFirmwareWithBl {
> +    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>=
> {
> +        None
> +    }
> +
> +    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>>=
 {
> +        Some(FalconPioImemLoadTarget {
> +            data: self.ucode.as_ref(),
> +            dst_start: self.imem_dst_start,
> +            secure: false,
> +            start_tag: self.start_tag,
> +        })
> +    }
> +
> +    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
> +        FalconPioDmemLoadTarget {
> +            data: self.dmem_desc.as_bytes(),
> +            dst_start: 0,
> +        }
> +    }
> +}

Here in `FwsecFirmwareWithBl::dmem_load_params` it returns dst_start as 0,
except the docs say 'This has to be filled by the GPU driver and copied int=
o DMEM at offset
/// [`BootloaderDesc.dmem_load_off`].'


> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 78957ed8814f..9a00ddb922ac 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -24,6 +24,7 @@
>              BooterKind, //
>          },
>          fwsec::{
> +            bootloader::FwsecFirmwareWithBl,
>              FwsecCommand,
>              FwsecFirmware, //
>          },
> @@ -48,6 +49,7 @@ impl super::Gsp {
>      /// created the WPR2 region.
>      fn run_fwsec_frts(
>          dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
>          falcon: &Falcon<Gsp>,
>          bar: &Bar0,
>          bios: &Vbios,
> @@ -63,6 +65,7 @@ fn run_fwsec_frts(
>              return Err(EBUSY);
>          }
> =20
> +        // FWSEC-FRTS will create the WPR2 region.
>          let fwsec_frts =3D FwsecFirmware::new(
>              dev,
>              falcon,
> @@ -74,8 +77,14 @@ fn run_fwsec_frts(
>              },
>          )?;
> =20
> -        // Run FWSEC-FRTS to create the WPR2 region.
> -        fwsec_frts.run(dev, falcon, bar)?;
> +        if chipset.needs_fwsec_bootloader() {
> +            let fwsec_frts_bl =3D FwsecFirmwareWithBl::new(fwsec_frts, d=
ev, chipset)?;
> +            // Load and run the bootloader, which will load FWSEC-FRTS a=
nd run it.
> +            fwsec_frts_bl.run(dev, falcon, bar)?;
> +        } else {
> +            // Load and run FWSEC-FRTS directly.
> +            fwsec_frts.run(dev, falcon, bar)?;
> +        }
> =20
>          // SCRATCH_E contains the error code for FWSEC-FRTS.
>          let frts_status =3D regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(b=
ar).frts_err_code();
> @@ -144,7 +153,7 @@ pub(crate) fn boot(
>          let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
> -        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
> +        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_l=
ayout)?;
> =20
>          let booter_loader =3D BooterFirmware::new(
>              dev,

