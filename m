Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3C12A21D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560FF6E0C4;
	Tue, 24 Dec 2019 14:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E786E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 15:17:14 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBNFGY76027178; Mon, 23 Dec 2019 07:17:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=rxfgEAI/8gfNImGjoRPSIfVaKyW2/VXlLvK8VB9ZakY=;
 b=mu2h1UKL35r1+7WoIdgG9zz3Ffku4L7bM2ib2hjs8nOvtbcfS9igO3dOZhMpzG2kk0Gr
 Iq8GLO64mTcS8hPI27klt+HMmOSjhldjR1JSrTO7PI7dMphTHc91ySOiTRmsAgs+Tp3S
 IdA7oOaoheoA0b1UK+BVxojz8oOvFMi5nqLe1M/4aLOHexg1CQY6leTIvPhM2Aj9/eSw
 5aR1crHz12NErJj6HODdDBgBhgOa4ZeGTZGhCmSB+a3tKf6SgZJAQRe79kavW4WaG3d3
 gZNeemmENH48/7vOO52CYq2+NAKcgLEVLZW0WIFicSVbh+pHn7Z5qejXONpAg3Wb9Jnq 0A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2x1fv3nknq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2019 07:17:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaX/WsuQWpHoqqOc0PdqumOmoyq+R3p6zp1Din8zSI3l7JRNyTtjBBiTj8FNo2SHASDd82TDNSzP+M+vRMxXEmnCL6CkdR4hFsQ2ZPiZUrekWDOTPM9rMkTcj/1Xy7QoYUKH4EYctl5H1FifYsWSNWJ1UWOxfWNTp1OsLwBDYKnvbM6tdC5+4DTlB3X0kHSbudB+ri7T0mavKMggkvx++R/M/rla7/HtT7qLtQ/ljlu8txtJ3TIfYJh9bx4YIMkk8kdCvFsdTb4s3jfyVw4FBFXx6VDA+1nd+hwk5lw8fHwYw3Rpa5caS2BDGC0XS/p9XziBtYDRrzlloAn4CxAfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxfgEAI/8gfNImGjoRPSIfVaKyW2/VXlLvK8VB9ZakY=;
 b=JxWoh96Jj937732oxWPWGToeh4e7o58OG/106eFcZDB0uSV4Vw/zq2566XK2rN2GZGME0aW+FceXnKGh+HP1mc/4LmK7dcIFMM2ONtuesNFTT8b9aYSMchOU7+kRVif9XhQBx8lhIcoQGxAZQFnsLH+cNLo0ZQyeTWZJr12MFhY4KAfdnjMa6yq1zeilSOjKVDCi6BZP/A2tuzmCHZZ59HSGbc5kC1ITrOxAGh3KPk4bD2p0QXeEDpkV0IHNP4TeW5UmxArcKALV8W+ZXRK1L+nRs8tugbPyGnWItgIMRo8HgD+UGBiuOjMpstJ10QkZTVndY72jWXHT5iL42hqHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxfgEAI/8gfNImGjoRPSIfVaKyW2/VXlLvK8VB9ZakY=;
 b=ORbelIZXZUrYZGrEvWAQkRNDofnjaNyU814o6ZH6LsIQfs1PB7aSCOyXDVIiFb/N51CaK3u/3ZMpsJcNBlEXW/UQ9GPqnKHkyPVT35rcS3RFUyj4x+gPc8nByZI8VE5kQITHw6KWdLDCw3JCgavG1/+95KLD4m8ubRBQwyMQsbg=
Received: from DM6PR07CA0063.namprd07.prod.outlook.com (2603:10b6:5:74::40) by
 SN4PR0701MB3837.namprd07.prod.outlook.com (2603:10b6:803:49::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Mon, 23 Dec
 2019 15:16:56 +0000
Received: from DM6NAM12FT058.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::204) by DM6PR07CA0063.outlook.office365.com
 (2603:10b6:5:74::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Mon, 23 Dec 2019 15:16:56 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT058.mail.protection.outlook.com (10.13.179.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Mon, 23 Dec 2019 15:16:56 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBNFGkVO020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 23 Dec 2019 10:16:48 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 23 Dec 2019 16:16:45 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 16:16:45 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBNFGjC1016097;
 Mon, 23 Dec 2019 16:16:45 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBNFGgWq016058;
 Mon, 23 Dec 2019 16:16:42 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Mon, 23 Dec 2019 16:16:39 +0100
Message-ID: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(36092001)(199004)(189003)(478600001)(110136005)(26826003)(107886003)(186003)(70206006)(336012)(70586007)(76130400001)(7416002)(86362001)(54906003)(316002)(81156014)(2616005)(42186006)(356004)(2906002)(426003)(5660300002)(8676002)(6666004)(19627235002)(4326008)(966005)(81166006)(8936002)(26005)(36756003)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0701MB3837; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4ef95e9-63ba-439a-f943-08d787bb2602
X-MS-TrafficTypeDiagnostic: SN4PR0701MB3837:
X-Microsoft-Antispam-PRVS: <SN4PR0701MB3837B07CA03DC7D47645C1B0D22E0@SN4PR0701MB3837.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZTo/0x0S2zDPwbenSkEZrCAbdReBPSOh0vz3J2+HG+sTu/Aw23yTNt/UNNinJKi1tDiNVENh2IYRlQy+AZio5YE0grzBF9yLD5EA4sXoZQZxgLfSNUxLSZkpfC9B0IPomW6A22rz6FM8sx4vvP1Rz2x2kuw50twjY+o9E3O2YKqwmZbsY3vvyKPdN4W6zxWc6tZwfmfCdcvrwVV2298REERe2Q9HCGhw5LFzyPoi3+93AUZPQXP6eCaRFqWh+U6aI680AEJ6ifzLTs6hK66U4oyYbpDuGLRnKV40k5qS79UuQLhzjkLtU9468zK+RE46dm8gUuF0+26nRLBh9TTIeloBsFDdGEnSmOrFv+ZYXzCNOPLGPssMUhKuTON+yxGm9lSXS69WLVn5Kpx639IksGVGllhXREenvdwXpuA0L2Zwq9L6tdmVB65nn1rIHxsYB3WWPeB/6Z0UB3Ukx2cNtOyUnosEbc5GQCTl8H/+MTQ7JeCUyg+ALsylgyy4WcwgkQFm0cs1F58Jx2/P7sU6+Uhx5eH9GoMeeQcO1GUFWZdeqgCtEQC2UMseUMnv7fggF8uR8Iy9bOgY+nqFQl58aX89La88XcNfNZyeu4WWEM=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 15:16:56.1847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ef95e9-63ba-439a-f943-08d787bb2602
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3837
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-23_06:2019-12-23,2019-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912230129
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
and embedded Display Port (eDP) standards This driver implements
Single Stream Transport (SST) support. Adds Texas Instruments SoC
J721e specific wrapper and adds the device tree bindings in YAML format.

The patch series has three patches which applies the changes in the below sequence
1. 001-dt-bindings-drm-bridge-Document-Cadence-MHDP-bridge-bindings-in-yaml-format
Documents the bindings in yaml format.
2. 002-drm-bridge-Add-support-for-Cadence-MHDP-bridge
This patch adds new DRM driver for Cadence MHDP Display Port. The patch implements supports
for single stream transport mode.
3. 003-drm-mhdp-add-j721e-wrapper
Add Texas Instruments (TI) j721e wrapper for mhdp. The wrapper configures mhdp clocks
and muxes as required by SoC.

Version History:

v2:
  - Use enum in compatible property of YAML file.
  - Add reg-names property to YAML file
  - Add minItems and maxItems to reg property in YAML.
  - Remove cdns_mhdp_link_probe function to remove
    duplication of reading dpcd capabilities.

This patch series is dependent on PHY DisplayPort configuration patch [1]

[1]

https://patchwork.kernel.org/patch/11307829/

Yuti Amonkar (3):
  dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings in yaml
    format
  drm: bridge: Add support for Cadence MHDP DPI/DP bridge
  drm/mhdp: add j721e wrapper

 .../bindings/display/bridge/cdns,mhdp.yaml         |  109 +
 drivers/gpu/drm/bridge/Kconfig                     |   21 +
 drivers/gpu/drm/bridge/Makefile                    |    6 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c           |   79 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h           |   55 +
 drivers/gpu/drm/bridge/cdns-mhdp.c                 | 2214 ++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp.h                 |  381 ++++
 7 files changed, 2865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
