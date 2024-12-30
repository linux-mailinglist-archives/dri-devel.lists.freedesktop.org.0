Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B09FE1A5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 02:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F46D10E10C;
	Mon, 30 Dec 2024 01:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hTjcerCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD4010E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 01:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1yZ+ces9UOHNYokqPXBp43Foz17iMLFM+75nyzhSD8LPRRgGuRZXdKcTDp9q0wbfaMcZRFJqRsir5/piMSLxMlMj1xzwXRxzeXcJq9wTLZRPRFZYJLUddECGaPDyezQyQgl6DRi/c/xv3fc1FqAucE9yhVkQ8ZRUloOmLim6vds2V5yjMZK5bNu5etIpFJuRN0a8w9CuNTh5vl7c2qaCV5XjbhyeDtfHHcLQjauYqHvBV3Qq/eedEqZY2pvgCzVIpFPuDQh8D8myXzZ+JaP+cXpkzNTqNqH7B3RiG8fnaY2GsHz3BZ+bEPyBmVs1Qr+ZVEpg04NP9SwjDOV1abtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soJMyhqlII/XyDdg+S42sOYEr1kQK5Plo78nqtgu2j0=;
 b=olqCvkM/tYTsdd3geppzkB68Ey7AMJnDC10waTh+YaqnlbafkEgF1y4TGqepphqPGA82rPr0iK2F5Nr31W/AGaQgN30h7rnnlamoeXg74j0KIv7I4Or6tCEND9SHx9ZgHnKuxCgYQAHKq2Jw3nYzptkJOlVEXfoEG1tG4vs4f+21g7Bes3DmYGvZtqBwXaSq+9j5Vp2n7IO9Lg0UBUd8Bn/yA8tO7ZXq4O/W7aXB//3S/YUl7z+riXPbakqQaINfsMmEzXYrMwr6GNGnpOMaiaum4mJUnW0KZbCRVZ7bGlS1m6Dc9WfVXkgdUZBfcfBWVdYWzWEBTPYbZvFycgePjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soJMyhqlII/XyDdg+S42sOYEr1kQK5Plo78nqtgu2j0=;
 b=hTjcerCRnrfmGaHqwzqmkkmkcjTkA8klprLq9DN+JdqPV/ycrFNk1oiMtOKI59U82Vtm/TS2VzrnuFHU81+vA+rVUyq9+vz/vzC46WFn8rmz8Vhte3oaWOZdwwCABECeyOKqsWv2+wPsECXBVdsVWVavkX2mcwZLckp/pE6xQs40wI2cCgtkLrX+AByq4IHzd7xsUNBs3LBRzFY01y8tErkomtXCpLW22c23jyvDaDHv8MAqvcC2z4CEKgaYgHaXt5HvRlTdam1ie8D5vIh5DYmTBQmX8VS++HWa8rAvqWuCpemT+gKTbJZnJjmSq6okN6WM+8r+J/yoUM1P297K4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 01:49:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 01:49:47 +0000
Message-ID: <e78b6142-b0fd-40ab-b342-2ec2c4f89d4f@nxp.com>
Date: Mon, 30 Dec 2024 09:50:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-13-victor.liu@nxp.com>
 <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
 <77540387-b1ac-46c1-a3c0-afbd34337d61@nxp.com>
 <CAA8EJpqwRfkjGCYfeRPj7u5hb_8fkMFDtcK1+YDG4nsez1WNXw@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpqwRfkjGCYfeRPj7u5hb_8fkMFDtcK1+YDG4nsez1WNXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ff1f3c-3536-4256-8722-08dd28743d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cng5dlI5OHNnbVA1MXN3aDMrZ3Fqayt2K20xdXhmL3NXYUVIeGtKQXovM2d1?=
 =?utf-8?B?dDduZGlRUjQ4UVNEei8xZndIUGJQbG54R1RNVjZJc3R2anhaOTk0cGFMYkF6?=
 =?utf-8?B?Q29iSC9qQ3BJd2NUbytORmZsU0tucjltMWxWLzNaVGViMTRLZ0VuQks1a1V0?=
 =?utf-8?B?Skc4dnhtbk5EUUl5UjVJUC9ZRHQwai9Dd214WFUybzc2NzR6K1BFZ2pBdnA4?=
 =?utf-8?B?NHlYNFllaHk5bnY2WklOODRxTWRZa0NaQlp6bmlKTUxXN25tOC9QMFhYRFNr?=
 =?utf-8?B?ZmZOU1ZZOVdDYnpZNnB5TWlRaC9zTEdtUlJzZkNqZ3IvNlpHc0E4YzRML2FR?=
 =?utf-8?B?cFo4c2ltMDUwV09hK1NXZHVEMldOMHpUanJQeXR4OU9qZWVubTlqdklCc2dE?=
 =?utf-8?B?dERWWTdHRE5QR0dZNkF4UkxaaFNCblR0a2lVUjNQV01OZVZqWTc5WU54dG05?=
 =?utf-8?B?YUdEQTBiSDBUTmkzVlQ5N3hOeXp2OXA0M0hrRjBMZ3h1V21EcXBUdmVFaFRr?=
 =?utf-8?B?YlprTWhjbjl0MGtjZVhnbjBrK3V4aGdCUXpYYzExU0ZXUE1mWjZFV1c3OUl3?=
 =?utf-8?B?S1ZnclNNcDhrYVZHZk5EZ0VsUy80eUJjUzhLNE9aY3VQbm9sZXdhUERLNEw5?=
 =?utf-8?B?TUw4a2F1SUpSUkw3bDNEWHY3aEZROThqdXl2SzNKU3RlbHFHcUt0bnNyN2hv?=
 =?utf-8?B?Q0VpMlJDZTFHWEFwcDA1dzJ6cWJCbFJWMGFQaG1PaGhXa3VMRFNDR1JFNWtM?=
 =?utf-8?B?N3FmcWtBQTdndkJwM0pzeTFNbzF0Y2RpR1FKUGpMbDVOMm84bUxqZEptK044?=
 =?utf-8?B?eFI3Y251ZkVucUhvbDluc1hIWm1FNW1VOEtHbFBxRVJubU8xa0pWNHM5aUVl?=
 =?utf-8?B?d015U0h1a3hpMVUyZkljd3J3WEYxZUdnZGtxdTNBQ091MHdjYUxnKysvckxY?=
 =?utf-8?B?d0RPN09HT3c5dnlmTzgyWWdiRDJ4QjVZRG8vRkM4aW9NTFpNU2FYb0l5VjNK?=
 =?utf-8?B?RGFWbWpjWTFJOHlZWTVvaHFsZU1Ha01jOWJidVYvTTVWTXlCU1lMdnVLVEM5?=
 =?utf-8?B?TVJDSGJrZ2dkUFppcHA1QTN1eHFrUHI1TGpoUmNwSEV1VFFTekdTT3pUZ1Jv?=
 =?utf-8?B?STB4R0laUnVsMVpUbFRpRkNmQkRsQnBHQk9UdlZ5UDY2SE1QRXhFY0tRd0Fr?=
 =?utf-8?B?aHFoOU1DaVBManc2OTlhNzJKVDFtc0hqWDFWRTVHajNKVUlxMlRMenA2WXNi?=
 =?utf-8?B?eGUrT2x6am1GUnk4NXhRajF3N3RNY3NyVlZRU2gvdWFpaVd1SW45cExYT0R0?=
 =?utf-8?B?bVYrRlZoZU9INitGSVNCR0JxYVBDdzRhY0ZFZFF0T05yQTRMNHpvUFYrTE1w?=
 =?utf-8?B?MlZmZkM3MTl5SS93S0FMellEVzkrN1pnQ2JhYzhVQi9jTVZvOHFIQ0ZUeXhI?=
 =?utf-8?B?MGhWdlFxR1EzT1NNYi9VZG1uNzk4RmZnM0tZSGNQVVgzNmszUUZ1SVBxVUpU?=
 =?utf-8?B?Rk1PenhpYk03aVFFNk1pS0ZaelNmUkZUNy9tSFQzMDYzN1NJeGczYmViTGVz?=
 =?utf-8?B?WVZ6aGI2dmVjdU0yaCtqZllEYjZnR3VWZWtGdE0rMUtHN2tkUTQzSXc2VWND?=
 =?utf-8?B?cHVSMWYwQm13UElweSswcnROd1NMMGU3YWVMOUxRZ281b1lTU1hwMWZLSnVG?=
 =?utf-8?B?RTNYYVRMUGRONVVuRUdqTmc3WHhkQjU3eUU3TkV2K05raVFZWUVlWFg3Zllm?=
 =?utf-8?B?WFdkMUpqRGd0M2NLVFkrdVMrTXd2RnliZ0NyN3FTZ2tCdWlObGlYL2hMMktS?=
 =?utf-8?B?YjJNOEIyVjRQcWoyRFZMMGlRZ2twaEFVdWpnTUJycERJcUxVUFR0T2VaRUgr?=
 =?utf-8?Q?wkz58ayYt4XkW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1NpNGxFNkJJZnZ2L2Q3TDZEZEpUaWpPSnBFcVFYSHkyUGJEL21KVzN4ZUJR?=
 =?utf-8?B?K1pmRnpTM2JKQWNLMEIzMmxjemUvRzNnTXFqbjlzcm13RkxPbi9kaDhraHg3?=
 =?utf-8?B?K1NkczUzVmRyRHV5VWZTSGNiN2g0YnhBN3ovMmpHblJBOWFsSTBkWlRMVGl0?=
 =?utf-8?B?ay9NNFpzOE1IekNQNjlSZFI2MUk5QS96Q3FIVDVMR1lPdTBEVHp6cm1IZ1JG?=
 =?utf-8?B?dEY5MEwraU1ueGRURW5ZRTVkaWFiQWhlZU1QUmxnV1ZWdnlROXlXRUhNcnB2?=
 =?utf-8?B?aG9uQTV4dmxVVjBEU1YxZmRjVmhBSUlFY2FwY2ljczVGUmh0Tyt6bkEwT2Ey?=
 =?utf-8?B?S1VLMUtQdUxxeFhJUFMvUHh2Z0I4M1VOOFJXWUpnbDZxbkRDcjg4ZTh0ZE0v?=
 =?utf-8?B?ZVVySHl2ek56L24zZ29QbUhuRVUvT2VZNmhuM2tCdXRrVDhja3pYTkJyRmV6?=
 =?utf-8?B?ZGMzRWlKSkk3NXNpb3ZJRW4wdEVUenQzMkRxVkh6VkcraU9VV1RFWXJGMWRy?=
 =?utf-8?B?UzdLbGxpck5jRzVvNktwVmdvWDQzMEhENFg4L1BSdVl5YTI5L0VGVThubVBE?=
 =?utf-8?B?ankwMit3NjRKTGVoV0Q4RHpncGlodHh1dExKRHd4MUE3WE9XRTllc0FkdGxW?=
 =?utf-8?B?RmF5cElaSVo3cVlpbVVsMC84M0pRT3lNOTBsV3l4Yk9NYVgxUGlRbFFodGk5?=
 =?utf-8?B?MDlxSjFBZW5RMUlKSmNlSGlVQjBqTUdjWU9sSUhlemZrcjlJZC9ITWtEMmdv?=
 =?utf-8?B?d0RmYkFLakNaRm1pa2l6eVVydWc5SExJRUxYQjVBZWh5NUhCWHlZSG8xcnFE?=
 =?utf-8?B?d0c2UVcwU3V4UjQ2Z1V4b0U4S21seWVsc0RjdGdXUlMzTnkxL1ZZYTAwbkUz?=
 =?utf-8?B?cVA4TWdaa2YwNFBzUWtXTFFmeVlQWGtFbXphL2ZGM2hEakFhR2tXY0ZUR1Ez?=
 =?utf-8?B?YXNnRzlrTzlHSTJKQktrVGFHUWxlYkZHWjRNOXFwdVpSczJRMHhUdWFEWXp1?=
 =?utf-8?B?Z3RPV0JjdStKRkFZQytaaWlHNGN3dDRxQnkwU0tSak5uZDF0VTJFTjRNSzVZ?=
 =?utf-8?B?RlFZbUlENDFtMVJOQklvSmQvYnpLazdJNDc1ZUZDcDFLcGFNazdhTC9DRklm?=
 =?utf-8?B?bXlWakx1SVFJWXlMY3Z6ajdqNlNyWHMrVEo5RHVVV294cWh0MFlDWXlYTVRw?=
 =?utf-8?B?QUxWQUZVN3Q4QVAzWDN4N1FvaVlVU3psaFlIMWVmdnBNaHZxcEhjcVhuSzUy?=
 =?utf-8?B?ZXNQS3pLS3dHSndmbjZuaHlkVnBzaSt2Q0tsV1E2cXJneUJPbE1aTHErVE9r?=
 =?utf-8?B?dndoUkRvNTQzTVk4czJHWHJmU3dUNnpaaFFUOExUWUtKUmw1cEVqbGpndVpT?=
 =?utf-8?B?emZjMzNTVkg3OGw3V3JPcUp2ZEJBVEhDeE8yazJhcmF6b3N6cjBIaFA2cFhM?=
 =?utf-8?B?YjhlZUVnOUhyWG0va1Z1YzJXdDkrNnJ6My8zYVdZcXdDa3ErdkN4cFVPdkIv?=
 =?utf-8?B?Yk9MU0lWbDhpZlhHZkI3RUMzN1RJTzVyZFlaaTFoZExEVTJ2THU3R083dFdn?=
 =?utf-8?B?NCt5bTk4dEc0RWpDQjRXQk9qUW5MaHBsaHB1Y01sNk8xN01FOEhMaGlBenBU?=
 =?utf-8?B?aysrYVJxb09FRStubHlmTWg2VjQwcmprVzRlT1l5R1VoNytaK3hVMVZvSkF0?=
 =?utf-8?B?QVdVK1Btei9TWXN6V3U5aysxMHA2SGE1MVpBYTRCRW5oMElHUFpmM0t4dkVG?=
 =?utf-8?B?VkYrZ2R4TzRQemloY3N6MTA4L3VaZ1kveUhBZnoyRThQMWpvVW54YVgzaWlk?=
 =?utf-8?B?dVUweldUVGFWb013MWZFOVA0Mnk1NHJlODlXeW9YVVlmNFA0Yi81Z2hhNEVF?=
 =?utf-8?B?dk9JL2RzVi8zMWRrMkdXbitqKzNNQU5FMnROY3pPMTFhUTBNbzErUWUzT0s0?=
 =?utf-8?B?UDIwTTFuc3pVNlllVGc5eWRFNWVGRnFrWTQxRllkdGFpNWtFUVVjejZnL05G?=
 =?utf-8?B?K3BBRUJ3bmxES2h1OEFBUXFwM1NOeFQzUktxSHFtdmlNN0l5ZFVQRXJkaXpT?=
 =?utf-8?B?RTRuQklnN1BGVFBrUVZqMUpOKzNwMVVobmEwWGEydkF0YUN1NjZPdGNtUTcv?=
 =?utf-8?Q?fhzkgJdgenttJjfBWsxI29pDv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ff1f3c-3536-4256-8722-08dd28743d76
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 01:49:47.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fX57f+PPpE1gUq8OKULvJCTQE14ps3ZT0C4aJiKZYthw5s/5ewEKnHUM3R1V56nKnvZcp4520Rer+dT2GYMQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7753
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

On 12/27/2024, Dmitry Baryshkov wrote:
> On Wed, 25 Dec 2024 at 09:18, Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 12/23/2024, Dmitry Baryshkov wrote:
>>> On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
>>>> i.MX8qxp Display Controller(DC) is comprised of three main components that
>>>> include a blit engine for 2D graphics accelerations, display controller for
>>>> display output processing, as well as a command sequencer.  Add kernel
>>>> mode setting support for the display controller part with two CRTCs and
>>>> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
>>>> registers of the display controller are accessed without command sequencer
>>>> involved, instead just by using CPU.  The command sequencer is supposed to
>>>> be used by the blit engine.
>>>>
>>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v7:
>>>> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
>>>> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
>>>> * Inline dc_crtc_check_clock(). (Dmitry)
>>>> * Use global drm_dc->pe. (Dmitry)
>>>> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
>>>> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
>>>> * Define common IRQ handlers separately for each IRQs. (Dmitry)
>>>> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
>>>>   and correctly include drm/clients/drm_client_setup.h.
>>>> * Collect Maxime's R-b tag.
>>>>
>>>> v6:
>>>> * No change.
>>>>
>>>> v5:
>>>> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
>>>>
>>>> v4:
>>>> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>>>>   function calls from KMS routine to initialization stage. (Dmitry)
>>>> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>>>>   appropriate .h header files or .c source files. (Dmitry)
>>>> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
>>>> * Drop dc_drm->pe_rpm_count. (Dmitry)
>>>> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
>>>> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>>>>   Instead, put it in struct dc_crtc.  (Dmitry)
>>>> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>>>>   (Dmitry)
>>>> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
>>>> * Select DRM_CLIENT_SELECTION due to rebase.
>>>> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
>>>> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
>>>> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>>>>   rebase.
>>>> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>>>>   register dc_drm_component_unbind_all() action.
>>>> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>>>>   make sure next bridge is found first.
>>>>
>>>> v3:
>>>> * No change.
>>>>
>>>> v2:
>>>> * Find next bridge from TCon's port.
>>>> * Drop drm/drm_module.h include from dc-drv.c.
>>>>
>>>>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
>>>>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>>>>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>>>>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
>>>>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
>>>>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
>>>>  9 files changed, 1342 insertions(+), 2 deletions(-)
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>>>>
>>>
>>>
>>>> +
>>>> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
>>>> +                                    struct drm_crtc_state *crtc_state)
>>>> +{
>>>> +    if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
>>>> +        state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
>>>> +        state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
>>>> +            dc_plane_dbg(state->plane, "no off screen\n");
>>>> +            return -EINVAL;
>>>> +    }
>>>
>>> Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?
>>
>> The can_position argument is set to true, though it is a bit unusual
>> for primary plane.  If can_position is false, I think this should be
>> ensured already by drm_atomic_helper_check_plane_state().
> 
> The function still calls drm_rect_clip_scaled() to clip the
> plane_state->dst, does it not?

You are right. I'll drop dc_plane_check_no_off_screen() in next version.

> 
>>> With that in mind
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Thanks.
> 
> 
> 

-- 
Regards,
Liu Ying
