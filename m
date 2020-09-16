Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB4E26C48D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE8A6EA54;
	Wed, 16 Sep 2020 15:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2113.outbound.protection.outlook.com [40.107.243.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D23E6E392
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3WqBvHs4mQVszMkjnD3fdzxYOrJKIyToh7i2PPJKOMfMmetow6MOGO/Jxc9TO15eAYwdAcv8dAQ+/5yaQYa5RPisd7+hpG2HzI+NKN0RHUTzFNqyo+ZijXXXQf/hecXa8vf7OyHk82wvZixxm/duHhr61KoggWTAeaZxOP89M+P9C5I9vDM4m3AOLJh2V1ojQP7VavwSLfxmnO2xVJ2E+inabABRdcCYLakvCyrTTaIVcCJUdi89D41k4qLjqgSS8TI7H2ZuPWMUlxfcYgcx8H22TLUdipdzm7fU/+vSuhE7feONKR4YlPum6J6u1heT5BjY1Q2rJZAqC2sjyrrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIoE/htBsA6fTejMxQzuVVxCxAW9gdkskMDSoebDosA=;
 b=fAHO1kuiAM5TcMJZjnnmI59pkezYkFzxS00Vmogo6AmuSKaR7OmcAUSVC6JtEPFhnUcVfv5azRdrdKE8ah7mRiFJrb4i1NXrFMp/7xqO1MpLFVIHGUW7ndFfi3ZWIzJ2sc4pyBDhFfg7y6gwSKmzHQGggjJaMe4p4uxFDcuC4YosdpfjFd31UAlLfCi+ZAmGGKApiFlZnPUk/XdSHBvq6qJMKph3u2cVw/sazwKTimd2donP0CkdzEvXp7dQkvFQkg+VKxmkOm2n2Gd6zOOLWHOeSnLXlDxwMZkSHzytD9X1NQ19fyc6ZA24N2zX8fY2EIoeSc3Z3t0RVUVfervfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIoE/htBsA6fTejMxQzuVVxCxAW9gdkskMDSoebDosA=;
 b=t2BJQ+jp3UbsAIdVkxsanofpxZvNfHmRtYXKbYl8agCs45MBHr074B4P5ZBSxHp4eMEacePIJ06Q3UlTo+spi7K4mU0O1Og/J3AcHCrfQvLbJhS5qbsnFy8eVfzYLu1adYxSu3x66jHG0DpB66hDq4caS1xPCN6NjOiVo39pmEU=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6658.namprd04.prod.outlook.com (2603:10b6:a03:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 10:14:40 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 10:14:40 +0000
Date: Wed, 16 Sep 2020 18:10:17 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v15 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1600239656.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 10:14:39 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf9ec16-c83d-44d2-2a92-08d85a2952d8
X-MS-TrafficTypeDiagnostic: BY5PR04MB6658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB665837005CF8878F6A1AB178C7210@BY5PR04MB6658.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/0ZSZUJCWK7kOFlByYQPyCwCiF1SvYO7v8MUJPDFQ/P8kF92j9BSX79y/CyAWn8WX7aEc7a1zBkuclN980SW4gYwl6bh1u/qMNyvzO/VY1iH28v6SDKB1C59fXwsdM1d0yKipNiglmQFc4zOGA2g9QL2dOmcD1x/BAAGVZTS7Vlf1BAWFuw7KJOc/wPOvkYg/qi1iCrLhcfDE5+3jGcjPqBww7MDFucioIctOic7h0D1k5IluG7wXqd8w9n0FKoZsvNZNtgfLNb1drooAGkZG3fbO1N+WAiX3Q2Vhno52NCo9eoEFIcFUvg9uUOMhzx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(396003)(376002)(366004)(346002)(8676002)(52116002)(110136005)(54906003)(2906002)(7416002)(36756003)(66946007)(66556008)(5660300002)(66476007)(83380400001)(2616005)(107886003)(86362001)(16526019)(4326008)(478600001)(26005)(316002)(6486002)(186003)(6666004)(6496006)(8936002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Iu2pBydSWHNMdR/vapBE8cAmin8B/ihFeCkWDFqoEG7YLk6vTJV9O3ADzlVAIU5Mz/DWysk5AoE530+KLcv3cYEkJcywaQf0PRAYI/PSSonq37kODW32h7nWQt4OLycskQVKCLiwNKb9wgaCKg9dKWaCrco+19nGZsySXv/xBDljhiaBjeF6+5M+U5RmcwNnctmNAO3mtmbeEvq2kF+Mxu44cD/CxHybhTVgGhEnTceO29f3wy7LcmRNNe/aPvSFDgEeQsNe5xI48S0nZjcGEsQuFQ/vRcBx7mKonesM8FtW08+y6sgF4YuiflGSC2IOVU92+fL/wK/HnXd/K8D2/jEJbXV0SEBTGX2yG52mcEeETioo5ghNQQRwM6JGXNHWJBBfYorxDi1U3y3Aos5vPYI931d8HTdpolKcESEUv0p6F28x9RnOg3iEvCwjaFTyGXcEQy1vG5RDHml+LWPWJ+IhIJq+uh1WqCpShc+w28Gh0KTsUxSbdkZL45P6TUqd+aZWnlfqf7JDMFBvnezYe9z5jdeCwpiKmv/T2xZCjYDjFdRV0KfONdsrBTYyKGNRcS3UByAidLpDtJ29yAC1ZSru5j0vYD25JlhJ9k8Ok6Fy39XIeRkWNKENRG1l90s9ap/6O86ePIg4zCOYZALzSg==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf9ec16-c83d-44d2-2a92-08d85a2952d8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 10:14:40.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5TkNx/7fuG99WxeHQm8txwKPU3M8RPwqtySB9hBLjLb8/rDObT/+PH7HPDCodRlB53RLrH31jgLmZQpthkajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6658
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v15 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v15: Fix comments from Sam and Hsin-Yi Wang
 - Remove connector
 - Allocate memory for edid at ".get_edid()"

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
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1848 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  390 +++++
 5 files changed, 2343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
