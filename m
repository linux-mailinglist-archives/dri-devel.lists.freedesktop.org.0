Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29261E6F80
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1436E849;
	Thu, 28 May 2020 22:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201B16E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 10:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq4O0LHeQQQIjJlyWQgMgeo6iqPw2fqdvasVqpfrc0+8koFSNQCEMgKiE0FSPtqxOC+9oN5bGAhzPTDXxNicrs4aglp2uNJByHNXVHq09zygoHQrTlIPbo77oTRgwQGdxHCf1amD+FY4mP8yyUkkIWTpW4G9QU6yx+2KUkIl8YgwULX6IMOdMRIKp+/0yz0IFY54zFjzQgftZsu73CqrQuvxrt+ieJiMKpC+/5ub7+7G7CYlGxeTY4nwDNZ++mg2Bh5kYrmY8P6pY6gipZSGEEHtcIN4+iPhOC8jVYbfGuLMkuYOKPPsBDr1mkJwe31f6dpy2WWwUGjrst+Voyb5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye5V5GTICRYavjDd3bX/qf3pRYlmRLqffvikChhysSg=;
 b=FFbxy7rhVGwniMuwlNOofH59A4B4QxM802jeiMhviYACx7X0hVOFKZdZQfxeIKsmB1eakdj3iUDd4Ve9jAMrjQHdeSmPuH8BRSnrF8p6QpBOukWA4s5Tj+ho43bWyfIfp4+h0rfTpevoep4xZbgw5tR8wQWTi7lXVVQtCXlnkkj6jBGUJiYy5KESBNpVp6enZlhbYudtFjbsVo1ceNVvA/fy3ELZEnRcuBCaKpk6/e8hSL2AB54vvovbWprpr3mVgXG4mE4eXWBlnaOu0i9LAO8/+R3XKoLU4weD58RgLFkW9OU6rqQGFBU7bUgFKD8n6BlYGKF/ETD3PcNGCOAPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye5V5GTICRYavjDd3bX/qf3pRYlmRLqffvikChhysSg=;
 b=c13vSueWJVaktzWOV93Ads1+rdN9ld3ItWrD5RxBlwF+Bm8Rvo674MY/Y2SvcEQz3N7jS5GzJzQJbgCsyBIZAH0dvXRiVSjggkKCodrPWAAZrJuJL0LvqjkVM8gmKRgQNptSmr/9Q3QU/JFMDf1wm+r7BSaQ+2vY8g1UM89+E2M=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4815.eurprd04.prod.outlook.com (2603:10a6:803:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 10:11:14 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 10:11:14 +0000
Message-ID: <7611f0fc0eb8f291b317d61d8d3eaa18dd719bd6.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: imx-ldb: Remove the leftover
 LVDS_BIT_MAP_SPWG/JEIDA enums
From: Liu Ying <victor.liu@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 28 May 2020 18:10:29 +0800
In-Reply-To: <20200528093431.x7tfwiw6glzr5tck@pengutronix.de>
References: <1589268078-19905-1-git-send-email-victor.liu@nxp.com>
 <e46c78dfddbc76a1e677f3ee6cc9d3816f67edc3.camel@nxp.com>
 <20200528093431.x7tfwiw6glzr5tck@pengutronix.de>
User-Agent: Evolution 3.36.2-0ubuntu1 
X-ClientProxiedBy: SG2PR04CA0176.apcprd04.prod.outlook.com
 (2603:1096:4:14::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR04CA0176.apcprd04.prod.outlook.com (2603:1096:4:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19 via Frontend Transport; Thu, 28 May 2020 10:11:12 +0000
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3e0757f-ac7e-47fb-e248-08d802ef740b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4815:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB481506DBD49C9B2BEDC1D019988E0@VI1PR04MB4815.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaRrYoLh5XTqV64gtnqvE1XJCoK3I9KuaQO28VRJA/fxa40UWpfipzmgyRIjLOim1s6TGdETaa9yGJK9BiRKJ8NzgvSMin6pw4EbHk7KX0K+EAjpWibrXFXg8XIJCcLi3VKR5juWRXvaNGmcYZ0I7V0cfWEyKu6Jwy+Wo9zDJzLtG8Zk+NP3G+05l1aPRcLl0v3EPvVShoMb5PPH9wimuGYyoc4fxoG13XNOBKXdczvMDCzjUL5NNIruPnv+HmxsB/sC18Law63dZiAglueFSCmx7iDxASOtk4Sa0vGnNDiiXoVJRwHQsSLIJfSI3pGIK/ZZ5/8Qpg2Yb6//ALTqOJzdV2rajyvy6g5qIrx4Du3iA7zOW/FxP+mINnO7dMwPGU8PbSjKfnuG00kI0FBsPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(6486002)(966005)(8936002)(2906002)(5660300002)(52116002)(53546011)(6506007)(86362001)(478600001)(16526019)(186003)(26005)(6666004)(45080400002)(36756003)(6916009)(8676002)(956004)(2616005)(6512007)(316002)(66946007)(4326008)(66556008)(66476007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7G4PjncWqgwxdMxWCjoCK2Y/5yDxOfxE1kVu5+aivZTS8QLThdSi3/E/s0OvxJsXcF+gzxClms08Jqz/x59IFFfGhlIgHR4kJ6mfmHcXkQY1nVcqxHiFu9wBSOMwUd4ne2VGjA8ubnxlQ2NmCLlutj9BDJbNtbX+q6YIhNQtzb43yoOL8MpGnBzqlnj8qxpa7X+MAu1FvYxtJjl/RKwTi7EhrCLZMQlxff0BCQ/AfE4VJcnLxpRqvsulUAEpTQOku8YYqdVxKtY2WG0irIihqucm12+lOpUTE1jYKVPpDyOKJyCOEYhPURx5wN00EHOo55T1m1CN4U+tefZ8H4LT3HP8qIwjNXl6MGiaahmaAhmxesHeGX36QRh55NpAnTh+CyTqO3YFjsnUXfJYd+OvOxZTriOW4rkQJWyBz6pr1SGHHL5vFTCaAHGzy2i50XbOe8WlylpRgfytJvtXPnjQOJYlfb2T7uU6WEocL1+YCUU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e0757f-ac7e-47fb-e248-08d802ef740b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 10:11:14.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TigSEIu+jdnsoYM9Pha7+78JF5LAXDXPiD+SxsiEjO5jdw9a/tNDVhOlrGdcjeUkGTUVEq2/nMQrvAq6D09z9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4815
X-Mailman-Approved-At: Thu, 28 May 2020 22:47:37 +0000
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
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Macro,

On Thu, 2020-05-28 at 11:34 +0200, Marco Felsch wrote:
> Hi Liu,
> 
> pls check [1], I already send patches for it. Those stuck because we
> need to verify Philipp's proposal.

Yeah, '[PATCH 09/17] drm/imx: imx-ldb: remove useless enum' in your
patch series does the same thing as this patch does.  I'm fine to drop
this patch then.

Regarding Philipp's proposal on the use-after-free issue, we've got the
basically the same implemetation in downstream ldb driver to address
the issue.

Regards,
Liu Ying 

> 
> [1] 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg789309.html&amp;data=02%7C01%7Cvictor.liu%40nxp.com%7C8da3e383727f4fe1e0dd08d802ea5458%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637262552748306435&amp;sdata=DWN%2F3jRT07qmPWxlgSTuD9eRiRVoOHWGRmfrgj0ZA3A%3D&amp;reserved=0
> 
> Regards,
>   Marco
> 
> On 20-05-28 10:55, Liu Ying wrote:
> > Gentle ping...
> > 
> > On Tue, 2020-05-12 at 15:21 +0800, Liu Ying wrote:
> > > No one is using the LVDS_BIT_MAP_SPWG/JEIDA enums since a
> > > previous
> > > commit which changes the imx_ldb_bit_mappings[] array definition,
> > > so let's remove them.
> > > 
> > > Fixes: 5e501ed7253b ("drm/imx: imx-ldb: allow to determine bus
> > > format
> > > from the connected panel")
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  drivers/gpu/drm/imx/imx-ldb.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/imx/imx-ldb.c
> > > b/drivers/gpu/drm/imx/imx-
> > > ldb.c
> > > index 4da22a9..19a00eb 100644
> > > --- a/drivers/gpu/drm/imx/imx-ldb.c
> > > +++ b/drivers/gpu/drm/imx/imx-ldb.c
> > > @@ -477,11 +477,6 @@ static int imx_ldb_register(struct
> > > drm_device
> > > *drm,
> > >  	return 0;
> > >  }
> > >  
> > > -enum {
> > > -	LVDS_BIT_MAP_SPWG,
> > > -	LVDS_BIT_MAP_JEIDA
> > > -};
> > > -
> > >  struct imx_ldb_bit_mapping {
> > >  	u32 bus_format;
> > >  	u32 datawidth;
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cvictor.liu%40nxp.com%7C8da3e383727f4fe1e0dd08d802ea5458%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637262552748306435&amp;sdata=isO%2Fp5kg9qJ8%2FLg5zqI8XazuxwHr1hPjiyTHFhy0n2o%3D&amp;reserved=0
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
