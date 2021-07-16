Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD03CB1F2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 07:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0F76E90A;
	Fri, 16 Jul 2021 05:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2134.outbound.protection.outlook.com [40.107.101.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBE56E90A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 05:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZaRBmGmz56vz6pHEcLImNXOtcEXEWS+A6oBznlGaAemnWdDcHc7eHCyGsdDLEtJ5BLZ6y3auNSQbId6bnQpj2jLF0w9/9kgiq+TdTdUqp3PlqugT70XqiqXJHTFLf899O0kRrcdeOOpxtsXmy1vAqZqcSeO3nysGXyDB1WTzhkTASjQ9AG7EZmmcKVSpHuNtQ9kzab8HVW+efk1TAmuZJMz9ARnQCWjgV0wt9EXKK59XuoNMXDkTPKsWtm6FueLyCcrrF2YG26Qwi7L6fvx1piPeHidbh1dVjJvzoWzAK5O5ExyN0PzkbqecUlrRVxBoAB/3XTyLectR8dlI4EVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gNG/t+B3o/LT9X1R0PRKBQHiRHD66Tq74x4Iql3BNQ=;
 b=XahvlItRlIwWGK9BGnvS0GFm6c0VuQju6djQWW/b4D2XCQ0QB7BJoCQP5r4gt9p/VHHawW7vpOjnwF/RQcMIjKAkQ8VDc2HUSu8XbXH1ZDBtKOtAkwHedo+6ZjM6xuBj//cmZASyZWolh4VbpjFzeiRD06koeU5r8RqQ+CdAO+tHJXDKK3I9mjfYThCU6Xo7dakPQZown9iWddABHMWb3tGNVy3Y+UtiBVvSrmrWtjlU5ER2+PWxaroIl91lUjQ6Ao/aI1iw0J/47u5Nsh8fAGd89Nx8TxnI20SEVm2jK643ihed+tgGchwm91eDPzJdyweYjfzxEKZYtTB4TxG2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gNG/t+B3o/LT9X1R0PRKBQHiRHD66Tq74x4Iql3BNQ=;
 b=LHEQW2/El0Cwf60qO3EgcmcLHlZnzfwrM72C8BdPeytau1KEbdqpYeF0ElXQW0+h3CC/GeOGFWTPviqtfAwEmRyksqZvqu78Qt1E9qc30aph9p6Mz5Ft4cFj3g060YmFn+1yWBOiDF5tg/i7ARfEdkLtz88WcYUc+bxkOhZLkDg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3925.namprd04.prod.outlook.com (2603:10b6:a02:ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 05:35:29 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 05:35:29 +0000
Date: Fri, 16 Jul 2021 13:35:23 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210716053523.GB1121520@anxtwsw-Precision-3640-Tower>
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
 <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
 <YO6hIzlOuMsDXztW@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YO6hIzlOuMsDXztW@pendragon.ideasonboard.com>
X-ClientProxiedBy: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0018.apcprd04.prod.outlook.com (2603:1096:202:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 05:35:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ee802cc-9906-43ff-a797-08d9481b858a
X-MS-TrafficTypeDiagnostic: BYAPR04MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3925396988BC70DB0E075DEBC7119@BYAPR04MB3925.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjrpXH6loFu4MErWz7taK3j694Ph4CkduuYZE+vtDYB13KQ/hVvMrVbfVgWveFk6Q91pCMLPupW2HoX8h9ZyCyL9Mui0y2UxeErhyL7Nt/uHI3zQMo8dQT40FDWbyCCJ+En4Pj5qldxHAXK9Ck2VA6bEkARmLj2H5iEs/BOowgm5dxpi8T8bQlm0+o+q8yl1FEWgpB8Dc5Y/VPCrALMDx9RAvhv+y2c0rO0nFH/8B+fizEd7rSsLfdh2/BgDXbO34g+5oDNOndaCWzD9p0u+X31SCdBTxKFkI16Tq7a5/yQXeLCt+X6s4RUzxVpkqlyeoPOFo5e5g5VQg5q8Q4L32/ZGL8i56xHNWfWMYG5T4+pWLn6vYRZ0YdDj18obJCGHimTen1Gy8dAv57atVV5glis64AHqgbXuH/Fgkd4yyC6wdsAXOaUACw2LHJGsi3elvgmEfcXSqONrwUDNY8pTY0WFOUj5I0SejClBfvYv5i2A2ylEO+INmpobzxOjn5o2pmrTFczPBFfQRzZipiRXCHTsMWWjezrQCRJw5h87gHmnxrjw88zWEEtUlx/3xDhNYAJm4vYAuLXjEedI7SNV7IE7RZXqSFqc9bREgnRCqKWEU8BTqo1J1JRn7HiufryB6XYiESWKV6tMJ9u8DxTLF3CtgbG0W+xr4m9/Ti8xyyunJvXlT3mxfV2T8xCQ2C7Ymt7ckyTtSa53dJxxNDkFJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(55236004)(956004)(7416002)(316002)(33656002)(4326008)(38100700002)(38350700002)(54906003)(1076003)(478600001)(8676002)(33716001)(8936002)(2906002)(55016002)(52116002)(5660300002)(186003)(66476007)(83380400001)(66946007)(66556008)(6496006)(6916009)(86362001)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NsPmpvcJLXB6iSPnkHo1DL0RItJvDrrK9999girQfvD241K/pLMpDtWRUwEQ?=
 =?us-ascii?Q?ucasj44Cd4OAIpEQHeUJ3efJ6kwfh1Hp+vqFwXy6kEpeQrgxyYFdDxP8dIS+?=
 =?us-ascii?Q?NgzRXkAtez4bPsVBmTqZ0xvfIFIaxcUpbzLIpz5zVFZOVTbT2dxhi/olIr2n?=
 =?us-ascii?Q?Bpo1vV9SbM30Lq+uiZdxJYMI+Y+8fmi9QAorpJbD/VAfnmV2irtVfjWTgEIZ?=
 =?us-ascii?Q?LiY+PbAavzGq23e3gxTNth2IYA8iVUcva0y6hy3hAQzY0NOr3QQyx03DSG0t?=
 =?us-ascii?Q?yKdMXcoy2+r+wxt9QfjS+qVm/1v4GsYxbxZEdsazA80m14icr9d6fg471f9I?=
 =?us-ascii?Q?q8NB+g7qQQHbkluInvDy+bH6nsuojIyNpefRYDmspdRvd9MrMNE86/FDNYcx?=
 =?us-ascii?Q?3kLP0o9j3eA9ODAXGlxnATKldUlh5x+ivksJEU1a5xf0ZAnsi94EVtKpDLs1?=
 =?us-ascii?Q?imTFW8gXF6sgZcfwJ/sC1xOQuCz5YTGZNpbVfIGlNYhytCH8ve6deHb7xgl2?=
 =?us-ascii?Q?mAUZKav6426XIWYx0q+rwjzLBisC++dy2A0Lp9I1qjLwuEHq/VhPwNGAUEJo?=
 =?us-ascii?Q?6xUIKTamlcNxev0mW8f3M6qyw84Y5N7ZpXqAR8jnmF7Tu6VJ+4DGaKHHe7Df?=
 =?us-ascii?Q?1DZfTBB/0Z1jBAz2qJ9kv/6yy2LCaV1fBWrFkANjanOFFky/e+gtSBx0RvVZ?=
 =?us-ascii?Q?woI2lkORddMjabBmoloSqWu6CBUs9ZJZqPQDMB7vXkHxYtFicXuRyy177dsi?=
 =?us-ascii?Q?0/aWl8P4ImmCR4W45vTVURibzASVGXYOTwcoK4/gdtuD92sAsUpuuUnQDqkY?=
 =?us-ascii?Q?Q+OVumXBNb/WjBBZKpWEcwY0RTbN5ambBL1NZlSpNffjgUgQyDPSM0xy9tY3?=
 =?us-ascii?Q?hS4k2W3erSipyiWtdjJRrC1SuSLYERROoJLP1R37UGU+8PQczX6n5yk1YbB0?=
 =?us-ascii?Q?7u1G/bqXX+IaQUFCndpwGReOmyO2pRoulY5XAKIEDkqJ6pvxMyW4YVhFoTEA?=
 =?us-ascii?Q?wijaSI1l9c/B2NwkzifhL4lntYrL8DrwuA0lJo9clcROuuG9u9ZNM96JzGkM?=
 =?us-ascii?Q?lx1+taV+dLIp1CuqbEmZqvbU+A+toan5Kqo5DEvOL26qCPZCblhbwn991DP8?=
 =?us-ascii?Q?pEWsM0L0G+oXRZdeprSSOjLytHcokNN5CH6+iGBaOffJ/OYAuP3z87ukAvcb?=
 =?us-ascii?Q?sCVl57hgekfZQ0b/CbMQsJbABulflKaf9PkQbFRUh5pYP5LG35IQWlkjonI+?=
 =?us-ascii?Q?TXnOujOJN3g+ZXxlOjsGtglqm2un7yfsz65nJFmnPHsyNtyft7IznMvJCi6l?=
 =?us-ascii?Q?AW1i4H/rgySdlvvuY1DhhLGf?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee802cc-9906-43ff-a797-08d9481b858a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 05:35:29.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlZ/3LA4JdrXEBAqf81pTJhnrKikOCpGiAzrm/0JCJ26P1EFoV3nRBuH/ToY5Yq958mr7KLcHMIZYw+41uwM9A==
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
Cc: Nicolas Boichat <drinkcat@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 11:32:35AM +0300, Laurent Pinchart wrote:
> Hi Xin,
> 
> On Wed, Jul 07, 2021 at 03:30:51PM +0800, Xin Ji wrote:
> > On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> > > Hey Xin,
> > > 
> > > I would like to merge this series now, but this patch needs a review
> > > first. Maybe Laurent/Rob Herring are good candidates.
> >
> > Hi Rob, I get Laurent/Rob comments before, and explained why we needs
> > these DT properties, so far, I didn't get any response.
> > 
> > Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
> > engineer has strong demond for them, they don't want to move DP swing
> > adjusting to kernel, thus may cause change the driver code in each
> > project, so config them in DT is a best option.
> 
> Hardcoding it in the driver is certainly not a good option, but
> hardcoding it in DT isn't either unless you can explain how the value
> should be computed. "Contact the vendor" isn't good enough.
Hi Laurent Pinchart, thanks for the coment, I'll add more detail explain
about the value means.

Thanks,
Xin
> 
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
> > > > +
> > > > +            properties:
> > > > +              remote-endpoint: true
> > > > +              bus-type: true
> > > > +              data-lanes: true
> > > > +
> > > > +            required:
> > > > +              - remote-endpoint
> > > > +
> > > > +        required:
> > > > +          - endpoint
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
> 
> -- 
> Regards,
> 
> Laurent Pinchart
