Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2FCCB46
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFFA6E3CE;
	Sat,  5 Oct 2019 16:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Fri, 04 Oct 2019 11:23:41 UTC
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D226EB2A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:23:41 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x94BMwA9028255; Fri, 4 Oct 2019 07:23:30 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2va4e889m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2019 07:23:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSksjcmYMGye/TC5PzkAAy7n5ejBLJIkKQe039p7sVP/ML9uuHllqleDjHUez9ZX4OJjcikHB9II7lEbpn2UfL5mbT6JtRnOkyck6QTL4X0ZlCRAxkAxU1klvQ/kmYogZ03MzgamgXjNqnn3YSjl+1IxoDufKLIfVwspxuz7CZ+Ur4fRbLR8BclYq6DiOnwb4hPs5yGseJisO6O7gjj03Lxs52ieRR/uPtydn9YqcBbwndj0OADN5K8Ytf7nxtKrQDKgwE6pzzft9eReSZeV3gGrWRcuYTwDG2sXCfR4oJea0873ZBN7kvYBJhtTMHbPvKfNHqLoixtenxQ/jSqRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9H74wES0kKUW8O4h0YBkz2Eg3EDf8xb+eXR91DU5ZM=;
 b=eBszWSN04XjRoHWZYAfXpaE4OMsJ/s1W74BJ9LfUD53aNibuncyGtJhz790xOxfWap3UeUWHFWu20mmilETR0mtt+t8eXJSZtunlHD3SVa0/40uMyLFDVqOTzLO78pw/fF8jf/H3maz2Yzh6mmdVQQdjY4XyvTAX1Y6Pje7MrEh8F1cFDPlBnCN9e8gEIc5r0ZeRaKAoDdQEXISmdJZUvSIo6l+66HjHtd8Sr4vtg+9LyFyrea8unyOh2NmjRkBCf/5sXX0DRtzFshaNGIOwFbs1iO1dXfLFnsm0384hi9Cgcj9d/cutjQ+ikOUjwMdBtaVV/KQC7z6uJMYqJH9FbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=samsung.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
Received: from BYAPR03CA0034.namprd03.prod.outlook.com (2603:10b6:a02:a8::47)
 by BYAPR03MB4056.namprd03.prod.outlook.com (2603:10b6:a03:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.22; Fri, 4 Oct
 2019 11:23:26 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by BYAPR03CA0034.outlook.office365.com
 (2603:10b6:a02:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21 via Frontend
 Transport; Fri, 4 Oct 2019 11:23:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
 via Frontend Transport; Fri, 4 Oct 2019 11:23:26 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x94BNPtX028285
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 4 Oct 2019 04:23:25 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 4 Oct 2019 07:23:24 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: bridge: adv7511: Extend list of audio sample rates
Date: Fri, 4 Oct 2019 14:22:56 +0300
Message-ID: <20191004112256.31396-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(2870700001)(50226002)(7416002)(107886003)(356004)(47776003)(50466002)(8676002)(7636002)(305945005)(6916009)(246002)(2906002)(36756003)(6666004)(478600001)(2616005)(44832011)(426003)(8936002)(476003)(126002)(54906003)(186003)(2351001)(48376002)(336012)(4744005)(1076003)(106002)(316002)(70586007)(70206006)(26005)(4326008)(51416003)(86362001)(7696005)(5660300002)(486006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB4056; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71da9436-209c-4f90-d4b6-08d748bd465d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4056:
X-Microsoft-Antispam-PRVS: <BYAPR03MB40568290FC4C04AD590507DD9B9E0@BYAPR03MB4056.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tH3Yg0itrc7NxKJFB53+Ma9FcLgwDyibPLgbK3JBNVKU4avSB7AWeVsz6PezLORZWa41azlaXUAiJ+QihYaAw2bJEjMLi6DUnkSDid02gIYtvoKmMv97E6hBp1a8IfaDNtHkx4c/XQE6a/Sj9Zi+e0pk1BhGMZE0tmvzgf9zvpHHGFVKAOKqFpCuwsmanYrS6Q2I+omez2yhhCqpIYSgVEWVvO9H84fHglHEMs2MAFYPliNOvFqr0Ee0BBpH1ESmhdHT6kxwM9+yxKUoFpwjFHpbng43iB33wFzv2I7GXB4/xSwbLJVhQEfbz6qXNcD+XQseElofssFs1t/2r05bBSxv6tHzsOn/ZfngEXVPn8xfaysBFS0NTjLBpA9XroFO0icDDIa5ymZTY7dQ6rRnNXX0QMMbScmWZp0eO546VgY=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 11:23:26.2267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71da9436-209c-4f90-d4b6-08d748bd465d
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4056
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 suspectscore=1 clxscore=1011 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910040107
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9H74wES0kKUW8O4h0YBkz2Eg3EDf8xb+eXR91DU5ZM=;
 b=cmPlloECjquJXZunSxKWlaroJTa7wtz1EDwh6qMnYUOTXm97G20hU2/IAfiHl5sunocgu3QyTgqj1T6OKqlBzZzVnPEl2/wltMizk0WLhibM8DagIgUKPcLmyVnEtAR6+3n97RvTHFm6sCkj2za2vmtLqiGvH7ybc2QUvsUrTVY=
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
Cc: Bogdan Togorean <bogdan.togorean@analog.com>, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, gregkh@linuxfoundation.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, tglx@linutronix.de, allison@lohutok.net,
 swinslow@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QURWNzUxMSBzdXBwb3J0IHNhbXBsZSByYXRlcyB1cCB0byAxOTJrSHouIENUUyBhbmQgTiBwYXJh
bWV0ZXJzIHNob3VsZApiZSBjb21wdXRlZCBhY2NvcmRpbmdseSBzbyB0aGlzIGNvbW1pdCBleHRl
bmQgdGhlIGxpc3QgdXAgdG8gbWF4aW11bQpzdXBwb3J0ZWQgc2FtcGxlIHJhdGUuCgpTaWduZWQt
b2ZmLWJ5OiBCb2dkYW4gVG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMgfCAxMiArKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMKaW5kZXggOTZiZTdiMDA1YzUw
Li5mMzc2ZWQ3ZWI5ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUx
MS9hZHY3NTExX2F1ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfYXVkaW8uYwpAQCAtMjcsNiArMjcsMTggQEAgc3RhdGljIHZvaWQgYWR2NzUxMV9jYWxj
X2N0c19uKHVuc2lnbmVkIGludCBmX3RtZHMsIHVuc2lnbmVkIGludCBmcywKIAljYXNlIDQ4MDAw
OgogCQkqbiA9IDYxNDQ7CiAJCWJyZWFrOworCWNhc2UgODgyMDA6CisJCSpuID0gMTI1NDQ7CisJ
CWJyZWFrOworCWNhc2UgOTYwMDA6CisJCSpuID0gMTIyODg7CisJCWJyZWFrOworCWNhc2UgMTc2
NDAwOgorCQkqbiA9IDI1MDg4OworCQlicmVhazsKKwljYXNlIDE5MjAwMDoKKwkJKm4gPSAyNDU3
NjsKKwkJYnJlYWs7CiAJfQogCiAJKmN0cyA9ICgoZl90bWRzICogKm4pIC8gKDEyOCAqIGZzKSkg
KiAxMDAwOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
