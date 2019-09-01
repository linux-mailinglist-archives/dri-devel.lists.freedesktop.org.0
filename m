Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E21A4A72
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5A2898F0;
	Sun,  1 Sep 2019 16:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092072065.outbound.protection.outlook.com [40.92.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDEB895D7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQz4wZyNJrmnGXCDKOXuoiHHuvldMnNO2Z7HdgUzvjDWKiWBUDbEEiJ6v3NXfN/5LXPs0wLSxjnGzkmW7AAMhUn1F3g7+afvTp1BZcq5rBqmIcXU6pq0ri0gjK5SmyHi2v0hnyVFOCBIHS24qBCz70o13zLGJbStabL5iBk5FM8xa+6FwLE5dSnfVqJE5QYR/wFkHFfqmI9pQ31SKv/ZwCC2spQkjcY5jJM0N4+NAjYTANmxwpCG5roy96Qs3/uviv1O+A/NdaCxqp7DHhMBXzbsSo2U3knKI8ULh8b/X2wRxeyneoF538IcT1g9E9hjI1aD18Q7iLuEeZA3in5hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7+j1nmikidvbNuu5X4+/mCMSmolAUwcL80L9V6+pUk=;
 b=lSd3XQDB93uMb76BrL6t7PZJkAwbjvUQGlVvVXgv3HBmLSQiq0ALwBqKxnML/oiRP5DD4CofVJYiSexrbwpCNL5jRseGG60PgxGrkXV5UXp245O0UloezZCk6jwuQJ8lIcOyFYOV9fvljXWM8U62elx1NhON/JNJcEYSeohKgD1QarvRleluypjad3AaIyjetl7yHC8ucpmOzaPdDrgdz26xUo2Hn/AFcavHBusq+8i07HP+Kv66oP9dZEpVO0qMqXjVPANY5kEJUk2vH2XlDTc+BjdTbIlu4eAG7BgNavX5gI6THrR+0i+rzNtQGXd+PwShum6D6rbF7usa3W1oUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.51) by AM5EUR03HT010.eop-EUR03.prod.protection.outlook.com
 (10.152.16.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:14:42 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:14:42 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:14:42 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 4/5] Revert "drm/edid: make drm_edid_to_eld() static"
Thread-Topic: [PATCH 4/5] Revert "drm/edid: make drm_edid_to_eld() static"
Thread-Index: AQHVYOBcGargGv3pdUKSwYRRFKPbWw==
Date: Sun, 1 Sep 2019 16:14:41 +0000
Message-ID: <AM0PR06MB4004968EE64C136494040B7AACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
In-Reply-To: <20190901161426.1606-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::32)
 To AM0PR06MB4004.eurprd06.prod.outlook.com
 (2603:10a6:208:b9::12)
x-incomingtopheadermarker: OriginalChecksum:A876AAF0C97CFF5DEEAEDE94252B9F3B16BFE03E299D28D6D889942E980504EE;
 UpperCasedChecksum:A2A9ED068A7714748BDC405D4FD51D91EA52804D0B81BDF848E961FB1FEB78D7;
 SizeAsReceived:7997; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [jsfD4U4z9ssKIvMd5aUK+zRaIHoInldo]
x-microsoft-original-message-id: <20190901161426.1606-4-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT010; 
x-ms-traffictypediagnostic: AM5EUR03HT010:
x-microsoft-antispam-message-info: D1eB9Lp9oz3SLvTRK0Uiy4yyhGP0QuwAU85eub396NwfCbpYDlBZuVWhIpFokAe9lldeThJZkA/KkqrQpHaoXqtANY66CmSvSZpnAuRwCnAjgSgoLdYXB2jfNDrR/bh65dc2mMQgnPGdVrrHVg/7m31vvm0IjR1QXz4tUuylPnQ/hVdBMIpvpFPj1J1z6r45
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c0453a07-a331-48d7-bb60-08d72ef77eb8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:14:42.0566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT010
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2VkaWRfdG9fZWxkKCkgaXMgbmVlZGVkIHRvIHVwZGF0ZSBzdGFsZSBjb25uZWN0b3IgRUxE
IG9uIEhQRCBldmVudC4KClRoaXMgcmV2ZXJ0cyBwYXJ0IG9mIGNvbW1pdCA3OTQzNmExYzliY2Mg
KCJkcm0vZWRpZDogbWFrZSBkcm1fZWRpZF90b19lbGQoKSBzdGF0aWMiKS4KClNpZ25lZC1vZmYt
Ynk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyB8IDUgKysrLS0KIGluY2x1ZGUvZHJtL2RybV9lZGlkLmggICAgIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCmluZGV4IDgyYTRjZWVkM2ZjZi4uNDdjNDA5YWYwOTAzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAt
NDA2OSw3ICs0MDY5LDcgQEAgc3RhdGljIHZvaWQgY2xlYXJfZWxkKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpCiAJY29ubmVjdG9yLT5hdWRpb19sYXRlbmN5WzFdID0gMDsKIH0KIAot
LyoKKy8qKgogICogZHJtX2VkaWRfdG9fZWxkIC0gYnVpbGQgRUxEIGZyb20gRURJRAogICogQGNv
bm5lY3RvcjogY29ubmVjdG9yIGNvcnJlc3BvbmRpbmcgdG8gdGhlIEhETUkvRFAgc2luawogICog
QGVkaWQ6IEVESUQgdG8gcGFyc2UKQEAgLTQwNzcsNyArNDA3Nyw3IEBAIHN0YXRpYyB2b2lkIGNs
ZWFyX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogICogRmlsbCB0aGUgRUxE
IChFRElELUxpa2UgRGF0YSkgYnVmZmVyIGZvciBwYXNzaW5nIHRvIHRoZSBhdWRpbyBkcml2ZXIu
IFRoZQogICogSERDUCBhbmQgUG9ydF9JRCBFTEQgZmllbGRzIGFyZSBsZWZ0IGZvciB0aGUgZ3Jh
cGhpY3MgZHJpdmVyIHRvIGZpbGwgaW4uCiAgKi8KLXN0YXRpYyB2b2lkIGRybV9lZGlkX3RvX2Vs
ZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBzdHJ1Y3QgZWRpZCAqZWRpZCkKK3Zv
aWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVj
dCBlZGlkICplZGlkKQogewogCXVpbnQ4X3QgKmVsZCA9IGNvbm5lY3Rvci0+ZWxkOwogCXU4ICpj
ZWE7CkBAIC00MTYyLDYgKzQxNjIsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZWRpZF90b19lbGQoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCiAJRFJNX0RF
QlVHX0tNUygiRUxEIHNpemUgJWQsIFNBRCBjb3VudCAlZFxuIiwKIAkJICAgICAgZHJtX2VsZF9z
aXplKGVsZCksIHRvdGFsX3NhZF9jb3VudCk7CiB9CitFWFBPUlRfU1lNQk9MKGRybV9lZGlkX3Rv
X2VsZCk7CiAKIC8qKgogICogZHJtX2VkaWRfdG9fc2FkIC0gZXh0cmFjdHMgU0FEcyBmcm9tIEVE
SUQKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9pbmNsdWRlL2RybS9kcm1f
ZWRpZC5oCmluZGV4IGI5NzE5NDE4YzNkMi4uNDk5ODc4MThmZTIzIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fZWRpZC5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKQEAgLTMzNyw2
ICszMzcsNyBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0
YXRlOwogc3RydWN0IGRybV9kaXNwbGF5X21vZGU7CiAKK3ZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKTsKIGludCBk
cm1fZWRpZF90b19zYWQoc3RydWN0IGVkaWQgKmVkaWQsIHN0cnVjdCBjZWFfc2FkICoqc2Fkcyk7
CiBpbnQgZHJtX2VkaWRfdG9fc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBlZGlkICplZGlkLCB1
OCAqKnNhZGIpOwogaW50IGRybV9hdl9zeW5jX2RlbGF5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
