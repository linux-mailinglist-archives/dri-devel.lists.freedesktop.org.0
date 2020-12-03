Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26962CE9DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F84E6EC82;
	Fri,  4 Dec 2020 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6EF6EB78
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:03:39 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3E0haC031334; Thu, 3 Dec 2020 06:03:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=NrKIqyLhj91qrGoEHTKSE8vZBk+vF/t2ziiLJj+MleU=;
 b=J4s24LtT/M4pWm9QA578/xjH9CtEcpQVOxa5zAvSHM6hNio+SZajVsQhzXwg/5TyUvVD
 whVJNVF3jyfhaEaeJrKbtP1IT9iIQGZJQA+ptYSBtgAiF/T4M8CjpQkBfZDYPPMMr8Kp
 f6G78SSH6BUK0GdpKw++l/wWissDmrRSwI5I2fXKot+IpCXo27R5XK1XJ6nG1rPEQnib
 vRc1oSFrTK4spqTeJyJXyTEBCNotz3rECJ7PKoPBY5gQZDHtI0gxWAUyzKOe3hUxrhWd
 UOk7BEjm2S+e1fqAwDeXsvIuVTyR/3LwAbP3nPf+dozD0nkNEQhvNuRMjSdr+EZMAGZ/ 0A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0b-0014ca01.pphosted.com with ESMTP id 355vn6f66g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbYMoSLj68++naItfKGBATXL62GE7RXlwZC9fPTWPHfGhvfiC06dZgTXBr5auQ+kUPSJqqMK4QvOTJErUf7jEk3jAnrxTMW/QISJ19fq9q+e6pikWXCopRVmT1RMQSyhq/66RTILXnAWlik+89wIa3vfEB8uNzHSXo2E9PZGENNuZ4kvuSc8S2WYjW9BpJSUBCZXC/pI7N1ha3fuAeaItcqmutLDJnWzhX0/AfgNigwH0K+yIX2L/iC42EzhCyLwbjoXqVdtf71l7cZ4BHaSZ28CAVp9wW+4mRRNr7GszZbXJ/DJhF1K2f4Xo9LMk1w0H5xR1Seg7xqWRRCCsUQSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrKIqyLhj91qrGoEHTKSE8vZBk+vF/t2ziiLJj+MleU=;
 b=YrR35rz80t6eJUnTs0X5IVXbywzBYylcruQOl70nGHNRDgaEmt71mIe7fN7g7XmelOKB73wMq8dS2A2mt3prUjUvuzlEi98ufc34nm77tdeqo0fsaHi7MPxpMWFx/Z9/LqHbMjM4s41g4dpZG4qh+v0+8j42dH5l4yHtLKElOtWhh/a3dh3y3yDlp0r2/04ZS7sH8uy1TnDV6dctq9rNRTNKFXhM+2IahVw7rkiG1aBYDxsGlRMSp6066II2FhRuBUtG1pK9Mmt5gAJT/ee8h5PQmOIjeI4TPITRdMcZ8iz2k0o8QRHmPe3un+Ld4aONkBMRhEAe5prN/r5cWJP7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrKIqyLhj91qrGoEHTKSE8vZBk+vF/t2ziiLJj+MleU=;
 b=uViFsmRvYyt3a53kSy7llxW1ylA6yq+ig+2aJ6hMKNxpAjsGSa2RYwW5cFNTxZOLlQaFj5FAzMagfM89l1g6X/8pRxLnjzMthmk9IByaleMe+sqOFi6MJvWYTkhHVVt59g6Y/NygqR7XtW84OXtMHPXNSbzyP8sQHmcjanoQaXA=
Received: from BN6PR07CA0005.namprd07.prod.outlook.com (2603:10b6:404:8c::15)
 by BN6PR07MB3426.namprd07.prod.outlook.com (2603:10b6:405:62::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 14:03:22 +0000
Received: from BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:8c:cafe::1e) by BN6PR07CA0005.outlook.office365.com
 (2603:10b6:404:8c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Thu, 3 Dec 2020 14:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT052.mail.protection.outlook.com (10.13.182.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Thu, 3 Dec 2020 14:03:22 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0B3E3FRK020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 3 Dec 2020 09:03:21 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 3 Dec 2020 15:03:14 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0B3E3EY2022337;
 Thu, 3 Dec 2020 15:03:14 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0B3E3Bju022333;
 Thu, 3 Dec 2020 15:03:11 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v3 0/3] Add bus format negotiation support for Cadence
 MHDP8546 driver
Date: Thu, 3 Dec 2020 15:03:08 +0100
Message-ID: <1607004191-22294-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f5bfab3-3786-489a-b13e-08d89794320c
X-MS-TrafficTypeDiagnostic: BN6PR07MB3426:
X-Microsoft-Antispam-PRVS: <BN6PR07MB34269A855E627CF1F47DA8FFD2F20@BN6PR07MB3426.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+fvkdmyjDyDzH2Du32Suh7+f6jZZ0TSPnTd5fgN5ogbmaAyxA/5zBZjqPcmjiaVYkD8Zcp5iqeIBH58zC85t+mainXaxI/MNv1myTYENXBcsi9Qx9eARozADyr2nkagsDFnx2LZ2Dxk44vpAbwzXwvLv6UfqFbCmAOaxI97xHk2yslQXx7el0Lprp4Gr+l4dYCLoOzo69uIB6wqctoycJRsOU5J1+Josn5q4T3TRT2k4RNLE5SpuVydzrd3zuq3SaGicdV12ig170dc418Z+iU2rM3x66znPa0ToMa/qwPpsVDmeZf8G50K4/1zFrHvZtqNtKFhgvC7NvJ4KXYxFm1c9oZ6wVo9L8c5kYr7BSpwPm6TIxBCFwB3erCJD5lOc1Q7DeLDY9BWCZxcKkIUthvvp6oxB1tf8WzTqESXH56dd3Hk/O41/JA9Se6l3lZuVjQnlONbWwc43syLVi52hT5SHxBsLVLlYRPxX5zaX2iv7bTgGpqUkbPH2KVUJ0lShcWRHAV9ZSO+i4m/Ey6y1nJJnftMkkILMFvyY6K+ZRju4FS/TmT4bQjj7vA+Ipp8
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36092001)(46966005)(966005)(2616005)(70586007)(70206006)(36756003)(83380400001)(5660300002)(54906003)(110136005)(316002)(6666004)(42186006)(36906005)(82310400003)(26005)(426003)(186003)(81166007)(478600001)(356005)(4326008)(107886003)(336012)(7416002)(8676002)(82740400003)(8936002)(2906002)(86362001)(47076004)(921005)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:03:22.3261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5bfab3-3786-489a-b13e-08d89794320c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3426
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030085
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, nsekhar@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com, nikhil.nd@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add bus format negotiation support for Cadence MHDP8546 bridge driver.

The patch series has four patches in the below sequence:
1. drm: bridge: cdns-mhdp8546: Modify atomic_get_input_bus_format bridge function.
   Return all the input formats supported.
2. drm: bridge: cdns-mhdp8546: Remove setting of bus format using connector info 
   Remove the bus format configuration using connector info structure.
3. drm: bridge: cdns-mhdp8546: Retrieve the pixel format and bpc based on bus format 
   Get the pixel format and bpc based on negotiated output bus format.

This patch series is dependent on tidss series [1] for the new connector model support.

[1]
https://patchwork.kernel.org/project/dri-devel/cover/20201201121830.29704-1-nikhil.nd@ti.com/

Version History:

v3:
 - Modify the atomic_get_input_bus_fmts to return the MEDIA_BUS_FMT_RGB121212_1X36
   as default format.along as tidss currently supports only this format.

v2:
 - Remove the Add output bus format negotiation patch from the series, 
   as we use ouput format as MEDIA_BUS_FMT_FIXED and that is  the 
   default value if atomic_get_output_bus_fmts function is not implemented.
 - Return NULL if output format is not MEDIA_BUS_FMT_FIXED.
 - Return the supported color formats based on the display info structure.


Yuti Amonkar (3):
  drm: bridge: cdns-mhdp8546: Modify atomic_get_input_bus_format bridge
    function
  drm: bridge: cdns-mhdp8546: Remove setting of bus format using
    connector info
  drm: bridge: cdns-mhdp8546: Retrieve the pixel format and bpc based on
    bus format

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 171 ++++++++++++++----
 1 file changed, 138 insertions(+), 33 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
