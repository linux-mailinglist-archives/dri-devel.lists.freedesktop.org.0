Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B6153FE9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211326FA13;
	Thu,  6 Feb 2020 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6FB6F9D2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 06:30:20 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0166TT0C004255; Wed, 5 Feb 2020 22:30:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=C/LhD3MnGJ4ubae8EgD6s6dCphR+E6mOmileQUXj1QA=;
 b=g6azw54TI7zdnUQKjp4rkwr1zeXoNAJuYEF2yNWCWelIbBgtarK6KX0ZWAyESmTDmUA8
 LLW5QR0YIQmI2zCkTsZyiTe4iDaGUSyKpGWBs7VZJxg52yz5ROXM0gWvD8+a5ibn2yc8
 Ko/QOPGZHs2wB6bBVCPGZ1giBaSAb8EFNU23LgM+j8ObYn2sFeSrXbrm6TTPZk00mVet
 WNE8kJmjjunMKpuokz6wPI1PnJb1kIkCywECcr/kW04YtYqntvyYUaMw41iv7ULZVaVt
 1N8tub2ia3sBa2CjcCGIEYjYqxnBseqRjjJ8g3QgJ20MdF1l/VK92DBFiYuvtMjLetGv Eg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2xyhkv5r4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2020 22:30:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpJaX1d1waAGFXgn1gSMUvrjaJ6QLr0eR6JE3zEL47Ziw376iKj8wiTpCppJ4ErMhq+tWTWp4SdLDu+NeDttA9C6GXEMRBaaC/z26ZjX3HR+QbPvaV6jxIU//4nlKylcqOpfmVGAriEla2QQrda6xDi3yivvaAYler5TxEKTG79nBrw3FZq04WL5uPIcEXwkh/N+OlL/xu7ja3Qr52JpHx1uOne/YkbPd9+uiWGkdLEFrVm5Lxl8P5WfXoV/5QezSghvLhFU6F6ymQ5bPJXkkydMiGPQUt0tGQwJkAJAxAqa+H4RO+Vag+CxvQ/rstpaauvgJio+rQbzRnhEAc3pEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/LhD3MnGJ4ubae8EgD6s6dCphR+E6mOmileQUXj1QA=;
 b=C3S2H2RLI9l4s57Ad0fRnbhmC0oMyhsmpddnQVoCaq2cjz6ceyhXmJlwqsRkuHCSvUsHSrYJkLIzbzA1GO/NvTJKlefTuASQ5xr6aYIQDhxJ5sHlBgEaty4fHVEoREkWtHvJqob+LhKz9G346cGwq5+NTgUSoYrzooFIixPvKCwZw09ovI6U0Mi4C93EuFs32ZDoCfhXmuOioVoWzxaLFE3Ik6irS0O2XBhHi1k6evBmM0gD1c4JHTzAJqxqAAanSSGN8dABoI2y4zYPMQG1VVoaUW3tzc2VlVvx7P8RzdYpD+JGmzfnn3BBTHtWTYr2momFOCdLKTBrnKJiQeRHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/LhD3MnGJ4ubae8EgD6s6dCphR+E6mOmileQUXj1QA=;
 b=6T1jjN3p0IxnNfD4jOeVsUeKVrSlMVX65VrAkm72vcbUcWR00qBtsrewRb6s0yn8nTuXAHeCkKGKAJiRkNifxKAqh/bENOPxM2Ai63JR3IXAuaOkHborIpiuPq3EvaxQTVIk2PfijcKjR/86jwUPg3bfC0aibU4FRuQVzjfJ8To=
Received: from MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40)
 by CY4PR07MB2776.namprd07.prod.outlook.com (2603:10b6:903:23::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Thu, 6 Feb
 2020 06:30:01 +0000
Received: from BN8NAM12FT014.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::205) by MN2PR07CA0030.outlook.office365.com
 (2603:10b6:208:1a0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Thu, 6 Feb 2020 06:30:00 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BN8NAM12FT014.mail.protection.outlook.com (10.13.183.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.10 via Frontend Transport; Thu, 6 Feb 2020 06:30:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 0166TqcW023018
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 5 Feb 2020 22:29:53 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 6 Feb 2020 07:29:51 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 6 Feb 2020 07:29:51 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0166Tpf5021640;
 Thu, 6 Feb 2020 07:29:51 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0166Tm0n021636;
 Thu, 6 Feb 2020 07:29:48 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v4 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Thu, 6 Feb 2020 07:29:45 +0100
Message-ID: <1580970588-21596-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(189003)(36092001)(199004)(8676002)(86362001)(54906003)(110136005)(7416002)(42186006)(316002)(7636002)(19627235002)(6666004)(356004)(36756003)(8936002)(107886003)(4326008)(5660300002)(186003)(2906002)(26005)(246002)(426003)(70206006)(70586007)(26826003)(966005)(478600001)(2616005)(336012)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB2776; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8435df20-d014-45fc-0dc8-08d7aacdfe33
X-MS-TrafficTypeDiagnostic: CY4PR07MB2776:
X-Microsoft-Antispam-PRVS: <CY4PR07MB2776AFD9DB88C7DC7DB7A65DD21D0@CY4PR07MB2776.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0305463112
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q93hs+MIYyWSnKImFecg9AJMhOJnAlIBZhxcnUK6hYjDnFlt9IbtckUNaQu1bKug56lB/DasFYBKByCScS0nG//QeBNBh6epGGM6EQhP/JDBGq8xOjex+9gDPnQUCorVzmrofD1AO+oe8M06EwOhfAt2pJPN5Cn8/z34o+5OjgXFZCoq4obdNMdxQr8hp3tmi+BM0/zYyaalmOjJpy1XFb2unGkizVON0MtPtgYccb0wf+umAqjFYE5Jn06v4GHlHrGlkhIUz78lsLNRfdOQlcnltOPsflSBGbvbGSrAii1GX/5v1a/47LS9L597IfJn0gKYeUxpjsTVhj3Swjf7abWejAXbAnTMAjetjiQIwCv65AGjUUyppMAe9552QRZwOCVKvRWwIVRASTWsbSm+yc7u6UU6Hur8D5C/iO6e3Ua/NoPhezXYJKOiEvejKA85T6H6gAo1VrPI72DgWtgBDOcF3e47zx50Q7jgVHDazZxdu7mL3pUkfGSaCzEP4awybNzqNx6j9xxQc/JBFe2BId6iTARnKdVuW8juEkECsc9WlKU1TXCalfu/5DRyVE8kiucgTw6CyrxbucURjc7lZvFG17OQMjnyHqYwXQYQP8fANL6T86DkUSATFjxE2xLPL0MnH69oit/DKcjjq39lOw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 06:30:00.4571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8435df20-d014-45fc-0dc8-08d7aacdfe33
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB2776
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060049
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
This patch adds new DRM driver for Cadence MHDP Display Port. The patch implements supports
for single stream transport mode.
3. 003-drm-bridge-cdns-mhdp-add-j721e-wrapper
Add Texas Instruments (TI) j721e wrapper for mhdp. The wrapper configures mhdp clocks
and muxes as required by SoC.

Version History:

v4:
- Added SPDX dual license tag to YAML bindings.
- Corrected indentation of the child node properties.
- Removed the maxItems in the conditional statement.
- Removed phy-names property from the bindings.
- Add Reviewed-by: Rob Herring <robh@kernel.org> tag to the
  "Document Cadence MHDP bridge bindings" patch.
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
