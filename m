Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2231E486
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1246E12C;
	Thu, 18 Feb 2021 03:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2116.outbound.protection.outlook.com [40.107.101.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026F6E12C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id015StVCTKxWxBM2zSoPilWJ0vm3JUjdPcqaj3zgA3ZuJjARqo6WoU3UkAqpIoFsss0vq+ad4gw4FZwZ/dscb056MG0+fLqiyDcVJHbl71c0ETk7UuSkUtvaZhApZ1T1TajsmzRs8fqMd0iQqE34dBtQOD/PQ5/s2VrAYLMRuoyXsxhAjbJZJj6EGi85eTfR8uH15foFaLywENsP17iUoUIhRJTm3JccrFinm+HRDD8OkGYmvyd3XCdtKR0y2zOwrnUtztAe84AIzNtdauELqeQo3zfb4TpLKnWmhET00lvEWmGovyKcNaTC3pdmEpc6D9FzFD4E3I9J+g9q03YKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRQP4SHLMiDmUVwU4TsI8/8I9HFUDs9VTI513DmJOi0=;
 b=abkAuuuAxiMH2MJHs2nnK8x7QNESGBcGhGv+tXKskHkqvL4+gZPWYufqW5TbPEmMUBnl+UzJ/yff3ZGXjhgzoq9VSyVFNMqFp7G2zWl1K0lTM3dcZf/CWcytSrs1uPRjFea5Ak3QoJ9L2cfm0lujJAgzDqtxxCv4QXaOJniQam+0KDdN0Wq/I4exk/+UPyBxSmbtgKie+eE7xs1HY/b4XlZP7emlm3qW/Pf3TiydaDpPQSB9Fg+W/jTf7z3UfbfyO96rcyHvZyi7Dy5m1jCzdRhX4Wglfze8qhcQRSqJCQH/akw8l4n6Yw59MOOJJxN0iazamjoLFi6QWON7sX0AuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRQP4SHLMiDmUVwU4TsI8/8I9HFUDs9VTI513DmJOi0=;
 b=csGUYcuqEiVGiUpNrYvSSWPms/XcnnKFurPWcz9QvLjZWmtFrIEvlLtcL02q3Akp1bA51SJ2aH792TJuFdJ8tGwAOUd43Iffv3es5HiWTMLQM8whvp91y07oLUTtZNLG+3PGFb/hjoNaFBwKD9yu5Grdqdowry6lhlnQfreF07k=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3864.namprd04.prod.outlook.com (2603:10b6:a02:b1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 03:29:49 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3846.038; Thu, 18 Feb 2021
 03:29:49 +0000
Date: Thu, 18 Feb 2021 11:29:41 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210218032941.GA2891@zhaomy-pc>
References: <cover.1611802321.git.xji@analogixsemi.com>
 <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
 <20210209193010.GA4675@robh.at.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210209193010.GA4675@robh.at.kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0161.apcprd02.prod.outlook.com
 (2603:1096:201:1f::21) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR02CA0161.apcprd02.prod.outlook.com (2603:1096:201:1f::21) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:29:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c9dda9-e54b-4681-03bc-08d8d3bd71ee
X-MS-TrafficTypeDiagnostic: BYAPR04MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3864108DC41E5F9692769136C7859@BYAPR04MB3864.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4s7eSY675ma/5f3xIOfq8oUfemkSu3oTEt9mTIXxA7Wxz8ZuiFJgSxSIfF2gPWQn1Ac2nDlglLqhLi3lb9ieJyqLMK2WO/35vJIYTx4wzX7XP2vVKYrDJleGjZafKmsn2pDPw1+TW3Ll7vsnuzWGCcyUZo2JmRODsJHQ3iwJNj5MvV83hwTh8xcqV07XcgehwJ2nCRts5HEg8U84E6jWYN2F/TVIaSFgZ0zLLeHPVmcoEXb+UcITWY0SbCzV+kBdyv8fzm4vg5Q1k/oWmLjk5pOqkExHnmNgeFMJoILBpRRdSZoH01cykFjUF1vzdDUT3tlAcCUu60vAL6ckIDbqJIrFS6MRYvZsJu3aCye6ZLy1nW80tbUx78jO+KKq+tmLp+FKXI29lpgQQ4LfP6Ooz/G+P3DFuwZFABVLnDcp1zvUtnpIhhvW1YYgNFW/I5X1Ei64arb3bqT4YsHnJ7BwYu52xdrJLcVnxeB91pepjC6KC/1vBKs4y82Jm2j/0EJiheMAuY+wS/ZUndKNJD8nWKH6oGyqVp6W/ZHsjSWLr656IsnOXaMxAlYR1CQlush1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(39840400004)(396003)(366004)(376002)(55016002)(4326008)(9686003)(33656002)(86362001)(52116002)(478600001)(8936002)(316002)(2906002)(6916009)(1076003)(54906003)(5660300002)(16526019)(186003)(8676002)(956004)(66476007)(33716001)(7416002)(83380400001)(66946007)(66556008)(6496006)(26005)(6666004)(16060500005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Be/v4le0NuIrBlkWuzZcfgcorTQQVCl/auI6eMODiNfv7wc2cM3bL85Iu6Fl?=
 =?us-ascii?Q?gaDAoc/g6/ISHLTvrOT1MWduG6He/3CZJaigLATTM3FLA1wO46YPVlFj78gj?=
 =?us-ascii?Q?7CCieR+4XOdfHd2NwgM8edcymm+U5J12bYAkMD37kYfm0fLCkOIc4komSB1T?=
 =?us-ascii?Q?8fAMOtHNvoX8reZrfmiDMIThxRu0GsxeWInj2TEUcO/8NahCdzY+Rwjhwgyp?=
 =?us-ascii?Q?FnX9SmLz+bYtJZLO1c6j8oC92z5ZT3iRBC9A2BblWH67TctQS8olucX87zqE?=
 =?us-ascii?Q?hi/Z6vxaVI7YT90n6AtmlvxIEnGb7fIJAuzFhFnlMwlqHrGCxAZoij9uwtRB?=
 =?us-ascii?Q?kU3EClI74lM4lIOsdhXfnz7Jq8tULkhvqHoiShWZiUM25DKk44JGRFBCe0KK?=
 =?us-ascii?Q?Ex/8f8WXH+lZJBANLgAS6gvizLfR0+ZdTpKRimmhwW10K9gP2egR5btoiGWJ?=
 =?us-ascii?Q?lplh72SSZUi/59UehNgMBfWZc2g1r7JdYryGSaWnf4qXVoS1Rxe7pNzhqtpr?=
 =?us-ascii?Q?V6QTg3oWcn99D3CwXk4WonKpYxj2xSN42Lr+XGEnlIgbnWF2knlGWu0rNRhc?=
 =?us-ascii?Q?+vARuEPmilRgmGopRtu+TobRWp6QPqLyttZ0fMAniAMUVOlA/41ihANzWldy?=
 =?us-ascii?Q?aOEjc7VlYjtsgDySrzplV6o2BeVKDGkE8ErkvuArR8Va9n3teU4ZyX2devJV?=
 =?us-ascii?Q?ZcDyXXzTVLaxIwfeEsM2QYUOAJYIKcJQpNIbUynm2J+SpLSuFgN1iVR6mU8+?=
 =?us-ascii?Q?hcz6X/65nPt2QUyS5FjG5besq5WVU0wIxdOh6/1UbWRFssxhceMFZ3uEL+Wb?=
 =?us-ascii?Q?ZhjGXvEX3CbAZ55e5ug5mNHxZJuXDHIRhnfMvGkMoovf45GwbrvCKo2Hs2yJ?=
 =?us-ascii?Q?9O8kLNZMUGVOOBbweH/iFFtPCqRumm3Cds9WdURFF2+G3SRMhlsgbLCw3iZX?=
 =?us-ascii?Q?FIb/TQRKmFTxfB0ul1l9ISqSUO1cl9dRH6lf5BnIqqBoAOJcdz1/ttpbXh6R?=
 =?us-ascii?Q?lCVNxnFh50np72u3S1pnaWdSWLl6471l7MegW00sMNM/7o7bNKK2TBhbA7NT?=
 =?us-ascii?Q?7x4xdP+J/sg6o+4gWUbAeNEqFlJQks3eDw41ZztidqZCmrHNiwiQzAp4/CER?=
 =?us-ascii?Q?zXwhdS+UcJgXghKxBbuwoDWQlemXcBEC50VkmtYFZ0QppkVW+eITfBjTRSCg?=
 =?us-ascii?Q?r0K4U9BY1ySeqs/I6utmRJxA+95hQHXBuZTNwzqrXaJgFCivZIP+w/DRAYmN?=
 =?us-ascii?Q?bQNC63ytadxFEA520oQmJGBU7tC/Utw+vxUkC9Ndn1ZJAGIHFWFFW+jyIKGD?=
 =?us-ascii?Q?lTD82QXba7I+pywhPvBSIYmC?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c9dda9-e54b-4681-03bc-08d8d3bd71ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:29:48.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0PdouXBlWKCNHxv4TkTzuMo32Njwy59+hSq8KElNmnVSU++7iSRw3FOjgSjXTi8ZFoLg4DB7qsa1q3Stx070A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3864
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
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob Herring, thanks for the comments.

On Tue, Feb 09, 2021 at 01:30:10PM -0600, Rob Herring wrote:
> On Thu, Jan 28, 2021 at 11:08:26AM +0800, Xin Ji wrote:
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
> 
> Please show the new properties in the example.
OK, I'll add it in the example.
> 
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
> > +
> > +        properties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            # Properties described in
> > +            # Documentation/devicetree/bindings/media/video-interfaces.txt
> 
> Now video-interfaces.yaml which should have a $ref here. It's currently 
> in media tree and linux-next. Follow the examples there. You'll also 
> have to wait for 5.12-rc1 to apply to drm-misc.
OK.
> 
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
