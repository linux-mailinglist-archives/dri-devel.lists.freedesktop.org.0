Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B282A9B7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D7E10E862;
	Thu, 11 Jan 2024 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286D10E85D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 08:52:41 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40B8Dtxs019796; Thu, 11 Jan 2024 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=ekyKYru3eoNh9nvs9iXHGfG+5xivr98/9M02ExTkTJE=;
 b=kFyTYUIvu+Wlo5ZOF5+h06OJ2OfwqHISM4HvVaTqpWxnBajAFZdrI7bNGwhRfmzzeGvH
 9Qn/ZH4GMxV8jH0NITLFZ1a9C0d17HA2osjPcXSncdMlMHxqQNrDtBdfJtC0izj1RaqN
 dkVl3iekCQxEYubXk9sITwhP7GgZ/avaxtkAKw9cZTnf4u31VaUO9JBdZF66yMMqKova
 6RWphO4SKjzH8xPkIhdnfpkJaIj/QEYHDRZ6xC1e5FIOGpvqLSlnrROzUuGRp7+x0thu
 ZceFFyVYAFhbl4r4K+/uMwnHKuOnEj3v3bAmWtma7QrrRpw9tcujMn/AgLmV85g9C719 gA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vj4wwgmkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jan 2024 08:52:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 40B7Qb8K008915; Thu, 11 Jan 2024 08:52:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3vfuumtg37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jan 2024 08:52:39 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40B8qcEB015240;
 Thu, 11 Jan 2024 08:52:38 GMT
Received: from localhost.localdomain (dhcp-10-175-42-70.vpn.oracle.com
 [10.175.42.70])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3vfuumtfy5-1; Thu, 11 Jan 2024 08:52:38 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] doc: admin-guide/kernel-parameters: remove useless comment
Date: Thu, 11 Jan 2024 09:52:20 +0100
Message-Id: <20240111085220.3693059-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_04,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401110070
X-Proofpoint-GUID: rhWUPKgf1S5K6dr-q8kFJLlMgeJRCvlc
X-Proofpoint-ORIG-GUID: rhWUPKgf1S5K6dr-q8kFJLlMgeJRCvlc
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This comment about DRM drivers has been there since the first git
commit. It simply doesn't belong in kernel-parameters; remove it.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 102937bc8443..4410384596a9 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -218,8 +218,3 @@ bytes respectively. Such letter suffixes can also be entirely omitted:
 
 .. include:: kernel-parameters.txt
    :literal:
-
-Todo
-----
-
-	Add more DRM drivers.
-- 
2.34.1

