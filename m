Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329D54BF84
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 03:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F5410E246;
	Wed, 15 Jun 2022 01:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B252C10E246
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 01:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrcB3B8JxHAA/t7AfL03k23pGOEjjgTI0L3XnxdYWatoz4g8lPmDDGSPmngtxq+V3dLyJxdjbkMN8tnNDcYfbbeQHtIUpKdypBDPVAt42NQbu1MPonHXVFiRfb1ajwJZzArsmuO+E6VbKq4IdTyQ1HlYDY8xdAVIh4v3dIAsQmUivhmHi+fkoo0YGomnqQ0jjQSfHgcD+6TVk0XcL+chqgFgd1rnFdomIIR6SsYDE6eUT8aUpfvDFw6KW5hEbY/7D3I43gtBREsrTyibf3tFEy7IGZaGUfOksqnMkaexpOtcoWat8oYjor91MvPGCMenaTgFHqQ/7t8EQPnLXVs2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJhU/0hIuuKkaHHJaCcYS9AcsuT+4agfuJ4zoyShUe0=;
 b=i8+zt4inqwi+5SWV1zlSSckPHPZnL7fpHIs2Oh7XvyCtzkYmipAV5d33BKfIHwf+qLX9UIlr8NGK5K1ewaIH9gZZk+Z51Oqs7lPJIBQdNv3begUNlk3SPKeB1+iSuT9o8+gmit79GtvS6JmW7QYyq+uvdkbbYFrPkte+s2wWtToH9JY8sfk6sSHyudRDftJUZz/0qB4KwdDHVVw7KXv+btKncvMx83X5Z0cPpNQhurD+81ltoR+LAqYgcVaEzUmSS0KwrllKqmxDoMZEGXCMeQNRGsDOu554FboiesL1Bb7H7ZJ3Hm4WzaMx8ktagcazHV/RlbJOcU7kwK/Tz0IPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJhU/0hIuuKkaHHJaCcYS9AcsuT+4agfuJ4zoyShUe0=;
 b=bBs3H2OrxrsWyrBwos99NmB+PLD+d3Ba8CpmaPU9xIH7COEpliGHLPq10W9ZuZaMVg7u4zP3NxXH7QhPqXDUfv4VWcjIvJ2slE9Pkvb0uyStmvcLiTlncqUKBnHUugfaFHW8mcPbgMbsGFhpq5YeJOyAZi98w9RogUHao6L9kv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB6280.eurprd04.prod.outlook.com (2603:10a6:20b:71::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 01:56:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.019; Wed, 15 Jun 2022
 01:56:29 +0000
Message-ID: <f56f29bb82be4dcb752cf392a09f8c74db6a9d49.camel@nxp.com>
Subject: Re: [PATCH v9 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 15 Jun 2022 09:56:16 +0800
In-Reply-To: <20220614201146.GA2344044-robh@kernel.org>
References: <20220611141421.718743-1-victor.liu@nxp.com>
 <20220611141421.718743-6-victor.liu@nxp.com>
 <20220614201146.GA2344044-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf527be-4078-4784-b4cd-08da4e72438b
X-MS-TrafficTypeDiagnostic: AM6PR04MB6280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <AM6PR04MB62808F2F19EA42BF0C1A385D98AD9@AM6PR04MB6280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQ0bLN88NbiliUPGxqbikyqVyBgedOi1o862Ehl96wuTKxCwmuqeYuSmCc0jTNEQB5nmmyMzeFlb222TINgeBojz1V/Ri9SOgu5piKJzIz4iuAHcbdW5XyHX16KI5b7/W+gBD2xY28IdWowTcTCZgh4xfny1WACAWHXED4uomD9f9P9O6U5usqTwSCYAwLWJ2Yc3s0KOxE8k3E/PmKaXYj92SP276aif598jS3sb6poB7nrgckCqG1aLPe1cfT5gUkX5/3argBTtXWIuXvNxRDAjOp1qH6pS3qECWm9sOydTVFgMflPx5rF+/xrhclfztoAxnsPkWqn0RmFP6rYe6dB3RN8Zy0RQBdh/hj6RB+LxngzDgvU4J+skI7o4H5NHG5GCuqCCKX6y8JjBbHjxxNygbeTT0EynufCnj6gO6G+yoJ7S1mIxn6AIbCbk+9jDpZ5VkwXkEsb0xYnJRoFUSSmi0ViKgLivR8aTa/Xl5oxDooLmQfpJU8kYjBJ08V4bdio7xfrFO/zFglpLBWbS/XP3IzmRkcOCnlcTdB+NpI7qAPIck3BTg0FmC/QTwF3pLRa2LBkLCPMEXwyEEpirih7fa6CVLkUM5/oqumtFf9jER8hMcGxgjgdx8h5cK6Tnii1Bi556WehzPe19gXm0TPcT5N3AishvvmDuTFKI3CAkGtN6eaoCGpsSz5mleY8rbekEjME7EJjD1pWzvKXMki3CwI4b4Rmbv19pVzJoRNMO+pEHg+xqwQ2LDOEyGZ5nxlTHvCdG36L9rx2IWu1hsnWFRFlln9GWEG1PW4Ue0dDRgvlbJB8o7CJOMPQmq7qxixp+nsHU0alfvkVdIaV8xSi3Hx5BFt9y7Zu+y+usCWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66946007)(66556008)(8676002)(6666004)(2906002)(66476007)(4326008)(38350700002)(86362001)(6916009)(5660300002)(36756003)(7416002)(316002)(26005)(186003)(52116002)(2616005)(966005)(8936002)(83380400001)(6486002)(508600001)(38100700002)(6512007)(45080400002)(6506007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHV5UEJyV2MwRWxQOHZQNE5RTmN0WkhITUpVTDNzbUZmeFlhZWsvK2lhWlM1?=
 =?utf-8?B?K00wWFVmemIydm1LN2Y5aWhkOXNNR3FHL3hkcERZTmRhWC9IY3hDMjhZVlk0?=
 =?utf-8?B?cWY4MkNUWWw3VW9LZm9jTTJTbldnRkUyaDczNDlCdnhKb0NUaHdYdm1raUR1?=
 =?utf-8?B?OUpUMmFkaHRjRWI2dGczUzVJbkZNdTdENTF2azN0bXFWKzZXVXlBWjlOYW1P?=
 =?utf-8?B?ZTdLeWlrNkIxSkQ0Y3lQcjFmc3U4WkVxdlYxd0dNb3B2QWUvOGhFeHMxUGVx?=
 =?utf-8?B?dHRaQ014K0toZjZUTU5zczlyaG1WaUN3eWc3RGI2SGpBRTFrMjB0MmpCdnRJ?=
 =?utf-8?B?M3FLYzcxYVVNYmlyb2RqZ1AzeHBFbmRZSXlGTDhtcnhUSlJsT2t0MlJuT21U?=
 =?utf-8?B?RUF4TmZEdjVBU3JQaW15MkU5V2VyNmU2YkZtWUdNT2VZcmtDeFpMbDc3YThV?=
 =?utf-8?B?L3J0WEM2bFJvaWJPRU80YzBXaldiYjAxT0ZCanFXR21QK1VZZnBaOXBVUHk0?=
 =?utf-8?B?c3RtOE1JY09GYnhlRTRrUDRNOTJ2OWdvYlp2cEZ5R1VwWmJCNGVJVTBNY1RZ?=
 =?utf-8?B?R0hEQ1loc2ErR0M5S2VTUC9EMk9UT3RyWWFPcVhhMnBoNGtMVzVmZlZjTXdR?=
 =?utf-8?B?UnBSblpIZGZ3LzVaRUJ4VTFtZ2JCL2JzQUoyMjZvQ1VxM2NvTFl0Rmpud0xL?=
 =?utf-8?B?ZWhET0wxOElhUjZmK2xTVnlzV0hyTTVQNnZxWVBzQUU2dVV6b0JMREhSWXJJ?=
 =?utf-8?B?SVg2TjNrUWhjaEFYNGMyejMzMGtmR3lqK3pRSy9FQXdxUVMvcWVtYzl2cmky?=
 =?utf-8?B?dGdPK2NlVTVNdU9iT21xaHlMWW80SVNwY0pUTVUxdmZHNWhTOGUwMVpzYnhE?=
 =?utf-8?B?SlZDb1AxVlBheXNnSHE5VW56dG1zR2xXV0RaTFVyMkRabHdVVGY5UWEzZnd5?=
 =?utf-8?B?THhaaXEydldkM21sK0JGSTFDS1RWazlRcHpFT3k2Nk8vcXZCOFJvNXhFWEdu?=
 =?utf-8?B?cU1SRG9HQytja1dFa1Z0ZXNSOGdNZ2lEYWxrZDBaUmZYT3Z3a2RkakdkREgz?=
 =?utf-8?B?UmVLdm56d1JxTzcyaHVtcUNTRHZReHlaYkJkY2lTZHNRVlB4ZWZVMzdBbXJH?=
 =?utf-8?B?WG5pbzNGSmRFTCttekk4TDJ0RGF4RlBDemk2aFZDVkI3clFPeSsrUUJpUXhN?=
 =?utf-8?B?OXJNRzBvdGZMcFY2NHFkMnZxSXBZZzdwMEFQM0pqam5nQ0FhQkFBOVZFZUpE?=
 =?utf-8?B?KzZQdUorTW1RSzZtcWcxRDNBRFNGVTNaYjFsRDZXK0dEd094MVVJWVNGZ3BY?=
 =?utf-8?B?b25raDBrNExYTEprZTBmQ3F4NWR2RkdacFd5UllqbzRaWjlaOHFmck5wRmd2?=
 =?utf-8?B?eUhFNWJOYWUzVFE5NFlzTlFMbnFtcGVtUEY5N3o2QWVtRURGOCtKMlpWSHFq?=
 =?utf-8?B?RXVtYy95SzBtSGtQc2RiTE5kUkgyeUlMU25pRG9KaXIyYytUTW9CdDZYQlJa?=
 =?utf-8?B?UnkyVE4rT1FDR3lUdXY4ODhkdXdWY1hBTVNIRXF6eGFZZ243QXhRZjRNZ3lw?=
 =?utf-8?B?cFdzbm5NdFhRSjJNNFM1NFk1MzRvY2RzV0lYblN6ZVR6R3BneFNvQUVlRjcr?=
 =?utf-8?B?NXJDRmZiTkZQenhaVk56RTJ0bzdENHVvZStYalhiVkVwNDBGR1JkUEhneXNw?=
 =?utf-8?B?Y1NLQnBtVWVXMHRVUG1HaC9TOWpmcWlOdzdJNGl3OWxlTGZjNGRaV1FaOHdD?=
 =?utf-8?B?dVM4aENPWnloV0JVT0NrOUprY2FoWXZZV0NERWx5ZEgvWnpFNXBvQWVlM2F1?=
 =?utf-8?B?ODZBb0Z0ZGxCWEtCZ0dVa2N1eThPNnFqdklFYkEyUm9KL1Zpd2dQK2pnREJK?=
 =?utf-8?B?Z3ZzVHNDa3QyNGg1YTF6Tk1UZytrU2VqNzN2eW9JWGI4OUFXc2lVWURWMnBI?=
 =?utf-8?B?SGNxaDAzalRqQS9Ib1NBdUptZVN2amlLamZVSG5CSWZ1N3J3d1ZTUXBQOUVU?=
 =?utf-8?B?L2ROdGxUcWZLY1dOMGlzOG9Ed0dNNHFyR2lybXdXcUtNV1lXSS9IV2RlU1E4?=
 =?utf-8?B?K2NlaDNsZlRnQVU3eVFyVGN6aUtCNHlJd2Zqa3Awejl6UWo4b2dGTmUyTzF6?=
 =?utf-8?B?RjcvU3p4THc1WHpVQkFsTkRMcGVZTG94SEFHN2RrUTJLQ2VYMkNNcDFKQTNP?=
 =?utf-8?B?UHUvQ0tMQ1B6WkJwWTJiMkgrcER5NkRVZ0JhbXd1VDc5amF2QkNWVjVvQXda?=
 =?utf-8?B?Q3l0ZGpxK0N1aHhFaVE0eU1oQTBIR21uVUlzUndGWXF3aTNOenkyOWFjOVhF?=
 =?utf-8?B?RGxDUlRTTEtXTGc4MGFhTnorYlU4bmJBYXJLNUh6bWJ2SmtnZnNwdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf527be-4078-4784-b4cd-08da4e72438b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 01:56:29.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQGhAfZBxE/Q4WHmx0NT1zzLOTYu8giQn9pLAaeZmPfNeWBwFk/QGTuug/ruH4FO77TuMzdkR+OLsp+jMdExnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6280
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-14 at 14:11 -0600, Rob Herring wrote:
> On Sat, Jun 11, 2022 at 10:14:12PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp display pixel link.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v8->v9:
> > * Add 'fsl,dc-id' and 'fsl,dc-stream-id' properties. (Laurent)
> 
> Why? Isn't the graph sufficient for determining the connections?
> That's 
> what it is for.

'fsl,dc-id' determines the SCU resource IMX_SC_R_DC_{0,1} used by the
pixel link. 'fsl,dc-stream-id' determines the SCU control codes, like
IMX_SC_C_PXL_LINK_MST{1,2}_ADDR.

The pixel combiner stands between the Display Controller(DPU) and the
pixel link. I doubt it'll be good to go through the graph in pixel link
driver to get DPU's output port index to set 'dc-stream-id'. 

The graph doesn't tell 'dc-id' unless DPU's or pixel link's OF alias
ids are used. It looks that people don't like the idea of using the
pixel link's OF alias id in pixel link driver to set 'dc-id'(and 'dc-
stream-id'), just like previous versions do.  

> 
> > * Drop Rob's R-b tag.
> > 
> > v7->v8:
> > * No change.
> > 
> > v6->v7:
> > * No change.
> > 
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Add Rob's R-b tag.
> > 
> > v1->v2:
> > * Use graph schema. (Laurent)
> > * Require all four pixel link output ports. (Laurent)
> > * Mention pixel link is accessed via SCU firmware. (Rob)
> > 
> >  .../bridge/fsl,imx8qxp-pixel-link.yaml        | 144
> > ++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-
> > link.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-link.yaml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-link.yaml
> > new file mode 100644
> > index 000000000000..38ecc7926fad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-link.yaml
> > @@ -0,0 +1,144 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-link.yaml%23&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Cc8ba0853ca6446514fb408da4e421ec0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637908343136669762%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ZLdEqO84HZMwOIjyo5t%2Fy%2BlcfliLr3J5mV2akOxPU5c%3D&amp;reserved=0
> > +$schema: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Cc8ba0853ca6446514fb408da4e421ec0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637908343136669762%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=yL5Xi%2BWz4aX3yniTy8Jq0EhB%2FbLz59QOaCQpxP0AmDM%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Display Pixel Link
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a
> > standard
> > +  asynchronous linkage between pixel sources(display controller or
> > +  camera module) and pixel consumers(imaging or displays).
> > +  It consists of two distinct functions, a pixel transfer function
> > and a
> > +  control interface.  Multiple pixel channels can exist per one
> > control channel.
> > +  This binding documentation is only for pixel links whose pixel
> > sources are
> > +  display controllers.
> > +
> > +  The i.MX8qm/qxp Display Pixel Link is accessed via System
> > Controller Unit(SCU)
> > +  firmware.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-dc-pixel-link
> > +      - fsl,imx8qxp-dc-pixel-link
> > +
> > +  fsl,dc-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      u8 value representing the display controller index that the
> > pixel link
> > +      connects to.
> > +
> > +  fsl,dc-stream-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      u8 value representing the display controller stream index
> > that the pixel
> > +      link connects to.
> > +    enum: [0, 1]
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The pixel link input port node from upstream
> > video source.
> > +
> > +    patternProperties:
> > +      "^port@[1-4]$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The pixel link output port node to downstream
> > bridge.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +      - port@3
> > +      - port@4
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qxp-dc-pixel-link
> > +    then:
> > +      properties:
> > +        fsl,dc-id:
> > +          const: 0
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qm-dc-pixel-link
> > +    then:
> > +      properties:
> > +        fsl,dc-id:
> > +          enum: [0, 1]
> > +
> > +required:
> > +  - compatible
> > +  - fsl,dc-id
> > +  - fsl,dc-stream-id
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dc0-pixel-link0 {
> > +        compatible = "fsl,imx8qxp-dc-pixel-link";
> > +        fsl,dc-id = /bits/ 8 <0>;
> > +        fsl,dc-stream-id = /bits/ 8 <0>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            /* from dc0 pixel combiner channel0 */
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> > +                    remote-endpoint =
> > <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
> 
> Isn't dc0 and link0 here the same information (if you get the port 
> number from the remote end).

The remote end is the pixel combiner's channel@0 port@1.
Then, from the pixel combiner, we can reach DPU's output port.

Granted that dc0 and link0 here is the same information, but it seems
to be hard to get the 'dc-id' and 'dc-stream-id' information in the
pixel link driver.

Do you mean that we can parse the name of
'dcX_pixel_linkY_dc0_pixel_combiner_ch0' directly to get 'X' and 'Y' in
the pixel link driver? How??

Regards,
Liu Ying



