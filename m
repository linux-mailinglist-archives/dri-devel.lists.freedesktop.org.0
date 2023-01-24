Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6836679BA5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B01A10E68E;
	Tue, 24 Jan 2023 14:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2083.outbound.protection.outlook.com [40.107.14.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CD710E68E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 14:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biC7tXNCGcD5lutCUGEHoCLsufbeXV/oxcF3Xm84xi7QMH1YoRWxydH4mRjBJohCrtmIKLG+f3wBU19zXfUpZ0xjPOQ0U3F7OzgB3/JQsmq/30gbWEvq6rxSO3EJXzv+xsRqOUT4WR+fBibr3Fsy3VslZPo5mYV8tDv9RvNNbiAMqDISrDISRP1JtVjN2FXPe/MfQcadURu0JV+APkLa7pCPFcOEBJbuXdVd7wzacTFDqv/jsqxTczRLv9JIh1AWJIII7AQiYpSLaw7EXAdnSNOWXHxUUpG1A3SOaKgpcIwVjFlmKpB7xhCpybU/MneYo4ii3mmk95ZLMjQZI6bwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jii+a1dy2p2/gymryjK8h5Z4O11MbWgGBSDynhGWguc=;
 b=aZwCXb/Cw6J2pFnZwy4YrwWJTiKGf7ENrLlpuwewR302mHCJIhRYxOycsG/RpboDTH7EDqFQzm6B9cy+8bIMddle82sbgbZpIzk7imDWZBpC8tNJNTEql4+XVnchjgQFOgA30SaQMsKKQlS1gDS62EoYPB/pxQXP6uzcgXpeMDkdlpiMQoPbm3v2lnisOBvqo/nVteC/CBPacJgrl1NyW55fahV5osGjO2CYZldzrgUa0FBOePEVfSOO7qLQvMaK/MB+aj2jpFay3LcOQfYC2FQPIr16zp9nMD0Zp607qhriMPwi27RGw4ze+VNN0FvYqpotECIiUhzSd9LRT+7eWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jii+a1dy2p2/gymryjK8h5Z4O11MbWgGBSDynhGWguc=;
 b=mgbgnkuvYytKClo+JnYMW0cy2xb9bhXW0V5QX1RVIxsCVmmhnc2Tr998aaULG8r0rvADnrco8To96EIHbgNQp+fyxQuw1xLwGG9jibDTFaocbJ1/MCGY4ZV3MRjBok63JchHxMahfXvu6Nj0QExAHAYeP60EsVqZaNX7rfLprNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 14:22:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 14:22:28 +0000
Message-ID: <f5c3430fef6795ba4cc52b27a7732da5ffce7bc2.camel@nxp.com>
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 24 Jan 2023 22:21:51 +0800
In-Reply-To: <13189854.uLZWGnKmhe@steina-w>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <ace76615-533a-9295-8271-95262859d287@denx.de>
 <7ac57bc28da40df054c81fd74f69207af66ad97b.camel@nxp.com>
 <13189854.uLZWGnKmhe@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0010.jpnprd01.prod.outlook.com (2603:1096:404::22)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 521eb3dc-e2b6-4436-1d1f-08dafe166c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lfb9hoq1SY8y4ruQAWfhGXSOEutP/AvrZGi7eeRFo2SgWltqqNL/dwASebBrGw9zDBH3pCu+geubkItaraCyeN4I8b6LW9XeEp8mN7hAedX8tb0iFn1A0qNWCO7QQYhlBcQ6MXB5/X31gI6oyMe83KQ30yFRtWDwWSjf08jpZT3ZcMw3KY5IX40kxW7ishWNOUvp+7y6TJyTVkrmtZk0N+1b2HSRX2+jz1GTdKPd0MlJW0OdgvovnK2t+AT7uXjDPLjSoAatFarBwCwjlx7QZRv3AAcSuF/VXFD6l8X4EoUIIFTy53jQayWB+TUPJ2ZNOKJPu22V49J4MqpI43ZbetZAAbIeTaxZZDWB9aHzd0LU87TzU9ZKs2yIq1Izz900Hbofc+5PIMOypcn+HdNujAWpFQe0EzkCVXs1rW+hsJ/nyWxkcK9lQRTQ1OmqS44h6qfyj1AyJPrgYWpz8hmJlfXzeBvd1FJGoTu+ZWWDFYUvThrOXH/Q+0BJ4R1ouzv+8n5rrwIY+RJmMWnIFDDvH44vv4yW4P2bywWzohY+1AutmHASjF997nyIcRxpNTxgbPnh17/65xQr6HfBtLD+rcWXFoXq7rs1VaR7bOLSFmRdB+B/jAdHQcTXDNhhdWNZGM1zm32AMHfUz2aDW+M/Pl9liZ21ZQzTFYEJht77p0WvBjpVMHA2H9443vvruhdHCz0NGO0pPVHK/l7R9DPoMFIqtItdzv3jeed6gWde700=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(2616005)(478600001)(2906002)(41300700001)(38100700002)(38350700002)(5660300002)(7416002)(8936002)(66476007)(66946007)(8676002)(4326008)(66556008)(36756003)(86362001)(186003)(6512007)(26005)(316002)(52116002)(6486002)(83380400001)(6506007)(6666004)(53546011)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRaVFNlNGdFcEQybHVMazB2WVBuVzRQektWd0lLOFcvbThwSXF6S1BZc2lK?=
 =?utf-8?B?RXFkQm0vSkJSYmRuRS80YksxM2UyY3cvdllEQjVOL1R6dm02eU9hQ1FIZjBF?=
 =?utf-8?B?d1QxWjRTV1gvWE43YS9UbEhtNS9ybXZEZDdkc09OdzZNVytOV1FGd1hJczVO?=
 =?utf-8?B?N1lObXV3VVRmQmhHaXZoanFzMmhvSStob0xnbEkwM01ZTEZPVmNud1ZobTFF?=
 =?utf-8?B?K0VaUEdUanB3NG91d3Exa3BPU1FOZnFSbFY5elpZZzJxSjk3Wnh6U3lQUkdl?=
 =?utf-8?B?N1MxejBDR3hTcHhhZlZqOTk3dDdYeEN6Y3ljQmNUeXhBVnNsbHgrdjV4QmZX?=
 =?utf-8?B?c1UrTWhsclFjczN2N2tzUEJ0ZzR3THpSTHFUNmFwQTlDVitwdFZYb3k0cXhO?=
 =?utf-8?B?NzEyeHNGdFUwQXRmVE9nMW04ZkFVWVVDTElUbUE5amZJeTBRZTQ0QTk0Yjg4?=
 =?utf-8?B?R0hSWUllNFlvcWVSV0F5RzB4V3lTWWlJbWJaQkFxV042ZkxMbzkxTUNTNi84?=
 =?utf-8?B?TVZkMnRDUThka2t0T0lrdnNUdHlvQysxSjM2Mzhnb0tCaG5lOVdnUkVwdDha?=
 =?utf-8?B?N3FGeDFXNlV2UUxCQ1ZFcng0cG02b1F1ZlNCVzcrTWdBVWR0SzhYRnBqVkZL?=
 =?utf-8?B?OFk1VW92MFdUN2Y0Sk5uK1pkUzkrWFFlS05sbk5oUDVvdVVPMnFScnIydHJn?=
 =?utf-8?B?YjA1L014UENZamdyRVVsV2xaYlRRam5qb3JOZGlzZkdXanhLK0ptdFZTOEdj?=
 =?utf-8?B?RGhKeWdReE4rY1QrVHN3N1MyUVU1WlJidzN6eHEyTWRZeEFNWnJENGNwbjVN?=
 =?utf-8?B?ZmJFOXZGQkdoZ2dSQ1VXcHd6VDM4MTNOaUQ0MW4xWEZNN0RPNWZQZzdWVVRM?=
 =?utf-8?B?eVZudXArTFBFd01JRXg0QjhjKzZ0UDNvY0NjUlBRbE5hbG5tbUJhZ2kyVjI4?=
 =?utf-8?B?eVRLZFIwSUw3czlpY0g3OXJVblRWYVpYLzZ0SEJVSE4xZ1JGdHEyRVJxZW1s?=
 =?utf-8?B?MHlCWERNQW5EK3dVMU1Qa1U5MHhBKzRwZXJoV0JJb3ZyOXJucUFHZXJ3U3VN?=
 =?utf-8?B?QWQ3MXFjTjQybXMxcW5aUkIycjM4emZqUlI3WStJaTZsSkNOcDR4U1BHRFg5?=
 =?utf-8?B?WjZpYmYzNEtINHkwWUhjSmJYRlIyQVlRaktIaXVvY2RYQVVxaVJ2YTdadFEw?=
 =?utf-8?B?S0RsOGVWSVRsQ1U0bnE4NWhJa01QVmlBeW1IZTN3RCtpYmExZ2FIQ1psUGM1?=
 =?utf-8?B?T08yU004a2dyTVFaZDR0WnJPRDhFNUNrMFV5U1h5MHZEM2NpQ3FYaG1XZjRX?=
 =?utf-8?B?WlpERWpKbE9vRWE4cXRUdkZGM255dDJ0MkJiVnRkWlZvQXB6ZFBndG5IQ3cv?=
 =?utf-8?B?TzBOVXhBVlBEWnJFT3lPcTZScDRxWTJEa3IvTDdOTkd0N3VDeTlVU3pzOUp3?=
 =?utf-8?B?MC9VRzhsT05MT1ZTMityVDRnajFzM0V0eHVvNHdhcHFDZXJyS1oxUlQ1S3V0?=
 =?utf-8?B?OHRuY3NMQnkzU09VNnBkZ3YrM3dDTTJMYTAwcUtvVElVb29USWEyZ0NWT09P?=
 =?utf-8?B?QytNTzZwZWdwN1lFOUlBQUZBTzJkS0RJVmlFbGwyN3hoZytzZ0NicnZvZWFR?=
 =?utf-8?B?K2FFMkNCTDFVOVRTdFNhUlliMExtS3hubitzMDVmcU5BV3FpMmh3T3kwSjB2?=
 =?utf-8?B?ZWdrenBjNjJYcEh4elV3OWxwenc5TmdFUkxSeTJUQlcyY3prL0JDRjBEMkMy?=
 =?utf-8?B?NkZmMHVrOFgyWHhJQXAyZGk0OFNkNFkwcUpndzlWd3R4ZUlkN0lDZHQ3Z3Y1?=
 =?utf-8?B?U2IzdnJhb1oxSGs5MHpUOXgvN3I5VVk3d0dhR3FpcmwzdTZGbTdneUdudVlG?=
 =?utf-8?B?RzVKVDJra3lrcEdlS3Q3ajg1MDNINUxrbVhOUmxrWjhjQjM2cTA2eGpNbm1E?=
 =?utf-8?B?Vnc4RUpOQTBTNDVmYzFOM0FSTmRIUHVhTUhyUmZxaGlCbUNtNkhYUmdUUmNy?=
 =?utf-8?B?TTBJSkdERVZEY0pRVkFHU1p1U0ZhVkNQczlaS1cvOWFWdmNBQnQ5VGs2eU1E?=
 =?utf-8?B?c3dEWkcxZkMwSGEreVJ3ZnAwWi9SUnVIczZzVzJmWkFETW1OZ3dIR2NtNW1K?=
 =?utf-8?Q?YoyLZ4TuDiUyo6gybYYVdObEo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521eb3dc-e2b6-4436-1d1f-08dafe166c06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 14:22:28.5171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggAC2KpRvT+r8gWB2okYu4341UW1mvImW46sEEyPXJIq6268EcehJMIwlG1peFWEi+o6eMP4wvn1OO02qUgBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9594
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-01-24 at 12:15 +0100, Alexander Stein wrote:
> Hi,

Hi,

> 
> Am Dienstag, 24. Januar 2023, 08:59:39 CET schrieb Liu Ying:
> > On Mon, 2023-01-23 at 16:57 +0100, Marek Vasut wrote:
> > > On 1/23/23 08:23, Liu Ying wrote:
> > > > The LCDIF embedded in i.MX93 SoC is essentially the same to
> > > > those
> > > > in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI
> > > > DSI
> > > > controller through LCDIF cross line pattern(controlled by
> > > > mediamix
> > > > blk-ctrl) or connect with LVDS display bridge(LDB) directly or
> > > > a
> > > > parallel display(also through mediamix blk-ctrl), so add
> > > > multiple
> > > > encoders(with DRM_MODE_ENCODER_NONE encoder type) support in
> > > > the
> > > > LCDIF DRM driver and find a bridge to attach the relevant
> > > > encoder's
> > > > chain when needed.  While at it, derive lcdif_crtc_state
> > > > structure
> > > > from drm_crtc_state structure to introduce bus_format and
> > > > bus_flags
> > > > states so that the next downstream bridges may use consistent
> > > > bus
> > > > format and bus flags.
> > > 
> > > Would it be possible to split this patch into preparatory clean
> > > up
> > > and
> > > i.MX93 addition ? It seems like the patch is doing two things
> > > according
> > > to the commit message.
> > 
> > IMHO, all the patch does is for i.MX93 addition, not for clean up.
> > Note that the single LCDIF embedded in i.MX93 SoC may connect with
> > MIPI
> > DSI/LVDS/parallel related bridges to drive triple displays
> > _simultaneously_ in theory, while the three LCDIF instances
> > embedded in
> > i.MX8mp SoC connect with MIPI DSI/LVDS/HDMI displays
> > respectively(one
> > LCDIF maps to one display).  The multiple encoders addition and the
> > new
> > checks for consistent bus format and bus flags are only for i.MX93
> > LCDIF, not for i.MX8mp LCDIF.  Also, I think the multiple encoders
> > addition and the new checks should be done together - if the new
> > checks
> > come first, then the new checks do not make sense(no multiple
> > displays
> > driven by LCDIF); 
> 
> You are right on this one, but on the other hand there are lot of
> preparing 
> patches already. Even if it is useless by itself, having the bus
> format & flag 
> checks in a separate patch, it is easier to review, IMHO.

TBH, this way of separating patch looks too artificial. It's odd to
check consistent bus format and bus flags for multiple bridges while
there is only one encoder.

What I can do is to make a separate patch to introduce the
lcdif_crtc_state structure(with bus_format and bus_flags members) and
determine the format and flags in ->atomic_check() instead of
->atomic_enable().  And then, add i.MX93 LCDIF support with an another
patch which adds multiple encoders+bridges and new checks for
consistent bus format and bus flags.  Sounds good?

Regards,
Liu Ying  

> 
> > if the new checks come later, then it would be a bug
> > to allow inconsistent bus format and bus flags across the next
> > downstream bridges when only adding multiple encoders support(also,
> > I
> > don't know which encoder's bridge should determine the LCDIF output
> > bus
> > format and bus flags, since the three encoders come together with
> > the
> > three next bridges).
> 
> Agreed, this order is a no-go.
> 
> Best regards,
> Alexander
> 
> > Regards,
> > Liu Ying
> 
> 
> 
> 

