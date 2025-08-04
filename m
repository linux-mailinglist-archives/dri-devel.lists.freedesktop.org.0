Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4646B19FF2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02110E432;
	Mon,  4 Aug 2025 10:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VVkt8neJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013053.outbound.protection.outlook.com
 [40.107.162.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5229910E430
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogNeAadcOZrSSNLQda5B/ZXFPdeddyg4PXq68re4r1SvpUaxZwCqbpBnhfKgQKW1ynNfKrhUQQEjNf6jHdzMFJydyccpRrpuZ12Uh47voEenOZjohSnw8anLSppOJRtj5Lx198gqe/pvk2U5/Z72eCRdH762MRqGCU90OZO9cdMTzS5F6sC+q2eFsgy7oyMwo4a+vufP+emu4ZXeT0c5h7M7S06mnUrNYNnF/kNDAtp9PhrxkK/OyYxknYpXg0h7giLGfvXQch6rSQ0IqcwxYEDnxxR+SFxB34skWHsS+u1Q5wb1XqrcPMh88Va1WNc/zRJZhzwjbtfw2RTWZ/m2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhr6adJpFc5GauDPAC3Pw8zxh+WbV8gOqJ/93bN2dLM=;
 b=j4V6LNLoli7O0CUs19QA+cjI6gD3t6lNyk/FPRr+f/HIlaEm6rWbOrPLAtCyNrYwkeaYBiDPZrx+83JqPd7B/aFWKTbDtb6wkLSVdD4SRxQbolzZtg4V2URUMTyyzFRiEL6F9a7EjZsNzGW6KaCtjNGBRyk8i3BUMtqWdgwDHdGQtePF/SthnRq9FTEu0UZxajEGSMxrCrlOpbZEmvqZJ+ijbaBpofLlFBd/5vNWZdjAr3nN9LwU6FpEf3ezZ70x2XjKRfXa+XAbDtupG+dMnoNQVRwGfx534C2USEKnZJr7Gl8xZpU7nHMDiTDh86pFOvOIH/9uyOyojCYwyXPdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhr6adJpFc5GauDPAC3Pw8zxh+WbV8gOqJ/93bN2dLM=;
 b=VVkt8neJstNAXs6nzAoDetdrmAJMxAzDsCVdLYGeP26g8/bgA9S7Z+QHndHwF616GPhc2Lss/KdCZkFciGs/XICyQvQXWf211+yfySK1YkkVmxf6uPAUa+UPJUfix+vQy4pXpKshkElCt0/dR/3D+ZnSJ3tnSZuEIxmzi1r31wv7SKwFdy6aKx/2uDm1iiJhKRmymaephJRWensSh6lDg8l0GlYcCVgFqVNJ8P1lvf7Ihm+Lo6YfibtaCqbVHjBKnT2thgP+zj8kYytGBd/5K91kBBtsHXFOHQdY860Rerm7ZGFSISM1r8I9GITIXabaNaJnS5ZS/REmrkIiR89SyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:48:13 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:48:13 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 3/6] drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to
 get plat_data
Date: Mon,  4 Aug 2025 18:47:19 +0800
Message-Id: <20250804104722.601440-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250804104722.601440-1-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: dff2563f-b4e6-49b6-fa4d-08ddd3446908
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ETrKRn7J72NaRfypn77uttX0W048Aa3DjLRfbO2HTXqxD4Cp6iTzMcq/3qru?=
 =?us-ascii?Q?IwroqIn5LOfkt/A/gSbRdpagJRdJdwLIIKf8hmEBMnIWzp7URSDXTH1N5VYW?=
 =?us-ascii?Q?SA4nqyEBVTR/rLw1JYizzk4tkptMFrmuP7fnflt8vUlWuRiLBZ0E535QdsVM?=
 =?us-ascii?Q?mae+X7ZsBbcNFiUGB11zcEXQB7n9/c6dHTg1QLCKmLS+b0zXjTz2AS5wxnUF?=
 =?us-ascii?Q?YeUJbzGCcU5TpOCwquBC6d3MuLO8bC7DdN/pmAcYdvX6SxTB6KcUzmIdj+41?=
 =?us-ascii?Q?W3WUs8+OlzyQsJuscfOFsAcnSbjzRDR63OKBvR1rKumQULWGayyibLtRF7Jv?=
 =?us-ascii?Q?N0WL9b2/q/jYjoZSubnurIOV/ic5nQX1+fGDBUVsC/e42hCEKH4HLUvLTlPO?=
 =?us-ascii?Q?HjvVBHXhiwAbsI0VlkQLEfQbUNFpt5tWuq6Om+VqA+RhA1+T6KXvhBbiUM2R?=
 =?us-ascii?Q?bI9Tt7UvptRaH+F69oimfKXhUxYic7LavlJUq9dBg+gMZT6qbm/JLRjVO4qD?=
 =?us-ascii?Q?OfypBkB46FScr/KcYZb5ZIiVk6nwDGRFr9NRpMcszvUyU840O4E65EyO8gsj?=
 =?us-ascii?Q?Z0P9CAErE2nhPQ35q6+VpmuD2VfSKjp4QbUTOw4e30eBZ27X2W+zUaaQWyXP?=
 =?us-ascii?Q?UJBV8SYCm0HyC2hL++6irJkhzvlfaEHQCdW1mPnIWUL+WeSZLH3IkoHK70eL?=
 =?us-ascii?Q?KTq6Qe6EZWwx0FVWEttcIcIKK4T2e+wpxj5JkkEL7XllK9ivYs/hlpDTV8y9?=
 =?us-ascii?Q?+Lae8Ycj6WBMvk3Tx84+IQdyOVBSCjvhcFCWU2ztX32wVEVg2SXFlAo7STDW?=
 =?us-ascii?Q?bLEGKZnS3SJKCR+mjPaCCglbr/b4CwmTdGl59Ua095ClFMwkLkMItdyD5sNs?=
 =?us-ascii?Q?2cd3YOljD7Yz63+VH0zPw0ZRb8wi+6+B096KVsy4s3/29drRY6WipQC3RApC?=
 =?us-ascii?Q?c0vLb/L3odT82zSt5iBzhTXiFmMYBEijw/Yw8Tlto83ZxDiCr/0QSjcQ7/aO?=
 =?us-ascii?Q?FO+YJdmmKostBw48jEhr5XzgoBbb3c+8qcSzDcyo0mxLXkFIABTJeaOXwwWH?=
 =?us-ascii?Q?P+0uuXJFTZSHT9By5tQFZDQA8z7ClmyikCwA0vK7yB9QxFAzXlwCDDyI2W30?=
 =?us-ascii?Q?h/HZuJs/VzuIhQRES3qxP0L80w/cyJp3tiVLj5DEJPWRGdc9x9++4nY1dp0l?=
 =?us-ascii?Q?12reyuN4DLnuklJIy4Vfht5kQqowAShEXegDdagH8BqHj2Y1bYFECnsxuMRW?=
 =?us-ascii?Q?Ay2E/k1atGPwBL3JKrhmJOWUDhk1pqUcklkBufYZDmwFz2+JrjClecDtfAda?=
 =?us-ascii?Q?cHFyN4wcyhVSOptykp53xvRMSy22YKSbdXsJh401Ym2JUKl5dOHpu4Er7lP0?=
 =?us-ascii?Q?gm3CE7dGRAVOMScs2MxxUyV6zePkvd3eP+Uown6tlN90dgTdCpAyiz8LiuJm?=
 =?us-ascii?Q?ezo665KyZreS1zFc+6/l5fzGEiRt5K8EyRVXAK4qsDnz+xwbWjRp6mwmDZmH?=
 =?us-ascii?Q?9nT1jyFvFXM51O8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUC1kxud3hQbwfLlxonCw9+ulAU7E16iqy/4R1EKCuvkdB00WWllRAI8Ryz1?=
 =?us-ascii?Q?Hsg5/Uoadx+Ph6hdaMdvvsq+KAAATDXx9jmOBuDGAV5ghsjg0puDTLmKC+As?=
 =?us-ascii?Q?UxI674UeK2ryyRr04MtXBuRRqzdLTNVUfrn1g9o1l+sFdgrIuI04/PztZ4Wl?=
 =?us-ascii?Q?pilIXo1Gei0+afdEQe/HcbRhVEBNWQYadWGq2a6aLdnfnoKxnRXl6zmahqYY?=
 =?us-ascii?Q?H3J6/UImAgQb/+UZG+uk7H0Y7QbHF7Jm11gZXcQM+9ifzDkD3ccMvVin93nU?=
 =?us-ascii?Q?Rze4mKx70fDNJLOK9m8P1jCDxrzdBSXqNV/WVvsogNfNDasSVRDD/PV30CWG?=
 =?us-ascii?Q?sAOpxILCh0RUCt2PM/MJBEl72zvOe4uWdjHxmpwhzvuWWF2Rcd/PtkN3mF8e?=
 =?us-ascii?Q?XCFAl3Gkhvk8KXmnf3CQz4TOCygtTRqJ0Pz8sF5a1TlokC4/l8oFDSFYx0qt?=
 =?us-ascii?Q?1sSMT6lhhBQ32afiwAY/rXBjyYWrtEMq3biGXV6ZK/z5tyr9KxlU49hEe8eL?=
 =?us-ascii?Q?G01BYGXkWyDsH93iix6aQcgYybdJWFi1Wlot5U3OZoQdGezSD8R2CfA2IZ6R?=
 =?us-ascii?Q?yVBbg9UVu76uj7ShDTmV+6kyXT7tfrbUx/pzh0JwIuvQJ1gGQ58r0g8fCXw0?=
 =?us-ascii?Q?Wnj0Q+FnKjLV5HsCWjKJt98n5ex7KSB9ho8bXRn5695QiBf/j+1q1zb9rf9S?=
 =?us-ascii?Q?NfdTTCgKrBKTC8+BH5+kDbef52J9a6QC2jjMwIYHuBmG7DB8g1Yb3W7NiCZf?=
 =?us-ascii?Q?zRopFCLe+T4Bls3JHi+VVr0URwE12zR400+PMet8uinmQdDEIfTWy/Alwiat?=
 =?us-ascii?Q?YA7KLYxRTanhdid0yO9aEDqN8E2vSi0K1rkxqLqoOylyaXE+dbxOOK6lvX9o?=
 =?us-ascii?Q?IUGMvYj36RbdRjNpodrwi7/2uRFnTuxaSd4Hy1CMbz+kD6lUX5rCekqZvG9/?=
 =?us-ascii?Q?+HHa8Uak5ayR9QdBjvvyaB2zD6UmwRpCVW5yYSYS7WM6cKfDpB0/5HX/MGbR?=
 =?us-ascii?Q?hDMiucEuFg2t2zQTRKOd0sf+aB85G/CD6nfsrtblda9uGq384q4AP34v7BMu?=
 =?us-ascii?Q?MBYdX39TdLB0O3Glg/+JdL9VwXjOaJCkCOAONVjyTXqq5Yg47Un8IO07CmOr?=
 =?us-ascii?Q?D+9bitBwwD1/QitUQb2YR6rT3DG8COJfCYJlQn8HyMrqZ0XsY/+x2tGJUk60?=
 =?us-ascii?Q?h2XegCMwtuyysg1gXbKIiqsp+F1GfIhMZDXQFmEGNzapUGm9gZeFXoDwgOU6?=
 =?us-ascii?Q?Un/kUlHF/mw75Qw7iiLyoV6HKVMafRTI8Fn1x3oarM2ufyYKw35nFbMaGRqw?=
 =?us-ascii?Q?DqKlOP93yoD1gcMuFvZFsKCxh4j1YZ3YrBh8/cI0w7YnuI+XRv7EaZ1Z+wy1?=
 =?us-ascii?Q?D8J6pMuhJ0yUfLE6Dsdnk8z7gja3ms0aVRW1K4ZyFiGQkoeMnMJTRMaDWjuz?=
 =?us-ascii?Q?onzaofqW3PCxwt7uDuwem1f9E6wwKDGtuSOpOJRi0WNvmEEj7vfNoLb+c2nD?=
 =?us-ascii?Q?TqoC3hj8Ls9YXBaKgvdj3KgCR16Xj19nurOnZw530tlU5cij5VrKJs3z0nug?=
 =?us-ascii?Q?wXvmROnG6xcz9O1wSx6vQo2q3nh9HFboXGCejiZ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff2563f-b4e6-49b6-fa4d-08ddd3446908
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:48:13.1946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/BNcknxcL9NFT2L1buvwHK9nlEkgbeUia6280OQBHVbry/i9LYJF9XCpGISPKP3+Ya9Kd1YwiJgJDj7LgUBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643
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

Add API dw_hdmi_to_plat_data() to fetch plat_data because audio device
driver needs it to enable(disable)_audio().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 206b099a35e9..8d096b569cf1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -198,6 +198,12 @@ struct dw_hdmi {
 	enum drm_connector_status last_connector_result;
 };
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
+{
+	return hdmi->plat_data;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
+
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
 	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
 	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737c..b8fc4fdf5a21 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -208,4 +208,6 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
 
+const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);
+
 #endif /* __IMX_HDMI_H__ */
-- 
2.34.1

