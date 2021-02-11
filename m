Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E13183F0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 04:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070AB6EDE5;
	Thu, 11 Feb 2021 03:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951AE6EDE1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 03:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmOfbLXrw/y4guy7WGezO+gceUHIvc0zywv8bWkp988xdDwUh0k14ghSuxMEU7Q1DUOnzIPzZqa/nZcCQ5KQTy5PIeezoPW0IWlCh7emyt/NuHnPGg/HX6suAdXvNwnph7mr1e4Kkv0D4/G6MM//iS/tASvPk1thNbS9f2R9rfnlmMrkhDjoGjEDRypO5lTstaZEwEdnEVSBATfuupLU1GZlU+QyBN6aLP2y9XnzZsNtJaijAi3g4U0D5KzgNKft3Guyi/D5CdKnBkY7y5pbwVi1vlhp9egncdCs+txlROLiVJgNceJS90q/MxCo9RTXM8kziXiqI3/LPvSMmpzzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMuwVFXd1JiJRwDcmiW7GyPp2ElUj96rW33gcSCdAOk=;
 b=iYFv8dx/1QMvhws9fudzkEU8R0Nza8mzIN0YUEKoECNFOJliCSfnpaDHkq4dk9gwYxiO0ud06hICDAi474K6UCKHzqv0gdj2cotlieOTDZ7001UgIrXPYDBeWeelXJe3XAFovhvG2ah6nAcZsqPmAijE6VH/uE6BN/vqh2Ff2kWZhg8tGi2fJAZ278sudyukqkGSyuDeHxSp28hPC3pxhLgiNcGvN8j0p2cgAaz95ihDm4FqjQTdMNb8p8as8sj0FQOEB7M/+m7lztTxaT6eubWOSedfxoojVbuXoiDZTgMSs5M87lkN5a20lPpRH3P1yks5Wbph2sj/9FDwWQibkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMuwVFXd1JiJRwDcmiW7GyPp2ElUj96rW33gcSCdAOk=;
 b=OGlvwQq0KWwCQlPrwulYpeihih6tubslKtFL/7YHivMSGIqpV6pd8lO6BZGJ/QAQah7d0BG1AIBxLO4AekrifilFCvWhlPAp4zNNAzhKWfTL8ECXAG/hqr1mS6FQ+ntHxVJsGfF7EtpIfir17sHhBtmM4ChuKKF1CupdD8o1gHE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3581.eurprd04.prod.outlook.com (2603:10a6:803:3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 11 Feb
 2021 03:26:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 03:26:33 +0000
Message-ID: <fda36d6ee0fc921d5c1126777eb4dc410499beee.camel@nxp.com>
Subject: Re: [PATCH v6] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 11 Feb 2021 11:26:23 +0800
In-Reply-To: <20210210183306.GA2407269@robh.at.kernel.org>
References: <1612879992-5908-1-git-send-email-victor.liu@nxp.com>
 <20210210183306.GA2407269@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-Originating-IP: [116.232.209.249]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vbox (116.232.209.249) by
 HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28 via Frontend Transport; Thu, 11 Feb 2021 03:26:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ff98be6-905f-4de6-a2dc-08d8ce3cd429
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3581:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB358107CF2AC823ADF625EFDF988C9@VI1PR0402MB3581.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNSU4S03fxeAY8PcSDIgbptQdSqnROpi+NorcbeHs/sBRwdsr7EHwpExDp7/ntq25Qwh7929+VR01VV94pqFc3DQsQk99tagl58vTnUEYS9GkNQtgO9ZepMxAvWTsgdp/R/cez/8ZZkfR2ae4PU641+X3u0AlPU8ARpuKXdbnPkcFv52SCDfqjItHfsOp3ss8I96Czs8iudWCl3agYXDrPCZhmADf6PXgwq4BR/ldcpjn4pjxVHKNGJDdg6cPV1dubuYqAEYeAGUEtSshkpiyIvmZQk3L/2VWYOWxnqj8pLYCHXfwnpTjPjlr44P8WRUNptDKfec1fLoj+F9O3UV1iTXs2C0NOx0QVmR7RsUT++Kx6ymeAWsLcZtVeZnYZbsJajpZh6Xgv2CNXRGPPxDTdQIuI+SSF/eYNGJvKrLvO9ZvHvoLkUVjYL/pGDcj1ntuyMhtWoh3cnPKE2ERd6v9OPk+oGHeCAFeswzkKrRE9lZYs4Gssa7IpClMXAthd7f0NRisBxASKa1RUzvDdAK+w9cDMcxX/npY3XmqcQJ+p0qDnYw3XUHJT8toFFe7pkr9MZBAE8INd4hXZR+XD8UkAZyjDL7UG1eza1j+jwJTLfj+ZGLJRCyyyM2yp32CNImI8zvOeYEdJbkwr/XumF6tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(45080400002)(83380400001)(6916009)(6486002)(316002)(478600001)(36756003)(186003)(86362001)(52116002)(5660300002)(2616005)(6496006)(8676002)(2906002)(16526019)(66556008)(66476007)(66946007)(956004)(6666004)(26005)(54906003)(966005)(8936002)(4326008)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk0zQzZFUGVuc3JSMDNhcGc2NFpmNjVYcEhERE9HbHFjaFRkaXE3UEcyeEk0?=
 =?utf-8?B?eHpqTzlQbGFvWHIzYlZQTkxmQlRNdURwOUx6SWI1R3UwcklENFBRZlFybkVM?=
 =?utf-8?B?dDNpMTY4d1FRSXNZRVBpUG9HczR4S05TODlhYmYzZk45aGNnVlNLeWt5aWdt?=
 =?utf-8?B?ZUpZeXlzUHVIcHJ4OHpxV2NHZ0gzcUhIL1d3eWNBdTA5emNpeFgyQU1UUTJ1?=
 =?utf-8?B?bWlNR3creFR1dW9jSzBneHVvSllheWI0NnowY3JTQnFUbXRXT3pOcGd5OU4w?=
 =?utf-8?B?d1ZKaFMzNytUKzh3cEo5Q21YU3k3TmRZUlVzdXhsdzk1RGRqM3BaNnJOSnhJ?=
 =?utf-8?B?ODRValVpT1llSEV0Z2VvZkZLdFllWHJxdUo0U1JmRmVOZFpLaStXT0V6eXdC?=
 =?utf-8?B?ejFRcnI2VVV2SG00SURXTHFsZWJFTE45UVJFWUlOZDg5OGhGVlcydEFuRDVE?=
 =?utf-8?B?bTBFR3B4bmhRcFdVVjlNSUlrT2hZbU9Cd2cvbHVleVkxMHlrRU04WDI4ZGRj?=
 =?utf-8?B?Q1pRMDJsSk1aUHRmN1BkdVBRVlJFdndBNXEzRVhJS0ljd2YwZVJQTThyQWdk?=
 =?utf-8?B?OWN2T2pPS2xDbm45ZWxES3piVlFKTUlDbzE4VUpGMzdRbVU2VWVqWVRYSDJN?=
 =?utf-8?B?TjNjb3JCejJuT3l4NFFOK1A3bFVlWDNpaWt5WDBGMU5lRzB1emZLaHBPc3pu?=
 =?utf-8?B?cmFiWjBJK2hWZzh3ZUx0VjA4VUdtSFV6RHhvbWFVbTZUOUgzNGNPN3FKNE1G?=
 =?utf-8?B?VjFsaUplZ2N4b0cxVHBFNUFvQ01McU9LL3k3cHh1ekxMTHVsVm51ZVpscWMw?=
 =?utf-8?B?bHZUUEp4MFM5d2FVQXE4K0RDTmxPQnBFdCt4ZFY1TXlFdTh2UVRlc21FbFNu?=
 =?utf-8?B?Q3JOOVBUTTE3ZEVjeUhBdWxkOWthSmdUM0VVNk5rMTRMa0tMajhWM2llTjZ0?=
 =?utf-8?B?dHlOK09wcUdId20vM1hYNkRJRUtVaFZsUDVFTkVkL2hBdUxadC9VcHM3bSty?=
 =?utf-8?B?VU0yQ3N5dkZiK3R0SFRHeFVJU05hT0psekdzb1ZkZmphR2xFTjVNQUxBSUIy?=
 =?utf-8?B?dTR4eG1tdzUyaXo3NklzYTRic2NYRWoxZHF2S0J2TFlCTmw1WVVSSkU3cmlk?=
 =?utf-8?B?bDRjcGczZjNOc3laRHhNaXBUc1A3bnMzT0tXa2w5T1YyRTQvYW5kL0dRaGhE?=
 =?utf-8?B?T1NBR3JuRXNMNUpRMi9YeDQweTNLcHJYRU40aHIrU1NlVXpqQ1VPd0ZDdzFo?=
 =?utf-8?B?ZEp6eHgvaFhtUmtkTnJqbWh4bEtFZFVTRDRxcDl0alAxRS9pSXZxQ1ZaajdX?=
 =?utf-8?B?VXMxUW05Q0dJTFd0UHp6RitBNEdqaDVVaDhwSzFLVWhxZzlGQWRyR3U4WUVZ?=
 =?utf-8?B?SEp6TXBnR0FBRG1VdEloVlEzb2habnRYRVMrWk1IYXI4SjhkcEJrdDBNbHNX?=
 =?utf-8?B?V2IwbG0yU2c3NWw5ZkFaYnI4dlk2UXo1RFNSenRGcUQ1MkkzTWQrTkFOQlJT?=
 =?utf-8?B?b1g1UXlOeDlCYUNnclp2N3hrU1M4b2VmQWh0ZzRidWtINE9tSHNPMTAyenVy?=
 =?utf-8?B?bHhzUFpSbDlnSDd3V25kTHRyUjdPR29KZUQ5SjlnUG5IMjc0ckJXK0U3RFNx?=
 =?utf-8?B?Nm8wdVQ2dHIreTZqc2o0cUlaMnJVdVlkN3FBdWJON1FRbStIZ0dNOGpuR1JI?=
 =?utf-8?B?bTJJdC9Zd1VRTndEUHkzQUFDYlp3MEY0N3d4NEVoR2MyWVViR0JORzBqZm8x?=
 =?utf-8?Q?4ebfRgbT+0iUgLBVkoykneBjQYWN8EBSai6ZlyK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff98be6-905f-4de6-a2dc-08d8ce3cd429
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 03:26:33.1789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7cqpzPobqKIsXb7sNiAX6TxnCcx1nts4zFwoBp+y+BLl391xCWTKzZBP8LX2pZfq8u1nnw0XD/L3X+MKmGSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3581
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-02-10 at 12:33 -0600, Rob Herring wrote:
> On Tue, Feb 09, 2021 at 10:13:12PM +0800, Liu Ying wrote:
> > To complement panel-simple.yaml, create panel-simple-lvds-dual-
> > ports.yaml.
> > panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels
> > that
> > have dual LVDS ports and require only a single power-supply.
> > The first port receives odd pixels, and the second port receives
> > even pixels.
> > Optionally, a backlight and an enable GPIO can be specified as
> > properties.
> > 
> > Panels with swapped pixel order, if any, need dedicated bindings.
> > 
> > Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> > 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new
> > file.
> > 
> > The objectives with one file for all the simple LVDS panels with
> > dual ports are:
> > - Make it simpler to add bindings for this kind of LVDS panels
> > - Keep the number of bindings file lower
> > - Keep the binding documentation for this kind of LVDS panels more
> > consistent
> > - Make it possible for drivers to get pixel order via
> >   drm_of_lvds_get_dual_link_pixel_order(), as the 'ports' property
> > is required
> > 
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5->v6:
> > * Use OF graph schema.
> > * Drop Rob's R-b tag, as review is needed.
> > 
> > v4->v5:
> > * Require the 'ports' property and update commit message
> > accordingly. (Rob)
> > * Add Rob's R-b tag.
> > 
> > v3->v4:
> > * Add type and descriptions for dual-lvds-{odd,even}-pixels
> > properties.
> >   Also, update descriptions for port@0 and port@1 properties
> > accordingly. (Rob)
> > 
> > v2->v3:
> > * Do not allow 'port' property. (Rob)
> > * Define port number. (Rob)
> > * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels'
> > properties. (Rob)
> > 
> > v1->v2:
> > * Correct pixel order in example LVDS panel node.
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml        | 116
> > +++++++++++++++++++++
> >  .../bindings/display/panel/panel-simple.yaml       |  10 --
> >  2 files changed, 116 insertions(+), 10 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/panel-simple-lvds-
> > dual-ports.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple-lvds-dual-ports.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > new file mode 100644
> > index 00000000..274e89b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > @@ -0,0 +1,116 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fpanel-simple-lvds-dual-ports.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cd255a9cc049846308d6b08d8cdf2512f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637485787944104318%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SNybiPncmGZYrzg75Iwz5gLUJB4MzfO5S2817nadjRs%3D&amp;reserved=0
> > +$schema: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cd255a9cc049846308d6b08d8cdf2512f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637485787944104318%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vfg7J99O8M6KyOMIW%2BvhZjZGe9ilJ8c7hZIUcqUXdIo%3D&amp;reserved=0
> > +
> > +title: Simple LVDS panels with one power supply and dual LVDS
> > ports
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +
> > +description: |
> > +  This binding file is a collection of the LVDS panels that
> > +  has dual LVDS ports and requires only a single power-supply.
> > +  The first port receives odd pixels, and the second port receives
> > even pixels.
> > +  There are optionally a backlight and an enable GPIO.
> > +  The panel may use an OF graph binding for the association to the
> > display,
> > +  or it may be a direct child node of the display.
> > +
> > +  If the panel is more advanced a dedicated binding file is
> > required.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    enum:
> > +    # compatible must be listed in alphabetical order, ordered by
> > compatible.
> > +    # The description in the comment is mandatory for each
> > compatible.
> > +
> > +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD
> > panel
> > +      - auo,g133han01
> > +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD
> > panel
> > +      - auo,g185han01
> > +        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > +      - auo,g190ean01
> > +        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x
> > 1200) LVDS TFT LCD panel
> > +      - koe,tx26d202vm0bwa
> > +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT
> > LCD panel
> > +      - nlt,nl192108ac18-02d
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> 
> If you have any extra properties as you do, then you use 
> '#/$defs/port-base'.

Ok, will do. Thanks.

Liu Ying

> 
> > +        description: The first sink port.
> > +
> > +        properties:
> > +          dual-lvds-odd-pixels:
> > +            type: boolean
> > +            description: The first sink port for odd pixels.
> > +
> > +        required:
> > +          - dual-lvds-odd-pixels
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The second sink port.
> > +
> > +        properties:
> > +          dual-lvds-even-pixels:
> > +            type: boolean
> > +            description: The second sink port for even pixels.
> > +
> > +        required:
> > +          - dual-lvds-even-pixels
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +  backlight: true
> > +  enable-gpios: true
> > +  power-supply: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +  - power-supply
> > +
> > +examples:
> > +  - |
> > +    panel: panel-lvds {
> > +      compatible = "koe,tx26d202vm0bwa";
> > +      power-supply = <&vdd_lcd_reg>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +          dual-lvds-odd-pixels;
> > +          reg = <0>;
> > +
> > +          panel_lvds0_in: endpoint {
> > +            remote-endpoint = <&lvds0_out>;
> > +          };
> > +        };
> > +
> > +        port@1 {
> > +          dual-lvds-even-pixels;
> > +          reg = <1>;
> > +
> > +          panel_lvds1_in: endpoint {
> > +            remote-endpoint = <&lvds1_out>;
> > +          };
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 35b42ee..e7718d2 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > @@ -57,14 +57,8 @@ properties:
> >        - auo,g104sn02
> >          # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
> >        - auo,g121ean01
> > -        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD
> > panel
> > -      - auo,g133han01
> >          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
> >        - auo,g156xtn01
> > -        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD
> > panel
> > -      - auo,g185han01
> > -        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > -      - auo,g190ean01
> >          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD
> > panel
> >        - auo,p320hvn03
> >          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT
> > LCD panel
> > @@ -171,8 +165,6 @@ properties:
> >        - kingdisplay,kd116n21-30nv-a010
> >          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240)
> > TFT LCD panel
> >        - koe,tx14d24vm1bpa
> > -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x
> > 1200) LVDS TFT LCD panel
> > -      - koe,tx26d202vm0bwa
> >          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA
> > LVDS panel
> >        - koe,tx31d200vm0baa
> >          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> > @@ -209,8 +201,6 @@ properties:
> >        - neweast,wjfh116008a
> >          # Newhaven Display International 480 x 272 TFT LCD panel
> >        - newhaven,nhd-4.3-480272ef-atxl
> > -        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT
> > LCD panel
> > -      - nlt,nl192108ac18-02d
> >          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> >        - nvd,9128
> >          # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD
> > panel
> > -- 
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
