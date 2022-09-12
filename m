Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1A65B62E3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 23:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DF510E321;
	Mon, 12 Sep 2022 21:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2075.outbound.protection.outlook.com [40.92.40.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4B710E321
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 21:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qgi7nL4YFh2QLrsTl3GSFnp863j9UkPP4bVtrnxo4qvhmm/y3MsRYsSue6yNsp0OYdzUIonvhE6ClB4bJNjOPEbljVRofRAOmqJyfOwGO0Brnkbvz3e8JhEwKkvtWixHkWjbN/2JSwnLkG8c7VCkgMzwUY8SoaM/zRZVB3I6Q4q80yC6RUzk5wGX2YFFITXClI+BGPOPWEF004U+4+cN3w6ZPGYqAhyrrN6Pnd7SkHzMtBu45Mkey+hTg/fCM6O48uzqpIH6OVEhP1PTHrRWQAH1UoOrl5Lm/eP+Osc3ewDgGb8VvRTj+PgOx8we9V5Sif6JU95CzQZEFDVbKaDv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlrLmjwkkP5xjwDhY9JbJsMKvB0T+Ryy9XG7HtI41oM=;
 b=nB8clvAa/ygs3bgvBQZQRiTDsyLFb9x4J+LQssfwWhhK+6tzfbn8uYnstxC2gglauwIn9j4rghJ3Riax4nIJZHT52SysL0dFEaMLYW4gEVgJZEhC7WugzQ0kO9+SKeGujNH+z41OIiKLgqrRiq1Myu3wJ4coT5auksb9Erqr+ymgGaZCHlqPK0PXkUfBZqkQR7YjwzJuYxyW2F1veMr+mGsQGEYhp3AhArUPiY0SwgfPbslLhlmoJyrGPW4euw6wQ67Dlp+YVy/oqphb2TiPxQaOpKSXw6gL1g8/GEAv6HxKXQXa9ZijEbAsRM7z6SwL4N43QaWQGdPb6E+VK8AmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlrLmjwkkP5xjwDhY9JbJsMKvB0T+Ryy9XG7HtI41oM=;
 b=BkkY6rClBgjLmojxUSLkDjxjfiuKjbMWWGq7k6WrSRlXyH069HEq3EKRs0kiQbeppYewFZkRxul/86Vx85ccD1q2pDJqYlTlogTa0TSUtd6z8bB3ZQGys3JRdcbfHb9oQj0YnQCyfnI74/yy32KS4R0h7Eg04lS2obxIo9m2vyVkgxiOVZvh77cEx6QAWNhNHckY1ltDetC/DjJaOijIa10s1Qs0ZFrYPlRreaF7zKSTSQbx87joHv/niTdzcnrBaY3l3MCHBIDlxycU8w81Y364SbAzmD5mh8D4e4sXMEm1jHEEGP24gjqurkwhm9fUlwtqNXKT7jqkUnCTn62VAQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BY5PR06MB6578.namprd06.prod.outlook.com (2603:10b6:a03:23a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 21:40:16 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 21:40:16 +0000
Date: Mon, 12 Sep 2022 16:40:11 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add NewVision NV3051D
 panel bindings
Message-ID: <SN6PR06MB5342A0EE256279CF6E3516D0A5449@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220906185208.13395-1-macroalpha82@gmail.com>
 <20220906185208.13395-2-macroalpha82@gmail.com>
 <cbdbc7d8-a3b9-d960-68c7-457c947e4285@linaro.org>
 <SN6PR06MB534207102C2E8AFCE63C3231A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20220909014235.GA3737396-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909014235.GA3737396-robh@kernel.org>
X-TMN: [ChTNNPAobBuEdvLexL9pidjNvw7e+0WR]
X-ClientProxiedBy: SA9PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:20::26) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220912214011.GA6173@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|BY5PR06MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: bcafb8a5-f45f-4ee4-dc43-08da9507617d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5SRN6kVYenQugJKi1QGFdRvuMQp6EG0r3oCbF+kxVgGA/vy2X3WFPbTf/TTnfh+ROa/uIFwdXw7uHSSUUU2luY8Lah4D3ckdcV1i+Fu8dW05otCnTib0XJjvFGBeVXAQ0Li5xQCiprG5LWCv6Z/F24Pb9m7qecfG0B6tX64ZzsAGrkc8oPx2JlGZYS69hjptNpo4i7aquHMad4KXPd4M31IFZ0/dOv49WsSh/zpkHfxaCxY8/SY008scK4j81eaUHJb0MCnxLVfObnW9hLDPrIJhEsvqVpIZ9GFUQB3lDLOZM7P3eOUt/uJpXGewtfiowZKhKTd3bwfs2018u5zvDldAy07I4Mkw0XcwG3++3+IYsDjVmMQPEpaUWVy6TKsQY40zNaS4pK8SgnLlgcJ/v1MkESifM+M/cUn6ooXtOTNRD4QZwnptpmOYMJ/+87o6Vjz8SfDQV+U/IaWc/9dv1vCpAv7UOF9cE0dAPEkoc0kGH/2hRUy/bZBM/1pEaFuG50hgzxiInkwFkyoREPei0QliSCWwZfCoeczGIG86EU1KV1UquWQAulvKiMIUdyQKqpgs6f7OTLn/zGXJmoUG1VvolHkGl0LT+c9W0wxsuQE7Y35kNNwq1Jus2vbgJsdTCX3mVXBRdCJgZl2FY0Jz+2psuc2vrZlvV/kSRIST8NwYaPXZg9HGBsr7+NnOpCD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHnLjP3G8VRRx7wbrL0iwh64T3Khp93pz87bdmYecxrvPn32OuDnHqwS35P9?=
 =?us-ascii?Q?+oZxZPb0WIT+ySXbN0HwwqKUlVZsbbUZFt3HKp8wflKGBrTrdNKhbi7/h5Aa?=
 =?us-ascii?Q?vBZ1l3lNFz+9YEb+u+7tcT73Mj2ltpxpH3V5TP+xQZZ8utKTvOA0+84KcalP?=
 =?us-ascii?Q?LdqoefAOuxa0jSzGeHrH+CthP3GLrNBU28jxjSPyVhyedIZGI9TqREg3b0yu?=
 =?us-ascii?Q?lyGMFCgqDK15H88F+kvFBdzZUHStumZo3LNSVBErs693Tj5uftz7nSlVGJka?=
 =?us-ascii?Q?QnK7hia1gHt+rYpdNDkBAcG/CBlW9JLE4CoNmOprFa5+UQGcmICmYls2Nc8j?=
 =?us-ascii?Q?KXptXW0cJc4e0Z/6ERuCUqZq816DivAQQ3R/Fss1pJP9TFm+d+j/X8eYVsSi?=
 =?us-ascii?Q?L1weHKBVAj2t9sWe8RmjTRHg9n8ixSR9lqt7YPL/Mcw5VpI8wILO4cQR7hI+?=
 =?us-ascii?Q?QSiPw+tmGGlFOcDeYZE7JbXnTqRSYm1aUad+XuW0kniUcLlo9+ij/XLyXoTo?=
 =?us-ascii?Q?rRzlYYlbuvt8cEy8uuxLG8zpS0j7dpA0YeNT8MwSjkHV5Rn64fhay22423E7?=
 =?us-ascii?Q?C5uXoqA4fnzrN/r72hQt2vnWoBue5rU5jdnwrnngm7YgFsIKGbKpmCSIKdqY?=
 =?us-ascii?Q?X6yCO+evQte1205zlrp1fvwtPMaXMPDJVAphuBHXrddYaXaFGZUGM6BuXNlv?=
 =?us-ascii?Q?7IaF54Sjq89PCenKuRw67D79/nJlu5xpsLTrsCXmad1J+4bc5QbQGAXiQDRR?=
 =?us-ascii?Q?XPoYI7WHzg/lG+UpQwn0/cpwmwoExQJ6qOZiKWJsNuPHPB+RWWWIv8Opk6bB?=
 =?us-ascii?Q?j80bwKUfVPqqj+8IGEMU3om65pz42786rFsO/lQCfhgPAHnYImE69awoNgaP?=
 =?us-ascii?Q?ZUgU/IJ2QnM680fegnnRGq7TN2xuuyrYAlQCwKBQH1okefPGDRMp+Hlvy/IA?=
 =?us-ascii?Q?oTqiNdAtgdtbQg8dlB4/qD5mKsYRO+XQQwOTXqiqErk0ZPZL3ZZE7AFK6WA7?=
 =?us-ascii?Q?OcPEfvfSDAPjsuT1b+lw1R1kPRwdUscr4hCCgRqGniS6T7O1NsoV0CK7CnQg?=
 =?us-ascii?Q?DwQq1eypg/N9FYxjWqG6uzsTlp1Z0ypd76MUX1mDFlrQ71rexs9mJR8gf5Lh?=
 =?us-ascii?Q?IhDHjaDBGJ3UE/6eLpWUc40ah2WFQnosxzHJUMAc+UlzqXdmf/bDQ/Ssk9N5?=
 =?us-ascii?Q?vUSqdvnjPUwuGN2AP/3CEAZiEkXetJ9L/QtSfymS9Wrd55N1rR5k/sFTnvgG?=
 =?us-ascii?Q?C/CWNBRkQoKVapZc5InW6/HD9OCdSuE5yhWy3R17Ag=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bcafb8a5-f45f-4ee4-dc43-08da9507617d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 21:40:16.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR06MB6578
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 08:42:35PM -0500, Rob Herring wrote:
> On Wed, Sep 07, 2022 at 08:35:13AM -0500, Chris Morgan wrote:
> > On Wed, Sep 07, 2022 at 02:53:56PM +0200, Krzysztof Kozlowski wrote:
> > > On 06/09/2022 20:52, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Add documentation for the NewVision NV3051D panel bindings.
> > > > Note that for the two expected consumers of this panel binding
> > > > the underlying LCD model is unknown.
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  .../display/panel/newvision,nv3051d.yaml      | 48 +++++++++++++++++++
> > > >  1 file changed, 48 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > > new file mode 100644
> > > > index 000000000000..016168d8d7b2
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > > @@ -0,0 +1,48 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fnewvision%2Cnv3051d.yaml%23&amp;data=05%7C01%7C%7Cab7f68ce677846b1638508da920493a4%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637982845610791935%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6XxrzD1zkl8SYQqV9nkH1WzKfdcy6doNfzan8r228W0%3D&amp;reserved=0
> > > 
> > > You need to document vendor prefix... but the filename does not match
> > > compatible.
> > 
> > Okay, will do that. This is a tricky one because while I know the panel
> > controller IC (a NewVision NV3051D) I don't actually know the LCD panel
> > itself, the vendor is somewhat tight lipped. I do know the product it
> > goes into, so that's why I did what I did with the compatible strings.
> > If that's not correct I guess let me know. I did see for other drivers
> > (such as the NewVision NV3052C) the driver was written for the IC
> > and the panel name was listed differently, hence what I was going for
> > here.
> 
> I think most cases like this targeting a specific LCD driver IC, there's 
> a driver IC compatible as a fallback. 
> 
> (TBC, 'driver' here is not Linux driver, but the h/w chip.)
> 
> Rob

So in this case would my compatible string in the devicetree need to
be something like "anbernic,rg353-panel", "newvision,nv3051d" then?
And the module itself have the compatible string of "newvision,nv3051d"?

My fear is that I write this as a newvision,nv3051d kernel module
and then later on there comes a new panel using the nv3051d that wants
to use this too. Again keeping things confusing I have no LCD panel
part number from the manufacturer for this, and I cannot see anything
on the panel itself denoting what LCD it is.

Thank you for your help. Just wrapping up getting some of my favorite
devices supported in mainline. :-)
