Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C167C2AE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 03:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69C810E8DC;
	Thu, 26 Jan 2023 02:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2B310E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 02:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFS8aOY9zU//5O6W4GsIbnMFH8/j6Chk9RLbySsl7a9NsFOK7tpK8DaBuG0fofaFc2X/UVIb3ku1sR7P3ABrjKlM7NrKiGD/geruFa5BgA7eADp3jgNl6knuJAguJ5Sh4KLLe+9U48KcZD3a9n1frSQPvrCMFwOYMI8IeqLy61P3viku2GL73upoDuHEw4xt/CJfIHXpGC3IAczEXNppmGX6J2ODWvbN8hWQ/8JLZG/AE/TzfyRg9kofHb2S0FF60jd2VXwlPzHrmDFKrACBYjHodRHOLS4W0NL+QJJnRpOlZYvdRYwh9/Yhg9UfovR/IKt4Kw6oqYzIkkD2r1gspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU0HEr3pTl30H+0RTZ6Cv/Ef0Ufwl6G4Z1yjIy18Oao=;
 b=XX/4ZkHLhfKL06HbhiLf07AEKgCxX0Uo1IxykIQzKBWuabztTE6PJjM1qbi/xsiVZdn3PnT8n46uPCDm/5l5UPJ9mIZQZL6HCCi0+iVox0x7dlgkBCDENLTfXSwezYTac+FYtj/4k4EnyZiTKiJl+62d9XGIQF7UUatE75iGShyTJvLEDLUeUDMJ9RMZX8L1CWjllVFEngzcSQ89yEi2doWdtJwY2SxIVTa8ggxDF6SsZ3O3sHRYdb2isPtB75FmPathyu7Mz+M5DJ18cog0It6flXQaxwR5RBSeWeRKLjePgpcOa5QeCHzzSv2DIcZRCbNY9Tac5bNve2oEG6dOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU0HEr3pTl30H+0RTZ6Cv/Ef0Ufwl6G4Z1yjIy18Oao=;
 b=FeVUCQuoAJzqley7wA7CxjwDJvMnr8XnIf61RSUbXvYFOPI4e/7Eh4I+EMOvSmoqVoH3LVyS98vc3sfbk57bNbw+QNfFOFXUewV946+pUEyaWGPtJp9z4KaCegHGEUa9TrVA3VOEEVJR/f1LgbiaDeOG2rUIxjYRLUrQuE0qo4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9404.eurprd04.prod.outlook.com (2603:10a6:10:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 02:11:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Thu, 26 Jan 2023
 02:11:12 +0000
Message-ID: <4ec549dcec8686b9d1eed619965fde0b17736f17.camel@nxp.com>
Subject: Re: [PATCH v2 2/6] drm: lcdif: Drop unnecessary NULL pointer check
 on lcdif->bridge
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Thu, 26 Jan 2023 10:10:38 +0800
In-Reply-To: <d035621a-33a6-ca38-1bb3-726b3dd0eab4@denx.de>
References: <20230125064030.1222121-1-victor.liu@nxp.com>
 <20230125064030.1222121-3-victor.liu@nxp.com>
 <d035621a-33a6-ca38-1bb3-726b3dd0eab4@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 8019d23d-c4af-4a5a-d9aa-08daff429893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3ZNBKI9kCJWoMltPi6uLaKe5AhQOVmjk8ErDbWgdBayY04WdQibYObHxa7h2q4wzaU7gzMU+d5r8xi3IJJcR2dd1KvNmQnWkvJukFsjqqC7qnBvM2Qc+NAH8LrFXMUJVnlCrJ78D1lCB5FOsvped0gxUtU+BOwaJ/l9pvLeuI0RvoT2t/VykeX+CqZ5tn1pt8o7qFK/PJ0MIK1jwsHY6Vva7FNHB2oIG7fhv+uyIAcODiGz4BLqkyIjijvz8egfCpYLWIgMcXmGUojsjCtnhtK81pY4oJN8JrTu4SUXyfCWhx+Asrj8biBBQR2/13MqzAemYbO5C0KLSaTcHFkbVpsGLQcTcKVuzmBDYL3Kk9p4xHmhnH+bHP7r/qMiLEIYfzq4nhbKUu5xGVPaagZpt179CDJ9g4oRfvTqEvAv63jgBf2apR1k/lt8jfEfBj4G/T3hbGtKfLkfTgHBOTBUZaL8zL43tGnb6szexv2Pb6uZ4XK23rWsncAhqAxMjqkBDumdazo0v8PaSiTTpvHqTa7zccaWoG4zCVHAX72QF4zjKVPiS+Gvzznv7B4uPekQQPDEWNA3bzeHLo5GeCYpwfJUreiot4Gcq8/poXbQ9xfUua1ebpMmIYWI3bQkvYUrPOFb4WsA149puAJRzEvIXjXyl/mIvy0iJJAZRJH3LOlHa2sR7SK9lyj4x2DxLAcnhpHoSJwYcGjTmnFOVAvw8S9qbykqKEBykFXXSCj2ltI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199018)(41300700001)(86362001)(2906002)(36756003)(38350700002)(8936002)(5660300002)(38100700002)(4326008)(7416002)(66476007)(6486002)(478600001)(52116002)(26005)(8676002)(186003)(66946007)(316002)(53546011)(4744005)(6666004)(66556008)(6512007)(2616005)(6506007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JHek10SkoxbFFlaXpkVE1kNzF5UUxiNnREc1lqUXQwb3h1ZFpBckZUNEtG?=
 =?utf-8?B?cmNXcDFxSUo2TlpEbmljMjN0N21NcFk3N0JZY2kybTgvLzVKamNVZitLSUlp?=
 =?utf-8?B?WmNHT2VENEh1ZXZ1K2s2RnFrSkdnOC9ydnJWSnFLbko5UGJCVmF4STRlY3RJ?=
 =?utf-8?B?T2d5K3NFL0drVGFrMnNLQnY2NWNsUWZaSHlhV1hVWk1ZdjhVMFBVaEJUR0c3?=
 =?utf-8?B?ZUxqNFJtUTI5TXVNZGs4Y1dVWlZla0drSDcyOUdxTnpJNFBhZTdaRklBeGto?=
 =?utf-8?B?T24vWVBCcGxsN21RNE1BbjFoWU1HY0JMOEdqei9wMUk5RmtkbW1HeTBDUWdE?=
 =?utf-8?B?anpicWZSRlNjZ0RaVHM0YnN3V3dQUmtVWVk1QkJBYzhZNDYzMmhLWkhqTEtl?=
 =?utf-8?B?ZXhhQlZOdDY3VnN1NkRBVytYenZ0OFZKSXFkc0c0Y05xNmRhR1lLRVNHQzZK?=
 =?utf-8?B?RTRITHZCRVR0YmY4aDBaem1pOUpsQ3dndGl2U3c4aStCWlJWTE1QQzh0Rjl5?=
 =?utf-8?B?T1VYWWJtb2xkNHBWTTM3K0M5MWlVZG53WHB2L0lLYll2UHErUGFuOHdLVk4z?=
 =?utf-8?B?NjF3V2xGMWs3VVB2TmhGU1RpUUdvSWJCMmxSUE1LS0puL1lPbS9vV0tOL3Nz?=
 =?utf-8?B?RGtwUi9rU082dGM1YmltZ0M3YnY3NUtkdHFzZ0txa3hWNytROVZMbzRSWWdy?=
 =?utf-8?B?RE9lVkszQzVBc0ZMWVlxS3NXL3pmeG1ZalhBdmFmZEZsb1czeUlOVTAvOGZY?=
 =?utf-8?B?WVBHUDQyY0gwVDE0bGg5eGJmRnh3VHBlY3pSbWhPMVFhRDVzd2JMczJLQ25J?=
 =?utf-8?B?QTFVLzlxdXVCVks0eHZ1RkIvT0ZVaHZNTFZzWGhmVzdqeDZ0WGREK3hybWRy?=
 =?utf-8?B?NDgwWXkzSm5uWE4yNWhkZCtrY2dkTFZxOUx2d0ZXVWZzLzIwL2QyZFM2Wkwz?=
 =?utf-8?B?dCswY2tYS3NOYXVLdFFxQlFoNVI1QzhvYURRTFFrQnpsanZ1Y3hpdU5PNGVC?=
 =?utf-8?B?Wkh0YXhSUjdXK2htVE9EaG5IR1B5V2xPT3lRV2NiMFlFMW1HQlpKT1V2WWV4?=
 =?utf-8?B?Q3JYUlhFdG9HQ0hPT2hUWVhZNzNyc0lrZUZzUGRYMm1taW1HTTFXN09nVmpH?=
 =?utf-8?B?Y3kyelE1Q3Fyb3gzVGJBMXpJd0xlOGxJRmFLZnFJcUtXY29UaUtpbE5QSjVv?=
 =?utf-8?B?eE45bytXYlVnZVhINDNUMWFJTW9EQ0FPcEg1S3BpSUtOd3BheE5HOThMOWJB?=
 =?utf-8?B?NWF1OEpmeTlUK2hSa0NEejFDaE5aWDdlWjk3blhveWRlanpObC82Um5xdzVk?=
 =?utf-8?B?ZEExUU92dGM2VUdRSmJPOFZzenFxVkhTQlY5aW1jNHM4Wlc4eE9TUEp4QmdR?=
 =?utf-8?B?YjVKcXJ5OTZUdGlWR0l4ZkJZajZmR0xZbHJPOVNqc09PK3R3bTYwNEwremZT?=
 =?utf-8?B?c1Zyc2FtRGN3SmxGYzV3Y1NaRXA4b0NrZmlWVGVvZ3pITkpTOUt5ZHRhc1h1?=
 =?utf-8?B?NWsyK0lEYzdiRk8wNnp5Sk4wZVFPS2pZRXR0aHpkc3NlZWlLTi85YlplOGxl?=
 =?utf-8?B?Rml2bmpRSjVZeDhFY0xFRjZiNnJ4MzAxT25VbEhOSzhqaWZvUnIxTSt4YlZv?=
 =?utf-8?B?UktSQUNkekVrWnA3N25Zb1M1ZGVFK3EzQ1c3Y05COUZVeFBUTlQxQVhIZ2dX?=
 =?utf-8?B?SzlPRGNsQmV6ZTM0ekE0Y1RmV0VRWkpHak1ZMXoveDg0V1J3MkU2UDdYZXZ4?=
 =?utf-8?B?WjA1Mi81dzBQcGRJS2pTNk02V05yZ2JDemUvbEpKUFRlemcvZjA0TEdGR2Rv?=
 =?utf-8?B?OFNLRDJlZzJTOU5XbitkRjR4S1NqdlRnSmtZR1lZYzNNVm9ETWtDL0V4RDlL?=
 =?utf-8?B?eHN0b0pZL3VLZ2tBdUhBSjV0aEJ4T1FDWWhIM2xSR0pwbVZiZ09kYlRWM05K?=
 =?utf-8?B?cTNZamY2K3BNaTFkS2xxZ3ZaR0Q0ZlphSlVad203MzNZWll2UW5raWh5Q1lp?=
 =?utf-8?B?TTVaOXN4UCtTcDI4Tm9oL1dEZVNVblJQRVRMTGlKQlA0eW0rNVRTZjlXWThX?=
 =?utf-8?B?WWNHMjZiYWNxRHhZTGtDUUlHRlA0Mzc1Mk0xdXAwc3pBZm5KRk1Xa05PODhl?=
 =?utf-8?Q?qZcxIamDR7/7XuwjI9VxqMikt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8019d23d-c4af-4a5a-d9aa-08daff429893
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:11:12.2690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ/YELYN9zq8W+EcA0C/n1LaxE8VEVyJlpRS6UPPddXmGku8cEs0owkBAHMKsxhHfrr9ad42fcKOCUhXSIwRSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9404
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
Cc: alexander.stein@ew.tq-group.com, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-01-25 at 14:56 +0100, Marek Vasut wrote:
> On 1/25/23 07:40, Liu Ying wrote:
> > A valid bridge is already found in lcdif_attach_bridge() and set
> > to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
> > the unnecessary NULL pointer check in KMS stage.
> 
> Is it possible that a panel (instead of a bridge) be attached to
> LCDIFv3 
> e.g. in case of iMXRT ?

According to IMXRT1160 and IMXRT1170 reference manuals, it looks like
LCDIFv2(similar to LCDIFv3, but not the same) may connect to a parallel
display panel through a mux(either eLCDIF or LCDIFv2).  That mux could
be a bridge.  But, it doesn't matter, because devm_drm_of_get_bridge()
may create a panel bridge if a panel is connected directly(See
kerneldoc of devm_drm_of_get_bridge()).

Regards,
Liu Ying

> 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> 
> Much appreciated, thanks.
> 
> [...]

