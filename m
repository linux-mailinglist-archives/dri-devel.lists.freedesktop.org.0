Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPAZJVBkoWnIsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:30:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB61B551F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969DB10E5F3;
	Fri, 27 Feb 2026 09:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VmLGdCXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7F10E5F3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GddZ9y5UxYHjBUaFreLTyMdVqeaBFppwYK+VTouHiUH5miwYjq7iFUQucQ0xv2yYm70GRK02IMavIGBT904EYfPWpv9Ejwj0JNPOeMvXZVKVsBiBZHdXAvBEhQbLsY58Zyirnu/ZqwKbHZk/hcxWnfy+JSCl1e+Lc5S/yVrRQwCJEnD76uB0BBNeqzuUhhUQUDPpbLHCLYxVlO4uS+GlfBX6gbed302RxGc7w7+7VKhEHRmP8q7X0X0EVP8xteBRCrbW79KQ8dcVMOST3CQ4zPY+vcvZykwQdh1KeqOJDHNkEoC6fDCyAkbtoI7Jj61QpJugow6D4GUgFqfJnkRW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiR3VtSHFaBRLDy5w8SxrDcxMtVENFTXKEQJX2U96rw=;
 b=A4zxey+QHKrH5dn6pXZqW4A+SjDBQNy2jQUTTxfQaiOqNoNvT7TQcgLTPsYofdu1a6Y+n6HAKuP2qHjmEPn8+AdQIRqU7KlveeSr/WQ6251L7SrV/VFqAhxHxTbqVT4Rpcx4IvcgoedseP69kc33akQs9VZVswaTt2ZPDfANbS7wdKveeFZ9hnke8Y8qooHxVapqlo5PU5wUEvEVWpNSoDnt2KtNbs1TvbHaNr2rvs3LCOOs+xVwiqSkGEjOAY/6zk63zxViimZc5unIIVsA7oCFtyVJ54G3TKFMiloWTpvLRaun5hlxNQnVqDLjdLZAA3u1aUD4n476aLCJ1wja7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiR3VtSHFaBRLDy5w8SxrDcxMtVENFTXKEQJX2U96rw=;
 b=VmLGdCXUJ5n2/HOKvHILecQnWrQsXOAl8UDDOO5CYXk+ZYdrr4xxb73OWt1aGdH5rZ3r0DXp/wFEhWA4v7LjAN6au1AisecPlbNlscyZFbfvQOBZ41WGRNhsKAnGpLv922zjZ8AXO/HHen2OefGkSQ9wB2NhtsfCRIq/QmyHf3v8D3qqyrvBdH6YaJMKch8L6atwsS1lQKoIjAXUgDXKNTLSetxXSjslYgp8p432YOYI0ZdtR2zJvt9tIoLHjPYs0BVtKSQshJpyB4SHD+3zGd24XmJa3MNb0u/Ghnvy4SFct8ToK25EgVaAB3hwajU9AJNLPccF+9h9MjP/Cp4Zhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7316.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 09:30:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:30:49 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 27 Feb 2026 17:31:35 +0800
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Tianma TM050RDH03 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-tianma-tm050rdh03-v1-1-cab78a0d765d@nxp.com>
References: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
In-Reply-To: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 16284b54-3b12-4057-7c59-08de75e2e48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: kShEAIzcAIfgUZaNzg/i5sJg/y8aAbKNuqEvniR8r2obzgsgBNa+AMBMWEYQAl1sp+T5RXfwcVlg66tR5MOVHeFum3FMqPlQEQuSUQULksJ/iUHzvYLgikD2aBTy1R2azQQY7Z3z+fH85w/IY5fAEmXnLmz3Nfgg6syOkjiHGOAo8g0Awmrg/wfuZIKhdDWEGn8zoq4+famrCLI5WSVx1XgPv9QpxMlf8ZWofn5/E3iPugcsfTCbcMGkRpo0u3MLpOOtUib37SYrb2VYKJd82bNp2bLCIjfowkNOpQenhlT8VgPspsQG+zz+h7NQLSgsQBDluNDZZx51MFAuI03G76IwfUnQC1L+xEEeUXpCYtrIBW5VITqxiuzFBvgRkKaL9aiF2oZc7puzMgTcsRfmxyRMj7rX4Sbk2wwSeU4/ZfVBIE3pl2zmgMu2ttKQenmuksCkO43znNaV3U+9BmvqStACntTHG4sNNUDkMc6RO8yPgkzn6vojxGFKM/luVhRrUw0Af8t5+qppBJNADbukjhMylf+egfV2tftvn6AqEMmK4J0YzbtZL+Jm0yG+jXY7GFkCvU8m2KQlosOb4mrX6AVlSjtpiSWqmw1XA7/hZ9+paF8o5bbZ2+VqFQ2z6VSsqgS2XtWMS6kR85AOJ+yPQrU8TTD3nV7eRxqvKbhbzSM+ZsXiVEB4+sv6aGvdzm4woyEEmBPD2nObSzxL7A3wckwp6TcPss/AYdEjsGFdFLrudI81PdSPP4vMTzM/vOkspVarCCIdGXzVEEYzLaYpszRpEL0OG6L4/IIJj7zU3dJ1LhtZcKuE/vUrTIevzujd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFNMzBnNWJZUW1vOTBxVWJMWHdUV1ppdTByeTNvd28weG9uOHJRdjgrdWJY?=
 =?utf-8?B?Mm5SRXd6ZUM4bkIzMTYvQVRxbjJVM1NLWE9MbHlvZW40NExNNWdDS0JXWVN2?=
 =?utf-8?B?eWFDRU85dXJHNWI1ek8zcmdVRTA1TkRNYjRnNWloYzdEOGk3SHVmVU04bVlE?=
 =?utf-8?B?d1kyaERzcHNCd2FRTlZ3bk9peWpOR3NwdTJsaXJuNWFhdEY2VHM2NFVpRkNJ?=
 =?utf-8?B?ZGJ6cXBXaFY5NTk1c0hiTUtaZUNZWnU3VEd5U3pnSk4ya3F6T3JJeUFmeFZF?=
 =?utf-8?B?Y3pqZllwSnRFL1dZUUx6Q1BXVklXSXA4MWVkVi9jekpOdlVCYkhhampLWDhs?=
 =?utf-8?B?VjI1MFROdzA5SEh3bXFNeHRTVG11T2FaaHpnNEFLQmVFaGZJU0MyZHE0TnVG?=
 =?utf-8?B?S1k3N1JTOFM3QlRVVHl5aFNIMlR6ckdma2ZVc1Zsc0dxSkF2NW9nalM2NG5S?=
 =?utf-8?B?clFwQXlqTkRxTTJWWE0zYTVDU0RQNWNoZGpFVkxDRVkrMG9hYm5vdit2bFFv?=
 =?utf-8?B?OWR6Vmk3VE1rM2FCdmZzckZ5Z2x0VXh0N2V3NmFnRXpTWGZhVjhmRVFoYXBB?=
 =?utf-8?B?RlNYaVI3NUpSQTJvd0U5WjRmUmFGaWZvcll3dmFLMHo0VW9za3FGQWpXME1o?=
 =?utf-8?B?NUQrekJaOWJ2Z3FlSGpuclE1WlhqMm9GNGQ1NndaaW9BVFluVFNXN0dVZUJU?=
 =?utf-8?B?OWxRNXJ0VmU0MEMycG9UYkFabHZKeUV5ZmZEV01NdXd1K0lFcFZBSFpTdUVR?=
 =?utf-8?B?VGFxSGhiOTNVN2lKWDdDRlF5WElqVldqdHByb2NvamROZDVSZ04ybElwUG13?=
 =?utf-8?B?YWVrNXdKeTRDY3ljWXFoTzRaK1V5SUM0Skg1UjExVytYN1A5cnpXeW1CVkUz?=
 =?utf-8?B?ZG5FNWZzZ3ROYU5sbHA5b0d2Sk9uUVljYlNMa0lsekZMQ09wcm1sa0J6T1lz?=
 =?utf-8?B?dWxWOTdOcUU3TVhBZnNteDl5Y1lOVGRFUzJFQW9xeXBYeWhmdE1RckRlejNT?=
 =?utf-8?B?UjlIZzN2Ti9YNUJvL2NkbkFQVHJVbHZZSzBpam82eG5zSEZydWtKVUZvbW11?=
 =?utf-8?B?d2sxYVRoODRlWE0zZTdMQzdrZTg0UjVaYXhNRUJUQ2V5clFhY3RRalVJcGhZ?=
 =?utf-8?B?ek5Cd0RwaDFsbzNrbHZrK1NkR1BCeGd5UHRZSWhWby9EV3dRT05NVnZRZ1NP?=
 =?utf-8?B?bE8xUEVSd3hmUEUrTVh2S0FYY1ExWGM3dm10S1Iyd0o3MkFvM3ZDRWQwK0Rj?=
 =?utf-8?B?ZUk3QytDK1VIUW1tNzVJa0NsNGxpa1oxWnI1QnZjT1cyYm1WZ3M2TmdxdjdV?=
 =?utf-8?B?RHFGTUNndGkxeFpNRG9ONG9hNFJzZHB1RndyUXNEMTZBUEpEdXpxVUVKcUNM?=
 =?utf-8?B?cTZYVkE5UVIyRjFZT2graGRHRWErQlEvTW1mc2VibnRmREtYTUszS3BGUHM5?=
 =?utf-8?B?WmpIL1hDSDJIWFFTUnpKaVF2Vm9sV3d6VXpkVWcxdnovQkFyQS9rQnppNzUv?=
 =?utf-8?B?THY4TUZBbTQ0eDVJOUF3TVZUMWphcGxIZkxSNWlkV3hIT0pTVzVRYXFBRGpX?=
 =?utf-8?B?V1VXWXlBUnM0S0VkWWJZb2xEd21hZ0V5enc1U2Z1d1gzMUdHMGxkT08wa0Fa?=
 =?utf-8?B?TWFtdk51c24rTHBXMlJjM0pEN0tKTzlVSTlmSyt5UDJUSmRpSVRScFErT1Iw?=
 =?utf-8?B?bFExbytYMGE3Ri9NVTNBYmhVaGsrbjhZRUN0SGFoUk5kY2dBYTRJWnJ2UDNm?=
 =?utf-8?B?T0ZlSWZEeGhxbEphblVzVDFqcE42VFI5UFpGSlZiRDJLb0RFdlZmRkJ1aWE5?=
 =?utf-8?B?b0xDWHhDdXVJeCt5UHN4MUJvb1RQODFtb3lDM1AzNm9IeGQrQU9QUEdDQTBM?=
 =?utf-8?B?SW1ua3p0ZTh5aFMyOXVsWXhmOEY0aXZqMC9EYVR5V1VKKzBlc3lYZk5WNmZO?=
 =?utf-8?B?bWk1YmFZYjFnUjRhNHcyV1lja0RFK0xVQ2J3YW10TWo2Yzh0R0dYM3NjTUNh?=
 =?utf-8?B?ZGEwMW8yWW9aRnY4OUx1RldEQzF0MzdGV05WaVhQY1Z3ZUp3R05MTWlhTk9U?=
 =?utf-8?B?VXNZQTB3WjBpY0hNaTZONExNOHkxZjlScWltdVF4SjNpNXF6YXBmck1RcndU?=
 =?utf-8?B?Wm1kbE9ab05HNkd4QlBqenpHeDAzN1VOZmlCU2JPOVpIU1ZhV1F3S3ZDZCs2?=
 =?utf-8?B?VmVqWmNNSSt2aVpIRjcyK3R2Wk9ZMzhwK3JsTTFITXcwdWJSNlB5SWpzc0JD?=
 =?utf-8?B?WXpLeEx2bGM5N3ZPTCtmVWJveHhic3FpcWtpY2Z5dGJPVXpvTmRtOVhFdWM1?=
 =?utf-8?B?WWorblFCMlYzdEZRV3FtWTFnNVFKZnBuS21NdlhPcmNQVmNySW14dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16284b54-3b12-4057-7c59-08de75e2e48d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:30:49.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1S4kLmz6beentavlur+H38vxA4KfG612SizPz3Pn4TC8YQBmrKTrVXVtU+ouDAgB+vwoUyfiH6FMBz0YB3FqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7316
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
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 44AB61B551F
X-Rspamd-Action: no action

Add the Tianma Micro-electronics TM050RDH03 5.0" WVGA TFT LCD panel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 106ae91ff474..a8f1f5989a1c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -306,6 +306,8 @@ properties:
       - team-source-display,tst043015cmhx
         # Tianma Micro-electronics P0700WXF1MBAA 7.0" WXGA (1280x800) LVDS TFT LCD panel
       - tianma,p0700wxf1mbaa
+        # Tianma Micro-electronics TM050RDH03 5.0" WVGA TFT LCD panel
+      - tianma,tm050rdh03
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
       - tianma,tm070jdhg30
         # Tianma Micro-electronics TM070JDHG34-00 7.0" WXGA (1280x800) LVDS TFT LCD panel

-- 
2.43.0

