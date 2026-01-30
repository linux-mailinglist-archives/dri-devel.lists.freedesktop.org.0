Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFdYNVZnfGk/MQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:09:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC9B82E2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3325B10E918;
	Fri, 30 Jan 2026 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="V6JFZ1Fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352D10E918
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 08:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dw2/Aq4NLCCh17erWZWKtYNQMe8H/bY5uj4uJjPiW5mECFOytQo+DdYtxiulD6yRpnCi14Zp7NJ2/ErjtdBUfwO+uoNibgYXJldY96NOWwNHE7koWKWGGuBSjUyj1KdHfzhsleVdlG3t36lahlkaCkqvuEVngbTeVxUVljgnWKc/7i/0UhVXoOH0VHfOrDP67PqMjdRZ5ZHklZ93SIBj58pmJvg0fdz6Qnmj9LokKonD5sXWdDrIIqKNQmJgXrlnZ64OZPNEhlo8EDJEFE0lgfyJytXE0WAJYyETHXnou2FaUG3k/pdPCPB5Db1y1wfKCo+KxHGU0c4SuI5C9Lmg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDAo32G71DYUlr0hxv9QgYB4HPcLKVsv7lMzlex4XII=;
 b=ApxdlyKgzAFiw+XCC2kSLV8U83mKo0+PRmnQlM4l2ewNXlarqEZkqexufRTSUONVyrkU9ARn2krGtJujskT3d7IShxDipW0fSSHMkTmO31qeP8UstlSXkZE2v/nzOazSu6r2d5qV6k5FQCv0jriizTYaoFCysHFNZWlgQ4TT1YS1VlzcVovAF7d4nKaKT7cCeApZZUIHtby7XLPOSzZTbLuIec9hPAsyNRPDPTsqkuEKmbfJDmAm4+UZkgCT+LKa7ej62Q6dmiW87pE60Sgr9ffJYNVWL/RHcPlNJooHny9IXiglspkWJ7MC/tPHzm5EbydMxWDwbxQRlTuvrA0T8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDAo32G71DYUlr0hxv9QgYB4HPcLKVsv7lMzlex4XII=;
 b=V6JFZ1Fo+HPXsGHlQmk3GcBJT2f4lk1qFfCgkps6H+7jZaY5YrwQ75FynEVy1vJWb4u69PDFMYd++TYJoGDlPmdd2TMDkQrz+YrAsiYG/4RYRdxmGE1Ri6e0pTbypOW3AJXyZ/dOCkyFRvJ5HUGoJKC7prY1bAq5bNUPE40AYnGEvDu3xoqzZB9kDztRnfSI4L884d9W+JIn/lIb4ehVphDyH8D8zZsQhJSMD/nKw0O618npMwqdsz/CWeoIKfPxl8zq1dIxEeqsg1R6KyYJ8M+ftDPdics1NPFInUCD8FYlNax8h925yyKNe4vdDPRf4xAJpZMakcj2x4ysekt1aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB11057.eurprd04.prod.outlook.com (2603:10a6:102:48f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:09:51 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 08:09:51 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: imx8mp-hdmi-pai: enable PM runtime
Date: Fri, 30 Jan 2026 16:09:10 +0800
Message-Id: <20260130080910.3532724-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB11057:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eaa4dc-4d41-405a-0bcb-08de5fd6f164
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9i8Zk3vBF9a7p2owCO7L17nKJZi5PrBCzY/QO13ALvCcEoh+DVGYiqb5pDbn?=
 =?us-ascii?Q?DhDAcBU0CdNu9VPr3EHn9FEhYA4kvjspUpPIEkICfXrX9iTtlZitEg7JO75m?=
 =?us-ascii?Q?7bNy4+u8XjvI3rR+r5+T+Lqo2QuT1WQMZEjRumzvAjLdjhVUa4VOipZjWoBv?=
 =?us-ascii?Q?hWvONEoJGhCYXr4nNyXuFke+a046auJzMNRezB0LQlaCMNk2zQjObPYVDGq/?=
 =?us-ascii?Q?3MC2ZWEHZYGzYgoMYPtXObs4nnBmJlNHf6sKIOgjxiFuul27B9YsEQzxnL14?=
 =?us-ascii?Q?PKX+nOjyNrLEvGp51sMA2Dwmc6VDgAunjba2urbHBZyJRj5uZ0VuC9tweW4I?=
 =?us-ascii?Q?zctsoyN+QLpXGcmmG4ZlV18umBIMHTy8ToU3+QJIqJ2l2q7r2zM5ESbOs1u/?=
 =?us-ascii?Q?nTejk77rfMT/zD+opsKtcGb0XIgQ7uf59HM0NSiqSgTl+z3/PBgdWevoQ8uW?=
 =?us-ascii?Q?LBOioEfaPH4imNejVZ0xW1r92iCWnzHCgBXsFFcNdyD9MEknfmK9G/wE0Vcs?=
 =?us-ascii?Q?gNWjUaSxR5tyhYAEL0CF/41KOYm1lr26rPYL3IQcpzJu3/7b0ZumTW/nKC/Y?=
 =?us-ascii?Q?B/wpLsgRX+SWfxiI2fJk9Usql+fNHYGC1YyHD2M9qZkj3H1vDQMI84JldlGV?=
 =?us-ascii?Q?PCSaAwSKp/G3ge+iAfdXc0beo41kpO9BPx19kGKaexoczf7B++FA+a7f8l+M?=
 =?us-ascii?Q?KiA5iTpwNQ3yYR5DlQzVz058+7VskjbpJU0l4ackYjLft81tjN7GHwz7onIT?=
 =?us-ascii?Q?fdiX5utS1IrDKdy3SeZaYMD/4EDxXMlT0NQy6vyrxaRWwcXFd3a1x0bM/bnD?=
 =?us-ascii?Q?z88XmUBhD4eGZFkZ6dKRndxQma8Gah1UvM5nQAk/FRVbJxJzg4a2+/sh5MwG?=
 =?us-ascii?Q?4rVuXoyXr+5xchLbiwdVyXYdCkFIlfEJf6oTfKVISddFaUeJHlMIfXv2Zf0d?=
 =?us-ascii?Q?cXZXqHoxkFahVAxQbzmGMYi5QKN0GI9elq3BK3o3J7wLIJnjBJdQP4PfH6Iw?=
 =?us-ascii?Q?yWAAUzOUXR23tR7CeTuqIGdcdc5rmmDEm85+Kga5v9SAGSV7ccGwjMkKnIX4?=
 =?us-ascii?Q?U3E0eG9Ed0izyLm21SzNTzgHCoEjrWsLk9sEeNOMU3l4Ir3wFqag1zSsXLzZ?=
 =?us-ascii?Q?tdyYbxOADGv4V7WyboFWquXj/rG5T7kR3pjisaOEYUX3a79h4lQFlb4r09HU?=
 =?us-ascii?Q?Fnrj8WWNCd2vzlH5wLE3B0ScKHB+DvxkfBma24Q4Q+jucXmtVYDCLOTzZgGk?=
 =?us-ascii?Q?nBPy1lSyjDzjWVo4thY0kTiZes+9iPie29OHxSbh6eXm7Xng956+zmqq5rhq?=
 =?us-ascii?Q?WkXcO3GIjT0ER5xI5GwtSaZIbCx6UW1H40GzYYeI/5oIwvWeQJ3ej8C2kyjr?=
 =?us-ascii?Q?7A5K0r8zcebAXU6dEU0e/qXS718JT4R0yJ9H2Ae8wj5eE3YC4i2BbaaOG5Og?=
 =?us-ascii?Q?rJNZW3vZlWXnelARow/th6seYqcPJLpT1vzNoghIoLw8olK4VKpCn18DQwUP?=
 =?us-ascii?Q?JH2pg2R4XcRXZJ3TKJzi6EuC8O/QnxBnhFW5dQEju4akI3TW/emyMVCZ+2s7?=
 =?us-ascii?Q?xc5UCOTYmlceAo0KvaH/R7U3iAs3vK1ksn4OeOVI8EG/+49QZIjtsfRIuoFG?=
 =?us-ascii?Q?u71lXUYW2x+9RjC6Y/5OjlXY7kXtlzDzXYVVS+tkxehD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06L/d57PKZm4LX9w4T+V5X7T55RacbOTG7UlqslPLDs8hifFs5KPgXT/W5H1?=
 =?us-ascii?Q?btkqVWwMvJpiilXCIIAz3AKZaQsURJdQI0+NpCvDsOFqoyuKGro4tZRV5gXP?=
 =?us-ascii?Q?z06+o4nbtxucKNB5wQoqAxtWSr5Tg3eZmQWVX6kuRe+/5moSf/tPVv6mFSau?=
 =?us-ascii?Q?GXcUUuPXjPnu6+HbO21R7QpApaLUqSu8lQe1G4MCbrutgZ7uVTZvyf3wtJNh?=
 =?us-ascii?Q?YriauH6FHmNk/IMQ3yNhLMhaGehb7NHoTT/CQDzl83NJdXP4XFSS+6AO34wD?=
 =?us-ascii?Q?39hbB4x3XQhdnYEdujxZsyNCLgtEEMe924SG+ssmnjIZL0P1e+vY+9mHiRUm?=
 =?us-ascii?Q?vopIXJx6Dt/zB6GtrY1nM/ZuwmQFXOI2cBqxNlCn2Zda+J0Jb5sCQ2udfZ8X?=
 =?us-ascii?Q?kGo9ri6zYpD+t0LS9rMJtlrOhJsItb6qcj7f1WtJgNceJ3lOkumvtPm3vvon?=
 =?us-ascii?Q?MrRUOHP0JAS1B3lpA9x6CxPRrRaAf0LLpY9RPDDVUWnM5KHPdLaJyxt22/IS?=
 =?us-ascii?Q?+SK/DYOQ/U5LzjKWiEKNnNbtgept6HpmDSVQUqINrygYRJAnXPxDZOCuT3p9?=
 =?us-ascii?Q?IE5CyIJLTRE2v4pFbQ0wh+GykLiMQFsBFpLn+vWcazgPtpFyt5FcuLNSYb3V?=
 =?us-ascii?Q?eILg5BXivbqMLiFvv4C5esNyMDlHGy7xSTybF4PmcAPY2MJWxQTn1cFycGUt?=
 =?us-ascii?Q?hbASvE4Mjo7wm49Iv2OrL/xxCZjko+sbwjvWsX3Bz/38UIC3JZ6OLcKCjIrI?=
 =?us-ascii?Q?e0yP4tvmIBO8Jgbi8ukXQNcceryannEUT64zoDqxVuI1KMr/ftvImU5VcXuC?=
 =?us-ascii?Q?ssgjDWJ/6bTtdnIlLI3mOQBFSrPZ5rvzbB8zxJwAzS2plW02KkmWj8m95+cC?=
 =?us-ascii?Q?/Y3deJTFHUrL2ShFy7yrwQZ9ao+uYH2j4eABtYoNfo6/h6OEi91aIHFGVAnB?=
 =?us-ascii?Q?VUb4q+13FHgPqQ1AbOCNMlWEbCqtKq0THP4oosWvO8FzCZXv3SWZPUamgVhl?=
 =?us-ascii?Q?9Kg8fBPr/naHAzE0NUNLWKvn7O0YY48W5Veg98vJYArhua2NWhvkaheOyJW1?=
 =?us-ascii?Q?XhCYWZbUwGX9B6BFmweUFU1hCxGkjQ7pP6S0bP4aGjX8Qsigqx+1IVE65UUW?=
 =?us-ascii?Q?wuWRj7lNG/8hqJvRZfrOtj5IQpBvGbAMxL4517DtlC14es02sk9t0DiCEZxE?=
 =?us-ascii?Q?MdVywk6mUr8UKWOjMPgzF19nnSe+l3hWDNp62uOB0K2ntdwW51edifyye1eh?=
 =?us-ascii?Q?lwxHvJm9Ef/b0EjH0YnaPWigB5Z5ob/ZuZWux0xLLe6cCq9Yvbtp3RSLegec?=
 =?us-ascii?Q?IZXSw3h90OK44erFlRtew53Bx3Ck9NWd9gnTgY8RiwJ/7aQnCuOHXByqaNO+?=
 =?us-ascii?Q?fi97p/LxCoDPQdR4LCTRUVe/MnUh3vhYqf7v85LE+dnlkipiJuD60pYz9Lc9?=
 =?us-ascii?Q?QgozG8cSV8HZv5zMLLjce8sWjiBMWWVeftEXkhkLLJ9XAME5tNaqo4SIaTyf?=
 =?us-ascii?Q?poX0yo109iG2e+hPRXMRtogpIWySJTw5L8/skvm3+4jEdnyFh5ilZP8yOIuI?=
 =?us-ascii?Q?3z74TxfSxhjOh7uUcQHhNEqwpsLtHHDoUjSwopYw8m+35fv2ddOgUrH7+S/g?=
 =?us-ascii?Q?LvvQj/DpzokMk8JJ7Im2CQPUYyNdozKlk+c28s8UlM3S0Y+YaSfsdZTMdvCs?=
 =?us-ascii?Q?k5TYZ53482i7/cgetbbReFt+kVWwgVNDkRbMPRx6ZeoYKxnbcmJx2a9m0Ptj?=
 =?us-ascii?Q?GCuMZTOJ+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eaa4dc-4d41-405a-0bcb-08de5fd6f164
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:09:51.2990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuBf/FckWr3d1ZN4bSqGgRCWUpCMLc9xbAKqF4lfeMRxun/lz78Gdf1EwwDd2WmFZCwWdKe8QexOM28Gafi/FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11057
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
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 40BC9B82E2
X-Rspamd-Action: no action

There is an audio channel shift issue with multi channel case - the
channel order is correct for the first run, but the channel order is
shifted for the second run. The fix method is to reset the PAI interface
at the end of playback.

The reset can be handled by PM runtime, so enable PM runtime.

Fixes: 0205fae6327a ("drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- update commit message
- add fixes tag
- use pm_runtime_resume_and_get()

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
index 8d13a35b206a..cc221483ef0d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <sound/asoundef.h>
@@ -33,6 +34,7 @@
 
 struct imx8mp_hdmi_pai {
 	struct regmap	*regmap;
+	struct device	*dev;
 };
 
 static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
@@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
 	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
 	int val;
 
+	if (pm_runtime_resume_and_get(hdmi_pai->dev) < 0)
+		return;
+
 	/* PAI set control extended */
 	val =  WTMK_HIGH(3) | WTMK_LOW(3);
 	val |= NUM_CH(channel);
@@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
 
 	/* Stop PAI */
 	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+
+	pm_runtime_put_sync(hdmi_pai->dev);
 }
 
 static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
@@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	struct imx8mp_hdmi_pai *hdmi_pai;
 	struct resource *res;
 	void __iomem *base;
+	int ret;
 
 	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
 	if (!hdmi_pai)
@@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
 	plat_data->priv_audio = hdmi_pai;
 
+	hdmi_pai->dev = dev;
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable PM runtime: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

