Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE534C811F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 03:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FA510E55A;
	Tue,  1 Mar 2022 02:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50059.outbound.protection.outlook.com [40.107.5.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7124D10E465
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 02:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAfIB6m+0XwoEEHryD0DTFqCQbhToIhrg0oEZuN9Oq7RUTuCbL7+KAMwgx2i3RbDFIOzuOZaTqheofomT+H6ThQuto4nh/b4O6cbdH4oK66q/L1LPVMb3VlUyN3E53hI2bLILH6EiXi6t7neRONX+M3nLEu5TeZ3VWf1T/qcx0CbOTrVySWPaIfEbJ8Ndq0DKjAyr9ls+vqUzwYlEgDO65m1CCffxfDuk2KIU1tzHqpUZ+Xp/n3OfLO5wmQ0BZPc3NFfabfwKO8qpN2Ik8U/IA7c3guc87VqPKZVz6Fs287nGrEWo+1OrhzKwTVKDJHqdoW6It95HJNVfNIqszjrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kru5IFfWiaDMV3Rl3WRFh0LwRJmJtYLW32mnnuM5WFI=;
 b=TA08E8On4WnHmpwIAbF/2T1mHMGRci6xY2Jj4XRVsBCwssSo91eUXeo5kC4FDjkOR+ZocUC3souhobXOHRzfbNZ3teTIBP5794dtp1gMtXYhENM8Bn8wMEINCZj0bftn44bTwto0AfT7E47A7WFcOUhmraFwR0XkB8bkYUu/ZbxksIeE7FQmfQ95bw1FPMI56XBIqktzBLLGhaiqhkXxakzexjS/5vxvtoBxkRBGCHPAC+qUFEqcBqCidD+0vVe2N3Cq5AEAiCS3JzHktPy3r8IcfK31G3RXPsafRqWNQwpDmIjMaEvf/VHUBOfKdLA4cTuhFd+IgcC/XuSidKiYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kru5IFfWiaDMV3Rl3WRFh0LwRJmJtYLW32mnnuM5WFI=;
 b=V9SL7iOsySPCTgY3mIfZnpQf6B6sndvGdaDyW5aqgi7wc7sZkBegJi9EQxQgcRbHv4x9Wn7kN/JXzejpJeNhz+1Xi0QGvXatg4ZPuHKnEh1R7RMarACcW9bAzBZwd1h0BtcQbjGssOlnM5ytff9pmvsyX+HdFYAztJplqL3+8mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9348.eurprd04.prod.outlook.com (2603:10a6:10:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 02:44:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 02:44:46 +0000
Message-ID: <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Tue, 01 Mar 2022 10:44:52 +0800
In-Reply-To: <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c54b653-a733-4e3c-d438-08d9fb2d72ad
X-MS-TrafficTypeDiagnostic: DU0PR04MB9348:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU0PR04MB9348E2B0A9A830E600E9AB51D9029@DU0PR04MB9348.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBIrf+otmbg2c0LcnEMtaQdU1XnkK/hTp/Y200R8blLqovq+DmObauMY659jJpZ2dNW6yKFMPozyz1mu7lKVHnTBvkwRpsT5W/pIab89M1co3UYU48QzdeBPQCSjPYshQ6vY+m9shCCTgFMTUrNxrQDDwAuZbhj0X5h4YE/XoLXVphXNijuWrA1/vEdWcVJIBhTw2oGYKK6kByNiytI4njgeLnZX2KkSwjhCSjo+JE26L8exvIvOW7P0UafJjzey/BQgZ74yd8JiikrgrDn3IJbCXDDhHXt/StvL+LoYSwwnvGuayYfrVJHmrZxbwAjlAIb7K1r7UkZwXx/ZYELpBbRnYnjJsCJNMoN72Oeu3d/fx/KOuD3Xmzgy251RMJLcomAebd6BgOHGLa8Gwd4Gd094VEm5JaPnFFPzBzx83aGmP1VE6v/I8oh4xaltTMitB/vLkuxn3ZY6c3cuqcHqmoFS8/cx39nCbCb6CA83T0mIGEwbVtbyrQyT4+r8nBX13tDICYTFc+iY+Ga/YfT7RGpFRUPXhuRzQr8SHn7JPm2XuoxYTd8aucIW318vpggqZeYXIuDt2pTuZ9DSbo8QlrmcOF8etvEktcDsg4BsPNGyEWCsVyeEho68eajWfkk/tc1x+MFJP5XlOxK3cWkm+LcscoUTaqVqxHvlOHei24FpnpUHbGtGX9S7P4rrJ/s4sgxHO/PUwHVIpnqZHjkebw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38100700002)(5660300002)(6506007)(2616005)(52116002)(316002)(186003)(6486002)(8676002)(6512007)(38350700002)(4326008)(66556008)(66946007)(66476007)(83380400001)(8936002)(86362001)(26005)(53546011)(508600001)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW80MmYvOWMyQUxRNThUOEt6NmFRUWNpQmMzemZHd0ZKZUY0N1B6cFdKQnJF?=
 =?utf-8?B?MElLZEgyVXMyamtLT1pkN2V3OTdQVzJDdnpkdjc5TFA2WmthUytyUHdvNTJn?=
 =?utf-8?B?UngvTWg1N0RIZE0yRTVGaGZzeklMYW5oZy8wMVpPTkpXNmF4V1doOFR1L1FI?=
 =?utf-8?B?U29aTTZqYURZK3AvZnpKRWFxRmU2S0REalVydkE3U1FQbExOdVNtd1hLQ2wz?=
 =?utf-8?B?amZQbmtRQytjNHZMaHlLYTdYek0yNmlJVDFzajJNbXRqZFp3R2xiUVhHaG41?=
 =?utf-8?B?dFpqRVpwLzd5bDJVQzEwbVJqTERZM2R5dXA0aGZhWEhEU2I2Y3BKa3IrYWVp?=
 =?utf-8?B?eUowd2N5QkFpbm9WbHBMZ2RpM3FpcFhaQzY5U0F5Mlg3eXgxdGdYOTRDb2FY?=
 =?utf-8?B?ak9aVGk2dnJ1YWFsa0ttY1hKaU5VSzRUMW9Da3kwMUFWZGtpR2I1RURzUHdV?=
 =?utf-8?B?Z2JNRytSc2RDWS96bUpZZUpBV3E0aGdJcTZwWHVCcllTamlKOVJpUlpZVUxn?=
 =?utf-8?B?QXg3dWFwOFJjRklTK25yS1lpeFBJYzQ0d3pzWXNTSVl2dlp3NU5INHN2bVEx?=
 =?utf-8?B?OWZEWC9ETVkwaHI3NWJLQ01GM1VFWU5IN3FvL1Q3bUJPWkRwTjc2T1kwUVNQ?=
 =?utf-8?B?ZW1KOGdnTmZPUmpCajlNT3AxV0c0WTJFbGR2VC9CSWRPMkVHNk9DUmRYQTVo?=
 =?utf-8?B?cnhITHBZemVnYm12am9tYjV5V1lwL1dLMzdTcFFFclV4TzBFL2hXbUdDSlg4?=
 =?utf-8?B?cnVOVnN3SFZEZnNZR2VlUTY3dSsvbzY3QWJQZVUxZlhyZ2xHcE5nY0MrT283?=
 =?utf-8?B?Uyt0MEc0TUVuN2NiY0l5S0pFL0kxUHFvYkgvbGxzVCtqV2tGM2J4WFkwbjlk?=
 =?utf-8?B?UDQzRC93blpSQmVORklWdVBFdVJ0UmE4bHVKNEozUXVJek1tT1oyZjFIcTlv?=
 =?utf-8?B?QnNoaFN3M2UxQ1Y1OTlRdUh6Y213anBZOE1PcHpIcTZZQWdxYjdKdnB5T0pu?=
 =?utf-8?B?QWwvN2trbjhQVVRYcERFZmltckNvT1U2aHBlcnQ2dm14TDlYdnNKWXBkeXhs?=
 =?utf-8?B?cDlIeWFUb3Q4WmZEL2dqSG9TVzZybGIxR0NNNWNZV2dkNXY1eWJwYTZiM0du?=
 =?utf-8?B?RTNIR3RiamswQXE3VzRjSERJKzloQVJpdEZnbExtWU1OM1VxS1JKbk9lTlVs?=
 =?utf-8?B?MytRdmNIMDBaWUgxUEdZbVFxL2RmRzBFczlwMkptV2ptRlVRbkg5NWlEZjZk?=
 =?utf-8?B?eGYyZWNZV2pNa3ZVL1JxNHd3Vkg1RWlmbFJyWExReG5qODV4SktZaVZUS0Ux?=
 =?utf-8?B?R1R2REMyUVMyUi96OCtWbHRyTy95b0lZRjZ1U1FqdlIzZEhCTEw2U2Q4amo4?=
 =?utf-8?B?Uk1aN1RzNE82cWpIY0Q3RW1HcUlqUUgrSkora0Q4QVFXbitTRDBWcDdxYWVH?=
 =?utf-8?B?d2EvZ1hrNUJlN21nekNTTTU0citMUzRMSlJhQXRjTm5oV3FCa2gxbFhjd3Yy?=
 =?utf-8?B?UmtBbXE0ZndDaWpnZkVQNTUxVkk1NldtUXRTZnJEcHJRL25PZ1hIOVhIS1g2?=
 =?utf-8?B?ZlB6QUQ3azRCOCtqRDBvNWRjZStvWVMzamo0QnUvZUhob09NZCsxZ3JIcXoy?=
 =?utf-8?B?SHdSRGZkRUhNeEd4MFJReGJLaVdoV2JhNXlNMmxXdk5RSUtiVUJSUHl3UEgz?=
 =?utf-8?B?NXFCWmdvRFNtMWRYYWhIWXM5SklLRzRhVUs5K09YMVM0dlJPSlFISk1VY2JO?=
 =?utf-8?B?K1p1alRqWXRmazQwUzRpdHo2aFZrK3V3UXpRMkFYM0kvaFIrNElWdU1hdkln?=
 =?utf-8?B?RFNJZ3FQL0FXUys1Y1VRU1VTRnJuYThlL1BqTGcyY01waDJHMjV5aGJwKzBz?=
 =?utf-8?B?WnBld2lFRXMrQUpKejRYSTdHUjZLL24xOHQ4Tm9kUExUNUJ0QzBRY3BxMjQw?=
 =?utf-8?B?WngvUFErWnlsQUp5Nmtoc0pYQUJoMGhyaGdFbjhaZXQ0TmtqRHhTbzEzcnVz?=
 =?utf-8?B?aDIzMnE1NnlQbmY4ek9YSVBSM3dRMjUxQU51MEI0OUNPR3ZaZ2dnaDVUSTFK?=
 =?utf-8?B?RHgyWHdkZ0ZSdml4Z0pGWTZVcmpXRkFFeDRHL2tKbEc3ZTJ2YWxaWk1JNHVK?=
 =?utf-8?B?d3c1emZtbWZsNE4vS2F5WkJoTjErZFRsc0dnc0tKMkttU0RUaVdNcDJsVndj?=
 =?utf-8?Q?V+sBRk1ti6Apv8YDnWHZPyg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c54b653-a733-4e3c-d438-08d9fb2d72ad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 02:44:46.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbPgrmVXdpWr4060RDw5trIip65DTeD8zE8uNI+3pa2Husz3smO53zBGUVZ+0ceQbu4CF/Q+gwisd0iXy0VSfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9348
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-28 at 16:34 +0100, Marek Vasut wrote:
> On 2/28/22 09:18, Liu Ying wrote:
> 
> Hi,

Hi,

> 
> > > > On Mon, 2022-02-28 at 01:45 +0100, Marek Vasut wrote:
> > > > > Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> > > > > and is completely different from the LCDIFv3 found in i.MX23 in that it
> > > > 
> > > > In i.MX23 reference manual, there is no LCDIFv3 found, but only LCDIF.
> > > 
> > > See i.MX23 HW_LCDIF_VERSION MAJOR=0x3 , that's LCDIF V3 . MX28 has LCDIF
> > > V4 .
> > 
> > Ok, got it now. AFAIK, the SoC design team calls i.MX8MP display
> > controller as 'LCDIFv3'. Those in other SoCs are called 'LCDIF'.  There
> > is not even a register in i.MX8MP display controller to decribe the
> > version.
> 
> We also don't have a version register on MX6SX and we call it LCDIF V6 
> in the driver. The naming scheme is confusing.

It looks ok for the current mxsfb drm driver to use its own version
tracking mechanism to distinguish kinda small difference across LCDIF
variants.  However, LCDIFv3 in i.MX8mp is a totally different IP, which
does not apply to the tracking mechanism.

> 
> > > > > has a completely scrambled register layout compared to all previous LCDIF
> > > > 
> > > > It looks like no single register of i.MX8MP LCDIFv3 overlaps with
> > > > registers in other i.MX2x/6x/7x/8x LCDIFs. The LCDIFv3 block diagram is
> > > > totally different from the LCDIF block diagram, according to the SoC
> > > > reference manuals. LCDIFv3 supports SHADOW_EN bit to update horizontal
> > > > and vertical size of graphic, position of graphic on the panel, address
> > > > of graphic in memory and color formats or color palettes, which is not
> > > > supported by LCDIF and impacts display driver control mechanism
> > > > considerably. LCDIF supports DOTCLK interface, MPU interface and VSYNC
> > > > interface, while LCDIFv3 only supports parallel output as a counterpart
> > > > of the DOTCLK interface.
> > > > 
> > > > Generally speaking, LCDIFv3 is just a new display IP which happens to
> > > > have the word 'LCDIF' in its name.  Although both of LCDIFv3 and LCDIF
> > > > are display controllers for scanning out frames onto display devices, I
> > > > don't think they are in one family.
> > > > 
> > > > So, LCDIFv3 deserves a new separate dt-binding, IMO.
> > > 
> > > It seems to me a lot of those bits just map to their previous
> > > equivalents in older LCDIF, others were dropped, so this is some sort of
> > > new LCDIF mutation, is it not ?
> > 
> > I say 'LCDIFv3' and 'LCDIF' are totally two IPs, if I compare the names
> > of registers and the names of register bits .
> > 
> > > I am aware NXP has a separate driver in its downstream, but I'm not
> > > convinced the duplication of boilerplate code by introducing a separate
> > > driver for what looks like another LCDIF variant is the right approach.
> > 
> > Hmmm, given the two IPs, I think there should be separate drivers.
> >   With one single driver, there would be too many 'if/else' checks to
> > separate the logics for the IPs, just like Patch 9/9 does.  The
> > boilerplate code to do things like registering a drm device is
> > acceptable, IMO.
> > 
> > Aside from that, with separate drivers, we don't have to test too many
> > SoCs if we only want to touch either 'LCDIFv3' or 'LCDIF'.
> 
> But then, with two drivers, you also might miss fixes which get applied 
> to one driver and not the other, eventually the two drivers will diverge 
> and that's not good.

Given the two totally different IPs, I don't see bugs of IP control
logics should be fixed for both drivers. Naturally, the two would
diverge due to different HWs. Looking at Patch 9/9, it basically
squashes code to control LCDIFv3 into the mxsfb drm driver with
'if/else' checks(barely no common control code), which is hard to
maintain and not able to achieve good scalability for both 'LCDIFv3'
and 'LCDIF'.

> 
> I might wait for opinion from the others whether this should be one or 
> two drivers.
> 
> btw is there any plan to have LCDIFv4 or this LCDIFv3 in some other SoC 
> than iMX8MP ?

I don't think this kind of information significantly impacts the
decision on two drivers or one.  And, I cannot share that until the
company unveils.

