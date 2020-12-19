Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E62DF51E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E5F6E13A;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33989F75
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 04:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru1nm4zP/YeKwqMDiLh0H2vGqqJeVXIXIcRPxK5BAcq+bCujgtr5uwrxi4L5HO8WRRa5dyZQ20Ks1kGTFpyjb642j/lCKxA7yr/6QVPT0Tv6wsGfTuoJq8lxpNSioQ9iDkEKD6esii16r/YUb7fx4zjY4vKy7Kd8OPHANQ535B057ce0o8K0TSr/xFFpvyrO4FdotyF1O1pLhhEi5MNrVKLDOjhCbm/LUD6dfMpQigzAWHIT3h1F9/JaBCyVJlfZ3maeF5+7ktZPoMmClDG11RzUrBEyKkFqHvgXmT8u9un7GIaJlOAfXHPQCF6omZEdpsCHzvDlEqFxgIUVnJEyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8lf+KFk2iMDsxqXO109PDgWq3WcPYa1dlD8eFktwU=;
 b=WuSzpVyOtAu4IohYIEGp8TcQNFQfYZ6gaG5GZwJIU1cj8sTa9oM/lXKfE584ltc9aqP3ioGV9o6j6B8eRH5FNqHJmqsS7o1prlsdmekc8NCEsN/rB6aCJbPeRYNl0zOwTJJh06Oujb94Bn46tJb5Kt4hksM++CAsy4tZZXPTVf9HvEUqQUaXUmj0ummCrotuaqACxT9p7TgVmJvjDRS8Ng8w5hsMz10c0UDfw8ItLfOrrXGoVE9eYsoUDRbfe9jrl0L7YR/8ZUasyZjYTFNh+kC8XegAEoaSmojVlWvyayi5vj49Lz2SoFENZYqsDntDK6vAiB7rJ/hfR0WAor7SuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8lf+KFk2iMDsxqXO109PDgWq3WcPYa1dlD8eFktwU=;
 b=jgHQ5jvqiOXFQs9gra1Mb9fchRuYRyJ8wpchpZizvx1f/3utNDTEPxYf6QLkQZQGtp+y/jw1RvbGgFLBHQm9dtepuI/8nvL/TttAn0utvCMvE8ScUaIobVt3wpFe8dHoqMxbcgcTkz4PjK7kEH2mU2AIG7wRK/2tvDbIohsNZTo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sat, 19 Dec
 2020 04:15:45 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::ed48:b3d6:6399:5899]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::ed48:b3d6:6399:5899%7]) with mapi id 15.20.3654.025; Sat, 19 Dec 2020
 04:15:45 +0000
Message-ID: <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 19 Dec 2020 12:15:10 +0800
In-Reply-To: <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
 <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
 <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-Originating-IP: [116.232.209.249]
X-ClientProxiedBy: HK2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:202::29) To AM6PR04MB3974.eurprd04.prod.outlook.com
 (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vbox (116.232.209.249) by
 HK2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:202::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Sat, 19 Dec 2020 04:15:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b278fb3b-26c2-4676-c5eb-08d8a3d4c1e5
X-MS-TrafficTypeDiagnostic: AM7PR04MB6776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB67764A61A37CB58DA25F0CDF98C20@AM7PR04MB6776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TtJajdfEnS3woZZbB4yOd/AggZD/iOxm4eUB0bF4jQ10nn7c1tf6+rYimz0sfFXkrU779qcB6jUrYxQWsots+6FAeBy/bdF4f1B862P3sjeyCvfRBhiBxtpUaijr9itRtn5hWEl2qT4tpagfUoPD5+a8/UDa0iEEjxKiQ4K4n7TRA5J0FLevHATB2QVQe76udVO9yePFlzIxAcSRjX+OGdMgjdNtBNZGlTkADSHl+z+Mv9ZD8wYitJvL8IW79XMKgmE3nfNmLX4L2FFZWbrX6khb4SAO4ETESBMCBHvBfMGzvcLC4cdDEvxDTfqRQIxv/wNUYJNZB7+OGQYrwtY0PY53or5twzGHUOg8xpem2g4u2knPhbsU9bVYWkUwAJk5ZEbywGXYqNupROrfvoUxji/nBrInO/WJ4pakLMokj9OefBq3IqoG5IvwfEkyjRdL+SU7w3tm2ZADngXnu3Q7VASYUmnH/ewOdrnpvCuQlg/M4I9gjwDlv+83ocGgLMmnQb9WM4vXZKHdacNVffTn+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3974.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(2906002)(4326008)(966005)(45080400002)(6916009)(478600001)(6496006)(316002)(54906003)(4001150100001)(36756003)(186003)(26005)(6666004)(16526019)(66556008)(2616005)(8936002)(52116002)(956004)(83380400001)(6486002)(66946007)(66476007)(86362001)(8676002)(53546011)(5660300002)(7416002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnRBaEVodUtCQ09PZ0VzVE43YXVaRHllTW9hb014UGw5aC9lZWNKcWJNbERI?=
 =?utf-8?B?cnJRZnVxekVRWVlpWlpaS3FkMi9ObVFSMkdvZnV4QW5SaEFiNE5UWFY5b0Fu?=
 =?utf-8?B?bkRDalBMWjdzQmtEdmR5TWJYQS92b1NtTWtqRlFRWWNuOGcvT01iN2tyc2Fx?=
 =?utf-8?B?bE9pUWM0dVdGL3lTSTNyT2lHbkd6L1dHdUhVVGI3RnJsa253dzdnOHZTQito?=
 =?utf-8?B?UDd2VHVSQ1BMN3UwV2RDQklJcEc4d203aW1ZNjBPYmVLd2hGMlJycWpCNFJv?=
 =?utf-8?B?Q3haWHhxU1JFTXpUdENhT3FBcWNPeXRXa09JRVlST0FGeXJpNldyQnMrSjhX?=
 =?utf-8?B?Z2w5S1REMXF5NTlPU09vdFZsVk5HRmdqVDhMZjVoTXUzWlBqNkNyY2JjeWsx?=
 =?utf-8?B?K1BTcVhiNGFveTRYa2s4bHpHNUlOYWFOc2Z3UGM2QkdzQVpoSWdMNWpxalNr?=
 =?utf-8?B?RmRhQksvbGhYditRakZHbVJZdFk4M0tvVjRzM0Z2anBmTDQ1a2ZOZlhrSFoy?=
 =?utf-8?B?a0lha2ROT2JEZWZ1VUlGeWNsVGh6ZGdqU1E2Q1MrclZXTWtJbTlleVJidmxW?=
 =?utf-8?B?eUlxcFQ0MEY0M0t5cExCU1dGeTIzbW9mUWZCeHJuRG5JOEQ3SU5VNWVKNE1q?=
 =?utf-8?B?NG11R09uSkZzekQ1UUFwWGhURUY4dmVvVWR4emRPYlpHd1JQTXVpTnZ2ME9p?=
 =?utf-8?B?UEFJSENML1JETFd5eUVXTFdwM2M5THg5Vk9LVFYxRDRrOU9QVzcyYlZxRGNi?=
 =?utf-8?B?aWdCRllHVkFrZktkMStyMStPSVEzRUN2bVU1YXhXYmtFc2JVY2VVMEYyUmcy?=
 =?utf-8?B?eUdzNlNSeGhjOFozMTFMRlhkcDlYMnJReVZsRFcwbkdFb3h2bk9hdmwrYjFF?=
 =?utf-8?B?YVcyRXJscjhPZ0tJYTJ4djYxTHFtc3FkU1liOEpWMlV6QmluakljNzc1dXhO?=
 =?utf-8?B?MThhQWprY2FTQmd3VFNCVTFpNS9rckdKbnN1NXJDdFlreEZFS3R3Q3dOV3o4?=
 =?utf-8?B?ZDNKbzQyWUlBSUhjVGo5cEZ2SmdhNHlNcVozcFl0TzdvTzlGL1BOaC9aanln?=
 =?utf-8?B?ZHNNdW9BaVprVUpYak9uRU1rRXZWL3ZwVTVQaUw0OW51cGtoc01oWHczM1pw?=
 =?utf-8?B?cWM1K2l6Rjd4RHBwMExiU2V5VTAzOVN3c0lUV3VWcGF4enMrZGdabjdmTU1H?=
 =?utf-8?B?UVkwMmZaOFpUN0lPVGcvM2RyZjFkWHcrTjhvWkQ0ZEhacFc4MWRVVnhmRXNr?=
 =?utf-8?B?aTg1MFdZV1pOL2RtMFZsaGo0eWZqMjliVFczWkY0WEZqOC9LbitQaFVmNTBV?=
 =?utf-8?Q?hlzqj82C2PeQTtvbUfABBigbW2MomKvzlv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 04:15:45.3311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b278fb3b-26c2-4676-c5eb-08d8a3d4c1e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8gczFkG/PgG85cqj+EFqobpxgkdXVYcIK/WFawhI4SlSQ9QagIrsWO9yHPErxXqPRRCrzfzf2RUz903BYR17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod <vkoul@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2020-12-18 at 16:42 -0600, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 7:48 PM Liu Ying <victor.liu@nxp.com> wrote:
> > 
> > Hi,
> > 
> > On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> > > On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > > > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > > > 
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160
> > > > +++++++++++++++++++++
> > > >  1 file changed, 160 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > pixel-combiner.yaml
> > > > 
> > > 
> > > My bot found errors running 'make dt_binding_check' on your
> > > patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > pixel-combiner.example.dts:19:18: fatal error: dt-
> > > bindings/clock/imx8-lpcg.h: No such file or directory
> > >    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
> > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[1]: *** [scripts/Makefile.lib:342:
> > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > pixel-combiner.example.dt.yaml] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [Makefile:1364: dt_binding_check] Error 2
> > > 
> > > See 
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F1417599&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C96806e0ce6bc40c936fa08d8a3a64551%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637439281816690986%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Cjyszb0alRE5z2OGKdZZEg5PQpH11U%2BGqVt6couCLGE%3D&amp;reserved=0
> > > 
> > > This check can fail if there are any dependencies. The base for a
> > > patch
> > > series is generally the most recent rc1.
> > 
> > This series can be applied to linux-next/master branch.
> 
> I can't know that to apply and run checks automatically. I guessed
> that reviewing this before sending, but I want it abundantly clear
> what the result of applying this might be and it wasn't mentioned in
> this patch.
> 
> Plus linux-next is a base no one can apply patches to, so should you
> be sending patches based on it? It's also the merge window, so maybe

I sent this series based on drm-misc-next.  This series is applicable
to linux-next/master, and may pass 'make dt_binding_check' there.

I'll mention dependencies in the future where similar situations
appear. Thanks.

BTW, does it make sense for the bot to additionaly try linux-next if
needed?  Maybe, that'll be helpful?

Regards,
Liu Ying

> wait until rc1 when your dependency is in and the patch can actually
> be applied. Also, the drm-misc folks will still need to know they
> need
> to merge rc1 in before this is applied.
> 
> Rob

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
