Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5CF171239
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1A6EC2C;
	Thu, 27 Feb 2020 08:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA745899F2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:23:32 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QANFlq020026; Wed, 26 Feb 2020 02:23:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=TGzFGbAzBHV+Dqc6DZfBVcirF/V8ipStt4qdzSiF9wc=;
 b=jgfEm+X6wafkeV/wXkXBSh3z9FzUngPCMn9xa86DbnfcHzsbOs6x8fLLRLrmrHyE6kdN
 j2F9cj+pDnP7ou6ccsOnyNkoy+bwn+Ek9F8KBi2KvlrJKsgzxXTe4vXEgEeb2SGRRdJn
 l6kn8/0TW7B0GOaKzptjFyN/Y0j99VBkN8ACbEenzcYpggW0OCc6mCd1iKHmIdHZMoNe
 vr66K/v/Sc0IAAdh8t4FrX2J9YsJNESQRsQQ5qCtE4XdBiCTL36dTvaG6cxOUYJzAPV5
 1EtjEoeQVsvjqrShDCRPNF57bIaP/M9VDOlmuiNf2ezK6lvc0xMnIwGB2eQgpOZMTcnv +Q== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2ydcqmjaj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 02:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxk20pguLMGzbd0AL+HVM+9eKvDmipRIj0ax8sRYubNK3NeE1vKNM9+LOOH5UprvQJfpRkB5/sr9YEaz2WBHTAquDnK6pD+Qi+KFMAJwDVIYWzcRbLnlIsdA652r4Ps4/j+SrjWdbcBO/DKBtsWOeFKQr+/1lt8qCfMsX4vQ0CBnErMQ/I0ykfW0rkJITGX0OIgTtnH6qdgfWkw7n2Mmf+RhpCF/KrSVCdOS8DTMMBphqffYvWTG5NrlZcDgtMP2aqYs8JTKcqToFRWEW/x375UA/P2QJXSHqsi4lFyPO8dAWY2x0STryQlUn2i/IRngXL1cf4MUPQtxbwG4nsVVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGzFGbAzBHV+Dqc6DZfBVcirF/V8ipStt4qdzSiF9wc=;
 b=dIonQV4Wb1y/5go7Ib1PLnbNzzmVdgIsLiTHKtU5wT4nez/NSQYUVl+SOgGN+4RcWGhBEYtcGCY22NhlYDD8jNdXj9W29FH3aJuDseFbgGtJHJCATV6EnUgq7JfuFtl/DIXjnVGe1eRKbHLEuc7FUVlDHRv1RzOfDkSEnIK22w+wbf6oND5Tgsrhje+8CEqnVko+3uSeqrzbdRvPnMFxMAzO6x64wfgbk+cZSlo5cCflvQQ46rbOrHksiAYxVbVuJUEVC4bRxBq+l52eb3Xr2qSi/7Pni3Qm6D8DMFmqWC7xNB8PPO+aM7k3J3axiHWX6TYxAm2ySZtieON1Y3uWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGzFGbAzBHV+Dqc6DZfBVcirF/V8ipStt4qdzSiF9wc=;
 b=ynlKptgh72M2BS/WC5d1SvscgnzYFN1zj1iXm2ewf3tgBeZ3fXJBtgVdPiRSTMb/pZKHgHQHLP/iU94snqkz+apQ38AFANAgrPVhioMIsrhnYJNzFFrJG4hSSRFjdSEC7Mp0u8iZF4gdoTsnZLPtoO9kSDiXLo58VEFVy8+1N6s=
Received: from DM6PR21CA0029.namprd21.prod.outlook.com (2603:10b6:5:174::39)
 by DM5PR07MB3113.namprd07.prod.outlook.com (2603:10b6:3:e6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 10:23:12 +0000
Received: from DM6NAM12FT064.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::ee) by DM6PR21CA0029.outlook.office365.com
 (2603:10b6:5:174::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.2 via Frontend
 Transport; Wed, 26 Feb 2020 10:23:12 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT064.mail.protection.outlook.com (10.13.178.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.6 via Frontend Transport; Wed, 26 Feb 2020 10:23:11 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01QAN2OA018412
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 26 Feb 2020 05:23:10 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01QAN1kC028547;
 Wed, 26 Feb 2020 11:23:01 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01QAMxhk028544;
 Wed, 26 Feb 2020 11:22:59 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v6 0/3] drm: Add support for Cadence MHDP DPI/DP bridge and
 J721E wrapper.
Date: Wed, 26 Feb 2020 11:22:56 +0100
Message-ID: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36092001)(199004)(189003)(2616005)(70586007)(70206006)(42186006)(356004)(316002)(19627235002)(110136005)(426003)(54906003)(26005)(81166006)(6666004)(8936002)(186003)(8676002)(81156014)(2906002)(7416002)(966005)(336012)(5660300002)(478600001)(86362001)(36756003)(26826003)(4326008)(107886003)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3113; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e827eaa-fae3-4e7e-9666-08d7baa5e204
X-MS-TrafficTypeDiagnostic: DM5PR07MB3113:
X-Microsoft-Antispam-PRVS: <DM5PR07MB31136CA9CA9103BE075F7950D2EA0@DM5PR07MB3113.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLi1xGAVYtlsgBYgSjc1J9Hj++T+OmSLyTMrDrvxab9EUgNNvSnvuS2xXJQWppSO4OzOSOAal/4snMNaisG3zoqNRbDhFyeHWqz5hcZ2knDies8gj5SbUBWxCGkraT/KeTTZtI0hqVr068KvblF5wG5DDtas4VcZ1ancHfBnwWoLTM9R5lbud7BSNNuRdHbitiUjQ7ETJWcL6Mz0Rp6P6hIi6K2V+Ip5Twi6pKwCuHvoU5J8iJx30Br2EuFRRZiicR2TWQG5Qa+JfyX0DKeEy4ryQG+roPsTbj90QjTrdC7JFDjYLGkC0RqCiJyN23wJCSPGHYBS9684p9TTGs129O1Xxr0hu6iMQqm/r7qE95fNJzq+h0wMbta2Qed1r4SUFRTHNALcQOqlSBqfsXhlwRk7gtlBmydLLUW3Xckr+V3Avo/PQ9l61NcRrJXQafKKgQakcbmx9tBfZpp09DWxax2x3flbLzPQNRkUmULWIO5QLH0d+2pZhRDi87AwABa5weMOd6hsgeokmlioAcM6W1uJhZCQOm+YwXD/XQx0WW+/3Lg1XmGISLILSszT6tYM0jXXiqwNHFE0kBhrVtU2RSMVM/1V9wHH+SkoXNLjvhAvGRMsEkXe9l4sYyWSRBY7nXIljU54B4T1uZEpBZXlIw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 10:23:11.9796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e827eaa-fae3-4e7e-9666-08d7baa5e204
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3113
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260079
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
  dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
  drm: bridge: Add support for Cadence MHDP DPI/DP bridge
  drm: bridge: cdns-mhdp: add j721e wrapper

 .../bindings/display/bridge/cdns,mhdp.yaml    |  127 +
 drivers/gpu/drm/bridge/Kconfig                |   23 +
 drivers/gpu/drm/bridge/Makefile               |    6 +
 drivers/gpu/drm/bridge/cdns-mhdp-core.c       | 2210 +++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h       |  381 +++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c      |   79 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h      |   55 +
 7 files changed, 2881 insertions(+)
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
