Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD85F2E1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06E6E268;
	Thu,  4 Jul 2019 06:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641E16E268
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:31:21 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.112.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:31:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:31:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 5/6] drm/komeda: Update writeback signal for side_by_side
Thread-Topic: [PATCH 5/6] drm/komeda: Update writeback signal for side_by_side
Thread-Index: AQHVMjIW57fi7f1cWEmHuaNvRgUuoQ==
Date: Thu, 4 Jul 2019 06:31:18 +0000
Message-ID: <20190704063011.7431-6-james.qian.wang@arm.com>
References: <20190704063011.7431-1-james.qian.wang@arm.com>
In-Reply-To: <20190704063011.7431-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:2e::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcb4eee5-faf0-4a65-022e-08d7004938e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4799; 
x-ms-traffictypediagnostic: VE1PR08MB4799:
x-microsoft-antispam-prvs: <VE1PR08MB47998ADD4B364EB5451D79E8B3FA0@VE1PR08MB4799.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(256004)(305945005)(8936002)(4326008)(99286004)(36756003)(110136005)(2616005)(486006)(2501003)(5660300002)(2906002)(316002)(3846002)(50226002)(1076003)(102836004)(26005)(55236004)(6116002)(66066001)(446003)(11346002)(52116002)(476003)(7736002)(66946007)(76176011)(66446008)(54906003)(66476007)(73956011)(386003)(64756008)(68736007)(66556008)(6506007)(6486002)(103116003)(186003)(53936002)(478600001)(25786009)(86362001)(6436002)(2201001)(6512007)(14454004)(81156014)(81166006)(8676002)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WdwE9KMyxbRD5BAympbM8wviAI8/4Dse3BRn+5cnfpQsDqqz9BZugB8H8z3O0jVARd40n6Xa+mDUDHNWVCaHw5ZGuTE9olZOo897+xZ9MlFKpOOO1MOHgX4OXZovE+tia3awrF1buvtPrtYBAQvN3Nwk+zeztQxI91/pgG7Td1GhsI/rzMDS0Rn6c99YZYGhU5H8EUxqXU6lMwK8O+Nbr5wdK8XRa+Sjk/LaSx0TT6yR7dBvA+Md939djIwYLG1FQ6S/brIlETrJQptEEUPn0uYS/xhWsyHvtzh91LMyXnUoX2MHcj+UH3I4i9MVYGnBToA3IxbJmk5Guv977P+/c6UtpGvwr+Qq5H4/DAX53PxssaGi9AHf8LOucPK/rw+Q4Ct4ou+fHjhIfMEItcUjowO81nsBU2Xt2n0V/bxw+qk=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb4eee5-faf0-4a65-022e-08d7004938e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:31:18.6517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5cDa+jXFxFlTb5B+nQ6ibtWucIh9j1Ger14n2h7rdc=;
 b=QbsInh8LcK/O2V3rUfiTt9bDY0/pmPf1RLp0sI68/Pz29osGdAAxivprHhHm8yRX6SdPqCmELCDcCw+2usIgQTeZqYwzHTglLn/9BJnbxXRhhc1EBXMLYGKSqOAVUJXLp9ycsBWlvl2LaYREr6Pg80qiIsQu+IRfkxcKtxtTgqY=
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

SW4gc2lkZSBieSBzaWRlIG1vZGUsIGEgd3JpdGViYWNrIGpvYiBpcyBjb21wbGV0ZWQgYnkgdHdv
IHBpcGVsaW5lczogbGVmdApieSBtYXN0ZXIgYW5kIHJpZ2h0IGJ5IHNsYXZlLCB3ZSBuZWVkIHRv
IHdhaXQgYm90aCBwaXBlbGluZSBmaW5pc2hlZCAoRU9XKSwKdGhlbiBjYW4gc2lnbmFsIHRoZSB3
cml0ZWJhY2sgam9iIGNvbXBsZXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAg
IHwgIDUgKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMg
IHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Ny
dGMuYwppbmRleCAxMzNlYTQ3MjgxNDkuLmNhMWJlZjhmYjhkYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMTk0LDI3ICsxOTQs
MjggQEAga29tZWRhX2NydGNfdW5wcmVwYXJlKHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpCiAJ
cmV0dXJuIGVycjsKIH0KCi12b2lkIGtvbWVkYV9jcnRjX2hhbmRsZV9ldmVudChzdHJ1Y3Qga29t
ZWRhX2NydGMgICAqa2NydGMsCit2b2lkIGtvbWVkYV9jcnRjX2hhbmRsZV9ldmVudChzdHJ1Y3Qg
a29tZWRhX2NydGMgKmtjcnRjLAogCQkJICAgICAgc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMp
CiB7CiAJc3RydWN0IGRybV9jcnRjICpjcnRjID0gJmtjcnRjLT5iYXNlOworCXN0cnVjdCBrb21l
ZGFfd2JfY29ubmVjdG9yICp3Yl9jb25uID0ga2NydGMtPndiX2Nvbm47CiAJdTMyIGV2ZW50cyA9
IGV2dHMtPnBpcGVzW2tjcnRjLT5tYXN0ZXItPmlkXTsKCiAJaWYgKGV2ZW50cyAmIEtPTUVEQV9F
VkVOVF9WU1lOQykKIAkJZHJtX2NydGNfaGFuZGxlX3ZibGFuayhjcnRjKTsKCi0JaWYgKGV2ZW50
cyAmIEtPTUVEQV9FVkVOVF9FT1cpIHsKLQkJc3RydWN0IGtvbWVkYV93Yl9jb25uZWN0b3IgKndi
X2Nvbm4gPSBrY3J0Yy0+d2JfY29ubjsKKwkvKiBoYW5kbGVzIHdyaXRlYmFjayBldmVudCAqLwor
CWlmIChldmVudHMgJiBLT01FREFfRVZFTlRfRU9XKQorCQl3Yl9jb25uLT5jb21wbGV0ZV9waXBl
cyB8PSBCSVQoa2NydGMtPm1hc3Rlci0+aWQpOwoKLQkJaWYgKHdiX2Nvbm4pCi0JCQlkcm1fd3Jp
dGViYWNrX3NpZ25hbF9jb21wbGV0aW9uKCZ3Yl9jb25uLT5iYXNlLCAwKTsKLQkJZWxzZQotCQkJ
RFJNX1dBUk4oIkNSVENbJWRdOiBFT1cgaGFwcGVuIGJ1dCBubyB3Yl9jb25uZWN0b3IuXG4iLAot
CQkJCSBkcm1fY3J0Y19pbmRleCgma2NydGMtPmJhc2UpKTsKKwlpZiAoa2NydGMtPnNpZGVfYnlf
c2lkZSAmJgorCSAgICAoZXZ0cy0+cGlwZXNba2NydGMtPnNsYXZlLT5pZF0gJiBLT01FREFfRVZF
TlRfRU9XKSkKKwkJd2JfY29ubi0+Y29tcGxldGVfcGlwZXMgfD0gQklUKGtjcnRjLT5zbGF2ZS0+
aWQpOworCisJaWYgKHdiX2Nvbm4tPmV4cGVjdGVkX3BpcGVzID09IHdiX2Nvbm4tPmNvbXBsZXRl
X3BpcGVzKSB7CisJCXdiX2Nvbm4tPmNvbXBsZXRlX3BpcGVzID0gMDsKKwkJZHJtX3dyaXRlYmFj
a19zaWduYWxfY29tcGxldGlvbigmd2JfY29ubi0+YmFzZSwgMCk7CiAJfQotCS8qIHdpbGwgaGFu
ZGxlIGl0IHRvZ2V0aGVyIHdpdGggdGhlIHdyaXRlIGJhY2sgc3VwcG9ydCAqLwotCWlmIChldmVu
dHMgJiBLT01FREFfRVZFTlRfRU9XKQotCQlEUk1fREVCVUcoIkVPVy5cbiIpOwoKIAlpZiAoZXZl
bnRzICYgS09NRURBX0VWRU5UX0ZMSVApIHsKIAkJdW5zaWduZWQgbG9uZyBmbGFnczsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKaW5kZXggMGRi
ZmQ3YWQ3ODA1Li4zY2I1N2VhODIxOTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5oCkBAIC02Niw2ICs2NiwxMSBAQCBzdHJ1Y3Qga29tZWRh
X3diX2Nvbm5lY3RvciB7CgogCS8qKiBAd2JfbGF5ZXI6IHJlcHJlc2VudHMgYXNzb2NpYXRlZCB3
cml0ZWJhY2sgcGlwZWxpbmUgb2Yga29tZWRhICovCiAJc3RydWN0IGtvbWVkYV9sYXllciAqd2Jf
bGF5ZXI7CisKKwkvKiogQGV4cGVjdGVkX3BpcGVzOiBwaXBlbGluZXMgYXJlIHVzZWQgZm9yIHRo
ZSB3cml0ZWJhY2sgam9iICovCisJdTMyIGV4cGVjdGVkX3BpcGVzOworCS8qKiBAY29tcGxldGVf
cGlwZXM6IHBpcGVsaW5lcyB3aGljaCBoYXZlIGZpbmlzaGVkIHdyaXRlYmFjayAqLworCXUzMiBj
b21wbGV0ZV9waXBlczsKIH07CgogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCmluZGV4IGVhNTg0YjFlNWJk
Mi4uOTc4Nzc0NTcxM2RmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwpAQCAtMTY1LDYgKzE2NSw5IEBAIHN0
YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICpr
bXMsCiAJCXJldHVybiAtRU5PTUVNOwoKIAlrd2JfY29ubi0+d2JfbGF5ZXIgPSBrY3J0Yy0+bWFz
dGVyLT53Yl9sYXllcjsKKwlrd2JfY29ubi0+ZXhwZWN0ZWRfcGlwZXMgPSBCSVQoa2NydGMtPm1h
c3Rlci0+aWQpOworCWlmIChrY3J0Yy0+c2lkZV9ieV9zaWRlKQorCQlrd2JfY29ubi0+ZXhwZWN0
ZWRfcGlwZXMgfD0gQklUKGtjcnRjLT5zbGF2ZS0+aWQpOwoKIAl3Yl9jb25uID0gJmt3Yl9jb25u
LT5iYXNlOwogCXdiX2Nvbm4tPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoZHJtX2NydGNf
aW5kZXgoJmtjcnRjLT5iYXNlKSk7Ci0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
