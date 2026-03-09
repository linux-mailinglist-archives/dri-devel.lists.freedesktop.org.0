Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN/BEJxVrmlACQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:07:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BF233D97
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6629710E487;
	Mon,  9 Mar 2026 05:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="We6e0mmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012043.outbound.protection.outlook.com
 [40.93.195.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50410E487;
 Mon,  9 Mar 2026 05:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwqNc7F3F8KKy7tVjcSU4sAmK6p4U5e3KWBMucwWgSISoKrUb91qnIk3LAxv0m/r1tfKvwUU4LbGf5rF492D3hpvLa/ghlMN8FinBW4hsH5/8tvY/vhcE450IrcQVwY9kEcDE5yH4Ir+sXKbYnyQxs9lxc5xxyd0bTSfl4HNu+baeegVkPio411An+qrTH0v1DBji7T2Ykd4/Gv54iSsEm5XNKw4ypG5XwesFWoBitD/3MQCXD0O5u4PzPZTV33za9/cI7wxZMrSKVYo9bTkG09ISOZvDPcJigr2c26bX52y8krI+Wwr6gmvbNSwYhTTnGdB+0ebWd6/XdJQnicQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NDEr9sM4iDDmVFyRmmRKFkSA5UdIG+DsVS+6HG1X0Q=;
 b=mt78N5B3ueFhu41XI74BPZE4vr2fuKXyiQ4FcIpJqWj7dFQRp8ELLs5PyqKL/qroA+SQGbjgMv358JJL+ZK+hhnHe4G/nJUuVOKaB/Dn2HBspQw85P/l92VRrftAuFpDTcLUf/WNMqGGmos+wO9C2Qr3DQz+9khMwD+zfXkkRoEjGg7Ro8nQC2ZeA/dBEZcxAhU8uQPpmfed+klOPtYohkooHu/HT5CvdHIDY9oamfqrCU1ElPxruMiW9nYqtJXJGchBsdrYu+dkzn0jzE/vw5ypbjOFGu2s55EFONf3E+bMvduHuOyTF5xKNrJlDns4kcxbtQaTFo6qEx/cC7AthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NDEr9sM4iDDmVFyRmmRKFkSA5UdIG+DsVS+6HG1X0Q=;
 b=We6e0mmLHyZ0prz886tFnZb3pxC9Dk5l9SQce0hMQUwpC1rGX3yk3+2/0MfCdd+kIjhCwODzuGEt8XMF4/NDomdA/HI1EbQcuWrpGeOcRymvhVkY6EGhn4tnNzPwpOXZB3Yl4x7k4RhbIVIN+qHSnkblMEiwEakHdfvU7dBokmAgxeFTD4KrsiEak1J3S6+7HHrnZLsRyao+qe1efjOgl0M/TDWC3rj5DW9Ads6QEdPwt/99R97sp7AVQXhtk13qq+JpZbMb++kAFDFLLweyXvOQNYLtf7leOkSUes/dFFSBy+z5oQ1cFmROO74Q7X0nG2qg4i5Y91BXhG9OYg3IJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 05:07:29 +0000
Received: from SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42]) by SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 05:07:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 14:07:24 +0900
Message-Id: <DGXZORYY7PZD.1XU3HNHXCKBM5@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v11 12/12] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-12-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-12-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: TY4P286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: f8451a1f-997e-4d84-3ef2-08de7d99c241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: N1ojnV4t+PxT3kpm9nPir1l3UCWvwsxmO4jAZZqDt8pnFYnk10qqiEABK2VUQlNkBiiTK/pUODgR9p34Em1PoQb2S/BpsfhXD3BPo9GzRZYoccOJ9eMssKzHlxulVbmxTLMxeVh+dTxSTkMdDtqaDWUr19JjcVbXmimO+cGMS8xQcd5Imf1SjXdwclHJ8o0ccLxn9OP+vHhNvUqWBPj8/L0nP0roPtJjJaOubOJQxvE/5l64/ahlDW1enyYwc6lHmwhNWp2YVJ52jG7F3Aq5V/MFVEaKbCWRwS0iMlu8kXJmTFWLG2Op6BAADyby2EYJz8L6UKfu4Bf5IAjinnsvKsDdlvRwXt4kp+p2LlPu+R+l/IlE739XPUp2RnFTsaG02inLj5pBUxzEIUx5xffdpCvfqX5T4ic+DCk2fBrB02pFEorYNDYUf2nL8hgOFBqnYGm0dVAI630Dd4U3fe99qsqtZlfM8nXkPY09R1tsLsT5oeYahjkif8HzGjTsJegE75KyUkl2/4m4qzfMd8sNcoh8hHacQLCXCdqiJoykpVWIIbMVOpSYpO+5O24I0HI/J+ejRmbN682xh4Zmhk8O/sPJxxrI56y0q1Rblcyq6jD3sLMMupayw8TamIzl6Q3G1aeNa8oTI2wvsDCGVMntklo3k6oGBBTDPHKED0WmvKhFlbsWrGTd293jAXXKxmUdJhGSiY8OWJwravqPO1bycKBuLyqX/N28vV4vGrS0B9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2368.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFVoNVZVN3pERHJjVDFESmFLRDluSjA1dFp4NENWOEIwSW9yWkhzM3RtNnd6?=
 =?utf-8?B?bHZWZFVZUGtZeXpBcE9UeDgwdlB3Nkl4WE50bnZOR2RJbjdYNWJENWQ4Zktr?=
 =?utf-8?B?dDdFaGYzenBidW4wWkkrbVlNS2xrd1ZZeThPYnZwMTd5VEhFYXRYL0RhdFl6?=
 =?utf-8?B?aExaSTUrTGNVZjlWcEkxMG8vdFpGSnlpSURvb0NUbUZERVB5b1UwbUgzckNl?=
 =?utf-8?B?dmFwb0xmVTE0WTllK2ZKZGliL1VZanpVSGNMbml5K1VZdGFOY0xwbFpOcDA5?=
 =?utf-8?B?UzlaZUNqQ3JTcGpxNlR5SkhmaS9iQnNvYjhtRkxuYzJvZklhemtpWVdJenU3?=
 =?utf-8?B?cUhhb0lFcGQ2TzNsNy9Gb0N0Vk1NRi9ZVzM5SXAwekdnbW16ODk1Z1JRem9p?=
 =?utf-8?B?MUxqWlY5SjFRbnI0WnNCaTdpS1FwVUl4MWZrMU54UlkvRGV1aVEwUDlHQzI3?=
 =?utf-8?B?Z0J3RWkxNC9GOU9UeXFsMnVyZ2NvVVptRHpqN3JPeEF6dmtRa1ZJaElRRVJ0?=
 =?utf-8?B?T2g1TXJSenJ0a1dHbXRFblB0Y0hyc3FHSTBvZ3ZnOUEyVU5zYUxPWnR2cTcv?=
 =?utf-8?B?amZLOElXZFVEU0ZCaXdrSEJXWEF3dVhuVkhHRU5RWWNJVWlvOC8zLzBsYysz?=
 =?utf-8?B?S25ZZVljMmNLVllWdnE4MWRzdUpPRGZqNm1XZStJVk4wZXNRTWN4R1JVeGt0?=
 =?utf-8?B?ckNIMXF6djlnc1dWU1l1cDBpdG5GM0RzeGRnZXBWdGUzN3RuQ1BVNGFuUDVl?=
 =?utf-8?B?VFRjSGI0aFlJdlZEY1o0NmxMcnU0UXMzUkttbURiZ1JVWEVMTTBCZml1aWN2?=
 =?utf-8?B?RjRHQXQ5cVFUc2FZaGUyS0JzakpPTVlXZ0I2bE1JZmwyMzdRYTNXai9qeklR?=
 =?utf-8?B?L0FveXVZdXhSZjlkSXRFWThqdGdyT3o5QWxNTCsrbEVycXl4K05wOVRqNXd4?=
 =?utf-8?B?OGJxWk5NU2FoNldLQ1gzVWpOZkJSdVY4OE9tRkJIK3A4UG9TUDBud2FpaFNQ?=
 =?utf-8?B?cjdTelRiWVNiVklndHZnTzYvNng4YzFCWWZqS1VxSEI4TzY5S21tY25JRG1t?=
 =?utf-8?B?alRLdmtRejZEMnJBUUIzSU8wejBiYUYvMS9rMW1MNExmMHh4SXFCd2RNbkVh?=
 =?utf-8?B?OHJ6aFR1cDFndVFUc0l1ZFpyQkU5SURLSVJRZXFDZEVlMHlQK0xnSWpqNXRq?=
 =?utf-8?B?S3UxTnpweDh5bEl1cHRpak9BTDBqQ1N0TVA5eGkrVkl2ODVNdUttUU92ZzNh?=
 =?utf-8?B?Y3dFUXZYUmxscm0wN2VRdE5FTTVNbzhtRENtMXZTd0dUQjV2ZnErdEQ1akkr?=
 =?utf-8?B?V2xQVllncWFXcUYzUnl3Rkg4RUY0aFVtQ0dlRGZ3ak5mOGRhNGVYRzNBSGtZ?=
 =?utf-8?B?TUtiekNtZ2ROcFB3VzJuVVJFeEFHcDFoeCtiZUlONmhWUzQ2S1RPMEM5ZEM5?=
 =?utf-8?B?bml5L21WZ2NvN3BMZHlKMHJPTERYSVNaWUh4OXQwRFlVNjVGTEdlZ1g2VFNp?=
 =?utf-8?B?cG1RRURBcmpyZlZ3YjZ0VGxpUXh5bTYxSjRUQW1SVEFkSzZCTHMvbHV1d3Rx?=
 =?utf-8?B?cHNUSWJNRXJMWWMrLy9TN016QUdMYzJ2UjJuVlE3aGNNMDlqUkhIYzk1RUQz?=
 =?utf-8?B?SXlCWmNyTSswcWEzbEdBVjY1Vi9ldnYvTVZCRnpzSmdGNDJxR3VUTU81aDF6?=
 =?utf-8?B?VUh5QUdJeG96YnlRSmhFTVZmSUVyWWY0eVVSTWd3Z1IzSWwvVzVqcDNVNTdC?=
 =?utf-8?B?OHVqYnBSS1laWThxanJLeU1KYXZDN1AzQmlXK3ptcXI5R2dVckJoVVVvUktI?=
 =?utf-8?B?MUNySzl2OEVxSjFVRzdTdFZYVmx4YXQ3V1pNSUVvQmZ3bGtwUU9ZYjVVVVVS?=
 =?utf-8?B?R1N2ZFhjWkVuSThvbW1NYVIwR2hzZzloME9YSjlUc2ZkQ0JFOEN5UnZEbGVi?=
 =?utf-8?B?cUVZbE9Ec25FZ2xLc1pLa09IUDczaFRvTE1lUllRNC9EV3pidUtKeXlZR3cr?=
 =?utf-8?B?aGRGMmwwTy8vaHJBSytrZUdJMnJMSjVnbmNSNWFZRzBGS1Z1TUl0ZHNjRzhZ?=
 =?utf-8?B?cCtKMitKYWdmY1VJdjZCQ3F3NWVZcFhEcGVlZVZrSkVZc0owR3VtU28yQThZ?=
 =?utf-8?B?ajFnU1dqQmlaQ2JWb1JRMHk4UnE3Ty9mNS9GVHZQVnhiQ2JWSDBCOFFRSFNV?=
 =?utf-8?B?WDdvTG5BNHZjTWw2ZGhpWUFaWk5WN2dxZlBPaVhBZDdXL0VZTkpLN0s4ZEZN?=
 =?utf-8?B?dlBQdFBoYkNwVXZlenNWKzBRQTMxNGJOQnU4cXJPT1VHYkVYbjBBbFAyUzFy?=
 =?utf-8?B?SmlrUEkybFpjcE9DMVdoZlhqRnkzVjZ5aVcxSjFCNHZQbFFGOHYyUThlTjlz?=
 =?utf-8?Q?Z4AVfltpykqLIm1Z10ar9z60jQkO0ZVxYnBD2FvQgE950?=
X-MS-Exchange-AntiSpam-MessageData-1: 35uKlNLw93goXQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8451a1f-997e-4d84-3ef2-08de7d99c241
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:07:28.6493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6qWGNjkKELqD1yON9ifiXm0MLvlVFJQDDVUwTinRdz+WIIXXYrb5R79xqzZitQozcSg/SDrYNLxRsUwlt6uZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
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
X-Rspamd-Queue-Id: A58BF233D97
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
	NEURAL_HAM(-0.00)[-0.958];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
> +/// Descriptor used by RM to figure out the requirements of the boot loa=
der.
> +///
> +/// Most of its fields appear to be legacy and carry incorrect values, s=
o they are left unused.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +struct BootloaderDesc {
> +    /// Starting tag of bootloader.
> +    start_tag: u32,
> +    /// DMEM load offset - unused here as we always load at offset `0`.
> +    _dmem_load_off: u32,
> +    /// Offset of code section in the image. Unused as there is only one=
 section in the bootloader
> +    /// binary.
> +    _code_off: u32,

I still think it would be slightly better to use this value, I posted
some more context here:
https://lore.kernel.org/all/DGXZCHSH4JPB.1ZZW2B72MHCMT@nvidia.com/

> +        // `BootloaderDmemDescV2` expects the source to be a mirror imag=
e of the destination
> +        // and uses the same offset parameter for both.
> +        //
> +        // Thus, the start of the source object needs to be padded with =
the difference betwen
> +        // the destination and source offsets.
> +        //
> +        // In practice, this is expected to always be zero but is requir=
ed for code
> +        // correctness.
> +        let (align_padding, firmware_dma) =3D {
> +            let align_padding =3D {
> +                let imem_sec =3D firmware.imem_sec_load_params();
> +
> +                imem_sec
> +                    .dst_start
> +                    .checked_sub(imem_sec.src_start)
> +                    .map(usize::from_safe_cast)
> +                    .ok_or(EOVERFLOW)?
> +            };
> +
> +            let mut firmware_obj =3D KVVec::new();
> +            firmware_obj.extend_with(align_padding, 0u8, GFP_KERNEL)?;
> +            firmware_obj.extend_from_slice(firmware.ucode.0.as_slice(), =
GFP_KERNEL)?;
> +
> +            (
> +                align_padding,
> +                DmaObject::from_data(dev, firmware_obj.as_slice())?,
> +            )
> +        };
> +
> +        let dmem_desc =3D {
> +            // Bootloader payload is in non-coherent system memory.
> +            const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 =3D 4;
> +
> +            let imem_sec =3D firmware.imem_sec_load_params();
> +            let imem_ns =3D firmware.imem_ns_load_params().ok_or(EINVAL)=
?;
> +            let dmem =3D firmware.dmem_load_params();
> +
> +            // The bootloader does not have a data destination offset fi=
eld and copies the data at
> +            // the start of DMEM, so it can only be used if the destinat=
ion offset of the firmware
> +            // is 0.
> +            if dmem.dst_start !=3D 0 {
> +                return Err(EINVAL);
> +            }
> +
> +            BootloaderDmemDescV2 {
> +                reserved: [0; 4],
> +                signature: [0; 4],
> +                ctx_dma: FALCON_DMAIDX_PHYS_SYS_NCOH,
> +                code_dma_base: firmware_dma.dma_handle(),
> +                // `dst_start` is also valid as the source offset since =
the firmware DMA object is
> +                // a mirror image of the target IMEM layout.
> +                non_sec_code_off: imem_ns.dst_start,
> +                non_sec_code_size: imem_ns.len,
> +                // `dst_start` is also valid as the source offset since =
the firmware DMA object is
> +                // a mirror image of the target IMEM layout.
> +                sec_code_off: imem_sec.dst_start,

nit: it's incorrect to use `src_start` but the comment implies that it
would also be ok to use `src_start` "is also valid". IIUC we create the pad=
ded
firmware above (good catch on finding that!) and that uses `src_start`,
then since the falcon expects the same layout between the source
constructed image and the destination in its memory, it uses these
*_off values doubly to compute the source and destination addresses.
The aligning above is a way to make sure that `dst_start` can properly
perform this double duty. Some comment explaining this might be useful,
IMO.

Apart from that,
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

