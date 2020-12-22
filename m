Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E72E07FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2554D6E85C;
	Tue, 22 Dec 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20054.outbound.protection.outlook.com [40.107.2.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CA36E054
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 02:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jadeX7tFiyFo5BW3qJDF97o91/jW6gPpSXQ1tumCL5dPWfVsgIoUIno7DKnBiWHx/4vgXHMoP9Xq0OUiJxSfwPM0wmr+auAms1HKVnzBXWwRu2HRNJufJlU/Lf8Kimc4QddqilQqRzzh7ticXZzjpGUhh6gGjG2UOPFtrE8Cqpm5402vrNpEGM+wjsUr6QrDzD6c8CjXYGo70q5Fg5O/Rbjv+Vrm/FvYhILwiFzKFn5IbSLxD5as+b0cfBmg5x/vk25+ANhF5GA2S2535P/72wdh9+4xw/A/FTFgvas7cqoeCTyNWkwuQ05zvDaYpI3hcknOFqnfBZncpLcabR7g/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vggVu17d3YBYzCc+Tjj3SQjEOIj6DxkU3khCmKOrjps=;
 b=KDXdV2SK1V9Z4GI/cQbnZC5oHMlGSnx5/3Qufdc7eWQy8l9zvJXVDKwpeNjrHaoRN/0hOHfq9fHjWmc3PnvHl3WJ4sCp/nqbMFq8DKwWoAok13rKLEQooTCmCHkxA8g6f2TUWNWnWcv2OIbuZpVrXf6QDW6He1rJKzd1l6GZqmfDtJCuKA5e497igIUzmSxRmepqJfmrp5VJUa59hxz+zWJ03wWXyo99WQzfN27axY8oSpb5ULuNn0MGCmWsaR/oo+l/MHoZ09g9L0xf/3Br1dns8d2H25NvWMBV9Tqirduraici/XSKIAxn2xZpkucKSvxaMuObMyWbFTYsGq6HLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vggVu17d3YBYzCc+Tjj3SQjEOIj6DxkU3khCmKOrjps=;
 b=d9UjjSPv2KbgDDuw6fh51ZwT0fVzKtIPyWEDPeqWxar4yV6EOyISeQkUfbE0rR/uZkiasS8qYEbHrNVJVGdgsc9StEnMdg9Dysb2PzdWhkCowtepVYi7q6GlGEfOhvpKP/JXdO7AEoe8Q58bMTQRONyZB45wKXccMkjldp5qBIY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 02:45:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 02:45:53 +0000
Message-ID: <885f512c730f0b40e53cddc1e8cc82272b412642.camel@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Dec 2020 10:44:00 +0800
In-Reply-To: <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
 <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
 <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
 <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
 <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:4:7c::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0106.apcprd03.prod.outlook.com (2603:1096:4:7c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.19 via Frontend Transport; Tue, 22 Dec 2020 02:45:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5816d48-e304-440f-dded-08d8a623b2fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61443183DCBE7ACC045D95BB98DF0@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enVjvhm163sfAxOkt3pskL7p/kzzOMnvR5hOUuP0qiciakrMJHSZHhmqfZOdEWPgz4wh+GiFffdOOCCszbKNG2phJoGa1d8LW60WVaB2QM+5NQM23/Fb53DD4dEMKqMbeWqDufG9Bf0RtVIgP2823mNYivQlzGp7SB/iCKDmHZYkwbiNYhmpn2xNVoSf6bNU88Xt6iTGRPdfUckTmda7H1+yHtjjYg8Ntk3icOlpft2MmA+qKyp3LVxA6hMZ0/9FkEkbUoUVsbUd91OJ/Nh0PY8B37phivFVJQbHVDWhpeMSvaZHg89t5x4rL0vRndNTZ4JLsgdvYEF5SkSKTYMq1mlBSfqAdWUMP0gz7PzmlR3/Q3e2Rtw3Xcmul0buJ5OOiodGh3LAbbJFA6wgCi+G7PXfa+McjuPwLGKkDfpAvpIOFJpSvg4qSX5Ls2GmKeoM18aYVTxX2lgELjFm4Uiing==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6506007)(36756003)(8936002)(16526019)(52116002)(53546011)(66476007)(66556008)(478600001)(7416002)(8676002)(66946007)(966005)(186003)(6666004)(4326008)(6486002)(6916009)(2906002)(45080400002)(83380400001)(86362001)(6512007)(5660300002)(316002)(956004)(4001150100001)(26005)(2616005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHM0YjVUR0NFNmFBWldnRWNTb1NBVXJLbHoyVVg3WnNhQ1MvM0ZIbGl2UFdF?=
 =?utf-8?B?UG1kdnNNR1ZCMXJBNzlnWU0zVWgrbUIwMndWVkJkbFF6TTBjOEowQW5OSjVz?=
 =?utf-8?B?djNic2xuK0ExU2tiQnJ5alFlL3R6VG03eGJRd2Q5clhiN2RNU1BpcGk3VWxU?=
 =?utf-8?B?YXdDMXA0SXBLeGppck9lQWZyNTN6aUwrOHYwTjNiajdZcFlmNWJpV2hxdW84?=
 =?utf-8?B?NmtiT3lTL09YSldCNnpDRVQ0K0x3OEd6dGdHdldzTHJTSFlsKzg3UXNhVUdu?=
 =?utf-8?B?aHhmcUpkUHNZTVJ5eU5ueGFiNnBwd0lFbVVrbGtuVVpkbDFnVlpkenNiZllD?=
 =?utf-8?B?eUZxQm55NUdDK2pBdUpmR1VTWGQxcE1mSzNCUkkxQVpxVjE3Sm5ZTnczYVFr?=
 =?utf-8?B?TFdQZCtZY3R6cm1LVmNzRjNIUTVBWWRNZU8wNG9Cc244L2tBYmFrRjFiTi9y?=
 =?utf-8?B?L0lPcUdiSC8xNE81VzhLaEZSUWcvZzh0VUJvdUs3ajdQZE15UVdReUFBM1NB?=
 =?utf-8?B?dFpVa1JnbWVwR2VkWjk0bEUxZnJmakhpTzNHWmJ1YURFcXZhdDgrZk9IckpL?=
 =?utf-8?B?UmtNaThRRlRIV1Z4T3FmSXFCSDBoRXcyalNBaGs3blhGNTkzSmlmcTR5RTF3?=
 =?utf-8?B?SGhZUW91eUxxMUxwUXpTby92cGxReEhJWTZCbTZQSEJWMXVPbW5rT0hMalJV?=
 =?utf-8?B?U2gwY2NhNzNBanhvMlVHV0h3N203ZDA5OXE3TW8rOW1FUWF5M0NZOXp3QldN?=
 =?utf-8?B?RkgzMUd0Z0o0NTJlLytieEkvYU93SjYvNmJOK0sybjdpN1RKYXNqaUlrUi9M?=
 =?utf-8?B?MnRlcWtwb2VVSVIxU0xrdzFZbXBnM2xqeHJaTEM5aHJtdk5Nb3B5ZlhSYnRL?=
 =?utf-8?B?TU1LRjNvZDV5OHdUYUxDTm9kUkhiUERLaytNc2dKU0EwRGVuSlU2TFpIY3hS?=
 =?utf-8?B?cXVFaE9na2hNUVUvNTJsbXQxSkxmWkFrcW9aeHBpVFpQWTBkVlZUdjB0Szg5?=
 =?utf-8?B?bExoU3hiQ0piRDJaSU96amt4aFp1NmQ3b0l6UWZ4WHZmV1FIM1l4OVlwZTBv?=
 =?utf-8?B?UnF6K09FWmhqdE50NlFRbTBEZXliR2RWdnhabmlzc0JZaTJnaHM5L2gwelV2?=
 =?utf-8?B?OXNzWnJ3RDBSMFN3N25hRXdxaGRPV1M0eU8xb2tQOVNzMEtSVy9JcHlML0NV?=
 =?utf-8?B?NXhaK1Y0STRiWU9EWGtZZnZmQk12d3hLQ0tJWmcwNjFzQlQvNzZFaDFkbTVY?=
 =?utf-8?B?TnMwTUlJS1l5akJlRUVudmIwa2c2NlBTT3dXbUY3T0VpOEdiVUZ4NnA2SGMv?=
 =?utf-8?Q?b5bd3S1KVSH50A/5qxKbkNkJ/zRgNYSbrz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 02:45:52.9599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: e5816d48-e304-440f-dded-08d8a623b2fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8js8v/ItQmdaMWz57ypZZ942IWxKAW8DJUztc/Dgl2IYcFup4afbuLyalUoG22XO4cwVfiC4mJnmlnNUjRO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:47 +0000
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

On Mon, 2020-12-21 at 10:02 -0700, Rob Herring wrote:
> On Fri, Dec 18, 2020 at 9:15 PM Liu Ying <victor.liu@nxp.com> wrote:
> > Hi,
> > 
> > On Fri, 2020-12-18 at 16:42 -0600, Rob Herring wrote:
> > > On Thu, Dec 17, 2020 at 7:48 PM Liu Ying <victor.liu@nxp.com> wrote:
> > > > Hi,
> > > > 
> > > > On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> > > > > On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > > > > > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > > > > > 
> > > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > > ---
> > > > > >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160
> > > > > > +++++++++++++++++++++
> > > > > >  1 file changed, 160 insertions(+)
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > > > pixel-combiner.yaml
> > > > > > 
> > > > > 
> > > > > My bot found errors running 'make dt_binding_check' on your
> > > > > patch:
> > > > > 
> > > > > yamllint warnings/errors:
> > > > > 
> > > > > dtschema/dtc warnings/errors:
> > > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > > pixel-combiner.example.dts:19:18: fatal error: dt-
> > > > > bindings/clock/imx8-lpcg.h: No such file or directory
> > > > >    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
> > > > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > compilation terminated.
> > > > > make[1]: *** [scripts/Makefile.lib:342:
> > > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > > pixel-combiner.example.dt.yaml] Error 1
> > > > > make[1]: *** Waiting for unfinished jobs....
> > > > > make: *** [Makefile:1364: dt_binding_check] Error 2
> > > > > 
> > > > > See
> > > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F1417599&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C7cd8e43f582b48535f8f08d8a5d235eb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441669585674325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2BWYPU1JU4sLsE8ULeoAKvaEUBqHQAPyuydkA50%2Ffjvs%3D&amp;reserved=0
> > > > > 
> > > > > This check can fail if there are any dependencies. The base for a
> > > > > patch
> > > > > series is generally the most recent rc1.
> > > > 
> > > > This series can be applied to linux-next/master branch.
> > > 
> > > I can't know that to apply and run checks automatically. I guessed
> > > that reviewing this before sending, but I want it abundantly clear
> > > what the result of applying this might be and it wasn't mentioned in
> > > this patch.
> > > 
> > > Plus linux-next is a base no one can apply patches to, so should you
> > > be sending patches based on it? It's also the merge window, so maybe
> > 
> > I sent this series based on drm-misc-next.  This series is applicable
> > to linux-next/master, and may pass 'make dt_binding_check' there.
> 
> But to be clear, 'make dt_binding_check' would fail on drm-misc-next
> until 5.11-rc1 is merged in. The drm-misc maintainers need to know
> that.

Ok, will mention the dependency.  Thanks.

> 
> 
> > I'll mention dependencies in the future where similar situations
> > appear. Thanks.
> > 
> > BTW, does it make sense for the bot to additionaly try linux-next if
> > needed?  Maybe, that'll be helpful?
> 
> Sure, and when I've got nothing else to do maybe I'll do that. Though
> maintainers still need to know what the dependencies are. The real
> solution here is to make 'base-commit' tags more common or required so
> that neither scripts/bots nor humans have to guess what the base is.

Yeah, 'base-commit' is good, but a base commit should be 'well-known'
as doc[1] indicates, otherwise, it is likely unfound.  So, it seems
that linux-next is worthy of a try.

[1] https://git-scm.com/docs/git-format-patch

Regards,
Liu Ying

> 
> Rob

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
