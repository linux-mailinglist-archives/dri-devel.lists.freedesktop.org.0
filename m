Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0058015A339
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916DF6F480;
	Wed, 12 Feb 2020 08:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245A6E5D3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 04:27:17 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01C4PmmC028909; Tue, 11 Feb 2020 20:27:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=I4geVmil93wUJyOVTJT2LGg0ka0jvsvt7sfzH6Vfuuo=;
 b=Tci3kddIXrs+L6QNjqcN7mwu3EInpaQwIBmEjx2bfUT0melfES/E9cv67K3fjwTUt5D6
 CEVVZRY4lS+DDCu7BiEp0qnDqI0pd31BQpWZcPfvtwULmDJ6p/iYNx37ykR1oMf9BRA8
 uSJtyAcbBrRKz816EdCa+UxxxA1aVjzPF/xtj1jumk5jyo6jSJVjl9ueX4LWC9XQH62O
 p/+5XlYllU09rLC1UGTzCWMyqxxJpfFfOzUE59S7V1jO6BYQE349MGOlVNDc9QDFJyJr
 VLUTJeF02RiKI5PglqZBMxCY+NOOpmmToYYSOun7DwWqcAfQHFctjCAQX8t5GRbIfVqU ng== 
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2054.outbound.protection.outlook.com [104.47.45.54])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2y1u17mxns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 20:27:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tv2De1E+gTn5nNlVRRhiOfeYbsOvU+set6iaIy/TdJzFOW7H6ZWlwKG+APd6vdIhiIjSOyUdsLlxWVvb4pPWadTqvB5P059e0sdOrvV7cu0l/UnflccebC+Q2JO8+pK6CdwuUbqLx7aaQLLgnDkYdGNGoI/biBVi3TbAMQJBItOp90ec0zJ/mdAhEcfNLqjZdrTOF4si+NL7tb5e5osjGSKdBhlmYCBWeJqB+Tx9rxz1+5RQB1Zfkmts8Fb0dENYBCYDzVtu+xJfNhdyNYut/ISEELmtSBBHED/As8iDD9YdfFeWUHXsfyxUF+beT2Yd6bOBq9zT0nxC9UwPgHJ6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4geVmil93wUJyOVTJT2LGg0ka0jvsvt7sfzH6Vfuuo=;
 b=IrtQdskvf0snN7gRkV9kYN8vHUdhIR+s3HSAQhfzL6F4+lZttDphPt+N7//VjeBalcxBEN72gID7Xg/cUtPD6rrBSLLEzTNicV3JyTJvoN1hy3choIv7sm9jVEuyIHbGAEcEXmmFeWFYdZGuQOtKt3yUhl0NtgbPVsDY4hb+b3IeTgUhmWrue7tFH+f3BE/2kf7YTuuzwLbzK9+VAC5MnjyO/IKjLFKtpRNPZ6QRPrZtyvpRXbUGjRtpkDi88tEt8TJzVZwW+uWpLWwEeq2w28roIZVza7xKTxbJ/ab5FbnGdqlE++epNKq3krYWB+btFchz15pwX7zY8YlSkB4OIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4geVmil93wUJyOVTJT2LGg0ka0jvsvt7sfzH6Vfuuo=;
 b=ZeKH6BUhqUfV8L2Gv9Q+OO/67cC7AyHeVec3M0CzoUHpXMHGILobnMiJ2jf1T4zfZNlAsXxKvnRmkECVekbLBOTQ5uAxcTOLavx4bAP1atLRvUdgGDJjzaKAK8GDOzDu14to0Yt6h66MZC6opzP0hZsd7BJVSxOet0PWYqxPuJU=
Received: from BYAPR07CA0104.namprd07.prod.outlook.com (2603:10b6:a03:12b::45)
 by BY5PR07MB6643.namprd07.prod.outlook.com (2603:10b6:a03:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Wed, 12 Feb
 2020 04:27:01 +0000
Received: from MW2NAM12FT054.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::207) by BYAPR07CA0104.outlook.office365.com
 (2603:10b6:a03:12b::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via Frontend
 Transport; Wed, 12 Feb 2020 04:27:01 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT054.mail.protection.outlook.com (10.13.180.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.10 via Frontend Transport; Wed, 12 Feb 2020 04:27:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01C4Qnkb007965
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 11 Feb 2020 23:26:58 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01C4QmAf024545;
 Wed, 12 Feb 2020 05:26:48 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01C4QiMi024543;
 Wed, 12 Feb 2020 05:26:44 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v5 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Wed, 12 Feb 2020 05:26:41 +0100
Message-ID: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(36092001)(2616005)(86362001)(316002)(7416002)(8936002)(8676002)(5660300002)(426003)(70586007)(70206006)(2906002)(478600001)(26005)(4326008)(107886003)(19627235002)(42186006)(26826003)(81166006)(81156014)(6666004)(110136005)(356004)(966005)(54906003)(36756003)(186003)(336012)(921003)(2101003)(1121003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR07MB6643; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb2651f-3e1c-4e4b-b894-08d7af73ce06
X-MS-TrafficTypeDiagnostic: BY5PR07MB6643:
X-Microsoft-Antispam-PRVS: <BY5PR07MB6643AF35E31BD008747D23FCD21B0@BY5PR07MB6643.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0311124FA9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oy8V0hE6JsrMvpYCKBsK2jI9aHMlSEVpdeP3ISz1v6mm+bI7vd+cazUagyV/SEXyEd64SiQL2HoqM7Y8y8fRmtnQgRLmnCMa8EhpLJvZ/dcRL+dR7h3vt8ZnxSvpL7xRxjL7ejT+9AFf2gFVFLOwgD1wYrK2DYP6Wi3yBiMONZaCWcVvfv8a0wgO6loARrIqxds7QAXqjCrRrUcHtzmAP1dL7mFI2LgNgeXL08oqwb6H9F4uViME7hcisQDJ4D47T5T6n8Uc7jW3k2qb3/ZJahZab7wX9E/YEshQ8ZX+bI3iihmrEdWQiGuvhJ3Y4QLJ1Q9ASfAitUyorX9EFnWndkbbOBImee9ACE4uhiq9kphjN8F9Vm0LcbFU1Cu29ShNOj98lt1v2MmS7AcZkAHTS1EkDNbM/F6DuXrGFFynIGdhxQCNJ69RjDArI8yZWGAqRnJxDsAZXt7Z9GJrrqkz/AFdr8OSs7hy2SYJJ8wUFgDVj4cDUHXE4nXEGScvfx2UG+bM8UvOyQMyvxAcNNKmzWkXn9VCtFh5I1jMIMfvV7ydlRyaV9PgjogcA6C+DwZvee1wKgF9mVJT2Wt2jj4zpncDoKppW8rliR4TPc49YmOyCxMzgZnQctPPmhR5E/S9yB8CEUpTDaQoflz+vXeDyg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 04:27:00.7332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb2651f-3e1c-4e4b-b894-08d7af73ce06
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB6643
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_07:2020-02-11,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002120031
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds new DRM driver for Cadence Display Port.
The Cadence Display Port is also referred as MHDP (Mobile High
Definition Link, High-Definition Multimedia Interface Display
Port) Cadence Display Port complies with VESA DisplayPort (DP)
and embedded Display Port (eDP) standards. This driver implements
Single Stream Transport (SST) support. Adds Texas Instruments SoC
J721e specific wrapper and adds the device tree bindings in YAML format.

The patch series has three patches which applies the changes in the below sequence
1. 001-dt-bindings-drm-bridge-Document-Cadence-MHDP-bridge-bindings
Documents the bindings in yaml format.
2. 002-drm-bridge-Add-support-for-Cadence-MHDP-bridge
This patch adds new DRM driver for Cadence MHDP Display Port. The patch implements
supports for single stream transport mode.
3. 003-drm-mhdp-add-j721e-wrapper
Add Texas Instruments (TI) j721e wrapper for mhdp. The wrapper configures mhdp clocks
and muxes as required by SoC.

Version History:

v5:
- Added Signed-off-by: Jyri Sarha <jsarha@ti.com> tag to
  the code patches.

v4:
- Added SPDX dual license tag to YAML bindings.
- Corrected indentation of the child node properties.
- Removed the maxItems in the conditional statement.
- Add Reviewed-by: Rob Herring <robh@kernel.org> tag to the
  Document Cadence MHDP bridge bindings patch.
- Renamed the DRM driver executable name from mhdp8546 to cdns-mhdp in Makefile.
- Renamed the DRM driver and header file from cdns-mhdp to cdns-mhdp-core.

v3:
- Added if / then clause to validate that the reg length is proper
  based on the value of the compatible property.
- Updated phy property description in YAML to a generic one.
- Renamed num_lanes and max_bit_rate property strings to cdns,num-lanes 
  and cdns,max-bit-rate based on update in PHY series [2].

v2:
- Use enum in compatible property of YAML file.
- Add reg-names property to YAML file
- Add minItems and maxItems to reg property in YAML.
- Remove cdns_mhdp_link_probe function to remove
  duplication of reading dpcd capabilities.

This patch series is dependent on PHY DisplayPort configuration patch [1]

[1]

https://lkml.org/lkml/2020/1/6/279

[2]

https://lkml.org/lkml/2020/2/6/15


Yuti Amonkar (3):
  dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings.
  drm: bridge: Add support for Cadence MHDP DPI/DP bridge
  drm: bridge: cdns-mhdp: add j721e wrapper

 .../bindings/display/bridge/cdns,mhdp.yaml    |  125 +
 drivers/gpu/drm/bridge/Kconfig                |   23 +
 drivers/gpu/drm/bridge/Makefile               |    6 +
 drivers/gpu/drm/bridge/cdns-mhdp-core.c       | 2220 +++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h       |  381 +++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c      |   79 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h      |   55 +
 7 files changed, 2889 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
