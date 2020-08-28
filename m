Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A64256666
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB5D6EBED;
	Sat, 29 Aug 2020 09:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40041.outbound.protection.outlook.com [40.107.4.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B8F6E4C7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3OxK3yXrAD7PNwpxy207H1wpboHj22i5UKfT6TZiYhkiDdLyI/3WMqNWDx2QFwxD1GOa+O2bqsMG/VnX40xYg+25ob+q7MNA1A8hGK8+7RBfOSSNxm4+oFWAhO5dP162bJg9BVbZVH5zks2cOWfHKNwoVBIKU/uE69HyXklHo+9St4NC8O204m21MAOQ+tiLNzSftVAYBao0pH3pMlX2tbD2YBrSXT5gv305C9HsTKqIOMiiTtfS3y/8xXkDdIyP14M8fPg7+n2y+dvcCgsvZMUtJIdOGu8Ma67u2lJIPxXhFlYrTw/j2I5jzy+dxZ6t6HzlrtBoWTp+yufIM4M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgRg+a625mbmdM6n9hiYMI39qtK++OTcntI7TW/VhHQ=;
 b=nfjFEd/nzOZEcpkYumchdV9szIQ2RjUNBqy0SN/5m1/1X1woWoCXiDO6lg7kFf8Gc6A67PbpOOwna9qGGSSg57YYiPlO1ElDAfASDsvk1CvcCp6NSYBoxPnY2oh3SKAJgx5hVyLA+e/a41TiKK96d6tpO/3Xr/OonfJuGsHjTPi1F/jDaFlFzgmDxoufps/Eoc2LR+RyZxiGKajDZ2dKmjeZmVd9UFksn8AjO3ua1pFliJg0HjDmzQ82sowl+ME2m0yYP3bzSxE+5ZORgyLlrFwB/r5Mi8CMp7Iu8S0eUnXhAUtFnBj/JFGeqAq8a75MdwVvYjmFFSmUt5yi89tG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgRg+a625mbmdM6n9hiYMI39qtK++OTcntI7TW/VhHQ=;
 b=hckcvRnjPKb61vsc6nbBm4jVCgkLIDAREht8XIpvvW0vBDEazfuW7aMFRkfFTDzROmAnq/NtZVNK/3cdzdsCEMk+/BjIdITIbTuiGR7CND60bYEvVn0gE0qFjoXQfpoBlHLVUt5hEGVPCbJoOwWFE7m3zvvAO4+bA7SttAil+eY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DB6PR0401MB2293.eurprd04.prod.outlook.com (2603:10a6:4:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 28 Aug
 2020 14:58:39 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 14:58:39 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel: rm67191: Remove CLOCK_NON_CONTINUOUS flag
Date: Fri, 28 Aug 2020 17:58:33 +0300
Message-Id: <1598626713-5595-1-git-send-email-robert.chiras@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: AM4PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:205::30)
 To DB6PR0401MB2598.eurprd04.prod.outlook.com
 (2603:10a6:4:39::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-120.ea.freescale.net (83.217.231.2) by
 AM4PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:205::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 14:58:38 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0943744-9a3b-4288-6136-08d84b62d8a5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2293:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB229302E093CEA7071E172CF6A2520@DB6PR0401MB2293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ad2GG+1yD8mFAZjWIFDXlDGxyeyHEAeahFCBL2UN2/eO+ka+PAOPPMQxd+ibvDcsHiXiKyzwCPbLpqMfcrUPsCbuBR21ShehmvF09Wml3jNaH8lVm4R0iot39mvXOGWIarzUcXrMIBiwl3XL3YoDlkEmlORHW/1+quaWYtHxx5103mHM9UbiitNP7x4RYmqpeC4p80+cjtSUDDQKG4npbQyxH2vxyn5YnlIok4PMEupwMDLLO3RQSsXxpPYo4N7WplpNYGil8KpLaY+EinbTebJqud/vtO5EqEVp1Pky6AN2ChijD2oKwuogUxECM3eAcxoJv6i4ZHNiBabeYgkXew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(6486002)(2906002)(478600001)(186003)(16526019)(52116002)(8936002)(83380400001)(26005)(956004)(86362001)(6512007)(8676002)(2616005)(6506007)(5660300002)(316002)(6666004)(4744005)(110136005)(66946007)(54906003)(66556008)(4326008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: R7VqjYz5eK8yxxzxPIdJT1xcfVWcFXtYeaoETp8C1qaQTbliOClsNsKhmZ85sQ4W4JgvJeOdXCsCKrRzlFbAfn3VslCUm9y1sBXV/gh4CtAd8gggGmNG4VqSSI4x+8F0+E4knEGUVNzajjm0POvI0o+or/C47GEa3soc9m3ykH1qY8RfA7LnsmRMNfkSoFhErZho8iv0O1bWjfO1yZMvhNHiNuNdIVN2MLjvORts22PvH9RZvZNo1joipHbw1MNvZT+6/4Q8sOi2dc6nshnQGAz83xnlOIeK638z5sxBLYtCQ0o78BLskSpfztzii58Wf6YCrUt4v2InVJwIcyDbmVfN+rCla/dBE575/kuWShlGhaDeLogaVIPwaq51sfhTXqVqaEC95Q9cMzECOqyLHdWCFJnYL7QJWgk0xfrESfi8QmepBzmArj4foGoiJfNoTQws6vL3LBR250jiu1mQ+kzvZSEgDH7ojFYzjnjR3YCCM13Sccz1kItKrSWGMXa9skjy1zhIbJJO5oxnRUFKl9g3PSryV144bLscfoTqo1ISf+zE/8XqiOigzs0/KDkbN52bVY9y3MmKyYDJsrl7WfhIKMv+oUcUz/qiajeowSbTdGFJn1Jcv5tg9VvUL+zKugfpOOqBEXTVI1qtth7mkA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0943744-9a3b-4288-6136-08d84b62d8a5
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 14:58:38.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjxHGOZN5/Cknp0tBY/af2/Y3JdWR/KD8CefycKi22W5T6RabS/ON7f1CHVU7Sha7MPAocmBw8XyzZpro9w5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2293
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Chiras <robert.chiras@nxp.com>

The flag MIPI_DSI_CLOCK_NON_CONTINUOUS was wrong used in the DSI driver,
so it was added to this panel, but not necessary.
So, remove this flag since it is not needed.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 23b6208..572547d 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -552,8 +552,7 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
 	panel->dsi = dsi;
 
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
-			   MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO;
 
 	ret = of_property_read_u32(np, "video-mode", &video_mode);
 	if (!ret) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
