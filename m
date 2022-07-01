Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33D5629E1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5210F487;
	Fri,  1 Jul 2022 03:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C9610F400
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbO2iSO12ejo+ptxpLu9lg330w3Kcui+agH/q0RpLXrQI98sELznT/6j3K+iy4O4T8jvcSl72edWNiptUyEhNyDlOWzr53WE6uh7Fd2vlFifFrxVMXa5tnj09MDlaN4C1kMGx4HU4ETdjOWJd718rXS8l9i05vd8VVFzPD2z46+4+n1KZsBZJwaUbrcrgTlUntuv4Q2bzGLUaJlN6VKdB7TpLGIC8gO5/WvDrsLZwnbQrdhkUc2O3t9Gq/2UzM5IU6j9mimgpGZWZV0yJz7rk7HNLbtV6gXDvZ5XK5ElWzxJdwCJjL0xbdmshdlCLLsjmyemA3ZRBWrMPCMYSpx5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oop1wcm+cfEC0icJ1pSfZ+ann1RBEeErX/h5yzTxyWg=;
 b=ZUD5yNzNjrGNVhfY62hBGt/mKt/CS8Qm6g/X80LBLtAAEsdtMqCKRozaxsAmLkqloSAwp+U9wNKHCEp82mQ3KcN1qewaVVOD2r1dNvVQje/cijl8jAb9JgjYO0SgOOywJSEt/99Sz+HXOSIEhS0+DmAqxBgT4+kWUW1SpbGglxHsL1CAuWK9Zth0pJ2Bw350wUa6x4MLpLrE877eQISJ0h/mLD7jdH5W86EAujuk+b8Vt4w27JiWUhrmrPtFiSQCzrbwICubyTkuxVCD58vprH/bBJTpFpWqI/76sfWDEE/LdycITOlp64J0eD6cz/iUx/i5hxxi2veD6Ip6MW9bPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oop1wcm+cfEC0icJ1pSfZ+ann1RBEeErX/h5yzTxyWg=;
 b=H6evaSN/LWa3lDmLSjBGWh8lfZtgePX/00jx9T7pB3PG629jth/HKD8nVdJKeSi6jEfZfPRC31WM/LRu2DCYGwtLcRvuuXmLG/zVTQAdJ0tG3FXvD02Y5BeU3hYKCYvb0M3M81XiU4u9G8U+C2K2me119eOKShR0Q3Mblvb7kdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 03:58:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 03:58:52 +0000
Message-ID: <50c4518ed036ff8499441c7fbae9828d001b95bd.camel@nxp.com>
Subject: Re: [PATCH 3/4] drm/lcdif: Clean up debug prints and comments
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 01 Jul 2022 11:58:14 +0800
In-Reply-To: <20220630205728.128127-3-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
 <20220630205728.128127-3-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b118af-8d4b-40e5-9316-08da5b160307
X-MS-TrafficTypeDiagnostic: PAXPR04MB9122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkEhz80A46W3ieMsNUii55yRpg5nkVpf+1Zfvs8gp1gieO3K6Od9cNf+0LeZIJobvD0VKaNxIefKzQ7uoxh+UIJgeLba1AzVq8225gLVeCxgfc/1PaLjz3oDwzGuPq1m0SFpCXfGXr79o1iZO6DlTKIxZ51qx9XGhBt50L+6VcBRHCfD/WaLm+764JVXfXFeFLwwqGViv+OXa7SO392K7Nq8TCB7m6m3U/ax9EfdWgL6wn2QT9CqUAzrJ/Vkt3egKvw4kBp3SCUmJFDSdM2DU2M8kGPbouMbttNcIbuWqBH7X09j2IL8ltyd5nx7GXejjz7gUBDoPizOTvE+IIx4ByBvC2ssOLIkste5hRk3kdI5bpNhtmJ00y/tDk5PtxegfGhIX6ACBoWlaMTkdkEzdGlHoRAmn2b4t5LKmWrp8KlyK1eKFTDv9gmC2kdB7CNYalrtb1Ejb9J0500VMclEoMDlwB12Itmq12DwwY+dZTmniCBRD2ufDv2rk4RAlQoNldpxvmPGktoF0LMqMvWab8piTw43lqUFbooIjv+c0s3BI2mhiievHFE2gRLAkesl7DWotc/TW+hEuuDgyp5I9MQ58JDRTJLWc5OqhdgBZ41mbPXI0ylNhVmO7lCHXgOt+Qo7uAdvccVlRDp6K9hYkXqN2TuijSlWHbValhQ+tfrHrcW7vAwZUKu7cH6rXBqTGVxTgKlUOv0Mt5KOah+k5m8ipG28dCkiDIfVhAABlyMhVFfDkhsJEyAoPQH1B6DEn1GzIStuoEQeTHwX1mQ1wP/XQIYooMLN+jE7s/5iiF6LeaaJ3mdMF0NrCcrUiRaQJ6HBmRuGTFmbru8TyE1JdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(54906003)(316002)(4326008)(36756003)(38100700002)(86362001)(6666004)(2906002)(5660300002)(41300700001)(186003)(26005)(52116002)(83380400001)(2616005)(4744005)(38350700002)(6512007)(8676002)(66946007)(8936002)(66556008)(478600001)(6506007)(6486002)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFJcHE0eVR2cXlSc2NEeVRCS2ZMaFVOM3hLdzM1QWRZN3JiT3RWbXBMQVYx?=
 =?utf-8?B?RjRTelpCS3RFQXJzSGxHWUFoMVM3WEN3N0Rtdk9JaldudHZsdmlrK3BDSE1O?=
 =?utf-8?B?ZWtZdVA4T0VRRDRkWlJaU1h0YUVRaDhXR2tpaFRyQXBzKzR0RGtTRjA0b3NC?=
 =?utf-8?B?MExuT3ZBZWx6anFoWFNpL3cwV2RYbXFsK0p2cEhGRlZaQy9GT2ZRQ0ZKaDd3?=
 =?utf-8?B?Z0ZVbTN0dG9TRXBzYlFyYm9RYytGWk1FNzQxdWNpS01RQnJqdDE5c2x1bFlT?=
 =?utf-8?B?cE94QkpwQ3c5RVpMQzFzaHFSNS9qUlVxZkkrNWVRWXdWTWlSbys4d2FMZ2Yr?=
 =?utf-8?B?ZlNLVkpscDRxREk4YzNrdXg0TEhVTDJYdVNEZCt6UHpReGw0L3F3SjN6NS9s?=
 =?utf-8?B?S0REYVJKeEllYjM2bTkyUVFpeEdiUHNQQlMvaHJLeFVGQnU2dEo0clpZMlNN?=
 =?utf-8?B?Wi9nNk9ob0llYVNXYWpnR1I2N1FTUGMzWk04MlY0QnJYMU44YldQZDZpY2xu?=
 =?utf-8?B?by9jVDNVN3owak5zM042UUpXMGhVdmcvK0ZMRllOUlU2QmxGWElwbkVBSzVs?=
 =?utf-8?B?U09aY3U1TTdxM1hZTW04RnFCKzVLcGdIZE00blVtNzJzT0pITG5LemNaRFhy?=
 =?utf-8?B?cHZaM2c5bHJEOFRYMytKT0FaTG9KQVVQU2JKd0JVMURjN0hmYTNiWC80OVdj?=
 =?utf-8?B?Ynh0MGF1WUpCQzAxdW96ZzNNdzRGT0UzWEI1ZXRnZ0tHYXY5aUxZUHF4b25M?=
 =?utf-8?B?YnkxM0JHWkI2MEppOTVpa1FDZnBXZ2ZlYUlKOWw0VmM3VUhzOTRuNjdCVDhv?=
 =?utf-8?B?RnZEQWdPcHZlU3VPanA1SmlBaTY4OUR3Uks2UU5XR2RGa3lsM3NDRmQwTFZ3?=
 =?utf-8?B?WWRKOVJ1ZkNzSTVUa2ZQOS9wT25TWFlBa2EwUVlmNWFxSlhJRkp5QTljOXNm?=
 =?utf-8?B?NUsycjhad0U2OTJvc1FuRzVMK1V4L24rUFlqREZrREl4eUR6bnpGNmtEUnBX?=
 =?utf-8?B?TFp1NHpjQXpoNzFSNFFhUGswMDk0c28vUmpZeURwR0prb292anJySkN5NUdG?=
 =?utf-8?B?ckxOVzRpcTYvZHl6R1lmZlNEditPejZWRXJhb29MSkZndk03TmlScnE0Z3Nz?=
 =?utf-8?B?cW5tSk9henNSSHJ3bTkxWm5qUVZrZlpRd3pobG45akJPNkRKdzBGQU5kem1m?=
 =?utf-8?B?ZmZaZWV5bVdML2NFSzBUYmkvWlJZekhTRC9LSG5yRUE3aFIwMWY5eThRa3ZM?=
 =?utf-8?B?TjRSWnVXcWI1MytsWW0vekNRa3BTcUlPbkd3emxjMHYxbSt5SGJQK2t5dU00?=
 =?utf-8?B?MWNNZ05MTS9KeFErUGprS3R0aVE2MDhudW9EeUlQUFJWRTBTelV6R3FpZ2tP?=
 =?utf-8?B?QUg4cW96VlBBQWpkaDRTZU1xR2l3bm1tL1RQUkRBMEIvd2FLK1cwa20xMjEy?=
 =?utf-8?B?R1ZFM3N6ZGtyekVTS1Z1WHNRWDRlMlBSZy9OOFpmY1hWQkR6M0RPQVlvd2ky?=
 =?utf-8?B?SVZLNjVtREQxdFQ0TEJzMVFGaEJ5NUxIcDhrTUIwNm5lVitJMkpHVnFhTFhR?=
 =?utf-8?B?OWlRYURVSHl3ODhheG9QMm1PUHA5OUswV2d1b3d6OG1FZFN0dytoZFl4eVd4?=
 =?utf-8?B?RjNGaGtCaFZGVmFOZVNYNzZKUHgvTjlaMUplTzUrU1ZyUXE1UFQydWRYaW5X?=
 =?utf-8?B?bzlJUGpMQlVBeWhYQW9VbXV2UFBVa1hNUTEyd0FralE0Y3VIc1JRZ2xITkFz?=
 =?utf-8?B?bEJQSVBodzYvcUlROXo2bDBTd3FVUHZyWEw3c0JBbyt1OHl5cDE5MmhrRm1K?=
 =?utf-8?B?WVNXYlVoK1VJRWZvTHFGVnE4VGhKSTlqUStZc1I2VTlGbFZxYkFlbUF0cUMv?=
 =?utf-8?B?SXcrRTI1cERjZ1JORGRNbkZSYkZjQy9MNVI1eGFjak16VWs3WGwrOWg1MVY4?=
 =?utf-8?B?c0ljNmYyKzQzZnFCS2c0eXFHaHdiZmNMOFZnZzJibkJXMUVHT3pHM25SSXRK?=
 =?utf-8?B?K2VNMkwya1hZQTlTQmxnSFF3aklFUWJvUElycUJxWWl4Mm50U1hEYTNiUUlK?=
 =?utf-8?B?eDJ3T201bTlQSVZKcm41em50UXgvalVVTGU4bUdnWlBTVTI1SkJCT0ErS2lh?=
 =?utf-8?Q?feyqVvCruHy1Hn6WP/miEUM6x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b118af-8d4b-40e5-9316-08da5b160307
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 03:58:52.5676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mxnxPvs3nFPpyWmkdOS9ngKi86flzv9HXJUH4FIzjj3MlOKS2/e+9AtO0OIvV9TpBr0yu6gZtaDwsXfvpPonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9122
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 robert.foss@linaro.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-30 at 22:57 +0200, Marek Vasut wrote:
> Update debug print to report bridge timings over connector ones.
> Drop missed comment commit from mxsfb.
> 
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

If you want to add my 'Reported-by: Liu Ying <victor.liu@oss.nxp.com>'
tag, you may add it.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

