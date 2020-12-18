Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B679C2DDF8E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0588982D;
	Fri, 18 Dec 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A289A16
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 01:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0nhspcRbs/fnR2fRtkmKMqsQjHHu3HGpJm/ZUHOtRG9L9PP/f65sK8JkxEDkuf19o910vIMX9oHVhk3IyOdfedOQYTvSEY8Xfpjbi0LMwVWPOdwxcEKYQI+sz2jfPaZExGLYy3s7sDQIkHTKIWO+Bx9xWrJCT+rERiO4cH4aPF02Tb2QkNjHCQ55LrOAXn6ZAVYqlFrItguQuPXOfapCGyR49kZJb++42GscEnbsWL/POdVbbdU29ygiq6VS9BmU/1HpK7B0+DdvC0M6p+5+Z8voqXq3WN1KZRisKTUDHeJfWOAKxMl58igRIPuvWmFGe8+Krvyl3jM07hkeWSzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnoyM5dGeoAu7/zNTI7TPCY/3SeXr/o4XIuCeW+6AGA=;
 b=CyOgFb2qygcRm83xjlV9ei71VYBNiXJ3WjGHTBQ9hYeKSn0Lf6pO0ZwBsBDfqN93baqiRfP1DWsOLQk73YtOS6jjX9aNtjZXX17fOASXayP8APnmo+Y/XYoP/r+xNtC5hWcLblEB+au+h0HYmh+U3dtxX5rj9YyOpVomfzm3qUMpKdJWYBYK0V/4VuwzRtJc5PAV3Ji300DaW/o2lRk9QoEoSvQotYlqLYbgSQiajAHMvv850sCl+KiTQgjMwsu2WLirw61q4HOLp9cLY4LhkAjiWGckVpr5+smj2181ijx2dCNC2u3L8nW3pVxp+CgwcN60/8YEVCu7GTVQ+QKbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnoyM5dGeoAu7/zNTI7TPCY/3SeXr/o4XIuCeW+6AGA=;
 b=L5ClLqoDCeCWoX4ezY8tJekTWbRLpoznX7FUd4zD7O/1zmaWE4fJ1db7uMMH10nZZ9e7nchmKUgPPlsHLEy13DE2Lgv/9UGecw21j3gfwgKCuyQShKFYZq0O+2XHcBYJh91ABULC6mRoB3OuuMlffk8CZDYxTAGKdhkA9leeW2w=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 01:47:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 01:47:53 +0000
Message-ID: <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 18 Dec 2020 09:45:58 +0800
In-Reply-To: <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 01:47:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4adaa7b7-fba4-43ed-e674-08d8a2f6ef8a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7183C8345990BEBF464A9C2198C30@VI1PR04MB7183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhVuj3XHmQ/0MSFWH58qcCSUWPZeBikBEwwlp8m9Ska5TlV9qLc/O6l18UMs2Myc5wuWm5nlgWKpb8pjarEfTtXUQUCslKpzLBGIN0OlfeImQ4gR+GSlRMlbR5BcnV/xmmRVBHoNdnpJjVM6Zo1Q0jU7yYvC7H2PdGlWIYnCEyNhEy6EjQcAJKiDgIO0mzc/tJFHMsL4mrkCY56Ur/R8RCUkfzqh5y2E/FP7bFzDLQZ8aRuznwbqH7QNhfrtRNkmimIGaxYtW9k52igBu9Zsu+4u8TEcv4cdio77UGxlHbuGE7sJkBgdaIsvwlzeyViKMsVuTZ82LHUaL12OMilMa+OJ4hAS9VFZj/BgF32yEXW7kZFHrdLlOGpOedQAgfYp19KBMnRfwq0eH4J2Cdpja3PDu95V74F45ndiaagKNK0qxovz/xIPmfPcgU5/LuN1YBw9Ub3W06lAqDk3NZo/fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(5660300002)(7416002)(2616005)(86362001)(956004)(6506007)(66946007)(52116002)(478600001)(6666004)(66556008)(966005)(16526019)(66476007)(26005)(316002)(6486002)(2906002)(6916009)(8936002)(83380400001)(8676002)(6512007)(4326008)(4001150100001)(36756003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWhYbml5OXdRYUhCZmRqNU5saC9tNGplRzAvOEVlVzA2bS9EclRlUWI2VEMz?=
 =?utf-8?B?WVl2QUtMTUJmWGtVbVE2bE0xL1FoVlRUaTVrTWN0TkhROXQrakp5UHFJRGlH?=
 =?utf-8?B?eWh4dVB2Wk5PckROUFZudTVJNjlQRXRMTktpcmhLUjlQK0hpZ1RsUnZoVzlR?=
 =?utf-8?B?ZUdidTEvTDNYSmdObml2NC9IaVJtMnZmQ0wydUk5UEllaHNFckx4b1F6QmI5?=
 =?utf-8?B?YzNHS0JuZTZhV2RuTWlPa3pRcEI4S3dFMUlwd2cvOFdjZHloRCtvcUY1Zzly?=
 =?utf-8?B?Ym0xd0RZUjhQYWpwQUNOY0NsSU13U1FQWDJWK0hiSTB5OThnRzZZTWRYQjVT?=
 =?utf-8?B?L0tnYmlrcHhRT0xjUUgyVDg2UUovQ0RGYmZJdkxQMHcwREVwbGJML09aRGdj?=
 =?utf-8?B?K3ZvaW1IYkdyeXNYVmk4SFVYdEhheVJabHVWUHo0Um96L3lQQW9Dbkx2WXlp?=
 =?utf-8?B?T2JMbmNFeEZVQnBCQ0g5TmNEV0FiblJVRnRGNUVNRUE0SFY0eFFHcjdIWVVo?=
 =?utf-8?B?MnVZZmk5aURPU0pFVS8wc1c5VzNzR3Zta0h5N0FyL0ZDeGlLRXpMK2tOVFFX?=
 =?utf-8?B?cGY0UHJWdG9CUFJCdVppR0IvWDdYV0VnUFlHcmp1RWpZemc5bmVwS2tMYXN6?=
 =?utf-8?B?UERNR2w1TVZuWnRXeWF5elI1U3dPajNXOThxL0xWaTZ6NDFIYVRVd3g4eVlJ?=
 =?utf-8?B?anhRKzdhbFNueDZUTVRtVE5JUSs3YXJ3UDJiQ3hkakZydHN1VXdUc3FsM0dt?=
 =?utf-8?B?Q21rMnlINEpYUVY0MW1WUE5KR01VbXp0Mm1HY0RPWlZSeTZEdkRpclBncDFs?=
 =?utf-8?B?ZmpEZGZQaHNCVUdpSUw4WnFnOUxjQkZOK21DOXlZcTl0UHpxaUQzQVkyMkx5?=
 =?utf-8?B?cDNTSzNWdFh5WEJBVVdSTnoyRlV5a3NERWE0S2gwOUg2K2tUMXlXM2JxUmVL?=
 =?utf-8?B?Tk1Jdks3cGtlRnZHQmpYTW9reVkyMndJV1dOUTNxTFdpR3VLVXNTL09UTUlx?=
 =?utf-8?B?WXZFdGVFQjZHcFdud2JidnVSOG13OTJ5TVY0WWM5Z2lFTW9teDh2ejVKWUVh?=
 =?utf-8?B?QzhpL2xpZEhRTVRkeDZDTVhjcStXUytEeVpYeFFtY2VKS1BMVW9iZHpoZEtM?=
 =?utf-8?B?dWMrYU1Gbzc3MEJuSXdsaTd0YWs2eXhyYk1nNW1HWjVuemdHNTMyVGFKVGtN?=
 =?utf-8?B?bUxuQ2VlNXg5MTNRRHJEYTI3MEIrSDRNYXFFK1F3dVY5NWtMTzBGVHU0a0Ey?=
 =?utf-8?B?cmxLbExtN0ZDTlprOCt2dU5XcnJqM25RQ09TRVQ1ZXY0L2FBTVlLVnR2ZVF6?=
 =?utf-8?Q?z3Tib1kf0F1UzBkO4H7DgvwAbc5wPjPylL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 01:47:53.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adaa7b7-fba4-43ed-e674-08d8a2f6ef8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNXWQku3HOAfSdjmr0V1r9t3Oov6ZeAMOlULSzHJSmrkjAxZkNHBvYgtuCefBO9w6fiP1sa/T2BHcabxAkZgWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, linux-imx@nxp.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dts:19:18: fatal error: dt-bindings/clock/imx8-lpcg.h: No such file or directory
>    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1364: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1417599
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.

This series can be applied to linux-next/master branch.
The header file 'imx8-lpcg.h' was added with the below commit on that
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/clock/imx8-lpcg.h?id=540742fb109fa4a65f116db9edc28ab1bd2c872d

With that header file, this patch may pass 'make dt_binding_check'. 

Regards,
Liu Ying

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
