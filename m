Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PAFETXNd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88688D00D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63C410E485;
	Mon, 26 Jan 2026 20:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ol9IeHWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6A10E486;
 Mon, 26 Jan 2026 20:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDDTfBzjCQYf+eybhuTtb2RD/Nf/O3lBH7n+ziZ1D7HenqZ1QD5CmEoBuIz11REoE+M0fJtfINlate5l/osHFp5Gm/2PuxNEuzSaQbEKyxsdNt6vDj02YiBSIO91TVe9Ov/MQIp8OlCzr+wP8Cp3aa1Z0Wh3Z57mIzUCDKRsZLxBqppOUpUawcH9fhXHVCTitvvhslxQOMb3Nq93qCnmRxI5ON4fla9BCamqBFUgQMJzG1L69W5Om1STUnQpfKfCORO895eRrFQCMJjBtuCZd0PWZEfwho+mNk+NxZqBm4fa6yTD95lBjJwp/+IRlmX1eqKTHqeIwgibDbjCIeRJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsFi0TlEFo/4TKu1upZw648Cl4FrBlzNXL9xAfcodlk=;
 b=V0eSSDk9r8B8VWekSRqJn0qzZHbbEOJPP7xyd8ztAtwBeM0o0OjOtlnv0WIcAEeYNr7WLKIwpyct/QH3D+7c4Nu0LisXTdI/X8JeAsxvKEhQCw2Ythdwi3BX30ozp+480CLKPHoo/lYTR4KMpg5EsQZf/k5C105JWxMizNachFg+0vswbh5EHrsWC+D2qAPfdD0CwIDtBaeLscrpccNkS1dkRjVIgm0Ih0DvoeCDE1hOBN2IA8FJPCZs0RfetKoFLv1mnczjVDd+Z4eyhnPxFDkh4mk1x3MWiPvWyJOhD5c+xO4xUG89KNTmjktneD25ttv8EK7PemjWAx0wMA6Aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsFi0TlEFo/4TKu1upZw648Cl4FrBlzNXL9xAfcodlk=;
 b=ol9IeHWs7QNLX8MNaeEu28k0bJJ+gb+YpIF76m8i1n6xtcSrDAgwgCwsKu6jjGwda58PvUa8Q4fYJmaMZ5VStZeSnObSpLRX1uj5e7Vo4Zn8neVcWsXGN7pf3qNGuARAHWB/ahbvmS8o4ah5zFos1kGyPFJxuI7tOkV6Y5NH1JiUCGczrJWGJ9ts771HkcraVXYj8+VdYoyrWFAFtm5DRp0yosEgw8GC5YwfuM8gi0JqxWM38859rtwKXbGyAUJfae2v+GKVplkiFuI3G2IqTCyTLq4DJlUzk23nCnXyQwqI9COlspv/2PXICoihCQ2xJ3QvBzqqK82uzU7mvpQf9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:09 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:09 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for firmware
 parsing robustness
Date: Mon, 26 Jan 2026 15:23:00 -0500
Message-Id: <20260126202305.2526618-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3bab83-9857-4ca4-8fea-08de5d18b85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lQZTkcverzLFP8PWMgjynWku3nBJ1Np5CDM4fsR+KxkVSNAwtZbtCupz30mB?=
 =?us-ascii?Q?9Gy4O23GUEK/H/+bRnRbupQDwE+eoUlygEnseztM56B+xJrvbtE4VLpDp34o?=
 =?us-ascii?Q?4htL1mPr9SWFeOvdwHIEE+Am4NZQvdcJB2aNrWgReXtXOoKuirZXZwzGz/k0?=
 =?us-ascii?Q?wryYVcVveKjZ2ZQTB9I7alKQahsJCKwUYJ3XqTbuKUVJ6cYVo57BUcB+IWDE?=
 =?us-ascii?Q?8NE9GoIkpdSdh3heA0ql+ESCu7gr/FM8rxy389Ck7Jcd7lo25PZoMcQ+Js+w?=
 =?us-ascii?Q?98yJaP5MM3gToLPFJ3D/6zY1pNutjHjNRZdWbgNQ8G9c7H56Tf4O5zrtg+zK?=
 =?us-ascii?Q?yWdR8gURS0Src3moVxpFYb3G71fqCn1yi7+Axv7mXLDZKNpQskOQukItdFm2?=
 =?us-ascii?Q?H9PSe75yHvNHVxtizH0NDPIQU9+0QVprFk+DnEUnv93Bq+uDug9WqMi7Dj1c?=
 =?us-ascii?Q?AFEDtcdurSrva1lhmIDmVcBT4vV3q1ci7lKYYE0+u8Uy3bIXvqrHs63OMTcr?=
 =?us-ascii?Q?V5bll+HGFyUpJivVYefWF2bRBBoOL+JW85ewhj9IThQHuBAsHJVoa4KELLHW?=
 =?us-ascii?Q?m1O65+YWtBhRtCfIdHBcelW3GBFYUBFGYR6T9dDXYEADspIfyTrBVUTsp/zt?=
 =?us-ascii?Q?1nbOICt2x6Ank50gP3xs1tnIn93oi9usIfH9v4ba0aLv5wZOeoX8BQRxhWJ5?=
 =?us-ascii?Q?tDVj02pJzOyJSSlPrkZQdtSV9xDs3uBvColGvRDL4oaCims2ARFUfTy0LEUP?=
 =?us-ascii?Q?Nr5tm4d75xCj1FykYe6ml6lCC1jdQpn0OI0Gsrsg/yCCKMbJRRYsA2lfgdfx?=
 =?us-ascii?Q?qGKth+MlCdHSJ0diFdRy+D8m3vtr4Y4drLU7SQfsnv/nK0PvmWpHFr1zXDfP?=
 =?us-ascii?Q?o7Ubv19VcOdyXO+x7ECINgosDUx9J7mi102QwGfOr89Yo+a0AhWEuRosayFS?=
 =?us-ascii?Q?3D2q2hQRg96fq2m3S73Qiw9+bSe9jWpoUnS3zE+2AjVFu31Ebl5Q2+v/JPV8?=
 =?us-ascii?Q?tB4lYDoNgd/arl92fOjT4Rm4k62p7SMwlwsUsBUFzvKx0kMj3wTL/uldlHIw?=
 =?us-ascii?Q?MzW491e+8nurkB0r4lc9uAz+vL1NAzgqMP8xgbKyNpeDpZWP2GpQr5czRIVU?=
 =?us-ascii?Q?ARTuN6qr5aT9/SH8HXBP9RULsE0TUVOXchJeMcGgbVGhxUR6wrQjAtk0Rwff?=
 =?us-ascii?Q?Se/k3m+a/XQCUglh2/bJcEFEuCz6kvpalInp6Eq3UxdeuNzzMt08tWj3IkK4?=
 =?us-ascii?Q?kA7BZHGigumae/OSGCT0mY5eyCLjlH/dYRE3ggxjVX/eyvhI5q1fBirPQ1jm?=
 =?us-ascii?Q?e7yHEdyZEFHtCT75N7C7evFBsbnO4xn7GegnrEvvGlkQvZjlx3LMq09cbGsj?=
 =?us-ascii?Q?NkNHq4bmKnyF8ZVNGcpK+9HYrOz7CHRlYSlVYRN46GatOmzXkpIB5THlsGfs?=
 =?us-ascii?Q?GXqCIAECHsNmOqRO1RnxiMtLb7BZTjk6W4ddCGT0sl0Nv/5skKpcNzetRs8A?=
 =?us-ascii?Q?slPeQOSR3Z4RQBkTETLs9IHfS8rHCsa+ehQXWTSchoGd4Y6dzXHO8+LvVDLk?=
 =?us-ascii?Q?Slgo467oW4Yf4yLwjCw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vHfwilcWCQWEvc7GQUq+A2jaCMxrwDPL1Bdk3tzHiPOaoSX7s6m8UNeBaX55?=
 =?us-ascii?Q?oCpDRDzzqpS3r4htjiALTRn7pUjRVGtzEOThylkF5+xAC/22AS3Vk004W92Y?=
 =?us-ascii?Q?Pbx9xJWZxpEYmtWnn1p/eV3zh7Jew9KIrn7ha27UsmUZ4VieRGu46DcTPVfj?=
 =?us-ascii?Q?ykhflyOt8Je7DOCley8ua076wnbR9gwIdaiq7jxmtc7PUoOZ6o6SJdy3FROH?=
 =?us-ascii?Q?toZrByl40wB2AcCvsGEPX16JdluBfBb2oIlMbLoHH5LucC+MVn03+ATtulP/?=
 =?us-ascii?Q?ulam9w/BjZVJXt/N52qmB7lpeLgUQJSPRAE4fYfyYhkVv0QMisXdSEPrMmtU?=
 =?us-ascii?Q?9JRVeOh7xG7usH/O6zVY/0Q0g/KB4Eo/sS4/rdhPKMPD8vU19yUbjXmF4j+G?=
 =?us-ascii?Q?TegyCu6Xtty7nufr+j1Y8UGKzqplEkw2xeV6ixnBoN5LoDTVSx0HhWDrcsp2?=
 =?us-ascii?Q?j2wzO7qbcS6sp5xuegdBKvoZ/+I1OpAXC4c7dlVKicK8fytRJg0NzqZDV3TI?=
 =?us-ascii?Q?MjIqnF5S5o8elU/YKiXsL01jKDhBr0cm6u9Oflpm8R557bjUFPvLFOvFURC2?=
 =?us-ascii?Q?uNeCYW7XBmPpjTHit0gjGh5qGyvu/mcCvTdY0GawxlTdH+6f7GqFrzs6ynf8?=
 =?us-ascii?Q?jkTj7SGXpWaiMfA6cySmut9PMNZ9MLSHK9DHThZoN666ws4lyUvQyNMzl60A?=
 =?us-ascii?Q?rvKKQYD+2K7RRaVfmC9yDswZjvzDyfwZtBMSnb6mGVkAAA2wgvTQgDA3JCrQ?=
 =?us-ascii?Q?M5JSEAqK0Pcjo9pBfa812fL0nqZs4V8cIoN1t7ElQy5Ys8tPjUj59mJOcT7v?=
 =?us-ascii?Q?7IhucB8LWhCKwOBF65ISb8+f3A6Pf/cCoTJV01wirbjJAmdBEPadoWG90GC3?=
 =?us-ascii?Q?q7lulrLQkNujgpSKOZ5xOtX6U+Onu0ock1ykUaQ40lJsc6cn6ANZmMHz6D1f?=
 =?us-ascii?Q?SSyfiFB7QECj1N6qq0TwP4SuKkqDE+QEKJrX4FmPbwAleauKDDLiNT9GdBjj?=
 =?us-ascii?Q?WroF5uOwki9ONLA5xkW2AWCWQcp+QfWDFlzOGTMWB20Jt6y1ZlrupsBYGXWx?=
 =?us-ascii?Q?8VkEOe+So7AirB+zPvYztg6xMSHb813kes5itsw3jz/dmX1qlrzxltlNKngs?=
 =?us-ascii?Q?4+vJDJlzbdblFbj5bkxRfdpx6oXE3m2kzCc5RmlGHPFL5pSLvupN08uL3rQp?=
 =?us-ascii?Q?eWPLvdC1/yhfN+rRkSL4HSFrKs2pkFFHHkUYkzHZamNUzfDThQjxBDRydILo?=
 =?us-ascii?Q?qiyTCoXCbULIfyhQUgdDc4aFSNSVHOhBPLaNOxmjhKyfP3eb8vec+WDOm0OB?=
 =?us-ascii?Q?KbHjuvLuOYdNPb1mchlK+uupKQN7zzd7j5+7r4A5ruiR0EmNJHvPBX/t/aJU?=
 =?us-ascii?Q?qP90m47ulRdgnuz8xr8G/s9JMa99h16L+IYlXY+KITACbGtrqOteFr3yKPc8?=
 =?us-ascii?Q?MvVCrqjg+JUAWtGJy3osrmeWQrmJimoIknmvcEqzEC9u16SCQtyoypCgpCXj?=
 =?us-ascii?Q?rfABumw+U+L6WUzKoEN5yzSPVGLe4bJMUcZZ9J08nG2EvRWK/7AbonsUH8cf?=
 =?us-ascii?Q?oZhSFj8/vSxzB8ti8a+BfsMTfO0tbZ/0ml9eWRsxyfBkdRG2Gx83WnIS4PvL?=
 =?us-ascii?Q?XSR4bqjlJtfOBbJ1UVAJoIZIXtIbhMBXAYIpk1HIawGGaWFWvf1oUNoEHhXl?=
 =?us-ascii?Q?XB/QJmn3gZu5RoWrjPwTJPwuXdbT9fWyMbibkV2qpSFi/BqXKO11R2le63Ax?=
 =?us-ascii?Q?6eQTFUSFaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3bab83-9857-4ca4-8fea-08de5d18b85c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:08.9183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbHdMcfxt4rp1S2tufLh+0vcoM+NbLJ/IEEY02n8j8qLAg8Ac7AM24MTSROaTTOoflpTbc/NlLlrU1ukiEFlrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B88688D00D
X-Rspamd-Action: no action

Changes from v1 to v2:
- Added Reviewed-by tags from Zhi
- Fixed comment formatting nits raised by Dirk/Zhi

This series adds checked arithmetic throughout nova-core's firmware parsing
code to guard rust code against integer overflow from corrupt firmware.

Without checked arithmetic, firmware could cause integer overflow when
computing offsets. The danger is not just wrapping to a huge value (which may
fail validation in other paths), but potentially wrapping to a small plausible
offset that accesses entirely wrong data, causing silent corruption or security
issues.

This series has been rebased on drm-rust-next. If possible, I would like us to
consider merging for the upcoming merge window to avoid future conflicts.
Tested probing with GPU name printed in dmesg on my GA102 (Ampere).

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-checked-arith-v2-20260126)

Link to v1: https://lore.kernel.org/all/20260124231830.3088323-1-joelagnelf@nvidia.com/

Joel Fernandes (5):
  gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
  gpu: nova-core: use checked arithmetic in Booter signature parsing
  gpu: nova-core: use checked arithmetic in frombytes_at helper
  gpu: nova-core: use checked arithmetic in BinFirmware::data
  gpu: nova-core: use checked arithmetic in RISC-V firmware parsing

 drivers/gpu/nova-core/firmware.rs        |  3 +-
 drivers/gpu/nova-core/firmware/booter.rs | 22 ++++++---
 drivers/gpu/nova-core/firmware/fwsec.rs  | 60 ++++++++++++++----------
 drivers/gpu/nova-core/firmware/riscv.rs  |  6 ++-
 4 files changed, 57 insertions(+), 34 deletions(-)


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
--
2.34.1

