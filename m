Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E126057B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 13:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41B46E488;
	Fri,  5 Jul 2019 11:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60045.outbound.protection.outlook.com [40.107.6.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD036E48A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 11:44:19 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4797.eurprd08.prod.outlook.com (10.255.112.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:44:16 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 11:44:16 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/2] drm/komeda: Disable slave pipeline support
Thread-Topic: [PATCH 1/2] drm/komeda: Disable slave pipeline support
Thread-Index: AQHVMyb5WQQBB7gGc06vpLjh/Rmuxg==
Date: Fri, 5 Jul 2019 11:44:16 +0000
Message-ID: <20190705114357.17403-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebb9a003-5446-40c5-a423-08d7013e1b74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4797; 
x-ms-traffictypediagnostic: VE1PR08MB4797:
x-microsoft-antispam-prvs: <VE1PR08MB47976885DB0B09F4AB469CDAB3F50@VE1PR08MB4797.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(99286004)(26005)(36756003)(316002)(4326008)(55236004)(103116003)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(4744005)(305945005)(14444005)(476003)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(2201001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4797;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w9gUviPaygeUYefWGNcKEREcHd9lHkr6umm+cStZIvcgwgyBNITS9zwGJnF0n19mcUCHe3s7IJc09kDWWamuXiVMbLr55GoZ4FpS/zThSFQuZJIcP0EqY978yiazt4/fFzs5wvTqKK0I0JFzSiOisobuMzIVM+q34s0ec3SpQocszrjSeoaQ4Qjuh83K1lbhAzkLnt3J1YNVYULU5RHT0LhCM+SSGpGLN5b/2Yjmegyf8eWlIiXDBrJqOjIa4srjuL5x+K5Tb4DYvcYQr4Wx1CvoM9FwPq7OBa4vE6HO3eaExAwXC04NJ02HHtr5JDzMBo3+bevT5LALmGecl+yAxWOYMU6WDTG/yMFxciWS8n6N3iGhKvbPKM3LwZtHV515mgBa/VTgJ+imqhVz93u6QC1VvMy73U+RIqFYgyYYLng=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb9a003-5446-40c5-a423-08d7013e1b74
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:44:16.4229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4797
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywxon0cZ3w+Cahsu1Nlkw8OQ4X796knqtHa+7cJhxPQ=;
 b=DDP6r46FrCPX3XPq7GGk/uHcfLVq4ieSk9qAL30VBEKuMXVV+3wls9QVzbWRhyb0fVONxzzUI0SEX209t6m84oBrjCHLwJtJHPwuAWXUv/OjM0dqCe6Dxo2WFU8n56gTZTBS2r0QzTvXKm3+MSfMiHSswnWHpatDVNKVg7uOuDo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdGhlIHByb3BlcnR5IHNsYXZlX3BsYW5lcyBoYXZlIGJlZW4gcmVtb3ZlZCwgdG8gYXZv
aWQgdGhlIHJlc291cmNlCmFzc2lnbm1lbnQgcHJvYmxlbSBpbiB1c2VyIGRpc2FibGUgc2xhdmUg
cGlwZWxpbmUgc3VwcG9ydCB0ZW1wb3JhcmlseS4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4g
d2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKaW5kZXggZjQ0
MDA3ODhhYjk0Li44ZWU4NzllZTNkZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTQ4MSw3ICs0ODEsNyBAQCBpbnQga29tZWRh
X2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKIAkJbWFzdGVyID0g
bWRldi0+cGlwZWxpbmVzW2ldOwogCiAJCWNydGMtPm1hc3RlciA9IG1hc3RlcjsKLQkJY3J0Yy0+
c2xhdmUgID0ga29tZWRhX3BpcGVsaW5lX2dldF9zbGF2ZShtYXN0ZXIpOworCQljcnRjLT5zbGF2
ZSAgPSBOVUxMOwogCiAJCWlmIChjcnRjLT5zbGF2ZSkKIAkJCXNwcmludGYoc3RyLCAicGlwZS0l
ZCIsIGNydGMtPnNsYXZlLT5pZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
