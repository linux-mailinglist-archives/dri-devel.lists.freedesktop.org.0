Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2910CBC4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486576E844;
	Thu, 28 Nov 2019 15:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140044.outbound.protection.outlook.com [40.107.14.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722646E844
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:34:09 +0000 (UTC)
Received: from VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) by VI1PR0802MB2320.eurprd08.prod.outlook.com
 (2603:10a6:800:9f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Thu, 28 Nov
 2019 15:34:06 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR0802CA0019.outlook.office365.com
 (2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Thu, 28 Nov 2019 15:34:06 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 28 Nov 2019 15:34:06 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Thu, 28 Nov 2019 15:34:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e425c32ae8fdd41f
X-CR-MTA-TID: 64aa7808
Received: from cd8c12da6dc5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAB62CD5-0FE5-4257-B825-3BE26B89D31B.1; 
 Thu, 28 Nov 2019 15:34:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd8c12da6dc5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Nov 2019 15:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/6ZxN25yp3YqBcadzX0cok41UY9PAeuFtpOiquRLQSthICoYRxrY72nZqE1o8UxOicjU87TU9NzDW/ufLC0VU2CJyRdUHnRUCkiz4PEBi2kmbcOK8q/DJGGEygK+H4J1C5stbKQwcqf0bTwFkGMQkk+7wsXd6Sii1MtqAhCVwShfcj7HGnuhxwMk0httYIQ9uGFg0QSJuWm4T2i7YwRy0XFS3R3ST7FFxJEl6lnLlReCfrsiPHOjGWU/FJRxX7dj3XeDfFq9ZoGk77U2C8ZtdqpJoNLYWDvYa4u9BfMnaClBbSQ4//IYvpzA3yMci2whsL3ap1P0tlz8Q5ZkE9yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbaWo9nVqkjLcBGJycyvW1kzREZ6dBVcviZwznVjkP8=;
 b=m28q/la/hPyctNi0zcivUBTIxTSRIhBaxk9KQXcbCBpdQPCM0aVDDmjEr6IL0PltRG6XYEObtKXu05KWNVxO6C2C3aPzVR5V8qNX1iKxczV+bHcm04SnB1a5URGFXtYfYVJqWT6HV35fo6hoxFfcrgJzS03Vv0uJ8bOU1AbRKlnDQdwftVCgnK/qzIrCM/Qk03o3CNQf32VZllWwM7r6WaRHjdrTS01vez9vvbSSvTlBIln9J1lt6E3NupxMSCnSbMkwC5EBin7KU/x6gXoLMsizKa62pa7cW03eVLu3gGKCBP21idtljjGAQpyBJ7aT7Jk5gXlsiu86TRHpNfMz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3694.eurprd08.prod.outlook.com (20.178.13.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 28 Nov 2019 15:33:59 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 15:33:59 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Topic: [PATCH 29/30] drm/bridge: add support for device links to bridge
Thread-Index: AQHVpFu1iHJCIvZyo0WUUQNtpUlix6edhM4AgAMlaYA=
Date: Thu, 28 Nov 2019 15:33:59 +0000
Message-ID: <6854050.X4Y1bUp2or@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-30-mihail.atanassov@arm.com>
 <20191126143534.GW29965@phenom.ffwll.local>
In-Reply-To: <20191126143534.GW29965@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0cf2aa4-d97b-42fe-cd87-08d7741867e6
X-MS-TrafficTypeDiagnostic: VI1PR08MB3694:|VI1PR0802MB2320:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB23204872C850E7A257E5E11E8F470@VI1PR0802MB2320.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0235CBE7D0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(52314003)(189003)(199004)(446003)(71190400001)(4326008)(305945005)(71200400001)(11346002)(478600001)(102836004)(2906002)(6506007)(9686003)(6512007)(14454004)(33716001)(386003)(7736002)(86362001)(5660300002)(66066001)(64756008)(66556008)(66476007)(229853002)(66446008)(14444005)(66946007)(6916009)(81156014)(81166006)(8676002)(8936002)(6486002)(6436002)(316002)(54906003)(26005)(25786009)(186003)(6116002)(76176011)(6246003)(99286004)(52116002)(3846002)(256004)(5024004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3694;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: y5q5+p8Mkfj5/v5A9zWfNQ1UeWhl6ZFxpcr+U3/DnAkXeBE2pSVLoXEN4f4P79jaI/TC8rX38VJUXMBW4BdPhGXGOfdmavvY+VGRv/xbB1gbyZgOyETcIaoNQ8kDCWRMo9dbMGJhYrzCMlFiN7OYvvQ+LmnGWWe4J8Bkcrg9uAg86GICYxPxotE4FSimellIGZ59GsHfWydU3qiECzCz2pm4BBhcqXkIjPtpJB4qNqlAzdMfs/hLYk8D5WWjk/FlTlsDxcoUcOJfyJIRtSxOobesAy6etxPm6wBU/ksRH/wt5i5X1bBWHi5ByS5P3Ui5Irgzx5YyN2v9d2IYIk9ibGW9L/8+e1HfTc16Dp2jPN8sN1DIPBioX5IOPGKgrPcybzf1J8k4XInxXYTODcvEYmXZYi+MT1xpZvO3+dXlOPPFsKxzxKn4Mv7uU1UmkLz6
x-ms-exchange-transport-forked: True
Content-ID: <805C6FBABB19A6488E6B1FD5D40CFF5A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3694
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(396003)(39860400002)(136003)(376002)(52314003)(199004)(189003)(76176011)(4326008)(336012)(6486002)(186003)(26005)(50466002)(6246003)(76130400001)(107886003)(6862004)(6506007)(97756001)(11346002)(386003)(102836004)(86362001)(446003)(229853002)(6512007)(9686003)(46406003)(33716001)(66066001)(305945005)(7736002)(22756006)(3846002)(6116002)(2906002)(47776003)(5660300002)(25786009)(8676002)(81156014)(14454004)(81166006)(14444005)(5024004)(70206006)(54906003)(26826003)(478600001)(356004)(70586007)(99286004)(106002)(8746002)(316002)(23726003)(8936002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2320;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf1933f9-e86f-4a64-db1d-08d774186343
NoDisclaimer: True
X-Forefront-PRVS: 0235CBE7D0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cts+CT26JGE2TN9IlHpKMKU33QWPkVEy4T2Xts4GpG1fb6S0T9VRu9024vqIGpezIc06IOThzm9qsmmTJ1PtUkqhviMTurQrSzoWpXQQyfHffVUoHuKztz/ZoMyNlTt175pGJxFh7nmLGcQ4ifx8ZkczSa3Lot21QWoZHOHhg+7mBI1v9jzmtzZHpzi+c+PnLLmj+d9n8zL8JrxBK58ZE/AIZk31pFtFEmrmOFekLn/q1yy7WmUQlH9Vp8fcxcOk/xABq+UVjqyNLYXY2n87FcMoes0N7YtMGTloUxs+36PUzOjTHTJUr3wcdgrTMh0anfdTmeUI2i0rpU7Y8Co6nNyrS0W4jq1BfM/yRC/MZgUQPwas+SVwV8T+1rrhK+CEkgLqKodX34WQZeSPUAlKTzOxc2SIEAZitCMFIdmNWiRoRk27vUt61GdauJOuChXT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 15:34:06.6916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cf2aa4-d97b-42fe-cd87-08d7741867e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2320
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbaWo9nVqkjLcBGJycyvW1kzREZ6dBVcviZwznVjkP8=;
 b=XR/GqCPuC36kLs8Ja3UkrlIAAr0BApaQFy1bIo13zGRm/HYEd40ERaOXsSkDOr6Bx+zga+dbYpPVIavvGwyROQk4apXqVBVN4PvsT0ogg7MQGfN8pVApayf+4PemxnkC1gGcKvYTOxWw551nN1Q9J65gS60ZqYztsIFU/bfyYkA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbaWo9nVqkjLcBGJycyvW1kzREZ6dBVcviZwznVjkP8=;
 b=XR/GqCPuC36kLs8Ja3UkrlIAAr0BApaQFy1bIo13zGRm/HYEd40ERaOXsSkDOr6Bx+zga+dbYpPVIavvGwyROQk4apXqVBVN4PvsT0ogg7MQGfN8pVApayf+4PemxnkC1gGcKvYTOxWw551nN1Q9J65gS60ZqYztsIFU/bfyYkA=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjYgTm92ZW1iZXIgMjAxOSAxNDozNTozNCBHTVQgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwMToxNjoyNlBNICswMDAwLCBNaWhhaWwg
QXRhbmFzc292IHdyb3RlOgo+ID4gRnJvbTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KPiA+IAo+ID4gQnJpZGdlIGRldmljZXMgaGF2ZSBiZWVuIGEgcG90ZW50aWFs
IGZvciBrZXJuZWwgb29wcyBhcyB0aGVpciBsaWZldGltZQo+ID4gaXMgaW5kZXBlbmRlbnQgb2Yg
dGhlIERSTSBkZXZpY2UgdGhhdCB0aGV5IGFyZSBib3VuZCB0by4gIEhlbmNlLCBpZiBhCj4gPiBi
cmlkZ2UgZGV2aWNlIGlzIHVuYm91bmQgd2hpbGUgdGhlIHBhcmVudCBEUk0gZGV2aWNlIGlzIHVz
aW5nIHRoZW0sIHRoZQo+ID4gcGFyZW50IGhhcHBpbHkgY29udGludWVzIHRvIHVzZSB0aGUgYnJp
ZGdlIGRldmljZSwgY2FsbGluZyB0aGUgZHJpdmVyCj4gPiBhbmQgYWNjZXNzaW5nIGl0cyBvYmpl
Y3RzIHRoYXQgaGF2ZSBiZWVuIGZyZWVkLgo+ID4gCj4gPiBUaGlzIGNhbiBjYXVzZSBrZXJuZWwg
bWVtb3J5IGNvcnJ1cHRpb24gYW5kIGtlcm5lbCBvb3BzLgo+ID4gCj4gPiBUbyBjb250cm9sIHRo
aXMsIHVzZSBkZXZpY2UgbGlua3MgdG8gZW5zdXJlIHRoYXQgdGhlIHBhcmVudCBEUk0gZGV2aWNl
Cj4gPiBpcyB1bmJvdW5kIHdoZW4gdGhlIGJyaWRnZSBkZXZpY2UgaXMgdW5ib3VuZCwgYW5kIHdo
ZW4gdGhlIGJyaWRnZQo+ID4gZGV2aWNlIGlzIHJlLWJvdW5kLCBhdXRvbWF0aWNhbGx5IHJlYmlu
ZCB0aGUgcGFyZW50IERSTSBkZXZpY2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwg
S2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gPiBUZXN0ZWQtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IFtyZXdvcmtlZCB0byB1c2Ug
ZHJtX2JyaWRnZV9pbml0KCkgZm9yIHNldHRpbmcgYnJpZGdlLT5kZXZpY2VdCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gCj4g
U28gSSB0aG91Z2h0IHRoZSBiaWcgcGxhbiB3YXMgdG8gcHV0IHRoZSBkZXZpY2VfbGluayBzZXR1
cCBpbnRvCj4gZHJtX2JyaWRnZV9hdHRhY2gsIHNvIHRoYXQgaXQncyBkb25lIGZvciBldmVyeW9u
ZS4gQW5kIHdlIGNvdWxkIHRoZW4KPiBzbG93bHkgZ28gdGhyb3VnaCB0aGUgZXhpc3RpbmcgZHJp
dmVycyB0aGF0IHVzZSB0aGUgY29tcG9uZW50IGZyYW1ld29yayB0bwo+IGdldCB0aGlzIGhhbmRs
ZWQgY29ycmVjdGx5Lgo+IAo+IFNvIG15IHF1ZXN0aW9uczoKPiAtIGlzIHRoZXJlIGEgcHJvYmxl
bSBpZiB3ZSBhZGQgdGhlIGRldmljZV9saW5rIGZvciBldmVyeW9uZT8KClNvIGFmdGVyIHNwZW5k
aW5nIHRpbWUgbG9va2luZyBhdCB0aGUgY29kZSBhbmQgdGhpbmtpbmcKYWJvdXQgaXQsIEknbSBz
bG93bHkgY29taW5nIHRvIHRoZSBjb25jbHVzaW9uIHRoYXQgZ2V0dGluZyBkZXZpY2UKbGlua3Mg
cmlnaHQgZm9yIGV2ZXJ5b25lIGluIG9uZSBnbyBpcyBhIG11Y2ggYmlnZ2VyIHRhc2sgdGhhbiB0
aGlzCm9wdC1pbiBxdWljay1maXggaGVyZS4gSSd2ZSBoaXQsIGF0IHRoZSB2ZXJ5IGxlYXN0LCB0
aGUgZm9sbG93aW5nCnNuYWdzIGluIHRyeWluZyB0byBhcHBseSBpdCB1bml2ZXJzYWxseToKCnBh
bmVsX2JyaWRnZSAtIHJlbW92aW5nIG9uZSB2aWEgZHJtX29mX3BhbmVsX2JyaWRnZV9yZW1vdmUo
KSB1c2VzCm9mX2RybV9maW5kX2JyaWRnZSgpLCB3aGljaCB3b3VsZCBhZGQgYSBkZXZsaW5rIGF0
IGEgdmVyeSBpbm9wcG9ydHVuZQp0aW1lOwoKbWlwaV9kc2lfaG9zdCAtIGF0dGFjaC9kZXRhY2gs
IHdoZXJlIGUuZy4gZHctbWlwaS1kc2kuYyBoYW5kbGVzIGJyaWRnZQpjcmVhdGlvbi9kZXN0cnVj
dGlvbiwgZG9lc24ndCBjb3JyZXNwb25kIGRpcmVjdGx5IHRvIGEgc3RydWN0IGRldmljZSdzCmxp
ZmV0aW1lLCBzbyB0aGUgZGV2aWNlIGxpbmsgd291bGQgbGluZ2VyIGxvbmdlciB0aGFuIGlzIHJl
cXVpcmVkOwoKb3RoZXJzIHRoYXQgYWRkL3JlbW92ZSBicmlkZ2VzIGF0IHRpbWVzIGRpZmZlcmVu
dCBmcm9tIHByb2JlL3JlbW92ZQooZHJpdmVycyB1c2luZyB0aGUgY29tcG9uZW50IGZyYW1ld29y
az8pLgoKSSB0aGluayBpdCdkIHN0aWxsIGJlIHZhbHVhYmxlIGV2ZW4gd2l0aCBsaW1pdGluZyB0
aGUgc2NvcGUgdG8gZHJpdmVycwp0aGF0IGdldCB0aGVpciBicmlkZ2UgaW4gcHJvYmUoKSBhbmQg
ZHJvcCBpdCBpbiByZW1vdmUoKSBmb3Igbm93LCBhbmQKb25seSByb2xsIGl0IG91dCBhcyBhbiBv
cHQtaW4uIFRob3VnaHRzPwoKSSB0aGluayB0byBnZXQgaXQgcmlnaHQgd2UgbmVlZCB0byB1c2Ug
dGhlIGxpbmtzJyByZWZjb3VudCwgd2l0aCBlLmcuCm9mX2RybV9maW5kX2JyaWRnZSgpIGdpdmlu
ZyB5b3UgYSByZWZjb3VudCBvZiAxLCBhbmQgYnJpZGdlX2RldGFjaCgpCm1heWJlIGRyb3BwaW5n
IHRoZSByZWZjb3VudCwgYnV0IEkgY2FuIGVudmlzaW9uIHdheXMgd2hlcmUgdGhpcyBicmVha3MK
dG9vLCBzbyBtYXliZSBqdXN0IGFuIG9mX2RybV97Z2V0LHB1dH1fYnJpZGdlKCk/Cgo+IC0gaXMg
dGhlcmUgYW4gaXNzdWUgaWYgd2Ugb25seSBhZGQgaXQgYXQgZHJtX2JyaWRnZV9hdHRhY2ggdGlt
ZT8gSSBraW5kYQo+ICAgYXNzdW1lZCB0aGF0IGl0J3Mgbm90IG5lZWRlZCBiZWZvcmUgdGhhdCAo
RVBST0JFX0RFRkVSIHNob3VsZCBoYW5kbGUKPiAgIGxvYWQgZGVwZW5kZW5jaWVzIGFzIGJlZm9y
ZSksIGJ1dCBpdCBjb3VsZCBiZSB0aGF0IHNvbWUgZHJpdmVycyBhc2sgZm9yCj4gICBhIGJyaWRn
ZSBhbmQgdGhlbiBjaGVjayBtb3JlIHN0dWZmIGFuZCB0aGVuIGRyb3AgdGhlIGJyaWRnZSB3aXRo
b3V0Cj4gICBjYWxsaW5nIGRybV9icmlkZ2VfYXR0YWNoLiBXZSBwcm9iYWJseSBkb24ndCBoYXZl
IGEgY2FzZSBsaWtlIHRoaXMgeWV0LAo+ICAgYnV0IGJldHRlciByb2J1c3QgdGhhbiBzb3JyeS4K
PiAKPiBBbnl3YXksIEkgc2Nyb2xsZWQgdGhyb3VnaCB0aGUgYnJpZGdlIHBhdGNoZXMsIGxvb2tl
ZCBhbGwgZ29vZCwgaHVnZQo+IHRoYW5rcyBmb3IgdGFja2xpbmcgdGhpcyEgT25jZSB3ZSBoYXZl
IHNvbWUgYWdyZWVtZW50IG9uIHRoZSBiaWdnZXIKPiBxdWVzdGlvbnMgaGVyZSBJJ2xsIHRyeSB0
byBnbyB0aHJvdWdoIHRoZW0gYW5kIHJldmlldy4KPiAKPiBDaGVlcnMsIERhbmllbAo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDQ5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgfCAg
NCArKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiA+IGluZGV4IGNiZTY4MGFhNmVhYy4uZTFm
OGRiODQ2NTFhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gQEAgLTI2LDYgKzI2LDcg
QEAKPiA+ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiA+ICAKPiA+ICAjaW5jbHVkZSA8ZHJt
L2RybV9icmlkZ2UuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KPiA+ICAjaW5j
bHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+Cj4gPiAgCj4gPiAgI2luY2x1ZGUgImRybV9jcnRjX2lu
dGVybmFsLmgiCj4gPiBAQCAtMTA5LDYgKzExMCw3IEBAIHZvaWQgZHJtX2JyaWRnZV9pbml0KHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAJYnJpZGdl
LT5lbmNvZGVyID0gTlVMTDsKPiA+ICAJYnJpZGdlLT5uZXh0ID0gTlVMTDsKPiA+ICAKPiA+ICsJ
YnJpZGdlLT5kZXZpY2UgPSBkZXY7Cj4gPiAgI2lmZGVmIENPTkZJR19PRgo+ID4gIAlicmlkZ2Ut
Pm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiAgI2VuZGlmCj4gPiBAQCAtNDkyLDYgKzQ5NCwz
MiBAQCB2b2lkIGRybV9hdG9taWNfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLAo+ID4gIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19icmlkZ2VfZW5hYmxlKTsKPiA+ICAK
PiA+ICAjaWZkZWYgQ09ORklHX09GCj4gPiArc3RhdGljIHN0cnVjdCBkcm1fYnJpZGdlICpkcm1f
YnJpZGdlX2ZpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ICsJCQkJCSAgc3RydWN0IGRl
dmljZV9ub2RlICpucCwgYm9vbCBsaW5rKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSwgKmZvdW5kID0gTlVMTDsKPiA+ICsJc3RydWN0IGRldmljZV9saW5rICpkbDsKPiA+
ICsKPiA+ICsJbXV0ZXhfbG9jaygmYnJpZGdlX2xvY2spOwo+ID4gKwo+ID4gKwlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGJyaWRnZSwgJmJyaWRnZV9saXN0LCBsaXN0KQo+ID4gKwkJaWYgKGJyaWRnZS0+
b2Zfbm9kZSA9PSBucCkgewo+ID4gKwkJCWZvdW5kID0gYnJpZGdlOwo+ID4gKwkJCWJyZWFrOwo+
ID4gKwkJfQo+ID4gKwo+ID4gKwlpZiAoZm91bmQgJiYgbGluaykgewo+ID4gKwkJZGwgPSBkZXZp
Y2VfbGlua19hZGQoZGV2LT5kZXYsIGZvdW5kLT5kZXZpY2UsCj4gPiArCQkJCSAgICAgRExfRkxB
R19BVVRPUFJPQkVfQ09OU1VNRVIpOwo+ID4gKwkJaWYgKCFkbCkKPiA+ICsJCQlmb3VuZCA9IE5V
TEw7Cj4gPiArCX0KPiA+ICsKPiA+ICsJbXV0ZXhfdW5sb2NrKCZicmlkZ2VfbG9jayk7Cj4gPiAr
Cj4gPiArCXJldHVybiBmb3VuZDsKPiA+ICt9Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogb2ZfZHJt
X2ZpbmRfYnJpZGdlIC0gZmluZCB0aGUgYnJpZGdlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRldmlj
ZSBub2RlIGluCj4gPiAgICoJCQl0aGUgZ2xvYmFsIGJyaWRnZSBsaXN0Cj4gPiBAQCAtNTAzLDIx
ICs1MzEsMTYgQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2JyaWRnZV9lbmFibGUpOwo+ID4g
ICAqLwo+ID4gIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9kcm1fZmluZF9icmlkZ2Uoc3RydWN0IGRl
dmljZV9ub2RlICpucCkKPiA+ICB7Cj4gPiAtCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4g
PiAtCj4gPiAtCW11dGV4X2xvY2soJmJyaWRnZV9sb2NrKTsKPiA+IC0KPiA+IC0JbGlzdF9mb3Jf
ZWFjaF9lbnRyeShicmlkZ2UsICZicmlkZ2VfbGlzdCwgbGlzdCkgewo+ID4gLQkJaWYgKGJyaWRn
ZS0+b2Zfbm9kZSA9PSBucCkgewo+ID4gLQkJCW11dGV4X3VubG9jaygmYnJpZGdlX2xvY2spOwo+
ID4gLQkJCXJldHVybiBicmlkZ2U7Cj4gPiAtCQl9Cj4gPiAtCX0KPiA+IC0KPiA+IC0JbXV0ZXhf
dW5sb2NrKCZicmlkZ2VfbG9jayk7Cj4gPiAtCXJldHVybiBOVUxMOwo+ID4gKwlyZXR1cm4gZHJt
X2JyaWRnZV9maW5kKE5VTEwsIG5wLCBmYWxzZSk7Cj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0wo
b2ZfZHJtX2ZpbmRfYnJpZGdlKTsKPiA+ICsKPiA+ICtzdHJ1Y3QgZHJtX2JyaWRnZSAqb2ZfZHJt
X2ZpbmRfYnJpZGdlX2Rldmxpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ICsJCQkJCSAg
ICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiArewo+ID4gKwlyZXR1cm4gZHJtX2JyaWRn
ZV9maW5kKGRldiwgbnAsIHRydWUpOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKG9mX2RybV9m
aW5kX2JyaWRnZV9kZXZsaW5rKTsKPiA+ICAjZW5kaWYKPiA+ICAKPiA+ICBNT0RVTEVfQVVUSE9S
KCJBamF5IEt1bWFyIDxhamF5a3VtYXIucnNAc2Ftc3VuZy5jb20+Iik7Cj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4g
PiBpbmRleCBkNmQ5ZDUzMDE1NTEuLjY4YjI3YzY5Y2MzZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9icmlkZ2UuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4g
PiBAQCAtMzgyLDYgKzM4Miw4IEBAIHN0cnVjdCBkcm1fYnJpZGdlIHsKPiA+ICAJc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyOwo+ID4gIAkvKiogQG5leHQ6IHRoZSBuZXh0IGJyaWRnZSBpbiB0
aGUgZW5jb2RlciBjaGFpbiAqLwo+ID4gIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dDsKPiA+ICsJ
LyoqIEBkZXZpY2U6IExpbnV4IGRyaXZlciBtb2RlbCBkZXZpY2UgKi8KPiA+ICsJc3RydWN0IGRl
dmljZSAqZGV2aWNlOwo+ID4gICNpZmRlZiBDT05GSUdfT0YKPiA+ICAJLyoqIEBvZl9ub2RlOiBk
ZXZpY2Ugbm9kZSBwb2ludGVyIHRvIHRoZSBicmlkZ2UgKi8KPiA+ICAJc3RydWN0IGRldmljZV9u
b2RlICpvZl9ub2RlOwo+ID4gQEAgLTQwNyw2ICs0MDksOCBAQCB2b2lkIGRybV9icmlkZ2VfaW5p
dChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiAgCQkg
ICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgKnRpbWluZ3MsCj4gPiAgCQkgICAg
IHZvaWQgKmRyaXZlcl9wcml2YXRlKTsKPiA+ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqb2ZfZHJtX2Zp
bmRfYnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+ID4gK3N0cnVjdCBkcm1fYnJpZGdl
ICpvZl9kcm1fZmluZF9icmlkZ2VfZGV2bGluayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4g
KwkJCQkJICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4gPiAgaW50IGRybV9icmlkZ2Vf
YXR0YWNoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwKPiA+ICAJCSAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwcmV2aW91cyk7Cj4gPiAgCj4g
Cj4gCgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
