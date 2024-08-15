Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A026952A58
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 10:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3410E238;
	Thu, 15 Aug 2024 08:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="PR3578ML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2126.outbound.protection.outlook.com [40.107.20.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43D10E238
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 08:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkMCnAvQimGJTNP/HFrofrckmB9wLS2i7/GzgR5686Xm5hq1fCq425kC7rMSSbDsLREW6GDsiNyGRzZ337dfqfZxx5jkLBX8UOaoEdozbZI39Dw1VCfIFG0XyvUkNAlIL1gx3qhGgRH0utPNY5wf7HJyPZMt/+fT/pm6/69SqOU9qLBISCEjUElrIcKPbhbJRPrSZNdHt4DuGf6tgQDDg3AgGJ3r87ih8LTkkGzyTF6I5WKFwdUK1t26nBYhuVJCepeIgHpxFPZvKIKe9BE2hCO8Kq3Ku1ezwOfF0Tt74G2TrPtFInROs+uUZkNEaCJ4VCwQmBM9y8zskaV1NfnxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Zi5tPuLc0iFDOBqaoyhe/owZnMsgbGn3N7GzUq3W4=;
 b=AzGk5Jkcky/EU2ROVNO1EMgLr+OMT7iD/0tVCsuJEafzCdzAzyYlilX7yHqteQFMxSQoKw+nBRpd/KtpioxDXUyT+8rnqs/BxfVNa8b0x2pjKTcnsb7NdycYo5Y3GOtnA/R3ehqkR5tbOJHj7p54lCzLP6iZ2GGp7IJtrZLp5VMY0Vs1q6BxnxMPsvGvuuPIiq5E5nuDjNX9ee7zCTves4c6llxeRIsW414sLRZDc3V2fMD3HurCNkHR6eMCYdXE6Jrm1EYl8KNuXcynouuCd/ifioB4zVyZDsY1UkbBnSo4iw+bCHA6cxC0P54QatII3hNCQ+ydkI3SQME2PVocaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66Zi5tPuLc0iFDOBqaoyhe/owZnMsgbGn3N7GzUq3W4=;
 b=PR3578MLZuEY01EqiH1fNoEhzq8fe7e/ofE6WuXXfkw1wgncssGGvZhAv36FQYd5VzGzlTDz3ppS20EPYtj8ECyFJ5sOwE4ESUb0/pLrscPjrGDdIvPFV7gcni/8FjNhYl9Er4zBFpiVZBLhR2mHTswuPjTgz2qK4PwGpMmwJjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI0PR10MB8523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:237::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 08:19:30 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 08:19:30 +0000
Message-ID: <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
Date: Thu, 15 Aug 2024 10:19:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
To: Lucas Stach <l.stach@pengutronix.de>,
 Dominique MARTINET <dominique.martinet@atmark-techno.com>,
 Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI0PR10MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 6907b217-2a61-4da5-d449-08dcbd02fc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzNESUV4cWhEZXhiOGRtSzFQdFlhcGJSZmVZaFgvN3NZSzAzWnFBSHhTQVFO?=
 =?utf-8?B?L05PMDNlRXJBS28raDhYRlpjVGdxaXRyYTl6aFhmK1dnYVpjQ1Evc1U5ekNh?=
 =?utf-8?B?cEJmNDF3ZXhtRXl0RXAzeTF1b0JCSTNKeUNFRHN2SVFuUXdwSlorQ2NJaEdI?=
 =?utf-8?B?RTEvQ1NrdUtBajZDZWlkQkR6R3hRck1Gb09vd2JKcGF1TGdmUmNML1ZsZ2hp?=
 =?utf-8?B?YUZ3QmozR0V3TU51WFhvKytKUXU5c3p2KzB3K21WUHNrN1RNKzk3WU40eWVv?=
 =?utf-8?B?WDdsVUtuQzFUUU1vSHNyVGZCUUdQSFQrY2dvZlg1ZHdyUkhFK0dPeUl4d09P?=
 =?utf-8?B?cU5Ub1h6d1dDeC9pSmhHNVdLekhPdU5ianhpK3ZOczYxSlZnS1duZmc1dWRB?=
 =?utf-8?B?NXJ5d1VqdVF6aXRYYjFIMEl5SlVNd3VSTTRKZ2JkamtrbXhtNHk1azlmWnht?=
 =?utf-8?B?enpJaGhsTnZoRDBtK2VYMGJXaTNqZ1Z5eWJWbFVzbGVaZVphWjdLS0pUVldm?=
 =?utf-8?B?ZFhydDVPOElHVjFGTDE2OXBmRWVFdDRteEpHMTdaVmZ4QjBQRzBoQk83Y25W?=
 =?utf-8?B?QkxmbE40T1RVWk5zL1B6K09TTFBLTHFHTVlQM0lKYit6NHJVVDlVNlBlQWdr?=
 =?utf-8?B?UmdsMEM1aW5PdSsyRHpTOHRWeGdkSmVneXpvdWlwbUhPQ0ROOWs4cEVSL2c1?=
 =?utf-8?B?MW1SKzIxVGNVempnQ05YY1J3d3VpS1FnYllQYXlZdnMyZ2RWV1FqYmFvSjJs?=
 =?utf-8?B?cFpad1dOT0JDYnRuUmV3V0dlSmswdVhsc29EUjl1RUxZWW1aWHRPRXdBVEhv?=
 =?utf-8?B?d0c3ZTV1NURBOTFqN1dXbDBTWFB3dzR0Um9rSmdRRHduM2dVeklIcnZLVUhh?=
 =?utf-8?B?S2R0OWF0cUNQSWJ5MWZJV0t1Z0NVTFZQQU1XbkI1bUFaQ0gvNEY2UnJPMW9E?=
 =?utf-8?B?L0NxSDVER0h2dmhzVW1NMmpLQmIveHhjL2ZFdXlOQXd2dTlqbERmQmNyOWQ4?=
 =?utf-8?B?OHhQU3hYUW9mbXVVbCsvbWVnOXJFYXJ2NlN6NjdiWDdNWnFXYXlhdzlwaE1t?=
 =?utf-8?B?SWw0UzVQZlM2QXZyTDZ4cHdhMTh0dlM5L1ZEblBYN1dLRklPQ1NEeFk0SVJG?=
 =?utf-8?B?M3JGNkFnZXZpMHdBcVdhc2oxNEZRaGsweUJmR3FPaGhneWdMcExTTmt4ZUhN?=
 =?utf-8?B?eWwwT3FpQWc3T1VLYmU2Z0NKUEJaNnFYcjdmM2F3MENsbjlNVklHUW4rd25y?=
 =?utf-8?B?dDI0OHhiY1NaSVllaHQ5NkZRc1VoTWNhWHB0K1ljMVlGWDMvY2Fpbmx4RzVm?=
 =?utf-8?B?WlNxRFNIemEzUDBFUWR2UGh5aWUvbGd2a0RNT1lySmhNbWZVTkNxUlgvUk9z?=
 =?utf-8?B?RDR4T0dQM0REMzJUTDhIOU5Yb1pIMWFhS1VXMFk5bzhNYzBQREFrYUJlOWor?=
 =?utf-8?B?WmcrL2lHYjJNRUNzSzZzajhiZ1RrSTlETFkwTTZPbXNZU3ZleGVBQWVNRlc2?=
 =?utf-8?B?Q25yMFJJcWlCQkgvS0tJbkxOekpNdythT1BiNW5rQ1Foc3JKem1TY0x5czlz?=
 =?utf-8?B?V1hFYkRJMTkySlhUUmh3TXZtV3d0MDZsdExHQ28rWjFGMUdkemVDellKMDU5?=
 =?utf-8?B?TTgwaDlncW16eUJQcHhiOHRKTTNUeWFsS1o0UnVSWnFCWnd6YjN5MnhYSE9i?=
 =?utf-8?B?bmZEd1dqdEZ4RGx6d3ErOTg2Y3N3Zlhwd0F1M3lSN1hsMW55Q1JkWTdPQThF?=
 =?utf-8?B?S28zd1lHTFp3MTRKTUJyOUtQaVF2dkg3STNxUWU2RDl4YzM2QXIxUjRCQkFp?=
 =?utf-8?B?NzFlN1RkQlN6QkZCdHVrZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FxTHU3ZDEzVzZnQUdXY29ROFBrL2liRlFGRXV1RDRzcmxuOTMrSjRYeU1z?=
 =?utf-8?B?T2ExQ0FDa2tDR29IYXdadTFnd01JYlhGNHR0dmd3cy84VFAzMjZRZUNsbWJu?=
 =?utf-8?B?bHBOUFVzRk9ESGUrMWtSZGZHZ3B1cW9KRFlFdmpZQ3Q2TmtDVmtLc0d5Lzds?=
 =?utf-8?B?ajRrdWdlZmZLUURyWkE1K1hQNUxSRUNIQkFPZnNsZEVqRldZVlVGRGczdTlr?=
 =?utf-8?B?ZlNKMDF3ZFByaVpZUHUvSWlIWkw0cWN6S0syY2dWaWw4eFFobkR4OWpEcDg1?=
 =?utf-8?B?cFFPcFozM1k5Qis0ZzJzUDE3dW5KcWNmak5sWHhXKzQwSXdkV3dlWGRuK1Ar?=
 =?utf-8?B?dGRNL2xuUDA0YnJPYi8rd2xmbXNlazdLeC9ubElwUU93VGNQcml4c3JrRHlM?=
 =?utf-8?B?Si9EUVFBYlhxTXFqaEFXQThoMktDUXI4NkNoc2RjVlo2c09ZRmxZRllQNmU5?=
 =?utf-8?B?WXB2WmVUZjNtUmFnWDF5YVoyQlNDeVdXaWR2aldtVTBYelNNak5DVlphYXZV?=
 =?utf-8?B?UTZlL0JOKzkrVUVTNzZpUU9xVUs4VFJFVUVzLzZqV29aeURtMUtoSVUxcVE0?=
 =?utf-8?B?NnBwRVJuZzV0UlREK25SZUY1LzBwam1xV1JMY1JHS0tqcE5UMEdWeGhsRmxh?=
 =?utf-8?B?SUFHNUJIOUxHYlFaREwveVo1YnRWejl4ZUkza0ttNUxwa3NNaG53QlNmS0RF?=
 =?utf-8?B?Z2srMTdXUDlGcGZMd2hzRXBHdXBGMys0Q1VFNkNOYzd5MS9rN2lEY2tYY3Z5?=
 =?utf-8?B?enprZnlFT3NGc21rbHVRajIwV1k5YUVtdUtqYUdIWVVGN0wyNEorcGJ2M0Fa?=
 =?utf-8?B?SXBVYnlsMVRLdFo3cVpiaVJRbFJIRm1ZekF1K041cVVoRjJYdWROeWRTQWJB?=
 =?utf-8?B?Nk95Mml0VDlXT2RvdmxPNTJGazdtMGhSOHZUbFNjNnpqQUkzb2ovTjM4bkhL?=
 =?utf-8?B?b1VkWFFJaVZWZ0NZQWxvV1duNTJjaHFzNTB5SFU2c2owWTZLWmhMSm1xMDIx?=
 =?utf-8?B?azkrYmNMbjFET3BzQ0pxUE5ubDdRTjVKaHRnVnNWTUd6S3FIRHRNWWVPT251?=
 =?utf-8?B?NkJKaWtTc0V1TWkyYW56QUhlditMMGRqZzA0amFkZ0l2Vy9nVEZVak1mT0NG?=
 =?utf-8?B?ZE9JbGk0UmN2MWhiRkRhZkhxNEc4aXpGZFpsbzVMUHcyVGtuWFdIM0ZYQjlK?=
 =?utf-8?B?eDNUNTkrTUVqV2xaaXZKdSs2UFQyYVVCNDhXMFk4eFZHYXB6RlBTalFQejFT?=
 =?utf-8?B?QU1qR2RhUkhXOVVXRE9EOHoyem1INVl1UGY3Tmk2bjdkRU1wNGVXbUEycGxV?=
 =?utf-8?B?UW56WU5CL0g5SFpueGUyc0RCTGZKQVU5QzBMajM3dWZxZGRUbXhib1ZENnNK?=
 =?utf-8?B?cjdKSW5DNDNRTUs1NGV1ZUhKQ084cUt5MTlTMVk1Ti9qaWgzQkpBaUpCSkU5?=
 =?utf-8?B?Z2FoWHVnNVBDa2RrTzFpdTZpVXpWZXNtOW1La1lwSHFOY1cwbkdEclgvbXc3?=
 =?utf-8?B?bTRwUEE3WVZEc0VObE5raC95Z0MySGIzS1pub0x0MlVxVjk0ZCtyN0VSc1da?=
 =?utf-8?B?RGw0dXphNlpqWjJuMmtrNHhmSFQwMEdGRGRuUGRIaFZnVlF6R0plNWF1cmdy?=
 =?utf-8?B?bjZ3c3pzOWxDbGpBQzM3WnlEcGswenkrT3hsajZSWG9jRXdHZ29hQ1hORnRt?=
 =?utf-8?B?bzZNaFRCejMxbFdtanVXR0FxT21aUjZYT2VkUndHcVhlT3pRTC8yTUU0dWZV?=
 =?utf-8?B?OFEzZGF1MlR0N3h4b1EvWExZZmNGYUFrNDBrZ3dRVFQxWkxWZWYwY3pTZzhz?=
 =?utf-8?B?aXRQL2JOSzA0MEhDZ3Jvczdqb1BVQUt3TmlML3BrZmtlcUYxWDhEdXFacHN5?=
 =?utf-8?B?bXNwKzRjWlBqcU0yRVZnaUl4TUptdlFqQ1FVRG1PcERoaFljTWdOaGRQV05a?=
 =?utf-8?B?QWQ3M3JibXRrNmJRU0R1aVpXL3R5Vk1KRXNmMm5XMFR6LzNUcGpjVFo5djVO?=
 =?utf-8?B?eUZzQ05ZZ3BORmFCNkFBS3lpLzdpd2NNcXU4YmNHUkhJQ0tWY3Vma1U4UmVq?=
 =?utf-8?B?ckZDc1dlcXRid2lOVkpEdElXWTl3WDRmUkttM0FKeTIxS1VTTzZYTWhyRkVh?=
 =?utf-8?B?Um5iRkVZTXdBUlpuZ0pkQTVwN0ZieDFVdkZvNXY2QUpiL1JUK3l1TXNvSlJs?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6907b217-2a61-4da5-d449-08dcbd02fc78
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 08:19:30.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS+hzLRzecrvf7XL/pP7BXyKk4zl2DtAiC/H+AOJJLQTo0IUKSDCvL1nr9Z0i9AREujf7p1YDenNRw2p77S8P/3zRAg/fv4EfiAfC+ILlYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8523
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

Hi Dominique, hi Lucas,

On 17.06.24 6:32 PM, Lucas Stach wrote:
> Hi Dominique,
> 
> Am Montag, dem 17.06.2024 um 15:16 +0900 schrieb Dominique MARTINET:
>> Adam Ford wrote on Sat, Feb 03, 2024 at 10:52:50AM -0600:
>>> From: Lucas Stach <l.stach@pengutronix.de>
>>>
>>> Add a simple wrapper driver for the DWC HDMI bridge driver that
>>> implements the few bits that are necessary to abstract the i.MX8MP
>>> SoC integration.
>>
>> Hi Lucas, Adam,
>> (trimmed ccs a bit)
>>
>> First, thank you for the effort of upstreaming all of this!! It's really
>> appreciated, and with display working I'll really be wanting to upstream
>> our DTS as well as soon as I have time (which is going to be a while,
>> but better late than never ?)
>>
>> Until then, it's been a few months but I've got a question on this bit:
>>
>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>> new file mode 100644
>>> index 000000000000..89fc432ac611
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>> +static enum drm_mode_status
>>> +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>>> +		       const struct drm_display_info *info,
>>> +		       const struct drm_display_mode *mode)
>>> +{
>>> +	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
>>> +
>>> +	if (mode->clock < 13500)
>>> +		return MODE_CLOCK_LOW;
>>> +
>>> +	if (mode->clock > 297000)
>>> +		return MODE_CLOCK_HIGH;
>>> +
>>> +	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
>>> +	    mode->clock * 1000)
>>> +		return MODE_CLOCK_RANGE;
>>
>> Do you know why such a check is here?
> 
> Sending a HDMI signal with a different rate than what the display
> expects rarely ends well, so this check avoids that.
> 
> However, this check is a bit overcautious in that it only allows exact
> rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
> check could be relaxed quite a bit to allow for that.

I checked with a 1080p display that reports 23 possible modes via EDID.
Out of these 15 are accepted by the driver with the strict check.

Two more would be accepted with a relaxed check that allows a 0.5% margin.

For the remaining six modes, the pixel clock would deviate up to ~5%
from what the display expects. Still, if I remove the check altogether,
all 23 modes seem to work just fine.

>>
>> When plugging in a screen with no frequency identically supported in its
>> EDID this check causes the screen to stay black, and we've been telling
>> customers to override the EDID but it's a huge pain.
>>
>> Commit 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY") already
>> "fixed" the samsung hdmi phy driver to return the next frequency if an
>> exact match hasn't been found (NXP tree's match frequencies exactly, but
>> this gets the first clock with pixclk <= rate), so if this check is also
>> relaxed our displays would work out of the box.
>>
>> I also don't see any other bridge doing this kind of check.
>> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c has a similar check with a
>> 0.5% leeway, and all the other drivers don't check anything.
>> If you want to add some level of safety, I think we could make this work
>> with a 5% margin easily... Printing a warning in dmesg could work if
>> you're worried about artifacts, but litteraly anything is better than a
>> black screen with no error message in my opinion.
>>
>>
>> In practice the screen I'm looking at has an EDID which only supports
>> 51.2MHz and the closest frequency supported by the Samsung HDMI phy is
>> 50.4MHz, so that's a ~1.5% difference and it'd be great if it could work
>> out of the box.
> 
> For rate mismatches larger than the 0.5% allowed by the HDMI spec it
> would be better to actually add PHY PLL parameters matching those
> rates.

I'd really like to be able to add more PHY PLL setpoints for displays
that use non-CEA-861 modes. Unfortunately I didn't manage to figure out
the fractional-n PLL parameter calculation so far.

The i.MX8MP Reference Manual provides formulas to calculate the
parameters based on the register values and I tried to make sense of it
using the existing register values in the driver. But somehow it doesn't
add up for me.

Lucas, did you already work with the PLL parameters? By any chance, do
you now how the math behind them works?

> 
> We could potentially add some more leeway for displays like yours that
> aren't actually HDMI (as it doesn't seem to have a standard HDMI
> resolution). But that's more of a last resort option, as it may
> introduce other problems for displays that aren't as tolerant with
> their input rates. Remember the mode_valid call is used to filter modes
> that aren't compatible with the source, so for a display with multiple
> modes allowing too much leeway may lead to incompatible modes not
> getting tossed, in turn allowing userspace to set a mode that the
> display may not like due to too much rate deviation, instead of only
> presenting a list of valid modes. This again would present the user
> with a black-screen without warning situation.

What about adding some option to relax or remove the check for debugging
purposes? Maybe combined with printing a warning message?

I agree that we should prevent incompatible modes from passing the
filter, but it would be really helpful if people had an easy way to
relax/remove the check to see whether their display could potentially
work without them needing to modify and recompile the kernel.

Thanks
Frieder
