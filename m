Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420F270BF1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A656E1A7;
	Sat, 19 Sep 2020 08:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183F96ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:09:48 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IC8qNJ006995; Fri, 18 Sep 2020 05:09:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=UCrGQCOZ7r727CCS/8sSJu6/bKLPmfkuGWkbW0kLhSQ=;
 b=KF7fsbnl8nMdNxgrkctaxxtW2ty5UctMmMow7pgm/hyIaLxcbbyU5xjZ50j0H+/cQ9+L
 XqMsu25Oc2wzeJmWkZ7tN0gjD4aG4J56ZxJDYE1ocbiONjmUK49oNz84DMHG3CImckyR
 iPGTQknfHsi6fqEMJl7gIEUTPdW+zY73H/JjCrWjwTcqjgja7dfge0cZjv/BCZ4Nvui7
 J6/HywXoBx+1L3l5KCbbl+Djh4RYVv5tESi+kKjSnabkgknY8q4gaeFuS/qEixVkbEK8
 1oM4e4Cay/NKJ8H5q/PmybqlOOkMxECqFHwKhPQxbKwVf7SXvBAY/vktazO5HVrChU3R tA== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33k5nk3ym5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 05:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXDGCC5HBfmeiGOoPDdpV6x1hB+qs6YunIxUi/5pOl1rUGL/TMO7ffbY59usTIyjrBFRURv0GainP1RSXq6rJVjNB5JmJiAPrUTspbV/nKssIdskFGmwOATp7Vt5ANyCQgNYKLb2LwVIUNIWs7Kq1FNLuud0FfFR8Fjyvl4/QVZ8Lp2SG5FgdLfIDsAlgHuHtucK5diLLj+ftAZJmTcAPxiwxF+1rXmcqo+mxZajViV6J+EetNunkvK5Uj6dq8MckKsC6FeFnuUWOyn3Tr6ILisMeCO5b6mW0I15dFExxJjVYlDnvu84wS+EDkwGpcMr4xilaA5BamwpRFK1T8fgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCrGQCOZ7r727CCS/8sSJu6/bKLPmfkuGWkbW0kLhSQ=;
 b=I+OCS0cyjnzGFwckiUF9b6Fw8cCuI6E7fmbektqG7Hk57GeDxE8ZanzkkBmED3W8Ly5e2VM528lHwmNs67USD1DRYW/fRm86w4LwcfgMrsX0xc4PjYarAtlC9NnOitX3gYcCPkV2NRoTLwVqO9dNC30dw+verJ5L8ETBeL/deDzCbO7QjtohdViFM5MHLwtY8F1RAQ/77vk0M3NWBPszcbFIvVM3GRtBXGk/Ub8x9eay6ZEPI2MlEIahx1OP+AvmAlf6QpI2zVjXGSybR8JNsqh5442EykPLE4UDF8UZhKpG1AzFhe5OoHDyF4Pdc5eJZpoFk2dMbReBWyudrLafBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCrGQCOZ7r727CCS/8sSJu6/bKLPmfkuGWkbW0kLhSQ=;
 b=hZddEBqG+29tMV290lT1lqL3Cbdok+/OLfLhixF4U4QmP23v/aa5Mv50MtUpcYNXI29xo9FYTiCGce/RPHnkwATw7iXE93c8jP1A3tI4p7FvgVkWgz4Pk28qIKyf+TuFnt4x5rq69X02hfMKzl0nCotVUNn5WFhvE/H6Y+QctSI=
Received: from BN1PR10CA0021.namprd10.prod.outlook.com (2603:10b6:408:e0::26)
 by MN2PR07MB7216.namprd07.prod.outlook.com (2603:10b6:208:1d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 12:09:33 +0000
Received: from BN8NAM12FT050.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::3f) by BN1PR10CA0021.outlook.office365.com
 (2603:10b6:408:e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17 via Frontend
 Transport; Fri, 18 Sep 2020 12:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT050.mail.protection.outlook.com (10.13.182.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.6 via Frontend Transport; Fri, 18 Sep 2020 12:09:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 08IC9RGs092496
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 05:09:30 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 18 Sep 2020 14:09:26 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 18 Sep 2020 14:09:26 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08IC9QCq023791;
 Fri, 18 Sep 2020 14:09:26 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08IC9NhD023790;
 Fri, 18 Sep 2020 14:09:23 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 0/3] drm: Add support for Cadence MHDP8546 DPI/DP bridge
 and J721E wrapper.
Date: Fri, 18 Sep 2020 14:09:20 +0200
Message-ID: <1600430963-23753-1-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 003b76fd-efc7-4824-55b3-08d85bcbb38a
X-MS-TrafficTypeDiagnostic: MN2PR07MB7216:
X-Microsoft-Antispam-PRVS: <MN2PR07MB72166FAAE709AFD684C2F26AC53F0@MN2PR07MB7216.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cfPqRYUqBHGm7mDG23kwsp9y6zb2+sYrpHPk14i5UrpLTBDJK2nVD4+rOPxrhpOUnJWjZG6wxesGFaxwg80NnWAMFGUdZtuUYSxwtaTOt+3WmPQfglx6+hd8KYIh1uRX+1exdOjQjxa0gR8iyLsiLBIk8aqZa80WOL0IQ/WrL5rQTpr9mVbFycNjsEu7kgqpuvK+q7NhBzg+OzFcz4xJ2ts3y7K/CtAqB9kr/tFZJ76x/59ZTSzU1ZutufD/eRHudlTnTdX7dklF9ejqyZlFu9uMqVUu8anQ0AeFMkBYFOPBpkYOXV9vL2mXlMiGcIVKNBrgc5gB1gdxgxoOv++gGful+oxqpyzdQp6jLvI0INxYyE7L4ZR9lnC2kh4CJfoJLc59xQWzyultQ95nuo6zASxw3etP4ncwYCXRqrW7hi+Hsy9Chh1FJAZVYtdPi17y13j4vgvLviJ1RZhjISdpyYNOC4dDa9geFR2eqYM6/3+Z4wYsSunCclKmyCC2CfZJYPURhiSIJplJp8SPOcAQEW+s0fzoC+0d1wWXalpJRz18jB32xW79LQaIYa+XhTEwjrFntF+OlgJ3qqI5lQE9IGEnU4Wg99aI+DfSvgkieY=
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36092001)(46966005)(186003)(26005)(316002)(426003)(336012)(4326008)(86362001)(478600001)(2616005)(42186006)(8936002)(966005)(36906005)(110136005)(70586007)(82310400003)(7416002)(36756003)(54906003)(2906002)(356005)(5660300002)(70206006)(83380400001)(81166007)(8676002)(82740400003)(47076004)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 12:09:32.0062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003b76fd-efc7-4824-55b3-08d85bcbb38a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT050.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB7216
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180101
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
 jsarha@ti.com, vkoul@kernel.org, tomi.valkeinen@ti.com, sjakhade@cadence.com,
 nikhil.nd@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds new DRM bridge driver for Cadence MHDP8546 DPI/DP
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
1. 0001-dt-bindings-drm-bridge-Document-Cadence-MHDP8546.patch
Documents the bindings in yaml format.
2. 0002-drm-bridge-Add-support-for-Cadence-MHDP8546-DPI-.patch
This patch adds new DRM bridge driver for Cadence MHDP Display Port.
The patch implements support for single stream transport mode.
3. 0003-drm-bridge-cdns-mhdp8546-Add-TI-J721E-wrapper.patch
Adds Texas Instruments (TI) j721e wrapper for MHDP. The wrapper configures
MHDP clocks and muxes as required by SoC.

This patch series is dependent on PHY patch series [1] to add new PHY
attribute max_link_rate and to set attributes in Cadence Torrent PHY
driver. Please pull tag phy-attrs-5.10 for phy tree.

[1] https://lkml.org/lkml/2020/9/11/54

Version History:

v11:

In 1/3
- Add phy-names, power-domains and interrupts properties.

In 2/3
- No change

In 3/3
- No change

v10:

In 1/3
- No change

In 2/3
- Simplify TU, VS calculations with fixed TU size of 64.
- Shift TU, VS calculations to atomic_enable() and remove
  cdns_mhdp_validate_mode_params() function.
- Add bandwidth check in atomic_enable() before enabling mode.
- Read PHY attributes manually without using API.
- Fix other minor comments and issues for v9 patches.
- Add Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In 3/3
- No change

v9:

In 1/3
- Rename bindings file to cdns,mhdp8546.yaml.
- Minor changes replacing mhdp with mhdp8546 to include IP part number.
- Add 4 input ports and one output port supporting MST for DP bridge.

In 2/3
- Add driver files in cadence folder under drm/bridge.
- Rename driver files to include part number mhdp8546.
- Remove link training calls from atomic_check.
- Support DRM_BRIDGE_OP_HPD with hpd_enable, hpd_disable callbacks.
- Remove unnecessary fw states.
- Fix other review comments for v8 patches.

In 3/3
- Add input_bus_flags specific for J721E in drm_bridge_timings.
- Fix other review comments for v8 patches.

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
  drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge
  drm: bridge: cdns-mhdp8546: Add TI J721E wrapper

Yuti Amonkar (1):
  dt-bindings: drm/bridge: Document Cadence MHDP8546 bridge bindings

 .../display/bridge/cdns,mhdp8546.yaml         |  169 ++
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   24 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    4 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 2532 +++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  400 +++
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   78 +
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   19 +
 9 files changed, 3229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/cadence/Makefile
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
