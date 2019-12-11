Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6311C8B3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88E56ECE1;
	Thu, 12 Dec 2019 08:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30042.outbound.protection.outlook.com [40.107.3.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EE16EAFE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKsnx0pbXWgE9kst2wHY6iHPVcutpehQAXojP0dQZpE=;
 b=2O4pzwJ74n63SoL4QJBkmcITpecTQudfKWYWja05zQ7YI6XFRhLXe/F4kSHRruau5qkPqQmvle2xuTiJY6YgYr0u9dPND9X8ar0UjSNQQ8gdUk35c2++/rluLW7NabOeAItnNqHFtagJXMxvv8221J16QAXYolD9jzudDhHvims=
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by VI1PR0802MB2495.eurprd08.prod.outlook.com (2603:10a6:800:b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14; Wed, 11 Dec
 2019 10:30:20 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Wed, 11 Dec 2019 10:30:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 10:30:20 +0000
Received: ("Tessian outbound 58ad627f3883:v37");
 Wed, 11 Dec 2019 10:30:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a33256c8727d1d7
X-CR-MTA-TID: 64aa7808
Received: from 92517d3ee6cf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A8CF205-920C-4D23-901D-40D554036556.1; 
 Wed, 11 Dec 2019 10:30:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92517d3ee6cf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 10:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY6PXPKNtruUA9E13TY9SaLL5edpERXsLYrBSeZuJFIRybhp6Wzjh98Yh0oiAo4kPCWvsh6vY5wv4SlobRLv/uGQIE/MCUBtLRvQ62V9qBpwVfJGGwnStoWmpAwp4os13K9A9WIdKwclOMjhVU7zDlES6h/kkDyoWoqVI58Snac00ZiUHDRrJs9/G+HrDwvpqPJu8rLPxZisYRBttIV8/QQZlLhoZtzIVfw2RHdAMzHE/1Et/NKwL9B4k5H0wyR2OThcX80SBHfciVKjHuGBXbiOL4d+Boe1hgxk7Q+0xWEdbmIxIIe/Y+ou0kQqTGSChUVIn+XiGrwFxclRW4aQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKsnx0pbXWgE9kst2wHY6iHPVcutpehQAXojP0dQZpE=;
 b=LEEbjVSQm1prUQQGKkq4Jssw9WXXI3nsS+G25a85ir6tUl1u9q8NSyzR4JZazATVJhDGXaCcjFRNCQjZ3D1QXmjCwq+/ISv3unjPlV+2KZIYnZ2X7HMtXqe47NAIIgBiXWj0r8dmP4gywLS9N7j+Tc0Y5RsJ1Ra2ZtaxzzUt3XkADFKeymmbxrRvUXkPFVLOSbFQ5hRMCOTzquqgp+RVc5m6lUbvTOoKW73blQJnaolozF17tPtnWTGtWgHlYWxb3owv8b7NVdCGtzN84ePP6b0XXiu2/DTaa76YT0NX3Jt+h89h4Pyw4Ty2V/EmQ0muEku1bs8iVFbJHJufJNveFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKsnx0pbXWgE9kst2wHY6iHPVcutpehQAXojP0dQZpE=;
 b=2O4pzwJ74n63SoL4QJBkmcITpecTQudfKWYWja05zQ7YI6XFRhLXe/F4kSHRruau5qkPqQmvle2xuTiJY6YgYr0u9dPND9X8ar0UjSNQQ8gdUk35c2++/rluLW7NabOeAItnNqHFtagJXMxvv8221J16QAXYolD9jzudDhHvims=
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com (10.255.112.210) by
 VE1PR08MB5280.eurprd08.prod.outlook.com (20.179.31.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 10:30:13 +0000
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d]) by VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 10:30:13 +0000
From: "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 (Arm Technology China)" <Jonathan.Chai@arm.com>
Subject: [PATCH 2/2] drm/komeda: add Crossbar support
Thread-Topic: [PATCH 2/2] drm/komeda: add Crossbar support
Thread-Index: AQHVsA34QpJCOxKDtEqOzziy1zCdzA==
Date: Wed, 11 Dec 2019 10:30:13 +0000
Message-ID: <20191211102948.27117-3-tiannan.zhu@arm.com>
References: <20191211102948.27117-1-tiannan.zhu@arm.com>
In-Reply-To: <20191211102948.27117-1-tiannan.zhu@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To VE1PR08MB4877.eurprd08.prod.outlook.com
 (2603:10a6:802:a4::18)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Tiannan.Zhu@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 561426c6-2a59-4c24-f8ec-08d77e251f8b
X-MS-TrafficTypeDiagnostic: VE1PR08MB5280:|VE1PR08MB5280:|VI1PR0802MB2495:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2495D75340A072CF959FCBCFF15A0@VI1PR0802MB2495.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:972;OLM:972;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(189003)(199004)(5660300002)(1076003)(81156014)(36756003)(6512007)(71200400001)(6486002)(6636002)(8936002)(55236004)(64756008)(81166006)(6506007)(66556008)(66446008)(66476007)(8676002)(86362001)(66946007)(52116002)(316002)(110136005)(478600001)(4326008)(54906003)(2616005)(26005)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5280;
 H:VE1PR08MB4877.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kGJ287WsgcEP6tJsirsx+FFfWr4FSCeMMLGTkyXcfuqKcpQw+ICTMIjAPGMJjQEeAlM5WNckf0BmKD3rtIJiQ4BgDHpY3mmmdWqemFt95BtvuTCJYMz2TkNiEaOx1wgf+WjeuD1WPQu/yZRR/0i8Y1PUBTzfoQFJcVNYcWfG+VNq41lRyK6eDeubFL8nCSupRseMJGLTTETnT0wnE73L8udFEUHQY+DGZ+2ONG0T3BNtaDS+/QcLGZGySA5H7uOtCeWhRQgUzl8WwTF+d89edVnNc1RCdpfLd0aFpsZuA3ee+z4r41OH1brXUfoJyw+z5RH/F59HESQI1hQ8RngyoU/gWgmw82cj6U7PwGT6gsf9RdJjCrkWusMaS4xQNEzJZ4xs1yqxald+aXa2A+M6nMwNbPIL7H3YsvWRC5u4eibyixX5nK7TVPFSatjLw/LT
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5280
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tiannan.Zhu@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(4326008)(2906002)(81166006)(8676002)(356004)(70586007)(70206006)(81156014)(316002)(36906005)(6486002)(110136005)(1076003)(54906003)(336012)(86362001)(5660300002)(2616005)(8936002)(36756003)(26005)(6636002)(478600001)(26826003)(186003)(76130400001)(6506007)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2495;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ed5f068f-6978-46e1-7bb3-08d77e251af9
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zx8EeeO2OPfj9ibCtJhYdHTuK4w8+YctSCIb4rptVuDlUtEvl8nUvrbGqThpcqXx/o62/ZvbpuxS0I0Gf8ughnj8ueR7FuftIMrIt5rB7VmIrDCtu/4tc5hDdRKnOITDwtfrsWEqkeyaft0eIwnKE8Rxc2w7/cOSs+yHlpPus1RDBR8YRLTHzfVIy7Zejoko7BKs6UEDBS+gA546qAhdR8m9TrcO61/hVf2LJEZsvcQ2lxT9oMvrBdYYdCksMyX6layKo0DmjJ6DsR+y4jIJZDfhrlCytDLAqULuWCJbkxkoUQxu0N2NNZnzQbGMbZq819SC8/PIjV/ObjryXWzDhKjZTeqvTU/pJKu3rqXTbw6HBLHdS323R4VDGnXHcRspWwiu5tdVZJah2d5bG8ZJAIRfUC1DQNtUzL3e3tuDo4awK9XVUoEczYkj9uZrf/RM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 10:30:20.2439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561426c6-2a59-4c24-f8ec-08d77e251f8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2495
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: nd <nd@arm.com>, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Active D77's Crossbar

Crossbar(CBU) is a new component added in D77, which is used for zorder
control.
At a time (per display frame) up to 5 inputs of the CBU can be enabled

Signed-off-by: Tiannan Zhu (Arm Technology China) <tiannan.zhu@arm.com>
---
 .../arm/display/komeda/d71/d71_component.c    | 61 +++++++++++++++++++
 .../drm/arm/display/komeda/komeda_pipeline.c  | 10 +++
 .../drm/arm/display/komeda/komeda_pipeline.h  |  7 +++
 .../display/komeda/komeda_pipeline_state.c    | 36 +++++++++++
 .../arm/display/komeda/komeda_private_obj.c   | 49 +++++++++++++++
 5 files changed, 163 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index ec96b69a5ade..3f2fee43867e 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -44,6 +44,9 @@ static void get_resources_id(u32 hw_id, u32 *pipe_id, u32 *comp_id)
 	case D71_BLK_TYPE_DOU:
 		id = KOMEDA_COMPONENT_TIMING_CTRLR;
 		break;
+	case D77_BLK_TYPE_CBU:
+		id += KOMEDA_COMPONENT_CROSSBAR0;
+		break;
 	default:
 		id = 0xFFFFFFFF;
 	}
@@ -969,6 +972,63 @@ static int d71_splitter_init(struct d71_dev *d71,
 	return 0;
 }
 
+static void d77_crossbar_update(struct komeda_component *c,
+				struct komeda_component_state *state)
+{
+	u32 __iomem *reg;
+	u32 index, input_hw_id;
+
+	for_each_changed_input(state, index) {
+		reg = c->reg + index;
+		input_hw_id = to_d71_input_id(state, index);
+		if (state->active_inputs & BIT(index)) {
+			malidp_write32(reg, BLK_INPUT_ID0, input_hw_id);
+			malidp_write32(reg, BLK_CONTROL, CBU_INPUT_CTRL_EN);
+		} else {
+			malidp_write32(reg, BLK_INPUT_ID0, 0);
+			malidp_write32(reg, BLK_CONTROL, 0);
+		}
+	}
+}
+
+static void d77_crossbar_disable(struct komeda_component *c)
+{
+	u32 __iomem *reg = c->reg;
+	u32 i;
+
+	for (i = 0; i < c->max_active_inputs; i++) {
+		malidp_write32(reg, BLK_CONTROL + (i << 2), 0);
+		malidp_write32(reg, BLK_INPUT_ID0 + (i << 2), 0);
+	}
+}
+
+static struct komeda_component_funcs d77_crossbar_funcs = {
+	.update		= d77_crossbar_update,
+	.disable	= d77_crossbar_disable,
+};
+
+static int d77_crossbar_init(struct d71_dev *d71,
+			     struct block_header *blk, u32 __iomem *reg)
+{
+	struct komeda_component *c;
+	u32 pipe_id, comp_id;
+
+	get_resources_id(blk->block_info, &pipe_id, &comp_id);
+	c = komeda_component_add(&d71->pipes[pipe_id]->base, sizeof(*c),
+				 comp_id,
+				 BLOCK_INFO_INPUT_ID(blk->block_info),
+				 &d77_crossbar_funcs,
+				 CBU_NUM_INPUT_IDS, get_valid_inputs(blk),
+				 CBU_NUM_OUTPUT_IDS, reg,
+				 "CBU%d", pipe_id);
+	if (IS_ERR(c)) {
+		DRM_ERROR("Failed to add crossbar component\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void d71_merger_update(struct komeda_component *c,
 			      struct komeda_component_state *state)
 {
@@ -1351,6 +1411,7 @@ int d71_probe_block(struct d71_dev *d71,
 		break;
 
 	case D77_BLK_TYPE_CBU:
+		err = d77_crossbar_init(d71, blk, reg);
 		break;
 
 	case D77_BLK_TYPE_ATU:
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 104e27cc1dc3..fdb17a7c6fb6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -76,6 +76,16 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 	case KOMEDA_COMPONENT_LAYER3:
 		pos = to_cpos(pipe->layers[id - KOMEDA_COMPONENT_LAYER0]);
 		break;
+	case KOMEDA_COMPONENT_CROSSBAR0:
+	case KOMEDA_COMPONENT_CROSSBAR1:
+		temp = mdev->pipelines[id - KOMEDA_COMPONENT_CROSSBAR0];
+		if (!temp) {
+			DRM_ERROR("crossbar-%d's pipeline doesn't exist.\n",
+				  id);
+			return NULL;
+		}
+		pos = to_cpos(temp->cbar);
+		break;
 	case KOMEDA_COMPONENT_WB_LAYER:
 		pos = to_cpos(pipe->wb_layer);
 		break;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
index 76621a972803..b15649d08c3a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
@@ -34,6 +34,8 @@ enum {
 	KOMEDA_COMPONENT_IPS0		= 20, /* post image processor */
 	KOMEDA_COMPONENT_IPS1		= 21,
 	KOMEDA_COMPONENT_TIMING_CTRLR	= 22, /* timing controller */
+	KOMEDA_COMPONENT_CROSSBAR0	= 24,
+	KOMEDA_COMPONENT_CROSSBAR1	= 25,
 };
 
 #define KOMEDA_PIPELINE_LAYERS		(BIT(KOMEDA_COMPONENT_LAYER0) |\
@@ -41,6 +43,9 @@ enum {
 					 BIT(KOMEDA_COMPONENT_LAYER2) |\
 					 BIT(KOMEDA_COMPONENT_LAYER3))
 
+#define KOMEDA_PIPELINE_CROSSBARS	(BIT(KOMEDA_COMPONENT_CROSSBAR0) |\
+					 BIT(KOMEDA_COMPONENT_CROSSBAR1))
+
 #define KOMEDA_PIPELINE_SCALERS		(BIT(KOMEDA_COMPONENT_SCALER0) |\
 					 BIT(KOMEDA_COMPONENT_SCALER1))
 
@@ -412,6 +417,8 @@ struct komeda_pipeline {
 	int n_layers;
 	/** @layers: the pipeline layers */
 	struct komeda_layer *layers[KOMEDA_PIPELINE_MAX_LAYERS];
+	/** @cbar: the pipeline crossbar */
+	struct komeda_component *cbar;
 	/** @n_scalers: the number of scaler on @scalers */
 	int n_scalers;
 	/** @scalers: the pipeline scalers */
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index 79f7e7b6526f..82f21e9b5c73 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -665,6 +665,32 @@ void pipeline_composition_size(struct komeda_crtc_state *kcrtc_st,
 		*vsize = m->vdisplay;
 }
 
+static int
+komeda_crossbar_set_input(struct komeda_component *cbar,
+			  struct komeda_crtc_state *kcrtc_st,
+			  struct komeda_data_flow_cfg *dflow)
+{
+	struct drm_atomic_state *drm_st = kcrtc_st->base.state;
+	struct drm_crtc *crtc = kcrtc_st->base.crtc;
+	struct komeda_component_state *st;
+	u32 idx = dflow->blending_zorder;
+
+	if (!cbar)
+		return 0;
+
+	st = komeda_component_get_state_and_set_user(cbar, drm_st, crtc, crtc);
+	if (IS_ERR(st))
+		return PTR_ERR(st);
+
+	if (komeda_component_check_input(st, &dflow->input, idx))
+		return -EINVAL;
+
+	komeda_component_add_input(st, &dflow->input, idx);
+	komeda_component_set_output(&dflow->input, cbar, idx);
+
+	return 0;
+}
+
 static int
 komeda_compiz_set_input(struct komeda_compiz *compiz,
 			struct komeda_crtc_state *kcrtc_st,
@@ -905,6 +931,10 @@ int komeda_build_layer_data_flow(struct komeda_layer *layer,
 	if (err)
 		return err;
 
+	err = komeda_crossbar_set_input(pipe->cbar, kcrtc_st, dflow);
+	if (err)
+		return err;
+
 	err = komeda_scaler_validate(plane, kcrtc_st, dflow);
 	if (err)
 		return err;
@@ -1452,6 +1482,12 @@ int komeda_build_display_data_flow(struct komeda_crtc *kcrtc,
 		if (err)
 			return err;
 
+		/* if master has crossbar, connect s_dflow to crossbar */
+		err = komeda_crossbar_set_input(master->cbar, kcrtc_st,
+						&s_dflow);
+		if (err)
+			return err;
+
 		/* merge the slave dflow into master pipeline */
 		err = komeda_compiz_set_input(master->compiz, kcrtc_st,
 					      &s_dflow);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 914400c4af73..4cc8ccf224f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -103,6 +103,49 @@ static int komeda_scaler_obj_add(struct komeda_kms_dev *kms,
 	return 0;
 }
 
+static struct drm_private_state *
+komeda_crossbar_atomic_duplicate_state(struct drm_private_obj *obj)
+{
+	struct komeda_component_state *st;
+
+	st = kmemdup(obj->state, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return NULL;
+
+	komeda_component_state_reset(st);
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &st->obj);
+
+	return &st->obj;
+}
+
+static void
+komeda_crossbar_atomic_destroy_state(struct drm_private_obj *obj,
+				     struct drm_private_state *state)
+{
+	kfree(priv_to_comp_st(state));
+}
+
+static const struct drm_private_state_funcs komeda_crossbar_obj_funcs = {
+	.atomic_duplicate_state = komeda_crossbar_atomic_duplicate_state,
+	.atomic_destroy_state	= komeda_crossbar_atomic_destroy_state,
+};
+
+static int komeda_crossbar_obj_add(struct komeda_kms_dev *kms,
+				   struct komeda_component *cbar)
+{
+	struct komeda_component_state *st;
+	struct drm_device *dev = &kms->base;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+	st->component = cbar;
+
+	drm_atomic_private_obj_init(dev, &cbar->obj, &st->obj,
+				    &komeda_crossbar_obj_funcs);
+	return 0;
+}
+
 static struct drm_private_state *
 komeda_compiz_atomic_duplicate_state(struct drm_private_obj *obj)
 {
@@ -388,6 +431,12 @@ int komeda_kms_add_private_objs(struct komeda_kms_dev *kms,
 				return err;
 		}
 
+		if (pipe->cbar) {
+			err = komeda_crossbar_obj_add(kms, pipe->cbar);
+			if (err)
+				return err;
+		}
+
 		for (j = 0; j < pipe->n_scalers; j++) {
 			err = komeda_scaler_obj_add(kms, pipe->scalers[j]);
 			if (err)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
