Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624717AAE3A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 11:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8282110E197;
	Fri, 22 Sep 2023 09:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2129.outbound.protection.outlook.com [40.107.101.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EA210E197
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 09:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0S4aViD9HmqAXl/24f35dl+Ly2rcQAHO/hGWmIi3S9zoN1LYxpf9zIpuCgy/ekAXgZAwFo9vHIbtuo3Ae6ohok7lG1HBja/ev/kcfOOn/TO+XX9MT3xgk/qGNYU3OOvWI0YxIZNgqTvN4e7frFownQaR/llphUtTQiA3M8xYVt1ghVokgtNu6DBh2Tph8mEclRTq9/mra/cJkfxnT+Kc+o+XWOgxRCzTKkCbLCtJyizjAxapxufsyy3M1qRMeIgRTE4+nRiUuls1ek7ZhHQ7ylPuGJfwXN3kA8GbRx3JpTQaa+bLOIk1cs1GFx8wT9pD+xoeSW7tJVIRqa/q98TsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SWMohgR48+Z7ATdvITsU+9kcNSbC/Zm9qf8mMGNwGE=;
 b=AmycBqkthcumKngbsgXK/QAU4+bN3WZdW5kkoAUTt3dxFB5uJ/c2nHiMhNS68HjAwoR9xiAmSgA39JY8EbAclBlrYpACrizFO1hG+1X7jh81b8fFiDZrTTIk8SZP5w3hEtvpjwyh5kOw5r5bPRO670ir04Wk0l0xV/vgGJuJW8u06nzhL4HRtrK4mZIMQ2twOPGr+1/7tJTatq/S0VcW+8ZV5J8EOS112Z0JPGcIOfcfK8hR5lumpljNd8kGlEgdwZgvu2Isw0mEdYXQQd6ZkVX+ANG9rJf0OC74A1a4RI9QOZdc+2dbFs4ql1wYkfZbEMU9lYfseSX2HpRDgpdCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SWMohgR48+Z7ATdvITsU+9kcNSbC/Zm9qf8mMGNwGE=;
 b=JTDuzNaNfnIyBFA45brYIA06JCMP7Z0XuO503iDv898UdBgV/NTOSrrCKbN9TfcRsj9XyV+oainVzUpROzMcthIpQBxSZUjnGymtSEULS32w5gb8F0VBzVSQPKKSLCyCLeoedIMp5w1Fr4SdJ+Zm5Ma4r4i0NvkZFWl/cP6PLbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by IA0PR04MB8836.namprd04.prod.outlook.com (2603:10b6:208:486::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.10; Fri, 22 Sep
 2023 09:35:21 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25%7]) with mapi id 15.20.6838.010; Fri, 22 Sep 2023
 09:35:19 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: Add 200ms delay to wait FW HPD status stable
Date: Fri, 22 Sep 2023 17:34:49 +0800
Message-Id: <20230922093450.3574349-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:3:18::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|IA0PR04MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbc6357-05c4-4a4e-40e2-08dbbb4f3c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yMrcuLUJo+qTVEt3qk5bFiwzhNsfRtvCgCozSiJtiXmwv39BjKkDZK5NSYGg4nWQDICosC5vGvKLh6+RCE5R9Uo7xspZRvUc3JL9W1pCUo7NcxeRNlBxpf0DiZcCh5ysgUR+QXTKUAJuvY+3BCgdpCwnyz10VNkZ0aagmKZOdajBHiTKNkJIOFMQYFR0kZqlOFNgG5J5qZWEJVeojWd2r2yPnaR5a45kn5O8UEBna2pMO/bacIqjHJRtaWw4o6kCeZcg4yU/aW8xvSGFBnrXwkKNsgvUwGoIKfJHwMi8XhEgDxUO/6kqUbFzoyXSGdNUhSeMUGY9llADzY1bwxTYOoTFSqsc1ZqvU55FXAxok2I5qlddwHOi74I8D3uK9fEYstAEY62cnbN7RAiagfNDTQXYvxlAAJuEMu3JoahvW1M+CqaEug8P+WVPHz9CpOcy9+VjglnG9X1eajrmoHBsEEBbwrPdqYJbRWsTgeonsf7ylb8kY+5TKrSjT+X34mY3S/z7HZ5YIuRQW11QBAMYiQ9/DAvtVIDNUNwsdfKhnHqncXjRWd+avMaOb8HleKtjcl8TeR25Rbi7KL15rPgTPYahoi3+i/sqMAOAp3SpH+EBb/lvJR3Z1T9Y1vbjtnt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39850400004)(136003)(186009)(1800799009)(451199024)(110136005)(6512007)(316002)(38350700002)(26005)(38100700002)(66946007)(1076003)(66556008)(66476007)(36756003)(41300700001)(2616005)(478600001)(6486002)(6506007)(52116002)(6666004)(7416002)(4744005)(2906002)(83380400001)(86362001)(8676002)(8936002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AquI0YzhsO6z0W9O9wO/ooulAGNoPqoMhj0raWSmEQMQR7H90BfAX3GKRpTo?=
 =?us-ascii?Q?N/o2rHfd5ocT5x+MRuoUPE92AOb4cmunfVNqs6cGlnD3+upgHuQ7G3vS4Exi?=
 =?us-ascii?Q?6X6D3tzHX+7mnjn0UU8e/djtPxynT4HvcDFWDb3vjHJrol/P9ZER4RISytmT?=
 =?us-ascii?Q?BcVil/798lCoT8zPg6o0OH0tmAg5r/CCldWLmTxXWSRjJOAxNsOCl+qTT1BP?=
 =?us-ascii?Q?mH8IWdvTc2mCCMoSLUVEzCqHvk5dk9ff6L3n1JOD7SK4v4XyNx6s4cOuYmL4?=
 =?us-ascii?Q?5Ug+cU9LghIkk6177VhBLYGqCLY+TY/pEBuO+5dknDcLW8LHR59eyr/MqNVE?=
 =?us-ascii?Q?RAUX99fHfMV+TU/+xEXpakV5yXWnCgDErcZiVc9vsIKdEEJou3K0L8klkmqt?=
 =?us-ascii?Q?1R0Uc1YlCvF6JtV2trlCJtohe7KOfZbLeKjdff16D2dtvuwBAsG0U4/jMBFn?=
 =?us-ascii?Q?herXk1pCNTtZBqw3AMTJc2ehszOD0vWn1JUctvxwbDiDaouD77eeZ9IyqBDp?=
 =?us-ascii?Q?+yaFVKRZFti8o2t6MxjUeTq6Ir3NPPUfnRrhQuSXgi90IWiid7GUNh5tj7+s?=
 =?us-ascii?Q?JcvR9xz7jUtlc+72sTPkDgzUxpAAjl2IgT0ihoJF7Mpv2BX+BF1Qklz/1CwK?=
 =?us-ascii?Q?gdmyOs/noPAwyvPNoDEvjo560RmUVtiwfgN7DL1YpTnY22tHnbewvfuAuB/a?=
 =?us-ascii?Q?Vv/jDC+/XnRowGfucha87lCK1AlXSytHYrLUSPzmu/i8oKt4Cmr2In9Ta0zc?=
 =?us-ascii?Q?IcER7aZDkZF4WpqgQVLb0qDYhnpM/d5LUoIGv1DU07gDd2SSm2v3wYkf13jF?=
 =?us-ascii?Q?TShPiiCTfVbYVFM1OHIMyxOQx7rjIqvBB/l+ciwxJJKZNWm4flKdTtPhhmI9?=
 =?us-ascii?Q?jkS7wNDzx40qmdXLPnzti2Ch9BqFJowZqTUSSiXRdNrIg0Z0PvvNHaYGTeKR?=
 =?us-ascii?Q?s6KuaBC01PuvAm1vqQE6pTjjrXrVPiikThMWEj/IMm3AAz3KgVD9wsSJYD6L?=
 =?us-ascii?Q?Ituzeq9KUUyy8E0AmESvEIDLooCJCHpgez7VmCK4qU3yWPmo8ZJhbJz6wv+4?=
 =?us-ascii?Q?WUaci09ok8Wyi46y9IMQVZpFFvmdD1EtffoU5wYEdcLzkqi0/9Us9uJgHSgG?=
 =?us-ascii?Q?hyVfp50kvUxd11Oa7DPhNz6BPIucDex+FQi5iOLdKgg9w1xWUtYV30dqynF9?=
 =?us-ascii?Q?CTQb5fAnVyw4EUhHEj7vkuWH/0G7hmurNQFsKWYjoEREfDfUQMaTTd42jl4B?=
 =?us-ascii?Q?8EDr9eUGTIFHCpqxipjzSIGE7o1A0h6SCPFPtjHtp+tTaUvgx0YyIpamNP43?=
 =?us-ascii?Q?YISah/Ixpo6GtwaOJ+t7dP12CNz/ue9BEZUNlmFLAqnVJ4j9oO7hCYR+ZIjq?=
 =?us-ascii?Q?jxFsjrstF6YhGxLBGWFI7iG2R7JTrLrLUokv2uQuFTukJAsx5qFd8a1Og0Ie?=
 =?us-ascii?Q?3n64U/YJ+UqJ+EyvTNMIbQUATIYQgvestrG+XxjHISbPvKJMuLsUDhI8fLAf?=
 =?us-ascii?Q?ueTmIqBqFy1p1vvleXq+iQhTePTlhJjU9AHL+3nQL0F3m5tmc+Wm2K8ZqVYX?=
 =?us-ascii?Q?OSQBVexSkW7YL1KK4N25etwxsj+vsAeN2kDrbSRy?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbc6357-05c4-4a4e-40e2-08dbbb4f3c6a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 09:35:19.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhwDKxEOz796zM41H3S2JZMaTso6J0ZuQ63IqPkvBvXM0U1OmHZ1YekTiLXZ7JyjgTg3+3snFrna0L2S9CteYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR04MB8836
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the no-interrupt design (sink device is panel, polling HPD
status when chip power on), anx7625 FW has more than 200ms HPD
de-bounce time in FW, for the safety to get HPD status, driver
better to wait 200ms before HPD detection after OS resume back.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 51abe42c639e..8f740154707d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1464,6 +1464,9 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
 	if (ctx->pdata.intp_irq)
 		return 0;
 
+	/* Delay 200ms for FW HPD de-bounce */
+	msleep(200);
+
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
-- 
2.25.1

