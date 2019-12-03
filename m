Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2610FDFC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BF66E4CB;
	Tue,  3 Dec 2019 12:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E300C6E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:40:12 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AE61a026007; Tue, 3 Dec 2019 02:14:21 -0800
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2057.outbound.protection.outlook.com [104.47.45.57])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awsnebsshWaYHyACC6/PLX2OWcE7bNKyGrPSkyMkzjpQbH18bY6/lW3A2DPBwptI2RM/tC/s5rU4Oev5MlzFCqAgds+hrjOOokv8BkfBJ1YBdFPVsq2V5eND39NuB+iSRi04WrWyszF16EHdcpZFJQUWPZWECe37Daa044i7husdWSqwfIqZgGSm3RJXwZ4jdKcFjpy9wdprfCbeFzoRSio9nLGWTi3K/UREAWjcdDphq9lIQ0QZ9eqTqkmR185TrlpnnoWsprx2kaWINhUt7iTUJBQFJaz3qlOYRRyn+BQKMc+5TcKCz9qbMXA4uHM/RxrjHzIZg+ssIq9p/AICig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMkbLO17azLuNd0Mml0yUUzSefeiNPLw9O43k2jMHSg=;
 b=eAgtVGiNR1Yua8/1sAxZVu9J4TYFHMSZ559jOjPxgAbZOJZsFdf0CBoRLj8r+dKIEJOA43s605Sm6HMLZyO7LdbUfsidJkBL7XLj9DbaP+jpL8NJhwcCQpAmItoKxvFQj368mme9mvYrE9mSIwiQ7tLn6r7yKzYn8wNhO4eeQ/ymuGUUGHy8nLo+0GrnQE5U+Vem0KPO+NDmbrrWroKIRBeIc/aUUBGOMFA9hrVj9d4w1tBIGYC0GO774okw1uW/iG0Y01uJyxUO6F2cLgU/eeQH+QBe3Xz38WlFGGSJdTXWj799RG9jghy8Pw21i0/GIQzS9f/ci4tEjQ8ATgWgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from SN4PR0701CA0026.namprd07.prod.outlook.com
 (2603:10b6:803:2d::24) by DM6PR07MB6282.namprd07.prod.outlook.com
 (2603:10b6:5:17e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 10:14:16 +0000
Received: from MW2NAM12FT011.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::201) by SN4PR0701CA0026.outlook.office365.com
 (2603:10b6:803:2d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:16 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 MW2NAM12FT011.mail.protection.outlook.com (10.13.180.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:16 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7sx027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:15 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:09 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:09 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE9hF030949;
 Tue, 3 Dec 2019 11:14:09 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE92B030947;
 Tue, 3 Dec 2019 11:14:09 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 10/15] phy: cadence-torrent: Add PHY lane reset support
Date: Tue, 3 Dec 2019 11:13:20 +0100
Message-ID: <1575368005-29797-11-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(36092001)(4326008)(2351001)(26826003)(107886003)(87636003)(478600001)(6916009)(2906002)(36756003)(16586007)(305945005)(42186006)(54906003)(5660300002)(7636002)(316002)(70206006)(6666004)(86362001)(76130400001)(48376002)(356004)(50466002)(446003)(426003)(11346002)(336012)(246002)(2616005)(76176011)(26005)(186003)(50226002)(51416003)(8676002)(8936002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6282; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d6b2ebc-faa1-4198-57fa-08d777d98d7f
X-MS-TrafficTypeDiagnostic: DM6PR07MB6282:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6282B3ED7FD0F2038A67516BD2420@DM6PR07MB6282.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbNNTMWm/OAklQVdNNOzp+QzelG+nVzg9/DLY1HHOFmisYAJo5Y0Vi0rER5xAOnO9mECZEr9GGcxj2+ivBna3yYqxV7z7V8Bs9LYg4woy92FiCB8etrAZ+bNW8tobjErbKDEpoFScPf0CdL0KnQV+KXoFwEncwFSWlT+pdymYlM3O9C1U+AVDeUPrnNCC11AOBv5X81mGWavlFb2NVTEaDx4MwfKcPQ18581dXgqYfuarSWk+b3+mFObt8MCbjSXxow3fX7iyraxaYkAbFG79lrWfdLx7f3PrhGfczcjizKTBHLGDC7lcJEjXS4SKT7MJMCNXaaeuYfdSO8Ice6JYhWMq6jibYzXfyZAck7RaeE9mfk9/ClhWD8OUSBd1fQjNlSm/yedBUmkmzJfFcmx69xJYdpyJLlYIHfp5s/gFguW3MFfe0xDuDsVr5ZYkPCXE3Gy9GLCbws+MhN4vLZz7A==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:16.1235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6b2ebc-faa1-4198-57fa-08d777d98d7f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6282
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=883
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=vMkbLO17azLuNd0Mml0yUUzSefeiNPLw9O43k2jMHSg=;
 b=H7pSqISqeMCSp/BbbxPBhBjwH1Y3tmQQ2jNEkyVBsH+XpcVOjnKQ37TTURHM+0UJaQ4T
 Wa2nFRcnNTGfSVeEo6frgQhruXxRkG9aG9roedkF8UUV3l1I7GX7w1DFucCpbX+2yw8p
 lrJ9jazsaFC29u03Tr9qTrcCGBIVvu8USFB5hf2IneB8m78ciI7a/wJSUBDuvXdnWnkY
 sy02dobxyNiesDy23paM243u+8mUzTue2lCAHNJC6EFoKlFX52ZoVB2vEPpWwMVsFMPo
 i0hXtKGdXLMm9moy7xJW+iuAF+yXJ35R6i/D7nJIM/cI7296h+XfpxVd24p11lXGu/2r JQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMkbLO17azLuNd0Mml0yUUzSefeiNPLw9O43k2jMHSg=;
 b=WXG7+RqF9OofwyjJekLgp0CwTPg9O5dqZrmGb3xfohzbi4Dm+9ytWXCeCQ30FnUyvPD3bVir6GM7WLGQ/aYNczaKJ2ieuNc5zet5gbUrfH0IrNi5ytDO0Cc8u2fymgJ3e+bkHDVKagaQtKhqlZ/uoKbaIMcFYWTAp/9F1qTuRic=
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

RnJvbTogU3dhcG5pbCBKYWtoYWRlIDxzamFraGFkZUBjYWRlbmNlLmNvbT4KCkFkZCByZXNldCBz
dXBwb3J0IGZvciBQSFkgbGFuZSBncm91cC4KClNpZ25lZC1vZmYtYnk6IFN3YXBuaWwgSmFraGFk
ZSA8c2pha2hhZGVAY2FkZW5jZS5jb20+Ci0tLQogZHJpdmVycy9waHkvY2FkZW5jZS9waHktY2Fk
ZW5jZS10b3JyZW50LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvY2FkZW5j
ZS9waHktY2FkZW5jZS10b3JyZW50LmMgYi9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNl
LXRvcnJlbnQuYwppbmRleCA2YzNlYWFhLi5lYmMzYjY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Bo
eS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYworKysgYi9kcml2ZXJzL3BoeS9jYWRlbmNl
L3BoeS1jYWRlbmNlLXRvcnJlbnQuYwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4
L29mX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogCiAjZGVmaW5l
IFJFRl9DTEtfMTlfMk1IegkJMTkyMDAwMDAKICNkZWZpbmUgUkVGX0NMS18yNU1IegkJMjUwMDAw
MDAKQEAgLTE0NCw2ICsxNDUsNyBAQCBzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSB7CiAJdm9pZCBf
X2lvbWVtICpzZF9iYXNlOyAvKiBTRDA4MDEgcmVnaXN0ZXJzIGJhc2UgKi8KIAl1MzIgbnVtX2xh
bmVzOyAvKiBOdW1iZXIgb2YgbGFuZXMgdG8gdXNlICovCiAJdTMyIG1heF9iaXRfcmF0ZTsgLyog
TWF4aW11bSBsaW5rIGJpdCByYXRlIHRvIHVzZSAoaW4gTWJwcykgKi8KKwlzdHJ1Y3QgcmVzZXRf
Y29udHJvbCAqcGh5X3JzdDsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJc3RydWN0IGNsayAqY2xr
OwogCXVuc2lnbmVkIGxvbmcgcmVmX2Nsa19yYXRlOwpAQCAtMTgyLDkgKzE4NCwxNCBAQCBzdGF0
aWMgdm9pZCBjZG5zX2RwX3BoeV93cml0ZV9maWVsZChzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSAq
Y2Ruc19waHksCiAJCQkJICAgIHVuc2lnbmVkIGNoYXIgbnVtX2JpdHMsCiAJCQkJICAgIHVuc2ln
bmVkIGludCB2YWwpOwogCitzdGF0aWMgaW50IGNkbnNfdG9ycmVudF9waHlfb24oc3RydWN0IHBo
eSAqcGh5KTsKK3N0YXRpYyBpbnQgY2Ruc190b3JyZW50X3BoeV9vZmYoc3RydWN0IHBoeSAqcGh5
KTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwaHlfb3BzIGNkbnNfdG9ycmVudF9waHlfb3BzID0g
ewogCS5pbml0CQk9IGNkbnNfdG9ycmVudF9kcF9pbml0LAogCS5leGl0CQk9IGNkbnNfdG9ycmVu
dF9kcF9leGl0LAorCS5wb3dlcl9vbgk9IGNkbnNfdG9ycmVudF9waHlfb24sCisJLnBvd2VyX29m
Zgk9IGNkbnNfdG9ycmVudF9waHlfb2ZmLAogCS5vd25lcgkJPSBUSElTX01PRFVMRSwKIH07CiAK
QEAgLTMxNyw2ICszMjQsOSBAQCBzdGF0aWMgaW50IGNkbnNfdG9ycmVudF9kcF9pbml0KHN0cnVj
dCBwaHkgKnBoeSkKIAogCS8qIHRha2Ugb3V0IG9mIHJlc2V0ICovCiAJY2Ruc19kcF9waHlfd3Jp
dGVfZmllbGQoY2Ruc19waHksIFBIWV9SRVNFVCwgOCwgMSwgMSk7CisKKwljZG5zX3RvcnJlbnRf
cGh5X29uKHBoeSk7CisKIAlyZXQgPSBjZG5zX3RvcnJlbnRfZHBfd2FpdF9wbWFfY21uX3JlYWR5
KGNkbnNfcGh5KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpAQCAtOTQ1LDYgKzk1NSwyMSBA
QCBzdGF0aWMgdm9pZCBjZG5zX2RwX3BoeV93cml0ZV9maWVsZChzdHJ1Y3QgY2Ruc190b3JyZW50
X3BoeSAqY2Ruc19waHksCiAJCQkgICAgICBzdGFydF9iaXQpKSkpOwogfQogCitzdGF0aWMgaW50
IGNkbnNfdG9ycmVudF9waHlfb24oc3RydWN0IHBoeSAqcGh5KQoreworCXN0cnVjdCBjZG5zX3Rv
cnJlbnRfcGh5ICpjZG5zX3BoeSA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOworCisJLyogVGFrZSB0
aGUgUEhZIGxhbmUgZ3JvdXAgb3V0IG9mIHJlc2V0ICovCisJcmV0dXJuIHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoY2Ruc19waHktPnBoeV9yc3QpOworfQorCitzdGF0aWMgaW50IGNkbnNfdG9ycmVu
dF9waHlfb2ZmKHN0cnVjdCBwaHkgKnBoeSkKK3sKKwlzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSAq
Y2Ruc19waHkgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsKKworCXJldHVybiByZXNldF9jb250cm9s
X2Fzc2VydChjZG5zX3BoeS0+cGh5X3JzdCk7Cit9CisKIHN0YXRpYyBpbnQgY2Ruc190b3JyZW50
X3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCByZXNv
dXJjZSAqcmVnczsKQEAgLTk3Niw2ICsxMDAxLDggQEAgc3RhdGljIGludCBjZG5zX3RvcnJlbnRf
cGh5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKElTX0VSUihjZG5z
X3BoeS0+c2RfYmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKGNkbnNfcGh5LT5zZF9iYXNlKTsKIAor
CWNkbnNfcGh5LT5waHlfcnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9leGNsdXNp
dmUoZGV2KTsKKwogCWVyciA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJudW1fbGFu
ZXMiLAogCQkJCSAgICAgICAmY2Ruc19waHktPm51bV9sYW5lcyk7CiAJaWYgKGVycikKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
