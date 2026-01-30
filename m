Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK4JMd/4fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:30:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F049BDB47
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDD510E1AF;
	Fri, 30 Jan 2026 18:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KnPWf6jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0110EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGvCKEpyMkk8PRzVhoZzY2+2SsUH1YH4a4pmn7yx1NQyXVPSrAe92kyPPGhg+488R8yO1Yd+uLubEW3cRFH/VIa/HSjJXiBGQutl3VBmcg55p4SLBSarx0Z5Lg7Vo3eh2SMbZMhXDwHeODFAAw2X7YoKhq5nu8fKW0yf3pLG1vWA+Z1ep9C8yQEnV9NehUD53ealP2HnBhw6ILkoQB/fMrAIWQjg+bA1fSFEWnz2VQm3M4S4bnnHcxcCXHNXXMaK5diWvx5wzTuZJYYqyQYF9uJSENdxAcZats1+BNPB02AqfgpR7bvlXZULSu/LcRCgpp/Ffq/o3S69j6NgTWJTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWTF1fTMRg4LEtFR/AKKIRZHkIYnPZ4c1XDTsZQujPo=;
 b=XN0P9fKMefdTK0i/k3lQhxoRMIJEHD7FEX8/9n1jlbOfNYOcsT5OrxHplpDFr9/6HmaY8Ger/V0vyd/BNFMBFwueg7plrYI7eQgxuAK0fW3kZS78xUeFvXDkGiplUhBuv4PmS/pJx1AKprK0nenhl9pv9DY4XJ+z1PkMoFPBKWhDY5n/bq+Bx4RPKujozu/RE+uR99okkQKQY9JiGm3+gifqe6ezCr/FhWOVW8InNv9t3ml0PxnhrJuNyUGQo3Oe0+YiPMpI/nTUjie/EbXHRyULuGboVNaCqhK0zzGGb6soYLqCpf7Bj1NhSBldlEr9wpy0M5QFH9wP4TVQRJDVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWTF1fTMRg4LEtFR/AKKIRZHkIYnPZ4c1XDTsZQujPo=;
 b=KnPWf6jcfk22Mb6TS1RbGdz5B8YMVNHOhakGzDrJUzhLcWbuUCuAxiUMpp/qJtH4jWJBqOYpeTV+CHFuVVIx98jOd3gmo8XWw4NaTY+rZgqrEyGi/QoGRRtHgFKPrv/cuCoC5qJ/gOKf2vZz6A2Ekzrnhg+9OcS+3yfbMCiIkyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:30:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:30:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Fri, 30 Jan 2026 19:29:53 +0100
Message-ID: <2cc58beb0c0fd96b07374e1e84e90e860c81fb95.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d0ef67-7998-4388-a487-08de602dafef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VkQPqVL+ii0V+ii+5b0qd1XP5yK+pdzfVdhzPlavmARfFNtDKmHIqcB9cRbe?=
 =?us-ascii?Q?5766P4+HgtqqgRMmfrmBVk0/KjOUU7UZ+U51U4bNFoW1UgWF8wLZPlM0UsIU?=
 =?us-ascii?Q?G+JYb+qWP0GNqyxUEA9Q1j6EwvKrNNUUJGPCp3opvIS3jzRTVumj0HpdLlrt?=
 =?us-ascii?Q?FmjZCtJ3+i6GdHi4fZDNy3YA9EtSBe33XI5C6Zo0d/kbanm9wPQ39zZRrwB3?=
 =?us-ascii?Q?KS0SIKk7PNDKG06swWceXYH0+qVQmV/1/GuZ2kIdx0CiXwsxmJdtXbT/Afgl?=
 =?us-ascii?Q?maY6SbXTXsgeLVfIXfWvGn4jg6XicRpej2FWw+PkQ6K0wZs3asmzJeVEf7x/?=
 =?us-ascii?Q?AxifZNNlyPxWZbro6ov2O+RXx7NC4liXt/wWuz6j5t09amRKAPWp/znGct/Q?=
 =?us-ascii?Q?0Qh3kMwDPApBniiQ1dpBkR2qHZ7H797piyrwxUDut4UQKFdAX3nr9KOIPdyq?=
 =?us-ascii?Q?FNszybGL/BvSbdL438R6rBz9fz472z58H/HLz8W3aOygT2T/KGviATIWZbaw?=
 =?us-ascii?Q?hovaqnGwP0lpTvuf2xh0RMF7aTLdMXBWlOomMmY21JZu5SQ3U6wr555hVidu?=
 =?us-ascii?Q?ipesNoTRTilMbjH1oX9plSqXkY+uLXkd1ulCsSlXVr7fLqSnWzALzT2FdPTS?=
 =?us-ascii?Q?b/jADbmNPB9EmKCQBYAJ+OiCf3QavDS3wJ1JqpsbKVQv1zkgfX/PzLqt1M8V?=
 =?us-ascii?Q?kxR/FZnhxZfyZaSIrmnyyBUwxwywJwZC6LbvyiEIR8eYMyUsIhLK79igNPR2?=
 =?us-ascii?Q?3w7gELv16GrQf0U18RxuVLYN6BA4Mm6X2qDxybhc5ncicNqUXivf+EAv1PB4?=
 =?us-ascii?Q?0g62tTYYBPWYX5niT2JSuU1luB7qlI5Ksf19iZX9tHrdxge3yQMrmhoMPYdP?=
 =?us-ascii?Q?WLM/S5PPwBkSdKF1dt5YxQAvdaouSvFzMTKKZmkmmUd4aZLVT1yG/DUYst9m?=
 =?us-ascii?Q?zm/8AKOxxkkiyd4pa1R2MO6148thph/sTKyoaCpN7SVIpV6nQYnZ35D+XpSE?=
 =?us-ascii?Q?7pVr1iIXxdi1FxU4oq94NbBGTg/4sdRAA3kGQr/vfkLATLk6aKZYIofd6jmk?=
 =?us-ascii?Q?3RgK0ZDxP6dJ+x+s1kFHbLSxoerzVGsISoOUPUxO18Ye1xMVQ1k2pn2BzM2M?=
 =?us-ascii?Q?q2fJ7TBNImYvqCjnXETaiktlmTJpnIQZ5dHO73Ih2nAzgUxdDFV+meV9Rfla?=
 =?us-ascii?Q?jmLOCF/ViVx5k0EoHrrHfw6GWCUAW+0XU82y2j6wmJjsPlVLMlaOdZEOkYX2?=
 =?us-ascii?Q?aBwgUbcTtMc0P1HLLU6LlKCdiO9dLdcFobE5/5cwZfny/GsqLejj/EfqqTVE?=
 =?us-ascii?Q?hnuN+Qoh1uRSC9Vc7hNMyZt++wPse00BssQFCUqoKa2jhbnl5lnIxmcMnc3v?=
 =?us-ascii?Q?EglEWVaI20uzg0v+2qjrFPqeT1lBh9piaTUZEfs6yfKMj9XRpDSV17WkMbQy?=
 =?us-ascii?Q?lxNoDjetUHbFaFaAZ605u/GcVSnxCN7Xnuc/7raWPSq/7SHjSf9rG8I53kLO?=
 =?us-ascii?Q?A1qaCKNFbwn8KazOs8OOV3B88LE7mXBVcYB7N/UdSbsEwoRvd968IzyALFkg?=
 =?us-ascii?Q?rM/A2grxV3f9YYdS9U5m8s565YKifel1S8Cq6zjDXueE6Oxnp+V6DFTgdxUR?=
 =?us-ascii?Q?GqjhrcoVLfMU0EaZvgD0+9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OiJwh6tLt4PMfbdojO4YrE5eQs9X7meUBv5HFhLkhvq0Z2RvMEAEH59l8r0/?=
 =?us-ascii?Q?NU7a1beFi0/uRQ+ZQMCZv1XlM4XPuqE9Ic62FpbGKAXNZ7o0/+uVYyqhWWms?=
 =?us-ascii?Q?RvGZRqBGcwg0wIzh6MMm7wKanasCxnv9kemnL58yzKQ+AFZLGUkGGQCYSH8p?=
 =?us-ascii?Q?nGVkhcxcJ4XoJWV00whGqG1tArAMRR03JMW1evZZemMCJCf1Gj/V5bKecxOf?=
 =?us-ascii?Q?hRscWJnYvTdfMdmqbwEn4WggcLdZJkyVuwplsVizk9gFFxzL32ZClw3+n03M?=
 =?us-ascii?Q?IxcaFlpRqwes6g/lMSo7ME0JajSFeFZauI3RWuSdwjHdUbCL9llY6fOxpMvV?=
 =?us-ascii?Q?kC/zrgFp3lcD7otTQ3XYh9UWZX4iAk2X48tW60i3hXgRedTHHdWn3F5mQeTn?=
 =?us-ascii?Q?fVsE0EAcuNs4Ezvon4PGTaJHxo+6ZO5s5wCJevjS3F0pAfxiAOoy2DyU4ltw?=
 =?us-ascii?Q?aWRQ9xs9NV3QOQtMtoK+CqVKQZspoajpdOrbNOzXw/SjNM6mNJvdyQW57BPv?=
 =?us-ascii?Q?GwpZY4jv+9B9ECf3jgUJKi/yU4Ht1rIl7LfHfmV/tmp/C5BIS0hDINmAKoHV?=
 =?us-ascii?Q?LLMfoCqw9Z61xq6F7uOvMulPx/oM+n2bdaaFH15Cb3bGWJvc2jyFMfMTZflb?=
 =?us-ascii?Q?z9hjbX8dZ5/4fE1//+dQlwWGyTX86taEjsIoM5zrbi7GSLW+cUad5e+A3Znd?=
 =?us-ascii?Q?+xtkCIIT4CKao1BYKtyqE7ZxhQr85JYBngLKbKaG1+8Tu+4soHz74j4uMYrt?=
 =?us-ascii?Q?NzG++hPBADfCmMwzrReLV8TSR/T+ucCH/g0Jd+SeWbOve5cYQJtD4cTcGmuU?=
 =?us-ascii?Q?l5O2Nl1oD4zMmU8vNvkUpkx8KL1E1ei/GoG0U7q2pGtUgmGvznkuigFm4T2N?=
 =?us-ascii?Q?PPQ6C0oHnUb1iGiVWim46StOZXRpXr3vMeT07T1yTO5uFdQljIJ/86KawbTV?=
 =?us-ascii?Q?1QRJMvwF/gngP47sTbk3L1+07000j+9YIM/B3gMtuV91mY0JoVDtNDh5bzBv?=
 =?us-ascii?Q?8X5z0LwP6RuRyLgB+XhqIOolXfnUKtowdhK7dIZddsnT4LyPkiI8w9AchuhD?=
 =?us-ascii?Q?c64rNLVzb0lO62TAI9hBrMHbM+3ZMFwOJ/oDkXR5QzWhTxEwj4pCP6UCjsow?=
 =?us-ascii?Q?Ub1ILq4SbFwi39rk+ZR2cH8ypHnim9u+H7M03N1sX+Y7Ox1pG2sp8y7wl3E/?=
 =?us-ascii?Q?Ku6u4GF2o2A19lCp9HVzlDnsKIT/T/lxHHR66nmhrdkLEXEVQ9PmR7W+Fnvf?=
 =?us-ascii?Q?IqoH+CcKYRNCi0Iex1Spo3Q6YyCqCUceQhNvVschg1YA19hSj1ZADibzTfmZ?=
 =?us-ascii?Q?zibAURvG3Z2zgWoxwtNspuDRGS75kr49PJBBKNL6EdWBM4zIun5RBwj0lGXN?=
 =?us-ascii?Q?O65DoOBoZ2cNbSZ5V5nm9Bmtfv6CJbdMu+zuL5soaugmc8F+YYAqOj0w7cNM?=
 =?us-ascii?Q?TutkZDAN4zN+SATBrBHX1gxFlusZz+KsCVnvM8aQ71H833GcqDxY+6bgxg9f?=
 =?us-ascii?Q?25dOCXrW2WAiJaj/bF/F/Q+pfbBHD69YnViwTyZOjKWpEZY00QaqZ4kIYBJA?=
 =?us-ascii?Q?17fpvLgS4pkrOqA8XYNNgAAoQu5bxJePLCFW+tL+2joXO7V17jYhRx2NnwVB?=
 =?us-ascii?Q?+OSn7ybyTmLnfdppADVmZ+9vJtI58Hr3tCWuzd504LcLwk4sVSjbeQ8I+F61?=
 =?us-ascii?Q?fiYjk/0fMY6t6ySQdc0DfqwNX+6ZPGRfGisJYHRd3+jB8HRjs/fOdV04i+Zn?=
 =?us-ascii?Q?GGaz3NOK13NoEFgTea3BmY7nKkQgH4JPnu0YUOtgamRrMNEPIlkX?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d0ef67-7998-4388-a487-08de602dafef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:30:47.7412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq8dGpSUGBusUvRr4iaj+aXR7ivJQpPydsqex4TQRhCsxs/gcpOziF6XinJTc3q+S/cjqpLBdlipSGm1ABkDpnN/OoVl078cGr+XV9Lz3H67p7MQzmeTlzKXkFmuhhjp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email]
X-Rspamd-Queue-Id: 3F049BDB47
X-Rspamd-Action: no action

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
with different duty cycles:

- CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
- CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)

Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
allow the DRM driver to query and configure the appropriate clock path
based on the required output duty cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
   allow the DRM driver to query and configure the appropriate clock path
   based on the required output duty cycle.
 - Updated commit message accordingly.

v2->v3:
 - Added missing defines for duty num/den

 drivers/clk/renesas/rzv2h-cpg.c | 183 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 191 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f6c47fb89bca..2cbdd7ff3efb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -76,6 +76,11 @@
 /* On RZ/G3E SoC we have two DSI PLLs */
 #define MAX_CPG_DSI_PLL		2
 
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
+
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -418,6 +423,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +668,167 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+
+	/*
+	 * For LVDS output (parent index 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+
+	req->best_parent_rate = req->rate;
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	u8 width;
+	int ret;
+
+	smux = core->cfg.smux;
+	width = fls(smux.width) - ffs(smux.width) + 1;
+
+	if (width + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = smux.width;
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1265,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..74a3824d605e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0

