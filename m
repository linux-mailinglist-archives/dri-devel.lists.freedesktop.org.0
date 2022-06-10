Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FD545A4E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 05:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD5411B263;
	Fri, 10 Jun 2022 03:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140088.outbound.protection.outlook.com [40.107.14.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FBB11B245
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 03:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFyLAZQaAEY++/N2fJiDlvrEjFK97o4cB7mUVHO9rfEG9IqpbruYSBETedSrX/qPJtSf/J6djkMLl7ubkwmpb1nAjaG/T3JkphMHiZL8yE6LYHiEO4PAa7MZs7GGwzJvTD1k1DOrSxV1iXc1zOFIdLqCoUlbJPyB2ft/l3FaGeAwC5vhz4fecz8HfEQF8eLOBwzpdp8HaInFunavGufN2bb64CQRdVIn3OO9AQsikxSHMO905oKFOVMpVQf++K20k4I8E0wc/qr2WSrSS1bcRfdql3H7gNuiw1NOVwuHFf8Esa0MgAWORv0KtvmDS5RWZB73PgfuqZq7UteMcvt32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgnpWHYk/ENVMxmftZhMZ6q5ncFWq0CHpFyKA0nyhM0=;
 b=JSqIyWya1s3naL6iVasuK4vgtNlVt/aQpifwlvZXa4HvS0yTLFjFl1AE1uCr4UxdH1goyqW/sPbwwcOrXLO98SPzwsSiEeh6CebJnfsx1FnK4JdnPgUCKkb3TqmkSH1lA2VvYM6uwjPqYqaqleQhiNfCy6ae/kF3SXdLgpqEMsrzPgltBBW1oVzo7swNoRuEgO1w9jzKlIuKbRytSlVQg33jEdrGW3kRCmUu3MacBPPejVUZtos6JlE3mXbA2RYcQcHnqADvEWy/xKfz+RLo3a3Zsql9cMeIWCRRa7XfHHvHAnG4ewi4l0mJrfojqaHsrPd0yA/VeyQdQPSGNCtFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgnpWHYk/ENVMxmftZhMZ6q5ncFWq0CHpFyKA0nyhM0=;
 b=ItQdjFJ3N3zPOIlF/iokvmMT3zURYd+pFd+CKxSK5ruEGbKuZmt7aEtGB+/EZKY1gmkC/PFVjVUdVmhz3wRy9X1PwXNGZ5ZsD/IWIhJ7ie4W76aIJKxsaGSNbqoGEo0P2YshlLuMv/uRXp41HfYgF7Ca8m/VKRLv6TBW2EE1Mvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8239.eurprd04.prod.outlook.com (2603:10a6:102:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 03:01:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 03:01:35 +0000
Message-ID: <9f86afed1282a5749f416b0e5b9a39a1f972017a.camel@nxp.com>
Subject: Re: (EXT) [PATCH v8 09/14] drm/bridge: imx: Add LDB driver helper
 support
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 10 Jun 2022 11:01:21 +0800
In-Reply-To: <4748166.31r3eYUQgx@steina-w>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <20220609064931.3068601-10-victor.liu@nxp.com>
 <4748166.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d251a1f-7eeb-47b4-1f8d-08da4a8d87bc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8239:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PAXPR04MB82392787644A05D941D5D7E698A69@PAXPR04MB8239.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bm6sITMcE8XZhDKsGUVt2yfXaVtXaron+HI6euZjfDLenxF7Or2npws/Jgjg1v+sfF9I+xfzmYgbGUTfjZY6JYeauKbcfLjyWdi640XUY0C9PNXripNWycyInHKzfCgFE33W9OtFrhIvfAi/+CekO4xxDkIUFby84bANeEvjKf3DKLyI967/fgEiy06rnfbwwEWHF2ajv0RpaSmUrVJZ9He9Puq89LF9805BCdTuro61VArxnvXN1OdUEKnb+wymvhyRQEsfFPcSqBVYvdYWwxngAPmAQAs0HD3ziqQEnEQFzJL1CFIRqlPhzShUnUWh3WuQIzkzC7+Dgu9ZAGsFd0awKN+DxdVya8mBDK+yK0ZZlgUuNmHPfjy0xgnaq4ZlHYkbYChuLWe5QDBH84igz5cZotj2teptSBFBVPCQzW6N1fAV3Wdm+CV5qug5Q8XPGIo0I1Dy1R5c5h+bA4onJRDGr9F+9Gc5YjUX6rXVrqfMFZEN9+T/DCPd33HpLp5yTZlt+mErOLk0GcH24moAUyG/maeRID+Q/tdep7hsoaPMmodVi/ZFaNwsUPfyspb2VtCDMq1YGycOwykSZflhR0AasouE1fEm9bayK8PLMXc3vCC0VeFae9QwFLHn2rsuyVZvLp/5d0FGdmlPPcI/Y5GivUlIOIBnbNbmpZbZmeqDtFERS6fx9gE2GNChT/8by3XJtYNWIuNoUjN3dqK9/fMBWrItlRFmYmoKHj5uIZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(6512007)(508600001)(7416002)(8936002)(966005)(6486002)(26005)(52116002)(186003)(5660300002)(6506007)(2616005)(86362001)(45080400002)(2906002)(66946007)(8676002)(66556008)(66476007)(83380400001)(36756003)(4326008)(38350700002)(38100700002)(316002)(6916009)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEJ5aXZjZnVGMWVEU3U1RUdsUkl4RkpVU2tha1Vsck1PS1E4TWxHQVQ0UkNJ?=
 =?utf-8?B?b3JpUDMrMlQzY0pseUx0Y0xEVzBlNEdvYStxZjE5NkQyZXFVOEpoc2dUcGNq?=
 =?utf-8?B?SXN6dVZSeFJFRTZqRVF3ajViZjJoZTdJWTJ2T1RZNnpBWmZUVVZKaS94R0Rv?=
 =?utf-8?B?ZlVvdEw0VzIvUWZUNWwyaWNLeFRBcU9tWDFQUU41UXpXNXVobE9tV2pPNFhB?=
 =?utf-8?B?QXZiRkNnM0ZoSmJNVXhMc2Q1R09CWlQzYjBGWm5YL216NDJQSDV5eG5FUmdk?=
 =?utf-8?B?TkgyZFJYTTJoQm1NamFoWEUyTENlS1lOd1g3YUJnOHBmbTdsVXV0VzJZNVIr?=
 =?utf-8?B?R2ttaUtlMDZVWDh4ZFJadUpkNjZJem0wSS9ScEVSWUc5Y0cyQ1ZWeEtMSEtt?=
 =?utf-8?B?S3RzQUJKb2FNUlVKL3IzSDRaSFQzOGhqZDhhL0dmRGNvdFBUVGFBMEhLdVpn?=
 =?utf-8?B?eUgxajRGaEZxZUJZREovQkRsZHZWQmFoSnFvUUVjNndvVTB0NTRtL3B4aFBM?=
 =?utf-8?B?dzh6d0dRUGpSb205bnZ2MmYreGE4anhyZFFlblEwWlpCcmFESktBbHI2cTdI?=
 =?utf-8?B?a0RIckdiTXJiR1BNdjNpcUtVb3NqbnhscHFTdGM0aGdXRnRqaGk2R0szRllE?=
 =?utf-8?B?QndGU3FQdUpkMWl0Rjk1NGdKc0Z6K2p5S2VQSStrQ0UrOTcwUC8xRTlFL3pp?=
 =?utf-8?B?bW9IQ0JsSmt3VXNFcDFZK3p2MFFIVXJYTE16eWtuV0RnaFFTKzhaTWtrUFhJ?=
 =?utf-8?B?MFppSDZ6ZVNPSXR1TGFIbExqV2k3VWtWRVBGYkUxUkVQcjB2VWtKNy9UdUV0?=
 =?utf-8?B?d3UvbGY3TnF4eWRRc3hyaG5WS2xWcE9ubmZzQnFkUDl1MWQrdWZVVVk5dUJK?=
 =?utf-8?B?MUo5K2dkV0ttSmVlNS9COXZtMW8wODJiV3EvcDBUb002elFGQ21LTEU3R1V6?=
 =?utf-8?B?MldBSVBwcVk4Njh6Y2FUTCtwa0k1c2hSZEpwUHRSc2V5djVtbXN6Y2lOUzF1?=
 =?utf-8?B?YWYxREwyV2ZFWjh2UWNXS0hrZndmMGNmMkUxMXlmZGlMWlFocVB4Z2FobEJN?=
 =?utf-8?B?MW9FamVHRko3emNPdXQvcGRSdUpmTUJSSHlweVdNRG9HZ0kwZUdHbFFCSDU5?=
 =?utf-8?B?REdBU2pZQzduK2ozbXN3WnZ3NHVXamxSaCtqdTNVNDBzMklDNTYveTJBU3gw?=
 =?utf-8?B?ZnhOYU1ZMi90Q1FCdldvTlJuR3NQMmlhbkE3TjRhUmIrZ1VUcnJVMkduMWFp?=
 =?utf-8?B?NWVIN0EzRDljK3BSVVR6Y2ZlQ3pDbGFnTjZ2NnR5Z0RGVDZVUG5CWEt4WXpR?=
 =?utf-8?B?OStKQ25XR2NNcGZpZ3Q3RlVSMnk3NzQvdkg3dklGR3dlWm93WVNvb2NJRURG?=
 =?utf-8?B?b1IyVHB0VVV1ZEVRWGZ5WDR0VStwcndNYUhXekh1NDJXcFhhWE1aNGVWcE5r?=
 =?utf-8?B?QngrQjhKdEYyVHVRNC9LN2lZY3gvMTZodm9xc2RjM1AyNEt6OEZMem5jMmh3?=
 =?utf-8?B?Y2l5SEQ2SC9UcmlqT2UxTHRzUlVQeW0xdzhzeWxFbExuQkt4KzlrY05OOXUx?=
 =?utf-8?B?VGd6ZUw1MjdRR1RiNHRPc1Q4bkpnVTFzcHR0NnM0NStIaE9XYytqcGVXR2Jv?=
 =?utf-8?B?YVZiOFpGNitIOGVFWlM2eDlqVFpoK1dJaUk5c3I1dFdNSnd4TkE0a1hIZkVs?=
 =?utf-8?B?S0NIYjNQbEs1N0tQZE5MV1cxaXIzT1pyT2hRTUI1Ky94Vk8yMVgxaFB3VGJh?=
 =?utf-8?B?ZDRPZlU0ekZwTUYyeTd0QWR4VGE5ZGpPUDlqV21nTmxPY1c3cWxKVkdWTzZ1?=
 =?utf-8?B?SUFIYjAxbWVTR080SGpjZ2dhZWpWOXUvbGtFWFdjNTJJclBaNmlvam9TNkJm?=
 =?utf-8?B?bklxZzFrcmdSTlhMWitWQnFuVHE2N1R4QUFXSnhmN1pxZ01vcnVCWWQ1a1Yv?=
 =?utf-8?B?djh3V1EweTJLT0pnSnpub0N4ZzZqT3R1YTRPUlZlSFlLZlBxNUdYM3dOMU1l?=
 =?utf-8?B?VlpVakplRk5DV1hZaFZYMGY2cGdRVElWUGtHajVRbURPNlFnZ1BxNSsyV0pN?=
 =?utf-8?B?WTg4cVRBbkVUczlrSkFPaU8rQURVcVFlelc2a1JScVNtNXdST2thdTArMjU5?=
 =?utf-8?B?Y3h3b3kzQjFOaUF4cFFRRmhacy9kM25RMFVqblgrZ0pURXlaVmFQc3p3NmE3?=
 =?utf-8?B?dFRMS1FPb0xQa20yL1J3U0FYbEI1ZlpMOHAvNCtsV1ZoUjJnVTA1bmQzRzFy?=
 =?utf-8?B?d1RUY1pxWlJET1VCcFE1ZXRWcVB1emNJcTlRN3JZcGF5a291Wkl3MnFGaTBG?=
 =?utf-8?B?YlJSVGhYRGxGeVF0RG9NZm9OdEpNQU5WV216RVp0WkE1TVZUY2tJQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d251a1f-7eeb-47b4-1f8d-08da4a8d87bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 03:01:35.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA+EVQhxm7SQRqtoqwcb06i4w+EuOvC4mTGa00pvR4WQlAWrbJ9LfISape5h2Y1klHTiC+AyfbTQZftRpioSnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8239
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-09 at 09:47 +0200, Alexander Stein wrote:
> Am Donnerstag, 9. Juni 2022, 08:49:26 CEST schrieb Liu Ying:
> > This patch adds a helper to support LDB drm bridge drivers for
> > i.MX SoCs.  Helper functions supported by this helper should
> > implement common logics for all LDB modules embedded in i.MX SoCs.
> > 
> > Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri
> > iMX8X,
> > LT170410-2WHC, LP156WF1 Reviewed-by: Robert Foss <
> > robert.foss@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> 
> Hi,

Hi,

> 
> reading this I got reminded of fsl-ldb [1], which is accepted
> already. At a 
> first glance reading the RM the LDB peripheral are similar, although
> not 
> identical. Is it worth merging them into one driver (at some point)?

fsl-ldb is for i.MX8mp LDB. It couples the lvds phy(LVDS_CTRL register)
with LDB(LDB_CTRL register) hardly.

Eventually, I think there would be separate LDB bridge drivers for
i.MX8mp/qxp/qm LDBs, as they are far or less different(LVDS PHY IPs,
clocks, ways of dual link usage...). So, maybe, the question is that
can fsl-ldb use this LDB helper driver. AFAICS, the different DT
bindings between i.MX8mp LDB and i.MX8qxp/qm LDB make this difficult. 
This LDB helper takes each LDB child node(channel node) of i.MX8qxp/qm
as a bridge, while i.MX8mp LDB bindings put input and output ports in
'ports' node.  Like i.MX8qxp/qm LDB, i.MX6 LDB
binding(Documentation/devicetree/bindings/display/imx/ldb.txt) also
uses 'channel' nodes, though i.MX6 LDB has a separate encoder driver.
I think the 'channel' node better reflects HW design.
So, maybe, fsl-ldb for i.MX8mp won't use this LDB helper.

Regards,
Liu Ying

> 
> Best regards,
> Alexander
> 
> [1] 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20220426193645.244792-2-marex%40denx.de&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Ca4ee326b3f314cf48a3408da49ec5a33%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637903576722519563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=yJhovCeB7Dx2eWJqKohZskA7fX3NLwqmW1GxeQlDe40%3D&amp;reserved=0
> 
> > Marcel, I add your T-b tag from v6, let me know if you want me to
> > drop it,
> > as the checkpatch fix in v7 and the rebase in v8 are trivial.
> > 
> > v7->v8:
> > * Use devm_drm_of_get_bridge() due to the rebase upon v5.19-rc1.
> > 
> > v6->v7:
> > * Fix below complaints from 'checkpatch.pl --strict'. (Robert)
> >    - 'Alignment should match open parenthesis'
> >    - 'Prefer using the BIT macro'
> > * Add Marcel's T-b tag.
> > * Add Robert's R-b tag.
> > 
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * Make imx-ldb-helper be a pure object to be linked with i.MX8qxp
> > LDB bridge
> > driver and i.MX8qm LDB bridge driver. (Robert)
> > * Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-
> > helper.h'.
> >   (Robert)
> > * s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Call syscon_node_to_regmap() to get regmap instead of
> >   syscon_regmap_lookup_by_phandle().
> > 
> > v1->v2:
> > * No change.
> > 
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 220
> > ++++++++++++++++++++
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  96 +++++++++
> >  2 files changed, 316 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c new file mode 100644
> > index 000000000000..e85eb9ab5947
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> > + * Copyright 2019,2020,2022 NXP
> > + */
> > +
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "imx-ldb-helper.h"
> > +
> > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> > +{
> > +	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> > +}
> > +
> > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> > +{
> > +	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> > +	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> > +}
> > +
> > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > +				   struct drm_bridge_state 
> 
> *bridge_state,
> > +				   struct drm_crtc_state 
> 
> *crtc_state,
> > +				   struct drm_connector_state 
> 
> *conn_state)
> > +{
> > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > +
> > +	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> > +	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> > +
> > +	return 0;
> > +}
> > +
> > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > +				const struct drm_display_mode 
> 
> *mode,
> > +				const struct drm_display_mode 
> 
> *adjusted_mode)
> > +{
> > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > +	struct ldb *ldb = ldb_ch->ldb;
> > +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> > +
> > +	if (is_split)
> > +		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> > +
> > +	switch (ldb_ch->out_bus_format) {
> > +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		if (ldb_ch->chno == 0 || is_split)
> > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> > +		if (ldb_ch->chno == 1 || is_split)
> > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +		if (ldb_ch->chno == 0 || is_split)
> > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> > +					 LDB_BIT_MAP_CH0_JEIDA;
> > +		if (ldb_ch->chno == 1 || is_split)
> > +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> > +					 LDB_BIT_MAP_CH1_JEIDA;
> > +		break;
> > +	}
> > +}
> > +
> > +void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> > +{
> > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > +	struct ldb *ldb = ldb_ch->ldb;
> > +
> > +	/*
> > +	 * Platform specific bridge drivers should set ldb_ctrl
> > properly
> > +	 * for the enablement, so just write the ctrl_reg here.
> > +	 */
> > +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > +}
> > +
> > +void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> > +{
> > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > +	struct ldb *ldb = ldb_ch->ldb;
> > +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> > +
> > +	if (ldb_ch->chno == 0 || is_split)
> > +		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> > +	if (ldb_ch->chno == 1 || is_split)
> > +		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> > +
> > +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > +}
> > +
> > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > +			     enum drm_bridge_attach_flags flags)
> > +{
> > +	struct ldb_channel *ldb_ch = bridge->driver_private;
> > +	struct ldb *ldb = ldb_ch->ldb;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		DRM_DEV_ERROR(ldb->dev,
> > +			      "do not support creating a 
> 
> drm_connector\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!bridge->encoder) {
> > +		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return drm_bridge_attach(bridge->encoder,
> > +				ldb_ch->next_bridge, bridge,
> > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +int ldb_init_helper(struct ldb *ldb)
> > +{
> > +	struct device *dev = ldb->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *child;
> > +	int ret;
> > +	u32 i;
> > +
> > +	ldb->regmap = syscon_node_to_regmap(np->parent);
> > +	if (IS_ERR(ldb->regmap)) {
> > +		ret = PTR_ERR(ldb->regmap);
> > +		if (ret != -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev, "failed to get regmap: 
> 
> %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	for_each_available_child_of_node(np, child) {
> > +		struct ldb_channel *ldb_ch;
> > +
> > +		ret = of_property_read_u32(child, "reg", &i);
> > +		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> > +			ret = -EINVAL;
> > +			DRM_DEV_ERROR(dev,
> > +				      "invalid channel node 
> 
> address: %u\n", i);
> > +			of_node_put(child);
> > +			return ret;
> > +		}
> > +
> > +		ldb_ch = ldb->channel[i];
> > +		ldb_ch->ldb = ldb;
> > +		ldb_ch->chno = i;
> > +		ldb_ch->is_available = true;
> > +		ldb_ch->np = child;
> > +
> > +		ldb->available_ch_cnt++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int ldb_find_next_bridge_helper(struct ldb *ldb)
> > +{
> > +	struct device *dev = ldb->dev;
> > +	struct ldb_channel *ldb_ch;
> > +	int ret, i;
> > +
> > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +		ldb_ch = ldb->channel[i];
> > +
> > +		if (!ldb_ch->is_available)
> > +			continue;
> > +
> > +		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, 
> 
> ldb_ch->np,
> > +							     
> 
> 1, 0);
> > +		if (IS_ERR(ldb_ch->next_bridge)) {
> > +			ret = PTR_ERR(ldb_ch->next_bridge);
> > +			if (ret != -EPROBE_DEFER)
> > +				DRM_DEV_ERROR(dev,
> > +					      "failed to get 
> 
> next bridge: %d\n",
> > +					      ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void ldb_add_bridge_helper(struct ldb *ldb,
> > +			   const struct drm_bridge_funcs 
> 
> *bridge_funcs)
> > +{
> > +	struct ldb_channel *ldb_ch;
> > +	int i;
> > +
> > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +		ldb_ch = ldb->channel[i];
> > +
> > +		if (!ldb_ch->is_available)
> > +			continue;
> > +
> > +		ldb_ch->bridge.driver_private = ldb_ch;
> > +		ldb_ch->bridge.funcs = bridge_funcs;
> > +		ldb_ch->bridge.of_node = ldb_ch->np;
> > +
> > +		drm_bridge_add(&ldb_ch->bridge);
> > +	}
> > +}
> > +
> > +void ldb_remove_bridge_helper(struct ldb *ldb)
> > +{
> > +	struct ldb_channel *ldb_ch;
> > +	int i;
> > +
> > +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +		ldb_ch = ldb->channel[i];
> > +
> > +		if (!ldb_ch->is_available)
> > +			continue;
> > +
> > +		drm_bridge_remove(&ldb_ch->bridge);
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h new file mode 100644
> > index 000000000000..a0a5cde27fbc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> > @@ -0,0 +1,96 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +
> > +/*
> > + * Copyright 2019,2020,2022 NXP
> > + */
> > +
> > +#ifndef __IMX_LDB_HELPER__
> > +#define __IMX_LDB_HELPER__
> > +
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_modeset_helper_vtables.h>
> > +
> > +#define LDB_CH0_MODE_EN_TO_DI0		BIT(0)
> > +#define LDB_CH0_MODE_EN_TO_DI1		(3 << 0)
> > +#define LDB_CH0_MODE_EN_MASK		(3 << 0)
> > +#define LDB_CH1_MODE_EN_TO_DI0		BIT(2)
> > +#define LDB_CH1_MODE_EN_TO_DI1		(3 << 2)
> > +#define LDB_CH1_MODE_EN_MASK		(3 << 2)
> > +#define LDB_SPLIT_MODE_EN		BIT(4)
> > +#define LDB_DATA_WIDTH_CH0_24		BIT(5)
> > +#define LDB_BIT_MAP_CH0_JEIDA		BIT(6)
> > +#define LDB_DATA_WIDTH_CH1_24		BIT(7)
> > +#define LDB_BIT_MAP_CH1_JEIDA		BIT(8)
> > +#define LDB_DI0_VS_POL_ACT_LOW		BIT(9)
> > +#define LDB_DI1_VS_POL_ACT_LOW		BIT(10)
> > +
> > +#define MAX_LDB_CHAN_NUM		2
> > +
> > +enum ldb_channel_link_type {
> > +	LDB_CH_SINGLE_LINK,
> > +	LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
> > +	LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
> > +};
> > +
> > +struct ldb;
> > +
> > +struct ldb_channel {
> > +	struct ldb *ldb;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct device_node *np;
> > +	u32 chno;
> > +	bool is_available;
> > +	u32 in_bus_format;
> > +	u32 out_bus_format;
> > +	enum ldb_channel_link_type link_type;
> > +};
> > +
> > +struct ldb {
> > +	struct regmap *regmap;
> > +	struct device *dev;
> > +	struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
> > +	unsigned int ctrl_reg;
> > +	u32 ldb_ctrl;
> > +	unsigned int available_ch_cnt;
> > +};
> > +
> > +#define bridge_to_ldb_ch(b)	container_of(b, struct
> > ldb_channel, bridge)
> > +
> > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> > +
> > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > +				   struct drm_bridge_state 
> 
> *bridge_state,
> > +				   struct drm_crtc_state 
> 
> *crtc_state,
> > +				   struct drm_connector_state 
> 
> *conn_state);
> > +
> > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > +				const struct drm_display_mode 
> 
> *mode,
> > +				const struct drm_display_mode 
> 
> *adjusted_mode);
> > +
> > +void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> > +
> > +void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> > +
> > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > +			     enum drm_bridge_attach_flags flags);
> > +
> > +int ldb_init_helper(struct ldb *ldb);
> > +
> > +int ldb_find_next_bridge_helper(struct ldb *ldb);
> > +
> > +void ldb_add_bridge_helper(struct ldb *ldb,
> > +			   const struct drm_bridge_funcs 
> 
> *bridge_funcs);
> > +
> > +void ldb_remove_bridge_helper(struct ldb *ldb);
> > +
> > +#endif /* __IMX_LDB_HELPER__ */
> 
> 
> 
> 

