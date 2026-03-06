Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDhjDM+Mqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:14:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB921CE9E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8767B10E3B0;
	Fri,  6 Mar 2026 08:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JqUT1fBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA7010E3B0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crUTMy87l2I6SX+iHDnmcVEqurxGY2ztK7Wr8lgx43RnCq/4XFpX6Q1ngh8blOs7ygdX4z3hnwYLCnNcPo1VdQhVz965uGLvs7Jjt7A09jW9iAz3zBBMbOyzWNUY57QlqhsXAIcpa4f1PQtD2UQDNSN9/1Kil5EfYA/RRjLMlAcIPJbe3gwwhJC3DhP/taLi4RyVrSYpS+XrdWZgF/OEhms3wdVNou4986YFkIl2z1lbr0WLTo1J2oe4AqI/QwzUgEy2XZdDAG5Hii5ffqSG6QV8e9O++P2l4Rp2LPgSFk6gj2NuqloHDPnI5dEqScTtz8DFirsNsvlrwe6jh4puaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRHfHjtuQFSu7Z6JWG8m2+m7a9ilv/CbeSQYkZXuzP4=;
 b=VVXRTF255nxWz3mf1RnNKJM5aLaL9ldw2pghbCOncEB9cR7KU8fx4hbXN2LfPpmy0VdT7V3TRrxhlUfjWhU/SdobPzN6JtohbJfjt/cIfjFNSGVXGiaGonqJBoXYs60OjUzdaIvbh3+sBKeoXs1iYWQQnb2uU1iz/vTntOTWBjxRrtP36krym8YKyyaenx5hOH9NlPHexkOMdgIH7T5yeUYkxHiF+/p2Eq/alVIHerxUAKOEzwC/WfHR8xWPhKqva8dh47FFJURkQmoLa4+i02UQ6CWFejkZAntjVsh9CcLogyy45qn+jzXxBxkuJolCksgRLwA6bxhQHeQj7ocmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRHfHjtuQFSu7Z6JWG8m2+m7a9ilv/CbeSQYkZXuzP4=;
 b=JqUT1fBXftmGoZw7P/svJc5Z5F7fDvXsr5mccXxXFmtVPCpudpCQulzxvVe65/HmWc4V6PNM1Bq2HbPGKfZ44sbGHydQWEOT9BdhT63STmyFPCyEEbC9XlowCmBnbzNLQOA+v7xGlCJuXFVKBcT8ngJaUHCMHxGRpNl0LSZU4WqjqdF7h2PJ9wow4lnJoCEfZ7gymElJ9PBOGB1J+xK8ixPg4snwzbNesnR43xe5Uln22CZzVCBmcVC4QVnklTLQRrveKlyTUw/iu86091yrJcfy9t2zbunOAVeGcIVarrOdxZc6a/sGUDtxlLimU8/p0c/72C4d6w05ArttuURfhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8632.eurprd04.prod.outlook.com (2603:10a6:10:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:13:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:13:56 +0000
Message-ID: <74f86fec-0c56-4b48-a000-b46cdf61e651@nxp.com>
Date: Fri, 6 Mar 2026 16:15:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-3-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-3-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: a782a0cc-e48c-49a7-130b-08de7b585009
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: OHlo1yvkCjyd3HdQ3PCNWWmqYFVGjNprdAF1jQL1DcXMz3rwD9NysfCpOeUr1fO2SGedkVru/Jx/64NqETgcWmrpuQFY3CI9ySW3WSvwgn9XwtED8THLQX9UzzXToQ3pSQTMj6+JBHw1u1Qo/zFsJGgbVz1yS1RdWkBiw0PFqFZVrfOin75vxINLF/M35pSB7sOFiezUWxxvNJSgV6qCi2Q436C4H20XSlQ3NzJ6/nvfbUSFytSKKiMBR1eB6pgTs7x++w0Wp22EtZkkH90EpE1vkkI9g2h+JuVFJAFSh5L1BVTUW0Tveliv8laJ0YxMWHU+DrsQnkJ2FNcjhn87vILgWS+wiCmo+SAKEqt7/FPQP/0FhDvJdpjocNB6J8K9YV00LxVml/hZN6RVQ1H/lRt5efktkGUQ3PSD6xeMgmW0bnyvQyHmknxyuCNSpKEKTdYqMKviqqH1MO9Y8zAcR+j5xdLDMSrt5n5MhUsWp5wZsonqVjgN6/r3OUU+2MLdkW0YRevppwyRTeuTFg6k1C/VMiLe1By1T7D6lo+QzqUdSkVeRKqL9oDhDAfHtUFvym5S8ikwOAuRFgR+IrWJSxtB9uj1lGDUqgodikt6S7wHBKrHSMhUeuz25p0funX7+gOH6uAUbhXfJAs/GEECRow10HiKVLUt38QNI5FiqPQoZAOhw2o+4NCq5pyYlJds5YVK3qEcTMQyRFjq8vA2RwNIVoPjNUoW+lE0srf8ESqyvhjK9iYBk/9pFoqsOLJzIofy3MIV6I65F5lqMYpm7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlo5VTFodUZRUlpyeDU2aHQxRndOSmFSMjZWVkJ0Z3g0dDhyQWVpSGVaMUNa?=
 =?utf-8?B?bkdCclBLNHZaZVlWZXk2M3k0dmpIRVRrdXhaUXd4S2R6ZWJuem85MnpIYTRP?=
 =?utf-8?B?Qm5NbG5KeTlUczl1YUZDOStwZ29xejJsdFJub2w5OXdTUkZvcjJOeEZ3SWlh?=
 =?utf-8?B?aVEvbVEwZDJxaDNFQ1Fubkx4MFZsQUgyNzJ5UXEzbUYvSStrdmlnWEd2UzVv?=
 =?utf-8?B?ZEQwdE40L0JlaVZYUWpqM0JzcEJFV2VJeFlZYVl1RFNMMy9YaE1mNURKbmlV?=
 =?utf-8?B?eVhDNDdwcms2aHM0cnJTbWxYc0M1Q2xVdkpSTlplVEhGKzA5c2ZrUmpQUWJl?=
 =?utf-8?B?Z0xhNEFWN2FZNFZ1TktySXBXdGtmRmZBYkN4SEgzMFFXcnRDTFpscHNsaUtH?=
 =?utf-8?B?OHNGZXRQaE9BaFJsOUJJK2ZFMmxwc3l0ald3MDJ0WkF1V3JXNncyd0l3NTAz?=
 =?utf-8?B?eHlIN3E1UCtaUks3RVVLdllrQUJTL2hDNkVkRkFMVzNsendUZ3AybFdxYnRt?=
 =?utf-8?B?SU82b1dDSTlnNVNOWDdOT0gxcndmeFJVMnBRMy82NVB5S0NpQldVQzFicWk0?=
 =?utf-8?B?OStJYkE2T0hEWHRUUDdnenJSZDFDV08vVDgwbUU0TS9hLzYvSDRRcU1uREtV?=
 =?utf-8?B?Q0NwdTdjek5zUWVpQ05UclB4d25nQnZzRENKWXYrZWF5OENsTU51R1lYK3dF?=
 =?utf-8?B?R3NEKytSRGlkUnJnanBqRlhIYTl0eFU4VU1FSDZBWDJWeUFvSzMyVFUzek1O?=
 =?utf-8?B?ZkN3cjNVOTl2RFlSTFlOOGMveUtIR05nR1JSVzF5V2V3R3JxakxYcXU2aWRh?=
 =?utf-8?B?WXNMVGlLRDZDcko5ZG44a1RBTkY1ajlRK2xjUEYvU2pUbjRNN3dHRWovYk9R?=
 =?utf-8?B?ZDcxcmYrYTBFWExkWjlpN0FoOEg4ZkNaNFE4azJlUDl2M3ROY0NZOEt0RnBP?=
 =?utf-8?B?WUdnSTUyblFMa0NSeVlnV2xZV2NyV24xWjBFSXJHbUJGWWNtbkVxZUlkNzhJ?=
 =?utf-8?B?d3o3ZDBrSjZHeFZDVVFSTDFteS8wZllnczNGVEx3M2Izak1lOHphNjBsUlpz?=
 =?utf-8?B?aVpZMWE1VWxod2ladmxXYThwYVV0TmFHbmdDdk9oM1pJZGhuNm84WW5lb2Fq?=
 =?utf-8?B?ckN0d1dPRkcyRWZEQmZ1bUdUclFEWUF6eG5VUGlFS2N3R3FJRnFhYlZTNUpz?=
 =?utf-8?B?d2xabXRlUkxtTVgwcnhtVVMrcXcvRklmRHdyV3I1aXlKSkdlOEtPaFpNSGtU?=
 =?utf-8?B?ajA4ODNXOE1yaW9KOThJV1M0V0I0bFdaeDdEVHppcWh4ZTZ6cWV4RDl3Mkp5?=
 =?utf-8?B?TXNQek4rcGRJNG1ZUUw5cUJnallyNmdNcU5ieFI0QmdvdFFOTlFPaTZ6cnZx?=
 =?utf-8?B?NkVkNnA2K0VJemtCNmhhZjR5S3N3STYrd0t5dm5scEVHclJmTkxzRjdUNWVI?=
 =?utf-8?B?eTg2TGFERWNqWE9kcVBPQmtmUmZTTVZqWEhoTk5DaDd1aVlscTBCZnU1ZXc5?=
 =?utf-8?B?c3JuN0tUUVdOTWFBSmIxQ1poTmNFZkhtUTlmRk9lcEUxVU50OXk0a1ZTTWt0?=
 =?utf-8?B?SlhDbDdWMkN6bFozOXMrV0xLUVU0NG5yK2RaaUEwUzZhWXl6cnVFYVRSZjVj?=
 =?utf-8?B?YU0vSTZDN01jZjh5d21TL3ZIbXQwR3haWVllQ21IQTJxZkRhTWdDUjZpdjhM?=
 =?utf-8?B?OXhtbDdCNVZ0YW1pU1J5cjZjZlMxRUkzMFBjdXBoWk15S00vMFZWcGxReDNN?=
 =?utf-8?B?TFcrTXkyVzdGWGNXRmxyZWEyNVZFQ04ydnB0OVdRY05xMWhVTTdZQXBTajB4?=
 =?utf-8?B?WXdPcGRLNkRqamFtZUVuT3R4TU5EcTBlUjBTSk9icHZ2VmFjUEhKOWtlNkZP?=
 =?utf-8?B?Vzl0d09SK3BaT3o1Y05kM0xZNnJRbTMrVGZ6TWhQOU91KzBGZlZMRVBmRmFI?=
 =?utf-8?B?VS92MG5pd2xsaTNHbVVtc1lYZG1zZzIzWVNEZFZmOXRNOWJBd3V3KzA2ZEh6?=
 =?utf-8?B?YUJVS09EV0hZWUIxNW9DelQ0UkZ3YTEvWVlTMWdtVnB3ZEJTa3kxTTN3MFJU?=
 =?utf-8?B?S21mY3ZLdDJYTUZKS0R6SDF2eklYdW9SVVNtYm5kVTM5MUJENTRVQ3dSRVQv?=
 =?utf-8?B?ak5qZm9kUGxydk10VHNkazFVOFZIWEhONlVSbEVCSlJqbVpQVkxrSEh6T1RX?=
 =?utf-8?B?WDg1eEdDS2o3aVdPU29qLzBnKzhiTjR6NXFvdVdNMUhjRXZjZDYvRU56eEtW?=
 =?utf-8?B?NlQrOXRjWHYvQlR1aGpSSzkvS0xkdjQvVTR0NzRJQ3FqRXY1bGVrZ21qVU5Z?=
 =?utf-8?B?bk9uUW93d0dHcGllQTIwUDRicE9odmRnci9nWjdDWGJRbXh6bFNyQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a782a0cc-e48c-49a7-130b-08de7b585009
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:13:56.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfUGjdnyzVPRFSt3dm7CA5uH8K4G4Fi65Tuqg/R0OGPR+qp5gXiDC2hCraeUmAHsHs4fpAFgzjofJMtqJv3fgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632
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
X-Rspamd-Queue-Id: 92AB921CE9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:luca.ceresoli@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,bootlin.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:34:12AM +0000, Laurentiu Palcu wrote:
> i.MX94 series LDB controller shares the same LDB and LVDS control
> registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> frequency.
> 
> Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> be able to set different max frequencies for other platforms.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index d59f26016de26..1b8f65a817a25 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
>  	IMX6SX_LDB,
>  	IMX8MP_LDB,
>  	IMX93_LDB,
> +	IMX94_LDB,
>  };
>  
>  struct fsl_ldb_devdata {
> @@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
>  	u32 lvds_ctrl;
>  	bool lvds_en_bit;
>  	bool single_ctrl_reg;
> +	u32 max_clk_khz;
>  };
>  
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  	[IMX6SX_LDB] = {
>  		.ldb_ctrl = 0x18,
>  		.single_ctrl_reg = true,
> +		.max_clk_khz = 80000,
>  	},
>  	[IMX8MP_LDB] = {
>  		.ldb_ctrl = 0x5c,
>  		.lvds_ctrl = 0x128,
> +		.max_clk_khz = 80000,
>  	},
>  	[IMX93_LDB] = {
>  		.ldb_ctrl = 0x20,
>  		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
> +		.max_clk_khz = 80000,
> +	},
> +	[IMX94_LDB] = {
> +		.ldb_ctrl = 0x04,
> +		.lvds_ctrl = 0x08,
> +		.lvds_en_bit = true,
> +		.max_clk_khz = 165000,

i.MX943 TRM says "Four lanes output at up to 148.5 MHz pixel clock and
LVDS clock" for the LVDS Transmitter PHY(LVDS Tx) module, so this should
be 148500?

>  	},
>  };
>  
> @@ -275,7 +286,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  {
>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>  
> -	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> +	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->max_clk_khz)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;
> @@ -384,6 +395,8 @@ static const struct of_device_id fsl_ldb_match[] = {
>  	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
>  	{ .compatible = "fsl,imx93-ldb",
>  	  .data = &fsl_ldb_devdata[IMX93_LDB], },
> +	{ .compatible = "fsl,imx94-ldb",
> +	  .data = &fsl_ldb_devdata[IMX94_LDB], },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, fsl_ldb_match);
> 

-- 
Regards,
Liu Ying
