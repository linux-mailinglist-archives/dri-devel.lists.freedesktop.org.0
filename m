Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KXIIlhkoWnIsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:31:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089901B5526
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958F10E5F6;
	Fri, 27 Feb 2026 09:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Lj3WZfVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF19810EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRC6F9HpC367eY50FnvYK0IPcq43wRhQ/27xtw4EFiIrLI1s9jd5axC30oaBknSt9GyN+fPIUDFOhQVQxq0rDGCHk9DWxI45tWNyDQYIAPrlBxByaOYdCENEjBf3D9WKMMb63qznX6md962BruxOybiK7ldRo2EcdS0OyxnIxrJlkvgmVbNXvTIy2BpAzU+K58sUSvonBnLr98mO9HPCMuC3TJ50SA3nN8rpYB5D9aYbap1cvRPwyUBeMqioL5aaCKvHNw3JsQTjkUh0sPOMXAnOsCNT5GC7LBYrGlGdZ/yyfwtlT8epQxIMBrW24Tbo2JOt8H6K6ECFAMwdKEjGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4Wk/5ELCK8a6bLMs6aCw2J2mLOKLKQREo+iaFlBrg8=;
 b=hnYVE8R7iHrcueTRdJYZbrDVBR3koBKGYYdxkdGZ1rfNE2M28FVBtPGSQZMV1taDabyvQTuSav+1ckUlVHJsux+lg1fkH8Qg4mjtON+2lzZxoZP46XwOzWc93oaenbmj2smsFALLKCqQM5AdLeN1VN221zuz4Wx61tpYB5/BqIkrTDdy2STzYdexA1bURPM6Fxi4ps4KxN1Ytw61kfmrcfpjzY19Tk6cWfwG3uVCDL3SH32phcfnvi1Qc1H5x7ysa+JDdxlnd3bAf8+RnR2cQ0UlKOzhVFZGm018Wr5CkIieWVlw+Xl3teVqlDXVhJ/ZTtj4mfnUgM5G0LfTGz3wVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4Wk/5ELCK8a6bLMs6aCw2J2mLOKLKQREo+iaFlBrg8=;
 b=Lj3WZfVeVjEI91rU5f2/a39779Yjpu6bWJCnvep9TyOyXtx/rrU8VCiGES7vh0x2bHW8Mf+phxpLNj04UEnrlL+h81dsPOzNFNLrKA7vhQAOhK7ZlShjVemCAUoi0L1kdGfnXkC/yVEvrobcDIu+AFLfCR1h9K7osbWjI34yaEQvBiSyDmO2CgibKZ5ezzSn9hEjr06d9A797U0GzGQUUxx4GiU6MM7iE690lPycZhfJ3/THWqhuqLhuj/fibcoXLbf7R80D0N7ZE9K6JON+URo+Rmp6Rlq2CYB6FQDlA6B9JEVO9meWEfpUC6QajZuY/S0/sNV9viFcOVE1qurGyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7316.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 09:30:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:30:54 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 27 Feb 2026 17:31:36 +0800
Subject: [PATCH 2/2] drm/panel: simple: Add Tianma TM050RDH03 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-tianma-tm050rdh03-v1-2-cab78a0d765d@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c0083f94-1b92-40ae-4019-08de75e2e775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: OcszO+aMHG6Tb0SZZQ02Ae1086ZOWUBF1pDlp46bwx7M70RhpTEB1Wgl6lv36ch4Ja9t+7lYGe+l4lkXA/uq1lHa6AauN9weU7z4eDaGboJM/Db9mAdvawsJj549+TCzVmo0B+RUtDzm3jwsqY9LZkBcZ3uUIvITspx9WmKniBzGC6UXLxieavvCghN68zGxBePC5zqye1VEKBumeOJ84LBhwthczVuMYoDjAnKWLCoukFfXKjgx3DhKLia0r95IBua7rpy8rohIqOFI3Yms9GuGgQ5k1+u07ZSJ1y9RAAerhZlD5yEUCDaq12oXUksMRFRtFFou8IT5YNZ5UdOzx+EjmhaIN0FNnBrWMuxo2XaJeyZGfl4vohnHqDgU1iwCzysNd9/nq/OYpwvOksXwJsPOOJO9HL0UhcCKPidr3HWTtFTR4QTsb97+HbzUms6fLBpOXh7RL9WK506+oLp6fX5gcV3xSVKUpz1bG5wImEP9DnyVLjHcAdPA4EG12KWmmqy8kQMc5sbgI1/tYozE5XNgs58pJsrWuKqi/2syMzGsKo6ZoYe8DQI1fTg9CIlihw5hJnACIcj3O7qE0CWlE1MDvzgX1HvbhS9GWWqoU8sXQIhtqE9m0CqLNE1Fa2/o4PZTNW9Nl9X9PZjGa+RWMmrrVYNWXs0ds7ICg8OHOFi5/SXi/Ne7Pi+If4lHPw5m0KhBbpJkAGTKTeLYwKD08O20XoxYU/PAMaJUb/NNw6HISO7Z+YdFVhtUT0Ecr/lz7EPj0mWueNatON85k1Rq4uUNjemC9UZNwcdMfGYCmTuB0sasJcZTANFfvRiqwn7I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WERUMFNBUUFPTDdXbVJYbjlscXliS3Z4N25BU2plbyt0RStYenVraWdjVjdM?=
 =?utf-8?B?VmNlajBWa0paRkZmWTJXcDUrZzZncExaajZiamdPTzF3L3NnSFhXc3VlSEw1?=
 =?utf-8?B?VUVGdFI5TU42VG9TTm80d0kyeERhUHI5bnk0aERLYW1QUjh5bGo5UVEvNXhK?=
 =?utf-8?B?aTIxMzY2anR5ZlF2cFRsK0FGMlBSZUFCQmpmSExKNW4xaS9CKzdHMU5VckRD?=
 =?utf-8?B?MnZVazBONHpWZjkzcHJobVV4Tm9GV2x5Y25CcmhTOWlwbnRadGVhbExueWFm?=
 =?utf-8?B?c0lBaW1DRjd2TEVoT0lIQ0NYb0d2dzNNTzhDdnZnZGlQY0xhZ0dGUUJFeVRa?=
 =?utf-8?B?dWtvbDIzYW9NTWxpWW00SGJIbHV6VHA3OWtNdUp4T2pEczVqbk44NG1mRmp0?=
 =?utf-8?B?bjVIKzBHZHJHK2RkNGFyVmhuUkw1akg3bGRESTJSK2FEc21zYnFrQnRmQjk0?=
 =?utf-8?B?bUtreDhmNm4yRkNuZlIyNjBPQ0NCdHJjTFdreDRVcGJ6U0QweGRJVzhVZmc4?=
 =?utf-8?B?dmpnN2NiUHF6aXEvRkUrdWVWeXdUVWpBOXRJZy94clg1WnJ3U3dyd25jRC94?=
 =?utf-8?B?MGRNK3hpMnhCVC9uSEFJZHByNW44bXJGTEpIeXlWdFBaT1FuRzl3UlRRVGZQ?=
 =?utf-8?B?K2l6ZUNzZXpxcUFOelB2QmtNYnBsWEp3b1Z3TkVhbzIxdXQrTm0rS2laWlVz?=
 =?utf-8?B?VXFoSDFKb3FkNzlZckdwbld6S29LVXhFNUNobHdlZnVVb1U2NmpMR25UMXph?=
 =?utf-8?B?cy9nckw0SWRoOURQaGZGT1pSRm1BUnhFM2o5TmY0azRYemN1THRMeDRCQzRM?=
 =?utf-8?B?Z2w3R1Y4OFFKYyt4cFlaMS9lREp3YUYrclJ4Y2NHRWNMWjlTeExKWnRRdU91?=
 =?utf-8?B?TnlxeThLUExMaWU3bE00SC9BYTZ6b3U3WkNBbHI4WWhsb1Z1ZGZvTkkvWWhR?=
 =?utf-8?B?NTFiS1NZNnRPaGlWQlEwdEtoSEpKU0JoNjhJL2VaeFZ2cU9mUlllVHh4YTdv?=
 =?utf-8?B?bWJFbzl5bFpoNm1CbmNueHIreFFFOEJ1Ry9sWjhWdXNJNFdSWUhFRGJGVC9Q?=
 =?utf-8?B?NW93WUNQZldIVHlFQlRabHo4bmo4eWZpOSt6Z1ZZbW9XZUl2cG1oa3dIYWh0?=
 =?utf-8?B?ckVWTHNBZFhkT3ZrUzFwczZubEowS3ZySEx2a3EzaEVJK0hwY2N1eEpiMmFR?=
 =?utf-8?B?dk9vNzRHM2JtZDNwMEt0aW9UazZJNzNJeFNhdzlSVks5VU4xaStTOERhVjRG?=
 =?utf-8?B?TVdMaWdVVENJNHlrZlJ6RlhUYXExNDFxUzRTZkVKN3Q5cGt1cWhQWHk4YzRm?=
 =?utf-8?B?bTZsbHBJcjhLcXdzNzJPUHJiSGRTUXA0LzN3RTZNd2dpZDlZOVkxdk94VHU0?=
 =?utf-8?B?ai9sOE9sTGw5YXdhcVFFOXJGem5nbWdnMlpWdlRheFhGMlpma2FJc2JFU3Zi?=
 =?utf-8?B?Z2NFSW9USCtkbkdZSXJ6K096aldLQzd1M2FyckZoZGJCM2JmWENDN0o1L1p1?=
 =?utf-8?B?VFB0Nk1ZY3ZiZzdqQ244ZjhwVHFYNUZ1bVd4NXhGWHdqSnpCNUxDZjJsbVhI?=
 =?utf-8?B?N25USHBrQ3BiMk5YSWFWT1RaRzBSY3hIRGI3RkNiTTlpU1oyVWpRS1ZGKzVa?=
 =?utf-8?B?eGNiL0YxbU9mUG1jbUtaRUIwaEh1YjN6ZGpPbTlBdVp6WHBDaUZmVmVhcDEw?=
 =?utf-8?B?cmhRYkZlUWVndlBNZmIyUWtUa0RkSHJ2WTZGSUFSWitCdXc5am1mb1ZnbHFo?=
 =?utf-8?B?VXR0R2cvYSszUi9FTFB5L1NXUnJUaE5YZzBmWnI1aVdGWmxCUnJJcXRidWww?=
 =?utf-8?B?N2ZFc05CSVdzSVdXbzNNOEk0eEtFTi9Ya2ZkL1JxT3U2ZnZka0VGSFpnOGMr?=
 =?utf-8?B?ZDJ6MmpaWWFsS1R0RzcyUUQ4QnFrTUhPaXJBcTAzNy9DUkZDd3M2Y1dyZm1t?=
 =?utf-8?B?UzVWMXhhNmUzbnRTWlVlVWFCYVJmdENHWHpWUnhMdHhuWlZiY25pbUdiRG43?=
 =?utf-8?B?ZnR1RlZtY2RNSzk1T2hURm5FMy93Q1puL0VlaWdNRVdNUEJjamgwWWtkYUJi?=
 =?utf-8?B?dTY1MXR1N2huWjZ2WkxMVkt6L3l2UGVTSGtnUDROTmJKVU5WSnFCY3laVGZN?=
 =?utf-8?B?d28vS1lHZGQzeXRVd0VIaytoU1N5c3NHbDlBbllMYWI2VVljQXgvSlUyNWN1?=
 =?utf-8?B?WlRhRmNzMXNoS3FVaGxyQ1FtSjlRQkZwejlyUGJ6VnlJR05STzZxbHRZZ045?=
 =?utf-8?B?dTBlMUVZNGtCdm5ZSUNrTFJTVlltZGhpMFNUbituRWc1OUhxTWNLdzlsRDlr?=
 =?utf-8?B?YlRXTnRWbXpUQzVZd1JwRlgxd3I0cE1aaERCZE40cnhLcnVkMkFwUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0083f94-1b92-40ae-4019-08de75e2e775
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:30:54.0817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2k6+6zOmIUj1aPG7nAzEpgVQ5BO8qoXOzqEO+4PlJupIgylE4v3A9u5IPupBlhOQuLkMKVoZtwXSsb8hdvJ0HA==
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 089901B5526
X-Rspamd-Action: no action

Add the Tianma Micro-electronics TM050RDH03 5.0" WVGA TFT LCD panel.

Reuse panel ontat,kd50g21-40nt-a1's panel description as they are
identical.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e5fc9b072404..af84a90015fe 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5519,6 +5519,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tianma,p0700wxf1mbaa",
 		.data = &tianma_p0700wxf1mbaa,
+	}, {
+		.compatible = "tianma,tm050rdh03",
+		.data = &ontat_kd50g21_40nt_a1,
 	}, {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,

-- 
2.43.0

