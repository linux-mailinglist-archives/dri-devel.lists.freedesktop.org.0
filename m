Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BD327D05
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 12:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3E66E598;
	Mon,  1 Mar 2021 11:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B066E598
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 11:21:49 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121BGad9001180; Mon, 1 Mar 2021 03:21:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=YdOTTTmthyeX4DdIf5Yn2ilWDMUePf3yyQ6zpmI7RyY=;
 b=BKuYXEIC+LKv+4dpbOB9V0GUljE7WCU2GVjPXkgCxVhynqUfGbKiYwd4m1NwaK73wfKZ
 VUWzR7JU4iwxvCER5uFaePLMy4nRKRDzmbxa1uG2Z6kj6x8EPRaoauaYe9AqwJA1TD4X
 /cngvBPIAswjpyCBWVxP5vGRh7b51+KOHdwyl28rVsqFRpTJrcL37fMQDbp1QJ6u51QH
 61NVpxoJfWTPlctQGzTRXNXV9BvKv7X4xO5YkdIe77OrxnZVmMrLjH3xOyjp8FVlPOL8
 IBv0JWfns1Niw2ojGasm2aD1wLWwXgf2yHxHhol0k8vp84cZkmQQshFukTDkp21gzkNf bQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-0014ca01.pphosted.com with ESMTP id 36ykh1mpcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 03:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1zWxtki/JEz6MRoAyv0aMTTODTnef6ViwW0UIig3uVSEun3dnNn8pv3+WS/PEETzYtiJx9gLT0ewnwmlxpyfv/Tl16MPC2Zfz9wsZe45L2JTElZJB/Uwlhe8o/o62RE/DQitZ0dOIccWvrgNB7RnVtydZbZQLw8ZBjG3gImloOR840LKOGfUl6TXSQ5Zx+F+H7WDx8KUuokLo63HtjHziNUyE7kKk6cxIcvQYHFh6yih4ZvK1ZrdeJWyvVaadhg3kyw00Rh7hqPN8LkaVE3tdZE7dgu9cH1odqP4lqzOAdRpU8ceOVX1C9zlSGTRmU+9WfxRj3EMWsZZdlQ1c1XtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdOTTTmthyeX4DdIf5Yn2ilWDMUePf3yyQ6zpmI7RyY=;
 b=GzxsKxqO/XGQQtGqkC8ZVoCld5GcyEvtPKHzFVdVLVCwEnflYHe/owPLnhitZoVOazbIOI+Bo/onCua1gfl7H6BWak5U8HnOtonRTam9IvqvuaYMn+kq9XSDFscQ5jHYUWY4vOaeRLLgzrmNpSjRi8iNtqCnfVnmvkBfFmXqZ26T+9P8OtMLh4V6v6bngrtxs8Uua79qPSO+SuT7ojMGmzYVeq24wJ+QAfK2I2fxbxau5F+fUg2GJbQQy4h4tHQEXP3sl/H7atBfA0yPehSIm8hnNJWGmn/z1FODbhBfWW9x+G2ozVFADKeBE7B6dOqR9nBy0B5FwWlc7/pKqPed6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdOTTTmthyeX4DdIf5Yn2ilWDMUePf3yyQ6zpmI7RyY=;
 b=1Pqn09ytVpH8Z3R3Pi5/V2qYUtZfFMlFbmZcYdsxUO+zkYpU365e+ciT3gVgerLIKZ92dCkFDGqX9roiRKfS0NRL2LDzBrVW8dOXJ5qMOdzqAsX4/im0nWQ8sS3SvDD3xjLmmLkjgC+yjedUHEensBZ3JlQfOWkQy7mfYAy5jsA=
Received: from DM6PR02CA0129.namprd02.prod.outlook.com (2603:10b6:5:1b4::31)
 by BL0PR07MB8083.namprd07.prod.outlook.com (2603:10b6:208:1c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 11:21:36 +0000
Received: from DM6NAM12FT052.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::56) by DM6PR02CA0129.outlook.office365.com
 (2603:10b6:5:1b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Mon, 1 Mar 2021 11:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 DM6NAM12FT052.mail.protection.outlook.com (10.13.178.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Mon, 1 Mar 2021 11:21:36 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 121BLUXG019451
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 03:21:32 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 1 Mar 2021 12:21:30 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 1 Mar 2021 12:21:30 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 121BLU8i004260;
 Mon, 1 Mar 2021 12:21:30 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 121BLSN0004244;
 Mon, 1 Mar 2021 12:21:28 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] enable HDCP in Cadence MHDP bridge driver
Date: Mon, 1 Mar 2021 12:21:25 +0100
Message-ID: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c48adc79-01a5-403f-37f4-08d8dca42d27
X-MS-TrafficTypeDiagnostic: BL0PR07MB8083:
X-Microsoft-Antispam-PRVS: <BL0PR07MB80837F71F82BDC37FE6CA343C19A9@BL0PR07MB8083.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/5/Kb/efShxOK62uze4/AK6lszFjKPtr9P/uINFu5dlAWE9oUI5egC8o+QSONihTNazRgvzLnywpCdBg7f3ezOAuM6PoeKovJgYW5mObvBVRnzpX0cyYQRZzJeFy6U2uAkMPQmuFO+pP3XZmV3DX7ZLVg9f0DTIC3AHXqaS7yBIuE5BOXywNnBEjCmv6Sww7qN2GeG7VPGkSsr6MH60OT14atcBRCeszRlg7JeVee95uNZc/MejSsWXatjXTKjiILczAarfraak6TR+bt3de+NIDx9frX6Ulr9EW1YpUks636cFEDb225+3jTWCfqumLcBmkCLXW6vxUnLVbI9hTnCQp7bAVHiI7giWexAx0dnamtlYUgMEoQu3G30bn2JiQfms3La7Im/GY4YWVxvnDkij+eTPdFgxGucIYVVencuP5cPb+fOGEogy01OPWCzK/ZwtbDGAIXSjekZREX9GhZfZ51O04vKRxNVgeqp1OWGyRyKI4TAQwpceteWCL0pSav0JuUI6++wkt8Cb8PLnayLpMSKL9rxQHlD6rEnIoOSh6487CXdCZ/ZAQ7YJiFSdV1DWagUipAYB0R6RhZB90wGwMiGD+t1gidgdcb5Ka2OBabOGs9BDAlHqr1UAxHCNAJm0tAa+/ie/Tbm2dZJjXYSiI7TTlIJa1RtZq1b1myTk8NzSOUddiD3S/KtCp5H2scX+dv0LVa3zIs7SylX3Wg==
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(36092001)(36840700001)(46966006)(26005)(8676002)(356005)(36756003)(70206006)(70586007)(86362001)(82740400003)(47076005)(186003)(42186006)(107886003)(4326008)(316002)(7636003)(36906005)(83380400001)(7416002)(478600001)(36860700001)(4744005)(5660300002)(110136005)(426003)(54906003)(82310400003)(2906002)(6666004)(8936002)(2616005)(336012)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 11:21:36.2187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48adc79-01a5-403f-37f4-08d8dca42d27
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT052.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB8083
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_05:2021-02-26,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=804 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010096
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

Parshuram Thombare (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
  drm: bridge: cdns-mhdp8546: Enable HDCP

 .../display/bridge/cdns,mhdp8546.yaml         |  29 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 105 +++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  21 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 578 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  89 +++
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   2 +-
 7 files changed, 802 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
