Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD76B925A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53410E786;
	Tue, 14 Mar 2023 11:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581B810E785
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mki+RNQBQijV016nWR5GMnq4oN7ENEqKOzYMs2qbDx72IoA+6lDuHbDgNhxtmo2KXnbr2MkBCCm3JnHhQMhI8oNdTN381H+xELnOridgWScs3kYP1kUyHCHHuJ+2gLLp/CsySDLIh0MQ44gPdgO4jljPcyTfXKk73d2TBCyq+NuX5B5sI9i0dpsrTMWVipE/rBDQQ/34mAr8O2V2PeTFPtQaBZ7BaAYy0q1a5ArEzSqxhYEVsgoE3znQm/6BWDSITkhSIwXJ413y6u0SL1aYjm6K0yhDxM8j/1PtXUCIUTmzNHK7wkeIyZwAQPhH2pgYKIYdBlj4obiD1N/fv8y+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Okpc1bDi/B0xkMFvcjnbnh5IX9hb+SBNk9blhpsuyU4=;
 b=HfkZGmR84B0HnwB0sfcpXwYBEP4dOk91uHsjsBzLl7ku8Fut7wZREp90gpRBMtNIOCGWQUGvQLq1QbQerAkCt4rkGq59UkaxVoZBGI5tDYpNR9fl71pKYv83xSOCxMb52/4RIovq0M9qBFCwY2C+KCBOLhxeldsPs7FxQZJ34tdfo4/JyBq+48ZUh5FM3WpyBZtcSpbYizyzcVJEwqIEQmkQKFtu7SSEXIgxowRBwGKl9kk/W2T90de87h4fCDtFlCDrxRdAhrWnh+TuJ/CNl9Ayj3nP67tdv06MbDm91jzmgVWDCKVtT73+Fp8JewAtZXFlaXn4s7OAPcoszvHRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Okpc1bDi/B0xkMFvcjnbnh5IX9hb+SBNk9blhpsuyU4=;
 b=sJTUNYuLxsNocbh1QbHIpY99GGOD14tNuYkdIqNWWw2qVcJXRJTZClune5nn+ho4Q6wQZ34tPyN0uzJ6LhjCOKXdDjumwgf7sgDaCRWIjflw5CFRO5pRXuEhbt3BXItmflbhy/f9Yax/8VR1IuL9ZDF5Y0L1fz/u7or6ZUU5UGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:57:09 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:09 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: display: add rotation property to sitronix,
 st7789v
Date: Tue, 14 Mar 2023 12:56:43 +0100
Message-Id: <20230314115644.3775169-7-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: de0e0d12-9ea4-42f5-5120-08db24833d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HNU2ZnQnNh9WXxogv//XchLkTL4DnFvArVEDwa8CbCYfM/u8QewFtBF2+xCzoMrjskrurQDTTWee/nlK5+9FgpUBfQPVcKzERK6W0yNNRPamFD/znLNpW30JEYbC4YH/rF8hvjMjMVybFn5jAWQJAKPW81Rr+yzjSInMz6rr+2OwMg8RpwzXgD9vjyU06OvKSpZx4t3C8rFgkRSCHRiRQy0OPHeUcYUNdIl3YGBFZkdAzfLzTy1QrpG7z+/dvnSG3LGytEy00KZ3BzTdyVvn553zrCfxJ7iGSHrMHxNZfPo01BTIX3a6xrXY6SVtNZ6tqc3c1TuJVO3Ge06T1UCsPPhTDDTTMPZnVxQcLMxaTk4NWVNEkRKGTtFkLbQpsPEihF2JbCWPVaR0DoDIOqFFGgTN/+Kq/InYCp9CqKLMaz4peKYYUxGJkbOg1c4t/dFqn/aj8sunzJe59YZlVjkfd/cW7xq7YXbI00sydVSgBXAEBCK+pycje7knERGE8GdrkRAy32nSGHWStRvrtxasetkWamgJuXYnmlQFfXKZHgXI6FDI3Vccyneg+BO8qDeU7YFknIK7QCS22K/D/h3px5t51hrISd6CYFI6GnQT5yn9DBnLZcnStBobCqlRJAUT/Nouq0bQS0iCqfZXRTRWaOCzfjJeDCY2m2sCPBPzKD5LWvFKBmq0dVndzepkX2+FbNuFfjj1gRZhUunuMisXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(451199018)(478600001)(52116002)(186003)(26005)(107886003)(6666004)(6486002)(66556008)(54906003)(66476007)(316002)(6506007)(2616005)(66946007)(6512007)(8676002)(41300700001)(4326008)(1076003)(8936002)(44832011)(5660300002)(7416002)(38100700002)(38350700002)(2906002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hOYt42ce50FEHBxBksK1+xlyB8KYdHPEO2q6eWbxo80cvg46N0rl7+JCMyC3?=
 =?us-ascii?Q?++9hPDY//fh7WnMRzJJ0I4x3eVZ8djcXKmOnsdlEZMz9Daw7ez9ScreNL+Rw?=
 =?us-ascii?Q?PKvQZ5wr1Nd/bHzKxb9RiDqWWAkrsY0EihW0m8B72tRy7goGbUcmCdmI3j17?=
 =?us-ascii?Q?+m+SBx2NIpiRT5xg6iTHo1X+xlR/7m86bOmy50NV47Ptxf2ea/La4wcA4pyS?=
 =?us-ascii?Q?ZewmG/vnwl5w2EbERBtm8BLEzbjVhx5edqheLV0XI3pTRlvXkHV7hpkX/XXv?=
 =?us-ascii?Q?UTcJVlhbUQkr6vRO0iHRJ8jqWqVMHXHyxML5kAXuB9zKu2RkxMvKoiA1PFLn?=
 =?us-ascii?Q?rhgAVhval4JDLl6uGUPLVe/QVdk6pA2sTXAS5l8oy0wslQXUp8hcUl7GjZ+K?=
 =?us-ascii?Q?Torze6tRF9JzGe3eT5ELS+HDh700JuJFIgJLvPskjlHyfIp29RzebzfZL6i/?=
 =?us-ascii?Q?slKoGxuKNCUQk/hEXBbXMYxZf+SSo6C8U0gva2ZMtRKCAJQQ8PUpPzi2HsyO?=
 =?us-ascii?Q?oFdgrGAeAsx9qvAJ9SEd4NVUajRer+PQ6wchYRIwrTbgwOcuNHVA/2oyf1Az?=
 =?us-ascii?Q?mrr1/R4nZ56P4ve2mE0mIhqXdxqhV3LVLnCv221+D5U+6k63Sg1wb1CmIgar?=
 =?us-ascii?Q?rhTn66WyDOiaIsP45opsMJ1YULELwncXfdySLAVBQHDvI51pzgTHhbfexLMp?=
 =?us-ascii?Q?pGk8DqBJXKpJwfXrfzN7rVq60DJB2ahwOI2WjI7VwixkKOm36HQpj3qOUQrI?=
 =?us-ascii?Q?kXaEJFVFS+ZNrYPWjVx+R0Y0PspmM2O8AP7hILpHxxGG3XLLqKlzWA/leeT5?=
 =?us-ascii?Q?AW/grCLaaBGe9V3csNFPV3IItMddx/ETG5kgZdoVG62QyGWQhU0CM5yVUaZr?=
 =?us-ascii?Q?uzTkpCu0YQsXCQIZEiMv/JmJIoNJN8JsXZs+kv3sEJ+dNK0/9uDtQ4zgku5I?=
 =?us-ascii?Q?HGYnV3QJMfo4jHXn8u3IVwLlZ3T8G27Bx+K6H8AgB5gTzmtwQuk7Yshwcx3T?=
 =?us-ascii?Q?gERi+5ZZS2pvmSUpX560OVYLxKPuONfis6er0S5URGf6maC5HC/1U/zBJXZn?=
 =?us-ascii?Q?VJ/CrjodFzF90ofLuyfcSwEgXVIJ3SdT4DRpay2wG7t5FaFvtueY5DsttnZM?=
 =?us-ascii?Q?J5kn6q2wz6lIoU5IgG4jUf1/ebrI5vEejMknzwGQi2bVW5i26pYEmmH1RJiT?=
 =?us-ascii?Q?eLfMQzbCT3whmliTYSVjZmjxnpZQjIX3tuqlN8pzrUIHGNlaMaGnYscda7o4?=
 =?us-ascii?Q?0ts9W7uf6eCeET9I+SFeKTTlVkU3SZ5Wrkb0Wa+aCj25KS1bRv94uS7r+NVb?=
 =?us-ascii?Q?ARVLkNwVL6XizW7FjX4Q22hn55zPCHGDREfrogx+Au8txvSQRis7oBdZvAga?=
 =?us-ascii?Q?kxJEIuaoep7cUTsUZnL7jh8xqzWg1Yr6O8IuKF/t60MQsNob4wvJDtEANd1+?=
 =?us-ascii?Q?PioEfGBDQaaO/TvgrWKwHaMqiYSZNv1wCIjNbKNkr63b27TCv/xXVKaISeXe?=
 =?us-ascii?Q?Sj4Li2HqsYmPWST+jNdnScavF7cNmaPSPB04IRDiXdOGav8SeFe58fCh9uLK?=
 =?us-ascii?Q?/pZmCgcFVY9liyVun3XTBw1kqFBO/QRhlOnxiG3CtrTcZs/mm/PHv6YtGY28?=
 =?us-ascii?Q?C2FwdIRnOCkYXVhcMf7873E=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: de0e0d12-9ea4-42f5-5120-08db24833d5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:09.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTDUkM6zASa72bR6HXKCVe256ciLHW/6n9zXSZg8oJLIhjjBdu0/dAMAX96UQHqL4cmyeKKha5L3FadvI9uByLfkJsjPb6qc3SLBjibBquY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Riesch <michael.riesch@wolfvision.net>

The sitronix-st7789v driver now considers the rotation property.
Add the property to the documentation.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index d984b59daa4a..ed942cd3620f 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -22,6 +22,7 @@ properties:
   power-supply: true
   backlight: true
   port: true
+  rotation: true
 
   spi-cpha: true
   spi-cpol: true
@@ -48,6 +49,7 @@ examples:
             reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
             backlight = <&pwm_bl>;
             power-supply = <&power>;
+            rotation = <180>;
             spi-max-frequency = <100000>;
             spi-cpol;
             spi-cpha;
-- 
2.37.2

