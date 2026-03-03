Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCxCAbNbp2knhAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:07:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EA1F7DA6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD6610E6B4;
	Tue,  3 Mar 2026 22:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NfJJ+6zK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC4710E6B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 22:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+GIM3wnwysojHCao15W5Cqmc55Cw/txLV12atZ2qXg/hmUEqpFHui0J58RQDMCmyP3etvtA6bqFVSRE9KQJCq5KyGLH6eAeGfwTk7PvIAQH7uQStMIF1NE3ZuTnSmgR0joD1CuZKMw9zFSDazUnd0VS+FDOAKMGbcTgSOiYLQKu/sTpxJTuo0oOXQC+cRPhp3qyXCejKG5hDxskRCBlRDhJdXR3vLsZlzfnr+L200rxJP7HK7LxX1ZyiiT6VcMuJb1/zJKdKxfExSVZOOkBUgbpqUGl8rN4uzLCWf1prHc6CjL+qDfjcRCVKjnjtc8Ed0jppelqap35efTBjQTqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RtcCMTr+OnO7xlfNu5r6dFHo4ZhMRSBs8yQG9UndxA=;
 b=LM8pZAekOoh9U+6B7CoxovLovZfUDe6tlvjuiaVf+43tMxAIJlHdR7U5uhb2x9vWsN4Jlm02VN+X6VSH4R44yQ3+0G1/k8YGqnNy0nE5wbMoPADfKWy7NAtLNmBEnj5+EdDFz7rghENPwR8lUyoeSvWvfUzfbavbF5w4G/NznVRUa7DRr79FZzGZ766UKYWakOs8N9EHgSvFhKefOzkdYXkijvEMt3HZPCB3cLOzuDcY2NGBsNcA4/FAbhSdJx9jEqF2VJD0fQ8FWTS2Y/QookdwPxTt+38RMbpvjxp9z3hcoVyEHvLnj4ZlDO/mBZX9aIlHRlluuVK29b7C10TzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RtcCMTr+OnO7xlfNu5r6dFHo4ZhMRSBs8yQG9UndxA=;
 b=NfJJ+6zKPB+4vNcrjg7ZD07aMOWDR4zj1Juk+nqknUk7L7mqcf24ifC2qzuZrie1srwdDJLEORRZLlkVSzYJ3JAkSzM+kbqOmCn0UEfchI0AQzj2orlZQVGO8B/KxAz9v6/M9K8ZnhgqJnczUFHLCmPo/T80tRjXuh7onD3cNA82j3Ctnrb1wvx6q1K89584+0BPrdWrW5sNRHp/h6ViO0R9ebjCVcKXDFog2YWebMGs4Gx+cucC+8yPmxsc+JAuYYluSeyuC5nOirw09AoPndzlWP9gWJEIGhfUvhfo7MOVJJRvfQPLpxPapANmUdYiIW6LOAtbUUbcl7lnB/cUWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8928.eurprd04.prod.outlook.com (2603:10a6:102:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 22:07:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 22:07:38 +0000
Date: Tue, 3 Mar 2026 17:07:28 -0500
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
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <aadboEWF9tQuQnTF@lizhi-Precision-Tower-5810>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
 <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
X-ClientProxiedBy: PH3PEPF0000409A.namprd05.prod.outlook.com
 (2603:10b6:518:1::46) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: b960f282-7787-445c-fdf3-08de7971484d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 1dGEfuN/bxLDFIEmb1b0uqsqIVCsWTzqxQHLnh8CVXxRtKYPCsxoE+kAOFkHtKwiL6i1oFfyr+ZAj61/6YOlvlEJ8bJlqCXAlGB6oL+PQNlSM37TPC3ZcH/vYkpNDNcXw9xK93PWoiWSLoN37r+y2ABAkHFp0xGhrMtO6GqmsQQ6qSfdzaxYSpY6HDdrIyX5OTbDJ2b/a7Y3TZXZzX2BjsV4PkFzKOCMFqTdvo+DRMOViS1O2oRw2Zan4Txi6V3z5ltnoswqtN5/tm0YW0CMh1WmUjG2KbAxEpfxAo7mg8oHsKlu/e2bgNtLdYId87Q8RK6PFvypbiH06kVz1cxguYlw4BXCmZ2JMQIMC7pmplekh1mTGX9MHNsC9QArHRBpd7K2ieh6znHBXXBR4pWWscWNV/Vd+8jqKSQIbQBB9rJvgiekTQ4dD90wNEkmkKsBuAS8T54HQGCJGVUOrpkQSa04YjOtLvbTsXRcOr3udLJyYPYDoo4XRg38ayXiC+DPwGvnuZ+cmPBxuYIzQMq5xnGjSSFimfs6jzChcKKuxsOzn0QOh2b2vOmZO2tsoBIKAa0DChMDnv+q2R3ONxvRK0FMlOK7gryXqFlYdANCbH/7qRxlzYeITG3upZ7cty2SSuRWQDKfFNyvg9pDPloXFO9h5rjgNmclcC2JcjFCyqKC8YE/hhF8B27d44O8SFXxLX5ZeAxExq1htFhHXuBVKhxuzJ1TayAC2TCUEceovXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McF8dMqfG/qvAaO6nq3xcTsOe3IovRSIDn3N/qbBbEM7+rJlZDjsnorjihMT?=
 =?us-ascii?Q?OIKqlnIJdqynYc83zvp9Crha5iXJ5K9Zgo2+X6Gm3cdwvzH4t4kYHWQCRu5f?=
 =?us-ascii?Q?cMcfaMYRXl5InIld1FK+urifP2LwdLb70F9UzDgub2tYmgxBFOeRvDoL2ihv?=
 =?us-ascii?Q?TjADfJy/KKXl+yuyNmZd1CO2q2dj4UywtfzuEgcDoIsbxUOBnvB8YIv5xm3n?=
 =?us-ascii?Q?h+2Y6cRr7W8cdG3t/FeMyExQrt6nyOgxDXsfjHkGTnFS8UU1vUsjPRsoCTL7?=
 =?us-ascii?Q?k+TsHXHb2xQt+G/GYWhM9wOH7avcFwQkweMlSA+ENjuTg7Rlbh2cZ/GeW5TV?=
 =?us-ascii?Q?DPZ2fZbVCQ0gPGbmMc25YpZhQnLzueKqx9dfjLN6L+hBMRGME6UWkibi/0T3?=
 =?us-ascii?Q?iU9D6DJF1oEk7tH+H681g1KIURMaim61Cqs0w73vtSVu1nwp0qshJW1pQsZP?=
 =?us-ascii?Q?NbsX23T8LslLptC/cNDPpFPhmsenke0sPuJ4R6f6EZB8GlBW+AM9GpKMaiMU?=
 =?us-ascii?Q?IwgeL8ZrH+nAxKQ0JJgEhZ0nHkxJhQVoGEbRDkbrRSDPoSNrH1vf7JUWjyVU?=
 =?us-ascii?Q?ZOgFbfH6MhqHybdkSJjSvuMWv9D56O0/aGeJ1WUlOkSFZRh1+Hb0QywY3hmI?=
 =?us-ascii?Q?SywNmaVkZ210BABJFNXedYeHcGXYv243Jfw1OnNfPeQmhQSO3FJJlH5/JBwd?=
 =?us-ascii?Q?ZJz9PR/LyGgjRcPBTDtdrMVwU8EXkFvvjtUG0KgdENe/Hm5izrDTIFTljtwi?=
 =?us-ascii?Q?LdRl0CgcKyRYHpJVuToS7i/SX1k9nXAecK+t0iTvdPwqFz12Ilh1KHNIsDci?=
 =?us-ascii?Q?uuXz8qnRh1zI+xIynjqmM2cmM+FGTV9LQu+Rnw7598epamoCcgEO33xk6I7O?=
 =?us-ascii?Q?E/fw6up1j+1+DKnQ13LLr4sHcWsZLAHdPDANrh2ZUeHQIkLhxA60KtEyfNB3?=
 =?us-ascii?Q?dzsXZ3S2ePL9ooOccZd2GMg9y6HN6y/2sMo23DZNHNUgksRdHapAzSblbIF0?=
 =?us-ascii?Q?svPh/nfGbKPyqFb/UXzMdSQZLZWkYWRQWf8ZYDAyq4HKIYpNZc07thYChmve?=
 =?us-ascii?Q?B//QMjjzTJ4b+gQ5a8Q9pN4V4tx/VU1XWC5+M7LhFNzzFqEsZnWrol2O0s4T?=
 =?us-ascii?Q?whfs7g775bsGCgTE/pinQ/KTgICYB6X+ZIylaCzZBaTwCWKHYbkV4QUbe3Ei?=
 =?us-ascii?Q?Y+kxcFOGJdqivyglzPuFga8ZjQGQst8NyxKsRu7IDK165Z3CAne1U869HXTN?=
 =?us-ascii?Q?dHToU79V2+Yl8fPWtPGTZDbHX9G9PACmceqKkO7ZRDHk6MHBqtfABe+UhkLZ?=
 =?us-ascii?Q?tH3ZDx2fMWmhkzX3oFRgGBMeZh3m2tHThQZ4bWtRJ1ND3OJs+7wO5BTgx8qM?=
 =?us-ascii?Q?O3qOs6mOs1HZkRhQE2sLh8FGw2oHcfGMChRTl94+Fpql1WeeBw+k+RMU6Ebz?=
 =?us-ascii?Q?YabDvi4PpMsBWYT2nGVDBcfmBhvAXqUX9ozLVPrKNGbD7QfCrVvUJJrgJzFH?=
 =?us-ascii?Q?AbGcA5gy5wKQTP52yVnAFOQaVvhfG6mBFG6SqYXSttu+Meut5UFEE8OKJTUH?=
 =?us-ascii?Q?PJNWsraAy7of4BGSpabJ+cE50yDRXe804eEBgj72egjZIltoasRLFF9IVs2W?=
 =?us-ascii?Q?GAB/EuzDP+dWxyve41/vEOWDRvELj+72M6cO2A5MQV5fnCg0AA3FYhCbwz+v?=
 =?us-ascii?Q?mKUvUnDaceQ+7uyOum2zQheicN5Q9hzIPKih3uMQT9dghsvSpWQ38Up7n93N?=
 =?us-ascii?Q?uquN+l1ZWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b960f282-7787-445c-fdf3-08de7971484d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:07:38.6760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brRDQGK0dhHiHAEL8QifyfIYy8x93eJPgVVsbP9cbmJCDYICw1BPtbK0Iya2kMTYbqmcKsSaviCm8Ckt/+iBOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8928
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
X-Rspamd-Queue-Id: 688EA1F7DA6
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
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pengutronix.de:url]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:22:02PM +0100, Marco Felsch wrote:
> On 26-03-03, Frank Li wrote:
> > From: Frank Li (AI-BOT) <frank.li@nxp.com>
> >
> > AI bot review and may be useless.
>
> Hi Frank,
>
> albeit I'm very open to new technology, I would appreciate it if your
> AI-BOT is used internally first till you're convinced that it reports
> real issues instead of false-positives.

I tested 22 patches, which sent to imx mail list only. Need test script.
Impact should be limited.

Frank

>
> Regards,
>   Marco
>
> > > +static u32 *
> > > +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > > +					    struct drm_bridge_state *bridge_state,
> > > +					    struct drm_crtc_state *crtc_state,
> > > +					    struct drm_connector_state *conn_state,
> > > +					    u32 output_fmt,
> > > +					    unsigned int *num_input_fmts)
> > > +{
> > > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > > +	u32 *input_fmts;
> > > +
> > > +	*num_input_fmts = 0;
> > > +
> > > +	input_fmts = kmalloc_obj(*input_fmts);
> > > +	if (!input_fmts)
> > > +		return NULL;
> >
> > Missing kfree(input_fmts) in error path if the switch statement
> > or subsequent logic fails. Consider allocating a fixed-size array
> > or using devm_kzalloc() instead.
> >
> > > +	*num_input_fmts = 1;
> > > +
> > > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> >
> > Line exceeds 80 characters (97 chars). Break into two lines.
> >
> > > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > > +		return input_fmts;
> > > +	}
> > > +
> > > +	switch (output_fmt) {
> > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > > +		input_fmts[0] = output_fmt;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > > +	case MEDIA_BUS_FMT_FIXED:
> > > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > > +		break;
> > > +	}
> >
> > Switch statement lacks default case. Add default case to handle
> > unexpected format values explicitly.
> >
> > > +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +					    struct drm_atomic_state *state)
> > > +{
> > > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > > +	const struct drm_bridge_state *bridge_state;
> > > +	unsigned int mask = PARALLEL_DISP_FORMAT;
> > > +	unsigned int val;
> > > +
> > > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > > +
> > > +	switch (bridge_state->output_bus_cfg.format) {
> > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > +	case MEDIA_BUS_FMT_FIXED:
> > > +		val = FORMAT_RGB888_TO_RGB888;
> > > +		if (pdfc->phy_bus_width == 18) {
> > > +			/*
> > > +			 * Can be valid if physical bus limitation exists,
> > > +			 * therefore use dev_dbg().
> > > +			 */
> > > +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> > > +			val = FORMAT_RGB888_TO_RGB666;
> > > +		}
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > > +		val = FORMAT_RGB888_TO_RGB666;
> > > +
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
