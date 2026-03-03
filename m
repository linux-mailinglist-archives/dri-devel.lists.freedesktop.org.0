Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MnzHKtep2lWhAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:20:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE41F7EAD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A710E8C4;
	Tue,  3 Mar 2026 22:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SkBBC+en";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013057.outbound.protection.outlook.com
 [52.101.83.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8DF10E8C4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 22:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY9fzKBkQLtf3fpBzW7irXKIW1UVHr9yDTgVl2yN+jTznUxTEM5NvDAMiDXNEMl30Qy0TTifndGfdFC4Eyv9fZWSxlYGEiIkB0pXbbMKY0Vimfef3xrjE4XTErhCdFzx3vmYFkU7gTYmehVbGr9gpvgnB14DLVcYrnN5Y71zllwaR7Y669125DcDxOud/9qwjCgl1at6w/N2WX/FvLVsDzr0BTj7y+fXMA+TKxHNJ6E/qVN5LWunPib6vyowEhvjRSbzss53qALcyl64VH0T0WPxIYDjQtj+cxVmbCuhX2OQ38XFKSoZqQJaW79ahyMLvq9NpyYy24tnq7XV7Oob2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DVP6YhmWwHzVEOi79J1DkIA/aZuNachFJqQV+unXM4=;
 b=VM8V3JqEysuGAf1DsAhj094//uwo4moUYzhGQOhGnR3SHBoAVhZuV+0e6vyKdTVaI34DKwUXvsRIALzHlmSmTDU8SCjPInkKxBQ68sSIqCJt5EVAg5oD2JZBZCyIxWyZo96Yjkcx+qhJ9l2GUI75N/JYMiLm/6lUDtuZIAs9Yu4yT65IfZpBfZ0BDco3vaEtNN08n61qR4begMveTikt/FICxA9WYtGZEBSlWLxlYVSb/M9cUigZRDh5wAlC1MmXipx70tLj9LB4lC4FT52olnhk2jbv3pkZ99vMN9NIgwe/JbfxLaDZHAyLFfuoZDiGvw+xaMlgyKMf7qlSBJSxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DVP6YhmWwHzVEOi79J1DkIA/aZuNachFJqQV+unXM4=;
 b=SkBBC+enCwszIB0dgMkokGZPw0mQ/fG9yrBzeQX1izuPs3e35iKyAwhCrc8dET9pl+Ng2+Pr1OdqqQOFBarEdNQn2reqiqgC8QuFO2YHccSrQ1N8sLL1dMCYosTzQi2Q7NnWSo/Lr1JRo969kRYxH9oTNAIMc6aFhg5RrX6+NktmnwDu8FjTyIU+/MIVIO+1ZLixaGmn1dtoR8ZFGMbr2DGFt1WpJd94P20wFVxkY7ZaK81KoiIToa0PGhEfXJM7Jz6iJTd7JowIZD/j5LxYJ3ZPlEb1IEvl52lFYsWMPZolpxJr6MsaczLpH+ZF0Fc514MgUmYSOWAqhwNEkND6ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 22:20:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 22:20:18 +0000
Date: Tue, 3 Mar 2026 17:20:09 -0500
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
Message-ID: <aademaK0PpTMZ0Xk@lizhi-Precision-Tower-5810>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
 <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
X-ClientProxiedBy: SA0PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:806:6f::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 677a1071-78f3-4621-fcc9-08de79730d66
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: 3y2knW3pk77u3R1zDSM4WDyAOfGY51xqjSS5YnWJvt9BnHAmPYszq3HRH9WtFtfJ24GhfA8NsdISV0o6wNs/opY5+HN/hn7HhWuDRHQL2WXz7fmT3v5GAgf0UVSq/F7tkXlDkjybfQBAxqYFbW2fAJ9Y8g28WcWy6MFkfZCdGc1mFH9DVQrmXeUYv52WnhKKI7jSV+T/E712kkYKEtULHZlUWmpSGCSBxc4WS12C/R9pMKstbhGr02J6HyDt0aRwElxRIt6l7WwOadgXSVKnLTb0TOk7oydfwtwfFmhlN9CLwys8YAnH3LFKwRj/DaU6VVp1tap+YBLBNlsdMbalmg6N9R+5zXoOd5/I6AOVAWQOs6SjwKYk9leSb5Pejp+/9RfexBwr3mTeTPtGHNG5ZnSTTmjKyXGa7/IpM1aE64TvznkUOUJ6CpYc+LHyFNhhqPrqehNsdsagPIRmMexdHX0eRZ9lYOMX98ZZ2KNndAuVKifl5sdMfK/2gITJaPRhheCxNwrWi6ph+OVv+EupVfwJLCiLACPl8AzQBp6bah5Sq8OyW57XSzoAEI6hRTAlc2bPJmyzQXHUie4bN1yv0GJclOgfZj+fb5D4K1Fsmz0oDq5fmf1xUqLmtF//eNGgiY6hTn1YW2Z6Ev4LNtrtwrQXAK/Wg+A5X33PViX/5NnyqlihIVMRYX4r/geEvnkdrkqQQkjLcgpgboqtzV876jZVGwo6KR6xHPio3cwKRTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUKI9l2ak7PMlBOUrn6N2TrlOvraiJycZ1zVrikOxx2r6IKSlPQBrCRDWoO4?=
 =?us-ascii?Q?nX7caye9UszJFdD6Tp0/rEqMU1Dv15EnPjD52iIfoxqjnCYhfh2+r0xIYVme?=
 =?us-ascii?Q?hYZMbDVk88UscfWxsCZFxYz+2dDuRAqxmdsW/A7cukW8gFj/15YQjq41JCPM?=
 =?us-ascii?Q?OYI4HkhbupiX9jU5FajXHYflBtNzMcv7QP11P4dmr44yigcb7M/dmRmyyiwS?=
 =?us-ascii?Q?r2Gleyrv78FTWLI0hrsCZ3eNRfoQqb3hOvfxyS2JSBeVZUYCBCNDgd/K9Y/E?=
 =?us-ascii?Q?C227iQmo0VxAtvwCCM+lbN0fMn5oerGIl+6BX5Y0CD508EX4lWG1di1OeTak?=
 =?us-ascii?Q?3GbMJ5UKrDi99wZTRDYLHd0/v3z+Y6JJjfQv30FhXPOf5FYokB5S1I+R/K8K?=
 =?us-ascii?Q?DjaSVKLs25ISKgee2lnodjpk5pm1DvzYiz82mIG3g8B89bw0k74qEzb/krnR?=
 =?us-ascii?Q?0ZVIjvgKN2OrWNzLxXXhwI4pNu0UAy95i00rVc4cG0SYz3RTHBbaZkYEe2Ip?=
 =?us-ascii?Q?Y/m4sui22AIhZORvZSZLOUxSRbnXUBcY0rrhLIl7G6pwB5P2V23dS3N1yry9?=
 =?us-ascii?Q?mac3NfA0LsvpPl1RfP4+K0njn1OoLA6dfT+ulbzbapr1sjCRJZJpbsfOuvy6?=
 =?us-ascii?Q?tEsEyATdtV+qxvpGDuL+DldcZ4O9i8rYPFKHn5uKuDbNY7NeMa/M9j80ilXu?=
 =?us-ascii?Q?8p0X0sHmN41W6+8CVcKdXlIopgWHCSluQO4pUuGU/ql00PJFK+cJwKWzsFGq?=
 =?us-ascii?Q?4bbnfllOQCnbMXFmCGXSOTFDzd28dU460+TdQriORsX2NuXgaPGDCwJjPK2I?=
 =?us-ascii?Q?6HOL1cLTtRwOzjGceDUwsbqYTNNEPChkxqT7aTuo9dZiCe9U5QmRJQi/ABUQ?=
 =?us-ascii?Q?bafqyTxUb060bPFDs0KB0zG0kZic/eOisK1UXD/weLxp/g46NlmVjrh8+15J?=
 =?us-ascii?Q?lg0NUSLXFA4Egpe4+e+BuLtC/xg5T8miQ8CoMVYlrFrlfItH9MZ18/uJm8W4?=
 =?us-ascii?Q?1QuKB0hFlRHul0jXtteM0JbFLjBQoakH6QWo/RaUCtr4aa7H981RDzICm7PM?=
 =?us-ascii?Q?gFeRMs5AE8jXAxAw/ULpSY5L3z+lU6nsTAj3fsHz3ZvEcwRkUPMeR8HlQjbb?=
 =?us-ascii?Q?0RZhpWhkpUnDbTuFve7LpMHENclQiG8Llwx/ZkE7tFQ86zKN2BAN3VygjYn4?=
 =?us-ascii?Q?rbsgofYWUL7Tc3eFJO/FRqHCZqzqK7R2ziF/wdO5jyf9ti3brmXEaqFw3PQH?=
 =?us-ascii?Q?qNqJxofOh9eECs7fMKC+pG6hpFs9NElHgdSz60SMF3qXvaT/PZ+TeZSGmNjh?=
 =?us-ascii?Q?HXXrGrHAJJy33wbLDqM/49497C0n0aq1G7dD0WRcCNDWDegbkU43CH3pJduR?=
 =?us-ascii?Q?JsoEL0BWX/uwFxcIkVyFvu2wMcOBsv6h7KD5ylPoX76D0HjfetxOqdV9dTHy?=
 =?us-ascii?Q?DYgiFSGVkon8pFA8Iick23dJqCG7VCo0vNTFyMDcRXVj9eOndXqV8yr4DOS5?=
 =?us-ascii?Q?a+KhmygSVanLL47htHNZgOgOdUyvwccp24NK8KQqlr5GzEKpcLK6/Sg7EKsH?=
 =?us-ascii?Q?nJsmgHNO+3j93bjtU1p29Qkn/ix8dN1Yp5N0MJhLc5vT6U6gYff0xv3koO+N?=
 =?us-ascii?Q?lwizxqh7NoMz9itoB2bHkQkJhdAosBrCL41fVdAFU6pAHj5d0U1iK0X6sywm?=
 =?us-ascii?Q?xSOHR6OCMMTzD+6Q2BcydRHG3yGK0L4hUZjcg1f1EfrQqNtFR54jsfn9/5VL?=
 =?us-ascii?Q?dpmH1ihwlw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677a1071-78f3-4621-fcc9-08de79730d66
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:20:18.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbL0Hm1y5NYJD9J38CPs/p3klTxrKbCS8gR1BG/+3k7dIPH7GrQ08c8SPVPS1SZvF2eXn8mxeCgmvV5sPuah9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
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
X-Rspamd-Queue-Id: CADE41F7EAD
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
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,pengutronix.de:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

> +     input_fmts = kmalloc_obj(*input_fmts);

AI:

Actually, this looks incorrect. kmalloc_obj() allocates based on the type
of the pointer argument. Here you're passing *input_fmts (a u32), not
input_fmts (a u32 *). Should be:

+       input_fmts = kmalloc_array(*num_input_fmts, sizeof(*input_fmts),
+                                  GFP_KERNEL);

suppose you use kmalloc_objs()

Frank

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
