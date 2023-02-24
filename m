Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42176A1D3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 15:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80710E9D8;
	Fri, 24 Feb 2023 14:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0290D10E9D8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 14:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt+g26QuBbUrgkQn9jft+Vys+F6VTiduamCMvkDWxdE/GA6ncv7IwpaAqUGxoItPVFiy/yTk/E7FwXIeL13IoQh3D+3lAwejwqsry6B932pd/nW8uZYxDNz9Mkkas804NwDQrcL5r82GjlgaQUexh6Ayn+EO4iIXGA/+d0eVb34PLqCzDJDOdM/Yj26yOh2LuhyLkQf044aEDPVqAw8a+24Uq6i24u5sWsu3Cue1O5MYlxNkfIi9gDfPXHNcoGOr9Ga4S1bIAcOYAktZBZiv4vUfx/7FDugYC/xRpmTMzTYF9KyBxt4v2zrPUWpZi0U3IiP3txo7WdQq5PAPC7oVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3grgmz5skTp6FNZwNAJdO0CNBcJNAUDcLWITN6Co6Q=;
 b=UHyeHEVkUq97fQT1QzavsMkWrUZsWGJcVgJOGWJ53X9FlNeasJsiotg4L2ui5eH+wxL8/3mYmlWCamgYXOLyPdmDAQ47jRC6sjp7T9mWBsUcSbdiGllTiAwz9A3kRK/Byx4Tn52bUekJjjdvk+cu9c3lO431IiCaUxEBFBNGCrSB/c+Xi5GT+RyjiA9m7Px6QbiKzc81G0ZkMfWCRbb/kYJxeVN82eisyP4GPO83ohkrRguh14qFFzanFIUl0jxc6IRe1i0PTvepl2tmKsiysEwVlbo8tjJbL4XjIX0B96v8kaavGJAmnrnpKyOEgIZ/yyytpDTLuqsphoAYyQhXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3grgmz5skTp6FNZwNAJdO0CNBcJNAUDcLWITN6Co6Q=;
 b=gVMwf4CQKWema788Sq8J80mxd6V21p80xjO8MaY4lfjqg2puRT3nszcRohG/RwRS6ZzkqsB3eBm9dGCNHCv16Ph2qMcSjbMay2+4CCXWmw3AmA01as48t89AMwxlktFiuIZZ4P+VQ89L/vzhhs0pDxskw91Br4L02NtnuASw1Tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DB8PR10MB3291.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 14:08:20 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%4]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 14:08:20 +0000
Message-ID: <0483dc01-a6b5-89ac-3ac0-41f85405fab3@prevas.dk>
Date: Fri, 24 Feb 2023 15:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk>
 <657fa528-ca01-0c6a-2c2b-bb7f4a95096d@kontron.de>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <657fa528-ca01-0c6a-2c2b-bb7f4a95096d@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::25) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|DB8PR10MB3291:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a275ada-739e-4d8b-851e-08db167095a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LH+I/YyQME9eyjVOkbhmuwWzHLQDjfRJDcDN3vrpXGRc+uYrxD/1VeITCVaS2CwnumKxhbjZhhJIjwxf9j8Cdr3tulBU7P46myIGLA/vv/bXu7s02qLzC6vh+nokM9dMkkRtQcJYbP8zaQgieJQxOGDUZdnYkkZuWBqEeaDz6OXEcal6V630YOtSUGWzc+wqbgLeCckLDjtteE9z/IwA9wiodkSYRCU3pD8oqai+/UV3YkPXJds6DBS1ECcRWWZZuQpJZK2Lm6Aro0vlpiwfMTe31NRd6/gcN21b3/3ceHGJMMz8tjlHeZc9e32z61oM+jtfXVJ85h1Pv5feScbR5DANmxZYRHH7EbWREc1anfFBbcaLsHik2iAIyAuzM7BcC4/dHN7dkNSSsEL7VP6zrrKJ7fb9XsRZW7GtBPnj0LoEAddV4TzzyaZAUaxKZh19Z+ckW+94u3QXi5yoKNf/dpMC/FehYXllXDBtDSijSewnjTpuwzsJRhPTyeQQx5YwWtV2F16gX9aoUJM7CaZlMc5ZbJyoUOqlYuUg2ETBMDzkAmGp5xYDklhWBM5KKmt9Uf9xYFUbc8Me7zaRFhxvI++teKwsR1YSJEp2PstfF8HNDePqzJZ8okLY3fvDHLobICcHTqSgfcRoEBneUweum7Da8PVXpSDcx8w9zXR6x/whcod0J/mqboA73LVRVcRJqP5QV7cst06UWvwPdgJxOOEJaeVf/OW+ezu2scYFdOez1t3zZt7TxckT5IqPu9vy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39850400004)(346002)(366004)(136003)(451199018)(31686004)(41300700001)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(26005)(36756003)(6512007)(186003)(8936002)(5660300002)(8976002)(110136005)(2616005)(7416002)(38350700002)(38100700002)(31696002)(44832011)(52116002)(86362001)(6506007)(478600001)(6486002)(2906002)(966005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzdwd29TOWZ3dXZ0U2ppQk9KRmdHYjZzUmtIalhKYlNiei9QMm95c1hFemEz?=
 =?utf-8?B?NWhMYTFCa2VLaUFaOVEwWTlocEREQnlpcC8yc0l2NFMrK2xqaTJET1M3d0pl?=
 =?utf-8?B?YnRxYWx0NHl0SUtlTzl5eng2MjMwWU5vNnUvY3locmFUbU9NUHl3VzNxQUVN?=
 =?utf-8?B?dmJ2Qjk2VHY2TThRSXlGSXFyRzhRZ3VZY2xnZ2c0QVQ3aEJGM0F6MlRaUFNZ?=
 =?utf-8?B?SEhHMUtnRDAyaGMxY3EycEFnQU5iOWZsZG9rVXpFQ2FNRW41cmdlRHk5dTR6?=
 =?utf-8?B?emVVRmFlM1FBZ09IbXBzV3RSRTVxME9vbXpGNmV0ZHlXbUJpaVpCUlVWbHVn?=
 =?utf-8?B?WjkvNTQyYklmOXBnZ3VPZkJFVXBrRml0SjJ2WGNjeFd1VGZEVm45OHdremZ4?=
 =?utf-8?B?RmZzdGplOVM3R0tZN3RwWmZabGxXZzR0R0t5K21MYjExbGkzd2Y2Z1h3RGM4?=
 =?utf-8?B?SDZ1cXJndEFpbmZvWHpyUjdyUU1uWTNvVmZ2RUhld3JWZWNBMFRoR2wrZjNC?=
 =?utf-8?B?djM3dVYrQ1NYdjZpTVIwbEpHdzhXaXhMSWp3d0NYcDlJMWMvazdpUlBRNnI3?=
 =?utf-8?B?dzM5QW9rSHZwNk4xZGZOWEhnMml1NTVIRnVCektiUlo2RlBweXYzNjVyMm0x?=
 =?utf-8?B?elVLQUlUZVdHWUM4Q2JVbnpTYVdwemgvMnBmMVFVYUZkTVdYVmNpTllnM0xj?=
 =?utf-8?B?ZVhOVUtWTDNLQXBCVFlBdmkvVkdySVdPTThYb3pnckdjdnNNVm5xN2xVWGY4?=
 =?utf-8?B?Nzk5L3R2elB6T21vSEJVc1lDY1BXRnMraHJYUWMxK21rZDlPWXlRYmRqQStN?=
 =?utf-8?B?eFFDQjVuQWlGVGQ3azg0d1l4TElONGJVSld6Y0dlSTJUN292Q2QyMmJZMVA4?=
 =?utf-8?B?NlhZVWZUV2NNYUhuWVlsd1FyZHBvWVdVQlZ4UWFOa2ZSRS9aNnFqSTdmNk5a?=
 =?utf-8?B?bUJQRHQvMUNwaEhEbUl0YUpqNERQNjBPeGxnZTJXamJXWUVVNUZZQmp0bWp1?=
 =?utf-8?B?cjNQYjA5SjRpOWlIWnhSNXZKL0ZiK2dJTkFVRVY3THU4RUhTRzQ2dFZGZXVo?=
 =?utf-8?B?d3dLRk5hTGNZeVF5dzRnS1NMVW9JYml3WmtHSjVaK3lqekVibDhCdXdTUnh1?=
 =?utf-8?B?NU1xTmZlcHZoVVZQK2ZBaUpUK09TbW85RDU3U3J3LzZuYlp0cS8ySFNxL21N?=
 =?utf-8?B?LzdhMDdSNmh1NFF6Q3BmcEV1aGhmS1lHOHJFMFYyOTllclJ1ZjJEN0VLYXpz?=
 =?utf-8?B?YXhhN3NnK2QyWjFKN1Z0enYrWnFETEhNRW1KYzh1TWlKalNFbjZkTjltNkFh?=
 =?utf-8?B?dXF1eUZ2NEZNT1VoZzlSOG56aGdzdUMzL1lmSFovdUNxZnhWWldQeXcwQmJN?=
 =?utf-8?B?Q0x0QlNNS0F0U0dmMXFKRzhSb0YxSk82alQ3amhpMWNyWW02WUJYQ3lGNlp0?=
 =?utf-8?B?RHpwakNTWEJTL05kWk1waHFIaXdQZTBuQzZUR0ZNRjNJN2VxWmM2V2toWUtI?=
 =?utf-8?B?dmI2U0ZOb0JiRzNvMkFSZmVTY0VQaXp3QVlaVllmd2h0d3FsNlJ1WW8rWnpN?=
 =?utf-8?B?bFI5SWxKWWhNWUppb3B1OGdBYldObk5KL045bHVkME90NkZPNmt6WGhUTzkz?=
 =?utf-8?B?dlRxWnZEUHpKUWw0T2FIbFhnZjRjaUJmV294VHNhYVZFam5ycGdrTEw5K05X?=
 =?utf-8?B?bE12RG5lTXVpWVBqVzI1U2lLa1JmMm0ydkprd3BXa1ZpcUVzRGE2UkN5cWJW?=
 =?utf-8?B?QzdScndYT1BENlZFaEdLLzJmMFBhOENzZmd3R0xiQmhnb21VTXVFWXBIVVNS?=
 =?utf-8?B?VmJwbXFJZUl2MDZ0Y2dOWmcvTjRISWlRL3pPZlJnaXkybnRYTnpveHloRGc4?=
 =?utf-8?B?N1Vjb1pGNzd1WGo3QUx6SmUzMWEvbjBHNVRpTFppVVN5TzVCQUtWR0l6WHFq?=
 =?utf-8?B?bXNRSVpqSHMvSGduQnZQcDJsRERNV01FQUlBNlprV3RkeldtZUVFQUd6Z1Vv?=
 =?utf-8?B?TFBjMXNhT2UxTE94ZC9Mc3ZMYnk3MDhNd1FKdDR3TnBoL2lIejZZeHBqMXNi?=
 =?utf-8?B?aVV0ZGp5cENTMk1JaHFPQ05UdExibkU0RXBjc0FtcmpiQ1hDVmxGc1dMWFRI?=
 =?utf-8?B?L0lPc0dUenNLUG5PNDZwU3JVdExXWDdJMG1tcFhWRm5oZWFMMEhzaDhNdC9O?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a275ada-739e-4d8b-851e-08db167095a7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 14:08:20.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnCqb3Skl83B00s+RjhrDLeji0PdvsqsLJ0bYPkpnYQPfBLS6RckR+UpFZ1gFnnR2Ap4Jyifirb1UvQ8h+mpa7bZHtHYHZWH8Gt7uRmzfdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3291
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 11.05, Frieder Schrempf wrote:

> The NXP kernel is completely different. AFAIK it uses the component
> helpers to bundle all subdrivers from a central driver
> (display-subsystem). This is not how the mainline approach using the
> bridge driver interface works. So you can't compare them.
> 
> Did you look at this extensive thread with findings from Adam?
> 
> https://lore.kernel.org/lkml/CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com/
> 
> It is related to HDMI, but I guess a lot of things are valid for DP, too.
> 
> Anyway, we need to get this series merged. Otherwise we can't work on
> fixing all the other issues on top.

Alright, I finally managed to get the imx8mm-dsi-v12 branch (commit
fdde97c7d553) to work, by modifying Marek's patch for enabling the
lcdif->mipi pipeline a little. The end result is in
https://github.com/Villemoes/linux/tree/imx8mp-mipi . There are also a
few cherry-picks of by-now-upstream patches to imx8mp.dtsi included.

It works on our custom hardware, with the ti,sn65dsi86 mipi->eDP bridge.

It does not seem to work on the imx8mp-evk with the adv7535 hdmi bridge
daughter board, but that's probably just as much the fault of the
adv7535 driver as anything in the SOC - it's impossible to get a real
data sheet for that thing, and there's no end of random patches floating
around, with the NXP kernel doing completely their own thing. So I've
given up on getting that to work.

Rasmus

