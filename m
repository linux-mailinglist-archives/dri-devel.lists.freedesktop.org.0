Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C394433FFD6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 07:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563686E094;
	Thu, 18 Mar 2021 06:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217486E094
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 06:45:03 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12I6dOZO023937; Wed, 17 Mar 2021 23:44:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=g/tHLlOZReYuwYhmYy2aT8TO3BjrLcV+XByUQGezf9A=;
 b=cwTw8m60DXK/DjM6wqIIJ3x8ldPejkmYQquITitfn2Ie2j7ofr0ssp0zYq24ECFwclsr
 0H2VTAMPT0pPNz+G8nii9cQwUXMJhBv4CUfjll3DPk77uLXmnsGj4r5uso80nghzLZht
 JLUVsjY4DN9JnB/25Rw5YD9kpH/oZKAZe3VvLl5eO/9vkzvkfChIaCb0S/EsVbt8KfMM
 upbPmYh73dc4dX3stjtKC1r7wudZ7OSWw6flS9RBr4fdtIFc9gMQaUOmEyUdr/zGct4U
 xrSFeXKBKW8bU/yMVuPXh1odS2efls8cq4l7aSSJdPaZItJ1gYwLp584nhGmrVG710v3 RQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-0014ca01.pphosted.com with ESMTP id 378sv2rj2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 23:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eq6pDAP+kYxRVzxGUiBTDlufZe/bCBs8hUEXiSyfRtbPMMvjmA436So5xWk0f8Z87bXYgTwl38CoZPoVBdwb2/WqY6yqG4V31Mobw2T5qQ2ByEbaw/hoinT+TeDU/k6Vnb8wB4+4z6jIdFZluMTaVACw5ouk/mRNwYB6Xh+Pge5fO+2IwGzlFpYnf4HTQA/ktVYXXVbwCgHwomchqJNNJntDAEmY82OfjvyUsDuEciQqHJ5O1lGLtu9vWVeKm1Q7v6NGYeyxJ/T3sNAYI9XQ3eDjxYcqwP5PDQUCwiqp69Ul62pffToipuf2yRQ1mtrmpbpF3OM+We1Bw5sBvT2ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/tHLlOZReYuwYhmYy2aT8TO3BjrLcV+XByUQGezf9A=;
 b=ihZHF7wLZQxgdHsxPvBCmsOWmZARGqHUWMbnuJMpNSVEXOklC8OQKLvuCL/Orf7ueB2Ax9eYQIMhocfeejLG+v5Fjvoz2AdMQY/ruJR+GnrVGZgp24BYLf3LNLP+gr5ufXimm2Oq8L5588JiqPv4G+ljemSjf2HT7BI4R1mDO50z8GFAme8lriPAK36TgQhaXcVt5QuCIOGjhE8zyJY8MRUit1Mhrf3AxtB0CNSDzKuMTS/GrsPXiw/5yZ1j748u7hA5vqPYCNChF4nWBcnKcsbVqE6bqHOIFydQMRBcqkPn9KNyqD6dO6OC8I+DgqIQoq7W+ZznhvQizp3pdKUwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/tHLlOZReYuwYhmYy2aT8TO3BjrLcV+XByUQGezf9A=;
 b=tla4xUVIgT7selqckH5+LibBJdFS0JdKP3TtFeI17luh3/QlzwPX2Acy2EqsnXF6rdEUKd6iiIm+8V/rakCEX1Wy8dhoRy++b4Z5SevrsjxJ9G8xKvKduF8Xre4BqHp/bofzRvNJXNCYPzyHnu7hnhlSEhqDFR3Y8hozBbICLZ4=
Received: from MWHPR11CA0048.namprd11.prod.outlook.com (2603:10b6:300:115::34)
 by SN2PR07MB2607.namprd07.prod.outlook.com (2603:10b6:804:7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:44:52 +0000
Received: from MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::e2) by MWHPR11CA0048.outlook.office365.com
 (2603:10b6:300:115::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 06:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 MW2NAM12FT031.mail.protection.outlook.com (10.13.181.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Thu, 18 Mar 2021 06:44:52 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 12I6ilQP020913
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 23:44:49 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 07:44:46 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 18 Mar 2021 07:44:46 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12I6ikKJ029776;
 Thu, 18 Mar 2021 07:44:46 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12I6ihxN029759;
 Thu, 18 Mar 2021 07:44:43 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 0/2] enable HDCP in Cadence MHDP bridge driver
Date: Thu, 18 Mar 2021 07:44:42 +0100
Message-ID: <1616049882-29712-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46ae7d45-94c4-4190-0bde-08d8e9d95546
X-MS-TrafficTypeDiagnostic: SN2PR07MB2607:
X-Microsoft-Antispam-PRVS: <SN2PR07MB260739E2D3CFDABFE64C93C6C1699@SN2PR07MB2607.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uaPfxCMibC9NyOlwAN62SYRU1Tunl67b5lVLvluzsqqu5YnxyCxilRld+GAUDnhx5yb/Sdg9PeXRs0AlCp5CshFoiVl8ubFviBVWVJFaioxs/1ASZI6NHSFh6psyzRnd1s3+idqfXrqVYnsYn/K4aw+w7FecnWA65BgEvsIOD726l3jUwOcw+6elEZeYe/R6fpTmZBqNB4ikOTropQfVa7uYCvuNZ6tUTDTqnD9CgdvmMjq1OJbvk1QRhvnug219AFNNSTk6YpuBBvI0kmCGeezPscqZNLkbehzA02+AnBmFtVTsYYKQkxIQJvlRn/qVT7TJgPT5vo8qyvfYqFSJjH8QLLgLMo+0sKOIPx2mcICwKEFeQdVnn5UeE+oSgX1FlTGZOayi2Zq5lXEPaCVX5bFftow/Rwr6OaSZFrYBr/M6b629SSYqluX7VPm3HFQv1BuEzfX2tyoYcx0f68CWDQVuiMVsdIbjIDsmjScQkncSi2DvMP1oDJYrJCxWjOtjmTxdFvo+OC9Gq6MfO+YotqxKJg+EPZTOsoUTvq09GtSkhwTfjVO5VYZN7PhGZ1kS4L8MGtju19fLX2yqoswR5OzD4lde0XCUzpoJSJm/VSolrCe9zUkJETY8j0o0sYgX94yqrBKYSnZpk8BQQ8oAnK5PNIYebrzj/kd9mo2zInhC4aibWoxx1EflBJGSTqUQGjcdzU8Kg2VC59gE8BpLgA==
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(36092001)(36840700001)(46966006)(8936002)(26005)(36756003)(86362001)(5660300002)(478600001)(426003)(70206006)(7636003)(7416002)(42186006)(356005)(8676002)(36906005)(2906002)(2616005)(316002)(47076005)(36860700001)(83380400001)(107886003)(110136005)(82740400003)(336012)(82310400003)(4326008)(186003)(70586007)(54906003)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 06:44:52.0164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ae7d45-94c4-4190-0bde-08d8e9d95546
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT031.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR07MB2607
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_02:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=860 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180051
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

Changes since v3:
- Fix kernel test robot warning

Parshuram Thombare (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
  drm: bridge: cdns-mhdp8546: Enable HDCP

 .../display/bridge/cdns,mhdp8546.yaml         |  24 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 113 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  21 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  92 +++
 6 files changed, 799 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
