Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428392E6F81
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64C8933C;
	Tue, 29 Dec 2020 09:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2136.outbound.protection.outlook.com [40.107.243.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92689292
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 06:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elemIVo0tn0MUvQnLfL+xk5gd8fQz7FgZyjYGGgMFfXQTcFDVq6L2R6IbCqqntVRLZN5kgiywkgaX1fmdffsLhAlrcz/HppBk63iT2jPlKFY37clPVAdwCq1uhu0HM25dPYO6uoG5fdV06D2vk9wxmkjk2hb2o6H7YX0N9PZ4gKkBC4GWce9piD9CluZ5atmHdEhGq/+IwGs8L4N3ycMQCEp9ofOV7NFWiBF+rYQ8cN9GUZd+Svn5IRwOcxXOjhbyFCfIAl23379JCt/2TTlRgyV/T0Ssj9EhIof3J8BjhvQtgTHLz7NTSF2JVIlLPr5U+r4CE3fQ7IDR1zMwtX1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cmWmalDNRoLyrAdpt9mHBwXLGeK5ro02H1XItwELTE=;
 b=c096BQnwrySd6N4WPfpCqth2YAv2rU7nOQwJXFD0RPooEJO8LCf18W4eMWoBFXI2dtwZ/vm1twfmk/D3Us9o5JNUT6DV7x+is6BcOv4TKeMw301jwQnJO4g9goHuzvTP4Qi9stnCP5gzW97uWvOvTsyUGQVnOFjSzBHKylepCZlgdqrjY2RX2JL2tWruTQuPtOx8PPtJjtcOyxShD0Wz/JPuE6Fos7Cnvnhjy9J1MLYpicwT/xEzSnULSlxWQZ946KNgtz+lLBPTzFefF4RAoJZxZxxbVpdmZyVuvncRJykQoIRZFV8BcnI4VcwTJQLnOWVM7QEZzcMhyk+7gh/ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cmWmalDNRoLyrAdpt9mHBwXLGeK5ro02H1XItwELTE=;
 b=CsnXWJahYTa7qw73bKoE6uCk6F0hy2htnPvtCZP56MoHvJ1GNu4ptepYxltr1v4iCKUAVy7MeNY2Rrb7P4W1/Ldf3sDENdV+HuIK8IRuDuU6e3QuS/cJUVoJ/HzAcpIm/EKc37WN8eeNmEsYCwvxsUUA9JyskanFx7avTE70tBs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3816.namprd04.prod.outlook.com (2603:10b6:a02:ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Tue, 29 Dec
 2020 06:50:58 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::441c:9020:2a79:3eff]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::441c:9020:2a79:3eff%6]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 06:50:57 +0000
Date: Tue, 29 Dec 2020 14:50:48 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20201229065048.GB7073@pc-user>
References: <cover.1608883950.git.xji@analogixsemi.com>
 <c29b7d9fda9ce8619d1c718b077250998a8600b8.1608883950.git.xji@analogixsemi.com>
 <X+n1COtS8nrCFUHd@pendragon.ideasonboard.com>
Content-Disposition: inline
In-Reply-To: <X+n1COtS8nrCFUHd@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 06:50:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 294b9308-0618-4fd3-cbd2-08d8abc618ab
X-MS-TrafficTypeDiagnostic: BYAPR04MB3816:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB38162B481B13665F8EAAA3C2C7D80@BYAPR04MB3816.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LY5VcEN0Kg36GNmxhfmN9SS8Tfv1Fv4Q8YpXsPUq/lCNjIlp6YeB7WtCUqoVbj0xh7ok3ZNd+dIhF+C8RQXim7854YdPSlTHt7P/2f/diuYpIzDzIegFUGAa9tVu8J+/+8ulE/1DltOB0lmjS0LlfVHfPQdjA3dk9oWdsyJRc2vgkbVWanEUEDd4ZIoY5vMJMP4NGDMXTKXDyRA4EBqqKQoIRIBu5K5uZ2eisrLhV3C+SR6V4ehoXcCeHD+vtMczoWLdoePKO8+C19eP35jki6nuqjzW0AmZ/qLHT6G5xHnt7Ehsv2hOpE/8+VL4TpCxSk63SMN7SBS1R27FtReHZcpBk4DEioHXTdWHNvEwKyYoW5GvevP3QyosiNCKt7YFk4UfUFtHHePOYA8vI+J6IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39840400004)(346002)(366004)(66946007)(5660300002)(54906003)(6666004)(16526019)(66476007)(26005)(186003)(33716001)(956004)(8936002)(316002)(83380400001)(33656002)(478600001)(2906002)(86362001)(8676002)(66556008)(52116002)(9686003)(55016002)(6916009)(6496006)(4326008)(7416002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3lFgIuZ6ADzsQAFpBPB5KM6HkeuJR7eAVTF3pyhjrJ0JIBlC9+Gaa24j6nZ8?=
 =?us-ascii?Q?YB4ihXLHKROO1RXuKpvYkDLZbrblMe8/IdvPBjbh/EKsdrf/zlaOnGWQD0XT?=
 =?us-ascii?Q?EhB3YrQ1JVUwtvWI7B3JOZlo1BUraEuP+2Ana0y5fYbLCw/t17Zq6fdiKZRv?=
 =?us-ascii?Q?5691XoW6y/cXb0IaD3Z4klXPy8jTROp+9JI9bvmZUEvD5b+WUeKFNE41tcsj?=
 =?us-ascii?Q?Ktm4Atj9KLMTKUmlW5bHqQLH+Kx52nPCDHX8mFAFXfKw8meJoVllBmxOhCYU?=
 =?us-ascii?Q?FuNOlXzoE7qMOVDifR36ZFslYm5atd3FNgTZmi+H0tfT3XbxwSX5veg1qMdV?=
 =?us-ascii?Q?sCgG/jZyiqDcKwZ7B+Q+LsPAs5Q/5FRDwG/P6vCDBOmQ6qYJuS53BZNEObF2?=
 =?us-ascii?Q?25pSkoVKOQxgohHT8NUtpz+CtHnIv9W9cdwLOs1xskwlrnDpu8Vb4sesZ1Yp?=
 =?us-ascii?Q?Ao4trgzhoM4MAbYNo/vYHjsLn7rfcp8GUH6z3I/zzgKUC/ddd1l1S0lUzfpw?=
 =?us-ascii?Q?yovCzBHvKWYRr4NnM3/doM92/XX/sAAnF9jSSJbs2FP18gj5meuRrsCv5Xs3?=
 =?us-ascii?Q?uGP8uGhrhdT4IRZrlL9sl+ipLReFSrkrCQYrraGpFF/AEatFcuwPNjCJ464L?=
 =?us-ascii?Q?EIRG+D9ziyNAAi4QhnrO3kYxDxbrK/7ppKmxH3so3yFTQ06CpBWTswjjP5pm?=
 =?us-ascii?Q?7YYq98qU2B6av8mRGE63y8zLS9DQOGFyA4BM9aCr4Hclay5igSY7K4hEjzSI?=
 =?us-ascii?Q?pN9DDNVXP8tAORGaowSK//+bKxkcFNyfYFDJrG1qmLOGnw+DmqXBih3R1jhA?=
 =?us-ascii?Q?F23Dh95hiQw0ZJk2lVlRLfn9PdIChjgiZyL8Ubl4G57fGqB7ReVDj7nqvD11?=
 =?us-ascii?Q?B8fN4Z2U34TXnHaK0IRZfc6NVsKx4nH4sx6B3a7xve0GOG2vUkLKqTxmwZfq?=
 =?us-ascii?Q?G4ir19nH+arjA6/7pvZRDU6bmTso55tm5nWm4OtsNAyUyf7XkdNwjXgfGYNl?=
 =?us-ascii?Q?lEWs?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 06:50:57.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: 294b9308-0618-4fd3-cbd2-08d8abc618ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLf/dvXnfwuMuo/iSpty/BU1GPNFM8tNFodvwvVd9CVkIKSAtFXa3ubbVuVpXZxfKtFvyIgQOeefq89bfvtxpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3816
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 05:08:56PM +0200, Laurent Pinchart wrote:
> Hi Xin Ji,
> 
> Thank you for the patch.
> 
> On Fri, Dec 25, 2020 at 07:01:09PM +0800, Xin Ji wrote:
> > Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> > swing setting for adjusting DP tx PHY swing
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml     | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 60585a4..34a7faf 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -34,6 +34,14 @@ properties:
> >      description: used for reset chip control, RESET_N pin B7.
> >      maxItems: 1
> >  
> > +  anx,swing-setting:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: an array of swing register setting for DP tx PHY
> 
> Register values in DT are frowned upon.
Hi Laurent Pinchart, as the different vendor has the different PCB layout,
it effects DP CTS test result, so they may need config DP tx Swing register
to adjust signal swing(the default swing setting is not satisfy for
every platform). If we move the config code to driver file, it must define
swing register setting for each vendor, so the DT is the best way. Do you
have any idea for it if you don't agree to add in DT.
> 
> > +  anx,mipi-dpi-in:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: indicate the MIPI rx signal type is DPI or DSI
> 
> This sounds similar to the bus-type property defined in
> Documentation/devicetree/bindings/media/video-interfaces.txt (which is
> getting converted to YAML, Rob has posted a patch series, I expect it to
> land in v5.13). I think it would make sense to extend bus-type to
> support DSI, and use that property.
Sorry, I didn't found any define for DPI or DSI flag in Rob's patches.
Do you mean I just remove this flag define and call a special function
to read the port's type(DSI or DPI)?
> 
> > +
> >    ports:
> >      type: object
> >  
> > @@ -72,6 +80,17 @@ examples:
> >              reg = <0x58>;
> >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > +            anx,swing-setting = <0x00 0x14>, <0x01 0x54>,
> > +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> > +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> > +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> > +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> > +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> > +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> > +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> > +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> > +                <0x26 0x40>, <0x27 0x60>;
> > +            anx,mipi-dpi-in = <0>;
> >  
> >              ports {
> >                  #address-cells = <1>;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
