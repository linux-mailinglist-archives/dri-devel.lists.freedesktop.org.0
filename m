Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2774D751
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56710E29E;
	Mon, 10 Jul 2023 13:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2104.outbound.protection.outlook.com [40.107.215.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2847B10E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htOVpUO2j8elDid3u3guFhgnz17pMmqPGz0E4aB5G8WgPzdgwgoY7jGCVXTQGpV+UKILVK356RCbdzOpZonetQaFT2IYIehIzNWpBW40B60z5bV/OgOViapPYzy/AxedSwGaee/DOz2SB4OWgDvI/UjidVNYuYQFNhgxCQqpu8ZrtXwI4Wn95ivvm5uIEpoRQQYstqiJoO5meMzYzIag02MmOuFbNI3kyHPlemvWwk1H+rjxqEwAv074wtjqVv2mXxZXWbOXSPj7wwd41kt7YJQqIRmFByb6HG0ZM51JOKHwt/lGidQv/sXpVDNlsyNjK/davTZwBQDDlc/v3wvD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs+EtTk758No/dWDSdfwTWpFXRynKbiaOREM2MESQn4=;
 b=PihuN6cO2+1tqQ0BxY9BkcZK5riTFqD4f5yrjqgIkFww7anlwdidLzB/7cXzPeUiO3JMHhu1pg0c5/XkdzSo0arJemMM6xRou3KQpX8IzVBFcRhpHIC7sRXDOiMgkTkDDEu0nkEroWlCHtXlqNuwZO8SCYhWQkRRRb+ajZ/zz3l0mYddSiZTkPZTmjgKUhWSKbTAqBjn3HWCNESJn5EOSDTmPJZ/T0kDIDrMrx8uzBptL2vPz4G1kKI+38gtXwUw3HTMte3xLVwfOpeGl+VjdAi4TSsFsVpjg36e/vDc5pZNvtu14ruVEheKRgUuIAadjh+2IzjnlvfoV44KFKlpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs+EtTk758No/dWDSdfwTWpFXRynKbiaOREM2MESQn4=;
 b=e6+SJ2Ff74lGYIRyLlWS/gH4e9qeUPe4UahvESCw6W7a5NGWTASypO/4BObv3ztcCKRa6o/qBpcVEXdDkx+VtWkyncEKU9LQk42dvSKgjmM8z0hCcThKEWbehgeY/M+otKYPju3lk3aJIY2OK8N+WdxstPpquwphCAUiANLsDWZ8z1NxXVR6y0mrvLd6v7G9TL/Zt74SxMPDbRCl16FrXarPh3QWsxm/lY5YwIfd4W38UhOcbvqShmWGRkmD71TwBkGKbb5O4MTmswcw6PGGQUXfoIR8I+EbsdTrKYDIgBIoK7ohJ8ezrxPLeSRkc+djzsYMU6yn+GPo0jmv6GFTlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5131.apcprd06.prod.outlook.com (2603:1096:4:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 13:20:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 13:20:12 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 1/4] fbdev: imxfb: Removed unneeded release_mem_region
Date: Mon, 10 Jul 2023 21:19:58 +0800
Message-Id: <20230710132001.50764-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: c236b37b-e1fd-46d8-a131-08db8148639b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mS3vPm/H1rv4xygV6WaSNmQdASxQUrCoCXxA3t8M4RHe16SkoK8KwJNs3qdZ93Q/BC/zkKLIIwRMdYN9TkJyuQdUEMcYHmXRmOyf8C8BdNYlqcEHPUeyRTiYVvOw0koC90Ag/m8YsJKbTn39Esvv0UklLmI/4DTnzEBvjo6VqADLRM9Hw+iopl+ipuRwqCixSWZzqRRVrcVAZg7/xkaUkBjWP32iWQBjkV/44xfVCcVONQXPvFqICTnMAY8P3k7nvTHVG8wAi+KcIWkxkYR4h16321THvSmQP2uCn+Vbtj0Tl/Yuywmwonvb3O5A+q2eun2vKNE7ZAojU57h+x+x/aoaqTZ1nBaQ1fMSGRTE9s2dKeueQa5EgmJv+Ydg5hcaGtRNGt7sYdXqnGsvBzRU5gCBaFafrK/8IMfJLl+20IfhtsvA7rnCvqmRZ76zEH560dOoZGPDF/2dEonpHdfCeYhiEbNbVbDWoAc1w0YhGUdouGMUws8OYADAv0xLjY8s0ARsE+YSzADaAyOFikYUm2rWpz1PEWIEqziFP+G7hpRU3kLoKTuSaIjc6hGWvuFye7lLio5TnXzr03pDF8d1d33Ejy934XCBwMwUhI3cDZcmtr0ZSqNE/0RgKvhtfFnH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(38350700002)(86362001)(38100700002)(36756003)(6666004)(6486002)(52116002)(110136005)(26005)(6506007)(186003)(6512007)(1076003)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(4744005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?islLeWcQBhH4+AToX3FcMqMKCqus2bQKwqb3NNOwZNfiw49ggPzoGugAodV2?=
 =?us-ascii?Q?hFoDXReUlCfOYq7Ff6xEpwU0MidH4CgIDEkehPi10RyPkhBNaN6nvzX6An2t?=
 =?us-ascii?Q?J1Mh6m68WagWwD4wfAzuNoifrHr1DAwwoiY7tccTCDVLkzk9rH+5VFX50rHR?=
 =?us-ascii?Q?eI+/Qk+nbqn2WC2s1i9AqNpnJgbFmKLviIdeV7Any5B0QPjP2MDeFlpcx8L/?=
 =?us-ascii?Q?KbfzKqLcZMuMhAyFb1YYfIzPeXlOIqbzazT7Ero47mXa7cYLh2R16u1vxQ3J?=
 =?us-ascii?Q?oJ8XyJulrzY13Zpxbqwrtcv7O9NOgh0/NHZqrDmaro/k0S7yImI9mqa71Lxs?=
 =?us-ascii?Q?AthxsiEHFpPUIA+65C+9hIADWBUibnXkG4lX4cx67CVsMyBkJ67k+7Q2us2r?=
 =?us-ascii?Q?XxLfu2TW8Kakyusd0zLElCyZjBR3bRzkGqjG9lcSbucdlYVi8r/4DMTxq+gW?=
 =?us-ascii?Q?8bgoZQM9XBaI5XkIYWQX9Kh2RIub0u8ZYmCRnN9x7zP5kBXl8SHUnlNORjzF?=
 =?us-ascii?Q?MfZfNO4P0vHk98/vqTOZzOhfxyhlSgO/w+jxnqmG579inQia/5xC0ZsuUhj8?=
 =?us-ascii?Q?hHTHCqUM2JEv5Qk4tgEQ+T8Rqb2wWda2bADR2zEk4+L5G2kGaCJThaOL6XYV?=
 =?us-ascii?Q?EEz17xqEAlbxZfLtVnYn/QETOhCiOQOCnqb09MwImlx8gMhpSX5HPbcfuHXG?=
 =?us-ascii?Q?CxXBp97Tfa+uFf6q8bNFsByPXJJkXvpa6ruH7qhizQIrMMo3jqIXG3vAKV4Z?=
 =?us-ascii?Q?zSQpNYg4RpFbjntXccgjqliZXmwCd+q6oFQd1lypFOGPTLiUzRpC+h+hBiAI?=
 =?us-ascii?Q?vQE1ApU0WWbB/qAzsjYN+5rkeCWYt+41YcmIs3ZLMSmf8HnzmGZfiBd0EmpT?=
 =?us-ascii?Q?klt9b/dzNRVlGJ/k28cD2V8r/UACNdY39jwXv3eEsM/pK1fuVdxYV2BKwcAg?=
 =?us-ascii?Q?eShWmqaU0vyghhlMAT+wqcQ6AOiZMkZ4azt36dHuykEtuZOG9bsy9g8RjYIj?=
 =?us-ascii?Q?I34Xwir4n2IG+HKDkgs7Y82CyPeiKnY8Qd4gME7Lx7mUzbLHvLMa/cgvTGZk?=
 =?us-ascii?Q?ZG1LXzrwtNzKbjmTmVvdbz4qlLCYtBu2EVN9wtzq7+D0jpglsxvgQKrM3MkI?=
 =?us-ascii?Q?L+bk/x5Uhq3CtF2lx02b542CFqu6ZEuUYWEOQwWmfDfCS23o1sC6paVqTAnE?=
 =?us-ascii?Q?X9+Db6O08X/wnBbxPkxcmsHQNcwxL0zcHUq/saSyYvw8IKnUZKL31tm4o5un?=
 =?us-ascii?Q?EL+tpBTT4MeagrcV79LcM/WJm+yt8KTtfFfOJGS5Kkg5l4HYAPkUCHpqLNgC?=
 =?us-ascii?Q?aaeJYU9tgxBUpSl2zlhlV/fY0MPSja2yzVfT5zwTdoFndrxigvdL/5DQIYWD?=
 =?us-ascii?Q?OfW0XOWannwmtpYMCC0gYvNWhpiulCbcxXHK8c+0Y5wfHnryzqCcEH/8I9bo?=
 =?us-ascii?Q?VSZITavRw+o5Y4PfAANT3uEoWWsrOQk1JduToZDtHPxi2EbYA5Nu7WT3JVVs?=
 =?us-ascii?Q?GAHYQHf/chnB1DtUtj14cFmV9/R/YPcLUiMdDHVilNbXDsS5aSeg4r03WUvG?=
 =?us-ascii?Q?TFmr/IOPUhrqi86GucpcwshxFPAkWJWgsMUf0GTy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c236b37b-e1fd-46d8-a131-08db8148639b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:20:11.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laGEcHXNLlipK8dw2WLzhy0Mjii6dOQGBunFhp2pgwCp8MhQbxqMXqpjxHb1nCAMM15aXWOiXaGsIiHGS0BvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5131
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary release_mem_region from the error path to prevent
mem region from being released twice, which could avoid resource leak
or other unexpected issues.

Fixes: b083c22d5114 ("video: fbdev: imxfb: Convert request_mem_region + ioremap to devm_ioremap_resource")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/video/fbdev/imxfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 04f3bf30a529..385c4715c7b7 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -1043,7 +1043,6 @@ static int imxfb_probe(struct platform_device *pdev)
 failed_map:
 failed_ioremap:
 failed_getclock:
-	release_mem_region(res->start, resource_size(res));
 failed_of_parse:
 	kfree(info->pseudo_palette);
 failed_init:
-- 
2.39.0

