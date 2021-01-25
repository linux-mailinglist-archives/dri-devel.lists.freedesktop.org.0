Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F23022F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFF989FD1;
	Mon, 25 Jan 2021 08:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680122.outbound.protection.outlook.com [40.107.68.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AE989C18
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 03:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCS65KE+QhM2pKYniFHJ+QYNCwXvfwtYo0sxBlj2yLiQ/kxV7RF8QraFjpme4aIZ6cSOnHSKG3ehqdkhH5BNndocWqE7p/EJ6ZJ5JOi8RiEQ3zmulMQ4Usz97lo756zsMIKbYn05p2DCtpQQvg0skw/JbkjlhtACTYQKDcMn48hYSKljYEQN+LZYVX9ybB1jFsHY1p5nzAdDjBlI7zIAwHtQ2ewCZbHj7/59HbQDfarbRYNeSgdFwpnWxJxwH9gXt8Gj7PsS7LgRlz+6KD1S8bXqAYLf3QohzA/9rhAw2N5G8ECmToXq0A7svAyiPQf2AceXqN5Hfqr+J05QLL6VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi/wzaBUE598SByZGw7LmXSSBOYLYdOUD/PyH6HPmZg=;
 b=RzwCwC919JkIibVMVlq+P9iH0fuEFb3DPq87y61mhI9rJ0hFrbFY1YNjXtsCQCceQ3ZGGauNcto0+8vFoZ/BemMY05UCPDXwqyPcBvm2WiWACqtqOpo55iaZhDJXtAThHC/+JH5xrub7P4nqNJLcmM7bVMLOLf3dUMeLdpZaFy0nZBSgHMSr4yYQWh/3X8e5lRfnj/tl6HvfATNIvq40XkYlMtO7ZWIAJEXamAsSTjGWzlPngCJbtQcB4fQJtWGQdtG0OrVGtXks67tN1uUlMkpNuRJcLbges1NdTGbeGH5wtmx2raN7xdHWYZVmubPKBlBP1FGbWnDIQuRZmuwqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi/wzaBUE598SByZGw7LmXSSBOYLYdOUD/PyH6HPmZg=;
 b=Uk1dptyncPcBOMr/CBjv/KJv4vz389f1J2thyR8wL0LB4a7V0Ux74JEYkvnpp19N7lbWFx9OtFdCFYSm6pO6my16pvC5/NhS6Xvh5wO5jaudIgb1ztNk72GSSVCjUwUYB9CFAhTnYj38edPqU/oC30WsKbxNzYXmdKYGqKPQkJY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4741.namprd04.prod.outlook.com (2603:10b6:a03:12::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 03:17:39 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.015; Mon, 25 Jan 2021
 03:17:39 +0000
Date: Mon, 25 Jan 2021 11:17:10 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag
 and swing setting
Message-ID: <20210125031709.GA12296@zhaomy-pc>
References: <cover.1609380663.git.xji@analogixsemi.com>
 <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
 <20210111221435.GA3138373@robh.at.kernel.org>
 <20210112085737.GC5827@pc-user>
 <CAL_JsqJ1B6JzpdgtP=ZNtWasjW5R0rYyUGV3RTDxT1LPa1rz5w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ1B6JzpdgtP=ZNtWasjW5R0rYyUGV3RTDxT1LPa1rz5w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR0401CA0023.apcprd04.prod.outlook.com
 (2603:1096:202:2::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR0401CA0023.apcprd04.prod.outlook.com (2603:1096:202:2::33) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 03:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0deb1d3-5f75-4caf-19c8-08d8c0dfc50c
X-MS-TrafficTypeDiagnostic: BYAPR04MB4741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB474167D271B9CAA3D6A2EFAFC7BD9@BYAPR04MB4741.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKX6PAcLQG9lAEEP0dmIsIbQJv1MDy+4wMGwSKjhOCWGwMq4r2UKvdoEXw6CG6jS7X7wOZbakmnvcn9IcsnCIBX6eFVYh4Tduv+U5Fcv/33V3Zta1jXbMy8uXrWj5vJXZPlmiJI/hFcAx9npweDKUDgwsDESI6kVelKy/nQP9lbMIPVc/xcaGVzBNqS9nl3h6X4eRmmH+0KXAffJZ16Q7Wylfna/oDpHskPim3LoIvk+1XYcrYjnlt8d2zNw802xVm2HpgPlnZ0vYeYJoaf6MG5GBDysrSHjhVbKmg6k3YgJ5bOdTjNfo1f4kUzh+DuEaFmIk+w/liAL2bT86VIHFqlRj/sIHJyA82ew/DegHj8z327budbVFUPREB6toWeAWZB1MlTfPi2SpSuAuHqxur97BiqRwvqv9iQKDEnFmZDUrU5NN8k8l6xIcd32f2/F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39840400004)(376002)(346002)(396003)(33656002)(6496006)(52116002)(956004)(83380400001)(316002)(2906002)(8676002)(54906003)(33716001)(4326008)(478600001)(86362001)(5660300002)(1076003)(55016002)(66476007)(66556008)(26005)(16526019)(6916009)(8936002)(66946007)(9686003)(186003)(53546011)(7416002)(6666004)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vJwwbLgR37v6gbGQ9RMiIim0pYBc8OIpeXiBOV2D0Gr6UAYR/ZBJtfLLUCDv?=
 =?us-ascii?Q?V/oxCQpaXH/czn2AzP0B2n0IdWupsOu6RGrfyAEb0r0kf2YytvvzO8zGz26C?=
 =?us-ascii?Q?/2BWnzzWKxkQnhHoci4IF0jpdefpo9rtj5uHUeGI1tjwlpHBjV68jJIKGOdy?=
 =?us-ascii?Q?OKCrdQzApoPyiFsNwmgEpoWlj1Hvac5VlqWF7U2pIf8WNZWl5WVqucpDJGgg?=
 =?us-ascii?Q?U3c0Wu96i31lTQ5/VYMzHGUfdeGoQAcn+CJrXTRdRnt2FrPew4tC0kKRDY45?=
 =?us-ascii?Q?7gPeLN//6U+oSmGZXRjfOj6kK+RiN8KsD5pKGX5pRZIlxydNpuvTuHWWJrwc?=
 =?us-ascii?Q?BxrdYZsD8e7NVH4B2ksJoDztpospwP00xz2k16r8bY3jUxJWYiUTJTuAmU40?=
 =?us-ascii?Q?8D3b4mbEl8eAxlSuXIe4N6VThJXRjzB2Q4LCjlI92qBUCTvUThNkrv91PDj9?=
 =?us-ascii?Q?uyFawFl9sz6PtzpHxeqMSGDJWqwJmz73IacirDA6IkywXPQUKQvJ/t5KJA8w?=
 =?us-ascii?Q?2eModwtEOC5rCu/hBhpe4ozgsjWFPy/V8R7N0Wc3pdXSbqggIshbpYsEfTqO?=
 =?us-ascii?Q?wOyLSkrktFw9HT+bXrtfv9mUIEaVrpsYVwXR/Ka6wr5KclOwi3Qyt5Y9t9cV?=
 =?us-ascii?Q?xkMBX5vZqGzi4Rdjl6SyC+jNvroNTmQU4eIUtQY4XZ0hdXpFQnukvKt+vGmC?=
 =?us-ascii?Q?CW9l+GxHAtT1p3pbLJpuCrEano3CbWrdpQJY/yCezUkQPQH5Z1qL/lQudgf4?=
 =?us-ascii?Q?oB/XND8jH/IvD9bUSFk3QjTEqHHVJTZujo9hOEtDJikeciBD20fI2TH71Kp7?=
 =?us-ascii?Q?yDU97POVXdmMzQD/hObo4y6ipA/nK0ZixASC4vCCt4vEO/KvtVlbFxydGC3N?=
 =?us-ascii?Q?GroGePAwygGA7E/yxC1kD/KxwUBu/CDqf5q/xlIWvLrbysEtR4f9VrPZrN9F?=
 =?us-ascii?Q?75qTfv6bcePcAZPcHf9AC6afkr2zi8VraGskjYCnfxmMVXTbCD3r4r5Pgy1J?=
 =?us-ascii?Q?vXr+YjIQ5TyXBA79G9SjrRNrrt7WijDSOH23VNnpRDET/LS4L/ME3Q5D9CuN?=
 =?us-ascii?Q?Jh5i4/Q4?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0deb1d3-5f75-4caf-19c8-08d8c0dfc50c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 03:17:39.2176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6G+ByPT6h5mqaVNu26eLVhk9GItFgbyclurLVSIjDO+LPHn/xc+SpdfgEL5iK7q/syHFDCiuLY+xLsiPStEslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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

On Sat, Jan 23, 2021 at 12:16:02AM +0800, Rob Herring wrote:
> On Tue, Jan 12, 2021 at 2:57 AM Xin Ji <xji@analogixsemi.com> wrote:
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
> 
> That's only true if what's driving the output is a single h/w block
> that can drive either. But typically you have 2 blocks: an LCD
> controller driving parallel signals and a DSI controller in front of
> it doing parallel to DSI conversion. The anx7625 would be connected to
> the LCD controller or DSI controller via the graph binding depending
> on the h/w connection.
> 
> However, if you do need this, then let's extend video-interfaces.yaml
> 'bus-type' to include DSI (it already has parallel).
> 
> Rob
Hi Rob, thanks, I'll add 'bus-type' in the next version.
Thanks,
Xin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
