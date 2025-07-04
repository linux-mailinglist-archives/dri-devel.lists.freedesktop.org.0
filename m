Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B0AF8D4A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4A810E9AD;
	Fri,  4 Jul 2025 09:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nKCkK8+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013061.outbound.protection.outlook.com
 [40.107.162.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5AB10E9B5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKk8JOt2MZQF+s8cyiQqXrcVxmhBYY5ys0laQkyiR+LQPfYj78767589qIiC27cr8RnTKq6iT7RK/vAGrn/LJWniqYHnLe9KLu+kPZViRMMvrhwIb+bKZw1+vnpxTQXys4uYWkNf6Smq8tbHoyYg5b+LTPG9iXbpSlQqf8LHhp9gstbHgfElG2GGeH4GUob9TGf4d4jujRSYQcFk6xaKmvNXZx+7LfUei5qLVyroKgz/s1czjbDpCIlt8fID/6xbP1vTJ0J1x4xli+M6aMisyZ7d4UZl5ZRzQU5GMLvJkIoQ/u+vBgMOfmSp0ABB5AOEQxvsV3Li9iUeAY2m4oIzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6VYAm/9ngMKqhDLjY7RVfOV7B+HQpLtgNL2hNRF4hU=;
 b=u4p5am/ciDzbg314N+B9k1T3ddIp0M45JhvhOX6am2kGDHNlr7V6yBQjLIy3som5CnJl+0dnjs9/x8k+C4vTk3uAaDJsGSeHxnEQNMfbu6bm4kYylWUgNRdByhZTO/eaQao0KTNNEz0r9LXpqxCNKQuDiBSdaVUMG7AfDSxbTdv9w7dtKTpaoic5kSlXhouTPfDD1fNcb/K2KvP3iXAeFtQiTVg9jT1fmihCh+kWWzZldcFzVhbfJmgP6pWmfNjPTlDeRvrLBHBQ1QTrElnjaAiolF9QKTD4tCZl2it3cbqkHV5hSHCP6pKFi1vBtlexL56fTdp/RI23ppchoyNhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6VYAm/9ngMKqhDLjY7RVfOV7B+HQpLtgNL2hNRF4hU=;
 b=nKCkK8+XAiMLTb5H2Y+nvRDzuKrdCmWgWbt8GTFGTM7m5tqGerHln7dKFsjeO/LCqfInnmjPWJKp/xYXq8quvwv/to4m3J/iplDxDwMVi6eHEw2uKZ6YnfQFMNlyW9MPk1SEYgJsGhLk+gXOt6MbS1sZVQAB8YOfzs995IK2VGiuZKdt2yiCi+92aq0C6hwAWRIYzdNEjF4ru89v/y2emQ3hTzV1Hj+uxKZt1D24cDN2gQq8xCDQ9KsLpsoCi2KBKgc/nhH2cxYnUqpnMmbt4i5DXExvtO6H6/yaTWqX/9PflIOle59w3m2gXSby7rbDtkrDvfuHouCy2k0vQKNL2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:21 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:52 +0800
Subject: [PATCH 05/14] drm/imx: dc-crtc: Disable at boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-5-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b1dad9-ad1b-4706-2eb4-08ddbad9a003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGo3WEs0U1RnWXNOUFMxMURNNjZMeDBFSW10TjNZeUk3UVFOMVlFQWF5bXUz?=
 =?utf-8?B?UVNJK0xicDluZXJKOTRDaFlMK0c4QnBSWXVxZFJDL0JidVVwUkZOejZDdWdp?=
 =?utf-8?B?aVFDOUdVZzZwMkFqWjlFRWcvNWdTdGR5QUViMG56bVA5eHFUNXVVRTRuSmQ5?=
 =?utf-8?B?dlJLeENEN2VnUWU4MXNLY0VSUEY0NCtWSmVxeldrVzBNbEMydzIwVHptN2k2?=
 =?utf-8?B?L0RnVXcvdDJ5bDZNdzJpUnN5YTRGMFlkTk16ZEF6OEVxTVNGbitVY1NMZkVm?=
 =?utf-8?B?eWpBZ3VpK29GN1cxNHRKS3hXNDIxUlZLaHMyMERFNDRIQ2dwMnpRazZldTZR?=
 =?utf-8?B?aVpoQ0xZZWJ4eUd0U0VXd3E2eCt5ZVNrM24vMXcrZzNxdFVtUjA0UWlUOVNm?=
 =?utf-8?B?ZFhnbVZ3VitPekgxSkVKdFUybjRIUzdPMGlnOFhDTW5EanBubzJhTVRGTkM3?=
 =?utf-8?B?Y0VHUG1sWWV6L0JnTndnTjJVaC8yV2EyUmdIYmFkSTNVMDg3OW55SG56Q2hL?=
 =?utf-8?B?MXFQS0c0c1FzMEVvclBpNC9sMzNqbk83ZWJTUUFWU3BMS3F0cXFmL09iZjJt?=
 =?utf-8?B?cG4wUS9uZjJjR3h5cHV5STRjUTVQTllSL01HRkhPc0F0dmdWU3F0NEJRTnZP?=
 =?utf-8?B?eStHTGN6aHlaOFhXbGRQNmdocS9qZ1h6RFN1NmZybVJ3bFVPNDI2dlBJNWhV?=
 =?utf-8?B?LzB6Z09oemVjYlo2ZUQxTUpJN3l0MFlnT2dUQ01vVE9vZUo0bVRlRnBONFBF?=
 =?utf-8?B?bWIvN1I3d3NaMytvcjdiSnV4aFNjWFhLbVZUUzJPclhhMm9uYi9NVXNLTDNT?=
 =?utf-8?B?R2NEVElhSlZnSWRnOXl2NFZYUUFnY3E3SEdnUVJ0aTdXeVBKV1lGbVk1OFJ4?=
 =?utf-8?B?Tmw1QXQrdXlVODUxRHJFQlFuWDR6bGw0UDliNlFURlo4ck9hd2VpMUpyM1Ba?=
 =?utf-8?B?SVFQUmc4eVV3RW45TS9BY051TlVFcnZNa0JIM3BZcW85QzE3a2xSRkZkU0pt?=
 =?utf-8?B?bUxUMEFIY0x0YkNCc0V0MnhWTzBlOEYvenpFVzVselRHaFRwcUUwZS94SjQ1?=
 =?utf-8?B?aStvZ0plV0RNcmpiUWhnR0dhWktyWE81OTlDazJRTFVCanE2VkJ0Z2tPbE9n?=
 =?utf-8?B?MWJJdCtrUC9hZ3ZRTU5OekF3ZkwrVGFqbHdUVVpBV21wMGlPaW5uMEpCNXk0?=
 =?utf-8?B?dVpLaUdCckhZUWJnTk9NOTAyMVRGWVhvU1JSQXVWeTFTd2hKQm50OGhPQTJR?=
 =?utf-8?B?ajZaQWtyR2xIMEpFZ3h0SHNYcThTQ0tvQldoODU5b3pwMGRldDJmMXN1S0Nq?=
 =?utf-8?B?cStnbG53Vmo5akVSa0xwRkNFOUZZKzJMa1FaejZpcjlEaW85WTEvYXBqTnhq?=
 =?utf-8?B?ZmlBWDhxYXZkL3huOWoxd2lZN0VnVUdTa203Z3loRmt4MDQvOUEraTVkWjk2?=
 =?utf-8?B?b2tYVW1uZjM1R2ZqdjlXQ0VieU9lR285VjV4VnQyRnJ5MmlRVjFaaHpQQzMy?=
 =?utf-8?B?MFlTamE5MlVQei9jdDRLaUM4WWZ5L1dTMFhvdmlGSDFRZ0ZvdmVOMlNCUXFY?=
 =?utf-8?B?WGZUaHVKM2NGRU9MemJsaHNyNGRLeERiMGlYN044V2pGME9jKzFnT1U4dXpr?=
 =?utf-8?B?ZnYzMXluc0FpTElHU0RsQ1BVby9JT3gzcHZUcjE3RjI5WFVUTXEvaDVBTlZk?=
 =?utf-8?B?ZFYwQ2xCNkwyek1VbmpUbFlleGxWVHMxYXRjL21sT0w1K2dCeWh0Mkdzbk5Y?=
 =?utf-8?B?TnZSZkFvSm96R2ZaOTV6SGN6TktsMWhOUGp4bTIvczlHR01IVlhQajFDSmpx?=
 =?utf-8?B?ZGF4bWNQT0dHYzVNTW4za28vaVY5OTZTZmpPV3ZiVkFGd1crNURQelFvVVpX?=
 =?utf-8?B?SFNTeXlRM0lIVktadjlDRUhpSFdSTm9lOE12MUhJL0ZqNUJNMWh4d0dwY2Ir?=
 =?utf-8?B?blpUMHFLTzJTVlJSSytVemdnZStmMkNRaklNS3ZUQktRTEJQNEI0blhORCtp?=
 =?utf-8?Q?H6CwvmRfThXLrypnzpTQvV3nz8CcfE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUxPSkpuMGUweFhZbE9yRjlFNllFSDVvSk1RZmgvQ28rcWRFc0JSY3hYdE5F?=
 =?utf-8?B?T1lhV3diSGFBbDRIMVA4Z0pUM0F5OW9iSlY4YXpjN042MmV3RmY2dFVaK0Q5?=
 =?utf-8?B?Tm5IWmtpUXZFK3JRUEtGZlRxM041aE9aZ1AvTnJtb3NBNmtxeDJqZlkxQUsz?=
 =?utf-8?B?N0dYMzBaeWFmTThyWVdaSkNYQ01WT21Fckpna2M4Smg3WWxRZ1BJZXRteWp5?=
 =?utf-8?B?NWloNm4zV3M3dEJBbHpnbVplVm82NEcraVdPcFhXSWRxZ1c1YlZsRG90MjU3?=
 =?utf-8?B?eVVuS1YrRFVhOCtGYzFjWTBBa1RMRTIrWEgxRW56MVRJcUwveDUvUk9lajEw?=
 =?utf-8?B?VHhNV2I0bjBLMWRSNHh2ZStJMENPME5oa0M3TnNCamtzMzcwZ0ZNTVBhQy9Y?=
 =?utf-8?B?QUZuM1pzQjVhKzRnbnZ5RnA2UjhpMTJKRHZrMWlQQ0JvYmxpRjB6Nk1WOHZZ?=
 =?utf-8?B?Qi8xTTBsSVNtM1h4dVZ4N3dtZHJRZ3MwcE9EK3ZMN1JLUXhERW1nNXpjY2Np?=
 =?utf-8?B?Y2kzQWVxYzd6SDI5SjRycUhRRlg2NUFNS3ZSbDB4ejl1UXZzZTU2Q2M0OVVS?=
 =?utf-8?B?MkhxUnR1bXpTalJUbHV3cjBWMFBjT1F4Ukw4L3VweUxXaitZK2pQUSs3TnRy?=
 =?utf-8?B?OElIZjl4ZW1SY25pYzBZbmdLYmZzT2lSNlVSbENzdXVHNWEyaDFQSmtiNTlW?=
 =?utf-8?B?cy9tVG0ya1IrMkpFRnBSTHpzcnVaQzRzeE1kZmFUalFGZUlHWUUvVVBVL0V2?=
 =?utf-8?B?RnV1NjZENmJQajB3R2RnNStYeDN3ektzRGgxb2doVDV0YTE1SXlQcFVBV0li?=
 =?utf-8?B?Z1AvSXpZSnZHRmNzM3ZyNUxtODdGd1NQZXJOelQ0YWVCek9UUUR1NUY0Wmkz?=
 =?utf-8?B?WXdVTTNYMkxPTXB2SVQ3QTRrckRBd3NUQ2haeVdWZTVidUxHdVpFbERjWDdZ?=
 =?utf-8?B?SHNkVTArcGVuekZkQ2luem5UalNmd1NGM2VlVXlXRFRrbGM0bUtrZklTdmho?=
 =?utf-8?B?Tk1EQ1NLelFRU0c3TndTLzEwOVpwYVpEb2tKMkxkUkxSZTlDOExWMEhsWENJ?=
 =?utf-8?B?RkRpWCs1VFlBMmk1M1ppSjNxakpKbktBQ2F2Nlc1RE4ycUpqUGo2SmlvejFN?=
 =?utf-8?B?ZkdpcnBzN3B4dDB6SnpCNWY2MmF0cUgwSTBwbXNYMWYwaDVoRm5ZUGNmQ25p?=
 =?utf-8?B?VnA3UENFVDExeWdRaVQyT0d5Y3lmVEdZS2dXTkZUeVZuTkRXTi9wMUZQTVNi?=
 =?utf-8?B?M1hoSHRjSkFTenZUU3J6STlocFhKNVZYdG0vZlBXaHkrSlVjanU4a0szZFdI?=
 =?utf-8?B?ZHNSR0tLZzJHRDY3UnhleklzTW5mdjB2eHIrVWNWR0J3dS9HeStkSjRvV3JD?=
 =?utf-8?B?TGZCUVgwVHV0NnVpU1pscGtxZ3JXZ0V0UldmelVIc2pyNWc3ZVBUYS9KcmZz?=
 =?utf-8?B?b1Zjck83cDZQenRNM3ZFRERmdlNvcDNvV0M5Mnc3OERoUnpleUJMZU8vWlhN?=
 =?utf-8?B?NlU3ZDhyR0llTGJXazNUZE5MM0tBNmZ3N1pQQ21IcWQ0QWZiRU5QTnoyOGtF?=
 =?utf-8?B?NmZTQnhlbFcrL0tsL2dNeSt3TCtlM25oTXpyYlF4Y0czcVd5YUw0SVlWblhz?=
 =?utf-8?B?aWtSZ2phQjRodGxjRERmZHdVd0V4b09IUUdaMnBuS3d3WlFkbytpVU1LZTNY?=
 =?utf-8?B?dGRvbUlsVjQvYkpVSG5PUlVoeDc0WSt1Q3MxRjhZRFkzZXdQaTNIbXJpajlM?=
 =?utf-8?B?YzRmNTR2Wjg5WVV3TmJuM3JaTFBCL1NvMWpsSFRBaWxhSS8wdWZPbFBiVGlO?=
 =?utf-8?B?cnptN2dzOEczUEZma09XQXlyUTJnTnJNR01ZV0RxUWo4WVJLeUdJQmU0Smt5?=
 =?utf-8?B?dCtQZ1BSNnl4ZDBpQnlVcDBKNzBQYnhJTlp5d1g4NkhsZHZUM0tDUlZlK01Q?=
 =?utf-8?B?eXRvZHdLYSsyS2VxV2pSYTFrQ3VlLzBBTzlyaVFyYmtwb2Q3MUlsWUk1b09w?=
 =?utf-8?B?TUVxRnIrY1JlNFhtQVVzZi9SbHBOM01mMktrSlFOU1huYkl5MmUwZnl2UXBo?=
 =?utf-8?B?SEtKZVQ2VDF6QjhadUVDYkhzSDFPWlVoOEVNeUFCNXJJNWtPSWgrWG5weTFq?=
 =?utf-8?Q?xhi7faaLQeX4NPf71RaL3xeZx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b1dad9-ad1b-4706-2eb4-08ddbad9a003
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:21.4495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw91cRyZ7dpGYcU9UpvymYlroQbjVICjubgJmcDBGyiXJZCnnyrNnueu9aIo6Tt8tx80akb7QV1esozAhYzOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

CRTC(s) could still be running after the DRM device is unplugged by
calling drm_dev_unplug(), because the CRTC disablement logic is
protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
driver's runtime PM) and pixel clock use count could be inbalanced
after removing and re-installing the driver module.  To fix this,
add a helper dc_crtc_disable_at_boot() and call it to properly
disable all CRTCs before advertising DRM device to user-space by
calling drm_dev_register().

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
 drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
+static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+}
+
 static void
 dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
@@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
-	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
-
+	__dc_crtc_disable_fg(crtc);
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0) {
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+		return;
+	}
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
+		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
+		goto out;
+	}
+
+	dc_crtc_dbg(crtc, "disabling at boot\n");
+	__dc_crtc_disable_fg(crtc);
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (!dc_drm->pe_clk_axi_disabled) {
+		clk_disable_unprepare(dc_drm->pe->clk_axi);
+		dc_drm->pe_clk_axi_disabled = true;
+	}
+
+out:
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
 static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					 bool in_vblank_irq,
 					 int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -17,6 +17,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	struct dc_drm_device *dc_drm;
 	struct drm_device *drm;
+	struct drm_crtc *crtc;
 	int ret;
 
 	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
@@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -50,6 +50,8 @@ struct dc_drm_device {
 	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
+	/** @pe_clk_axi_disabled: disablement flag at boot */
+	bool pe_clk_axi_disabled;
 };
 
 struct dc_subdev_info {
@@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 	return -EINVAL;
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
 void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 

-- 
2.34.1

