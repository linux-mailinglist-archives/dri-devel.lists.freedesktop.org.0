Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945A23E7E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968DE6E979;
	Fri,  7 Aug 2020 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38E76E369
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 11:35:00 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076BXLfH023898; Thu, 6 Aug 2020 04:34:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=/f7HkrmytE/6nI50+hg3kNfljvxjETqdByqS2nW53Uk=;
 b=Sv0VRya19mjajANMMfr3etif37eCMsmpvAm5TDuQh2LTJW4H8TmaWMrtGTlyWteOR3Nt
 f8qr0IaDI15cMoLTbu/GHL2IIPtjSaFohTCeOuUUvC/FLThu42jAONCJCk2ksluw9LR+
 kP+9I5/TioEZ85i557ExC2XS5MhYBzreiAC5e7o06q/L6gjnFYP5/YUHiI+uSn846w27
 RtVbZ5mAR47MpoGgmyOhwBw0FP/0sGIQkv2l07ieEHAWQozk/UPXC1xWCaGdPWaVDcHa
 y27cl7NyD72XzGxG10Jr6aknUDuJ2zKqT7q9j57GTmWw1fcNb5+YGd92+z4OxbUx+Fxh dA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0014ca01.pphosted.com with ESMTP id 32nme0g6n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 04:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF0miTUYiyPO00Q5vrmTYiXZH2leqAYTaf5/zuFm+9Ts4oLXER76mmU+EYCVHfr+FT15XNntiX0bMkTrSV/xhvUtAvZk/tQUxV6CGGZ5M94Cka12np+AmfAL5g3frRclS83ABAJynMoxvshw920/5m2bFyDhranD2XR8xTRCEX1dGsqJCbl7FrneASFwx7gYN/I0wJpduLPzWGotA9OeMhPL6wj1cBArTFhoDLA+Qv2KEbba2SvvyAhoduwBePynmGySNaA3orOZgI/2rGlNf4ngTb4MT7l16V4quWfa04EHLRlBYFlQNu+sZYabU5jXpcx4soQJCdQIYtfjBna90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f7HkrmytE/6nI50+hg3kNfljvxjETqdByqS2nW53Uk=;
 b=LqMV38rhTY1YQv5thFOXKPisKUP5pO17SrpRJOIygKCLOeqqc0McKnwCt+cK2RhaJ80K/EBrIycqJ4xViMIHiADrSP+gwmuyOkE210wqAp38+2D1waSz+nP/x5BqZJh5Ir5Dk+W04osguxNBlgzYmWZxl+ndAucVnLJeofOnRGpKcSWd9dyY7DLhVTqjMoY/IgndVNKrh0MTyyFnVBD27QtRhAwQXSPTi5QD/e3xxcwZYEEvrIeLWTJQgY3230S4MR3QhNFJdozYeti9c1qGTLefOU2V8Yoz/X1BD0DlT+nNsZssVBbxXvRuVSNlJF4fQtR/D7XgLrKX+Re66OToSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=samsung.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f7HkrmytE/6nI50+hg3kNfljvxjETqdByqS2nW53Uk=;
 b=ryoDGU7SiFmH4QUaSkCDsdza9w8wXo0wHZTdAoMbj9GSVl4Xi6e/zyKXkTRQZSYANb0U0oz81g7oeXYIrP/RBDVIQnWwSAPziM1oiQD+S0E0HhfOIIKtSOo3jsQhpOZC4tfJJcPUvPIMIexPYJYGXrqdd23DBS3vYdxy5GCl1aY=
Received: from MWHPR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:301:4a::16) by BLAPR07MB7796.namprd07.prod.outlook.com
 (2603:10b6:208:29e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 11:34:49 +0000
Received: from MW2NAM12FT011.eop-nam12.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::44) by MWHPR1201CA0006.outlook.office365.com
 (2603:10b6:301:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18 via Frontend
 Transport; Thu, 6 Aug 2020 11:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT011.mail.protection.outlook.com (10.13.180.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.10 via Frontend Transport; Thu, 6 Aug 2020 11:34:47 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 076BYZWn083124
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 04:34:46 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 076BYZs4008200;
 Thu, 6 Aug 2020 13:34:35 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 076BYWq2008184;
 Thu, 6 Aug 2020 13:34:32 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Thu, 6 Aug 2020 13:34:29 +0200
Message-ID: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 292d4185-c75c-487d-8221-08d839fcb91e
X-MS-TrafficTypeDiagnostic: BLAPR07MB7796:
X-Microsoft-Antispam-PRVS: <BLAPR07MB779667B08B9A1394417636F7C5480@BLAPR07MB7796.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAsntKppxI1fOqJahNZ/xSh80L1VvFgivRfq8793cuA6g1pEeEW1qk1aoQJFHtBXEtc+G/keT/3L09VtmwTSsxzhmc56YqMfZX/gKDKuSK2aqV6wigPqFSGeyTjfVHq/qWc+t6CEGtRkghXLMM7ekLL1efcDE61X9VRghpUOP3CZ2vXYAfIbUyXzuDUV4l0nelqbfMDizEHjbXyAV/K4EojhjoFtVyXPs9Scm4GMtdg/9UWP+RZyJrtqii8gDRvbnxqoBhPRCb/Ot+LT1yaMoraydnhTXuivHqVT4qjGc0VOEuoamx6BcuqrBjx2cribjA2ItkwhaVf8zbL30u9hvaNl9M6WkQQY2EXlF05u3Wm90X+eRasA/bEwq8oErsLt3XWP9K4Bycfsnx1GlXVStdh7h8Z0S1JJcRcNvkBF6fLdZl5gwwRdYIIKr6pOd1p31GWYKKVz9WxBEKkB3TWgQdnK50nSu7ftqKYKotCAFEO2iN6ow6E3cJ3eiV9RgdZ9blhNaWIESOHrJelNeN7tf0cIoqJy/zevlT5vR/4oFSdgymi0zX2x3pNhO54zrpsB
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(36092001)(46966005)(83380400001)(26005)(36906005)(316002)(54906003)(4326008)(70206006)(2616005)(186003)(36756003)(70586007)(86362001)(6666004)(42186006)(110136005)(47076004)(82740400003)(966005)(356005)(478600001)(336012)(426003)(82310400002)(8676002)(5660300002)(7416002)(81166007)(8936002)(2906002)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 11:34:47.2621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292d4185-c75c-487d-8221-08d839fcb91e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT011.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR07MB7796
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060084
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, nsekhar@ti.com,
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds new DRM bridge driver for Cadence MHDP DPI/DP
bridge. The Cadence Display Port IP is also referred as MHDP (Mobile High
Definition Link, High-Definition Multimedia Interface, Display Port).
Cadence Display Port complies with VESA DisplayPort (DP) and embedded
Display Port (eDP) standards.

The MHDP bridge driver currently implements Single Stream Transport (SST)
mode. It also adds Texas Instruments j721e SoC specific wrapper and adds
the device tree bindings in YAML format.

Some of the features that will be added later on include (but are not
limited to):
- Power Management (PM) support: We will implement the PM functions in
  next stage once there will be a stable driver in upstream
- Audio and MST support

The patch series has three patches in the below sequence:
1. 0001-dt-bindings-drm-bridge-Document-Cadence-MHDP-brid.patch
Documents the bindings in yaml format.
2. 0002-drm-bridge-Add-support-for-Cadence-MHDP-DPI-DP-br.patch
This patch adds new DRM bridge driver for Cadence MHDP Display Port.
The patch implements support for single stream transport mode.
3. 0003-drm-bridge-cdns-mhdp-Add-j721e-wrapper.patch
Adds Texas Instruments (TI) j721e wrapper for MHDP. The wrapper configures
MHDP clocks and muxes as required by SoC.

This patch series is dependent on PHY patch series [1] to add new PHY APIs
to get/set PHY attributes which is under review and not merged yet.

[1] https://lkml.org/lkml/2020/7/17/158

Version History:

v8:

In 1/3
- Fix error reported by dt_binding_check
- Fix indent in the example
- Fix other comments given for v7 patches.

In 2/3:
- Implement bridge connector operations .get_edid() and .detect().
- Make connector creation optional based on DRM_BRIDGE_ATTACH_NO_CONNECTOR
  flag.
- Fix other comments given for v7 patches.

In 3/3
- Fix comments given for v7 patches.

v7:

In 1/3
- No change

In 2/3
- Switch to atomic versions of bridge operations
- Implement atomic_check() handler to perform all validation checks
- Add struct cdns_mhdp_bridge_state with subclassed bridge state
- Use PHY API[1] to get PHY attributes instead of reading from PHY DT node
- Updated HPD handling and link configuration in IRQ handler
- Add "link_mutex" protecting the access to all the link parameters
- Add support to check and print FW version information
- Add separate function to initialize host parameters to simplify probe
- Use waitqueue instead of manual loop in cdns_mhdp_remove
- Add forward declarations and header files in cdns-mhdp-core.h file
- Use bool instead of single bit values in struct cdns_mhdp_device
- Fix for other minor comments given for v6 patches

In 3/3
- Use of_device_is_compatible() to set compatible string specific values
- Move mhdp_ti_j721e_ops structure to cdns-mhdp-j721e.c
- Remove duplicate Copyright message
- Remove CONFIG_DRM_CDNS_MHDP_J721E check
- Add Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

v6:
- Added minor fixes in YAML file.
- Added Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  to the YAML patch.
- Removed all the FIXME comments which are invalid in drm driver.
- Reduced the mailbox timeout from 5s to 2s.
- Added Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
  to the 003-drm-mhdp-add-j721e-wrapper patch.
- Added Signed-off all the module authors.
- Fixed the compiler error Reported-by: kbuild test robot <lkp@intel.com>.

v5:
- Added Signed-off-by: Jyri Sarha <jsarha@ti.com> tag to
  the code patches.

v4:
- Added SPDX dual license tag to YAML bindings.
- Corrected indentation of the child node properties.
- Removed the maxItems in the conditional statement.
- Add Reviewed-by: Rob Herring <robh@kernel.org> tag to the
  Document Cadence MHDP bridge bindings patch.
- Renamed the DRM driver executable name from mhdp8546 to cdns-mhdp in
  Makefile.
- Renamed the DRM driver and header file from cdns-mhdp to cdns-mhdp-core.

v3:
- Added if / then clause to validate that the reg length is proper
  based on the value of the compatible property.
- Updated phy property description in YAML to a generic one.
- Renamed num_lanes and max_bit_rate property strings to cdns,num-lanes
  and cdns,max-bit-rate.

v2:
- Use enum in compatible property of YAML file.
- Add reg-names property to YAML file
- Add minItems and maxItems to reg property in YAML.
- Remove cdns_mhdp_link_probe function to remove
  duplication of reading dpcd capabilities.

Swapnil Jakhade (2):
  drm: bridge: Add support for Cadence MHDP DPI/DP bridge
  drm: bridge: cdns-mhdp: Add j721e wrapper

Yuti Amonkar (1):
  dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings

 .../bindings/display/bridge/cdns,mhdp.yaml    |  139 +
 drivers/gpu/drm/bridge/Kconfig                |   24 +
 drivers/gpu/drm/bridge/Makefile               |    4 +
 drivers/gpu/drm/bridge/cdns-mhdp-core.c       | 2562 +++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h       |  397 +++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c      |   72 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h      |   19 +
 7 files changed, 3217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
