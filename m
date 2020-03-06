Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85217BD3B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77456ED03;
	Fri,  6 Mar 2020 12:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CA66ED02
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi3huxSWLfLLZFh8RVutw1GOeRUVoQxo0TyBDa7gnbILJVJygDpSJEsX/8DT9jK3YmQ0ttoFGXtOUti2sXG4WV7WHUeZ4y0XpqCvt8iMp1CoMK3fMGsKzR9VsWvLp8rViUrLGl+nCsacALCaTBSNdtdCK5bZKuRR6USRi95psz4nWp0Fd+CXTVEv+l+Sdm8JGnVLljCRU1+DOKZuq1ZjQ5gT6wbymY5Kh4KILcdfIUe1VsT+wMga4j1ns67dUlhcdhHkxAtzdX378mGjhl54PWux4h2emBKLLaJCt++JzM0AnhZ2ubz3Yo2FrdJeZujZaXsytx7vA4M+9q3Vabp6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax592+JjoXD/DizyMIeuzqy4QbJyNF5NHqZx39Om/PE=;
 b=A/GvwSO8dqK8LsDNzY1JfFxvSKUYVA5Y0Iqe6piuR8N+5d/teyD/1ZfHPfatwjlAOW+rQtMJIK4yi6zCbuITrM9HaHnE6GCpXmZSicVCxrIQd93PM1yQidYs75w8a5UazoYv1PR4uc0RRuJB1tBywk9JlcMIQqR0tXDGhM5DG4mK/GkdjhpK1kv4sZ2D+yWR5dzl/yWBh5U7rDCsmtHV9/oyX+xIhiVKP8HxnlmCVeZ4cyvgWpviSgrOARMyFCMOkcfSmSsBbuUyTR75XxAjojKDXsy5JOMaIekANJfwWPuD2lKhvv1iYvX+vIz5MNatFeoMfm3zsYQSEHOE/xP8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax592+JjoXD/DizyMIeuzqy4QbJyNF5NHqZx39Om/PE=;
 b=doxShG36ekzxyAXIpWV42OBzfouaR3QCafXTbL9VUIgxbJ3uGoQpfqudTn89Jr0mvPA8n120QBCFljvZNJHNn8DRGeCCXeQEEYHqHoff+t7LcTAJFpAckunrVowKbS6Bb93Jp09eKRdtFvyF+AgzQCBoWH9CgQrLzTDsFccur1I=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@oss.nxp.com; 
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com (20.178.126.145) by
 VI1PR04MB6846.eurprd04.prod.outlook.com (52.133.244.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Fri, 6 Mar 2020 12:50:06 +0000
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1]) by VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1%3]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 12:50:06 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 1/4] drm/imx: compile imx directory by default
Date: Fri,  6 Mar 2020 14:49:25 +0200
Message-Id: <20200306124930.20978-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306124930.20978-1-laurentiu.palcu@oss.nxp.com>
References: <20200306124930.20978-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) To VI1PR04MB5775.eurprd04.prod.outlook.com
 (2603:10a6:803:e2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (89.37.124.34) by
 AM0PR01CA0096.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Fri, 6 Mar 2020 12:50:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64db5675-5757-417d-132f-08d7c1cce4e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6846:|VI1PR04MB6846:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB684680D4845C19B98FB07E61BEE30@VI1PR04MB6846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(189003)(199004)(81166006)(8936002)(81156014)(186003)(110136005)(8676002)(2906002)(44832011)(26005)(2616005)(956004)(4326008)(16526019)(7416002)(4744005)(6506007)(1076003)(52116002)(6666004)(86362001)(66946007)(6512007)(6486002)(5660300002)(478600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6846;
 H:VI1PR04MB5775.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vtMKQPbttK5u2D4lijYUSBmbh2Lamdc4rDLoBPUT8iz5vDEI5a9puTZBTbuYSxHKblhiwXdwpuhWT4ODl2YeKsWTyfQ8iRa2f2WX41hBp5GV6IBv2kVBB8KtSh153rILntGTRN+2v9yVx/D1MUxTFbREXWyQu6aobotfYp6cwcGsHNfTjlqVGymDVdNUW8K+YqL0ZmuHlAb+VGbJn2YOIwq8Y/Am89ny2a7+cusVRvH4EGaVryS1zW82dN+RZY4F5964wF/RTzRSxTidN8Ed44t+29RjFZqmA7f3HsDNyc+x14KrDVkyzzSpC4h5r44PLfYzouyMVbHGj6fdNYgaJdjuQtnm90PDzov9NFVr/m1mlyMpNChKHbfYe49PdbA4Gl1h04V9m0ihSqQiSoOlO68hqHcDpbqv7Mao9hzeyK1ER0mGnr1bUVxiD30HIFo8
X-MS-Exchange-AntiSpam-MessageData: fX+tN+BnrwRuRMSDSiJoVoCzzPaQD5o/Rf+enhCE9IVLgpMQycTs+1TbA5AWyHu/t9K9URsjwMTGkvIuzmnhUcwiEO+du9nXadTPA1MrSkqA0h+Lg074dtFmW/8OW0oVYNyWuTP7WIPpuCew9ibD7A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64db5675-5757-417d-132f-08d7c1cce4e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 12:50:05.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmRB7VPblyYUuIlh7HylVjHu5nAFEslvMDcfq/x+3TbQ6pVuA5RVj/OKgHYsDNUZUZLODMUIsW5xo8L/oYfwbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Currently the drm/imx/ directory is compiled only if DRM_IMX is set. Adding a
new IMX related IP in the same directory would need DRM_IMX to be set, which would
bring in also IPUv3 core driver...

The current patch would allow adding new IPs in the imx/ directory without needing
to set DRM_IMX.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7f72ef5e7811..5272ebd5ce8e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -101,7 +101,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
-obj-$(CONFIG_DRM_IMX) += imx/
+obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
