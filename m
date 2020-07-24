Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8D22C1B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0CA6E4D7;
	Fri, 24 Jul 2020 09:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F66E4D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvYjw86CUXeUXEsjvqZXwTT+aSO5kwPP5Cc4+4AXkGHeyrzoDSjNmkon5U8+HIyukGq1SDaSOq/+X8U6+HeuNj0bAUEp7cNAAHH6KKO/PgtXsg6yqZ+tcSA4ywPKQy489FBT9+kyu5l59Ch4vUSaYub23PLpGLMu4VG0jyIR5f24/tqtFMl/HWKRkF1ErRXqrXlVudGWl2LgLBeT+tpiZNnJhsdXqDFbD8LrAzCb5W2uYAlIVTtC8LRDYC0OXiVtUsn6Ma/pZXqZ5CnQISw3L6VpfvruELeP4eBQpMNa+S9rSiXirj4wqWcgQlYFNgxVj275qiLWUi4390lt3Pb2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OICAasYKs6tuuQnCuX5vQQGpShDzk9ot04EXMf2CSc4=;
 b=Dlp+F0I9R2lEYlD0kG+aczA3Ki8fUabp4m/lB7JfFVZIFeSR+oC1OrQN0jyt5QVeRKxgsE+BVuUpX79swR0xxAK7Vc5DScEiLtXl/83ezNFIuwsehubJnmZOzTMypede16UXLkdm55K7HEPTBKoC6U7vTQvm51yzLZ75AOrx8z5vO5/VH/YEnyzEDdm8QT7hSz81J2G9qFwE5sZ0hjyUghck3rc1bDiQrLMqsz5sDAU8kLPTBFdc1E5yAq26i8/NlorA9Sos2xXvKgG8MaSHfDuMuJPHBs2yu3mEv4CcUqytxmSh63PUwpQvMDiJDskLYnl2IIyluEZ0iuagSznpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OICAasYKs6tuuQnCuX5vQQGpShDzk9ot04EXMf2CSc4=;
 b=FEwmdEMCxb9LPypedCEVdvlTDTU6HjLWUzdUvL/9klfkJAp22Cs7xvN9li/6v7pbymFcUpzDPTyxmgGZ+7LcTcqX9Ixv0Aeo8PBnPbkvRyO09miA8goiWUcg07ehrKbX1+PFOX1qt1RR7EuJ+4yPR2B0oKN53GI10dr7PnSCpwk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6960.eurprd04.prod.outlook.com
 (2603:10a6:803:12d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Fri, 24 Jul
 2020 09:08:28 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.028; Fri, 24 Jul 2020
 09:08:28 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/5] MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
Date: Fri, 24 Jul 2020 12:07:33 +0300
Message-Id: <20200724090736.12228-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 09:08:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e9c7898-dba0-4298-65c0-08d82fb12122
X-MS-TrafficTypeDiagnostic: VI1PR04MB6960:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB69602C85C77BB64BEA91C70CBE770@VI1PR04MB6960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /LjH9qcz2AzsQBbKDxpFfa0kDCT1m93hEWycHzmiOZNdP6ZRoLqvPKz+uEgle93tl0N2zEQ/i9udj0Xe8ma0CjR3l5+ke/2AgnkF8UTMlX8j+LAAITDZ/Uow6pkKnv+noPT02ZfgzWeZ6K+VIxjLKjLkTe4+g92vfL5x0GP8yGuHzlCg0fw2YVyfu9BtOcKZ5srgPKTcDwrZvi9/3yLRUFvu9nIYVKZAmSsvGmGzZXyc+FxI9aLxCHHC7E+Y5Mru+4S236qLkBDSiUEYaisk7WqLhDARb39U+BeyUAd9NYa3WcgLvXdbxlddj5RYzBVy7+kHhtDEfr/PpnuUjw7jPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(26005)(5660300002)(186003)(86362001)(6506007)(478600001)(1076003)(16526019)(52116002)(2616005)(4744005)(66556008)(66946007)(66476007)(6512007)(6666004)(956004)(8676002)(6916009)(2906002)(6486002)(4326008)(44832011)(8936002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: HtZABXTCwD32MSO6/P78VkqA84hTUiNLaM2y6o7bUZLIGcGJOF8vJ7lm2HeUa9va1D2YZsZIwy3C0yiqDkZWC/jLOIgp3aVKA7pkK4z1w30WrQPxDH22feMJEEebGzWfWVdfM5XwYTNjM+LdGjOysJ1nwT53+9WYjKLKoDNkHVgyPqhEZdIGIL2Vs68HFuRh7P22nNJrTMIfjNkM6Jc7TB9ya2hpIfaNMVUp+M2wLvuoq/zNBV5d9KPwFkPq7PeLNql65kfg0uKzDSy04a+V82wuh7YB4SyT4K3E0lr0USuB5sAtsslF8YHfnKbJlUI7lgnFUqK6HgEeyhmi+V0Q1FXA6Dn13Y8+alf7kfNgfXzIccol2+d5s01aWPiSUQMYJtJR0/Ba4BfANQaNwcPl2fcG1nG1OripJTXXNzk80dChQYKQ/kuVSyGFz+oqk2y0pSOSKw3Kh1lsqWCOFqSwFKAVJN4qiH9Q+xWXzLY0kQ0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9c7898-dba0-4298-65c0-08d82fb12122
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 09:08:28.6783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I03LIjvgfOaYnoF/Kse7DLPN7nWlHL/K2M59vvnaLbyep9TqJr/UXvcI25tI20qsTocbKc405FCqa2pYiV60rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

The driver is part of DRM subsystem and is located in drivers/gpu/drm/imx/dcss.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dad5a62d21a7..200c5985b41f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12276,6 +12276,14 @@ F:	drivers/iio/gyro/fxas21002c_core.c
 F:	drivers/iio/gyro/fxas21002c_i2c.c
 F:	drivers/iio/gyro/fxas21002c_spi.c
 
+NXP i.MX 8MQ DCSS DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Lucas Stach <l.stach@pengutronix.de>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
+F:	drivers/gpu/drm/imx/dcss/
+
 NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
