Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C016812A729
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1389D58;
	Wed, 25 Dec 2019 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB42389DA3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i9DHSh7c6toNiXmd66RXeDI3C5E2KZBpNOLyyWx8/c=;
 b=OScpDIBLhBGadpzp1YtKFNcrpxJVl0ica9x91YeXBqQOXyEX80q0PIR5pYs104NO8lq+NYCwnlwZvldrDOkxAsmw3x5+SZYRakaI1VzlWavGbEx/lqKCSo/iVY9xhBvIRi+IbdHvq2g0fjQDAlZfJ9hwinrDt97+DQyhs9mQq88=
Received: from VI1PR08CA0228.eurprd08.prod.outlook.com (2603:10a6:802:15::37)
 by HE1PR08MB2876.eurprd08.prod.outlook.com (2603:10a6:7:2b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.17; Tue, 24 Dec
 2019 17:35:33 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0228.outlook.office365.com
 (2603:10a6:802:15::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:33 +0000
Received: ("Tessian outbound 121a58c8f9bf:v40");
 Tue, 24 Dec 2019 17:35:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f518a959fa5249e
X-CR-MTA-TID: 64aa7808
Received: from 2398bdd0a748.9
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BDEE096-6392-4851-822A-204FDD8175D9.1; 
 Tue, 24 Dec 2019 17:35:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2398bdd0a748.9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Dec 2019 17:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6pq+YtkFoS8kQC1QnTI0qFZX4tYrFgTBM/uFbURu0Qxg5BrGCj+MXX13IrAvMvb1vrTJG4xtomBUsas/1xI+ZJgFDAjMmdvN5mv4UtJLB1DJbqK72Iph7B/OCH/cgenCIqbWssuWeI+cw6C5on+FUojugFlVqpJly+OkbuXhZdq2iO5lT2K00GdFJTHQrE6tCX8zkdsEfDpxszGxcTn1W0SMqdsfVzL89UXaX3Sf8kE1JKCa3lakd+mcQXRO9VWp/Mm3aOmUzysYz6V8EnC5QHIqbAC4lNzPNdCvGJkB2kOGyHLYA3h2sGoPbF4js0KGBX9n9cUkGexW2gUJsjIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i9DHSh7c6toNiXmd66RXeDI3C5E2KZBpNOLyyWx8/c=;
 b=WNCzo23k2CTthwtwNf2LA8WfYGWl7+CBNRmHKUjhGfsX4xo/n7brkn/LSAQer4dhJ/QLrUztqjd3/U9ooToAnDMW0EvlOOOQJKPvruC/NeE2nxkeMyhXyN9xi0x25kI7Afwvv9v6Tno3m+eTf1yh+FHJmm9spwLzedC/xC/cHS2yEVqY/jCfeU13/if22JCl6+dU05jn/kmLJlprgibUl2ndXAE9E7HlSpm6W4CDtRLP9dLDQySafxnFWDU3P4mefHzkMwDkinDjSB9yIxDVLQbvrEWdaU21yEzT39rrAKLMquGA5+eyoSRkuo2FRn4+//ZkxQy0NGWAz1S5VXNQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i9DHSh7c6toNiXmd66RXeDI3C5E2KZBpNOLyyWx8/c=;
 b=OScpDIBLhBGadpzp1YtKFNcrpxJVl0ica9x91YeXBqQOXyEX80q0PIR5pYs104NO8lq+NYCwnlwZvldrDOkxAsmw3x5+SZYRakaI1VzlWavGbEx/lqKCSo/iVY9xhBvIRi+IbdHvq2g0fjQDAlZfJ9hwinrDt97+DQyhs9mQq88=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:35:22 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:35:22 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 34/35] drm/sti: Use drm_bridge_init()
Thread-Topic: [PATCH v3 34/35] drm/sti: Use drm_bridge_init()
Thread-Index: AQHVuoB0C8mc1p9mjE6TKYk99nv/RA==
Date: Tue, 24 Dec 2019 17:34:54 +0000
Message-ID: <20191224173408.25624-35-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b672d3e1-4415-4163-2866-08d78897ae0f
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|HE1PR08MB2876:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR08MB2876B940B592DEC373FBF8B68F290@HE1PR08MB2876.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:949;OLM:949;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(6666004)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2672;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bcCTI87+mRgoeNVf/NF0zImG6/BxyDFziP6nDHWfJn8F+IboO99YpXJK5t3JMq8I8+5HivDTpAvWFsqpacN0opNJdLBKpIkxqhjyEq2u1aAS5XL6S4vY7xavksNBo/FWL0KwxdkynlPo3LDLYJdEq5TsHwKw4yxyq9lnLo5TR8cRTken+SDaMm9kzBCtLDlO3R2ruvy2xJTxN8WdrEtechFbfxk1Kg1GDu8Xc2LofuXobHrhnGdZY08HRLD/AFpl5pwzsnQ9qGXKdZDNQFs+Mr98ILiuQP+DIBUUdhlyFI0VdUZfxIg+9jwdt1ON5uyRwkiZRgpg+VgaKstRySsYqyL+4Su8yHOJVwdxj4nuVXZ6uOWssU5I3bYftqmQ1WD6vzSpysYM41EjDTSSSKY+SWUpKSrGbH8Ir6c3QR/UeKyIZSPwPF7Rn8S+T4nSeTmL
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(199004)(189003)(6506007)(2906002)(6916009)(6512007)(1076003)(86362001)(70206006)(70586007)(6486002)(26826003)(76130400001)(478600001)(81156014)(81166006)(8676002)(5660300002)(36756003)(26005)(8936002)(54906003)(6666004)(356004)(316002)(4326008)(36906005)(336012)(2616005)(107886003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR08MB2876;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b92cf01a-22ef-484b-d566-08d788979684
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNgw6alU37e784HSLsgsMb/yWxS++SOjbXlT+QN6BIXUf/AgGXb++cbvs3ULUsosoZ2ObO6ugqkBBxpcJRyDlOtRCtD6LSTFWGSwpeISMDjSa3cSKo8MKoy8LWTegG09fADC6saGfRWnnMi3XRZ/qnTMxDc+of7ney70dFnY1EN6WhdqU76JRAE9eSrrMDLVUYHQVGQgcje/h0sse4X9LwkE4rL/mEthY8JR3yd+VLtQ17WPSnFqCc0HevZJiZlwz4WqNITrU/5wUhVtaR94k6Q817AEl2by6AQ+p0DNwptlVkoCccoXr9Aq13yAp2rnd2vrL4zyivmjXQRnz6PtvFNs8cbWWVp30g/RKqjJywFaJOVn5DjfrmWeqeJk8ko1LnnUudIuL4gAmc4FkCQxHUIimTmoqa1pjBz2gMgms6ysxD8PCOa6SOKYj0p2PQyn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:33.5771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b672d3e1-4415-4163-2866-08d78897ae0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2876
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change.

v3:
 - drop driver_private argument (Laurent)
v2:
 - Also apply drm_bridge_init() in sti_hdmi.c and sti_hda.c (Sam,
   Benjamin)

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/sti/sti_dvo.c  | 3 +--
 drivers/gpu/drm/sti/sti_hda.c  | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 194491231de2..a72f4e4e60cd 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -460,8 +460,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 
 	connector->dvo = dvo;
 
-	bridge->funcs = &sti_dvo_bridge_funcs;
-	bridge->of_node = dvo->dev.of_node;
+	drm_bridge_init(bridge, &dvo->dev, &sti_dvo_bridge_funcs, NULL);
 	drm_bridge_add(bridge);
 
 	err = drm_bridge_attach(encoder, bridge, NULL);
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index d5b569ce93d0..b94044eb4672 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -699,7 +699,7 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
 
 	connector->hda = hda;
 
-	bridge->funcs = &sti_hda_bridge_funcs;
+	drm_bridge_init(bridge, dev, &sti_hda_bridge_funcs, NULL);
 	drm_bridge_attach(encoder, bridge, NULL);
 
 	connector->encoder = encoder;
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 7a7b0ce7bb14..e9e5c71b7eac 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1275,7 +1275,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	connector->hdmi = hdmi;
 
-	bridge->funcs = &sti_hdmi_bridge_funcs;
+	drm_bridge_init(bridge, dev, &sti_hdmi_bridge_funcs, NULL);
 	drm_bridge_attach(encoder, bridge, NULL);
 
 	connector->encoder = encoder;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
