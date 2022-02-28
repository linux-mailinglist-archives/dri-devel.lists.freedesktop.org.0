Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B384C64BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764DD10E4D0;
	Mon, 28 Feb 2022 08:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A610E4DA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmB5ScVTRphn2WISOi8MPE9BP114mDzlv7//pUl076N2fqpauziGMy4mAVAKQqcEJiexhdfNbkvOgje7Ywg5wABZoAhjV7imXwExu8lQLuEd8cEmlRrc77Xx2mp3NDBD6ehLt6+aggn7OW7h4yalFey/FPWwNFOzB4woUVITICZPog5wk9aNHcvC0BWbtTppW8LwfLJ3bafMj26lztLM+vjB+B5WjsBtixn4NLSFusVegAEwiaJFWEnhBheiCDwA6izwQX5SLovVpyQWtoQfaTATaBxSjtlPc3ySCthV5nraGw8IPETIG+eK3gLYiNj46czoRx83BKRvLf9P1sPsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WzercdIaQ3NC+lU1C1msmCOUcks6ezndZDAqQpziFc=;
 b=AnJaWubc+p24ozUcgI81TgSLSHVa25yVYzq78nO1kywQk24I1VRCa5A9SP0X8pw1Ab7y7EC8J0VuKkoaeGL7lkMhxL2pLuYgH/yp4ZXpXAfOUY5eG4VQD6lnb8IZ1Osrjj8lwfT6wAqA3AfaqCxaXzDXHKOVuQeGB+EoHyx4utzTvpmJIGU9Ca974RbRcahV+i24dmD/YMBurEMWM3/RtMDEhFHwKwSPkiPL/rpdlap4t4XV976PpNB/zzDUBq8oOUtIEr+BDSl4DrfkgnIr4Vtf1MkE+f7UPcuEEqcoG+dBc2QlwsZccFdKLYicweKVQYYrRiFEMJeLZAPIqjUP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WzercdIaQ3NC+lU1C1msmCOUcks6ezndZDAqQpziFc=;
 b=dNMM/1o8MByxIfiC8vRmRVw4bOKoK7u4RC3LcjA/KOdsuGqf9+dtM9o8CrPxUbX5o1qAKKa2f0dGy/tD6oOgaVJlIVW250dpOXW6nPzcv9cdyOWp/CN31evpGmPjf8ogbsGU9KIRGKmxGiHaOd1DQMrRNcdS19yA20sUTrBFTAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB6181.eurprd04.prod.outlook.com (2603:10a6:20b:b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 08:18:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 08:18:44 +0000
Message-ID: <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 28 Feb 2022 16:18:45 +0800
In-Reply-To: <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2da1859d-e171-4bac-c0e5-08d9fa92ef70
X-MS-TrafficTypeDiagnostic: AM6PR04MB6181:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6181A7E5FE0921CF7AD7FFDBD9019@AM6PR04MB6181.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: raZ7GhO5vBVvmKFvawXErKSvH4RUwG+tZOmbCKmuz6UgghOW8k87YBkwYLaoJ2R+kesvSkWSnPMVZEakjtQejdz+kDY3Hz0rGL4PPq9RU2OJiO1HCh9TgIZ54E91+VbVpgYrJJ1GL0ovvTzsNxftW9tWQ5e5LRJYc9/5iFiYXwcMuB42HPGYDiWIKYi2CxtOvIvODnAAOZaih11vbUYWbCjtShIztpb3s55UcaLOjt8c6n5JN56JLGxk80dV5Cao8O+vu7ZQeFxP17Ur4icAySsipl/8WTzuwryJzlHwiPlwfAn9TP4F5yOQ4OU5TSTeNsYxEzm4PBDlUUHIYR2inZEZ6BBBsRXs2DTw2+apHCNn1K7l4IRwDKe5JV0YF9dldAidgsIPX33iTRDQxynNjg1jAGz7m+IBaGliWrEjJLqFHXC//a2mcPR+PTT5dGnfuElue/qFH6MzSv7UjZdNO9rFPW/eRPlNCv7qUmg5dJzgzgHvjC2m/JELoizBjSN/vUMGYmyN9e40TsyaGRbupMRKxS9gIk/en6xfJ6zYAcwmBzqzeQQShJORq39nJTwI77gBZT/gKDmnjhLc4Kf+upkyivz6OFbGZm9ZTd5Vh/TohvFho/mZ2B6wz1KCnOFmwJM8rAKRaFTL4gaC6K60MHDJXkKPramojDklOw1IUD73crhiAzEoPhCIXNFCBdDDhfdVbDI7U1rc3vjJHNIbsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6512007)(316002)(66946007)(52116002)(6506007)(508600001)(8676002)(53546011)(54906003)(66476007)(66556008)(4326008)(8936002)(86362001)(2906002)(186003)(38350700002)(26005)(38100700002)(2616005)(83380400001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2JnMkxDSjlJUFhBd2xBcm1UUWY4NE1YYTNlTG5iZzhiMTIwWGRLNGRqMDQr?=
 =?utf-8?B?S3o5SlhpZUZrTTZxRjFyckRNeXRLS0s0M0VHVnFKaUdscGc1RnBpaWl2ZWRk?=
 =?utf-8?B?WnBQMHV0RmZtTERxMWpuSDU3UWQ4bUcxWS9KdG1qYWpIS1VWeEtDSWlDS3ZB?=
 =?utf-8?B?bzR4WHlvakw0cktWRkE4WmVqbWxyQVMvTnE0b2Y5NjRTVVJ4UEFLMldjaFBH?=
 =?utf-8?B?Yis2YUo1V1ZOYnlIajFWaUowU3lpcUV0ODViUXhSeVpXVCtIaGd6WVdYNHBH?=
 =?utf-8?B?Y0dsNHIzTElQWWNQdnNxRW1SSnIydldXUmVrTDRHUDdlVjYzbHNmWHBreW5C?=
 =?utf-8?B?Y0pVTjZhaFhsYXdvY2U0cEVCVTYvNHROcUwyTmNsbXJQdXZ1NW9GakxYS2N6?=
 =?utf-8?B?VGZDalpMS0NmSW80bzM4NTlrQ1JRczNlZnNscXRMVVRnYU5PRGo5M1JQbGND?=
 =?utf-8?B?dzVXUnc0K3J3VUx0VWs3UVFiQmlTeFpWNTlWKzkvSnd6TjdXNWZ3cjVQSVpB?=
 =?utf-8?B?MmpSZGp3YjUrMkpVVVg4WWRTMnpETU9xeStvNlRwQnUyQUxxbzQ3d1lnN00y?=
 =?utf-8?B?ZFZIdFkxbG16eW85ZWY4ZUlhUmRyL1QvenlHU29sc1I2bjJYaFVYbXJDaEo0?=
 =?utf-8?B?aHhqbHlOREhjQnhBYWFQTXU1UitVbnQ2bUR0Mk9kdWxSM2JGaWlGZENRdER0?=
 =?utf-8?B?dDlzaytkWGNDVmpRSU1VR3Z2QnZOUVlZSkF2SEZ1OWZYSURPS3JPeG5FSDVI?=
 =?utf-8?B?Wmc1dnpyRmp0SE1KaW8yZ1I1ZXRrWjhhbzFpZkY5TVpvQTYvSWVGbk9uS1pJ?=
 =?utf-8?B?WUN1dVN0bkRKTU5RMVVNdlpiTEdZbEVXMGdVOWRJUUM5S1RpaW5ySXNGRW9o?=
 =?utf-8?B?V0lVUVZtMFdXUjdvM01VS2JmRWFjMDYrbk94UU5pVkJHZTJmSU5xVWVhK3Q0?=
 =?utf-8?B?WTdZUHJxSDBmQTJOeVQyNlVIbUUycHdRT1hHZm93cStJdCtWeXZ0cHBuNllN?=
 =?utf-8?B?S1QzR1dmRGpHVlB4aFdxTUtFS3FqSjJYbytKbS9pY2Z3QUdlR3gwQTNuZSs0?=
 =?utf-8?B?SjFpWlpMajZoL0diUnQ0NEdsY3FuZ0JsSnBkZUZ2NnNsdXpZVWxsZFdDbWxa?=
 =?utf-8?B?U1B6cjFjellPWnovcnRmRzBzVXZ6L1NJeUpqZ2RTZWJHYVV2RjBPSldZNlI3?=
 =?utf-8?B?c1AyTjFFUFhFdGdzYnpieno5dHZjcUR2NkY1aTdpdUJad1hBbkljSDJsVHNx?=
 =?utf-8?B?aHo5cURwQkRxKzRURU5NM0RCV21LZHVxOTM0TXV2a0FveE1SMzVkQnY4QzZM?=
 =?utf-8?B?ZUNQa1JKZmFaenRIbWFkNDRvdW90MmIycHREaHpVeEpIMW1JREdOMjRRdXN6?=
 =?utf-8?B?ZU9SWEZIYUlBeGYwOE5HVEJodU5HandsNDlMZ3RQTzhSaWxwRSszQTZRdkpr?=
 =?utf-8?B?Skl2Q0p1YStBWEJQa2VER2V6ZnNRM0RkUHBqNnF1bVY3MUozSVhvcXp5T3RS?=
 =?utf-8?B?anZYMGJNYzFoNUd1RTgwRnZJT3FCbWhoclpmOEwxcFp0d0VCZHI4WVhUeURp?=
 =?utf-8?B?THluQzMvQnU0bnJkNUZEY1lwMnhNay9Dc0RCdkJLcC82K2ZmQldwQU1XdTA4?=
 =?utf-8?B?KzRzQU5jRk0zVndSbWI5VzZHYzM0eXYxenMvWUNLOVg1djRSMVFuNmFtT0hU?=
 =?utf-8?B?RVpVdHhra0h6N1RYZmt3NTZubFkzRW95a1pPeUZFN3pkWnJyVFZmWmlESk9l?=
 =?utf-8?B?UXNlYnVNejFKNXZ6MVNjSE4xS3FFQWdQcXZMaDJBUUQyamd2elF6ZitlMGky?=
 =?utf-8?B?ajFKT1EyL0Y1U3RINjVpdkM4OVlwTHY3Q2MzWGJKdWhkV0RsTlNhSW9DVGxF?=
 =?utf-8?B?K2cydit5a2dtSm5Kc2swOTYrRkRXZmpydHMxVHBPclo0THh3MzhWdHZydHp0?=
 =?utf-8?B?eEs1M3I3c1RKc0x5bjFNRmMrcldHQndWVWJWYlJ1ZnNaS1JTK3RVR1U2TXhm?=
 =?utf-8?B?eXQxcFM4YnpRWUlMNXlSY25xbGF6bWJXSHFVb0w1V1dFaDhzc2E2VG1XeE5x?=
 =?utf-8?B?d3B2TU9Rc1B1QVZ4Rm5PbTVRMlFEOEppOGhYMjJKNm1MeWxiN3VhRkdjQXov?=
 =?utf-8?B?bHpWdkhrbU1Xa0o1SXpmb3o2V0pITnVadkxvUUdDNTBrOUxmZ1JZVmN6b3N3?=
 =?utf-8?Q?p32cAFABwwtYm2QAyXIjJ1I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da1859d-e171-4bac-c0e5-08d9fa92ef70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 08:18:44.0980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xoO6pvE4Vp70S7Gm4oaVZ3H0oRN8sQUq7gOPZXBRgv4UyaJsJHKMYfKWrWUm5r+jcfKiVsAHVm3qXnHPv+UyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6181
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

On Mon, 2022-02-28 at 07:57 +0100, Marek Vasut wrote:
> On 2/28/22 07:37, Liu Ying wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Mon, 2022-02-28 at 01:45 +0100, Marek Vasut wrote:
> > > Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> > > and is completely different from the LCDIFv3 found in i.MX23 in that it
> > 
> > In i.MX23 reference manual, there is no LCDIFv3 found, but only LCDIF.
> 
> See i.MX23 HW_LCDIF_VERSION MAJOR=0x3 , that's LCDIF V3 . MX28 has LCDIF 
> V4 .

Ok, got it now. AFAIK, the SoC design team calls i.MX8MP display
controller as 'LCDIFv3'. Those in other SoCs are called 'LCDIF'.  There
is not even a register in i.MX8MP display controller to decribe the
version.

> 
> > > has a completely scrambled register layout compared to all previous LCDIF
> > 
> > It looks like no single register of i.MX8MP LCDIFv3 overlaps with
> > registers in other i.MX2x/6x/7x/8x LCDIFs. The LCDIFv3 block diagram is
> > totally different from the LCDIF block diagram, according to the SoC
> > reference manuals. LCDIFv3 supports SHADOW_EN bit to update horizontal
> > and vertical size of graphic, position of graphic on the panel, address
> > of graphic in memory and color formats or color palettes, which is not
> > supported by LCDIF and impacts display driver control mechanism
> > considerably. LCDIF supports DOTCLK interface, MPU interface and VSYNC
> > interface, while LCDIFv3 only supports parallel output as a counterpart
> > of the DOTCLK interface.
> > 
> > Generally speaking, LCDIFv3 is just a new display IP which happens to
> > have the word 'LCDIF' in its name.  Although both of LCDIFv3 and LCDIF
> > are display controllers for scanning out frames onto display devices, I
> > don't think they are in one family.
> > 
> > So, LCDIFv3 deserves a new separate dt-binding, IMO.
> 
> It seems to me a lot of those bits just map to their previous 
> equivalents in older LCDIF, others were dropped, so this is some sort of 
> new LCDIF mutation, is it not ?

I say 'LCDIFv3' and 'LCDIF' are totally two IPs, if I compare the names
of registers and the names of register bits . 

> 
> I am aware NXP has a separate driver in its downstream, but I'm not 
> convinced the duplication of boilerplate code by introducing a separate 
> driver for what looks like another LCDIF variant is the right approach.

Hmmm, given the two IPs, I think there should be separate drivers.
 With one single driver, there would be too many 'if/else' checks to
separate the logics for the IPs, just like Patch 9/9 does.  The
boilerplate code to do things like registering a drm device is
acceptable, IMO.

Aside from that, with separate drivers, we don't have to test too many
SoCs if we only want to touch either 'LCDIFv3' or 'LCDIF'. 

> 
> > > variants. The new LCDIFv3 also supports 36bit address space. However,
> > > except for the complete bit reshuffling, this is still LCDIF and it still
> > > works like one.
> 
> [...]

