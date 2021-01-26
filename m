Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F03055BA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F366E5C8;
	Wed, 27 Jan 2021 08:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760121.outbound.protection.outlook.com [40.107.76.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8289F41
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 10:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsnOPcDNo4wl5JaZG+m0TS+sv6rTLQ70jVebnuYdWBVRd36I9FXl1OeSCHaCEbPpq7WyoHOW27eRQ+KOTxnR4ydT2QpgBpqM0PxB47O85++KNWjOZmUct/eQpXy1bCKcebt6bvcj3b1in8eKIRqLhBGR4Pbrzo/3aWu7J/Wf4bfiXB+eoC65922Z6862zxxJNRG74mkwq5ifk2w0Z9z0EaghtMKyoLTLevGwTw/1mpct0qfvbxLntkBaNxDMZ/JR4F0bfuhc/k11i95KTJSyPGt46RXnAJfMNN9dZGPIw08Z9GyWwMGi/DG/g2ehfn5GTvuu3i459R1Iyr+RPHuPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxaxSv7khV0h79q7HjXhhbYDA8bi69GJiDvHV8aA3AM=;
 b=LGQ7tbQEo+p64PoQ+iVIT86MPX9P7f+Abqf+c9F0erS+YWS1ThEiOPr992AUioFUxxFzY1KobGUQ+pnyqzaIqNGhhAXKL7jlQNxs1Ebg5YPfO7NKVLxFMQWdjYatewIO7kHRx7reRdqf0nItp8ySUUW8cdBcRaD4g1Vk80bme0wvCoYu297zgRYSNZbihT6jgmoyPz3uGsTywFoWTlQkEoZvcZY35vbunWZIisJnOcSisRL6l+gQ1s42SoFB7c+xYL41MCb1V8t+gpGlfdaVmuZoBeFGFWi5AK6hpJzEflNU+deZBC5ygNNpsOPHOftO2f0uhnyv4DTwxP+oPG/P1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxaxSv7khV0h79q7HjXhhbYDA8bi69GJiDvHV8aA3AM=;
 b=Jc6Yf8sIwC0E2lNbjtbxxYDhRkSzs1WzrzHtR8oGAEmZtLuX5DBDR5VEZpQXZ/WTrcJuEVUJJIGMxrg5yTqdoCNSIIWDDLUeD6s7NpdqWuyviWiOKxO9F9UPNZKBENkd58nSxNBH8LkZbG5DvId+5G5eoIwKgbDEzLYqG4IAj/o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5077.namprd04.prod.outlook.com (2603:10b6:a03:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 10:23:00 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Tue, 26 Jan 2021
 10:23:00 +0000
Date: Tue, 26 Jan 2021 18:22:28 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings:drm/bridge:anx7625:add HDCP support
 flag and swing reg
Message-ID: <20210126102228.GB32321@zhaomy-pc>
References: <cover.1611572142.git.xji@analogixsemi.com>
 <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
 <20210125154143.GA390777@robh.at.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210125154143.GA390777@robh.at.kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::15) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3825.2 via Frontend Transport; Tue, 26 Jan 2021 10:22:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db8a370-1fab-4e8a-cb09-08d8c1e45b1e
X-MS-TrafficTypeDiagnostic: BYAPR04MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5077FE45873820FFB9FC1119C7BC9@BYAPR04MB5077.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EQXkotNRBTrRZY3DeYLSKihrybkDA3iuRbI6lAwhLUE5VQJuiX+28mdHkxHruBpmrNUJGtI8jn6nAtyapn2V0+UJHNL501x6MLYz+8H/QAcR0tZY0fjnb5ltVp/yDGNh1rOTrKvWp1XKFeA4eOhu0hIyOzzONng9qEBzQX68Sr3x7r3NjEk/HLgwFAaBHQ/i7H/L64aqvOYHP62NO8/CGVRjjcHT8b9ckoPO6duWb5tuPq9C2IYG/ZM+OrC5sjILk7CDp5TmKS6Oi1bXcBpU2Zl6CHkrb4ni2qOX1ssrKkt52krw8/jgT+mmKdU5jhw1XMMrm/RO8qnomABgieziZNZXmJd2j4sYJk5xVVwzp5OyARdPoQzGq+jbFztSXjvmsrc1IXHa8YSmTRkXXG5c+7IsvKoJNpaFHzjrnK5DYa/engUwnzizFZcp7Aox9ilwRef3WwohbFud9cNSZPST36/TeBQF+W83C8aZpUeNeYEnewxCXitnPxK+OPNTNyHfZTbEv1AGtlmy2nAt6Iui1pTT2NUIq9K30FijDOTOn30gNTc2tp3fDDfB1ldA4JQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(366004)(376002)(396003)(136003)(346002)(478600001)(16526019)(66946007)(7416002)(316002)(66556008)(186003)(5660300002)(26005)(6496006)(8936002)(4326008)(54906003)(9686003)(1076003)(33716001)(6666004)(8676002)(55016002)(66476007)(52116002)(33656002)(83380400001)(2906002)(86362001)(6916009)(956004)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ROZ7lYXaDf85sS2kh0sX4pHi4SFd77OnqnKB8K6jy8KrIrqXeh78vgwbGn2S?=
 =?us-ascii?Q?mQtv/RE/UuzSzmYcc3Sv7yFHmk+dFRAIbIkCXtUrWypnSfHQGjFUgUOVUuce?=
 =?us-ascii?Q?cwe3frWkjMW+4Suu610ynjnwlFUFYIfZ86bwtmjLbpA9nE2HSH4JdWfuLXv+?=
 =?us-ascii?Q?LTzyA3ed8Q28UcwFsOkPFGdKVyL7bxXCTx8eSMJGAp440LMsrXhkyA3/af2+?=
 =?us-ascii?Q?cX+LaXYvFyoUOKEHarXpsh2Q5OtKjcaNGVoQG02pcPcVJw+NyKMUh49stzjQ?=
 =?us-ascii?Q?aiolqjDO9vJQpS24g9vE/GOjiuH1fAViM6rmcbb8zpfA5SZryRhkqFViIlJQ?=
 =?us-ascii?Q?PX2OTlAT1uSM6zls+TFIxM6Ne5fpKtfnpAg4FNf48l5XvyIseyyT0AXBPTaA?=
 =?us-ascii?Q?8jp/ejB0BB3P81SseDgKybg9Ze4hOznNgoFHwcwsuAIVrIUzWu6VynhCTCKd?=
 =?us-ascii?Q?EjKLkqQ+gc+R+LffSKGnQku9Rqby8riHiVw6QXA+6bwKHKrFDyIJKznooNub?=
 =?us-ascii?Q?jnbLkS5xjoA9li04wPtuHp1xgWu8oP1waf8YTfE0jyWeeZsTq3HkaP6XYYyT?=
 =?us-ascii?Q?ecnChGkgNKzoVjnCLD43AI3x4qQ9/ibNnWNDmsXvFRo902i3NJsume2cdcFs?=
 =?us-ascii?Q?CBCd153nuPvB0w30qHSETeZ5pIz/6PnIbDq1jVQY8k6auKGwhBrc/4A1lQtT?=
 =?us-ascii?Q?1fpbOhjIqYltXeLttxvWYL8Olh+NOQQ7o+FAIZM0oaQJHiSp6DEt7u7oBAw/?=
 =?us-ascii?Q?TDw24jh3BqnnxJ+A/pEr46WpDigq7c1xXMpgeT4GkeBsz7H8TuGTjMAq6v39?=
 =?us-ascii?Q?dSz7/LCPVpfH9rV98Z8HZ8hQWc8KasPnwOPTuysN+zU5tDW3wXGAXaW9+rFt?=
 =?us-ascii?Q?3uFB8SEdMz5HXrJhmenVy8IljkVArehpriDZK5XgbZmFgjkX8iFa+VZL8BAv?=
 =?us-ascii?Q?NTlErOKqzQbWL9tAv4Dng26YOWOtiqKywVYOWwfIgtbRF+jp5a9vPf72FEfX?=
 =?us-ascii?Q?+TKRdEwbpdVk5szdelv4Iro4JWouz5WfmNUfyi82/11vVuQNCavp1lCgn5OF?=
 =?us-ascii?Q?eyrUHtdB?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db8a370-1fab-4e8a-cb09-08d8c1e45b1e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:23:00.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr/DhkwEcQFDaQjdDECb+ZOqZo27tXkMmvVqAcFPTHWVYHKzneDoVKf2r29dSA8QRZtTm3PUn3Vk+ZOJ5yWShA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5077
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob, thanks for the comments, I'll fix the issue on the next serial.
Thanks,
Xin

On Mon, Jan 25, 2021 at 09:41:43AM -0600, Rob Herring wrote:
> On Mon, Jan 25, 2021 at 07:12:21PM +0800, Xin Ji wrote:
> > Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> > flag and DP tx lane0 and lane1 swing register array define.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 57 ++++++++++++++++++++--
> >  1 file changed, 54 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 60585a4..3b1cbe0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -34,23 +34,69 @@ properties:
> >      description: used for reset chip control, RESET_N pin B7.
> >      maxItems: 1
> >  
> > +  analogix,lane0-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,lane1-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,hdcp-support:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: indicate the DP tx HDCP support or not.
> 
> Sounds like a boolean.
OK, I'll change it to boolean.
> 
> > +
> >    ports:
> >      type: object
> > +    additionalProperties: false
> >  
> >      properties:
> >        port@0:
> >          type: object
> >          description:
> > -          Video port for MIPI DSI input.
> > +          Video port for MIPI input.
> 
> You're going to need to rebase this one drm-misc-next which uses the 
> graph schema now.
OK, I'll rebase it.
> 
> > +
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            # Properties described in
> > +            # Documentation/devicetree/bindings/media/video-interfaces.txt
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
> >  
> >        port@1:
> >          type: object
> >          description:
> >            Video port for panel or connector.
> >  
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> > +        required:
> > +          - endpoint
> > +
> >      required:
> > -        - port@0
> > -        - port@1
> > +      - port@0
> > +      - port@1
> >  
> >  required:
> >    - compatible
> > @@ -73,6 +119,10 @@ examples:
> >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> >  
> > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +            analogix,hdcp-support = <0>;
> > +
> >              ports {
> >                  #address-cells = <1>;
> >                  #size-cells = <0>;
> > @@ -81,6 +131,7 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > +                        bus-type = <5>;
> >                      };
> >                  };
> >  
> > -- 
> > 2.7.4
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
