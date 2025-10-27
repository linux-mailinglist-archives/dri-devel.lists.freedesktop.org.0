Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B15C0C69D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427A310E3A5;
	Mon, 27 Oct 2025 08:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YZehk/3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFA110E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v33R7L3TajV/oUkdzTeNO5wUisSF537UgqO6VRAFNSTtZr1atVt7yNayPnDVnBzg+h8B1KxViElOramLnGCzPyrXEdboaFVjnATb7WdqYm/t9wu4tHhqtw9A1nxY+QS/OS4jSVeWXXQAORf+/Pg8svAFLSxDbCT2FS5cvjTj9feaj7zVF+7QR1HnxwGRG/OwJJfyCwb7svdK2KO3g4B9UZFTfhqp/Be/E43qxA3lS9EeJRR+QxGKXSE9xSJnC4na29tz7LG06AiThK6f/Blx0KayzrBBPzNuBlAA+PxEJeZch4fMvpbU7mSDXJmL8xroChaTSfTtL/9yzxOC9RRJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwDaYv5/cMfGnFFRJ90QjTnkksikVmdb3TO2/4Ta+/M=;
 b=fUDXBLFAqLRfjxlNHcgbnpFztE9Rkebg4aO9bhcJs09NXmamGsVF76Hdd0WWnkI3t15Ux3Yi7kwYq3ZTugTBkRDZOqkCu2yZaro68zTrXumwHPfQvjHyx3ArqzZPYg3nilnyrTaIRx06ZRpBiNjKFhiigRDPJo7XLGS4tdtQOEC3Fbi/b64jn5xc0w4Lo5/e8A9fcxDBHDdkXkwgWPuz1/w/xr/YVkty+ZrV3vhvxWdHmK26H6uLJZgbEip7e5CSuXj4DFbCQT5OHQs3dzEzz5mBoLZ9U4FUbNThBTmzTb+AyusuHKfqQri0skC90Hh9sEYqJbSlszOdITbNYPTAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwDaYv5/cMfGnFFRJ90QjTnkksikVmdb3TO2/4Ta+/M=;
 b=YZehk/3ec6WIl3YBSJA1p97B1czzaDfkrIMBiTafR9k+VDIv9o/vSKGqg8gOT3rWW5+xBEb4ZVZTr+SJaUbgBGpxJbEhBZzufoG+AwOGfqKGttNrVJ0yy6yOJi7Kn+z3o62SHSVmorTyAkZP6eJ3pne8k2e7GOq9uTL52kElqJhLbVqzVH3p+G0UkejdOVbbm2j2f4uBi+RIWy9MnLT9SeX2nzgbWyvJzWGqXlx1x1xe1bwVr8VYkurNxO+pkxV93hMtAGGLk6upZGKpsKFXyYjHF8mzFlkoGY98KYo5moeNtxFivAYamh2ew6S2UUNJ6fVywakYnz7rug3fwC8KAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:47:00 +0800
Subject: [PATCH v5 10/13] drm/imx: dc-ed: Drop initial source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-10-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9082e3-5a8a-4d85-ca70-08de153582dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3BERFBpZVBlbGNVd0ZlanFoL0tNdGdPdndPSDdmRXYzRnBTMGFwZm5FSGhZ?=
 =?utf-8?B?akxSZjNMeWFKVDBFcDM0dW9LclJraFprdThKTmRZaHVFUFdiazF3bnYyTkNE?=
 =?utf-8?B?TlVlR09SczNmUVc0TWg1QXpOMjVnVkFJL3U3SDlpY0VROW5POXk5Mmc1S0pJ?=
 =?utf-8?B?ZlhidG00T3VpL1c4Vnl2U0RpNXE1Sk50eENoanJaTnRuSXMyZ3hoUGtiZjJH?=
 =?utf-8?B?TjlEa2tGVFlXUVczODlYeC8wZEFlejQyMGZEbmZ2WUVaSjZWTG94eFB4amx2?=
 =?utf-8?B?OTRpWWRGSmFOZkF4K2NkK0F6NlBlWUxneDR2eWNIM2hNeGhzRm1MNnhvL2VS?=
 =?utf-8?B?MjlUM2YxN0IzRGhkNUJsYVBaZHUzdWNBS04wTGY3U20wREdjcCsxNmI0ci9J?=
 =?utf-8?B?blp1VEVEYjVnYWJhbzQwT0ZYVTFlelZiUkhtS0xaSmI4a0diMnYzREFsbCtk?=
 =?utf-8?B?QlJoMjl5MVMvbEdWZzZmOWx6RDBhTWpmUDY0L29uVkszZFQvVTFBR1I1Zkow?=
 =?utf-8?B?RkY4aDNzZmhDUStwQ2lsMGFzVWFlRGhPTGdKR3Z2dWdpdEZxY1EvVENvTjdD?=
 =?utf-8?B?NDBRMlVGb25OQTRHRGxUTlovZkpSVDJxQ3lPczNyeTJSRWx5dDhlOUJodjc0?=
 =?utf-8?B?Yzc2VjdHTnZmRWhzUHlrQ2xiT0J1cTR5L0ZlbjNyUlozTVdvVFhibmZjU0xp?=
 =?utf-8?B?c2V2d2FlWm00TXpocHZxVUg0alJPM0Raamp3UTFoTFVGRndjVXlqM2c2SGFV?=
 =?utf-8?B?bWNndFM0b3MvektIOVkybnV2YitZdXk3cW9Ga3Nvc085K21rdWVLNnFOeFlu?=
 =?utf-8?B?NjRXWGdtWG45Wmx6YWU5b2FLSFBsS0FlaHJQRzI5RjQ3VVhMZmMyaTQzQ000?=
 =?utf-8?B?ZS9nKzhINHd1eGtVK3RTY0t2SGFEQzN1NHpOdjkycFNRTGJVMS81Wmp6TFda?=
 =?utf-8?B?NUhIUDRlcG4rWWhsbzB4RkhHcVl4bmRJamhhSGdFUnZtMWxNaHJUMlc2ZDdq?=
 =?utf-8?B?TFJKSkFMcVFpc3JJaGptdWdmbW9CeTNFeDNiMjFoZVNUSHJ6MVc5b1ovL3Vp?=
 =?utf-8?B?VmhJWnExa0ozTWxVRkJNYkg4N084d25peFlUcm82b3RFWTRXL1RRcXhLUXU2?=
 =?utf-8?B?NGhPRm1NbjIraWloMHVhZW5vbmJHL3VpVWdOR2haV2tUT0ZPR2s0eFdFc0l5?=
 =?utf-8?B?cXJNOEEzcUlwb1NPbjFLaHJpTlIwS1ppZE5tVjBYY1BnMDZpek8rTmxxYXNW?=
 =?utf-8?B?TDJlSUJvaXJucGltcUFJV0JnUFhjVmlxNHIzT0tpR1dIK0ZPUlpRK25acDBM?=
 =?utf-8?B?V09ZemhPUFhGYU9aUGx4cUtETU1JZjdUVGVPVXE1QXc2VzVsK0V0bHBrOGdx?=
 =?utf-8?B?Zm14NlU0RVRNZkNDeVBQM25uWmRhQUFuenNDdjMrTGNkMm9SVUphSjk2NmZI?=
 =?utf-8?B?R2g0a1lNRHZhc01rVjNPeExLNlZaYm9JYllNMTFRYmFiVXpMZ0F0d3k0THVT?=
 =?utf-8?B?ZVc2bGp0cWtPazdaY29xemEvUnZMZyt6d0xoM0JXUmxUTXc0ZHlrQ0IvcnVr?=
 =?utf-8?B?NEY2dHhCeEFTWEdLQWZNRjZTcmJlQ0ppMjhHQ1RLeUVWa1BNV3Z3Mk0yaElE?=
 =?utf-8?B?UVZSNG1mZ0pqdWtwYXFCK2lZM0lIT1BqT2tzWUNNM0tpMTZRNHo3SWhibnUw?=
 =?utf-8?B?S1Blci9FUmhGVm1mNEw0SHlMWEZZUnlJNnkrekZ5L0JNcC95SW1HSUtRRnlh?=
 =?utf-8?B?MnBFR01DWXdmcmxGVXZvb2V2WUtJRGtwc3poU05jUExHVkhiQVlLV0x5OXpT?=
 =?utf-8?B?LzRyUng5UHZyTlAzUXdBSmtuSmlNZkRNUS84R05WWVpZbFVRT09DOTVpbDRk?=
 =?utf-8?B?eGRXSHFSc0dJU0ZDdlI3ZmhTWnplVW9kWjc3bU5qeTRnK2lkeWxueS9sU3RO?=
 =?utf-8?B?QVRDeGJORDIyYW9DL0JlNlc4cER1WFRBclh2RVhVN083dTZGWFB3dTlvR0ZD?=
 =?utf-8?B?K1owT3NPQk5IL2Y5c1N2RDk0eU42M2hGRWNXQ0kxYTlLdm5vUm9RSzF6em91?=
 =?utf-8?B?Rk5zK3ZRdXBFYTluL3RWWnlPdFZJcStZWkN6QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VpcmxnZnZwSWl3ZElBR0dzcUs5SjhoUTlwV21mNmlUNUtFTXRtdlc4b2Q3?=
 =?utf-8?B?V2thR1o4Q21id0ovSTJjaTZFZ09DMm01aW43WUtpa04zdmcvbGtTTVNjVG1i?=
 =?utf-8?B?VHZzUCtKWlQ5dlBhcUxFVUxmSVBjVHNWNHNXNjZKWDgxU3EvZ2gycVg0MzNK?=
 =?utf-8?B?T0J0cWRNUGN4eWpDb05WVmQwYStqUllHRkNyV2I1WE1xcFVoSmFJNk9KazN0?=
 =?utf-8?B?WEQwclRhMVc4cWMwYldVWWhUWDZRV1lwS29XaUtUclQ0UFZBeHh6NFllOVY5?=
 =?utf-8?B?bDFIUG5aNk9ZNi9mdDFuUHErTXJKM2hucTMwZkFhVkNEWU1SbDBrV2JjOC9I?=
 =?utf-8?B?S3JTUmVaYzFxUTVpZUo3WnVJdHduK0RabnJtQ1AvM0Q3anllMDV5a3ZtaExH?=
 =?utf-8?B?QUcvVnUzSzlmWWlhcHVCc21lUk4xL1FVdlRhVFZVam11Z2kzdWpuWEdHamc3?=
 =?utf-8?B?NGE0bzhZaEMvZ053OThjamVJUW84S2oyMys1cGpjcExyWDlKc24vV0ZFd1RT?=
 =?utf-8?B?cFZuc0taQSszS2p1SWM2SGFuenIreFlDSUlCb1VHOWFLZkZKYTNSSmUyZ1JT?=
 =?utf-8?B?cEk3aktia3Z6bUtuRUtXQlhvQ2VDS1VkUzNEc3hlUTRQcnI1TExoWnQvVVQ4?=
 =?utf-8?B?NzlBUnpIU1I0cCtOb1F1d1Z0aEpKUVdTYnRnOXJOSlpGYXo0ODlzcUpnbUxF?=
 =?utf-8?B?ZmtTYUNVaW5IajJmU0FSSDJJZzBWbnI3bXQxTzVMeFEzeWtkMi94eURkUkVT?=
 =?utf-8?B?Yyt0WmhEWTdzR2o4OGtKU3k3ZFhqS3FYbDRCenVMaGs1dWF1Y2tsVTlPS2pP?=
 =?utf-8?B?UXZ2L1dWQ0h0Zyt0T0R6Z2prekFrTTN5Rm1peXUyWjNzTlVHbFlqV01pUUlC?=
 =?utf-8?B?WXZaZ0wvZThQWEloSVZiV0JWWHVBQWJVdTVuWHBtQkZid1RpS0xtMmJYbmxR?=
 =?utf-8?B?eDZCUUJKVkc2dzFlTCtkUGJKTEg2NXE0K3Zid20xZFd2dGlyRTBQRlMzTE8r?=
 =?utf-8?B?VVhKeTZMNVVuaEJkd3J3eFFVMStOM1dnWVF3aWYwcTRVbWJCWGR5d0lqdmZH?=
 =?utf-8?B?RW8zQjlPZ3ZqOEJuRFlPQVBDWFVuTTZUbUFoQ2I1WmJzdFZYdlFvSFNONkNB?=
 =?utf-8?B?YmZoVE10N1pNMzhpRGtJZ2hSS2UzUzgvYnhjdEFZQ1FiZlU3eHI1aVNwdS9p?=
 =?utf-8?B?cnV5R3orcG1QbkZLUVFVSFF5eHdsWUV4WTBQMW9tKzRPaXl1amVuZlhCVzZI?=
 =?utf-8?B?U01XU0xBZitNTDMvUVFvRDI2b003OFp3WXdrVytwRUJkekN2aUlpQXoxdldt?=
 =?utf-8?B?RWlLL0xUMXc2dVNnald1WldtTUs2VCsrTGZiM1JNSnUwamdGeStCOFFhZGI1?=
 =?utf-8?B?N0NSdGg2Sm9lOGJ2SWNlLzAwS1loK3NsR0IyWHEvejhZbWphY0s5VVN0M2lN?=
 =?utf-8?B?dFRXOTgrTzFqbmZWcjdYUTZmZVNDbTJqeHNsNCt2R0xCMSs3WVB3eDBFdC82?=
 =?utf-8?B?YTNoekFhUU0wK0dvcE9wb0ZaQ2RvMlFwOUhZb0hjT05mZTRaUEtXNGJxTlNO?=
 =?utf-8?B?TzhvYTBLQ1lvd2FmZlpzdFp3K0tIT3lsR016Y1BaWEhRY1RmbEpDb0xTbGU0?=
 =?utf-8?B?NWdFR1FSTDY0QmsvY3hobTBNTGtRbjA1T3JuZllVaitIRDlueGIrbFVtVlJi?=
 =?utf-8?B?bGRqa2hXTzlSYlpUelptT3piTmJkSko3OGZVZ2lvbzJDc1hRclFmZ3ZpNUJ3?=
 =?utf-8?B?RStONUs3b3Q1cGJRenlja0x6b3RreTdFRi9NSFdNSy9CbHpZemNUVW5ONGdX?=
 =?utf-8?B?eHB0RzR4TktiMXJ1ZXk4T0tLcWZ2R1gvcFJ0V0tqaGUzazN6MHI2UkgyNEVY?=
 =?utf-8?B?Mzhud3J3NjFLNWpFNGFiZVoyL0UwVWFhMGdHSVlkR0FxRGo2eGJzbVd1bUVa?=
 =?utf-8?B?cFV2Vzk5SHkyWEdPSXpuVEZ3dHR6MUxGOHVrWVE4TS9qSkNXa0EwZjdyNGor?=
 =?utf-8?B?bE5tK3JQeWp3QXlSeTJIZUxHcUEwOUx3THR3ZnpTYkFSYW5NK2JvMGcyWjQ5?=
 =?utf-8?B?bkpsWm5OTUVsWXlkMUR6eWVUVUV2N2tsOFZRaTBkdVF0MDBOMjQzU0t2bWo2?=
 =?utf-8?Q?CLKkXSnF7uYqiJcb6atuaHdPs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9082e3-5a8a-4d85-ca70-08de153582dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:50.7756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UyqSThaDccaexPeYCDuSLQJDoRuGRMKUntua8K1aSTDkG+jLNZIjRXMhMGrYl5sRhJC/LyvVsprhdnPEFVqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432
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

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.  Drop the selection.
This is needed as a preparation for reading ExtDst source selection
when trying to disable CRTC at boot in an upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index c8cd15f9e32de4d86c2acb8764146af1c3663c1d..7ea305e81ad651d4f80a629a62075f80c5a25f58 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -203,7 +203,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
 
 void dc_ed_init(struct dc_ed *ed)
 {
-	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
 	dc_ed_pec_enable_shden(ed);
 	dc_ed_pec_poweron(ed);
 	dc_ed_pec_sync_mode_single(ed);

-- 
2.34.1

