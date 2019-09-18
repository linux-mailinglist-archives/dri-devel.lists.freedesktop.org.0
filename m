Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBEAB742F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D027A6F773;
	Thu, 19 Sep 2019 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320131.outbound.protection.outlook.com [40.107.132.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03F26F414
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 16:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cntvWyEfj0MRLJofAVBqo1gq9xUwrDu5KwZyVWyOuM9zUEUFM5HoV8gvmpPhHhNvTz2DL1klBIJYvXqIhu5cdA8KKahua5sQhZgCv6+diWOTF1rarDt9Gl85Ql5fe30djKkn3RsVfv0wxmdmE0mND4JeFQCwQSIdBNEh/F9Zu8UTRwdUVbjuWpcRCYlRoSbaOXUYGteB86lX8I8/tO4mI+dwKgKdCBJAlUuakTSginK9do2p8jwjgEe5VTftzHeI1QHTOPbzoOWKw3w2VVxYgIYQB3aEC78w2C7Y0hmS2Emx1xB+Jq5+oaL3h9hxnpPDvbf2o0x3zxuf+Z12nWUIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jwgJ4CcDfc9UT9bfJAAEbT/LSNkaNlAduOqIvC5cDA=;
 b=Ydc+XnA4KRwnQt1AY6c8URkMFpX7oj077GbzzzGijzSf0b1gNyQ5tkKU1Q4xirTscFtNf0a0XhUxePg9kg7U7rZLP7FV3D+gZyQVCsHlqoK5/6ns4p+/NLtC/qSz5594ZpvDZEtcRxyKaTSEo2l2ZpErg89VM5EIjNsnIjKp8On9fR6tiMPkPbI7cKjgYFW4FEIWiPsuAxIJuCjqkmofaNvzg24Ypz6XzfosMPs6lfnFbsD2k0dIPUewZL9dzreenpZQgHrnBYGYcatS4+lvC3NTSK9kjhcHkwt0Ncpd8cmdV0Z9qcvSMxHSwmJ/IZH08yXL6Tl5SmbXIZ8fwfXArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0124.APCP153.PROD.OUTLOOK.COM (10.170.188.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.3; Wed, 18 Sep 2019 16:45:18 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%8]) with mapi id 15.20.2305.000; Wed, 18 Sep 2019
 16:45:18 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Wei Hu <weh@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "shc_work@mail.ru"
 <shc_work@mail.ru>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Subject: RE: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVbebF21J2EyXx3k2x6FCXKaeI5qcxpGpA
Date: Wed, 18 Sep 2019 16:45:18 +0000
Message-ID: <PU1P153MB016905271897CA406021BF8DBF8E0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190918060227.6834-1-weh@microsoft.com>
In-Reply-To: <20190918060227.6834-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=decui@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-18T16:45:17.3143353Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f9dbc63c-ae4d-4daa-bebe-7501aa67e707;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2601:600:a280:7f70:9da0:245f:bd15:5f6a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23634abe-9efc-4ad1-a059-08d73c5796fd
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0124:|PU1P153MB0124:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB012464CF667B5EDCF96D53F0BF8E0@PU1P153MB0124.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(189003)(199004)(66556008)(2501003)(8990500004)(66946007)(2906002)(33656002)(1511001)(7416002)(14444005)(256004)(10090500001)(8936002)(9686003)(486006)(81156014)(81166006)(8676002)(74316002)(305945005)(7736002)(6246003)(2201001)(86362001)(1250700005)(6116002)(52536014)(6436002)(6636002)(76116006)(558084003)(66476007)(64756008)(66446008)(316002)(55016002)(478600001)(476003)(110136005)(25786009)(46003)(71200400001)(71190400001)(229853002)(76176011)(7696005)(99286004)(102836004)(14454004)(186003)(10290500003)(446003)(5660300002)(11346002)(6506007)(22452003)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0124;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n44Tf2OyjNSwQz5AT8cgf09U0ziZuRKg52UvLE/0+VsI0pYl/z75WdOuPmQmAkeXVSYWvoLiKS2QldktcEiMqTF3yOk3kq584P3uIPK4F9Vq8eg+sEJf3QvppuIsG4X2puRbX50tpvuUMaUBmMe6AtMfXirI6r3dFe7XeW4Gd5GOadUsyevLPxRz/glmDCRa0v4AIIE81Kqoc5lFlqdq1V4hYUoOa6CUy6vvyqdTNSJpDEz8w1sTywfZHPj1j4AVP4ZkL/4J5+HvCeyp2lShOBBrVffjhhDpKFva0HCRPxEUlX23U6f2xMbfchOlHY82ZJrHmRYEeUAEP3Puyv48AU7Q1FlLQIntdo1eQ1Q+N5duW/HJLuwQCjZvXQFMYgxWHp60ZrBlEzhRy0ocKoyR0wH9s7uq05Iu9OEASztasjU=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23634abe-9efc-4ad1-a059-08d73c5796fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 16:45:18.5172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9Pe+jT87z4sPHxQnu8OeowjgPeXfdWnqli8xJv+rpoFC0ypGJzefU2CS35G4VJn0LmA+d/TiDS3OWzSOKY8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0124
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jwgJ4CcDfc9UT9bfJAAEbT/LSNkaNlAduOqIvC5cDA=;
 b=MS7EkrWoxv6ka+ePIJyTlotvq4c8dWDs22SP8treopPf2QnIX4GA2MYKVOyfFMr6mwpbyugFhH4hnwSPWVsFAHDdNR/tf5syA8MdctTuTl7O1Mwi9d1493sBc2MOzRpO6m4LdgTL9VrQBJYEoklMasb/ZcZwaMmheXVeUitdwKc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBXZWkgSHUgPHdlaEBtaWNyb3NvZnQuY29tPgo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRl
bWJlciAxNywgMjAxOSAxMTowMyBQTQo+IFsuLi5dCj4gLS0tCj4gICAgIHY2OiBEbyBub3QgcmVx
dWVzdCBob3N0IHJlZnJlc2ggd2hlbiB0aGUgVk0gZ3Vlc3Qgc2NyZWVuIGlzCj4gICAgIGNsb3Nl
ZCBvciBtaW5pbWl6ZWQuCgpMb29rcyBnb29kIHRvIG1lLiBUaGFua3MhCgpSZXZpZXdlZC1ieTog
RGV4dWFuIEN1aSA8ZGVjdWlAbWljcm9zb2Z0LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
