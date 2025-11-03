Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5655C2CC18
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081910E426;
	Mon,  3 Nov 2025 15:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z/PaZWnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E9310E426
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU5LlEw4fBg0J4M+kzjjs8SnnCsN6+eM4z7LKUb01DBdzGjmTb6Xx/+ZvmUyRL4Tcat4perdltLG5SArUIr2qmb7Z6ZmEKo+GsA0xWUqxYvLZ9JR9OrBsNDvnGOV87k56LMHo7LtQr5at6D1a/p1I/n0V12E4OS7QPRIxLS3PfpLZKpdPlx3r/4Xel8oGFG7koDnP0PjKhnQWLkSbZmO88t/NAAhtDRc/XkUm6H5X8dlth5ynsbQxfdsv6jYX12OY7WKzKVppeAxfgmPXOkcmAQ/XpTejil5PPvEEuNL6CuB5EPCQFtoYrNYmTj0HyZR1IENJgdI4Z4Kgx9rDFJLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/vnICDRcXdUiGAKyXxpfxk8aP+QI4QCp4f05R9nIUs=;
 b=xn19PfMU6IjdP0nYTVutbz5wnZhySwVtdfP33SUoBIPTojUrTfZVbcc21WKwd2RshuEHlkyxAZ1/pH40Jx9TM7t6LVQl5E9bRUYVLe7CvCDAVGIHceEH7xglMKv3l9a29L2sOxqfW6Hj7O3x9M8TyLmkKkMIYXV2RRkvk7EseHDnfxd0PSjD/2dtg6u63YXwomprEOnyl1tlwmIbQQjpSexbJ0cWlNt+KnKRzT41cBOQMaQ23Lh160h2jsunMg9xjpemVnio56ST0SwwiYnrsl4m8tcqUE5BDiomuabP0pNLYTxlu47j4hqXSPMQpP9z65uerx37pxESCLXlCfSuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/vnICDRcXdUiGAKyXxpfxk8aP+QI4QCp4f05R9nIUs=;
 b=Z/PaZWndl6t1s/0/wqn3siDqFMrAP+6t+qA8vb3l5wSWcq1/XoUM3S1PnbPpcL2/gK4BKWx+VXmVq7f8LlxOzhKOmr0BwXeadV9rtd14i7HvtLYs1ClB36XhPvq76SwmES43PFHs05KqavpHCltKxqoVhRib8anDZ364UdFH+eJ0YiFfUvgkbPX97W4huv2WcgtXoLsImzkEiYRSvUubmNv/IXGgFtcepyRVj0OMWclBRIaLcHqPTO9+E3zrNu6IZw0l/a58k3ibQSJ29KdmC8V2pBiJT3iJBVGAZ/w8peTN4hHZfxubdgib4dWFhXxsweXsu1UTCtTJxdj8fFCRxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:47 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:46 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/9] dt-bindings: clock: nxp,
 imx95-blk-ctl: Add ldb child node
Date: Mon,  3 Nov 2025 15:30:50 +0000
Message-ID: <20251103-dcif-upstreaming-v6-6-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::28) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9654c3-b187-400a-f616-08de1aee3ce5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MitBdVIybGdRRDhoZFZkVUtxNDZOZHZTcnJ5S2o3dXplNnhEMHFvZStKaGx0?=
 =?utf-8?B?bjNIK21GQkJDekxMZWhyUld4SENOOFJmRjFQdktLditrVzZUQ3BnamVyQ3Zo?=
 =?utf-8?B?VnBBQjEzSnVXanAwMHVtSjN0dzVQUmNNSmlrbEJoSCtxbCtVckVDclBYVUor?=
 =?utf-8?B?UHArRWtTbytzdVJmVFBvYkZYZWVEL1pUTHBTNUZjRlFoN3R6L1JoK0MvK2x6?=
 =?utf-8?B?Y1RjYVd5REIzVFdwTUtKRFFFL3k4VWxXNmZ2QVFIbGh5TlBsUWp3ZnF4UmI3?=
 =?utf-8?B?by9wd1JJOWdmYlBPT2dWendhSHRvNkVHZHFvYnpwSEFjaE5mTFpyRG9LaUVO?=
 =?utf-8?B?Qmxtby9aMU9JVUtHVG1yN1dKbFNGd1dMYjFKV3lsbGw1SXFIQlg0dml2S1Ba?=
 =?utf-8?B?ZFlFQW9RN2hrd2oyRjVIVDNvR0h3ZGw4cGFINlpQT1RmZTE3ZzJpR2tXV3dK?=
 =?utf-8?B?VHNoenBKYjhDTWQ3cXRucnBtWWRVY0plT0Y1S0VQd1FTM2N3ZXVqbkgxL3dj?=
 =?utf-8?B?dzBNandNMElqVDkzRDJDaUw3dldIdEt2c2NEOWN6eksyckE0K1Q4QUpvVDVS?=
 =?utf-8?B?YS9rckZJSHpFNlp4T0ZwY01BRjQyWEkwd0xQRXlUS3RFWjFNUzVBZ0JZK0tJ?=
 =?utf-8?B?UzFOWDVZcHF6cldqRThNTGxiNWJzakJENEU0RUxkc2ZYU2dsZEJ5eElPc3Ix?=
 =?utf-8?B?RjdVZHRnNElDSThPa3dLb0RWK21VWmtjU0h1WVZUQUh3NXNjQWFvTktjWmpy?=
 =?utf-8?B?WlBRWHY0dGJyOTNkTjRSVkdlRU44M291ZDNtNERXVW5MOXYweUptTzhoWjgz?=
 =?utf-8?B?VFNHMnFjN0pEeE1TL1VnYW1FejFaWkZ4bnFna3N5RjkvbGwvS1BzclNqVkhq?=
 =?utf-8?B?ZWVGMThIOHZuNDRDZWo5RDdpNmRzMEFucmwyczdKektUYVlKRFg2Nit2emN5?=
 =?utf-8?B?ZzBKQzF0WlRFNHE1Tk9vT1lXbGpNRnBSL1FOVzFlTTVNaEZUL2lpU0VXR1dp?=
 =?utf-8?B?UE5sMjA2cGRhWHQ2eGEwTy9GNEhWYnpIeXJZcmhVdGRZaGFXczJXYVdmeHpq?=
 =?utf-8?B?N3ZRQ25sU0VHWkptWnhXV3FVWG5rZEZwMTV1MyswT2NiTUNNemE4ek5kTFBm?=
 =?utf-8?B?S3NPcEtiQzJmaS9EYVFMNUxueFJ1Y3FnbkFydUswL2xJbWtmeHd0NEwxYUEr?=
 =?utf-8?B?VzdYd2JHODZCV3VtaXA0SDRFQ0QrN0dZZG5FZ2pDNk5WQURvZFdENko1ZXJs?=
 =?utf-8?B?N2lpTG9OYnRnTmc4Y0lNcnYySXdhR1QyZzdlRUhGdkdWUmJtZmp2T3Fwa0JU?=
 =?utf-8?B?WkhpM1U5ZjdweXpEbFFZRmpHMzhLOE0zK3RnVFBDQ05iWkFKZjNrS3pUNXZ5?=
 =?utf-8?B?b3ZqSDJqTFhBQ3BtVG1ISHJUcmRSc2pqNVVMSEpyYXNyU1Y3T2hVVks0cndK?=
 =?utf-8?B?cmJPYW50TzBVVWxzaE1MS0kyb21vaUpBZ0FlUTBOdlN1ZDNEVkhQWisrcjRq?=
 =?utf-8?B?MWc2MnJxTlRZanFGNWhnNStuWlp3N3VQaitVSkpFLzlTWUJuUjdIMnhhdnVM?=
 =?utf-8?B?bUt1OE9iUy9Qa2tnYkNxWUlMaVphOU9IM3hpTW9TMTcvbTZKMi80OTZiWExK?=
 =?utf-8?B?eDFYSzloZzVOS0FoalBucjFIRWptTHdrZ3NYWGtCdFp0WEJmUVU5cGgzZFhl?=
 =?utf-8?B?VFhqSnFVa1UybmRJNUFhaU1FTGdtalBUOGwxQ3hzRUZvbTZabkdNT2RWdm91?=
 =?utf-8?B?dXhwK3hEMENpZEJoUkkyWG5lS0pPR0ZNV3NpLzByUzVWNkFBOXhEdTdCd0VN?=
 =?utf-8?B?bGRyNzNhQjM1clNubHRDUUhLZ1JoaVlMdTVsMEZHelhkS0ZlOWI0SFRGVGRU?=
 =?utf-8?B?SzhZcTg2QzRRSlE2b25GM3NGN3pRc0R3WURNU0ZEZ2RlSGhDY2Jhem9LOUQx?=
 =?utf-8?B?dU1NOVlycUM3NklFT09QYUVWN1dWaHJxZmtHQkc0UXdxN2g3dk1JcHJXNlRN?=
 =?utf-8?Q?Nqeow/6tcnVf9ygN4ugwSvhxiBHOAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUp5VnUrSE5ZNUpYYjZpb3JTSU5odDluaG1uVm10YWlsSGxPNG5mcWxXbHlY?=
 =?utf-8?B?aGdaa3MyOCt5QmJOb1NlLzZINnpWVk1wK3k0RWVyWjBaUXNHKy9JdGsvdmZk?=
 =?utf-8?B?U0g0V0lhUzByZjlGeXhoeXpTamxEZEtTTHJQdW9WWGphMVVMZUNqRkhXeFJu?=
 =?utf-8?B?bitOZHNOTWVGY1FJMWltSjVIdTNDSUtoY2NqekVVYVl3elFXbG9US1RTV2l6?=
 =?utf-8?B?Y3FHMys0UUgrR3l2bU4vMGlTVmRWYTY0N0ppUHVzaXZCTGJGU2hZU1R0RWky?=
 =?utf-8?B?ZHMxWGJLUG9Vd1FFcHpNdjU2MlJZenBldGpINVFYNE9tbzNJMmhpK0VHS09R?=
 =?utf-8?B?a040WDJaeXZhb3ljMzF2akJYclpjcVVTQmJDVjNIaG80RVJjZzd4Z0x1Yjhw?=
 =?utf-8?B?WURUbjFQZVF1eTJMaGJkNit4TlNXN2htNDYzakJ3SjJ1WmVnWnkzbXRSYWxW?=
 =?utf-8?B?Sk54d3QzM0F3MUE5T0FMWDN1UHAydGgvVXRvY0x2bVN4ZlQ4ZHVyUlVTVFd1?=
 =?utf-8?B?V21TRnJQUjdGajJJclNBYmNQZnlTSFhza0laS2doQ2ovM2hsYnpKeTFxeVg1?=
 =?utf-8?B?OXVlVHd5L2xHZUdseWc1Z2o0UHlKLy9NcUJVYUt2UnBHSkYzMHNwYnYvbmVO?=
 =?utf-8?B?bHprM1Jna0NtaTI0Uy8wZWhubGxYQ2VhM3crMnRFQThkSWV0ekFhTXhQd2Ny?=
 =?utf-8?B?TWZua0xMSS9ZRnR0U1Vla3NreTZ5c3phYUVLWGxxUEpQVEhTUDEvZ21FVXNO?=
 =?utf-8?B?cG10NmxPMXJnSDNYaStNc1JOU1k5M1E0UmkwQ29FZWtMdHMybzJqUkhoemw1?=
 =?utf-8?B?UjhmeFBJWXd3NTZWcmNrd3lESGZ6ZXVGc3A0bTkvc0U2eXh5eGpQcmkxUHFl?=
 =?utf-8?B?K2NGMm5sdm1Ua2dYSWpXNWtHV1p4eHU1cHcwNFUrVlRXOHhEUzlnN2F2Qjlx?=
 =?utf-8?B?UVkyNnkwbC80bzFqcGVHdFpDYmVlRS8ybU8zazc4TnpiOFlvbFUrTnphRWdo?=
 =?utf-8?B?V2M2bTlSTXZ6M2ZnWEJ6ZS9ScDRFV3dyQWlBUE5oSnJzWFJrRTVKSGVyVUQ2?=
 =?utf-8?B?YTByVFBDQ1kvUlluWlFLT2xPeUJ1RlZtNUlLN3YyZnZOM1E0aU5sRDhZdllj?=
 =?utf-8?B?Qm81MGtHd1FLQ281T21vVm5XZVRSR2FkVVFDc0pQTVVOeDRwVjdQRmpGR0R5?=
 =?utf-8?B?R1owTDA2UGVQK2xkbjBGaHVXRndvRW9sRmxWRS9LVVN5SUc4blhPTHF0anFh?=
 =?utf-8?B?bGZjVmIwOUpRWUc5eHRJVkVuaXNJQ0ozek1lMEVSS3p0WFZwZkwya09yTWZO?=
 =?utf-8?B?Vm40SGJmcDUzM3lOREJDWHpXNXFuaForK1dTZ3ZCNW4ydnpNVmwwYitYeDIr?=
 =?utf-8?B?Q0ExOUFxQnZZWG5pVFRBdkRyTXYxVFRBQm95WUpDREZOUlIvaUNUQ0NYV0VE?=
 =?utf-8?B?MjlRT1NmK0xnZXlBVFJld0pkMmUzWEZyT1p1cWZyV05ERjlTcmdGbjlGLzRH?=
 =?utf-8?B?V3g4OFhKUW5sZEUvSXZtd2lQVkZ1ZlZ4OGc0MExjRXVNZmt6U24xM0wvc1Bn?=
 =?utf-8?B?bmhjNEMrajRpZUU1MnBobzQxMGpWLzJFVHhYM0pDRmVtbE5EY1N0RXVaRFo1?=
 =?utf-8?B?U05FdU5QRDVhRWYwV2NrejBTcmVPVWVsTTJiZWhLQTQzcGVIZ2RqZVpUK3U4?=
 =?utf-8?B?Y0ZieWpuYzRmZnRmSnlVM2NISzQ4OENMb1NwRmcwc1VHdGtHRndBcFlrOXJ0?=
 =?utf-8?B?cDFYTWZsRGpLMnIxeGJjbGh6WDExTUFJeHhiRVkyVUpZdUpzOXpIMWFpMDFr?=
 =?utf-8?B?Zno3SGtDdExaRE1tUThrc2x1dGtad3E5N251aFJTYzRXWm41NjRFTU1PTEVO?=
 =?utf-8?B?eW1zTGlLWjRHc2piUGd0UmYzdlFpQzdnNHNSSWQ2azArbnRUOW5DK25XcTFm?=
 =?utf-8?B?U0t4cDhYaFlya1lEbjRQZitGK2srak5saWNsSGJvZHJjTjcwNjV2U1BtYkVv?=
 =?utf-8?B?bHljQ2pBb3FzOGgrdytVQytpY1Zhc1Y3cE5LVGJMQVo0QkpTWXhhVGVhS3Bx?=
 =?utf-8?B?a0lzdHVjMzMrYmNrTmM4RG0za01oVW9raTZVUDBRalRsY3ZuVnVwa3ZpN2Y1?=
 =?utf-8?B?endJQTlIQzVKcEl5bDlWcGVFUkhKelgrSW0wMWNaS1hwNEdhc1hwNkVORVMz?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9654c3-b187-400a-f616-08de1aee3ce5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:46.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66hEZmGGbzemUTgN/VlspAbl8SaFfN6EP1gobFyHIOsBnHXHjJGBUjnrtcrMNawVwR/lEXf3kXu71LtpKmyrLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add 'ldb' child node to handle
these use cases.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6219d31649d75539af93edae0f17d..85d64c4daf4c96372e4171737b6954c3941566ba 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
   power-domains:
     maxItems: 1
 
@@ -39,6 +45,11 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+patternProperties:
+  "^ldb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
 required:
   - compatible
   - reg
@@ -46,6 +57,21 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        "^ldb@[0-9a-f]+$": false
+    else:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+
 additionalProperties: false
 
 examples:

-- 
2.49.0
