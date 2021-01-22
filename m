Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79930143A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290DC6E162;
	Sat, 23 Jan 2021 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2093.outbound.protection.outlook.com [40.107.243.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2328D6E848
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 11:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCm5LCLEmP9bL9bNkP+pApndqNfyHpioR5AKZdtY9yvzmEaFJ2z6T6CZiiPoT7lJj3mvnIKtvtQxkj8QPf3KYpV4IouZG2kZZRK9HNy1UImzOmL8zC2eVGNNumomRUscihQhwgLnyGPGnGTl2Ndu+ceYVO40BD1OKhzxh3Pia1XWYhqRbt/Ov1uT4Rng7cgK4Ebnx4ycvZBzLsdX0K56zaUflmho7kn6cWksaeC5flm43BwnsQ0Qplt8XqHDt5bG1Y6HSoR3dsnsiF5plePMTBO6zKtP6FrQsp4dwEDi+66Jve2/oO2nMNa/O5FaqKrz8pC09Qmkth/gcSumiVuqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeK6v1Ei5D6Kfkxd6amb+KH4MC+zUNGL2u57PJnnPMA=;
 b=lT27J6UMzrBF21dEMyRhOCfWXWgMA+6MdJJaNRsfrhTtFGKwN151RzRCCuTW5tgR4qAb4YTJdDalNT+TEDeQyXg3J7AIx6lVQvpfZv8FX60AeyEn0RF1lzeySL7f/T1HWiNcfdnHNNO1m4mS94btX9458qeDFEl6/4GP2GAffFsmTNuy6s4mR4knBkvYKZgrhESNjpE9ppoHIOT75LlZt9Lj0R9YtiY7JWunZnn9seQ4lbRh/pVvrY+fWXJZJ/8dRVuC5u7mTJPt8FPbGwnx3kY7uvtxJXPhIqJn1wiFLNT/jZxXjXNS7yOuiRmZdcoP+K665/frQi3IZp/FXcQ0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeK6v1Ei5D6Kfkxd6amb+KH4MC+zUNGL2u57PJnnPMA=;
 b=jsTtGNmqFnqrdfKeoU8DNpFpk2B+s689SVRdg7lNBV08pEN6K61dWMUugDuZTGfGrRWXXUw+xilK4k3VBomYr+RvyeAjIbUA+51tjwHYl6NNED5G1xfzkE2ufvV8XamZTYkf4NiWnyqaWp9X44iczZ3q82E8YvAyq8F+CNHYhDg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5270.namprd04.prod.outlook.com (2603:10b6:a03:c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 11:47:28 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.015; Fri, 22 Jan 2021
 11:47:28 +0000
Date: Fri, 22 Jan 2021 19:47:20 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20210122114720.GA29064@pc-user>
References: <cover.1609380663.git.xji@analogixsemi.com>
 <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
 <20210111221435.GA3138373@robh.at.kernel.org>
 <20210112085737.GC5827@pc-user>
 <CANMq1KDRL3xmjvjMUWCr+maLJ2YY4hQr05dMC7sE4+baWOUesw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CANMq1KDRL3xmjvjMUWCr+maLJ2YY4hQr05dMC7sE4+baWOUesw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK0PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK0PR01CA0049.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::13) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 11:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02aefbec-6348-4a59-d358-08d8becb7e5b
X-MS-TrafficTypeDiagnostic: BYAPR04MB5270:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB52700C5D704A454694FAA045C7A09@BYAPR04MB5270.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0X3QWlex3Q55C7zvEccDUGiA2jKUvoO2c7VVrBiSLoPCtLTxUlq+nLoG3c0CFACpGdDseASY8zrnACWChuUoIe4gqFFAHeTk5BiEqHtmnu1Q3f471KXju0EhSkXZ3WiOyPMC2AvHMaeIYoAyFaV1r/Ml7dNsilA9YAARsvBgKHwuk5lTSQARj89c8yN02fZUowUfkVPKDvSTNmO39bzL16HWSIK28oUWxW25M3DPF2Xq+V1YvIPwKz2tzxhKS/xiMuT3zdVnw0HHLrmDxh0KRPwIfOLa+5meZhwiBwZbENVV1xEg7NTpSkc1cC9AswXFJUqsqJ3SMlPO8JtF/VARYQ3W5ZxTogk75pCXSZ8dlHOjcnn8AJIwoP7Goe91qq+5mfCv/vYpM3F/lSHLUPyJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39840400004)(136003)(366004)(376002)(396003)(316002)(6496006)(83380400001)(54906003)(186003)(66946007)(2906002)(52116002)(6916009)(66476007)(7416002)(66556008)(956004)(33716001)(33656002)(478600001)(6666004)(86362001)(8676002)(4326008)(53546011)(9686003)(8936002)(5660300002)(1076003)(26005)(16526019)(55016002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fl9z3LIu9D2T4IU7jqhIsTGjMnpII9nfjhrrQvnwcGnU30Kg/yll69W8eh0L?=
 =?us-ascii?Q?jh3904/OxroIh9zjmbsLMeSxftzXR89oVY8qmMTHEEr8VkxsHG9YO4qualr3?=
 =?us-ascii?Q?wTPJXipZllHHn2LKwiVL5xjYZoqX1KakU1FRmQc7HYdC1KdvO0cNw7dLj9WH?=
 =?us-ascii?Q?G+mFHDEd0Q/CMLStjoWswmsaZaKIDr9DUgHJI+miqFIZoMWIL0QD42xbFF61?=
 =?us-ascii?Q?AODHMvibxez//YR4bHed7MIWXH5WxShGPBx2OcHQZCbNUoitoFQOEfPNahUw?=
 =?us-ascii?Q?gkhfpQyAxCsmSUlmHLdvfFmLDyvKesMHnpdZLsVukHu1JBPPwuk5TeyrdYiw?=
 =?us-ascii?Q?7QChlgBgtncGRagCC2140y0fNJey+woSQ4SF2X0AoieNtNghNHfE3aCAT7Gx?=
 =?us-ascii?Q?Y5RTirFn+tZGgResejw/p5GOpOwE+yqlWfkMipDLsnOls6Nm+mllS1fbO1MO?=
 =?us-ascii?Q?hjXXx7qMuwkQMDmQjk9U/qPCQw/z/X73yYUtVeQtvCK2vZ6I1XlVTUUNh2iy?=
 =?us-ascii?Q?EJsg76L3iRDznsVZskp0x+e2bb3jIGXtru2wftTAz+MPRK1tCpOLA4oklUGI?=
 =?us-ascii?Q?aVJ1D/z16D6ros5G0iLv12rqvjEal9+8zbOb8K3MPATxWzOMPrnJToYSu/oa?=
 =?us-ascii?Q?ukEVnBxCDl+vtGnQtWGdEvjaXU2mFE+kZU0tuHVztU4KQwoc0ydDfdPUUSj8?=
 =?us-ascii?Q?l2ZOd74j6/6Ohrj59fqQvCZ+Vjh3DgJqiD7MdtQ8IpONahqFMFp43kv49KzY?=
 =?us-ascii?Q?TpaH7bE9e2pCr0MVNt7bKEHeZ8VkL4B07w4kzmlSd60gLI8dploSngAS91b+?=
 =?us-ascii?Q?9j/03P0OeoRRn7wCMq73tF7zOA0VNI+glo6TdHsIoEXIdcvbjT2PRNgvJ1dx?=
 =?us-ascii?Q?jvRQR0O+Gl16T4UmZSLEz79f3dRdxA0rT0pguS23TuFbdk0goJhwtUEUtGUl?=
 =?us-ascii?Q?S3YhAM8JDZXrhtBGH+vVL+i+zEMx4TBHdMrIjGYk3sA3CoyI6Ncr3Wv/o3/I?=
 =?us-ascii?Q?f2NzKHYYbjQM/mVxDQCbEMKYCb317fPC9TnK/9BdMNXSGr++x4hKt4i3fgEY?=
 =?us-ascii?Q?zhMoikCT?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02aefbec-6348-4a59-d358-08d8becb7e5b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:47:28.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/UYkBktU2lmqa3XdKRKd4C6UGM6iRlf27Bhysy8DWKog+slfqRbKouFn/IjCnxJ50g0UNmh8RzGy4ed5g2+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5270
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 04:57:56PM +0800, Nicolas Boichat wrote:
> On Tue, Jan 12, 2021 at 4:59 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Hi Rob Herring, thanks for the comments.
> >
> > On Mon, Jan 11, 2021 at 04:14:35PM -0600, Rob Herring wrote:
> > > On Thu, Dec 31, 2020 at 10:21:12AM +0800, Xin Ji wrote:
> > > > Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> > > > swing setting for adjusting DP tx PHY swing
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  .../bindings/display/bridge/analogix,anx7625.yaml  | 25 ++++++++++++++++++++--
> > > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index 60585a4..4eb0ea3 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -34,6 +34,16 @@ properties:
> > > >      description: used for reset chip control, RESET_N pin B7.
> > > >      maxItems: 1
> > > >
> > > > +  analogix,swing-setting:
> > > > +    type: uint8-array
> > >
> > > Humm, this should have be rejected by the meta-schema.
> > We needs define an array to adjust DP tx PHY swing, the developer hopes these
> > settings are changeable, so I moved the register data to DT. Can you
> > give me some suggestion if it is rejected by the meta-schema?
> > >
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > >
> > > This is how types are defined other than boolean or nodes (object).
> > >
> > > > +    description: an array of swing register setting for DP tx PHY
> > > > +
> > > > +  analogix,mipi-dpi-in:
> > > > +    type: int
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: indicate the MIPI rx signal type is DPI or DSI
> > >
> > > Why does this need to be in DT, you should be able to determine this
> > > based on what you are connected to.
> > As the anx7625 can receive MIPI DSI and DPI data (depends on hardware
> > implement, we have a project which have two anx7625, one is DSI input,
> > the other is DPI input), we needs to let driver know what kind of MIPI
> > rx signal input. And there is no other way to tell driver the MIPI rx
> > signal type, we needs define this flag.
> > >
> > > > +
> > > >    ports:
> > > >      type: object
> > > >
> > > > @@ -49,8 +59,8 @@ properties:
> > > >            Video port for panel or connector.
> > > >
> > > >      required:
> > > > -        - port@0
> > > > -        - port@1
> > > > +      - port@0
> > > > +      - port@1
> > > >
> > > >  required:
> > > >    - compatible
> > > > @@ -72,6 +82,17 @@ examples:
> > > >              reg = <0x58>;
> > > >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > > >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > > > +            analogix,swing-setting = <0x00 0x14>, <0x01 0x54>,
> > > > +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> > > > +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> > > > +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> > > > +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> > > > +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> > > > +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> > > > +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> > > > +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> > > > +                <0x26 0x40>, <0x27 0x60>;
> > >
> > > This is a matrix, which is different from an array type.
> > OK, I'll change to array if this vendor define has been accepted.
> 
> I also wonder if we want to split the parameters per lane, and simply
> have a flat array (instead of reg/value pairs like you have now).
> 
> Registers 0x00 to 0x13 have to do with Lane 0 (and 0x14 to 0x27 with
> Lane 1): you can almost tell from the example values, they repeat. I'm
> not sure if there's any value splitting those further (I don't think
> anybody will be able to tune those without ANX's help).
> 
> So, maybe something like:
> anx,swing-setting = <<[reg values for lane 0]>, <[reg values for lane 1]>>
> where <[reg values for lane 0]> would be something like <0x14, 0x54,
> 0x64, ...> (that is, all the values between 0x00 and 0x13).
Hi Nicolas, it is a good way, 0x00 to 0x13 for lane0, 0x14 to 0x27 for lane1.
I'll split the parameters per lane.

Thanks,
Xin
> 
> > >
> > > > +            analogix,mipi-dpi-in = <0>;
> > > >
> > > >              ports {
> > > >                  #address-cells = <1>;
> > > > --
> > > > 2.7.4
> > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
