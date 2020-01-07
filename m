Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61E133CDF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442676E86A;
	Wed,  8 Jan 2020 08:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCE86E079
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:38:13 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007Dai0C031061; Tue, 7 Jan 2020 08:37:53 -0500
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xarg9700u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 08:37:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3PutjIminsTL8rN5N0KsTr9pD8JymHE3p8bIwGGv/XQj7uTCh1swAkJGa/fHlDdZKPgK+LG1TbA6o3g/j7F5UjfxOvzfGNKgm0qo4Y/9XpKY7Vb0HKhZ1e7TeQurJO3IMIhOaKvWK+i2x05OhHjYM63oU9B2WQWh4PPnvpIzdI+5/+Luk4ra+QTcWzJgf/JIID4RFxRurQg0r9btK3uOeDKfahQSo4UyrCXG18kcDo6ScaVgRCaL3MpDDtD04w4wF+g9CLrTaPjF+t+ieeZoUk+d3W4Mt5AVQd+sXyPuChHag3vuy5idevQD6KEN0fVt8BQ/ifesPA2tkfUzfXAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXONAl8khotmNpxZIDY9Jtj9dWE9GvxOwxoDyUMVbHw=;
 b=VoXgZSM6oQbKJ4FWs7pdzP0Jt2riXMvItCGZyUzzWw4Aadd918MA9kOavCQFL/N4s7UChVytgte+nDJieXLk2Whuc4P9G6oayd5dP/3wgXU1mMjmvSWodamVXm2cJ14cPCCJK6OujeaT2w0xiDGUTtrRYmFmnWGZaPC4GStb5PKkzz8dD7SlYTzUWLju9mbY5bAtpnQSEESWy8aY6JeT1qsRlE4fXY+R/iS0hF+7kZjp4rtD2YvcSVZyIRf/LzkU4wnRwwM8vlnpcjTum66JWIqMgnU1f43U+s8VbfoGjoowfFXGNZZAZM8dVzhUbTYyHVfVjNjQfPpPz0OypQ5Wvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=analog.com; dmarc=bestguesspass action=none
 header.from=analog.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXONAl8khotmNpxZIDY9Jtj9dWE9GvxOwxoDyUMVbHw=;
 b=b7XXJm4Ka4urUESs9MEn0NbQvlmQPYDkXDbjkFJFw5u8oKARVgoAwucdU8F7AMeFDHxKTv/UUIAQnKndLu6jFcPjhAM+0D4SAEA9fCFYqnRgfdKJrGobGWQByemdNlPzrpVr2dHckBEUoTY3q45/Wipg0J1rIoa1gXX+JH83VEk=
Received: from BN3PR03CA0103.namprd03.prod.outlook.com (2603:10b6:400:4::21)
 by DM6PR03MB3532.namprd03.prod.outlook.com (2603:10b6:5:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15; Tue, 7 Jan
 2020 13:37:50 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by BN3PR03CA0103.outlook.office365.com
 (2603:10b6:400:4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.8 via Frontend
 Transport; Tue, 7 Jan 2020 13:37:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2602.11
 via Frontend Transport; Tue, 7 Jan 2020 13:37:49 +0000
Received: from ASHBMBX8.ad.analog.com (ashbmbx8.ad.analog.com [10.64.17.5])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id 007DbbDu004373
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 Jan 2020 05:37:37 -0800
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 7 Jan 2020
 08:37:47 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 7 Jan 2020 08:37:47 -0500
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 007DbflP002280;
 Tue, 7 Jan 2020 08:37:41 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND v3 0/2] drm: bridge: adv7511: Add support For ADV7535
Date: Tue, 7 Jan 2020 15:34:30 +0200
Message-ID: <20200107133431.5201-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:; CTRY:US; EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(246002)(4744005)(8936002)(8676002)(6916009)(2616005)(1076003)(7416002)(5660300002)(86362001)(356004)(36756003)(6666004)(7636002)(426003)(44832011)(186003)(336012)(478600001)(2906002)(107886003)(316002)(54906003)(26005)(7696005)(70586007)(70206006)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB3532; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c145c7-01a8-4221-4bfa-08d79376c9ed
X-MS-TrafficTypeDiagnostic: DM6PR03MB3532:
X-Microsoft-Antispam-PRVS: <DM6PR03MB35321A3FE1FC408E04DA5FB89B3F0@DM6PR03MB3532.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 027578BB13
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11lT62xBRkJmxzTNZuLZOzB4Xjk+YADi/nW/BSLhNG4SRvNm/jk4KfDrKip6ArJ10UTGZfi0JDl+dKa3ulvhpctUvoJlTFmnZDcp+7wFYVu3/CLg7wJafo1VYkEVblC8ib1S3MesqvJ2QAP/bsbYyzUGCr5bsSS2uCrby3wSenGMDv3fM2mdUMoo8Kl16qsgppM5k94GBlCSAcXpKD3CMhWZ2RCOopgc3N3G04kbG6stx6CbYVv0/qnyAidk96ACF3XCiQ9jxC5h1IWqdztXS7+IZbhwMUu+q0jRf166xFhRAK1I0K7f/8vhBFbZNaNHaZ5cKfYhWLKbSX4ZWWp8FUdzXJcxM41JdEbJTSEbWiWceosEGj50ArZe2sWHtfHKYOWe3R6TAkRxENlD299h3F+5g/yovcEpzBlttO5N5sFRH8UcWptoacpKPH+7z/IMyB3W70sezCEk0+RjULxAotZDOvPECcZ7B1tMNvYUzSQr6RFk52OTH7kLppqe90JJ
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2020 13:37:49.7789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c145c7-01a8-4221-4bfa-08d79376c9ed
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3532
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=1
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=767 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070113
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set add support for ADV7535 part in ADV7511 driver.

ADV7535 and ADV7533 are pin to pin compatible parts but ADV7535
support TMDS clock upto 148.5Mhz and resolutions up to 1080p@60Hz.

---
Changes in v3:
 - remove CONFIG_DRM_I2C_ADV7533 from Kconfig. Now driver support
all chip versions
 - create macros for v1p2 config registers
 - remove dummy functions from header

Bogdan Togorean (2):
  dt-bindings: drm: bridge: adv7511: Add ADV7535 support
  drm: bridge: adv7511: Add support for ADV7535

 .../bindings/display/bridge/adi,adv7511.txt   | 23 +++++-----
 drivers/gpu/drm/bridge/adv7511/Kconfig        | 13 ++----
 drivers/gpu/drm/bridge/adv7511/Makefile       |  3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h      | 44 +++----------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 35 ++++++++++-----
 5 files changed, 44 insertions(+), 74 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
