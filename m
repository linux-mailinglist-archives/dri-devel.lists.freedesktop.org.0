Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F22E77F7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 12:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26A28967A;
	Wed, 30 Dec 2020 11:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2110.outbound.protection.outlook.com [40.107.100.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBDF89452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 06:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIJSPAi+QPGE5qpNBxLKff54UbWqBXHwBu1qS2b3HSHIRJIo18Ty0UASKdWUMrxvltcqxf+DubcnTxNaz8kufLwE7XEBsmba+P5f2ChNu5lTW8HneI6Op4J5atpjlc/dZ4yKsbikJyVmT30NFaQIT0hC1t1hNSiWl5N1VoDW9H37fYumhsqc2Qnewdhq8BafSkKS0pwAb4Sbl0R7x3qtMGmhhVowHjqfOJZrYABPsTeA3mmUovKRvKJx/OgSuH4ZNXXrnsoOdv14v186D41IvEc635bOKehFyPVmm+zV8la2p4r1qwyZRL9Mx6J8PVn+UW6wc8Y20JKA23sHI2e20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YELPedk8GvDzFuKeU8ulKrf3pcN3C+OF3SkxHDXOa4=;
 b=NCx1kPuSecaCd5GY8FdPTChyghSud+TN2gg9LiUVT04yta85W6Lk9rKj0Pi2aH5VE1yH2HFOV0vbTWssnhSChbEqmvFaSdsgKitzNQ3SlX9h6zFTjDUTOO0op8DtTGFA2wMB0C8VSCce8jk4UEn0hLpK4lvI7VjR4wHqHqzy14DEYZ95K9Vano22u6p+mZpV9YOfr3ZL1DZhutQlYfRh6j5pRcix45UlcIq9mHA0WFlvbG3ctnqEkzqO+6W3GysLxHF30BcfFdZHzFJ4x9FRz7gKL9ivBAHjJxWSFWw3QD2eS2DR10olq8KYhuRUqxV59dt7t6B4UVvySgfXeJYD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YELPedk8GvDzFuKeU8ulKrf3pcN3C+OF3SkxHDXOa4=;
 b=sbttjiFGLdVqoakiAP48zUivH0dvPYhPo8WyLK6Fk4gopDx2JtvTjex+v+94pCHGn7rd632PbBAPnuFP1mOcoPPEo0HZs3+44lYfpQupf0R3hvCCh5O5mlLm/M2Uns4qHPGIGVUhW/JUUXtAaHbAPyTgzXEUFw0YwGUrM+9oKs0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6696.namprd04.prod.outlook.com (2603:10b6:610:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 30 Dec
 2020 06:53:03 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::957a:caf2:db9e:8c8d]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::957a:caf2:db9e:8c8d%9]) with mapi id 15.20.3721.019; Wed, 30 Dec 2020
 06:53:03 +0000
Date: Wed, 30 Dec 2020 14:52:53 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20201230065253.GA31290@pc-user>
References: <cover.1608883950.git.xji@analogixsemi.com>
 <c29b7d9fda9ce8619d1c718b077250998a8600b8.1608883950.git.xji@analogixsemi.com>
 <X+n1COtS8nrCFUHd@pendragon.ideasonboard.com>
 <20201229065048.GB7073@pc-user>
 <X+s+bDHLbhxBDz7E@pendragon.ideasonboard.com>
Content-Disposition: inline
In-Reply-To: <X+s+bDHLbhxBDz7E@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3700.27 via Frontend Transport; Wed, 30 Dec 2020 06:53:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01566213-308f-4687-3431-08d8ac8f8e1a
X-MS-TrafficTypeDiagnostic: CH2PR04MB6696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR04MB6696819A956DDA8A7ABBBCFDC7D70@CH2PR04MB6696.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R22Rjohkys9tmwpYvy3M20ppuEsIt7fIrnlok/3eR/hB8K5lEEz7MYJWkjxWa7Hnhgf+jcrm9n8eDfldM1KxePizMH72/gNGobIcC46xGcXtFgaBBtq+pEPO6HfBqc6fTwOd96k3DzO9wE8FGwV+2N4Ph60E7XS5csQ/wjjp5Nt4wtWFVzrW+x5wLDt56XSDXnmWrMFjQMPbHm9i9AtCRJePf4/vT+3Y+XxCAYPoGI4qQD3kTeNDMOVXVDGEasNyCpqlvXnMwMCq0tbLFRMLRtKnvoxmcxv0Xdvrb0T+6PNrdfus5mBvcTTql0mAyRiNDSdPWQ8bO80o9/40SoQy/fEqXiHxzxZKnKDiSFeLcivWzGWpEFdTGuNMuxprDab+lEgXEBrHqE9AaOfuvVxM+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(366004)(346002)(136003)(396003)(376002)(478600001)(4326008)(33656002)(6666004)(33716001)(9686003)(55016002)(8676002)(83380400001)(956004)(5660300002)(54906003)(186003)(6916009)(1076003)(16526019)(7416002)(86362001)(8936002)(26005)(316002)(66556008)(66946007)(6496006)(2906002)(52116002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5wwrYOIq+SIG6q0p0tTpA1K9vGcyYZDLpJxkxiTcZlnn4YS58pUAzS9hUqE2?=
 =?us-ascii?Q?UJ3TYrBAvbj2nCoMtTijVflfVyGjdIaIbjZD9vqY0vM+JYS+v4htlv0+rpJe?=
 =?us-ascii?Q?Pvq2vzHIjqpqh39g634gNTbMZZoE0oUgMJtg/Q1tyZUkKS2cxoQtrbV7IPEI?=
 =?us-ascii?Q?fISfO0YLvddOG+FSP923H9sUce4vOfYwQbtnyH5POU1GfCb7L/fejSeGOZOZ?=
 =?us-ascii?Q?IPTJMAVFVi5wNfyeLH14gxDGHqRlTDufPs7CKD5tgQuTqkm+bIYIKkYYxbkl?=
 =?us-ascii?Q?ZmBTRJquW4lB0zcHxd8+mG9kh3Gj7XNY0hVNm1HYirTXtkZONGDv4tONxk/g?=
 =?us-ascii?Q?V9o/2O0vlQalW+D+bZxTEKdYkn/pQjiO/enJBpvU/G8ANLPKbX7K6DQebZS9?=
 =?us-ascii?Q?xgKBMXppLX1ARdVXcGSb3gymn7JZzE8c5t5ee4ZU+qO8u/U0jYCbF7uO4B9z?=
 =?us-ascii?Q?PC1YOBJ1BUQQpadmN9Pdn40IMQZG6OCldB1RZIuALSYbZ6I3x03qcVj8N/77?=
 =?us-ascii?Q?XONzcEaFnHhKoN3qlOyRTGGJDiPE9Nfyx/Mz9GrPr5qaSAEG5H9w5e+9MQZf?=
 =?us-ascii?Q?X2/PRtObCvkOXcGhpygxJ98GQkN0JovMXB+0Rz1+SLCj2UrXo+lHzd/qKnBu?=
 =?us-ascii?Q?vbNpNyU2zpd9JC14T6D15HP1Zma88yDQSfPmgyg3Y1x94ewdzrihJt+1CO8t?=
 =?us-ascii?Q?Xbp4eTiAJZQaluUJVKmJvm3OVpiWIPtzLsHiJQQ2sS00kOhd//iAJyawcX0T?=
 =?us-ascii?Q?SCF9yH2v3ytuhUGduGAzJBMTqv6HrwWCCvL5qGf4Ui4XFrzEY/I4WSMyaUoK?=
 =?us-ascii?Q?bLDn6MzRGParh1mT21A1lE0dWCqYVIYb3f8/JbtPWyNYimuKztJDy/ADGGih?=
 =?us-ascii?Q?zveu4sVP1REUI1m6jMyPbu4czpWXseY/XjXRNcB3MrJREbPrOpuoiZagWid6?=
 =?us-ascii?Q?zuw/cXWUul2uydrxgMqD6JlLJWzKCKi3VSNCl1JMCG8r8pCsV8qTt4VTlp1K?=
 =?us-ascii?Q?GHmQ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 06:53:03.5894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: 01566213-308f-4687-3431-08d8ac8f8e1a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yStyratQDUlyZQl8h8lGhZoAj3HTtIGwQTwMALoZnZJZeyTTpYagREVgtMa9lbErJ7D7CzjVavow0CTYKvtVRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6696
X-Mailman-Approved-At: Wed, 30 Dec 2020 11:08:41 +0000
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
Cc: Nicolas Boichat <drinkcat@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 29, 2020 at 04:34:20PM +0200, Laurent Pinchart wrote:
> Hi Xin Ji,
> 
> On Tue, Dec 29, 2020 at 02:50:48PM +0800, Xin Ji wrote:
> > On Mon, Dec 28, 2020 at 05:08:56PM +0200, Laurent Pinchart wrote:
> > > On Fri, Dec 25, 2020 at 07:01:09PM +0800, Xin Ji wrote:
> > > > Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> > > > swing setting for adjusting DP tx PHY swing
> > > > 
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  .../bindings/display/bridge/analogix,anx7625.yaml     | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index 60585a4..34a7faf 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -34,6 +34,14 @@ properties:
> > > >      description: used for reset chip control, RESET_N pin B7.
> > > >      maxItems: 1
> > > >  
> > > > +  anx,swing-setting:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    description: an array of swing register setting for DP tx PHY
> > > 
> > > Register values in DT are frowned upon.
> >
> > Hi Laurent Pinchart, as the different vendor has the different PCB layout,
> > it effects DP CTS test result, so they may need config DP tx Swing register
> > to adjust signal swing(the default swing setting is not satisfy for
> > every platform). If we move the config code to driver file, it must define
> > swing register setting for each vendor, so the DT is the best way. Do you
> > have any idea for it if you don't agree to add in DT.
> 
> If it depends on the PCB layout then it should indeed be in DT. What I
> wonder is if there would be a better way to specify the data than
> register values. The ANX7625 datasheet isn't public, so there's
> effectively no way for someone to write a device tree compliant with
> this binding only with the information contained here. Reviewing the
> bindings is equally difficult. It would be best if this property instead
> contained information that could be documented clearly.
Hi Laurent Pinchart, the swing register setting is optional. Basically, no need
to care about it if customer PCB layout match our chip requirement. The
property define just in case. So far, we just found one customer encountered
DP tx swing issue. As the datasheet swing register adjusting algorithm
has a little complex, we will help customer to adjust the DP tx swing
case by case.
> 
> > > > +  anx,mipi-dpi-in:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: indicate the MIPI rx signal type is DPI or DSI
> > > 
> > > This sounds similar to the bus-type property defined in
> > > Documentation/devicetree/bindings/media/video-interfaces.txt (which is
> > > getting converted to YAML, Rob has posted a patch series, I expect it to
> > > land in v5.13). I think it would make sense to extend bus-type to
> > > support DSI, and use that property.
> >
> > Sorry, I didn't found any define for DPI or DSI flag in Rob's patches.
> > Do you mean I just remove this flag define and call a special function
> > to read the port's type(DSI or DPI)?
> 
> video-interfaces.yaml has initially been written for cameras, so it
> doesn't support DSI. I think it would make sense to extend the bus-type
> property with a DSI type, and use it here instead of a vendor-specific
> property.
> 
> Alternatively, I'm wondering if this isn't information we could query at
> runtime. DRM bridges and panels have a type, so we could look at the
> next bridge or panel to find the type of the connected device instead of
> specifying it in DT.

At anx7625 driver probe stage, for the DSI, driver needs call some special
interface to attach to DSI interface. For the DPI port, there is no such
limitation, so we need to know what kind of MIPI signal type at driver initial
stage.
Maybe we can keep this flag, if the future has defined DSI, I'll submit new
patch to remove this flag.

Thanks,
Xin

> 
> > > > +
> > > >    ports:
> > > >      type: object
> > > >  
> > > > @@ -72,6 +80,17 @@ examples:
> > > >              reg = <0x58>;
> > > >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > > >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > > > +            anx,swing-setting = <0x00 0x14>, <0x01 0x54>,
> > > > +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> > > > +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> > > > +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> > > > +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> > > > +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> > > > +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> > > > +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> > > > +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> > > > +                <0x26 0x40>, <0x27 0x60>;
> > > > +            anx,mipi-dpi-in = <0>;
> > > >  
> > > >              ports {
> > > >                  #address-cells = <1>;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
