Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320CF10FE02
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D636E4DE;
	Tue,  3 Dec 2019 12:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EC86E450
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:22:00 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3AEAZp026025; Tue, 3 Dec 2019 02:14:15 -0800
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2055.outbound.protection.outlook.com [104.47.41.55])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyurh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oatlnKAyxB8F0xAPMj2vSM4LKefO0MalvvWkGPPm3WVHXA6muHQ/S7R2xm2YcfOaDqcBSbdLxvdnqjWIZVijj+MrqlO2aKAA0u+ps3qO3hKMeolrl5dADykFThwrPXm4J+NgGZQi26YPq8a/nfiwDOwYTLzOKsH/gkLL6dor20au92mZX/pauxlynaysNzKFcG5NvWOOT+meKFCh5gc/MCW1OqUhEn2We3ZjXyftNCidG3K+9+nhjtIwPbMqqS/1mAjq2dadkRpWelGJZTQxZgPLMJDJkIsdJgOKA0KJTYRki5psv/DSfSI7CD/b/Hl3slgHzCHAujRWvVrCIsBqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A71GnE9au1Zk8JhbrK/vkGU/jJdQUGIGvVnNNAp1d+Y=;
 b=OfkIjiTq/Uby+UJXwjYu/QCwqgbXSELlmLwXqrX0OcHKIwU4mMaL2friL5Gyo9X6uDU9pwnJiozYCpcZCvEGvksg1uefdrvL9y2Fl4T1Utg//dhYpb/9U/KwIcE3/rT/9b6uX4PrMIKkxmLkGGSqQIBS7wWRfjCfLlsTLn8Pcy6MyBdQUDgcZwooRqogBr6Ch6PIGDOsbEc67K0OQKKnj/TwQ8P1/bisDFRDiMGzLTbUkQBq9w62OWqiE3sJjLgyTVDXkA9q98P5/PV9cbyf4twb+AWhzCrYSPCUVdKdLzTBAb+BoGtiL6LpRPT4c8bzj0fL+FG5gaLFEYCOFA28Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from BYAPR07CA0031.namprd07.prod.outlook.com (2603:10b6:a02:bc::44)
 by CH2PR07MB6757.namprd07.prod.outlook.com (2603:10b6:610:21::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Tue, 3 Dec
 2019 10:14:13 +0000
Received: from MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::208) by BYAPR07CA0031.outlook.office365.com
 (2603:10b6:a02:bc::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 MW2NAM12FT063.mail.protection.outlook.com (10.13.181.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:12 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7sq027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:11 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:07 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE7rA030892;
 Tue, 3 Dec 2019 11:14:07 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE7oN030887;
 Tue, 3 Dec 2019 11:14:07 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-torrent
Date: Tue, 3 Dec 2019 11:13:13 +0100
Message-ID: <1575368005-29797-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(36092001)(8936002)(336012)(2616005)(48376002)(107886003)(70586007)(50226002)(70206006)(7636002)(305945005)(356004)(6666004)(2351001)(50466002)(76176011)(446003)(51416003)(11346002)(36756003)(6916009)(246002)(8676002)(5660300002)(2906002)(478600001)(4326008)(186003)(87636003)(316002)(54906003)(42186006)(16586007)(86362001)(426003)(76130400001)(26005)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR07MB6757; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fedb4b46-cc8c-4c59-c8b6-08d777d98b74
X-MS-TrafficTypeDiagnostic: CH2PR07MB6757:
X-Microsoft-Antispam-PRVS: <CH2PR07MB6757CCD750520F83BB699C25D2420@CH2PR07MB6757.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQ+YpXC7BsFZR2NXpeYmZISKtZBkOPJwmM+LoZS9/KRqPlLkjXDbcWaTtxlEperrJTKN5lS14Cwh+0sqAix2TeHFJbE02pfvIjorxQTRzZ0nWOhOECPNAIf7/eKDoB6ko6hMsq4cGHH3F5VZjnxNyb7HnQzS9lyKbPG8jonL+IrqgAB0FHum2/Ijh8s7rXAiJMeHtpkX4/n3ljsQGG5bKBbYRUfqyXwvvyYThQnbMW1ilnalM8EQcEOksfFWnDYBFLkTkDEBvyO9pIaoQCCdZ/RapsulbScsgDTRnPmd3+PSx1vCyBWF6VC4aOEc20O4+I+U+D53fQAVrVVcetIJroaJf7L9StLskrT2pmcDiJqi6aufnCKSGr6rbvA1pOhsuz5zYAfwmO4y9WeCMG0lMX10IvNVMBntBSqWLdbj4OAnin5yDQCGwUTUxyTnlUh9YJ7ppBMpIIG7iAlGRerK1w==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:12.6989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fedb4b46-cc8c-4c59-c8b6-08d777d98b74
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6757
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
 bh=A71GnE9au1Zk8JhbrK/vkGU/jJdQUGIGvVnNNAp1d+Y=;
 b=KL5nn9RedKXo+aKGDOlfoKHU3Hwyl8O6Wpwcoe6o0yTB5qLBzJ4FUjPwmzA1tNTfAdf+
 IqofxcYw6xcU5c1TX63o2QWNmDNK6qzFHUoLuDFuIJNZbkosvA5vO4noOF6XpEwKtwps
 hGhjprX2M/yQpX3be0s27SzC/WZGnsstcM7pnje+50GyfEIUTrwMMPqz7PXWteXS5cXO
 BlPoMqQN46WiJZPHvY1URQ2YKzzM7IUJyHLE8sN0KQkjCYao4XS3T0nqbluh5DgRYl2A
 WLmhfWTsN3FojiHUn+qz6/hCCvOwsIYFB0B63VSsvu0w162gd5Ld/Wyk8sFKV06pIBfz xQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A71GnE9au1Zk8JhbrK/vkGU/jJdQUGIGvVnNNAp1d+Y=;
 b=R3N6KZwiCfoP6cnYubAN7w5AWZB7K7eG+4A8SjLW/AfNXHSHa8W2YHhZfBrlHPfKeZD6MnLbo0bY0OCTMrBj0ezaF3GdqwTwmWcvYP+bFoini9XoxiSjF2Fb/SNEWtR0ZEAMKj1jhPveACC69vSiGevj8+ZSQ7velu7w5hpz1hM=
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

UmVuYW1lIENhZGVuY2UgRFAgUEhZIGRyaXZlciBmcm9tIHBoeS1jYWRlbmNlLWRwIHRvIHBoeS1j
YWRlbmNlLXRvcnJlbnQKdG8gbWFrZSBpdCBtb3JlIGdlbmVyaWMgZm9yIGZ1dHVyZSB1c2UuIE1v
ZGlmaXkgTWFrZWZpbGUgYW5kIEtjb25maWcKYWNjb3JkaW5nbHkuIEFsc28sIGNoYW5nZSBkcml2
ZXIgY29tcGF0aWJsZSBmcm9tICJjZG5zLGRwLXBoeSIgdG8KImNkbnMsdG9ycmVudC1waHkiLgoK
U2lnbmVkLW9mZi1ieTogWXV0aSBBbW9ua2FyIDx5YW1vbmthckBjYWRlbmNlLmNvbT4KLS0tCiBk
cml2ZXJzL3BoeS9jYWRlbmNlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9waHkvY2FkZW5jZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9waHkvY2FkZW5jZS97cGh5
LWNhZGVuY2UtZHAuYyA9PiBwaHktY2FkZW5jZS10b3JyZW50LmN9IHwgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgZHJpdmVycy9w
aHkvY2FkZW5jZS97cGh5LWNhZGVuY2UtZHAuYyA9PiBwaHktY2FkZW5jZS10b3JyZW50LmN9ICg5
OSUpCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvY2FkZW5jZS9LY29uZmlnIGIvZHJpdmVycy9w
aHkvY2FkZW5jZS9LY29uZmlnCmluZGV4IGIyZGI5MTZkLi40NTk1NDU4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3BoeS9jYWRlbmNlL0tjb25maWcKKysrIGIvZHJpdmVycy9waHkvY2FkZW5jZS9LY29u
ZmlnCkBAIC0zLDEzICszLDEzIEBACiAjIFBoeSBkcml2ZXJzIGZvciBDYWRlbmNlIFBIWXMKICMK
IAotY29uZmlnIFBIWV9DQURFTkNFX0RQCi0JdHJpc3RhdGUgIkNhZGVuY2UgTUhEUCBEaXNwbGF5
UG9ydCBQSFkgZHJpdmVyIgorY29uZmlnIFBIWV9DQURFTkNFX1RPUlJFTlQKKwl0cmlzdGF0ZSAi
Q2FkZW5jZSBUb3JyZW50IFBIWSBkcml2ZXIiCiAJZGVwZW5kcyBvbiBPRgogCWRlcGVuZHMgb24g
SEFTX0lPTUVNCiAJc2VsZWN0IEdFTkVSSUNfUEhZCiAJaGVscAotCSAgU3VwcG9ydCBmb3IgQ2Fk
ZW5jZSBNSERQIERpc3BsYXlQb3J0IFBIWS4KKwkgIFN1cHBvcnQgZm9yIENhZGVuY2UgVG9ycmVu
dCBQSFkuCiAKIGNvbmZpZyBQSFlfQ0FERU5DRV9EUEhZCiAJdHJpc3RhdGUgIkNhZGVuY2UgRC1Q
SFkgU3VwcG9ydCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L2NhZGVuY2UvTWFrZWZpbGUgYi9k
cml2ZXJzL3BoeS9jYWRlbmNlL01ha2VmaWxlCmluZGV4IDhmODk1NjAuLjZhN2ZmYzYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGh5L2NhZGVuY2UvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9waHkvY2Fk
ZW5jZS9NYWtlZmlsZQpAQCAtMSw0ICsxLDQgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQotb2JqLSQoQ09ORklHX1BIWV9DQURFTkNFX0RQKQkrPSBwaHktY2FkZW5j
ZS1kcC5vCitvYmotJChDT05GSUdfUEhZX0NBREVOQ0VfVE9SUkVOVCkJKz0gcGh5LWNhZGVuY2Ut
dG9ycmVudC5vCiBvYmotJChDT05GSUdfUEhZX0NBREVOQ0VfRFBIWSkJKz0gY2Rucy1kcGh5Lm8K
IG9iai0kKENPTkZJR19QSFlfQ0FERU5DRV9TSUVSUkEpCSs9IHBoeS1jYWRlbmNlLXNpZXJyYS5v
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLWRwLmMgYi9kcml2
ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwpzaW1pbGFyaXR5IGluZGV4IDk5
JQpyZW5hbWUgZnJvbSBkcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLWRwLmMKcmVuYW1l
IHRvIGRyaXZlcnMvcGh5L2NhZGVuY2UvcGh5LWNhZGVuY2UtdG9ycmVudC5jCmluZGV4IGJjMTBj
YjIuLmJlYjgwZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGh5L2NhZGVuY2UvcGh5LWNhZGVuY2Ut
ZHAuYworKysgYi9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwpAQCAt
NTIxLDcgKzUyMSw3IEBAIHN0YXRpYyBpbnQgY2Ruc19kcF9waHlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgY2Ru
c19kcF9waHlfb2ZfbWF0Y2hbXSA9IHsKIAl7Ci0JCS5jb21wYXRpYmxlID0gImNkbnMsZHAtcGh5
IgorCQkuY29tcGF0aWJsZSA9ICJjZG5zLHRvcnJlbnQtcGh5IgogCX0sCiAJe30KIH07Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
