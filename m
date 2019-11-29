Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4510DDB1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3CE6E106;
	Sat, 30 Nov 2019 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740137.outbound.protection.outlook.com [40.107.74.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ED26E069
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 07:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly9zSB4+6FfSAo0nziRyzMLZgvLawekcWLPk8l1zg+PuXb6e3E4QJD1cPPxuRm2hhROo/yJLuzfN624plRvs/s/WaimXho+mqXtyOBWh8hZVPwraXy+KBpFJ4Bwerb4ke2D9p4bz9XTN2S1RN0t+91wseogXCbE9QN1D8cbRXWlviqdCmJNsJNqNCEK6tk8ICYbWwBCh+iVH3cbHdZ4X4qrLiRETT2nM7svBdPJr/rS4J2TX/3/bYrXBZEK0LRgXd4JdePzBjxMWBlfu/Tz+jX35CQVUTf1sjVJ461y3snQZCwaTAGCWHmc16ph0Ha/qjCLrMduVlPSfY0mm/iZScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ocwY7jUImb73dHFcnoJ1qreY5kUL2+B/XaKc7mmmWk=;
 b=NacCFfDyNSjWBc1U/VZ+LPDcHVvhUIgFUsbgWkfvt+T9VOGXYVgtE1GlCEaUvcupC+PLxScObT9+quKfS9rLWfKD/HUG/d9pLdaaupJOU/a0dCECgP6AWwXxgvjYQUz9fdrPoYpPtewcFsZKuoESxt2qoUuJYadyHlB8FPqKeQ+uYBFFa+RdnPR83IYcuOUU9D4E/7vr7A15PguR5TPfHcZBJJUfZN8MGeSpEZGoGyh3tO6ZC3oghqEFEFAs9ZlJexEXoppQvEDj8ADKNMY5p2vbcwYZlK46nzv8VuCPxW8NNQ1JYHgsgpkFb57QenGcHW4MFBVTcTfIk5kq8Cr/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4797.namprd04.prod.outlook.com (52.135.122.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Fri, 29 Nov 2019 07:33:09 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::859:2d31:1f00:fa16%5]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 07:33:09 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v6 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v6 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVpoc//3WpIikmj0meCH7ldBT85A==
Date: Fri, 29 Nov 2019 07:33:09 +0000
Message-ID: <cover.1575012508.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3c182b5-fa71-40fb-8cf3-08d7749e61d8
x-ms-traffictypediagnostic: SN6PR04MB4797:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4797A47E97D587AD511E6240C7460@SN6PR04MB4797.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39840400004)(396003)(136003)(376002)(189003)(199004)(53754006)(2906002)(6486002)(5660300002)(186003)(4744005)(7736002)(25786009)(71190400001)(71200400001)(3846002)(52116002)(107886003)(305945005)(6116002)(86362001)(4326008)(6436002)(14454004)(8936002)(6512007)(478600001)(54906003)(64756008)(66476007)(81156014)(26005)(2501003)(316002)(2616005)(36756003)(66066001)(99286004)(66946007)(8676002)(256004)(386003)(102836004)(110136005)(66446008)(81166006)(66556008)(14444005)(6506007)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4797;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T9Zmx6V5NgwP1RYBV960y76qwbiYo6x2eYAa1qMyCQo4Mqj1QRmP0NOl169LgoiG7DSObWDXMJCaAZPXBkHBJxIj9EWFa3m5y2+yOpkpgNOfExVILL7kKZ6ItkybCcRTvBaZVE6TGi63nq1GTwimChG9vPQs6KOzV5wstT2I9kkvDx6Jmq1hGPajZhuZpGTWKMNFOswHlfUFW2MLP2iQZsvDRahgNeSxScU+VGIHFbIeSbSvK5cy/KGlpzPeTgPMvuU1WHQpl7mqmkXvTkDvfINGlkeXBbBRrmsJU9wuOFoGt9uCvUSvCCtdGk1EsjerLWGAF6MB7/uNyPgzfxuI9GJiAoorbeiSZVZ6D65hAXMQaPqcwAnMsRYmk4Jknkmk7A9xhSICl28uN4YuKN1zS/kOG1S5wug6oGDpeB1p9nd6N+lkScWvP1rDArUkFHg4
Content-ID: <589DDECA5ECACF4A82C81F35E22CE50C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c182b5-fa71-40fb-8cf3-08d7749e61d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 07:33:09.3789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4BvsIDBhsIV3gsjwDoW5WTdikq7dS9OIgQeQtgnc6tiOjDy8yLvdw+S8oa9szxSgciah20qQ3QAZt55i19Heg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4797
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ocwY7jUImb73dHFcnoJ1qreY5kUL2+B/XaKc7mmmWk=;
 b=pC2KgzZQyk0rxBxPl54qv2kyHWujGfQBm1N7waFvU620B3cpy5sp2Pv+vj40WQvaBzulTC4eefuHmrLUy865lCPg9/XYBty5hiUkJlq1w979+l2er5gDNWhrGpSCMRIfw7G7UgeQkcyuDj4617ycVoWlDcKVo0XJ7vyZhU/e228=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhl
IFNsaW1wb3J0IEFOWDc2MjUgdHJhbnNtaXR0ZXIsIGEKdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQg
NEsgTUlQSSB0byBEUCB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlLgoK
VGhpcyBpcyB0aGUgaW5pdGlhbCB2ZXJzaW9uLCBhbnkgbWlzdGFrZXMsIHBsZWFzZSBsZXQgbWUg
a25vdywgSSB3aWxsIGZpeCBpdCBpbgp0aGUgbmV4dCBzZXJpZXMuCgpUaGFua3MsClhpbgoKClhp
biBKaSAoMik6CiAgZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IE1JUEkgdG8gRFAg
dHJhbnNtaXR0ZXIgYmluZGluZwogIGRybS9icmlkZ2U6IGFueDc2MjU6IEFkZCBhbng3NjI1IE1J
UEkgRFNJL0RQSSB0byBEUCBicmlkZ2UgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCAgIDkxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIwNDUgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNiArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI1NTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
