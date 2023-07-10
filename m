Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45374CA6C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5A10E109;
	Mon, 10 Jul 2023 03:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::728])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF1210E133
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETAm4LhStVE1uLwhQY9Re4G6Qc+uXClXanZQvJFmbjoKHv85e9bcyZylYWUC1HlBJQ08dab1JUhCgjXKK8IQudz7j0Fwgj5Gm8Z8+bfY0+8aiq4jJ7wZtD3eLh2dw6wsZeH2PkN62TygBbOYqOVtIqeOplKjzidSSOboKZ67RMeQm8atFk8w26J63L+JyTTEnY7fH3stjShHm2aVMVLXma/YHnkL10A0+macR4CaUqoGvicY9/WCD2Zp4hK9tPa/RpFzAEbGWNXIyAL605zBnXsxUxGGV8rt3CINLMc+2oBeTDQ7PCyyikr7E/1OpyVG8rgy1oqVlLrhxY2nJ0LeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPh7w2tfUcUCDzFXMlvzWNOdVB0uj8dkWp6h+wAiGRI=;
 b=AFE2KcZ/ixZet39xiUejnOe85tHFakY8rQQeNK3NMg5NYlOqAmWQNqQGRdKzuh/49LDertw2uTCyl6T7wTw1dR7x5Fox6sLzQj+SjI2AP1Jo3bgbi88TrQhRMc4sATZZIFB9po+LKqCT793c1JbXxp5unRNNCYz9ck0uU28U2ZTNiT0qO5neK4Kg/PSTkgECz1cUp6oDyxUoAbNLCSf8BoBd+2YLyXHlGV2FmRIQcJ0/3jXvPJMaJpeM5HSnzsXSbeNMFU37s7xXAXM1aQOeQUSFIWay0VaR9jAqHsBSOW2NyzLFl0FTvidm+z9rA6lfFTWeSXoCqQHrBKOkwHcmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPh7w2tfUcUCDzFXMlvzWNOdVB0uj8dkWp6h+wAiGRI=;
 b=W5262dQpMFc2426gBEnwK8Nfal8I0j8e76l1cqeid4QPLZURTE1rdM4DMIxpkWDQogTtyEWQmIe40RKenNBjTw4bg5+Fw7rv01QPXrbolhDtFB/R4gk5LHP/bZ5ds9lcthAg0CiZtcf7+/FLrWdH9JwZxTbgPGkCO1J1dcrFSMszeJ2nCycnVqMhj5cu2b3hlNPkKhNZYI8IDqDXCrcrtHq4tBT9A6kCIts9depPjJenggzLUXgV0IRj/I0jQJxoxFHtmZhxqJ2WfhoZodksIBLYILWpkDgpEgTNL68r10iL0ff+a34eDekjX84Yhw5drxAlRpd/uGW92ZVX4OIkwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:26 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 08/19] gpu: ipu-v3: prg: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:44 +0800
Message-Id: <20230710032355.72914-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0984fe-583d-4599-8764-08db80f52a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYBw994qVInCgLQpzicQqwAG0FxBmAqaFjI1ikujnlhyZ1k6BeIifyD/CR2z4qx7ITbOBgIV1Sqd60cZX/VOHgNzPp1yiJKfV+tlSqn2yeEA0M6pG4PLBJTvo5Tlfp3oEvvdk+FIotiD/MlbFg17mKPQkge5m0slenCSqz9ETkppXsaXqJnfa4q0ZmNySHFQhulZ4tS1sEB+V/S8ept9UwKnwLLrsxcBkoAFfh602R0/lim8LZX9IJWffosz4MVKG/9UL0q9M0nRUfCC2RioI6Rb3/jy8WPkEMeQQfsMBRdlcslHm9JCuVT49aPDYfqYZ0CNZ/BU/g9GHgjlJsAsK0ZFGp9iCUzc+MhZw2vYyXzChANBCqwlfjjkoPBqlhr+exvrZjW39LnUillURK/24NlWrHihzJ63WLWsj9c0XSI3F6p4DFwRT+hNdrJu7C/txbDVN2zSCqc5Cv4Jo4NSnSS4MNJLCJX3mKXIRXss7wiwQpz71k3x3fsIqpc/HFIv7IWLvQKAo0BSlognokQmUx+IAu+AgJfx/4kXPhcSg7TLXTAwzcsU+cLhnMBhdADgBLHL9SHjA5YYABHEj2D3cA2bzEsvil3PbsDSmSDIiSo5VLd2CzQdHmdwCdJ/tZix
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gdCwJHbtFe+gDiL4PvoEBhqDCndITvsSTc5ky4LLlx4xBvTuKlnuPITdHg2t?=
 =?us-ascii?Q?cWWRO8tO+ELX9ut8Qg7dgm48ET/A/N9iP/B8f29t9hZ2C/DMpRPgXhsod9Ms?=
 =?us-ascii?Q?JekvlYnmIQcsdorv+F6/qVfur0lNJrm3iJf2d3ZvN9WFGUfPSvbwYn1dMDqp?=
 =?us-ascii?Q?Cr2r5hF8GuKpH7+himKrFDyBqjZGeudquGqtLnwIkdTezYp0tIOgj+S/mPkZ?=
 =?us-ascii?Q?dTCQF9DU/LWUCPAjvdZc390qsJFVAfIH6wvxeoSrIk3TGa3kLg4NDOj2y/6q?=
 =?us-ascii?Q?OwiM8dAvt86AR4p/hWRWqQs7AnRHxkaVFBzvEFJ8Vn6PSkzw6OkpKU5NjWhw?=
 =?us-ascii?Q?znOk7kTjx5UPO60vSk0nlUpgMouNbcT6pZNCwbkCPc5pAq7xzRN1wr0vL5Bu?=
 =?us-ascii?Q?BZ5DFq2DmsW3jzgHlz0XCAez+I0dfZztZsWhLkJHtqTyJGcdQ8zNut2zi1Ni?=
 =?us-ascii?Q?THZP76WVUIGpR5BwRmbz078qSd/B107z4/JVEbxInRLAeGgRkKIUTb1QIzO1?=
 =?us-ascii?Q?jkaHrh1zpXX4FO/KXoLaX25bitcJxAStZtCOl2w1WTE/XSuSwcASiDLpU6CL?=
 =?us-ascii?Q?tZJNtbRrYg2xuM/BrGlcIL+kXJAjUDmkh4/k9AP1kII+qsklByeIj6OD96xW?=
 =?us-ascii?Q?mNpRM8BhWscPsPnO76vEU2D/eBkwmBMoUBaclTH1h0puJTzE6+tsChSmp71h?=
 =?us-ascii?Q?1xlMCxqTGYY93f8TAk6LGPtJvVDqHq0H8K23sKWN/cyuqb0hfzarc+ghc+bf?=
 =?us-ascii?Q?GYlAdMRvWxt5X3z91wn4Ewxp8EU5xBQX8aobgK71XJMs09rBqNRbT6p0AF4N?=
 =?us-ascii?Q?IRzBAPTchw0HocGM6ZSRcdeYj1SyFQepe80B137BTQlQltjzEGbWQT9df/zA?=
 =?us-ascii?Q?Nl5MCXZbmjuvcsdLCpTjQA3ctX7HeHfp80eBv42CKHySd3JnpeK+Gn3aG4LU?=
 =?us-ascii?Q?f+lPKTMacgWypuZ6wAA3I2CkJHDA3Mtt8pSMDrsyBIVKPRjPF8+X3QCLB50Y?=
 =?us-ascii?Q?RNUreZzNVAx3FKixYkWIyIleU1WON5xwkmF9n8nhdK1tcFilU5omLH96Gz4D?=
 =?us-ascii?Q?i+HiS685lFBY5xiIA2aQ4S9jFXZHn5STqfX6zNhZ28/r7V0IQjM76SBQ/DJW?=
 =?us-ascii?Q?9/WMgwEPcNCIP3EmJSBwiLmI6GKUX7Gnq0SNL2DRHcA9L1KoPl2zQqLJP7LZ?=
 =?us-ascii?Q?XFUErT4vKzGR3cbWXMBnfcjMg24q3NY3ZSqGrGNVavRPMTU3mmiphhUmWVzU?=
 =?us-ascii?Q?+toAmBlFv0D3bLrUXr1vApfysGXHlCasxPjQoSI3ka4IdQYo6YkCdlT9bLgE?=
 =?us-ascii?Q?mjHi3F9Rk5JKVrqEJa7pO3nfHXkp7BzC6VfuBG0rKP3uxPmlcrX7F648/LhM?=
 =?us-ascii?Q?O4J0x1JxGDOF8T2UMKjjH7/hzk9Yo39jCeyS2ru2fbP/+cAcLkBRzCH+T1BZ?=
 =?us-ascii?Q?pss+W+720LBpI5Yh2iy+4AQho/TlQEmccpTTil556uDCxLr6JA523P1+jDZf?=
 =?us-ascii?Q?UPXuN+YKLH6xLtmiRQNDU9wDkCmL//GmV+hjLpBh7FBDMix0OoHHdVgJim0x?=
 =?us-ascii?Q?5oelLVg6X5o3Nd8on5Al1DFurA3ZzFAXtvdy4n3E?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0984fe-583d-4599-8764-08db80f52a25
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:26.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy8UlIspDyeliP/O2taJDrp1wx9NZB+piDRgyorAwlxSB0DSYSIfpiUuYGPYfL0MyZi1UjpWO8DZ+OC6sVwR4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/ipu-v3/ipu-prg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 196797c1b4b3..729605709955 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -358,7 +358,6 @@ EXPORT_SYMBOL_GPL(ipu_prg_channel_configure_pending);
 static int ipu_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct ipu_prg *prg;
 	u32 val;
 	int i, ret;
@@ -367,12 +366,10 @@ static int ipu_prg_probe(struct platform_device *pdev)
 	if (!prg)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	prg->regs = devm_ioremap_resource(&pdev->dev, res);
+	prg->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(prg->regs))
 		return PTR_ERR(prg->regs);
 
-
 	prg->clk_ipg = devm_clk_get(dev, "ipg");
 	if (IS_ERR(prg->clk_ipg))
 		return PTR_ERR(prg->clk_ipg);
-- 
2.39.0

