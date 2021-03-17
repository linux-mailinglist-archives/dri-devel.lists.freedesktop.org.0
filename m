Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A433F4EC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 17:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72886E59D;
	Wed, 17 Mar 2021 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107326E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 16:04:34 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HFnIbx027528; Wed, 17 Mar 2021 09:04:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=2Vg8BOjl+DYg66fSaxSsmqwWU9BIPJZRi8RgDskYZYc=;
 b=dwPcVQ30pp+VtZz0kTeS3c1gHuOaDGw9RMhlFEkQlfglKfgRbgY6J8l1n3nl3bw/eD/r
 38nK65ZYPxbAavvCxouVGbuA3n43FhTL64TRcTECNSCjMWObcDo4Uez70lBGzetn/Wmm
 rQ5HnE0ha/dFHr5pBQPX0WoC2p92H0H5kNdok+a8tJY44nf9q0UvMsTqP+sEoGQRtQhC
 UbWA1l5nscaVR/dVef6EckoCY+nTWh8czueDkL7r9zQpbu5NccyzEl9NuwLyyT1BXxnU
 083/1Ge2crKKVRKFSISuHiY92X3OJnYu9hoomns1wtfQIkxy3HTJ1BWItIykwkh76250 iQ== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 378sv2p93x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 09:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkP2n9pIRqBCZ6I8eVhLgyM7qvU8LmAAECKKmMQ7ZyB0E2tkx3v25Mb9SbPbMSaGH1KAubl7KYl69m3yc9+enyRKR89C893J1DStOckVVumLpyNAuCzG4guf0JifGOIM3eWHGSwCfnCqXbD1YMgUyisnDL7OKKeeL8Xqn3hUNv/imDEFwqOe2zz9/pRa0KhJWmPcBTtGtFqR8cuydj7Camm0xspQ3fI8R/axp4icig3SzKNNUotyIvpLQn/LzbnVW1LOOdRc0NOpEAoubLfXjMikzBFn0P5S2CtxWVaiOSF3hTv4qHCGd4OJpVWvuJu3BUl4UQ5Nybx8aW1SLQY6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vg8BOjl+DYg66fSaxSsmqwWU9BIPJZRi8RgDskYZYc=;
 b=V+Voux9p3HHvF47MooMkPPL8rQa9wFAoPUbYV1J1aoRBd9oDMnafOmaGvVV5Oij645LXxotMaQGjPkG0nWIgN/i6Cr/o7gwq1qdz/rOjnjMyT/HBTJQWUCpzbLuo3FOGUJgdWsfiPxJz7TaajOxjYozm8qEUWEx96Ux98t9VJ13SGFERE9z8sqtFPs3aoaT7Pyw5u20/KIvOXqFrnPnyxDtZuxlROCObhKkilC0l09ETlbVaWamOlKFIz/SWhBEAI/LvO6G4ZBPHK3SGgJv8nWX0wCNzZ/It1OZVrms87qp+bTO6ieUQeJvndlsgLQBX7bNSpa9BhUueNAxeKrXthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vg8BOjl+DYg66fSaxSsmqwWU9BIPJZRi8RgDskYZYc=;
 b=SqoEAKSNfxHsfVH/9QLT6AkLUtEcPWM3ThiYt1qvwpvkgvtSgWx31b6fRNSp8/7qdw/WD6YTGJ0l16ztTzfI4eS17D3Z7OgpVVtWOseRt9PEmMQliwk+ly8sv/BcBYK4xEP+37kN3T8qglmLan349OwqY93BZRmDyKqUUQqhqXE=
Received: from MWHPR18CA0050.namprd18.prod.outlook.com (2603:10b6:300:39::12)
 by DM6PR07MB5705.namprd07.prod.outlook.com (2603:10b6:5:35::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 16:04:20 +0000
Received: from MW2NAM12FT014.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:39:cafe::31) by MWHPR18CA0050.outlook.office365.com
 (2603:10b6:300:39::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 16:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 MW2NAM12FT014.mail.protection.outlook.com (10.13.180.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Wed, 17 Mar 2021 16:04:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 12HG4Dd5031005
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 12:04:14 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 17:04:13 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 17 Mar 2021 17:04:12 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12HG4DAF016111;
 Wed, 17 Mar 2021 17:04:13 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12HG4AR1016094;
 Wed, 17 Mar 2021 17:04:10 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] enable HDCP in Cadence MHDP bridge driver
Date: Wed, 17 Mar 2021 17:04:08 +0100
Message-ID: <1615997048-16043-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28bac655-9f1d-427a-679a-08d8e95e52c8
X-MS-TrafficTypeDiagnostic: DM6PR07MB5705:
X-Microsoft-Antispam-PRVS: <DM6PR07MB570507768DBF177EF6AEDBB3C16A9@DM6PR07MB5705.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4e9XUWtRR4Fr6nCb96OaXvfa1Ot99cRSWU8WzGukVDch8opNtsq8tbsUfKN84uBZRLBIzg1E+WliOxW1nwjFBKg0R+dFYf0HcUbRAPRRr0CDnhhJgcLo+brbrW/So+JFO6CgVZrQKFGRfAXOZWensVkd/HTEDC3fg7ghpj6S7KY+LD7FYyHebNFLqq25IMJjIb6+wvg9iEF8q7QJbH3TBf2JYvnO+64wyNq2A5pEMEG0hE3fqfCW4RSqAk5VsCCFGjf/7wqFVYRNUPFCe0was6017PAuTrCvZaBglf3uGeCcoYgKA/9sOCKbfJhNp5DPK2m0+2Or+lsNoFffg/7vjtsZdynMmezvjgSSPrXLd9h9rqi15+YZVv4XZHFeazH0njvu0F8w3EIZeluwEGXUNNec/pOi1HKohlLzvrjh1j0Kjw0SuST0MRTXOGe21gNKGnUVoUW1SKrMP1N62454TiY75Q0pjk6/C2hAkW1CeJMFw1VGvjIAf63+8/q478EcXNdoJsg5BNgr5jPPZC3PA6KOMYhySNFzNxmsOOpaqaAHvh+I2dcBfzHYFWII14Kx6tGnbDt/mT9dxN5dSN2WQYKyto/PgtxDaBjWMJeVxQGAaWXScJJXa7qNiFgMRHfkK/LOMeXcq9FegZzrV5necmLgJH/CsVbSV5X281DLbyaGmx0ekN74GocbHMKwQ+n89KfYgpKLSQYHC2/MQxNISDz72bzZvs5XKHEiX0f8cy0=
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36092001)(36840700001)(46966006)(7416002)(70586007)(70206006)(5660300002)(336012)(26005)(426003)(8676002)(478600001)(54906003)(186003)(47076005)(81166007)(356005)(82740400003)(83380400001)(2906002)(36906005)(4326008)(107886003)(82310400003)(36756003)(36860700001)(86362001)(8936002)(2616005)(316002)(42186006)(110136005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 16:04:19.6399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bac655-9f1d-427a-679a-08d8e95e52c8
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT014.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5705
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_10:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=871 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170113
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Parshuram Thombare <pthombar@cadence.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 sjakhade@cadence.com, nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series enables HDCP in Cadence MHDP DPI/DP bridge driver.

Changes since v1:
- Move sapb reg block right after apb reg block
- Corresponding changes in binding and example

Changes since v2:
- Revert reg resource sequence in binding and 
  use resource mapping by name
- Remove hdcp_config from binding and use
  DRM HDCP Content Type property to select
  HDCP version

Parshuram Thombare (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
  drm: bridge: cdns-mhdp8546: Enable HDCP

 .../display/bridge/cdns,mhdp8546.yaml         |  24 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 113 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  21 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  89 +++
 6 files changed, 796 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
