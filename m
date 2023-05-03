Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD486F5AC3
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3910E2F5;
	Wed,  3 May 2023 15:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2139.outbound.protection.outlook.com [40.107.22.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954E10E2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJCuYbpJAIvdAKREqWwt6vMp1kfyG0YRka51i+cwfBMfkQ0zQ5mP3IAz23/0yKAsRRQ4NcqawvBnzJR1SxRkZLs5GvYfAm0dNMllPYyS4PJwz06Pu9Gy2ZRYBvl6Qr20RyPBZ5a/Sa7cJaDVzblBCT8rdtQURfwxdhgsmkoyUk/+yEAK7mOrdhbO797+zt9+F/2TLWzjQrmr/4iQupvS9yLHcxx72KhH82/OItOFowaWfVCt36TuVE1nsaJUS+QN0guKRRDvaZw1JFxSmcxzO30UUOBAxLaLty3yjmAydr1Jw6w4Sz2f1JEUC3ecE9x3lex1p0EA9opII6Gag0UmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMlLWH9DCuVSZtYj/iQawVgACTeeOBJ7o9JdK9o4aNI=;
 b=MbswC3yIV9g0oPCV2PLHllaEXw3KVSMk1FGxcbkqBxEqdTwY3+DflEAGOBBOGlqso7sPu/+f3haFGLmdNK0pQWuu13++m/X6XkJGnstz5UjW2gXTHiMsCQT53a8ixcrQvGjIIbmPecOf9FhFiEaa4Cfqwib6TXNiOYc5zh2m2rgoIG81krbEjfHsbe+9h3vsdkfKoH9XmUlGadPzUJ6HIq3ndabvPJ0SutPfPukAcIkUo2tGdhcEE9WO8zsnf84GGlKmk/0/ZrOLM2jnu5eHjGkfcwGU56y202+B+gNWtzIfnjbJEioAtE2Ojnj2s9ePxr3b84QH5xIw+23kG6Vp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMlLWH9DCuVSZtYj/iQawVgACTeeOBJ7o9JdK9o4aNI=;
 b=ZJyoB1A77KL/Ae3jVsJHFdATSoVHgndiBTfzHwIo6U6qyv0ZDsfMBYXlVpb9CSGogazUKwdqXWxTuf2nb4QCOTfKnrvpFOAMzLp2Oz371LYD9Qz9OdjCS/G0KlWwjSNnrHP0jx8232SWUKiezwc++y2P4TDVwBH6dTCu7PzOw2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:18:42 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:18:42 +0000
Message-ID: <61ff6865-41bb-85af-2fdd-ff80e3c2b67f@kontron.de>
Date: Wed, 3 May 2023 17:18:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-3-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-3-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0085.eurprd07.prod.outlook.com
 (2603:10a6:207:6::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3487:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7789a4-1e51-45d5-0827-08db4be9ae05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OE3ldttlah85TryTpRoN/FADnZsmU8WMv4vZhKBjAz7OatnLRn+QELuunQvgvhsxgfLlT72oyL/EmSbVRGbwV8DVwO70KIm+AiSqtpNf5KfqQf/eF72JES9bXuWLHNrBvH4GSYvICgVwsJtYQdE2p9Rv476B6X+XlFl+sRNUO35FmvJHG7QqqphiJuzQy1hqkO6vcac86ELrKTQbNPJbKWC6XcncX+AB8Cq2kngSjX34hHpF4jho0jUsHCKALIxSRm9yctfY2R5KMojOz//BbzYA8582Wyzw1948YiFGhHlSuOnaXQu/+ZX96CI3H37561QN7rHAUlFNtHUpNynLwSR92CS5mCjYm/Ym38a6CKL+KyDJYG0JIKMe89afX1MLe38CmHkv0HAvYwJjrxQqd6qJTiZWHuXlGFqHSka2byYryOdCl/i5hsz0/3Y03WA5CgmrIT2BbNNHhHo9F8XOkH7PDGaWzNRl/AhleOb5cFS9qPPv4lLPqQnWi8AlzGuZfAahQqATnrIRPX/Cx4yo4mtEBfnErU5OZbXm/ORf0NDlKExeAUeEIKU9QXdK637+2Zslxfd7XJmKXWwCLT3gR9mMSyDHZKD14AxFppVXxWgtueiXAvtf0Uc4YwqozXdjRzimI7qJ4Bf9HjMYPagfEcNwnNl/ZMAAZ3P+3HirEwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(38100700002)(86362001)(316002)(2906002)(36756003)(7416002)(44832011)(31686004)(8936002)(83380400001)(8676002)(41300700001)(31696002)(5660300002)(2616005)(4326008)(6512007)(26005)(6506007)(66946007)(186003)(66476007)(53546011)(478600001)(6486002)(66556008)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3c3d2JsZ2FHazYydjd2Ymo1RXd6cGpWM3NFbEJteGRKc3hYUSs5Y3dzamQ5?=
 =?utf-8?B?SCtYK2Vicmo3U1JVcXpMYnQvcVRlQW91LzNDRW9xRXEyZzhFKzR4WWcvbThz?=
 =?utf-8?B?eUxxRVFuV0ZITktJYXJMVDA1cHdXOUx0WW51ZWxzTU90WGxrcHROQm5TQ0pP?=
 =?utf-8?B?enZBV1pJNUtDV3NtS1cwVjVzeTZUZlFWdWVIS1JhY3dkbGt1dVQ0YzhHQkVV?=
 =?utf-8?B?N083UTN3Wm56YldEb1lraDRWdXRYQWYvT3dxenJBcEcxeXBmb2F2ZlJjNkg3?=
 =?utf-8?B?bE9wYTJvZk9CZlcrUFd3WjMyTlVrOTdaZkpRZXgrS0hWbUlJdWc0SEdueE1o?=
 =?utf-8?B?MFY4U1VnZk16U1VUWE4vMEp1RzRZQmU0eXdpSDU1dzEwLzREM0lCYXJFbUdU?=
 =?utf-8?B?elVDYzFxN0l2bHBURTUyQnliV2JYL3IydTBVV0Fja055c2ZQdkkyMHovSTB6?=
 =?utf-8?B?VWRHVXFQUU1YWm5ibU0za01JTFkxZlF1bHMyK0xKQkZVZ3hCbzUvTkJidFhV?=
 =?utf-8?B?QXVFZUZXWWRycjhoTlZiQmlFVytFR0l3VzNpTTZlSDNnTE0xc09Ydm15TTFv?=
 =?utf-8?B?dzl4Vk9CZkhrZFZtSVZZQWE0dFowNXZQOW9uOXRzNHlCbW8wYVB5YVlFZ3Bi?=
 =?utf-8?B?UDJ1V2o0bGs4cGx4NlhlLy9XSDRtVHdZZVhySXNEQUc5eVZWbkw4TFVjNVNZ?=
 =?utf-8?B?U2NKeVFBK0xIb0dXYlk0Uk9ra0FMbjgwc2o2QUc4d2UxN25SMERBMG5WUXFi?=
 =?utf-8?B?QnlTdTlVZWhLck1MOTJHMGVWa04zZm5iTFI3UmViSFl4VmpWTHpqNUVpaE9o?=
 =?utf-8?B?MDdUcXpuTUpVdmpQNm1aUFh1SGRJR05BQlNKVnl0ckZ5eGRQcE5yWm9laU0y?=
 =?utf-8?B?Qy8weW5uWHUxRmVNVEk4TExhVFM1L0QvVTQvY1pDYkEvdks2b3NPd21aQmZG?=
 =?utf-8?B?Y0o4dXlNQmVUVzVjdlZNV1lGMXVMdW9QQ2hKakRqVk1RSnQ3SjQ1MmdnT1pM?=
 =?utf-8?B?aTdxRHNkVGhqY1lDL3BtU2FMejdqVHdOWjBqd1luQjUyQXZVay9nSUpmWmk0?=
 =?utf-8?B?YXZLWEN1NEJHeFpqSDRralM4UksvTWhHK2hNYy9aMmJJbkJkdlZUUEh6Nm1w?=
 =?utf-8?B?Nkx4VEFSeEhvbkpJWFlrT3o2THhnK1RndWVVejQ1OGh1UzYyWVE4dHZCU3FC?=
 =?utf-8?B?RXBzUDR4UVpEbmRBWHd3c3Z6MU5BQlhoY3lGeWpKMDVBZEpMcmdlZXZ5b0Iv?=
 =?utf-8?B?dFlyaEZieUdQUHFpOElwc0NDcW1LZTJRd0pZWWd1ZDJGZzNFQWk4NnFFUi95?=
 =?utf-8?B?RTdmMjN3eUFsR0RQVVhQUHpzQWcwRU1ZUDhVMHYzSUJnZmtLbWdmUWVWdCt1?=
 =?utf-8?B?cExJR254dFZscktyOXJiMjQ3L1g1eGRscmlzcloxZ3hLeVYrUWwzRXpPL1JN?=
 =?utf-8?B?UzNuT0NSRTdsUW0zdnZCVkZMd2xVMFNBTmhOcG56U3EzSUNTbGM2cVdFbXJs?=
 =?utf-8?B?RnoyQ1Qra2lVNlNzT1k4TWNQaGJONmFMZ3llSDZTQzZ2c2FtK2JoVUhIYnAx?=
 =?utf-8?B?cENPVlNqeGxFK3QxdTQzd2h0TkZjSDNPNG1XNVBqdnc2SzZpVWU2OG1abVg2?=
 =?utf-8?B?L0ltbzhzZ3Nwa2F3OTQ0OHFqTEhIazNvcVhNdWNrZzBISXhLODV4eUxkU3J0?=
 =?utf-8?B?VUYwV3VQWVB2blR4Y3V5dTJMdkZVOEhBTUhvRy9wZDd3N1Q5M2JIRm1QOVZv?=
 =?utf-8?B?WmJUb2lMVzRxMlgxQWhVdXY1VVhOWmdHYm81TzhybUNyeGRtT0ZFbGpZd3Ja?=
 =?utf-8?B?WktuVFc1RGlhVGV6WjROZW5GdDBReWEwMjdOdDd4T1dCcnFqM1FtTTRKS0U2?=
 =?utf-8?B?cVUydGpLejEzWStTVG4wNk9xK1FWUDN4bEQxbWo3amlnTVNaNHc3NFJTSEcx?=
 =?utf-8?B?TWhDcWNKU1RRVkpXMzNXUVBhYlBoYmcyMERIdnZwOHJlbWNxOEtrT3A4YlFZ?=
 =?utf-8?B?KzVRSWwveDZNZG1xZ1pMZ04vTzR5QlM2V3pNRDJWQkQwWEhXTWVlaFAyM1Yx?=
 =?utf-8?B?Qjk4Y1gxaHZmYXpMYm54Mi95Smt6bTEra2RobStMdFl4K3BzYUF5aVlDV0ZR?=
 =?utf-8?B?em5rbk93TGFnNkJQRlJhakJobTA4eVdrOFBqZnhLZS9ITjZFVjV3VUFoZWFp?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7789a4-1e51-45d5-0827-08db4be9ae05
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:18:42.3869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB8xcn5+JqXW2VDMgHLXxHKUW9figuG/lEp9ev0+R/csrBoFr/kegzkO2uJXADznemSKe7yHydc8uPQwfN08hfAKKlc81BZ5sidoz/BzUN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3487
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> and max values for M and the frequency range for the VCO_out
> calculator were incorrect.  This information was contradicted in other
> parts of the mini, nano and plus manuals.  After reaching out to my
> NXP Rep, when confronting him about discrepencies in the Nano manual,
> he responded with:
>  "Yes it is definitely wrong, the one that is part
>   of the NOTE in MIPI_DPHY_M_PLLPMS register table against PMS_P,
>   PMS_M and PMS_S is not correct. I will report this to Doc team,
>   the one customer should be take into account is the Table 13-40
>   DPHY PLL Parameters and the Note above."
> 
> These updated values also match what is used in the NXP downstream
> kernel.
> 
> To fix this, make new variables to hold the min and max values of m
> and the minimum value of VCO_out, and update the PMS calculator to
> use these new variables instead of using hard-coded values to keep
> the backwards compatibility with other parts using this driver.
> 
> Fixes: 4d562c70c4dc ("drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
