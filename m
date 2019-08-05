Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8C82C9B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4426C89F07;
	Tue,  6 Aug 2019 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070039.outbound.protection.outlook.com [40.92.70.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD430897E9;
 Mon,  5 Aug 2019 08:30:44 +0000 (UTC)
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (10.152.20.51) by DB5EUR03HT070.eop-EUR03.prod.protection.outlook.com
 (10.152.21.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Mon, 5 Aug
 2019 08:30:42 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com (10.152.20.51) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 5 Aug 2019 08:30:42 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::b8b5:365b:15a4:6e83]) by DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::b8b5:365b:15a4:6e83%6]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 08:30:42 +0000
From: David Binderman <dcb314@hotmail.com>
To: "bskeggs@redhat.com" <bskeggs@redhat.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: linux-5.3-rc3 bug report
Thread-Topic: linux-5.3-rc3 bug report
Thread-Index: AQHVS2e7xVAhk33F70W6DJgUKnoFlw==
Date: Mon, 5 Aug 2019 08:30:42 +0000
Message-ID: <DB7PR08MB38012829DA2C31A5F2DCC02F9CDA0@DB7PR08MB3801.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4DD2E0C205D8D45A273DF688EBE2002E6420917584FFA35801B87A2DB2C52D6A;
 UpperCasedChecksum:3FA9A7D9D82F9A80803345232E62EBD24844BABD0174F7202ACDA8C9B05EC0C1;
 SizeAsReceived:6954; Count:41
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vkKVLNvX0uODCSLjPtYFcixBfwzgWFkT+74oWcVHIlQTZI0XKAYVdQkOEPnXdbTQ1V0d1rlfPuw=]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR03HT070; 
x-ms-traffictypediagnostic: DB5EUR03HT070:
x-microsoft-antispam-message-info: tmrzc8aJ0PeamdYaU5iRK6kA+Jibyjq6KLiZCqahbS2qpZqUJchOSN4rFtyyNeIHs3OT8QGXSzlHh9K+1U1KIqu0SaJa6FurnAndDQNl5Zj5QIF1VDghRnvBHj8a+PspqVV7/3gSplqQlg4Ho6Iigjq/CpvmNl6sTWaZDhdJtqeVmr/Ul/VEfyQDKc/5SZCC
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee16a42-8e8f-499f-47d3-08d7197f345a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:30:42.5387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT070
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXssnLT4AXYBFInN+yta6DCe7B8o6kp4RBMKtgU1qpw=;
 b=AG02CuzQBkUVwnj2nUd86RkrfEpJYKv96atPlxmY8u3na7VxlzoTejyX3I2ODvrDQM6MO38KoWKlFq8tB7Sjses398xZWADX7UPJUlInZmjMkC6Y4/j/B9ziAHv7lXuXUhfWEfGYLoGWxGEFlOcS+ldzHCvln+mJvbVXHyWorNfjt3mlUt6Y24pBY/OR2GYb46h42b84ToLRfZQDHjIIOJhB+zfHq4Rh77zocrMww6/DL4thxSITHd4+kyiqmfJ0SQEjPG8GxYH8Qqet/Ys+vurD3mT0qti9uySrP8haCJrFKtZMHrJDRT8vJtd9HsgH1IRPX677rheaoq2iOlQrfA==
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

SGVsbG8gdGhlcmUsCgpsaW51eC01LjMtcmMzL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc3ZtLmM6NzYzXTogKHN0eWxlKSBBcnJheSBpbmRleCAnaScgaXMgdXNlZCBiZWZvcmUgbGlt
aXRzIGNoZWNrLgoKU291cmNlIGNvZGUgaXMKCiAgICAgICAgZm9yIChpID0gMDsgYnVmZmVyLT5m
YXVsdFtpXSAmJiBpIDwgYnVmZmVyLT5lbnRyaWVzOyBpKyspCgpNYXliZSBiZXR0ZXIgY29kZToK
CiAgICAgICAgZm9yIChpID0gMDsgKGkgPCBidWZmZXItPmVudHJpZXMpICYmIGJ1ZmZlci0+ZmF1
bHRbaV07IGkrKykKClJlZ2FyZHMKCkRhdmlkIEJpbmRlcm1hbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
