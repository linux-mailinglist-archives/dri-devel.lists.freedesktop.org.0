Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4634A03F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 04:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBAE6E138;
	Fri, 26 Mar 2021 03:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2475E6E138
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 03:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i73UFCtCLpOhsUKmD0L4qBvauYYHD3zwnlLwmHZ+FbFKxjc1bFudBMorIZHmkNjRfD6ePvH/EyzzeF6Tr1H1WUzpIhA9QSC6Fb6DFtt9ez5YLmp7y5BFwf3YtvkmgDtN533ncqMmcMRnZ/5MlMIeQD8lfkokXiWWcVaqhLjm/dQ55pwqGCvm4rzy1n76Dt+HLtuy1vXoJZuVKPtRkexcDhzQvstUqAIaHTSFgXX8xRus0Y6sMw9RwT4X2LX/lOqyY3YKYUDFpiQeLhlK4nDbOxqbcqQUICy5ema9Rj0trGBCk5ZaMpKK9xs3DxNPGrnHlcKCbICzDJskTc8u/KJvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgLwNjEkmfckzBOH1yQKokZijhRjy4YJwh92zA2ihGE=;
 b=Jnw7fho1WRHsVlAuwEyGqNWxPmkhwaOU46tUtuWKanM0LFdbTls+Svp5qecUENjmXNAcwfhYxPCsqkYCTSy/41NHCdvT0HgoTqEiRAa2dbyfHUoj1iJHCZHUF2zi+s7uYQxwAlP69tB+QsnXKbMDHr0raWxdt3ajYm2e4x0qazFVkrG8PP+B9T4x+pQcXOK9RQt3cnj3t0ZJQSpoZ6ES2L8vzR87N5f5wzXRztkVvDvhIEGntB+KwPpaECVniQXoK3hHBS/ZNmsHCrf+xLMD9ZwWrH8brUVjky/8oYvyPCAZNWF+Qa25K4UDw0vGLcZPmPfaY58OCpBoob4vyR/lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgLwNjEkmfckzBOH1yQKokZijhRjy4YJwh92zA2ihGE=;
 b=G5crm0cAubEt+3AAMyEekNffK8S4NMd1ot8Q2uZTVPr6PHUhGH41t5rO8a1t/Eo/KnG3xEIwQkiuBM7EEfLeqGCSvKETLTT9B68o7EOv7uERrs2m8KC8KM7E6txp/LsL1EFuNcMoKg40lSQIlPe8+6swzg3V1ODga6lp0NMglV0=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (10.171.182.16) by
 VI1PR04MB5037.eurprd04.prod.outlook.com (20.177.49.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 26 Mar 2021 03:29:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 03:29:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/imx: ipuv3-plane: Remove two unnecessary export symbols
Date: Fri, 26 Mar 2021 11:15:09 +0800
Message-Id: <1616728509-338-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0185.apcprd02.prod.outlook.com
 (2603:1096:201:21::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0185.apcprd02.prod.outlook.com (2603:1096:201:21::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 03:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fdda86ff-94c5-4673-8e2d-08d8f007509a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5037A33E908903594BA2ADCE98619@VI1PR04MB5037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/DFqdQdnEERiZvtvRjADPIcEqJnZfx4lDgkLhhelOfhHcCGe+zJarhHkiGx410fiP812PQPaG+MPcNod+CaaP33hQYmOQbRcWgER2JPLOeZj2p+/bp1Vv64eC6e1NZR6UxGrH+xHenwl19HrgpARRTQdmPdJV9WGYW/ono45hpKOi8L+onRe7F04ikuxdZyl99cabPotPLR65oEV3caxnffJ+DlfqKhvKa7DsaVWatlYcsSWZLm+CrhmUp6QHUc/vrUA8/25bmzh94dpYgKLvZ9UuBe0d9dpaHQD1Bh8b2Rr4SgSa3ByqtG5ak29fcp4L6UJSpJ/gyMw2fzmAvK08a68my/tlhUv+ytR/Ua63oMwMdh9upLI67gMOeUCAHO8pP8BlrLTF2d7jFsJ8DnDU10rRdZMRbw14C8CPNBPnPGkfsl0xXOQlk0/GGjOCzPxvp2ZShu3CZNqmceLpgxA3Ea6AOWSI3jegRCotpIcMaf1bJorXQshkUCVXAbaenjhUvqkvY2AL2zVHSp/Wb+ppQmbjxT1jlB0PsTQqk+FtS2TuMWRgsbmWoJNxGdxfoucg6y/UPo27fr67U+1URBJTUiIZ0NF3t/69GBH2HBjzTq3Zt16X7oDVDInvRPhOXFW4NNS8lZ1Om1kpM408dtu2dCFZaHanlss8bPwv42/g+PQW6Xyco+VJUqcL0eAbdJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(66556008)(316002)(66946007)(4326008)(2616005)(6512007)(66476007)(5660300002)(83380400001)(8936002)(36756003)(26005)(86362001)(52116002)(16526019)(186003)(6506007)(2906002)(7416002)(8676002)(478600001)(6486002)(38100700001)(956004)(69590400012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xLzTcBN8mPz5RA1ZAEbhf6QZttV3H7bPq4xz+nWGwp5PSPHq/xuJEFQEtODc?=
 =?us-ascii?Q?UlCHtcKcF5IDkufWx3jAMUA+fuqDZSfQvw+EipTYX0mXAbHpEykgdEKlb2Si?=
 =?us-ascii?Q?0fB295/j1hoRF+kD2z/dj67gOzUeONGezkLKlezhmFuE5wJ+prcbd2A/FerD?=
 =?us-ascii?Q?NTQKtllsGsX2S4I0NTtcQDbSDmjVIclXBXuTa0LHJuWcY0OcovgxDLSpAlIN?=
 =?us-ascii?Q?WlmlRqJdcLDVT3wXG59XOoZ5DJFeiyXuIafGWa+ICuEvLpxt0bUqiP43dyGq?=
 =?us-ascii?Q?UrxCN1IDnw6Xdu148+2vw2z1U3rWMnR7pPGmgnwqCoOng4p/lC78jlFaUkpH?=
 =?us-ascii?Q?wU3cSd5JN5vMqLPZ18kCHBbEd9xn8VhAqub08mmZoSgBjXMC3YdGRwZpUDga?=
 =?us-ascii?Q?qjnX7MHkrUSqzFgX9bf5fLiQ+eQQ929WkFUhUE316LD/fyFPZQgCUPQFwxef?=
 =?us-ascii?Q?7PWEhE4Zf5wq4PXIZnNMCpgrPBRJbpCa6c4OTKRynOdCsISIz0DZh/H8Ylfl?=
 =?us-ascii?Q?GFjajp3kptMy0afUyyazsTYW+0DgawtozTo6+6/08MtaSpv3DTIT/OkBNEe1?=
 =?us-ascii?Q?lvYGvSJCP98nlT8b4fvO4FPudLpGKtlJHroYU78ZMU3wsw9aoe34u6Z8BrXW?=
 =?us-ascii?Q?+dk6G1+AvfZdNqbxn5T5V96ob8Umh+Ve1+gZVm0x5ki689CFh/tEdK5QhgMG?=
 =?us-ascii?Q?30tj/Grfy9p/qjPp6ET4XqMG+ytweT4MJez9GGF8GFkQwpnm3jXV1qzy4szj?=
 =?us-ascii?Q?fmc0xFWQpbjYf8rP4HN0UsuvsJUGuE7F04b506BKnSAz0aaaN9V/YZ7pqHSz?=
 =?us-ascii?Q?XR6q7M5MJWvVfkcVdKQD+IC3QOBN07frYLdEeka8NCAhLeVZa+G5qnPdfdJe?=
 =?us-ascii?Q?cJIn5CQgaobjtgFVberdmjwlKVhhiUIKbP5TXTszr5dtl9ReoOkoyTFmieqx?=
 =?us-ascii?Q?49kvDCRBBUUu3IpKq+/WE6x+NyxcwFHhnVmOV1OvcRvFivHfGwNPKW+Eu2AB?=
 =?us-ascii?Q?7lOZOtlcpPcEnE7EZHETwL9k4cE7m+YsZKt5OYFcd1uTcobvKoFc1RBq3MAZ?=
 =?us-ascii?Q?B3hUXv23jul0ivAemCskVIXXE96EDOfjpDkacr7KzmqlLQlLlyQ5aEzYJcj7?=
 =?us-ascii?Q?xpiBDYxypXRKX9WcUIK1ABS8TCT1WcARZiIcsJ/M6K+62DO7Y/M3zKsTLrjp?=
 =?us-ascii?Q?GC/I/XZhmFkrv5Zo5PGfU+Qn1fo1aemYbvA0iwOBNRNBQPPYnDQfMyZ3ocD9?=
 =?us-ascii?Q?qQmbH37ZCK6NhP3ExyGL2rgH6QpWu81DcXn2CYaksjWIg+q7Jmo45Rc709pn?=
 =?us-ascii?Q?pBbjMtzZmsK6ccLtU9CXgaeu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdda86ff-94c5-4673-8e2d-08d8f007509a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 03:29:08.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hth3bt8fOW+Oz6p++AQtkS/iN6Xm36sZNcLDcmCul8tOx7akBT2c3oxaS4fX9zDLjofxekCqekrJnajZ9BpqRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5037
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
Cc: airlied@linux.ie, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ipu_plane_disable_deferred() and ipu_planes_assign_pre() functions have
not been used by any other modules but only imxdrm itself internally since
imxdrm and imx-ipuv3-crtc were merged in one module. So, this patch removes
export symbols for the two functions.

Fixes: 3d1df96ad468 (drm/imx: merge imx-drm-core and ipuv3-crtc in one module)
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Fix commit message typo - s/ipu_plane_assign_pre/ipu_planes_assign_pre/

 drivers/gpu/drm/imx/ipuv3-plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index fa50097..35681f9 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -264,7 +264,6 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 		ipu_plane_disable(ipu_plane, false);
 	}
 }
-EXPORT_SYMBOL_GPL(ipu_plane_disable_deferred);
 
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
@@ -821,7 +820,6 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(ipu_planes_assign_pre);
 
 struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 int dma, int dp, unsigned int possible_crtcs,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
