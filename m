Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D64341880
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D486E19C;
	Fri, 19 Mar 2021 09:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63F6E19C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:38:09 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12J9JPtS002901; Fri, 19 Mar 2021 02:38:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=X9HC1yx1AbWNJUzgY/1t9JwsjmX+NEV5bnaibedYPzY=;
 b=eZBoEVas8TyzU2AFJfrquf2hFRzyOX6h78Bk9XSJkYDt66eADm/6SumxAX+AR8FhtCUT
 3TI9MiI77PT5tUdpUHEuu0qkrEMcM3SGZPrgUqLjzL5ui9IWX3SzwVfjr0dCSJjCggrw
 9D2YYA++WZw+MwSoCpgLjD9TTN1GLcPiFWbepzS4Hdyc1Ezfg3v7uuCCeOpdLIlsQYcc
 q9mRenwafvhw0GlHoI/hmXnCd2+/8uzSM/ncijg1hwP5ps2dvE1wR/cSViCOp+0ElV9b
 POwqGK6RvRlC5IpR48ajgFWgv4wdf5v1XIPerfN2BbgV2Nnj5YlJzsJmAMHdR//yHpvF ew== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0b-0014ca01.pphosted.com with ESMTP id 37ccg12383-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 02:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNw4F+8lyUZ6yC2rzed+eDfqucnZ/pIE8gaHtv2rVtQvTqEAypjWV0PFAcBnlcqvukc7chOwVFudoTyHGoqyp8WuY0YxG+TZf95KxpuZjeUswFtbejY81E3SbPxxhMnC6FMhvGZJ9ZOAmsBsN9pgh1WSINw0/4+ZSZyygfPjMFhlK7PnYSiidCuOMF7+RPcq97lyt94mnlUI1vsqG6FSvvNQc++ThWIyL9GFGaNfcSOU1NK3SF9qNuV8MxVU/a7aQlIUCpZUYj/5lrkKno3ssorDnRTTcGkgATFDo7kBGU5opXFL1vOUluGizLQUTUUlXVsZ8P12sww1eHnMQTLrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9HC1yx1AbWNJUzgY/1t9JwsjmX+NEV5bnaibedYPzY=;
 b=g7uRwS9hLchS0UJJfhrEoSVX9EN6z6hEV9xLfz9whtdlHv50yGjTJVoFUb8grH8hMK/Ts8E+EcGssPETA20HLaU6gsLmo1uJFEpfLWrKD6azI5LuLym26BuzVLrhEJmaq4JvMU+AuVEH/2IpvykDZyFSR4HU9/17AZ7deS0LRq63MD0eGJPtYTxnCjhbW+WDv6YSUPUac+AKVF9u8HSG0VGxHw2h5JjJy/UODldw9QCW99N3Y90ixTHz3vYEWZNCMkXy4uG+ceq/O2mmcYA/rJIhVJ9zSMNclIojHQBDTEnLPHXJsfBzW3tYI/fyZSHl3Z5di/tjkL7SpJvbUfQlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9HC1yx1AbWNJUzgY/1t9JwsjmX+NEV5bnaibedYPzY=;
 b=2Jrh4SBX1jBAxrbP7gc0aViOwsvIN5Au4Pfsb1Jvk6MokR7AlZCQeno1w6JF70kSOFBzQMAz+1RRhdymV9nbdXp0ivBtwJe5U5vdXKLXAceWe7YzXTrYwg7ybpgS/aoLY7mXd9QEM1nBGJfZnsQlqZi8MpsHcvsqJnJnBlXyIrY=
Received: from DM5PR13CA0064.namprd13.prod.outlook.com (2603:10b6:3:117::26)
 by PH0PR07MB8558.namprd07.prod.outlook.com (2603:10b6:510:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 09:37:58 +0000
Received: from DM6NAM12FT043.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::19) by DM5PR13CA0064.outlook.office365.com
 (2603:10b6:3:117::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Fri, 19 Mar 2021 09:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT043.mail.protection.outlook.com (10.13.179.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Fri, 19 Mar 2021 09:37:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 12J9bp7x004354
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 02:37:53 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Mar 2021 10:37:50 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 19 Mar 2021 10:37:50 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12J9boWB007023;
 Fri, 19 Mar 2021 10:37:50 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12J9blek007000;
 Fri, 19 Mar 2021 10:37:47 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 0/2] enable HDCP in Cadence MHDP bridge driver
Date: Fri, 19 Mar 2021 10:37:44 +0100
Message-ID: <1616146664-6941-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0cc9c54-7927-4e13-3283-08d8eabaadf7
X-MS-TrafficTypeDiagnostic: PH0PR07MB8558:
X-Microsoft-Antispam-PRVS: <PH0PR07MB855835702A05F377C0AA0278C1689@PH0PR07MB8558.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuG/vF68DU8/Zr7vw8fCo2hIjm7+8wPYIZn08dWsdCy/hGGlEVS3mJKUlTJ1HcKzzYFs05aqi15EKtBnow+H4ujmSTg4sgwnFY5Qgk5ok3fIPZdaCbjpYBP22jXocpJfXhvAvQGcgeT+QkepksFwYJqESbL5dihPH9d0XUEtCaFuigtUNzxKHRXN0O5GIYbstpGMXJFvlz9lL5i7TIwoZad7bUGdeyHGiskmJ5uFA3BKgdOmLlqxm28daOYJFFhtrxYCUl3BJP0GgCirRbgv4+QOEsKjpAahuqRM+zRAV8tlbq/fDZ7o0W+6LA5FgHsfulLza9HljvnmoQ1DXESuBttkltyQfk2u7Atj0J02Lu4XZ1jXQvm/OOmbCEDvWEfHNhZAtHFduUyglayYqmHPHTFVi2sGmO0GI3Bqo7R1ldOB4wcfxHaCrvErzCYy5Eyqu9/v+YqRIHy3SZrLA99L2rFQBw6i6kZaeI9Md+caWfcW1O8WIdQaQjjX8wbvfd2K6HfBFi8XxX/czwxGe28FdfCSXcHHZn4JZTrFMwK67ZP3zi/1K8WPCEKSi4CkOpYihA65q6lpY/049cbmcdKv4xFW7u4E/qMooW1DfGZ7QQ34rEPQY5zumiMLQN+NRt+3xKNpbs8KdoQ1ftErqnTDmFRx5udB0ru1OAeT+pz2amXXE/ZtxNlVTD9s7c3f8f//QbGHjMXVzYL8z9x0KcOFlQ==
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(36092001)(46966006)(36840700001)(70586007)(2906002)(36756003)(7416002)(70206006)(82740400003)(54906003)(8936002)(426003)(478600001)(8676002)(36860700001)(2616005)(316002)(4326008)(82310400003)(356005)(6666004)(26005)(5660300002)(186003)(336012)(47076005)(83380400001)(86362001)(7636003)(107886003)(36906005)(42186006)(110136005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 09:37:57.5311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cc9c54-7927-4e13-3283-08d8eabaadf7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT043.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB8558
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_03:2021-03-17,
 2021-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=878
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103190067
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

Changes since v4:
- Fix binding issue

Parshuram Thombare (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
  drm: bridge: cdns-mhdp8546: Enable HDCP

 .../display/bridge/cdns,mhdp8546.yaml         |  34 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 113 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  21 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  92 +++
 6 files changed, 806 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
