Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A04CA101
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E140A10E5A9;
	Wed,  2 Mar 2022 09:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DB410E5A9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+kgP8XnXau2DQMdeWUVr+0WbFiDgnagMhS41mF2SB6dSMSpr0RMMTYhMTAlr6EfALkmtNerPDbKPyGHwbI4kiVLM4Do4uSZB1oTnkNaqIl6QO7S7hv69Nvou3K13FcyV2wLxrJqH8uzf0lBSKj1iCneNREA2N1UrtrYX/484Jlljdqb3tQ2aIOh4GP4aZ6Xj97lhGUnOuB45Y0f/x8qFRXBYqJyprgE4ZKtLxr/XqvCf6g7H+oi5A7CiUCq2zWdh3UTK0xipPKiq2mrhQkMw42SBaiCedC2UCN9XQCtGkLDR40/9/etZG7crYneNdZM9pzivUKNZPBuTi/P5b3P6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d2N4nrON3p3Stm/A+nuG4ue1eoE6b5mJ3QJfkprQIU=;
 b=QOFygTQuJoHGnmZ+lAgcpS76dM83pi//aCmbIlvJhGbuC4ZicxxxAM4fDkpbkWyLiegD64l8he96rBteWLL+/th5diI1wGtHyLx4D0/QvW2Hbc39tEQz1X3Ig4uEALBsd0wQ7odv2uKKCaFnL7AtN9EGXp0+G+3/hbKAE3diQw5A5eNmsOgT5Xe030Qq/erLVWqvpNsdgVJDN69eN6Fq0aXltM/7X3vaxuVbeWVCIlMIyZwD54afEZ5wEDQXfxbNSY5fMbYIWybNYy70hgCLrFkDhqILhRFF/xjK0DpvxOxKar06JP4d2EFJweVTJzkvr5MoI5/f9l3JNX18B2ls1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d2N4nrON3p3Stm/A+nuG4ue1eoE6b5mJ3QJfkprQIU=;
 b=VUhUiIrdsI8yRtHAQiXr0Ddw2a7GyxVuL3ZPUVJdSwrG3E8RoGnKGew3mAhEKRJNug6Uz6Y5Rh7YyCvaTSVhvLdMr9Fnzwg/HNXwS3oXf9r0VuEyPxG1Vd6w3sNpmMHiRp+I9ThBy8MmiPbe7rehkyaWwK66bZHcMo0kXBmBsg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB4253.eurprd04.prod.outlook.com (2603:10a6:803:3e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 09:41:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 09:41:36 +0000
Message-ID: <049a182d8bf75110dc5ebe72f5b58d209b64d58a.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>, Adam
 Ford <aford173@gmail.com>
Date: Wed, 02 Mar 2022 17:41:39 +0800
In-Reply-To: <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b956355-a3f1-4f31-05c2-08d9fc30d82c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4253:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4253A5B7AA09DB75CE4D0257D9039@VI1PR04MB4253.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeX3KE0pRsTRFMjmlv3uFiNVXm0obW7+ZTUyXkOSIy6HoWRjgsx6DR2kAuQmpNr61YIPPEcOkJK0rW8XSnSoC75v1Czh97VtvoBxAK4naWKKdHSLQb/WYS+7rleEhggxcP6uPBwZUKonRLV1gYr4fsUzUVyH6tlDaySR/kUvjzx97bpVuXxkYTgtfZLHzwfusTHcPdS/FMLZJVy7oMS62UzEgFOgJbmva2gf1kNM//bZIj7+SQkZoKz8hok2yI4vjbza+Dd3TxjRSX4Xv5+2vL61pCsJxLBJKffQc26Dh97fgT2YGvuYPkzIZ1MjlXFZownMHEFqBLJDH11UkRfhNV2rVv37xKcAcHG5AWf/ppRZxCdxIoWh9nMtSk6QZFmOefjjJimSiHLyQ8XyTNbcuggjxyQsOB6NCpLteyQGmBDE5TS+DKSs2X6vHNRBxa2EwetS1++FXe70cLpTJrS9fkedO27m1OgwHrrcd7U8KipycWTli+G0Q83N2+w/K7CTA9Ehf0OmBNn/6yjo16GLOxyfNbIS9mFpNr1yZqv+GR+o2KHdzrh8/mhsEA151LadgLxOnkEkM9EUhZFskh+LVUDPEa8fge05KfnyWOo5oSc45KpjfQ4BEg7aGoaSKDcyMTyw7fS+zubGOLeQqRlWXyvIl5Z8M0k7cerwC9zM+RUqYY/ooEfbj6a7Qc1kH9tSJC5eOzXmHs4UumdxsBKCtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(8936002)(186003)(26005)(54906003)(316002)(66556008)(66476007)(52116002)(6512007)(53546011)(66946007)(6506007)(4326008)(5660300002)(8676002)(6486002)(86362001)(83380400001)(2906002)(38100700002)(38350700002)(508600001)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmY1ZGpSM3ZsZVlzMjNVV0kwZUpnYi9pK2tGQTFpQTNSV1JneUFISnU0QkNi?=
 =?utf-8?B?N3ltNFZIZWg1UXNVSUltUkhTTmJPK0xocDc3QmtFSTE1VmtVS3cyVTgrRnZk?=
 =?utf-8?B?dk1LN0wxN0FwYm5qUXBWVHRvcGRRalhSL2o1SkNRYjRjc0RJYUZXY2xPcGZ2?=
 =?utf-8?B?bWt2UlNUV0NyQlBvNmE2enU4emVOV1I3alZQcWhBaTlVREZJUXo2ME9kUG05?=
 =?utf-8?B?Ni94dUd1cWVIckxBQUdOWVJ3MVJNd2lIdTF4SFNLSm94ZFY1d0xhdmYySC9E?=
 =?utf-8?B?VHVDTnRIRkNEejdPUThQb0FuTC9NNzlqbUhoR3NsTXdvTyswKzRncEM1eGdS?=
 =?utf-8?B?MjRPazRFWlFIUmJOMDVlMVZCbXVNaXJmb0YxMTdKWjk2SjZVU0NKdmxBUjly?=
 =?utf-8?B?Tzd3NWFkbFdLTklIVjEzdHkxd044Z3UyZUFjRUlxTUw2YlpqVGpQTUFiaUVZ?=
 =?utf-8?B?cFpnSmVkMFFFbjBFVm1FYW5QYXZ1c29kYlRRWHNGVlo3ZTl0ZHZIb1RCTGdt?=
 =?utf-8?B?TnUwMnFncTFhMXUzNVdlQmQyQ1RtOWFDMEh5cHpkVGNmaC9vMFpRWUpXYmth?=
 =?utf-8?B?cGsxMFV1VWNiK0xTODlGbzNCUkF0OHZ2Tll3RTYydm53VEh3WHJOYWhBcmFp?=
 =?utf-8?B?YWxtOGdiU2hmWTZnREtJZWJZVHpTUVlGam8vZnU1VDdOSW4vanJLOUtvZDRS?=
 =?utf-8?B?UEdGZXFpZmFLcVo5VCt0WjE4WlRYcWFPbDRCT3VqNnh2ZW0vYjBNeXk4U1l3?=
 =?utf-8?B?NFFrd2piakJtM2ZwUVA4ellmdEZFdlJWNGlvR25FdGdheEJ3RFhWQnFEbXEr?=
 =?utf-8?B?ZUdma0NuSmRwWkhtV2ZDMjZXb3ozd2xLRzVNU2d4bG8rajFtU2gxME14MzN0?=
 =?utf-8?B?ZEpnNE8yTXU4SDU2eThvUFQ0K2JZRWhkdnkvVXovOVNEeVJxUmNwYXN3Vnpr?=
 =?utf-8?B?cVFZT29qV2w0UHo2Ni8rT0N3RDdYRTh5R1pKNW5xeWUxUmNOa2o0MUlpS2kw?=
 =?utf-8?B?b3gvVjBRYlVLY2Uxc3IzOEcxVmJaMFBPV3d6SWxLdE8rR0lPN0pqYXkzNDd0?=
 =?utf-8?B?WDJGTXIwa3JmQytKZTNWUFd6ZGlSU2cwL3gwVGt0b0VBc2dDV3RzbExDdmt0?=
 =?utf-8?B?MEVxakRiWjlSVExGejFVNGRPb2FnWFVSNnFlenZRNnA0Y21YOHp1WFlvcTlj?=
 =?utf-8?B?SzN6WGZCRHNtUlRmN1JNQXBCT3dCQkZMaGxKUmtLaFZsSmEyZTgxM3pSdmhn?=
 =?utf-8?B?WWUrSkl0UEFxaFNWdCs0TkxCcGpqQUhqWVNjT3lXSUt0Y0hNNGRSTk9lT05v?=
 =?utf-8?B?MFdHWmlQcmdydXNBYVNYR0FackloUE5wNFFKcWI0RFRSaXg5YmdROGtobU10?=
 =?utf-8?B?RkJneS9ZaGRlbkYwTTNOMlBzSENTSEQreW1uTXlRUkR6ck5VMDhtZzVsUkJl?=
 =?utf-8?B?SHJNR0V1VlhkSFRoN3RTUFZyY2ZqaWJXc2VJOWRROTZzZzlwY3M1eTVLMDZw?=
 =?utf-8?B?NTFMT0VFNEFuTmc2L1JxSEJ1Q2pzc24rc3BUTUd4MHJNQWFMcnU3c2Yxd21k?=
 =?utf-8?B?L0FLSVhUb292WXJScE5kd2kzenV1MEszdi91bEJubVNzYis1bFNkQnNCWTBx?=
 =?utf-8?B?SzUzQ3RFMUMzMWl5TWlBeXJralBkWHY0VWlqMTkwb3ZSMlJ3emVOSjJWR1gz?=
 =?utf-8?B?bFVZazFiKy9TZUZiZ2x0VmxGQnRGd2pMbHYwVHhzcVZkTXVjU3d3M3lrejVv?=
 =?utf-8?B?OFJET0lBNjRlR00xUGVta1AyOFRnOHpGMFhuSHVsQVVvL09YMFV6MXpyaGcw?=
 =?utf-8?B?aDlDUVdlei9BVTRYcTRaYkR4cDZYNU5GM0NubzV5SVhIYmo4NXpsN21paTRF?=
 =?utf-8?B?YmRiejQyeGRkeHBmUVBaOVZUY0dRRkJHZERlTDlUaHR6ZkRvTmFIS2Y2MHBh?=
 =?utf-8?B?alU2TnhISHdCd3lXQUpQa0NlcFZXdEQ5ZTI2em85UWRsbXRzN2V3RnB4b21z?=
 =?utf-8?B?TlI1QkVvNU1NWS9EQnh4RVpsbVErT0xQYXczZ1FOY0s1am4xU3dnTG10aEQy?=
 =?utf-8?B?Y0JmejRNK0Vlemd1aVVpRzR0QzBScFlobnUvUDNDQ01abHd6a2QwTEt2d0sw?=
 =?utf-8?B?ZG9kSjkyMExFTFJuQ1k5d3Y2L2V3K0Z1SDVuSDJkNS84VUFhWTVpWlRpY0FH?=
 =?utf-8?Q?RuCNUISEb4pp7KKAqLWMcuk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b956355-a3f1-4f31-05c2-08d9fc30d82c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 09:41:36.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mof2o+LpJDJ2DahEIFXZy0OM11zhdfk8irUjgaGr6RSuuTEkYWWLRjsssmc8WO0Pin/W2VsMV4MHCU3ItRPLLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4253
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

On Wed, 2022-03-02 at 10:23 +0100, Lucas Stach wrote:
> Am Mittwoch, dem 02.03.2022 um 03:54 +0100 schrieb Marek Vasut:
> > On 3/1/22 14:18, Lucas Stach wrote:
> > > Am Dienstag, dem 01.03.2022 um 07:03 -0600 schrieb Adam Ford:
> > > > On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > > > > > On 3/1/22 11:04, Lucas Stach wrote:
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > > > > > logics should be fixed for both drivers. Naturally, the two would
> > > > > > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > > > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > > > > > 'if/else' checks(barely no common control code), which is hard to
> > > > > > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > > > > > and 'LCDIF'.
> > > > > > > 
> > > > > > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > > > > > boilerplate anymore with all the helpers we have available in the
> > > > > > > framework today.
> > > > > > 
> > > > > > I did write a separate driver for this IP before I spent time merging
> > > > > > them into single driver, that's when I realized a single driver is much
> > > > > > better and discarded the separate driver idea.
> > > > > > 
> > > > > > > The IP is so different from the currently supported LCDIF controllers
> > > > > > > that I think trying to support this one in the existing driver actually
> > > > > > > increases the chances to break something when modifying the driver in
> > > > > > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > > > > > on having a separate driver for the i.MX8MP LCDIF.
> > > > > > 
> > > > > > If you look at both controllers, it is clear it is still the LCDIF
> > > > > > behind, even the CSC that is bolted on would suggest that.
> > > > > 
> > > > > Yes, but from a driver PoV what you care about is not really the
> > > > > hardware blocks used to implement something, but the programming model,
> > > > > i.e. the register interface exposed to software.
> > > > > 
> > > > > > I am also not happy when I look at the amount of duplication a separate
> > > > > > driver would create, it will be some 50% of the code that would be just
> > > > > > duplicated.
> > > > > > 
> > > > > Yea, the duplicated code is still significant, as the HW itself is so
> > > > > simple. However, if you find yourself in the situation where basically
> > > > > every actual register access in the driver ends up being in a "if (some
> > > > > HW rev) ... " clause, i still think it would be better to have a
> > > > > separate driver, as the programming interface is just different.
> > > > 
> > > > I tend to agree with Marek on this one.  We have an instance where the
> > > > blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
> > > > but different enough where each SoC has it's own set of tables and
> > > > some checks.   Lucas created the framework, and others adapted it for
> > > > various SoC's.  If there really is nearly 50% common code for the
> > > > LCDIF, why not either leave the driver as one or split the common code
> > > > into its own driver like lcdif-common and then have smaller drivers
> > > > that handle their specific variations.
> > > 
> > > I don't know exactly how the standalone driver looks like, but I guess
> > > the overlap is not really in any real HW specific parts, but the common
> > > DRM boilerplate, so there isn't much point in creating a common lcdif
> > > driver.
> > 
> > The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of 
> > that, there is some 400 LoC which are specific to old LCDIF and this 
> > patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of 
> > shared boilerplate that would be duplicated .
> 
> That is probably ignoring the fact that the 8MP LCDIF does not support
> any overlays, so it could use the drm_simple_display_pipe
> infrastructure to reduce the needed boilerplate.

The drm_simple_display_pipe infrastructure is probably too simple for
i.MX8MP LCDIF, since it uses one only crtc for one drm device. i.MX8MP
embeds *three* LCDIF instances to support MIPI DSI, LVDS and HDMI
outputs respectively. To use that infrastructure means there would be
three dri cards in all. However, the three LCDIF instances can be
wrapped by the one drm device, which is not the boilerplate code in the
current mxsfb driver may handle.

Regards,
Liu Ying

> > > As you brought up the blk-ctrl as an example: I'm all for supporting
> > > slightly different hardware in the same driver, as long as the HW
> > > interface is close enough. But then I also opted for a separate 8MP
> > > blk-ctrl driver for those blk-ctrls that differ significantly from the
> > > others, as I think it would make the common driver unmaintainable
> > > trying to support all the different variants in one driver.
> > 
> > But then you also need to maintain two sets of boilerplate, they 
> > diverge, and that is not good.
> 
> I don't think that there is much chance for bugs going unfixed due to
> divergence in the boilerplate, especially if you use the simple pipe
> framework to handle most of that stuff for you, which gives you a lot
> of code sharing with other simple DRM drivers.
> 
> Regards,
> Lucas
> 
> 

