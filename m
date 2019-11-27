Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C910B188
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 15:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F372F89B27;
	Wed, 27 Nov 2019 14:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4649D89B27
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 14:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv3s4kKOCrogkF1Ke6oj3/5ilKqWnRnmjHsNPI1YSXhCEhYJTJK/K3fCsZioDrB+md37X/yy74bvfF3+q39bLDdL6Adzfr4zZBDhsunlLVkhiiIoXfcJ0k47xzlWBwDmVoiktiIsI2+049RXPuuGTYnTKoT3kw7or5TfRB3FwbVRu3XeT03Gr2hz9aLoT3/9F2li5lzMCc5sz2t50I5EUAs6Xauitl1bMS/HXLdPxu02xGQOWM1LtIFaIyR8KVutIZzu+iBtbCvtK2gbjSK/ILp9sNjSaZAulfepaGNlRb0TcjAViW1wCsgGfKBvmfjVph+pEklNuPI8XCyo6CVGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KayS4GUJwO5YomZ8rA/bBaMzf0gTphpNMclyxGs/2oI=;
 b=A7SrBEroxaH0DCsXcKcFkBu2SG9V3Ouf7nu2OetymGNTGNdDGVw6pEHiAff9ZmrbVOUh8OZZ8cagIFHswb3LtRU983kFkt1dg1xOXGWGpEh/m1YxqwwnuJbchsxTp27sMtFN5DHa4BRoWyalyUcPji0NU8ghogbS4kCVmKx59D7FOsIUhTjBYsGS7neldrEvyExyCP+VtdLX36FFJT+JDISYKihk4JbK0Hr54w9BAzo1AOX0CAVIo7dAkCPtz9eqqXm53bMp0HuxQX6U7OinWoBUmJCb1wo3aiuvexaJQVXGgUPycL15WP2fJS3BRzqIXJBzhd6AvuA7TZnkvV3WTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB4414.eurprd04.prod.outlook.com (20.177.54.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Wed, 27 Nov 2019 14:42:35 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::9056:3486:95b8:4eff]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::9056:3486:95b8:4eff%4]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 14:42:35 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Uma Shankar <uma.shankar@intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm: fix HDR static metadata type field numbering
Thread-Topic: [PATCH] drm: fix HDR static metadata type field numbering
Thread-Index: AQHVpTDonNbf5j/+IEiOiFgD+u80BQ==
Date: Wed, 27 Nov 2019 14:42:35 +0000
Message-ID: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::15) To VI1PR04MB6237.eurprd04.prod.outlook.com
 (2603:10a6:803:f1::10)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3621371c-4f2c-4726-f908-08d773480adb
x-ms-traffictypediagnostic: VI1PR04MB4414:|VI1PR04MB4414:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4414E070C18A38B2DBCD1C96FF440@VI1PR04MB4414.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(199004)(189003)(99286004)(36756003)(2501003)(8936002)(6486002)(25786009)(186003)(5660300002)(52116002)(86362001)(54906003)(110136005)(66446008)(7736002)(478600001)(14444005)(316002)(6512007)(8676002)(26005)(66066001)(81166006)(81156014)(14454004)(305945005)(4744005)(102836004)(386003)(2616005)(6506007)(6116002)(44832011)(71200400001)(64756008)(2906002)(66946007)(256004)(50226002)(66556008)(66476007)(6436002)(4326008)(3846002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4414;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jXv6CvWGLahZQa3vCJ18RC7JHpVgybB0K2KsvbIPaxr0rvB35rytR5XAVkSqtlMlwKPXRNhoYcjSnYbXXga/cr5BAmQCdeP/X7G1sb3II/nIDUbUOEpXFbprFKmXLIRqO73vanNM16RDmyBLgdjQj7nL01GOTe9ahyXnM67femG8nIp9j6nGvYtmFtOLTBka0VnP3RNWkQjGde6ZjipHw/fYCgPmt0NMaR+eswv8lhozsD03aTjEgOsweJXo5ci4MK84pBi2DWhOhjHUVfHhzN94nluwX7DjKGTY3shHKlMXOXyPy35ovDdK/akcLF6NIM8rQ+oeJULPW65bOUpZSAbSLtHLrOBaKvQ5reurvIpz2OIdy3yXvxmo4yu71YVCtiU3qVf6wU/JJGz7Nczm0MbWdEX1qzknqMT8/nqX6qwXgUKFs/UAaPqdJLeh2eYd
Content-ID: <938583A994C1FF498CFC1EC195F855A9@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3621371c-4f2c-4726-f908-08d773480adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 14:42:35.5051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nLZqaSl3dLVlq2KhaGvfnXe+/quLwceyL3giABdPDhBUTNlD+FTmhP1cdefa1CBTSqx4Dpq4XleI7w8MPk5hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4414
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KayS4GUJwO5YomZ8rA/bBaMzf0gTphpNMclyxGs/2oI=;
 b=XiKZqm3D517IUiteWT0ztHdlXiLUjFzEWuhlTedIaeN/WhIvyUDSfGN3pZWusI9ap2ymXNACpCV0k580LO9tv4I4rdGWWfMnHa1eXCc9n3G9rb8/OKBPaeZ6JkMktDwKc9aHMEDEizHy8ONTG2Gr5OiCt451uz887TaJSv6+sQQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@nxp.com; 
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
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIENUQS04NjEgc3BlY2lmaWNhdGlvbiwgSERSIHN0YXRpYyBtZXRhZGF0YSBk
YXRhIGJsb2NrIGFsbG93cyBhCnNpbmsgdG8gaW5kaWNhdGUgd2hpY2ggSERSIG1ldGFkYXRhIHR5
cGVzIGl0IHN1cHBvcnRzIGJ5IHNldHRpbmcgdGhlIFNNXzAgdG8KU01fNyBiaXRzLiBDdXJyZW50
bHksIG9ubHkgU3RhdGljIE1ldGFkYXRhIFR5cGUgMSBpcyBzdXBwb3J0ZWQgYW5kIHRoaXMgaXMK
aW5kaWNhdGVkIGJ5IHNldHRpbmcgdGhlIFNNXzAgYml0IHRvIDEuCgpIb3dldmVyLCB0aGUgY29u
bmVjdG9yLT5oZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1ldGFkYXRhX3R5cGUgaXMgYWx3
YXlzCjAsIGJlY2F1c2UgaGRyX21ldGFkYXRhX3R5cGUoKSBpbiBkcm1fZWRpZC5jIGNoZWNrcyB0
aGUgd3JvbmcgYml0LgoKVGhpcyBwYXRjaCBjb3JyZWN0cyB0aGUgSERNSV9TVEFUSUNfTUVUQURB
VEFfVFlQRTEgYml0IHBvc2l0aW9uLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudGl1IFBhbGN1IDxs
YXVyZW50aXUucGFsY3VAbnhwLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2hkbWkuaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaGRtaS5oIGIvaW5jbHVkZS9saW51eC9oZG1pLmgKaW5kZXggOTkx
OGE2Yy4uMjE2ZTI1ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9oZG1pLmgKKysrIGIvaW5j
bHVkZS9saW51eC9oZG1pLmgKQEAgLTE1NSw3ICsxNTUsNyBAQCBlbnVtIGhkbWlfY29udGVudF90
eXBlIHsKIH07CiAKIGVudW0gaGRtaV9tZXRhZGF0YV90eXBlIHsKLQlIRE1JX1NUQVRJQ19NRVRB
REFUQV9UWVBFMSA9IDEsCisJSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgPSAwLAogfTsKIAog
ZW51bSBoZG1pX2VvdGYgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
