Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B82B4335B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68D310E982;
	Thu,  4 Sep 2025 07:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hRQzY3rl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C9610E982
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H31untSZtWrNdV4iAz2UXL0pffappiRDbXwIwlhohHDKmAQD2BF16ER+3OXgFSGB0CceYu0MXno4QgC+DJwvfV/6oxI+5KUXgd+u+8ktw2exV9MHI6HV9KyQOAO8jxx9Vma0pSVdYrUnvPNhasXI6sAjz8SsEutU0AFy8CdsgWZ3rGTCtqf4tJi65g8LvrBeDsvGYB4yDq40xlNwY0n6bAS0imF8yMleUywXc8e0/bhkxJuCTVq7dYSpuc98pq8LM+fw+w+m6BjIpqTdONCuO2eebc3MaBouNCxFFFU36EZX4hRzTBSXMSNjd7LZvgP45zfo8Xno8uKwZQzVFgsaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=l5pQNNBT9QmcmyYvU7gnp+Bqq+XXcd0wsidxChrIGEq+REMoX22yIxwi4p5WId1Qf3gIXMWZf8oVQMHdXNbeRYgk/tpnjRCYXhr0rYLoGCQqKEyZmKU6H9aJiHAytwNb5kQLb+EYa81MCAZIDGhyp+b7mGHoTw/t+9zwv5dQ/tYLgTzRuPuRvoRvP0WdBjX1Bj3SroyaKDEuCSf/PEkqalrsJ/q43CTK6dIUcmXDjc+h8qsNJpX0iLORlU1RvydH9yi25+BXcXRLq89cFkJLNT3m0uEL6AhjhUerIAVWUMFc9IYjUDNiAXscy6tkAtx0Bkd3Kfgync81dJm1tAPiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkqAn79cxFCsxx7DGR0ECu7k0oZKV8nB8gzpx7KVQFM=;
 b=hRQzY3rlvZE48h5cY5DRYejI7sCOgmTv98tZ+WtynxPhiEJIcONS8usgwFyBPDj5E25Zm7hZw436q+EjKvQA4alolz3kAyg/5DWxjajZiYAsBlBLblOmUTfUY43EhJN6Qo22zkKG2M6Ws1MGThRaOsKhk2xrVIqvjceT8Wkpny/gVPycS3LAa06/A/Xuq+BXpbR5Sw2PxvdYRZQf2fXm8Abi02KUHDz9vpuvl8b6MiwBF4tvzozUk5YTEu87mmnMDacciIA7qmHxz8uVSaeo4KkChiCdBZEaIQRmOhgMveK3lXEmCb6CbhYWkcMy/l3DPS5MYTynAymNIqEA74P9Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:06:57 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:06:57 +0000
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
Subject: [PATCH v6 3/7] drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to
 get plat_data
Date: Thu,  4 Sep 2025 15:05:56 +0800
Message-Id: <20250904070600.1361165-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a0ce91-0b7d-4e80-4ce1-08ddeb81a29c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L4mBCasg5FiC6490lKveSLH0jvSyig1QZRQZlbY+Qyi7+wtwlnj2PyvliBfu?=
 =?us-ascii?Q?ARM6PKyd4dLWvS9KjytE5a68ti7I9SIJ7/pf279rhorRj11A2JbYyhuba7KW?=
 =?us-ascii?Q?C/yt5Me4ANn2qhUJbB2djeoydDwJy3RhgaybJmOPZ+I8K7c8TI/raSq/k716?=
 =?us-ascii?Q?dmX8iLNO0HYyg2+4rhc58Qmlt4MsG7rWrG13QfjNfcPt5S/Inn/zB2LHcTcY?=
 =?us-ascii?Q?s6oKVsz4j3mkSY62Rkj7wwLdBlsWbyjWMRvj/UYTULPedSYSvXk691+ZXAEO?=
 =?us-ascii?Q?TLMygXkBdp+YHkqyUmeCzGl4VR2wiGyasjisUzNOhSP62ALrVFwYXvAhEx2Z?=
 =?us-ascii?Q?m3Dlc3uUgKDmgwcv6mwHqIX/Z4r/SoARcg1K2TTHtjwV6sMqzS3weRcmSyUN?=
 =?us-ascii?Q?tGd0fuyjhRVEke+fP5BnBSG+wTuifGCFvSLdLFp6Zj/wFTM4PiEZGe+Tp5sq?=
 =?us-ascii?Q?mN9ennTJFEbIcdCDam03B2st/AppO2HiCLTZDzmOPNvPBP1GJK4b10u7Bpmx?=
 =?us-ascii?Q?oQWB3JKVkCvjCS5Uf+J+q2zcBw5L26jcFRiq/S+DzaQE+/5esSsyFumk1+YW?=
 =?us-ascii?Q?dNAEXVYlHuBG8gcaUM4HcZfUgedHHs8kShKC/mpJyv6H5p55akTtZuzvq0Km?=
 =?us-ascii?Q?KiP9Bq8AFVpVrVfAygHomtAM7mcMKod0MEWNHV6+i7PBNMaDCF+rbN4Iv8SJ?=
 =?us-ascii?Q?Uz9v9jTfxnUdZFDVqkf4S8OFGavbJ4SCGI3CTD5638LKgiMsH0G7rLV2Qa9R?=
 =?us-ascii?Q?Ac7SF8Uua9NZAro0yqY2LcT1UneUGkoWXAJcP6lYT0qj1kUxCoRaeDGNsCUm?=
 =?us-ascii?Q?+BpkROZ9DjRW1y6/VpjPu2tA5rlsi0No2xQCfe11YE0HVm+HbqkjNLXOBiN9?=
 =?us-ascii?Q?9SF+x6tyiT2jVkOraphoNhyFfr2N1V9jCGRDWeSHMZxk4mt8IfQSjBOQqYu0?=
 =?us-ascii?Q?00rvJrgkbUICY7IVySRMbg0Xsg8okjPJPL+Z0Uu5gGQ9uj7n1dysw5Ek6lyC?=
 =?us-ascii?Q?bCItFgV6RHokJQ+zxN0S1EkHMUlWhQOW9hN9Oeh6X/RZqKyUYpJY3CJ5n4qp?=
 =?us-ascii?Q?+b7PF3D7Bwkzu7MFPonz8W0pZDicy3ZjzROWdrHJkP6T/CYQzP8zMcAHZ95H?=
 =?us-ascii?Q?3PpOaCh+XGykT1GinjfAphAoozIKm+QTbYBUhXcF7QorEIuHAcMZ+naw8c8J?=
 =?us-ascii?Q?4x0Tf7oDA8wj+ach3GJr5uZyaAW20FsraAxAscQwgu1nr4Reo8IapeJQeySh?=
 =?us-ascii?Q?UMXlHJr9iwakJs5iwBC83BYspo+Sh2f6ZLB0ydZvwli690AJRIbRREYBlSEu?=
 =?us-ascii?Q?q/UKlpZkwDrPS6QFz88cuYl5MjLSCpXwppOxkaijDz0GY8xBPmKB4fJyKKR7?=
 =?us-ascii?Q?RzR9gmQGZ0bv9ii+SPxa0Huw2pS+vgBZorE5/UWOv+LuGViKvXUfrzC0es3v?=
 =?us-ascii?Q?lHdf3Bu6F2FCcWOj2AQ4To6mdIeQ+IDP9suX6+Q6Ue+bCQiGLJEApckRtE7G?=
 =?us-ascii?Q?VSI0mWX+Te4/9tY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?22S+NDIph4RBiTOTOHKyuwSjtXYQuS47VLMArMInDNGF1g282oQyiZOYmiPD?=
 =?us-ascii?Q?ZV+EBFzaqDhSeSld50wnpeYHR+0Z5WEjAhjJoWWsnUwREka65o5m3HLsFzoU?=
 =?us-ascii?Q?QOlr7pRrCTq1h9/vZhlvcrS5hBM9+2TvhGPDHl5nd0cq/LfU938QOj3C/h8v?=
 =?us-ascii?Q?QrPJXcCOylfeMyHmmcSdSRD8baCXuWj/gROaJaLuFiqiXvMXx1aSdsVW5j0d?=
 =?us-ascii?Q?UALufXtt7zuctpge/KPd95pzV1O1TKtTsNaAdijiN2ZxtTeXV+zHhVzQwtBS?=
 =?us-ascii?Q?N5C2upVMG/YB0Kre+StXQbVBkDYfD1Ayb+rQKmJ/SyT+8no3faB3jeRPBnSe?=
 =?us-ascii?Q?EZ1o5IfT3v/Z4YVGEprIf8nipAukdzo7B07YgutXvlIYBzIYkDQnpyo3WslZ?=
 =?us-ascii?Q?Rob4x/8HCQEhqAwQFajyS4WpK6ApgfyGiXAyZ4HXfiwl8LwYyq/414r0Y9Nx?=
 =?us-ascii?Q?lPclmBYHDufDa6hCBsMMtFsQMZIH/orjT5HedN5h29tOZv/30Y+XqDFGQzqP?=
 =?us-ascii?Q?vTCphJXYffwbSrAZJCdxLqH8rDqxNcgz3ygUP4m6F0DGGutQGgVIHhv1LMPI?=
 =?us-ascii?Q?ch/bWqarVpJg6/ZPW3tdEbmXX5ZSKZl0ss6evCCUf1YbR3O6Nz7Iyll/9gF0?=
 =?us-ascii?Q?1OZn1IcYT7OXFvjIju55J/zBK9S3nwdEhrqrMRbn4bo2/nRmcNhIeD+kwYMy?=
 =?us-ascii?Q?9+qNNO2clEJuFPy4/YakB//iAINdRFwH/Y+RPjt5xWJFIezonx709+PwEt+B?=
 =?us-ascii?Q?pETCnF8Cz3/KlDQBsyVKEh3Z5PZYIZdwPsk3iCgRmmqX+Pbpqnw3StgpfRse?=
 =?us-ascii?Q?aJ3s2bRUNym3onN/JQLixmFFxI+gipZBukQXBSfsmowQKpp1DDk8tG8HoRp2?=
 =?us-ascii?Q?Zxq3eOVEyb44VjZwx254V0DK/dzdjMliNS422rOa8EpDi0ppfiz0xESOKPFs?=
 =?us-ascii?Q?+Ms3AoDl/YX08lgVLTy6mSLlF++eayuoTeUH7dfJAMpvm/efjAw764xopTSM?=
 =?us-ascii?Q?aMHTXdJwhVMWQLM7l2WIqWbCHdzkBLS5gN4haEE5IK3s+8mRpZVFlZRVj43L?=
 =?us-ascii?Q?3T1mjbljVNciFlAkEyd0zDPJ+SpxCPzfy51RCIkl5SGjmO5nS/RFnoUrzIoc?=
 =?us-ascii?Q?H9ZkO86kxBod79cGEsje9QEtLQYqcEqwhnFaUEcThafExXOaRaqDRDKYcwHj?=
 =?us-ascii?Q?kg20QUS8JHNBhK+NwFV07eho/waq764mDvRS5047DdrBmD4apkqO1oXWK8Xb?=
 =?us-ascii?Q?aGX1b3lrXU6hm9Litomr6XM0e8vkqs/Je3LM+wkSUkudr0MOC51Fxyn1CmHA?=
 =?us-ascii?Q?oEwL5H4uo61WLZbHydBta0Ad3BKdo0L8aB5WcwphQ8uNEzUUKZenjty88XJu?=
 =?us-ascii?Q?ngM+ihZZWj+3d6ikil8+l89UAAxOfK535MdgbJDEQ7ENkA1Ao9naP561FuB+?=
 =?us-ascii?Q?q43qnziGiOGn1hae6/K8MctVlqYHOjp8rP1tCH9dDVAOqcjmfMxXB4zsOXwc?=
 =?us-ascii?Q?AFQjincAVVwmlpAlV5NjKMjoRgyjPBOp8Rrwp3PUxCrLVZ95pudIakzqr0tI?=
 =?us-ascii?Q?gEE/Iq2c+fffy4mjQzqARGsky8NijmQjlTdxNfOS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a0ce91-0b7d-4e80-4ce1-08ddeb81a29c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:06:56.9653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYGsH3wx7HQP5kb40SFS/sV5DTyfl4WaXeUQkOSUbahptsxivM6+rWiNeWGr7IcCRumwBkk2M/Qjw+aPOS8lVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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
Acked-by: Liu Ying <victor.liu@nxp.com>
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

