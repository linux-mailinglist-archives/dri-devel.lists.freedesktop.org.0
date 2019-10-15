Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457ED7C08
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB066E86D;
	Tue, 15 Oct 2019 16:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750128.outbound.protection.outlook.com [40.107.75.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD66E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKZI31/XJ9M5v+c87rUBp28EOLpoX0pu3JxPZx6k9WyUnIQfhVDyR4WO6QCTqVX8NaL36h9xygIYoHFUXWDQXSPk2gO0pK7F5hbfTdo6RTKo6r1axgCwz2d7lUwTKbBZt/zDGGManssgiATZbClB2/F8Varx6c1xecAxPaxH6O1lOXPJvPqxHj97Mh7f5fYcG90VhSAQNnUeH1/Kl2Tk0WnP/urjSY9S41j3x6KtfbBY9ttM6fsvMNro93F/t6+C2kuFeo233jzbeeKdZxgP6Cu7PzQWDXvYOI67GxJvARdmNv9eOz1/Pu1rdXLEf9Nw1CYiBjsMiJRneridKT0fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxM2xBzOznogq816Fd/DkVmgewkRZ4skTxXgmRS2uR4=;
 b=iJ2nCxHcJddvwXuijgBn/kGU1RmzGO0LDQpLDYJsD5D4CRxY4+NaRdDQRIpKpr5dOiKVe1ZjZOzmOBsso5P5vOd9tq+EN0V3pxRm16VaHDuSklP86o539IlXYlj0NI0fbswxqWyzTSsn76A8Oh+1OIaXOevmDZPR3WHKTxUlsq73maNc8l2NL/YkpS9ikrqbKV5oh1F7a7whys0Zu8VoiPmgvWgJLJ5M0qLzeUp7qYSEdlS06ZDzOYwEZwiU7986G1BpNpRAAkWUx5uN4PiwW87NC/3O8HJTVOZ+sKTsPEmpiiz+GXo3NX88NSX3RYx52P88oyNBGrnFLgdSDsq3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4254.namprd04.prod.outlook.com (52.135.71.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 07:32:42 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 07:32:42 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v3 0/2] Add initial support for slimport anx7625
Thread-Topic: [PATCH v3 0/2] Add initial support for slimport anx7625
Thread-Index: AQHVgyq7frv1r7c2/EClw9etHxQ/Sw==
Date: Tue, 15 Oct 2019 07:32:42 +0000
Message-ID: <cover.1571124579.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::14) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e40d96ec-6b7b-4518-8f9c-08d75141dd66
x-ms-traffictypediagnostic: SN6PR04MB4254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB42547F7C2DE2D71669BE9238C7930@SN6PR04MB4254.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39840400004)(346002)(136003)(376002)(366004)(199004)(189003)(53754006)(14444005)(305945005)(256004)(316002)(71200400001)(186003)(107886003)(36756003)(71190400001)(110136005)(81156014)(81166006)(54906003)(6506007)(7416002)(99286004)(86362001)(386003)(66446008)(66946007)(64756008)(14454004)(66476007)(52116002)(8676002)(8936002)(7736002)(66556008)(6116002)(6436002)(3846002)(66066001)(5660300002)(4744005)(4326008)(2501003)(2906002)(102836004)(478600001)(6486002)(26005)(486006)(6512007)(2616005)(25786009)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4254;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8F5DORq26JuHfoP5xmq1knnzq2otPap3WjRGUxMwjDUFYuakl5H6NWXRuS/rrLNuLQg3mIAKJUq3rFzplNRdDDqicKOXIudED3cdeAIq/ZTbtkUL87/5My8GoqnRrnMkcApp5/pVqlyMTavPUZdNUmgYc3pOEOBD7SvY+wpzf6if0JJicf5YOVaw1/D/jNkHj2C+vqL0Tvk8xZooLlQR+fMHBFhFO6jTum/Q1Pe8vH1H9DR4pbZH0aZjDxAJiTAenEqMK3XFapYhKepXzW0WjKivMLlklyJSFloFT4/aKh7L+AhRleXeIyRusAq4ox1YUsrMYoNFQ8wBT4HICe8tqdgSPrzmoioYlF7TUqJamG1W7je4dVL+9w3B0OHU6VX6xf+osueKnzsUAAvUBQdokbMZEt8mvQn30SniS56/r7M=
Content-ID: <D1F5EEFE5996F7449BAD78692D4F440A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d96ec-6b7b-4518-8f9c-08d75141dd66
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 07:32:42.7323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jMh7SJavo0CqVCxDkt0q9QNH1cJkRLlTWTkYuCOcjOQy7Gi3h5zyN6QFInVBY30pZlg6PX31iwo70nHafrwiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4254
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxM2xBzOznogq816Fd/DkVmgewkRZ4skTxXgmRS2uR4=;
 b=Pewc8SIHuXmI4TGIToutH4cRiw8COzsOygfxyoxNTP9qwPlrNzMYlMNFCuDE5KbYrjgQk311ZsmtfF2KYsMLyVrL5ebo3SH28knQS7ErAF6WU3n7dM/MRDXkwbtUJ9IJ/K+sxUYiw9ArQUmxoHthyYwlV0VGbOSSwxwHJMR8L5s=
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
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
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
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyAgICAgICAgICB8IDIxNTkgKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5o
ICAgICAgICAgIHwgIDQwNiArKysrCiA2IGZpbGVzIGNoYW5nZWQsIDI2NjQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5oCgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
