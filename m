Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOrPOBpmqGl3uQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:04:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3D204CDA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC1910E18F;
	Wed,  4 Mar 2026 17:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="THEi+RHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF0A10EA6F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 17:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUYg1tQ1Yv26PSN0PAQlPbF0twDlUkI6d0eomkGro0f+blSSLp+QNwWDXIaEXyLfTv35TrDfUk+RJYsMJLeI2eLL4f61InLyIGgA0lAISXXkygHMo16xMJYgxpTVoyGwP94JUbPuknumEMjFbEqeVK3jRNUE69PbymHM84NUnAh9mpKsSHcyqQeL5BFNP+8buf47X42a3q42XeoVh7zWPW9sxDVLPXJ7ilmpG/vvR9pNv/yasDcU+wI0hgm8CrBJWvBfuk+fnAduukrQ1yZcWBm94UCxG4xutYzSAWFVS8l3KzBeTHyxuYo8pK9PQlnkGXSaV8wEzGOFIb9nmLzU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToCenrdvsGktxpdl7MlzBj8uHsqgVPbw3MQ3wwDjSww=;
 b=E0JFcXPxEEzE/x5qaBceLKZiNfrxPumkNRIxtN26bJ70nl2Ucmfhq6yH4MFKeBlODX44R5+jhQwA7C72FW+Hot+jm93jjKfnfvY5dyzqVwLWoHmtzgcSxkAe/VqJwCE/LeQIS23M13eWyhFbq8RrRVBadc3SYIWKaWd8mIXnbbVzbAxkHV8HckGHRYtmoO7olTGGd84/imgFSoc6r6e1Gyo3krlEaHGlnzUSWd9jSi8vEyOhffVX9cOOsHjE9KqNpOYipHe+EJWQLDpBQAO7twsZjoJyQtnTwlSK3d0c0tmmq9MYhnKcqbhKAC14+MQ7ttoAwnVw7x6XSZOfNDNPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToCenrdvsGktxpdl7MlzBj8uHsqgVPbw3MQ3wwDjSww=;
 b=THEi+RHaf6kzE0ql0eHoMGt3TPRNLYQcNdtbJBLVb5zqQDVLifRkaZwbGWd0If4eDlnKXcR06fvxWBz9/dK4z9ua+SuT9aBzae7n9A8pmg20HMEFOqumdYKbAOcA5EPGpuVvmTXeISDiP9fMn5v/bjhDy84KNtAkeU4ol5mntAMLY3H27ey7bm3MAA5Uj1QXOf9CCkNt02saQPx9+0+YyqAonnUEl4/HtvTWTwKUwffRi4AiqM0K4AkjhphShg6ZRFwVvjCi0D7YYnM0sUx/ix4QwiMu9JHG1GEoR9egXCDLFZX2RzGjiQABr4wd0Ko2gBpC3CCColJsU94nf6VCAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 4 Mar
 2026 17:04:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 17:04:16 +0000
Date: Wed, 4 Mar 2026 12:04:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v11 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <aahmB6Rhn9qXChpi@lizhi-Precision-Tower-5810>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-1-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-1-Frank.Li@nxp.com>
 <dda5b0b0-1a8d-4d37-aa82-9515dab2cbc0@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda5b0b0-1a8d-4d37-aa82-9515dab2cbc0@kernel.org>
X-ClientProxiedBy: SA1P222CA0057.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f2d97f-2b22-4044-d338-08de7a101170
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|19092799006|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: aiYVDpVQ7iBekARrR/gGW94ugr13lykEATv//bJxQJreYXavwWuPLSVIM3Glkw8xEaUCLv+BNVA8+T346j990rOWfJRPUc3gidTXFUtoXOXh5ykhgn94Lu7snVNLURV3Jr0eVpMLJ/R7Ea0pVublo5J1OkURphk4lThRfzPMfoP+gNF0qGUhgVWoMtnfQe72BqEWxlWj6aPnc8IMnJqSscdRbu6xg8PTUhmaaKleZwsbf35PDax6s/iFqoZ8dH0wR93w1axvg9xvlx8o3CDzKUYiVhc014JiwI8JmAcXa0cm60w6NT365JLQQp7WtrsaBmuoeeavtIy6lOR3a3Ys3VDiz+NNCToq53JmP5oT39X6mmdEhoqiOii5ZCHK1qPbZOFu5VBpXe9tBdgb8uCXVV11m04md4MS3W1hswINhM7tBTcuaqOp27Ax53abMjC4NfA0DPPlYH2HYn9wROJfoU47ZXjy6E8wFiq1UO4kNIx46PhoekJf7K7RiBOJg7TLuxpaSfTKXdhezJ5C3b9/u7vLUZq2gP1OKS+MH53MDUMmh3zAgrJBTqgFXh6n4tg5phHmzudHoPjeIQ4ikoZPS4KJEU9cbL2M1/hNJSFUfeowDIJn5Vpd+FSbSqm4XR51EF7CGJRDY8Orevd9boo+HNoXwQaTsb5f/oM3QYGUT6vO2PYZ2JImmzdt3nEsWLprCbjzdzrd4ielhHfXyxikb4oyALaTkBQVC/L+Qt8KWZp4ltk6A+2IpDwNvPRArZW/9Hp+SxY5IqnicU1Id1DHBb3qmR306mVUUMVTOuiua0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(19092799006)(7416014)(366016)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Srd0NtwGgR3tKQr/ulGmPcmoExg8X9RsYUoyA1xURElzVdx8vKYY5E+O/82v?=
 =?us-ascii?Q?151Ll037FF6pgZbqHz0b4mlcpaOBdxSg3BlvhdWTOAD+EIwCPO49RJJ8/epN?=
 =?us-ascii?Q?jc7LkJaSC66tfITClOEBPISliQUSaNPgPuGTUpuipBbjUheoRhJPDCj3pIF2?=
 =?us-ascii?Q?N9fUdS/+SsWy/fsWbcCrx9qgtAiLZyoTaI+F3OjUxrE8sTuNaHtjhZjFFW4x?=
 =?us-ascii?Q?9m8H/3sZFYKkApAQ6+kLaBYzSdvxMtL2xwUnO8ZQKaHJcJI7f+uiatGaBCQS?=
 =?us-ascii?Q?nWtAMMuurVjmMhIe7AbNzPh4hRueesyaRbU2gZetPVpf9VQxubnj772tFc85?=
 =?us-ascii?Q?Mfza5EERYXEZZ1G37298QVTxTE+61OgJUphFQTABH3lwHv19uUGsNaH5Vfd7?=
 =?us-ascii?Q?lZSGeFxii1G9F0EozQGcwEEBrVilvSvlCQF1zFotudMNEe0q1EKFQnE0hrH/?=
 =?us-ascii?Q?aM9uBloY+T1yWOlgsQfx4deydRxsnPSH9Dsr1mC61IVXejuHV1ur9Ujae6n4?=
 =?us-ascii?Q?BzI2o4pdLBsGQQsSrrACqWaNstZTdzEfmLpmy6RVVUp1z1iQMS6c4qunevHp?=
 =?us-ascii?Q?JCPedKZRZsmSGpe4WuAiYPbGVyu5ppcPqeHjZhOSAox7lVG+kRT24BwcD39B?=
 =?us-ascii?Q?TcCIajO3ds7YgOadRLI0DUSjgH28qwVbvJ4oZoMt/PlKYB3PU02QaJIXgdET?=
 =?us-ascii?Q?j1JCjex47YVwLhqD+allsOIS/R4m5yTxASgEmUYTHpNlfqoCXUHwGqEp/EGQ?=
 =?us-ascii?Q?ABYpC3KEjbbkXOaz7mBlWnlvUgkpRZWfJF6MdtLqolKr45Ea1/mkriKjpYPR?=
 =?us-ascii?Q?CNVcA8RLG4/4jQsPvLKFw5ziqVjUm67+liz17dYe7LqOHWgSGnKaCiwTeq4+?=
 =?us-ascii?Q?Vg9gh0SeIGeHXdeExVp9yyH/U655V6gMXmtNUaUGCdiKDA/YzOj309SvxVMH?=
 =?us-ascii?Q?ZmNLqudzNR36xOe06rJJrE/aSl25/w4ItZGD3WRH0DHMFqGBuI2fFzZgMhUM?=
 =?us-ascii?Q?K/V5OGkB4qouLy0L8fsGADaMiP7kIx0PbAwYdUx7r1qk8SqHtIja/a/ZFeYW?=
 =?us-ascii?Q?UxCDot1xOEajn/57HX9PciUgNYiHPpSAuXXsZruihneU3Q85or49qIiLvYK+?=
 =?us-ascii?Q?vkJnmUVOa5obsQI+jdBkFmOTH3V7MZD+gRcnj7qloHhvi1nu44S5LkIAwdS9?=
 =?us-ascii?Q?oTADuYplRj37pV9GQNO2SpiKOvzAUv4RXRZZuTMZtEDdFXifbC1QAme8kvGt?=
 =?us-ascii?Q?7SmmPIoSfq5YAVCBdE9G8intOxlvHEhdfqT0MVnhLsod4sLLtJYi1IzvTEfe?=
 =?us-ascii?Q?BDFibxSUZYfUc7CMTr8EnqGp1IGrNSVoSXI2fCfPocS4VLe7qzlFlPUs6GNL?=
 =?us-ascii?Q?S3UYoZTf2MpU/4doozzDTaljLaTpq6Cpobu/en6COaB6cMdwAhBg8flpmDHO?=
 =?us-ascii?Q?TaWN2J04TknFKQdUclbh/c0JegXAD1w5Eq95hqJkMl8bQjEgKdrAq6ckayNU?=
 =?us-ascii?Q?8khFLudt6ObXum11I4t5SG7O+HhjDFAvWi6Kgbb7wABkr/GCZ58Xo05nUWrA?=
 =?us-ascii?Q?PHBEqolnBGuhtLWAoUNv2QfOwkHldWFRPRb7byGzSDNu73o5MSp7Ju0ffqSD?=
 =?us-ascii?Q?Oni38o60z4BeojApxP7ivUi8wYkt0tPmUQSctNrYdaENTZZ/CBUvnufAdCfl?=
 =?us-ascii?Q?qIi5JqUZost9KLn7OwTl1XRmC7LRx6aJgsiQvlO/0QJMQIWz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f2d97f-2b22-4044-d338-08de7a101170
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:04:16.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58a2KErKQuXpP6JjQ5HIt3ocHEOKvs4wcmJBxxQ5/CdlEgMHGuq/zOyj59ZFIIkw5W3QK53FLvmqiIz0duWklg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075
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
X-Rspamd-Queue-Id: 47D3D204CDA
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
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:m.felsch@pengutronix.de,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:49:27PM +0100, Krzysztof Kozlowski wrote:
> On 03/03/2026 22:00, Frank Li wrote:
> > From: Frank Li (AI-BOT) <frank.li@nxp.com>
> >
> > AI bot review and may be useless.
> >
> > This is a device tree bindings patch, not kernel C code. The YAML
> > schema additions look structurally sound. A few observations:
> >
> >> +  dpi-bridge:
> >> +    type: object
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - nxp,imx91-pdfc
> >> +          - nxp,imx93-pdfc
> >
> > The compatible strings should be documented in a separate vendor
> > prefix file (nxp.yaml) if not already present. Verify they exist
> > in Documentation/devicetree/bindings/vendor-prefixes.yaml.
>
> What?!?!?
>
> This is nonsense.
>
> Also, you are responding to an already reviewed patch.

Sorry, I tested 22 patches of from imx and sent out intermediate result.

Frank
>
> Best regards,
> Krzysztof
