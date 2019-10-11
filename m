Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAC6D38CD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D986EB9B;
	Fri, 11 Oct 2019 05:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0A96EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:46:03 +0000 (UTC)
Received: from VI1PR08CA0235.eurprd08.prod.outlook.com (2603:10a6:802:15::44)
 by AM0PR08MB3698.eurprd08.prod.outlook.com (2603:10a6:208:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 05:45:59 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0235.outlook.office365.com
 (2603:10a6:802:15::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.21 via Frontend
 Transport; Fri, 11 Oct 2019 05:45:59 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:45:57 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 11 Oct 2019 05:45:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 506eef3dc52c589c
X-CR-MTA-TID: 64aa7808
Received: from f097dae2e33d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43688E5C-310B-4CF0-A787-3102134EC532.1; 
 Fri, 11 Oct 2019 05:45:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f097dae2e33d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIXEn5tMOxD7xWHszFE8c1AWxEP139BVXS7WGlmCSnnS16zvKcn85Cka0roqjRVMyI2vc4lYDTOec9teVCZ+vkAelFRJ+Gh1v49meMLuv/BBlDwFqrviBD0X+IzxQ4wzY8s4ClMyKXruYbcuhfGOz8JJfgbQJ2Noo6mwMcKQ98+9LtJ4rzIx13i2o5gLiJp9FysJkYqKtwcuD8wDs1udaedbSLH8RqvOqa4A0aGjz7vlN2574BgbkCch5yeXEyTmONoIE8oCrbAnfs0m0uB+vIQDG9vrKF0osMInp/rIfQkL/fTSftCZcmE4uVdw7IsqW7HL9ZKd5/IFijVEhp/Epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=ZH77U9OW4tFH291JAwI0nBehspeLZ+B+BDwuITpDgfa2O7E97rg7KrpQa6z4PKK5RuLT5Cg2V2oqrC2DdA9r18+sLoPXgxqCKMmQdABZaq42h07or45xuvVOVjX+oTw/8Pl2VuLHyR+tSfnajvzEXpZMNb9/MNauUrywTzEMSQWXPJfMdvM3qgMh8gxWoowPb6dbQOGHuA/pUpM3xhwSmvDiKp3o9+EjThowdhznemGr4xvv2XAarUOkPBZPkwX7B8rYGIz1nbsM3Xp2csXl+HTPnP42BFyF9/5Hz02xY/lVnJTEHkcGIznbQCAQwgZ21JEtsW9HChvCqeSCxmf2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:45:43 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:45:43 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v2 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVf/ce0iEWJoV9sUaEYo7sUivKyA==
Date: Fri, 11 Oct 2019 05:45:42 +0000
Message-ID: <20191011054459.17984-4-james.qian.wang@arm.com>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:2e::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5d097231-747d-4d5e-3cfb-08d74e0e4a50
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VE1PR08MB4816:|AM0PR08MB3698:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB36984E36EF0587FC7687E9AAB3970@AM0PR08MB3698.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(4326008)(2201001)(2171002)(86362001)(2906002)(103116003)(36756003)(6512007)(1076003)(316002)(110136005)(81156014)(81166006)(8936002)(6436002)(54906003)(99286004)(50226002)(305945005)(7736002)(8676002)(3846002)(76176011)(6116002)(5660300002)(52116002)(6486002)(66476007)(6506007)(386003)(66556008)(66446008)(64756008)(14454004)(446003)(186003)(11346002)(256004)(26005)(102836004)(71200400001)(2616005)(476003)(486006)(66946007)(55236004)(25786009)(71190400001)(2501003)(66066001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JR0DUEcS0sIXhKrvgHNsP58qGnxRONqWsfugxS73WR/RVCbu/C4GjTXUEScmSGi4wUYGfyoRxSvT9jTKIhOstSsYLilsM7f2PdggkB9o1yWwWFcD1MxJCyOpHHGQl4XehADC2SPpwQqVIa5E7M2cs8fFr1+oGOd931Tqq6ob0puKiUJTjb9AIZ1zK1i5pOGIH8kUajD48i4PpIypS8/ExdV4rpiaSXk5ptqPsq5ZbWs35pWH2+s5SRe4EBgCMWMjyeNhVqMGU9Z6ggqGMNQklbNGyWUgsaNsfNdT7B7R0Gr4xr/7me5lNcGb9MKwAnL+dkJkbwdzjodyFsVKhQLvmTSYys6mDpStnqsQU1CvyifjaRt8ayM2oXAf6ZZ4FgtChCS4okHEFKCAWkZ/Utc+o7nfv+IwnjoDMExj1lELG9g=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(8746002)(8936002)(25786009)(76176011)(50226002)(99286004)(22756006)(63350400001)(23756003)(26005)(305945005)(70586007)(3846002)(36906005)(316002)(2906002)(47776003)(6116002)(6506007)(386003)(70206006)(81156014)(26826003)(478600001)(81166006)(8676002)(6512007)(102836004)(356004)(76130400001)(186003)(110136005)(50466002)(2171002)(4326008)(103116003)(6486002)(2501003)(36756003)(86362001)(126002)(476003)(2616005)(2201001)(5660300002)(336012)(1076003)(14454004)(54906003)(11346002)(486006)(446003)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3698;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a58bbe66-d148-4d33-87dc-08d74e0e4116
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RXf7YnX17wfAJEVGHq50nZoy6QYK9LTP4NKMwv3zvo6Z7rWzo+k+sJyZX+TgUNozVQ7UX5F7GclvugajknEPplr6tn0+UjQQZhK/ITnd6Yrd/qi3ZXGmqzKTr9kZsEjq2wqwoUZP8l/+G58Ub0E8eHNawfGpPXEPhCzuK4fZ/csqq1kWtFwL42U5M029gEHWBayLc7tF0yGXEbYol8rw0L+l/qxUYZ2Gyczk9ZLShhYahh6d+yi4kuKQxmuUL5rLBVqwTuB7RO5fSb9UYN+v0FWO3h0o01Ic9y2Cdf0gHbBalGavzRcKQodG0EzLUu+PGfVt6Qey9Tftxle+bjLO883JSnYf48md1DLJOdppW2XWBY1agVRjMaIdqrmwOPqqs5iR9tvKAVndrKfUCDthMNFjhQXgV+5HCDC0trwILxw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:45:57.8464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d097231-747d-4d5e-3cfb-08d74e0e4a50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=cjD9HM5xZ1L1JIRCvc+Kafj2je7ePdNBHkH3tj70E5euwE+oBAp+5H/f7fXu2dLA+aoYKdpizmSMyV6hX7tL1OC8ulgGqEydoFHGeNCFiklrtd+gH0EsQU2qB6JQQ749NGesJJ8v7bgHEnh97cnx2hakqnvyfRAYyz99vul5M10=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjboglvKAq6uiIJDn2YUD84pCdj+UuHqWJb/1SqjLc=;
 b=cjD9HM5xZ1L1JIRCvc+Kafj2je7ePdNBHkH3tj70E5euwE+oBAp+5H/f7fXu2dLA+aoYKdpizmSMyV6hX7tL1OC8ulgGqEydoFHGeNCFiklrtd+gH0EsQU2qB6JQQ749NGesJJ8v7bgHEnh97cnx2hakqnvyfRAYyz99vul5M10=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyBmb3IgY29udmVydGluZyBkcm1fY29sb3JfY3RtIG1hdHJpeCB0byBr
b21lZGEgaGFyZHdhcmUKcmVxdWlyZWQgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1ND
IG1hdHJpeC4KCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMx
XzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgpTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCAxNCArKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggYzE4MGNlNzBjMjZjLi5hZDY2OGFjY2Jk
ZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKQEAgLTExNywzICsxMTcsMTcgQEAgdm9pZCBkcm1fbHV0X3RvX2Zn
YW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2Vm
ZnMpCiB7CiAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwg
QVJSQVlfU0laRShzZWN0b3JfdGJsKSk7CiB9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVy
bjsKKworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9O
X0NUTV9DT0VGRlM7IGkrKykKKwkJY29lZmZzW2ldID0gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbihjdG0tPm1hdHJpeFtpXSwgMiwgMTIpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IDA4YWI2OTI4
MTY0OC4uMmY0NjY4NDY2MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCkBAIC0xOCw2ICsxOCw3IEBACiAjZGVm
aW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKIAogdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOwordm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1
MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
