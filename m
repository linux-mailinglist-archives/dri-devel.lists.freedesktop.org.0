Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFFA2B3B16
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80BE89F5B;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A1A6E489
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:06:16 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AD9S7fi004361; Fri, 13 Nov 2020 01:46:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=EYr6CTUBLPObSr9DeyLmV0pQtg0838zTXGUSazlufDY=;
 b=X60gEsuIwudhztLoNqn0oLYQOGrODFwcpc0JsmBD/zYMzoC6h3ae2Wd8untvwUTXrfuG
 hbg0NN53PGKIzXkW9P3YzoutQ1AyCAHgwbcIO7dBgb+2OkTV6ldcRd81lyOY8Qdjhf6V
 ueEpFJByXDqbaXMmW/+SrKX96hgI4n+ojrX3Nls+Fa39yqHd9LOBQpQDAWV8HtPnvSZJ
 YJXTdAJ4V3anl7KDawfAOuU+TSEyKDAyiluDcf10rQ1jXejXFxZnVzUub/uFWYnvwPLu
 NtJarEWHh3hFDUONby/KHartHdsM574UywQT3bG9w/vnygOvUsY129S79oXW6kN+RwGv ag== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34ns14rw3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 01:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9u1AiKSrgveeKFbJCYLBwQRGYjAZD4abi0+doELAm94L7bHevCN2uX03B9ZbNbV+gXEDsme7qrxddEJfMRICCYlEF9P/zC47celMUlZCBqACup0gs81HwGccwMaNtArAjJ1cSiXRMrHOPMb31ccWIDINA4lkdnep3r1CPt7Pu7N2XKur1drvBp/zgkxYOIgMWWNW9QBaVUEV0SYs9mkTBVrf9wjZOWSdYfVVsDsXvSIogwapF0017JFt+4cMo+gz0kyL0y9vOZc3LGFhi1z9zSgzdUuFTbaW+3dFid0YXcBW6ulAdRlUNarLRgSQwsnC4FCi0/q5v/WHQ5aZR6OqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYr6CTUBLPObSr9DeyLmV0pQtg0838zTXGUSazlufDY=;
 b=ccc/N/NX0nBIqW97+F+KqtCBM0hU0pmCY67q0ycMt7hEJ/DH0HIuP9RHUUmDYEFXdcDxPx0LpMfoZUcBQ+pkd482mHTx6jKIh8PCDUFUYVRI65sXvjzGI5vOIpdQkpK6+bjS6uqQkn//Ak4fGNUEcr4BVZg5hc0WqaEnDRWrLAh6a4oOuXkX1t2pMppKBe3dYCtriG4BgdlvvA+z/0ybxBulpy+Kejio/53J1SIwklznPN7oR7M8IO/ZCxwp+f08EKddtQIrJupRb3DNPHfGdY952i1s8dkiEwR55HpeUpMnl4mUsQVJsD96takB8+hsheCrmfVIeVdQqnKU5jgEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYr6CTUBLPObSr9DeyLmV0pQtg0838zTXGUSazlufDY=;
 b=WTNmYpcvFDFjvicnF9tp6fgPxrXNSAtjqoFJRMrxhhOoQIm1GZZsMOogMaO5T2QtllP9Hu82JS8rPbjoEBt3pBoLy56Wg159kQBwZUipgIfjPo60c1n6tx6cLZZg87n6ga4ybE+oGgVK4jAl6v4vaft7MdcP69NHdFiBvMrhd8o=
Received: from DM5PR19CA0046.namprd19.prod.outlook.com (2603:10b6:3:9a::32) by
 BL0PR07MB7923.namprd07.prod.outlook.com (2603:10b6:208:85::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Fri, 13 Nov 2020 09:46:51 +0000
Received: from DM6NAM12FT020.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::91) by DM5PR19CA0046.outlook.office365.com
 (2603:10b6:3:9a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 09:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT020.mail.protection.outlook.com (10.13.179.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.12 via Frontend Transport; Fri, 13 Nov 2020 09:46:50 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 0AD9kgJH009933
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 13 Nov 2020 04:46:43 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 13 Nov 2020 10:46:41 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 13 Nov 2020 10:46:41 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0AD9kflG029848;
 Fri, 13 Nov 2020 10:46:41 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0AD9kZoN029843;
 Fri, 13 Nov 2020 10:46:35 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v1 0/4] Add bus format negotiation support for Cadence
 MHDP8546 driver
Date: Fri, 13 Nov 2020 10:46:30 +0100
Message-ID: <1605260794-29806-1-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d750e702-b9fe-44bb-bcf9-08d887b90bbb
X-MS-TrafficTypeDiagnostic: BL0PR07MB7923:
X-Microsoft-Antispam-PRVS: <BL0PR07MB792311ED71C1FCC061C87955D2E60@BL0PR07MB7923.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPetp4ARXbTbyCGYh01P/VblyqjZjH7Fw3P95fXa0nqIlgutHaY3rJWeOld59/p4OiDzqGrVAWMFBrncylYYBsjoYFXoG7t/M4qqqWdhLIGfflDMLpOOKrTz0TYp4NZHRjJGP1E04FcY+5/f18Uf3eCdORiURM5Inez8EABGmOoyYvMQXtFQj0C4bux/xW9NCgj+EpyteXoICjfxbKKh8F6c09LctkqH7fz8PBdaU+xw2+u2G1YYSw0c29ooDI9+uFQVntivsSTPRXRN36jiInx2iPJ3J6psF1N2jivmUwp56w497WlFiW9h5mMEefhBhCOT9ZCKe6j9urmaEw+Uxw9YQRj0IDk43AIGr8F/H3wGXt7rEMKgzQU84SGCK+hFQzRXLb3jouzeR6//8IUMIISABUQOf7PwAyjXfpPL72E88S7qi1Mkc+qTKYbb3KwQIuwvB9xtb9ROzv5kLjQFSTS6O54Zzj9GB9pdEwOkGjTYT3Zm5ldN6eycC85+SyjPEvFoyyYOqV9RaivJyQs2yyfyenUdCe4Dj37t4Ko8Jht+NXWflbVj0KPJLJWEwP2V
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(36092001)(46966005)(81166007)(86362001)(82310400003)(186003)(356005)(47076004)(336012)(107886003)(5660300002)(82740400003)(83380400001)(70586007)(8936002)(8676002)(110136005)(6666004)(966005)(316002)(7416002)(36756003)(42186006)(54906003)(36906005)(4326008)(426003)(70206006)(2616005)(2906002)(26005)(478600001)(921005)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 09:46:50.7648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d750e702-b9fe-44bb-bcf9-08d887b90bbb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT020.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB7923
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_07:2020-11-12,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130057
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

This patch series add bus format negotiation support for Cadence MHDP8546 bridge
driver.

The patch series has four patches in the below sequence:
1. drm: bridge: cdns-mhdp8546: Add output bus format negotiation
Add minimal output bus format negotiation support.
2. drm: bridge: cdns-mhdp8546: Modify atomic_get_input_bus_format bridge function.
Get the input format based on output format supported.
3. drm: bridge: cdns-mhdp8546: Remove setting of bus format using connector info
Remove the bus format configuration using connector info structure.
4. drm: bridge: cdns-mhdp8546: Retrieve the pixel format and bpc based on bus format
Get the pixel format and bpc based on negotiated output bus format.

This patch series is dependent on tidss series [1] for the new connector model support.

[1]
https://patchwork.kernel.org/project/dri-devel/cover/20201109170601.21557-1-nikhil.nd@ti.com/ 

Yuti Amonkar (4):
  drm: bridge: cdns-mhdp8546: Add output bus format negotiation
  drm: bridge: cdns-mhdp8546: Modify atomic_get_input_bus_format bridge
    function
  drm: bridge: cdns-mhdp8546: Remove setting of bus format using
    connector info
  drm: bridge: cdns-mhdp8546: Retrieve the pixel format and bpc based on
    bus format

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 216 +++++++++++++++---
 1 file changed, 182 insertions(+), 34 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
