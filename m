Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E997347301
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 08:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFEA6E247;
	Wed, 24 Mar 2021 07:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2115.outbound.protection.outlook.com [40.107.93.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA5A6E247
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3M8YPaYn1pZJ/sgU6q37yEDVQSk5hifMTsoFWvBSNrLmDYwq8syDBA/99Tq/t6e4TtRRHdSb9yK3VL4Zs72pzRqT4Jp7o3l8DJdv8Q8+0wTXEKeHv2XUoq6WCyMsmA7UAGXIHaRxzP72APCKJvtsTy+Qmo8X3Z4zB2AoWZmcYx5TSiaekzKzxcTnZ9s3blnV2aBBfnRQOoY/RsX9cpYBzQWFMBG0Pkkce3fwG7rV35r9jwtWkBnAVbwbfxiy7FuedKbraTk0JcGx0OkJRgM5nr8UQDp1cMlllwEI3lVOeMJbAqZ/RGzhol26MQRoj80BnxhlfDe+I7+SJ9ICsB36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuwdkeSRGt+dAjxKxyj1anVwsk1nJbj/1+stUnm28FY=;
 b=TWvPCJZvwut2Bxrdiio2dmG5FZ/RdinmW65dWYORIDLsf3k77Hvm7KF6dk7xk1aDYs2E+No3fDQ9zg3TpgLg8Ke/fVhMtk1sypZH8SU0HPD/e9awrutuXbORRTsOaRtw8Ah2Tjuw8ArW9doNzKqrof0Nt7rTBNt+v/oz8ONiRnAbZxFIHMrCaOlXGCjeiGW5M0dujUMn1MIw6gV537giukdR+XpGwLIIqwSogPkHc+47oKXpp/MgVOsgptDMRVX416CebI0B0RLhBYdk5fXks21Xud2kTGr8C3j2nWEyyKxyPhdPYhlirBoS3T3f6f0sqoJNcOka7C4Bbr0aQe836g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuwdkeSRGt+dAjxKxyj1anVwsk1nJbj/1+stUnm28FY=;
 b=n5USbcG7vRYvMov1Z2BT/XhMq6Zusz1gJOPx/dKn4Y2GYO5Ml8sd4UNU3Ga6LgQXx2vVz2Vc8OT5JPyKw43SItaZx6I3b8lEYlrUSmazGTfZjvaCLf7hO0GGxWgl9pEQaYMoKuTYFiSGsbWspbb1cu79gZG2r81mhRbd1nriJL0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6913.namprd04.prod.outlook.com (2603:10b6:a03:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 24 Mar
 2021 07:51:17 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 07:51:17 +0000
Date: Wed, 24 Mar 2021 15:51:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 1/5] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210324075108.GA1466804@anxtwsw-Precision-3640-Tower>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
 <YFc1ZlmSiNJOAoOl@pendragon.ideasonboard.com>
Content-Disposition: inline
In-Reply-To: <YFc1ZlmSiNJOAoOl@pendragon.ideasonboard.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:202:16::11) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0127.apcprd02.prod.outlook.com (2603:1096:202:16::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 07:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5183b1-a6f5-424b-a604-08d8ee999ae1
X-MS-TrafficTypeDiagnostic: BY5PR04MB6913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB69134CD0D63F836DA7AF5D01C7639@BY5PR04MB6913.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lKHeJiTMmtofDlfda9UInCwHMFu009bgGbH0UyOpUfbGKEsjQLHa1CX+CldTFD5ZAeEWcQu+lC/quiJs7Pl3z7hGM8IhiE8CAiJXzqE7uOpZoaDmrUDKNkXJDX5MsE1woBQ7UybaRN1cmC3NHJI/Lb0NcyLocNfXfqubeSW2vUZgPwyKxDLganCcgOa1j6wJjXIUlZY78lLau7Aec0/Tiuay1v/B9bx6gPmKJ3NldQ8n/WKNV6214IkCaz1LPpTwY48b1vk4mewSwLiS0GQBEW9miPRXvjTL4XhiBANl0Ix0qPHjIMrfV0kP1Wn88xTaZyPt9OzF5yJZZ0x8QlB6KVp/XSaXSL3NuO9adKqaMBljktpvKptxejv9hoGf2WLd0bKqMlYWDuE2YJob1n4RTTgQwdzBsY+F0X3Up66V3prR9U2Wztw1ABhNjn7s19uCNFfkZX5IT/rGyBdIX5m7wRJPZdT/gXEz2BcjmxtyEvakJbmUIjFGo02TsCNDuORKLPMZCGfum25E3Sz3bryy2Tx6Faj3X6qUVtOZ/sJQ+SNkRlzf9jTeOGZiKIWsb5lPUKyuFC86bpCc7gJCJIcjKHUE5OVHIPI3HiDKwYgvIbMB6fZ+wQE9D8PpDNvVRb/yASxb2tj7RBwuLmu0kCJiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(39850400004)(136003)(8936002)(1076003)(7416002)(8676002)(186003)(66556008)(66946007)(478600001)(52116002)(6496006)(4326008)(83380400001)(33656002)(38100700001)(66476007)(33716001)(26005)(316002)(55016002)(6666004)(55236004)(16526019)(86362001)(2906002)(956004)(9686003)(54906003)(5660300002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C6Uh0KyHjfgcA6xekDVwlzKHCelU35knmrsFLI9RVYEq7DoyhEYmki1BEDrO?=
 =?us-ascii?Q?pjnX0rdoPlJIU/ZmLBJaok1Yl/sV/d2AjGYZZMggruQtJD2pix8cMJAXX+6h?=
 =?us-ascii?Q?GOUkZcOINW/Utxul+guBCtYQZk/umbnsLKdReOHfppGmfP2h6tc/THHvlIXX?=
 =?us-ascii?Q?jFVCgPz/hEovertwI74uCch2vihDecdmCtsS/XMBOCO+3UPqq3A1r4szYR6U?=
 =?us-ascii?Q?OOgRHizZv8C4dqee3hUjawZ2qa0CuUnheoggYDGQ450djoUfCYoO11t5x98T?=
 =?us-ascii?Q?xrDM9KvtbMeTGpPjYgpCr8iOr43vE//jhbsG8CEzqsGJVfJt1OHssU1NLyai?=
 =?us-ascii?Q?VRoPQ50ujZ2D1msowlheAupm08cxin40+WoUJshaPhpkySs/DBcVFJK+kYVs?=
 =?us-ascii?Q?QQUkuouFI8oW/V2mEocbJSw+nT7EDREFs3hDrxDExiFXKHo6wMUp7y0TW6A+?=
 =?us-ascii?Q?G85QanVa9aE6fX3d0sXmQ4YbVJEiysL6GqKIm4UYasrIQEyYoK0q08IfIC/2?=
 =?us-ascii?Q?Jc3ZJoA3FhaygpJsv3LIn7W5FLDd/k0aIWE/TyTgHFQter3yj2XDXBNHODy/?=
 =?us-ascii?Q?GvLaurqAkzurWBFGpoyNskmv1VmmiCXG7I94yClkTJGCRwyF8C+TQCrbhKj8?=
 =?us-ascii?Q?x7fHlApiXgxTxWpuoKQ5TpYyQS4uykECZkPllLIe/o4XKXc5yG2OtyUMqwnt?=
 =?us-ascii?Q?QcCc2OrgqUvXBYNsZfRUXkxARqP0Yedb6vOPMPCvuO9xRrJ3NXUEIk1s0A5z?=
 =?us-ascii?Q?O/tu2lkwRp2Q9zbUY6pg689nmCGaiyWPOUPQStQl4yPWVRK6oKxp5a3xWCJ0?=
 =?us-ascii?Q?eWHG6siVJ1E8hsQIpshrAeHPt8dGQ+S19TMIx+E/kzkexJOdrHUb4JHMcSgX?=
 =?us-ascii?Q?8YoZ/Uswst5YHNHQxwYQ16rko3bCRpsVWyAyvpvsbmjyosFyKbXT4VZz82bC?=
 =?us-ascii?Q?IrxCrPjSYLRfFezhoHkymiFuSCNY3zuJ58pLhkUqHtaquEePUSP60htGNTBH?=
 =?us-ascii?Q?zevNdqHZUKR7Z8EZF2QXyzu8EoM2mxxxdSQPoRm/T4etfwyv4fDPkowy988n?=
 =?us-ascii?Q?6D66o26+/KHRuMVEGYuBy8A/TDL/yJGByMN+xaWu7iKnARTP8201/y8wkT9z?=
 =?us-ascii?Q?xfktV1D3HuZC1UWz4lhznT2kuoAtqBVx8IoXXKwjkcPgsN68omDuwOTrK2Fq?=
 =?us-ascii?Q?8WjRNktz84nSJEYiRrKtSwbHYdKlii/XTb2wRZBHFW/M73BSTl4AvKGoo679?=
 =?us-ascii?Q?ExpCtp0bKaVDWtamJdqUsfMJmQZMfuXkBelEeaSpRoVvtTRWXBYQmVlcQAgj?=
 =?us-ascii?Q?lTqTUTVFR3NUg9iAQmJ/rF5B?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5183b1-a6f5-424b-a604-08d8ee999ae1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:51:17.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phFegjPpNNhqPZj9X7xAOEjjZpoNAaky1BoDQQMtGPX6U8RNhBM1JVu+R4NnLQpuwheJqacyb5BnVZCpHs76WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6913
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 02:00:38PM +0200, Laurent Pinchart wrote:
> Hi Xin,
> 
> Thank you for the patch.
> 
> On Fri, Mar 19, 2021 at 02:32:39PM +0800, Xin Ji wrote:
> > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > lane1 swing register array define, and audio enable flag.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 58 ++++++++++++++++++-
> >  1 file changed, 57 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index c789784efe30..3f54d5876982 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -34,6 +34,26 @@ properties:
> >      description: used for reset chip control, RESET_N pin B7.
> >      maxItems: 1
> >  
> > +  analogix,lane0-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > +      add this property, or contact vendor.
> 
> DT properties need to be documented. Contacting the vendor doesn't count
> as documentation I'm afraid.
Hi Laurent Pinchart, thanks for your comment. For the DP phy swing
setting, it is hard to describe in here, needs to refer the anx7625
datasheet and programming guide. Basically, no need to change the DP phy
swing setting.

Thanks,
Xin
> 
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
> > @@ -41,13 +61,43 @@ properties:
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
> > @@ -73,6 +123,10 @@ examples:
> >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> >  
> > +            analogix,audio-enable;
> > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +
> >              ports {
> >                  #address-cells = <1>;
> >                  #size-cells = <0>;
> > @@ -81,6 +135,8 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > +                        bus-type = <5>;
> > +                        data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
