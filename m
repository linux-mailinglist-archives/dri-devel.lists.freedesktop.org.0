Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDCZLJiGrWkC4AEAu9opvQ:T2
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505A230A98
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFD010E446;
	Sun,  8 Mar 2026 14:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AReJZvP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F9010E120;
 Sun,  8 Mar 2026 11:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipt6HcEcKc79kxSV8v+AlH0XfGEODeZP6bNNtuR00PgUQvODPE/6Eb3bp4u97LBJRXOsuqlqPCgSgfAJGqJKRY/O5GVAbMA9RmLOE7UrKM7kbnoqGvv3/HZI/DTQlS/k6gFIzemleezgOpX6sCh4wQRV9BM3/I6yFPQ3jaqbd89/FwYZWFcdqhp54eWHoA1+KxqaeljdDIdekEWhsZMz6G/v8IsfJJY8x6g1tpoAEFjbVamB0nxK2yjg38oLMHc5mkfN4AjwMFMYX3kQgJ7i3kS6+66q3FfbLwh5Xen8iTzLPN38ufZ2oeSANO63PzJ8S5HIV5D2h3aR6eaJd3fsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTP9dkav8JweRW1U3kqjtUz7WSqgJOl3e+FPpj3lzjA=;
 b=dptsulbdeeDRrGzG2ZzSC4RxigfNMXZ2Pkyj6gaVdmBK80bEpzLyDmM8CnToX+sVBlePKsXkG1z4MU+kWCXR+uqxmX8gU0PXTQAeCn0NdVbwXr07++BIUVMVNFCBdFh1sEhAQIjOr8tEv3urVwxH55Zl1JNWEdZ/kiexLzH3cRbvmLlmE6RM4vPNboqIVa1X4/hCqbiWVt5u1+EEyzeM1AHhgjmwGWD0SLasnm8r96gfNpmS3cfj53WkT+FxVPegqT+AI+aeng6vnC/wa72wr1kNzrT1PuM+coMQaamfLTa4v3/PoCGI9QmFectRC6/RqCBAclBwUb6MSDRG9gXpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTP9dkav8JweRW1U3kqjtUz7WSqgJOl3e+FPpj3lzjA=;
 b=AReJZvP7qzaDiRMfPhFDgNcrtcxP+JPOVwsRY19P55cea4JPH/OASpDaRS9ykv/AqO1ZExihbhjDqky+QgGcGVhC50ReJulf+pcdm72y2jQ9RYmc4GSJHnJdEZ/NecKp/0M/psKAk1tSEjv7JR9ArrYD/NnTDI+zXpOcAPFyyboIez2pcCyvYVdQ61y0LtnW+94l/ZghrXEm5qzpoyE9FkJgCD6TrAhNYVIrd2AW7Y5Wvkf7MQ0Syh9TO3XXa/hzzpay/Kuotay0UFryx3+ichouSHbvZwHBefKgRRW1dci2zjlbWLZPddC2B++1BIr77+jcJQ6ye02mfioXVbChTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:15 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:16 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct
 dereference of phy->dev.of_node
Date: Sun,  8 Mar 2026 13:39:55 +0200
Message-ID: <20260308114009.2546587-11-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::49) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: d21bdca4-b0aa-4b80-669c-08de7d07e2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: h9aXll0nJKxzP0Q8Qv4nw6Tm6gca1xHHlYnyGTt0aYhuVXumaTHALHJ2Yu9jJKjWU+a7TG6+PQzOvTR40lnWF2xtoDqOZvZbAzYkhR8+1VSOcksUUYipxza4ZKsvF1/kVkTiQWYUKNJarrX0GZKw+q7uXwI4ydsbIycDYwMCl7s3oP2MHOD+cURHtdX7LodPVkwt/O70iEVaJeJQQZ2I2n14c7VqpmW3Z7ZBgP07C7KkKfprECUcdvSMcho/G7BC231SiIG6VPMRH5T5eSxGMdWq3LYzDqlKuiyihcDYxjAlc2vbRyJatbGBFqv6L6IMf5VAjHz7u/Y45wPs7L68+ch5jvC96UBbR5fkKMYQuYXKCrXYvjCkc/AmW2GTqXGP+KpFbuRaCDXMtUoHstCFSTeLMOlsQJsIh7HkqYjd7vJl2lzPNtsWi8sxl7JG7arc4OELLrQVMRD0Ljohwr2VIMcsDABc2liOHHiNVT682FLMcHleaBv47LR5Wc1v12wd+yExN8baOtC/ylsTJegqlth+g3xNyFaT8Xp+Yw1CAsTrhD1brLcRcdN04VSOb6wymfkL7/h3n82qK7TrVJYXKRk1iwrqB27/LiLE075jqlO8pRc8BtDIRiQ3dEBr75grbC/hydP38EMXFtuFHOkQ5ZyiGj1LZyJ4/F6vEVomEpXtV05ltmCghCeCGQZmA6CnPlN1qNohE47nvyQGJlA0WHibhJx1fPqoQVVr0rmUiIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXNMQ3BsSE10TkEwNTJScm1ZOWt1a1VIdWppeVJydE9sODhWUTU3SlBMQXAy?=
 =?utf-8?B?VUJpa0VOVnpqY1ZqVjlTL2t1MFEzWXMzR2d1M2ZuMGllUU5CaHNFYjRjNiti?=
 =?utf-8?B?aHZLTTJyM3kyY0VhOG9MQWc4cjk5eWxSTk1rcG96cVN3VE0yK1g5ZVlrdFNE?=
 =?utf-8?B?M2ZKYmtnZDJXSXgrbS8zVzh4YTd1ZFMxelpyMVJEd0pHcW1mVGM5TmJHMXVp?=
 =?utf-8?B?VXJ4N2FvSjFTMEdzRE5DbmlCc0dJZXIrR3ppL3FyNGN1bVBrdzNMODhnZnNx?=
 =?utf-8?B?eEdvSUdvYjF1TzVjL3o1amdwcFozV1pQbnJLUytpcWRwSHZ3SXR6UG5KMVpI?=
 =?utf-8?B?WEMza3ViWXFicGZCcWdQMlVWUURkaHg5b0d3b2d4MW1JZ1FlL3FWdmJmZDZ3?=
 =?utf-8?B?WkFaQmVuVjN0U3QveEVjczF2Z29ZcHZ2Ykx3ZXp2Mk82UnF3MUNUK1FZcHBz?=
 =?utf-8?B?ZEdxQkxCY1lOUVhHU2VtcEVwc203cjJWWldabzMydmc4QzlJbWJNbE5BdFZy?=
 =?utf-8?B?VzNUeUQveE9JYjBxelRvQmFocWxsR2Z3bFBMc24zdVVyL2F5ZzdnRktvK3ZP?=
 =?utf-8?B?OTJ5WVJwN2dhaUNrVDRTdmprVjc3R1U1dkkrY2JCWDVmaUZ4UHFaRXZmRUpn?=
 =?utf-8?B?VXBMUStsT1kwMXIxWExkR0h3QlJkY2NHa2w4bjJ0ZEtGajAyU1F6dHBsaGdj?=
 =?utf-8?B?MllVWXhNRmZ0dWFSTHJZWitqK1hIM2tkTFN6Y0VzT1ZTZXprbXRuN2l6MXBt?=
 =?utf-8?B?NFp1Z0MzRXpaR3NzeVZjdEJueDlGeDd0eFNsSFpRbU9pcmtMak9JZmI1dUht?=
 =?utf-8?B?UkhLSmpVR2I0KzRuamp6LzdoREVhVUZ4cFVWNXBDOWtjZTROeFN3Uis0OUhp?=
 =?utf-8?B?TGpjZDNLbUxHelpFc3R5Qm1OQ1BKWWphM09mM1JEaDlGQjJFMElhTlJpaFJx?=
 =?utf-8?B?NG9SQzd0WEROdm9jajdqeVVnS0pucFF6Q1J1S09pM0lpdHlLWHBaSXc4MWNH?=
 =?utf-8?B?SWhBOCtpMHVBS3dsMytyZEgwVTVKNUhzbjUvOEJCeXlUM25MZmhxczdHZ1Iy?=
 =?utf-8?B?Y0pDcUNLUFNES3ZpTk4vY2ZjZVlHa0JOQlZSZ0dUbm0vcXEzNExKekZJQ0ZQ?=
 =?utf-8?B?ZTAvQmZnK2Z2S0Jsd3Q2NWl0YjMzck8wTXBJR3pSZksyOU04ejViV3JVREZr?=
 =?utf-8?B?c3QrUjBzQVdrVWhNS2VXUmRDQUt3ZnRBL3daQ2VYdjNwa3EzVjRiQUFGOGhT?=
 =?utf-8?B?dVVScVNSVC9RREpKMWhHVXBwWXdSQ2VMdmFON2M4MEJYSTV6bWIzbXA3N3J6?=
 =?utf-8?B?bDBRVUlpQytqQVdDd0hCYzhNeWw1Y3gxMmI4SzJkcFpNdlNHSU9oYWZ1UHN5?=
 =?utf-8?B?VVRVWFdiZmpLd3MrZndjVXFkL0I3NTVsM3F3dTR5dmRnR1E0TVBtODFmVUtk?=
 =?utf-8?B?ckhBNTJwZ3ZXRjZ5QVV6bkt2bnorNEVjaEtlL2s3eWZzUVlka2MrVGNWOGVJ?=
 =?utf-8?B?NDB2SkVDN2JlbmlvOWhiSGtlL3k0VldPZC9PeWhWeE1Ob1dteTRqbXgzeExs?=
 =?utf-8?B?NHR0NU5FQVFsc0FMOVBZQW9zWDZxT1J2NFVQbVZtajRWc1pxQmxCQ2NUSEto?=
 =?utf-8?B?cWVNbW5XVXJvY1QyT2lsd3ROcFhuazR2WEtoUm1taUtENlBiSm5sd1V3cjJB?=
 =?utf-8?B?SFNnaVJqVDZNT25mMlg4MHV6ZjYydVhFemJsR052MlV2RzV4NTNVZ1BXekpR?=
 =?utf-8?B?SThuWDJXbzhYc09CRzZqNmNUK0tRZFJMUC9NbHF2WjRNcWtHVG83WEoweGhl?=
 =?utf-8?B?b1hsOFprWUNSWVI1eEdIdWVtdTNjRVJISUNhV0w3S0JrSDFUbkQ0V1c3QVZX?=
 =?utf-8?B?bmpudUlSUVY2MTdkOHRkenFoS1hsdVJXdUVud1MvZXp2Y0FMY3RHSVJBdUor?=
 =?utf-8?B?RXdUTTNBbXRnTUwzelBLL2FWOE1RU2FEOS9jV0dpQXVWUzlEdXVqWExzK0Fm?=
 =?utf-8?B?OTJjUkZuR0hwUnlZMmt1Q0x5WjJ6aE9MZUVPb2RaNTJxaW9ia1lUM0lCK0lH?=
 =?utf-8?B?UDl5MWRNdmFuekZPeVl3anRVaEhoYzVTVE14akdUMGFRQWlWa0NCVktBMHgy?=
 =?utf-8?B?eHYyNlRIYVNJajc1ODRBbkNIQS9NeDhPWXZQV3NsbVBVYnRXeEpySmtQWjVm?=
 =?utf-8?B?dGV0c1pqbWxhblZPZ2xQSGdLUlFNZjJOcDF0Q2JETXA0ZERCOXh3MUh5SDd2?=
 =?utf-8?B?R1VMQXRtQlY3RkFvZ25CR2JqdGRXQzg2UlNiRzRLN3BYSjJJTlRIQlR4bzFQ?=
 =?utf-8?B?R3NlbzBGUk9ZWkpTYWp6elJJNndKc1duUFFtNW1TMlA0UGhraWNvSlZhM0dV?=
 =?utf-8?Q?m4Uo5ZUwPodXd/0oQ9F0qw+MGq3VvpYaFv+9sQkT7gGtF?=
X-MS-Exchange-AntiSpam-MessageData-1: +J8fEwIZ4PP2jkCx10gk9DzMYkP9pW3FvwQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bdca4-b0aa-4b80-669c-08de7d07e2e4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:15.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiCnO+kOA5S3loEfF6X4OJ+jqh8BPpa1sxZg0TSZiMY6hfQhOXdYAzDBjAhBhALLS1nmjHAU8M4FUbgCkA3qag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 5505A230A98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.969];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,rock-chips.com,sntech.de,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,sntech.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The dw_hdmi-rockchip driver validates pixel clock rates against the
HDMI PHY's internal clock provider on certain SoCs like RK3328.
This is currently achieved by dereferencing hdmi->phy->dev.of_node
to obtain the provider node, which violates the Generic PHY API's
encapsulation (the goal is for struct phy to be an opaque pointer).

Refactor dw_hdmi_rockchip_bind() to perform a manual phandle lookup
on the "hdmi" PHY index within the controller's DT node. This provides
a parallel path to the clock provider's OF node without relying on the
internal structure of the struct phy handle.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

v1->v2: none
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 25 ++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..7abb42e486c0 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -537,21 +537,22 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 				 void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *np = dev_of_node(dev);
 	struct dw_hdmi_plat_data *plat_data;
 	const struct of_device_id *match;
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi *hdmi;
-	int ret;
+	int ret, index;
 
-	if (!pdev->dev.of_node)
+	if (!np)
 		return -ENODEV;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
-	match = of_match_node(dw_hdmi_rockchip_dt_ids, pdev->dev.of_node);
+	match = of_match_node(dw_hdmi_rockchip_dt_ids, np);
 	plat_data = devm_kmemdup(&pdev->dev, match->data,
 					     sizeof(*plat_data), GFP_KERNEL);
 	if (!plat_data)
@@ -564,9 +565,9 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	plat_data->priv_data = hdmi;
 	encoder = &hdmi->encoder.encoder;
 
-	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, np);
 	rockchip_drm_encoder_set_crtc_endpoint_id(&hdmi->encoder,
-						  dev->of_node, 0, 0);
+						  np, 0, 0);
 
 	/*
 	 * If we failed to find the CRTC(s) which this encoder is
@@ -588,13 +589,17 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
 	}
 
-	if (hdmi->phy) {
+	index = of_property_match_string(np, "phy-names", "hdmi");
+	if (index >= 0) {
 		struct of_phandle_args clkspec;
 
-		clkspec.np = hdmi->phy->dev.of_node;
-		hdmi->hdmiphy_clk = of_clk_get_from_provider(&clkspec);
-		if (IS_ERR(hdmi->hdmiphy_clk))
-			hdmi->hdmiphy_clk = NULL;
+		if (!of_parse_phandle_with_args(np, "phys", "#phy-cells", index,
+						&clkspec)) {
+			hdmi->hdmiphy_clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(hdmi->hdmiphy_clk))
+				hdmi->hdmiphy_clk = NULL;
+		}
 	}
 
 	if (hdmi->chip_data == &rk3568_chip_data) {
-- 
2.43.0

