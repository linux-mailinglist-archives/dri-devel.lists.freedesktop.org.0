Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E91352584
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 04:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AD6EE04;
	Fri,  2 Apr 2021 02:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2132.outbound.protection.outlook.com [40.107.243.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226E6EDFF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 02:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNnQ9tJ7MjJksVa5eHt4K0mbaA9DhgE24sgkLRRy3A0gI12sjQB7YYzEDbgVUgGj8Vt8NGGtr4lDd5HGaXivQJoW0xEH+fv8eoRhsBykipNTIpM8oLMqAJAwG1HZYEsQKD36oTMeB4f06T/364yJfx/VlkxDzXjtnXLQoxXciKMxSWfqWt/Ve7a5Qe9gye9aGoXWpCbKTY+0hFaSfh5fTyOv9kKgU80JLF7G2fVhm0lfW5EFZkiNfRf+2b6Q/QGqU38Bzg3/y6R3EMIBBu98glIlIiTmUkhQjXIKpvRPOS+SOQi21VwRAgDDHLZgfyiWwXyyI5OXtbX/Srm62Uz2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYWEJpnjiVn+kB4bTHhnq9Wx5Fg5jMwbzZ3LED/y7rM=;
 b=hW/X23jgbueoCYsgwLqz87OaMymPVppcoIFJqtaZYVU4qitsBW2afRNpcTxveI3jUd+GHzxyeTT5QnLuxv/B17teM3CwkZCa98BDODRH6e4XK1PfnFPmq2gD0wOrnoUy/3AX8NAiPY8lh1U4Kc5irvEuuYT6mKcrtVIrQL1trZphfrOFWwE5ibIkejwWRwzmpUqdnsPiwrD4frzH8WfPRYywMNMitQeV9TzRh9bimjiM4mJMx29BTDFz6coQ13Z0xEKWxohIxTbPBwEGcAJ0wbbC+WO//wbkebIDRGPb9PhQ4MtMdoU4Lasc2b0R0SdRE8lEuwmxUEHF2e0n7FhIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYWEJpnjiVn+kB4bTHhnq9Wx5Fg5jMwbzZ3LED/y7rM=;
 b=Tuc4pZ1VonUgMACU0LU3UKB+reZVDqrT2aCCGgfup+P8SVvp155/QbXQXmUaOeD4F0/MGhBOM5ci8kt2M/d6bPVEgcvsO283Q5FQSYz+v8/yZ3oC4lrmw/vdPNG+m8JYFM1s83jqujpQymY2XGQXpbM2qTpKYRJg7tBCxdA3AuM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7597.namprd04.prod.outlook.com (2603:10b6:a03:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 02:29:54 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 02:29:54 +0000
Date: Fri, 2 Apr 2021 10:29:47 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v6 1/5] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210402022947.GB2154388@anxtwsw-Precision-3640-Tower>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
 <YFc1ZlmSiNJOAoOl@pendragon.ideasonboard.com>
 <20210324075108.GA1466804@anxtwsw-Precision-3640-Tower>
 <CAG3jFyt8EigCBkZHXgy1E-XcfpfdC5FEWW4Gb8bZqMT1tFW3ow@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG3jFyt8EigCBkZHXgy1E-XcfpfdC5FEWW4Gb8bZqMT1tFW3ow@mail.gmail.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0022.apcprd04.prod.outlook.com (2603:1096:202:2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Fri, 2 Apr 2021 02:29:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7df83001-1f84-411d-d1d0-08d8f57f3312
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB75970EAD2ED69471B6080636C77A9@SJ0PR04MB7597.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xPptzNZd0yIJQ2Igf1mBFTfC3b2slt28iDVUPowo2KsNx5y0DUxARKTYHHAZ3nua9U/WCTG4nAiouD/ATMUgM1g9oVT++IywXZ9nrMsnfPWeGz6Wx+H51S3VbIILEWSGgvSZHMJiNmrHy9OxgwZBurTa5lt9W1gYpqnJBM+CoBSiKIWicob8JJ8NyuOFJeoqBc2knVm9jbqi+hC2EMa+GLY6OEvzNlc7rhWC73wzKUghs1qmc9/ErLZncmP4rBqkdkRB/J2281Q690h2IS5T+W8A1XBgjNrl9ghoV46YUvYPjxkvDIWGu8zMAj8W1Loqj8snTr32s56y8YFuFkid1nMvFlul2cLmtDBOKXWgplKb7GrX/XoGtnEjvDkF0KYxhjSVnb9o5Cf7v/m9cGVHYxowhkGGUgBPb/wCxYhRLH7urc1usNqzB1DFRcxYUEV4NKarUIfmHlHulQ/t4LOceglvW6ko6011knJNvKDNNFmBd9rndiGUsGZBTAl6aoBEBxilvvcTxaT1bD0TteHh0AogKTm8gCxqV6mE2UMa4EjM1tChnC7wEdrO/xwW90OLaKsAXM+jm0h1JRpk1YP5uAV/gwgwn0TPIAy1atabGx7s5KP6C3q5np6OOcUAmPC4zQcYTxSBsZF484nJJ52uhujrWdPDiPnP7x+iPFep70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(396003)(136003)(366004)(1076003)(5660300002)(7416002)(6666004)(316002)(55016002)(33656002)(83380400001)(52116002)(16526019)(55236004)(33716001)(26005)(8936002)(186003)(956004)(478600001)(4326008)(6916009)(6496006)(8676002)(86362001)(66476007)(54906003)(66556008)(66946007)(9686003)(2906002)(38100700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WFZRvtpnS/RVX2Mza9doNt15T5sDLgnDHiBvb+YPpkCRmQYDLy5qSk0u8Tnm?=
 =?us-ascii?Q?la/dWHt+/XBFYkib9rtbGylzFNq8de3iFN4pDGTANh54yGQIkwUeXQlARlpp?=
 =?us-ascii?Q?lmE7n0zeSS56gqDONDpDhdaomD/d67hbVdLLiI4T3XDme+fVRVlRO8nfflYd?=
 =?us-ascii?Q?eWMqyZqGnLI9g5KgioDaOLz280wU9zoFqyxLJA0iJgsGzvMWJkR7OdG/Bp50?=
 =?us-ascii?Q?2DsdAZCKzgSQZQKRptf11FiOTOV12EYdhIR8mWDxzO7Ee5FSDAv0nbWTTmmn?=
 =?us-ascii?Q?gEXpqx41ZBxufHp5/8tDzLmCPYc1ehWT3PeiVOXQ3tLOpkQhCD9UPl3vDh1R?=
 =?us-ascii?Q?M5VXuhaBp0wIc1ycROKCQjMJ9kuXU/QtyiMGju4T1V5KlQCOOIJvQNvjhZtS?=
 =?us-ascii?Q?yVVRidypxvkNe25EJMKSmVeUNm4urF69mAozGuV/5hzU7dc2i+lXZCZzkyC3?=
 =?us-ascii?Q?ri/B/5gi0NytgTs6Fjv02YMk1siMdysQL1md1k5bd+f3BAn8tWfr8Xgd9EK2?=
 =?us-ascii?Q?NJ4jwBO3GVqeXbiqZU1hYzeDinkB9Reo0rh0niUwknKtj6GQQfrjF4QE1Ha+?=
 =?us-ascii?Q?lr89RP1Bgu6MzO9jJl1wi0iUORSDkXGJ6PA3NVkXxeK1fdoRZt4StgoJYK26?=
 =?us-ascii?Q?bPJ57xqrTALSJaMW7wKpL7vC2/oUazIgV3y+feHdcaVfAIJ8AnjMk8KC1xPd?=
 =?us-ascii?Q?BvuVpP6YT8WAceL6bqFb2lUjwLZfmFhaTZrvJNtcURrnNcmhPx3j8Jtbu4u6?=
 =?us-ascii?Q?JFIBlLNwdau7rAsbgjZ5dSNcH6xYWGXIG5IALgWynyy1BkztUu61Zz3PY1FQ?=
 =?us-ascii?Q?mzz8E+FwFNxNolOpwi7OZpVo0KS3iv7NbdFEeDLImXdwa49Fzp9E9VJIv/5+?=
 =?us-ascii?Q?HEqrtUv2Ial2x4tl4ZHzTP+VuLwXty52lGma+ATbYlBXUnrADK2UvW1EySAD?=
 =?us-ascii?Q?bpU9Ty7kHHHCMuVHecopUCzypzcpPyhlegd22yWRnUO0nJt+ISxwTeMf6RNc?=
 =?us-ascii?Q?PTHG19bFSye5MRAtGaJvktwRtCGSartuGAVE9fkgVbpicB6cGxR5LJdPxhCd?=
 =?us-ascii?Q?aqm+ovC+gPcMrGme1Nsvo9PltXrZxQqRKV8d3Xw5se0VC0eAFi1WuIr/MJSg?=
 =?us-ascii?Q?MAhoYses8VfS84LzdnqD1f07PcghN5kuoleW3TlGmodOsDZv491YwFYUlqci?=
 =?us-ascii?Q?lH32hfWFVGx3lfHuwbVi8Pz1Y8I2cIHLvYINhD4FXOvE5IBUzjT9wfg4J/Ur?=
 =?us-ascii?Q?6EiWkve2AKO2W/C6xQLBnqwiqMSox0Owt1vtPfXUS0208KbkjVWDKSFKW/l8?=
 =?us-ascii?Q?DEjU/lqlb3RnttDd/TnDkgNh?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df83001-1f84-411d-d1d0-08d8f57f3312
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 02:29:54.3410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN5g9zXA25q448jGAmL5VQAit+ZKP6p14qx3AsZc0/IH9oszlyd+DWXmoxxiUYMf6XEEiijEhbhMfrPIOtgEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7597
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 02:33:47PM +0200, Robert Foss wrote:
> Hey Xin,
> 
> This series no longer applies to drm-misc/drm-misc-next, please rebase it.
Hi Robert Foss, OK, I'll rebase it on the drm-misc-next after confirmed
HDCP patch with Sean Paul.
Thanks,
Xin
> 
> On Wed, 24 Mar 2021 at 08:52, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Sun, Mar 21, 2021 at 02:00:38PM +0200, Laurent Pinchart wrote:
> > > Hi Xin,
> > >
> > > Thank you for the patch.
> > >
> > > On Fri, Mar 19, 2021 at 02:32:39PM +0800, Xin Ji wrote:
> > > > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > > > lane1 swing register array define, and audio enable flag.
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  .../display/bridge/analogix,anx7625.yaml      | 58 ++++++++++++++++++-
> > > >  1 file changed, 57 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index c789784efe30..3f54d5876982 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -34,6 +34,26 @@ properties:
> > > >      description: used for reset chip control, RESET_N pin B7.
> > > >      maxItems: 1
> > > >
> > > > +  analogix,lane0-swing:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    minItems: 1
> > > > +    maxItems: 20
> > > > +    description:
> > > > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > > > +      add this property, or contact vendor.
> > >
> > > DT properties need to be documented. Contacting the vendor doesn't count
> > > as documentation I'm afraid.
> >
> > Hi Laurent Pinchart, thanks for your comment. For the DP phy swing
> > setting, it is hard to describe in here, needs to refer the anx7625
> > datasheet and programming guide. Basically, no need to change the DP phy
> > swing setting.
> >
> 
> Laurent is right. But if the value practically is a constant, you can
> move the swing register into the driver. It should still be documented
> as well as possible, but we can be a little bit more flexible.
> 
> > > > @@ -73,6 +123,10 @@ examples:
> > > >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > > >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > > >
> > > > +            analogix,audio-enable;
> > > > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > > +
> > > >              ports {
> > > >                  #address-cells = <1>;
> > > >                  #size-cells = <0>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
