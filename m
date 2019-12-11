Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBA11C8A5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3DC6ECCD;
	Thu, 12 Dec 2019 08:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10080.outbound.protection.outlook.com [40.107.1.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294296EAF3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGpBwwcW+Vuo28WpUcjfSV4HrA10KlQGRiuWkwmgrnE=;
 b=cKJzjwHfe7XiBArZ2JEVO4KAYhwu6Hr5Ir9nSB7Qkb2jO3F0ncV5UjKG7eqqFSdBFff3Trq/hj6w8wv8brlGjbrPOqwTKwBG0PwYGgM0R3FVKMH0zwDl6mHsSQbBrMnVtaME4MHXbIG9WcT2i0xXjbaHaI/Cj70BParmsvpm958=
Received: from VI1PR08CA0255.eurprd08.prod.outlook.com (2603:10a6:803:dc::28)
 by DB8PR08MB4153.eurprd08.prod.outlook.com (2603:10a6:10:a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Wed, 11 Dec
 2019 10:30:12 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0255.outlook.office365.com
 (2603:10a6:803:dc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Wed, 11 Dec 2019 10:30:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 10:30:12 +0000
Received: ("Tessian outbound 45a30426f8e4:v37");
 Wed, 11 Dec 2019 10:30:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8f62d1e5be87819
X-CR-MTA-TID: 64aa7808
Received: from 32157a8ddd17.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B696A0C6-F29B-4848-9AE8-4B35F1859225.1; 
 Wed, 11 Dec 2019 10:30:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32157a8ddd17.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 10:30:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX/OOeNMtN8jHHOePnJ0BCSzUM0KLgHheo+CjSupM1MmX4rR0kKW3P4lwFEpAWBu49BZ9DJiZcZ6C5Ks/1KL/rKKlavDAalWEJbTZHXuCBmGIPmnxT34CtZ18yGfjgnWbk6pxgNrnX9XvZREbxkPuVQZP0gwLMXYinQGuoRPuzeF9f8UOvsI7Pogly/Whm1QectOJxSxhn1uixJlw6SQj4HOnmR+6/6BSAL44ebgVHDLvfyzZEytu4ilYddEp7bZMpG/l7Idi8UhuMATycgv9LvqETE5rGDnLvMvzR8bDxqwrmaXzZp1CKTDMTjE1vOo0tO4bzbP3LcDTEljEGKx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGpBwwcW+Vuo28WpUcjfSV4HrA10KlQGRiuWkwmgrnE=;
 b=ma6Mc5F8hBPZT1k+TinOmW2szcwWcuu5GxyGnSRrUOYyTsoN90WApMMgBCpqH57HMGA+tayoqM7Vkj/nrVQIL1QgiY04F6uR372tg3XXbiGVLJznYCe4lE/emh4X3SjhD4pFFcREcD9wOXCsoRN6nemg2M02delNx/seBeMTH2SHyHK05+NRd34+YKPCtxhts6ZEW6Hgmcpq8iBYttTE/dqcGJoWSrxT/GVU+UpBRbvn9HU0OiQkiplMWju69YebbiYy5pLqEAYxiAvka/yBbG589HmiDaAL9Ely1eGDiM8oYiQUnAXvGMnvZHaYlW+dTLqB3RkcmlMuNc7N0ifoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGpBwwcW+Vuo28WpUcjfSV4HrA10KlQGRiuWkwmgrnE=;
 b=cKJzjwHfe7XiBArZ2JEVO4KAYhwu6Hr5Ir9nSB7Qkb2jO3F0ncV5UjKG7eqqFSdBFff3Trq/hj6w8wv8brlGjbrPOqwTKwBG0PwYGgM0R3FVKMH0zwDl6mHsSQbBrMnVtaME4MHXbIG9WcT2i0xXjbaHaI/Cj70BParmsvpm958=
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com (10.255.112.210) by
 VE1PR08MB5280.eurprd08.prod.outlook.com (20.179.31.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 10:30:05 +0000
Received: from VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d]) by VE1PR08MB4877.eurprd08.prod.outlook.com
 ([fe80::c4ca:94b9:e70b:d68d%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 10:30:05 +0000
From: "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 (Arm Technology China)" <Jonathan.Chai@arm.com>
Subject: [PATCH 0/2] Add most basic function to support D77
Thread-Topic: [PATCH 0/2] Add most basic function to support D77
Thread-Index: AQHVsA3zOk5mX7pBC0SmL4VHi4JsSg==
Date: Wed, 11 Dec 2019 10:30:05 +0000
Message-ID: <20191211102948.27117-1-tiannan.zhu@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 03ba02d1-3124-4d37-262d-08d77e251aa2
X-MS-TrafficTypeDiagnostic: VE1PR08MB5280:|VE1PR08MB5280:|DB8PR08MB4153:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB415323C14809A1949830DC41F15A0@DB8PR08MB4153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
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
X-Microsoft-Antispam-Message-Info-Original: uDAyDPJQ3z6+wXXKELx4OD+5LDwMZFvOuT9eSnk7dVWltvVbJrG5TgMW9blyp9gvXQeu5pnOBgJ0xH8gzcI+uVaTBopbbXboVotsGNnsHsCwCz5mJ9mB6/hOVblc8sfjSJAneE6OeXwHqPycoGN1iZ0MugG1rEPOFi2MqQjNT6TjLqxx+EWZucJi2mrCK2xfjJqqU6JJa1Gfrva6lkcWY71/9t7fq2nfBaIIN6lVEEu3uT8oVlKkZaSSHD78V3ynNs8G7ZY2S3Q9X6TqHXT/G6BUJzVv+/v3BHXJV4hnkbzeLTeAIDvOyV95yzY3ib/hTgPR0BYmquCrQFKQJ+VKebTJ6DPxogzdRg2QZdbfEi/SRDzi0MSCC3UFir/+j6CYc/N/MwvycKGCEufV09U5IAOcix+j/Sz4lBZuMKD9t7lIWcyK1rnOlZwJvsXqfuck
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5280
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tiannan.Zhu@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(336012)(86362001)(110136005)(316002)(6506007)(36906005)(478600001)(356004)(26826003)(54906003)(2616005)(8936002)(36756003)(6512007)(2906002)(81156014)(8676002)(4326008)(81166006)(5660300002)(186003)(26005)(1076003)(70586007)(70206006)(6486002)(6636002)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4153;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8a9f25e1-bd1a-4524-76b2-08d77e25162e
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFQssZtKPQak9M5FIEkATL5+nlHeHYu3nW5o19KfYrBM4JMtFJYYndz5TcQinvB0y2EL5sm2XsMgY6baVcqWd2JIXbA6zlKCMjHJR5D0JHAvitFcNADcAx1EMpZg291MEjz7yTC9zKW3lOU2ympfIdivzvGNcabjiibZklbyM5/XmFuHX+Uk7nldJRoiinc+Ab/O0Luv4x8K5HkyU/KFSOWZrAZvIfeW7upIKaA6UQH//NXgXl7Y8t6/lTEeBY6NKbrfikyLo16i3IkEBxdPf0mN/4ku5NmRTynPPsFz7AF9+nRw85LHMstiTb+i96E472nNkb35nHzNJ9v6/g+Fp9mlerMnmOaYykfCy5rLp2pgqn7RswCOasgb9nx7reIZ6d9DWIqatMHXozr+EKLpmpCtlDtmAd3E/N8H+QwkaWZwSOsTqjuHd7frsP4JKqui
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 10:30:12.1117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ba02d1-3124-4d37-262d-08d77e251aa2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4153
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

D77 is the next generation of D71, compared with D71, it add some new
features(components) like ATU, Crossbar, PerfCounter etc.

Crossbar is used to control every plane's zorder.
ATU (Asyncronise Timewarp Unit) is used to support and optimize VR/AR
PerfCounter is used to log device performance data

To enable D77 and make it work as D71, we need do the following things
1. make D77 recongnise these new components.
2. enable crossbar.

and the other new features will be commited later.

Tiannan Zhu (Arm Technology China) (2):
  drm/komeda: Add basic support for D77
  drm/komeda: add Crossbar support

 .../drm/arm/display/include/malidp_product.h  |  1 +
 .../arm/display/komeda/d71/d71_component.c    | 76 +++++++++++++++++++
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  |  1 +
 .../gpu/drm/arm/display/komeda/d71/d71_regs.h |  4 +
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  1 +
 .../drm/arm/display/komeda/komeda_pipeline.c  | 10 +++
 .../drm/arm/display/komeda/komeda_pipeline.h  |  7 ++
 .../display/komeda/komeda_pipeline_state.c    | 36 +++++++++
 .../arm/display/komeda/komeda_private_obj.c   | 49 ++++++++++++
 9 files changed, 185 insertions(+)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
