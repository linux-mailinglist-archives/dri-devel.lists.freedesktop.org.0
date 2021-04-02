Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121FA352858
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07E06EE3E;
	Fri,  2 Apr 2021 09:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2128.outbound.protection.outlook.com [40.107.94.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12C46EE3E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iokRbtWm1cm8oHBEBN08kUgjzOcTe9pbZpHpRIgkVEGt2DBb9PBosgDDOjmlJTjDbHhU8gnqdu9iw3jbkDu8YScsD1653iiTz6k++eo0wAc4ZOpgoUxIoTx450KgivbJFfkdVdleVi/zsb1qzzKEghRqc0Q2lYFaBWEIO9K7BYs1tNnzD2SIqFdfxP/ZZ4s598xb3NzqKNrSRWazTAWENdUI0W3aU6cXyEdzbRqqxKjFIhVaITBgSd4xKcywOHigzVcVFwdMQGze8yk3k2kriLCK0sAcX5a8nrKwE3I0xVUO1/EiopnhV3CyT2GJTypH7WJTxM17aw7gT1eaMF88vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bubPJZUrtmp1Zl1O1Kajmjegs1rwpsxvhienZjgFwk=;
 b=PcR2WiKbIGUSAicnWqYnRJvq/UAtYX5heTZCFser+a6dL7H4QM1i7mz097Yra4gX4nKYEtXBdiQcuT9oq47iyQu/kGiq8QLcL8XVcDX1HfioL6EDiFPXZTMMh25VutuR4j6x01vmWBzeJkXrbQdRKcY+3BpS3WbIRS4IAls/RpHO8iZj3Fg/AKDO/X2gvfWlV+Pdep5+HfDlex3ulkkuuAsUPe7+nI64oxSV6XEzzFHgHcVwEz3qoiXCCd5OiYAmHSdXXii3tSDkRw7a7DL5tyzLP4FKO2SCblkqaXq9AkE29ArItD9uQvEaSGsesIJLd5Kt2vKs2qqBcmLcQlbaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bubPJZUrtmp1Zl1O1Kajmjegs1rwpsxvhienZjgFwk=;
 b=3DCknCRV8qa58w+eOFjiTpIs5RAGUtgPAvMt+jFLiwtfCfEXpDgqdrxWmTQjR4//gn8vpx70XES9LYJ0dqNWlThIoW2vFjsWi6FEKlEZtPISu2hhMezkalKppoKol6UJBVYVAz/Tqmec0N9i37cj8/mo1pELVtPPMCtBYmA6/2Q=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5383.namprd04.prod.outlook.com (2603:10b6:a03:cc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 2 Apr
 2021 09:16:02 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 09:16:02 +0000
Date: Fri, 2 Apr 2021 17:15:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <20210402091555.GA2207539@anxtwsw-Precision-3640-Tower>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
 <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
 <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
 <CAMavQKJHakp0ZfHFEy77r8wHY+3uaP-6Ab2ren6vA46njpjx3g@mail.gmail.com>
 <20210402022708.GA2154388@anxtwsw-Precision-3640-Tower>
 <YGbc+1TynbHfX8Ml@pendragon.ideasonboard.com>
Content-Disposition: inline
In-Reply-To: <YGbc+1TynbHfX8Ml@pendragon.ideasonboard.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HKAPR03CA0025.apcprd03.prod.outlook.com
 (2603:1096:203:c9::12) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR03CA0025.apcprd03.prod.outlook.com (2603:1096:203:c9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Fri, 2 Apr 2021 09:16:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5753d01-4884-4a32-a016-08d8f5b7efc6
X-MS-TrafficTypeDiagnostic: BYAPR04MB5383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5383EB4FCD0D0E83EA042CD1C77A9@BYAPR04MB5383.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLJlSS0i/PhnsIngGiZgFeQP8GRNAucWUBdn0/wdfdTR2AwHtNG+KFNaHKmAfJtoi715WSlAiSaZIfvh0LSro6hASnDsGKCZl81WiHbj9MPcoT3JMd5jhMZjLHhEcq4kJVofVKvjJUijPdSfjXgZnwfIvFcTbLoot/Js25yWJ+Cbwmn4rxhc0fz+6sTzORWxyyXJ/4a5vVsS95hH4Np+zr6OibnGzJcgXHQWf1H+UDP8EBQezdjPPctoEgRt/tobUHv0iGpN8uQWe31Bljt7z0X1inxs4dQp4YmiHVaOeJ7Gq4AFFDXHJ+4HpCXdjuvKt+PMG1nyptmujAQOGRZ7sWieMsS4deH9aoAI1qWc9HICOhBe+TctMPFK95GObLUb2g4rO5VTimh5oa2ey7gkVM4rXhyi2otN0x0Nn242hJwC0pooD+hPDAYXdbs8aVOLQzV8lwKYACY50a96JY0I/XXzn89YdQKAFMpD598QFN8m+1kn2YISmmp1fMUAog3HAr8nlL/uWyjLN+U7EuS1g73y/eoNd66EEDMfIPvGlPMDFol4Z9hYfBFIQ/f7eii5mlRqM+AXiioYAl/0VFkwxYVg6ImcbwGJa30K5qPFJ9zRq9Cj+5sn0zR8WFE1RWibRysK1JVZHjjWCGWudoJAXFWvgaOO3hVz34dFGka6Ud6TKqL4NRbIeSbNOuApTJfP6Q4xhn1pxblyky6gOsRbcp7L1v6Nwb1LCsf5DGR2cC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(376002)(366004)(39840400004)(6916009)(66556008)(16526019)(26005)(66476007)(956004)(53546011)(38100700001)(55236004)(2906002)(6496006)(8676002)(8936002)(83380400001)(52116002)(186003)(33656002)(316002)(33716001)(6666004)(4326008)(478600001)(9686003)(5660300002)(1076003)(7416002)(55016002)(66946007)(86362001)(54906003)(45080400002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PCDExgJxNxS0M5UKsSD6GVUJCIQ5dEDzkE3xxhq8jLqahtAUKn6CWZi+5X6/?=
 =?us-ascii?Q?Se9RwklLdVSkmggqSHAVeNxV9kGSQcoJ80JRKkOyJITBDd+dMUtVYwLZFkoD?=
 =?us-ascii?Q?GoxLirD947XhOVOTlNe9Hrxg7YZqq4Fp3E57VTA+5LdDI5OCsaUk+7sIsWw/?=
 =?us-ascii?Q?aQ86m5nfvXu3tXxsJp/A2zjuVzN3ZGVwT1bbEXZhfCbFPTKh2+bTXIQhvd8L?=
 =?us-ascii?Q?5mrwNSFlKPvg/pkaMqQ369/2lywAf69GCWH5vYVRATOd8EnBv3AkBWstBBUa?=
 =?us-ascii?Q?ymIjvUfvZNr/xgbFUOCumaCtmplJrBsMKaGtgbnM0KAhYTUDbB4vamNGIxbe?=
 =?us-ascii?Q?xs78ElB6r39E5/exq6uRgl494ERKbJHSFewx9wRBMg7qVLaPZ60XVy6k0gT2?=
 =?us-ascii?Q?IhOCOlrk7EqOyhz1bDpirZViVBKaixwBOxw5hkwgTcGwR1dMAS5bClkrycBY?=
 =?us-ascii?Q?/iReykfbzc3GFJQg6EZpFrfzCZ3G7RqEZI/nyNJeOrB2xsn3ZpoHraVHfkCZ?=
 =?us-ascii?Q?QKu6a0s6A9AIYtkG+TM05pIShfj7yOBM51FMiecu0KScIHNp9GuWXWUd+PW6?=
 =?us-ascii?Q?dtPB9qPjX9zsgWpISgPG7AQW1rtd5rP7PhrqDPLdDB+V2miI762X/lT5MqwX?=
 =?us-ascii?Q?UHSJV0BHE8SykNlTd+554oBHQdRqipZdEa63WuvbAf7sFYt7xPBeZAu8HSKi?=
 =?us-ascii?Q?tu1mD84QsI/QoEG27y9jxst4Iids3Df8Yfe+XBZinvILAnD36+Gy+qJ+vJYM?=
 =?us-ascii?Q?UjJWo080SSFJZh73g9ZNAEenn1W/pwhzaDC3dkh3ezUzuddHedTX/tRR/dcj?=
 =?us-ascii?Q?+PwXfEoKzcn51OHvgUqc8f7nrd/6uvOW5wa9jNnDBCT1rLhdTv/sZnwBser5?=
 =?us-ascii?Q?GrVRlZhYrF+WEz7ZaXmpK95YEn1uLJxcDTtGcymFt1kPYIR855NTuFUQvteY?=
 =?us-ascii?Q?gutx6M2YrziF/wLkPdVU7QQafKdfYoxmjYm6C5T3qFg1lWJYKq5CX9tCWMjZ?=
 =?us-ascii?Q?8jF47uVA/AEMhj2FrUPCCOXyfPCw2JOK8cwB6PxmU5yLPzDb04WtsHP5xv/z?=
 =?us-ascii?Q?PTOnqhnftXQX443FERU05jn2St2cfnCYXQH4eyhFG03gr6zoWnxk0ZWMsJYQ?=
 =?us-ascii?Q?n5fmxWp0gKLEJTk0un3wvhDgY5FqbfFFrPO8oz3c5AYWiUNS1/i6KHzqDu3/?=
 =?us-ascii?Q?A6UdM6ZkcTOcXGnqoZ7ZT5ycyDljsq9pXLBS2dX0dBP8XcbPN9sonLPFcdub?=
 =?us-ascii?Q?clKi+N1oHtuxYSIpujJMos1T5V2DGZ8OIbnUGG2aSfe316LgPgGwXF1e4pfX?=
 =?us-ascii?Q?/F64HmHwmcCqGNJIavnlDOc+?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5753d01-4884-4a32-a016-08d8f5b7efc6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:16:02.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdAXPUXR2/U60vuk8j1OWfdf4prx0b847A54gxAlYVZKZrqbo5vBXkFKyXtrEv274zrN/vf745TA7tFzYeDNjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5383
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
 Bernie Liang <bliang@analogixsemi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Zhen Li <zhenli@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 02, 2021 at 11:59:39AM +0300, Laurent Pinchart wrote:
> Hi Xin,
> 
> On Fri, Apr 02, 2021 at 10:27:08AM +0800, Xin Ji wrote:
> > On Mon, Mar 29, 2021 at 02:02:08PM -0400, Sean Paul wrote:
> > > On Mon, Mar 29, 2021 at 6:27 AM Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > On Thu, Mar 25, 2021 at 02:19:23PM -0400, Sean Paul wrote:
> > > > > On Fri, Mar 19, 2021 at 2:35 AM Xin Ji <xji@analogixsemi.com> wrote:
> > > > > >
> > > > > > Add HDCP feature, enable HDCP function through chip internal key
> > > > > > and downstream's capability.
> > > > > >
> > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > ---
> > > 
> > > /snip
> > > 
> > > > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > >  {
> > > > > >         int ret;
> > > > > > @@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > >                 return;
> > > > > >         }
> > > > > >
> > > > > > +       /* HDCP config */
> > > > > > +       anx7625_hdcp_setting(ctx);
> > > > >
> > > > > You should really use the "Content Protection" property to
> > > > > enable/disable HDCP instead of force-enabling it at all times.
> > > >
> > > > Hi Sean, it's hard to implement "Content Protection" property, we have
> > > > implemented HDCP in firmware, it is not compatible with it. We don't
> > > > have interface to get Downstream Cert.
> > > > Thanks,
> > > > Xin
> > > 
> > > Hi Xin,
> > > I'm sorry, I don't understand what you mean when you say you don't
> > > have an interface to get Downstream Cert.
> > > 
> > > The Content Protection property is just a means through which
> > > userspace can turn on and turn off HDCP when it needs. As far as I can
> > > tell, your patch turns on HDCP when the display is enabled and leaves
> > > it on until it is disabled. This is undesirable since it forces HDCP
> > > on the user.
> > > 
> > > Is it impossible to enable/disable HDCP outside of display
> > > enable/disable on your hardware?
> >
> > Hi Sean, I have commit a test patch on google review site, can you
> > please help to review it? I'll use Connector's ".atomic_check()"
> > interface to detect Content Protection property change.
> > (https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Fchromium-review.googlesource.com%2Fc%2Fchromiumos%2Fthird_party%2Fkernel%2F%2B%2F2674580&amp;data=04%7C01%7Cxji%40analogixsemi.com%7Cd778885f3d0d4b4358a908d8f5b5c273%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637529508334886979%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vo8zP8SAhLrQk0%2FWh1OhXHAZzLU9lJ4NLaYddI6t2ZU%3D&amp;reserved=0)
> 
> Please note that upstream review happens on mailing lists, not in
> gerrit. Internal reviews for Chrome OS development are certainly fine
> there, but that will not mean the patch will then be accepted upstream
> as-is, it will still need to go through the upstream review process,
> without any shortcut. I strongly recommend using an upstream-first
> strategy, with public review.
Hi Laurent Pinchart, OK, got it, thanks for the note.

Thanks,
Xin
> 
> > > > > > +
> > > > > >         if (ctx->pdata.is_dpi)
> > > > > >                 ret = anx7625_dpi_config(ctx);
> > > > > >         else
> > > 
> > > /snip
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
