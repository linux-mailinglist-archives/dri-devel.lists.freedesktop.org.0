Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA8yJkxkoWnIsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:30:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03401B5518
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3910E5ED;
	Fri, 27 Feb 2026 09:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="A7M5kOfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76EE10E5ED
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psN4tuea1/Uin6Fa7noqzY6t03B5TkUy7Kiw3ZsDJ3znwzmRwD70JAbImACZfaRJtFNmc+UqzFD3/ClUKfnh9Y+2hJG+F0GnpNhtT3p9ljBIbAORJ4yHIid4mcEC9dPLBozFoAbui8sc5P6gEu/MG69JscTM/yal4Fgs3ZgZ6d+teC6X1GiceLPug/5gRqFMXVZ3q4WZmIKxcLcKGw2r7OQgupIi5NEdPQaaTqHVx53uyKl6JT/9R1pDKpSgoSCNgmgQN3Pp0ROearArEz+jaBwnbDYC/qS5ObqXmMQEY2zywVjcwAozBw0GBPUJdgCWthFwBQQxsiWgF4jQpw2O+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nxLeUtN0CIB9UZwmQhlzFoPSSx4bIprmSZhpF07GIY=;
 b=S5pKNqLY7+az68U+pcKPpstOem4JiEQFBQ9XmWQp+hqLeGsVtgdBK8pyq9ckK9+lQPaAz+bBUScT5DuyILbvtH83GHhahrUiStx+ggPYnoDFCNokZ3rA9Ejch1DmbR+gv5/QH3bE2/wA5GSTwbgY0b4m8by61RbJBh22E4Q7och+mCi1vlAjAn776MtxMlHYXmphO7XeesjfUcVi8mMSctS99ghcj9yWGEOf5sWqoGU1ew0dO1j6rRA5Dm88Ql5s+DflPlUXaKZk20Ss73zQeMfeOQZI3B33lMj0KuE5BV+QJ22Ob9p5e+yr0HdfKWAsTIqv9fnUcGikCdVIHjbNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nxLeUtN0CIB9UZwmQhlzFoPSSx4bIprmSZhpF07GIY=;
 b=A7M5kOfPCVEya45JjPyvVF72xJfU71T7poLUUXQMJmCyR3hS3gpJqfXjI6wtKPfLe8rk6zSewHhfu92s39wrPCeiNyfn40HymRnc/E1K7ZO/5ZpUqsI2w/NiSasStcaR97n+fP0Po6bF0D29YyB0GkhnWoywgW+VSK0KGjcFhUat7j83UWf40or4ctDAT5BMMPUtzZ+u1xPC1fez0uPUwii65FCpAmeRe2ELnT48kshvGyIHPxD1bkyk4EY1vLW9VV6NwEjmOcGejWLX7e8jPEZIFwMB1rrqk/Zq7EHfwjgC5CffRGqLvK79TLme/TYB23W035VOpBSl+Rh0AgixQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7316.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 09:30:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:30:44 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/2] drm/panel: simple: Add Tianma TM050RDH03 panel
Date: Fri, 27 Feb 2026 17:31:34 +0800
Message-Id: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZkoWkC/x3MQQqAIBBA0avErBMmtYSuEi0sp5xFFhoRiHdPW
 r7F/xkSRaYEY5Mh0sOJz1DRtQ2s3oadBLtqkCgHlNKIm204rLgP7DE6j0o4cosxWlmtFdTuirT
 x+z+nuZQPWfNfLmMAAAA=
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
X-MS-Office365-Filtering-Correlation-Id: edbefcff-ec39-4ff8-14e3-08de75e2e1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: tjU051Dj0BP6hbfjnetJrlQ8/2GidwNesQuO1MGNis1AgqR/3kpPi5C3lv1LMv2saDSuDySuZMLRG3qOn3PU8TvGPZSxkLHFow0d/yvd5v6uz5mznlqE72LNsQECxnUZbfWzijCFtbNeYZL6ILjAI2foZ+MKjzdDSWkMwHK9dBLghOx/qe4feQR5Z7fiCwRkmyzWcuUTxURRf5XpCWTsgNvy/53eMQBZNBLpvtAT3C4hbXtEj4jknKwoNEvAZjjy0+ERTs8QanI0jYo2JU6R4Ut1qyosrc8HoFKP+XFGRRtDaq8MantmYS7D1LMcTzlypzZ9p+tbHOthuu/YJy8+56urUIAeQdbAh2Z2ibv4qWItKe+TpqA3XoWUEoP+ABsK4VOjob894FqIX8ftO3hOkxTIZNxIgJ+lhzz4COqq0UspQsy788QZbFI581qTK2rIjl1YMFdtrriMXd4dJnCZYbYtG2Z94frD84uLzhxq8r6eBxMEZ0PwsWXU49wVGkYUxAqfmwciDsutcvLCMzZyGQ/UoHRv9z/QMdQW1ovrJIL8/bqd09iEZ+2PuF2gyNq8MNPNEsCSBq9yjbl/25oicO82wukj4NvJhFfRO681XYQAf4NRXLZvVMgJe2Bb8FCZ0mCzjxsOraVD2qbsldtZfHXuHBQz878+VV9RQkBkxhnNwnKcgE4f0TwnBDyqaoTagfpwCSytQFUb95foAiOtBiLB1qUDHljuH2V73m/TxZzV1i02yT/KKIfbPAZ2OIoAmV/adXDfvZcNtiOXBhopqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGh0U1NXeXdhZ1VjQUNxMXZOOGtjNDZFMnlaSTdmYlFaS2xCMHRxZ21kM0My?=
 =?utf-8?B?QnQzK1pXblVYcjd3ZWVPWVNTMWg2NzlJbzRDUUNRNTZjWGNkclg2ZnpqNkgz?=
 =?utf-8?B?TTdBd3ZQS1R6NlBUcVJTN3c1WDVabi9OWEc1NHkxeXV2NC8rcXRxcnNIbjJB?=
 =?utf-8?B?SDMyZXRIelYyS3FEcjBmMzBFQlRiSlZybDd1c1pwYXI3UUNUdk1NZU0vci85?=
 =?utf-8?B?NG9ZQ1p0VjhkVzBPNW8vb2t5RC8vWWUyRFhPZGl2SlFHcVNpVWd0QXdINU1s?=
 =?utf-8?B?UG5vTDE1V3I4OU1hcGFVbnd0UENGRTBldEc5SlcxS1dtUnJoQU5QUFZlUE45?=
 =?utf-8?B?TWpCS0xPbS8walh5YUlhR1d4M2VaMzNGTVdBWVFzVTVBT0kvL0dzS1c3U3Mx?=
 =?utf-8?B?Nk50V3pzVFFPWDA4cmVNWC8rOExLSGovMmt5enhTL2xUSHBpQVliWER1dFBO?=
 =?utf-8?B?Nk54U3BMeWZEelliVmpiakg0aXhNTXcwVkFacElqdlNCUXZoa1duNkNHc2s1?=
 =?utf-8?B?VlZCN1ZVeXUyTkNaYjhFUzBZRFU4a3FRT0hpR3Y0R3NpVnFCRTdFUkVzUWZp?=
 =?utf-8?B?OEpyNXkwTWpTOVVsMUo2MXhPNm5WNmJ3ZExVeTcyZmJMRTVlWGQ4cWF1SnNJ?=
 =?utf-8?B?OHdiYzV5Z1lUdXU3ZHFsQ1I2QVZSeG40aVIrR1pGVVZSMnFCQldSQlpYYmlJ?=
 =?utf-8?B?NWg1cFJXOXcrQzNQT0c3clFXajhwbUtmUlphTE9jUGQvWndIOTBxdzFBZzBh?=
 =?utf-8?B?WXFMZ3h4clQ3aGJSWWpUVWhjYVNrdDRlNVQwbXVSZ1RaQ2t1TFg2YTdNTm91?=
 =?utf-8?B?L1BBcklZUkJyNHlEYUJUVEpGeXVwdzN6eENJbUpFNVdETUhNdCtabjVZRzVI?=
 =?utf-8?B?TUFtZ3F6dTkyc1M4V0RiYW9qNExCSjVRTmhVL3J4bWxaTjFtNEtrSlYvN3VL?=
 =?utf-8?B?MnhEWUhrZTRGNkszZC9PTTNsZThScUt5a1p4amZqcFVwTWRvM2JkOE1NWlVi?=
 =?utf-8?B?WnZodTNuUG9rbHpCNi9tQlRhVXFHbmxOZ29HVENuVzVQdGQwVHJmdUIxUU9a?=
 =?utf-8?B?QVN6cTBIdGExcGFrOHhJNE1Gd1k0a3daV3dRREdhbTRUeENqUi9HV3pCcHFv?=
 =?utf-8?B?VnRvZ2ZRclZqUUZUNEZWcGNDR2RaajREYnlKSlJPNXhyMVgwN1BNYXMxTldW?=
 =?utf-8?B?SzBkM3pYTytUcyttaTE4L20xK3pSQXd6a3B6T2RaYTdCdXpXYzZvU1M1bFNt?=
 =?utf-8?B?aEN6RDF4ZGdGVGp5SlQwUnZlMnJlQ3dGdWlHNHlYa1JTVE9sWWlXZ0FVQmdo?=
 =?utf-8?B?VGFLa0xYK3c2eGw5YjhjeU82VWhsTkZnVGpTSldSaEhrYkpHcEhWaUc3YTk5?=
 =?utf-8?B?TVFZYlA1QnhPazlzNGg4b1JZclp3RXM4NHByS3JxZm15bEJvbnFUWEVUUjUw?=
 =?utf-8?B?dWpReVh5WkxtZXdNaGtJc0JFZDM3bmdEY1V2dnlqWHBPTG10ckoyMHowNjFM?=
 =?utf-8?B?RUNCYmpuUFpzczUyYkZBazhFcU5OQWJDUWVKWlFiWUt6SW5xdXVTZlh0azVJ?=
 =?utf-8?B?VU0xOVByNit4ZVkyK01FN3RhMDVjQVZhdVNON05SYitmQkN0d1YvV2laVUFQ?=
 =?utf-8?B?bTR5MUhLNEVQZkVSMmJiNmpKZFhIUU1lbUFVVW84bTl3RkRqbzhuOThDRndO?=
 =?utf-8?B?Wk42NlV1Y055aXFoZ0FqbjN6VlhoaGR2RjlnYmkreTk1UldhU0xaWnc4N0pw?=
 =?utf-8?B?WTJYK2M4dVZsYU9zVmlNNEJ6ZG1WdFJSc0NZa0dldFhjYWFKampESkhCK2Zy?=
 =?utf-8?B?bHNRaERIbDlyT2MvcTVNSW9Lc0xqdmtKUHZvY0hGSFc5Z2NQM3FGV2lXM1Z5?=
 =?utf-8?B?TFU4Rk9QNi9OaWpCQnVDNmFOQWxsVmxXZENDS2YzbHl6SlJHZXptVzl0MUZq?=
 =?utf-8?B?SU5qVGZoYms2bU1mR1YvRDRzVUlUUG5Qcm9pVmo0ZW52SzRLMjFyaVVSTFVo?=
 =?utf-8?B?MEpzM2pzaU96V1BUN25YTWxLa3B5MlkzTGtMZDA0c082RVY2aXdITUFERDFm?=
 =?utf-8?B?Q25vOVJCOVU1UFhvVjBkcUM2SE9VZmJOTmg0QjljTmh4bzFXOUpzOEU1Rlkw?=
 =?utf-8?B?TXkxalcrYVdONzl4a1draHUxK253WU14d0JCM0UvUGd0bXpKRmp0SDUvUW9w?=
 =?utf-8?B?bjM1YStxa0pVSGVpVkpDRHJaQ3NXTVBnY1ZGTHV5RktkSnB2Z3crUkNSaHpO?=
 =?utf-8?B?V1JSdllDUG1OckNKSm5ZME9PQ1hvb0ZOSGZDdlcrZVdXZTNZNlRtM0NJK3BD?=
 =?utf-8?B?MVhVTW14K1gwL3B4N0NUTnpVY3dydGVEbHVBVy9CRVRDNDFxWVBDQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbefcff-ec39-4ff8-14e3-08de75e2e1a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:30:44.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vzQY+U10Dny5eke9jwYtxKrOcBTOnztM0QG3bbTnvkIsAhkqw9/F0rvt+8yr7Uzc8njkbEa3rNV9qvgU+TuTQ==
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:url,nxp.com:email]
X-Rspamd-Queue-Id: F03401B5518
X-Rspamd-Action: no action

Hi,

This patch series adds Tianma Micro-electronics TM050RDH03 5.0" WVGA
TFT LCD panel support.  The panel can connect with i.MX93 9x9 QSB board.
The panel's data sheet[1] can be found with a random Google search.
NXP website has a link[2] which contains a picture of the panel together
with an adapter board to connect with the QSB board.

[1] www.jetone.com.tw/uploadfiles/327/datasheet/tianma/tianma-panel-tm050rdh03-41.pdf
[2] www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Liu Ying (2):
      dt-bindings: display: simple: Add Tianma TM050RDH03 panel
      drm/panel: simple: Add Tianma TM050RDH03 panel

 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 drivers/gpu/drm/panel/panel-simple.c                              | 3 +++
 2 files changed, 5 insertions(+)
---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260227-tianma-tm050rdh03-dedb7743a443

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

