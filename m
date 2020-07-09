Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424E21B0AB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE7D6EB9A;
	Fri, 10 Jul 2020 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2123.outbound.protection.outlook.com [40.107.236.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD3F6E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 08:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCDOatpyytzK1Lgbp1JKaIh+GEbq8Lx2T7sG6YljMQCTISSYtjev2rD8koqjw8aAZrD67pdEiGZ4Sg2xR3xmS+k6vB2rYbrMPbvq/XH0BDtz04mIo+5xnJICQ9HXmpCgEaJM9Yj5tutEQba9nSPGEsnSgUnsuZ+pXUT4T7CLscM1HL4yAMu30chxfIG8TCs+rAwlZzo2RudgcfU4MOX6QZGkyZi6w8Ujoka4QpdHvPOaOw63Rq6V6ioTtUzCrs/W/fkA+IRrw2Xv7eVmhLj8ZOltTHQEUdjn72Ry2ZHAkTi0pZ9d/Sfmv3nHJqcAmuOGYEgaRmNDSAozacuq9tYlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp+tfucsku7aI364laS9+4ItpkcVKBrKXR1VKWA+MBE=;
 b=U8RvFRwgCQQANC+ZxvE2KkpAUnXgej6UQ/9HwH1+PIjBOkyGBUHu7/7BqY0JxEQXEARkNUS3vQFcXzTs1OB+rlPEE/tPIt1Cd6VfOg2jORK3CjjNOqmwgl5FIAqlSDOEOPowbCnUPIhhaO59vybo8I46ks5V4j/PyEDmNfgLzAaETlvU41+NvI8pjeaKf0JYDQwhpLajF3X6Sv3iKBgpXfqsGbHNzx+N8I61kXYSeD/0eaI4dXyjYdxnB158PfPWwrWPmaf2UhKP4a26oySMm/S5/ktBs+GklcK+LzjsLNthrkmbTACU5pQBbrBC+/LDaiUfVGrUwBGxfArX4874EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp+tfucsku7aI364laS9+4ItpkcVKBrKXR1VKWA+MBE=;
 b=r5kd3Cc7CTeFurMn3SNRIwqVDVRKL7Usc+637CteuqfhtdksV5vnATzYiz3qinfYNaONTXOMMLtMLZj5m72uzLVYX6ZdvWU/jB0EGSj/x04K2gzpFCcn6uMsu/wVdBt0rI/yhXwIMnXhzLY8MVeW6jgeB0uJSGgsMMPZT4wiusM=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5462.namprd04.prod.outlook.com (2603:10b6:a03:c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Thu, 9 Jul
 2020 08:31:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%5]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 08:31:22 +0000
Date: Thu, 9 Jul 2020 16:31:09 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v14 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1594283160.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3195.5 via Frontend Transport; Thu, 9 Jul 2020 08:31:21 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3c6d926-ba77-4e5e-77eb-08d823e275ca
X-MS-TrafficTypeDiagnostic: BYAPR04MB5462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5462760621AD3F99A9DB00ABC7640@BYAPR04MB5462.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuT3fblASby832hMdDTdzfoviDxTV0wzw2d3ygSfBxl9TLP+PIL0AF/PjvUPYkrGvmE1LIowIfRMIvw7wk/pOKLw7kRzKMCEsWt4RTjhqf5XjTxBRk2+/MXQtIZmhsqIz+ius8lHhi7baLs5utNAM7dPaGQC521Cd6dmiQmMkG+/3NV5adq3o16f5Y0NOvAjdLIH3fPJVRFpOG7e6p5TIFN5MsPBXQHaBevP6Xks/imYTcf1Xt4mj3Ok6x0189jSF3Nevtu/J0g/dzejCvD69QoO+CZX1GWiOc0TrxhotPG2YvxuBkh41vIIA3FpJsbu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(366004)(136003)(39840400004)(54906003)(110136005)(316002)(6666004)(8676002)(6486002)(2906002)(36756003)(5660300002)(83380400001)(66476007)(52116002)(16526019)(66556008)(186003)(66946007)(26005)(4326008)(6496006)(8936002)(107886003)(478600001)(956004)(86362001)(7416002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: CS7orSMtzWmcYv3sTQn98yhJ4oLDd5yjjQAXO/qdh5SQfFQziy6YHf3bIQXifhstBGEq+JB+JDrXa25PnpsPDFpzzFe5W0Jgv7p5wvFI4byON4zon7qJJEPx2YKyc7auG5MAYnCEdLRFCXUI86cY6uuBq6wx4aT/kzYXRlo13drRyWVUvDYllx/2hnK2aBjW5KtTihqeIso7jNkYXGEpjLEOUsaXrERky0notnnHclmksVZZWNIbYmsIPaWkC2OwFbNar1u0UdBPUdQChjRIeGMniU5t5lvQJfTbGEYqSASIXe4pN1CBeW9SDsx1i0xoaRZ3qnbFkejtyRExpGi/vgCYO6aZoEL7NLBvW2TAd+/P7EowYQ7+zuWeU3df8jPk2gyyO2LbrYhaWFzn8IyH0LAzR3CSNiKViNnfV8AahnMd2Kv1NEpe4tehhmuUrLLtrSToMvKu38egI83GOLYMKHBHVj1SpZrKDtmjYAtTz6lf4LMEsSaSbgtqkS+vuKen
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c6d926-ba77-4e5e-77eb-08d823e275ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 08:31:22.1965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jVu5zHguaAKOQNpODBt4kesRsRuKuq3TJWnMfX8DjIi/N8vnkhV85U9NQoGwDlZk9RsbJMO9c/PK3Ds3uq1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5462
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v14 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v14: Fix comments from Sam and Nicolas
 - Check flags at drm_bridge_attach
 - Use panel_bridge instead of drm_panel
 - Fix not correct return value

v13: Fix comments from Launrent Pinchart and Rob Herring
 - Picked up Rob's Reviewed-By
 - Add .detect and .get_edid interface in bridge funcs.

v12: Fix comments from Hsin-Yi Wang
 - Rebase the code on kernel 5.7, fix DRM interface not match issue.

v11: Fix comments from Rob Herring
 - Update commit message.
 - Remove unused label.

v10: Fix comments from Rob Herring, Daniel.
 - Fix dt_binding_check warning.
 - Update description.

v9: Fix comments from Sam, Nicolas, Daniel
 - Remove extcon interface.
 - Remove DPI support.
 - Fix dt_binding_check complains.
 - Code clean up and update description.

v8: Fix comments from Nicolas.
 - Fix several coding format.
 - Update description.

v7:
 - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
   enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.


Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1939 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  391 ++++
 5 files changed, 2435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
