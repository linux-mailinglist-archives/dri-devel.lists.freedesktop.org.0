Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DE34F8B9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A23C6E17C;
	Wed, 31 Mar 2021 06:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDD16E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0DMb6FaW/4UFgJv4iGZwRVwN2IeIHhPzxkrAwb45a/DPgsLTR6DfyzrTmQW/XGJejIqaCzDyNIaq4m9evtYvdHIGu8wz7KT2QCfVUV/GZywH/FgGtJDUmHD6YCdeYsP3bqTJOqRYh24QgqU3c2+vDL+pVaJgAEf6r7qUxlFL/SZbEc3qUQJyOVQyzAhBQAhHiegRIH0pDHf6PbkiEpXuBGqAYk7pfITELijA9hI+oTgcCxRc34zhVtCNjrvHFLOEFcJgPVkM0/hOKkFnTJbasTSfcTqogUUU085v2eIMZOT2W3T9kc0HY4zDYpRuLScZDqJ9iMIGJGKx24QiXCAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBt/ruS7lh8NOOOpmI+FclqGUQGGd65x43UcEp+R+rs=;
 b=Q3LMO2b1ADG47eudK6yK6Pn7G/zNtZcxO12lLhM3kRyKzHATm+0R/LTkVk3iLajxelSFQm1CD/WCMDSktrxfDZRGT50b1S7XtqEsB/XqgZIp1HmsAPId3Gs5R2MDsvqF0lP+wQesCdSV1+5E58WWnVX+bMfN9n9zT/zwdee4b/vjtg6w/bqDcGzvSp3dCsBXMHWz4DZFx7dpBdS6XURNA3+6LZO+UdJc7BkXfZppQc46SfTYhSXA32hQTPA5zPhDUJUCjZ5EC/ieAIbQwOcX4UousOj3ODAVVK+DNX+MryOCwV0EcZqfpH5pTzIgRrmKKW0v223AYXT+jG6ZesAlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBt/ruS7lh8NOOOpmI+FclqGUQGGd65x43UcEp+R+rs=;
 b=Wh4Hk4g2UsGjV7ZPMBX51JdnAUanF2+h2Vn+cO9mWkxeZpg3fX6OOrwbLH/H0Aq9ZB5GEM89JRLhwJhg35jsTSzn+MZtSk8LBY4Ojq1wlljjbR2IHXeyyXl1bxw0jqpsQnDCChsYp3EB4omGMrvqfoTrKgiDXKteoUcQGDAZgMw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6142.eurprd04.prod.outlook.com (2603:10a6:803:fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:27:35 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:27:35 +0000
Message-ID: <8905aad5ba0a37d1c889cfe612b785817d0f1193.camel@nxp.com>
Subject: Re: [PATCH v6 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Wed, 31 Mar 2021 14:25:57 +0800
In-Reply-To: <CAG3jFytpciiAGKnUyb6H-GoLYks9RRxHm3cRaH_PN_zhxZDUjQ@mail.gmail.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-13-git-send-email-victor.liu@nxp.com>
 <CAG3jFytpciiAGKnUyb6H-GoLYks9RRxHm3cRaH_PN_zhxZDUjQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 MA1PR01CA0127.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 06:27:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 98a1227c-ed96-4243-0162-08d8f40e128f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB614268C491060D128FE64729987C9@VI1PR04MB6142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSr2Gqp5H71IMF2vYL2qBqhUGTq6KULK34ztNeXRFmuAD0IYq0h2j7QE+mqSkc3dpoQxyN80tk1+Ebkh6l9IogP4w1vOQcF9KcOEg1i3W94fO9yrFUj6ODFFqLsWQoueBvoq7TWygJO8OGkNqcahEx//M+2+Iq4REsCKFAMJ4BbmMaDFIJsEd045SlKinqCFRmx/rd3xxHYuc2pBEcsyV7WH2RWmeq8hnNUPuRyT5q9NogasW9Eszgm0ec+ALmim4DHB4HThwtSF3yl+BCzWSSN2ou9v9BS/VFv1MMwklDNCccCVRH3rzcssJqn3likocIAN8d29KbBMzPX917dqvL7szyjY10Z71UNxhCWZrKal+hknyVOBFcSQxxPKAEBqC7oaE7AVZroUFnPGqNGfLB9NGNv7X3h5yIpYKNNBoYXqemp5pAVhUypEAbJdRb0X/zhWaXSis1EK/tzhycytfg8NleSBhPNRNkvR8cGv3u8amobDC6zTI/7kDPeC1vcyhwX9wDhcI9OLSQzuPi6/reGA8wxbY6F8Mj1D9SzL/lQe7KRlWRkqoqZHG7yt36R1G2193nGRVqcgIjD0Lxo0yeyrg/fcsokV9a35X3XfzEnc8dB94RplyUiFmReaevPslDAoA1W/biU+pbWyZbP778sbqFSLbPI3Z7KbIPth6fUedZ6VkOWqjVlK4lbHJyGXoDjCPykFyMFku7sFHTqsi5DJBvQXZNpjQf8ZrvN1RMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(52116002)(36756003)(5660300002)(186003)(66556008)(66946007)(66476007)(45080400002)(8676002)(498600001)(83380400001)(6666004)(6496006)(7416002)(26005)(6916009)(38100700001)(4326008)(2906002)(8936002)(16526019)(6486002)(956004)(2616005)(54906003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXZWeDZvakZXSHVwWnJaS0dEUW5hOG94ZnliN0xQdWFSVmRnNUpDTEdhbGts?=
 =?utf-8?B?Tjhoc2hmVHJrQ2dYWXVJUFRlK0NFT1pMQzJiemVPdUpRYW1sZHlXU2k0SVNM?=
 =?utf-8?B?UjF5dldCSzhBL241c3AwZ012YVpJVXp2dmNQczJuSlBaVmt2TElJTWFhR2Yv?=
 =?utf-8?B?WUVYUVN1QUtTdWROeFpIRkg0blJYbDNEZzBId0ZsQUNUOUs5bnI5amEwMHVH?=
 =?utf-8?B?elUxRkM2QWkvem1UZE9uUVZnOWt5N3Q0WEtnMS91NHZVODB3UDhVRVpGcWhH?=
 =?utf-8?B?NHNyc0ZqRk1oV0FVQ3dUTk93QzRWM1BkUlBjci9aaktTZXFaT0dKY1ArYkJE?=
 =?utf-8?B?U3dNRDBtTDdCeDdMakhmSk9hVG85SEE5ZGpFTERxNSt0eVlpQnIrK3AyWFNk?=
 =?utf-8?B?bVBXQXh4dm1mNUFoc2Yway8yMDVMQnNSaDFnUHJmeDZ4aitTekptbjlkdlBG?=
 =?utf-8?B?NUo2SlJhcWdvcS9uM1JaK1hUL1JvWGtkQ21RVXNuOEJ6Y0s5KzUwK1Fnd1Zp?=
 =?utf-8?B?c2ZWaHYyMEtPRXJXRTQwc3UzWjRBRTdyeGU5VkJzY0dZWkprV0F4a3p6eVVP?=
 =?utf-8?B?aXFmMW1teTk3NldVYVUxV0dKRW8zMDVDRlM4SjFmMUszdlQySUxkMFVYLzVV?=
 =?utf-8?B?dk91QjFaYjQ4VzczV3ZTRExYTDlVUkxGTkQ5RkhXUHZUNEVzL2t3dHpFaWFT?=
 =?utf-8?B?SmVzbmNEUkwwTE90eC9KR1V6dkVkaFIvMjk2U0h5ejVYODd6Q2tzZzI0N0E2?=
 =?utf-8?B?LzhCcUxqS1hldERrUWkvOXpWZkdiUHY5YTdyckkxTmt3MDZiSlNpbVg1Z1Mv?=
 =?utf-8?B?STlIS09yczl3OHNNYU9EMjlSc1ZlYVN0SzFKb1g1RDFBQldSamV2encvZEdi?=
 =?utf-8?B?cTFDQjhmSU1mVmJUV0EvMTQ5RGNxTFljMU5QUmhvZ2QwV0czS0Z3dWJVQ1RF?=
 =?utf-8?B?d0FpZ3R3LzJiYXRmcDc3S2xyV2tKb3BxNXlsSE5YaVljckVFbG4wQ2hHV3NW?=
 =?utf-8?B?anl2TjRqMmdmTVlERC82WFh2eHg3LzNWTnQ2MjA3ZW14Y2s4akZHMWRsUmJo?=
 =?utf-8?B?NjZSL3hOSjluelJnUURpV0xBUDBqNmhpNXc2SHhqWW0rNkxCRWRwT1VqeXNE?=
 =?utf-8?B?OUdpUUVVc0wwelRHQy91ZE9zOG96VmN6d2NNTHhPWEp0dHdEeGVRYkJWeEZS?=
 =?utf-8?B?b3BuZnMzUE9iSldlazV0Z2pzVlc4elhmenhBM01adURsdnV1YnMyZ2lQSW1H?=
 =?utf-8?B?RGFqcUVRMGZhM3VKYmZQTmR6dkFoRGlvRXo3aXM5Y1NEaHRHYmR2MGtrRmtK?=
 =?utf-8?B?MHE1bEtBZUJ4R2paK2JUQjRKcHJjV01EN0F3VlkzQzVtR0I1aERreGN5aEJo?=
 =?utf-8?B?MmxXbU5pMGVvb0lPYm5qZmlUUVdVaDkxaUtNSGhiMzc3elhuVVMwZFlsZlVx?=
 =?utf-8?B?eCs0SWVnbmFyU1BVT2cxVnJ1MTBGb0VjQWxqSGFLV1duTGY2RHJ5ZXJMVE52?=
 =?utf-8?B?WFFHODRVd0J3cXhxOWsza2NOalNFcC9VVVJVcWpXQzlaZTVNTFFldlU3aDhI?=
 =?utf-8?B?R3VkbkZxM1EyaGpPcjdHMTZJbnNWajJyajlHMkZMSFl1dklWcGdjSDhOb05Q?=
 =?utf-8?B?dDNlOGpmYWRDWVhSeGRJYlYvRDRHUnVGTWdXSTlvaU1iWW1JWUVZc2ZzcTcr?=
 =?utf-8?B?eEJMcTdndzMvdWlKaldjQzJZejY0anlVNlJwOGpsb2w0L1VOWDFUU2pVREFO?=
 =?utf-8?Q?lVa6Vxh18xeiwghoSBzSJ7ueSqVPg5nNb5HGkHd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a1227c-ed96-4243-0162-08d8f40e128f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:27:35.7372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NF05LJoQOAFybIYYyW+5T4KSP2ePEIalAVtiLyRnvQJ5SwdoJ/Uzk/V5IN/0uIDvV/tDdJvRBltozqgXkDHRug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6142
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, s.hauer@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-30 at 11:54 +0200, Robert Foss wrote:
> Hey Liu,
> 
> checkpatch --strict lists some nit and a warning. With those fixed
> feel free to add my r-b.
> 
> On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
> > This patch adds a drm bridge driver for i.MX8qxp LVDS display bridge(LDB)
> > which is officially named as pixel mapper.  The LDB has two channels.
> > Each of them supports up to 24bpp parallel input color format and can map
> > the input to VESA or JEIDA standards.  The two channels cannot be used
> > simultaneously, that is to say, the user should pick one of them to use.
> > Two LDB channels from two LDB instances can work together in LDB split
> > mode to support a dual link LVDS display.  The channel indexes have to be
> > different.  Channel0 outputs odd pixels and channel1 outputs even pixels.
> > This patch supports the LDB single mode and split mode.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > Note that this patch depends on the patch 'phy: Add LVDS configuration options',
> > which has already been sent with the following series to add Mixel combo PHY
> > found in i.MX8qxp:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Farm-kernel%2Fmsg879957.html&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C7c4f1092633c4687fb3108d8f361ddfd%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637526948949839014%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=iNr6RU0xrhcW8epwIPPJDpayjWxfmWsSjCju3XIcmPM%3D&amp;reserved=0
> > 
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * Link with the imx-ldb-helper object. (Robert)
> > * Correspondingly, rename 'imx8qxp-ldb.c' to 'imx8qxp-ldb-drv.c'.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Drop unnecessary DT validation.
> > * Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
> >   get the input remote endpoint in imx8qxp_ldb_set_di_id().
> > * Avoid using companion_port OF node after putting it in
> >   imx8qxp_ldb_parse_dt_companion().
> > * Mention i.MX8qxp LDB official name 'pixel mapper' in the bridge driver
> >   and Kconfig help message.
> > 
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   9 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   3 +
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c | 720 +++++++++++++++++++++++++++
> >  3 files changed, 732 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> > 

[...]

> > +
> > +static int imx8qxp_ldb_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct imx8qxp_ldb *imx8qxp_ldb;
> > +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch;
> > +       struct ldb *ldb;
> > +       struct ldb_channel *ldb_ch;
> > +       int ret, i;
> > +
> > +       imx8qxp_ldb = devm_kzalloc(dev, sizeof(*imx8qxp_ldb), GFP_KERNEL);
> > +       if (!imx8qxp_ldb)
> > +               return -ENOMEM;
> > +
> > +       imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
> > +       if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
> > +               ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev,
> > +                                     "failed to get pixel clock: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
> > +       if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
> > +               ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev,
> > +                                     "failed to get bypass clock: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       imx8qxp_ldb->dev = dev;
> > +
> > +       ldb = &imx8qxp_ldb->base;
> > +       ldb->dev = dev;
> > +       ldb->ctrl_reg = 0xe0;
> > +
> > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
> > +               ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
> > +
> > +       ret = ldb_init_helper(ldb);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (ldb->available_ch_cnt == 0) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
> > +               return 0;
> > +       } else if (ldb->available_ch_cnt > 1) {
> > +               DRM_DEV_ERROR(dev, "invalid available channel number(%u)\n",
> > +                                                       ldb->available_ch_cnt);
> > +               return -ENOTSUPP;
> > +       }
> 
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> #683: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c:625:
> +        return -ENOTSUPP;
> 
> Maybe -EINVAL is a better return value.

Will use -EINVAL in the next version.

Liu Ying


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
