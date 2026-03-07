Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJtaKg1yq2m6dAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 01:32:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D67A228FEE
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 01:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2FE10E16B;
	Sat,  7 Mar 2026 00:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ix4bQZN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7362610E16B;
 Sat,  7 Mar 2026 00:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHJRvJhwrjKHUA8TlJ5HEGPQII2T4+8P1eBGPhXZrdBXGL7r+QHHebdm/4whsy0gshvhqCGQSXnf83af9JXAw50xtedMB03j6x20JaGCbHU5JoOKgpTjKE0qbUqTIErBff5MA+2ZZL7qNkXmU27gq/a3n7Od+N1hnUKjEoHny6G+f27YdXgOu04oo13n1jk9i+LxQqDYvaGFuzdl+hOfu1HYzHvg7M6V87l64929xsivSJ7HGLokvbQqRwWZP5nYcwecs5+8IUSuUEVTW/Dn627CV6OdLc+kTn7gl38cZ2IbgaZhKdYxL4PnGZm/+34rus12E9eeLTZNw16qtFkWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okRw990TBilXNGOuvNqfBXTxkn7tC2GrRK93MwqCN20=;
 b=KLzAOw/q8MDhfb5Cn1pUvc3en5G6Qf2JKiWZ18MyI9cWc/7/ptXNEtkbqoK9YYc+RsDxVo7i0jaQzQTQeC1jbQrvMLPkE7YouqwRdCH/kpXWMbzQe3J1Cwl7RSb1hB3Z9JZ8flurPWb+slGAf7oC5me/1iTok4qrymxFCRuxy9Pmus0fwQEBp4dBpt6J3d2/GFsZ/4zMHDVRHEdhIYwn9FsJ6i8nmV+ctVxX9lyLbxNIXrwJLUZ8g9qd1ofZ/5vEHaszzHN4RfqU+X03wYiScTP0uRRXebWzqRD0RbI8aS7gGAsnIE12sJDAhqIzUj7VD/QFUe+PJ2yCj46RENWUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okRw990TBilXNGOuvNqfBXTxkn7tC2GrRK93MwqCN20=;
 b=ix4bQZN67/DI2k3oNNuS1sbsVuUrFoCry6P7COCvhOTGng8B42om2Rsc2YwzkQiaiwFbmc6CUQai1Lvs7CuGi/gWsZL36gvj1KdmBrvH35G/YBuyNQCpE/KCcarvNbMDqXrKK6iNY5sBH+VaLO5Vu2KAMJlrJUzoz9j9ahFaqoMsHIxXdqM3lsBt123gcp4g2n5dfcNPId2zvozeXuzflDeOVxlTVNOkuGfjJTDASa97iPJ59nz4szgqA/V188TM9tobi4pFEAUsiD1LcVD4wJo1tv/QigZm3Jokbt2G6+rg99us/hMma7/C6RmC2y9jWDj3nCPEfP077lieoT3jmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV9PR12MB9781.namprd12.prod.outlook.com (2603:10b6:408:2f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Sat, 7 Mar
 2026 00:32:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Sat, 7 Mar 2026
 00:32:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 09:32:00 +0900
Message-Id: <DGW4KTZVH0FR.1P3LGSR7HNUL0@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <aliceryhl@google.com>, <simona@ffwll.ch>
Subject: Re: [PATCH] gpu: nova: add impl_num_enum!() macro to replace
 FromPrimitive boilerplate
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Artem Lytkin" <iprintercanon@gmail.com>, "Jesung Yang"
 <y.j3ms.n@gmail.com>
References: <20260304181420.5482-1-iprintercanon@gmail.com>
In-Reply-To: <20260304181420.5482-1-iprintercanon@gmail.com>
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV9PR12MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a10e2d-13a4-48de-5513-08de7be0f549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: k23LLVR8gOetNfPQYmioqNSsUWrJaXgyHNwTKiPyAwRyfFrEAI5dkmYV2gqCkJdB9uRq6Ggh9vmdHlPQDqfqq6uehO6MUu7qVENZkkRwZLsQeBCWEuQwOiANu/pEcsNgQAlR+SwaLUm7gVDz8F7eFeUymlSvKngWelqjsaAcqWK0MlNC0tJspZdgHrevA95MbENLhBySfiyxXDn7Po0DX2ZG8cPZK+yyEazujNedsOwUR4Ub+X0EidAXKQRYuuyyEfpVyFUFyCvLrdFWgT5Vrq6c1MVVqWpeKun8C+oxWagooXytVaZFcyPSHxf31EzMPpoU97losYunomRmqzjxA2jdOO3rZygqvaDGa6xXUr1uxIH7gstNbonmCVejuKu+GUURqHf4qpnZc97R1YQtpsLpqOwSULpSIHm6oz7i/w505TejEaKqf1gw85iaqVi4sHfpqG/8SDRbkw4STMN6QEUeJcgLwpp2aIHc/QBb5llCqvNM4bG1A4s9qRy3HAOhhP07VHuiX5APbNsyVS1QiCOftuplAfnNGYMNRHPqsAhYCzC6jCmJxKOpF4Wo9SP6yXhHviCuSlEo+2bkrEWbq0myBVwopSG9dkLcUd5aYnywZJb/+2W0Wa+hh0xw8xZkCNCE44kYRf97lVu0XaRlp9IXConp9evAS6uaw5qw5h5LMBHdDWWMOmF2nirz/LKNLhcHrHejdb4n7LFP6DpQIzrRUfpfL0U+8TqTEOhySJ3CnXNiwQcj7uIvqW1qi1Gu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdPTy9XMFR0TWpBRGNSa3hGOTJkMEVQQ1F2OUUvMzhKL09yRmxGdW43VGJI?=
 =?utf-8?B?ekU1VkNlRHJwR0VwRERZM2o2QXMrVC9MY0FSbjFUajRxUUtkdHRGNk4wSU5T?=
 =?utf-8?B?UXBES1l0RVhvZHZXWUJLa1dsaFJzc1pINEhucUNxc2sxamFGUVlrd0FHUzNI?=
 =?utf-8?B?UGVpdm9vYnRLQmZ4ZGZEaEQrUy92cU5LaFlCbHhqamNJdzZqYkczWmt4UTIz?=
 =?utf-8?B?UXcvVjhxN0RzWG8rMkZJcDM4MWhXdUlaK0hqNE1CTTlTMUhCNFVTOCtlaVdz?=
 =?utf-8?B?RE1wL0h0SUFIZWI2R0txMTJzVFZ5MHg3K0FjdnlrYkRGWUV3OVVLZmdoeUhT?=
 =?utf-8?B?eDFjNklEMSs5Yk94OW05T0tVUXZ3d29zNFdvUFRaNHdKNy9jdFFtTkZ3TkJK?=
 =?utf-8?B?TnhBSEV1eGZaMWtqQW1haG9IaHU5THBrSWczbFpLZGZrK2R3d2Uzb1lZSUds?=
 =?utf-8?B?ajAxOTU0ZmdMZWhIY1o1ZHVUN3BqWDlxeUN1MlB1THllSzlxc1Eyc0ZubXNK?=
 =?utf-8?B?Mm1qTUNXRDJoRmNvMjFJYzk0QitUZjM0RWVUOXRBbWhQWUtZVG9VVHFicUdN?=
 =?utf-8?B?QXZlYXc4U2x1MXI2d3h5TFNHR1djSDJkaXFGY3dmVlNLWGh2SjdXUkJ1djVt?=
 =?utf-8?B?VXNWZnhVQ3RFZGVZeVRzNFp1eER3ZTFTZi9EVnRzMVIxTFlKV1UwSXRodzNo?=
 =?utf-8?B?QjhSRkVuNnozOGF0VlZqVDhXb2NpZ0R5TTVkdk9MWXh5MjNseDVnN2U5M3JU?=
 =?utf-8?B?WG9IaUY1aU03RE53UXQwSUpYSStTb1pnQVREaUpkcVBTVlVjZ3lXZ0ROSThQ?=
 =?utf-8?B?K3A1S2toN0JGSGFjVCtPOWYzWFVxMndzK0RLZ3lxVTE2c3p4Wk9PNHNEdlZk?=
 =?utf-8?B?R1hmdDRSM1ovM1dsd0dCME9hNnBuQnRVbFdvSGdYemswbFFGd2tDL3VhSkdX?=
 =?utf-8?B?a3pid2c4SmZsTGRXN0RGYzE1bm1iRzR6R3ZLOFBnNEhRTDJ3TzVGOWcxV0Q1?=
 =?utf-8?B?bzhIZmRpTzhyS2NNQkR3M2Q0UmJUWXdBY3BzSlpYNklGNFNudlZoL3ZiOC9t?=
 =?utf-8?B?WlQzamkxM21Gc1ZWNlRzMTdyc3VXcVQyU1N6aUE0Wi9Sbmd4UzhmSXgrN2RT?=
 =?utf-8?B?V3RBSEM2TitDWTFycm5lVzVhbVh5c2djS0lJUUNsdHFCMTBVSGRZd2dEbWp5?=
 =?utf-8?B?djNFbHRWT0dpOE1LVUxOMmFPYWRzOWt5cXg5ejhJdkhwY2VLTkZnSWIzdGhz?=
 =?utf-8?B?OTV0NnFkRzRCN0pjT1FuYyt5NE9rZEhYbWhDUjlVakVsOXcyR3pVeUNFUDNn?=
 =?utf-8?B?QUhBVEdPaDBmM3h6NWxsczVJVXc0UzNBb3BvbE9RYjh0TStlUjhlTFB0VEsy?=
 =?utf-8?B?NTNtQmNuelpaanNzNXRFTUx5YkVlM2NCM0RVaS9UUU02eWxXU005VHRwV3hI?=
 =?utf-8?B?aWlJVlRWQVpJKy9KVmlHNWh0cXJHbjJNcS9La3ZEV2RCUlk5NXgrRmdYY0pJ?=
 =?utf-8?B?UFc5dXYvcFZmbW81V0ZXMUFic1h3T0NJOGNIQ0VpSXFoOHpzak14eTF0OHFB?=
 =?utf-8?B?Qlp4cEdMbUFyTUhRams3Qkh2N2JKaDg4NU5FZ1hXNXAvMWd1bXVqeXl1NW9x?=
 =?utf-8?B?QlR5Q0NsdVg2RFAzT2xLdkJkNlgzVEZNRCtFb1JHTlUvQkZRMitLOGxYSm9v?=
 =?utf-8?B?clJmU3lLSk5wclRXQURwSUoweWMycGJTUndJdUVHZWdxL2lSRkVmNkxFTWNs?=
 =?utf-8?B?eDR4cE5venN0enJXeFFZWVBONlk1OGZxMDZFRi9tdFpmTUFnb3V6OWNZUm4z?=
 =?utf-8?B?TjJIUHJwWUZZKzdPbkt3bVBjcmtveGViNWsyVnlyRDdhT3Zjb0hjR3lBVFpi?=
 =?utf-8?B?bENNemhRU1l3WWFRZUFXdGFUQnVuZGFDOXN2L2pVVDRRK3l1OTdwemptaE5I?=
 =?utf-8?B?RExjQklYdjg0cWFuN0lZdjc1dDU0WUY0ZzBGd0FTWVExMmlQT0MwSEFiSmYy?=
 =?utf-8?B?K0xhWFZEWU5tSURyWHNJMVFpaDVUZVlIbVRSamtUaDBacWFWaGhUdk9CNVJK?=
 =?utf-8?B?MzkwZWNmejhvOThRQXZTc1dsTjYrdzdZd1RKWWxDUDg4SU1paDdLdit3akJZ?=
 =?utf-8?B?UGpaaVYyc0F0eXBCa0ZIMk5lVXBSaS94Mldrclhaa0dDcDQwWEgxZkJ5N1c1?=
 =?utf-8?B?Qkl6aTZzMzMwMlhVdjc2K0J5YTV2cEtEQW9oRTJ1UUZreHI4WUV2R2kvK1BC?=
 =?utf-8?B?T0U3a1E5REllTzBqbkNwVzR5R001R0hmMEJJVXk4alBRZEowSERPYWhzUVY3?=
 =?utf-8?B?dTVPUm9CQ3FQcWxQTVNiK0cxaW10am5Sb0Z4eVRFeTZPYXRIbk1SaE1nQTVk?=
 =?utf-8?Q?0NIcqwqsQrN3dbVNmJLxh2LnFMK6q7TZLxlU39HKy9nH0?=
X-MS-Exchange-AntiSpam-MessageData-1: OsySYpnbtXf7vg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a10e2d-13a4-48de-5513-08de7be0f549
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 00:32:05.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTF7PQb+Mjrb5aRsLIuyUJpbg3l8zJIYisZ9a9urEOQmXijNafOb/UvD+jA+4/iCxe1YMBh4LZVW4vLu85sdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9781
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
X-Rspamd-Queue-Id: 0D67A228FEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 3:14 AM JST, Artem Lytkin wrote:
> Add a declarative macro impl_num_enum!() to generate both From<Enum>
> for primitive and TryFrom<primitive> for Enum implementations for
> repr(primitive) enums. This addresses the TODO[FPRI] markers
> throughout the driver.
>
> The macro accepts a list of variants to map, allowing certain variants
> to be excluded from the reverse mapping (e.g. dead_code variants like
> FalconModSelAlgo::Aes).
>
> Replace the manual TryFrom and impl_from_enum_to_u8!() boilerplate for:
>   - FalconCoreRev
>   - FalconSecurityModel
>   - FalconModSelAlgo
>   - DmaTrfCmdSize
>   - FalconFbifTarget
>   - Architecture
>
> FalconCoreRevSubversion retains its manual TryFrom because it requires
> a bitmask operation on the input value. The Chipset enum retains its
> existing define_chipset!() macro which already generates TryFrom.
>
> While at it, add the missing repr(u8) attribute to FalconFbifTarget,
> which is needed for the enum-to-primitive cast to be well-defined.
>
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>

Thanks for looking into this - but actually there is a kernel-level
effort to do the same thing in progress:

https://lore.kernel.org/all/20260129-try-from-into-macro-v5-0-dd011008118c@=
gmail.com/
