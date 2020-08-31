Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DAF257639
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A2789DC2;
	Mon, 31 Aug 2020 09:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936E589CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:24:02 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07V88aXk007896; Mon, 31 Aug 2020 01:23:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=iqrqejZcsb4IIAFXMa3I3cmYM0lvH4uUcWFmNtw8gsk=;
 b=uIXjCw1qQXWB363PfexLpU1EikMSP2Q3N3UsgohTu8Aor+n8Cl4YVgTH84Ww6A6gZCRe
 rZK4kY9R2bg2NMCFXaINUiZfCfRQtEwYF3SaceJ1ezRdGU2dd6wDM7/awo0i5pOb9q9S
 k0PN+VaEOdSb4/NSJL46HSoqIaqjzofola+o1dBPAYSgHxMjkIYb+OJXa2eDhqEmEN3I
 yhCNjCWM5fWn818aGrWKfuU9xuOxZv2Fx6eXC/yK7MTmUyd+XKXNW/U6FLZSG4sR9at9
 Xs3knMLeh7WLyNQ9KE9PpWL/Y3zjI+BsOul8hGh1ZTGi+HeCIVPZVj99Rzy2GVMak3S2 5w== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2055.outbound.protection.outlook.com [104.47.37.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 337kjxe1rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 01:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRPWaE3qlspIV1FdXxXtAwJx9zJe8Fsusofd0PXxRCM/OFZvLU6W9Q3f64eeY69yZPPOozxGx2wKnXkjJJleCkL+uGy2FYdzD6mzzzIgFpH3W+FWyl1J1k5F35TQq21CQa2BAMIKOhFMF3qow0SVEP4yBQ3uAhhYXVWNXIJmma2wfEz2qaYchplHX391CBhSSwpqwktQloPAqO+7GJZoHi0qMcHBLEI3ALyPjnVI2aKcf9pAoQpEGbjXAt3rbRXt4ijD8IggKO6I29nVaVRQLHotkbTe+MwnqG3eMS/x7dfdALePtYqUuRQPB/naLdL5w3r5bFvJQpaNi1tKfGa5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqrqejZcsb4IIAFXMa3I3cmYM0lvH4uUcWFmNtw8gsk=;
 b=YmL/GPjAZXUAf4yfDhWP6od3lhnLouSB8n8kMWmIbNxKY/3cP4wHI/Vqi1GLrWt6/AvhhA/gU+eTMoE6+l/oVLfoOO7KQsg1ZUbDOpZJmb4VioZJv/BgROsXOQ+wLmugmAHXjhI5EhOlSi18M8TH0d2qImIQDV5COWaYJfDXTLl4TE26SqPlqD6LIrPqD4x9+woSaZbHGPkZHinRCP4knNXzrq2GF2Z8vZzKOnROVmwkxnjsTeQD9YbMdNM8czrOZueNC2jWXaMv3ng2fl+/Ff5H8ObCh7Ft5F4y9LQr70axZ3j+CA/1CuYiVY+uIQj+CmvynMqHAERtyJ8k4wtHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqrqejZcsb4IIAFXMa3I3cmYM0lvH4uUcWFmNtw8gsk=;
 b=P8GcWW/R2JwjzD1xpLx8We+H6mjwLK/lT/HlFjqV2Y3x6Sokb0Oh7vK1nQ0zMRe6uA00rqO7QLdaGloQxs0FhYjqWWka1HDwi01udai1f2joizkcIhglACQ/M2yzpbWRBA1gmyngDtILQLcbEIrMGtgGzxd4TWmefDpmXY5KCkk=
Received: from DM3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:0:50::30) by
 BN7PR07MB5332.namprd07.prod.outlook.com (2603:10b6:408:2e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.25; Mon, 31 Aug 2020 08:23:47 +0000
Received: from DM6NAM12FT058.eop-nam12.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::8d) by DM3PR03CA0020.outlook.office365.com
 (2603:10b6:0:50::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 08:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT058.mail.protection.outlook.com (10.13.179.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.7 via Frontend Transport; Mon, 31 Aug 2020 08:23:47 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 07V8NeKR010126
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 31 Aug 2020 04:23:42 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 07V8Nd4E010287;
 Mon, 31 Aug 2020 10:23:39 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 07V8NZQl010265;
 Mon, 31 Aug 2020 10:23:35 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/3] drm: Add support for Cadence MHDP8546 DPI/DP bridge
 and J721E wrapper.
Date: Mon, 31 Aug 2020 10:23:32 +0200
Message-ID: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a294ea54-3db3-4ed0-e7a0-08d84d872e9d
X-MS-TrafficTypeDiagnostic: BN7PR07MB5332:
X-Microsoft-Antispam-PRVS: <BN7PR07MB533257EF33F1F3738FAC1E56C5510@BN7PR07MB5332.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fALMRMR0t5E/UbYH71qyXH5Df5rnYSOZX9PwS2PtdmmdPj14K11oCmpLEJrNyajQ+Fhg3N9LyyQYEIFd9DK5zqs7s1dW09nrfsB3idUCwrKmt2n/bIAPbd72Yn2pPoBN81P/k7ta9eRAGREpHxHO5LW9GtsEWJqRCRXeSn2y5/SiXsxG+WsxUc6DVTJI8Un4w7OHU9ZMkOBOtvaQQ45gapM3Q/0QxGYYTQ04v4OrnQIIlCfYpsIWg0y5eTdspuJG8n4UoYPaX29aPTWvyk5qHmkD0n7QGow4bN4SWkFYqMJUtEmedgCoUVkcpni36x09Q03emVyTfh2tjgD8DuAkqOyjzAqHfLsB5v67Z7YNBnyj7SCF8PGaT5equWhmvKQFrMr9TbxJV08veJa+HHt6GPLOtVVtQIxd0jlKubRA+1CFxdgpqCVwJJjQbaw2t+YGhNbvJnmp1MUDHksK+NPeACQtSEve4X7kOdvCiI9jeds/eG2b2svNAmzNi90yu7E813xYcwnYzbM/jPTbuqeXCJ43GHBnrBySK9zzh6BOT1z9MuN1RuQtJIQhik0NNzE5
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36092001)(46966005)(82310400002)(86362001)(36756003)(8676002)(966005)(47076004)(2616005)(8936002)(7416002)(336012)(478600001)(42186006)(26005)(70206006)(110136005)(81166007)(316002)(54906003)(2906002)(186003)(70586007)(5660300002)(356005)(6666004)(82740400003)(426003)(4326008)(83380400001)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 08:23:47.0239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a294ea54-3db3-4ed0-e7a0-08d84d872e9d
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT058.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB5332
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_01:2020-08-28,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310050
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com, nikhil.nd@ti.com
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
1. 0001-dt-bindings-drm-bridge-Document-Cadence-MHDP8546-.patch
Documents the bindings in yaml format.
2. 0002-drm-bridge-Add-support-for-Cadence-MHDP8546-DPI-D.patch
This patch adds new DRM bridge driver for Cadence MHDP Display Port.
The patch implements support for single stream transport mode.
3. 0003-drm-bridge-cdns-mhdp8546-Add-TI-J721E-wrapper.patch
Adds Texas Instruments (TI) j721e wrapper for MHDP. The wrapper configures
MHDP clocks and muxes as required by SoC.

This patch series is dependent on PHY patch series [1] to add new PHY APIs
to get/set PHY attributes which is under review and not merged yet.

[1] https://lkml.org/lkml/2020/8/24/1586

Version History:

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

 .../display/bridge/cdns,mhdp8546.yaml         |  154 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   24 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    4 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 2558 +++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  403 +++
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   78 +
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   19 +
 9 files changed, 3243 insertions(+)
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
