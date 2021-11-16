Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B945272A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 03:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAEF6E0FF;
	Tue, 16 Nov 2021 02:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300129.outbound.protection.outlook.com [40.107.130.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C046E174
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+tS/dlzBvBay/z8yD90b0p9aQ3tplbBZsKDeiY62DzyVA5qCLLIA8R13wRDtNclVteSbJS0drBukivDgQ4a+6YdSZ7njJnVDYPbHv92SfnRxgoRGiLPmlKY5DySfbhkJjlLf7GG+x6H93Oo2BofS9mk4Bp5qXSTBncfdH+tmUwWVX3R0oBp3OvjSKs0Cc7MPHbu/GEe/DzZLDwMmlYdwzvEiyaPvtuZ9pf+1pLI+YGUYXd00b4QQeuuctoUGI5irfcKT2h+DzB0RcZGnl4rhqBzUkqP2ROgNvVKvZ4m4jfcS4Unk87sAmmhuj06+V/AojgqXgPnn5znqtQWt/iKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5UJJY7mBe5KpxCvwQA4FzeaMaEuHEqAhrSQ4HYieQA=;
 b=VOT5UQ3jjU95HQYFpurhqEnjnvIHqv0q7GwshAar8Pq5dUx5/vTcvtJpxdvSAORqbukSt/OQE7OpRCGNB6Vrwq0euh534wl0nZSWVCXXaPkJF8R6UC2OQ2arZdLuxvqGSNuO5s6mFcXOf/T3jYxZOeCbg3pqVwEQ8lCzlV8Nvf4j5za/5e0OeTAzpLO+pCcZDmvJvX5C4xRAyJFS39sIRwWccnvKHLEPVGAPuQKo61v0b0thddIQ6gz5PAqGGVH1ufcDYkQUFwNRWi3lSREpki+06sWCkg+RyJ2RYMmXp6ggMpFb1wqoUvN5bRwFLrIhvegDgMS/Qhk6HI6ojTfVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5UJJY7mBe5KpxCvwQA4FzeaMaEuHEqAhrSQ4HYieQA=;
 b=ggbiQJX+1QciwSXxLBedTUFJmbDiATtra2O8WmXUljdQu908/9NaEM+Z9aiqv8L6xCYhE2Bj7fdWfMzJMv4pVlGkpFbpSmgFk3dweHA+os5HsS1dU5dPQKw8ZlSC91R7TcDDUhNhszEPwKy/wzBRB5m4pOjeeN8KxHxdg7Ix4xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS1PR06MB2789.apcprd06.prod.outlook.com (2603:1096:803:3f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 02:14:59 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 02:14:59 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: remove no need type conversion to bool
Date: Mon, 15 Nov 2021 18:14:49 -0800
Message-Id: <20211116021449.27503-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR02CA0208.apcprd02.prod.outlook.com (2603:1096:201:20::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.18 via Frontend Transport; Tue, 16 Nov 2021 02:14:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61864a89-f720-43d9-9bc0-08d9a8a6e3e9
X-MS-TrafficTypeDiagnostic: PS1PR06MB2789:
X-Microsoft-Antispam-PRVS: <PS1PR06MB2789B5A5CFA86053D2B1F70BDF999@PS1PR06MB2789.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmXt8IYuFDjK4FS8khvLvhzSxfKNGDjG15S/+Kz+hv0dRIPjv2cRr+ZYBVgBiRykYtAm0Oy3sQsOFH5uJAeuOJEgZn6NkdNBa4xEU4SO+/a6CZg+P+n+7+Q5+yGjDbSmJhxXF1I4qhv40vseMGYfRt+j2tjIWX9uDjTPVpb3u7BO1GYfw9+PS9DhCuXBEiSZnvoItZyeVTygvO8cqs+cnklmW/tO+ZZOROnIHwIr7hfDbDY5NDnOEawTqXX6gU5RO6Sz6iESjY86eDpdd0pxDk8y0Jdw48rlHKU01d4kqh8v1Ac5OmkxubH8CG6v4e9l4e7yyLj2yaubINtU0Jg2pUNIOPMwMbOOtA5JyrdC9EmSbyHR4rCbrDfAWbKkkVhg6fkQ7W0l6ksAWT77Rrvgbe+qxmDWAp1LANeQqV5RDaIKvFQJr22mrv0NxnE5q38U7JgQVp2cM9dqP77533L307sKfTPixp26T0mea7PyfGV1iDaSQNH3zSGMmxmey/lesQaaJYDaU5OsmQDnodolXMxn4Ldg4gRcILxPqgko9WLE6LNHU/kNMFmF4BZG3PoadVctipN60ewYI8KSAjZHTRbxII7/i3pUVTwWByERF07Bakofkltm6WhxRRlyR77/P5lN3/01Q8aHBUC3LaaVOC+JwvlE8bn/ddjNMih2LjaKh2k31on34NhL6rk0DanPzl3K3u0oFWgse4dlP7cJ9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(6506007)(36756003)(2616005)(2906002)(26005)(5660300002)(508600001)(86362001)(6666004)(8676002)(956004)(52116002)(38100700002)(8936002)(107886003)(38350700002)(83380400001)(316002)(66946007)(66476007)(66556008)(6486002)(1076003)(186003)(4744005)(110136005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6RelEhbzyCVDYDSdsWXKesrtrt8/ILST2G2xdSS2soqm0wS16rGN3ji4alX?=
 =?us-ascii?Q?fTGxQySVG4QKdTvDaZkITGEdj4vvEAj6puvVEcWr4gTuBZPTQRINAV/pUe8Y?=
 =?us-ascii?Q?VI41607b3Oeq2GwmCLXV91E4WXO2h3a7oFDL7Y9IkhyxbEdDgsc/dNVMEsaN?=
 =?us-ascii?Q?Xie1OMuO8RihcuBI0y3m3l7n4nPt/YkFZCzjQt1NVFdwOS6tN0qChGj3f4OG?=
 =?us-ascii?Q?qsn6hv5D5HvnwdgAIaD37p3VobzeCLb4Q0KcyGZCvuZS5eWeSEVtfB2d8HUh?=
 =?us-ascii?Q?KMVxaeVih9/4T4A6+/+AyEssUQNHNDVRvSVzVDMTYm0cEc2UekSDlbBW88s/?=
 =?us-ascii?Q?yfbCEkBKX7BGp39PeLmv1kDSev3fKCANOSr5FG1BhTFOdj8Hy+an+gVAQcVN?=
 =?us-ascii?Q?3iEYvBM+MwXp/Pi329z48JYnGvrznRLUb8tdZPpR1QysBysC9A4yI76ZQuJs?=
 =?us-ascii?Q?oGRYIkdFeuzCPzWA8KGb6dPBW/Ul1cqj9UJ1V10fiX5b48pSUlc9pclIf2s/?=
 =?us-ascii?Q?IaN2QSjy1ljprQa4C2M7sh9B54UOfcE4s00//9m1j3awKfGquKDTg0Lm3lES?=
 =?us-ascii?Q?mTj91uEt7CeW28zqIwyp4bciQvHpofzISpM8imN5iKtG/0LebznbuabkcCn4?=
 =?us-ascii?Q?sMoSGH1EMDbJJWwbo1eXtnvJ/zkv2eGychxXVykJrvou3eHjocnshlMlhE7z?=
 =?us-ascii?Q?NM1ZVTWx8YnKeCPC7ORbRR+O8oSG3vKR48cO5WO3s5BloxnVfQpjDjyZ2W9L?=
 =?us-ascii?Q?lqkVGKoiDGBs7nhwVii6/QpXA8pJ/UmXv9pSaV4nWlHWgnGxXFBSbf+V7IJc?=
 =?us-ascii?Q?3rqqCVKfx3lj16BqkMz8iMD8oSqfnb3i6OPhVecFXte12jdzH/fj97f5SSts?=
 =?us-ascii?Q?kLQmvQ7+5w97eajfUgQBDav3MuiHTV37jposhaCJhAgvPoR1pKi4FnjidNkT?=
 =?us-ascii?Q?kOqL+l7r6kJsrppFgwuIgMqLPSeUugiiieuMRd1Q9bgiy78l+nYMHM3bxpEp?=
 =?us-ascii?Q?dKmdcsMiE9NG9p58fQxEh/VIHDnDmu4Ru5js/R2QRHAKyi0iUmMv4GEgBQwD?=
 =?us-ascii?Q?clPAUMwFPWFtZrZMG3KCrlb4WLn74z5+x7iLeEyw3AP1I9qde+Ny/Q/c/mHg?=
 =?us-ascii?Q?2F4fpYYT4B68wV3fXMzBkCeg8RsWbD+faVbyQqBVYk6TYZT7CQhsN//r0C8Y?=
 =?us-ascii?Q?GZBdw5skiW/heAqLuuhIYkOZpdzvynuU6cY/BcaciCPVN7lB13CMrXFJX71p?=
 =?us-ascii?Q?MHV4MdcrWqlA7oAvXuJqSUCo6V3ZJEhJ1Fxvm8RSmkkYxjXht0O/qf+umXBg?=
 =?us-ascii?Q?r3neSpsgpZ3H/8/97XovjEDKyLTSPtCh55tnedAMHcKi6BOp8+65ImVqhAOH?=
 =?us-ascii?Q?I0x+Irqws2OZhwfTofxWUWa1mrRFFmocokV9gWswS6Fsae9dp+oKLyP0rxz0?=
 =?us-ascii?Q?UklYm6+h2+k6XhSyJHFE/ej302wry82jL1xxF+dyvewtvxG8fmes1J6w4vS8?=
 =?us-ascii?Q?WlBdHOtPOVPa9GAU5S270eeFw0kx1yyN/6heNa3t8HTWcVDeLbzFaS6tXRjL?=
 =?us-ascii?Q?0AujjJajyJrl5M3GS4iGmVv5Ws1qF4UH3GzvWMMEwti40MjDK0S3+QmmbFPV?=
 =?us-ascii?Q?/NjM8h3t7o0xscXEa4GZprM=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61864a89-f720-43d9-9bc0-08d9a8a6e3e9
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 02:14:59.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btnHyYfDEOCvQZ4JTMmHfFjDa2Z7zTXBzKy6nFPCkxkHgd/0Q7lCNqfdK6NC1N1ONSAauscn1+ZAay8EE3FjLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR06MB2789
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change is to cleanup the code a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592..25e6f85fed0b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -49,7 +49,7 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long rate,
 			    (rate - tmp_rate) < (rate - best_rate)) {
 				best_rate = tmp_rate;
 				best_m = m;
-				is_double = (d == 2) ? true : false;
+				is_double = (d == 2);
 			}
 		}
 	}
-- 
2.33.1

