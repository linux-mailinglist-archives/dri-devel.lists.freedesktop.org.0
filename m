Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHi4EBcCp2k7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:45:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE11F2E0B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E110E834;
	Tue,  3 Mar 2026 15:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jtEuK9gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12B310E834
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/8hpFYEeW562tn1yPHq7jk3N1WxtZGyak6mcwyzKLzRP6v680WXwmexN9/9f00sOs8E2PVAAi2U3AzZY2smWxTEZXwx8c2GTaSW4E1JibYnNQumFtoJsDNwPwlH0FMJfZATObPdX0MZxDCRUpTcsLZRhHkzmZI8WsXG5N5wJ8qEgX6Qcnnao7FELlvX6r0rRjr8PYEZmV9TcSCZS67j4Y9oycTnLtsRy80ce5EhSmJ3mFoH2cUYTLHeFP7oKTtMmLQp18XnU3HzFgz7U4qGS9R+5mEV9tSN56DmBTPdqKA6NqBBOEumWLTPqCiq8CpAPCmD34Qrr3qUnzC43/IvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtM2QplO+vl5viYUDdbza0mOYEyr7pEenNEHjQ9mc+A=;
 b=S0tINUCGZwSZDJqLVto+Aa8+YmjtBBShev2Vs/koaCWbf1f2BRolWYziLyy0IC1JAmHJiIds+W55OO1YSoXBnuddTm1xq0p657Kx2Sfi3DA8zwpAHPj7C9igiJozS7lHXTx40w6gk6OBqBTF/KOfcuI4vicDvYSNPyxFCPHnc7yQSM6+X+dwZoMDzTF1d8A4ibA0FaT+76nR48FlTtMYwcDDtsl2oij7ugqe4yLoaxLg8P+oDNAU4MkSTOmhsuylr3RkDATC0wKdSnM/oZgd/jOOCSvJRtEkO03o0jSld69r+EU3Sh0DjaeuZecaLk93Hz0P3H9UJ2+osbACecyfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtM2QplO+vl5viYUDdbza0mOYEyr7pEenNEHjQ9mc+A=;
 b=jtEuK9gi7/hoG5RZTrz5O7kQ7eCOdWtXBKm61Jou99xXPhuRfYP39ttc6Km9WznzUUZ+CeQ7TM6MYOQSjy48F4NOZ1ua0y9D68YBj45WctTa1gbiqbfjgqgeQg3O5nA/B+X/0ikyPqrCdZshnBvaz6Mry8P52hJh07xvR7W9X0XC8J8aaYXy0O4m9nd0SgIhflC+/nXIxpgFluj0UZ+TLC7rmq6vDsllXCtEQKQu5peeuJbNzTfxFeG6FiUzZk1OOX0z4tO8eSpN6mWARt8f2PocKnk5PsqEPFsAbcMG+xkBQcAiwLqdjrB+fPbYZD4A2iARl6SXC9IFHRRNPn82SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:45:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:45:18 +0000
Date: Tue, 3 Mar 2026 10:45:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 3/3] arm64: dts: imx93: Add parallel display output
 nodes
Message-ID: <aacCBGRAd6JbktHU@lizhi-Precision-Tower-5810>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-3-1b03733c8461@pengutronix.de>
 <tyqgkbmkmenkdqdptb3baeizmvsdoyfjnaudlpb4jnz4py7cpb@oy64pijka2yz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tyqgkbmkmenkdqdptb3baeizmvsdoyfjnaudlpb4jnz4py7cpb@oy64pijka2yz>
X-ClientProxiedBy: PH8PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 93eee611-899e-4a41-9db4-08de793bde8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: oXBuikVTexvvQQCmZNl8+dxfde8thz+1N58dGcE8LRi1x8T8l1o8TR2MHwFGK9KBDvwLfRlQoBU5ULh+20wehp6x0amPWLc4ikbPZLwl4MV3yCzE5zHFfeUusnG0erHGXCD7mwCxZwgWKZwbgcsadCs3kFic9RkMkPHnIZ5esFLe62cZ7YPoc9E1UTzPbypjBZsann55PT0DuuswAIUDQ0EV/WAwpUyLWebmN+t99988jmOhd0N43ihJCGeiMdC69HLNeLc0+eWTp5ysf1VOvuQR2ZLqHErFQTCQJT9Q1pf2HNcOEUykz0m+zrVUDfJN6bPAq65Zz3KdKjeQPGrxBLvuSipGiXsAe0Zc7jpSV4aTk5qTBI38jEcz6BAwzN+KyA3MvP+h0VFph/NgihgIADoIfuRxlqcfmC9pENPIln7eeVMfR+kYyy0wnSbs/L3KIo9ASS8eRzca/mQbNkL00CBiTf2jPbso1RUgAtcikdPJsCaxiI33ihMThI7YI0jr9jklslUSx2809Sy1narlJ5AP03JU5LTBSP9kBVq78GB+JHkbu8Bbreq/w5ivwTw0D21mTSzUQM4cpALWIIqtiOxrqa5yrs77IaQuDes1BYY6qmFRA0pfYSKBaQwfKszdLQpPneqZI52j+IPWBugdQlRjtpQYdCgysYy4Jc+tLR689C6DPKSOZ4L4Ad8MegMlxBTGcEnJF9+GPknwykz18XwmSZH55cOewnL1GNJt+Os=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qzLW1lIFZubL9fI7XhVY1FkHbOMn2SM9d5BEs8azlo0zqZ2NuGv0JmS0pJ/?=
 =?us-ascii?Q?m4hHSGRbhpfmeX2/l3lq1adUqJfLzMiub7iDaAKT5H0EpwQQdrD1Y5j12RwB?=
 =?us-ascii?Q?r0wCkJIJSZtRFivOm+XlR0I1G4kEoc6OJzC255sCz8LEE1C5t6DGFpEmVNlf?=
 =?us-ascii?Q?y3bYbGMP8sR+pQAS8S+7bgfnpWkJNFun/hQwUOPYte2iotgLdk4cDSHmU8UP?=
 =?us-ascii?Q?Ru5Wwtd2QrWCkTXzji9tEMwaVihgvceHvUUNXK9Hvx1c3gNtb/q2y+AUFdWq?=
 =?us-ascii?Q?ELGFvuXclpdNIoZiVWYzG8UDrmb9NWi75ItbAdV5+WQB6rhivHyaZZZEA1G0?=
 =?us-ascii?Q?NhlsyVPpsWLMju4l91oJyLhmIxkKrHVT6GDzjiCTpwvRgVHU4MBwnCO1bR1o?=
 =?us-ascii?Q?5WSy/OMSIyWXdFEow5WMxdAwQJOjLSMSuSx8N3nBOXR3Sygf2blCzlo1/v/r?=
 =?us-ascii?Q?KO8zDXFuDrKK3Xc0wdxdZl0AYsmYbCWWltSNmAqVe7jDIehqfMMDEL9tVFHF?=
 =?us-ascii?Q?g+o4AO0LEG06rqXju0JoRc4cEV7oXxPxDWVHXkD4zk6CUgKh5VsRGigupszP?=
 =?us-ascii?Q?wgERSbhu6/YTSFrLUUyM0mwwNb6X8ta/WeD8/nne/qw8TAlZFiibnH9SY47O?=
 =?us-ascii?Q?LGx38A/e/39UEFFLEqUp21qhCWrBdzSdcE4SBRfAqi7jHZXod7cd2wYR311x?=
 =?us-ascii?Q?O8FAIyE0L7RlkFWDCJLQpONSVMPshlgyG0WTg/NKGuF2w5V7Wpi34esDeBZI?=
 =?us-ascii?Q?+HG8hug4YEBbpuEVhhNOp8k2Z6gmBifAVGZ6VeKLbbGjcjM+k4hp15hl5UA/?=
 =?us-ascii?Q?4Cgx/2EPS0kSEn2In0SbukYeqKMMUcZop9NNz7pVhUYsLuUcJ0DX+1PMo02c?=
 =?us-ascii?Q?nQDzE+i+7SHS1RbfhD8FbzafZweuFuQnohCqIdqRafIkD1bVfqU93tZrdpAU?=
 =?us-ascii?Q?LH9J8z7Kp3Iw/ClHdWRzY8I1ZY3XV0A0+HwkKIPk2MYjlOBlKAm2JMxRLcRI?=
 =?us-ascii?Q?9uTifnwBlt1FMpyQHghRvEzwTD+P9Lja05tQoTzictFEUlwbkdEQAtePMdL9?=
 =?us-ascii?Q?7a2AWKG6wd1eJWmePCq7LBpvhXlnw8xxAHh5h81UmR5ZJSU98iHsWcd1OQOP?=
 =?us-ascii?Q?ikSHiTCmnaxmXJ5gZ8o2cN+V02BLZSVMe7gDq5rrNAqP2O5Gd1156fOqLeqx?=
 =?us-ascii?Q?lxDkfW7iNjm4/cVC2BvKLQ03wlllgCf2KknEpbc2ULqmojzcWXEZRXd4wHsq?=
 =?us-ascii?Q?mnQg8b/RdOXfCOUY3M4B/uM0G6bwFGibaHiNI/jjElTM8UlgVWZs0lG0ffF3?=
 =?us-ascii?Q?uKea1OpAnxQMgZhQZZsfsE/k83HTcsjp7pK/pWq6m3EUXV/tccpZrzmkBYwp?=
 =?us-ascii?Q?l7qta0AiX9b2SWZ9317Jf1d+0IJuWcXiN43bh7+jXfMa+GU3IJG2YoDjBw5j?=
 =?us-ascii?Q?4uEF6pWnDq2STYz/k1Woo7IK5Kp7DiWLnULvzL8x0omkADSupDVV/9VRT7mM?=
 =?us-ascii?Q?oVBL1udLotUOaGzJv8yW1BezNg9kWKMw0Utf25rgnLq0j0Vwb5pf9/h9pzTQ?=
 =?us-ascii?Q?x6/aENFA2u5MsurnKRlwsSAVUMq/7g0hgHiVid3fp0vLnqf0m8DvNttKsjom?=
 =?us-ascii?Q?0bSR2W3rnHb0TlRjWIXYHLaD4Zg6Lq9O2akNIfQ/Q6K404XXhd8hkP6G7JQq?=
 =?us-ascii?Q?hZUKyaLAwqfDP1HI+Ii5Y13f1tIYC2e7NxFTfL4uYflC22uK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93eee611-899e-4a41-9db4-08de793bde8f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:45:17.8663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JptHc/1ifipfRoAMr3T5B1CyamrXwfwbaHSLDWVRaJ9GTzGbzRofqVojWq7N32RSyGQfcsc/um6zo2jeDjs8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 8FBE11F2E0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[2.166.110.232:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,4c100000:email,0.0.0.1:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:42:08AM +0100, Marco Felsch wrote:
> Hi Frank,
>
> On 26-03-03, Marco Felsch wrote:
> > Add required OF nodes to support the i.MX93 parallel output (DPI) path.
> >
> > On the i.MX93 a single LCDIF is connected to three bridges: DPI, LVDS
> > LDB and the MIPI-DSI whereas the i.MX91 support only the DPI bridge.
> >
> > Map endpoint@0 as DPI bridge output since the i.MX93 TRM (Figure 485.
> > MEDIAMIX block diagram) doesn't mention any port-number <-> bridge
> > combination.
> >
> > Set the MEDIA-AXI and MEDIA-APB clocks to the overdrive (OD) values
> > since the i.MX93 and i.MX91 use the overdrive (OD) clk settings per
> > default.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> Please ignore this particular patch since you already applied this one.

You can skip these when you post new version. post delta if need update,
I can squash to previous patch as need.

>
> Next time we should align the apply with the rest of the patch series if
> dt-bindings and driver behaviors are involved. In such case the final
> integration patch should be merged at the end and not at the beginning
> :)

You request apply at :)
https://lore.kernel.org/all/fl2br7rtcjrjj2uqxva7ai3xbvjwrrbbl2ruaoqolrccr2rd5p@z33qfx7dpavf/

Frank
>
> Thanks,
>   Marco
>
> > ---
> >  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 54 ++++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx93.dtsi           | 12 +++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > index 7958cef353766a430df5e626ff2403dc05a974b1..5a8813df6bc993d559fb0b20fc742a106bfe6315 100644
> > --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > @@ -1122,8 +1122,62 @@ media_blk_ctrl: system-controller@4ac10000 {
> >  				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
> >  			clock-names = "apb", "axi", "nic", "disp", "cam",
> >  				      "pxp", "lcdif", "isi", "csi", "dsi";
> > +			assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
> > +					  <&clk IMX93_CLK_MEDIA_APB>,
> > +					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
> > +			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
> > +						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > +						 <&clk IMX93_CLK_VIDEO_PLL>;
> > +			assigned-clock-rates = <400000000>, <133333333>;
> >  			#power-domain-cells = <1>;
> >  			status = "disabled";
> > +
> > +			dpi_bridge: dpi-bridge {
> > +				compatible = "nxp,imx93-pdfc";
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						dpi_from_lcdif: endpoint {
> > +							remote-endpoint = <&lcdif_to_dpi>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +
> > +						dpi_to_panel: endpoint {
> > +						};
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		lcdif: display-controller@4ae30000 {
> > +			compatible = "fsl,imx93-lcdif";
> > +			reg = <0x4ae30000 0x23c>;
> > +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk IMX93_CLK_MEDIA_DISP_PIX>,
> > +				 <&clk IMX93_CLK_LCDIF_GATE>,
> > +				 <&clk IMX93_CLK_MEDIA_AXI>;
> > +			clock-names = "pix", "axi", "disp_axi";
> > +			power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_LCDIF>;
> > +			status = "disabled";
> > +
> > +			port {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				lcdif_to_dpi: endpoint@0 {
> > +					reg = <0>;
> > +					remote-endpoint = <&dpi_from_lcdif>;
> > +				};
> > +			};
> >  		};
> >
> >  		usbotg1: usb@4c100000 {
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 7b27012dfcb564650882dc8c40e836e797b2fda1..5436b48b30e89eb1f939b398ce1bf105abe7e34b 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -150,6 +150,18 @@ l3_cache: l3-cache {
> >  	};
> >  };
> >
> > +&lcdif {
> > +	port {
> > +		lcdif_to_ldb: endpoint@1 {
> > +			reg = <1>;
> > +		};
> > +
> > +		lcdif_to_dsi: endpoint@2 {
> > +			reg = <2>;
> > +		};
> > +	};
> > +};
> > +
> >  &src {
> >  	mlmix: power-domain@44461800 {
> >  		compatible = "fsl,imx93-src-slice";
> >
> > --
> > 2.47.3
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
