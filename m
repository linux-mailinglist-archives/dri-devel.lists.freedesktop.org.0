Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F42F4631
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A776E0FE;
	Wed, 13 Jan 2021 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2091.outbound.protection.outlook.com [40.107.243.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DA36E159
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEk20uS7ho1XfRGvatXq1kwoxlPHIPTwcB5Ku+WmH9YsUv92n1+8v0PY3qYsWTh2xa4wk6ZvMkFoj8ib0C3Dmv7ZZqGcfj287W3wz68ok1GOttxIWpmx4iEASMJjR613p73Wle+mjKORnn7zVaAbtkaVtnqpXA6KNPufm9NY+qaMQoN7+H6M1BITmM/jUtEj2tNzeyYFCjObc9g9SznpAGWow5JGeUQbJkkYYU31FLW4ug3dJKpcWCSpumJhHQ9m4GaLL2EUc4ZpjrLIXNS1D7zaGlUsgBt1QD5pBvVnK7iY5fy7A+za5t98qZ8q//xj7/swhIEowf7DGiCBDvxhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o2xK03t4sqDgpWZYk3HgHRyqmFDJ+1zILwkNrjEyKE=;
 b=HgUscuojrxv+kAKHUh4hhgD0gvJJDpOsURLLttHhwty2ktpP4Ed8LYB3qKA/i0iOZRJuktyQJiU/QFwQ6eAfmRkYAGdI5a6e+SN8aWsjPQeJiuWFA9Xc1oYMj/L4/v2uZwTnUYg4vbknhopzWWpIaqk/78W/lziSbzCanRNrJQ+dm1bo9JEWWf+NXHMlENdQm5pGvudL7yu9vkvMZqfaxTttSjmSRrshGm1+Q6tNvkKoxQPPeFdqQNkZTleMJDJTBaLg05J/q56mUAekjsXB8a+dM9STJ1jXO7SSRRFdv+n1IComXwBXajBVegsFD2KGDgni1jBiXkDZlGJ4WnabPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o2xK03t4sqDgpWZYk3HgHRyqmFDJ+1zILwkNrjEyKE=;
 b=vq7umOqJPzMN+PVp6h+iadp2oC2jN1xS/+JgFqk/XNAkmdEW21ggovAH4VHtRyjvykKzXxNkUpK+isY1NTYRkUsf2+gP3M+KkYUdbMowLvY8Tu61aS/+YxFQb4zr0AgtuISmejQU04jhRQJyUIGqvhQchtW/926sDUf+WJbKxt8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4744.namprd04.prod.outlook.com (2603:10b6:a03:16::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 08:57:43 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e%8]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 08:57:42 +0000
Date: Tue, 12 Jan 2021 16:57:37 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20210112085737.GC5827@pc-user>
References: <cover.1609380663.git.xji@analogixsemi.com>
 <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
 <20210111221435.GA3138373@robh.at.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210111221435.GA3138373@robh.at.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK0PR01CA0066.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::30) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 08:57:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d8db33-a72c-429d-86d0-08d8b6d81f56
X-MS-TrafficTypeDiagnostic: BYAPR04MB4744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4744B7061B3251BC8B727862C7AA0@BYAPR04MB4744.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhaAjRz82v+nsHZvtIlxYk8e2APMl3S4uHxxNRonMYAGrtIXlS9N8TkUGuxeMkmGKRrS6Lz7t5trL6qQ1rCPNedZjxpk0gpnzQFNhYyqFoASXRCTMBt5GcHx+2Y8zaN9JHCU46/rhvkVita6UWjWvBoAWSHg0YNDjTks2Y5aFdNv2O65ERQYqo/YFE78nN3EzNrQOn9RUpZvumzAAD+hqaTZjknM2k+0CwzTtB3vNCmKON9AaE6NQGcvfnCrji/c+nFQTiO7BoKNJE/hUr0Vx/Ci1KY8S74Re6Rr5A98mq3bVvFvgXr1loGUrRSt813HoExSCsy+xkKDlaqbmDm3BwBtJZbMPrGXfjVpM9l3v2SUNIp0rjEYLXU32RNgcvmGCHzL4Vmofc9B28KZ7iGr0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(346002)(396003)(136003)(66476007)(9686003)(66556008)(6666004)(478600001)(55016002)(16526019)(54906003)(186003)(8936002)(4326008)(83380400001)(86362001)(6496006)(52116002)(33716001)(1076003)(316002)(6916009)(8676002)(26005)(7416002)(5660300002)(2906002)(956004)(66946007)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Y+igmaKLGLR3OOUMF7vy+nDkpznNS7ItLGZEGrp+Ta2904bmA7OP2udvC28?=
 =?us-ascii?Q?fPR5eStiICGBnVQPyTNwnx3u21p3/KpYoXT4O4pAqQ0wtOhPNckTUvN7/q8x?=
 =?us-ascii?Q?MjLZwkuGSL+1782NTqiaMXMxdkgRzD1opZ5LVwUN3NFxfXiEvWJ5lMxpzl2y?=
 =?us-ascii?Q?s2iNsB94SzD0LZ5Z6ELm8414C9mMJtJbwfPyxQoOxXAVbovEriAbR9bNVnjg?=
 =?us-ascii?Q?WfyA0vP1n/3jzGPeYnHkWKYT2aylLRELen+i4y/4nBivJ5NAH1CIYDQ59SK/?=
 =?us-ascii?Q?EHi954u+dRGVeNlxkGKxUKCNOAROVtyVe/BUNiVOlseTZXdY/ObTNC7lU80X?=
 =?us-ascii?Q?/Lbar7ed7oIq3EvbFRYSRK1WtBsIw+9dx/KC+osHLBZ7yFa4gVckk5uDgqqi?=
 =?us-ascii?Q?P9UPdiTYS+eLcJKTYQqIkfxjYaNlGL65iWT7Iqro7W3GfX0Kio6SxhiQulDh?=
 =?us-ascii?Q?CZb/X21qeNaB+cix1l3hLVLLPW8LhglfNkVmGu00rXiyfwo5FlO/B8fMUEPi?=
 =?us-ascii?Q?N+9Ca2Cl5uIvfl7fWaUk8iwPwjhtlMMIA9Ljt5V6HSSOmxdGfaQZR7HleSxE?=
 =?us-ascii?Q?1MT3Lyq/RDNl9kB4dsbMQY2mKgJiNvqkLfWt144dIybWH+8228II1pWlSliq?=
 =?us-ascii?Q?rdz0fu0ydz8TWpuczA28/ilskjd4ahgSl1BonQkccpaMhzkjDDIFxFPWUol9?=
 =?us-ascii?Q?C9Nmid1NeFRAOJIhaKwaMmQpyH+V9czUYqQgJ54M/mvL6yXAF5vw/ZMV085C?=
 =?us-ascii?Q?4coG0rdkxvNzrtUHc9PEspMhD7K/fy8ronrtbEe4uXKHoJTQpcGsk4lFm2Lu?=
 =?us-ascii?Q?IuaGJyiuErLmDTKD08hfjZnmDByD7yXqW9EbBkWeDiNWBuKXBUJt6wnCxO4w?=
 =?us-ascii?Q?D2r2lXByuNI+TwJjrKMylpvWRm64wJhX7sHrZj+n0Woa2kt6rRggGcZMMZOv?=
 =?us-ascii?Q?EhDz/DuZInNnApbP25XKXQsnhDv775ySsVR7+UaBijXDaa26U56xSS/KWkp1?=
 =?us-ascii?Q?XzdK?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 08:57:42.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d8db33-a72c-429d-86d0-08d8b6d81f56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C++vXsUIa5eXaE2UKV2JiYQONLENSCDbhaVgtVY7OuZd7KCwXqMtmM5v2J0krwXVcKJ0/5jqWq5Dje7ndILw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4744
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

Hi Rob Herring, thanks for the comments.

On Mon, Jan 11, 2021 at 04:14:35PM -0600, Rob Herring wrote:
> On Thu, Dec 31, 2020 at 10:21:12AM +0800, Xin Ji wrote:
> > Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> > swing setting for adjusting DP tx PHY swing
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 25 ++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 60585a4..4eb0ea3 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -34,6 +34,16 @@ properties:
> >      description: used for reset chip control, RESET_N pin B7.
> >      maxItems: 1
> >  
> > +  analogix,swing-setting:
> > +    type: uint8-array
> 
> Humm, this should have be rejected by the meta-schema.
We needs define an array to adjust DP tx PHY swing, the developer hopes these
settings are changeable, so I moved the register data to DT. Can you
give me some suggestion if it is rejected by the meta-schema?
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> This is how types are defined other than boolean or nodes (object).
> 
> > +    description: an array of swing register setting for DP tx PHY
> > +
> > +  analogix,mipi-dpi-in:
> > +    type: int
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: indicate the MIPI rx signal type is DPI or DSI
> 
> Why does this need to be in DT, you should be able to determine this 
> based on what you are connected to.
As the anx7625 can receive MIPI DSI and DPI data (depends on hardware
implement, we have a project which have two anx7625, one is DSI input,
the other is DPI input), we needs to let driver know what kind of MIPI
rx signal input. And there is no other way to tell driver the MIPI rx
signal type, we needs define this flag.
> 
> > +
> >    ports:
> >      type: object
> >  
> > @@ -49,8 +59,8 @@ properties:
> >            Video port for panel or connector.
> >  
> >      required:
> > -        - port@0
> > -        - port@1
> > +      - port@0
> > +      - port@1
> >  
> >  required:
> >    - compatible
> > @@ -72,6 +82,17 @@ examples:
> >              reg = <0x58>;
> >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > +            analogix,swing-setting = <0x00 0x14>, <0x01 0x54>,
> > +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> > +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> > +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> > +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> > +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> > +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> > +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> > +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> > +                <0x26 0x40>, <0x27 0x60>;
> 
> This is a matrix, which is different from an array type.
OK, I'll change to array if this vendor define has been accepted.
> 
> > +            analogix,mipi-dpi-in = <0>;
> >  
> >              ports {
> >                  #address-cells = <1>;
> > -- 
> > 2.7.4
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
