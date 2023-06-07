Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B44C7260EB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582810E04D;
	Wed,  7 Jun 2023 13:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2101.outbound.protection.outlook.com [40.107.21.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17D210E04D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvrVgWlQSdyYJCrHE55iUewFyKGKvAeLWqM2ahmdrzFXfxSVeAMXuhz4jSquSIRfLW3wYWzWKvrCQbalg5iPzDbyJf5LYISFxKvwQRo/eOHPRzi/DWfgPq5y6FGT1FQyspQ58HxW9gJEMNxbIPCWmBr1FBALH/okePJiv7kq4F90t+NmA9JLRAo6ENetayamnamcHJCkgqnlRRUZ5sWzeO4gVCLmmuiupjgZj3TaRg5JdNJI2/gHiCMu+X8i+yFjlq8DYBwtq4v6TAfJKvZHRh3X6bNj+dFEI/PyJLgZJ61dC+xmapZ+a7XGdxm+vSqYrku4atIn6Quatc0+AmtfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR1Et68MQpxFF4tTjfmwfFc+NDhzYrnqsfJxmra5sIY=;
 b=nTKs0Loqm8TYV4y28giuMlrUgfs9QVvudf5dRXkpDhO5XYl4JaIJftauBvOsQ4wQ24ukCcCdRehFW3pWV+fST6HCKu1qRdT7S/yKn6Pfj2FA1GrzbDQhXrJezgdSRfX1gWOIgxyFtua504hHatTYuTmukpiL7oyhCW5xKkFYaWGHkoilUSqCpRPNFWEpJ894+VD9RzQ0YTgcUIeAND0Y6zUTVGN+t9CWhMVXyYjkb6UEcyan0x6J5r9bb7RC2wedkEOyoewnaMNgI9wqt1HW62CG0Chntzd3JQdtXT7SXJzjp/qOobCHsy9GGPXVMA48BlSKA5DAGaIkcBv4BXlcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR1Et68MQpxFF4tTjfmwfFc+NDhzYrnqsfJxmra5sIY=;
 b=MgAyy2Ch26mvCuKBrravpnkMNQzh2cUIVom/1qOngvTwjFFGFPAOTVRU0h4xifwLXp9AqFdHtmUvWjbJNNsGoThLeJy64djLbpIuHx6UPl8rI4vM1fM+Qz5CCjYqRrngnaSPFaooT2mnfNIth8asxlcpQmb696PKcTBx1eOpE+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS2PR10MB7779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:647::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 13:15:47 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d66c:ec:aa54:f318%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 13:15:47 +0000
Message-ID: <e1379d94-66a5-8538-abdf-de7770befb7d@prevas.dk>
Date: Wed, 7 Jun 2023 15:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US, da
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230526030559.326566-1-aford173@gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0051.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::35) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS2PR10MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: c207f283-537c-4980-4e3c-08db67594e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvLJB6/4OoiLAZoAkpGnIgSFj8JAv5ILIW/Y2TayGoPePP0kF+cAzIy6sk0fl3FCSZ12N0baPpnihOZf+9tOA0Ea26x5Nm20KGTPv1RpRd5oyFsJLncKjEjjTeO0vfX9mVbaBHMaTY9Qfk/sRQTCmmee7HzQYYuC/VEqilP/YL2bL+sNTaqJo4+Su9TcF4vuUOqLRKp8vT8Ct1ew9F2GM/znI9XSMvVtbIOR+VWzu8m3OQN7kN2wWAA3RLGDBNzZIlgG9k1YkPdqHnkOrUAAki4gbOpfraxMfV9Jn3mk9sKTxFqMAqCaoSKLt2oVtansEg+/E0nHfVoT+j6vm1esaw68i8G13Xz6WNrgcFmC+Dz0VrIgbzTzG8mY9fSyXK2YciUP/goxPd6ODA1MUJvvycdxgiNREBA7sXWFLj/jeeGdgURZmtJdER1b/5KaxazIE6gpTrI48x08Mb9yAB5dJaHXPdBMKv5mJB+ydB+uPCXha2pMbeuEy/VLI2kWOGVFAzL5RT+mTF+QzrkYhsosZGdi37+8vFMHqdzMjIKHvGS9neIxotIeBLSwFk9+Ej1RbiEZI6Rc5J0SeOIi6aQWdCaFM3OiNWmLeIy2i2HpSzjlpuBpSYF5QiyTMM/bt4Ye3d0qnNMzpH/WVXzMyXIbS3oKXjafZBOKZEjdK9QTmuu8PJfc6hxTRHJykWlQWafS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(451199021)(54906003)(478600001)(8936002)(44832011)(8676002)(7416002)(5660300002)(36756003)(86362001)(2906002)(31696002)(8976002)(66946007)(66556008)(66476007)(316002)(4326008)(38100700002)(31686004)(41300700001)(38350700002)(83380400001)(2616005)(6506007)(6512007)(26005)(186003)(52116002)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhENmJwV2JHVGlNamV4c0Q2ejB0UVRNaWFadGlzUVNqdm9QTk9kUEVmb1kz?=
 =?utf-8?B?YnBuaTVrMC9HWGRYZDh2N1FEOFdIK3lyemNRRkxZMUZxTWRIOFhuV2R6cXdQ?=
 =?utf-8?B?aDJiSEZUZTc1VlVuWU40N0NEQSs3ZDZsL2FBSm5rTWJQeGxPbUFnOExsdFVm?=
 =?utf-8?B?N3BpUWh1aDkzc2VCajRhaGhMd0RGbkhaQXF4YlpuNWhra0tqZzhobmtaYlA2?=
 =?utf-8?B?Yjl6bHJISE81SEJ2Uloza2Fsb3FCVlpxWit2YmlDZUZ0WEQ5NGJWb2ZtcTNu?=
 =?utf-8?B?UTBKa1A3aVBEVnFjY2NoZzc0enJJMGNnbmJYVzlXaTg2TXhpdkZFalNocU1x?=
 =?utf-8?B?ek1Pb1A1NXlqREk1cTZIWnl2b3NSNzBqMkthdVNYRzZSVDhjM0g0akpVSm5G?=
 =?utf-8?B?WTh1ejlZVUk2RUFZR3dGSjZ5UnVWV2wvY0tTUzlXcmJjSkt3eVBUUnFWKzNO?=
 =?utf-8?B?ZG5PcFhScEY3Z0szU3F2NVNBOTdoRlZ1MCs4VWJ3OVZscDZlbldhTlNhVGQv?=
 =?utf-8?B?Kzg3WlkwcHF0NStvUlozSFREVkZWNndJL1pjUUhkV21SWEE5dTF0RUJlK1FE?=
 =?utf-8?B?MldsaXdJb3lWWUgyTXBKNUx5enlrZVhnMm5mL3dwSXlMMngvR1N2aG9ydDE4?=
 =?utf-8?B?ZmQ5QjB3SkgvdUZrUTJzK09rL3o3bG5XT3ZGL2p0WnJXSVZWTWF3MFpVMlh2?=
 =?utf-8?B?UUZWcW1idGRTS0ZBNnV1R3paR25TeHBJcEkxckRjN0Q5QVRHaExHdWNVQWVT?=
 =?utf-8?B?ajA1emtobXBPM0ZjSFFnRkU5QWlDSnV6K3MwU3RVeU5uZDZZUjIwYTZvbU8w?=
 =?utf-8?B?Q3hlRU95S0N2VHNCQk5id1ptUjdoNWR6d05pUXpQNDQvc0txOUE4Y1B1ckNZ?=
 =?utf-8?B?MkpZZlR6QUNDOVhNTlBUMWcyVWlnR3YrMlhpUEdrMldqelRaSHIrYWVXY25D?=
 =?utf-8?B?ODM2M3hoU2N3TUZSVlRBTVFBamE0R3hkMWpEN0JGMXE1bWt2TndNSWpNK0do?=
 =?utf-8?B?TlhtaEhtTW82eGFVWVNPaEdOYkNJRmNocWNmK0dCMUF5cU9uSXlXS3YwRS81?=
 =?utf-8?B?MWNEWlNuUUxJbHZkT3lNNWgxelUrbW12dlVteGRjMGtuVFcyYkJIcWVJVzly?=
 =?utf-8?B?R1VzYVRIdHlVRDl2QWo4bWtSMnFXSkJIUm94RFJvdUpZMEZVS2Y1SVFjQ1Zr?=
 =?utf-8?B?bE1aeUNtMEtKQ21tTGR6cDlBT1kvRStjQ1hQallha1I4elVURW5oVllLQzhN?=
 =?utf-8?B?TTdVbDBWelU2di93c3pma0ZqbWpOSHFZVURWSVZFYUFrSlVieDh3NUJBYUd3?=
 =?utf-8?B?b0lYckppb1N3TWRZOVgzTnIxQU5URlhvWUMzREcwd3BpQm5zSmlDbjM1VVRB?=
 =?utf-8?B?R3hzdmtOMlRSL0pQdmh0TXdnU1lPU0R3VVlZUHQxcG5DYzZnODREWXNpcFdh?=
 =?utf-8?B?YUU2MldCVUp3WGV6bkkxVVNqUlptWmtxcUQyUk83L25FR3NNRFRab2NLM05Y?=
 =?utf-8?B?VEZzZTZTYm9uejF2dWVYNll4WVdrOUJTbjN6aE9US2hXd0haSTZrSUpTUlVj?=
 =?utf-8?B?dG9BK0xOYmdqalB6MC8ydXVPYnRtRk9XNUM1MVBpUVNsbkM3WjA4WXRhZE0z?=
 =?utf-8?B?VHdnNjRjUjNYWnBxend0QUhsd2oyYWlvdlVFVWU5ZXd5R2RwaGt2ZHdlQ21s?=
 =?utf-8?B?UjQ4UVVzMTRXUWcrN1NHZWVnZFJBTWdaTTNUbW05WmIrYmYxeWZLMFh5K0Zx?=
 =?utf-8?B?cG0wOUdieWRkTUpxMnRpS1I5SWF3WExlUWtSQWdOSkNqVzcwdEdlOWxPYlJZ?=
 =?utf-8?B?R0o2SnNpQWlGQkFGVzd1QkxQczBjVktaU2wwaTQwdTM5Rld5WVduaXg5QlYw?=
 =?utf-8?B?ZGpRZ2J0N205aW9ITjBubk1wVTJqMEJFZjhKOVVrV2VkOVpLMGt6cy9PK0t6?=
 =?utf-8?B?MTU4ZDU0LzlDK2dXTVlaWkU4UUE0VUI1VTZyZWU3V2VOVDJZZnRKOXd3ekk3?=
 =?utf-8?B?RkJqZ3FtbnF5L2dmenZ0a2ttaEt1MU1XMnBIZGlaSU5xQ0c1RUdpSks2WUx1?=
 =?utf-8?B?ZVp3WEZDdjlybW1jaFM0dEFFTDNYZ2g5UTFra2F6aHp4blNGa3lJbUdrc2Ju?=
 =?utf-8?B?bUNlSjFUMnNIWWhzWE9iUkE0R2daYlBTUm5ORytVOFIyOFN1ZkFXdGZEdERG?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c207f283-537c-4980-4e3c-08db67594e9b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:15:47.2761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgKOzeUOSHMsC4jU/2QU16tqxBFgsBoZXMNlb6Cywb+MOuqqU4yu6vMQx3uBm6otZY703Hmhkz6pzlbigXTuuXBzvVMCDkYlZZCMPlGuJf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7779
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 05.05, Adam Ford wrote:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the
> value requested by the bridge chip.
> 
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
> work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
> Exynos boards.

Hi all

We're testing this on top of v6.4-rc4 on our imx8mp board, which has a
ti-sn65dsi86 DSI -> DisplayPort bridge. We do get an image at
1920x1200, but the monitor says it's only at 58Hz, and measuring on the
DSI signals does seem to confirm that the update frequency is about 57.7
or 57.8Hz (it's pretty hard to get a good measurement). It looks like
it's the lines that are too long, by a time that corresponds to about 80
pixels. But all the frontporch/backporch/hsync values look sane and
completely standard for that resolution.

Setting samsung,burst-clock-frequency explicitly to something large
enough or letting it be derived from the 154MHz pixel clock makes no
difference.

Any ideas?

Thanks,
Rasmus

