Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A8861875F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BB310E78B;
	Thu,  3 Nov 2022 18:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C9D10E799
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 18:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCMDq7TrJOKSENYeIVBpljc9xL3M4ILGgyhs1Y4wao/xjN3yodnrb0aIh9TIEMv5A5XI8tN3qE4IV58bYI+/ddJSyIG5a6Caroe3179HTSnnG4dHGr6Bu3XFkAGES/ZTAa8VQTQXKAu3Gyg7MQl539x+OKiWurnPsnPBFHgqTP8zqcwMwsxRvgRxjo/AxKc2DWVvzUOP3+V8WV8GULRQQwhMkXalCzv/ywXGXX+FDM4/EOsKkupXdQDNCqxeiTdkVT3u1xA0oSm+6t8W/dg6kh+/GkHyVhOFkXLRQaUQetis8drqjw+xvZl+8sXdh9dGfz3GDqYr+P33JaAxsYUllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri25IvUS2pPcHFFOJFgol0o/A0BIx9Pq2JB/9dyhRA8=;
 b=e9vIT1/x0lKivb3jlZmGwkQlfsmRGce2dUB/bWzV2dnRjSwNhtN93i/np2fD9j4s69c4a++pagYe+kj/wxVJVN4lDERdHkp5JY0b4zn9KkHQmFk9CLyqJX5wZ7oeDXEH/4affs/OEDWXeMUu4pLFutbg9ONt9aF/4PVBy+m73bN95eRXmgLI2qvSsy5OVyPfXN+N/pDBg8Wk2XZOgEqneJvXvZZ8a8HpUdl5eCoXpurriDmjzxDEm3WNfHRCwllxTu1xkSlQuSp4UsYC0ONumpk2bjWr5Htj2PeLLcNvn19TTKJUQ03Glf0mA0c82Vie5QLh2e1yWNbj2AMw41+OzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri25IvUS2pPcHFFOJFgol0o/A0BIx9Pq2JB/9dyhRA8=;
 b=CXlL5GpPA+TRQviY8fn3oKaPYC+RXiZ/VA0JnMZtasL9mizUaQz8mRUTJTT/dx2qgV8yNrWeHR8ghX38lq9DhQei8WMzamNsElLgQH6MOqmJG8+RiJDfCUwpDEU5tjnIT1IWtjhYksXZ70pR7Ny3RKu5qUxmGJnB2hnC8btUgPoIlDJNh1QHuPxzHolZopFi2YkOFvQ5cxFouXF4Zni4/v4QjTKpbM++U3ZPflLvqbputD0X9mnPBThb3MjoSrM7MfHcEvEhuZDvTckZAki0DJvRKm0WF9s/7OyYu/RZF9EvC8aNdGzLeYXkFaWBXjSBZ3v6EKv/nzLUCRm8j3mgDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM0PR03MB6195.eurprd03.prod.outlook.com (2603:10a6:20b:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 18:22:45 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:22:45 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] component: Add helper for device nodes
Date: Thu,  3 Nov 2022 14:22:21 -0400
Message-Id: <20221103182222.2247724-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221103182222.2247724-1-sean.anderson@seco.com>
References: <20221103182222.2247724-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0027.prod.exchangelabs.com
 (2603:10b6:207:18::40) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM0PR03MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: b87612b6-e984-4839-fc6d-08dabdc86786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zZCzDZn3/RUncMcDPHVLFw0lZ4NH0do8fwaazPGwNGKD6dyKc0Yvznhv5++skeTumA2Vvay1Hjey7jf/jsy5CI2Ul2/vahV0xt69ViokCeXc/AjeUMNSQl0WP3HfVmGa2r7xgAqegZhZBRPXqw9J8vyPyEjBbZwdQxD2S1aa75Byy1CBPxqEvygDm4UctJ73cxaESvgVu2+EcBVImMjOffp8vmaxWcnNXi+P9aNhSSQks5f1wmSEaRNJc9i9ZwTyRuOl0AwM8pGQjnbQTkc5poQbOjZH8hoGRt85tyU5eE78T3WRkm+OakrAcN3i58Rs3CKkwFnpPVeKaEm5XWv3Ql/L+tiAJQCma6l5TGsGESQI6/BSdAJKI9IUO59PMduPiw6XcY5UR7asw/k36NY0FKqWlmDoZPmOIKaZOxJHld+2tqi3/h6P3IqgWQyk9rB6TZKe+2b+G0sk4Y5THm8ZDJMRr00T6P283C5+3Yy5suxWVVkbS8DD3pZbwFNMabcQr9N2DOv9VRzFJrj2B/wkfsPM2jVBujXNXCV0vSke8J6+2yzur9kojPnquhJ83w3vqtyw0b2q3/1xBshcOnhbXJaKqrNEi0Pw1E4bZXELxCePBZLyLvIufh2EVgcCyOXAYtLXLOBKt5PB09VBsZklFV45HQtAPxKv1/BswyTxCuudZnrucKTNyvCSZ5DKHYUy1Tc4ilQnu9OxSjit/jr/SzZKCH47DKLLFc5cFq7oTJpLaORTtm79HEhC0KQbHNi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR03MB4972.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199015)(2906002)(8676002)(66556008)(66476007)(66946007)(4326008)(316002)(26005)(6506007)(6512007)(8936002)(36756003)(110136005)(44832011)(54906003)(41300700001)(86362001)(5660300002)(7416002)(478600001)(6666004)(6486002)(38100700002)(83380400001)(38350700002)(52116002)(186003)(2616005)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtkdx5OKpqKBYuF/1HZuG3O0bhdV1LAEtr3ZdMYz+CnqTve+9iUy0RNzTk6N?=
 =?us-ascii?Q?A2F2RuO4ommKjJzEPAoRVlQPQYXdv+IyHkf80sBFESWH+Dh6XbajOv8fbEOi?=
 =?us-ascii?Q?i9F5Jik1XWT0KYhyZVmVNREn3VcuvYaKX4c//COGgcxXheeNdsW9SzrtaAOf?=
 =?us-ascii?Q?QQbNm8tbHopgrDQc0FnO0+m6zD763aIVzRSFS0QNxE7AKK6MseyeqPFa8s6b?=
 =?us-ascii?Q?vNmrDXjkGXrlthU4u5JceR21KHxchjJlAiOEN+S8sAbh5XMtcqsGH1eP54Vn?=
 =?us-ascii?Q?vO8g8Br1n5UGw5MgDZPdhZXrPU+J8CdyqAlTYp1fbqPHf2EbFwhwJaPlwAR8?=
 =?us-ascii?Q?6cLWGxxhLftAI2PC9GiksWGE+2qyJWLYCqVImvjioLg9DEWyWXbcK32jCgui?=
 =?us-ascii?Q?AO15cqjNeFJXWinuTp6iI1vpKPUbcKLxLFnXE+5RTWWLWp5KeD5hzML9bLEZ?=
 =?us-ascii?Q?ZBES9Zi5w+dwRAFTniZytBMTIo5LtynSf+l0u20K0jjzPFjAtH0txcbCRLpu?=
 =?us-ascii?Q?7VoL1XAE676yrDHSYiyaPDTHGb8xIjdiQ8Uxnoh2QZybqyhQxAetGH8RyfWI?=
 =?us-ascii?Q?ibB9Kvo4qBYjgd6wVW23+/mDwtq8bPfrc8/VoSxirhWLbXJSfSViTvToa18t?=
 =?us-ascii?Q?ZykKuiEXSxQbdUWI4ZMeeUMj98X1Zvkay9szL+j1eEzxvplbsdsztj808Qmj?=
 =?us-ascii?Q?DujeljGLCuPBmgs1oJUkZYB3oRYgOv/QMiw+UWpY//UqxPrTG8bEVkBY5xK/?=
 =?us-ascii?Q?xnocXZ8yoYckHXTV7hHAeUjxrvO0U99KOyA+LP2+Txq3DMf+A0c4fU0fSazH?=
 =?us-ascii?Q?ZV65J65FY0alCtbDKau/I0OsREwD0IR3HStuuFPh4evFFR0fMlHA+nVu1OhG?=
 =?us-ascii?Q?34dcRjPwzVZjFOD7vfFOJJRW8ilxr/JIBQABqEyZpu9vfOZrlSG+3qIwX9jW?=
 =?us-ascii?Q?OhqgKTkLdA2iEVD1OC0taSB22Cof0oOH087HQpBJ9QGXTNePbjrdZVCCk6yh?=
 =?us-ascii?Q?MJgV2ixJpIak5faBOogOM0Ml1bF+a0hCnVb86UtTfI4Qv36ddbPJ5lzz3+Q6?=
 =?us-ascii?Q?NynxP9GkCRZ29+j4Wg8da7WyaUjUDrBOqbayjBHgLGJjNFKjVF87tPPNIdTk?=
 =?us-ascii?Q?Nu+Fl4FWO1ysberH3apUY63Sx2R/lsmhLs7nDiSKRe9Maw4G7TLCqNgr/jas?=
 =?us-ascii?Q?v5EJF7FMQBa0/ki8sLlbEkPLqGWdtWhOl0B3TFAixqmlKBkcWOMF3orlW7sZ?=
 =?us-ascii?Q?pDiTDLIRwCychgf0RrNelTkAGhB5qPqmWHoA8ZAVYYgb8lygZzWCHfD21M5d?=
 =?us-ascii?Q?nhN5f7rH+Hck2pzYSu0mDaRf3elifGwMuhBqPJOAJHzPNDtXUM2uU7L+No4a?=
 =?us-ascii?Q?DPlgtCdss1TXYrUAdfZueos9Me7YW/P8TB2p8f9dbWcY7XUQeU9OhrHAl6pm?=
 =?us-ascii?Q?9mVge/halKrX9hFd+g1K1l/rg63W5T9kTkJqtXCpGb/wSOoMbPZY2tvcPnSa?=
 =?us-ascii?Q?cXVU0NLA5lUsZ7eDUuaw0x6gjsG9DYRtL6OFMxsU1HZWV/QYF2o3ud6+AJqc?=
 =?us-ascii?Q?b0+Oe6atHNXzu0TMaQ2xp2L/BMIg+GJG9KCGpyqjoXplWppqO+IBwiZAeCbg?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87612b6-e984-4839-fc6d-08dabdc86786
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:22:45.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsSG3phTEJ1yI9PLG8vB/lA+jgI7nkHh6VoYTrYmdUe7vhtAlykwKT/BaLKjaYnfvXW4wLW0aRbnHMWWpZMBiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6195
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
Cc: alsa-devel@alsa-project.org, Sean Anderson <sean.anderson@seco.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a common case where component_patch_add_release is called with
component_release_of/component_compare_of and a device node. Add a
helper and convert existing users.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 drivers/iommu/mtk_iommu.c    | 3 +--
 drivers/iommu/mtk_iommu_v1.c | 3 +--
 include/linux/component.h    | 9 +++++++++
 sound/soc/codecs/wcd938x.c   | 6 ++----
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ab2ecfe01f8..483b7a9e4410 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, match, component_release_of,
-					    component_compare_of, larbnode);
+		component_match_add_of(dev, match, larbnode);
 	}
 
 	/* Get smi-(sub)-common dev from the last larb. */
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 6e0e65831eb7..fb09ed6bf550 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -672,8 +672,7 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[i].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, &match, component_release_of,
-					    component_compare_of, larbnode);
+		component_match_add_of(dev, &match, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/include/linux/component.h b/include/linux/component.h
index df4aa75c9e7c..fb5d2dbc34d8 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -6,6 +6,7 @@
 
 
 struct device;
+struct device_node;
 
 /**
  * struct component_ops - callbacks for component drivers
@@ -128,4 +129,12 @@ static inline void component_match_add(struct device *parent,
 				    compare_data);
 }
 
+static inline void component_match_add_of(struct device *parent,
+					  struct component_match **matchptr,
+					  struct device_node *node)
+{
+	component_match_add_release(parent, matchptr, component_release_of,
+				    component_compare_of, node);
+}
+
 #endif
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aca06a4026f3..2f8444e54083 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4474,8 +4474,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 	}
 
 	of_node_get(wcd938x->rxnode);
-	component_match_add_release(dev, matchptr, component_release_of,
-				    component_compare_of, wcd938x->rxnode);
+	component_match_add_of(dev, matchptr, wcd938x->rxnode);
 
 	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
 	if (!wcd938x->txnode) {
@@ -4483,8 +4482,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 		return -ENODEV;
 	}
 	of_node_get(wcd938x->txnode);
-	component_match_add_release(dev, matchptr, component_release_of,
-				    component_compare_of, wcd938x->txnode);
+	component_match_add_of(dev, matchptr, wcd938x->txnode);
 	return 0;
 }
 
-- 
2.35.1.1320.gc452695387.dirty

