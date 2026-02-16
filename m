Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GXmKE5Kk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:48:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E914146641
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8DB10E3CD;
	Mon, 16 Feb 2026 16:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kYgZrzQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD20210E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrS1x/6Gm53gkhOr9H8aUoATO8gn0Vc+ArOtPt1jxFesAaL6By+vtQgUHTx7h5N5DEn4jf1RtVCtBgF/ndroG9fy+M2pvRVj5VukCeBAC2GPcYZV1EALpGlYlJCj4baY98yt65aX+NCT6BRaGGWirJO7C7ZAGU4qPrHXsphuYuaCw6ctX046Ebx9cPcErFBerS8AA0/uXZEZn8Cx4HKkz0X2rv3oXKBl0dcSjMZD8TCXv7aydEExTfoVysM2wEIt1/eW0WEJGeOmJqdkFb7zgdZywo4+ndrh/cpsyBFZGluZ9Wi7Ce2th0F5GEOgY8SXS6zcyBulYWhcPoDp9YXdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHBfYqCTZ28qbHLcwdxMkm8k/uOAagYU2LVDOURVdlU=;
 b=K0bZqa3orggPAtYEzBdEdW4MYsvLZxvtG0uxXNjj7jqgRdRZgtlSJVl4c8lwsUg924/eKlUi3y5r9ZT33z1D18k8LnIAAoRUEydjZOpK+2fHuV1jA9rU5lT5sdBj3Ty2j3uENQqLAX9cZxF7D9g6WTylbH3K+3sP0WQHaqHtzEnsf01PO7XqU6IeInYqDeEnWQYRDilHpmGtURWHi1VPeHXNnov2/GuCY4mk57jlhtf4ZmFwzbvLTZtEnFBWxRK7We4uudg/FakLXhb4oiS29on2FZpKtTkT/TXhEPAxfhb3gfAVenlj6hP2s/zynDrRcoxQk33uXjXFfqfjK01tuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHBfYqCTZ28qbHLcwdxMkm8k/uOAagYU2LVDOURVdlU=;
 b=kYgZrzQ+xlJyMVBB1v6msLGt0PO/OgUCYG0qL45n8oI5zIVIqNLAWEi/U0F9AjmKJLOUy/NcPLyPsGAits2uZqffzW9MplJsnhCo9ThlbNaFydoeUp3LGm4MOir42hjBW3ORYSVwd3n7yXSdwju1MyXHUpjNBLq6zvqlNxI1zF+iNM9tlTeM5ICNkkdkzPOrmPkF/FLEK2fEULv8u1ZLRKIMS0zCJkU+PKk3vSFMJ5Nhuj7alSgDTrUXBjdJwj82fQWJ08lSzyWZp5w83Ug06zgobuKPKRInvZX+AuNzwW4hTEPAR6SJTVJYfmi7OHFiCa0JSWbzljxOMcRmrj8+Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10767.eurprd04.prod.outlook.com (2603:10a6:10:580::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:48:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:48:07 +0000
Date: Mon, 16 Feb 2026 11:47:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 0/3] Add i.MX91/93 parallel display support
Message-ID: <aZNKPVZunRSZ72zt@lizhi-Precision-Tower-5810>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <fpnruayalannx3jrsjqfjzawrzxazy7ioo7ufxcwkbwj2eezfp@6i6ty7fz5xtc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fpnruayalannx3jrsjqfjzawrzxazy7ioo7ufxcwkbwj2eezfp@6i6ty7fz5xtc>
X-ClientProxiedBy: PH7P221CA0090.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10767:EE_
X-MS-Office365-Filtering-Correlation-Id: e018afba-7525-41ea-46c4-08de6d7b2945
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R1l9/Gdwl8RvZHw5BXtGABaOHxBWK90CyHhp2mMNiaHD0Wsjnb14DgGnSjGq?=
 =?us-ascii?Q?YToIBI6O1EeVvigC+i6sgFC0i5ejkGVWPGkDLkWOC9VvtG3ff9m+6gGvSATM?=
 =?us-ascii?Q?F0OrN4OKkZx94ARNY5RUmCv+C/YFVL/cofQm6dKR4XhAAUKeQZA51ZYNZkN4?=
 =?us-ascii?Q?zTzROMNeifM0ZYXahtsqJekf5p/9x4bANvyJ+RuPAd9hsjMm2KLutFmMMjfP?=
 =?us-ascii?Q?YOH1dS0F1IH33PHfhnATOEjb/tlGKf+F+EsN/oR8cIDkvvqbnaq4JtTrdLnY?=
 =?us-ascii?Q?XXTe5Z4ePEftg9X/ln9G4NQNg5qV+LbH3TdtglVyHzoMh9MQC2Upo5iKSxxl?=
 =?us-ascii?Q?gegW/e01T4dNuUfhEi9bd5dvNQg1wcE57b6+TYB0+Dah0A/zHrZ0trSh6r42?=
 =?us-ascii?Q?uMnOKvwh3EFXQR4IeSS1gKdsPqaat24A6tlycZn5ihgGB/515B5MzLKEyp0/?=
 =?us-ascii?Q?MarjhoTy05k4dYw2k7YEIbG8sSCwBI/TZeUS6m4Lev97pnvUmgsR/5jPsMP9?=
 =?us-ascii?Q?3g3H9gYT5YkjeXWyUzLuAbdO4B4dfq5AdI1wikVCo5t4aTUNWegwAEugrXX9?=
 =?us-ascii?Q?mg2KV50fJLiR/Cn63hh9u2SdiBFPPfaL8PYyut4NQ5UumJrHsHjWLibuX9PS?=
 =?us-ascii?Q?TtPqQcg5xxHn+pPhtzyQHKKQKzbGjMfQX8Q1mLLwDxZr9OX2MX9sLoBjyIj4?=
 =?us-ascii?Q?EjHlTSwJfRZK39QemZfd1QZC8s9BBPnF38CklOKFrm9yDANXfaazfzX8fKVY?=
 =?us-ascii?Q?hPsj4mghVIak1Q1l6pejcDLMD1IHtA6OUlMJgL/cWjcwKvBmNM5dCqqZ59cR?=
 =?us-ascii?Q?mSC/fBbwNDhIWVLvXfBk8Nen+LcVUkIPQAbFgFGmafF4ZNHabdPLsDEgmpxg?=
 =?us-ascii?Q?VM8yPNNCaQnJPwOvoNryCNqjNRVbXhkKgYALpBryhXBxkK0odYamnp4ysLhd?=
 =?us-ascii?Q?lmhdS+AaMJcoQqcbg59ndIkH3OwZOG3Apbd1tmQQ63IFgf39rreC94Xdm38U?=
 =?us-ascii?Q?9JbxStU8FvOaEACjGjANLUlnh6x0QDM783lhkSZyLeAX0mADrUxmNcMiO/3X?=
 =?us-ascii?Q?1CR+RB/zpmqhiUgwcnpEdlphOCkQUwLXo4WKm6583CJfLDeQ65MqMh+fVcna?=
 =?us-ascii?Q?ajoxpS84LopodVtLHMM7A2Acj1M/UmiwUv64B0hM5VVOe6vTct9C8OweH8Xt?=
 =?us-ascii?Q?yX+cpajOn7yDf7Z/71q8HBGvNf8D1bKcTibzmeyE0mMGu4EoTnjb/hAnKenx?=
 =?us-ascii?Q?CQKvnXFAUZgN4fv59lVdYDeWGqZsyYfi+wqkJkAqQBjCEVvhdZ6Q71XQ2zni?=
 =?us-ascii?Q?UJzAYDvEVRR/0DE6Go35KWUug3KpIt8URwJpmb5cnQiExpX9MYTR2V/+8HlR?=
 =?us-ascii?Q?MDnfveVquYa5m0LMMca5Hs4Rob0nz/kfV1osd0Rc+b9VqP5cz3aq4om+/Ox0?=
 =?us-ascii?Q?1ppEXBT1zYTnv6vB2ScmbhyZhODoFrxsJH/rwiMET4FtFOSOJk/MZ77MFr6G?=
 =?us-ascii?Q?5le9NIfXsSfdD7Kzon82LA4nIxlhnWvq9hT9vC5OhJT3FSn3yZvzQhtIPCWN?=
 =?us-ascii?Q?9NfWAe5RtMc063uA+Kk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fk0EtG0m6VE2fGtxkF7bKdkWsHATO6RE+8Q4aYaRPQK7wDlHOKuf9Tru8QOi?=
 =?us-ascii?Q?z0IbEtBIra0nK1eVo0H0L7kunBb8g2BJHFCZFR8VAGadjmeieQmtDSM/d8Yj?=
 =?us-ascii?Q?FWEMKvWyeJd7jLjGVegCCUNIrf/HGbFUsLwGciqxvgrGJeHH2Un/a17NiMuB?=
 =?us-ascii?Q?DNXRKfblm4qzVPgutcneAvKJ1KzngLZXqEeSSUWSkrwHDURZLD9xUwKF04HF?=
 =?us-ascii?Q?viwTcuU/wbl74W1f3KRoawgD2aBCDG9/ZkG5b9KL9YFryB/VOhRzTBctD6Pq?=
 =?us-ascii?Q?woktV1L6lSxO2tfy/s8TPZEgItAtkABcZk6FH8K+Of3XuL+MU/nG+k8LCNF5?=
 =?us-ascii?Q?YsXlym+HudGzucvvlWYlKgS5bB7lPT+M1c+bFlTPrI4HP1m92xxMQ/5YxZMR?=
 =?us-ascii?Q?Fun8rIaXIEwGHgKcdWN5T3m5IIXudSdetbM8A4YISbirZNyjNPd1Ruxp8zUE?=
 =?us-ascii?Q?WFV6LRbyMvIdTXBdxYpkf15yt7p3uVKOtAXTSjNaYF/E0hoKZChyS1iopy3E?=
 =?us-ascii?Q?bCkkMIQUzexH6rJEZ5ItilYRjPERBMF25gOgo2IJcv1o0Cu4r5sJzkS16Pjh?=
 =?us-ascii?Q?1p+q29qGmYCJMw0UwSk4pwKVfGIs/Zrb3lNvEx/izweynTIeR+jJcwhzZbMS?=
 =?us-ascii?Q?6aqN7SiD6Au8hc/R2e1RsE3WyR2zbjkZGVxvM6QJPTTQhvJprymA6QhFFU3h?=
 =?us-ascii?Q?q2/fQAL6oliz473jqjCB4IpRJQYm1ssbodOLBisYhhCNUjpLpA8H7QDxHOo9?=
 =?us-ascii?Q?oTp52W2kMwC2b5PXYi952SRrUung+5Iek/rOFq8P/2WOGq/eNUkuRz0gztEm?=
 =?us-ascii?Q?ScQCewzUWtPKrb0YAcltLe9YvXqckt9z23JMZMyryUXRs4Ym3VkJmuW7qsiF?=
 =?us-ascii?Q?I1R6jc22WaQqf0TQTvA0/UpyTgOCS7nFozbnz2q9Q0uJEnGGKKlYPO10roB+?=
 =?us-ascii?Q?5hxeFINRhayBSXolttfR76M+Fq2Y9U3s6HYuOmz5/6iLMxnRDDnHy6qFjktG?=
 =?us-ascii?Q?WZn0/i4dOz+k/yfx5b9Stn5DqQ1LUPyO4bVimCmkmFGZ3WDhM781sUFzzZSb?=
 =?us-ascii?Q?a10jMciF4ZEiKcWDTzansyTC7s9ymlZZv1PzYjLppqe7KlT1cTvwFCdqETDs?=
 =?us-ascii?Q?sR4OBZORjnkNGSyPwDjVMoCPMnzsIE1GneFwEecktZSWiDLlEXns9uMzKRYE?=
 =?us-ascii?Q?PQOCKr5FkgjPd/lM8olBreWY/RIW6kRUNcXdw2p9rbKV6mrlKUBLs01Fo8p7?=
 =?us-ascii?Q?jcGfPRppcJ67ipRjIJSnXptUSOij9Wv7Xe+lHdWe+SN5f/ISDimf1JSzzalL?=
 =?us-ascii?Q?qI4PAFQZMYZDKlqTqHOWKCegV2KDeQQXq1HG2LnDdCfVlFP14U7R2YTrZfdb?=
 =?us-ascii?Q?cA5IxwWFr0GbXZl3qpDEYggtd2YhrdkpcplDcrG/3YPvl7mMnt4bY2Hyg+8k?=
 =?us-ascii?Q?5i74p31J6VD3Rzg1QVCiwrgVxI/Ns5GTP7qo0sTIxBYddyL2z77vNA+5DRy3?=
 =?us-ascii?Q?3obbu0rFiIbKs4Gz8oAA5oIFnomQFHmjdldspDOwFpEYqbU65sZr6P9ECvf1?=
 =?us-ascii?Q?EQU6pZKjodHl9Nn0Z3UExOedpRAy92A7vQKtTbO31iW/ytIyybukgdUqakUA?=
 =?us-ascii?Q?l/BqlO7+/uMy6fYP8JRDTaimbW/TiVChwj5ji54yYnBjIJfgv0DquCOwZGLY?=
 =?us-ascii?Q?yo7O6X1cjL2NGxhbvEbssaQ7DUYHA+O41yH2htxv2rxlaY1c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e018afba-7525-41ea-46c4-08de6d7b2945
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:48:07.6435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvjQ1kEWqk+XB588fHszJm/jsBbrScFYkK7XYar2wIgydthND7fANaSJ7D0sSHoZRyKyULJibiQkqdizs+6UUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10767
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0E914146641
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 11:41:26AM +0100, Marco Felsch wrote:
> Hi,
>
> maybe this fell through the cracks due to the maintainership change,
> therefore a gentle ping :)
>
> +To Frank

Please wait for v7.0-rc1 tag create.

Frank

>
> Regards,
>   Marco
>
> On 26-01-15, Marco Felsch wrote:
> > Hi,
> >
> > this patchset adds the driver, dt-bindings and dt integration required
> > to drive a parallel display on the i.MX93.
> >
> > Since the i.MX91 register layout equals the one from the i.MX93, I added
> > the support for both but tested only the i.MX93 case.
> >
> > This patchset depends on:
> >  - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/
> >
> > @Conor Dooley
> > I dropped your r-b tag since I added the 'bus-width' property.
> >
> > Regards,
> >   Marco
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Changes in v9:
> > - Link to v8: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de
> > - dt-bindings: drop unncessary changes (Frank)
> > - imx93-pdfc: drop bridge.driver_private usage (Luca)
> > - Kconfig: Adapt Kconfig symbol and prompt (Luca)
> >
> > Changes in v8:
> > - Link to v7: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de
> > - dt-bindings: add nxp,imx91-pdfc compatible (Liu)
> > - dt-bindings: use video-interfaces.yaml# (Liu)
> > - dt-bindings: s/data lanes/data lines/ (Liu)
> > - dt-bindings: drop 'reg' poperty
> > - dt-bindings: drop #address-cells, #size-cells
> > - imx93-pdfc: drop drm/drm_print.h include (Liu)
> > - imx93-pdfc: s/exist/exists/ (Liu)
> > - imx93-pdfc: drop MEDIA_BUS_FMT_FIXED from imx93_pdfc_bus_output_fmts
> > - imx93-pdfc: imx93_pdfc_bus_output_fmt_supported: make fmt const
> > - imx93-pdfc: Rework input-fmt selection to always fallback to a sane
> >               default.
> > - imx93-pdfc: imx93_pdfc_bridge_atomic_check: make use of
> > 	      imx93_pdfc_bus_output_fmt_supported()
> > - imx93-pdfc: drop 'reg' dt-property usage
> > - imx93-pdfc: imx93_pdfc_bridge_probe: pass -1 for endpoint reg value (Liu)
> >
> > Changes in v7:
> > - Link to v6: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-0-7b056e1e5b1e@pengutronix.de
> > - Add missing bits.h and bitfield.h headers (lkp)
> >
> > Changes in v6:
> > - Link to v5: https://lore.kernel.org/all/20250304082434.834031-1-victor.liu@nxp.com/
> > - Add bus-width support
> > - rebase onto v6.18-rc1
> > - add review feedback (Alexander)
> > - driver license "GPL v2" -> "GPL" (checkpatch)
> > - make use of reg of-property
> > - fix to short Kconfig description (checkpath)
> > - add OF integration
> >
> > ---
> > Liu Ying (2):
> >       dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
> >       drm/bridge: imx: Add i.MX93 parallel display format configuration support
> >
> > Marco Felsch (1):
> >       arm64: dts: imx93: Add parallel display output nodes
> >
> >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  78 +++++++
> >  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  54 +++++
> >  arch/arm64/boot/dts/freescale/imx93.dtsi           |  12 ++
> >  drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
> >  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-pdfc.c            | 226 +++++++++++++++++++++
> >  6 files changed, 382 insertions(+)
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc
> >
> > Best regards,
> > --
> > Marco Felsch <m.felsch@pengutronix.de>
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
