Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF135257E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 04:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393946EDFA;
	Fri,  2 Apr 2021 02:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2103.outbound.protection.outlook.com [40.107.100.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC75F6EDFA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 02:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN2q6qk6D4z4ZsN6mPpiEG3lTAAD0+BhAmjrlBKHlTjdhdN2zsY7k5+v1s/a5rbkn46kQxbEWGj1110wWuWHhSvjjuzYET3XHR578F5LXA53jrGicsTKruIPL4zmVjMfqwr6B51/nX35TNImpwaDhSRZhN63xI953Un3vcUzyLRynfnAo1RkHaGSSTNsdnzq2IV2c4LaLuMjV9hLmDbJZwhU1wcIYL2sPNqB7/viDBCiPbd6Pccr5bqYkueHRgi3/T3ylOKzADNm29DKFyW2A+gWdBdf2WLHff7isDPa39BJIlDCFrF7Mxost61fCxkmnu+QHaJ9W4Vk8v/HGsJbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Yl6P69aeW1vVduBQfailnVLTAmmIyVQeuGUZp4kmgM=;
 b=B5pUmZgalDtkkKpkITPWb6wj1pe7j7s5ngPjwArLf0dnvmhDGKDLi4xk9ZUl1sG7dAOdIjIq+f/MdX9evarvK8RkIoeJak0R5EdxXDeIMjUvYo/Ta2QX9G5xgg6FiXJpNhzjs6GRxXeO4Os9FvYpgKQunFsKeT86i1UDYk+DpXoVkbalaWguyYAdrxBpJ5o/0keJxscvOoP0G49OreyICH0PXt2YlK4AtkOu0RPTT1Skx1uLIqPldgSh02XpozUI14e+Z8HO5z6rP9IL0O6k2N+phvfr5Eec7P9Jb8qgzGMrbxaJIsohvurgcf+mPYmwLjsTSpF7AbVay83MPeAM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Yl6P69aeW1vVduBQfailnVLTAmmIyVQeuGUZp4kmgM=;
 b=hF+hW/gi5Fqxd6Anup80N+jY3WjHP11vp9AfpU33Rre+synR9IhLe8JtaCjyGMp8rbIg1p3x+NdOKoK4E3cZmHyI6mdDQpJqOPLIPR8iuds2HN5B7zEhM20jIzWU2MkEg8hinQGr5SOYOtruhP51LdbfF68MJIWEbSCyWIzvHi8=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5622.namprd04.prod.outlook.com (2603:10b6:a03:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 02:27:16 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 02:27:16 +0000
Date: Fri, 2 Apr 2021 10:27:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <20210402022708.GA2154388@anxtwsw-Precision-3640-Tower>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
 <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
 <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
 <CAMavQKJHakp0ZfHFEy77r8wHY+3uaP-6Ab2ren6vA46njpjx3g@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAMavQKJHakp0ZfHFEy77r8wHY+3uaP-6Ab2ren6vA46njpjx3g@mail.gmail.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.0 via Frontend Transport; Fri, 2 Apr 2021 02:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c50fd25-c3cc-4e0c-ac43-08d8f57ed4ed
X-MS-TrafficTypeDiagnostic: BYAPR04MB5622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB56228272E4F74371E883824AC77A9@BYAPR04MB5622.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aho9QFsGB1aX6dNtXRp+/KzeTRNzBSXzGg5hbnfMj+j0aOajr36cBxvm9CcrJC/BwQpMWxDfVgx2G9XnowsuGILDlg9LZrGCXqm1vL8XYiNuKIea9nF+HbDMiNYrCQ/T1ZrNsZLK37o68Rr3ibNuXrydjs7NBik9tKreYri52LUy4IjxMkWbjAuSnBjFzVVsXzbTuNCZxpZhRX6CnxhqkJHlr9erndZcTMzHwxBLRT3FYc0qvRS13BGszxrq5YoI2yLJ1BHX0UlOEfmo0HRoKq6xdQpUyXOYxLtW+Q5mhR5GebKSm1oWy+PckYQaKdo2zOw/OJG43ElZ1FT+gQcbw5WrafDaQvKFY9Tjz07rohjSo7SiWV0KEO+ISodIezaAqpKPDV071D2394Y6bdvkrnzRsMhi+Bdj73NnH8F/73DNVSf+ytL25LjL9Qo/5byrXZk6GcwJOyTJc+cjt+YCwGQvwDleRKr5w/1ZXLbHEOauh/yWQpqhu9jK1i5nSrLJTuFjwAHRn7zHFZQWfxmXoJuoHLGoCqkHYlTiFr3mMQWLnJgUf+03NTJdZu2eNH3ziArsMrlobMHlmByAtdvLQhSTXUTWP6PP9gCoabeK1SNnjpKsEIUqqVNsL4Vgct0mjg9HxH8GtvkVhjDItjYPXhCA+PF9y6lOSYJs7iX6E/O8b3TA3H4E6Fd9aZ9HY0RrDF0/nTxRYkoYkeY+uM+Zp/6mrSrF7/8/GJp3AGkQF2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39840400004)(346002)(376002)(136003)(38100700001)(1076003)(33716001)(26005)(478600001)(66556008)(16526019)(7416002)(186003)(66476007)(4326008)(33656002)(2906002)(956004)(6666004)(6916009)(316002)(83380400001)(9686003)(52116002)(6496006)(55016002)(54906003)(86362001)(53546011)(55236004)(5660300002)(66946007)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u93Cu1slc96nhavGcXzcrpsrvg23mYaxHeACMO8V+xLYPWHWNIkZAd8KC1V6?=
 =?us-ascii?Q?RKXYBaIerwTWkfnFI0P70hpGIpipRsVCBCuv7dKrsUn1bFFgf4wWgHY95KjV?=
 =?us-ascii?Q?2YmSpjzlXfrPDu8/0k1DoEdX0WhAT8cWGo9NMuQ7Rdnt+s4m7FSWmBPYbaA/?=
 =?us-ascii?Q?HN9TwXQ2ScWj6JYkSo5EU0lIDsl826D5TeEuyap6xqKnR6osLj5Emuml5aNf?=
 =?us-ascii?Q?HQVm3uDe9tX6dI9+hdKRUw8WP6QNBlfciHyBYCbcQ6QVAqdBjt3S6e8+Syc1?=
 =?us-ascii?Q?EnkI7iwaACRY9hzk0jxBncbwjkBguj7z6z/GVbkpS9JsDadhG+bA+C5zYYnm?=
 =?us-ascii?Q?hCunJgPLclQcrGt2sSBhoYubypt9vzdauWvwNV4hAkxFkP9m0CartXr7jmqf?=
 =?us-ascii?Q?ABITCBvuhPqZfmJm1qYbAxOqv9tQOebSKgXix4kE5Cj+1UZ45r6vJRRJo2zY?=
 =?us-ascii?Q?tT00KyQll6J2z9HTQxVeNweiomPfZKQ1i7p90mo1/r1FsU5LkWmGDUYUy0Qn?=
 =?us-ascii?Q?on20MjE3lJiUo1qIMPypIxiHDrzIXb8WAHkHdEBII+h7Bf+yEY5yWzcR8+Tf?=
 =?us-ascii?Q?SumgVJxj+geubmMTojU6chvBScY8Kg14zx2Dacfgz6mZWEvKZqg4jz36qjnr?=
 =?us-ascii?Q?6UZr1I5RHaffdl15hCSVQItihFZPQGgNLWr60cureibbs9vJ83Ym81yh70Rc?=
 =?us-ascii?Q?IC5Kp7xDitK5hdMde2eKjpvhOfYmIeiONEIsZAr2Kaw8lrnIPQcF4WEwhAxd?=
 =?us-ascii?Q?bHSVos6Lp4M0P6adXinEtEmSjzr0zcjU6QGt1UamIdcor2pQv86u2tVIQg+2?=
 =?us-ascii?Q?wnMhUrA9SsJn0YJmZ3tnxyxC4zlbD94OjYMkq8DyFHJ1wnV6h1kxZ5KpQFHL?=
 =?us-ascii?Q?2M7IZLtlj2LVy/iO673+prFNl6HTCVb3VcDrJsWXUFht+Y9ChZjodwNO8xtA?=
 =?us-ascii?Q?YsrgJFFJ2rfFq88KZ+XmFNdcuzzg9pJbfEHl/3B9MlEd0WSeRPuu1s88b2BE?=
 =?us-ascii?Q?BpVpY3Mo/aje3vSZw38GLcjlKrRS8Ll2CY71QZhpeantKVFfK2qg6y/qjict?=
 =?us-ascii?Q?gYhfPqLWFC6KGT+pvFXRnm085zMOhX4TlWhELTm9ysa9+jl6LG0+aMpdj0EZ?=
 =?us-ascii?Q?1mYZL1quZI8iquPLwKYenlLVHU3p3hFLrapamfP2dIBph3fYuAkJyuFdGtP7?=
 =?us-ascii?Q?VNc0TuBFTGP0VJeEDO05muTZpcC7XyVMQgFv64gpbzHszffVci7f8I9AdDD2?=
 =?us-ascii?Q?6QLZGIk+BogBwjojZct91aNAnq/Hxn4+afcPltAHfMFcbMGqjhRNDXbNQW0G?=
 =?us-ascii?Q?1kp8l9VDj4uK5DXr8uG6zkVS?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c50fd25-c3cc-4e0c-ac43-08d8f57ed4ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 02:27:16.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Brpj0/5JL0Av4iEttmTbcQdxjfdA1HvVVIXCNPsX9fevZLd2oZExz7wflMNmU/PKKHgTMvsQFVWgNzGtZXwtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5622
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Zhen Li <zhenli@analogixsemi.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 02:02:08PM -0400, Sean Paul wrote:
> On Mon, Mar 29, 2021 at 6:27 AM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Thu, Mar 25, 2021 at 02:19:23PM -0400, Sean Paul wrote:
> > > On Fri, Mar 19, 2021 at 2:35 AM Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > Add HDCP feature, enable HDCP function through chip internal key
> > > > and downstream's capability.
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> 
> /snip
> 
> > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >  {
> > > >         int ret;
> > > > @@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >                 return;
> > > >         }
> > > >
> > > > +       /* HDCP config */
> > > > +       anx7625_hdcp_setting(ctx);
> > >
> > > You should really use the "Content Protection" property to
> > > enable/disable HDCP instead of force-enabling it at all times.
> > >
> > > Sean
> > Hi Sean, it's hard to implement "Content Protection" property, we have
> > implemented HDCP in firmware, it is not compatible with it. We don't
> > have interface to get Downstream Cert.
> > Thanks,
> > Xin
> 
> Hi Xin,
> I'm sorry, I don't understand what you mean when you say you don't
> have an interface to get Downstream Cert.
> 
> The Content Protection property is just a means through which
> userspace can turn on and turn off HDCP when it needs. As far as I can
> tell, your patch turns on HDCP when the display is enabled and leaves
> it on until it is disabled. This is undesirable since it forces HDCP
> on the user.
> 
> Is it impossible to enable/disable HDCP outside of display
> enable/disable on your hardware?
> 
> Thanks,
> 
> Sean
Hi Sean, I have commit a test patch on google review site, can you
please help to review it? I'll use Connector's ".atomic_check()"
interface to detect Content Protection property change.
(https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2674580)
Thanks,
Xin
> 
> > >
> > > > +
> > > >         if (ctx->pdata.is_dpi)
> > > >                 ret = anx7625_dpi_config(ctx);
> > > >         else
> 
> /snip
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
