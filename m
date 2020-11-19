Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA22B89AC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB589B30;
	Thu, 19 Nov 2020 01:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40055.outbound.protection.outlook.com [40.107.4.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446CE89B30
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb1v3h1YknWYZSTZLLWJl02q4guJhIUXO7L/qCVmEfA=;
 b=R51lWIiEtxCuMscEkoW7qAregtQfCHlRmzUw6A289AfQJySFK0juZRaUkCaESKgnSq//XuVOXGLEo2aDqFriZVojTW0Rk68JYk9Eketnu5u6KLsC7yOOQs5nv9/7eNQFKV8bQP9ETqZvZRrfJBX/MYAzj1+Yg5M0HIfaK3mcTu8=
Received: from DB6PR0301CA0085.eurprd03.prod.outlook.com (2603:10a6:6:30::32)
 by HE1PR0801MB2041.eurprd08.prod.outlook.com (2603:10a6:3:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 01:40:15 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::5d) by DB6PR0301CA0085.outlook.office365.com
 (2603:10a6:6:30::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 01:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 01:40:14 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Thu, 19 Nov 2020 01:40:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 124130c056bc3629
X-CR-MTA-TID: 64aa7808
Received: from 4aadc08982c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77EE7FF9-4147-44CD-A314-B40CE1479142.1; 
 Thu, 19 Nov 2020 01:40:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4aadc08982c8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 01:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKq8Xn/G6g9XrTz26CYybSR22g8D6IFkDrmrNDWRVYBUdLfcCMng3OMKuVy/xdTe/VNaxmSr5AGEE6owS6oSXAaPDWMc83izV6KCOY/pqA9KPbn4a+ZyyP/x1lbgxFRb1Y949Ts0jnqv0D2Qjup3knXHYj979d5Y2nlw0yIt+4BU9T/Slk44Em3/8HmkamlHn9VeNl8eUtE327oGIeGGvKAqURMYCq/N58zkak2V/coX6IPfem5YAHrYqnN79gVyzg0eB/0MiVLXPnZrRPIRm5f1RCrnEBockiEsjSgJDSLLkXZMC1k+0dhCJIOIKUVVxHMSpztSSiS7VsxJG5UwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb1v3h1YknWYZSTZLLWJl02q4guJhIUXO7L/qCVmEfA=;
 b=kzLJrknF5Qw+67WtWNM49Ca89EXbrwpJK2xZTaXMOZAvXVhU5xX4an/HDy3SF8iJZAt0wjCGYRQFo8eRGSEuiPnCd1k6AzwCR8YsLJ5RvO+BzTph+I9kzxCFxZ6facwkOwosGImZkwM7PolKQLjg6ndmmk7b56nTVn3wye4pVBeWkiEMqcJ35vrtKvzQQhvCpime0/UbqPDJe52B50WKpQEtIeAMDuLD39eTAMrGA+2iXqU/5wLHZ70yZ6fLEYBzsSCv1yUdkfiDqSgwgoysvGwWY1n071J1wfNWgspyqPpjA9KhHhkoHOW6aQVE39EeJKKA7dGQqXokpH9EG2kMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb1v3h1YknWYZSTZLLWJl02q4guJhIUXO7L/qCVmEfA=;
 b=R51lWIiEtxCuMscEkoW7qAregtQfCHlRmzUw6A289AfQJySFK0juZRaUkCaESKgnSq//XuVOXGLEo2aDqFriZVojTW0Rk68JYk9Eketnu5u6KLsC7yOOQs5nv9/7eNQFKV8bQP9ETqZvZRrfJBX/MYAzj1+Yg5M0HIfaK3mcTu8=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB2996.eurprd08.prod.outlook.com (2603:10a6:208:5b::29)
 by AM0PR08MB4274.eurprd08.prod.outlook.com (2603:10a6:208:148::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Thu, 19 Nov
 2020 01:40:04 +0000
Received: from AM0PR08MB2996.eurprd08.prod.outlook.com
 ([fe80::2d13:e5ef:a1b3:54a6]) by AM0PR08MB2996.eurprd08.prod.outlook.com
 ([fe80::2d13:e5ef:a1b3:54a6%7]) with mapi id 15.20.3541.025; Thu, 19 Nov 2020
 01:40:04 +0000
From: James Qian Wang <james.qian.wang@arm.com>
To: Liviu.Dudau@arm.com,
	daniel@ffwll.ch,
	carsten.haitzler@foss.arm.com
Subject: [PATCH] drm/komeda: Correct the sequence of hw_done() and flip_done()
Date: Thu, 19 Nov 2020 09:39:48 +0800
Message-Id: <20201119013948.2866343-1-james.qian.wang@arm.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [203.126.0.112]
X-ClientProxiedBy: SG2PR0601CA0014.apcprd06.prod.outlook.com (2603:1096:3::24)
 To AM0PR08MB2996.eurprd08.prod.outlook.com
 (2603:10a6:208:5b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jamwan02-TSP300.shanghai.arm.com (203.126.0.112) by
 SG2PR0601CA0014.apcprd06.prod.outlook.com (2603:1096:3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 01:40:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf5b636f-c813-44c0-40bc-08d88c2c1003
X-MS-TrafficTypeDiagnostic: AM0PR08MB4274:|HE1PR0801MB2041:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB2041323D7C712F01AA432E89B3E00@HE1PR0801MB2041.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:386;OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8Sksd/J1of4E+kMhLyNfmLeffshpW3R2v/JyUyASMHZ0ezpnjYA23P8CzqUX6O6fuS3y3KBFltl7UBQOlEHXbqUFBi6DHoKoxItbuud2zBEyc+JmNnavTALe5JOx7usGOmrPpFxZDYbuQGtdZ/4Se/Kg7nTxa+PSAKok5XFfQZdd+oIRNTvaqP5XH4MGYuxKhYuJZRB0ybgIq+eaobNMGiNLfPR3fheVElWjNP55H2tmnmcvqIm7bHFGSzlnfGqeRCGy99AXfrMRZToeg7FFDW82pdNWVUVU7ujMPoEwykmsYe34k3jalCCRqQSCIJpbuiTUVA7AIw73ogoLCIgLZw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB2996.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(366004)(478600001)(86362001)(26005)(6486002)(186003)(36756003)(316002)(6666004)(52116002)(7696005)(66476007)(4326008)(66946007)(66556008)(16526019)(83380400001)(2616005)(956004)(2906002)(8936002)(1076003)(103116003)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Z50nPvoNmIUoZ7ySp1cZixYKvshgi+gjZ3TWwlWrRel8FcKOKtdPFWMNMKk8v18JUp4tiBKMcNC79NLwQ8ZSrUX3TChr1cN9ShumIwcjai2extxkRvWeTrGiFTg1N5WpMP3UMmfQcyJS5aKrs4k6cjshKmtG94IYJwdBAU3ePx/PUPwd7vLMcUR5h3xh1owmRiCzc48s21fDmWJ5KDJheBO+gUnKLYlRswTzI8ZuVOWOzPrC4igH5fk3OB7AHBXr6N4y+0/zt9NAmQpeQ56hOg4GreFeL39VwpG1aJ0+0/iS/jC3/RpbJmn4IH7S7zsuyF2DtjTDzkj1s5qL1OkqX1jP3Pzqre2Orfsb3HvE1qPF/2TR3COqUThGQR4bdOeWYxpL/RFENy7JGdQ7vMTfkVmt8aHqzeXGcvkbvLyBEG8SEP/St/LBFqCKJmqd3ifAyCuDxYQ6sZVRvJlo6LxlZrtVQSWQ1QxkzklqX954iSXSzYbJRHQi/Yw+Q9Hp+f1jzmTC/4aYR62SSeVkz4TXHmiTo4BHqDtM8dtoU3O3LzZa3QmHzC8Z4VIaTLzbj2tatAmI4DFZ0EyJTdgDyxh6Hw/8mLMNKiVAkN4daMfczsCxvROX+v8aPRbcotp/M2Q06JO5as3SikjZOJXZX7iUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4274
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 83acc72c-4bf2-4c6e-70e3-08d88c2c091e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuwS8k4Lv3FNr/tympWdMkM+M6IYeSOcK6hsxVuVWl78UNW3e2g3Qh9BUhC69MerV3NnxlEL5i2WFwPDwvW6cw5vh4Jjubdbp893mEMYeDHr+zmlh5QNiyEP44A1pBSyBtoCCBGwcKnh39CMAFsqCDcALp06o6n05YIrPRwLO2WrUSeSPPMYhhzm8da8KFNKRNE6K7ZWgolOEFCuxd2I2WELpWd5psqHfdIjcDFxIvqsIGEx0BqEoO8LmMO7rh5sB9IHmzH6bcuozgm3OfKYbSCN0hHSDOOb2+wVhieqjwQzjHn62KobOThOUF/NOKmC83QZQmE/wspggQzQOT9ePNEsSJ5prfKU0OIy4Guo+U96mdy5roV8cKrtSvMpMErHipDPMAAweWy2KpkbkTRTVw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966005)(6486002)(186003)(1076003)(82740400003)(356005)(81166007)(6666004)(86362001)(83380400001)(316002)(4326008)(2906002)(36756003)(7696005)(8676002)(8936002)(103116003)(336012)(82310400003)(47076004)(26005)(16526019)(956004)(478600001)(5660300002)(2616005)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 01:40:14.7963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5b636f-c813-44c0-40bc-08d88c2c1003
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2041
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
Cc: nd@arm.com,
 "James Qian Wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>

Komeda HW has no special, program the update to HW is done first,
then flip happens. So correct the sequence to hw_done() first then
flip_done().

Reported-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: James Qian Wang <james.qian.wang@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 6b99df696384..034ee08482e0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -81,10 +81,10 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
-	drm_atomic_helper_wait_for_flip_done(dev, old_state);
-
 	drm_atomic_helper_commit_hw_done(old_state);
 
+	drm_atomic_helper_wait_for_flip_done(dev, old_state);
+
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
