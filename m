Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKmGDeWsp2lejAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:54:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DF1FA875
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518010E0E6;
	Wed,  4 Mar 2026 03:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="I8C4Et9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458A10E0E6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 03:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy8eHrxW1Er1PT4aYMQwkKxxbRwFOM0OeuRkbZ9TILf0+rLB9tZalffhXSzXxgCa1rWSGHsAkVktIdyi6ZNLgRywHDlU6t6rjH5w0gsKFY6Nq7WA9bpxxIgTXfsqkPqueysSY47oLQWlnz5gOXvoM1xLGBuxe/uxO4ZUWYF5wNweJG2ROxFep5DsfrRfva/X1gf0PSBFGAL7/hrISKDUOMjayiy1ddKYmvJEAeSyDgBV2k2NV4B1pbnxbonK4Cn6riTy8qBFlSSOz7qm4OAlAyxHBs1sJBQWPWVJ1yQ7dHkIFePeVgy/jyeAxpaFDutFv/DOPyskH1NL+KPyIuXOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTSAXqXYf5EFJCbxRyDV+S9phoOJqbg6A0FL7IQ5PCg=;
 b=jzAkkV0F85gK8xNT8abl5SHT0QsqOIegXM8zY8YLMhaZq7lbCoFAGNTnwhcjByxRIHqK3rZ2Mf2ZjiHMjiDEynECdKek3fCgeZZklBfJhREMgJZSc81nMB2q03/Kag27s6pru5ryzDRSYDZaIW2GC4YuHibOJ+J7GC8XBikKamrkacg0J5r3TyA9tc3FD1q7coahunJcUb3Li2sp4mZkGTBg0ZQ6ro6tpinJIQehZCPpphTXymSdeICAThz/xKfp8RWlNudm6720lklSCaiw+nWfiHJAWeJtE61kEFAHaoq9iMBVHZ9JmF0yLs25DG4KH3HKbXJ8P9YeEZuCsqBALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTSAXqXYf5EFJCbxRyDV+S9phoOJqbg6A0FL7IQ5PCg=;
 b=I8C4Et9ik6gE5B0rQZpwnHZ0V5rycedFiRJg7KyCYT1zPJaHQofYLDs9eSh1rWo92Tzj/nDN9nyI6A1w/R4fnNZTF++wYCbrUSbWRjeOyG8Mz4UBEMCLka7d87P55CS76n/YHTTQ4+D4zTmrIpNYSD+d5iAB8jvKOaG7bPhEBcJg9Js2Vk2HPT96ML5IPK3zO84lfB0C6TnjsIgF1xHtqIxpcEijmRZNyvLJT0X7PvjyqrQwcq4FDl1t98QLLcqmY672e5IpO1TD1d/nHR3v0HEZpT0GsI10wh+N54S3g3QjMdBKw4inZF/0ErIDqccp71LQEKMTotDhdW8SG7FWjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 03:54:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 03:54:04 +0000
Date: Tue, 3 Mar 2026 22:53:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <aaes0RIBTcgOZje9@lizhi-Precision-Tower-5810>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
 <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
 <aademaK0PpTMZ0Xk@lizhi-Precision-Tower-5810>
 <fdcf60da-bc0b-4b99-803d-e2d1948d5633@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdcf60da-bc0b-4b99-803d-e2d1948d5633@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0dc01d-ebd8-4e47-13cc-08de79a1adac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: rOYQ3VPq0Z7T4y7qyDEUIArmVY8NlbP0MFcssKfYm3hZhWDZCqIe6vd098pKD/d1hc6PBm8dH1j271FWHKC2EMu8yybiH5BgT1ssdof6lYvd/u3NoESM8Pxfm/fMj2I7PDe8A3V5ShDc2q7SQHPnv6r1mTQPXyyvtjJiEBzgYE5ylNMMU+G1KYw/Ur012gZwrIdoDWJf6+sIsynj8juTBQqMfiqeE+r/lVs968c0GmrSwwcp8sOrTVrWn1MzjFyF8FslanH++0v5hhwsujyeNACZMgyCXGp1EYKgBMYq+15R7AVQ1BFWmAC7VSgwBNW6NikeRwNuNQAK0QVkSBSDSWseqEqU9ckaAfPT9zjGwjTU3FGok1mxhEKf7S+YO7xGeOtNkzllgYBuzAyOvPlm/11YZa6t6gK2vVEgfHE+82nLQCUAh4dimXxoolDyTAPinrmrkAULDbCTTry7cuTTu6FNf5O74Uq5dv/fG5qfaUof572nMDKeJDUCdKdQ1OAw7CO2v7IaFmen57OqnD7MKwb9EUWo9baAoNJY5gpMuq9cQZiIQegHygVgJmpy5IDx04BeylrKkdKFQhVDSRhksNIQBE8jNf22NDeO2nTaeHk0zHe/BzlJ/DDFfPr4rWkz13kx7CNaRogok6Qb7iA+PjW956S3CaWaeYTYcjlJiwOvtVwwUc540b4ZZXaC+Upyl+8Y1WHZjF9YeonfHRWzZocTh31iWysWsGzWvSF4L2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5PN5wGnhe9gWNh9DFk41st+aE7RG1JIQpxbXlToDl08ZGzm3La0Fa7ncUv9?=
 =?us-ascii?Q?UZgZlzYhQQv6KCddBDQH7f3l32DOOLKDDYQ2lljJ89hLeNgt0aRJ3ZE5zp9k?=
 =?us-ascii?Q?ghsGlpwitH67FCwxg7GsyBeuyVVsLc83H/hmTosKrtkBPjM0H2aO4NWQT+MK?=
 =?us-ascii?Q?SAm5BAuhh6euo7V8I1g5z1nVzgcSnbEEGO1PYtiXa5RydLZy1rE61NIHHWTN?=
 =?us-ascii?Q?Ir48PFOZdUscKgHlW1ELKzN3s8uJ9zKAmJ1709iyMnShZakTvLHvRW4ZsJ1S?=
 =?us-ascii?Q?FNupKSTifi1A21BYkOC6HhAHGemfugY1jC+ZiEN7ljZxZ43jXxFI3jtKubDO?=
 =?us-ascii?Q?DJRHKX/AbyIcpYXoyDdaIWIUU7I1gj1QCtakUhVI90AvMqlOInQLB+5sPZ2R?=
 =?us-ascii?Q?ZNgy3Et9A+MaZlibcUIQS+Pw8FxhlvFFy/tyOkftVJ2iRalvQp3k3NpEu7EQ?=
 =?us-ascii?Q?K7SLRtY7N75Q9LxBP5zxHpPVQ5ea0RdpbZavZxljShy4J0+9X984w3UpamUM?=
 =?us-ascii?Q?tTfYyF/wBe+mL48nwy3xJhusOK+7Ee/8Y+pZ3MsvK+21sEl1eh2cNuttDw+1?=
 =?us-ascii?Q?T2paucDrZag69ehv0+EN8O0fB9IDzyj5t70tKXHuJO8zV/htYsXDpi67T1sG?=
 =?us-ascii?Q?KySAyjbALyn8KbuUEwy27bCpe4jRu3pwF7zExcBXWQIJL231yP2t+uTKvT+i?=
 =?us-ascii?Q?13pqC/VyzgZZ1CtCjTe4Hk+Z3zEAZSHe1m+scSI3n7nkb/Lh1hVO0qUYgLKI?=
 =?us-ascii?Q?ceP/E1M0MlgI6yJIlSWh+471M7YwkheymR+oac3Roj4xz/0SBZxdK200wzM1?=
 =?us-ascii?Q?q9pH59dqTTfkm2X3VRzxrpHMjLsVyjB3N9YRUitVKZT/PJN99zvp1uNp446n?=
 =?us-ascii?Q?f4k+yTesU2rCPPaxOHhO6DrhbbOHJ8ADnHhOhiXK3bT6sQ04ddWM9TQex2lS?=
 =?us-ascii?Q?QwfiV0nS1BrpjLlFuIOdMsv+qudsa+OVM9N05H1gHMkjRPj35TTL09qMAEeo?=
 =?us-ascii?Q?rUBEs5PkpzUQ0RjGzbKajuvk6BhXGRUw+m1qtlQ0NgQ6F7pzZt5Ts2S49K61?=
 =?us-ascii?Q?jhs9c00R6CLo+R6+fZY9srWp3PvkpVuUDQ4PihM3sonBAHl9qGFgJuyWMoHc?=
 =?us-ascii?Q?2zlc7y2NZ/9I8/T6JfAXsZcVLlcmjMPruu/U6AUCHr6nZ+FdSl2ajhp7dY4s?=
 =?us-ascii?Q?WuVfPPggzEKGiTnWZyWcAKbMoUHqvgLPkjej0TeGHMt1XHassJ/bcBtT+XSN?=
 =?us-ascii?Q?8DWNurJiMhftTD/+iFMUv5SDNG+QSOAA/cM9GMeqMPXlCd4L6iiAWOwZyvGO?=
 =?us-ascii?Q?Lbmaqc0ece/WLwCAvwfST1Eh3NQmgwLLEtYTj15q6wVxVRUnPSUp2xPRk612?=
 =?us-ascii?Q?TFlHN+LoO+gPim9koTjytbUDg9ZsDj0od2+rZNX4mKQqmMZA6/ncozurvcy4?=
 =?us-ascii?Q?uC4oD8Zo5I8XkkTSDiQjTQwgOP5iPr3T9D36is2OI2NRtEPA3StHveJGSOBD?=
 =?us-ascii?Q?oUqT1oIlaNS2lCRbTS0/vtkiG1VrmEFo6OWHe/hfO/rbSgMmKY3HFVkEM8rg?=
 =?us-ascii?Q?cOEJCzJ3OFPrZdgpCXHmkXtEpOJPOaNuPvIkoqaiFFadtgRQwAR3QnHxtPz5?=
 =?us-ascii?Q?CGxf9YR48Sygv3GOtWw6fbL6hOHUPQCcIsCH579kttHoYJZKD03hgqn7lsht?=
 =?us-ascii?Q?zTj6f3GxnHq7sE8CxdDEeHQX147t/RhCwAtBbfxFECPqcOmposyPcu4j52n0?=
 =?us-ascii?Q?N35dsYJm6Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0dc01d-ebd8-4e47-13cc-08de79a1adac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:54:04.5157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYGPbRKRb9STJ5HwR55WV/Vx7F5waGJJL/xy6A53O13YWYGifpnklFxHMCj+gKKmxxIWyLEoYX3EpQzXnv5HEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976
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
X-Rspamd-Queue-Id: 947DF1FA875
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:29:03AM +0800, Liu Ying wrote:
> On Tue, Mar 03, 2026 at 05:20:09PM -0500, Frank Li wrote:
> > On Tue, Mar 03, 2026 at 10:22:02PM +0100, Marco Felsch wrote:
> >> On 26-03-03, Frank Li wrote:
> >>> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> >>>
> >>> AI bot review and may be useless.
> >>
> >> Hi Frank,
> >>
> >> albeit I'm very open to new technology, I would appreciate it if your
> >> AI-BOT is used internally first till you're convinced that it reports
> >> real issues instead of false-positives.
> >>
> >> Regards,
> >>   Marco
> >>
> >>>> +static u32 *
> >>>> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>>> +					    struct drm_bridge_state *bridge_state,
> >>>> +					    struct drm_crtc_state *crtc_state,
> >>>> +					    struct drm_connector_state *conn_state,
> >>>> +					    u32 output_fmt,
> >>>> +					    unsigned int *num_input_fmts)
> >>>> +{
> >>>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> >>>> +	u32 *input_fmts;
> >>>> +
> >>>> +	*num_input_fmts = 0;
> >>>> +
> >>>> +	input_fmts = kmalloc_obj(*input_fmts);
> >>>> +	if (!input_fmts)
> >>>> +		return NULL;
> >>>
> >
> >> +     input_fmts = kmalloc_obj(*input_fmts);
> >
> > AI:
> >
> > Actually, this looks incorrect. kmalloc_obj() allocates based on the type
> > of the pointer argument. Here you're passing *input_fmts (a u32), not
> > input_fmts (a u32 *).
>
> This comment is false.  Per kmalloc_obj()'s kerneldoc, it's first argument
> is "Variable or type to allocate".  In this particular case, the argument
> should be "*input_fmts (a u32)".

Yes, I wrongly think it is num_input_fmts and return array point for multi
formats, actually it is just 1 items for format.

imx93_pdfc_bridge_atomic_get_input_bus_fmts() is quite likely return many
format array especially has "s" after fmt.

Frank

>
> /**
>  * kmalloc_obj - Allocate a single instance of the given type
>  * @VAR_OR_TYPE: Variable or type to allocate.
>  * @GFP: GFP flags for the allocation.
>  *
>  * Returns: newly allocated pointer to a @VAR_OR_TYPE on success, or NULL
>  * on failure.
>  */
> #define kmalloc_obj(VAR_OR_TYPE, ...) \
>         __alloc_objs(kmalloc, default_gfp(__VA_ARGS__), typeof(VAR_OR_TYPE), 1)
>
> > Should be:
> >
> > +       input_fmts = kmalloc_array(*num_input_fmts, sizeof(*input_fmts),
> > +                                  GFP_KERNEL);
>
> No.  "input_fmts = kmalloc_obj(*input_fmts);" is just fine.
>
> >
> > suppose you use kmalloc_objs()
>
> No. We should use kmalloc_obj(), not kmalloc_objs().
>
> >
> > Frank
> >
> >>> Missing kfree(input_fmts) in error path if the switch statement
> >>> or subsequent logic fails. Consider allocating a fixed-size array
> >>> or using devm_kzalloc() instead.
> >>>
> >>>> +	*num_input_fmts = 1;
> >>>> +
> >>>> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> >>>> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> >>>
> >>> Line exceeds 80 characters (97 chars). Break into two lines.
> >>>
> >>>> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >>>> +		return input_fmts;
> >>>> +	}
> >>>> +
> >>>> +	switch (output_fmt) {
> >>>> +	case MEDIA_BUS_FMT_RGB888_1X24:
> >>>> +	case MEDIA_BUS_FMT_RGB565_1X16:
> >>>> +		input_fmts[0] = output_fmt;
> >>>> +		break;
> >>>> +	case MEDIA_BUS_FMT_RGB666_1X18:
> >>>> +	case MEDIA_BUS_FMT_FIXED:
> >>>> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> >>>> +		break;
> >>>> +	}
> >>>
> >>> Switch statement lacks default case. Add default case to handle
> >>> unexpected format values explicitly.
> >>>
> >>>> +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> >>>> +					    struct drm_atomic_state *state)
> >>>> +{
> >>>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> >>>> +	const struct drm_bridge_state *bridge_state;
> >>>> +	unsigned int mask = PARALLEL_DISP_FORMAT;
> >>>> +	unsigned int val;
> >>>> +
> >>>> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> >>>> +
> >>>> +	switch (bridge_state->output_bus_cfg.format) {
> >>>> +	case MEDIA_BUS_FMT_RGB888_1X24:
> >>>> +	case MEDIA_BUS_FMT_FIXED:
> >>>> +		val = FORMAT_RGB888_TO_RGB888;
> >>>> +		if (pdfc->phy_bus_width == 18) {
> >>>> +			/*
> >>>> +			 * Can be valid if physical bus limitation exists,
> >>>> +			 * therefore use dev_dbg().
> >>>> +			 */
> >>>> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> >>>> +			val = FORMAT_RGB888_TO_RGB666;
> >>>> +		}
> >>>> +		break;
> >>>> +	case MEDIA_BUS_FMT_RGB666_1X18:
> >>>> +		val = FORMAT_RGB888_TO_RGB666;
> >>>> +
> >>>
> >>
> >> --
> >> #gernperDu
> >> #CallMeByMyFirstName
> >>
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
>
> --
> Regards,
> Liu Ying
