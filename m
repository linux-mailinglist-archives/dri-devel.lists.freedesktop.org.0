Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804D3CB1ED
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 07:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC036E909;
	Fri, 16 Jul 2021 05:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2092.outbound.protection.outlook.com [40.107.101.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7A36E909
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 05:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVsK6pkQdXMZ24jnTPat89QVpK3lCa/qOjgc39DbVWXz37dhKovGBq1UzHWiu9RY1sWovSDek5W8jYu7UHR1KQ/ptOqJgdQRGdVH6hfLBinRY5ggnoZyXF/XQG5Wgs++PuZ6NHeiahc0NtgdGzv3kg5j1mvhxmIa34mdCx0DDBmiYhsb8jfkidzwtxouM65GLRgw+9l/qQjr0JpEE2XhwWK5Divv9YBN0WJ0zvfqGlk/N9aIO/l1ctWwLyIp500XxkNasNazG91GBEbksEMLlbE5cDOkeuillOWDUZYq9aBZ4w3iDIjtIv+Pl6+I6ZkTY+ZVSSovoev0+hp+q6y6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/su1NfmZjWx3YXbjixerZ1Pd915s0VhCYfuxPAMjy0=;
 b=IBmohYiRAig6ZNG4gX8MINMar6nYi3vzGgSTK5kCRgGbnKilJhc7I+B7H+dvBEzzm2lKaI75Ysld3n6iA46x6ySSE8B5tIEuhTxGVy/wHSji9Qe/2igZpUd2J7X0DNR2kp6i04uDl/x1Z5iGI6Duw/j6mcAF+bPNJHugZgkBht38xGX9Ahp/4uKc5lkM32VmRSCwvuOHL416djPCovSwJ6407+8SDuFZy7RlTywSf0R2xiNtciDEibO1aBZm3VvOeLkkohYSPu/Fjk1qmaCWv2BXLNF8HHgQiu01wj/4UaMSuK2QYxj1oz087JAnDMsvp5jTCHo6vCqU0Wg2kjxusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/su1NfmZjWx3YXbjixerZ1Pd915s0VhCYfuxPAMjy0=;
 b=I35Rgz23xU3O9fPMqqDmpo+zpXenuJ+/0f7T7JzaWKQ1uU77z278NulqBPeZyysWoE5MwImY4iiQNXsYryVngEZfrSNw8a76JHIGXL2Qmst3jfJ5PL9nlvxhTdZWESolH00vHzPkzDch23uTracDh37X3jeMjG2ysx8Im32vHCc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3925.namprd04.prod.outlook.com (2603:10b6:a02:ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 05:32:23 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 05:32:22 +0000
Date: Fri, 16 Jul 2021 13:32:15 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210716053215.GA1121520@anxtwsw-Precision-3640-Tower>
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
 <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
 <20210713221010.GA916196@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713221010.GA916196@robh.at.kernel.org>
X-ClientProxiedBy: HK2PR0302CA0021.apcprd03.prod.outlook.com
 (2603:1096:202::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0302CA0021.apcprd03.prod.outlook.com (2603:1096:202::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Fri, 16 Jul 2021 05:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc3008ed-f774-4e94-e269-08d9481b1617
X-MS-TrafficTypeDiagnostic: BYAPR04MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB392586F9D5EE9D7FDEF0A4FEC7119@BYAPR04MB3925.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KR63njxUVV9oln+83Q7RDMIugv47992+S98GGf7BqwzHzQ7NXjRJgha+Gxf6A3XI9F1X9H9jrSzaM7cVysddi8nPFJ4br5EnsW++pkQ3qF33N1wNP9A/207gmwpXigF5SBABSb/tzvS4VP7Jdd1WX7XElVOm8+UwlhcEgRxqD1XURNP9rWfPmXtkFlLxNsecGNZdegODupmh7Q+Te0CUhZOmIwCaSNYUhWniG9CNWoq4WnJ0+ggk8xo2OJeLawrBxOEyD4FSudbM9a1AXCaU6IiFeAl9pwENiwFUSI/wNHM2nwfnCoBd56qgPAF6YVgoIkEgA3oLBj0aPdSwKO6nCjgAgpdAyhtwc6lJeTyJ6ViBjLS5E9YlzxGsRGLzI50p9gKkdE7UR6YSR1xlTEROQxbbRo3G6Qol18IAMQsOvsYng25AueGUbe8LpvVr8gaFPoL2ocAhAtmeLiVA98MEbAXD0kEOxHSApgef48DuZ8IaGPuHalAK95QV7VkZZqPQUkRFvrmaRmk2P92BT0jNabE2pbH6a2iMSs8yXEPCT5XD+CTb17MnU6SdnQXKD1mn8Q2EaKiHqqlZP39Z/81ggU59/6fVboyoXOpL/ptfJwg8WWwOqkVvD+uDXvPVT4ZnQbktyv2S4+rn5hBYVTKzU7fJxb3dD9XbwrapIimukj0HaZ0YSgsf3E1yYrcwA6v5rKu541Kb48kEFlF9LGGsQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(55236004)(956004)(7416002)(316002)(33656002)(4326008)(38100700002)(38350700002)(54906003)(1076003)(478600001)(8676002)(33716001)(8936002)(2906002)(55016002)(52116002)(5660300002)(186003)(66476007)(83380400001)(66946007)(66556008)(6496006)(6916009)(86362001)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4iJbN7P8lunrDY8LZTbJ4z92XRa2jvpQE5kOjbdZixCZDglVOp1b3dzyKkd4?=
 =?us-ascii?Q?lp/VZHotq3b97lkYASHPYkVAtOuNy4dEJF2QgJchEsoMGTeAntI2MyumdiRB?=
 =?us-ascii?Q?4JA7CYhu0WTqKhT45jfQOlWL19HjdEbIHMfhxcoPrq536DzO8guEHmQNjT1B?=
 =?us-ascii?Q?kNmSV+K0nRWMtpBqd0TruJJnLprMynqo/NLNDGtqNuHNmM+3WGyIPy5EFJcF?=
 =?us-ascii?Q?9Qi0YR5K2o+PJVN3pSA7Vkm/QiFH/qFBADYt9zPWCMaGyrFGNSgc3ILjPVDd?=
 =?us-ascii?Q?qSM2Us+iDXDf4fOtSQ3QGYPTVlOefrfJHh9XqxFXlD5gd4Ayhl2e2PlytKjV?=
 =?us-ascii?Q?zh0HS6v7MAFLjtys/XkBTlf4N/RAQ49dLLBcp/U8oYavl2j0Du++Fpd1i5Pt?=
 =?us-ascii?Q?vmvg0vGzI1QOdXoHl8dmvI+4jdnT0DCpDHDQjwFU9pV2TqfTFzxUfTxqFgAy?=
 =?us-ascii?Q?egUMccU35bFDmwo6vz2QdFa8lNlEFL/qOHhwEzJNsFcxF0CszZufx0lLozK8?=
 =?us-ascii?Q?ufVIOWt2NHuCNCEH2DzdLi2Y37aoDRGEAQivNxlvK4Fvhs8FEEol09WrXI/j?=
 =?us-ascii?Q?V4O/kXoZEVr61t6w+Vg1H1ZEq2Ep4k1wj0pSpTVwMQT9R/TCNiLUl1vwTDV5?=
 =?us-ascii?Q?5f54bw2oSGRKk0wlMTpnvEKw+oObT1Tb/Sdn8BK00YTW6B5SIrbJTqzJoEi2?=
 =?us-ascii?Q?96GoXsh+xEcPo36ilfGBgIul+2iCoiSFG342jKmYzlluas+1PFAxGMlYuPid?=
 =?us-ascii?Q?ZcowuIU0WJtfRWYSQ8Q4jvO9siiCqfgwHZR1OoavIsD1VJi4oKpYVteRklZ1?=
 =?us-ascii?Q?nlhw18nGA18LU5MJZs9ZmUNA0HCmcZftd2kIk+DteANvNmfx3iqcYGZ9/4Uv?=
 =?us-ascii?Q?U2dkQscgiIf1lGaqcihGG7CtVm/hIhDBT+ItVkzs3m0beFVYWsR4qIhd7EAB?=
 =?us-ascii?Q?S1B5l4IEFGMbbNboS8dL5o2RE3JEVO4y5xPrO05NRgbag/DbeF/GzUXMB9jL?=
 =?us-ascii?Q?2A4yKRTyM0N+xu8/vuXrOCllRP0CVRLWrvCgzY9a/7C8x85f3Cz1Gaecn9iV?=
 =?us-ascii?Q?KcGAN3yd/GUfC61cJ1aRXDOkxW9RxooWrmc+8olLLkNJKU3BRUfRfTYhNB/0?=
 =?us-ascii?Q?9IZZSoxU/F/a9DcRyMTMWwFVVvjfSY4JUrKtWEHkyXjTHKjtw9lYuw6rdgGo?=
 =?us-ascii?Q?FkAFIFRJ5RJyytLLSIDUrwGYCWnlD5s4Cfn2lHFiZctRUifeW++SafceVUzA?=
 =?us-ascii?Q?qnYXnbDj31jZEiu5z2Z/ui4EdjAA5A1kptE2/xlAT1ElVISdr2/KIDc12kuk?=
 =?us-ascii?Q?+/bWNJo3XdQa/sotHx4D5L1S?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3008ed-f774-4e94-e269-08d9481b1617
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 05:32:22.4713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r2VB9WDTnuGhrZzIKfTo9jOF+21j8a7ND/YPtln2F91zHHl0XfMQnl/DxEplchdYW+WfVEypqIoXRn+QoYh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3925
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
 Zhen Li <zhenli@analogixsemi.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 04:10:10PM -0600, Rob Herring wrote:
> On Wed, Jul 07, 2021 at 03:30:51PM +0800, Xin Ji wrote:
> > On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> > > Hey Xin,
> > > 
> > > I would like to merge this series now, but this patch needs a review
> > > first. Maybe Laurent/Rob Herring are good candidates.
> > > 
> > > 
> > > Rob.
> > Hi Rob, I get Laurent/Rob comments before, and explained why we needs
> > these DT properties, so far, I didn't get any response.
> 
> Do I have to go dig that up? If it was more than a week ago, assume I 
> don't remember. This is 1 of 100 bindings a week.
> 
> Justify why this is needed in your commit message.
Hi Rob, I'll give more detail description in commit message.
> 
> > Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
> > engineer has strong demond for them, they don't want to move DP swing
> > adjusting to kernel, thus may cause change the driver code in each
> > project, so config them in DT is a best option.
> 
> Where's the ack from a Google engineer?
They didn't give the review ack, but we discussed it offline. Nicolas
Boichat known this.

Thanks,
Xin
> 
> > 
> > Thanks,
> > Xin
> > > 
> > > On Tue, 22 Jun 2021 at 14:31, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > > > lane1 swing register array define, and audio enable flag.
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
> > > >  1 file changed, 56 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index ab48ab2f4240..9e604d19a3d5 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -43,6 +43,26 @@ properties:
> > > >    vdd33-supply:
> > > >      description: Regulator that provides the supply 3.3V power.
> > > >
> > > > +  analogix,lane0-swing:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    minItems: 1
> > > > +    maxItems: 20
> > > > +    description:
> > > > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > > > +      add this property, or contact vendor.
> 
> Why do we have the property if we're not supposed to add it.
> 
> > > > +
> > > > +  analogix,lane1-swing:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    minItems: 1
> > > > +    maxItems: 20
> > > > +    description:
> > > > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > > > +      add this property, or contact vendor.
> > > > +
> > > > +  analogix,audio-enable:
> > > > +    type: boolean
> > > > +    description: let the driver enable audio HDMI codec function or not.
> 
> Wouldn't we have a 'port' node if audio is to be enabled?
> 
> > > > +
> > > >    ports:
> > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > >
> > > > @@ -50,13 +70,43 @@ properties:
> > > >        port@0:
> > > >          $ref: /schemas/graph.yaml#/properties/port
> > > >          description:
> > > > -          Video port for MIPI DSI input.
> > > > +          MIPI DSI/DPI input.
> > > > +
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > > +            type: object
> > > > +            additionalProperties: false
> 
> Use 'unevaluatedProperties: false' instead...
> 
> > > > +
> > > > +            properties:
> > > > +              remote-endpoint: true
> 
> ...And drop this.
> 
> > > > +              bus-type: true
> 
> This device supports all the possible bus types? What's the default as 
> it is not required?
> 
> > > > +              data-lanes: true
> 
> And up to 8 lanes? 
> 
> > > > +
> > > > +            required:
> > > > +              - remote-endpoint
> > > > +
> > > > +        required:
> > > > +          - endpoint
> 
> You can drop both 'required'.
> 
> > > > +
> > > >
> > > >        port@1:
> > > >          $ref: /schemas/graph.yaml#/properties/port
> > > >          description:
> > > >            Video port for panel or connector.
> > > >
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: /schemas/media/video-interfaces.yaml#
> 
> Doesn't look like anything from video-interfaces.yaml is used. This 
> whole chunk is not needed.
> 
> > > > +            type: object
> > > > +            additionalProperties: false
> > > > +
> > > > +            properties:
> > > > +              remote-endpoint: true
> > > > +
> > > > +            required:
> > > > +              - remote-endpoint
> > > > +
> > > >      required:
> > > >        - port@0
> > > >        - port@1
> > > > @@ -87,6 +137,9 @@ examples:
> > > >              vdd10-supply = <&pp1000_mipibrdg>;
> > > >              vdd18-supply = <&pp1800_mipibrdg>;
> > > >              vdd33-supply = <&pp3300_mipibrdg>;
> > > > +            analogix,audio-enable;
> > > > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > >
> > > >              ports {
> > > >                  #address-cells = <1>;
> > > > @@ -96,6 +149,8 @@ examples:
> > > >                      reg = <0>;
> > > >                      anx7625_in: endpoint {
> > > >                          remote-endpoint = <&mipi_dsi>;
> > > > +                        bus-type = <5>;
> > > > +                        data-lanes = <0 1 2 3>;
> > > >                      };
> > > >                  };
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > 
