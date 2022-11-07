Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936061F9ED
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6F410E485;
	Mon,  7 Nov 2022 16:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2105.outbound.protection.outlook.com [40.107.104.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F88610E485
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VijNftVku17jVVDpaRm5P+Qaod85VDCtGDuastL2Cry8789mQY/wEwf0gUxK5gKNMnaPf+s16bIr0f8XHPDz9Vwpbm9qtkjYCryeuf0RVBroqi8io3M8jHANN06HqmOnlAmx7e9p92s5b/R7B2VIbbGc+EOFOVBF6g5vfuVk0xqbxbQ1L32YazjlWKP4xm/gnyyTOihOHTL6EEbk0jVMcavuKLLUik7ze/0/BFtxKnacVZF2QWmOo+7vDKZeJRQ1uxhm9FrzWQibnMPhueMfGGdq4r5HxsM4mUUPoWSKQwmRwkja+jKH2y1a4rilkczMARjtI8f7DM2cXVHsGiaLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn0JROt1+5ttHaSFycw1dSxfOz9Pnz1ZQza+jUWOTg0=;
 b=lgr2RKONoKpnHoCE04EwStdKyeOmmVaR22ki2/Ycdm4oCGUYQNuC2t2e5/jbfJ95mVpXU+PQzuXL8SlBx9A+vwBzHZRmK/wEqTQ6N0DCwqBLyzkK9bFODO83KL8iQgB1zIoEC/NL8hJb0YryX300+7khxf2/l76inZm+FFTtc+B3LqY0YFFlJ9Kf0h7MT8qiJ+geubwQ9T8qFybIjkGuMsh03LhUkEUskh5INnuRZow9+vtYqmwHdyGBCxn8xO03M0js6AlxjV4zHXN/MW9/ChQVNMAdxpQ1Ub5nsB2WqDB7cv0bi19mQAIyKQ6cdJlBnZyz/zwJqqwLfuLQ1x0aCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn0JROt1+5ttHaSFycw1dSxfOz9Pnz1ZQza+jUWOTg0=;
 b=DtrOscR8RSdcegXWOZqbBwBwWtmM4zP6genw878wGhCO3fdGGTV/WxCh5V8J7cmyWKY4c4jXyndG/K+gqFMwCy0H0xuThploTuS05d5x09shLiFYBnQ6Gf1POM0uVykhW/DMqco+HlkWzlrrZlWfuxuFHB3pnsgi1UkVI0Actho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM7PR10MB3480.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 16:34:29 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:34:29 +0000
Message-ID: <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
Date: Mon, 7 Nov 2022 17:34:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM7PR10MB3480:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4dfe7d-8fcc-4034-62a1-08dac0ddf0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGVOI4Qg/3QHDJJ9bvBaYTgpvtbmDW39Htsroe2a+6pVb1w/sIVQAo+nWTgHgzFvvM/Ik6o40afhqsnpQF+TknZsCTDL8SG9XXD7mpF9Eb22j584DgkLUTMgiTbFhZmYqf6Xk8UShg7ltyKxOxvpWiUGsfH1zJ6d86fcryQpqeQAnC/eSIxJXHepDQmUOXYI24oPNoWfpPTb7grcRlLqAcr1HLx+gNElK/LcZoUsPBlEFP8mxmQ69t1us6gqgOMy/zRI9Zba1681PD/5cmU0/iTj2Nm5ZgxhvdTBHVPo2yqTNOt0iyjtcc4ke9klEPsopy4B2W/K6QtxUIxhRpZ6725r/cJxmBRupXlHl/Ky05W2HGYMAAMUzxkNukZ6DZ2CJweDYIkO2ayFofGfqHZs0/Z+p40KtY3WyvY0gDllsGb745G/4+4UbbLATo/yPzvXKUbCuA93af/qswK1IRKOTAjXG9HiGwNm0QIHQvlO9rjXK+pMgX4XpxzUfj7TJAhEZydSkchEBHqv97as8/lxSrLMZlaBTauELtjzJgTsHIZDltTx7dEcMHYouXc2xOhG1l3rIwh+gKANrJKLBEHL8nggYKpjiAnccKLwn6eOQUmjugGbmPmi5bZboolD0vwRz38KDFjlqCNiGVxDwPBvlXiHJ/HE4IVeDNhYfDxZDoOai6YrR07f16lE4bLGSoUZmlPe4n0GQK2vcr/ipxip3w5hAF/OIGedtvET6furrr1etmHViVGGrQHitI4bXOejyIMuPYd5GAlEZCrKnYSRZRyPkg7YcAPTAgB6SBwRYrBlzUNL4U5MXrc5Ls4sPUfT8l4ZHMki+tQgcnBRer8ecg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(36756003)(31686004)(31696002)(86362001)(921005)(2906002)(7416002)(44832011)(26005)(6506007)(2616005)(53546011)(186003)(6512007)(83380400001)(66556008)(66946007)(316002)(54906003)(66476007)(8676002)(478600001)(110136005)(4326008)(8936002)(6486002)(966005)(5660300002)(38100700002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTQvdzhwL0haOEROSWJkbFdmZVc0c0N6L29EU2FkMUliSHVob1ZUR0hNYVpL?=
 =?utf-8?B?TGQrQWRLMDROc3pWa1kwQXg4SXh5V0I2VktBK2lKTFpINjJHOGZUMkcxeWZH?=
 =?utf-8?B?RlFqeEhnWFI2dllqYnVrb1h6dVJNTUM3ZEF6dlhUcnQxSGJTQTBTeHVkcHdH?=
 =?utf-8?B?NU15Y0N3YXVKV1VoTEo3T2hsOXhCMXc5RTdKUERBcHdMNVpZTG1FY1hwcGov?=
 =?utf-8?B?RGltT1pkM3JBZmVUVHBmWG5XUmsvMk1VOEdtaTF6RmFKbFF0bzd3aWFnQ0c4?=
 =?utf-8?B?TjhUN0JLeEZTTDJvZjRaRFBEMlduNzFPTzlXanBUYWlqVURneFh3RGxWcFR0?=
 =?utf-8?B?M2tXMEtBeWVxSytnOVVTU0pJRVdwNGRSbTNjS3plZUMxNzdDeDRxdUJiWC9M?=
 =?utf-8?B?dk11N3FZWFhUaStTMVZhYmdkQTdHZGl0ZlUyVnovckxRQVZyNkdxUENzQVRt?=
 =?utf-8?B?QjBOZ0JUK2VPaEpiVWJSS2xvZHhCdTVmbDFISjN3RnhHbmZ0NXJPL2pqMkt6?=
 =?utf-8?B?N05pUDZmVXpjc1BNNjFOb2I4TTYrbkVEMlU4YzNwQUdMNEZ4bnMydlVxajFD?=
 =?utf-8?B?eHdhM0dQVzIydVZ5ZEVIQnNWVktOU3JiMlpZeldSNkN3VStyWU9pQXJyMzN6?=
 =?utf-8?B?Qm5wZ2cwVWQ2bDBvT3RFMzJnSVg5RzNycVB3RDYrbEtkVVNMQ0hpbEdKRG0z?=
 =?utf-8?B?Zml3eEloYnF3S3lTS250aHRJV1RLS1E5Si80bzZBb3NxOXg4SzQ1VytlcmVG?=
 =?utf-8?B?T1dIYWhuVlZzWE51VDduQi9USFU4ZjlmT3M2RDduMkxUbDZvN0pPZmVvQ1M2?=
 =?utf-8?B?ZVRVVmllTE5aWTAzYUhCQW1ZbUV3QTFxbUE0U2FvU2dlaFRUR0xxZW5GSUZK?=
 =?utf-8?B?Z2NSRXlXZ2FVQjVsYklFZ1lnWjFldktqL1FxOTkxREVQVW9OWUV4cHdPTWJx?=
 =?utf-8?B?Z0p5MittYjdPTmxXdUNCS0hldWFiUGhKS2U2ZUhyeU5TNWRkNWxJelV2OWFN?=
 =?utf-8?B?b1NBa0JPaHZweEtkcjBRbEpHNk8rK1dXdlJYM292WTNGU25Dd1BSS2tkT0hZ?=
 =?utf-8?B?RG95MG4vczJBQUJpc3pJcGY4eC9ubXNSUTNIMUZOLzdYbTZ3K2gxMC9YQnFs?=
 =?utf-8?B?dEtkRFRYcTJ0a0VUWnFNVVgyNis1N3ZkelF0bmNlMldiYVZGTDl6NDBsRFBZ?=
 =?utf-8?B?cWlJd0VyU1BXOFVRQzNLa0pRZGRsN24vV1ZtcDVaSS8xVGFlMDFWMGQwa25u?=
 =?utf-8?B?QkMzNkcvQW1YVU9TOFA1djcrNGVGOVU0ZTV6UWJnZEJna3Q4QnhjeVJadWJY?=
 =?utf-8?B?RkNrR21RcUxZend0VElIYy9nNzB4Q2w0QW5sZnRRdi9rU1dCZ3NwTDRKcVBC?=
 =?utf-8?B?bG1OU0I2WU5CVllIMVRUU2M1aG9zelFOY1dVQ1hDRm40RzltVHlENjd4T2VI?=
 =?utf-8?B?KysyZDVaMUYrREhKY1oxblV4Rm1RY0dQOERrWmphbFRsR1krUG5uRzUyMklM?=
 =?utf-8?B?bjdIcXN3WTJORCsvQi9oMEx4UVJPYWx2RFlPRVZ5M1k0V09LWFpvVHVaaER4?=
 =?utf-8?B?cjlRdDBwWGlWQXdVeXZOMjhydVVYcDF0eURmTGF1ZmJPWnd1UzNHL2p0dzNt?=
 =?utf-8?B?OXAzaW85WlhRYVAzaEZ2T1BMb1FpeE0rU2xqREpRc1g5QXp1NzZWUmFkcTM1?=
 =?utf-8?B?S0sxQWdyL3lNbEZWVFZPNU5VNFZwNVU2VWVhK1psT1NHNVdLUWJ2VVpYVzdR?=
 =?utf-8?B?RGNxbW9CZ05CSzJWWFVTZHppK29lN3JwQnk3TTAxQUs1TElTRjVyQWQxQXRV?=
 =?utf-8?B?cTRHVS9WV0VvTTQzVkNsbXVPYkFvRTVVNGMzaHBZV2xFdDJQQUpLczFIL2lF?=
 =?utf-8?B?VG1PNTZyWmRJK3VhUVRXR2VzaFRTTWlCaFBldjdILzBqbDgwYWNpd0FMSllk?=
 =?utf-8?B?ZmRoNjVkTjJuVXU4elZaUU1zWHlKZElWQnU4S3FHbEtLVTZJSEFsb3c2aEhR?=
 =?utf-8?B?TFlnR0dsWVd4MFZsbTBnS3VDa2dGdWR1clVJVjd4NWNNV0hXU1RBbHVuZnZR?=
 =?utf-8?B?a0U4MWREa2E3d2wyK0U3Nmtqb0NnbVluR1I4QmppZWhHQ0J0RHp6ZWh5MEND?=
 =?utf-8?B?N3RkaWd3T05rRE5FOTFDVXBVOTh0MnhtZjdZVUJsQy9PcmpKWUwzczJPMERE?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4dfe7d-8fcc-4034-62a1-08dac0ddf0f9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:34:29.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK8e2chKXZtLZKBMxFVC4UcLlazhwXA7ALF2+QwwCXhNxsWJQ6gh0XxRfKJauj8hjXKOnhdyzzdqOEwPzaDFQ2wAfI6LpgJc5tF83+ufZQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3480
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.10.22 17:12, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge 
> 
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> 
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
> 
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
> 
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
> 
> Patch 0001: 	Samsung DSIM bridge
> 
> Patch 0002:	PHY optional
> 
> Patch 0003:	OF-graph or Child node lookup
> 
> Patch 0004: 	DSI host initialization 
> 
> Patch 0005:	atomic check
> 
> Patch 0006:	PMS_P offset via plat data
> 
> Patch 0007:	atomic_get_input_bus_fmts
> 
> Patch 0008:	input_bus_flags
> 
> Patch 0009:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0010:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
> 
> Any inputs?
> Jagan.

I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
and a Jenson 7" LVDS Display.

Thanks for your work, Jagan!

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
i.MX8MM
