Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A63BE393
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 09:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595F6E82A;
	Wed,  7 Jul 2021 07:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2128.outbound.protection.outlook.com [40.107.102.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E066E82A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 07:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIofSbvwoEkormVYuqsaqjc/+riDQKusgjvc0UGrF1PiN43d4Ol8GBngS9eaERyolC3zJLRl4MdJDi5IhpR3YBQx3CcgEhblpgujuNNxLyYkXPqdAPFm7f6kPEdAdbeK7L/kosmiCKiqA2eSeu6wsJPgLWYE7fezvWkOcSVKF2L7IAcuIzpXIDsPF0FfCrd+opQVCsfBXoFYlmaGRT+o7N5ounSQ6RzrW/hsFYi1sPOeL/RCKMpgViS0AR3yjA9juC/UfiOLQRuzFqUdonL2KJ47CngSJrQztR2Q3B2ZkJYlWOtE0T9BLvXlZtVQwIEEcaTwahayictvyJgoXGpSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcemODJHVVkgM/gxIQWeDNUkCMcFkj5qvaXOEx5uRe0=;
 b=l4v7YEFO6Y04tuMIdXzhzFgNktBrPIefVGc9azL+z/bB+SCMcUxqjI2immh0Z2TzDRKPawsZ/v54fdaPt97IfZkIPG6PvD0YgHdBbFtlKPofOSBovKjpiLxznU+2MUkBmRf+Zi07eQ/EBuozkMmgEfrJzSY7SEXmiPuQrVDW/uHZOZM+HZEmRs4toBewf/A8M7oMNQPbMJZhd7rYRxxP1HSrVO/xbI64atEwIxa/NOQZMcYrSxM/LKsp8/aYPtFAeifQlo8T7rpZ/mtExYRj4H8ZLCrptMD5aMH13g7/mecmA+4+IhliGZaZ0o3Wd6k9Ak7LitiyKqno4pBZvdyThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcemODJHVVkgM/gxIQWeDNUkCMcFkj5qvaXOEx5uRe0=;
 b=mDTskpIHmubDtHhba5lxGJTGc5hkHtxCHvpdXnl1aNSiKm3J8cU3JVQEDVB1gKNZlyu9movmYy2UGAHlWNO2CuBXVzalWHf2/gcLm3Gi8CQ8Q2Xhw+WPP+/JL0ep7+xbBG941UE5Ff/6lThQE6yTBp4PjSb324SigQjCG5AyV/Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5749.namprd04.prod.outlook.com (2603:10b6:a03:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 07:31:00 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 07:31:00 +0000
Date: Wed, 7 Jul 2021 15:30:51 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
X-ClientProxiedBy: TYAP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8014::21) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 TYAP286CA0034.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8014::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 07:30:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8807c75f-3bd3-4f5a-31d1-08d941192b0d
X-MS-TrafficTypeDiagnostic: BYAPR04MB5749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5749EE49101A38E03BB8461DC71A9@BYAPR04MB5749.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcSP6n5yZSYS1ZyKjRxQkQpUmfuMOA1RwqEBVohkaVqzLRzKV+BSp4yYVkDCIgsCkYyvQ8mzhO2BHUWVSyAbzgmXxbJ8bnUe+Wi8JotPHgTNAQGLwKTKCjUPSdjIyshU8vfyXM+opSxjibGcYAFRV18yvsmXRtsEWLe7BgYjndTDg3IAmBfuNiLn23cgtmEyZkGYbIG06z4FllaO3GWxFUeoM91mUA09Mx3VYJFx7BZgSb4yiYPj4njCOPiU7qMJSgn6+i8Ggejz54cBrB+fENuzs8ncYvQrKMua4Ad0wQJbNklPzTFrJvUGFUv/xiIqB9DJwiIQJJCwQG4ubKdzQK69DgxIq1Rwhq36nqAap7y1GbqZvrvoEMqq+6q87TzlNEnhkgUOqBc/2higQsivzslkf29S1bSfXeXyMMo6nwHcOYtFAMpUStWB21qqPH0dCeRv9I7SOLwhXkEHytnweGKp20uXCINxBO4aGDVTRWo1x4OzZ2Xq5IXnPkjMXyMKXnHfBDOIFCbVLv20UDBNbP926B+KXSuL4tuy3XEoQSCynKHHizvgo5DvbXdLLWrtyWHmDy77giIPRs+XVXuNb/ozD4+hSzQvWzjzdStrprdCtwAlspqep30FOQyxqfQE1MEyJmith3ytMbkg0CpPE2GWzP7tThIIJ+D2lsSIs9LEJKdikynOWaEeZWNtzt+jY13/YcIas6EGRgNzLsRM2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39840400004)(366004)(396003)(136003)(55016002)(956004)(6496006)(26005)(9686003)(54906003)(52116002)(4326008)(33716001)(33656002)(8936002)(1076003)(5660300002)(7416002)(83380400001)(316002)(6916009)(8676002)(55236004)(86362001)(478600001)(38100700002)(66556008)(66946007)(38350700002)(2906002)(66476007)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUQj3jyxlV4lIGUFVtaKshFh/XPPSVWxobu/3pfo8GowmM3h7/WTMvYY4Xzi?=
 =?us-ascii?Q?YjEvuQScf6la5PdxtmEen04S/NrkNUekim2yP1+R/QZDBU+1WfupK6YTBrSs?=
 =?us-ascii?Q?LtzxmwRJwU2TOL6BHxowYevn5+712L3i4sNHJ8hmPxO6SG85PkRutuMzhCQn?=
 =?us-ascii?Q?RTIJGdY+UVo6Tls1AUBIMa8i61uckfhfB+W+nZDdLKV2ft1dwq7i6qT8nk13?=
 =?us-ascii?Q?fcSK0sQVGCW6WOkRrb/tleY36648IEmIYhSZk6P88OVf8YKIcUjPzNkiMc2o?=
 =?us-ascii?Q?lwH6wBR41qzxmztenCnPgsZooi/9a8V4DAz2Dog/o24rFLAnHQ7vYLCSWm8a?=
 =?us-ascii?Q?P3VINIyqzTKtfndEK52YAajFog06tTs4t0zGQu7bgjxFnawVSJ00znbaez8/?=
 =?us-ascii?Q?0UZx+61aH7qqU8BkMpvD2bYiJ6DxnJco6P790lDDIZGMUhSwYLS0269RS2um?=
 =?us-ascii?Q?oj3BdRBAYJPEEi/c1flIO20QlVM5QNArAwgHTHgHszUgJUZU5KE7DkKswgsi?=
 =?us-ascii?Q?oTEsveHryWv1UP35eMH9Qbp6wj6EHZqoZ5mLKaHjAgUy/2rkI/ySuKkcHe+e?=
 =?us-ascii?Q?wdRIhP7Ozfw9Q3LQbZxAU1gz5PZcY3NKh8tPL/dWsnVOajEAofqs9TXXWYqt?=
 =?us-ascii?Q?k5tnYZSLoYlE5v60t3MTRbhwAhtldP+ivB0AivmNlioKufrQoSufB+jyhYhF?=
 =?us-ascii?Q?DWrVGfRYrhcGCttiW7THKpQlDI6hm7CyasjqR8qHXF3wWwAtwxvf6U1wc6OI?=
 =?us-ascii?Q?NlLnSvc12xs0PPpbAGnc8ZECKucxpLmjcMvVcAZqo68DsnCHMAW4Pa9/znkw?=
 =?us-ascii?Q?v4I/u+enlMvGE/n2mjoAjiEGNvGTJKNaTc+l0PnrDhn4xRU2Fwu1t5h78yz0?=
 =?us-ascii?Q?rYzr2qbNFPeh12wPhhYnhXxGEI5SSkE09p37tBSQVLrSpMGBx8rAwYtVf9vY?=
 =?us-ascii?Q?yTXgBjc+omRIUsjHmI2HelRn2Qs412ayCKOjXCP+EvO96ZCUaplqXzXsmeoX?=
 =?us-ascii?Q?FJGELYjtG+sQbsKkLz7p308d7ud+yH81HK3DsfDeuMtrkrSYEerF4QhKfSGq?=
 =?us-ascii?Q?Tqrh5d+S/U0178LSFm4YGd9fddoJVCazto332wLL1xRedIHSc0nVTE+1OqhG?=
 =?us-ascii?Q?OUyi7MSNeN3FqyBOEqtkLcBQVEj3KLBCRZl1sQ+HZe/W3BiUACLUIqc3IOQC?=
 =?us-ascii?Q?aEt/cSL5CrsyCSaTN7cCTVDP8IyhL/lSk1oqucIGs8yqmuNQlgAIo3cJhYPP?=
 =?us-ascii?Q?Z8iCxG1+H/DzMnbTVNPbHODakRGowFZvk13qPCS+VFnxJLY149vLXp+noUfn?=
 =?us-ascii?Q?oLPt37XSde1ZRCD3Ux1ns16m?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807c75f-3bd3-4f5a-31d1-08d941192b0d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 07:31:00.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76/hPqzHXsE/q1ydTnM0wlr7vrO8AGhJwr5C4rZ3Eji8C0TPnMenlHCKMZQKfybWXqxv3yP/dg+GJbVnnMEBgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5749
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> Hey Xin,
> 
> I would like to merge this series now, but this patch needs a review
> first. Maybe Laurent/Rob Herring are good candidates.
> 
> 
> Rob.
Hi Rob, I get Laurent/Rob comments before, and explained why we needs
these DT properties, so far, I didn't get any response.

Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
engineer has strong demond for them, they don't want to move DP swing
adjusting to kernel, thus may cause change the driver code in each
project, so config them in DT is a best option.

Thanks,
Xin
> 
> On Tue, 22 Jun 2021 at 14:31, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > lane1 swing register array define, and audio enable flag.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
> >  1 file changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index ab48ab2f4240..9e604d19a3d5 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -43,6 +43,26 @@ properties:
> >    vdd33-supply:
> >      description: Regulator that provides the supply 3.3V power.
> >
> > +  analogix,lane0-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,lane1-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,audio-enable:
> > +    type: boolean
> > +    description: let the driver enable audio HDMI codec function or not.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -50,13 +70,43 @@ properties:
> >        port@0:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
> > -          Video port for MIPI DSI input.
> > +          MIPI DSI/DPI input.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +              bus-type: true
> > +              data-lanes: true
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> > +        required:
> > +          - endpoint
> > +
> >
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
> >            Video port for panel or connector.
> >
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -87,6 +137,9 @@ examples:
> >              vdd10-supply = <&pp1000_mipibrdg>;
> >              vdd18-supply = <&pp1800_mipibrdg>;
> >              vdd33-supply = <&pp3300_mipibrdg>;
> > +            analogix,audio-enable;
> > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> >
> >              ports {
> >                  #address-cells = <1>;
> > @@ -96,6 +149,8 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > +                        bus-type = <5>;
> > +                        data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> >
> > --
> > 2.25.1
> >
