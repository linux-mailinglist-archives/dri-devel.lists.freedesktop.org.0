Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B535AF79
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 20:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D1B6EC90;
	Sat, 10 Apr 2021 18:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DECF6EC90
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 18:14:52 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13AI61JX000632; Sat, 10 Apr 2021 11:14:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=7yn92O8ZbPMc+8VAqjuAQJia+VhuzyUKqyFARaSVNBU=;
 b=oq0Cv5HgeDKqno9tXMCwr0zfUxuYvhM5OOXn2Wr4ZT8/zbzha5lZ6u//1hp6zMJU7L08
 Glld92EveB0dXLLfwHIDACGpI7P5ggcFLrIuHq0tdxGyFMhpH7fHdPEOVfjHybXecNkN
 t86FkkxGObwKcnIGCc3WElby4XgLcVYg8dkgI0mZbBHLA6b5GH0/DUjkYBTUImtPuKUt
 7lrX/SWq52wJJU8ksnToAA5T2aDlpsPp23GCZM52N3vc9j69SCNRBwF53m9xWXO5Km4w
 qMrZoNRGI4081JGlUGptRy22Aph/T8AktI5ToAGsjrQtqAaiBxa/BL0Q1qUF+EOWSmmS xA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 37u7m0h1dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 11:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfmLfGVN0PXGfbl2RyjaOlDcm1VNrEdeU5GOdaYi5hkE/M3Zq/i/esfFkyzwrF666Pbocaqu5yeYL9swRJeEabGMgeOgw7dZFRzCQy9AJJagnV81hLxr/1c0Zj2O0OEpOU0nYL1tOJUdyLf4WheyJS3hvGrvlWvoTUHlYpCTD9+mksp/Y57DmlRn7FrpPEc6uzl9zszv7L5eQgiQXCGjf1ogG/G78eOk9UB/tw5teoevw4TyDB45aYsKougdYtWe/62b4WKQO8srRcoU+Ea4SmKX8DooaJUBPOvk03fzy4EvQ96lxBRIKah2Z7l2gj4vn5pCIWaZq9PjiLZip6sfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yn92O8ZbPMc+8VAqjuAQJia+VhuzyUKqyFARaSVNBU=;
 b=LFY//qE2h50Uw2Wqr59buAEWqwQJXYfYtXAmCbyEdzT7WXUxmDnMP8NNmzve/4jrHUl83YGUQwJ8yF224A9jpg2l2X7K5okAqXcRa4/O+xBYIWxmVsUSR/irOyElk4bLEq3oBHF4m0RD0B67C6RHbqmMeGzjmFpYla4RdDG6kOp0MaoKwc7Vf8lxZdJydb5luGb3GETrbe/M5LZ9KnpXWHewWmL7IVYKTFHs+sAqMcfvl1M7tSC3XdEszKY1sgO/H6yuoxWNvQUQL7Yl776WkvnfHB+tg51A21oPZtVepO28BP8NNbwY/zURFiwe2i0fHD3FR+fZiUhVMfprzz+NDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yn92O8ZbPMc+8VAqjuAQJia+VhuzyUKqyFARaSVNBU=;
 b=sFSEcAOLcPZ9xslYJEGSmvMlmkt7wHffYyCc6ccY6WspaQbfQuiQnTfWEVd4eJxvLhMvV4wFT6QUBhFkdArvVuiNm06d6SSTmZ9s8SFALJIdmfjebhHL8WQw+NqzsxS5HMWKqaI2MJWXxc4uczFhh76lTxYaDOnAUP6rUlja4ug=
Received: from DM5PR12CA0065.namprd12.prod.outlook.com (2603:10b6:3:103::27)
 by CH2PR07MB6744.namprd07.prod.outlook.com (2603:10b6:610:16::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Sat, 10 Apr
 2021 18:14:43 +0000
Received: from DM6NAM12FT037.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::18) by DM5PR12CA0065.outlook.office365.com
 (2603:10b6:3:103::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Sat, 10 Apr 2021 18:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 DM6NAM12FT037.mail.protection.outlook.com (10.13.179.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Sat, 10 Apr 2021 18:14:42 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 13AIEbb3013461
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Apr 2021 11:14:38 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 20:14:36 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Sat, 10 Apr 2021 20:14:36 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 13AIEafd028685;
 Sat, 10 Apr 2021 20:14:36 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 13AIEWGO028664;
 Sat, 10 Apr 2021 20:14:32 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v6 0/2] enable HDCP in Cadence MHDP bridge driver
Date: Sat, 10 Apr 2021 20:14:09 +0200
Message-ID: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c059f15-c0a2-43cf-187d-08d8fc4c83a9
X-MS-TrafficTypeDiagnostic: CH2PR07MB6744:
X-Microsoft-Antispam-PRVS: <CH2PR07MB6744718BBCDB24B245E5AFB6C1729@CH2PR07MB6744.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ta0bsGkHu38XJBa9C4LlC1pIbr2+tYvi0FfszbgtMvnO2ahtuoQm6El2fnS20AL51tbE4EfPVIAlhYN8MDguRCJDpTI6bdwv+JOMBzWe8z2ELyXQiaDhftEMSMOARE5tdWpAK2WDS3X+TjymIJhIVJgXQlbDT8PDM0bCJkwKD55qr5ATjqpJ+gU53VGN+f5o3/lSI+zSFEQsMLiF5/Qt0E1fIyjyaA6NXNZcFOJnsmFBOtpUGMQ0By2uSuklpALujuNHZipmDy5hQhbEHdkRILDvpggSf4pLzZhF79ubW9kUbG5e5HEoV6WWLOVHO1+E76obV20HQQuqSxg7Kq9pmT/Oe00XKP5OTabx8dzQGcGNWI8QdBbRq6GxxMi6aBD6xfojG83m9W7mAZwUT82W1y0pGDre5TsQQQ80do/cIJ9LdWBJRestoSUoCDXmwTNtQh7v15KL7pvwy6K8bIeswCybastBWoxcZr65EBeALXZO+rr0pMId9KJquUVY9iJKeUFZCYvcMNe/5Wy4hFAVlBCPi+4GJN1NmT6XA5gmmNvpHXRAhs46SvrQ3x1QFRkKZEhSD/ozXODJEeOwT4dGXr278DayF7dYD9KZQAFkrid3PhO4vxyr2MYjgIu6EluqAExeJLoQcowf3jSojycsBjU5RP+7i4l9QwMkq7F2lzxeE+j0TmNPd5/Z03pyyO9mrNraSfQA/XkESva6vOgBZg==
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(36092001)(36840700001)(46966006)(4326008)(70586007)(47076005)(83380400001)(42186006)(426003)(107886003)(36860700001)(7636003)(2906002)(8676002)(54906003)(26005)(82740400003)(110136005)(8936002)(186003)(478600001)(2616005)(86362001)(36906005)(36756003)(7416002)(356005)(82310400003)(70206006)(316002)(5660300002)(336012)(6666004)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 18:14:42.8457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c059f15-c0a2-43cf-187d-08d8fc4c83a9
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT037.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6744
X-Proofpoint-ORIG-GUID: 9XlBj9qyCpCQbEMeb37yQTd8qATmMIy8
X-Proofpoint-GUID: 9XlBj9qyCpCQbEMeb37yQTd8qATmMIy8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104100138
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

Changes since v5:
- Maintain backward compatibility of driver on platforms
  without SAPB port by allowing driver to continue without
  HDCP feature instead of returning error


Parshuram Thombare (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
  drm: bridge: cdns-mhdp8546: Enable HDCP

 .../display/bridge/cdns,mhdp8546.yaml         |  15 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 128 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  22 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  92 +++
 6 files changed, 812 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
