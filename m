Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935F680DFF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFFB10E23D;
	Mon, 30 Jan 2023 12:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2115.outbound.protection.outlook.com [40.107.105.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996010E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjjBR+5HJL3D0xRQG3IRFOlLeNDhnBOZ7j1rBCthtHgvQDk0XGkR7ehhNdos0cgHalStw3NsoqaPDUbGxTk6KXiLNh/4rKtUO2mKWF/+Mm+9ZXcnCU17VvwSSrHgkXNoc1FPps0LesJbzxQktVBjtNDfH8LuTuCCw3G0XsUM/n8ttJs7xUcCN8LzfV7J2Erw8MCNAuraLMgK9NM8qSH6mZ3hVcIOyG4+p1Vuc7cA4YbU5nE/PF37NLKmLi54Vj4iV3Ze0bKsF3etPTy0KehJt4lxAOpEUgp/Lx4JXe0xqSnyxlZuGFvcIvcyQMV5Miyqlneq4cLzA/EQYLpUvvaKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MR6eQFuss9HD0CrVxcDzPgTAh0CvkLvec65L17A8AE=;
 b=EWW1B/Xc6sRdtixElwGS/hwguEOjraveY99dvSpAywuR7vxf/z9zPZuE1fRPCGkqzQGPihWchPWESvEcjjrrjAfWTzHabzJJjMKM4a8hwCutXmFUMizR72Z+4CT4EDPnAwx+Lb0LJ7WhTkAF2iI/2NTHW9cU9qcwnR9INTUwDB/4qM1XNuouH0CSONjQM0Q/g+9aUihcXHZQmXlRnKmWsxRmVbaCWoTVj1EJzYs2RpQGs+KraaLhgX+mskPnpIme2D8KtdJJzjdTk/9dfSmyL43D/d5dwU/NLI+87Rh+p6Bu+7QG0+ANWzFLg5ciZkf0ynAQ/B+R+clklGramC960g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MR6eQFuss9HD0CrVxcDzPgTAh0CvkLvec65L17A8AE=;
 b=D6WR1V1QP4B4CPuHeaBRpMC2TR05hTE98atLtUvdhp5m7XJ+/41sjYM/odo7vFFQwz6Fv1/uHf+4P1qOgw3DNq17ESWsE/3GkUTOdQkvQ8ElrZQD4ufjLhe2eqYOF4362r+WFUfMZTB1cve1yvCK4vUb5xlCv2PGiMc+KRt0nlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DB8PR10MB3500.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 12:45:42 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 12:45:41 +0000
Message-ID: <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
Date: Mon, 30 Jan 2023 13:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|DB8PR10MB3500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba3f487-450b-4efd-3b9b-08db02bfe58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHno1yAyn70TCgqV9NHo/CW7GLNwmoaaJ+4PqEcSgJwj2RIL8DXXpkv/VZLalVZXkhVxV0rEtvs3MZbJjI3Y6Ozv9tS9mSu+hX0sqB3clJhmKqFxftKS5RSJW2MnaxnQZoA2lxn2EJQoEYJOxuYVk/9bnaKm8Z6Q0ncUaxiBXI+h+UtQiX1PeuPo5ai2ZHf/NHUnEJK8l1z72+mdQCt4H06gVH6ILFW8o7FngMLjBDBVM8vSttF010kfGXxoaOKSLRSTdLvSgzaiOqoyA3PzpSNDzN7Z1/lePYiMkhCNhosceRqYZxddb0hwsoZCWuCwECW/BaHq9o+7ZkfQHMSLOMoQkvr1gERwS7SuMtXJhgYMn37SrGYY6H0qmxrty35p596BVKTkEc3d5Deu/JW5LFsSmKgTr3XYjug/A0rKcj44w7kYDngMHmC9S8Sw5fKyHzqdaiEKKStDkQ29tx8dvw51LI53ILT27c7dkjqLJSy8B3vMoKg3D5fYyIIdHuFwaP3fCOJ1duRQpupDKF6hHOAb0HLHTUbtUumnr71lZADWrY0+yLOHqWHSLEaFjKRy7KT8p4icuP9NxYzU22D1QYDOESnSiNHtYoPasVzrqxfVPGjNWA2j9YQ4ads/oURs0xzD14Ax/ntUyGctmZct0rReneoosr8Ou1NjphjmKlOTevxSztcpWBxj5cZP9C+y7qC0exvVGJgnLgR5pjnIMwbe/L1Wgzi1UsH849aYIkssxXIjgZFHVRckhSt/3zMAl01C6OyUEtYNtiPwsNiGMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(346002)(366004)(376002)(136003)(396003)(451199018)(31686004)(83380400001)(36756003)(6506007)(52116002)(2906002)(44832011)(7416002)(38100700002)(110136005)(38350700002)(2616005)(66946007)(66556008)(66476007)(86362001)(31696002)(6512007)(53546011)(6666004)(26005)(186003)(6486002)(478600001)(4326008)(316002)(41300700001)(8676002)(5660300002)(8936002)(8976002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVg0S0JKaGtxdldMTFdRMUVRYnVYeWp5b3R1TWRQZUhQaWxYcW1DNDBENG9E?=
 =?utf-8?B?czAvbE8yQ2FzNktRQ2taMW5NYlhEaHFNRTRhcnJhZGhvMFoybFYyUENON0Ry?=
 =?utf-8?B?YVE4SUVnTmp5K01udXF6Qy9aMXVOMTF4MVllTkNtQVpUdGNhMDQ5OHlXdWxQ?=
 =?utf-8?B?bWcwZnZVVW4xSE1peWl4ODkxMkVXREUwUERJa1d4Rno1YkdSRlVlZkd5aVhU?=
 =?utf-8?B?QkZLTi9mdExNamc0bGs0RllaOVd5VW5wNXBVbWl3N0p4dXNMSFlYcmg5dUdi?=
 =?utf-8?B?UkVmUmtDRkRXMTdjQ095TDc3bWpmaEFaWWlQKzlTV09SUFJyTmw4UDUzQWh5?=
 =?utf-8?B?NmVVSnh6Qk84YWh1QnNRNk1qTk5XK1pDZ2lVbXhSMUFzS2JuSmE1Tlg3QS9h?=
 =?utf-8?B?bHpCb05UNUtnUDV4Y0JFSDJkUThrUFZNSkNwUDFHaEJ6eVQ0TEV6N3FEOGRi?=
 =?utf-8?B?dGQvUFdxRGY5OEdqUVRiQkxsYTU1TXUydUo2MlJhT3VEQ3lvVEw1SmZCUXJ3?=
 =?utf-8?B?R0g3U0llUExDSlJId0VhVjY1UXQ5alkwSHlvS3prMFl1SllCZ1hJMzQ1UWRC?=
 =?utf-8?B?Sm1jcUd4SGY5UWJvSGFpdjIzeUlSZThrNXRlb05ndk51K0lDYWlvbEVlWFpQ?=
 =?utf-8?B?TEhEOVdlQnphSWtkakkzWmVpMk5FQUlHbUx5L1pCbm5MaHBzaTVsQXh2bmd5?=
 =?utf-8?B?U1ErOGNUQWtyUHJHZ0JCTDRmelRDYnlZaXNiTUtTZm9yOTkxMHI5SXlaMklR?=
 =?utf-8?B?UXdYU0hKMVhtNzF6M2pFcDRsZjFmeWhtZXBnZU16eXhtK2dWQVJqbzNzaXBC?=
 =?utf-8?B?a25remY5VkhIeWZCTFlEbklSeGdQc2ZqZWtoQWdtR3ZHWTBLNDN3ZjZiVFpy?=
 =?utf-8?B?U2p3ZTcxejZJQXhzR2lCL1I5U0Flc1psYi8rQzdqeTJIZThkY3doekZmSXFm?=
 =?utf-8?B?a0d3eDhFc2JkOUl6d2hvQzFRbTQyYlFVaDA3aElWcnR0azRpOHBrNE9tQzhy?=
 =?utf-8?B?OTVldk5La0NqU2xGTlpDaEs5Ym9SK2NINi9GejhhMm9iZXpWM21zNitFeG1U?=
 =?utf-8?B?cUhUVjlnV3ZYQXRqWWVOblkxVVF6bFRjRTFoUjRVcjVNT2QvYmpaVHhmTDdM?=
 =?utf-8?B?OS9LampFdUpHd2JBK0NHcXhBSGd1bU44bkh6eVdRVE9YL2pkcjNjMEU2ZHRz?=
 =?utf-8?B?bmF1alRWQVpmTnJVRm5hVi9LZEl1QkJzUFlBS3RobDRzQUVONmZhRFpQRmlo?=
 =?utf-8?B?bnQ5T2lRM3I4bTM5NmpTK3pxLzVndHN5NmZmTVZxZ3RKS2N1TlVjdnBBYXB0?=
 =?utf-8?B?U2h3VGJ5ZVpwQjNkQkJaVmswTnZYVzU5OFhvU0RWZzFCcUpYWDZvZDQyQVV2?=
 =?utf-8?B?RFhwUGdCdmVYaXMrQVlXeCsxandHRHNkNEhzODIveVlsRG9DYmRCRmRVanR4?=
 =?utf-8?B?U3U0ZnFEdGhRN1RZbUdnMWF4aW5LZkVSSjVnM01CMFV5aDNkWjJDT0JHK1c4?=
 =?utf-8?B?ejZBalBMcEZTWTNEcHlMVGdOTWc1SE5hcm1La2ZkdTdNQnlzQ3VENGJ1U3hD?=
 =?utf-8?B?S0RKeXdmLzN6NXBkVnFTS2xIOVBwalZaTElHYWhQdEc3SWpMYlJkTXdjMkpM?=
 =?utf-8?B?V0RqWFhYak9tUnZTbzhKa0lBMm83T2pRNnY4ck9iOWVmaDN2ZU9XZzZBK1pu?=
 =?utf-8?B?R0Y5NnY1U0cyNWdJamtGTTcrWVg2UUl5VlhpWnN5elorWVhnYnVqOWwzQUZF?=
 =?utf-8?B?U3cyRzdDZTVoUU43UGdCUVIvMHZZbGpLQ3M3S0NsdzJUQ0wza1hNZmFBOE93?=
 =?utf-8?B?S2IzVkpYRFl2RDhWNldLOXhSOEZxTE0zL0RZSG8yRzhzWVVYOUhJOWp6UHV3?=
 =?utf-8?B?UHZhK1lJTUY5RjdwS28rVlhaalRKYitFbmZFVXlPSVBhWGNEWEpUSlBDUWM4?=
 =?utf-8?B?cmkvbUUyckxnS3AwU3k4djQyeDZVZkhyVjQ2bHpBZzBidjMxTG82bVo3ZUlX?=
 =?utf-8?B?aWJOd0lTWVh4MWt2N1pvQ0NRNkdZUklOSjh6WlZua2NYYjJMRXdacVVhQmtP?=
 =?utf-8?B?SkFSeEpsTllJZEluS2lxRjJUYXhBRjBCeG5OMXcxU3JBcTBwZEt6UVdNb21z?=
 =?utf-8?B?ODJlWlVubDkrNE9BNTNiYnBBNmNCcHIwQlJ1ZEhuRVNub01FbFVudUpNNThM?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba3f487-450b-4efd-3b9b-08db02bfe58a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 12:45:41.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6eUdFVGV6FqHi0QdjUe3scDhFMnXdWHg/yAkn3fWho+PORYT9SiucR01/ZTkd/RHj4cnEOzMpX4P2HpmWq6eCM8VCSxMcXGpQCPmOVcvbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3500
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
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/01/2023 12.30, Marek Vasut wrote:
> On 1/27/23 12:04, Jagan Teki wrote:

>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>> help to do the equivalent of
>>>
>>>    88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>    f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>
>>> for imx8mp in order to test those patches on our boards (we have two
>>> variants).
>>
>> Marek, any help here, thanks.
> 
> Try attached patch.

Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
of errors during boot:

  clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
media_apb to sys_pll1_266m: -22

and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
is because

  clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
media_apb

Further, the mipi_dsi fails to probe due to

  /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
'samsung,burst-clock-frequency' property

All other .dtsi files seem to have those samsung,burst-clock-frequency
and samsung,esc-clock-frequency properties, so I suppose those should
also go into the imx8mp.dtsi and are not something that the board .dts
file should supply(?).


[There's also some differences between your patch and Alexander's
regarding the lcdif2 and ldb nodes, so while my lvds display still sorta
works, I get

  fsl-ldb 32ec0000.blk-ctrl:lvds-ldb: Configured LDB clock (297000000
Hz) does not match requested LVDS clock: 346500000 Hz

and the image is oddly distorted/shifted. But I suppose that's
orthogonal to getting the lcdif1 -> mipi-dsi -> ... pipeline working.]

Rasmus

