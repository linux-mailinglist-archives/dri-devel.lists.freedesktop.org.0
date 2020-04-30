Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F21BF2DE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 10:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285B6EB7F;
	Thu, 30 Apr 2020 08:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03F26EB7F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OkGRD46eBrpLVp2a/QTIiZIi2QJepQq1vEAoj3+xvU=;
 b=QZ+CBZmTHvMOUW2EdjpjI5dKGvcpsCjbaP9Wtsmn7i+nt3xKPbNM7IXF1/m3rWw7BTfG24bLScjpG8+F64jdUkLY3QJuFftk1EeNyPML3RlxF+lWbinHUBtYgXz3/etvyoC2YiaX5oeRMMPHo6e+PxPwIYeTITW2GDUYsJ4DNHM=
Received: from DB7PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:10:36::42)
 by AM0PR08MB3604.eurprd08.prod.outlook.com (2603:10a6:208:e3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 08:32:46 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::7) by DB7PR05CA0029.outlook.office365.com
 (2603:10a6:10:36::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 08:32:45 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 08:32:45 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54");
 Thu, 30 Apr 2020 08:32:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c827e1fa9aa35cb0
X-CR-MTA-TID: 64aa7808
Received: from d28b908c9a64.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CEE792F-5DAD-477C-8F88-7EBE4E7F470B.1; 
 Thu, 30 Apr 2020 08:32:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d28b908c9a64.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Apr 2020 08:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XulHsSMmSwgmDFAJ/K/7O7DGpcZ//GRUlnkEDXByE+BMIKjdTo7+iq8rCdCRrzMJezc4j0yysHH4dtmGbx5rkRitvZirgw9mPkMgy8NcZqMnAclPmxHXbuYLZ4h3lhBgMqxEa1/q4eiZwz4+dUPs798lXPf0L8R0v5f86niKPRM1GnFFL7Ws817WxUGvKSrCHNUiWwnDE96ktRQrT0ARpl9vIyhGpNuCOwNDy7kJniNAZ1j6XXOHt9nbcXsPfT0icjIFSweGN6IfhEsvoriDnPVJI1SbInypyi8arcPhfEvgsfygqnzkaACRfagN8jJDeY9Q9ZNzVWrsMEvdQ/OZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OkGRD46eBrpLVp2a/QTIiZIi2QJepQq1vEAoj3+xvU=;
 b=UhzXM2tqIorjDlR+z6i3u9eEYmn0chE4sYyGND8MKvRJgg1XNf/4uYEtK53uRlqteH7wlliTqHwvaf64ifxjXEXEwJa4LrzFg1r0oPmuAmdfcTzjprWCQUY5eUt17y8t9AAvpH38GpOqNk3SBxRNXVc/x0zxoLnBDg6ms+e91RnXTG7pnMpIhbQGZeOC9+y3toVLoRrw/fx5LQzn9Q/q0MiB+qQvDKDRV1HP57aSHbRtTaOYVEUpM9Rv2TidKJsX3YWAUR392r/zrSx+qc5U4w8qJ5xNey5t+vdKviCEjSzmlMdgutk9GGclV2HSHTdaqx545HwpSNWXlECXQMkIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OkGRD46eBrpLVp2a/QTIiZIi2QJepQq1vEAoj3+xvU=;
 b=QZ+CBZmTHvMOUW2EdjpjI5dKGvcpsCjbaP9Wtsmn7i+nt3xKPbNM7IXF1/m3rWw7BTfG24bLScjpG8+F64jdUkLY3QJuFftk1EeNyPML3RlxF+lWbinHUBtYgXz3/etvyoC2YiaX5oeRMMPHo6e+PxPwIYeTITW2GDUYsJ4DNHM=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com (2603:10a6:3:81::22)
 by HE1PR0801MB1898.eurprd08.prod.outlook.com (2603:10a6:3:49::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 08:32:38 +0000
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d]) by HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d%5]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 08:32:38 +0000
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: drm_fourcc: Add uncompressed AFBC modifier
Date: Thu, 30 Apr 2020 09:32:20 +0100
Message-Id: <20200430083220.17347-1-ben.davis@arm.com>
X-Mailer: git-send-email 2.24.0
X-ClientProxiedBy: LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::16) To HE1PR0801MB1676.eurprd08.prod.outlook.com
 (2603:10a6:3:81::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e113060-lin.cambridge.arm.com (217.140.106.55) by
 LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2937.13 via Frontend Transport; Thu, 30 Apr 2020 08:32:37 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d24c545-b36c-4b07-ac4c-08d7ece10f01
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1898:|HE1PR0801MB1898:|AM0PR08MB3604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB36045C3497B9962DAF1268E3E5AA0@AM0PR08MB3604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR0801MB1676.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(66476007)(66556008)(26005)(4326008)(16526019)(2616005)(956004)(5660300002)(66946007)(8676002)(8936002)(44832011)(186003)(2906002)(36756003)(6486002)(1076003)(86362001)(6666004)(6916009)(316002)(478600001)(52116002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pYhkIgQwisKqzA4XhXyAYhknIl9mwfeIvATALj2b+SCSAZHeABPA50N1kvKoEQp0cPuAi+IW8SXys85k+dFVMTA98pfHuujtiN/KvgG6gDO6lYQ/16/ZOF0EuQRLkPkimZBc6e3/8I+uVo4hrDiL7iTIBXOAwq3DhW7TUUWpoG9vfGbtP/78v///5VTKU7QtKI9XHckt/SeUz3wAMpy6O1eCSF3j1VpNpeN7UXDYf3TWI4s/n5t6y1MqtXMmQ2X/0NugVsX9uqoGxAY6Puj5OgAFbDUxeWuUkEU/xUsLusWgPBGsUM00nMciu5o5ddrOnisTnS/DVRa6G3y5pFaAmHZ332n/CVbG+CN4C9QnDvObA2OWoVJakKxpa7itEPLSxrvpCvoxx9MWslmoEYy6Ze1/dpsj7LA1Lg5AVhsPiidQy4aLGVK87Rnd33OrrdsD
X-MS-Exchange-AntiSpam-MessageData: /UyPe788cNrcpBdXEJi9BAJL2Am5nwj3Q9oTgYvV58+oGk8kvWVqZLmGzrtcBrrDbISXk/br2rGtHTpiStZ8xvOhynWDmSZpKiOXKmp8tDYpVGTDc6c944lUOs1HGFu0+8vDkNaxTQuprCY5tLnawUbg0AGCLTPffTizhoL4zbFLI9KPcuccBrYokLdYi0PEQeA5JcmsjBggbnaJT5BfjCPEnmv431skk25aMvEeMhhbZcj/JmXMvWPCxC8SYKQOlU3afL8ckNayjB+W9qfRr968As2lycaGZPT3UKy0zFBQ/j2i/aHWx3vwgc0/nedtMXHIc4grhea5rpBePCZ8Se9Df35+jM+JbMPFucb0YxrsvhtrlF1SCqqkwTe4WpMH2fsK+helQA7B52Us8c+UUiAA+aiGrvqniAZvyXK9QrTW3Gb4xIRVmeKV8y+AkfwDJDTpRLF8jZFDDEpHAnvT4dJbHEDPNQ6hDA2dzZk7jdi+PkYFgerybMPFOotQmNVqdSG/Y1Jd7CoNabonIvsrNdcC7o1JLBR8jk9DhZNAFIUwkljbp4lgBgBtBfD/E3+bB6bITvUKE508ZdQjazg/Ly2wzTwHnpl9RUUNuQTXwL7zd+LJWt8LSgAKUsr+oP7Cv8tqPvTdKDfwZpHWDWq8BLdmnajCk7o0Vs7AqZ9G5Y2TeOfLc/qMLWOT1bLnTP46twBMLkog1s2EKbeU8D73+aFXHkQEOGRzY4A+35G3IvF2h9GYT8fjFyNCnFCg0SwyacubPiLwzCsN0ZhMy120dWIXLNKLfEAWiSSwAGEG/kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1898
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(956004)(4326008)(8936002)(70586007)(336012)(6666004)(2906002)(356005)(81166007)(70206006)(478600001)(5660300002)(316002)(44832011)(86362001)(82740400003)(6486002)(8676002)(2616005)(82310400002)(26005)(7696005)(36756003)(186003)(16526019)(1076003)(6916009)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f3d39d7-a832-4df9-4416-08d7ece10a33
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YLTkcSoWPv6rc5Y9GUpCzYo0ALwHZtYv/kJyN57ckXBF2oF8qkSirzdv/qrPNnIyR6amTX93yd6iaZXJdsWcxUbBZftcoxwalmOpF+qeHqSYqf/ex7muadr24DO6dFefja4ntkHhKaruX2dCpHphQlFu6isbF2iu1TprjD8Ix5miU6SWFSogjuO54EkpZhum3LVjJ8dPj+94fCHpNAVovYPctgRqKHiqLOdSKsq/45jGeGrtxexP/Tsbpqj3IU1hGo+MuStC1BijRbg3OOSqzGV73jCRDbdr1TXOWBztTqEEzpVZCu89Hd8yZU+O0UiwFRrlxWlKAtWxwV3h+vNstHNmoUGHq2cJk3XKyBoLHnL3B1AUMQDDjZnicFYIAWfXOjpx4gcukm59UapHeR5qX6k6IQJM+Kq6Maz8F3OhZLrJDWKK+idQYLD/pYs69ssg27gJGOg/9nU0vuG8hOHaLi/hdCOFeyN0IgJunPokIn8MsDO14lAYPjRR/qpzpdJqfYCQXP9ivxYj1/4Mu1jrw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 08:32:45.9699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d24c545-b36c-4b07-ac4c-08d7ece10f01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3604
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
Cc: tzimmermann@suse.de, airlied@linux.ie, liviu.dudau@arm.com,
 matteo.franchin@arm.com, nd@arm.com, Ben Davis <ben.davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AFBC has a mode that guarantees use of AFBC with an uncompressed
payloads, we add a new modifier to support this mode.

V2: updated modifier comment

Signed-off-by: Ben Davis <ben.davis@arm.com>
---
 include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..ec46c231af43 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -780,6 +780,18 @@ extern "C" {
  */
 #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
 
+/* AFBC uncompressed storage mode
+ *
+ * Indicates that the buffer is using AFBC uncompressed storage mode.
+ * In this mode all superblock payloads in the buffer use the uncompressed
+ * storage mode, which is usually only used for data which cannot be compressed.
+ * The buffer layout is the same as for AFBC buffers without USM set, this only
+ * affects the storage mode of the individual superblocks. Note that even a
+ * buffer without USM set may use uncompressed storage mode for some or all
+ * superblocks, USM just guarantees it for all.
+ */
+#define AFBC_FORMAT_MOD_USM	(1ULL << 12)
+
 /*
  * Arm 16x16 Block U-Interleaved modifier
  *
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
