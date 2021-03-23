Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A556C345641
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 04:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949836E073;
	Tue, 23 Mar 2021 03:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40074.outbound.protection.outlook.com [40.107.4.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A36E073
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXfmKXrX7bRRKdOBgWg4A3iZRo++CPDB37FWmlG776cpI9L67MD4Zo//peepN2IJ98SvtdU/y0mXTvr9pnn+DmJ2z+tomyUfiMVE3UXC+qoP5g5czzmlEASe9QYyXHUvyXW4e3Qr3Lqu8JfA6u8nUr1Jshb2EI7bh2KpSJ8L3wc5SC6lbHW035QSR5loTdtAqT01m3La1xLiuzK9Z/kbUw/JdzNhJ5cAEZM8PIV18yXxrHbEO/aHV6lMYRwnA5As75xmShddM28Xz9/p0wappa6QlQWGzzR17J4r/3UJvLNbC4bzUjEuQgmMgb+pMBsShve1Hpdjwj8aOHqiRiD9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMbeN3H8/C4RMvXjBzpWdwH/Cb3Lk9H7Tq7Vh5z+2g0=;
 b=LZD+2Hi5hbQGqt8de5+GIQ4LtI06rJb7CM9PRDQddEvMr1zqAwi8nmEfSXkhFZn2T+1WB5fK14IJ2QQDQyoZ8TgkEtNV+FCUshvPEQLGum1deCSU2ApHIaQbTCNz2mjj1U+m0YYvbvIprsVWbTU2CqblkS77OxxbcGHbBLfY8onuHKfPxOaAIHBldfad5hBHMh0rUM+fe6FO8P2Io0FIhIdsmgdvZpVu3+z1/+LoPGKz4gJE8g7FrUidH+ICo/bXsjxTzbdZcGsnPa+eoiNZxkByguEXL0XnmoUYoLyi12nmZ2XCCXaTgSC4u8Qah3BJLTSMEucfCbu7OwQ40dtlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMbeN3H8/C4RMvXjBzpWdwH/Cb3Lk9H7Tq7Vh5z+2g0=;
 b=XpTe8MKoTwSdhUKcPcypFbGZSUCqCBHPP+llXhEffDgL7Jrdj7wz8i1QlQNLDGJmRlT0YssD9IAYXsubOyvgBJTKfyV6elvnTnSrpHrwcDJWBV50C+5U+A1RE/Xg9uUVhX+7EwVzT/R3qU5ZLOH8AjoCFa43OS4iTSMqNPSs42w=
Authentication-Results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6557.eurprd04.prod.outlook.com (2603:10a6:803:129::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 03:31:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 03:31:33 +0000
Message-ID: <bcc5e327d6075f85ea1c5ac5e9a8468c8a2e9b52.camel@nxp.com>
Subject: Re: [PATCH v6 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Tue, 23 Mar 2021 11:29:55 +0800
In-Reply-To: <ab437e190dc3f7e1f63b927f16dea2d5f806d59c.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-4-git-send-email-victor.liu@nxp.com>
 <ab437e190dc3f7e1f63b927f16dea2d5f806d59c.camel@toradex.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:202:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 03:31:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a79950c0-9f32-4294-656f-08d8edac27bd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6557:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB655710419DAB4342E3FB69A598649@VE1PR04MB6557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5pkYAuKqvMh6Nsm6a+ddHxLr0OekgzuB02UZuXobD8HEb3IO7rY6HALyTqQ2+EV40+nFtoyUURWqs5d9+H6iPpXKD7sPOqSWEdjehLC5KwEYJ7Iq0h27KZFD+R7A9ag/+iQtv82f+4GB0sgCc7Teob2hMR7Mp319WReOK0Ix2n8UIe+gnuX06BEQRxhOrI9UCnlKhwRgnPiDnAySGbc9F5rh0n0iav5p8wGJ7Ci3QlWjqSukeqqRQwq8j8IEcH4WkWt8AyZDZ9OTrKfXVZ/gI7A1DF97zjpmOxSNhktgCI9EoR0eQYPVZUtWfIZ7+Wen+fxke6odnlbIEUoy5Vzjwzwe4YUb4u6DBYhyXxKkoE0oNqfJuy7uUYWgxFDiG8LX0oLX+J8LgysuxQRU/s9ipodL8xIfqOZXxRQJOL/biebs+qoqh1f3UOhNvkPixjiuJtUya2nL/uyj+wC4kKLKK4AiY1edVJFtBDkPsd5YFIP6eoYiseJrTbh3eXUnGwhiLzL4jcErlKiH4NluvvtOCWvfS0QjQJ8yvu+H7To6F/xf7tuoDqKBJ3GPte+zlaAB4+PpQ8Fp7ONdq/mRsdD7dFjUWeHGLnZ1GwgPkMNirOUE4AHsxwl2U6UjvPIEmMo0CRDg9cwn8/IkAe7yfqrrwOOagw8EPBQMhdzygRGBzFYNfYKOp0KJ3F5RLCLGsY755259EJv3B0vsbFl/ltXDUAQ6Uk4hqbakeiQs6fHQPik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(38100700001)(6486002)(966005)(66476007)(54906003)(478600001)(45080400002)(36756003)(4326008)(66556008)(6496006)(2616005)(6666004)(2906002)(5660300002)(52116002)(8936002)(26005)(956004)(16526019)(7416002)(110136005)(186003)(66946007)(86362001)(8676002)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlkvS0wvSHp4bWo2TTRLVVlLUnpUdlpsN1pZbFJsV09rdmIrRjc5K215QVB1?=
 =?utf-8?B?N1BWaFhKT1I4dlFKeEZZNFZsQmd3Z0xTRGhyNHU5V3VWUU5oaXhTK3JUMlJz?=
 =?utf-8?B?dFdqYkRjZjB4V2ROS1JnQmdXTjVJNEpWVWlQUG1UTy9rN1JlemRwQU9GeDh0?=
 =?utf-8?B?UWFvT3Fib3V5d21PWFNJdS9rbGxDMENDZWJ2bDFZTGkxU25JZktpT2NpYnU1?=
 =?utf-8?B?NWh2VmptRFU5eGJIVzRFZEdKRDJGMTlmU0lhTjBBdE1zNHlOYWhMald6OHhy?=
 =?utf-8?B?cUJ0TFBwTFcxWXNIcmFYQ01INU02bmhBVFplem9MVHRRdXl6SmYrZ3JZeGJs?=
 =?utf-8?B?M0dCbThOTklIY0pWTWJxNllmVDRiVmJhVnQ0R3NpdWFyZ3lxTnVXWWhLSG1u?=
 =?utf-8?B?ZUF2ZFN1ckxVbU1zYjBnQW9tbWlUb3hjZWIrUmRHYkFmc2orK0lCZDQ4N2NT?=
 =?utf-8?B?a3VaRVRuUUJhaFArUnJsM3I4STNMeDFXWE1FbXo5VE1PWHd6RVpKT2JZUklT?=
 =?utf-8?B?T1dOU0VCbldkL3FkM3habXJXZDJ1VVZBeCtReDNjVGx0c3hCL3FZTFBzTlhQ?=
 =?utf-8?B?RC91QVYwNEtyUGlrWjZSRm51S2FmaGtZb3dIM3l4Z0dYUEtCODhOdkFUMlhE?=
 =?utf-8?B?UndxUHAzVWtVeUdMSHNIckFpRmRFMVErWmIweW9nWWxMQmd2UmlsWjZidEl1?=
 =?utf-8?B?N204TXlydEtTTHBZczR4bmtGR3VWUTM2MFQ4c2lBU0ZwdDNqcDlrLzAvYzFn?=
 =?utf-8?B?RjZnL3pSTXRKVEpreVkxL09xSFdCY0I3NEJCZFJxaHdUQWpIYWtVQ3FtOWlq?=
 =?utf-8?B?LzVwWkxtNmp5TjE1L2s4VkYxd0RxRmtudnFob2xFendTNEc5RXhieWJJdHpP?=
 =?utf-8?B?dmtvbGhna0V1bk5FZEN6bXpwc2REM0x3ZFF5ZEVuRnc4QStadHR6MXVzK3Y3?=
 =?utf-8?B?Vm44T085dmVZYnFyMCtJOC9vWlRJZG9HazZiNjBuc1FvNTJ6TFhpZlVhanNp?=
 =?utf-8?B?TUJEUGtET25MRHBFMURxdFp0OGc1cXRXMzlQY2hsb0ZJcWNJYkVuOW1UR00x?=
 =?utf-8?B?eVNmakl3dGYvSmxnT0k3dlFqYzhtU3JyRUhXZTFKVU9hdXhtdzNFbkszUmZ6?=
 =?utf-8?B?czErQnhQZFRraEN4N0tlMHJQZDBlZTdFT3ZrUmZwd1dmYzY4c3lEOFNxbGZP?=
 =?utf-8?B?NVB5YXVEWmRYczJ1QmNrMXdNTmlrUXJmMGVrODduYlRqNmZlMnJHL1ZJZ0lv?=
 =?utf-8?B?UHJPQlJneWZqODZlaUdPZkdDR3lnM0ZVYm9XK2FRRjdOTm04MDhNQnhsdi9v?=
 =?utf-8?B?NU9Td1RoekJMUTQyb0ZxTkZlc29vOWt2S3VBeDVaeEoyQU9CQ3JjRkRjaWFw?=
 =?utf-8?B?Y2g3cnpzQ2FSUkU1ZEc5MTNiL3N6Ymt2L1hOb2lzMmpBUEIzbnlOM1pyT2lq?=
 =?utf-8?B?SXdRTE1oOE5BcysreEFEVnhKSUZ4TWVUejlnb3VWTGdySitzdmFLR29MR1cx?=
 =?utf-8?B?aWJRdGwzREhiM3lzY3BtdE0zQ3RHU1lMMVpLT1M3b2hZQlk3bXZCWlVISUxn?=
 =?utf-8?B?S0xGSlorNU9xbC9QRVg1RDljdTFkc3N3S05POUtwMk1QZ0lpNnptTjk5RVY0?=
 =?utf-8?B?RGo3MXh2MzdGZGpyaURaVXFZSDFSOXpORWY4QnFOUno3T1VvajJyOXBmQjRH?=
 =?utf-8?B?cXkvOTZ2dHZrRE1ySGlCVmluekNEcytFZWphYWFHWDRiY2JoL1BjTk9KcUE2?=
 =?utf-8?Q?0o52HO8hsqvOd5HO9RgL+2rJX8I8xtPiBRBybR7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79950c0-9f32-4294-656f-08d8edac27bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 03:31:33.2904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJVQ9BBxabjPtxRVaH1seOHETYMl9I/nCY3UBt2Ug2t08RZR6qQIEu4IDNfJUNsOGhZIqZagYwc6KgoPHT7zug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6557
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

On Tue, 2021-03-23 at 00:34 +0000, Marcel Ziswiler wrote:
> On Wed, 2021-03-17 at 11:42 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
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
> > * Use enum instead of oneOf + const for the reg property of pixel combiner
> >   channels. (Rob)
> > 
> >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > new file mode 100644
> > index 00000000..50bae21
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > @@ -0,0 +1,144 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-combiner.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cb83106f0261d4f715b4208d8ed936cb1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520564736692120%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2B4sZ3C9r3cewzQ01YHOvGk%2FCZaqQgg3ALftZ1dPLKIE%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cb83106f0261d4f715b4208d8ed936cb1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637520564736692120%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sP82pZYZXLKhzRRoYPR4C%2FFsDLUka1Fj0%2FA9InuWuvg%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Pixel Combiner
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
> > +  single display controller and manipulates the two streams to support a number
> > +  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
> > +  either one screen, two screens, or virtual screens.  The pixel combiner is
> > +  also responsible for generating some of the control signals for the pixel link
> > +  output channel.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-pixel-combiner
> > +      - fsl,imx8qxp-pixel-combiner
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: Represents a display stream of pixel combiner.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        description: The display stream index.
> > +        enum: [ 0, 1 ]
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the display stream.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the display stream.
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - reg
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    pixel-combiner@56020000 {
> > +        compatible = "fsl,imx8qxp-pixel-combiner";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        reg = <0x56020000 0x10000>;
> > +        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
> > +        clock-names = "apb";
> > +        power-domains = <&pd IMX_SC_R_DC_0>;
> > +
> > +        channel@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
> > +                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
> 
> While I acknowledge this just being an example you seem to call these as follows elsewhere:
> 
> Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 
> dc0_dpu_disp0_dc0_pixel_combiner_ch0
> pixel_combiner0_ch0_dpu0_disp0

Hmm, just like you said, this is just an example. And, it passes 'make
dt_binding_check'. Phandle 'pixel_combiner0_ch0_dpu0_disp0' is used in
the example of DPU[1]. It equals to phandle
'dc0_pixel_combiner_ch0_dc0_dpu_disp0' in this pixel combiner example. 

We'll eventually wire all those endpoints up to form display pipes in
real DT files with correct phandles. So, if no objections, I'll keep
those phandles as-is in the examples.

[1] https://www.spinics.net/lists/arm-kernel/msg878544.html

Regards,
Liu Ying

> 
> Or am I just missing something?
> 
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        channel@1 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <1>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
> > +                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
> 
> ditto
> 
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
> 
> do.
> 
> > +                };
> > +            };
> > +        };
> > +    };

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
