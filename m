Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF4310C06
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77456F42C;
	Fri,  5 Feb 2021 13:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770138.outbound.protection.outlook.com [40.107.77.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D8D6E055
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFkgeIIxk1FG0A8/pSyGZMGOWtCwxANdKW58WXC/TRLBrQbz7US/1If1PsbKRUf/AS4o6MsyONpAD/QmMzXmYhfZI0ATY3ovvI/I8lRkkBo+28ynnzrgWsOwH3PNRrRiw4vL5mT+D7jwHrwsd8LAkcZQkyOJdo+oWeGmcfRNaG5R32BrluXJOu7tBSwbZHwwfm573LktdLvUW3EaoiMSEJ4zuVICfvW72RqRe9XhJcCMFOOAwTlKHoTVbxR0LeKwNlNgCGS7aJ7JQE6NwMpAO4asn3Z5p3TbwpQdcbyfb4upzacxK6Uo5DuMq7QfGA1QHK9ENysvaPGU3Nm+BW07GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyDIOYGs9eqF657ZnD1hFwjSzhHB6gxqnY/o3FNNQwg=;
 b=iCe2yet8AA5EFWy/Fzf0E5cD24tHCsrZjD9rfHWTHpaxRURuWLLyjc8YF9bbo71GHRQklguxe/bwVSTIb0irNu/j3PaYzxrdVIcgtvoacBP6kD5bUbdFIleo+rylca0Lmy5lfkI9Eur0Fpje8dc4zHioxFqkemZ2rU+ckhnfJqmI/ilJ7jdB0JIaG/MU7aM0PpP2dq/hNrQ1tI3NDe1hrnZ5TdxQfuHgy66OPg29ShsNMgNgUa6hpf37ZR284au5XSbvF0fC1cNeyVLa/VCBSPt3F1MKAvPnSNPjxtpsxhw4qkEwiT+g+jFJcnQkp8fU+1lo3rZciaVCSpPqTYhGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyDIOYGs9eqF657ZnD1hFwjSzhHB6gxqnY/o3FNNQwg=;
 b=06GdQH2nuaMthp4N8O49WYxo1SuVWlObLeCMeRmsD3ht+dJpyNCvr+jiWlHeW2yoEnl7m4yX4yNyfunREGsGVUaNd7UjqtNqhOu713svD8hou2eQ2NF4DpaWXJZ9wao/Jxr6ohjv+jMUg2v3Pj5zAuuTKNmkRXyuNS38RDqaEww=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (10.186.134.72) by
 BYAPR04MB3927.namprd04.prod.outlook.com (52.135.217.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.14; Fri, 5 Feb 2021 11:38:18 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 11:38:17 +0000
Date: Fri, 5 Feb 2021 19:38:06 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210205113805.GB18836@zhaomy-pc>
References: <cover.1611802321.git.xji@analogixsemi.com>
 <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
 <CAG3jFyu0qj_ipqz8eKWtmkjKDBBAF_X20f1i-d=83vksgh6nxg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG3jFyu0qj_ipqz8eKWtmkjKDBBAF_X20f1i-d=83vksgh6nxg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HKAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:203:c8::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HKAPR03CA0017.apcprd03.prod.outlook.com (2603:1096:203:c8::22) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 11:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb6efa4-e560-42f4-2e5a-08d8c9ca880b
X-MS-TrafficTypeDiagnostic: BYAPR04MB3927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3927DE5E849F9F987F948609C7B29@BYAPR04MB3927.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9enVoPgIs0VSY8vm8z6cXrRhzZDMFQqkOuS6hs83AyIDRYg/Bl41Pivj5gy2sC0rt1RR6yzXZur8vwY0DcGKxNl8bILtgAUMcY9imSI4xlgf6uR5lnffKtfzcbhVVykTLPdisGQlVqTj0Zy4VSyIwHtGewkLMMoqMVE0vTO+uL0modHIXqrxUJ3J0rH5pdU4TrguvzYLcz6wD+Ypnc9w56TtFtn+OCL1hpTKXJqAuhmlhf198YVU6IAzHRnjzzLqNkjDO8klYFnYwwzBGkeII1a63HzBxGLIdv2XzwXatGYDwepu0+SvL01HtMDm9nO8UJ5wpn3YH2d/bGxQBOfnmNkqyRLOP0b9N0ZFefJetOlm+NA8QiCLXsyy2Sur+ZaYYlCCAGa2jZTUkFmeA1xrNhFsOvXkdHivv+qjSSlZ7462SRnO4d1546PgQGeJxg3MBGnQEWIwKY5BpbEeTojskKQWVpJZXI5opVFd6+Wt/SN1WMWJAYkvDrm+LpyXTA7VXizN3h7PKFriaQnGvEYlNrVhH/lwOM4V1nYB4UaP8bVZgnsKl0NO7SPxi+Br6nA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(52116002)(4326008)(6666004)(33656002)(54906003)(83380400001)(316002)(956004)(66556008)(186003)(66946007)(2906002)(5660300002)(26005)(9686003)(1076003)(8676002)(16526019)(33716001)(86362001)(478600001)(8936002)(6916009)(6496006)(7416002)(55016002)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CB2jGHgEfKyhB206Gp8/BjQ+yomA02D1IYXcD/gMJMN4y3v2daWhqu7EC5LR?=
 =?us-ascii?Q?9yKtofCy5uZFj+SRr9UG2y8ixDdJzLLEq/XI0wd82x2N6FBiw3IvOblJ+wld?=
 =?us-ascii?Q?IhJpwmNFPzmeCTxHqJ3wzhTWLdHH6zPoIM2GqYofg7n4bV4F2koSrfhO2PzT?=
 =?us-ascii?Q?7+Kl2o1IzwWnngf82e0o/ffVNEswx8Az8THN5toRI2acaCE1A4gsumeP5p70?=
 =?us-ascii?Q?fqq7NDi6HkzM26IRI6SMlZhQX3Pu0PytvQr6mBZA1CIDvdvc6srqRoFUTaJc?=
 =?us-ascii?Q?h2T0nunXCRgPJKeGw1PyD28+77cr4O2eOaf20kg9+cvHPP8FW1hvWWOHyZAf?=
 =?us-ascii?Q?R1wh7gqsthwnlvDNTPof8PvnvegzvxzufXpQYYNoE7giHMztHjfqlh+8Ybon?=
 =?us-ascii?Q?fOT0w6u6HW7TQbhD6Lu0ElSMJEgklXxo/EuGZeWNfKR4lhbmq21joN3r1Tow?=
 =?us-ascii?Q?aT3o9PXz2HYdxOkNWRAMaY1y822p/bhaPdPi19fkFskAvACCfGSLP6+IkSLu?=
 =?us-ascii?Q?5VObiwq88J4qCpVD9vLHBn8dOhm7ydVah1ktqR7c/PNLgCqVUAPbv5EeFyPY?=
 =?us-ascii?Q?VQx6aoPRJV7y2RlqHaA39kyAWP95YvA5VfB08u2Xu6UUSNOiGHMshdqkChly?=
 =?us-ascii?Q?9cwItG56HvliCALxjwwyAMxvvPqBUhIZ/sFwF4SZeWSsEJbXUfXIyoOLz6bd?=
 =?us-ascii?Q?1FbdKCCHgZfASgpS6cA/abGxRSe+XgRH3bYDLMHfJiZwHq/wDxRtjzjuD25A?=
 =?us-ascii?Q?wkOgPlNoATSF9nlAxyVWhDrbmccxAy9RbiedayS8xqcN+M+5/WmkIbEnVO5+?=
 =?us-ascii?Q?ifN0botdu93LKZatQzhuZ3Dd84AfAXxP4x7rs96ne17LMLxgC2LYm9HMjr4B?=
 =?us-ascii?Q?WSnBOd5gpiwBd1PWtdThTsTFKyEGy8wdKun1DE95hf8zsUeNbCWVP/vOPBkP?=
 =?us-ascii?Q?9kV8Ws+QrvF/PX6+SjWdWIRvNilMMHxW4jIPPvhmEYg1q6bHF/pg1pqLmMfE?=
 =?us-ascii?Q?xofWw2Dq2UWJ7GnJgOG+Fsajl+ECR+vxkyXu+1sJ7PvVLrSMEESa2PWGM5at?=
 =?us-ascii?Q?T039CekS/2dWhTIMd7XFcWOMyId1FiGku0G/1u781Y3JYkJ1moQesOnxPatB?=
 =?us-ascii?Q?dKWczOwNwsaMyaney8ZRZW/+aRM+F/REtZhzm0xEXKIFoF/XmI8CavW1W9mi?=
 =?us-ascii?Q?sZiGF528Z0+nn3jx5v5SZHzGkFRONdCtcCwvv0jhn4tLUSaiI5mMKpZkZ3qN?=
 =?us-ascii?Q?Aq9thGdqJay05aF8VZPRzCMLvrW7xjVrZMx/VggQO5us1XN2Vp8MRHQ4rl00?=
 =?us-ascii?Q?JLcmyxwCEADVmseRd+xcOr2h?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb6efa4-e560-42f4-2e5a-08d8c9ca880b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:38:17.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grpvmzO/S9hANqhEq4H9Ut3BxcyBftU3Z/zkWZqqhj1dfKRIB19WhoM4lb7no/UoqebGIj/Z1Vfu3wZ5pwlm+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3927
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 01:38:36PM +0100, Robert Foss wrote:
> Hey Xin,
> 
> On Thu, 28 Jan 2021 at 04:10, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> > flag and DP tx lane0 and lane1 swing register array define.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 54 +++++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index c789784..048deec 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -34,6 +34,24 @@ properties:
> >      description: used for reset chip control, RESET_N pin B7.
> >      maxItems: 1
> >
> > +  analogix,lane0-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,lane1-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > +      add this property, or contact vendor.
> > +
> > +  analogix,hdcp-support:
> > +    type: boolean
> > +    description: indicate the DP tx HDCP support or not.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -41,13 +59,45 @@ properties:
> >        port@0:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
> > -          Video port for MIPI DSI input.
> > +          Video port for MIPI input.
> 
> Maybe MIPI DSI/DPI input is more correct, since there are a lot of
> other MIPI standards.
Hi Rob, OK, I'll change it in the next series.
Thanks,
Xin
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
> > +
> >
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
> >            Video port for panel or connector.
> >
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            # Properties described in
> > +            # Documentation/devicetree/bindings/media/video-interfaces.txt
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -81,6 +131,8 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > +                        bus-type = <5>;
> > +                        data-lanes = <0 1 2 3>;
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
