Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE3353065
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 22:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9D66E02E;
	Fri,  2 Apr 2021 20:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-oln040092004026.outbound.protection.outlook.com [40.92.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECFC6E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 20:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMBuK0k2/oE+HG5lIAjP8MUOP1j7Oq+Nup9k8vwJsSOGX+VBCdiKbo80P6AbLpwnxP96PGZKWQwQRcFZtsBa9cCRm4zFjc56uZH/+sdg6LbO2AUBeHgakXb4ZxcS/kWYgoSP2LUoclXmdGpxX+IWcElcsPoxUGEykgVRA83p5hjUq+rU2FfZjP6AEl4v1IiwJLlJFdQm95kvSyeSSOtDgMK6JFJ6T1PnxyYsDBcPQydTS+eJWR4J1ipJBQ1d14AI/rjXz9F45IwT0YHeTf2sJathU+9A//wvAM2iNHX7vzu44uZecaHijF3l4clv8WHBhuH7IBpwBaDxCiYoyveByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5nBNd3schQmRkdVrTibEgBAhHZn3ONbFAlsSax6fDc=;
 b=EBboxH7B5GIF19Vb4qscmxwfFmwFZxQNL/dggTW09TbUiaZy1SnFDwuO6UVMHRp41JPfDY8hlHlfrSA+gUvq5LErJASdh3PBq+EbLCIbx8ui8T0zhz0nv2KzilDlRVkE/UgPRNBihdvSkWgVTKiyPL1TPzs5+Mu/qkMhuEyTRMmK9OsP0vGa6w6K6nmkWqHDw3k2Wc7C334k0zIX/PeOn/LvEY9p2tIrDFPoVA8RZJCcVTsu4I8dR82n/NnET1u4wbVVWlIgdUInvrb7MPQ4f2j4PeTBCB/hJ6uSho3Cl4kufdMW8TUo1NvGcUi4vA95sHayfEXSYr8eUim9g7j/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5nBNd3schQmRkdVrTibEgBAhHZn3ONbFAlsSax6fDc=;
 b=XCNAoy4/20HjU3Fai/AuRFFZUqyIfMxgCvKyDbXUfP1I8P5Mffuutmoglc8si0LY3D8+nPujCQuLUYy5F3riGhIM4Vucsb3u0Eo3LtVKl3H1/nbrAe9h5czwJ/q9tcjQQErhn9p2Jo6q7iPlsw1S4euYb66YwalYuzmn1+FJN23SCVjliYkTRKhlMa8zcrZc9jJXlNMIxQHULXjrHiOrrGA55q4IjFQPm6JNdFmTw8Vfiv6JRkMiC7BaoKGM/DgEW9z8e8QtFymAZoHoppJ7csnyE2Ut2GowCoUyXhVaHK67QF+BmHGoapHgMcC4RggAUjacLKVDzpe8ZdJXtL/sYQ==
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (10.152.74.53) by CY1NAM02HT204.eop-nam02.prod.protection.outlook.com
 (10.152.74.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 20:49:02 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e45::40) by CY1NAM02FT020.mail.protection.outlook.com
 (2a01:111:e400:7e45::447) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Fri, 2 Apr 2021 20:49:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C132EAC26613CE7886395F93CEAF35CB944898C706BBFD9D5F63F81039279864;
 UpperCasedChecksum:B004829F87F8F7BFB58995F6EDABE1A4BD757B7584C378056483ABC613D025EF;
 SizeAsReceived:7397; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 20:49:02 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: add rotation support for Elida KD35T133 panels
Date: Fri,  2 Apr 2021 15:48:47 -0500
Message-ID: <SN6PR06MB534253E1CFDEA6917230F57BA57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [axftsuFgielMLV3Llf8lmo5tSLFhLf3P]
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210402204847.7574-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Fri, 2 Apr 2021 20:49:01 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7e90fe2a-fd46-4818-9ff5-08d8f618bf4c
X-MS-Exchange-SLBlob-MailProps: zswcL9HXbeVlDLV/zsHYmi+MJQR7rtsP0P0rhSxWxDb0V13G81HTHqN4kttWK91TYYDSpAj7NTuioiwV49CVaT0+kTaU3g3ywuyt7iCa5J+fHNIouKkz8t/NQFwK2icyuWNHGypLOxOt1Yq+gzJ7n5vqz46Yax4+8762YP/Jw2HxFFxhfH5tRxIFknD0JkG3zdb5v0y0BggKc4KkSNNSc2w2w3NBh9z5YrCiZ1BBGJ+C8XivmDF53iXJ4B8wSvGRPkwBqa6In40nIzFKjj4wEldsEMJ1nDztwhlxHgL9j7+YDV9hTF0TTC2HPuin8dZzlEftk/OQGrqme0Wh8KOkCpBk3uYehyBqAxVDYYbBZZhPNbo43Zu06RoxZQxXE5K0MdTP6A9T7T1IkQ7EG0h0eZA94fEppb5184NQ5KALUywDxwvNqz6vGQp5fI1ITl3nLvjZEftCizTdMofyycwsOzqYSpS7G0jeAtSSJAfIDJu7uR4Se5UNuSpX+uYczFnJtOxrtwP2Smg6M3V8GipgzN+eEv/oZ0jXAZayh/cEn/K5A/vMMw/L8bfSfPyzqMfObTG34jkyjxJ5vS21LrKI4/FKbT/BZVTMQ8EvEelpe2xZPtNYEmb+TRNWqA4Dp/bQpoCbhC6a8DqG4TqfOV5ilhP+6K42Sm7qveHtTGgLBUkx/YnlEhfmV6QoTg//0h5ty+aa7O85QjiJ9pDgRLZNQ9F/6KONRVelAk5HjHJMDGH6xgxzo+KHncoY97Odvj1q
X-MS-TrafficTypeDiagnostic: CY1NAM02HT204:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwOiKSq1h9XODOk2IBMris1DTmRTeX1uA4kwHArlAQgRwVs8rhEZcv8CKlgaZROZMjifC3kor7NI+hMi35SeHA1ktyuxi34pcTMLPHAkONM1okCe42o4aiTqTlPZpVEAALO+SlIbfrG57r8fw4R++p/AmU4xE+sKqfqX2cRX81ymGIY82LrMfNwZk6vm06MGC6VOgL0eCLkek13S6mz3M0qbvJ+tWWOiGRYxHTYu9aMKBIcGF9xyogyaM6eb4M004a/9i/ml0Qg8r2bBSDb04wcAqe7x5LDrPCsfq0/ybI4glF2lCwKtFCgmjKU1RR/Ark++wn3eV+bjfoanSiyqH1I2vd4zR6Y8WiwfQ5zDdIktOPj+nzupbZZWXdTbPID6cyaZf8VQ/L2OWhQVnxOyAA==
X-MS-Exchange-AntiSpam-MessageData: 7JXHOLy33QRAw4B2QJ9G0FBosE4A+zZl1kgX+uuo2ZuXfQDhWQbJFD/CxrI/AQwY0GJo5vY/8+HFU4BQ28wpCrmPX/YGLs4Df3MV3GDLoYFieIr5tCUWTT1Hseb+ndDDYciVDrqm+fBhcJ7Pwg+VhQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e90fe2a-fd46-4818-9ff5-08d8f618bf4c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 20:49:02.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT204
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the panel to allow setting the rotation value in device tree.
Tested on an Odroid Go Advance, where the panel is by default rotated 270
degrees.

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
