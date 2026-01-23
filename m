Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CATzLVSMc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:57:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE0774DD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09D10EB12;
	Fri, 23 Jan 2026 14:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BKvWha77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DE410EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uovPTwokbl1tClU1sb34vgPE2gHLEKEFOD5l28EiykJzTWcI7U+0cT3Z3pyO01ulsKyiAeQlYg26WsaN0nA1uMuX2s2nT/Um2Z0Kg3f5TRuWE1xDsSTa/LuzpAs3n640i+LdxqFaFb2gWFuD5kEoqBLCkPREJ3bZ/RPGVjZEaLYzX0CBtvk09KRrsvXCwVgN0PqTuBpyWMJLRfsADDR8q/gdVuy8yDcl0EFxmakVNGGu797L9C4nHT71P0QbcBC5XWCAAw4RwDTvtsvivAyR6SnmFWxyAVKM2reX8wTKoqNeF4kxiQ9nKsTQ1x4XGcXNFwNZBnA0enfN6EdCOwlfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngavdbs7cCKYC+sv1ZVOmPkmiKyrYyfO8sugF6bI53Q=;
 b=Xi2PchWfzZl3jFDqamBuzROvx+apxZaa6CxrMb3qCyxB4wcFqQMRCcuvy2SW82UuTQROyi8QyxyzDo/YxQZriWHvWaxqMbPo2MrN/69ajuU0cRUqIA8DC1O5JAMEY6G4AHtMySGDcOdISoh1ul1eBhjtbEc48zaTAo4m96d1foQFJYrnbkvw1kZO86Ja7c+NDDFtJV64/dY7bC4RJsnXrgY4jHUs1kR0cWOvM62nkIAo+PQ37br607L3zWRLMw1jairXuSVvHwiJQHSYKY6/U1nPqT/mVX9tVXnXfLCILdV3VW9GkagSTOBOFvJQ5pHLxXQOGaWeYB1/bnAO4KIm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngavdbs7cCKYC+sv1ZVOmPkmiKyrYyfO8sugF6bI53Q=;
 b=BKvWha773S0ulv73okuCAB+XW9EDE4aGBrwJSa1UkEK2oQofsO4D4+v4FENPan40yVkt+o33NihH2GJ6s2KTuXbwZchuRWiXA2dMpI5MeivUYSQv4hFAkU2WLGg8vqD4BweScg+mSCPPIFhFoPp+dD4FhPLVQSoRKAuAF6prcn8b8IBLa6x2Jwg7hC0c/FP6wMI8G+vlfDrBSrPFYI1KKkoYucr0jNGiXE1cPAOIAOY+qdHktwM35zZZiRtihfkn+LBM8AHPmq5LlEOqRMVBHGs9aiQmE6QhspzD/HZ+7b/gH4yaOcP7vUpWZ4nJ6qYfwgdHEcbkXs60J3jaw24djw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:57:15 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:57:15 +0000
Date: Fri, 23 Jan 2026 09:57:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
Message-ID: <aXOMQmLy90S7ag+A@lizhi-Precision-Tower-5810>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
X-ClientProxiedBy: PH1PEPF000132FF.namprd07.prod.outlook.com
 (2603:10b6:518:1::10) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ad0f19-c43f-4b3f-f0b9-08de5a8fb26c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2kPxG9g1p+BGv8ViY8TTw1W9jGldiI4yOusLTgTUVwtSRNRKtIGqCVSPWC1n?=
 =?us-ascii?Q?/UR9N0OPVfIkVGVpn2o6GsSo0D/XrZ2TLECvQ2PRx5SrmsPpkfa6Fm8BVSxX?=
 =?us-ascii?Q?Gg2DcGAzR5exjRCbvjBjXazBpwi5h5geQ6tNwvvdFMWYcHBhPQaGKuWo//ga?=
 =?us-ascii?Q?WnyX2Ju2RPeV9bQWrpeF7/jT76Pd1ylqLTB24pKObzYZcIRr85kvdSpUwtIG?=
 =?us-ascii?Q?ppzxkNijBEPUPFNaciY4Etwa8P5B50ZQBBMJuOkSHaVL+JfbPbk79vDp7sZx?=
 =?us-ascii?Q?a9IWyn9zr1lUXJxe2HS7BdHxMGlbKqDoUU2EH/Mo5Tfp/yu8RfW/cM11cGHO?=
 =?us-ascii?Q?++UF9wC5bPnwhO2jGnoQJ3s+4OD6PPllW+tpv06UjkeFdq/GPq/zzlaJeivd?=
 =?us-ascii?Q?uuePIEu31X68WFh53w2XH2lzkfK5jbV+iFaKal1pzSgyA45+8AbqiRs8bF+T?=
 =?us-ascii?Q?D0qzUH9gEb868JgOM+ASBnEUKb+sFlfambQiqybgs18Kkk6EHo61XADoDG7A?=
 =?us-ascii?Q?mHwEnHTCqqilr8+14fd/Yd/C+Ic9tKltGoAJczSJErMQcpGqekKiDizW0Iv0?=
 =?us-ascii?Q?DWjWxlAQNjPE9tj1H1bCMzI0I1e86sgVZAektrci83xGOt736cj34HwUl719?=
 =?us-ascii?Q?tptzhwy4eJlaxnXinga0TuHJso1J3lND7ZS7sq4PU3/mecO/TY/1CvxRqO+E?=
 =?us-ascii?Q?AtDYjo3N5jrF4Uh3oOPubekVqwpU7/l+pybkT8W14kxeXjc+ucTNvfFTu36g?=
 =?us-ascii?Q?8EsXrv5AupTar9Oq7hthmBrmmYXLl/BfEAI+9BohaLmNa4Cq9wHoyxkoQC2P?=
 =?us-ascii?Q?F4VGPSH3YGgbzCdQl7Ox4beFdP8B/MrPIzZWpY6j7IHOehrHgh+lctOcLh7j?=
 =?us-ascii?Q?qCrQlK+1DIbrx+yCQ6sopwzb6XLMN1EUyA/TgIGZzw4XADXYV1y4sbanUD8j?=
 =?us-ascii?Q?rOB3tSBTpNI31F3Q7hR5hU33b/gD38mtgBJSNnLLWxwtO3Z6TEVN/kOTcby5?=
 =?us-ascii?Q?v6VVj9TtiWY2LxLeOaYHKk6yWKMBe7S3HYiHiC8dh4OkEaG5UWYCJ9JRSik+?=
 =?us-ascii?Q?radt/eyQbWkzbIKcFF/1JwRTzdwXCoSdjzQ0nIntyjm2F7X5NhRKqFaI3P+E?=
 =?us-ascii?Q?iqpQ//mtqPz4cMNT9B0BmGyLGT4te56/VwukXEPASzql7EVTjFEfrXSSSm3w?=
 =?us-ascii?Q?Ztnf8PGAIZun9NZem17Czu9qF/zKhMJiPMMzd/agwIYRxNadHeIFd17H4toa?=
 =?us-ascii?Q?GyKj0l8uMM/N0G3U4oAh2Qqy3AcV1DC3etcdaZo4Nz2wYmAwVNtZDQN0ZczT?=
 =?us-ascii?Q?mViCRn7rpRYT0TASpJkrODtWBOD/10ZBqT2/H9jPCRMytyunV1SFBwpKnCsj?=
 =?us-ascii?Q?XIlwBisQmlHgiYEK60rBmdbFXQcqusP1i23SWxI8z+yvCg9aTllqhhI94TEf?=
 =?us-ascii?Q?K8ZcNsRaxuUMpkWJAiax0FYJewD+1rZOSNF0IjJ1Yu4eM5sWYOpXsdYdzrmH?=
 =?us-ascii?Q?8V1e+vH+pfmF4HtiT8eo5IOqcg0G6KPjm4J2mJwHQS1TRSdk64Wmc1ydMBsl?=
 =?us-ascii?Q?xxNV1ZOIRo6fJXfzlnvUXEjd+j7tVd64rp/ulnUQXmiTZahNdc6FFfS6qK9z?=
 =?us-ascii?Q?e10cx9sWDf7r+qp9S2GbjFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8957.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFtvVA7aIi4fZJ0HnDOSgVommrKSiYOQnyyZvavcR2UZWqGMvq4dQkX9mmT7?=
 =?us-ascii?Q?vRRXOQFqM3dZmRKjg972zSgMOhmYZhH2EvRT5JL+yNGHcoWWDOOvggUlIUwA?=
 =?us-ascii?Q?k/seTlIsIz6UP5iFXnUbCB5axlLNHzY/RW+Yg1uw7PdIE3RovQ4a3AMTYX+6?=
 =?us-ascii?Q?8zG5MsORe/NGRDvHFaFrFxnzu2/rKl4EHs0DmlC7ugcnulWPu3/mAY7D/jHB?=
 =?us-ascii?Q?78xVhOYPQPnM6IJGyLAjC8UwhNXZM36RvP/JGY1bo6sOzMRvAW++LoPR4okm?=
 =?us-ascii?Q?RzdeAeIoZNuVjJlHYSJT2inNAoJgea2KsBBY26rtoYYstUwI2p3fBcOOgxEl?=
 =?us-ascii?Q?Xt1oXdZSJ6ZAAn+t1r6c3RT5vtVU7LuIoeDBXZ9MvAMYfKhCRG35SmWL+ZNU?=
 =?us-ascii?Q?2jMUANpRaxbPrGKkpZurTb7mvrzLdsMsvpv0j+OI5FbHz7B66d1Gw1tkErsh?=
 =?us-ascii?Q?c56BLmNgQCgxdQJb8XJ5SowNCVmWg+BoMUC2Gi3pbWWFy/5BGUci4RutBGqV?=
 =?us-ascii?Q?hVIItzTLl+vMtc317WQ3CDAej1igRZYh4JEACAz4ftG5Pz1a8Iv1CA938aFl?=
 =?us-ascii?Q?jkshhnNLseoJxTGaeEkMgOQ34E0JgqOppl88OYXQPuODm4NaPo+UCPzgk3Uj?=
 =?us-ascii?Q?QY4Nml63u69sjCC8QobKu6ky557Lk0ijw4G3gOuuvxX47gLQA77AF4J3USQG?=
 =?us-ascii?Q?KfHARJmSqftsiNmCabTQkkST4nBqqu7GhI5pf8oRQW6DVYH1xyjNdhQb9i/r?=
 =?us-ascii?Q?tlpQN1lirHslYYYnA/p6lhfHXGKyQ3zqueLYScLPh9dPqvwPFgs2MY1SPZRc?=
 =?us-ascii?Q?N8/rZqDTGWXbPobGe5U19PfU0DTQ9nIfbIHLUGvSXDTuPORdoZKBY4hKDft0?=
 =?us-ascii?Q?YqqJGxmysW5MUI18XMbhGhs0MQYz5WR6LhRAJKe7GuFRswtcHeVqhO27eJc/?=
 =?us-ascii?Q?TLo3t2+25kIwRe1BOMkvZbh5TPvDKYGHwh5mTh5dkhnCyNqxIb4Uv9a45470?=
 =?us-ascii?Q?7ofNFBLYJYpHQC3NZiqXwHXHFs3BisYzIttj6G7QiRv4N+H7aSfVl6ymcM8G?=
 =?us-ascii?Q?pglyF8ITBDgzHXptIxUVwCo+cYLY99UQxR+xAv76zhPpUr5nrGMfvhBrhMt8?=
 =?us-ascii?Q?BhKJpjUXe9VPwh/ZG/7SVdkkmnbY2JoEYRNT5TVaWZVWgRYi/Vta/1o9RXLv?=
 =?us-ascii?Q?XayuSdfx8iKHONA8FF559UnWNvMQnbtoFkdN4mUdBQCIS5x6C11G8pJ6hPsl?=
 =?us-ascii?Q?sf+4UfCm4hxF6ajIu805g71ID3SwN4MHyravOfSYsaN/q92kK0cDzcOdzsTo?=
 =?us-ascii?Q?qKwqeLAJPV9xc4wxkpajQwY4OuGya4lrjNfH2uAaAOqgA/8zCkCtJr9HF1G7?=
 =?us-ascii?Q?vNrpGoXxe5P6sMPZgPg4DizvNtrmQGjn6viMWW7EMwx5vz8kbv5w3yFo3vFJ?=
 =?us-ascii?Q?l/k44cL2Z9YG7he2RYnMy+piCt6ABx52NX5Q4BS2NRNQlI5gKP3aD02d6R0j?=
 =?us-ascii?Q?kJB80V7pvXQIAV5req+ighFeK5bxaq2pb3DdXnTmHtsxFCwIy/xtTTugQNhK?=
 =?us-ascii?Q?pCvBpjCcILorjYWkqIm7oC+uSlL9tESt5Fd4nnhZjK28fetbZpAOStOYHYJO?=
 =?us-ascii?Q?CELWEStwrS3qxrWWBB/icmtPGWTx+QynA0TwA8mZ8A0smf5EHubf+5KWmF5q?=
 =?us-ascii?Q?IuEKkGSvELXsfAjQb9S2s2S+Zzy0djEaqElwlUlkNyQHgu6m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ad0f19-c43f-4b3f-f0b9-08de5a8fb26c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:57:15.5297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clTaowfXLUtWW0ljJBW56qR7gMDCbEk3nSlGqAtg2LF3qidVVt2SdLPPsaf4bI2hotrjDS8HfbZ4ZPaZwPgkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:luca.ceresoli@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,bootlin.com,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.278];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 3CAE0774DD
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:22:17PM +0800, Liu Ying wrote:
> In case the channel0 is unavailable and bailing out from free_child is
> needed when we fail to add a DRM bridge for the available channel1,
> pointer pc->ch[0] in the bailout path would be NULL and it would be
> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
> pc->ch[0] before dereferencing it.
>
> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge")
> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index 00dcd273d8ab..27ad66f240cf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -345,7 +345,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  free_child:
>  	of_node_put(child);
>
> -	if (i == 1 && pc->ch[0]->bridge.next_bridge)
> +	if (i == 1 && pc->ch[0] && pc->ch[0]->bridge.next_bridge)
>  		drm_bridge_remove(&pc->ch[0]->bridge);
>
>  	pm_runtime_disable(dev);
>
> --
> 2.43.0
>
