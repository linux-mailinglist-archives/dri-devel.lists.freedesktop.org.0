Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI0rCOI5qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A120D228
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E84710EB4C;
	Thu,  5 Mar 2026 08:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Th9zpDXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C9D10EA87;
 Wed,  4 Mar 2026 18:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZZEzHZT7CGpVljsjMfVAX3DI0z//2SXmwZI14A4STatwGqSx85nFz1RxdFugDMD+W988mVHS78HGejif9SDkBZevBSGpnpAnQq+2lHHCWZGGigtS31wh9i3+Gb8iNUwv3UAAdVoZxlc1NjLCSHDziDB1oRn7Vy44sC7vk8GsnT8cV37u5BwcPSuZEVdCC3WQk7O2fFe79k4Foh8+ZhdDNriGXETmeOs1t3jkiEzAubgbeIbHjpkBvAPv746IPKvGYUvp0MGV37vdz9SwCEAvHWFnRuPRTI/2FYN9Gzwh1GfzHOftMvzX3s2QwNgA4GW6SXR9+y3stTz/9OG6+SAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Paq0ScAdYwMHUlOt7qDuXOPtQ2o94uSDdvx3E6fVrV0=;
 b=POv1fB/TiVaA3S7lNjsuaE8JHFcEXSffE5tK1izfPEPzVG0jMiZiN/mo1+yp1gM47ZwniJ4Ckw+9526kH127RoVwmVjfVthE4qMlm5MA9O1wqFZC6bhE+5lKBPu0qg06g1w2W2uuS29PqXY8/DpxJwDS5M0ihNunLQliThUXdojViQJMK+9yap7S+aoShK1+i4FCypxUxGyuJnf37SQgYJfAyzdJiMSrCvX1wHROdSSF7y8dbsYNWCgmHbPmAhIDPq7VCw/5KG1o/RdeDOJtolFht0GiE1lyzD+bePqE6e5DmSZgsUo0/15dHy/x9PA0QrgeC6uFiZ1gBFE5CbhdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paq0ScAdYwMHUlOt7qDuXOPtQ2o94uSDdvx3E6fVrV0=;
 b=Th9zpDXtQ4otVl1sRGu6bG1xO23ydnks8/17e+wUdgWq4lcb6yAtyNGtk/rYxfIntuFl0AW9W+2SuExknAYhv+aUgKw+gZ/spJmx/mdnqgGd7o48bq5FRnfkSEV2TyUg+ZtAXzWtn6iQKnjihYAjuMCf8U2A6+2KGypuL84DpEE94Av1fLdyLN3VbHv7WSt+jgaR5BtVWmMza9O9qh+yk7bQ2CeHM9Q3Dex9hJiUuPKtt6z0OZ/ibteeySw/1sFOanvSe6K19ULel0hLxvXRvCbEiC2JTYdrJJu+0x3PSNVV60R9OrPYPQ77DQ82r2r9yVWNaLW9d22iJg0nKz2R1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:17 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:17 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
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
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Date: Wed,  4 Mar 2026 19:57:24 +0200
Message-ID: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: f21a5d91-d379-492a-5941-08de7a17e4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: PHA7/gESYJwF0oFVjl8dRE4XGVUr9AumLHoYbIcHerPG6uXEGO0Q+D8x7DVjWegsenupCGNK2sN1Nhfga3Xq75vQ4fRnj0zWZDjMrEDtIpxW8Mrqn7C39daGn38M0Ow7XfEwDpf6gnKP6o6RtYsanhxmu9GzGm+8z8Cn7Ejhlk2KovDigyygeVw7RlM3Mt/ze/Jp3lADALZPRcmGealR2Qpb813elkdTdna9UGuZZgKo3PFCIAOOOj3YST7GbWpXeKjqE/O5E8ltPKon+1fud04ug8Olc1CCyVBgC7bDXuZruFdU8w0CRTqttK4vBWsWZbkdjgRHgM8ajKPWVDFP+zzJ6XAeZ7Hd66WSDcWWFaz/AmHMLd/nD8q5nP2iHwJ93HtT9DEWuVpEcfX3ae3EBECtqlmX/igJDyPZCDQElt2BWo1eljtN1QIr7SU4MrHLMqUleVDmsFEAfDFkcqxJoXGgYMJi/HE1gssZcQnDJl5in2rhfPRMhtIgDqS8y8Hwh74eJI/di55QYHZetI+OIjYV3aIGTMmJTWeowe0YMNAVKNsvgguwiuKL2gW1gXBPBLqlsGdugB6QsrJztSunNAWz9r8nMd89BGDym7hciDlD9oo/sqehGxnvrN9I9n5tQZeRHIcYVGN0mV847LWtKdxAFr8r1enFUeCz40aT3STpsVst8xtD6UPgQDNY1nh2J8gpcq1QvQgVDdR2o4rmpXZfyhHd3A6ArGsGI6ZBozc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5hlntmrGRzw39lWr50ZxKQPQAe9U7Lw223z9Bjj4zaIHlsQx3ffEMXXr/Bi?=
 =?us-ascii?Q?1Nqyq6fiwC6zMvD8KBtaeaDtXYZzvwqhcECHRA6FDz2JT/heQJT7vdnTjlUM?=
 =?us-ascii?Q?DOGdKRQMQ6el4MWBXqfkJXtVrZBaRec/FBOjfzTouL2dk7ls29WoDnfWqimU?=
 =?us-ascii?Q?kmTLEHiycLJj1o31+dKuXOsHj7L/OMn0qh+uNSgOWe4RQN+A3jUUlRb2dBrm?=
 =?us-ascii?Q?aqdsLXo8LJcT9hOvaStkdThoq5yjmy3kMfsMFm4y7aQbliChe98Cowa//fxE?=
 =?us-ascii?Q?lFXGCXRhZ5JkrUVaidkrgyqEjPlO6wbTFQagd2/tznAAUguM1VSt08+now69?=
 =?us-ascii?Q?4VIFCOYSZyuPpPFvsr7Mct2LfwcxEETxX4OmzdcifVlYbn9duO/GSOK98bnN?=
 =?us-ascii?Q?T0FCaKTyfT6cRkCwtQunFBEhwrjHvq/xh0MJbzN2RLYIbqY78eK4OBN0yW1v?=
 =?us-ascii?Q?hEuv1nUBSBdpJmeh1sHALmzN28vLOm2lBxsYfM3vpfYF5pVAgZZeImG8xgNk?=
 =?us-ascii?Q?vjbb9a9fMfvOeR5gzmQeZKuZI7SjhBRSGdcjdnW9O4w7xQRdWlrzBSTfdjF/?=
 =?us-ascii?Q?QJkJ8/po8nX8GR/QRnbNR52rVxIa9PsSNx15VmLH8GI8Z/gi6oTu5nSm8RvV?=
 =?us-ascii?Q?0g8u8qYzIQLtK1ZUfshFkP9gxn8InH55t0yK/9wCxPhCeS6e/nedLMq701jC?=
 =?us-ascii?Q?PKZ1pv4DmM3Z8tWfn0fjoqLaNm1dH91p7W+wIJL5in3VIBit9Kq8K90ydrG0?=
 =?us-ascii?Q?nKplQfEfw2mgsJFlAX+NTos8VNB9V3OlemUO4HDCAGs9f69bKzyExzlLqTAd?=
 =?us-ascii?Q?s0htuAoK77mqvE4pk23z+4Nhu78A1HLywXN2S60qO4uJokdJWTydHRd92w7c?=
 =?us-ascii?Q?X2stuL1obi68qDQb2HIZs7IayF2e0NEua1IDslVvW6SWO2Ij9UeVNurBBHEL?=
 =?us-ascii?Q?jRGPxWvsxcaW56Mblc9gWgSyjxYbrcw44AzfwfnvxCEqTKZubO089gBoUNkc?=
 =?us-ascii?Q?V7bajNy4esunyXJsC4tY2yB+ZHEaGcb+0e39rLEp2X/rMtpGo6fiTo0SVNwL?=
 =?us-ascii?Q?AKcHYFkxQBpgHYkHiMAsnmuhBWSINZc1tagWSRG7DYMhBiMu377kkRoK8t10?=
 =?us-ascii?Q?65k9dH5TPygsDWCUKfDEcs57QCxMDpi8Mcv80OZtQNZQHQd/HlrfO95iRU22?=
 =?us-ascii?Q?NG2rxs/MV6Wz+yVMLBxGVjiORHP/XaTRRlwU30W6qWqNmoLukAFGwFASOcgL?=
 =?us-ascii?Q?UYDSHvI+eJPT+w5obJa2lPqj3O6rwCE80Km+uda5f1EycpyAV2DBVVhaUn34?=
 =?us-ascii?Q?lN0YVIJ0dh5mpcNzEHtXrFrybj9uiOwrw+PYMx2cQfxBwN2hZbF3YcNeXGyv?=
 =?us-ascii?Q?nYCWB7UWyGQ5oCExFU3nMQbalGKvc5hQWJNxUlZBnpwZL3zHSvRC4Gct7ZZP?=
 =?us-ascii?Q?s1YOKCVImRG5HdLisJPj4xJQPOhpXdcv61VCeB6wWX0gReUBSczyKxFWR6lA?=
 =?us-ascii?Q?oDYlPXqbKqgTUMDaYcWOzUrePXHfNM/YHBSzbDQim+QrrGyjVuuZS5wd+xZ+?=
 =?us-ascii?Q?FOKsIKlUGGYta5363b9hDyupmMkYLefar8erKbGFgGzEOrXaCH5s4HmcVOHt?=
 =?us-ascii?Q?c6RMGz9JS8vIkRYWEv/vg3wwDx+vJmHO6QltrBMVXl3MqzDGGFYDzVC1LW8A?=
 =?us-ascii?Q?o+m7wXVg3k++iWwRxs5PM6tP01qOSY4nvQY5Tji0eamH8XfbWSodrgpVvRX6?=
 =?us-ascii?Q?x1cYb4aX5M9SKFv/4Jd9HO7EBvxNLpYZRD16rIU3yVy1lTcf0zhmqK7Lbq6m?=
X-MS-Exchange-AntiSpam-MessageData-1: G58SztYaVI1S2tFxO7CN0Bz0/M3Jlj/C38s=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21a5d91-d379-492a-5941-08de7a17e4b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:17.4958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0Y6LyZ7UqIF7z2mLSB5vLOH98SO4F56VxscxiRLHxMEWsPi/6eNE+Ef85dWEBH1jZofDyYSht6FIZaQyzsYjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:47 +0000
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
X-Rspamd-Queue-Id: 652A120D228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,poorly.run:email,somainline.org:email]
X-Rspamd-Action: no action

These do not provide much value, and will become hard to maintain once
the Generic PHY framework starts hiding the contents of struct phy from
consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ef298c7d3e5e..cba8a71a2561 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1928,9 +1928,6 @@ void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_phy_reset(ctrl);
 	phy_init(phy);
-
-	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
-			phy, phy->init_count, phy->power_count);
 }
 
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -1943,8 +1940,6 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_phy_reset(ctrl);
 	phy_exit(phy);
-	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
-			phy, phy->init_count, phy->power_count);
 }
 
 static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
@@ -1996,8 +1991,6 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	phy_exit(phy);
 	phy_init(phy);
 
-	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
-			phy, phy->init_count, phy->power_count);
 	return 0;
 }
 
@@ -2588,9 +2581,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
-
-	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
-			phy, phy->init_count, phy->power_count);
 }
 
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -2606,13 +2596,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
-
 	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
 }
 
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -2638,8 +2622,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
-	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
-			phy, phy->init_count, phy->power_count);
 }
 
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
-- 
2.43.0

