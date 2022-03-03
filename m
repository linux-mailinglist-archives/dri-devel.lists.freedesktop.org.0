Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF44CB526
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 03:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5B10ED34;
	Thu,  3 Mar 2022 02:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AAF10ED34
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 02:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCEXyxygmVSYWN6yRtLn55lV/EkA2LsHe7B1fCjCyyHybdWTkKXMbnaDl0pkfayVOAL97oJmhotpgWAOhPBVfpAhUB6jdbze9xpPbFyPL0BsLbVindfjmm1pv8fyR9dPLCT1MuSzsT8zSiY1vvbT3WntJ2WX9MLy9bZ2bjQqV/rqHQ/upyBOP2YsViWooWetLBfAi1tkdthKjjOK/sMbqSflmyThT0+/xqsIOoEQdov2YBChJPv1v3CSwQYagU6VS2PJpMHCOF2nuOb+z3t6UB41Ui+AvralABz3RRZcgJytdemzwSzGSpuUGILjp+H7uFrV8eRcbq8f4Bn6seYvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgicohKMmQEsZQUOK46NZ1ZkD42CD45VfYKcjk/OkM8=;
 b=LSF8LYj3fYyf7Q4vZctxSMHg/bMZ0xnXWC95eT10uLou5aAeB1d4caJUuG9KLnxcv3LultKe7Vr8Ze3+Nr3dDxBLV4mRASfO6Oe5eW3yRKakpJUuCK9J5b6Qe8USMjorLng0QOPPVuiVppFg0/mkO9WBkVGa54Nz8wQ2u4BHF/JQ2aNh6vO+8So5S86N89+7oB68DnzaqXCyOHgGADcNbblygQNefJEiNus4IQcBFxnOW57T2wNqwvcsvd4IkaJQCkv3pl1PW4tZCSomQOiDcenhw01kzPg2SUugnRlHBOb7OVNfEBUrhjUcQeF+ZX/FVc6nPi0JN7fRn8rLuYaU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgicohKMmQEsZQUOK46NZ1ZkD42CD45VfYKcjk/OkM8=;
 b=J7g6LfFiTMw1kq3ssU7Hzd7tTeBGvKqsTgM4CQ6v2vDNTSBNayRzUC9t4kJQa+JaNA6/CxDVutmoSv78zbwDt1jSCwDtaWD6Gzf9xEZdqYHKeV9zwbPWLW6E2xP4JgHq5xLqvxfU8/NUYSsaq+xjWV5K8zTRkulwP3S81olcEDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB8044.eurprd04.prod.outlook.com (2603:10a6:10:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 02:53:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 02:53:56 +0000
Message-ID: <15a6222b256f67a01ef947bb44a2737a6606ad4c.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>, Adam
 Ford <aford173@gmail.com>
Date: Thu, 03 Mar 2022 10:54:02 +0800
In-Reply-To: <7e0323b120ebd8faef162a9b0f0ab048bdb7a34b.camel@pengutronix.de>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
 <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
 <049a182d8bf75110dc5ebe72f5b58d209b64d58a.camel@oss.nxp.com>
 <7e0323b120ebd8faef162a9b0f0ab048bdb7a34b.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2bf5cfb-6bd4-4b7c-c3cb-08d9fcc10f0e
X-MS-TrafficTypeDiagnostic: DBBPR04MB8044:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB8044372FE4349FB787A5D82BD9049@DBBPR04MB8044.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojFvj+PggCkr5rIUqZFgWUuIjG+HaXXW1ouFw5GAVbm32wolqQx6CPHu2qcjZ45k32kxV+L5sj4HpMq+GHmnQlw4ryhVl65XSWRLhcIRBuNBHEnAStIPLU/p8KQ7mEYTBzxsHABGgu3HMNfBfrgLrDToXkdulj1j7iCMBd7oU06XtGVRWTprLDYWqRQJhlBU15SVcSYeB7R/WWWpClL8E1ItjkvQtqy3svYK4jXHA+0OFuxLQLmWNIXgYgfJgrZ78VnbfOu2NlxegzhtTPYeNI3nXA+3FYFqyo+uzYNKv9GoGg+GFXt0UooQykvn25wV/67AOx8ddBq3iLjGHopPFVfKd5SYkzxrdq2ss1dQ7c5OKEoZxKjEC4NxPHP0g2LH2Qx/8I3xLqf2zKsfadEXG1W9DjMlg4b2RMhSDlkfiqB4fKz1Zro/bSVPgLnOjuzQiIIpSyUVemM0CYPJZpyyhAQvlW9nOvrlRbTmPWLfm1rW1eNs+TSkkSUs47kIqXJ9Z7DYkvAzuG0BmrgYMMVHmFcZzdISobD2e03ndQe2iy/xQNNcZ7ppGThQS6UkjcVdYXpABZ9TOvTl2lGeeia5sfz7z5I4ftUOk7tFgVqxRmhI+yAPbxxASyNyEgjDuRNujhyzzO8ninyNz3YbVWvLC1OX2LtxQ73vkMCwE9ZRocQlQruQBBlK4zBxlXQnIcGtzdU+MLmhQlWpikHCI3GfZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(316002)(4326008)(8676002)(6486002)(508600001)(110136005)(54906003)(86362001)(38350700002)(38100700002)(2616005)(186003)(26005)(6506007)(6512007)(6666004)(52116002)(53546011)(2906002)(5660300002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHV3dHpyaXlBQjFpUzUxZXJFVkFUbFJwaGRmbTRzdGJuWmV2N0ptbUcvNWs0?=
 =?utf-8?B?TklzY1RIQkxHNDJvTHViWms5Q2RGTjEwRHFXZUFtdi9Bank5cFdtTnYzTU9H?=
 =?utf-8?B?T3RoOVhQTVU3SEdSMUJaNnBvTlMrRU9DVVN5c3F0ZnFOOUZVUE9rdG53V0hj?=
 =?utf-8?B?Z0sxamdGTExoUGdvRkx2cUpBR25CRUdnRm9XOTFWaVRrdVBkSS9oMHAxazhi?=
 =?utf-8?B?d0w5VlQwL2kxZy9TUm5UbUkxMGdLZ0NJUGgrMTJIVWM4K0xPd0tnblNSK241?=
 =?utf-8?B?cVZoZzVNc0NFVjZDNVRjVU5SQlBaaXUvQytFZjBQREkxTXg0aFVuRDRndmU3?=
 =?utf-8?B?QmRab2Y4TStIOTROTUpDT0pVWVlzdEoyVDR5OGVpdUx2Y1k0TEVxb3JPNkg2?=
 =?utf-8?B?NHZDZFZJTjhaVGw3eDI0SFRDOUdNRldVbVYreDcwVEV0V2svb013UktTaDZN?=
 =?utf-8?B?TzZLSTFkZC9KMHVqZzJ3MjN6R2VKS0VJdm9haHB5SUZWclNnckdpOUJWeXEw?=
 =?utf-8?B?YWdjWUJnLy9qenhCTUVHRjc0VVFmeVpxTHRWSW15M0xvYjlIejdZYkthNVhw?=
 =?utf-8?B?YWppTHZEYzJNdzYwTGNVbEpOT1ZYT1BBOWpkZnh4RXViTjM1MUhTb3ZoM1ND?=
 =?utf-8?B?ckhzaGpGWUVDQTdPNldiVnZibXNLRHZJSnJUUGVyc1pnT2ltMEYzVUlUNTJL?=
 =?utf-8?B?TGpiakFEV2pJYUZFeU0wRm5TVHdlWjlHelNGZVVSUkdGZGU3YU9vSnYyNmR2?=
 =?utf-8?B?NWFmblRKei9ta0JGaS9SNjNQRDV1VTM1RjBGUVFLU3A1TDRYTnJPQ0Q2cTVP?=
 =?utf-8?B?dzZRT0Jvblcrcm8rUDN2bTVleEdiaElzd2JNNXdDUXRQM0xnS2tIdDllcUY2?=
 =?utf-8?B?dUlxNmZTYnVxb01IRjkwQjh1QW5tZG9Gd1dYUVV0ZnU1bHBISU5uaGdTMy80?=
 =?utf-8?B?ejd1UW9RMDloQU1sOE1NYkpTcDNKMHVEQkgreXo2cHpOaWoxbHJOVFVLRnFu?=
 =?utf-8?B?Yys3V0xXL2pSRVQxU1hrcUlmQlZDQmw1T1NFaFRVR29kR2N5WnpNTHZES0Ft?=
 =?utf-8?B?N2FFTC9hc2dIRnkzY2JRSnZMOUxGUzZ2VDZxbVFKQVluY3lHaW5UeDZ3U0dL?=
 =?utf-8?B?SWYvMmVoUlJibkQwRnNXbC92OTlMaG9tYnJGQUVjRmJyMEJtR1o4M3VMSFEw?=
 =?utf-8?B?VllZQXhHTXZtdzFhRHZnZk1Yc05TRWtvQnpLbDMxelU0SzdXalZTZkVoSEVY?=
 =?utf-8?B?QThLbE0xTEtRekhlOVBiTUo0SWlWV0JUZlh6TTg1NVBCZ200UDc4anlPNU42?=
 =?utf-8?B?WVhkYXJRd2tGOEF3dXBtWklGTGtINW1hMk8rd3pVc3JwS1J6OCtvK0k2TlY3?=
 =?utf-8?B?TlZSYUpvMDc5QUg1NFVUSUNXQ2R0a24vWnFCTmZFYUc5TUN4ZDBXNkRRVnNZ?=
 =?utf-8?B?aXh6cWpLby93N3FqR0xVaENIcVo0eHZVUGl6a1g2bkJMbWt6ZUp2bmM0Skw5?=
 =?utf-8?B?YXhIWDFSUUpLNGVKRlpKNE5UUThrS1NQME0rVHZMeUU2Q25kaFRvWGcrVmdt?=
 =?utf-8?B?ckJFYjBYYm9TNTRxakEvNkt0YXpOczNsbVRBdVA0T2pyQkN3Z216c0ZLODBO?=
 =?utf-8?B?ZGhpWnhBSytGM2N5WUhyMHZLOWRsS3YrVnFmSEVTL283aXVIRUNOZTlHVlVW?=
 =?utf-8?B?UXN2T2tHRUlodExRMmJqVEJDKzE5WTZTNmJWdDAvRHB5LzVEei9mWUN6YTQ5?=
 =?utf-8?B?ejNyY2QzVTZiVmNKbXh0cmdRT3IxQWVmMUkyTlFneDdjTk1OUHJmZDZaNklo?=
 =?utf-8?B?VytMZUk3dnQ5UndkVzJ0OFM5emk3QXVQYkY0TlQzbUpRQ01wZUJqdFVkRHg3?=
 =?utf-8?B?eEN3endPRmswVkZDUzZOYmdNR2VMM1BqOGpDRkVVMHhNdkVUb3FZNHRkakpU?=
 =?utf-8?B?bzd0eG4wWXZaNS90d002ZmtxUUlsVkdHOVFRZEtwMEtibm4vYWJrWU1OMjZU?=
 =?utf-8?B?QmRxc1VOMVBvZ3VESCsrWXVmN3luQVo5dGJIZXJaMU1YS0lWK2hWeHJnRThL?=
 =?utf-8?B?RDE3U2hsNTNWV0RHYTF0K1JORVFFY3lqQkZHcmJqcFRpbk5RUXFkN2F1b3c0?=
 =?utf-8?B?aWVTa0k1eXh5UmRvMGhueDJra3FHdGptWGNFUUR3SmhKeGNUSmZiNlIzWTdF?=
 =?utf-8?Q?w/JiT2/dbn9xCaycIB/lrjY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bf5cfb-6bd4-4b7c-c3cb-08d9fcc10f0e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 02:53:56.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2DdKdUcjja7Or2Slj/Rus7VsYKiTE1DO4GI/UFbHeqzl8IViUOhYZ3kuFebBc2o39v5dep3Yw8sx+r4HbR0ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8044
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-02 at 12:57 +0100, Lucas Stach wrote:
> Am Mittwoch, dem 02.03.2022 um 17:41 +0800 schrieb Liu Ying:
> > On Wed, 2022-03-02 at 10:23 +0100, Lucas Stach wrote:
> > > Am Mittwoch, dem 02.03.2022 um 03:54 +0100 schrieb Marek Vasut:
> > > > On 3/1/22 14:18, Lucas Stach wrote:
> > > > > Am Dienstag, dem 01.03.2022 um 07:03 -0600 schrieb Adam Ford:
> > > > > > On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > > > Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > > > > > > > On 3/1/22 11:04, Lucas Stach wrote:
> > > > > > > > 
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > [...]
> > > > > > > > 
> > > > > > > > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > > > > > > > logics should be fixed for both drivers. Naturally, the two would
> > > > > > > > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > > > > > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > > > > > > > 'if/else' checks(barely no common control code), which is hard to
> > > > > > > > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > > > > > > > and 'LCDIF'.
> > > > > > > > > 
> > > > > > > > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > > > > > > > boilerplate anymore with all the helpers we have available in the
> > > > > > > > > framework today.
> > > > > > > > 
> > > > > > > > I did write a separate driver for this IP before I spent time merging
> > > > > > > > them into single driver, that's when I realized a single driver is much
> > > > > > > > better and discarded the separate driver idea.
> > > > > > > > 
> > > > > > > > > The IP is so different from the currently supported LCDIF controllers
> > > > > > > > > that I think trying to support this one in the existing driver actually
> > > > > > > > > increases the chances to break something when modifying the driver in
> > > > > > > > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > > > > > > > on having a separate driver for the i.MX8MP LCDIF.
> > > > > > > > 
> > > > > > > > If you look at both controllers, it is clear it is still the LCDIF
> > > > > > > > behind, even the CSC that is bolted on would suggest that.
> > > > > > > 
> > > > > > > Yes, but from a driver PoV what you care about is not really the
> > > > > > > hardware blocks used to implement something, but the programming model,
> > > > > > > i.e. the register interface exposed to software.
> > > > > > > 
> > > > > > > > I am also not happy when I look at the amount of duplication a separate
> > > > > > > > driver would create, it will be some 50% of the code that would be just
> > > > > > > > duplicated.
> > > > > > > > 
> > > > > > > Yea, the duplicated code is still significant, as the HW itself is so
> > > > > > > simple. However, if you find yourself in the situation where basically
> > > > > > > every actual register access in the driver ends up being in a "if (some
> > > > > > > HW rev) ... " clause, i still think it would be better to have a
> > > > > > > separate driver, as the programming interface is just different.
> > > > > > 
> > > > > > I tend to agree with Marek on this one.  We have an instance where the
> > > > > > blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
> > > > > > but different enough where each SoC has it's own set of tables and
> > > > > > some checks.   Lucas created the framework, and others adapted it for
> > > > > > various SoC's.  If there really is nearly 50% common code for the
> > > > > > LCDIF, why not either leave the driver as one or split the common code
> > > > > > into its own driver like lcdif-common and then have smaller drivers
> > > > > > that handle their specific variations.
> > > > > 
> > > > > I don't know exactly how the standalone driver looks like, but I guess
> > > > > the overlap is not really in any real HW specific parts, but the common
> > > > > DRM boilerplate, so there isn't much point in creating a common lcdif
> > > > > driver.
> > > > 
> > > > The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of 
> > > > that, there is some 400 LoC which are specific to old LCDIF and this 
> > > > patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of 
> > > > shared boilerplate that would be duplicated .
> > > 
> > > That is probably ignoring the fact that the 8MP LCDIF does not support
> > > any overlays, so it could use the drm_simple_display_pipe
> > > infrastructure to reduce the needed boilerplate.
> > 
> > The drm_simple_display_pipe infrastructure is probably too simple for
> > i.MX8MP LCDIF, since it uses one only crtc for one drm device. i.MX8MP
> > embeds *three* LCDIF instances to support MIPI DSI, LVDS and HDMI
> > outputs respectively. To use that infrastructure means there would be
> > three dri cards in all. However, the three LCDIF instances can be
> > wrapped by the one drm device, which is not the boilerplate code in the
> > current mxsfb driver may handle.
> 
> While that may make things a little simpler for userspace, I'm not sure
> if this is the right thing to do. It complicates the driver a lot,
> especially if you want to get things like independent power management,
> etc. right. It also creates a fake view for userspace, where is looks
> like there might be some shared resources between the different display
> paths, while in reality they are fully independent.

Trade-off will be made between one drm device and three. My first
impression of using the drm_simple_display_pipe infrastructure is that
it's too simple and less flexible/scalable, because SoC designer will
be likely to add muxes between CRTCs and encoders/bridges or overlay
plane(s) in next generations of SoCs(SW developers don't seem have good
reasons to suggest not to do that).  Another concern is that whether
the userspace may use the three drm devices well or not. 

A few more points:
1) With one drm device, userspace may use drm lease APIs to control
those independant pipes with drm masters(not sure about the userspace
maturity).
2) Code to gather all LCDIFs as one drm device has chance to be created
as helpers once there are similar use cases in other drivers(maybe,
there is/are already).
3) Power management doesn't seem to be a problem, since each LCDIF has
it's own struct device which can be used to do runtime PM at some
drm_crtc_helper_funcs callbacks.
4) Regarding the fake view of shared resources, atomic check can handle
that, so it doesn't seem to be a big problem, either.

> 
> While we do something similar on the GPU side and collect all GPU cores
> under a single DRM device, I'm not fully convinced that this was a good
> decision. It now comes back to bite us when the SoC topologies get a
> little more interesting and e.g. devices are behind different IOMMU
> streams.

Right, SoC topologies may change, like the aforementioned muxes.
Generally speaking, I think one drm device is more flexible and
scalable than three.

Regards,
Liu Ying


