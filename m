Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDA64D7E7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABF910E4F7;
	Thu, 15 Dec 2022 08:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2134.outbound.protection.outlook.com [40.107.6.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD0210E4F9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghgOHpyhmsLxImKiWOpqrWrhyaGRcmzupBCzvhp/5HOe8X3TsjaG7aXooW487hH2Cfj5v7abIyds/lgr0zwEAbuNsOg/AlQHyymptqIxq2FVqZiMVG0XUCfmsIoNlXgBx+O2LbaAM8RvFNvW3sKskU/+faz6DrAxmiXo1FTXpLIgCOIX7CkbZfqtIQaXbSMpEwI9LmHjf9yRJUmLWUBmTRi4uLTm8HZv+7UrqF+cbYmgtDNdpu0/QBcXnZ/AXxnjw2l58VoNlif5BcuiUt7qoWuvEtviBSKfG5j8QYXoug4rZe938zp4ktQX2j4AJl5C4AT+QH0z173lOetnqvhRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijVKhYAx6AwEuUW8lMQvP1AUQ6a8FpYv74eS7y2NKPA=;
 b=B7WdsXKBXt0UhZqwbUWwxzZRwCYvJvZj9aKVEJKGOOKCvjFE0LHxsTuBqosw6EerCXqwK9BGoWn1UDkoMrXUGDzBLPgQ2DGVTKNW+TCSx0r9nOfk9vi6+9OPD4Nekr6IL7sSMiilknLzDrW2mE2yUiphtKYPoUrPUPt+RERAQYuNZZO646Zn3/RwnCf0PCkIr5sB96o8sGiooWkUub7qIYUt5v3jVKpa8cIyL/zncW8P3J9E+57mmIOC/cS9C1zLWWUH4EBcp675nAtELkq3gMp6b6Vy3Agli74ot/WuvBgtx7c1Sh4ir9YJI+aDpkVJfH2p5H0JRmcOX1WurayCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijVKhYAx6AwEuUW8lMQvP1AUQ6a8FpYv74eS7y2NKPA=;
 b=ImWiSV43GG5XPBWII2Ar/R7G08vX3TUjl/iHFFsgxXa2DrASyIsZwBwG9Iym6BxMID2QqewQnJsxfK620yKsECMEChydeHqg4nHACVuOfggf5qTjBN9QAI+hwrC5fYPRTFS6kCkWULeZSEe+w1BzGC9zUuV/ihX3c8gVLgTTiAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB5523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 08:41:03 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:41:02 +0000
Message-ID: <82c93a88-a12e-5fbf-5d53-3b5bbe88fa04@kontron.de>
Date: Thu, 15 Dec 2022 09:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 09/18] drm: exynos: dsi: Add atomic check
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
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
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-10-jagan@amarulasolutions.com>
 <d6b8232f-3f78-7ac3-d2cc-a58d4ef9c148@kontron.de>
In-Reply-To: <d6b8232f-3f78-7ac3-d2cc-a58d4ef9c148@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: b2edeec8-4a55-49d4-b5f1-08dade78193d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bSlcEmHULojEGtkYfk+VOR0neaiyK+srQfnMZBUz+7c4S+slp8OHvDeEIn/JlWabl/4GkThkFZrtY8aEGPw+AfUv0i0SGXOsrvyZsnXl2/e+s0GbSBL8caM6lRKo508knQYEGK4yMedg5Ccrg/OC3tv4k3OS0c71edgpH+f/diAyAB49hcKJj13TZna3RzE0iw+MfUCc8nPQj/p8f7OH8YPDEsJ5bF8YuuGcpzDfZPWuH+/YFCugN/Lef3Yx5B2OfODCb+wcDQ9LT5XQcIJLmjL6hVBYDE6NoLkANyROru1cEGNyZ+DIV7hXgK/55JFhN8SUtEsdwscNYdoNj1rIfSJXQypqb2bejpEVuIu1iF8SIB5u1U4zFr3F175bGQL7rTt8AVHzRSlFVYdfH7YVoGZPZznQBrEGD1zIV5AnnF9/OsU7UPrZxyW5SAtnjd9FdNVvte8KdfwUmNDb8WsOlZ5tkqkOsToPwMOetiHbO+vJukdU98pzSH1hYY1lSW5eXsY7p51W9jPfSb3m25Qkujjn1srvrcShMxtq7AX+sSBCtmSucmpvKumI+TcCcUUlTMSwEHEQL80/viZ3c7Ot3ghtZ0z69p3tMISt9dDkHA+Axk859q1vTKGd7F7eWPOIUQtu44xGmFqsFaU/71d9Hrn0Hb63+/8O0GWO756bLYaxi5SpS0W7RjchimiiD+6RL6OicfDCKlwdUqzHd0jr+2HHSzf97dB+sJl8IoHOxJSgpB7dpSz5gw+cSH4oAT0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(83380400001)(86362001)(31696002)(38100700002)(921005)(2906002)(5660300002)(41300700001)(7416002)(8936002)(4326008)(6506007)(6666004)(53546011)(186003)(6512007)(66476007)(316002)(8676002)(2616005)(66556008)(66946007)(54906003)(6486002)(478600001)(110136005)(31686004)(44832011)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhtekI0TS96REg2VGNyYTJlVC9CcG5hVi9acVNQbzM3eDRUdS9ySVg1b1FW?=
 =?utf-8?B?YkR5QTE3V1F1TWhTUVkzbm44blBSUWlxK1E0eUVPNkxTbDlRMXdzMTBLRHA0?=
 =?utf-8?B?MGpxa0JPcE1veXAzOURFTGthTHF0U29DKzRGRGZ6Yjk3V3dMNXl5TDI2Rm84?=
 =?utf-8?B?SUZoSnFiQm9iQ215aEFuRzRjaUZQN0JwbVk3RWlTbnhtSklHd2l0RWlTdS9m?=
 =?utf-8?B?Y2kzN3FXNmZQYlVXS3dUUjdmWnFsU3NwaFdEQ01WRk9MUlQ5cTFuUnhMcTRn?=
 =?utf-8?B?K2pWVWhGYXRFZk9MTisvdldwbXArWmo1SmpJUUxJWk9JQ3FpZHIrbXpQWkNM?=
 =?utf-8?B?aUc2WDRJUUdVQXVaWjRsamc3RCs3SzlUdGc2UU1lWUVtRnh1QzNrNjI0Z0lG?=
 =?utf-8?B?WVZ0Mk13akE3d2FUTlVIRWgwaTYxQ2FWK2pvZVFDaFNIQzFEMWc0ZStHWElF?=
 =?utf-8?B?c1VhdythelEzbVBCaFczUDJzTGxwTm4ydW54Ym1lZUNmVytwWS9oOWl0MDRa?=
 =?utf-8?B?emJwcW1VRUprNUQrZ2E1bW5hQ2FuanZrMzM5bURRVjZ0RndLUXc5QmtFZGg5?=
 =?utf-8?B?cXBqT2FtVGl5SkJ5ZkI4bGpqVytmcExLbjZsUjgrRFJJYlBwUmZ5UWtnY2pn?=
 =?utf-8?B?WloydGhrUktEMDloSE5aR1Z1RjYrKytlampmQ2J4bUh1ZTBFYmpDa2lhR09H?=
 =?utf-8?B?d1R6ajYrMEthQVpqenNNL0RiVTdqYmIzWnQ3SFlHeTVYMUV1b3lTWXFFaG1T?=
 =?utf-8?B?MVhlRWhLVHdBOUh0UjlMTm9xaGlIR3JoeTBJejMxUmFDTCtVam1oQitJVjh5?=
 =?utf-8?B?eHA2NWlsQ1Z2Y2g1cGsrZG9GQXVXcjhKRWM3Q2tvTWMyRXRYajY1VlBEVTJp?=
 =?utf-8?B?c3ppdUFERFV4Q0tkOGF3eXdUcC9LY292MGhJRjN6SDJoeWV4SUkzZ0REMXJR?=
 =?utf-8?B?WW10M3I3aENUSW5hUnJqdjdBS3N2THVub2RzT1hkQVZFOWdvK2RPOVhnNUxB?=
 =?utf-8?B?bGhTSFZUdEdNN3l0b1dSSUhIZUt3dmkxMGd0M1Fob0VKcTZNV2xDSGRVcXV3?=
 =?utf-8?B?RFhJQUE1eFNlUDFxUUh2ZTZLQ0NySGJwZXp6M25nNnI3Q2QvbDljTDVQSHZX?=
 =?utf-8?B?K2JwWUwrQ2pUNUFONW9FY21NM1phWktKTlNhQi9HSFV4MTRpV3Nvek90K2hu?=
 =?utf-8?B?cWt0aWhTNFNidUVpN3dlZklrMUFHbzRiYkpBYkNRbmlSV1dlWVZJRnZ5eXpy?=
 =?utf-8?B?emxjZFZWT1EzU2p6aDlOemdSY0xRTWVHdjhsM0pMb1ltWnR5UitpdXcrQUFv?=
 =?utf-8?B?dyt6bkVhendFanNORStIVFdIWTBrQ05lUXQ1VnhBSk1vVHQ3NmVLckZxbW5N?=
 =?utf-8?B?TjRobVh1cTltcnN4ZTZncTFoa0NMenA0UlljWXJvc1MzMk9kRGZvQ2xSdkg4?=
 =?utf-8?B?blUrK2lScElzRndlVkMydDNtaHVKMjJrVFFwUWVPUW1JcHlmMzJxWFRTcVh4?=
 =?utf-8?B?dUhqbWFJbjRNNlRqSER5bE04UEd6a2dBOWM4UmtWZUt4K2JsMFNCM00wMCt4?=
 =?utf-8?B?ZU1NSWowKzBnM2MrUDdiRUhaWnNSQ3k4aFdCa3loUHU1RkI3cWtnSTZHb2o3?=
 =?utf-8?B?SEh6RzBmSldHZGlCbjNqUlZBSHpGdFdFUDIrMkpLV1YzU1djTGNkcnJ2UXNn?=
 =?utf-8?B?OHR6Znd5cnR3eGRpWFFOdWdjYXBDOE94YzVYWklOSThQNWpGT2lndXh6RlFO?=
 =?utf-8?B?RXgxSGV6ZG5sQ0hLMlkra1NyVE4yZWo5aVJucERQeXNyYmJTcENGa1IxR0xZ?=
 =?utf-8?B?VC9seUpzY0tkWEIyUTdqQ0Z1SEM3QnF2NERmL3R3WDZuWEQvcXhvdVBQYlVW?=
 =?utf-8?B?aXdIQXo4eERORjRXWHVpb3oxN1Z5ZzR2MytmTHdybEE5R3VJK1l6ZWMxcEVC?=
 =?utf-8?B?SCttQStFR0x4c3FweDZ2d2M2MXJSM1VTcHhXalNaaTZFT1h3bWhjS1d4MHpQ?=
 =?utf-8?B?ZzdZSHJKUWlSV2RzWFUrcHJYK0ZQbGdKNzJHaUpHdWVHYVlQN3R1WVZZa1Vv?=
 =?utf-8?B?aFovUDRCUnIzSG1SUGExYkI3emVLRVBMSnl5aWY0YkhlRlNLaUJiQTU3VWN2?=
 =?utf-8?B?UndXeWxEcXpXd2xvMGRzbS9GbW0reHJ5V096cVhMWmZUTGxvell4ZFl0aXY1?=
 =?utf-8?Q?3rJw3c6hp3VmDsHKPsvgpmw=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b2edeec8-4a55-49d4-b5f1-08dade78193d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:41:02.8825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwspetmu3YrR9C4tSE9kLFl1Vdd2r/0gp7CX7qEiT9ehKoRxuY/lkAbgm//uPUwiZl6I9yMjVb/4tiBeRwXXSbELaLVaDZy/Geq6ZDLSbrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5523
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

On 15.12.22 09:39, Frieder Schrempf wrote:
> On 14.12.22 13:58, Jagan Teki wrote:
>> Look like an explicit fixing up of mode_flags is required for DSIM IP
>> present in i.MX8M Mini/Nano SoCs.
>>
>> At least the LCDIF + DSIM needs active low sync polarities in order
>> to correlate the correct sync flags of the surrounding components in
>> the chain to make sure the whole pipeline can work properly.
>>
>> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
>> Rev. 3, 11/2020 says.
>> "13.6.3.5.2 RGB interface
>>  Vsync, Hsync, and VDEN are active high signals."
>>
>> i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
>> 3.6.3.5.2 RGB interface
>> i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
>> 13.6.2.7.2 RGB interface
>> both claim "Vsync, Hsync, and VDEN are active high signals.", the
>> LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
>>
>> No clear evidence about whether it can be documentation issues or
>> something, so added a comment FIXME for this and updated the active low
>> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

By the way, the commit message mentions a FIXME comment above. But it's
not in the patch. The commit message probably needs an update.

>>
>> Comments are suggested by Marek Vasut.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
