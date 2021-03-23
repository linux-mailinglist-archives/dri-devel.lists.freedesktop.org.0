Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CC345667
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C606E083;
	Tue, 23 Mar 2021 03:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647866E083
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gehbnPf8w/NY73WqkmcXXZpdWPg5EKt2IbncAyc9EDWRNGxbuWYH43yiNrhtIbfBDKivmEZbUaztZCIQ+wI6OuXE5bSHigrbgmNjt3Dz4IYZNtyuXV7eUpi5gMZX4xMJIS78nDNzUWTv44L77kE2o5NPHLcSeg6DxGYz9H4mqM+PLcRHWMuES/tau6JrQ7AtXry9Y0oImZgMvAp+iTUhKvsM61PwGkDQS3oc95drLjkm1yzMn0p0EkiNAznCIIkIK55sTemgnCI3x4kL7/w9JrzgF5hgolL1k5iusP4/88J6gKtGDEAAv/J+XsXj5P1VpaBUmseOH4Gpu2U4fBTunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+trvecryR/cVX8aHT1Fc2Gycm3MDVbVDJ9gmmI0qkRA=;
 b=lfWnYHGRHKCUiW7nIBOi3oiW3dQpeSRc4RPwysqmRB/xBUZdN9hvlrnO/2HmSlb+rqQxwr8/by6pIf4H9jUwMdHibOH5cAuUijsZurVmS/qfdy/0a1DYXXA5pxT0/+xjodTQYocbMW9hHarCdFVW6oNNdcua6CvGP7m0d6q6Nk1ZCkRBF4YYb11J+w4lxp2IMFCA0776znemsPYsprr8Sbt3ZRQ1nHWI28dPv1plx4SapXKJ7rdbAWcev7N8axvtMvfby3gMeHir4+/cyp4NTCDjcDAjQbIm/Rk2Hj2/JiL+sxce8jTC+1NW0cbpiPCxygB1juwOZqZDwJljASFwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+trvecryR/cVX8aHT1Fc2Gycm3MDVbVDJ9gmmI0qkRA=;
 b=oqT6elWPmul1QYJY7Akaw9sM2n814jRq1JiJQ4LwsRuGTovcXivez1+TFCuyECs9TMzZEhmBrBeDISzmbUOXJOqUE03ytVT5BKTFu1GfuCKAbcfZCuotVZgX8R83CM0hQCrl104MEF9GzFNDQpdxsg93f9f381dVp5X/ysiR5Jo=
Authentication-Results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 03:44:18 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 03:44:18 +0000
Message-ID: <19f83ca486e4d7bc7dadf2470356c888ba64e583.camel@nxp.com>
Subject: Re: [PATCH v6 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Tue, 23 Mar 2021 11:42:40 +0800
In-Reply-To: <3b1db5d87773e9352f06e88b460cf0f7f2f7e98d.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-6-git-send-email-victor.liu@nxp.com>
 <3b1db5d87773e9352f06e88b460cf0f7f2f7e98d.camel@toradex.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Tue, 23 Mar 2021 03:44:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd5a6a3d-deb8-4289-9cb2-08d8edadefda
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6560BC1DFADA9DDED978A70298649@VE1PR04MB6560.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofKgKV0D2Z+K0wGuSSv2oED479TCnE6sXq8bGGTTfvNvU3TMEGqvzGzUJO3nfMy4NJj/6JQC/JhkGKDGKeI3v3A0t5RfQiq1PtKs81fH9bnZ/sh6r0TwrN/gx3sq4kTV33aK7gO6Rm9WJ52ye2bmtEDiyXYpVmU8lgyzObwJVcOZpMl1VOIdAefoO/lojm/6bEgLzQyJEX5qvrexBZGz9ftbQ5GfuohNFCXvwr9sXvBgaypYfFS93fIkZ/QTqmqaeXGriJxqeBaDBp+BG5jzTfyYCmjXnehQK7QgJBf2lTGPpo4g29KIigxXCLuoAJQ/lLiCPSx8BIBFG1neqVSYzI8aqmyPrBtwA2PMD+DfgkXOnS/RiqvuwMXbYQZgL9d/pdunXxu1bf6OzTFl6mXIEjewul1S6sdHKFHPBZT3X4Nn5Cy6V0oj7nObSLKHBEKJz8r9+bw821/T5k0Ryt04hx1H4aorrG20Yngr7M55NUf3/nO/s+jPwlyKEO+4WTjlNQsAAkV9jdtZhs2QrIHFaoUjntx0TVEtTWcsAkKTucOPi1V1F2LmsdM9c+Xi3jjq+74wDQJpd1CeC9dth+KqGqNhvhsHDsxczrChRqKYPAM9E6ndzeyrI1TESbp0gsTxEnM2AHLRdWJ7v7K8DSEPhsSp1/QJ2HuJOC17CqZ+bcMC0T60XO7GKUM/2XGhlBmti+QMayYyG//Uqli5LeQ1cME7ikAOMl9kPicDA7A409I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(6666004)(2906002)(966005)(52116002)(478600001)(2616005)(6496006)(110136005)(54906003)(316002)(36756003)(45080400002)(956004)(38100700001)(5660300002)(66556008)(6486002)(83380400001)(8936002)(4326008)(66476007)(86362001)(66946007)(8676002)(7416002)(26005)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUxuZE9hazZlYkRESVRGM2JLTmJCSFREZUlRSFYzOXRJT2hlYVZDa2h5NTBS?=
 =?utf-8?B?dStkQmh4T2xMUHVOcXpmS3oxcXUxR2w0Mi84VCt3S205bnJrUlc1bjU4WTcy?=
 =?utf-8?B?dDFDMlBaN2lXOGNwQmZUUFpWejJEbThoZ0RFZ1ZyV3k0dUI3cU5xQmpWdUhv?=
 =?utf-8?B?VE5oMkFvZFVQT0w3Y1ZSb3N1ZUVNR081MXRMVGNpUUtqZTUvMEpLbis2Yy8v?=
 =?utf-8?B?SkdWN2N0TEh1QXY3ejlaVG0ydjNHUC83SUV4aVo5N2M1WExwekt1aWZyYjVl?=
 =?utf-8?B?UE5FdXJ0TmxzWVpjOFVnTDZWWllWK0RzeFNObjB5UmJRVmloRE9FT3kxT2ln?=
 =?utf-8?B?MzBOOER3eHR2OEJ6aUNSSTNjMnpDYy9qN1dyRm1WeTkrbC9xM1g5ajJ0T05w?=
 =?utf-8?B?OFJMOVo0RHVxTy85VXlxelBabDZQWHVtMkpsRDZrZGk0YW5Ob3QweXNqWjRt?=
 =?utf-8?B?UDJBdllmM1dBVGVvbDlDTFFtNEVxYXFRTkJIK0ZXRHFJb0s3cHZNdjliUisy?=
 =?utf-8?B?c1JtajgxNlM3ZmozSmRyN3JmL0hDMkFZTm1VRTNXM3ZLZ3V4UGJqWk9jNjJI?=
 =?utf-8?B?dllwVm5hR1N1dFN1OC9DQUlORURiblI4dXQ5QTAvK2RTdC8xVFU4Z3FFSSty?=
 =?utf-8?B?UTZmQ29ZZkpJNDVFaDVZQzNlaEZ5aXl0aVlUR2h2YkJ0ZjU4NHRWaTVrazZK?=
 =?utf-8?B?aU9zR1VUQ2tpaVpNekNibW80dnZsYlh4L2RmaTlhMmdhTFhwakdMKzZDcHhO?=
 =?utf-8?B?QmU5dVF5Y085VVpJUEMrNGQ4SksyaG9ySTltZi9QcHVvSXMzdkhBbjZaaG51?=
 =?utf-8?B?ZTdFbkVVMjFkbTJ6bkhVVTR2cEpwUC9XaE1MeFl0Y2ZKR3dId2hVSXQ0QkJa?=
 =?utf-8?B?NVFJTThQVFNIMWZCcDhHOTVXMWtUVkxQWkZzMHZ0U1A2L3JoUGg3azE3Ylhp?=
 =?utf-8?B?YnMwV3JKN0hJREVWNzFOTnlhTENZZGJ6SnA3UjJ0Y3E5RjNoY3d0bzRHSUJp?=
 =?utf-8?B?bGVBWS8zRGcwd1VnMWVKaSs3eXMzUmx5MzdzSVh2bFlmNUlRQitUMjdjQ0ZX?=
 =?utf-8?B?SmN5VFgxNk9pV1FJVXdzUXdmcm1Zd3o2T09RQkJXSlhOTDNacHMvYVlTYVJv?=
 =?utf-8?B?eGJxY0g0YVI1UExYZEFtOXBMZVRUMlBqZE5rVms4RW5WUDZUVE1hMHhLT05i?=
 =?utf-8?B?bWxkTkZXTEFURWdxcS9JMyt6OWJER3VhSFM3ekpVOXF5dEJ1N0tLUlUvWVJ1?=
 =?utf-8?B?M0NlZjVrMW1CcnFpQkEvY0k2TlVMU3M2TFJMR1luelJBLzY5aFpXVEJrbXpi?=
 =?utf-8?B?L3JPclRiVmsxZUsyMzhLd1U4Si8yV2NBMStHYUFwVWhKWmltMEdLR2xHUXRm?=
 =?utf-8?B?bHhwYTg0aEJBTjh6VlF4K3BpSWxlNFFqZytoS25uaG5hdkxyaE0rWS9ETjJ6?=
 =?utf-8?B?cXR2VC9BUnFjUTlYczdLcTBrT2pSTk1LdjZpRHZ5OTdlM2tBbXh5V2N5Mmhu?=
 =?utf-8?B?R21CTk9RU09qUW9jQkE4eWdBTGMrNHhZbUxsMkY2ank1TG5rMEJXMzZ0dnhs?=
 =?utf-8?B?ejlSOFlOK1hPYTY5RGhPQUhkRG52bUpoQnRLeGhodmJlclJMaGg0b3hQUE1h?=
 =?utf-8?B?SzJoRmplaFowaVpIVmo0TDhHSlVZYmlKclExM1R4U0ttUG1KWWMxRWVZYUJv?=
 =?utf-8?B?YU9qa0lUZzRsaHNhUDZlVTRxeUlGOVk0NUVWeGYwMmllNHVMV3NQODVXcVEw?=
 =?utf-8?Q?yewkFVTdtU3CxyofiV8uWayLHRn84JtoFGc7ok4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5a6a3d-deb8-4289-9cb2-08d8edadefda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 03:44:18.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNxVnkJskdnK7waffwe1v8SrNZ/JzPwaMTI1AEXR55I4/AGwrRJYmkHuaW80DzoTIccKwlSOXHz3pH3vftQ2fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6560
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel,

On Tue, 2021-03-23 at 00:38 +0000, Marcel Ziswiler wrote:
> On Wed, 2021-03-17 at 11:42 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp display pixel link.
> > 
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Liu Ying <victor.liu-3arQi8VN3Tc@public.gmane.org>
> > ---
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Add Rob's R-b tag.
> > 
> > v1->v2:
> > * Use graph schema. (Laurent)
> > * Require all four pixel link output ports. (Laurent)
> > * Mention pixel link is accessed via SCU firmware. (Rob)
> > 
> >  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > new file mode 100644
> > index 00000000..3af67cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-link.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C281077e1c1324aa89ad008d8ed93f1f0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520566973165920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2NDRsaWJ6YGFg%2FWAjT1Yf9Y0OaRDSHG0fWghi9UKNRA%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C281077e1c1324aa89ad008d8ed93f1f0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520566973165920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ogBn2bQmj1YwDqg0KDMXZ%2FwL0VkdOA14n5ayBioMcos%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Display Pixel Link
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu-3arQi8VN3Tc@public.gmane.org>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
> > +  asynchronous linkage between pixel sources(display controller or
> > +  camera module) and pixel consumers(imaging or displays).
> > +  It consists of two distinct functions, a pixel transfer function and a
> > +  control interface.  Multiple pixel channels can exist per one control channel.
> > +  This binding documentation is only for pixel links whose pixel sources are
> > +  display controllers.
> > +
> > +  The i.MX8qm/qxp Display Pixel Link is accessed via System Controller Unit(SCU)
> > +  firmware.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-dc-pixel-link
> > +      - fsl,imx8qxp-dc-pixel-link
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The pixel link input port node from upstream video source.
> > +
> > +    patternProperties:
> > +      "^port@[1-4]$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The pixel link output port node to downstream bridge.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +      - port@3
> > +      - port@4
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dc0-pixel-link0 {
> > +        compatible = "fsl,imx8qxp-dc-pixel-link";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            /* from dc0 pixel combiner channel0 */
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
> > +                };
> > +            };
> > +
> > +            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
> > +            port@1 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <1>;
> > +
> > +                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> > +                };
> > +
> > +                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> > +                    reg = <1>;
> > +                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> 
> Those also seem absent from other examples.

Patch 8/14 adds dt-binding for PXL2DPI. An example for the PXL2DPI
instance in 'mipi_lvds_0' subsystem is provided there. It doesn't make
too much sense to provide examples for both 'mipi_lvds_0' subsystem
and 'mipi_lvds_1' subsystem, IMHO. I think it's common that people
usually provide an example for one hardware instance.

Regards,
Liu Ying

> 
> > +                };
> > +            };
> > +
> > +            /* unused */
> > +            port@2 {
> > +                reg = <2>;
> > +            };
> > +
> > +            /* unused */
> > +            port@3 {
> > +                reg = <3>;
> > +            };
> > +
> > +            /* to imaging subsystem */
> > +            port@4 {
> > +                reg = <4>;
> > +            };
> > +        };
> > +    };

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
