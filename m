Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58574CA6F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB41810E134;
	Mon, 10 Jul 2023 03:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::709])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73710E134
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6d8WjzKJUch+8QnM1O5l9SjkjyTl16/6XfpFgkt6UNpa8NCVZtQNr62d8CRKp5uSB9fPjbmANedkpud5Xs9+A0J33mnvPBCPCEaRXo3lopA6NTU3a1/10mqD8kfj11JbOqDKP1DBfhGtrYfGsbLSsc6l66CEjiE6A9z+gATXRWrj22/WvQaYbGTaBg+29sSJxR/CUC0vT9q39naErGWw1ukRkJZ9BDhMFpZ6hYc87JhH+b4PnBi07h2wxQQVVyk9tPT2w0JdhmBKF1zK7GVA8X90p6Xm5G4CjFz5Wznvznq5CCult9yAf2p/jSovK677FNgmKYgQ88VRMP3YQInfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW9sy+EuEvJZxUZApA2Ps+U9r0wesnA0NlbXsbEGTtY=;
 b=F4NHamCZxzq/lMGjJbq0/A38egoUyPyGK5THb2SGAOCR+wD2PFwK8B86//vgDvkOgg6y4yGFUuJTZoZdXwuLMt2KBRyV0R6Yqu9HqDV+PWWydRFSilvhnK5Cb6VrWVzDPsx2EMowMRfha7LmMbwNv6tbbjFnQDfY4J1w3MA5E37ZNlOEtUG7rxrsI67qRCV7Wl6llXZ4nNJpRMc9wH9tV4RJtpHvJmwTAWZ6xLmUHm7vbobELWp0GgNNTGfPq3XeIbiakzjWaz5ZG4WPO5M9UJ3sA69s1dZlJNStK5zjf8T+ymErDJugJr/lGt5KB6gNTIgy2D/FcP0+wb92m16AXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW9sy+EuEvJZxUZApA2Ps+U9r0wesnA0NlbXsbEGTtY=;
 b=NQ3O5Adx5dTrU48oYbBn59cnchsj/bAlPF/9EmZlXgiUeEzRJR5urYFFqFQSmu6tdATEq3wmpTNFqPGMQ2ijXjxHiNt8HlXMTL2kUnL3N56eNTtlaOTfhGY51DGko+RZTM++FrudiQhU0iu3y7sGoM7eHyxd/TH10fFbb+OUvYT4WgU127WmWMqENHsC3kGx4m7rdwHpB2m6+hfCjLZu//cVIPJwy3iqcp5KrnEClMLNhr1ajKuh0X0Pf+bFuIY86Tj6Km4h8yvHVPIoBUq2v+rq0YApPRgJzLIqokejYDxkDihQ4yBTFSI8f06TE/OWr6op9C+csu44cg0liRV0LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:29 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 09/19] drm/hisilicon: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:45 +0800
Message-Id: <20230710032355.72914-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7af596b-c2c0-461f-01fb-08db80f52b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98bGvqiHoZfeGi4knrcGjK+fr7Fea2yBMueDvkaB810MQcwvk6jVLYgSTE9MDLpVXsrcBEDpabqxOfQbCadkhjE57iX0MvQcGIqtMIsA8DTlEpPE/b8fEFX3GkTYVLldmZsr4IJ41VBTNMqFtYmc6qWe6NOALl62Lg9vGUVYYHTSLQ6awpLhRUSo5TBaKTwqQ5ZN+DVXLAIpympURVm/+5fgMGa37/ktQnfGBywZqmO2YwfBMHCX9HiRblrTPDPW4hmAiJDwMCYUdlpEXUp7a/nMHPxyw2IdIpnDJQi0ML/nrPV5vjtXgCsr4HOc/qaW3axNLzMu0cCEfaW8gZCrSOKeqgkHBrACUtHeWiQO+d7/coxdaUyPOvSEyyXMU9ctO/izaA85ZKLk6Gr/KKSq4jzqgbrAoZxg0Jostyrmb8zlcPDxgXQSVMOKZAt2HgWRdyN2MEYPXg8yMb3F2HRUOcueSLWMTOIKz+lbv1ynH7CE/DBv79gzCuNeJl1jIrFCcMGprXRh7M/4UBY5OHdKL7o+4Wo3xNgJ1srAV1XjV+Pwm4ZfuJBZiiFO8uD+8Kgovc4hIN6hBav+egXQL02Bwcc3jjMjARAtoQkxLs1CclEw/aRG1GC5fXrctmyVEhjg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(7416002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9PqWLkG040hK5WMcRlxctKlG7ywKKeqT25TPJz87lXmrgJJmN2+HqYi51ls?=
 =?us-ascii?Q?tnfzb5zwc+hWPBoIGmM7ewh3X160WgmHpnQypxM+a+NlkZiuc2+vxeExzSNS?=
 =?us-ascii?Q?QsSsXad1OBR2U17UkGwr9EJBLp3mEvZmExWrdn9w0mZ/VyLe7mZs4WgOG8Ab?=
 =?us-ascii?Q?0OxyRsmtklBU4sVtVG6Mo2o8ALCYIL6FnUXDxm7YgTvLMEsIK9fPSiuiZT6B?=
 =?us-ascii?Q?MuUdodyqkYlhkMpvjX9pI3ItsnWPnr/6eJRp7T1NpD4WYH72eMYmJxR3HKw9?=
 =?us-ascii?Q?POmSrVy4pq0r7jBcspl+ZEQpTiJsVZtnT6AHtPOaG/Uuz6FLwXSpvUcGTSVs?=
 =?us-ascii?Q?diRKhx3TZW4wkjLasq8PKZLKX/Q+CO9tYmSPXV2sWnxKiCm8zAfOFNm/okFA?=
 =?us-ascii?Q?zQ14SPjhFc+zBwYvg+2gQbFfqWHRjNObAz0TAr0xTI8Ileob9mxwHcnDh32p?=
 =?us-ascii?Q?ShpF6Q+PXa6hCEZ3h77wgRalghOPd7s2lXt7ZG/AfuqJQg2GQ4P8UnsRQNay?=
 =?us-ascii?Q?+KiKIdcNOW5Sc9YhxXvjzd3HZnSU0/923r0GFFmVzfyUISAaX8p1OSx6ab5R?=
 =?us-ascii?Q?uWs/aXWYbhJKwvY/3Png9IzAwx/15oNAK7r4oWzkWHgBbwjMjMntr9+f8zJE?=
 =?us-ascii?Q?Zc3NwLQ8lZlpzeYRqH8urFxZ+N5+W4ZKken1cw98QcXCYrVa8SB4x5qjq33e?=
 =?us-ascii?Q?GnOMx6po12DcHcQCxGWCyy8vzLf6Bn5noBB1asYhaoeB36x5CUjciwQR2qEs?=
 =?us-ascii?Q?nafqvf0F7QJNli2aSBXme8S3NtpUVBSaztFhhIcOmmZCvxYZpjq0ZjuBvyoR?=
 =?us-ascii?Q?0bxko4VORo4UN7VwUC4DA64y9ynzqETWw+W940cSQKkkRV9XJrY7TdDOUjrL?=
 =?us-ascii?Q?97iaSVtkLszx2y26d6kvU3QjxuG8y6BlujcD/n9rf3NXUDGk27KLO3wmWjPF?=
 =?us-ascii?Q?vJxzZ1vBtBqoOGcQWs9cwTGcJslKh9tE75KU9UNBdWXGhCX4wjbvRniVrxOk?=
 =?us-ascii?Q?INCCqrmg4oOCCBO2bXm8zyA3KsET/PXIpu+KU6xWtxirUJhx5U0/nAsiXNyr?=
 =?us-ascii?Q?3ivsQEwnw9rt80IP2IB90i+yazN3JaxvBZqTwoeZFNF/PTe0k3qILf8b5v0j?=
 =?us-ascii?Q?ldjvJZrsvHLQlqnZoBoZeplH3EsifR6kZOlvA2NC2+Bf2ymyX4w9MPvH+HE7?=
 =?us-ascii?Q?AKwe+HwFFk6OyK2zSHafC4As868VyvOVJdrDNyZzuC4NS2kmjAJ+ae4ss8m8?=
 =?us-ascii?Q?+LWgBN6GK0NNO2WkkI2dvmFdILXkmH3v1X0QsjRu7cTskkGzJXVvqoitO929?=
 =?us-ascii?Q?Vo/H7BVLmgoIMfFt6Owp9RS6Xg+hvdg/8ZMQnt/gE/g4lMg7ZYTQ2K8BfuLb?=
 =?us-ascii?Q?TI67XGHZiibbxn0h6gYWqEP9I3hHIa/LyCfLILwqP/Az5GjNZzqqRlLLLc2h?=
 =?us-ascii?Q?GszqFkt1iEmGMwbC/dmvime4T4iFOp8FbImT75fVfyxXZYuIVytXQBSKWcLy?=
 =?us-ascii?Q?NsVrqCndCTMujUas9xxYaQ9MGHDupfhmeewE+JYOTbKt/i8M+JEeQyd4u7Ob?=
 =?us-ascii?Q?ETl/yuasIIXiv2fNTxFAFf57lncq49UE0J1au93u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7af596b-c2c0-461f-01fb-08db80f52b97
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:29.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zdajs37lBmaI0XX5BN7ca98X4Fp29i7zmyyn1liSKbUIETWxED9QYQ8UW/+/2Dhj7/GRVJ2TlnYFCx0hRmVKSA==
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
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index d9978b79828c..ff4ed4639509 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -826,7 +826,6 @@ static const struct component_ops dsi_ops = {
 static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
-	struct resource *res;
 
 	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(ctx->pclk)) {
@@ -834,8 +833,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		return PTR_ERR(ctx->pclk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(&pdev->dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap dsi io region\n");
 		return PTR_ERR(ctx->base);
-- 
2.39.0

