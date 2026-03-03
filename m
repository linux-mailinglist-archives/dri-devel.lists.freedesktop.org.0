Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCQZC1ZMp2l2ggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:02:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C682D1F70F1
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE7110E8CA;
	Tue,  3 Mar 2026 21:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="V4AwrWHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D1110E8CB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnUo3k6mw/NJTcl3w5kdfYKkJh4ThdMp+TrBlx9mZve0TU2l3y/UDyQPaD5oE541eH9QajhYwKEqQsSxtcfPvPXpIWbzmi4IunkS8kCfw1FdbyXb3Vk6PygDN1nla5/giH/7mQ1wPwX9FmIOJupLFkpaKOWKPlCRNKJ/1bDJ0kU2Rb37ir3EGCww6saWM4NQYIJn9L0Vw/h9wxtWWd9jwF/0jhnNK+atlR3QPNrbW6D647wHpc8IvvDvACU0lVedawtfyfumr6gZhSXPQTE0YsymBez43W/UYXtg9eMudRxeozLuwMGbqMmuliecautkcujEBThrkybBFL09+477wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8vwSZef/Dq6Tm0P4PfhhK3iPc5GoHcievTstagdMEc=;
 b=M9r/d4ZRsgjPOLe++KURqhnhkW+ztUtMTIlPQyTF9cgf/n6qdQ9Seo7+5Nj27b5Cy4A1kIdJ8Lq8XB1F3TvQhMSXM7PDHcNO1nYWYL5N8tpsM63QAvbv1+dkhp8E0VBJglnlsW28STU1UkVira1ryDmrHcxOJo4HMeF0f/TB14vPeFFN10QpI39QB9z4vnyRhKRQkFK85rwoeGK1Dw9STDcdiv1IHW05sa0ktAlL8flEqfGWtvVmq6Cc9vaRMXC5eBaWIWE7ztxaiv2AExz5Wduq7dvNTIGbLz8+woT7bCrESEG3ssAgG6FNOa5sZpmC/eR1WUUVsYAErZ9YXyS69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8vwSZef/Dq6Tm0P4PfhhK3iPc5GoHcievTstagdMEc=;
 b=V4AwrWHOwiPtsOB03tKx7ajgVZyKMpMev2yNRJfm0H5DEn+rh+0C5u7G80nWaBFEMxGghKM461Z9DAEFmKA/SYjBhSr6xhHOU+79zP0ezSsMkodJYboQVfNdZj8uS32al2ipt/Av9OBCZ7Agf9ebqMlpejAm+W4RMXkTh0wVAkT4TuEcSA+LRzLeR2Hofa3ZKv+aRo0CXGYKKU8/A1VYXZTmMGSCpsBoZGdfL7sdBqPOiJLJRztQX6wI2CcvSJIaqHsZX6I+y6TK6WFvmVsWh7Dyb8EQe8SiWW68jZ+hCE1p4WPQeA83l1Xtd3QxwmHCmDwLCoMQCdxmBX9TU9NtiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com,
 Frank Li <Frank.Li@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Date: Tue,  3 Mar 2026 16:00:57 -0500
Message-ID: <20260303210131.2966214-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7107c7-39ba-44a8-b683-08de796820dc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: nk/4j4mr3986rsmf31wKfopYFVWWDXIWcJXJaaVYMrlnTmZJk7w6/6NhJAUEP9cgraDyd7ekBwlMw2o70uJE4JubszZGT89yZkszE5k0Cj3MbGVP+1ERGqKrMDX+Zz/nOzOoShz4rnxnESJr91EduCM6AJg4tP1pII5pf2hzL9Dfvnxwtfwvc4pP6dUFd7euZbLpoLGOJ4yc8V44poW4OB7qmOsq1I1mi13vzguoNuAim0SOFjZ0//qMqMZA166Ya9URft/RARNjcFl17wd9bf1G1PTEeXocKw/c2ARmfb98aBMeGKUS/s7vIBGjYKNMvaE03zMZjBw4VLQIjWyCobmm64YcqCI7r7KbHrkBLAg+rVlMdvXm18NZ4AXDTrsiDXsth0G5OTAlQlMBH7hC/6U6u4KCHlTgDvHfFMTxfHsPTVwYhz9yepL9lhkxTFAPohEzMPddlPL2bFBKMndumfnBHUgeR1+DEMEUxgpke9mh62NyNPmR9PY5/RJBhQ+NnEk6nUU26gxaIXxDC8raShd9vzjDc59YETPz/dbeWTIy8HeOxhaPft9rmJm2PIHVhpHlxIkZ6fFP1JI6uiJrMTp8VGhAJEspWeWZqA6r/OyKOBviLUo0VrimKxKnRpXVuWIsoW0b5wH4IglfY4911ZjxopJvJtx6mVxzibLesc2ExNB/81ET2Y2H9QW+Q8644wqmSILQLEJzDem80qjZ/gDVCUHaVqO+yDYRbKQOM9ye6bLb54HsPitNJNR0jlR0f06S6FcXZnRP7yiLh8ScRFrYqfUoPLZmWGaCDTTgiQp5k7RIiNiFSyT6Ez2iFx4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TDwUdei/4HDCIwGEjzo1uFqy9bSn41ZkK81MQT8bUpifVeAulIYdohKNvESV?=
 =?us-ascii?Q?pjIoqHQjHFza7mNjbMOjo2dBsy5K8BaLKZZODApO2g9B84Lm+OBRvmSdzmCz?=
 =?us-ascii?Q?tAqB978QX2E3vb5X3jk2YXtyXps5iwL4iZ6s6E24RPd/DfHmxnyDaWG0i7C0?=
 =?us-ascii?Q?KoH7lTn9ukPHpHUN5X0oUJPsHH0fbbaxF3BBuR7UmoaZ2xHLQCWv/FvM6oz6?=
 =?us-ascii?Q?rRr1i09ev4s1NcDDneT4e72wbDdK5zoS3EbYGzis0wZ12QCCxrru7tXfmQi+?=
 =?us-ascii?Q?Z3xKJhNlbIK9xw+C142qW65vZvL8AN2asLNsRoxdOmL1PqVFX4/WaTL2ldwH?=
 =?us-ascii?Q?AbJwTKegFaQttInxXsJ8D7LS2zSz31xQSiuJky6VbvwsrHhh0eriphZgJIUl?=
 =?us-ascii?Q?APXgYVDbwiSB7T7ybhgtf16MTL/QIv4RbNPyOjhh2IkDJP/TDQe/NKDRriuO?=
 =?us-ascii?Q?KmAgPybF10VLy8Q8ONkjGDwvhwjCMLjdgaxpHytdmEyD90pjmr5GtjFYvLB0?=
 =?us-ascii?Q?MP3ceGntBBOZLQ3+kh+E9XrLmh6dHtKDLKJV5R5uG3Ahc8tvAs91XySu4OZq?=
 =?us-ascii?Q?mOQ086/zBVeamwto0CEeVIRVZ6M9qLlOgKZIGvTkZVHbTN6VlzygtXxVj7S2?=
 =?us-ascii?Q?PT5wG2q1ZtpEpxrNezJiXK8XXF/2FApfzmRF6ICp7gQgxeEvApotSy2feeDg?=
 =?us-ascii?Q?+Dov5F/yrBL1LRwomOj7ygwmqdVKK5cFP299gj0LNlVCRyItKdTvp2O19pO7?=
 =?us-ascii?Q?Y6e34+xB92TQ3xIPcIp7mn+XwTbcyytU5N8AIRhYn7kF8m33zl75OQrPgZSp?=
 =?us-ascii?Q?5X3/1coSa7g93VrMN2aseczXTTS8nIQdWWawOg6ftN78KGUq+6qR4OI/qoFj?=
 =?us-ascii?Q?wx64zE7XDQNApuojwcCultCnfBgYkxKTsrRX/UyiVy0EXbFGgWmwluxa+WU8?=
 =?us-ascii?Q?uEVEYb2kTrQ3s7L5Vih+H5Y/hRqVjkpcMPXEtyGjWA8zAIu6oX/skI32hJTu?=
 =?us-ascii?Q?GbQRu2ijI77PWv9jGzL2VJWnqGfy+4OPN70gn5LVe3tDt80ez9D2cdhPy/fR?=
 =?us-ascii?Q?+5HS/1/2+oP/gf99dOaOiBEmoRBQL3Oao18Zmx72zXQgpERpaJ1t+iPLdwsT?=
 =?us-ascii?Q?f+sZkNDkFgxBEN+FOCJGG1ETohlcMzZllxT+iBtOeYdiLb9tChlaER+UBMGI?=
 =?us-ascii?Q?fDJ9jye90KJjLyyr1lyDAK3LRxhVRNWwjbo3TGivY5Mk6eg7X0Br6+QWcHzc?=
 =?us-ascii?Q?q2WC4yqMugiEDb9LzkuIyA5Tk+Y94I+L0z2Aumj1UT8NqfBy5Fk0V9CbfsVr?=
 =?us-ascii?Q?W5ERovtxuaGuSa4o6JBXLXowy+ShF8MfIWb9qbV2IUN58QGoovXhSnB8gcRR?=
 =?us-ascii?Q?/aLxqZ2xBCl9HFpPxSOsbhfAbIIYcv/8mw+esYdGkOt0PUVt18wKPtd8osSV?=
 =?us-ascii?Q?mblWEpWlKyo8DiLvLGLOUPKnmtJ2XTpZh5M5mHCkFtPnonDdp9WbueNx5dhC?=
 =?us-ascii?Q?XPmoe7hTDpx2pgGLBfPOguHYwVxtkZ253lIZ1IRl3WGPxvowiOYI1/xVgik1?=
 =?us-ascii?Q?F1oCFBir+tSc6rG4ynmlHdWCGnG3eGnfGVvqUKdNl1X7v4e3mEcJr4gLbUOh?=
 =?us-ascii?Q?A96mJwHlOZt/pXEa7kWqto88i9WS1arcmvsXTpD0dXG+WmIaWXDKGnAB94ia?=
 =?us-ascii?Q?F/X/JrD2yPQejesAEvBJQqZ4f+tGmf5gc6qj8eEgOrH8wYLkf4DzHpa5uQZB?=
 =?us-ascii?Q?v8N3m6/oXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7107c7-39ba-44a8-b683-08de796820dc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:06.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kfb7nxJFZgteqZDuBaHPlW3HCtW/pxMe1sOBOd3Z/fb/IlDckomFBQwgZi6x9akVG7Tyi8lc+uOXFeULTliMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
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
X-Rspamd-Queue-Id: C682D1F70F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:Frank.Li@nxp.com,m:frank.li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:m.felsch@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

---

> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kmalloc_obj(*input_fmts);
> +	if (!input_fmts)
> +		return NULL;

Missing kfree(input_fmts) in error path if the switch statement
or subsequent logic fails. Consider allocating a fixed-size array
or using devm_kzalloc() instead.

> +	*num_input_fmts = 1;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");

Line exceeds 80 characters (97 chars). Break into two lines.

> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		return input_fmts;
> +	}
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}

Switch statement lacks default case. Add default case to handle
unexpected format values explicitly.

> +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_atomic_state *state)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	unsigned int mask = PARALLEL_DISP_FORMAT;
> +	unsigned int val;
> +
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_FIXED:
> +		val = FORMAT_RGB888_TO_RGB888;
> +		if (pdfc->phy_bus_width == 18) {
> +			/*
> +			 * Can be valid if physical bus limitation exists,
> +			 * therefore use dev_dbg().
> +			 */
> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> +			val = FORMAT_RGB888_TO_RGB666;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		val = FORMAT_RGB888_TO_RGB666;
> +		
