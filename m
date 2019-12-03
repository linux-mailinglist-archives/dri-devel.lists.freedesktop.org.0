Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2410FE0D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358846E507;
	Tue,  3 Dec 2019 12:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 954 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 10:30:10 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D276E133
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:30:10 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AEB44026031; Tue, 3 Dec 2019 02:14:24 -0800
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ickGFUYZ4BJbn7wE60w/8hb16YbRmzkAzy9OsKhr55vbaGaVsURJ3/HGiwZ1RK6VF4pI2KWsXetNUeEXdvYS2UgzpbVB7XlZ3tCxlCfNkIQFYCGcx++YTVqoeGS6poEFZgp/LQnTNyVvS7lebG5y7EsgQjTYH5tVegvYK0v5ODV1p6mUVg7OHUxbkEx84rWZHmWKJjZDgC2dHweo2eXIz85ACNftARNQEGd7Vg3nDEWOaK640FYdy8NMt5/mppWn9eQXgLlRWAtAh1frQmnrDilg3n0qaG+4sCopMTc12KVRGTHtk5n7tLpo6ztpxcFQo20tPy1bmrjW+0noPIYIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMwYk7Vbk+GcfyXCnGEzljsLjF9Ya23s2syjQo+6bT8=;
 b=lSdymf0fJrsTFTj+m79gO1jo81ZSu30o/iZNs7YZTQ9t79QcEB+g46PE7LYp4tJPnw15zTT496Xq+8KlYgCURLZ8MODroteyl/ZA2rX5H7r2X61r2WIpBld/c1eivmY4xe4yeEubD9OO/HjvUWkkOoYmhF/7fP6EqBgqZCuHL/vQIAtpw6Fm7HBuGlEhINi28YYiW7KEGkjkAu8ipV4kp3gkMFf9yyz4+kpMGuM7i8fuafhY8oPBqCymY6PLDhJT5VToPAUy9YHtnmRIiwK2OdcsCa8DOwySita4IUfGQZd1YrH+CF0/ClG4izt+/IYTwsWc+bMyvAm3l9/UG2AmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from BN8PR07CA0019.namprd07.prod.outlook.com (2603:10b6:408:ac::32)
 by MN2PR07MB6333.namprd07.prod.outlook.com (2603:10b6:208:110::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 10:14:19 +0000
Received: from BN8NAM12FT048.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::204) by BN8PR07CA0019.outlook.office365.com
 (2603:10b6:408:ac::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BN8NAM12FT048.mail.protection.outlook.com (10.13.182.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7t4027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:18 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:10 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:10 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AEAaD031003;
 Tue, 3 Dec 2019 11:14:10 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AEA2k030998;
 Tue, 3 Dec 2019 11:14:10 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 15/15] phy: cadence-torrent: Add platform dependent
 initialization structure
Date: Tue, 3 Dec 2019 11:13:25 +0100
Message-ID: <1575368005-29797-16-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(36092001)(199004)(189003)(26826003)(4744005)(26005)(5660300002)(107886003)(4326008)(36756003)(6916009)(51416003)(2906002)(76176011)(87636003)(478600001)(86362001)(186003)(336012)(16586007)(316002)(54906003)(6666004)(426003)(42186006)(356004)(70206006)(76130400001)(446003)(50466002)(7636002)(305945005)(8936002)(50226002)(8676002)(2616005)(11346002)(2351001)(48376002)(246002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB6333; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39c2aadf-043e-4a8d-2e68-08d777d98f79
X-MS-TrafficTypeDiagnostic: MN2PR07MB6333:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6333BA35F73BE3A8CA451C1DD2420@MN2PR07MB6333.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSOnL9YvQmOFSU5Acsy9v3QIWpUtPbWbCddIjiygMRlhwWeLv4LKoNxBQkPLmo3k6pMRxM5NNaIsUJh9IRHhyGFq8nLTv67+Mc1iZxmPavTZMXRsCSIOy7hLpB8F4lqpCLeluuHSvc7Cc9yD6v6o3P+M+tJ2VQ2sGEWAueFi0bt8zy7Ikdm9dcOfIGIfnQFbEZURQJopU6hQyEFHWEzx7fFgYXrokLQ7otJ3rUse4c4gs5dAlX1s0JH7OvIYCR6mSTMUnfQXqPJndwaY9WkuYIGA+lMbxOo/kaYxxk/EUkm4P9SrfNSbKcpJEJqrBM9s8okMVsNCJOMyavga75m1ztsKoSR+wRxs+eH7cOC42Ci+exz4IjnczLQZw0bDYVNtrhkwMYntCV9QBXvS/5SvLBE30S2j0WFE7wL7487DLR9wjxo8VMusPT2WvvEE7HGicwjODSnxLCSqomemYA6DRCZ9EbML5XBPGDaxieQ4sLAv1x5lVtmWGiY+MqO8DJpk
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:19.0616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c2aadf-043e-4a8d-2e68-08d777d98f79
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6333
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=jMwYk7Vbk+GcfyXCnGEzljsLjF9Ya23s2syjQo+6bT8=;
 b=hU5zZbSZ6fFdpWr4HbIbs9WRteaWkszddXOhL/ZcqVxOYbHRGADxuXIj02/1k5gr6lQt
 /vXHVhEWNKrHni6gQe1q6jsjwV0SIq618NP1BgHP70NCemM48vmVD7LG+lzn1k1khfkp
 uvu93RbVB031tade8Gqxe+fdDQBpqYy6QYNMhBV4IkQnfyBKLW5NOajjeiE4MtTpyyPS
 2WJEHTukw/hGKPsxycCIQRV+oL0j1IkrzIYbPVDKFymVzj0XCtwKMR0+OgJXZbnrAAzf
 viS+Hdb1hX9Ue2cwFbTgH4hxyNszvkibQPCkHId7EcX1gNLfgbVb41BR9GDBDrqI74VF eg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMwYk7Vbk+GcfyXCnGEzljsLjF9Ya23s2syjQo+6bT8=;
 b=XdcR0Xbqewc+dtrtRwXVdmY38MMxYr5HHq0PYcTRvr28i4MqxK/QKlu+8iQSEmxstmTdkuy5dT9NvVPdKGL9QJ1DGtwgsKNqzgSyzAt5WhiYTIBfhuG40yqSjGq9FK4tO3v1Q42Ros8Y6X/WBcDZDvRJ6lAin/tb7su8z+q92BI=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com,
 dkangude@cadence.com, jsarha@ti.com, kishon@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHBsYXRmb3JtIGRlcGVuZGVudCBpbml0aWFsaXphdGlvbiBkYXRhIGZvciBUb3JyZW50IFBI
WSB1c2VkIGluIFRJJ3MKSjcyMUUgU29DLgoKU2lnbmVkLW9mZi1ieTogWXV0aSBBbW9ua2FyIDx5
YW1vbmthckBjYWRlbmNlLmNvbT4KLS0tCiBkcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNl
LXRvcnJlbnQuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvY2FkZW5jZS9waHktY2FkZW5jZS10b3JyZW50LmMg
Yi9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwppbmRleCBhNjRlZDRi
Li4yOWUxMjViIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRv
cnJlbnQuYworKysgYi9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwpA
QCAtMTc5MiwxMSArMTc5MiwyMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNkbnNfdG9ycmVudF9k
YXRhIGNkbnNfbWFwX3RvcnJlbnQgPSB7CiAJLnJlZ19vZmZzZXRfc2hpZnQgPSAweDIsCiB9Owog
CitzdGF0aWMgY29uc3Qgc3RydWN0IGNkbnNfdG9ycmVudF9kYXRhIHRpX2o3MjFlX21hcF90b3Jy
ZW50ID0geworCS5ibG9ja19vZmZzZXRfc2hpZnQgPSAweDAsCisJLnJlZ19vZmZzZXRfc2hpZnQg
PSAweDEsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBjZG5zX3RvcnJl
bnRfcGh5X29mX21hdGNoW10gPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJjZG5zLHRvcnJlbnQt
cGh5IiwKIAkJLmRhdGEgPSAmY2Ruc19tYXBfdG9ycmVudCwKIAl9LAorCXsKKwkJLmNvbXBhdGli
bGUgPSAidGksajcyMWUtc2VyZGVzLTEwZyIsCisJCS5kYXRhID0gJnRpX2o3MjFlX21hcF90b3Jy
ZW50LAorCX0sCiAJe30KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBjZG5zX3RvcnJlbnRf
cGh5X29mX21hdGNoKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
