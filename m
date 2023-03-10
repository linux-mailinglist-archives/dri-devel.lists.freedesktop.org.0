Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC56B34AE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 04:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D208F10E930;
	Fri, 10 Mar 2023 03:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6310E930
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 03:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWijqVnflaMEAQLLkzUCAANTpOchOZQzQ3+yvuvREYcbLwgeYgsDZ9zJ6QwJh7TgOxwfQZ28CaAHAADRn0ymAH6Ajo1FABE4Umgz3ePf03reF+btXUCiYUwHBPg6SoNXho7K06+mhEagx3JSw65YrZJH5MGZjkgFAuRj26hrOqjKW8tuwiD/Px73fzhDcdrhUF4CQOixzw944vTNxSlXupMrWy/rrh4ZICWTdE+qcISf1p1hU0fyuJFL71Sr/b9+O36FA4S1cQr00/lXnIEQQ1Os8yQGSTdACZhQpNjG7XWUwJN5y65r4Y0DbYMrH0ZTOdt5m1aTl47lWM2BdJ0vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7yH4C3XMeeaCqp0mdVWS1m/sRhKph1tbMUF6m3X5ZU=;
 b=SvhWUZkhCizQ6nuncGpqdQjfigPlBNZywa5MmsIY/nRioBKpwejhHzgthEpTAiLJuB9nxelJL3Nd6xPA3N81/zFQdzW2/19K0DnZIfwyJAP03tuLgRuXtd0YvFug1PznTDfAdqUwKmf1PXTC4aliwqiATdarTRmtQe80yJzV2FzoFPKXoqzBUSPJmDgPcIP+ii1QALFB6Cp1vawjqtDQhL4nX/yWNrjzShlHLK8eQmc59Apy9KTZk7DkOZf0Fcz0SY/nb5+TpPccl6mL3Pg6h0Z+n+pbVYQUXoTDnB3Cgc49lgpyMTrUwy5G6KbduG9ERixQZrjOtsUabJ/ouagk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7yH4C3XMeeaCqp0mdVWS1m/sRhKph1tbMUF6m3X5ZU=;
 b=nlSmveiKu/TVl20NXSyBDornsUawC9Qdcp4rYdcaEXZeyiH6jrkAhhHwtwE26wzp4rwCAfgD0kJfQCqIBFLy43okqJJ8o7DTs9iXWTvRErxUN8247Fxu/A4npLO+iHIukkl6oENPamO75ypeLtv4H/MV+nZ5mIuBBrVsF9hwVOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 03:19:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2%8]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 03:19:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: Fix returned array size name for
 atomic_get_input_bus_fmts kdoc
Date: Fri, 10 Mar 2023 11:24:17 +0800
Message-Id: <20230310032417.1170476-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: acf88056-ac3e-41e4-5662-08db21163f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjz8O5jrS8+IJTZ6nWW0T8NjkCXbImHbOGqvmPd+6rGXZ0tGf1N7UYLA7jrNhhjmpRcRI7bteHRW6FxJpsb1Ewgt9RiOfqXzfPqlKAyEgIT8ef85DtlgFI+AEAtJJOC+tAmZUK9UGkFPTFqkISpKC0b2b5Ip4U2yt0GNewYIngkKs7TzPbujohjtsCvQib6C274ZI5bjqVk44IUQpCPP3GaeT9P7F4r2iK/HKco+zMMXTYh3s/MkROojkzvlJvg67rvz+YQQ0dsdNsTw/MMhSlIAol49QGcjCP0rLgp2+09akQVWAMddUXyehkEN0q/zyFWGMj1Slu7A5mAssDQBiMt83yvJj9SmPYR0KWKy6XV+ILVUddmdk+OpZaB88ljf7j/EmbrGkbKe2qJI7lu9q8+/jXEoWmXPQkuCrakwjPIq81cu2ZcFBzJfHa67rOT6y3OIxuQ7pc4SWZ5ZV/1AhkJ17bifvswm4UTj+dRO7lrSXS4n9qtA6a6Nhd7zwkqdYCX3WYxO+tL3jdY1nWe3fR+blSoK6941eDuHFyPgvzqYXu3TFMD5Dbo/myTYJOIBCCcwi4iKXPxHyXvwKLotZaeUQgZUfOeIq2FNohRIdmefRozaJX4WHtkssRbvrKPnZ2ZRj3R57QYSnxpJ9gTy1aKHvxdnQdtfkz3HaNRghglkpqAMlFvTnUjsCK2zHYBmY+3ZMDcPBFnDE5mt7uRgrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199018)(36756003)(316002)(38100700002)(6486002)(52116002)(8936002)(5660300002)(6916009)(2906002)(66476007)(4326008)(8676002)(66946007)(66556008)(41300700001)(86362001)(186003)(478600001)(38350700002)(2616005)(1076003)(6506007)(6512007)(6666004)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jsksaLfnu3UEedJpqd5PjZ1vltSxLnwWDuQh5vgZJXLeJ1q4VT40AxzaSRog?=
 =?us-ascii?Q?k2qfL7uhBa1SyN91xCRr02Me0rabL60X6hIPuZAGlHypTITNXafncWRm8EBU?=
 =?us-ascii?Q?eYYUZhzGazWznQs1z7MrfJnjkeqMWAKBUVgZtQ6IFE4G6Rr17tUchQJDsdTk?=
 =?us-ascii?Q?usWyuLIFLNRjrhuAFhvlqXmE6Va1oJUECWSP2KMo14c1Y1eLf0En3Cz3eUeg?=
 =?us-ascii?Q?rRjksmuGzqZwrTiWHFPoNugxhGUtVhuM03uFWej+gM/sQF63tRHwjZXpplpF?=
 =?us-ascii?Q?/bmMhdOcvIJhFCmu6+vUpoBvx0pCpr7BqPrvY0+gJ82bWYa2wuy6cEzpBMSX?=
 =?us-ascii?Q?nt7sM5rdRR9/+fYTTD4Pgu+J91vHGMXs622DAJMtqqZmokhESKkOL4ch1vlS?=
 =?us-ascii?Q?eIFfNorvKv0n2dIJCaMVoGVmSX0sFt9b8fU3Rub+YA+e92CjqFX0qOLtPC5S?=
 =?us-ascii?Q?d7Zhk+4G8+ovqMxmQBzUBh2PS7tRkf9QqSgoOTL3YceqLAwa85DyKNa/VK6B?=
 =?us-ascii?Q?JL9eSMckblpMyRgODp1KkVPrpv2iZIS7Xq1DpM89tBv3rRsfWY1dN939RIkJ?=
 =?us-ascii?Q?INxrYAFmF+o4CKIXUtWkETXlec3640OOLaw9dOAwFqUK/R+8GOLJ4cLnYvCK?=
 =?us-ascii?Q?2/QNMitt4syz4lCYyrPy9WnWX95lklNqhRq62wkXSKFjv4d7OaGbZp6KoHGk?=
 =?us-ascii?Q?2DRHWtLv7bxeV8S37uxRZ6wRZVJqtQVI4gY7NP3eiPNWsva/UFgR/mHii1XB?=
 =?us-ascii?Q?R62BLzHAB60RECmZC9itTt7ny4a02KiiZuj3Wfvzi9RF+c9yUrRlzpXLPWfj?=
 =?us-ascii?Q?hTviwAFSdhq1E9GQL0UJ1HD/LWpqQz0q49bR2Qp20XM+cSbjuLbR4Ci+Cg82?=
 =?us-ascii?Q?Yh0Wm0w2Rl56AQNvqaBW9vbKQU+BUYQtvkFvaufGit10TGT9mUSY6JQ4QJJ7?=
 =?us-ascii?Q?1nKWX8CUrWiEKaxo5M0gAMDXapjMgxfpTvLdqCU28YuF5YC74ffdy/PTOK/5?=
 =?us-ascii?Q?dERb7QgJ/0RAwTUFL8KLH7no4FfnU5w2grJcSZFh243eRaPcgN4/Ejhw7/eS?=
 =?us-ascii?Q?dZgq7MDJq6cq55neaFSzen6x1viPGhtwwP9uTboP9zytNNnzwk+tzF/wXONr?=
 =?us-ascii?Q?YDk9Cq+jpnu2wncePOPKFISRSZ7j+SWeDt+1KPbjnOwxYLF4yBcl949UviRv?=
 =?us-ascii?Q?/N8EqnfDhfBNpzmPqigUOHUQUkW2cpd0AT2fywXqXSS5PpZIojW7bYwpXsAL?=
 =?us-ascii?Q?fRmtmQBzEhDT4+KJgNLsmKspLX+P09FeVvjQiwhKAZvo5kKP2pnJ06a3m8L+?=
 =?us-ascii?Q?jlSuKGbY/bFS09z6ekN+sKlme8raAHRrDcqhOYxXQPvjVoJwb1eU8j9O7cXN?=
 =?us-ascii?Q?RTwnto3hpoJXo/2zZPXHEaQO08ZB704JrYqT/cE2UvBVddKGvYqAXo85+Wju?=
 =?us-ascii?Q?3CyvTHGg1QOB/I2IXmNyWsCsY/WusxWATvkZwZEhaoxkzL+OQAf1zYxnF0fP?=
 =?us-ascii?Q?rHwYSmY++okFspMPjCcIUCD7SjVoL4WmjqQDPiQJpYC3GYUnVQJcyNdQWb0Q?=
 =?us-ascii?Q?c0YgrtYlN9sWGg1/9FKN4NBxtq6W/arciM/Q0Yut?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf88056-ac3e-41e4-5662-08db21163f71
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 03:19:24.2321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F8hD1pVzl0pXOkM3i7+fz1ZMpmGW+UdTXvXj5CRJ3s0gz2mvZqnhOz3lCNMrQVMYa+/6vj6C27rMHoDHCWQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The returned array size for input formats is set through
atomic_get_input_bus_fmts()'s 'num_input_fmts' argument, so use
'num_input_fmts' to represent the array size in the function's kdoc,
not 'num_output_fmts'.

Fixes: ("91ea83306bfa drm/bridge: Fix the bridge kernel doc")
Fixes: ("f32df58acc68 drm/bridge: Add the necessary bits to support bus format negotiation")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 include/drm/drm_bridge.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6b65b0dfb4fb..288c6feda5de 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -447,11 +447,11 @@ struct drm_bridge_funcs {
 	 *
 	 * The returned array must be allocated with kmalloc() and will be
 	 * freed by the caller. If the allocation fails, NULL should be
-	 * returned. num_output_fmts must be set to the returned array size.
+	 * returned. num_input_fmts must be set to the returned array size.
 	 * Formats listed in the returned array should be listed in decreasing
 	 * preference order (the core will try all formats until it finds one
 	 * that works). When the format is not supported NULL should be
-	 * returned and num_output_fmts should be set to 0.
+	 * returned and num_input_fmts should be set to 0.
 	 *
 	 * This method is called on all elements of the bridge chain as part of
 	 * the bus format negotiation process that happens in
-- 
2.37.1

