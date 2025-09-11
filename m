Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D0B530C5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E8D10EAC1;
	Thu, 11 Sep 2025 11:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bcB9oTun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C710EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdFkaxsloS1Sge/Ac7e/AlGsorKGpfoDIOXYQTec8EJBNdJLec3o9DbaAEzEmr7/GLC2k+WihMtH30vKuyzKMvT5V+KavA5cArd4fPsOSQa5wWoFgEE6hJDlnhDehOv/0eKyNgWYUkmnruyrKwEHCYWb54+byF4elL5Ue4cPutmhB0dcoMqzeAf77zVkV+u2dB/noQKgxnsAIC6r9+sbdJsdvxFHxHJlCcriQpQVWVCTeOVMVY1m1PB2pr9ub2tcOQ7wEAP60kSXsFfTDJ7+hA0IlKp5B6ZzJebho2DJAQqPbSZv+z916BV7943Hu5SYpC3vgz3+LIOxSaS2n/OUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnCfPi7ksQzeNqLcz1It2tLKfohFiNnERST92bNOBac=;
 b=KavT9ZmMo5QPjWUB3hJ3MADbdmYJRL3O6GLCSXyW5Y3/nG0aHGzwhQTN1qreE+xmC0q+uidag1vJXI/Zla4UxRjdqQrZdIMGy3rQDazpMfnaPLAq4l4xlQt5OlPPQAeMIHj/zq+AR2jT4kHpSxzJw8Sfn7r42eicetdPo1oIHkG0U/z5Qpslmyvzlc81Ak43xjHdSehPzdVdRXv+cIDEhTdJFTAy/PvZZ1ZCXRt8ZbfQDpxUdvIseo1YZqCooQRGw6uBP33JVdruooLhsmABcwXrxjKRE/B+NVypodzga8L82+fBLk4epF2sgsD9JyvmBadY8YJD/QxjauoGlKX5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnCfPi7ksQzeNqLcz1It2tLKfohFiNnERST92bNOBac=;
 b=bcB9oTuntg/5SnO6rj+hpcmrSMngw4Dw+bkrPG8we37KkthrNunD4+tF+rsBO3uxfegESqwFscj/XJFgdW35Me4j0XorpLNmiQ2+0xeQsffW0tk9haRBGymGmQrk7tnxHnGN9hALSZkspdrKxpk5o4NIu2SyNoP9LNiqrSX9wQ6iN3XSeRsB0j8TYDFzgWz5SsVpxRgIoCSyBskD8xXBJ8JX9ywhY7OxgHlP4cHecUTO9D2p6SPhVp6Xrq2Z5SXDfT8+d0p1dCUxjmDf00KXCXPp27T39O7PUxNVniXv6/Xk+/5Nhwkta0CDsqumBI6VKPwFZsX8R1O32Tix3QrdQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 11:37:45 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:45 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Thu, 11 Sep 2025 14:37:03 +0300
Message-Id: <20250911-dcif-upstreaming-v5-3-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::6) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: 48067e5c-42ce-4615-9d79-08ddf127a00a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2phc2dFdml1LzJ3dEFhWXNvY1BKcllLUkxLbFRtRk9nN1FPVnZnMGFaZ1pw?=
 =?utf-8?B?UkRDRmh6RGFrZFV2eHkrbHlSV253cTFDTWNWTHMyNEJ0RHFieDBlWmpraDl1?=
 =?utf-8?B?a2xuUW9HOWNlS0ZicnkrRTlDWVlXeFJXQmRFajliK2tBekRMUzhuRzlVL01I?=
 =?utf-8?B?VlVTSmVBK0tnM3Y5VThDVFZsK2gvVC9BZjFrVzQwZmlERDBmeHJ2WlNqV1h1?=
 =?utf-8?B?UHN4QndybnF5ZWhJL3o2OVVIdEVUcFhPYXpTcVBTMGgycytFa3U0QUtNTnQ4?=
 =?utf-8?B?cUIrbTZjY29naWRJMVlBK0t6RFpJUlRRY21GUUhCNmtJTklrQ1BpcE9KRTBL?=
 =?utf-8?B?dTduc1Q1cVpXVXlTZnJEVkRTQmQ4d1QzeHJpNno0b0xqQXIrWm44UTZtUE4x?=
 =?utf-8?B?cmxXeHRnbVNSMkpRVml0TXNpbDZheTF4RW1HNkhwYlgwOEpIYnhmTzlkVy9S?=
 =?utf-8?B?c2FyeFRLK00zaEk5bDVpVXhFbUZYQlJmNWpITmRLNkFxWDgzZEdibkxTQ1dZ?=
 =?utf-8?B?bWxORU0yYnhjZEpoZWs0WE5EK1pyYXFNalZtSVovU0VNTFdaM0tqUW9KOFIr?=
 =?utf-8?B?ekdsMmZVdEk2THV4bjJhYkc0TWNFQ09wQ0pVMjlzQWxsMVlBbUdGdDF3Wklr?=
 =?utf-8?B?bU5tWk51TEtEdk5nbjhOeFhXbDg4d2wycEY5Sk02L29tdDVpUVFIdXRlTk9V?=
 =?utf-8?B?RHhPclRPVzQvdWlONTJQdHppU3BzY2RXckgwQzgwV0VDWk11aFhieDhRUEk4?=
 =?utf-8?B?QlNyeWh5NkhRdlZreEY3NSttdDNUSUtxR0hnN1hVbkxaY2tDZnBJL1lCZDVI?=
 =?utf-8?B?b1pGeU5iL3FNUjBnbjNBaWN2K2ptWWdERk1vR09xcFZwWGxMTmFZUkRJcTQ0?=
 =?utf-8?B?Y21ySmREb0wvK1dOM09kN1haMnplL2liWHhuc3JLelFIUE1oR1VJWm5ITGpo?=
 =?utf-8?B?UDlxcGY4N05hOFFLek15NUIza2lsbDhyUlllWmNyT0plVkJxT0JRSXdFQzkv?=
 =?utf-8?B?OWdETmpKV1h4c1c0VUIzZFhFMitsTGxtQks5YWtnQzdZU2E4anRoYmhUQ2JQ?=
 =?utf-8?B?WnhIR3pOU3dIWlJaQzBEbXN6bjBXa1lEMjB5ZUtFVDNma3FlMHV0U3JqUGtw?=
 =?utf-8?B?ZXFsSUcralNFejdHUGhLYUdBWnlleVNPMlBPY2tTemxBc2JlT3lHNlJhajEv?=
 =?utf-8?B?S2dTM3ZZK3VkRFRRbTg3R3VSL2VGNlM3cXp4Mk9NdEdaQkhpYnhlaGwvQ1A5?=
 =?utf-8?B?aWNsQW5qT2tWWkduRnhUSzF0TS90UHJaMjBPc2RWOWd0M1RqcGpBQjNFTGRS?=
 =?utf-8?B?WVVxMzhNbjZNOHphN0crQWRYc2VXYmtKTFBwdmppZVI4WjgxeExHaFYwTVJ5?=
 =?utf-8?B?cm1zUGFGUEp6WVZNL0xMSE1jZjd3K3U0M1hwdDFEbU1WRlBxbEdIdnJoWmR5?=
 =?utf-8?B?Qnc2WGh5UGtIK09zMXdKWFF6dzNjQUlOZWd6WHpHOUlJeWo5MHhlNkJXNUtO?=
 =?utf-8?B?UVdodUlnZWdXYmZJeElXTW1WdzBMTVhpTnphM3NoQlRwS3YxZEVyWFRLbXhp?=
 =?utf-8?B?cFNMelo0Y2RSSGRyQ3NPU2d1OGFRN3lZK3ZHWkxoL21KdjRoS2JnSGRUZHY0?=
 =?utf-8?B?MnBtQWU0Q3UwbUo1M29JWXRSUGdaNmtnRzRTSzU1RG5iRGEvWE9jbXRxcU5U?=
 =?utf-8?B?V2gvOUNCT3I4VTc3SUpYdlFwSGhCdnNmaFc0Z0Q4UlhKR0xBVjJtMWdZajd3?=
 =?utf-8?B?VHJlM1p4U0VTMGZDSUFuYk9semVWVU1GQXI1QnBkelBoWk1rdEx0NnR5WWoy?=
 =?utf-8?B?MWd3UGlETVdLSEZneVhMcXc4Wnp2NnpaSTdnZEtEZHd4VlJVTzFOSFR5THls?=
 =?utf-8?B?cUtXTHZnSE1EckNyMDNUUFVoWlNVMEJLOUE5WTRIaFdSSWh5bWxwNTNwQjdq?=
 =?utf-8?B?bW1FQks0TmJDQnRCWkF6UUNXdnh4VGV4MTM0SklNUnozbVlMaERMbnhWcEVM?=
 =?utf-8?B?eFNSaE9obnd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFBabDNST0I2eU5XeWV0L0NaS1ZmRzlTN1JramxlendVYkh5RjVMTjEzRE5V?=
 =?utf-8?B?SlluVlYreHh4Qk10THlFeGVkVjRYNytsZFoyT3ptNVdtTG1aQXBXWnRjUlNj?=
 =?utf-8?B?WXIrdnVTWDNZLzUwaDdML2FpQlA5ajlCWUhJNEgwYzFzc0lydjNkSDJiV1BS?=
 =?utf-8?B?NzR1UEptV3RBNWUzNExLZW4xQWFkRVJaTHZDdjdUT2h6OVJTR2VodnRuK29h?=
 =?utf-8?B?NU8wOHRyWHR4QXVvWjFxOU5jTHgycUxkekNkRWJwNkRRK2tBWUF1R3VXOWlY?=
 =?utf-8?B?TU5rMTlpUTJpcEduTHZmUFJQdkwrM2RFV3JuaHFIZkhZRjhtRFc2WURZd0N3?=
 =?utf-8?B?cWJSaHhHeW5wSWVyYStqRnhDd3orY2NZOXBsa1R4QkNBMmhjMlFoV3l3d2FM?=
 =?utf-8?B?bDJpYjcvRXNZWEkrVVdud3ZjcURZc1FlV1pmUVFWNHdIb3hZOEdBb09EYUp6?=
 =?utf-8?B?bE9nV25tZkRnM0xJTk1YNUloRTFEU0FwemE1Mk1SRGJWcnhJNlVvWGlyZHF4?=
 =?utf-8?B?Z0MyaTJMdS9qSUNIOXRmRzB3K243OVphWXFXZ25RL1MvY2FqdXkrS1FDbkRR?=
 =?utf-8?B?c0xxQnZtdmhUa0lKT0pzOHRWT01sTU5WUldScjNQZ0xPT0tVb3d5VDdNWFdE?=
 =?utf-8?B?cXRITTAyZVFFV3hCdVdSLzNhd0dXZGhHOW05NTVJZm4wejM5ZWxtL21YSmVW?=
 =?utf-8?B?R1YyRk5LVndUTXo1UjJqb1lFY0dhTW9KZlVMblQxNlhKZTdNZWZNNjNHdllL?=
 =?utf-8?B?VXh6eS9peHU2OW1UUU5tTkVlR1dXcmxHZTVnODFRVnlYejVQS2ZVaGlvQkF4?=
 =?utf-8?B?eTlYQUJXZW1SMm9KTnlvR0swK2J3OE5PSmVTdDdGQktQT2Rxb3MzUHBqTnZG?=
 =?utf-8?B?dzROVjhnU2xTdWNNUTZvQURwL2praFFEbTJSL09vU2J1KzBEL0JuZ3d1cXdH?=
 =?utf-8?B?dlZPRi9UTW1FdU91RnlGRkdJeWNtYTNkc3ZydzZGN0ZwVUJzd0Z5R0RVYWI1?=
 =?utf-8?B?Z1pUcVpIcEEvb0lOY29SdnRvVGhuUDVXR0xicFlUbEhmeC85MVZCZkF0MXQv?=
 =?utf-8?B?ZTN5NXdoRGFsWFlNZUdWTS92bXFEZDZQMUtOc3pPOEZrQWpQZy9BYjlxVTB2?=
 =?utf-8?B?NnIzMFIxWXJyLzZNUFlEbXVNd2I2dU5WS0xCNnZuNnQxOGhKZTBUZDlvYlhS?=
 =?utf-8?B?Mll1MjJJRm5BRDRxbG1TME9mcU5kT1RLU1dKdGNSeWFWd2pTVWhXYjgvU25n?=
 =?utf-8?B?UDloZkhvMER4MnkrbXdzNWM1QmE3ZVBsck5GeEJKaVllZHZ4ejFZQnQyWjFS?=
 =?utf-8?B?MzZUVVF0ZklWSXVrenB1dGtIOFZVU1daQXg4ZHNqMlprTm5YaEZRdmk4eVJa?=
 =?utf-8?B?QnNqaWQ5SEdXcXcybk4vMUVYclNDNFFZaWp4R21GSG1veGFSelpvWVp1Sk9S?=
 =?utf-8?B?Q2RVeVFzNlladkJaZ0o5Zk9nb3BiSWlZbUIrZVlZcUE5V3drUFdOdUN0SXZL?=
 =?utf-8?B?aTltQ25nVHcvSWdUR3Fza0xNK0NGMWxYYWtKVXF1WEh4a1RydE9wVUQrWHRE?=
 =?utf-8?B?S3hwVUZyL1VJeGRERGdnWUNnblJydmlEWS9JT0paQ1Rkc2VMTUNLWEczNm9X?=
 =?utf-8?B?cU5ka1JMRTdPNWI5eHFXbEVob1R5dXhRZmFRMTNKelBxTWFGRE85c1hLaUNP?=
 =?utf-8?B?UmN3a09Yc1VTcHRzallhb0tRd2hZZnBpWXdUc1FxOHY5SmNVVFN4N2hUc2s2?=
 =?utf-8?B?dmhDcU9WVE40d0dCd0YwSEhINXM3NlM3YzBhcUREb2FlZ1lITXUzUDI0Q05t?=
 =?utf-8?B?SW4xL2tBUHMvRUVHQitvUmRHNDBsWTh3MitDU0xid3lraG1CUE9Bcjd6M0Mz?=
 =?utf-8?B?ZnQvM3NMekdpaWlMT1poTWhiUEthSVYwdVk0cmNvSTBFK1UzN3RYN0ZTNkQ3?=
 =?utf-8?B?S25rTDN6K2JvL1REN3ZKL25rWTE4K1cxdnpmTmM5NzZKanB6Y2FFSXFGdTRJ?=
 =?utf-8?B?bThwZytuYk5DZGgrRU5NOUhpb1pKQXlGanY2Mll0emVIb2lIQzdVNzRMemwy?=
 =?utf-8?B?VUZXRUhrb1B0alllZC8zWnU4UkhrRWUvUk04SDBlUStuNXM5OGFkQU5GV21s?=
 =?utf-8?B?Kzhka3BLNURqMkN1M0xEQjlBdGcxMGFObElZbWFXSy8zbmYzR3dub0tTNXBH?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48067e5c-42ce-4615-9d79-08ddf127a00a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:45.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DNepOTqprUB9Rv//COP9Rw3RIDWmBkqAKr8BRlP+9iegRMHWIXyLDfN6NRyBrV9NSiDtcZzE8vntpny1yabeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
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

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 665053d0cb79d2b4f50e69c397863ab024553867..4052e1ea9201fc09d80c678d2b086a4884f34a3c 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_mode *mode)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	u32 ch_max_clk_khz = fsl_ldb->devdata->max_clk_khz;
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_max_clk_khz))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -377,6 +389,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);

-- 
2.49.0
