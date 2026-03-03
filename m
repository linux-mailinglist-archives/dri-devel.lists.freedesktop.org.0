Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBpdMH5SpmkbOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:16:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8441E8644
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199F210E0CA;
	Tue,  3 Mar 2026 03:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O/Cat3In";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD9210E0CA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 03:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h28MlsiA0asFEQ8+DwdAyMORNw9z36r0WxkDQDsNkJp3Lxb41SnMOD1RhI5b2h3yfewSHlNJI+j3IhtG5mFV63w3cPdK8KBL5IbynzflOV5pIYwaasFPKv5z1qqVtDHXh3u5YTfrKpzmIpHz9CgLBiBejfNAEHUizEkK51IuWF3v0pkfj14JqVcQgPqVkvrlIytTuwDoqeLxnrjhmiQj2b23DzVGmTaIpkGjHM+C78Bug9QXzu/OCfSmKgQZq/63xuGvp6Ano1teRNy32ND6hPE2Zovi4+XQCdfliqjyVp0MtpWiyhUpytNCqWC99779VErviPnUzRyvb8z33Mvn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgFu+/oYwp/MZLJURfVdcRKK+YqhyO9CUNXE/yActtk=;
 b=vRWRFjK0U9qu2bgUBZbruTlCc1GCaSE71BX2RoMxxfdRpUPjpuwYjlD4w6puP5cdxbR4E64iIHKRrr8faZpZ/g0e5p+G7MbDOs8L46pJeUxI+w/7US7ktQwG/YAuYmMu8zzp3o1To02TT9KhvhYUBYVt+p/hx1x7DYfzXolrTAbVxiioJM9lCQlp8oEsq0tbSl/3SxMtRaZ0cLrCAscnWZJRC3XfIqd2tkmCnwObkKWPgdJq9CU+dtDc+uHa9gtFwH/uwFfIKAHNFSrrVtBijwpHR9xGgPJgOllYl3xng2Z7bFabx5WrG/Y6D4gZy8Y9h+LUNcWpYJmpjgcq8Q8ODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgFu+/oYwp/MZLJURfVdcRKK+YqhyO9CUNXE/yActtk=;
 b=O/Cat3InP3yu9mLq/xlaV8fmVQDob2VXCvQOqdxXWoHd83UV2EDHKCoDazM+eCCRhVJv3DAduldKiu355jVoR7IGGXJZ04yX5JWzA/3Ad8JZ5DCtxYcFxFpGZGLl7+IsVitsFTMwJb4SJ9R4ANeatcegqlC81WFFMd4IyWJAK9+qjHCf5X7clF0khjxiDx1iirckvcpreXRkfNNGrN/EjIXwuxB4vg/L7Mvp2IrYkGa/+QVJVvGjtBqjl6YnIq/l+HEelGy9gyQORzn8/MDRhVlqGaoxfGf4i2VYmVcTwms3G0LmztZ/dg2KRi6XOAXdOcLeO3yCUpA2jE0mKwp1Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10849.eurprd04.prod.outlook.com (2603:10a6:150:21d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 03:16:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 03:16:04 +0000
Message-ID: <7d708ede-a576-4eae-b319-ebd54dbc5163@nxp.com>
Date: Tue, 3 Mar 2026 11:17:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, frank.li@nxp.com
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-1-634fe2778c7a@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260302-v6-18-topic-imx93-parallel-display-v10-1-634fe2778c7a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10849:EE_
X-MS-Office365-Filtering-Correlation-Id: 67da3580-300f-4b3f-cddb-08de78d3344e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: Z02N65tGpickgP9g8fmo/mAE4Yzl+d1VswQJ8a3gpLNTF23xnUR4SC+Z0QkzvLeO46ym9iTgHjDzE8PefVwLKHzXfpYW14/WwKdnAxPD0MrVueiCS5rpssvyCWuOA7j/J1yXY/UnszNssKzu+98xDlWhrpX/zOj/xOVxTDvFkivbH+XCHiOqW+b5xxZI38NKe0lLgIeVm/8d/xkKOEtH/gFEvurSm0jnUFdE8SZ7gglZXIao9iS/ktAQ7DEPj00jGYg4KOV95+bE/utUn2SzYwInWJZSjf63NxXbvjvC44elsC1P25FjIvfb8f3YBuDvmEkz98jMuTCfLYuhLMkBGpD47ozfHCyc3/tZchTkrM7CBgemK/AVGRM8y/nQ/EIa+FFEGyJwaVZX+opgxTpMXvjmSTAF385Tj+2KN76NeFCFTTlakl+RQV+Y+2itA1uA+tAaRUJPu3dw6jvKjeN6Veq7S4CGeMv2bFgdp6IQgDPI79TH4zma00rKnp1nwvSD1JD7sHHrqiD7C+if8qzejettxSsdTI0p3jDtF1wy1c7f5OPV+TAnXct1RIKxNToXRaj+ISnJPZ5+7h80oUHn93yBcK8ylgJLpWSK//1jBkMAsL/Sb5LnENmpace6uOhEuDxRM+p3kO1wMS5nY9NGvrT3QjZTmLIjUfziNxQNBOF73G0F/XAQcusTfkKxZPMTfBC3A35Bwrns8Hc9wkPEewh44P5CE/00IarU2HI0ypld/8bbv8Nn9bRQ5vVVVSgS76MjFUXi4NUwaFXrMGArkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExkMGpNU0s4clJrSnZ0ZWdVcytsM1M3UVo0NFl0NVM5Y2FNLzlkcXhqN2I2?=
 =?utf-8?B?akZSKyt3Ylh1Qzk2VnlJSWZNdXVnK1FOcklxMTlpdDZRZmtYdzArd2FydEtk?=
 =?utf-8?B?Mnh1NDIvUC9LU0JaN3R2ZE9UbTk2cWNEUjY1SU1lN2ZuMzNqTFZuVW9tVTVk?=
 =?utf-8?B?K0I0WC9acjlRbWtBdlVaNnUxZmFDSlZiZjhiQ1cwT3VMNG1HSHNoV2JsWjZG?=
 =?utf-8?B?R2R5enhnSktqMXRDbW9vcnUvZVZtNFM1ZmltMFZrYW5ydCttMkg2VTBVcVlC?=
 =?utf-8?B?YUF4UEZiSXc3SStKaHRWd1lTMFlCT3VVRk1WRHd2OWg4cHZPZDVqWVYweCsv?=
 =?utf-8?B?ejR2WllMRGhadlNYS1hxVFBGaXFscFB6enpkL2VLRDR0TWlsZVBpYW40MmZl?=
 =?utf-8?B?dXgrMXJaSnN4d3I3bnF5T2xkR1M5K1hLcDk4L0tOWkU4aWxBbzQ2L1BWOXZI?=
 =?utf-8?B?OUhnK1ZJMHRWUU44TFJiTXlLb1pKL3l3ZFh3Y1lnZk9YRXptcWs0S3ViMElX?=
 =?utf-8?B?YW9KSmIreEJ2d21WeHhsMTVLT3BkWFlRLzlXNFNaWHBWSHh4SWRKQ1R3bnFo?=
 =?utf-8?B?d1BMazBiUEFjWjkwOWxVczY0T0pkbzlJZHBtaFZFK2o4NWZuQUxnSmw4M1Zt?=
 =?utf-8?B?OG02Q0lUbWVPTGc5cHZYTWc3ZVluNVY2TlN5b3ZCeUNCZU13cjhaZE96d0VF?=
 =?utf-8?B?RnpRcXBkdEhEeCtvWmJCWXZobEtPczdub3I5aGU2MFNRVU1CbE8yR3Z0MGJt?=
 =?utf-8?B?bjFtcnF6c0laS29POEFJeStmMUQ2V0Y3a083M2JhZGxvdndkZk5xLzFaVVNp?=
 =?utf-8?B?dnJ0MGdPVjFaM3hTTndacmNRT0tqOWpaenpGaWhKVDdlbW91dVNCOTNFSzZG?=
 =?utf-8?B?NUhXckZuL2s0RXZlK051NlZCL05ORlNLZFpERzUvSmRiWFJ4OFFMTmZ0UDJL?=
 =?utf-8?B?ejREMUk0dU56N1RQeklDT1NCbmhiVGc0eHNKVll0a0tlSGp6TXJBSk5NSmJH?=
 =?utf-8?B?NzZpMElycE5XWEw1R3Q2d2NzbGZJdms1VjhYcHJVU3h5U1FYZm9tUHNzV3Mw?=
 =?utf-8?B?c1JBZjVuWkFvbjJoTFdwYy8vRy8vNlZ0MlI5UWJEaTFVL3pYZXUvdmJRSFZO?=
 =?utf-8?B?Nk96ZFhJZllQNU9lVytVWkNubFpEbW8vWk5uVG9IbktQRUhoQ3A1MWJ1RTU2?=
 =?utf-8?B?SWduQXBxUzJOL2tsbU4rS1J4b1crM0dBNDVrbnc4WElJWkxvY0oyYS9UR2pU?=
 =?utf-8?B?NzEwakdrZW92c3R1amFpOWorMklkOVJFRTN4Qi9Md0h2dFU0ODExN2plN09l?=
 =?utf-8?B?Zm1lMUI3YjQvcy8xWkdwTTBqWjlBVFBHVFExUnoxWDY1R3VTaDRSSEhtaC9X?=
 =?utf-8?B?dnFTQjRpL3B5cFVLcWhDMVpjU2M2TVRGL24yZW1FOGZQSEYxaHczbUNtbEJ0?=
 =?utf-8?B?TEdkT2piUVJpeGYvbm10UWZSSStWWmxwajhCMU5QR1MyVjk5b05Uc2N5a2dv?=
 =?utf-8?B?TGlLaWpkbTJ4aEhFK1lzSThPMCtWZ2wvVnZwOXQybXNwSlJvTVQzcjdTOEZJ?=
 =?utf-8?B?TWpncW0xRUxlYTd3SUU0Q2VsaXEyMmF4a21BMTkxZDVIYTBRM2tVRG1UOU9Q?=
 =?utf-8?B?bncweUI2OCsyMkplZUdXSnpPRFV3VDFHZzQwWllraWtmSEVsY3E1UVRQNS90?=
 =?utf-8?B?ZWhlU3Q5c0pjc0FEOHd1dDJwOFZYM0xMZTdCMVJJcFV3bU5XWUUvd2s3SFJQ?=
 =?utf-8?B?bHFuT0ZydXZ3THd6Y3lIcGh1dFQ1Mzk4TFlNR2JxMmpobGNRVGdTa2xkUWd1?=
 =?utf-8?B?a09peGhPaWhCcGx1T3Zib2VRVFVHQUNzRi9lMnNoNUJEL1EwTkNqOTVNRWVa?=
 =?utf-8?B?dDlUQVQxN1ZhUVMrekVmOTZhS2ZnVUF0K0dBbHlVTGlFam42WGpPN012OWpF?=
 =?utf-8?B?UGduQkcwT3VLbysxcmRJaVNpRTVNbmNGbkc2L3NjNGkyekFhckIwVW9OVE9w?=
 =?utf-8?B?MDkxSkg4ejdsTHhWR2FIcTd5Q2huTVhvWlFDYUhHZ2N3TlJidXMwRUkwd1dC?=
 =?utf-8?B?Z0hIc3dYVExzYU54b2NwOUg2UkNMb05wbnpCWmlMdFJpWGJHUjB3RDBNUXRW?=
 =?utf-8?B?WE5IeHZWZmNXY2swRnliZU5URWc1LzdoYjNoU0YzU25UV21HZWV2Y1F3TlZP?=
 =?utf-8?B?bUtXelRoNUtsNkZUTnpkUEVRV3duY3QrRW5xdGx5YnNiL2kzZVpFdElmNXQz?=
 =?utf-8?B?Tm5UajNaTyt1T1VEWEtoTlYzYWJYakZobVVJSHRQa2pvSVBDRlRDQ3hxMm5n?=
 =?utf-8?B?OEVrcWgwQmNnNkpadEpaU1E2Qy9kV2FZYmRWeHh3N0hLU2tiZFpxZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67da3580-300f-4b3f-cddb-08de78d3344e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:16:04.7021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbAHrGWfzvQxQWOjyAWViX5Vr5fSsG8IYDVXy/YisadbiA678QRKF2wo6LBfFDPRJ/cu/XNcvJd7Jx/o8cxWjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10849
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
X-Rspamd-Queue-Id: EA8441E8644
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,pengutronix.de:email,0.0.0.0:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.1:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:10:40PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v7.0-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -40,6 +40,58 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  dpi-bridge:

Cc'ing Frank.

fsl,ldb.yaml documents fsl,imx6sx-ldb, fsl,imx8mp-ldb and fsl,imx93-ldb
with a reg property.  Since all of them are child devices of either GPR
or BLK_CTRL and this dpi-bridge is a child device of BLK_CTRL without a
reg property, how can we handle the inconsistency?  At least, with this
patch and the current fsl,ldb.yaml, we cannot add an i.MX93 LDB child
node.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx91-pdfc
> +          - nxp,imx93-pdfc
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: Output port node to downstream pixel data receivers.
> +
> +            properties:
> +              endpoint:
> +                $ref: /schemas/media/video-interfaces.yaml#
> +                unevaluatedProperties: false
> +
> +                properties:
> +                  bus-width:
> +                    enum: [ 16, 18, 24 ]
> +                    description:
> +                      Specify the physical parallel bus width.
> +
> +                      This property is optional if the display bus-width
> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> +                      is connected and all 18-bit data lines are muxed to the
> +                      parallel-output pads.
> +
> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - ports
> +
>  allOf:
>    - if:
>        properties:
> @@ -112,4 +164,30 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +
> +      dpi-bridge {
> +        compatible = "nxp,imx93-pdfc";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint = <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint = <&panel_from_pdfc>;
> +              bus-width = <18>;
> +            };
> +          };
> +        };
> +      };
>      };
> 

-- 
Regards,
Liu Ying
