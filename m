Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA46B734
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F526E273;
	Wed, 17 Jul 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2345 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jul 2019 13:51:45 UTC
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8FD89C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:51:45 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GD8WLh017090; Tue, 16 Jul 2019 09:12:06 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2050.outbound.protection.outlook.com [104.47.46.50])
 by mx0b-00128a01.pphosted.com with ESMTP id 2tseuc82pe-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 09:12:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d75yfUpMwk4xgyyn1Qx7beN3tzEXlmsuS+MhJkrMb/qPBFqhu3fgiJhaErDJeUZVFCVUL0nQn4AKVl5gLhw9sVbndvdFXp4+8Ys7Ye97nkCjWEQGRdvGMNjfzku1tBHRm9K4KK0W6EERQpFipJHY7vrJkDfjs3JAwkBX3DyV7670Tt9vOKmkdzsRapbSZN+JaGEEqEkfyzAC+nA6xsipVAQj/44XkfM5wPOMyfwTRVOWtVHhfBwTGVhJoRsaPDqlVkpZ8pgOlxo5SQwsZw1B9CNVdF64ZeWa/o+W5XzpL8zus6YOb2YFqOLRf7GN8KD6jUL8+aDDK47qQFykVEI5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqG5Oej3TqDoGoXxSl7qRk0xaLWwbsrfQLJovkF24cc=;
 b=fzGwYsF9ka51BwtjCO9kuHtK/qdQ7ffdLTMHFDmFwiI1/KZqpsqmHAAW66vY2oa25aotbHhYUXRGzCEL02wZxtSZEn4Qm5Ga40Q0FvSd29AVn6q3usT132clblEe/p3YPcqr2781TmY+k9fSoRmew7lsp56Uaqc6ZFgqCURFbNLCfwB8kZQT7fgdGQe0jFOJWQ52ZWAsrA0koGRhO8R2Pi6YftZpDzcSRneaUPkZp7bo4Zba7ITHv8jw7c+FEcBAS7Jj8A2LVMUNYZ8K+wsK0H2MKVSvzNsQoQEXrL7dB84EcYrT9oOklFioL8O32TCMhWCVzizxZuS4ZFcjG8UY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=ffwll.ch
 smtp.mailfrom=analog.com;dmarc=bestguesspass action=none
 header.from=analog.com;dkim=none (message not signed);arc=none
Received: from CY4PR03CA0104.namprd03.prod.outlook.com (2603:10b6:910:4d::45)
 by BYAPR03MB4711.namprd03.prod.outlook.com (2603:10b6:a03:131::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11; Tue, 16 Jul
 2019 13:12:05 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by CY4PR03CA0104.outlook.office365.com
 (2603:10b6:910:4d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Tue, 16 Jul 2019 13:12:05 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2052.25
 via Frontend Transport; Tue, 16 Jul 2019 13:12:04 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x6GDBxXw023907
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Jul 2019 06:11:59 -0700
Received: from btogorean-pc.ad.analog.com (10.48.65.146) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 16 Jul 2019 09:12:00 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <a.hajda@samsung.com>
Subject: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
Date: Tue, 16 Jul 2019 16:10:05 +0300
Message-ID: <20190716131005.761-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(189003)(199004)(2870700001)(26005)(48376002)(47776003)(476003)(186003)(2906002)(36756003)(51416003)(7696005)(2616005)(486006)(86362001)(5660300002)(4326008)(126002)(6916009)(316002)(50466002)(54906003)(44832011)(70206006)(70586007)(7416002)(478600001)(426003)(2351001)(50226002)(8676002)(7636002)(8936002)(305945005)(106002)(356004)(14444005)(1076003)(336012)(246002)(16453002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB4711; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22474c59-33bf-4461-51f9-08d709ef32b8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:BYAPR03MB4711; 
X-MS-TrafficTypeDiagnostic: BYAPR03MB4711:
X-Microsoft-Antispam-PRVS: <BYAPR03MB47111638C116C314902859BC9BCE0@BYAPR03MB4711.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ey6wSF/X5nOcHU0ySxkqFd+COTL7woZUYTXJT+Wr9kbyIsMQGG46Eq6Tnl3OhkZt/N9M/umTAvNA6oE2dGcZ8Xtjn+gle2dbMO3y1JHlgKAj6FthWg8MqBKn2rbrRLnnbuIZx7hS6o32S0UyjzWSXejyt0qvV/0YerIpvDC+rVgWQuPHZ057X9nQGhGvJF73Pi5nLDdTCKY0aANF/AaYc/OUAlmvOJXbgZhgzYB1AAEMNpuMP3asMYzSPIfI/zzzJT+uzY7PID+JzHw3It6zoqvJXCElK4KDUCFtg1TxXOYIAnLM38apHtNcANnabdc+uucKo0rBcSlXNUomFYRaC8RZNfHXF0woZEBSDoqt7B2aTMaFCi+9X4pG2Ya9dMxb+XolkrzqUSJdB/1JmBuwX5SqgNO6/J3bjNP7JvkM200=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 13:12:04.1252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22474c59-33bf-4461-51f9-08d709ef32b8
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4711
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=758 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160163
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqG5Oej3TqDoGoXxSl7qRk0xaLWwbsrfQLJovkF24cc=;
 b=g7xjUkmBZwYaQfSOfHJQO7vhdu9pz4icnHA8y3m9y+3gHTLMmnJvDQ2NbEs6XYcMGQPSa56hWUpt2FcRJ/q4QnuBX0IUGICeTIssko55nSnmr8gCPqvBGf5rPnd6u3FYzAdhEMfi4AoxiV3EyUjH00qYr/YeYMGaMe07ElcwMfQ=
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
Cc: airlied@linux.ie, bogdan.togorean@analog.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, tglx@linutronix.de, sam@ravnborg.org,
 matt.redfearn@thinci.com, swinslow@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIEFEVjc1MzMgYW5kIEFEVjc1MzUgbG93IHJlZnJlc2ggcmF0ZSBpcyBzZWxlY3RlZCB1c2lu
ZwpiaXRzIFszOjJdIG9mIDB4NGEgbWFpbiByZWdpc3Rlci4KU28gZGVwZW5kaW5nIG9uIEFEViBt
b2RlbCB3cml0ZSAweGZiIG9yIDB4NGEgcmVnaXN0ZXIuCgpGaXhlczogOWM4YWY4ODJiZjEyOiAo
ImRybTogQWRkIGFkdjc1MTEgZW5jb2RlciBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBCb2dkYW4g
VG9nb3JlYW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwppbmRleCBmNmQyNjgxZjY5MjcuLjQ1MDhhMzA0
ZDIzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMK
QEAgLTc1Niw4ICs3NTYsMTMgQEAgc3RhdGljIHZvaWQgYWR2NzUxMV9tb2RlX3NldChzdHJ1Y3Qg
YWR2NzUxMSAqYWR2NzUxMSwKIAllbHNlCiAJCWxvd19yZWZyZXNoX3JhdGUgPSBBRFY3NTExX0xP
V19SRUZSRVNIX1JBVEVfTk9ORTsKIAotCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdt
YXAsIDB4ZmIsCi0JCTB4NiwgbG93X3JlZnJlc2hfcmF0ZSA8PCAxKTsKKwlpZiAoYWR2NzUxMS0+
dHlwZSA9PSBBRFY3NTExKQorCQlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUxMS0+cmVnbWFwLCAw
eGZiLAorCQkJMHg2LCBsb3dfcmVmcmVzaF9yYXRlIDw8IDEpOworCWVsc2UKKwkJcmVnbWFwX3Vw
ZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgMHg0YSwKKwkJCTB4YywgbG93X3JlZnJlc2hfcmF0
ZSA8PCAyKTsKKwogCXJlZ21hcF91cGRhdGVfYml0cyhhZHY3NTExLT5yZWdtYXAsIDB4MTcsCiAJ
CTB4NjAsICh2c3luY19wb2xhcml0eSA8PCA2KSB8IChoc3luY19wb2xhcml0eSA8PCA1KSk7CiAK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
