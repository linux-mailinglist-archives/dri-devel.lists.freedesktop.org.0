Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3FA31A214
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 16:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430716ECA1;
	Fri, 12 Feb 2021 15:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009075.outbound.protection.outlook.com [40.92.9.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE286EE49
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 15:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJscBc93y8b8MzOlTT7FgZRnKKpWYqHIcHNzYowr77443F4EguNGgUE0/uFUxD9DFreScodAxjxW1nVx51LHSEJ0gWLcw72IY9xfO4Y2PcD/5k+ezpqZk7G83uj3s0yZkxL5DYGgSwf2vie4Ed5mCwGNjc/PrmLXP5If8HTi+JWeGVAHYMks1IMhwMP41fArXz0iMlXPZtKi8bf8NxvpJkXcCx04F7vQEqOWYfWzDYrcyh+gDO6hn721FzaqQ13I+YAdmTW++NeFLtNfzIMG2o9oqSGggs9Sf1dTJBrEPxpImbmciO7A8RbV2FLPJAlE82ZNKWSBEeLQxSlZhs3SRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kys6Uk2uqkbHTHlrD4zpjvyFJN7aZqCUx7upAQmacE=;
 b=dBaT6pQJEMAJk5YGUqdeABi9ZV6Ux4VuWAWP6CRsy48OZy+cRyk9uAUvDKjKvaeOi0Y2M2VVsjyPyPvE1AQEzSboembtLk5PAxoVBPJnlgjEmW2cBOWF6z6dUTSJtkN276rbbB6Z4iTph8q3/Xs7gi18jEHaxx+NbI/resi3kCa1K0NfUNEd8F9jpDp4OTrogAkC1qTeSCXgB+9qu1qEoQfetGBFE963/XjMcdkSOoOXg3ILIxfYLQyrEgUZRdjgeL4VJ4tvUZHjizofpS+lfu8lIH6D7WGiKxqcQrrrxrp/oX9Tr6F3KZUY+qExYKB5GZ7zYSrh6m0AoD+ym/Fkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kys6Uk2uqkbHTHlrD4zpjvyFJN7aZqCUx7upAQmacE=;
 b=cDHtcTFipfzX/dhlXPqKJPpGX8P6qaPGrlFKMOP4vn6oH3ADGjn6HuHsquGmKX/cSsGLVmmm9Ulu7XnHDXOWZOh6OQQTpx4JkF5t+u73sX/NP5ezZshROELqQWMcqUP+OYyQE8Pr4ehf5djIL5uIkYEME1dZA9+sc0LRvBKgeij6pNxPIOVej13Bv9IDl3EqSuhypO9g9jozE15JXemP7OxlTIyvIAQiTaK/UJ+Zjw/Ce4ZPWkNeilkMXQ/0eM7szMlJ8QazpskSgCdC0QSqO12kqGFtn1SRlrGf6V0ouTE/Tj1BnFJ/9o5LR0qAqVL9P8wui7MFmzehuAqCJaAlmA==
Received: from BN8NAM04FT017.eop-NAM04.prod.protection.outlook.com
 (2a01:111:e400:7e85::48) by
 BN8NAM04HT155.eop-NAM04.prod.protection.outlook.com (2a01:111:e400:7e85::254)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 12 Feb
 2021 15:51:04 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e85::4c) by BN8NAM04FT017.mail.protection.outlook.com
 (2a01:111:e400:7e85::392) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 15:51:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AF105C424B1D7FE063FD1ABDBCCB5A2C3B7A87361BE18BBB7CC40E2D5AFFC983;
 UpperCasedChecksum:22ABA0CD929333337B37E8278F45053005FC9BC5E9BB1D96AD69D5B47EB03ED4;
 SizeAsReceived:7432; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a%3]) with mapi id 15.20.3846.027; Fri, 12 Feb 2021
 15:51:04 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, HHheiko@sntech.de
Subject: [PATCH 1/2] drm/panel: add rotation support for Elida KD35T133 panels
Date: Fri, 12 Feb 2021 09:50:21 -0600
Message-ID: <SN6PR06MB53424F1D31DCA0F038842EB7A58B9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [kZS4so4vifTOvDKlM/MCM1xP6q90RrcS]
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210212155021.10043-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.140.3) by
 SA9PR13CA0012.namprd13.prod.outlook.com (2603:10b6:806:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.15 via Frontend Transport; Fri, 12 Feb 2021 15:51:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 522d2a8c-91be-4504-878b-08d8cf6e00cd
X-MS-Exchange-SLBlob-MailProps: CaK+F7me6CmH3riu7F4l46QSPcUarSK0L1NWB3/sVSF2uViM91aJdjiQoTWcSOd1Tvgy5mNErPP7edP28kM/8TuYvxTp/CAj6sktcdMcFLzI3/40nhgfQBB7TQHaz0ICnBc7pOnsTBPbzYifB6DKMC4WyCBHnDFu7RB11eU2+k9imlupQiY2kdvrpEBMs2CDpk1t1mhM0DU5vTUeMQ08a7NwgNfx+7hoB5/SQS6u8Fpk0mDfRCdeBwMyxGGQjYEVETLXwTPkiuCrukx5kUkShxCuJ4vvczaYQwl9jztYGPae/4XG7VhnG5Cr6TL70DCJnURJ0/FTy69+RMKflZsAN4f1Q1U/M/uadTYOrdBUjQ035QTGEKMSQmPy6n4mQx0rBOKbgB8wrYQANmeYr5PDfAVuHXO5qSvdDGnYVMV5ufH/aB5hJgFcyk3L0NqGr7BuznjDYvCs8c1XUTEaZSQjuYv7W/M27n1MMykhtygo1gP19QiSCdKrKsU4EXZZJsRVipkD+uvbSNSEx3VQwLG6blYh9afCVya7xqoT5QTwCN4aMToBPA0BaaNjFdVjERJ+PwL7yJAtoDJmcXZa8nQkX6Haw+m9jMC4lk4vEY0qETNXvxRepqXduttYYywXZ2/fUqA1oPn7ANNmtMbz6cKzD/IN7bRuhSt8z/0hyj6SnShZ2G2Ub9LPtCf4vjxqkaBK4nicyWcDB61HSAvLa5Iuub50YrVR8thL6Im6gLZ/T71pU+fdrSwtSA==
X-MS-TrafficTypeDiagnostic: BN8NAM04HT155:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLjPwPAwedZuzhENghQY3elL1UszQxZhcQPWjSfkUc2/Xoi96Hyp3xC0F62lDLVJGJ7rcduRFhHpQEjR1+BM1WvTtHGetA/1LfUbv5Lt0CTYEpJPYwMBHWBYQ6dMwWN3X1vVWkbrtZmB7T+Uv80vA+VDvTLcLMzve/KwrDMR7UPDeuRjSsIoLaKAobhk3QE0GKqR8WiEwjtg7JpDKRvang5/SI5XeFj39teaIzsUC0pFcK7KP9z9A25BwL2UoJmp1RDYDi0tXKSub3kQt6hv4xzSgiQkGTON9IwXfbX50V3DKc2U2Th9iuNMjkwikpcvQurBuZ04RKsWpiY7j6apqIMUwhC45PDOTAsXMJtVmnlHwrfEhn4Exn6VXdRF/EeZ+3zDwlBcKqv50vTJ9g7djw==
X-MS-Exchange-AntiSpam-MessageData: VVlVQN16ZYeE/EZKY+0Zew5Kyt5GgTWAxYAsEveqGrsJMuOMFH/z4QbkGo/1LyTFVnFDoe3spVuvXiolbvxoFA5/qt77kas6gOGRsKVlXYl5fAzmNy2KTxRzLRj6SAOnxk0usnA/kfmFCN9d0BZPOA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522d2a8c-91be-4504-878b-08d8cf6e00cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 15:51:04.3814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT017.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM04HT155
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
Cc: Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the panel to allow setting the rotation value in device tree.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index bc36aa3c1123..d8534406d1ef 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -42,6 +42,7 @@ struct kd35t133 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vdd;
 	struct regulator *iovcc;
+	enum drm_panel_orientation orientation;
 	bool prepared;
 };
 
@@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
@@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
