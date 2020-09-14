Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF7B269F38
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A796E85A;
	Tue, 15 Sep 2020 07:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DDB6E492
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 12:49:08 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08ECgI2o009967; Mon, 14 Sep 2020 05:48:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=yvyY6iXcjzPNez8bL4etjaD6r4qp4xQoUmh7oGH82eo=;
 b=GnetfPcC2VFRMKKzZIy/0Vpy+oeMI+289rIWhKKPyIOY7WmRPx/Dq71yJcB2WuP7pDQh
 cuM5M2b35TkDb0+YaQN3NnB4KCvCr7nF/fhD9Tfm8pjJgLXunZMoueqHk7HDrz4Pd6a9
 TKSwx252O0C+jb48noxmrsV89InHFoGxDqGAoEIOE75OpH/aFTjYnoQEsIstsRdoF6ib
 /HRD9mtnLJAQupL4Be/FkLZSnkFox4EfJXSIkCeREEfT3AhkU+U6ctGmMvgxucowI86e
 h3DrwdIavDaQdT0JZEBpTQVQI0hh7jEBpP1jOtrCTdSMi6eSamnjhi3E8h7kWYHgcKxI pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0014ca01.pphosted.com with ESMTP id 33gtvvnpun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 05:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpWYNKcu9rvOCbk0uiB/Lyfkrtre0XsrIfEHioH+rJyyoho3eYXMvD8UxL+78/299imtNXS+JJU00WDyE0W9GSKWFXNIQYhVHvcCelvh6+js/KikOoNHFsB5p4DSRihW+ko6wkn/nKKa9N4Vam09Q93nGjcuPmGmwhHP61EBT7affE2dF8yBFT85HAF+apfv3iW2BswBJo3maD985UXxMoFXdyyno0CdnGoYAoSa/sysVh8b1AnbdoG2oeYEV8hkGseOV/jZfLY2uPvEFQg8cLzt2AfdMDDvj6Pe+FdXFrqWGrK47u6Lhu21H+L7p6Od5TLU2qKA2WJhn9BfkX7ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvyY6iXcjzPNez8bL4etjaD6r4qp4xQoUmh7oGH82eo=;
 b=L1csyVhPrInzzUob6eb14frxw2D+N4bhnchtFhHHVTtUJzL/EhmXd3nU2LcZXtYqCW+YFADIjVOSV+W8IUfDZnqPsQEBBCiqHH38X1ISFDVcukGl21nd5LwhsSZs/P2yzoQFHYFPgE5Z31L+CLeWrWxUtVBP3Vx54cloD2gRoZ13q7VvwLj0slyiH3qo1r0SSF6b7rofAOK8sa9Af6Ocvhy439/h/LG0AaueUP7dfG+x8lm/JNGFcNQk9EeuJo/SCo+TQKWVmJ1Q03U/dDLPWSfbpsLCNjW6hkrjH0qbWlBsaziPTxJf9k+6ZUQ2eaZ+1ISQI+YScRe8VzZyhu0VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvyY6iXcjzPNez8bL4etjaD6r4qp4xQoUmh7oGH82eo=;
 b=qClqEAuVoAKyKHvFx0F32QReAJozpMW2d+9APwLdpGlttvHmd7+1jLh4F5AjHmCtsimc1BuHknhIKwF9KvANlBs3IobqD3UDfB8898jFLcAUa0hFelnm1haZHf3gep4ZJFd26R2LLTxzJs8YWkqamyp5PRJPffi/KuuP8BdLh+8=
Received: from DM5PR18CA0074.namprd18.prod.outlook.com (2603:10b6:3:3::12) by
 MN2PR07MB6718.namprd07.prod.outlook.com (2603:10b6:208:165::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 12:48:46 +0000
Received: from DM6NAM12FT017.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::bd) by DM5PR18CA0074.outlook.office365.com
 (2603:10b6:3:3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 12:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT017.mail.protection.outlook.com (10.13.178.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 12:48:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 08ECmd4j017910
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 14 Sep 2020 05:48:46 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 14 Sep 2020 14:48:37 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 14 Sep 2020 14:48:37 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08ECmbJc015767;
 Mon, 14 Sep 2020 14:48:37 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08ECmZCa015766;
 Mon, 14 Sep 2020 14:48:35 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/3] drm: Add support for Cadence MHDP8546 DPI/DP bridge
 and J721E wrapper.
Date: Mon, 14 Sep 2020 14:48:32 +0200
Message-ID: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ddc4e97-7c67-4500-abfc-08d858ac851a
X-MS-TrafficTypeDiagnostic: MN2PR07MB6718:
X-Microsoft-Antispam-PRVS: <MN2PR07MB67184AF852BEDC92AA30B757C5230@MN2PR07MB6718.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCctxip3JxFyDTddVX/Ru1Uhf/sGKeS/VOAuisuSyBVbTinvjl5wi+rchFwTHE4eRNGyLSoQBMVI37QBTowH+BnGm1jTY8xvgCUVmtH42dgxr0ffaAT5uMS07dcmsTn8gMEDK9VLL2oVZI+87xoyj3FE17Y9ss6ZjstSOpcoELjGGord5vFeedConxNFX+t3K6wy/yp3Iib2tLarWyGzrEnJWO2WauE569Utqf4ZHUqS7T+ig50m0GEtHVAj7dOs/A92jfDWYHsUeKjk8IgKrdJv7tkogDRNN9oYFxRBjburEoEkl+5jjscryuDQJvczH4FvIgR+qlwXT/5Xq7LJ4FomWTGagGqbkz61HYS+JgKKd1K3HbvGEKbGT7EmZb5IoMFfG1ChMcPkFlG/kJMAr4IpC6/0AWcVlDxtHt/RktOcuBwP//Ey7521SQedjf14yLGnvy44yKzz/xWrIC7WL6gnQoui4dzlQcTd1jygA2s8Od9uwRnEXwursXuntT7h2rr2o2p4usAc+kF1rctJB5fv/gkdB8cC2fU6E8xk1imZ2QZ5J+XTIz7kK0Wn2rGJ
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36092001)(46966005)(186003)(82740400003)(36906005)(316002)(42186006)(8936002)(336012)(7636003)(478600001)(54906003)(110136005)(6666004)(426003)(86362001)(5660300002)(7416002)(4326008)(356005)(8676002)(2906002)(36756003)(47076004)(83380400001)(2616005)(966005)(26005)(70586007)(70206006)(82310400003)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 12:48:46.2482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddc4e97-7c67-4500-abfc-08d858ac851a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT017.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6718
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_03:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140103
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
driver which is under review and not merged yet.

[1] https://lkml.org/lkml/2020/9/11/54

Version History:

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

 .../display/bridge/cdns,mhdp8546.yaml         |  154 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   24 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    4 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 2532 +++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  400 +++
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   78 +
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   19 +
 9 files changed, 3214 insertions(+)
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
